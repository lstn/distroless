# More "Distroless" Docker Images

From [GoogleContainerTools/distroless](https://github.com/GoogleContainerTools/distroless):
> "Distroless" images contain only your application and its runtime dependencies.
> They do not contain package managers, shells or any other programs you would expect to find in a standard Linux distribution.

### Docker
Docker multi-stage builds make using distroless images easy.
Follow these steps to get started:

* Pick the right base image for your application stack.
  * [docker.io/lestienne/distroless-ruby]

* Write a multi-stage docker file.
  Note: This requires Docker 17.05 or higher.

#### Examples with Docker
  Here's a quick example for go:

  ```dockerfile
  # Start by building the application.
  FROM ruby:2.6.1 as build

  WORKDIR /ruby/app
  COPY . .

  RUN bundle _2.0.1_ install --system --no-deployment --gemfile=/ruby/app/Gemfile && \
    bundle _2.0.1_ check

  # Now copy it into our base image.
  FROM lestienne/distroless-ruby:2.6.1
  COPY --from=build /ruby/app /
  CMD ["/app"]
  ```

For more documentation, see [GoogleContainerTools/distroless](https://github.com/GoogleContainerTools/distroless)