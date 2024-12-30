package com.spring.travelInfo.dto.request.flight;

import com.spring.travelInfo.entity.Flight;
import lombok.*;

@Getter @Setter @ToString @EqualsAndHashCode @NoArgsConstructor
public class PassengerName {

    private String passengerName;

    public PassengerName(Flight flight) {
        this.passengerName = flight.getPassengerName();
    }

}
