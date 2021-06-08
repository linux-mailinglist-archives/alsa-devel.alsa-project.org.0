Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E6739F8B5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25109176C;
	Tue,  8 Jun 2021 16:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25109176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161651;
	bh=LOVArCiEL//CllApGDxsEiXVvvtV8WJ1Gjr0Ec65CPE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCAMiJuw6d1INvSMfanOiOom426HS05DCohwmnJqqXEgfQ3iunB2oSbieJEjkWyO+
	 CIXlI7M1zB/HnxAvatbL9d8h5CKAYasrK8UkqcZqb9EzDDSFcuFXWakrJ1z6xBBJBf
	 raLpyvIvXLXoCc5cCdoNS/Dz1xXF7N0GFIHB5iPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEB90F805C4;
	Tue,  8 Jun 2021 16:06:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05EC5F805AB; Tue,  8 Jun 2021 16:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03FAFF804D6
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03FAFF804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="OI0ALPwN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="GakqhqpF"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 03C8D1FDE4
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5Y5YFHIFZcRTUpVpNHrCB5XrRFmFkWUZgucKl0dNJY=;
 b=OI0ALPwNTb6SMXpH/1xjsVV6ntEscP5BGPZsDLcM6VQdy5OhjF+VHFi4HRBKz1SypQqY2i
 rwEKFjn9AUOxFnE7jCQBiGYESrlc9vNPam9qzifsbdc066ilZur9N5Eag942FPLw2xgfxf
 exSUMEoG1kFQVAvtFUQoZJ+GJ/vNgVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5Y5YFHIFZcRTUpVpNHrCB5XrRFmFkWUZgucKl0dNJY=;
 b=GakqhqpFwXovnfZKq4JOEA+Nc7W8r7pyob0WZILxYxRWPD/iPkbUGgeYqhq+DegEbDicce
 l2h29hn+aCPwQ7Bg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E849CA3B88;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 27/66] ALSA: fm801: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:01 +0200
Message-Id: <20210608140540.17885-28-tiwai@suse.de>
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

PCI FM801 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/fm801.c | 63 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 6279eb156e36..ed9dae87145b 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -659,7 +659,8 @@ static int snd_fm801_playback_open(struct snd_pcm_substream *substream)
 					   SNDRV_PCM_HW_PARAM_CHANNELS,
 					   &hw_constraints_channels);
 	}
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -674,7 +675,8 @@ static int snd_fm801_capture_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_fm801_capture;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &hw_constraints_rates);
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -717,7 +719,8 @@ static int snd_fm801_pcm(struct fm801 *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "FM801", device, 1, 1, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "FM801", device, 1, 1, &pcm);
+	if (err < 0)
 		return err;
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_fm801_playback_ops);
@@ -985,7 +988,8 @@ static int snd_fm801_put_mux(struct snd_kcontrol *kcontrol,
 	struct fm801 *chip = snd_kcontrol_chip(kcontrol);
         unsigned short val;
  
-        if ((val = ucontrol->value.enumerated.item[0]) > 4)
+	val = ucontrol->value.enumerated.item[0];
+	if (val > 4)
                 return -EINVAL;
 	return snd_fm801_update_bits(chip, FM801_REC_SRC, 7, val);
 }
@@ -1050,19 +1054,22 @@ static int snd_fm801_mixer(struct fm801 *chip)
 		.read = snd_fm801_codec_read,
 	};
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus);
+	if (err < 0)
 		return err;
 	chip->ac97_bus->private_free = snd_fm801_mixer_free_ac97_bus;
 
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = chip;
 	ac97.private_free = snd_fm801_mixer_free_ac97;
-	if ((err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 	if (chip->secondary) {
 		ac97.num = 1;
 		ac97.addr = chip->secondary_addr;
-		if ((err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97_sec)) < 0)
+		err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97_sec);
+		if (err < 0)
 			return err;
 	}
 	for (i = 0; i < FM801_CONTROLS; i++) {
@@ -1213,7 +1220,8 @@ static int snd_fm801_create(struct snd_card *card,
 	};
 
 	*rchip = NULL;
-	if ((err = pcim_enable_device(pci)) < 0)
+	err = pcim_enable_device(pci);
+	if (err < 0)
 		return err;
 	chip = devm_kzalloc(&pci->dev, sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL)
@@ -1223,7 +1231,8 @@ static int snd_fm801_create(struct snd_card *card,
 	chip->dev = &pci->dev;
 	chip->irq = -1;
 	chip->tea575x_tuner = tea575x_tuner;
-	if ((err = pci_request_regions(pci, "FM801")) < 0)
+	err = pci_request_regions(pci, "FM801");
+	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
 
@@ -1254,7 +1263,8 @@ static int snd_fm801_create(struct snd_card *card,
 
 	snd_fm801_chip_init(chip);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_fm801_free(chip);
 		return err;
 	}
@@ -1327,7 +1337,8 @@ static int snd_card_fm801_probe(struct pci_dev *pci,
 			   0, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_fm801_create(card, pci, tea575x_tuner[dev], radio_nr[dev], &chip)) < 0) {
+	err = snd_fm801_create(card, pci, tea575x_tuner[dev], radio_nr[dev], &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1342,35 +1353,41 @@ static int snd_card_fm801_probe(struct pci_dev *pci,
 	if (chip->tea575x_tuner & TUNER_ONLY)
 		goto __fm801_tuner_only;
 
-	if ((err = snd_fm801_pcm(chip, 0)) < 0) {
+	err = snd_fm801_pcm(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_fm801_mixer(chip)) < 0) {
+	err = snd_fm801_mixer(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_mpu401_uart_new(card, 0, MPU401_HW_FM801,
-				       chip->port + FM801_MPU401_DATA,
-				       MPU401_INFO_INTEGRATED |
-				       MPU401_INFO_IRQ_HOOK,
-				       -1, &chip->rmidi)) < 0) {
+	err = snd_mpu401_uart_new(card, 0, MPU401_HW_FM801,
+				  chip->port + FM801_MPU401_DATA,
+				  MPU401_INFO_INTEGRATED |
+				  MPU401_INFO_IRQ_HOOK,
+				  -1, &chip->rmidi);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_opl3_create(card, chip->port + FM801_OPL3_BANK0,
-				   chip->port + FM801_OPL3_BANK1,
-				   OPL3_HW_OPL3_FM801, 1, &opl3)) < 0) {
+	err = snd_opl3_create(card, chip->port + FM801_OPL3_BANK0,
+			      chip->port + FM801_OPL3_BANK1,
+			      OPL3_HW_OPL3_FM801, 1, &opl3);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
+	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 
       __fm801_tuner_only:
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

