Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE039F92A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:30:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39BCD18C6;
	Tue,  8 Jun 2021 16:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39BCD18C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162639;
	bh=/1irUjfcDbTrN1/DJKGtuJ6wHV8P9TaBQDxURqaTzdM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=czIOiDYbAZSLp2Gwyq9AAVQ1+w5R1olouvTcz0Ip62xizmd6jGg5n7G2h9DCHwYlS
	 cesJWf+FxgsryR3lSIW4Hw8XR3IlwfdwVk+/azMCFxjgV5mZlifQtfD/G1y/y8MNZD
	 ITBsOK1pSvTiP1/HRt4HyV/Khs6CbDY2EK/woo88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F62F8074D;
	Tue,  8 Jun 2021 16:07:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF498F8067D; Tue,  8 Jun 2021 16:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C913F8051F
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C913F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="S3Ukpe4T"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FDRgcNeN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EB8A3219FC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LetJNNQsRS0zetcV8C/nuUiV97hdSqZB08I6LPHIvKQ=;
 b=S3Ukpe4TuokPNmA/WLzOfsNJyXn2xmMy61BSN26CEyWIZEuGE8GF+3sdfgl1CcFYRRTwNv
 Zj7UQ2Ab4lC/rxJCB8mRIDCV3OMSo4ZE31lIz3CNCOVuxLkr/sRaHIPOBXOxhI8upY7gh3
 ySSOMTOVhY2EnQtGE/8V6Q/OukthW7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LetJNNQsRS0zetcV8C/nuUiV97hdSqZB08I6LPHIvKQ=;
 b=FDRgcNeNp3U3IgbXuvpyOMY0n51lo9wr+jNnhSk6HCVH6/Km9hYZpgjoCea2DACJnjNcYF
 BkCDFoGoxIL3ehAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D99D6A3B89;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 64/66] ALSA: poewrmac: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:38 +0200
Message-Id: <20210608140540.17885-65-tiwai@suse.de>
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

PPC powermac driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ppc/beep.c     |  5 ++-
 sound/ppc/daca.c     | 24 ++++++++++-----
 sound/ppc/keywest.c  |  6 ++--
 sound/ppc/pmac.c     |  6 ++--
 sound/ppc/powermac.c | 21 ++++++++-----
 sound/ppc/tumbler.c  | 72 +++++++++++++++++++++++++++++---------------
 6 files changed, 89 insertions(+), 45 deletions(-)

diff --git a/sound/ppc/beep.c b/sound/ppc/beep.c
index 6bc586a5db0f..0f4bce1c0d4f 100644
--- a/sound/ppc/beep.c
+++ b/sound/ppc/beep.c
@@ -105,7 +105,10 @@ static int snd_pmac_beep_event(struct input_dev *dev, unsigned int type,
 	}
 
 	chip = input_get_drvdata(dev);
