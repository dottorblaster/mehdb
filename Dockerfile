FROM registry.opensuse.org/opensuse/bci/golang:1.23 AS build

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . ./

RUN make

FROM scratch
COPY --from=build /app/mehdb /mehdb

EXPOSE 9876
CMD ["/mehdb"]
