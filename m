Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390A4B0DB3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 13:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA0D718DB;
	Thu, 10 Feb 2022 13:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA0D718DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644497033;
	bh=NXqgQyckWQRNXWT1/Cheha1gpKaC8pw+lkW17wyETao=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sumHJE8xrrFRA/z80eKICo0aFjYHUaC0pNG68RmG278kZBb8uuzUy7ACV/kYYU9z0
	 kEh4FINgpJcrmPjTlFxWFn5y8pxpeCwhspA+/76lcbOFaoQCoVMYYV9Bl+7N5A4+G7
	 L65BobmVQDOVywJtlklM+a5mtp4QOGCLA6xE/5Wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C5F2F80302;
	Thu, 10 Feb 2022 13:42:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1377EF800A7; Thu, 10 Feb 2022 13:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02191F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 13:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02191F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="gZXIKaKw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Wnqkav0T"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 905801F38A
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644496948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0zQPCbqTiu10kYbXY++Wy5ZOKwwqy7VM0hEceQ5iwJY=;
 b=gZXIKaKwbpHZxNxCLz2oWPwXNOltjcGD4fwEvryT0NSrzZTvu3oTQuGc2RRF2qww6d4i4x
 4jdpPJZgW00mt0Xxqy8t399qWKi6Q0CSgDY8KpOYfhJXUY3WfaemifJJW192smhKHkrbK8
 uZ8yguYhMnYHCQ74PKLm4SbgsKOX/co=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644496948;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0zQPCbqTiu10kYbXY++Wy5ZOKwwqy7VM0hEceQ5iwJY=;
 b=Wnqkav0TRf9/v1IDDZhZ7EFn/twWqOjW6e7OknGV4d+mHqgLiT0AYqiKjgRLP0PjkTWRVG
 OUVkkxj4FqcGbvDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7BF63A3B83;
 Thu, 10 Feb 2022 12:42:28 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ca0106: Rename register macro names
Date: Thu, 10 Feb 2022 13:42:27 +0100
Message-Id: <20220210124227.11272-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

ca0106 driver code uses too generic names for its register definitions
such as PTR, DATA, IPR, etc, which may eventually conflict with other
code.  This patch renames (some of) those register definitions with
CA0106_ prefix to avoid the conflicts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ca0106/ca0106.h       | 18 ++++-----
 sound/pci/ca0106/ca0106_main.c  | 70 ++++++++++++++++-----------------
 sound/pci/ca0106/ca0106_mixer.c | 16 ++++----
 3 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/sound/pci/ca0106/ca0106.h b/sound/pci/ca0106/ca0106.h
index f246e6094289..991b1c5d41d5 100644
--- a/sound/pci/ca0106/ca0106.h
+++ b/sound/pci/ca0106/ca0106.h
@@ -59,15 +59,15 @@
 /* PCI function 0 registers, address = <val> + PCIBASE0						*/
 /************************************************************************************************/
 
-#define PTR			0x00		/* Indexed register set pointer register	*/
+#define CA0106_PTR		0x00		/* Indexed register set pointer register	*/
 						/* NOTE: The CHANNELNUM and ADDRESS words can	*/
 						/* be modified independently of each other.	*/
 						/* CNL[1:0], ADDR[27:16]                        */
 
-#define DATA			0x04		/* Indexed register set data register		*/
+#define CA0106_DATA		0x04		/* Indexed register set data register		*/
 						/* DATA[31:0]					*/
 
-#define IPR			0x08		/* Global interrupt pending register		*/
+#define CA0106_IPR		0x08		/* Global interrupt pending register		*/
 						/* Clear pending interrupts by writing a 1 to	*/
 						/* the relevant bits and zero to the other bits	*/
 #define IPR_MIDI_RX_B		0x00020000	/* MIDI UART-B Receive buffer non-empty		*/
@@ -88,7 +88,7 @@
 #define IPR_MIDI_TX_A		0x00000002	/* MIDI UART-A Transmit buffer empty		*/
 #define IPR_PCI			0x00000001	/* PCI Bus error				*/
 
-#define INTE			0x0c		/* Interrupt enable register			*/
+#define CA0106_INTE		0x0c		/* Interrupt enable register			*/
 
 #define INTE_MIDI_RX_B		0x00020000	/* MIDI UART-B Receive buffer non-empty		*/
 #define INTE_MIDI_TX_B		0x00010000	/* MIDI UART-B Transmit buffer empty		*/
@@ -108,8 +108,8 @@
 #define INTE_MIDI_TX_A		0x00000002	/* MIDI UART-A Transmit buffer empty		*/
 #define INTE_PCI		0x00000001	/* PCI Bus error				*/
 
