package com.snowtech.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snowtech.entity.Document;

public interface DocumentRepository extends JpaRepository<Document, Long> {

	Document findByFileName(String filename);

}
