class Project

    attr_reader :title, :backers
    @@all = []
    
    def initialize(title)
        @title = title
        @backers = []
        save
    end

    def save 
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def add_backer(backer)
        @backers << backer
        backer.backed_projects << self
    end 

    def add_backer(backer)
        ProjectBacker.new(self, backer)   
    end 

    def backers 
        project_backers = ProjectBacker.all.select do |back_projects|
        back_projects.project == self
        end 
        project_backers.map do |back_projects|
        back_projects.backer
        end
    end     
end 


