/*
  Warnings:

  - You are about to alter the column `createdAt` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(6)` to `Timestamp`.

*/
-- AlterTable
ALTER TABLE `user` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);
