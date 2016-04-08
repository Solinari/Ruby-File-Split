
def getFileNameFromArgv
  ARGV.each do |arg|
    if arg.include? ".rb"
      return arg
    end
  end
end

def writeWithLines(file, lines)
  File.open(file, 'w') { |f| f.write(lines)}
end

def readFileLines(file)

  currFile = ""
  currLines = ""

  File.foreach(file).with_index do |line|

    if line.include? ".rb"

      if currFile.include? ".rb"
        writeWithLines(currFile, currLines)
        currLines = ""
      end

      fileLine = line.split
      currFile = fileLine[1]
    end

    currLines << line
  end
end

readFileLines(getFileNameFromArgv)