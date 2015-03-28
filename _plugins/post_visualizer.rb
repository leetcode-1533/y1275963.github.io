
module Jekyll

  class Visualizer < Generator
    
    def initialize(config = {})
      @debug = true
      @year = 2010
      @month = 1
      @file_buffer = ""
      @tag_buffer = ""
      @date_buffer = ""
      super(config)
    end

    # Index all pages except pages matching any value in config['indextank_excludes']
    # The main content from each page is extracted and indexed at indextank.com
    # The doc_id of each indextank document will be the absolute url to the resource without domain name 
    def generate(site)

      file = File.new('test.html','w') 

       in_range = []
       # 1. generate header column
       # init_dates(site)
       # set initial date for post visualizer to start
      month_str = @month.to_s.length > 1 ? @month.to_s : '0'+@month.to_s
      next_date = Time.parse(@year.to_s+"-"+month_str+"-"+"01")
       if @debug
         puts next_date.to_s
       end
       items = site.posts
       # need info for each post in column to gen all info for each row 
       in_range = []
       # iterate over posts once.
       items.each do |item|
            # check if belongs to same time group
            if item.date < next_date 
              # add to group if treu
              in_range << item 
              if @debug
                  puts item.name
              end
            else 
               # if new group, flush the previousl list
               # check to make sure it doesn't try to iterate over empty lists
               if in_range.length > 0
                  
                  # post_names = []
                  # for item in in_range
                  #   post_names << "<a href=\"#{item.absolute_url}\">#{item.data['title']}</a>"
                  # end
                  # post_str = list_to_li_list(post_names)
                  # @file_buffer << wrap_str_in_td_tags(post_str)  
                  # in_range_tags = return_tags(in_range)
                  # tags_str = list_to_li_list(in_range_tags)             
                  # @tag_buffer << wrap_str_in_td_tags(tags_str)
                  process_posts(in_range)
                  in_range = []   
                  in_range << item # add the harbinger element

               else 
                  @file_buffer << wrap_str_in_td_tags("")
                  @tag_buffer << wrap_str_in_td_tags("")

               end
               @date_buffer << wrap_str_in_td_tags(next_date.to_s)
               next_date = next_date_str()
               
            end
         end
         process_posts(in_range)
         @date_buffer << wrap_str_in_td_tags(next_date.to_s)

       file.write("<table border=\"1\">")
       file.write("<tr>")
       file.write(@date_buffer)
       file.write("</tr>\n")
       file.flush()
       file.write("<tr>")
       file.write(@file_buffer)
       file.write("</tr>\n")
       file.flush()
       file.write("<tr>")
       file.write(@tag_buffer)
       file.write("</tr>\n")
       file.write("</table>")
       file.flush()
       file.close()
    end         
    
     # weeks of month
     def init_dates(site)
         i = 1
         while i < 13
         # for a in 1...
            j = 1
            while j < 6
               puts i.to_s+' w'+j.to_s
               j = j+1
            end
            i = i+1
         end
         datemonthcol = Time.parse("2012-01-01")
     end
  
    def process_posts(in_range)
      post_names = []
      for item in in_range
        post_names << "<a href=\"#{item.absolute_url}\">#{item.data['title']}</a>"
      end
      post_str = list_to_li_list(post_names)
      @file_buffer << wrap_str_in_td_tags(post_str)  
      in_range_tags = return_tags(in_range)
      tags_str = list_to_li_list(in_range_tags)             
      @tag_buffer << wrap_str_in_td_tags(tags_str)
    end

    def return_tags(in_range)
      in_range_tags = []
      for post in in_range
         for tag in post.tags
            if !in_range_tags.include?(tag)
               in_range_tags.push(tag)
            end 
         end
      end
      if @debug
         puts in_range_tags
      end
      return in_range_tags
    end 

    def next_date_str()
      if @month > 11
         @month = 1
         @year = @year+1
      else 
         @month = @month + 1
      end
      month_str = @month.to_s.length > 1 ? @month.to_s : '0'+@month.to_s
      next_date = Time.parse(@year.to_s+"-"+month_str+"-"+"01")
      if @debug
         puts next_date
      end
      return next_date
    end

    def list_to_li_list(list)
      puts "list to li list"
      out_str = "<ul>\n"
      for item in list
         out_str << "<li>"
         out_str << item.to_s
         out_str << "</li>\n"
      end
      out_str << "</ul>\n"
      return out_str
    end

    def wrap_str_in_td_tags(ele)
      puts "adding td tags"
      out = "<td>\n" << ele << "</td>\n"
      return out 

    end

  end
end

module Jekyll

  class Page
    # @origin https://github.com/kinnetica/jekyll-plugins/blob/master/sitemap_generator.rb
    attr_accessor :name

    def full_path_to_source
      File.join(@base, @dir, @name)
    end

    def absolute_url
      "#{@dir}#{url}"
    end
  end

end

module Jekyll

  class Post
    # @origin https://github.com/kinnetica/jekyll-plugins/blob/master/sitemap_generator.rb
    attr_accessor :name

    def full_path_to_source
      File.join(@base, @name)
    end

    def absolute_url
      "#{url}"
    end
  end
  
end

