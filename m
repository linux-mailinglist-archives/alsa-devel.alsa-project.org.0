Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A439F8EE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CACFC1801;
	Tue,  8 Jun 2021 16:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CACFC1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162203;
	bh=nFe5PdAeC6h2uhaPqVOZV/muxqDzXwE83gYqvgz5MK4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mz03mz9Qy4A01uHVWpHbSi1SCB1emmjiVy+F3+dqhAGLB8Qyliv9C+YjwJC9s2aEo
	 bj8OWF1rF2cyJV+5tMnt3W8KkVpuOmWKGMIQhFlZcv/CSA53LBvxr2VfgZcYbd8Bmq
	 8iUOofSOW2eRZgXDqP5LX8qZ/oZkWqWEuJ8/jt8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CDFDF8063C;
	Tue,  8 Jun 2021 16:07:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46AD6F8060D; Tue,  8 Jun 2021 16:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ABF9F804FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ABF9F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="jFd7QYBW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="JDUaSOk/"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 883E2219E2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJs7B1yHZzD6jxFsJBDqVRpDNxljHK04dXJGpCUnjfs=;
 b=jFd7QYBWr4QDvOMrCcpiMzRKuc6I9ITMIBQWnaS226GuSpaSZYX9hORVLIG1RkX+cw4zVV
 OnCr3PgndzR7FWjB9pvzxT+oZoh5aVGT41sFeK08AWT6EBuqeU4oCWBoxBJAj0139zqtQx
 U0s46OAJDM/w2pw0VWKEL6yc9OfbC84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJs7B1yHZzD6jxFsJBDqVRpDNxljHK04dXJGpCUnjfs=;
 b=JDUaSOk/vLxXlBhPNbV2IkMOEw59w7llmtAEaze7msuPgDmC5hwibaw1xgzXR3nmHlXr7C
 fPe3RJbvSyu0hdAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 78B8EA3B88;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/66] ALSA: atiixp: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:53 +0200
Message-Id: <20210608140540.17885-20-tiwai@suse.de>
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

PCI ATIIXP driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 33 ++++++++++++++++++++++-----------
 sound/pci/atiixp_modem.c | 40 +++++++++++++++++++++++++---------------
 2 files changed, 47 insertions(+), 26 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 579425ccbb6a..5f8aa35c4bea 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1039,7 +1039,8 @@ static int snd_atiixp_pcm_open(struct snd_pcm_substream *substream,
 		/* direct SPDIF */
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
 	}
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 	runtime->private_data = dma;
 
@@ -1415,7 +1416,8 @@ static int snd_atiixp_mixer_new(struct atiixp *chip, int clock,
 	if (snd_atiixp_codec_detect(chip) < 0)
 		return -ENXIO;
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus);
+	if (err < 0)
 		return err;
 	pbus->clock = clock;
 	chip->ac97_bus = pbus;
