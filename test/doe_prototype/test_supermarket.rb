require_relative '../helpers/minitest_helper'
require_relative '../helpers/create_doe_prototype_helper'

class TestSuperMarket < CreateDOEPrototypeBuildingTest
  
  building_types = ['SuperMarket']
  templates = ['90.1-2007']
  climate_zones = ['ASHRAE 169-2006-2A']   
  #climate_zones = ['ASHRAE 169-2006-1A', 'ASHRAE 169-2006-2A','ASHRAE 169-2006-2B',
                   # 'ASHRAE 169-2006-3A', 'ASHRAE 169-2006-3B', 'ASHRAE 169-2006-3C', 'ASHRAE 169-2006-4A',
                   # 'ASHRAE 169-2006-4B', 'ASHRAE 169-2006-4C', 'ASHRAE 169-2006-5A', 'ASHRAE 169-2006-5B',
                   # 'ASHRAE 169-2006-6A', 'ASHRAE 169-2006-6B', 'ASHRAE 169-2006-7A', 'ASHRAE 169-2006-8A'] 
  
  # not used for ASHRAE/DOE archetypes, but required for call
  epw_files = []

  create_models = true
  run_models = true
  compare_results = false
  
  debug = false
  
  TestSuperMarket.create_run_model_tests(building_types, templates, climate_zones, epw_files, create_models, run_models, compare_results, debug)
  
end
