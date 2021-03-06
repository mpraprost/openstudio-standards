require_relative '../helpers/minitest_helper'
require_relative '../helpers/create_doe_prototype_helper'
require_relative '../helpers/compare_models_helper'
require_relative './regression_helper'

class TestNECBSmallHotel < NECBRegressionHelper
  def setup()
    super()
    @building_type = 'SmallHotel'
  end
  def test_necb_2011_regression_natural_gas()
    result, msg = create_model_and_regression_test(@building_type,
                                                   @gas_location,
                                                   'NECB2011'
    )
    assert(result, msg)
  end
  def test_necb_2011_regression_electric()
    result, msg = create_model_and_regression_test(@building_type,
                                                   @electric_location,
                                                   'NECB2011'
    )
    assert(result, msg)
  end

  def test_necb_2015_regression_natural_gas()
    result, msg = create_model_and_regression_test(@building_type,
                                                   @gas_location,
                                                   'NECB2015'
    )
    assert(result, msg)
  end
  def test_necb_2015_regression_electric()
    result, msg = create_model_and_regression_test(@building_type,
                                                   @electric_location,
                                                   'NECB2015'
    )
    assert(result, msg)
  end
end

