-- CreateTable
CREATE TABLE `Customer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `image` VARCHAR(191) NOT NULL,
    `customerCode` VARCHAR(191) NOT NULL,
    `measureDateTime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `measureType` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Measure` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerCode` VARCHAR(191) NOT NULL,
    `measureUUID` INTEGER NOT NULL,
    `measureDateTime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `measureType` VARCHAR(191) NOT NULL,
    `hasConfirmed` BOOLEAN NOT NULL,
    `imageURL` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Measure` ADD CONSTRAINT `Measure_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
