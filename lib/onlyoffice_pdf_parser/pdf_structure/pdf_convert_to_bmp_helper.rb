# Helper methods to convert pdf to bmp
module PdfConvertToBmpHelper
  # Fill @pages_bmp with data
  def fetch_bmp_binary
    temp_path = generate_temp_name
    `convert "#{@file_path}" #{temp_path}`
    files = multipage_files(temp_path)
    files.each do |file|
      @pages_in_bmp << File.binread(file)
    end
  end

  private

  # @return [String] name for temp file
  def generate_temp_name
    file = Tempfile.new(%w[onlyoffice_bmp_parser .bmp])
    path = file.path
    file.unlink
    path
  end

  # @param path_pattern [String] pattern to find bmps
  # @return [Array<String>] list of bmps
  def multipage_files(path_pattern)
    files_dir = File.dirname(path_pattern)
    files_base = File.basename(path_pattern, '.*')
    Dir["#{files_dir}/#{files_base}*"]
  end
end
