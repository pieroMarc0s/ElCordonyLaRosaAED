package org.example.model;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "Reservación")
public class Reserva {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reservacionId;

    private Long idCliente;

    private Long mesaId;

    private LocalDateTime fechaReserva;

    private Integer numeroPersonas;
}