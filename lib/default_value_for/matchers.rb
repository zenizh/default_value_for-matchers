RSpec::Matchers.define :have_default_value_for do |attribute|
  match do
    @attribute    = attribute.to_s
    @values       = klass._default_attribute_values
    @disallow_nil = klass._default_attribute_values_not_allowing_nil

    match?
  end

  chain :with_value do |value|
    @expected_value = value
  end

  chain :and_allow_nil do
    @expected_disallow_nil = false
  end

  chain :and_disallow_nil do
    @expected_disallow_nil = true
  end

  private

  def klass
    subject.class
  end

  def match?
    have_value? && have_expected_value? && disallows_nil?
  end

  def have_value?
    !@values[@attribute].nil?
  end

  def have_expected_value?
    if @expected_value.nil?
      true
    else
      @values[@attribute].instance_variable_get(:@value) == @expected_value
    end
  end

  def disallows_nil?
    if @expected_disallow_nil.nil?
      true
    else
      @disallow_nil.include?(@attribute) == @expected_disallow_nil
    end
  end
end
