class Goog
  attr_accessor :connection

  def initialize()
    self.connection = Gmail.connect(ENV["USERNAME"],ENV["PASSWORD"])
  end

  def send_email(params)
    self.connection.deliver do
      to params[:recipient]
      subject params[:subject]
      bod = params[:body] + "<br><br>"
      bod += "<a href='#{params[:url]}'>#{params[:subject]}</a>" if params[:url]
      html_part do
        content_type 'text/html; charset=UTF-8'
        body bod
      end
    end
  end
end
