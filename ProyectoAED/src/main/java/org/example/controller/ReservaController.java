package org.example.controller;

import org.example.model.Reserva;
import org.example.service.ReservaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/reservas")
public class ReservaController {

    @Autowired
    private ReservaService reservaService;

    @GetMapping
    public ResponseEntity<List<Reserva>> obtenerTodasReservas() {
        List<Reserva> reservas = reservaService.obtenerTodasReservas();
        return new ResponseEntity<>(reservas, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Reserva> obtenerReservaPorId(@PathVariable Long id) {
        Optional<Reserva> reservaOptional = reservaService.obtenerReservaPorId(id);
        return reservaOptional.map(reserva -> new ResponseEntity<>(reserva, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public ResponseEntity<Reserva> guardarReserva(@RequestBody Reserva reserva) {
        Reserva nuevaReserva = reservaService.guardarReserva(reserva);
        return new ResponseEntity<>(nuevaReserva, HttpStatus.CREATED);
    }

    @PutMapping
    public ResponseEntity<Reserva> actualizarReserva(@RequestBody Reserva reserva) {
        Reserva reservaActualizada = reservaService.actualizarReserva(reserva);
        return new ResponseEntity<>(reservaActualizada, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarReserva(@PathVariable Long id) {
        reservaService.eliminarReserva(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}