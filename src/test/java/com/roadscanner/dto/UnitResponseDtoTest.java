package com.roadscanner.dto;

import org.junit.Test;
import static org.assertj.core.api.Assertions.assertThat;

public class UnitResponseDtoTest {

    @Test
    public void 롬복_기능_테스트() {
        //given
        String name = "test";
        int amount = 1000;

        //when
        UnitResponseDto dto = new UnitResponseDto(name, amount);

        //then
        assertThat(dto.getName()).isEqualTo(name);
        assertThat(dto.getAmount()).isEqualTo(amount);
    }

}
