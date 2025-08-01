## FEATURE:

- SwiftUI app that demonstrates context engineering patterns for AI integration
- Research Agent for gathering information and a Content Generation Agent for creating SwiftUI views
- Native iOS interface to interact with the agents
- OpenAI API for the research agent, and a custom content generation agent for SwiftUI code

## EXAMPLES:

In the `examples/` folder, there is a README for you to read to understand what the example is all about and also how to structure your own README when you create documentation for the above feature.

- `examples/SwiftUIApp/` - use this as a template to create the SwiftUI application
- `examples/Agents/` - read through all of the files here to understand best practices for creating AI agents that support different providers and LLMs, handling agent dependencies, and adding tools to the agent in Swift.

Don't copy any of these examples directly, it is for a different project entirely. But use this as inspiration and for best practices.

## DOCUMENTATION:

SwiftUI documentation: https://developer.apple.com/documentation/swiftui/
OpenAI API documentation: https://platform.openai.com/docs

## OTHER CONSIDERATIONS:

- Include a .env.example, README with instructions for setup including how to configure OpenAI API keys
- Include the project structure in the README
- Xcode project has already been set up with the necessary dependencies
- Use SwiftUI's @State and @ObservableObject for state management
- Implement proper error handling and loading states
- Follow Apple's Human Interface Guidelines for the UI design
