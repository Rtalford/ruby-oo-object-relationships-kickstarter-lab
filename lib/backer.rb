class Backer

    attr_reader :name, :backed_projects, :project
    @@all = []

    def initialize(name)
        @name = name 
        @backed_projects = []
        @project = project 
        save
    end

    def save 
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def project
        @project 
    end 

    def back_project(project)
        @backed_projects << project
        project.backers << self
    end

    def back_project(project)
        ProjectBacker.new(project, self)   
    end 

    def backed_projects
        project_backers = ProjectBacker.all.select do |back_projects|
        back_projects.backer == self
        end 
        project_backers.map do |back_projects|
        back_projects.project
        end
    end    
end 
