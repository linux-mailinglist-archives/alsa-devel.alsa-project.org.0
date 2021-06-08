Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CE939F90B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC0017B5;
	Tue,  8 Jun 2021 16:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC0017B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162429;
	bh=4x7atCLBwhXnTKWp9LGln2F1jYwDDFjyqm6lNKmdI48=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eYoHrgF++44A5AIgeM/rNcbGLLg4etQ3/oPMwiWaB/FMVGdQLDUdjMg+9gsphNIK4
	 F6fTgU6kgjJYE7ceAmwWduZW6M5pPwLSJ8bZgury8vX3IcPOdZ8p35WW0JMg4n6lWY
	 afnHu2fpIfsrI0vsnCdCDThttAHiqENY5fMCm9mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32237F806EC;
	Tue,  8 Jun 2021 16:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F10C0F80517; Tue,  8 Jun 2021 16:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F198EF80517
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F198EF80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="kH9T1DPn"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="o5ij+r/e"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9A554219E9
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zrr4gQHCUKEw4VavQJPy1tbVXsA7gcjKqCUgUDfLD2g=;
 b=kH9T1DPnl2Im/UoJ4fy7Q6xHsHYmNRkjhp6JlFLmgVvh0MoeV8WFI32k55Mhhla/5rvlkk
 ZecDw2SzQvT5kbj3LBnnw2ce3nH6sEmN+YM24paxJLGSHOWawwORNEPt+Y1DhJsjEO+KQI
 M0OOQ3Cg2WRnyUzY6MPjQ1NjvoqFwnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zrr4gQHCUKEw4VavQJPy1tbVXsA7gcjKqCUgUDfLD2g=;
 b=o5ij+r/ewLQ7xApvN8R6ZTZLL2DxaG+UL+QjFp/tI008LaIuJIGTSXYIIrTeYyKYCazkbo
 qdpQEFE09QUo8xBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8A6AFA3B89;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 38/66] ALSA: cs5535audio: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:12 +0200
Message-Id: <20210608140540.17885-39-tiwai@suse.de>
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

PCI CS5535 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs5535audio/cs5535audio.c     | 28 ++++++++++++++++---------
 sound/pci/cs5535audio/cs5535audio_pcm.c | 10 +++++----
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 9b716b56d739..e048b45d9e7e 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -143,7 +143,8 @@ static int snd_cs5535audio_mixer(struct cs5535audio *cs5535au)
 		.read = snd_cs5535audio_ac97_codec_read,
 	};
 
-	if ((err = snd_ac97_bus(card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 
 	memset(&ac97, 0, sizeof(ac97));
@@ -155,7 +156,8 @@ static int snd_cs5535audio_mixer(struct cs5535audio *cs5535au)
 	/* set any OLPC-specific scaps */
 	olpc_prequirks(card, &ac97);
 
-	if ((err = snd_ac97_mixer(pbus, &ac97, &cs5535au->ac97)) < 0) {
+	err = snd_ac97_mixer(pbus, &ac97, &cs5535au->ac97);
+	if (err < 0) {
 		dev_err(card->dev, "mixer failed\n");
 		return err;
 	}
@@ -266,7 +268,8 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	};
 
 	*rcs5535au = NULL;
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
@@ -286,7 +289,8 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	cs5535au->pci = pci;
 	cs5535au->irq = -1;
 
-	if ((err = pci_request_regions(pci, "CS5535 Audio")) < 0) {
+	err = pci_request_regions(pci, "CS5535 Audio");
+	if (err < 0) {
 		kfree(cs5535au);
 		goto pcifail;
 	}
@@ -304,8 +308,8 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	card->sync_irq = cs5535au->irq;
 	pci_set_master(pci);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
-				  cs5535au, &ops)) < 0)
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, cs5535au, &ops);
+	if (err < 0)
 		goto sndfail;
 
 	*rcs5535au = cs5535au;
@@ -340,15 +344,18 @@ static int snd_cs5535audio_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	if ((err = snd_cs5535audio_create(card, pci, &cs5535au)) < 0)
+	err = snd_cs5535audio_create(card, pci, &cs5535au);
+	if (err < 0)
 		goto probefail_out;
 
 	card->private_data = cs5535au;
 
-	if ((err = snd_cs5535audio_mixer(cs5535au)) < 0)
+	err = snd_cs5535audio_mixer(cs5535au);
+	if (err < 0)
 		goto probefail_out;
 
-	if ((err = snd_cs5535audio_pcm(cs5535au)) < 0)
+	err = snd_cs5535audio_pcm(cs5535au);
+	if (err < 0)
 		goto probefail_out;
 
 	strcpy(card->driver, DRIVER_NAME);
@@ -358,7 +365,8 @@ static int snd_cs5535audio_probe(struct pci_dev *pci,
 		card->shortname, card->driver,
 		cs5535au->port, cs5535au->irq);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto probefail_out;
 
 	pci_set_drvdata(pci, card);
diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 4032b89b1fc1..5ff10fec7b90 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -87,8 +87,9 @@ static int snd_cs5535audio_playback_open(struct snd_pcm_substream *substream)
 	snd_pcm_limit_hw_rates(runtime);
 	cs5535au->playback_substream = substream;
 	runtime->private_data = &(cs5535au->dmas[CS5535AUDIO_DMA_PLAYBACK]);
-	if ((err = snd_pcm_hw_constraint_integer(runtime,
-				SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 
 	return 0;
@@ -342,8 +343,9 @@ static int snd_cs5535audio_capture_open(struct snd_pcm_substream *substream)
 	snd_pcm_limit_hw_rates(runtime);
 	cs5535au->capture_substream = substream;
 	runtime->private_data = &(cs5535au->dmas[CS5535AUDIO_DMA_CAPTURE]);
-	if ((err = snd_pcm_hw_constraint_integer(runtime,
-					 SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 	olpc_capture_open(cs5535au->ac97);
 	return 0;
-- 
2.26.2

