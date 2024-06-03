-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NULL,
    `isVerified` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserProfile` (
    `email` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(13) NOT NULL,
    `image` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Address` (
    `userId` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `address` TEXT NOT NULL,

    UNIQUE INDEX `Address_userId_name_key`(`userId`, `name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Notifications` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` ENUM('COMMON', 'PURCHASED', 'SALE', 'PACKAGE') NOT NULL DEFAULT 'COMMON',
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `createdAt` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `stock` INTEGER NOT NULL DEFAULT 0,
    `color` VARCHAR(191) NOT NULL,
    `description` TEXT NOT NULL,
    `category` VARCHAR(191) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Favorite` (
    `productId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,
    `createdAt` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `Favorite_productId_userId_key`(`productId`, `userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ProductReview` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,
    `rating` INTEGER NOT NULL,
    `comment` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productId` INTEGER NOT NULL,
    `color` CHAR(6) NOT NULL,
    `qty` INTEGER NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `address` TEXT NOT NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderTrack` (
    `orderId` INTEGER NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `type` ENUM('SHOP', 'DELIVERY', 'HOUSER') NOT NULL,
    `createdAt` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`orderId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cart` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productId` INTEGER NOT NULL,
    `color` CHAR(6) NOT NULL,
    `qty` INTEGER NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Cart_userId_productId_key`(`userId`, `productId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UserProfile` ADD CONSTRAINT `UserProfile_email_fkey` FOREIGN KEY (`email`) REFERENCES `User`(`email`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Address` ADD CONSTRAINT `Address_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_category_fkey` FOREIGN KEY (`category`) REFERENCES `Category`(`name`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Favorite` ADD CONSTRAINT `Favorite_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Favorite` ADD CONSTRAINT `Favorite_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductReview` ADD CONSTRAINT `ProductReview_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductReview` ADD CONSTRAINT `ProductReview_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cart` ADD CONSTRAINT `Cart_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cart` ADD CONSTRAINT `Cart_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
