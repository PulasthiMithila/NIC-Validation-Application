package com.nic.Controller;


import com.nic.Model.Person;
import com.nic.Service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;


@Controller
public class PersonController {

    @Autowired
    PersonService personService;


    String nicNumber;
    int daysInMonths[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    boolean isNewFormat = false;
    int month = 0;
    int days = 0;


    @RequestMapping(value = "/")
    public String getHomePage(Model model){
        //System.out.println("hello");
        Person person=new Person();
        model.addAttribute("person",person);
        return "index";
    }


    @RequestMapping(value = "/postPersonDetails", method = RequestMethod.POST)
    public String getDetails(@ModelAttribute("person") Person person, Model model){

        //
        String birthday;
        nicNumber=person.getNic();

       /* getNicDetails();
        System.out.println(getBirthYear());
        System.out.println(getAllDays());
        setMonth();*/
        //System.out.println(getSex());
        //System.out.println(setUpBirthday());

        //person.setBirthday(setUpBirthday());
        birthday=setUpBirthday();

        person.setBirthday(birthday);
        person.setAge(getAge(birthday));
        person.setGender(getSex());
        //System.out.println(getAge(birthday));
        //System.out.println(person);

        model.addAttribute("allPersonData", person);

        return "validateNIC";
    }


    //save person
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveDetails(@ModelAttribute("allPersonData") Person person){
        //System.out.println(person);
        personService.savePerson(person);
        System.out.println(person);
        return "redirect:/";
    }


    @RequestMapping(value = "/listPersons", method = RequestMethod.GET)
    public String getAllPersons(Model model){
        model.addAttribute("personLists", personService.getAllPerson());
        //System.out.println(personLists);
        return "listView";
    }


    @RequestMapping(value = "/showFormForUpdate/{id}")
    public String updateForm(@PathVariable(value = "id")Long id, Model model){

        Person person=personService.getPersonByID(id);
        model.addAttribute("person", person);
        return "update";
    }

    //define the format of NIC
    public void getNicDetails() {
        //System.out.println(nicNumber);
        if (nicNumber.length() == 12) {
            isNewFormat = true;
            }
        //System.out.println(isNewFormat);
    }


    //find the birth year
    public int getBirthYear() {
        if (isNewFormat) {
            return (Integer.parseInt(nicNumber.substring(0, 4)));
        }
        return (1900 + Integer.parseInt(nicNumber.substring(0, 2)));
    }


    //find all days without months
    public int getAllDays() {
        int allDays;
        if (isNewFormat) {
            allDays = Integer.parseInt(nicNumber.substring(4, 7));
        } else {
            allDays = Integer.parseInt(nicNumber.substring(2, 5));
        }
        if (allDays > 500) {
            return (allDays - 500);
        } else {
            return allDays;
        }
    }


    //set the date and month
    public void setMonth() {
        //int month = 0, days = 0;
        int allDays = getAllDays();

        for (int i = 0; i < daysInMonths.length; i++) {
            if (allDays < daysInMonths[i]) {
                month = i + 1;
                days = allDays;
                break;
            } else {
                allDays = allDays - daysInMonths[i];
            }
        }
       // System.out.println("Month : " + month + "\nDate : " + days);
    }



    //find the gender
    public String getSex() {
        String M = "Male", F = "Female";
        int d;
        if (isNewFormat) {
            d = Integer.parseInt(nicNumber.substring(4, 7));
        } else {
            d = Integer.parseInt(nicNumber.substring(2, 5));
        }
        if (d > 500) {
            return F;
        } else {
            return M;
        }
    }



    //generate birthday
    public String setUpBirthday(){
        String birthday;

        getNicDetails();
        setMonth();

        birthday= getBirthYear()+"/"+month+"/"+days;
        return birthday;
    }



    //calculate age
    public String getAge(String bDay){

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        Date d = null;
        try {
            d = sdf.parse(bDay);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Calendar c = Calendar.getInstance();
        c.setTime(d);

        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH) + 1;
        int date = c.get(Calendar.DATE);

        LocalDate l1 = LocalDate.of(year, month, date);
        LocalDate now1 = LocalDate.now();

        Period diff1 = Period.between(l1, now1);
        //System.out.println("age:" + diff1.getYears() + "years");

        String age=diff1.getYears()+" years, "+ diff1.getMonths()+" months, "+ diff1.getDays()+" days";

        return age;
    }
}
