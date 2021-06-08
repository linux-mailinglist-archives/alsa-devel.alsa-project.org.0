Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4A39F8DE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF3A17C0;
	Tue,  8 Jun 2021 16:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF3A17C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162008;
	bh=9UzVO1vCL8ORb5CcpoclaNXga5bEiNLNJiMvQKtUftQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+zRRTFrLy08ywvAs0mPwLfr1igv/YjrDtB885W/v1Ojw1pXhXXB8jnfkBAshH/Og
	 Ag4bfmzp6JcyluSe6z9rWImMwhbZI+AfJDy2YJCKSJxs5zrdN7IgwybOh27isMUPYE
	 bB1bMveVcWavkdr1WlYSzH+GHvOukAlu39e9WXl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89055F80613;
	Tue,  8 Jun 2021 16:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 672D3F805FB; Tue,  8 Jun 2021 16:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95F42F804EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F42F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="G6zBC7WZ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="IiXUlO41"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5D37C1FDF2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVeAYC4msHXHu7jnZ5Xbz2SdoFI8P0bJA+h/WhOHUCM=;
 b=G6zBC7WZmmZewJKzeva11CKCGQTSxwYkrY2hQtoiRhSrrZzxY5ZmXpp80FHWD664exGq1B
 GnJt3BsmC4BCE0Ygsb6Y/1atpPMrcmTFdnnZD5LGoT8i9RhC7ZKJQ8CHV6yrpS4CAFYwcR
 lEkCEzrHoWuW8zcqFFZFoCv90Yo73vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVeAYC4msHXHu7jnZ5Xbz2SdoFI8P0bJA+h/WhOHUCM=;
 b=IiXUlO417PsD18u+lp1rHWw8XtR7xAk1Iu2Z0LGp2+ZOZ2Ri2m6d3IuEXJvFSHOBjbDM9/
 9VIgCwyDR6s6l9Aw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 4C905A3B89;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 52/66] ALSA: ymfpci: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:26 +0200
Message-Id: <20210608140540.17885-53-tiwai@suse.de>
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

PCI YMFPCI driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ymfpci/ymfpci.c      | 71 +++++++++++++++++++--------------
 sound/pci/ymfpci/ymfpci_main.c | 72 +++++++++++++++++++++++-----------
 2 files changed, 91 insertions(+), 52 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index 99be1490ef0e..7e32d57147ff 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -72,7 +72,8 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 
 		if (io_port == 1) {
 			/* auto-detect */
-			if (!(io_port = pci_resource_start(chip->pci, 2)))
+			io_port = pci_resource_start(chip->pci, 2);
+			if (!io_port)
 				return -ENODEV;
 		}
 	} else {
@@ -81,7 +82,8 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 			for (io_port = 0x201; io_port <= 0x205; io_port++) {
 				if (io_port == 0x203)
 					continue;
-				if ((r = request_region(io_port, 1, "YMFPCI gameport")) != NULL)
+				r = request_region(io_port, 1, "YMFPCI gameport");
+				if (r)
 					break;
 			}
 			if (!r) {
@@ -102,10 +104,13 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 		}
 	}
 
-	if (!r && !(r = request_region(io_port, 1, "YMFPCI gameport"))) {
-		dev_err(chip->card->dev,
-			"joystick port %#x is in use.\n", io_port);
-		return -EBUSY;
+	if (!r) {
+		r = request_region(io_port, 1, "YMFPCI gameport");
+		if (!r) {
+			dev_err(chip->card->dev,
+				"joystick port %#x is in use.\n", io_port);
+			return -EBUSY;
+		}
 	}
 
 	chip->gameport = gp = gameport_allocate_port();
@@ -193,8 +198,9 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 			/* auto-detect */
 			fm_port[dev] = pci_resource_start(pci, 1);
 		}
-		if (fm_port[dev] > 0 &&
-		    (fm_res = request_region(fm_port[dev], 4, "YMFPCI OPL3")) != NULL) {
+		if (fm_port[dev] > 0)
+			fm_res = request_region(fm_port[dev], 4, "YMFPCI OPL3");
+		if (fm_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_FMEN;
 			pci_write_config_word(pci, PCIR_DSXG_FMBASE, fm_port[dev]);
 		}
@@ -202,8 +208,9 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 			/* auto-detect */
 			mpu_port[dev] = pci_resource_start(pci, 1) + 0x20;
 		}
