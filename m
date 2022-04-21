Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09544509A83
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 10:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9106617D5;
	Thu, 21 Apr 2022 10:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9106617D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650529316;
	bh=WH4uBtW0IQTCWgKHd1yCo0xcGKj5AawfkCP5Nhi6SuI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BVB0gqU5yoxw2tDBdwwQbDwE7+bZqS6CeawIEMaY/2lSGb+4nVwzZYzE7LxoK5Yvi
	 AjV6y0c3LJARXNRoNpITvluhlfDsZtbVzfAGYbp+22b40aK5OT83G7hQepJuARbqDN
	 wvgdeSFlLlHWHOpAWt7ougi4AA6GK+SjlwScJSXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A18F800F4;
	Thu, 21 Apr 2022 10:20:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C068F800F4; Thu, 21 Apr 2022 10:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDAF5F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 10:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDAF5F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Im8Ki6Kz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E5AB61BEC;
 Thu, 21 Apr 2022 08:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9897CC385A1;
 Thu, 21 Apr 2022 08:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650529246;
 bh=WH4uBtW0IQTCWgKHd1yCo0xcGKj5AawfkCP5Nhi6SuI=;
 h=From:To:Cc:Subject:Date:From;
 b=Im8Ki6KzMH95psGh15IbeIagQGIGD4iZ08omZ/QJ9IPJbQ70rTAxYp2lNsA89qIHG
 TsxcASoXWnPIfm7jOpi0J85Vu0v8e7XgmriRzhlNN70qwX8D51cl/Oh1bTj6DQy7Wr
 qSelsnilSxEROwx0gvdyF3vk0JA3BE/SmQ/8F8xXSAxrScb4R7z2Rw4R4y8OiGWLty
 S4yVPrZB3wg50+lT8GfONn9PBq7BdPPRx7rg8bGONa9wPGfEQZGHP9P3nJmOuWepK7
 c0M204UpzvJjxLjqJ9sXwnKzT4F6b0ukNCX3BVcPZTfDrRZlgaPViF1lcafCm0jiZe
 Ywv305RheIPgw==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] [v4] m68k: coldfire: drop ISA_DMA_API support
Date: Thu, 21 Apr 2022 10:20:12 +0200
Message-Id: <20220421082040.2866638-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

After a build regression report, I took a look at possible users of
CONFIG_ISA_DMA_API on m68k and found none, which Greg confirmed. The
CONFIG_GENERIC_ISA_DMA option in turn is only needed to implement
ISA_DMA_API, and is clearly not used on the platforms with ISA support.

The CONFIG_ISA support for AMIGA_PCMCIA is probably also unneeded,
but this is less clear. Unlike other PCMCIA implementations, this one
does not use the drivers/pcmcia subsystem at all and just supports
the "apne" network driver. When it was first added, one could use
ISA drivers on it as well, but this probably broke at some point.

With no reason to keep this, let's just drop the corresponding files
and prevent the remaining ISA drivers that use this from getting built.

The remaining definitions in asm/dma.h are used for PCI support.

Link: https://lore.kernel.org/lkml/9e5ee1c3-ca80-f343-a1f5-66f3dd1c0727@linux-m68k.org/
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
Acked-by: Greg Ungerer <gerg@linux-m68k.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v4: actually fix the build regression
v3: fix build regression
v2: drop GENERIC_ISA_DMA as well, add some background on CONFIG_ISA.
---
 arch/m68k/Kconfig.bus       |  10 -
 arch/m68k/coldfire/Makefile |   2 +-
 arch/m68k/coldfire/dma.c    |  43 ----
 arch/m68k/include/asm/dma.h | 483 ------------------------------------
 arch/m68k/mm/motorola.c     |   1 -
 drivers/mmc/host/Kconfig    |   2 +-
 sound/core/Makefile         |   2 -
 sound/isa/Kconfig           |   2 +-
 8 files changed, 3 insertions(+), 542 deletions(-)
 delete mode 100644 arch/m68k/coldfire/dma.c

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index d1e93a39cd3b..d5c0b2990ee1 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -56,16 +56,6 @@ config ATARI_ROM_ISA
 	  The only driver currently using this adapter is the EtherNEC
 	  driver for RTL8019AS based NE2000 compatible network cards.
 
