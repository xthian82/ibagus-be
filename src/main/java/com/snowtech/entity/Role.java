package com.snowtech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@EqualsAndHashCode(of = "id")
@RequiredArgsConstructor
public class Role {

    @Id
    @GeneratedValue
    private int id;

    @Column(nullable = false, unique = true)
    private final String name;

}
