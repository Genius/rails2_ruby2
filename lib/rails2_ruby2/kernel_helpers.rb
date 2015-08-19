def when_library_loaded(lib_string, options = {})
  version_file = options.fetch(:version_file, nil)
  lib_const_string = options.fetch(:lib_const_string, lib_string)

  begin
    Object.const_get(lib_string)
  rescue NameError
    return
  end

  if version_file
    begin
      require(version_file)
    rescue MissingSourceFile
      return
    end
  end

  if Object.const_get(lib_const_string).const_get('VERSION').const_get('MAJOR') == 2 && RUBY_VERSION >= '2.0.0'
    yield
  end
end
