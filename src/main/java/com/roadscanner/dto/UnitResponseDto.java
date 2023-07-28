package com.roadscanner.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class UnitResponseDto {

    private final String name;
    private final int amount;

}
