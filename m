Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5513C9AB2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A14179C;
	Thu, 15 Jul 2021 10:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A14179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337928;
	bh=iBsXn4w2dJ4CyMPTkybYJPdDpIu8nu6+vmNTQ/CbzGw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kb3sHElk7AO0ia7Brb/KArOPm+A/t0+qfFGakre8lygeXanEuniPK3XYnRgb4SFAO
	 Xhnwk0GVFyiwQuOMmYt3rq5tgZmpT7ueP9jw9fZ3b/xSDzEEI8++Ytm9jOvzdZBT0U
	 O5ZM2RkpMGDymqsNjjrf6sfb3MvHlXjKyccFOWQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51791F808E7;
	Thu, 15 Jul 2021 10:02:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBC96F80858; Thu, 15 Jul 2021 10:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FA99F805C5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FA99F805C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="YDATGMTw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xkAYDWvN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 15E051FDEB
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsL3EB2EcG8KWez8PWBtNZ+HiyZkGGHXHw4xv/wdK5Q=;
 b=YDATGMTwHrzXFA7ljru4OKcv8aPnzcOxTGsQWdZ3o5tVOz+7c7ZPD0shUEpgsPf2Ik8ANs
 hMcaClGUtZhfEY2cmjhkcC9YlfF+eqRZYMbv4XWjYO4gz/SjxRjP6sXqAUwVpW53Py+wy6
 kbYMRccJRj4HBpG0lzs4Wf0qGr4liZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336028;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsL3EB2EcG8KWez8PWBtNZ+HiyZkGGHXHw4xv/wdK5Q=;
 b=xkAYDWvN76kt3eoyeQRB1ZMiig28N4NLrtONVqhEgitj5Ag5MgX7eBXQ91QGoTfBzOjQvO
 qJiT5g5hkr2Ft+Cg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 04ACAA3B8F;
 Thu, 15 Jul 2021 08:00:28 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 79/79] ALSA: pcsp: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:41 +0200
Message-Id: <20210715075941.23332-80-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

Use the new snd_devm_card_new() for the card object allocation and the
devres version for the input device, and clean up the superfluous
remove callback.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcsp/pcsp.c       | 49 +++++++++++----------------------
 sound/drivers/pcsp/pcsp_input.c | 14 ++--------
 sound/drivers/pcsp/pcsp_input.h |  1 -
 3 files changed, 18 insertions(+), 46 deletions(-)

