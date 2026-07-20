package com.example.demo.service;

import com.example.demo.entity.Country;

import java.util.List;

public interface CountryService {
    Country addCountry(Country country);
    Country findByCountryCode(String countryCode);
    List<Country> findAll();
}
