/*
  Warnings:

  - You are about to drop the column `replyTo` on the `komentar` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `artikel` ADD COLUMN `tanggal` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `komentar` DROP COLUMN `replyTo`;

-- CreateTable
CREATE TABLE `subkomentar` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `isi` VARCHAR(191) NOT NULL,
    `like` INTEGER NOT NULL DEFAULT 0,
    `dislike` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `id_komentar` VARCHAR(191) NULL,
    `replyTo` VARCHAR(191) NOT NULL,

    INDEX `subkomentar_id_komentar_fkey`(`id_komentar`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `subkomentar` ADD CONSTRAINT `subkomentar_id_komentar_fkey` FOREIGN KEY (`id_komentar`) REFERENCES `komentar`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
