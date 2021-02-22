require './parser.rb'

RSpec.describe "log file data" do
    file = Parser.new('webserver.log')

        context "give file name" do
            it "returns file name" do
                expect(file.file_name).to eq('webserver.log')
            end

            it "get number of help page visitors" do
                data = file.count_page_views
                expect(data['help_page']).to eq(80)
            end

            it "get number of contact visitors" do
                data = file.count_page_views
                expect(data['contact']).to eq(89)
            end

            it "get number of home visitors" do
                data = file.count_page_views
                expect(data['home']).to eq(78)
            end

            it "get number of about visitors" do
                data = file.count_page_views
                expect(data['about']).to eq(171)
            end


            it "get number of index visitors" do
                data = file.count_page_views
                expect(data['index']).to eq(82)
            end

            it "get number of unique help page 1 visitors" do
                data = file.unique_page_views
                expect(data['/help_page/1']).to eq(78)
            end

            it "get number of unique help page 2 visitors" do
                data = file.unique_page_views
                expect(data['/help_page/2']).to eq(2)
            end

            it "get number of unique about visitors" do
                data = file.unique_page_views
                expect(data['/about/2']).to eq(90)
            end
        end
end
