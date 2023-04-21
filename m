Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF36EAC8F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B2CEBE;
	Fri, 21 Apr 2023 16:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B2CEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086472;
	bh=Y8urYAYvsC/3wb4nVZe3YKiavTydhUP34nSrn9DWwrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HUSPI/DR2JZzEFOWChdOsVWwJ4+VqUMYsVV39hHm7tAxS5RkEEsSVP/3COvIaJTIT
	 u9u8nQivYgnym0VavQDaPJ4HO9CpiuMyS5zpGd8q+YzGwbUuuFqit/br502gWLIXMT
	 6EKwP5/6wAFXOf0O4FEgoeXp/Bfl58O9V02W5D3E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF33CF805A8;
	Fri, 21 Apr 2023 16:10:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ED76F80568; Fri, 21 Apr 2023 16:10:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E3ADF80533
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E3ADF80533
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0B99A24259;
	Fri, 21 Apr 2023 10:10:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-Dai-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ALSA: emu10k1: fix access to Audigy GPIO port
Date: Fri, 21 Apr 2023 16:10:01 +0200
Message-Id: <20230421141006.1005539-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XUGAUD3WOXRON4OLP6TIDR3CKSGZG2OD
X-Message-ID-Hash: XUGAUD3WOXRON4OLP6TIDR3CKSGZG2OD
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUGAUD3WOXRON4OLP6TIDR3CKSGZG2OD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As the register definition clearly states, this is a 16-bit register,
yet we did all accesses as 32-bit. The writes in particular would have
the potential to clear the TIMER register (depending on how the bus/card
actually handles the too long writes).

This commit also introduces a separate define A_GPIO which aliases
A_IOCFG, which better reflects the distinct usage on E-MU cards.
This is done in the same commit to keep the churn down, as we're
touching all involved lines anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  7 +++-
 sound/pci/emu10k1/emu10k1_main.c | 62 ++++++++++++++++----------------
 sound/pci/emu10k1/emumixer.c     | 14 ++++----
 sound/pci/emu10k1/io.c           | 14 ++++----
 4 files changed, 51 insertions(+), 46 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 01e2e22689bd..d6c4c290ad1d 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -251,11 +251,16 @@
 #define MUSTAT_IRDYN		0x80		/* 0 = MIDI data or command ACK			*/
 #define MUSTAT_ORDYN		0x40		/* 0 = MUDATA can accept a command or data	*/
 
-#define A_IOCFG			0x18		/* GPIO on Audigy card (16bits)			*/
+#define A_GPIO			0x18		/* GPIO on Audigy card (16bits)			*/
 #define A_GPINPUT_MASK		0xff00
 #define A_GPOUTPUT_MASK		0x00ff
 
+// The GPIO port is used for I/O config on Sound Blasters;
+// card-specific info can be found in the emu_chip_details table.
+// On E-MU cards the port is used as the interface to the FPGA.
+
 // Audigy output/GPIO stuff taken from the kX drivers
+#define A_IOCFG			A_GPIO
 #define A_IOCFG_GPOUT0		0x0044		/* analog/digital				*/
 #define A_IOCFG_DISABLE_ANALOG	0x0040		/* = 'enable' for Audigy2 (chiprev=4)		*/
 #define A_IOCFG_ENABLE_DIGITAL	0x0004
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 3880f359e688..bf1a261547d4 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -223,8 +223,8 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir, int resume)
 		 */
 		outl(0x7a0000, emu->port + 0x20);
 		outl(0xFF000000, emu->port + 0x24);
-		tmp = inl(emu->port + A_IOCFG) & ~0x8; /* Clear bit 3 */
-		outl(tmp, emu->port + A_IOCFG);
+		tmp = inw(emu->port + A_IOCFG) & ~0x8; /* Clear bit 3 */
+		outw(tmp, emu->port + A_IOCFG);
 	}
 	if (emu->card_capabilities->spi_dac) { /* Audigy 2 ZS Notebook with DAC Wolfson WM8768/WM8568 */
 		int size, n;
@@ -244,15 +244,15 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir, int resume)
 		 * GPIO6: Unknown
 		 * GPIO7: Unknown
 		 */