-config GENERIC_ISA_DMA
-	def_bool ISA
-
 source "drivers/zorro/Kconfig"
 
 endif
-
-if COLDFIRE
-
-config ISA_DMA_API
-	def_bool !M5272
-
-endif
diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
index a3e18d73d8b8..9419a6c1f036 100644
--- a/arch/m68k/coldfire/Makefile
+++ b/arch/m68k/coldfire/Makefile
@@ -15,7 +15,7 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o dma.o entry.o vectors.o
+obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o entry.o vectors.o
 obj-$(CONFIG_M5206)	+= m5206.o intc.o reset.o
 obj-$(CONFIG_M5206e)	+= m5206.o intc.o reset.o
 obj-$(CONFIG_M520x)	+= m520x.o intc-simr.o reset.o
diff --git a/arch/m68k/coldfire/dma.c b/arch/m68k/coldfire/dma.c
deleted file mode 100644
index c3279f7467d7..000000000000
--- a/arch/m68k/coldfire/dma.c
+++ /dev/null
@@ -1,43 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/***************************************************************************/
-
-/*
- *	dma.c -- Freescale ColdFire DMA support
- *
- *	Copyright (C) 2007, Greg Ungerer (gerg@snapgear.com)
- */
-
-/***************************************************************************/
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <asm/dma.h>
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfdma.h>
-
-/***************************************************************************/
-
-/*
- *      DMA channel base address table.
- */
-unsigned int dma_base_addr[MAX_M68K_DMA_CHANNELS] = {
-#ifdef MCFDMA_BASE0
-	MCFDMA_BASE0,
-#endif
-#ifdef MCFDMA_BASE1
-	MCFDMA_BASE1,
-#endif
-#ifdef MCFDMA_BASE2
-	MCFDMA_BASE2,
-#endif
-#ifdef MCFDMA_BASE3
-	MCFDMA_BASE3,
-#endif
-};
-EXPORT_SYMBOL(dma_base_addr);
-
-unsigned int dma_device_address[MAX_M68K_DMA_CHANNELS];
-EXPORT_SYMBOL(dma_device_address);
-
-/***************************************************************************/
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index ae2021964e32..f6c5e0dfb4e5 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -2,493 +2,10 @@
 #ifndef _M68K_DMA_H
 #define _M68K_DMA_H 1
 