-#define UNKNOWN10		0x10		/* Unknown ??. Defaults to 0 */
-#define HCFG			0x14		/* Hardware config register			*/
+#define CA0106_UNKNOWN10	0x10		/* Unknown ??. Defaults to 0 */
+#define CA0106_HCFG		0x14		/* Hardware config register			*/
 						/* 0x1000 causes AC3 to fails. It adds a dither bit. */
 
 #define HCFG_STAC		0x10000000	/* Special mode for STAC9460 Codec. */
@@ -133,7 +133,7 @@
 #define HCFG_AUDIOENABLE	0x00000001	/* 0 = CODECs transmit zero-valued samples	*/
 						/* Should be set to 1 when the EMU10K1 is	*/
 						/* completely initialized.			*/
-#define GPIO			0x18		/* Defaults: 005f03a3-Analog, 005f02a2-SPDIF.   */
+#define CA0106_GPIO		0x18		/* Defaults: 005f03a3-Analog, 005f02a2-SPDIF.   */
 						/* Here pins 0,1,2,3,4,,6 are output. 5,7 are input */
 						/* For the Audigy LS, pin 0 (or bit 8) controls the SPDIF/Analog jack. */
 						/* SB Live 24bit:
@@ -152,9 +152,9 @@
 						 * GPO [15:8] Default 0x9. (Default to SPDIF jack enabled for SPDIF)
 						 * GPO Enable [23:16] Default 0x0f. Setting a bit to 1, causes the pin to be an output pin.
 						 */
-#define AC97DATA		0x1c		/* AC97 register set data register (16 bit)	*/
+#define CA0106_AC97DATA		0x1c		/* AC97 register set data register (16 bit)	*/
 
-#define AC97ADDRESS		0x1e		/* AC97 register set address register (8 bit)	*/
+#define CA0106_AC97ADDRESS	0x1e		/* AC97 register set address register (8 bit)	*/
 
 /********************************************************************************************************/
 /* CA0106 pointer-offset register set, accessed through the PTR and DATA registers                     */
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index 36fb150b72fb..8577f9fa5ea6 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -338,8 +338,8 @@ unsigned int snd_ca0106_ptr_read(struct snd_ca0106 * emu,
 	regptr = (reg << 16) | chn;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outl(regptr, emu->port + PTR);
-	val = inl(emu->port + DATA);
+	outl(regptr, emu->port + CA0106_PTR);
+	val = inl(emu->port + CA0106_DATA);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 	return val;
 }
@@ -355,8 +355,8 @@ void snd_ca0106_ptr_write(struct snd_ca0106 *emu,
 	regptr = (reg << 16) | chn;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outl(regptr, emu->port + PTR);
-	outl(data, emu->port + DATA);
+	outl(regptr, emu->port + CA0106_PTR);
+	outl(data, emu->port + CA0106_DATA);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
@@ -455,8 +455,8 @@ static void snd_ca0106_intr_enable(struct snd_ca0106 *emu, unsigned int intrenb)
 	unsigned int intr_enable;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	intr_enable = inl(emu->port + INTE) | intrenb;
-	outl(intr_enable, emu->port + INTE);
+	intr_enable = inl(emu->port + CA0106_INTE) | intrenb;
+	outl(intr_enable, emu->port + CA0106_INTE);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
@@ -466,8 +466,8 @@ static void snd_ca0106_intr_disable(struct snd_ca0106 *emu, unsigned int intrenb
 	unsigned int intr_enable;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	intr_enable = inl(emu->port + INTE) & ~intrenb;
-	outl(intr_enable, emu->port + INTE);
+	intr_enable = inl(emu->port + CA0106_INTE) & ~intrenb;
+	outl(intr_enable, emu->port + CA0106_INTE);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
@@ -786,9 +786,9 @@ static int snd_ca0106_pcm_prepare_playback(struct snd_pcm_substream *substream)
 		hcfg_set = 0;
 		break;
 	}
-	hcfg = inl(emu->port + HCFG) ;
+	hcfg = inl(emu->port + CA0106_HCFG) ;
 	hcfg = (hcfg & ~hcfg_mask) | hcfg_set;
-	outl(hcfg, emu->port + HCFG);
+	outl(hcfg, emu->port + CA0106_HCFG);
 	reg40 = snd_ca0106_ptr_read(emu, 0x40, 0);
 	reg40 = (reg40 & ~reg40_mask) | reg40_set;
 	snd_ca0106_ptr_write(emu, 0x40, 0, reg40);
@@ -888,9 +888,9 @@ static int snd_ca0106_pcm_prepare_capture(struct snd_pcm_substream *substream)
 		hcfg_set = 0;
 		break;
 	}
-	hcfg = inl(emu->port + HCFG) ;
+	hcfg = inl(emu->port + CA0106_HCFG) ;
 	hcfg = (hcfg & ~hcfg_mask) | hcfg_set;
