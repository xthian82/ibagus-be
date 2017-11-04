package com.snowtech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Subrubro {

    @GeneratedValue
    @Id
    private Integer id;

    @Column(nullable = false, unique = true)
    private String descripcion;

    @Column
    private String nota;

    @ManyToOne
    private Rubro rubro = new Rubro();
}