class Standard
  # @!group CoilHeatingElectric

  # Prototype CoilHeatingElectric object
  # @param name [String] the name of the system, or nil in which case it will be defaulted
  # @param schedule [String] name of the availability schedule, or [<OpenStudio::Model::Schedule>] Schedule object, or nil in which case default to always on
  # @param nominal_capacity [Double] rated nominal capacity
  # @param efficiency [Double] rated heating efficiency
  def create_coil_heating_electric(model, name: "Electric Htg Coil", schedule: nil, nominal_capacity: nil, efficiency: 1.0)

    htg_coil = OpenStudio::Model::CoilHeatingElectric.new(model)

    # set coil name
    htg_coil.setName(name)

    # set coil availability schedule
    coil_availability_schedule = nil
    if schedule.nil?
      # default always on
      coil_availability_schedule = model.alwaysOnDiscreteSchedule
    elsif schedule.class == String
      coil_availability_schedule = model_add_schedule(model, schedule)

      if coil_availability_schedule.nil? && schedule == "alwaysOffDiscreteSchedule"
        coil_availability_schedule = model.alwaysOffDiscreteSchedule
      elsif coil_availability_schedule.nil?
        coil_availability_schedule = model.alwaysOnDiscreteSchedule
      end
    elsif !schedule.to_Schedule.empty?
      coil_availability_schedule = schedule
    else
      coil_availability_schedule = model.alwaysOnDiscreteSchedule
    end
    htg_coil.setAvailabilitySchedule(coil_availability_schedule)

    # set capacity
    if !nominal_capacity.nil?
      htg_coil.setNominalCapacity(nominal_capacity)
    end

    # set efficiency
    htg_coil.setEfficiency(efficiency)

    return htg_coil
  end
end