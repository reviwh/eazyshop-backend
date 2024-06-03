/*
  Warnings:

  - Made the column `token` on table `user` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `user` MODIFY `token` VARCHAR(191) NOT NULL,
    MODIFY `updatedAt` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6);
