class FileHandling
  attr_reader :path

  FILE_PATHS = { origin: './my_origin.csv', expected: './my_expected.csv' }

  def initialize(path)
    @path = path.is_a?(Symbol) ? FILE_PATHS[path] : path
  end

  def file_data?
    File.exist?(path)
  end

  def file_data
    File.read(path)
  end

  def write_to_file(data)
    File.write(@path, data)
  end
end
