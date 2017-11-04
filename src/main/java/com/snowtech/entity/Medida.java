package com.snowtech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Medida {

    @GeneratedValue
    @Id
    private Integer id;

    @Column(nullable = false, unique = true)
    private String descripcion;

}
