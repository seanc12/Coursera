#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number)
   @content = content
   @line_number = line_number
   calculate_word_frequency
  end

  def calculate_word_frequency()
    words = @content.split(' ')
    frequency = Hash.new(0)
    words.each { |word| frequency[word.downcase] += 1 }
    frequency = frequency.sort{|a1,a2| a2[1]<=>a1[1]}.to_h
    @highest_wf_words = []
    @highest_wf_words << frequency.keys[0]
    @highest_wf_count = frequency.values[0]
    frequency.delete(frequency.keys[0])
    frequency.each do |k, v|
      if v == @highest_wf_count
	      @highest_wf_words << k
      end
    end
  end
end

#  Implement a class called Solution.
class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
	 @analyzers = []
  end

  def analyze_file()
    f = File.open("test.txt", "r")
    f.each_line.with_index do |line, line_num|
	    @analyzers << LineAnalyzer.new(line,line_num+1)
    end
    f.close
  end

  def calculate_line_with_highest_frequency()
    max_analyzer = @analyzers.max_by do |a|
      a.highest_wf_count
    end
    @highest_count_across_lines = max_analyzer.highest_wf_count
    @highest_count_words_across_lines = []
    @analyzers.each do |a|
      if @highest_count_across_lines == a.highest_wf_count
        @highest_count_words_across_lines << a
      end
    end
  end

  def print_highest_word_frequency_across_lines
    puts "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.each do |a|
      puts "#{a.highest_wf_words} (appears in line #{a.line_number})"
    end
  end
end