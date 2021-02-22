class Parser
    attr_accessor :file_name

    def initialize(file_name)
        @file_name = file_name
    end

    def open_file
        File.read(file_name)
    end

    def count_page_views
        logs = open_file.gsub(/[^a-z_]+/,'/').split('/')
        logs.delete("")
        logs.inject(Hash.new(0)) { |name, number| name[number] += 1 ; name }
    end

    def unique_page_views 
        logs = open_file.gsub(/\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/,'').split("\n")
        logs = logs.collect(&:strip)
        logs.inject(Hash.new(0)) { |name, number| name[number] += 1 ; name }
    end
end