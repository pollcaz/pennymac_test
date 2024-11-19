class BaseClass
    def initialize(file_path)
        @file_path = file_path

        unless self.class.const_defined?(:FILE_START_LINE)
            raise "#{self.class.name} must define a constant FILE_START_LINE"
        end
    end

    def small_difference
        raise NotImplementedError, 'This method should be implemented by subclasses'
    end
end
