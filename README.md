# EchoApi

EchoApi is a Ruby gem designed to simplify the process of mocking and simulating external API calls. Ideal for both development and testing environments, EchoApi enables developers to define customizable responses to API requests, helping to ensure that applications behave as expected without the need to make real network requests. With EchoApi, you can easily simulate various API scenarios including success responses, errors, and edge cases.

## Features

- **Simple DSL**: Define mock API endpoints and responses with an intuitive Domain-Specific Language (DSL).
- **Support for All HTTP Methods**: EchoApi supports GET, POST, PUT, PATCH, DELETE, and custom HTTP methods.
- **Dynamic Responses**: Dynamically adjust mock responses based on request attributes.
- **Rate Limit Simulation**: Simulate API rate limiting to test how your application responds.
- **Latency Simulation**: Add artificial latency to responses to mimic network delays.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'echo-api'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install echo-api
```

## Getting Started

To use EchoApi, require it in your project and start defining your API mocks using the EchoApi DSL.

### Basic Usage

Here is a quick example to get you started:

```ruby
require 'EchoApi'

EchoApi.define do
  service "https://api.example.com" do

    endpoint "/users", method: :get do
      response body: { users: [{ id: 1, name: "John Doe" }] }, status: 200
    end

    endpoint "/users", method: :post do
      match condition: ->(req) { req.body[:name] } do
        response body: { id: 2, name: req.body[:name], completed: false }, status: 201
      end
      response body: { error: "Name is required" }, status: 400
    end

  end
end
```

### Running EchoApi

To run EchoApi in your test suite, include the EchoApi setup code in a setup or before block, depending on your testing framework. For example, in RSpec:

```ruby
before(:each) do
  # Your EchoApi definitions here
end
```

## Configuration Options

EchoApi offers various configuration options to tailor the mock server to your needs, including rate limit simulation, latency addition, and more. For advanced configurations, please refer to the [EchoApi Documentation](#).

## Contributing

Contributions to EchoApi are always welcome, whether it's fixing bugs, adding new features, or improving the documentation. Please see [CONTRIBUTING.md](CONTRIBUTING.md) for more details.
