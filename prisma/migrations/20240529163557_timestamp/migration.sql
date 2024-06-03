/*
  Warnings:

  - You are about to alter the column `createdAt` on the `favorite` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(6)` to `Timestamp`.
  - You are about to alter the column `createdAt` on the `notifications` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(6)` to `Timestamp`.
  - You are about to alter the column `createdAt` on the `ordertrack` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(6)` to `Timestamp`.
  - You are about to alter the column `createdAt` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - You are about to alter the column `updatedAt` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(6)` to `Timestamp`.

*/
-- AlterTable
ALTER TABLE `favorite` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `notifications` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `ordertrack` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `user` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);
