package com.nic.Service;

import com.nic.Model.Person;
import com.nic.Repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonService {

    @Autowired
    PersonRepository personRepository;


    public void savePerson(Person person){
        this.personRepository.save(person);
    }

    public List<Person> getAllPerson(){
        return personRepository.findAll();
    }


    public Person getPersonByID(Long id){
        Optional<Person> optional=personRepository.findById(id);

        Person person=null;

        if(optional.isPresent()){
            person=optional.get();
        }else {
            throw new RuntimeException("Person is not found for id :: "+id);
        }

        return person;
    }


}
