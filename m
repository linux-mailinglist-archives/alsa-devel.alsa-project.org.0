Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A12539F8C2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1BB1712;
	Tue,  8 Jun 2021 16:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1BB1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161796;
	bh=UKyriRLQRoXzczcsoL8rAtltcz0aUq2nWrn2q49jL/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0gBJX/dpb1xMO9fH4uu1/Ebk+r2IPGsAcO4DqbP2c/z7lXea2gLvDnQFkw/AyNgh
	 f28YRs7zNj/ZB1451LHDnEMhC5SiPatlrN/6jm/cctTrV5mSXsfnj5cGoCw7wLhyiL
	 +/dA/7hBlkPDEKrXKwu/cTDlKdRfM7K3TZ18C+JI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BC0EF805F0;
	Tue,  8 Jun 2021 16:06:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8985F805B5; Tue,  8 Jun 2021 16:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 436DAF804D9
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 436DAF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="GW0ifhGp"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="hp1G6miH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5412A1FDE8
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RF3Iz2pRT4QTf36x7UpZxlv/CUB+SbuOxbVWYas+pgA=;
 b=GW0ifhGpzK8HES93mzPjKuqzJ8bvJ3K8N1Zp91VqQ+/ZqolDBZgp+bAee6SyU+vomaddDP
 MhYmiZULVWlCFlxyTdInBFG76A7F0cM29GSPq8BeETCmQsvTXhgrlI5zMXuW1pdGLabb0E
 wU5hMTohWtnXYt8N+K3oBFtiF30JCcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RF3Iz2pRT4QTf36x7UpZxlv/CUB+SbuOxbVWYas+pgA=;
 b=hp1G6miHgnPeHaRrR76HvP/Ob9+SSxDgUhzTEBkl+YSfqHWESulw+AuysvVv26QylSX98N
 57e+eFQbSa1nBUCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 42BB3A3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 33/66] ALSA: via82xx: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:07 +0200
Message-Id: <20210608140540.17885-34-tiwai@suse.de>
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

