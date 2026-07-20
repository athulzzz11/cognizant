package com.example.demo.repository;

import com.example.demo.entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CountryRepository extends JpaRepository<Country, Long> {

    Country findByCountryCode(String countryCode);

    List<Country> findByPopulationGreaterThan(Long population);

    @Query("SELECT c FROM Country c WHERE c.population > :minPopulation")
    List<Country> findLargeCountriesHql(@Param("minPopulation") Long minPopulation);

    @Query(value = "SELECT * FROM country WHERE country_code = :code", nativeQuery = true)
    Country findByCodeNative(@Param("code") String code);
}