@@ -1431,7 +1433,8 @@ static int snd_atiixp_mixer_new(struct atiixp *chip, int clock,
 		ac97.scaps = AC97_SCAP_SKIP_MODEM | AC97_SCAP_POWER_SAVE;
 		if (! chip->spdif_over_aclink)
 			ac97.scaps |= AC97_SCAP_NO_SPDIF;
-		if ((err = snd_ac97_mixer(pbus, &ac97, &chip->ac97[i])) < 0) {
+		err = snd_ac97_mixer(pbus, &ac97, &chip->ac97[i]);
+		if (err < 0) {
 			chip->ac97[i] = NULL; /* to be sure */
 			dev_dbg(chip->card->dev,
 				"codec %d not available for audio\n", i);
@@ -1562,7 +1565,8 @@ static int snd_atiixp_create(struct snd_card *card,
 	struct atiixp *chip;
 	int err;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
@@ -1576,7 +1580,8 @@ static int snd_atiixp_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	if ((err = pci_request_regions(pci, "ATI IXP AC97")) < 0) {
+	err = pci_request_regions(pci, "ATI IXP AC97");
+	if (err < 0) {
 		pci_disable_device(pci);
 		kfree(chip);
 		return err;
@@ -1599,7 +1604,8 @@ static int snd_atiixp_create(struct snd_card *card,
 	card->sync_irq = chip->irq;
 	pci_set_master(pci);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_atiixp_free(chip);
 		return err;
 	}
@@ -1622,19 +1628,23 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 
 	strcpy(card->driver, spdif_aclink ? "ATIIXP" : "ATIIXP-SPDMA");
 	strcpy(card->shortname, "ATI IXP");
-	if ((err = snd_atiixp_create(card, pci, &chip)) < 0)
+	err = snd_atiixp_create(card, pci, &chip);
+	if (err < 0)
 		goto __error;
 	card->private_data = chip;
 
-	if ((err = snd_atiixp_aclink_reset(chip)) < 0)
+	err = snd_atiixp_aclink_reset(chip);
+	if (err < 0)
 		goto __error;
 
 	chip->spdif_over_aclink = spdif_aclink;
 
-	if ((err = snd_atiixp_mixer_new(chip, ac97_clock, ac97_quirk)) < 0)
+	err = snd_atiixp_mixer_new(chip, ac97_clock, ac97_quirk);
+	if (err < 0)
 		goto __error;
 
-	if ((err = snd_atiixp_pcm_new(chip)) < 0)
+	err = snd_atiixp_pcm_new(chip);
+	if (err < 0)
 		goto __error;
 	
 	snd_atiixp_proc_init(chip);
@@ -1647,7 +1657,8 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 		 chip->ac97[0] ? snd_ac97_get_short_name(chip->ac97[0]) : "?",
 		 chip->addr, chip->irq);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto __error;
 
 	pci_set_drvdata(pci, card);
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 45e75afec7a0..9739c3a82777 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -856,12 +856,12 @@ static int snd_atiixp_pcm_open(struct snd_pcm_substream *substream,
 	dma->substream = substream;
 	runtime->hw = snd_atiixp_pcm_hw;
 	dma->ac97_pcm_type = pcm_type;
-	if ((err = snd_pcm_hw_constraint_list(runtime, 0,
-					      SNDRV_PCM_HW_PARAM_RATE,
-					      &hw_constraints_rates)) < 0)
+	err = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+					 &hw_constraints_rates);
+	if (err < 0)
 		return err;
-	if ((err = snd_pcm_hw_constraint_integer(runtime,
-						 SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 	runtime->private_data = dma;
 
@@ -1058,7 +1058,8 @@ static int snd_atiixp_mixer_new(struct atiixp_modem *chip, int clock)
 	if (snd_atiixp_codec_detect(chip) < 0)
 		return -ENXIO;
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus);
+	if (err < 0)
 		return err;
 	pbus->clock = clock;
 	chip->ac97_bus = pbus;
@@ -1072,7 +1073,8 @@ static int snd_atiixp_mixer_new(struct atiixp_modem *chip, int clock)
 		ac97.pci = chip->pci;
 		ac97.num = i;
 		ac97.scaps = AC97_SCAP_SKIP_AUDIO | AC97_SCAP_POWER_SAVE;
-		if ((err = snd_ac97_mixer(pbus, &ac97, &chip->ac97[i])) < 0) {
+		err = snd_ac97_mixer(pbus, &ac97, &chip->ac97[i]);
+		if (err < 0) {
 			chip->ac97[i] = NULL; /* to be sure */
 			dev_dbg(chip->card->dev,
 				"codec %d not available for modem\n", i);
@@ -1192,7 +1194,8 @@ static int snd_atiixp_create(struct snd_card *card,
 	struct atiixp_modem *chip;
 	int err;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
@@ -1206,7 +1209,8 @@ static int snd_atiixp_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	if ((err = pci_request_regions(pci, "ATI IXP MC97")) < 0) {
+	err = pci_request_regions(pci, "ATI IXP MC97");
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -1229,7 +1233,8 @@ static int snd_atiixp_create(struct snd_card *card,
 	card->sync_irq = chip->irq;
 	pci_set_master(pci);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_atiixp_free(chip);
 		return err;
 	}
@@ -1252,17 +1257,21 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 
 	strcpy(card->driver, "ATIIXP-MODEM");
 	strcpy(card->shortname, "ATI IXP Modem");
-	if ((err = snd_atiixp_create(card, pci, &chip)) < 0)
+	err = snd_atiixp_create(card, pci, &chip);
+	if (err < 0)
 		goto __error;
 	card->private_data = chip;
 
-	if ((err = snd_atiixp_aclink_reset(chip)) < 0)
+	err = snd_atiixp_aclink_reset(chip);
+	if (err < 0)
 		goto __error;
 
-	if ((err = snd_atiixp_mixer_new(chip, ac97_clock)) < 0)
+	err = snd_atiixp_mixer_new(chip, ac97_clock);
+	if (err < 0)
 		goto __error;
 
-	if ((err = snd_atiixp_pcm_new(chip)) < 0)
+	err = snd_atiixp_pcm_new(chip);
+	if (err < 0)
 		goto __error;
 	
 	snd_atiixp_proc_init(chip);
@@ -1272,7 +1281,8 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 	sprintf(card->longname, "%s rev %x at 0x%lx, irq %i",
 		card->shortname, pci->revision, chip->addr, chip->irq);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto __error;
 
 	pci_set_drvdata(pci, card);
-- 
2.26.2

