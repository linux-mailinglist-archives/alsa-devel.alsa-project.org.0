Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3574539F8C8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D429D1791;
	Tue,  8 Jun 2021 16:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D429D1791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161838;
	bh=Z7U7H9KVK14owLdwNBKPTO4zuzhMbDEG7l3TsT7ltAw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOMq2s57l2tMgZhd45gdbCmGKlXehi3XJoMrNuQz0NrHUoQjbLMN2+hZIFvMERWcc
	 i8BZ2ib4onC3WlG8IvSjHWvBRWctUjl1Dcom3foBWRhG/NW5fYhwzccomn+U/x4zOc
	 lGec8bCuEnXpdbFXv5sNzQgXkcPlNskcjuSDJ6TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 909B7F805F4;
	Tue,  8 Jun 2021 16:06:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E9D8F805C9; Tue,  8 Jun 2021 16:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D080F804E0
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D080F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="NbtSztIv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/2LR15/h"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 136521FDE5
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16r9B/6Im4/3mQxUNyAsbqfcLxqSJ+j2o/5LIqvA/GY=;
 b=NbtSztIvVUrTr1niZNW4u/X44/a8Syk/bZHf70LbmEagjtDtVsKQypc/yU5bP7rbpXvaAR
 8ygH06TPhu+hIoaOLmGzshdPDK421FXR9AL98TWnLFgvnP1xaQlmkmmKP+Wp20TKC4RkmB
 B6CfohqFxETK2PPMPnofTibLJK6JUE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16r9B/6Im4/3mQxUNyAsbqfcLxqSJ+j2o/5LIqvA/GY=;
 b=/2LR15/hS30YuTqcppObtmb3eUEljgMt4fpANOiQx/7sgwmPX5IZq/TGfDX2CPNBJw6E7b
 5gvrGB9lJTWNPqCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 03006A3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 28/66] ALSA: intel8x0: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:02 +0200
Message-Id: <20210608140540.17885-29-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