diff --git a/sound/drivers/pcsp/pcsp.c b/sound/drivers/pcsp/pcsp.c
index 7689fa2f9531..c7be1c395bcb 100644
--- a/sound/drivers/pcsp/pcsp.c
+++ b/sound/drivers/pcsp/pcsp.c
@@ -42,9 +42,8 @@ struct snd_pcsp pcsp_chip;
 
 static int snd_pcsp_create(struct snd_card *card)
 {
-	static const struct snd_device_ops ops = { };
 	unsigned int resolution = hrtimer_resolution;
-	int err, div, min_div, order;
+	int div, min_div, order;
 
 	if (!nopcm) {
 		if (resolution > PCSP_MAX_PERIOD_NS) {
@@ -83,15 +82,18 @@ static int snd_pcsp_create(struct snd_card *card)
 	pcsp_chip.port = 0x61;
 	pcsp_chip.irq = -1;
 	pcsp_chip.dma = -1;
-
-	/* Register device */
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, &pcsp_chip, &ops);
-	if (err < 0)
-		return err;
+	card->private_data = &pcsp_chip;
 
 	return 0;
 }
 
+static void pcsp_stop_beep(struct snd_pcsp *chip);
+
+static void alsa_card_pcsp_free(struct snd_card *card)
+{
+	pcsp_stop_beep(card->private_data);
+}
+
 static int snd_card_pcsp_probe(int devnum, struct device *dev)
 {
 	struct snd_card *card;
@@ -103,22 +105,22 @@ static int snd_card_pcsp_probe(int devnum, struct device *dev)
 	hrtimer_init(&pcsp_chip.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	pcsp_chip.timer.function = pcsp_do_timer;
 
-	err = snd_card_new(dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0)
 		return err;
 
 	err = snd_pcsp_create(card);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	if (!nopcm) {
 		err = snd_pcsp_new_pcm(&pcsp_chip);
 		if (err < 0)
-			goto free_card;
+			return err;
 	}
 	err = snd_pcsp_new_mixer(&pcsp_chip, nopcm);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	strcpy(card->driver, "PC-Speaker");
 	strcpy(card->shortname, "pcsp");
@@ -127,13 +129,10 @@ static int snd_card_pcsp_probe(int devnum, struct device *dev)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto free_card;
+		return err;
+	card->private_free = alsa_card_pcsp_free;
 
 	return 0;
-
-free_card:
-	snd_card_free(card);
-	return err;
 }
 
 static int alsa_card_pcsp_init(struct device *dev)
@@ -155,11 +154,6 @@ static int alsa_card_pcsp_init(struct device *dev)
 	return 0;
 }
 
-static void alsa_card_pcsp_exit(struct snd_pcsp *chip)
-{
-	snd_card_free(chip->card);
-}
-
 static int pcsp_probe(struct platform_device *dev)
 {
 	int err;
@@ -169,23 +163,13 @@ static int pcsp_probe(struct platform_device *dev)
 		return err;
 
 	err = alsa_card_pcsp_init(&dev->dev);
-	if (err < 0) {
-		pcspkr_input_remove(pcsp_chip.input_dev);
+	if (err < 0)
 		return err;
-	}
 
 	platform_set_drvdata(dev, &pcsp_chip);
 	return 0;
 }
 
-static int pcsp_remove(struct platform_device *dev)
-{
-	struct snd_pcsp *chip = platform_get_drvdata(dev);
-	pcspkr_input_remove(chip->input_dev);
-	alsa_card_pcsp_exit(chip);
-	return 0;
-}
-
 static void pcsp_stop_beep(struct snd_pcsp *chip)
 {
 	pcsp_sync_stop(chip);
@@ -218,7 +202,6 @@ static struct platform_driver pcsp_platform_driver = {
 		.pm	= PCSP_PM_OPS,
 	},
 	.probe		= pcsp_probe,
-	.remove		= pcsp_remove,
 	.shutdown	= pcsp_shutdown,
 };
 
diff --git a/sound/drivers/pcsp/pcsp_input.c b/sound/drivers/pcsp/pcsp_input.c
index e79603fe743d..5a799f7f00a2 100644
--- a/sound/drivers/pcsp/pcsp_input.c
+++ b/sound/drivers/pcsp/pcsp_input.c
@@ -78,7 +78,7 @@ int pcspkr_input_init(struct input_dev **rdev, struct device *dev)
 {
 	int err;
 
-	struct input_dev *input_dev = input_allocate_device();
+	struct input_dev *input_dev = devm_input_allocate_device(dev);
 	if (!input_dev)
 		return -ENOMEM;
 
@@ -95,19 +95,9 @@ int pcspkr_input_init(struct input_dev **rdev, struct device *dev)
 	input_dev->event = pcspkr_input_event;
 
 	err = input_register_device(input_dev);
-	if (err) {
-		input_free_device(input_dev);
+	if (err)
 		return err;
-	}
 
 	*rdev = input_dev;
 	return 0;
 }
-
-int pcspkr_input_remove(struct input_dev *dev)
-{
-	pcspkr_stop_sound();
-	input_unregister_device(dev);	/* this also does kfree() */
-
-	return 0;
-}
diff --git a/sound/drivers/pcsp/pcsp_input.h b/sound/drivers/pcsp/pcsp_input.h
index e80079b38a56..42bfc9eab6eb 100644
--- a/sound/drivers/pcsp/pcsp_input.h
+++ b/sound/drivers/pcsp/pcsp_input.h
@@ -9,7 +9,6 @@
 #define __PCSP_INPUT_H__
 
 int pcspkr_input_init(struct input_dev **rdev, struct device *dev);
-int pcspkr_input_remove(struct input_dev *dev);
 void pcspkr_stop_sound(void);
 
 #endif
-- 
2.26.2