-	if (! chip || (beep = chip->beep) == NULL)
+	if (!chip)
+		return -1;
+	beep = chip->beep;
+	if (!beep)
 		return -1;
 
 	if (! hz) {
diff --git a/sound/ppc/daca.c b/sound/ppc/daca.c
index 1eb698dafd93..4da9278dd58a 100644
--- a/sound/ppc/daca.c
+++ b/sound/ppc/daca.c
@@ -84,7 +84,8 @@ static int daca_get_deemphasis(struct snd_kcontrol *kcontrol,
 {
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_daca *mix;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	ucontrol->value.integer.value[0] = mix->deemphasis ? 1 : 0;
 	return 0;
@@ -97,7 +98,8 @@ static int daca_put_deemphasis(struct snd_kcontrol *kcontrol,
 	struct pmac_daca *mix;
 	int change;
 
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	change = mix->deemphasis != ucontrol->value.integer.value[0];
 	if (change) {
@@ -123,7 +125,8 @@ static int daca_get_volume(struct snd_kcontrol *kcontrol,
 {
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_daca *mix;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	ucontrol->value.integer.value[0] = mix->left_vol;
 	ucontrol->value.integer.value[1] = mix->right_vol;
@@ -138,7 +141,8 @@ static int daca_put_volume(struct snd_kcontrol *kcontrol,
 	unsigned int vol[2];
 	int change;
 
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	vol[0] = ucontrol->value.integer.value[0];
 	vol[1] = ucontrol->value.integer.value[1];
@@ -162,7 +166,8 @@ static int daca_get_amp(struct snd_kcontrol *kcontrol,
 {
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_daca *mix;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	ucontrol->value.integer.value[0] = mix->amp_on ? 1 : 0;
 	return 0;
@@ -175,7 +180,8 @@ static int daca_put_amp(struct snd_kcontrol *kcontrol,
 	struct pmac_daca *mix;
 	int change;
 
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	change = mix->amp_on != ucontrol->value.integer.value[0];
 	if (change) {
@@ -248,7 +254,8 @@ int snd_pmac_daca_init(struct snd_pmac *chip)
 	mix->i2c.addr = DACA_I2C_ADDR;
 	mix->i2c.init_client = daca_init_client;
 	mix->i2c.name = "DACA";
-	if ((err = snd_pmac_keywest_init(&mix->i2c)) < 0)
+	err = snd_pmac_keywest_init(&mix->i2c);
+	if (err < 0)
 		return err;
 
 	/*
@@ -257,7 +264,8 @@ int snd_pmac_daca_init(struct snd_pmac *chip)
 	strcpy(chip->card->mixername, "PowerMac DACA");
 
 	for (i = 0; i < ARRAY_SIZE(daca_mixers); i++) {
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&daca_mixers[i], chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&daca_mixers[i], chip));
+		if (err < 0)
 			return err;
 	}
 
diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index a8915100d6bb..6e5daae18f9d 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -114,7 +114,8 @@ int snd_pmac_tumbler_post_init(void)
 	if (!keywest_ctx || !keywest_ctx->client)
 		return -ENXIO;
 
-	if ((err = keywest_ctx->init_client(keywest_ctx)) < 0) {
+	err = keywest_ctx->init_client(keywest_ctx);
+	if (err < 0) {
 		snd_printk(KERN_ERR "tumbler: %i :cannot initialize the MCS\n", err);
 		return err;
 	}
@@ -136,7 +137,8 @@ int snd_pmac_keywest_init(struct pmac_keywest *i2c)
 
 	keywest_ctx = i2c;
 
-	if ((err = i2c_add_driver(&keywest_driver))) {
+	err = i2c_add_driver(&keywest_driver);
+	if (err) {
 		snd_printk(KERN_ERR "cannot register keywest i2c driver\n");
 		i2c_put_adapter(adap);
 		return err;
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 2e750b317be1..84058bbf9d12 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -1160,7 +1160,8 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 	chip->playback.stream = SNDRV_PCM_STREAM_PLAYBACK;
 	chip->capture.stream = SNDRV_PCM_STREAM_CAPTURE;
 
-	if ((err = snd_pmac_detect(chip)) < 0)
+	err = snd_pmac_detect(chip);
+	if (err < 0)
 		goto __error;
 
 	if (snd_pmac_dbdma_alloc(chip, &chip->playback.cmd, PMAC_MAX_FRAGS + 1) < 0 ||
@@ -1299,7 +1300,8 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 	/* Reset dbdma channels */
 	snd_pmac_dbdma_reset(chip);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0)
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0)
 		goto __error;
 
 	*chip_return = chip;
diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index 9fb51ebafde1..1d2865c43d4b 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -48,7 +48,8 @@ static int snd_pmac_probe(struct platform_device *devptr)
 	if (err < 0)
 		return err;
 
-	if ((err = snd_pmac_new(card, &chip)) < 0)
+	err = snd_pmac_new(card, &chip);
+	if (err < 0)
 		goto __error;
 	card->private_data = chip;
 
@@ -58,7 +59,8 @@ static int snd_pmac_probe(struct platform_device *devptr)
 		strcpy(card->shortname, "PowerMac Burgundy");
 		sprintf(card->longname, "%s (Dev %d) Sub-frame %d",
 			card->shortname, chip->device_id, chip->subframe);
-		if ((err = snd_pmac_burgundy_init(chip)) < 0)
+		err = snd_pmac_burgundy_init(chip);
+		if (err < 0)
 			goto __error;
 		break;
 	case PMAC_DACA:
@@ -66,7 +68,8 @@ static int snd_pmac_probe(struct platform_device *devptr)
 		strcpy(card->shortname, "PowerMac DACA");
 		sprintf(card->longname, "%s (Dev %d) Sub-frame %d",
 			card->shortname, chip->device_id, chip->subframe);
-		if ((err = snd_pmac_daca_init(chip)) < 0)
+		err = snd_pmac_daca_init(chip);
+		if (err < 0)
 			goto __error;
 		break;
 	case PMAC_TUMBLER:
@@ -92,7 +95,8 @@ static int snd_pmac_probe(struct platform_device *devptr)
 			name_ext = "";
 		sprintf(card->longname, "%s%s Rev %d",
 			card->shortname, name_ext, chip->revision);
-		if ((err = snd_pmac_awacs_init(chip)) < 0)
+		err = snd_pmac_awacs_init(chip);
+		if (err < 0)
 			goto __error;
 		break;
 	default:
@@ -101,14 +105,16 @@ static int snd_pmac_probe(struct platform_device *devptr)
 		goto __error;
 	}
 
-	if ((err = snd_pmac_pcm_new(chip)) < 0)
+	err = snd_pmac_pcm_new(chip);
+	if (err < 0)
 		goto __error;
 
 	chip->initialized = 1;
 	if (enable_beep)
 		snd_pmac_attach_beep(chip);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto __error;
 
 	platform_set_drvdata(devptr, card);
@@ -162,7 +168,8 @@ static int __init alsa_card_pmac_init(void)
 {
 	int err;
 
-	if ((err = platform_driver_register(&snd_pmac_driver)) < 0)
+	err = platform_driver_register(&snd_pmac_driver);
+	if (err < 0)
 		return err;
 	device = platform_device_register_simple(SND_PMAC_DRIVER, -1, NULL, 0);
 	return 0;
diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 6e5bdaa262b0..c65e74d7cd0a 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -402,7 +402,8 @@ static int tumbler_get_drc_value(struct snd_kcontrol *kcontrol,
 {
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_tumbler *mix;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	ucontrol->value.integer.value[0] = mix->drc_range;
 	return 0;
@@ -416,7 +417,8 @@ static int tumbler_put_drc_value(struct snd_kcontrol *kcontrol,
 	unsigned int val;
 	int change;
 
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	val = ucontrol->value.integer.value[0];
 	if (chip->model == PMAC_TUMBLER) {
@@ -442,7 +444,8 @@ static int tumbler_get_drc_switch(struct snd_kcontrol *kcontrol,
 {
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_tumbler *mix;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	ucontrol->value.integer.value[0] = mix->drc_enable;
 	return 0;
@@ -455,7 +458,8 @@ static int tumbler_put_drc_switch(struct snd_kcontrol *kcontrol,
 	struct pmac_tumbler *mix;
 	int change;
 
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	change = mix->drc_enable != ucontrol->value.integer.value[0];
 	if (change) {
@@ -524,7 +528,8 @@ static int tumbler_get_mono(struct snd_kcontrol *kcontrol,
 	struct tumbler_mono_vol *info = (struct tumbler_mono_vol *)kcontrol->private_value;
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_tumbler *mix;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	ucontrol->value.integer.value[0] = mix->mono_vol[info->index];
 	return 0;
@@ -539,7 +544,8 @@ static int tumbler_put_mono(struct snd_kcontrol *kcontrol,
 	unsigned int vol;
 	int change;
 
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	vol = ucontrol->value.integer.value[0];
 	if (vol >= info->max)
@@ -669,7 +675,8 @@ static int snapper_get_mix(struct snd_kcontrol *kcontrol,
 	int idx = (int)kcontrol->private_value;
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_tumbler *mix;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	ucontrol->value.integer.value[0] = mix->mix_vol[idx][0];
 	ucontrol->value.integer.value[1] = mix->mix_vol[idx][1];
@@ -685,7 +692,8 @@ static int snapper_put_mix(struct snd_kcontrol *kcontrol,
 	unsigned int vol[2];
 	int change;
 
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	vol[0] = ucontrol->value.integer.value[0];
 	vol[1] = ucontrol->value.integer.value[1];
@@ -716,7 +724,8 @@ static int tumbler_get_mute_switch(struct snd_kcontrol *kcontrol,
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	struct pmac_tumbler *mix;
 	struct pmac_gpio *gp;
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	switch(kcontrol->private_value) {
 	case TUMBLER_MUTE_HP:
@@ -745,7 +754,8 @@ static int tumbler_put_mute_switch(struct snd_kcontrol *kcontrol,
 	if (chip->update_automute && chip->auto_mute)
 		return 0; /* don't touch in the auto-mute mode */
 #endif	
-	if (! (mix = chip->mixer_data))
+	mix = chip->mixer_data;
+	if (!mix)
 		return -ENODEV;
 	switch(kcontrol->private_value) {
 	case TUMBLER_MUTE_HP:
@@ -1361,7 +1371,8 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 			break;
 		}
 	}
-	if ((err = tumbler_init(chip)) < 0)
+	err = tumbler_init(chip);
+	if (err < 0)
 		return err;
 
 	/* set up TAS */
@@ -1392,7 +1403,8 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 		chipname = "Snapper";
 	}
 
-	if ((err = snd_pmac_keywest_init(&mix->i2c)) < 0)
+	err = snd_pmac_keywest_init(&mix->i2c);
+	if (err < 0)
 		return err;
 
 	/*
@@ -1402,28 +1414,34 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 
 	if (chip->model == PMAC_TUMBLER) {
 		for (i = 0; i < ARRAY_SIZE(tumbler_mixers); i++) {
-			if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&tumbler_mixers[i], chip))) < 0)
+			err = snd_ctl_add(chip->card, snd_ctl_new1(&tumbler_mixers[i], chip));
+			if (err < 0)
 				return err;
 		}
 	} else {
 		for (i = 0; i < ARRAY_SIZE(snapper_mixers); i++) {
-			if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snapper_mixers[i], chip))) < 0)
+			err = snd_ctl_add(chip->card, snd_ctl_new1(&snapper_mixers[i], chip));
+			if (err < 0)
 				return err;
 		}
 	}
 	chip->master_sw_ctl = snd_ctl_new1(&tumbler_hp_sw, chip);
-	if ((err = snd_ctl_add(chip->card, chip->master_sw_ctl)) < 0)
+	err = snd_ctl_add(chip->card, chip->master_sw_ctl);
+	if (err < 0)
 		return err;
 	chip->speaker_sw_ctl = snd_ctl_new1(&tumbler_speaker_sw, chip);
-	if ((err = snd_ctl_add(chip->card, chip->speaker_sw_ctl)) < 0)
+	err = snd_ctl_add(chip->card, chip->speaker_sw_ctl);
+	if (err < 0)
 		return err;
 	if (mix->line_mute.addr != 0) {
 		chip->lineout_sw_ctl = snd_ctl_new1(&tumbler_lineout_sw, chip);
-		if ((err = snd_ctl_add(chip->card, chip->lineout_sw_ctl)) < 0)
+		err = snd_ctl_add(chip->card, chip->lineout_sw_ctl);
+		if (err < 0)
 			return err;
 	}
 	chip->drc_sw_ctl = snd_ctl_new1(&tumbler_drc_sw, chip);
-	if ((err = snd_ctl_add(chip->card, chip->drc_sw_ctl)) < 0)
+	err = snd_ctl_add(chip->card, chip->drc_sw_ctl);
+	if (err < 0)
 		return err;
 
 	/* set initial DRC range to 60% */
@@ -1446,9 +1464,11 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 	device_change_chip = chip;
 
 #ifdef PMAC_SUPPORT_AUTOMUTE
-	if ((mix->headphone_irq >=0 || mix->lineout_irq >= 0)
-	    && (err = snd_pmac_add_automute(chip)) < 0)
-		return err;
+	if (mix->headphone_irq >= 0 || mix->lineout_irq >= 0) {
+		err = snd_pmac_add_automute(chip);
+		if (err < 0)
+			return err;
+	}
 	chip->detect_headphone = tumbler_detect_headphone;
 	chip->update_automute = tumbler_update_automute;
 	tumbler_update_automute(chip, 0); /* update the status only */
@@ -1456,8 +1476,9 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 	/* activate headphone status interrupts */
   	if (mix->headphone_irq >= 0) {
 		unsigned char val;
-		if ((err = request_irq(mix->headphone_irq, headphone_intr, 0,
-				       "Sound Headphone Detection", chip)) < 0)
+		err = request_irq(mix->headphone_irq, headphone_intr, 0,
+				  "Sound Headphone Detection", chip);
+		if (err < 0)
 			return 0;
 		/* activate headphone status interrupts */
 		val = do_gpio_read(&mix->hp_detect);
@@ -1465,8 +1486,9 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 	}
   	if (mix->lineout_irq >= 0) {
 		unsigned char val;
-		if ((err = request_irq(mix->lineout_irq, headphone_intr, 0,
-				       "Sound Lineout Detection", chip)) < 0)
+		err = request_irq(mix->lineout_irq, headphone_intr, 0,
+				  "Sound Lineout Detection", chip);
+		if (err < 0)
 			return 0;
 		/* activate headphone status interrupts */
 		val = do_gpio_read(&mix->line_detect);
-- 
2.26.2