-		outl(0x76, emu->port + A_IOCFG); /* Windows uses 0x3f76 */
+		outw(0x76, emu->port + A_IOCFG); /* Windows uses 0x3f76 */
 	}
 	if (emu->card_capabilities->i2c_adc) { /* Audigy 2 ZS Notebook with ADC Wolfson WM8775 */
 		int size, n;
 
 		snd_emu10k1_ptr20_write(emu, P17V_I2S_SRC_SEL, 0, 0x2020205f);
-		tmp = inl(emu->port + A_IOCFG);
-		outl(tmp | 0x4, emu->port + A_IOCFG);  /* Set bit 2 for mic input */
-		tmp = inl(emu->port + A_IOCFG);
+		tmp = inw(emu->port + A_IOCFG);
+		outw(tmp | 0x4, emu->port + A_IOCFG);  /* Set bit 2 for mic input */
+		tmp = inw(emu->port + A_IOCFG);
 		size = ARRAY_SIZE(i2c_adc_init);
 		for (n = 0; n < size; n++)
 			snd_emu10k1_i2c_write(emu, i2c_adc_init[n][0], i2c_adc_init[n][1]);
@@ -308,12 +308,12 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir, int resume)
 		} else if (emu->card_capabilities->i2c_adc) {
 			;  /* Disable A_IOCFG for Audigy 2 ZS Notebook */
 		} else if (emu->audigy) {
-			unsigned int reg = inl(emu->port + A_IOCFG);
-			outl(reg | A_IOCFG_GPOUT2, emu->port + A_IOCFG);
+			u16 reg = inw(emu->port + A_IOCFG);
+			outw(reg | A_IOCFG_GPOUT2, emu->port + A_IOCFG);
 			udelay(500);
-			outl(reg | A_IOCFG_GPOUT1 | A_IOCFG_GPOUT2, emu->port + A_IOCFG);
+			outw(reg | A_IOCFG_GPOUT1 | A_IOCFG_GPOUT2, emu->port + A_IOCFG);
 			udelay(100);
-			outl(reg, emu->port + A_IOCFG);
+			outw(reg, emu->port + A_IOCFG);
 		} else {
 			unsigned int reg = inl(emu->port + HCFG);
 			outl(reg | HCFG_GPOUT2, emu->port + HCFG);
@@ -329,8 +329,8 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir, int resume)
 	} else if (emu->card_capabilities->i2c_adc) {
 		;  /* Disable A_IOCFG for Audigy 2 ZS Notebook */
 	} else if (emu->audigy) {	/* enable analog output */
-		unsigned int reg = inl(emu->port + A_IOCFG);
-		outl(reg | A_IOCFG_GPOUT0, emu->port + A_IOCFG);
+		u16 reg = inw(emu->port + A_IOCFG);
+		outw(reg | A_IOCFG_GPOUT0, emu->port + A_IOCFG);
 	}
 
 	if (emu->address_mode == 0) {
@@ -354,19 +354,19 @@ static void snd_emu10k1_audio_enable(struct snd_emu10k1 *emu)
 	} else if (emu->card_capabilities->i2c_adc) {
 		;  /* Disable A_IOCFG for Audigy 2 ZS Notebook */
 	} else if (emu->audigy) {
-		outl(inl(emu->port + A_IOCFG) & ~0x44, emu->port + A_IOCFG);
+		outw(inw(emu->port + A_IOCFG) & ~0x44, emu->port + A_IOCFG);
 
 		if (emu->card_capabilities->ca0151_chip) { /* audigy2 */
 			/* Unmute Analog now.  Set GPO6 to 1 for Apollo.
 			 * This has to be done after init ALice3 I2SOut beyond 48KHz.
 			 * So, sequence is important. */
-			outl(inl(emu->port + A_IOCFG) | 0x0040, emu->port + A_IOCFG);
+			outw(inw(emu->port + A_IOCFG) | 0x0040, emu->port + A_IOCFG);
 		} else if (emu->card_capabilities->ca0108_chip) { /* audigy2 value */
 			/* Unmute Analog now. */
-			outl(inl(emu->port + A_IOCFG) | 0x0060, emu->port + A_IOCFG);
+			outw(inw(emu->port + A_IOCFG) | 0x0060, emu->port + A_IOCFG);
 		} else {
 			/* Disable routing from AC97 line out to Front speakers */
-			outl(inl(emu->port + A_IOCFG) | 0x0080, emu->port + A_IOCFG);
+			outw(inw(emu->port + A_IOCFG) | 0x0080, emu->port + A_IOCFG);
 		}
 	}
 