-	outl(hcfg, emu->port + HCFG);
+	outl(hcfg, emu->port + CA0106_HCFG);
 	reg71 = snd_ca0106_ptr_read(emu, 0x71, 0);
 	reg71 = (reg71 & ~reg71_mask) | reg71_set;
 	snd_ca0106_ptr_write(emu, 0x71, 0, reg71);
@@ -1142,8 +1142,8 @@ static unsigned short snd_ca0106_ac97_read(struct snd_ac97 *ac97,
 	unsigned short val;
 
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outb(reg, emu->port + AC97ADDRESS);
-	val = inw(emu->port + AC97DATA);
+	outb(reg, emu->port + CA0106_AC97ADDRESS);
+	val = inw(emu->port + CA0106_AC97DATA);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 	return val;
 }
@@ -1155,8 +1155,8 @@ static void snd_ca0106_ac97_write(struct snd_ac97 *ac97,
 	unsigned long flags;
   
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outb(reg, emu->port + AC97ADDRESS);
-	outw(val, emu->port + AC97DATA);
+	outb(reg, emu->port + CA0106_AC97ADDRESS);
+	outw(val, emu->port + CA0106_AC97DATA);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
@@ -1200,7 +1200,7 @@ static irqreturn_t snd_ca0106_interrupt(int irq, void *dev_id)
         unsigned int stat76;
 	struct snd_ca0106_channel *pchannel;
 
-	status = inl(chip->port + IPR);
+	status = inl(chip->port + CA0106_IPR);
 	if (! status)
 		return IRQ_NONE;
 
@@ -1255,7 +1255,7 @@ static irqreturn_t snd_ca0106_interrupt(int irq, void *dev_id)
 	}
 
 	// acknowledge the interrupt if necessary
-	outl(status, chip->port+IPR);
+	outl(status, chip->port + CA0106_IPR);
 
 	return IRQ_HANDLED;
 }
@@ -1383,7 +1383,7 @@ static void ca0106_init_chip(struct snd_ca0106 *chip, int resume)
 	int ch;
 	unsigned int def_bits;
 
-	outl(0, chip->port + INTE);
+	outl(0, chip->port + CA0106_INTE);
 
 	/*
 	 *  Init to 0x02109204 :
@@ -1420,8 +1420,8 @@ static void ca0106_init_chip(struct snd_ca0106 *chip, int resume)
         snd_ca0106_ptr_write(chip, CAPTURE_MUTE, 0, 0x00fc0000);
 
         /* Write 0x8000 to AC97_REC_GAIN to mute it. */
-        outb(AC97_REC_GAIN, chip->port + AC97ADDRESS);
-        outw(0x8000, chip->port + AC97DATA);
+        outb(AC97_REC_GAIN, chip->port + CA0106_AC97ADDRESS);
+        outw(0x8000, chip->port + CA0106_AC97DATA);
 #if 0 /* FIXME: what are these? */
 	snd_ca0106_ptr_write(chip, SPCS0, 0, 0x2108006);
 	snd_ca0106_ptr_write(chip, 0x42, 0, 0x2108006);
@@ -1495,30 +1495,30 @@ static void ca0106_init_chip(struct snd_ca0106 *chip, int resume)
 		/* FIXME: Still need to find out what the other GPIO bits do.
 		 * E.g. For digital spdif out.
 		 */
-		outl(0x0, chip->port+GPIO);
-		/* outl(0x00f0e000, chip->port+GPIO); */ /* Analog */
-		outl(0x005f5301, chip->port+GPIO); /* Analog */
+		outl(0x0, chip->port + CA0106_GPIO);
+		/* outl(0x00f0e000, chip->port + CA0106_GPIO); */ /* Analog */
+		outl(0x005f5301, chip->port + CA0106_GPIO); /* Analog */
 	} else if (chip->details->gpio_type == 1) {
 		/* The SB0410 and SB0413 use GPIO differently. */
 		/* FIXME: Still need to find out what the other GPIO bits do.
 		 * E.g. For digital spdif out.
 		 */
-		outl(0x0, chip->port+GPIO);
-		/* outl(0x00f0e000, chip->port+GPIO); */ /* Analog */
-		outl(0x005f5301, chip->port+GPIO); /* Analog */
+		outl(0x0, chip->port + CA0106_GPIO);
+		/* outl(0x00f0e000, chip->port + CA0106_GPIO); */ /* Analog */
+		outl(0x005f5301, chip->port + CA0106_GPIO); /* Analog */
 	} else {
-		outl(0x0, chip->port+GPIO);
-		outl(0x005f03a3, chip->port+GPIO); /* Analog */
-		/* outl(0x005f02a2, chip->port+GPIO); */ /* SPDIF */
+		outl(0x0, chip->port + CA0106_GPIO);
+		outl(0x005f03a3, chip->port + CA0106_GPIO); /* Analog */
+		/* outl(0x005f02a2, chip->port + CA0106_GPIO); */ /* SPDIF */
 	}
 	snd_ca0106_intr_enable(chip, 0x105); /* Win2000 uses 0x1e0 */
 
 	/* outl(HCFG_LOCKSOUNDCACHE|HCFG_AUDIOENABLE, chip->port+HCFG); */
 	/* 0x1000 causes AC3 to fails. Maybe it effects 24 bit output. */
