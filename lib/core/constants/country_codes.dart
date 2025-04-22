import 'dart:convert';

import 'package:flutter/material.dart';

class CountryCodes {
  CountryCodes() {
    init();
  }

  final List<Country> countries = [];

  void init() {
    for (int i = 0; i < _countryCodes.length; i++) {
      final code = _countryCodes[i]['code'];
      final country = _countryCodes[i]['country'];
      final flag = _countryCodes[i]['flag'];
      final example = _countryCodes[i]['example'];

      final cleanEncodedBase64 = flag!.split(',')[1];
      final decodedBase64 = base64.decode(cleanEncodedBase64);
      final image = Image.memory(decodedBase64);

      countries.add(Country(code!, image, country!, example!));
    }
  }
}

class Country {
  Country(
    this.code,
    this.flag,
    this.country,
    this.example,
  );

  final String code;
  final Image flag;
  final String country;
  final String example;
}

const _countryCodes = [
  {
    "code": "+995",
    "country": "Georgia",
    "example": "123 456 789",
    "flag":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAALqSURBVHja7JdLaxRZFMd/t6o66U7op48ZR0FQTIIQEVcjRD+AS5cufDGoG2FWs3GjIsJ8BwWZ1eDOL6KoKE7EmKCS6U6my650dboe9x4X3Zm06ep0qocxG/9wufW453/+93DuqVNKRNhNWOwyvgtQgA2Md+dvCQ0EDlAQkXpa67/PX0C3moBgF8r8+PiP9LtXquIAxVHkZ8/OIWEACFZuYtQoFK1u+PvjU3ep37mPrrvJ8avViKtV4moVXVtlIMftwRzAeGISyvo6xBG6tgJx1LnfuqYdIu020g6QIBjMsTKYA8BJeug9eETw4jVowz+37jF+4jjFmzf6HEjQITV2pp/j4SOC59tzDBSQv3qRSW+N1V9/Y+/vd7H37+9bY1otpN0CBLH6BeSvDOcYWAesyUmwLLJn5iA3gZroTzLxWxjfx/g+4rdG4tioA9Mi8iZt+i6fO4/2mwDYpQoHnvw5yjGccUauIl4TafuAYNTINJ0cWJo6icple7JZAdJz/VXwu7P9771p1liaObUDdwIo1PgYRPGmAIkjWIuRKEpZxZOE7QBhCI7dcwoijW76kErAf0Amg10sbAqIYw+JfdDxjndvkeuJgmBY33kUlIOEsingyKePWFa6L/NC6RBm3e9kQ77I0dWVVPbGGLDtTh0wxqQ/QrYNRoOJUZlMavsNnwMFRItLvD94jGhxKTmftUbEdIbWiWu249hWgGk0kDBELy8jYYhpNBIUCJjuSGhsh3HoruhEAdXL1/gw+zPg8GH2NNVL15MF9I4tGMbR63Pa8zzpRVyvS/DXvLxlQtpPn4n+/Fm24l3+gMyTk3mysrDncN/7YRye5wkwnRgBu1xGjY1RuP4LVrmMVUzfNA3j2PCpgGnXdd+USqVUDhZ/mkI3G4DgVPZxePFVKnvXdalUKjMOoI0xuK6bjmDNQze9joBMlkJK++4fmVbAD8AssO8bt+UrwEvVbUrzg5rT/xEBsKa+/5zutoAvAwAdlORVB9j5ZwAAAABJRU5ErkJggg=="
  },
  {
    "code": "+7",
    "country": "Russia",
    "example": "123 456 7890",
    "flag":
        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAFtSURBVHja7JfBTsMwDIY/Zx0TMJgEQkg8ADeuPBhHXowbJ96Ax0ACwQZlTWxzWEe7MSYmjfQyX6K4rvLVTpy/4u50aYGObQcgQA8Y1GNOU2BaAMfu/tzJ14ucBGDUYQVGoU5/VzbYnYIdQAFwfXPHxek+H9OUZdGDQcHre9UARDPGZaSsdDHS61Y1H1f5aT1bF9fyqzlVsgYgJWNSRj5rABFhfkuKyCLTkt/df8T8ZvNYVVsEiOqMy0Ssnf9tVQr0grQyoMakTETNA9DvBUaH/TaAom5YJnGibkTVVgmi4wZmeQBchBjbm9ASTiDT+jgsZuDh/pY+jk+rzdWEL81XHdPl1wZ7RAlczgFME/QK2HQP+Jq5rydXTU0GTG2mhzIqZKtPXJh1JoM/NpMtSSHMWgC2QTfbkhT7BihmLXKWgTAc5iuBNwBqwMv4Les1XO82FeAcuALOMkuBJ+BRalF61IE4nQJj2f2cdg3wNQCQl7beZ527hwAAAABJRU5ErkJggg=="
  },
];