PCI intel8x0 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 46 ++++++++++++++++++++++++++++---------------
 sound/pci/intel8x0m.c | 36 ++++++++++++++++++++++-----------
 2 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index abc710ae3226..2d1bfbcba933 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -538,7 +538,8 @@ static unsigned short snd_intel8x0_codec_read(struct snd_ac97 *ac97,
 		res = 0xffff;
 	} else {
 		res = iagetword(chip, reg + ac97->num * 0x80);
-		if ((tmp = igetdword(chip, ICHREG(GLOB_STA))) & ICH_RCS) {
+		tmp = igetdword(chip, ICHREG(GLOB_STA));
+		if (tmp & ICH_RCS) {
 			/* reset RCS and preserve other R/WC bits */
 			iputdword(chip, ICHREG(GLOB_STA), tmp &
 				  ~(chip->codec_ready_bits | ICH_GSCI));
@@ -559,7 +560,8 @@ static void snd_intel8x0_codec_read_test(struct intel8x0 *chip,
 
 	if (snd_intel8x0_codec_semaphore(chip, codec) >= 0) {
 		iagetword(chip, codec * 0x80);
-		if ((tmp = igetdword(chip, ICHREG(GLOB_STA))) & ICH_RCS) {
+		tmp = igetdword(chip, ICHREG(GLOB_STA));
+		if (tmp & ICH_RCS) {
 			/* reset RCS and preserve other R/WC bits */
 			iputdword(chip, ICHREG(GLOB_STA), tmp &
 				  ~(chip->codec_ready_bits | ICH_GSCI));
@@ -1105,7 +1107,8 @@ static int snd_intel8x0_pcm_open(struct snd_pcm_substream *substream, struct ich
 		runtime->hw.buffer_bytes_max = 64*1024;
 		runtime->hw.period_bytes_max = 64*1024;
 	}
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 	runtime->private_data = ichdev;
 	return 0;
@@ -2190,7 +2193,8 @@ static int snd_intel8x0_mixer(struct intel8x0 *chip, int ac97_clock,
 			udelay(1);
 		}
 	}
-	if ((err = snd_ac97_bus(chip->card, 0, ops, chip, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, ops, chip, &pbus);
+	if (err < 0)
 		goto __err;
 	pbus->private_free = snd_intel8x0_mixer_free_ac97_bus;
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
@@ -2206,7 +2210,8 @@ static int snd_intel8x0_mixer(struct intel8x0 *chip, int ac97_clock,
 	ac97.pci = chip->pci;
 	for (i = 0; i < codecs; i++) {
 		ac97.num = i;
-		if ((err = snd_ac97_mixer(pbus, &ac97, &chip->ac97[i])) < 0) {
+		err = snd_ac97_mixer(pbus, &ac97, &chip->ac97[i]);
+		if (err < 0) {
 			if (err != -EACCES)
 				dev_err(chip->card->dev,
 					"Unable to initialize codec #%d\n", i);
@@ -2491,11 +2496,13 @@ static int snd_intel8x0_chip_init(struct intel8x0 *chip, int probing)
 	int err;
 	
 	if (chip->device_type != DEVICE_ALI) {
-		if ((err = snd_intel8x0_ich_chip_init(chip, probing)) < 0)
+		err = snd_intel8x0_ich_chip_init(chip, probing);
+		if (err < 0)
 			return err;
 		iagetword(chip, 0);	/* clear semaphore flag */
 	} else {
-		if ((err = snd_intel8x0_ali_chip_init(chip, probing)) < 0)
+		err = snd_intel8x0_ali_chip_init(chip, probing);
+		if (err < 0)
 			return err;
 	}
 
@@ -2918,7 +2925,8 @@ static int snd_intel8x0_create(struct snd_card *card,
 
 	*r_intel8x0 = NULL;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
@@ -2950,7 +2958,8 @@ static int snd_intel8x0_create(struct snd_card *card,
 	    pci->device == PCI_DEVICE_ID_INTEL_440MX)
 		chip->fix_nocache = 1; /* enable workaround */
 
-	if ((err = pci_request_regions(pci, card->shortname)) < 0) {
+	err = pci_request_regions(pci, card->shortname);
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -3064,7 +3073,8 @@ static int snd_intel8x0_create(struct snd_card *card,
 	for (i = 0; i < chip->max_codecs; i++)
 		chip->codec_isr_bits |= chip->codec_bit[i];
 
-	if ((err = snd_intel8x0_chip_init(chip, 1)) < 0) {
+	err = snd_intel8x0_chip_init(chip, 1);
+	if (err < 0) {
 		snd_intel8x0_free(chip);
 		return err;
 	}
@@ -3079,7 +3089,8 @@ static int snd_intel8x0_create(struct snd_card *card,
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_intel8x0_free(chip);
 		return err;
 	}
@@ -3186,18 +3197,20 @@ static int snd_intel8x0_probe(struct pci_dev *pci,
 			buggy_irq = 0;
 	}
 
-	if ((err = snd_intel8x0_create(card, pci, pci_id->driver_data,
-				       &chip)) < 0) {
+	err = snd_intel8x0_create(card, pci, pci_id->driver_data, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	card->private_data = chip;
 
-	if ((err = snd_intel8x0_mixer(chip, ac97_clock, ac97_quirk)) < 0) {
+	err = snd_intel8x0_mixer(chip, ac97_clock, ac97_quirk);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_intel8x0_pcm(chip)) < 0) {
+	err = snd_intel8x0_pcm(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -3217,7 +3230,8 @@ static int snd_intel8x0_probe(struct pci_dev *pci,
 		}
 	}
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 6793c1ffa71b..b96fce6cbd83 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -342,7 +342,8 @@ static unsigned short snd_intel8x0m_codec_read(struct snd_ac97 *ac97,
 		res = 0xffff;
 	} else {
 		res = iagetword(chip, reg + ac97->num * 0x80);
-		if ((tmp = igetdword(chip, ICHREG(GLOB_STA))) & ICH_RCS) {
+		tmp = igetdword(chip, ICHREG(GLOB_STA));
+		if (tmp & ICH_RCS) {
 			/* reset RCS and preserve other R/WC bits */
 			iputdword(chip, ICHREG(GLOB_STA),
 				  tmp & ~(ICH_SRI|ICH_PRI|ICH_TRI|ICH_GSCI));
@@ -800,7 +801,8 @@ static int snd_intel8x0m_mixer(struct intel8x0m *chip, int ac97_clock)
 
 	glob_sta = igetdword(chip, ICHREG(GLOB_STA));
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus);
+	if (err < 0)
 		goto __err;
 	pbus->private_free = snd_intel8x0m_mixer_free_ac97_bus;
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
@@ -809,7 +811,8 @@ static int snd_intel8x0m_mixer(struct intel8x0m *chip, int ac97_clock)
 
 	ac97.pci = chip->pci;
 	ac97.num = glob_sta & ICH_SCR ? 1 : 0;
-	if ((err = snd_ac97_mixer(pbus, &ac97, &x97)) < 0) {
+	err = snd_ac97_mixer(pbus, &ac97, &x97);
+	if (err < 0) {
 		dev_err(chip->card->dev,
 			"Unable to initialize codec #%d\n", ac97.num);
 		if (ac97.num == 0)
@@ -927,7 +930,8 @@ static int snd_intel8x0m_chip_init(struct intel8x0m *chip, int probing)
 	unsigned int i;
 	int err;
 	
-	if ((err = snd_intel8x0m_ich_chip_init(chip, probing)) < 0)
+	err = snd_intel8x0m_ich_chip_init(chip, probing);
+	if (err < 0)
 		return err;
 	iagetword(chip, 0);	/* clear semaphore flag */
 
@@ -1075,7 +1079,8 @@ static int snd_intel8x0m_create(struct snd_card *card,
 
 	*r_intel8x0m = NULL;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
@@ -1089,7 +1094,8 @@ static int snd_intel8x0m_create(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	if ((err = pci_request_regions(pci, card->shortname)) < 0) {
+	err = pci_request_regions(pci, card->shortname);
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -1167,7 +1173,8 @@ static int snd_intel8x0m_create(struct snd_card *card,
 
 	pci_set_master(pci);
 
-	if ((err = snd_intel8x0m_chip_init(chip, 1)) < 0) {
+	err = snd_intel8x0m_chip_init(chip, 1);
+	if (err < 0) {
 		snd_intel8x0m_free(chip);
 		return err;
 	}
@@ -1181,7 +1188,8 @@ static int snd_intel8x0m_create(struct snd_card *card,
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_intel8x0m_free(chip);
 		return err;
 	}
@@ -1238,17 +1246,20 @@ static int snd_intel8x0m_probe(struct pci_dev *pci,
 	}
 	strcat(card->shortname," Modem");
 
-	if ((err = snd_intel8x0m_create(card, pci, pci_id->driver_data, &chip)) < 0) {
+	err = snd_intel8x0m_create(card, pci, pci_id->driver_data, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	card->private_data = chip;
 
-	if ((err = snd_intel8x0m_mixer(chip, ac97_clock)) < 0) {
+	err = snd_intel8x0m_mixer(chip, ac97_clock);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_intel8x0m_pcm(chip)) < 0) {
+	err = snd_intel8x0m_pcm(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1258,7 +1269,8 @@ static int snd_intel8x0m_probe(struct pci_dev *pci,
 	sprintf(card->longname, "%s at irq %i",
 		card->shortname, chip->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