-	/* outl(0x00001409, chip->port+HCFG); */
-	/* outl(0x00000009, chip->port+HCFG); */
+	/* outl(0x00001409, chip->port + CA0106_HCFG); */
+	/* outl(0x00000009, chip->port + CA0106_HCFG); */
 	/* AC97 2.0, Enable outputs. */
-	outl(HCFG_AC97 | HCFG_AUDIOENABLE, chip->port+HCFG);
+	outl(HCFG_AC97 | HCFG_AUDIOENABLE, chip->port + CA0106_HCFG);
 
 	if (chip->details->i2c_adc == 1) {
 		/* The SB0410 and SB0413 use I2C to control ADC. */
@@ -1560,12 +1560,12 @@ static void ca0106_stop_chip(struct snd_ca0106 *chip)
 {
 	/* disable interrupts */
 	snd_ca0106_ptr_write(chip, BASIC_INTERRUPT, 0, 0);
-	outl(0, chip->port + INTE);
+	outl(0, chip->port + CA0106_INTE);
 	snd_ca0106_ptr_write(chip, EXTENDED_INT_MASK, 0, 0);
 	udelay(1000);
 	/* disable audio */
 	/* outl(HCFG_LOCKSOUNDCACHE, chip->port + HCFG); */
-	outl(0, chip->port + HCFG);
+	outl(0, chip->port + CA0106_HCFG);
 	/* FIXME: We need to stop and DMA transfers here.
 	 *        But as I am not sure how yet, we cannot from the dma pages.
 	 * So we can fix: snd-malloc: Memory leak?  pages not freed = 8
diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index c852c6a75b91..05f56015ddd8 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -70,8 +70,8 @@ static void ca0106_spdif_enable(struct snd_ca0106 *emu)
 		snd_ca0106_ptr_write(emu, SPDIF_SELECT2, 0, 0x0b000000);
 		val = snd_ca0106_ptr_read(emu, CAPTURE_CONTROL, 0) & ~0x1000;
 		snd_ca0106_ptr_write(emu, CAPTURE_CONTROL, 0, val);
-		val = inl(emu->port + GPIO) & ~0x101;
-		outl(val, emu->port + GPIO);
+		val = inl(emu->port + CA0106_GPIO) & ~0x101;
+		outl(val, emu->port + CA0106_GPIO);
 
 	} else {
 		/* Analog */
@@ -79,8 +79,8 @@ static void ca0106_spdif_enable(struct snd_ca0106 *emu)
 		snd_ca0106_ptr_write(emu, SPDIF_SELECT2, 0, 0x000f0000);
 		val = snd_ca0106_ptr_read(emu, CAPTURE_CONTROL, 0) | 0x1000;
 		snd_ca0106_ptr_write(emu, CAPTURE_CONTROL, 0, val);
-		val = inl(emu->port + GPIO) | 0x101;
-		outl(val, emu->port + GPIO);
+		val = inl(emu->port + CA0106_GPIO) | 0x101;
+		outl(val, emu->port + CA0106_GPIO);
 	}
 }
 
@@ -119,14 +119,14 @@ static void ca0106_set_capture_mic_line_in(struct snd_ca0106 *emu)
 
 	if (emu->capture_mic_line_in) {
 		/* snd_ca0106_i2c_write(emu, ADC_MUX, 0); */ /* Mute input */
-		tmp = inl(emu->port+GPIO) & ~0x400;
+		tmp = inl(emu->port + CA0106_GPIO) & ~0x400;
 		tmp = tmp | 0x400;
-		outl(tmp, emu->port+GPIO);
+		outl(tmp, emu->port + CA0106_GPIO);
 		/* snd_ca0106_i2c_write(emu, ADC_MUX, ADC_MUX_MIC); */
 	} else {
 		/* snd_ca0106_i2c_write(emu, ADC_MUX, 0); */ /* Mute input */
-		tmp = inl(emu->port+GPIO) & ~0x400;
-		outl(tmp, emu->port+GPIO);
+		tmp = inl(emu->port + CA0106_GPIO) & ~0x400;
+		outl(tmp, emu->port + CA0106_GPIO);
 		/* snd_ca0106_i2c_write(emu, ADC_MUX, ADC_MUX_LINEIN); */
 	}
 }
-- 
2.31.1

