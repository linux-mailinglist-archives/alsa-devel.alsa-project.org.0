Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CF56F14E0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:01:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE43D12AD;
	Fri, 28 Apr 2023 12:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE43D12AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676104;
	bh=z6Th2vrPzHemAnYUPIYWiwI1tA2Cf9wzTwGfKIUDKD0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KRGmBAlgI+aMjKjPpx62wSdSRakpobA0dOdEzUeG98k/ypdD3gNrl+h4HVhrQBWay
	 njhUeixtha68kJpomjVygfAZTX107Gc6169KN7Oz0gSQn5Xk/kGXC3dnk7XmaULI8r
	 pxE2ZDs4ZkZj8tmd9fQ/35SAnEXKTPxXH1/eX2DI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F8FDF80533;
	Fri, 28 Apr 2023 12:00:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DAE3F80548; Fri, 28 Apr 2023 12:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C5C0F8025F
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C5C0F8025F
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 93419241FF;
	Fri, 28 Apr 2023 05:59:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9sW-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: macro-ize snd_emu10k1_ptr_{read,write}()
Date: Fri, 28 Apr 2023 11:59:41 +0200
Message-Id: <20230428095941.1706263-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2QWMJNV5VA2C7PIIGGYWQ6H3X3KIZEN2
X-Message-ID-Hash: 2QWMJNV5VA2C7PIIGGYWQ6H3X3KIZEN2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QWMJNV5VA2C7PIIGGYWQ6H3X3KIZEN2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The idea to encode the bitfield manipulation in the register address is
quite clever, but it's somewhat wasteful to do these calculations at
runtime, given that they are all constants. Change that.

The added bitfield manipulation macros will be used separately as well.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h     |  29 ++++++++-
 sound/pci/emu10k1/emupcm.c  |  31 +++++-----
 sound/pci/emu10k1/emuproc.c |   4 +-
 sound/pci/emu10k1/io.c      | 116 +++++++++++++++++-------------------
 4 files changed, 99 insertions(+), 81 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 8fe80dcee71b..fd1fe49578ce 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1773,8 +1773,33 @@ int snd_emu10k1_fx8010_tram_setup(struct snd_emu10k1 *emu, u32 size);
 int snd_emu10k1_done(struct snd_emu10k1 * emu);
 
 /* I/O functions */
-unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn);
-void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
+
+#define REG_SHIFT(r) (((r) >> 16) & 0x1f)
+#define REG_SIZE(r) (((r) >> 24) & 0x1f)
+#define REG_MASK0(r) ((1U << REG_SIZE(r)) - 1U)
+#define REG_MASK(r) (REG_MASK0(r) << REG_SHIFT(r))
+#define REG_ADDR(r, v) ((((r) & 0xffff) << 16) | (v))
+#define REG_VAL_GET(r, v) ((v & REG_MASK(r)) >> REG_SHIFT(r))
+#define REG_VAL_PUT(r, v) ((v) << REG_SHIFT(r))
+#define snd_emu10k1_ptr_read(emu, reg, voice) \
+	({ \
+		u32 data = snd_emu10k1_ptr_read_raw(emu, REG_ADDR(reg, voice)); \
+		if (REG_SIZE(reg)) \
+			data = REG_VAL_GET(reg, data); \
+		data; \
+	})
+#define snd_emu10k1_ptr_write(emu, reg, voice, data) \
+	do { \
+		if (REG_SIZE(reg)) \
+			snd_emu10k1_ptr_modify(emu, REG_ADDR(reg, voice), \
+					       ~REG_MASK(reg), REG_VAL_PUT(reg, data)); \
+		else \
+			snd_emu10k1_ptr_write_raw(emu, REG_ADDR(reg, voice), data); \
+	} while (0)
+
+u32 snd_emu10k1_ptr_read_raw(struct snd_emu10k1 *emu, u32 reg);
+void snd_emu10k1_ptr_write_raw(struct snd_emu10k1 *emu, u32 reg, u32 data);
+void snd_emu10k1_ptr_modify(struct snd_emu10k1 *emu, u32 reg, u32 and_mask, u32 or_mask);
 unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn);
 void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
 int snd_emu10k1_spi_write(struct snd_emu10k1 * emu, unsigned int data);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b0c0ef342756..2baa7f01eb5b 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -528,7 +528,7 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 	int idx;
 
 	/* zeroing the buffer size will stop capture */
-	snd_emu10k1_ptr_write(emu, epcm->capture_bs_reg, 0, 0);
+	snd_emu10k1_ptr_write_raw(emu, epcm->capture_bs_reg, 0);
 	switch (epcm->type) {
 	case CAPTURE_AC97ADC:
 		snd_emu10k1_ptr_write(emu, ADCCR, 0, 0);
@@ -543,7 +543,7 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 	default:
 		break;
 	}	
