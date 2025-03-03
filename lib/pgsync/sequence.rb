# minimal class to keep schema and sequence name separate
module PgSync
  class Sequence
    attr_reader :schema, :name, :column

    def initialize(schema, name, column:)
      @schema = schema
      @name = name
      @column = column
    end

    def full_name
      "#{schema}.#{name}"
    end

    # other.schema == schema && other.name == name
    def eql?(other)
      other.name == name
    end

    # override hash when overriding eql?
    # [schema, name].hash
    def hash
      [name].hash
    end

    def to_s
      full_name
    end
  end
end