-#ifdef CONFIG_COLDFIRE
-/*
- * ColdFire DMA Model:
- *   ColdFire DMA supports two forms of DMA: Single and Dual address. Single
- * address mode emits a source address, and expects that the device will either
- * pick up the data (DMA READ) or source data (DMA WRITE). This implies that
- * the device will place data on the correct byte(s) of the data bus, as the
- * memory transactions are always 32 bits. This implies that only 32 bit
- * devices will find single mode transfers useful. Dual address DMA mode
- * performs two cycles: source read and destination write. ColdFire will
- * align the data so that the device will always get the correct bytes, thus
- * is useful for 8 and 16 bit devices. This is the mode that is supported
- * below.
- *
- * AUG/22/2000 : added support for 32-bit Dual-Address-Mode (K) 2000
- *               Oliver Kamphenkel (O.Kamphenkel@tu-bs.de)
- *
- * AUG/25/2000 : added support for 8, 16 and 32-bit Single-Address-Mode (K)2000
- *               Oliver Kamphenkel (O.Kamphenkel@tu-bs.de)
- *
- * APR/18/2002 : added proper support for MCF5272 DMA controller.
- *               Arthur Shipkowski (art@videon-central.com)
- */
-
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfdma.h>
-
-/*
- * Set number of channels of DMA on ColdFire for different implementations.
- */
-#if defined(CONFIG_M5249) || defined(CONFIG_M5307) || defined(CONFIG_M5407) || \
-	defined(CONFIG_M523x) || defined(CONFIG_M527x) || \
-	defined(CONFIG_M528x) || defined(CONFIG_M525x)
-
-#define MAX_M68K_DMA_CHANNELS 4
-#elif defined(CONFIG_M5272)
-#define MAX_M68K_DMA_CHANNELS 1
-#elif defined(CONFIG_M53xx)
-#define MAX_M68K_DMA_CHANNELS 0
-#else
-#define MAX_M68K_DMA_CHANNELS 2
-#endif
-
-extern unsigned int dma_base_addr[MAX_M68K_DMA_CHANNELS];
-extern unsigned int dma_device_address[MAX_M68K_DMA_CHANNELS];
-
-#if !defined(CONFIG_M5272)
-#define DMA_MODE_WRITE_BIT  0x01  /* Memory/IO to IO/Memory select */
-#define DMA_MODE_WORD_BIT   0x02  /* 8 or 16 bit transfers */
-#define DMA_MODE_LONG_BIT   0x04  /* or 32 bit transfers */
-#define DMA_MODE_SINGLE_BIT 0x08  /* single-address-mode */
-
-/* I/O to memory, 8 bits, mode */
-#define DMA_MODE_READ	            0
-/* memory to I/O, 8 bits, mode */
-#define DMA_MODE_WRITE	            1
-/* I/O to memory, 16 bits, mode */
-#define DMA_MODE_READ_WORD          2
-/* memory to I/O, 16 bits, mode */
-#define DMA_MODE_WRITE_WORD         3
-/* I/O to memory, 32 bits, mode */
-#define DMA_MODE_READ_LONG          4
-/* memory to I/O, 32 bits, mode */
-#define DMA_MODE_WRITE_LONG         5
-/* I/O to memory, 8 bits, single-address-mode */
-#define DMA_MODE_READ_SINGLE        8
-/* memory to I/O, 8 bits, single-address-mode */
-#define DMA_MODE_WRITE_SINGLE       9
-/* I/O to memory, 16 bits, single-address-mode */
-#define DMA_MODE_READ_WORD_SINGLE  10
-/* memory to I/O, 16 bits, single-address-mode */
-#define DMA_MODE_WRITE_WORD_SINGLE 11
-/* I/O to memory, 32 bits, single-address-mode */
-#define DMA_MODE_READ_LONG_SINGLE  12
-/* memory to I/O, 32 bits, single-address-mode */
-#define DMA_MODE_WRITE_LONG_SINGLE 13
-
-#else /* CONFIG_M5272 is defined */
-
-/* Source static-address mode */
-#define DMA_MODE_SRC_SA_BIT 0x01
-/* Two bits to select between all four modes */
-#define DMA_MODE_SSIZE_MASK 0x06
-/* Offset to shift bits in */
-#define DMA_MODE_SSIZE_OFF  0x01
-/* Destination static-address mode */
-#define DMA_MODE_DES_SA_BIT 0x10
-/* Two bits to select between all four modes */
-#define DMA_MODE_DSIZE_MASK 0x60
-/* Offset to shift bits in */
-#define DMA_MODE_DSIZE_OFF  0x05
-/* Size modifiers */
-#define DMA_MODE_SIZE_LONG  0x00
-#define DMA_MODE_SIZE_BYTE  0x01
-#define DMA_MODE_SIZE_WORD  0x02
-#define DMA_MODE_SIZE_LINE  0x03
-
-/*
- * Aliases to help speed quick ports; these may be suboptimal, however. They
- * do not include the SINGLE mode modifiers since the MCF5272 does not have a
- * mode where the device is in control of its addressing.
- */
-
-/* I/O to memory, 8 bits, mode */
-#define DMA_MODE_READ	              ((DMA_MODE_SIZE_BYTE << DMA_MODE_DSIZE_OFF) | (DMA_MODE_SIZE_BYTE << DMA_MODE_SSIZE_OFF) | DMA_SRC_SA_BIT)
-/* memory to I/O, 8 bits, mode */
-#define DMA_MODE_WRITE	            ((DMA_MODE_SIZE_BYTE << DMA_MODE_DSIZE_OFF) | (DMA_MODE_SIZE_BYTE << DMA_MODE_SSIZE_OFF) | DMA_DES_SA_BIT)
-/* I/O to memory, 16 bits, mode */
-#define DMA_MODE_READ_WORD	        ((DMA_MODE_SIZE_WORD << DMA_MODE_DSIZE_OFF) | (DMA_MODE_SIZE_WORD << DMA_MODE_SSIZE_OFF) | DMA_SRC_SA_BIT)
-/* memory to I/O, 16 bits, mode */
-#define DMA_MODE_WRITE_WORD         ((DMA_MODE_SIZE_WORD << DMA_MODE_DSIZE_OFF) | (DMA_MODE_SIZE_WORD << DMA_MODE_SSIZE_OFF) | DMA_DES_SA_BIT)
-/* I/O to memory, 32 bits, mode */
-#define DMA_MODE_READ_LONG	        ((DMA_MODE_SIZE_LONG << DMA_MODE_DSIZE_OFF) | (DMA_MODE_SIZE_LONG << DMA_MODE_SSIZE_OFF) | DMA_SRC_SA_BIT)
-/* memory to I/O, 32 bits, mode */
-#define DMA_MODE_WRITE_LONG         ((DMA_MODE_SIZE_LONG << DMA_MODE_DSIZE_OFF) | (DMA_MODE_SIZE_LONG << DMA_MODE_SSIZE_OFF) | DMA_DES_SA_BIT)
-
-#endif /* !defined(CONFIG_M5272) */
-
-#if !defined(CONFIG_M5272)
-/* enable/disable a specific DMA channel */
-static __inline__ void enable_dma(unsigned int dmanr)
-{
-  volatile unsigned short *dmawp;
-
-#ifdef DMA_DEBUG
-  printk("enable_dma(dmanr=%d)\n", dmanr);
-#endif
-
-  dmawp = (unsigned short *) dma_base_addr[dmanr];
-  dmawp[MCFDMA_DCR] |= MCFDMA_DCR_EEXT;
-}
-
-static __inline__ void disable_dma(unsigned int dmanr)
-{
-  volatile unsigned short *dmawp;
-  volatile unsigned char  *dmapb;
-
-#ifdef DMA_DEBUG
-  printk("disable_dma(dmanr=%d)\n", dmanr);
-#endif
-
-  dmawp = (unsigned short *) dma_base_addr[dmanr];
-  dmapb = (unsigned char *) dma_base_addr[dmanr];
-
-  /* Turn off external requests, and stop any DMA in progress */
-  dmawp[MCFDMA_DCR] &= ~MCFDMA_DCR_EEXT;
-  dmapb[MCFDMA_DSR] = MCFDMA_DSR_DONE;
-}
-
-/*
- * Clear the 'DMA Pointer Flip Flop'.
- * Write 0 for LSB/MSB, 1 for MSB/LSB access.
- * Use this once to initialize the FF to a known state.
- * After that, keep track of it. :-)
- * --- In order to do that, the DMA routines below should ---
- * --- only be used while interrupts are disabled! ---
- *
- * This is a NOP for ColdFire. Provide a stub for compatibility.
- */
-static __inline__ void clear_dma_ff(unsigned int dmanr)
-{
-}
-
-/* set mode (above) for a specific DMA channel */
-static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
-{
-
-  volatile unsigned char  *dmabp;
-  volatile unsigned short *dmawp;
-
-#ifdef DMA_DEBUG
-  printk("set_dma_mode(dmanr=%d,mode=%d)\n", dmanr, mode);
-#endif
-
-  dmabp = (unsigned char *) dma_base_addr[dmanr];
-  dmawp = (unsigned short *) dma_base_addr[dmanr];
-
-  /* Clear config errors */
-  dmabp[MCFDMA_DSR] = MCFDMA_DSR_DONE;
-
-  /* Set command register */
-  dmawp[MCFDMA_DCR] =
-    MCFDMA_DCR_INT |         /* Enable completion irq */
-    MCFDMA_DCR_CS |          /* Force one xfer per request */
-    MCFDMA_DCR_AA |          /* Enable auto alignment */
-    /* single-address-mode */
-    ((mode & DMA_MODE_SINGLE_BIT) ? MCFDMA_DCR_SAA : 0) |
-    /* sets s_rw (-> r/w) high if Memory to I/0 */
-    ((mode & DMA_MODE_WRITE_BIT) ? MCFDMA_DCR_S_RW : 0) |
-    /* Memory to I/O or I/O to Memory */
-    ((mode & DMA_MODE_WRITE_BIT) ? MCFDMA_DCR_SINC : MCFDMA_DCR_DINC) |
-    /* 32 bit, 16 bit or 8 bit transfers */
-    ((mode & DMA_MODE_WORD_BIT)  ? MCFDMA_DCR_SSIZE_WORD :
-     ((mode & DMA_MODE_LONG_BIT) ? MCFDMA_DCR_SSIZE_LONG :
-                                   MCFDMA_DCR_SSIZE_BYTE)) |
-    ((mode & DMA_MODE_WORD_BIT)  ? MCFDMA_DCR_DSIZE_WORD :
-     ((mode & DMA_MODE_LONG_BIT) ? MCFDMA_DCR_DSIZE_LONG :
-                                   MCFDMA_DCR_DSIZE_BYTE));
-
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DSR[%x]=%x DCR[%x]=%x\n", __FILE__, __LINE__,
-         dmanr, (int) &dmabp[MCFDMA_DSR], dmabp[MCFDMA_DSR],
-	 (int) &dmawp[MCFDMA_DCR], dmawp[MCFDMA_DCR]);
-#endif
-}
-
-/* Set transfer address for specific DMA channel */
-static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
-{
-  volatile unsigned short *dmawp;
-  volatile unsigned int   *dmalp;
-
-#ifdef DMA_DEBUG
-  printk("set_dma_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
-
-  dmawp = (unsigned short *) dma_base_addr[dmanr];
-  dmalp = (unsigned int *) dma_base_addr[dmanr];
-
-  /* Determine which address registers are used for memory/device accesses */
-  if (dmawp[MCFDMA_DCR] & MCFDMA_DCR_SINC) {
-    /* Source incrementing, must be memory */
-    dmalp[MCFDMA_SAR] = a;
-    /* Set dest address, must be device */
-    dmalp[MCFDMA_DAR] = dma_device_address[dmanr];
-  } else {
-    /* Destination incrementing, must be memory */
-    dmalp[MCFDMA_DAR] = a;
-    /* Set source address, must be device */
-    dmalp[MCFDMA_SAR] = dma_device_address[dmanr];
-  }
-
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DCR[%x]=%x SAR[%x]=%08x DAR[%x]=%08x\n",
-	__FILE__, __LINE__, dmanr, (int) &dmawp[MCFDMA_DCR], dmawp[MCFDMA_DCR],
-	(int) &dmalp[MCFDMA_SAR], dmalp[MCFDMA_SAR],
-	(int) &dmalp[MCFDMA_DAR], dmalp[MCFDMA_DAR]);
-#endif
-}
-
-/*
- * Specific for Coldfire - sets device address.
- * Should be called after the mode set call, and before set DMA address.
- */
-static __inline__ void set_dma_device_addr(unsigned int dmanr, unsigned int a)
-{
-#ifdef DMA_DEBUG
-  printk("set_dma_device_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
-
-  dma_device_address[dmanr] = a;
-}
-
-/*
- * NOTE 2: "count" represents _bytes_.
- */
-static __inline__ void set_dma_count(unsigned int dmanr, unsigned int count)
-{
-  volatile unsigned short *dmawp;
-
-#ifdef DMA_DEBUG
-  printk("set_dma_count(dmanr=%d,count=%d)\n", dmanr, count);
-#endif
-
-  dmawp = (unsigned short *) dma_base_addr[dmanr];
-  dmawp[MCFDMA_BCR] = (unsigned short)count;
-}
-
-/*
- * Get DMA residue count. After a DMA transfer, this
- * should return zero. Reading this while a DMA transfer is
- * still in progress will return unpredictable results.
- * Otherwise, it returns the number of _bytes_ left to transfer.
- */
-static __inline__ int get_dma_residue(unsigned int dmanr)
-{
-  volatile unsigned short *dmawp;
-  unsigned short count;
-
-#ifdef DMA_DEBUG
-  printk("get_dma_residue(dmanr=%d)\n", dmanr);
-#endif
-
-  dmawp = (unsigned short *) dma_base_addr[dmanr];
-  count = dmawp[MCFDMA_BCR];
-  return((int) count);
-}
-#else /* CONFIG_M5272 is defined */
-
-/*
- * The MCF5272 DMA controller is very different than the controller defined above
- * in terms of register mapping.  For instance, with the exception of the 16-bit
- * interrupt register (IRQ#85, for reference), all of the registers are 32-bit.
- *
- * The big difference, however, is the lack of device-requested DMA.  All modes
- * are dual address transfer, and there is no 'device' setup or direction bit.
- * You can DMA between a device and memory, between memory and memory, or even between
- * two devices directly, with any combination of incrementing and non-incrementing
- * addresses you choose.  This puts a crimp in distinguishing between the 'device
- * address' set up by set_dma_device_addr.
- *
- * Therefore, there are two options.  One is to use set_dma_addr and set_dma_device_addr,
- * which will act exactly as above in -- it will look to see if the source is set to
- * autoincrement, and if so it will make the source use the set_dma_addr value and the
- * destination the set_dma_device_addr value.  Otherwise the source will be set to the
- * set_dma_device_addr value and the destination will get the set_dma_addr value.
- *
- * The other is to use the provided set_dma_src_addr and set_dma_dest_addr functions
- * and make it explicit.  Depending on what you're doing, one of these two should work
- * for you, but don't mix them in the same transfer setup.
- */
-
-/* enable/disable a specific DMA channel */
-static __inline__ void enable_dma(unsigned int dmanr)
-{
-  volatile unsigned int  *dmalp;
-
-#ifdef DMA_DEBUG
-  printk("enable_dma(dmanr=%d)\n", dmanr);
-#endif
-
-  dmalp = (unsigned int *) dma_base_addr[dmanr];
-  dmalp[MCFDMA_DMR] |= MCFDMA_DMR_EN;
-}
-
-static __inline__ void disable_dma(unsigned int dmanr)
-{
-  volatile unsigned int   *dmalp;
-
-#ifdef DMA_DEBUG
-  printk("disable_dma(dmanr=%d)\n", dmanr);
-#endif
-
-  dmalp = (unsigned int *) dma_base_addr[dmanr];
-
-  /* Turn off external requests, and stop any DMA in progress */
-  dmalp[MCFDMA_DMR] &= ~MCFDMA_DMR_EN;
-  dmalp[MCFDMA_DMR] |= MCFDMA_DMR_RESET;
-}
-
-/*
- * Clear the 'DMA Pointer Flip Flop'.
- * Write 0 for LSB/MSB, 1 for MSB/LSB access.
- * Use this once to initialize the FF to a known state.
- * After that, keep track of it. :-)
- * --- In order to do that, the DMA routines below should ---
- * --- only be used while interrupts are disabled! ---
- *
- * This is a NOP for ColdFire. Provide a stub for compatibility.
- */
-static __inline__ void clear_dma_ff(unsigned int dmanr)
-{
-}
-
-/* set mode (above) for a specific DMA channel */
-static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
-{
-
-  volatile unsigned int   *dmalp;
-  volatile unsigned short *dmawp;
-
-#ifdef DMA_DEBUG
-  printk("set_dma_mode(dmanr=%d,mode=%d)\n", dmanr, mode);
-#endif
-  dmalp = (unsigned int *) dma_base_addr[dmanr];
-  dmawp = (unsigned short *) dma_base_addr[dmanr];
-
-  /* Clear config errors */
-  dmalp[MCFDMA_DMR] |= MCFDMA_DMR_RESET;
-
-  /* Set command register */
-  dmalp[MCFDMA_DMR] =
-    MCFDMA_DMR_RQM_DUAL |         /* Mandatory Request Mode setting */
-    MCFDMA_DMR_DSTT_SD  |         /* Set up addressing types; set to supervisor-data. */
-    MCFDMA_DMR_SRCT_SD  |         /* Set up addressing types; set to supervisor-data. */
-    /* source static-address-mode */
-    ((mode & DMA_MODE_SRC_SA_BIT) ? MCFDMA_DMR_SRCM_SA : MCFDMA_DMR_SRCM_IA) |
-    /* dest static-address-mode */
-    ((mode & DMA_MODE_DES_SA_BIT) ? MCFDMA_DMR_DSTM_SA : MCFDMA_DMR_DSTM_IA) |
-    /* burst, 32 bit, 16 bit or 8 bit transfers are separately configurable on the MCF5272 */
-    (((mode & DMA_MODE_SSIZE_MASK) >> DMA_MODE_SSIZE_OFF) << MCFDMA_DMR_DSTS_OFF) |
-    (((mode & DMA_MODE_SSIZE_MASK) >> DMA_MODE_SSIZE_OFF) << MCFDMA_DMR_SRCS_OFF);
-
-  dmawp[MCFDMA_DIR] |= MCFDMA_DIR_ASCEN;   /* Enable completion interrupts */
-
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DMR[%x]=%x DIR[%x]=%x\n", __FILE__, __LINE__,
-	 dmanr, (int) &dmalp[MCFDMA_DMR], dmalp[MCFDMA_DMR],
-	 (int) &dmawp[MCFDMA_DIR], dmawp[MCFDMA_DIR]);
-#endif
-}
-
-/* Set transfer address for specific DMA channel */
-static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
-{
-  volatile unsigned int   *dmalp;
-
-#ifdef DMA_DEBUG
-  printk("set_dma_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
-
-  dmalp = (unsigned int *) dma_base_addr[dmanr];
-
-  /* Determine which address registers are used for memory/device accesses */
-  if (dmalp[MCFDMA_DMR] & MCFDMA_DMR_SRCM) {
-    /* Source incrementing, must be memory */
-    dmalp[MCFDMA_DSAR] = a;
-    /* Set dest address, must be device */
-    dmalp[MCFDMA_DDAR] = dma_device_address[dmanr];
-  } else {
-    /* Destination incrementing, must be memory */
-    dmalp[MCFDMA_DDAR] = a;
-    /* Set source address, must be device */
-    dmalp[MCFDMA_DSAR] = dma_device_address[dmanr];
-  }
-
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DMR[%x]=%x SAR[%x]=%08x DAR[%x]=%08x\n",
-	__FILE__, __LINE__, dmanr, (int) &dmalp[MCFDMA_DMR], dmalp[MCFDMA_DMR],
-	(int) &dmalp[MCFDMA_DSAR], dmalp[MCFDMA_DSAR],
-	(int) &dmalp[MCFDMA_DDAR], dmalp[MCFDMA_DDAR]);
-#endif
-}
-
-/*
- * Specific for Coldfire - sets device address.
- * Should be called after the mode set call, and before set DMA address.
- */
-static __inline__ void set_dma_device_addr(unsigned int dmanr, unsigned int a)
-{
-#ifdef DMA_DEBUG
-  printk("set_dma_device_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
-
-  dma_device_address[dmanr] = a;
-}
-
-/*
- * NOTE 2: "count" represents _bytes_.
- *
- * NOTE 3: While a 32-bit register, "count" is only a maximum 24-bit value.
- */
-static __inline__ void set_dma_count(unsigned int dmanr, unsigned int count)
-{
-  volatile unsigned int *dmalp;
-
-#ifdef DMA_DEBUG
-  printk("set_dma_count(dmanr=%d,count=%d)\n", dmanr, count);
-#endif
-
-  dmalp = (unsigned int *) dma_base_addr[dmanr];
-  dmalp[MCFDMA_DBCR] = count;
-}
-
-/*
- * Get DMA residue count. After a DMA transfer, this
- * should return zero. Reading this while a DMA transfer is
- * still in progress will return unpredictable results.
- * Otherwise, it returns the number of _bytes_ left to transfer.
- */
-static __inline__ int get_dma_residue(unsigned int dmanr)
-{
-  volatile unsigned int *dmalp;
-  unsigned int count;
-
-#ifdef DMA_DEBUG
-  printk("get_dma_residue(dmanr=%d)\n", dmanr);
-#endif
-
-  dmalp = (unsigned int *) dma_base_addr[dmanr];
-  count = dmalp[MCFDMA_DBCR];
-  return(count);
-}
-
-#endif /* !defined(CONFIG_M5272) */
-#endif /* CONFIG_COLDFIRE */
-
 /* it's useless on the m68k, but unfortunately needed by the new
    bootmem allocator (but this should do it for this) */
 #define MAX_DMA_ADDRESS PAGE_OFFSET
 
-#define MAX_DMA_CHANNELS 8
-
-extern int request_dma(unsigned int dmanr, const char * device_id);	/* reserve a DMA channel */
-extern void free_dma(unsigned int dmanr);	/* release it again */
-
 #ifdef CONFIG_PCI
 extern int isa_dma_bridge_buggy;
 #else
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index ecbe948f4c1a..df7f797c908a 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -27,7 +27,6 @@
 #include <asm/pgalloc.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
-#include <asm/dma.h>
 #ifdef CONFIG_ATARI
 #include <asm/atari_stram.h>
 #endif
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index af6c3c329076..d6144978e32d 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -508,7 +508,7 @@ config MMC_OMAP_HS
 
 config MMC_WBSD
 	tristate "Winbond W83L51xD SD/MMC Card Interface support"
-	depends on ISA_DMA_API && !M68K
+	depends on ISA_DMA_API
 	help
 	  This selects the Winbond(R) W83L51xD Secure digital and
 	  Multimedia card Interface.
diff --git a/sound/core/Makefile b/sound/core/Makefile
index 350d704ced98..2762f03d9b7b 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -9,9 +9,7 @@ ifneq ($(CONFIG_SND_PROC_FS),)
 snd-y += info.o
 snd-$(CONFIG_SND_OSSEMUL) += info_oss.o
 endif
-ifneq ($(CONFIG_M68K),y)
 snd-$(CONFIG_ISA_DMA_API) += isadma.o
-endif
 snd-$(CONFIG_SND_OSSEMUL) += sound_oss.o
 snd-$(CONFIG_SND_VMASTER) += vmaster.o
 snd-$(CONFIG_SND_JACK)	  += ctljack.o jack.o
diff --git a/sound/isa/Kconfig b/sound/isa/Kconfig
index 570b88e0b201..6ffa48dd5983 100644
--- a/sound/isa/Kconfig
+++ b/sound/isa/Kconfig
@@ -22,7 +22,7 @@ config SND_SB16_DSP
 menuconfig SND_ISA
 	bool "ISA sound devices"
 	depends on ISA || COMPILE_TEST
-	depends on ISA_DMA_API && !M68K
+	depends on ISA_DMA_API
 	default y
 	help
 	  Support for sound devices connected via the ISA bus.
-- 
2.29.2