-	snd_emu10k1_ptr_write(emu, epcm->capture_ba_reg, 0, runtime->dma_addr);
+	snd_emu10k1_ptr_write_raw(emu, epcm->capture_ba_reg, runtime->dma_addr);
 	epcm->capture_bufsize = snd_pcm_lib_buffer_bytes(substream);
 	epcm->capture_bs_val = 0;
 	for (idx = 0; idx < 31; idx++) {
@@ -771,16 +771,16 @@ static int snd_emu10k1_capture_trigger(struct snd_pcm_substream *substream,
 		default:	
 			break;
 		}
-		snd_emu10k1_ptr_write(emu, epcm->capture_bs_reg, 0, epcm->capture_bs_val);
+		snd_emu10k1_ptr_write_raw(emu, epcm->capture_bs_reg, epcm->capture_bs_val);
 		epcm->running = 1;
 		epcm->first_ptr = 1;
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		epcm->running = 0;
 		snd_emu10k1_intr_disable(emu, epcm->capture_inte);
 		outl(epcm->capture_ipr, emu->port + IPR);
-		snd_emu10k1_ptr_write(emu, epcm->capture_bs_reg, 0, 0);
+		snd_emu10k1_ptr_write_raw(emu, epcm->capture_bs_reg, 0);
 		switch (epcm->type) {
 		case CAPTURE_AC97ADC:
 			snd_emu10k1_ptr_write(emu, ADCCR, 0, 0);
@@ -812,7 +812,7 @@ static snd_pcm_uframes_t snd_emu10k1_playback_pointer(struct snd_pcm_substream *
 
 	if (!epcm->running)
 		return 0;
-	ptr = snd_emu10k1_ptr_read(emu, CCCA, epcm->voices[0]->number) & 0x00ffffff;
+	ptr = snd_emu10k1_ptr_read(emu, CCCA_CURRADDR, epcm->voices[0]->number);
 #if 0	/* Perex's code */
 	ptr += runtime->buffer_size;
 	ptr -= epcm->ccca_start_addr;
@@ -899,7 +899,8 @@ static snd_pcm_uframes_t snd_emu10k1_capture_pointer(struct snd_pcm_substream *s
 		udelay(50);	/* hack, it takes awhile until capture is started */
 		epcm->first_ptr = 0;
 	}
-	ptr = snd_emu10k1_ptr_read(emu, epcm->capture_idx_reg, 0) & 0x0000ffff;
+	ptr = REG_VAL_GET(FXIDX_IDX,  // All *IDX_MASKs are assumed to be equal
+			snd_emu10k1_ptr_read_raw(emu, epcm->capture_idx_reg));
 	return bytes_to_frames(runtime, ptr);
 }
 
@@ -1128,9 +1129,9 @@ static int snd_emu10k1_capture_open(struct snd_pcm_substream *substream)
 	epcm->substream = substream;
 	epcm->capture_ipr = IPR_ADCBUFFULL|IPR_ADCBUFHALFFULL;
 	epcm->capture_inte = INTE_ADCBUFENABLE;
-	epcm->capture_ba_reg = ADCBA;
-	epcm->capture_bs_reg = ADCBS;
-	epcm->capture_idx_reg = emu->audigy ? A_ADCIDX : ADCIDX;
+	epcm->capture_ba_reg = REG_ADDR(ADCBA, 0);
+	epcm->capture_bs_reg = REG_ADDR(ADCBS, 0);
+	epcm->capture_idx_reg = emu->audigy ? REG_ADDR(A_ADCIDX, 0) : REG_ADDR(ADCIDX, 0);
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture;
@@ -1164,9 +1165,9 @@ static int snd_emu10k1_capture_mic_open(struct snd_pcm_substream *substream)
 	epcm->substream = substream;
 	epcm->capture_ipr = IPR_MICBUFFULL|IPR_MICBUFHALFFULL;
 	epcm->capture_inte = INTE_MICBUFENABLE;
-	epcm->capture_ba_reg = MICBA;
-	epcm->capture_bs_reg = MICBS;
-	epcm->capture_idx_reg = emu->audigy ? A_MICIDX : MICIDX;
+	epcm->capture_ba_reg = REG_ADDR(MICBA, 0);
+	epcm->capture_bs_reg = REG_ADDR(MICBS, 0);
+	epcm->capture_idx_reg = emu->audigy ? REG_ADDR(A_MICIDX, 0) : REG_ADDR(MICIDX, 0);
 	substream->runtime->private_data = epcm;
 	substream->runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture;
@@ -1204,9 +1205,9 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	epcm->substream = substream;
 	epcm->capture_ipr = IPR_EFXBUFFULL|IPR_EFXBUFHALFFULL;
 	epcm->capture_inte = INTE_EFXBUFENABLE;
-	epcm->capture_ba_reg = FXBA;
-	epcm->capture_bs_reg = FXBS;
-	epcm->capture_idx_reg = FXIDX;
+	epcm->capture_ba_reg = REG_ADDR(FXBA, 0);
+	epcm->capture_bs_reg = REG_ADDR(FXBS, 0);
+	epcm->capture_idx_reg = REG_ADDR(FXIDX, 0);
 	substream->runtime->private_data = epcm;
 	substream->runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture_efx;
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index bec72dc60a41..3a7f60d64c27 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -23,8 +23,8 @@
 static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 					  struct snd_info_buffer *buffer,
 					  char *title,
-					  int status_reg,
-					  int rate_reg)
+					  u8 status_reg,
+					  u8 rate_reg)
 {
 	static const char * const clkaccy[4] = { "1000ppm", "50ppm", "variable", "unknown" };
 	static const int samplerate[16] = { 44100, 1, 48000, 32000, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index c60573f14ea8..373c633bd88b 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -18,72 +18,64 @@
 #include <linux/export.h>
 #include "p17v.h"
 
-unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn)
+static inline int check_ptr_reg(struct snd_emu10k1 *emu, u32 reg)
 {
-	unsigned long flags;
-	unsigned int regptr, val;
-	unsigned int mask;
-
-	mask = emu->audigy ? A_PTR_ADDRESS_MASK : PTR_ADDRESS_MASK;
-	regptr = ((reg << 16) & mask) | (chn & PTR_CHANNELNUM_MASK);
-
-	if (reg & 0xff000000) {
-		unsigned char size, offset;
-		
-		size = (reg >> 24) & 0x3f;
-		offset = (reg >> 16) & 0x1f;
-		mask = ((1 << size) - 1) << offset;
-		
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		val = inl(emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
-		
-		return (val & mask) >> offset;
-	} else {
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		val = inl(emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
-		return val;
-	}
-}
-
-EXPORT_SYMBOL(snd_emu10k1_ptr_read);
-
-void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data)
-{
-	unsigned int regptr;
-	unsigned long flags;
-	unsigned int mask;
-
 	if (snd_BUG_ON(!emu))
-		return;
-	mask = emu->audigy ? A_PTR_ADDRESS_MASK : PTR_ADDRESS_MASK;
-	regptr = ((reg << 16) & mask) | (chn & PTR_CHANNELNUM_MASK);
-
-	if (reg & 0xff000000) {
-		unsigned char size, offset;
-
-		size = (reg >> 24) & 0x3f;
-		offset = (reg >> 16) & 0x1f;
-		mask = ((1 << size) - 1) << offset;
-		data = (data << offset) & mask;
-
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		data |= inl(emu->port + DATA) & ~mask;
-		outl(data, emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);		
-	} else {
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		outl(data, emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
-	}
+		return 0;
+	if (snd_BUG_ON(reg & 0xffff0000 & (emu->audigy ? ~A_PTR_ADDRESS_MASK : ~PTR_ADDRESS_MASK)))
+		return 0;
+	if (snd_BUG_ON(reg & 0xffff & ~PTR_CHANNELNUM_MASK))
+		return 0;
+	return 1;
 }
 
-EXPORT_SYMBOL(snd_emu10k1_ptr_write);
+unsigned int snd_emu10k1_ptr_read_raw(struct snd_emu10k1 *emu, u32 reg)
+{
+	unsigned long flags;
+	u32 val;
+
+	if (!check_ptr_reg(emu, reg))
+		return 0;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(reg, emu->port + PTR);
+	val = inl(emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+	return val;
+}
+
+EXPORT_SYMBOL(snd_emu10k1_ptr_read_raw);
+
+void snd_emu10k1_ptr_write_raw(struct snd_emu10k1 *emu, u32 reg, u32 data)
+{
+	unsigned long flags;
+
+	if (!check_ptr_reg(emu, reg))
+		return;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(reg, emu->port + PTR);
+	outl(data, emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+}
+
+EXPORT_SYMBOL(snd_emu10k1_ptr_write_raw);
+
+void snd_emu10k1_ptr_modify(struct snd_emu10k1 *emu, u32 reg, u32 and_mask, u32 or_mask)
+{
+	unsigned long flags;
+
+	if (!check_ptr_reg(emu, reg))
+		return;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(reg, emu->port + PTR);
+	or_mask |= inl(emu->port + DATA) & and_mask;
+	outl(or_mask, emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+}
+
+EXPORT_SYMBOL(snd_emu10k1_ptr_modify);
 
 unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, 
 					  unsigned int reg, 
-- 
2.40.0.152.g15d061e6df

