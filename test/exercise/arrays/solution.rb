module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        keys = []

        array.each_with_index do |item, index|
          max = item if item > max
          item > 0 && keys << index
        end

        keys.each { |key| array[key] = max }

        array
      end

      def search(_array, _query)
        index = -1

        unless _array
          return index
        end

        first = 0
        last = _array.length - 1

        while first <= last do
          center = first + (last - first) / 2

          if _array[center] == _query
            index = center
            break
          end

          if _array[center] > _query
            last = center - 1
          else
            first = center + 1
          end
        end

        index
      end
    end
  end
end
