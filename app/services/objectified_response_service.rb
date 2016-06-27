class ObjectifiedResponseService
  attr_accessor :response_hash, :object

  def initialize(response)
    @response_hash = JSON.parse(response)
    underscore_keys 
    @object        = OpenStruct.new(@response_hash)
  end

  private
  def underscore_keys
    @response_hash.transform_keys! {|k| k.underscore }
  end
end