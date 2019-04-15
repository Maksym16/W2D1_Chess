class Employee

    attr_reader :salary
    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary = name, title, salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = self.salary * multiplier
    end

    def salary_sum
        sum = 0
        return self.salary if @staff == nil
        @staff.each do |employee|
            sum += employee.salary_sum
        end
        return sum
    end
end

class Manager < Employee

    def initialize(name, title, salary, staff, boss = nil)
        super(name, title, salary, boss)
        @staff = staff
    end

    def bonus(multiplier)
        return self.salary_sum * multiplier        
    end

end