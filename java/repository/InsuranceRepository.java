package com.project.CarRental2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.CarRental2.model.Insurance;
@Repository
public interface InsuranceRepository extends JpaRepository<Insurance, Integer> {

	long count();
}
