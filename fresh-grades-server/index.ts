import { PrismaClient } from "@prisma/client";
import { ApolloServer, gql } from "apollo-server";

const prisma = new PrismaClient();

const typeDefs = gql`
  type Exam {
    id: ID!
    date: String!
    grade: Float!
  }
  type Module {
    id: ID!
    exams: [Exam!]!
    name: String!
  }
  type Query {
    exams: [Exam!]!
    modules: [Module!]!
  }
  type Mutation {
    createModule(name: String!): Module!
  }
`;

const resolvers = {
  Query: {
    exams: () => prisma.exam.findMany(),
    modules: () => prisma.module.findMany(),
  },
  Mutation: {
    createModule: (_parent: any, args: { name: string }) =>
      prisma.module.create({
        data: {
          name: args.name,
        },
      }),
  },
};

const server = new ApolloServer({
  typeDefs,
  resolvers,
  csrfPrevention: true,
  cache: "bounded",
});

server.listen().then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
