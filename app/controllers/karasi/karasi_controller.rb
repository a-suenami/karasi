class Karasi::KarasiController < ActionController::Base
  def show
    render '/' + path, layout: layout, locals: locals
  end

  private

  def path; params[:path]; end

  def root_template_params
    YAML.load_file('config/karasi.yml').symbolize_keys
  end

  def template_params
    YAML.load_file('config/karasi.yml')[path].symbolize_keys
  end

  def locals
    template_params.map do |key,value|
      { key => deep_structize(value) }
    end.inject(:merge)
  end

  def deep_structize(params)
    if params.is_a? Array
      params.map(&method(:deep_structize))
    elsif params.is_a? Hash
      params.symbolize_keys!
      children = params.symbolize_keys.map do |key,value|
        { key => deep_structize(value) }
      end.inject(:merge)
      OpenStruct.new(children)
    else
      params
    end
  end

  def layout
    template_params[:layout] || root_template_params[:layout]
  end
end