@@ -651,9 +651,9 @@ static int snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
 				     const struct firmware *fw_entry)
 {
 	int n, i;
-	int reg;
-	int value;
-	__always_unused unsigned int write_post;
+	u16 reg;
+	u8 value;
+	__always_unused u16 write_post;
 	unsigned long flags;
 
 	if (!fw_entry)
@@ -666,28 +666,28 @@ static int snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
 	 * FPGA CONFIG OFF -> FPGA PGMN
 	 */
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outl(0x00, emu->port + A_IOCFG); /* Set PGMN low for 1uS. */
-	write_post = inl(emu->port + A_IOCFG);
+	outw(0x00, emu->port + A_GPIO); /* Set PGMN low for 1uS. */
+	write_post = inw(emu->port + A_GPIO);
 	udelay(100);
-	outl(0x80, emu->port + A_IOCFG); /* Leave bit 7 set during netlist setup. */
-	write_post = inl(emu->port + A_IOCFG);
+	outw(0x80, emu->port + A_GPIO); /* Leave bit 7 set during netlist setup. */
+	write_post = inw(emu->port + A_GPIO);
 	udelay(100); /* Allow FPGA memory to clean */
 	for (n = 0; n < fw_entry->size; n++) {
 		value = fw_entry->data[n];
 		for (i = 0; i < 8; i++) {
 			reg = 0x80;
 			if (value & 0x1)
 				reg = reg | 0x20;
 			value = value >> 1;
-			outl(reg, emu->port + A_IOCFG);
-			write_post = inl(emu->port + A_IOCFG);
-			outl(reg | 0x40, emu->port + A_IOCFG);
-			write_post = inl(emu->port + A_IOCFG);
+			outw(reg, emu->port + A_GPIO);
+			write_post = inw(emu->port + A_GPIO);
+			outw(reg | 0x40, emu->port + A_GPIO);
+			write_post = inw(emu->port + A_GPIO);
 		}
 	}
 	/* After programming, set GPIO bit 4 high again. */
-	outl(0x10, emu->port + A_IOCFG);
-	write_post = inl(emu->port + A_IOCFG);
+	outw(0x10, emu->port + A_GPIO);
+	write_post = inw(emu->port + A_GPIO);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 
 	return 0;
@@ -2054,7 +2054,7 @@ void snd_emu10k1_suspend_regs(struct snd_emu10k1 *emu)
 				*val = snd_emu10k1_ptr_read(emu, *reg, i);
 	}
 	if (emu->audigy)
-		emu->saved_a_iocfg = inl(emu->port + A_IOCFG);
+		emu->saved_a_iocfg = inw(emu->port + A_IOCFG);
 	emu->saved_hcfg = inl(emu->port + HCFG);
 }
 
@@ -2081,7 +2081,7 @@ void snd_emu10k1_resume_regs(struct snd_emu10k1 *emu)
 
 	/* resore for spdif */
 	if (emu->audigy)