PCI VIA82xx driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 78 +++++++++++++++++++++++++--------------
 sound/pci/via82xx_modem.c | 52 +++++++++++++++++---------
 2 files changed, 85 insertions(+), 45 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index fd1f2f9cfbc3..943813a06abc 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -515,7 +515,8 @@ static int snd_via82xx_codec_ready(struct via82xx *chip, int secondary)
 	
 	while (timeout-- > 0) {
 		udelay(1);
-		if (!((val = snd_via82xx_codec_xread(chip)) & VIA_REG_AC97_BUSY))
+		val = snd_via82xx_codec_xread(chip);
+		if (!(val & VIA_REG_AC97_BUSY))
 			return val & 0xffff;
 	}
 	dev_err(chip->card->dev, "codec_ready: codec %i is not ready [0x%x]\n",
@@ -1023,7 +1024,8 @@ static int snd_via8233_playback_prepare(struct snd_pcm_substream *substream)
 	int rate_changed;
 	u32 rbits;
 
-	if ((rate_changed = via_lock_rate(&chip->rates[0], ac97_rate)) < 0)
+	rate_changed = via_lock_rate(&chip->rates[0], ac97_rate);
+	if (rate_changed < 0)
 		return rate_changed;
 	if (rate_changed)
 		snd_ac97_set_rate(chip->ac97, AC97_PCM_FRONT_DAC_RATE,
@@ -1197,7 +1199,8 @@ static int snd_via82xx_pcm_open(struct via82xx *chip, struct viadev *viadev,
 
 	/* we may remove following constaint when we modify table entries
 	   in interrupt */
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 
 	if (use_src) {
@@ -1222,7 +1225,8 @@ static int snd_via686_playback_open(struct snd_pcm_substream *substream)
 	struct viadev *viadev = &chip->devs[chip->playback_devno + substream->number];
 	int err;
 
-	if ((err = snd_via82xx_pcm_open(chip, viadev, substream)) < 0)
+	err = snd_via82xx_pcm_open(chip, viadev, substream);
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -1238,7 +1242,8 @@ static int snd_via8233_playback_open(struct snd_pcm_substream *substream)
 	int err;
 
 	viadev = &chip->devs[chip->playback_devno + substream->number];
-	if ((err = snd_via82xx_pcm_open(chip, viadev, substream)) < 0)
+	err = snd_via82xx_pcm_open(chip, viadev, substream);
+	if (err < 0)
 		return err;
 	stream = viadev->reg_offset / 0x10;
 	if (chip->dxs_controls[stream]) {
@@ -1275,7 +1280,8 @@ static int snd_via8233_multi_open(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	if ((err = snd_via82xx_pcm_open(chip, viadev, substream)) < 0)
+	err = snd_via82xx_pcm_open(chip, viadev, substream);
+	if (err < 0)
 		return err;
 	substream->runtime->hw.channels_max = 6;
 	if (chip->revision == VIA_REV_8233A)
@@ -1875,7 +1881,8 @@ static int snd_via82xx_mixer_new(struct via82xx *chip, const char *quirk_overrid
 		.wait = snd_via82xx_codec_wait,
 	};
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus);
+	if (err < 0)
 		return err;
 	chip->ac97_bus->private_free = snd_via82xx_mixer_free_ac97_bus;
 	chip->ac97_bus->clock = chip->ac97_clock;
@@ -1885,7 +1892,8 @@ static int snd_via82xx_mixer_new(struct via82xx *chip, const char *quirk_overrid
 	ac97.private_free = snd_via82xx_mixer_free_ac97;
 	ac97.pci = chip->pci;
 	ac97.scaps = AC97_SCAP_SKIP_MODEM | AC97_SCAP_POWER_SAVE;
-	if ((err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 
 	snd_ac97_tune_hardware(chip->ac97, ac97_quirks, quirk_override);
@@ -2054,9 +2062,9 @@ static int snd_via686_init_misc(struct via82xx *chip)
 			break;
 		}
 	}
-	if (mpu_port >= 0x200 &&
-	    (chip->mpu_res = request_region(mpu_port, 2, "VIA82xx MPU401"))
-	    != NULL) {
+	if (mpu_port >= 0x200)
+		chip->mpu_res = request_region(mpu_port, 2, "VIA82xx MPU401");
+	if (chip->mpu_res) {
 		if (rev_h)
 			legacy |= VIA_FUNC_MIDI_PNP;	/* enable PCI I/O 2 */
 		legacy |= VIA_FUNC_ENABLE_MIDI;
@@ -2173,7 +2181,8 @@ static int snd_via82xx_chip_init(struct via82xx *chip)
 		schedule_timeout_uninterruptible(1);
 	} while (time_before(jiffies, end_time));
 
-	if ((val = snd_via82xx_codec_xread(chip)) & VIA_REG_AC97_BUSY)
+	val = snd_via82xx_codec_xread(chip);
+	if (val & VIA_REG_AC97_BUSY)
 		dev_err(chip->card->dev,
 			"AC'97 codec is not ready [0x%x]\n", val);
 
@@ -2186,7 +2195,8 @@ static int snd_via82xx_chip_init(struct via82xx *chip)
 				 VIA_REG_AC97_SECONDARY_VALID |
 				 (VIA_REG_AC97_CODEC_ID_SECONDARY << VIA_REG_AC97_CODEC_ID_SHIFT));
 	do {
-		if ((val = snd_via82xx_codec_xread(chip)) & VIA_REG_AC97_SECONDARY_VALID) {
+		val = snd_via82xx_codec_xread(chip);
+		if (val & VIA_REG_AC97_SECONDARY_VALID) {
 			chip->ac97_secondary = 1;
 			goto __ac97_ok2;
 		}
@@ -2337,10 +2347,12 @@ static int snd_via82xx_create(struct snd_card *card,
 		.dev_free =	snd_via82xx_dev_free,
         };
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
-	if ((chip = kzalloc(sizeof(*chip), GFP_KERNEL)) == NULL) {
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	if (!chip) {
 		pci_disable_device(pci);
 		return -ENOMEM;
 	}
@@ -2360,7 +2372,8 @@ static int snd_via82xx_create(struct snd_card *card,
 	pci_write_config_byte(chip->pci, VIA_FUNC_ENABLE,
 			      chip->old_legacy & ~(VIA_FUNC_ENABLE_SB|VIA_FUNC_ENABLE_FM));
 
-	if ((err = pci_request_regions(pci, card->driver)) < 0) {
+	err = pci_request_regions(pci, card->driver);
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -2380,12 +2393,14 @@ static int snd_via82xx_create(struct snd_card *card,
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
 		chip->ac97_clock = ac97_clock;
 
-	if ((err = snd_via82xx_chip_init(chip)) < 0) {
+	err = snd_via82xx_chip_init(chip);
+	if (err < 0) {
 		snd_via82xx_free(chip);
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_via82xx_free(chip);
 		return err;
 	}
@@ -2541,24 +2556,31 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 		goto __error;
 	}
 		
-	if ((err = snd_via82xx_create(card, pci, chip_type, pci->revision,
-				      ac97_clock, &chip)) < 0)
+	err = snd_via82xx_create(card, pci, chip_type, pci->revision,
+				 ac97_clock, &chip);
+	if (err < 0)
 		goto __error;
 	card->private_data = chip;
-	if ((err = snd_via82xx_mixer_new(chip, ac97_quirk)) < 0)
+	err = snd_via82xx_mixer_new(chip, ac97_quirk);
+	if (err < 0)
 		goto __error;
 
 	if (chip_type == TYPE_VIA686) {
-		if ((err = snd_via686_pcm_new(chip)) < 0 ||
-		    (err = snd_via686_init_misc(chip)) < 0)
+		err = snd_via686_pcm_new(chip);
+		if (err < 0)
+			goto __error;
+		err = snd_via686_init_misc(chip);
+		if (err < 0)
 			goto __error;
 	} else {
 		if (chip_type == TYPE_VIA8233A) {
-			if ((err = snd_via8233a_pcm_new(chip)) < 0)
+			err = snd_via8233a_pcm_new(chip);
+			if (err < 0)
 				goto __error;
 			// chip->dxs_fixed = 1; /* FIXME: use 48k for DXS #3? */
 		} else {
-			if ((err = snd_via8233_pcm_new(chip)) < 0)
+			err = snd_via8233_pcm_new(chip);
+			if (err < 0)
 				goto __error;
 			if (dxs_support == VIA_DXS_48K)
 				chip->dxs_fixed = 1;
@@ -2569,7 +2591,8 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 				chip->dxs_src = 1;
 			}
 		}
-		if ((err = snd_via8233_init_misc(chip)) < 0)
+		err = snd_via8233_init_misc(chip);
+		if (err < 0)
 			goto __error;
 	}
 
@@ -2583,7 +2606,8 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 
 	snd_via82xx_proc_init(chip);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 30253306f67c..07278a3dc8c1 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -369,7 +369,8 @@ static int snd_via82xx_codec_ready(struct via82xx_modem *chip, int secondary)
 	
 	while (timeout-- > 0) {
 		udelay(1);
-		if (!((val = snd_via82xx_codec_xread(chip)) & VIA_REG_AC97_BUSY))
+		val = snd_via82xx_codec_xread(chip);
+		if (!(val & VIA_REG_AC97_BUSY))
 			return val & 0xffff;
 	}
 	dev_err(chip->card->dev, "codec_ready: codec %i is not ready [0x%x]\n",
@@ -738,13 +739,15 @@ static int snd_via82xx_modem_pcm_open(struct via82xx_modem *chip, struct viadev
 
 	runtime->hw = snd_via82xx_hw;
 	
-        if ((err = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-					      &hw_constraints_rates)) < 0)
+	err = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+					 &hw_constraints_rates);
+	if (err < 0)
                 return err;
 
 	/* we may remove following constaint when we modify table entries
 	   in interrupt */
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 
 	runtime->private_data = viadev;
@@ -878,7 +881,8 @@ static int snd_via82xx_mixer_new(struct via82xx_modem *chip)
 		.wait = snd_via82xx_codec_wait,
 	};
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus);
+	if (err < 0)
 		return err;
 	chip->ac97_bus->private_free = snd_via82xx_mixer_free_ac97_bus;
 	chip->ac97_bus->clock = chip->ac97_clock;
@@ -890,7 +894,8 @@ static int snd_via82xx_mixer_new(struct via82xx_modem *chip)
 	ac97.scaps = AC97_SCAP_SKIP_AUDIO | AC97_SCAP_POWER_SAVE;
 	ac97.num = chip->ac97_secondary;
 
-	if ((err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 
 	return 0;
@@ -971,7 +976,8 @@ static int snd_via82xx_chip_init(struct via82xx_modem *chip)
 		schedule_timeout_uninterruptible(1);
 	} while (time_before(jiffies, end_time));
 
-	if ((val = snd_via82xx_codec_xread(chip)) & VIA_REG_AC97_BUSY)
+	val = snd_via82xx_codec_xread(chip);
+	if (val & VIA_REG_AC97_BUSY)
 		dev_err(chip->card->dev,
 			"AC'97 codec is not ready [0x%x]\n", val);
 
@@ -983,7 +989,8 @@ static int snd_via82xx_chip_init(struct via82xx_modem *chip)
 				 VIA_REG_AC97_SECONDARY_VALID |
 				 (VIA_REG_AC97_CODEC_ID_SECONDARY << VIA_REG_AC97_CODEC_ID_SHIFT));
 	do {
-		if ((val = snd_via82xx_codec_xread(chip)) & VIA_REG_AC97_SECONDARY_VALID) {
+		val = snd_via82xx_codec_xread(chip);
+		if (val & VIA_REG_AC97_SECONDARY_VALID) {
 			chip->ac97_secondary = 1;
 			goto __ac97_ok2;
 		}
@@ -1079,10 +1086,12 @@ static int snd_via82xx_create(struct snd_card *card,
 		.dev_free =	snd_via82xx_dev_free,
         };
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
-	if ((chip = kzalloc(sizeof(*chip), GFP_KERNEL)) == NULL) {
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	if (!chip) {
 		pci_disable_device(pci);
 		return -ENOMEM;
 	}
@@ -1092,7 +1101,8 @@ static int snd_via82xx_create(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	if ((err = pci_request_regions(pci, card->driver)) < 0) {
+	err = pci_request_regions(pci, card->driver);
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -1109,12 +1119,14 @@ static int snd_via82xx_create(struct snd_card *card,
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
 		chip->ac97_clock = ac97_clock;
 
-	if ((err = snd_via82xx_chip_init(chip)) < 0) {
+	err = snd_via82xx_chip_init(chip);
+	if (err < 0) {
 		snd_via82xx_free(chip);
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_via82xx_free(chip);
 		return err;
 	}
@@ -1154,14 +1166,17 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 		goto __error;
 	}
 		
-	if ((err = snd_via82xx_create(card, pci, chip_type, pci->revision,
-				      ac97_clock, &chip)) < 0)
+	err = snd_via82xx_create(card, pci, chip_type, pci->revision,
+				 ac97_clock, &chip);
+	if (err < 0)
 		goto __error;
 	card->private_data = chip;
-	if ((err = snd_via82xx_mixer_new(chip)) < 0)
+	err = snd_via82xx_mixer_new(chip);
+	if (err < 0)
 		goto __error;
 
-	if ((err = snd_via686_pcm_new(chip)) < 0 )
+	err = snd_via686_pcm_new(chip);
+	if (err < 0)
 		goto __error;
 
 	/* disable interrupts */
@@ -1173,7 +1188,8 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 
 	snd_via82xx_proc_init(chip);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

