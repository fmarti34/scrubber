require_relative "../scrubber"

RSpec.describe Scrubber do
  let(:subject) { described_class.new(sensitive_fields_txt, input_file).scrub }
  let(:output) { JSON.parse(File.read(output_file)) }

  let(:sensitive_fields_txt) { "spec/tests/#{test_name}/sensitive_fields.txt" }
  let(:input_file) { "spec/tests/#{test_name}/input.json" }
  let(:output_file) { "spec/tests/#{test_name}/output.json" }


  context "00_basic test" do
    let(:test_name) { "00_basic" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "01_alphanumeric test" do
    let(:test_name) { "01_alphanumeric" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "02_array test" do
    let(:test_name) { "02_array" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "03_booleans test" do
    let(:test_name) { "03_booleans" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "04_numbers test" do
    let(:test_name) { "04_numbers" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "05_floats test" do
    let(:test_name) { "05_floats" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "06_nested_object test" do
    let(:test_name) { "06_nested_object" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "07_mixed_type_arrays test" do
    let(:test_name) { "07_mixed_type_arrays" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "08_sensitive_nested_objects test" do
    let(:test_name) { "08_sensitive_nested_objects" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end

  context "09_sensitive_nested_arrays test" do
    let(:test_name) { "09_sensitive_nested_arrays" }

    it "scrubs sensitive fields in input data" do
      expect(subject).to eq(output)
    end
  end
end
