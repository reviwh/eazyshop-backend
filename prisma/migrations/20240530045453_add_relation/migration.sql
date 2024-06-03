/*
  Warnings:

  - You are about to alter the column `createdAt` on the `favorite` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - You are about to alter the column `createdAt` on the `notifications` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - You are about to alter the column `createdAt` on the `ordertrack` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - You are about to alter the column `createdAt` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - You are about to alter the column `updatedAt` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - Added the required column `userId` to the `Notifications` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `favorite` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `notifications` ADD COLUMN `userId` INTEGER NOT NULL,
    MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `ordertrack` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `user` MODIFY `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AddForeignKey
ALTER TABLE `Notifications` ADD CONSTRAINT `Notifications_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderTrack` ADD CONSTRAINT `OrderTrack_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