-		outl(emu->saved_a_iocfg, emu->port + A_IOCFG);
+		outw(emu->saved_a_iocfg, emu->port + A_IOCFG);
 	outl(emu->saved_hcfg, emu->port + HCFG);
 
 	val = emu->saved_ptr;
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 3c115f8ab96c..754d91050af2 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -924,7 +924,7 @@ static int snd_audigy_i2c_capture_source_put(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int source_id;
 	unsigned int ngain, ogain;
-	u32 gpio;
+	u16 gpio;
 	int change = 0;
 	unsigned long flags;
 	u32 source;
@@ -941,11 +941,11 @@ static int snd_audigy_i2c_capture_source_put(struct snd_kcontrol *kcontrol,
 	if (change) {
 		snd_emu10k1_i2c_write(emu, ADC_MUX, 0); /* Mute input */
 		spin_lock_irqsave(&emu->emu_lock, flags);
-		gpio = inl(emu->port + A_IOCFG);
+		gpio = inw(emu->port + A_IOCFG);
 		if (source_id==0)
-			outl(gpio | 0x4, emu->port + A_IOCFG);
+			outw(gpio | 0x4, emu->port + A_IOCFG);
 		else
-			outl(gpio & ~0x4, emu->port + A_IOCFG);
+			outw(gpio & ~0x4, emu->port + A_IOCFG);
 		spin_unlock_irqrestore(&emu->emu_lock, flags);
 
 		ngain = emu->i2c_capture_volume[source_id][0]; /* Left */
@@ -1632,7 +1632,7 @@ static int snd_emu10k1_shared_spdif_get(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 
 	if (emu->audigy)
-		ucontrol->value.integer.value[0] = inl(emu->port + A_IOCFG) & A_IOCFG_GPOUT0 ? 1 : 0;
+		ucontrol->value.integer.value[0] = inw(emu->port + A_IOCFG) & A_IOCFG_GPOUT0 ? 1 : 0;
 	else
 		ucontrol->value.integer.value[0] = inl(emu->port + HCFG) & HCFG_GPOUT0 ? 1 : 0;
 	if (emu->card_capabilities->invert_shared_spdif)
@@ -1657,13 +1657,13 @@ static int snd_emu10k1_shared_spdif_put(struct snd_kcontrol *kcontrol,
 	if ( emu->card_capabilities->i2c_adc) {
 		/* Do nothing for Audigy 2 ZS Notebook */
 	} else if (emu->audigy) {
-		reg = inl(emu->port + A_IOCFG);
+		reg = inw(emu->port + A_IOCFG);
 		val = sw ? A_IOCFG_GPOUT0 : 0;
 		change = (reg & A_IOCFG_GPOUT0) != val;
 		if (change) {
 			reg &= ~A_IOCFG_GPOUT0;
 			reg |= val;
-			outl(reg | val, emu->port + A_IOCFG);
+			outw(reg | val, emu->port + A_IOCFG);
 		}
 	}
 	reg = inl(emu->port + HCFG);
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 35bc73d99d04..f0134689c320 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -243,28 +243,28 @@ void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
 	if (snd_BUG_ON(value > 0x3f)) /* 0 to 0x3f are values */
 		return;
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outl(reg, emu->port + A_IOCFG);
+	outw(reg, emu->port + A_GPIO);
 	udelay(10);
-	outl(reg | 0x80, emu->port + A_IOCFG);  /* High bit clocks the value into the fpga. */
+	outw(reg | 0x80, emu->port + A_GPIO);  /* High bit clocks the value into the fpga. */
 	udelay(10);
-	outl(value, emu->port + A_IOCFG);
+	outw(value, emu->port + A_GPIO);
 	udelay(10);
-	outl(value | 0x80 , emu->port + A_IOCFG);  /* High bit clocks the value into the fpga. */
+	outw(value | 0x80 , emu->port + A_GPIO);  /* High bit clocks the value into the fpga. */
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
 {
 	unsigned long flags;
 	if (snd_BUG_ON(reg > 0x3f))
 		return;
 	reg += 0x40; /* 0x40 upwards are registers. */
 	spin_lock_irqsave(&emu->emu_lock, flags);
-	outl(reg, emu->port + A_IOCFG);
+	outw(reg, emu->port + A_GPIO);
 	udelay(10);
-	outl(reg | 0x80, emu->port + A_IOCFG);  /* High bit clocks the value into the fpga. */
+	outw(reg | 0x80, emu->port + A_GPIO);  /* High bit clocks the value into the fpga. */
 	udelay(10);
-	*value = ((inl(emu->port + A_IOCFG) >> 8) & 0x7f);
+	*value = ((inw(emu->port + A_GPIO) >> 8) & 0x7f);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
-- 
2.40.0.152.g15d061e6df

