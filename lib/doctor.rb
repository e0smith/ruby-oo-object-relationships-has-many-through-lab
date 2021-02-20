require 'pry'
class Doctor
    attr_accessor :name, :appointments, :patient

    @@all = []

    def initialize(name)
      @name = name
      @appointments = []
      @@all << self
    end
  
    def self.all
        @@all
    end

    def new_appointment(patient, date)
       appointment = Appointment.new(patient, date, self)
       @appointments << appointment
       appointment
    end
  
    def patients
        appointments.map { |appt| appt.patient}
    end

    def appointments
        Appointment.all.select {|app| app.doctor == self}
    end

  end