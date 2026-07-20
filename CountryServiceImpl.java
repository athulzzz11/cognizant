package com.example.demo.service;

import com.example.demo.entity.Country;
import com.example.demo.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    CountryRepository countryRepository;

    public Country addCountry(Country country) {
        return countryRepository.save(country);
    }

    public Country findByCountryCode(String countryCode) {
        return countryRepository.findByCountryCode(countryCode);
    }

    public List<Country> findAll() {
        return countryRepository.findAll();
    }
}
