
class Image 
  attr_accessor :rows

  def initialize (rows)
    @rows = rows
    
  end

  def output_image
    @rows.each do |row|
      puts row.join  
    end 
  end


  def blur(distance = 1)
    distance.times do
      blur_coord
    end
  end


  def blur_coord
    
    coordinates = []
    rows.each_with_index do |array, row|
      array.each_with_index do |number, column|
        if number == 1
          coordinates << [row, column]
        end
      end
    end 

    coordinates.each do |coordinate|
    
      one_above = coordinate[0] - 1
      one_below = coordinate[0] + 1
      one_left = coordinate[1] - 1
      one_right = coordinate[1] + 1


      rows[one_above][coordinate[1]] = 1 if one_above >= 0
      rows[one_below][coordinate[1]] = 1 if coordinate[0] + 1 <= rows.length - 1
      rows[coordinate[0]][one_left] = 1 if one_left >= 0
      rows[coordinate[0]][one_right] = 1 if one_right <= rows[coordinate[0]].length - 1
      
    end
  end
end


image = Image.new([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]])
image.blur(3)
image.output_image