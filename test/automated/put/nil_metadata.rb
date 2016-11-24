require_relative '../automated_init'

context "Put" do
  context "Metadata is nil" do
    stream_name = Controls::StreamName.example
    write_event = Controls::EventData::Write.example

    write_event.metadata = nil

    position = Put.(write_event, stream_name)

    read_event = Get.(stream_name, position: position).first

    context "Read metadata" do
      test "Is nil" do
        assert(read_event.metadata.nil?)
      end
    end
  end
end