module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        filtered = _array.map { |film| film['rating_kinopoisk'].to_f if film['rating_kinopoisk'].to_f > 0 && film['country'].to_s.split(',').length >= 2 }.compact
        filtered.reduce(:+) / filtered.length
      end

      def chars_count(_films, _threshold)
        _films.map { |film| film['name'].scan('и').length if film['rating_kinopoisk'].to_f > _threshold }.compact.reduce(:+)
      end
    end
  end
end
