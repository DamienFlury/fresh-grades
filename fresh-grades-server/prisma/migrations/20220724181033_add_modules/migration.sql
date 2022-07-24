/*
  Warnings:

  - The primary key for the `Exam` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "Exam" DROP CONSTRAINT "Exam_pkey",
ADD COLUMN     "moduleId" TEXT,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Exam_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Exam_id_seq";

-- CreateTable
CREATE TABLE "Module" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Module_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Exam" ADD CONSTRAINT "Exam_moduleId_fkey" FOREIGN KEY ("moduleId") REFERENCES "Module"("id") ON DELETE SET NULL ON UPDATE CASCADE;
