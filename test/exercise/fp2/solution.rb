module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        pos = 0
        length = self.length

        while pos < length do
          yield(self[pos])
          pos += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map
        result = self.class.new([])

        self.my_each { |item| result << yield(item) }

        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = self.class.new([])

        self.my_each { |item| result << item unless item.nil? }

        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        result = args[0] || self[0]
        skip = args.length ? true : false

        self.my_each do |item|
          if skip
            skip = false
          else
            result = yield(result, item)
          end
        end

        result
      end
    end
  end
end