-		if (mpu_port[dev] > 0 &&
-		    (mpu_res = request_region(mpu_port[dev], 2, "YMFPCI MPU401")) != NULL) {
+		if (mpu_port[dev] > 0)
+			mpu_res = request_region(mpu_port[dev], 2, "YMFPCI MPU401");
+		if (mpu_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_MEN;
 			pci_write_config_word(pci, PCIR_DSXG_MPU401BASE, mpu_port[dev]);
 		}
@@ -215,8 +222,9 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		case 0x3a8: legacy_ctrl2 |= 3; break;
 		default: fm_port[dev] = 0; break;
 		}
-		if (fm_port[dev] > 0 &&
-		    (fm_res = request_region(fm_port[dev], 4, "YMFPCI OPL3")) != NULL) {
+		if (fm_port[dev] > 0)
+			fm_res = request_region(fm_port[dev], 4, "YMFPCI OPL3");
+		if (fm_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_FMEN;
 		} else {
 			legacy_ctrl2 &= ~YMFPCI_LEGACY2_FMIO;
@@ -229,8 +237,9 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		case 0x334: legacy_ctrl2 |= 3 << 4; break;
 		default: mpu_port[dev] = 0; break;
 		}
-		if (mpu_port[dev] > 0 &&
-		    (mpu_res = request_region(mpu_port[dev], 2, "YMFPCI MPU401")) != NULL) {
+		if (mpu_port[dev] > 0)
+			mpu_res = request_region(mpu_port[dev], 2, "YMFPCI MPU401");
+		if (mpu_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_MEN;
 		} else {
 			legacy_ctrl2 &= ~YMFPCI_LEGACY2_MPUIO;
@@ -244,9 +253,8 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 	pci_read_config_word(pci, PCIR_DSXG_LEGACY, &old_legacy_ctrl);
 	pci_write_config_word(pci, PCIR_DSXG_LEGACY, legacy_ctrl);
 	pci_write_config_word(pci, PCIR_DSXG_ELEGACY, legacy_ctrl2);
-	if ((err = snd_ymfpci_create(card, pci,
-				     old_legacy_ctrl,
-			 	     &chip)) < 0) {
+	err = snd_ymfpci_create(card, pci, old_legacy_ctrl, &chip);
+	if (err  < 0) {
 		release_and_free_resource(mpu_res);
 		release_and_free_resource(fm_res);
 		goto free_card;
@@ -287,11 +295,12 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		goto free_card;
 
 	if (chip->mpu_res) {
-		if ((err = snd_mpu401_uart_new(card, 0, MPU401_HW_YMFPCI,
-					       mpu_port[dev],
-					       MPU401_INFO_INTEGRATED |
-					       MPU401_INFO_IRQ_HOOK,
-					       -1, &chip->rawmidi)) < 0) {
+		err = snd_mpu401_uart_new(card, 0, MPU401_HW_YMFPCI,
+					  mpu_port[dev],
+					  MPU401_INFO_INTEGRATED |
+					  MPU401_INFO_IRQ_HOOK,
+					  -1, &chip->rawmidi);
+		if (err < 0) {
 			dev_warn(card->dev,
 				 "cannot initialize MPU401 at 0x%lx, skipping...\n",
 				 mpu_port[dev]);
@@ -300,18 +309,22 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		}
 	}
 	if (chip->fm_res) {
-		if ((err = snd_opl3_create(card,
-					   fm_port[dev],
-					   fm_port[dev] + 2,
-					   OPL3_HW_OPL3, 1, &opl3)) < 0) {
+		err = snd_opl3_create(card,
+				      fm_port[dev],
+				      fm_port[dev] + 2,
+				      OPL3_HW_OPL3, 1, &opl3);
+		if (err < 0) {
 			dev_warn(card->dev,
 				 "cannot initialize FM OPL3 at 0x%lx, skipping...\n",
 				 fm_port[dev]);
 			legacy_ctrl &= ~YMFPCI_LEGACY_FMEN;
 			pci_write_config_word(pci, PCIR_DSXG_LEGACY, legacy_ctrl);
-		} else if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
-			dev_err(card->dev, "cannot create opl3 hwdep\n");
-			goto free_card;
+		} else {
+			err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+			if (err < 0) {
+				dev_err(card->dev, "cannot create opl3 hwdep\n");
+				goto free_card;
+			}
 		}
 	}
 
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index cacc6a9d14c8..8fd060769882 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -292,7 +292,8 @@ static void snd_ymfpci_pcm_interrupt(struct snd_ymfpci *chip, struct snd_ymfpci_
 	struct snd_ymfpci_pcm *ypcm;
 	u32 pos, delta;
 	
-	if ((ypcm = voice->ypcm) == NULL)
+	ypcm = voice->ypcm;
+	if (!ypcm)
 		return;
 	if (ypcm->substream == NULL)
 		return;
@@ -628,7 +629,8 @@ static int snd_ymfpci_playback_hw_params(struct snd_pcm_substream *substream,
 	struct snd_ymfpci_pcm *ypcm = runtime->private_data;
 	int err;
 
-	if ((err = snd_ymfpci_pcm_voice_alloc(ypcm, params_channels(hw_params))) < 0)
+	err = snd_ymfpci_pcm_voice_alloc(ypcm, params_channels(hw_params));
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -932,7 +934,8 @@ static int snd_ymfpci_playback_open(struct snd_pcm_substream *substream)
 	struct snd_ymfpci_pcm *ypcm;
 	int err;
 	
-	if ((err = snd_ymfpci_playback_open_1(substream)) < 0)
+	err = snd_ymfpci_playback_open_1(substream);
+	if (err < 0)
 		return err;
 	ypcm = runtime->private_data;
 	ypcm->output_front = 1;
@@ -954,7 +957,8 @@ static int snd_ymfpci_playback_spdif_open(struct snd_pcm_substream *substream)
 	struct snd_ymfpci_pcm *ypcm;
 	int err;
 	
-	if ((err = snd_ymfpci_playback_open_1(substream)) < 0)
+	err = snd_ymfpci_playback_open_1(substream);
+	if (err < 0)
 		return err;
 	ypcm = runtime->private_data;
 	ypcm->output_front = 0;
@@ -982,7 +986,8 @@ static int snd_ymfpci_playback_4ch_open(struct snd_pcm_substream *substream)
 	struct snd_ymfpci_pcm *ypcm;
 	int err;
 	
-	if ((err = snd_ymfpci_playback_open_1(substream)) < 0)
+	err = snd_ymfpci_playback_open_1(substream);
+	if (err < 0)
 		return err;
 	ypcm = runtime->private_data;
 	ypcm->output_front = 0;
@@ -1124,7 +1129,8 @@ int snd_ymfpci_pcm(struct snd_ymfpci *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "YMFPCI", device, 32, 1, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "YMFPCI", device, 32, 1, &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 
@@ -1157,7 +1163,8 @@ int snd_ymfpci_pcm2(struct snd_ymfpci *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "YMFPCI - PCM2", device, 0, 1, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "YMFPCI - PCM2", device, 0, 1, &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 
@@ -1190,7 +1197,8 @@ int snd_ymfpci_pcm_spdif(struct snd_ymfpci *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "YMFPCI - IEC958", device, 1, 0, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "YMFPCI - IEC958", device, 1, 0, &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 
@@ -1230,7 +1238,8 @@ int snd_ymfpci_pcm_4ch(struct snd_ymfpci *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "YMFPCI - Rear", device, 1, 0, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "YMFPCI - Rear", device, 1, 0, &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 
@@ -1785,7 +1794,8 @@ int snd_ymfpci_mixer(struct snd_ymfpci *chip, int rear_switch)
 		.read = snd_ymfpci_codec_read,
 	};
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus);
+	if (err < 0)
 		return err;
 	chip->ac97_bus->private_free = snd_ymfpci_mixer_free_ac97_bus;
 	chip->ac97_bus->no_vra = 1; /* YMFPCI doesn't need VRA */
@@ -1793,7 +1803,8 @@ int snd_ymfpci_mixer(struct snd_ymfpci *chip, int rear_switch)
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = chip;
 	ac97.private_free = snd_ymfpci_mixer_free_ac97;
-	if ((err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 
 	/* to be sure */
@@ -1801,7 +1812,8 @@ int snd_ymfpci_mixer(struct snd_ymfpci *chip, int rear_switch)
 			     AC97_EA_VRA|AC97_EA_VRM, 0);
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_ymfpci_controls); idx++) {
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_ymfpci_controls[idx], chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_ymfpci_controls[idx], chip));
+		if (err < 0)
 			return err;
 	}
 	if (chip->ac97->ext_id & AC97_EI_SDAC) {
@@ -1814,27 +1826,37 @@ int snd_ymfpci_mixer(struct snd_ymfpci *chip, int rear_switch)
 	/* add S/PDIF control */
 	if (snd_BUG_ON(!chip->pcm_spdif))
 		return -ENXIO;
-	if ((err = snd_ctl_add(chip->card, kctl = snd_ctl_new1(&snd_ymfpci_spdif_default, chip))) < 0)
+	kctl = snd_ctl_new1(&snd_ymfpci_spdif_default, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
 		return err;
 	kctl->id.device = chip->pcm_spdif->device;
-	if ((err = snd_ctl_add(chip->card, kctl = snd_ctl_new1(&snd_ymfpci_spdif_mask, chip))) < 0)
+	kctl = snd_ctl_new1(&snd_ymfpci_spdif_mask, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
 		return err;
 	kctl->id.device = chip->pcm_spdif->device;
-	if ((err = snd_ctl_add(chip->card, kctl = snd_ctl_new1(&snd_ymfpci_spdif_stream, chip))) < 0)
+	kctl = snd_ctl_new1(&snd_ymfpci_spdif_stream, chip);
+	err = snd_ctl_add(chip->card, kctl);
+	if (err < 0)
 		return err;
 	kctl->id.device = chip->pcm_spdif->device;
 	chip->spdif_pcm_ctl = kctl;
 
 	/* direct recording source */
-	if (chip->device_id == PCI_DEVICE_ID_YAMAHA_754 &&
-	    (err = snd_ctl_add(chip->card, kctl = snd_ctl_new1(&snd_ymfpci_drec_source, chip))) < 0)
-		return err;
+	if (chip->device_id == PCI_DEVICE_ID_YAMAHA_754) {
+		kctl = snd_ctl_new1(&snd_ymfpci_drec_source, chip);
+		err = snd_ctl_add(chip->card, kctl);
+		if (err < 0)
+			return err;
+	}
 
 	/*
 	 * shared rear/line-in
 	 */
 	if (rear_switch) {
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_ymfpci_rear_shared, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_ymfpci_rear_shared, chip));
+		if (err < 0)
 			return err;
 	}
 
@@ -1847,7 +1869,8 @@ int snd_ymfpci_mixer(struct snd_ymfpci *chip, int rear_switch)
 		kctl->id.device = chip->pcm->device;
 		kctl->id.subdevice = idx;
 		kctl->private_value = (unsigned long)substream;
-		if ((err = snd_ctl_add(chip->card, kctl)) < 0)
+		err = snd_ctl_add(chip->card, kctl);
+		if (err < 0)
 			return err;
 		chip->pcm_mixer[idx].left = 0x8000;
 		chip->pcm_mixer[idx].right = 0x8000;
@@ -1928,7 +1951,8 @@ int snd_ymfpci_timer(struct snd_ymfpci *chip, int device)
 	tid.card = chip->card->number;
 	tid.device = device;
 	tid.subdevice = 0;
-	if ((err = snd_timer_new(chip->card, "YMFPCI", &tid, &timer)) >= 0) {
+	err = snd_timer_new(chip->card, "YMFPCI", &tid, &timer);
+	if (err >= 0) {
 		strcpy(timer->name, "YMFPCI timer");
 		timer->private_data = chip;
 		timer->hw = snd_ymfpci_timer_hw;
@@ -2334,7 +2358,8 @@ int snd_ymfpci_create(struct snd_card *card,
 	*rchip = NULL;
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
@@ -2357,7 +2382,8 @@ int snd_ymfpci_create(struct snd_card *card,
 	pci_set_master(pci);
 	chip->src441_used = -1;
 
-	if ((chip->res_reg_area = request_mem_region(chip->reg_area_phys, 0x8000, "YMFPCI")) == NULL) {
+	chip->res_reg_area = request_mem_region(chip->reg_area_phys, 0x8000, "YMFPCI");
+	if (!chip->res_reg_area) {
 		dev_err(chip->card->dev,
 			"unable to grab memory region 0x%lx-0x%lx\n",
 			chip->reg_area_phys, chip->reg_area_phys + 0x8000 - 1);
-- 
2.26.2

