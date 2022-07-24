-- CreateTable
CREATE TABLE "Exam" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "grade" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Exam_pkey" PRIMARY KEY ("id")
);
