class Index
    def initialize
        @files_to_entries = [ 'abc', 'def' ]
    end

    def flop(y)
        @files_to_entries[1]
    end

    def bar
        flop(14) + 'x'
    end
end
