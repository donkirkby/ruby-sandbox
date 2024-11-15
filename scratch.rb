def do_stuff
    x = 1
    x * 3
end

class Foo
    def initialize(x)
        @x = x
    end

    def deflange
        @x * 10
    end
end

def main
    y = do_stuff()
    puts "Y is #{y}"
    $stderr.puts("Hello!")

    foo = Foo.new(12)
    puts "Deflange is #{foo.deflange}"
end

main()
