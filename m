Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF9A39F878
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAAB816DE;
	Tue,  8 Jun 2021 16:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAAB816DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161334;
	bh=H4HHwa/GYSAL3mpDQFPXcCPlGNKkKKgyufphyCFFDmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MEUf1iYtRqMmw0pEaR8+otcwW4HeZkApRLn4E1n0zabAQPEEnkQrIBI4PKnBpuPYU
	 aYSKcx+Fo6fq1eh56THq+EwB5pY00cRqC40C4tYMUFkBiFB2nTzPvwFh/4d0KM0+4k
	 rCCVCXDp4aXGEvezy/KwW3iha4hP0k8czsAWR3O8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82BE4F80543;
	Tue,  8 Jun 2021 16:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20679F8019B; Tue,  8 Jun 2021 16:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD5DF80227
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD5DF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="os7HILAA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4SkmJ4LB"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6ACE01FD59
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMcBGkcAi8GaQxmxe7DVDCbpP8M7oiW+SCPNRtPQXJ8=;
 b=os7HILAAZQ5jp6pKjkAZ9+gIXNY7KJYwVjfHqYy5jwXi+gp4dw+YzosZueBVpZW7ERvHAU
 lOqgiz337ErrEfUZgOCisnqSkcHgBhZd7/Y/sVlTyc9TDfcUG1vsi3yGzuiiI/drYaIe8u
 +secVkkOYxj35hrAGMxayKPjAAB6Rew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMcBGkcAi8GaQxmxe7DVDCbpP8M7oiW+SCPNRtPQXJ8=;
 b=4SkmJ4LBeHVlOiIS+GBwoCYbZ0puzcqTpDsam4iGq6Y/CGd/Ze903YestjTpIao68hYOvB
 eeRn0yt+vj2jzzAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5B847A3B89;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/66] ALSA: als300: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:51 +0200
Message-Id: <20210608140540.17885-18-tiwai@suse.de>
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

PCI ALS300 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als300.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index bd4fd09e982b..668008fc21f7 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -298,7 +298,8 @@ static int snd_als300_ac97(struct snd_als300 *chip)
 		.read = snd_als300_ac97_read,
 	};
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, NULL, &bus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, NULL, &bus);
+	if (err < 0)
 		return err;
 
 	memset(&ac97, 0, sizeof(ac97));
@@ -621,7 +622,8 @@ static int snd_als300_create(struct snd_card *card,
 	};
 	*rchip = NULL;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
@@ -643,7 +645,8 @@ static int snd_als300_create(struct snd_card *card,
 	chip->chip_type = chip_type;
 	spin_lock_init(&chip->reg_lock);
 
-	if ((err = pci_request_regions(pci, "ALS300")) < 0) {
+	err = pci_request_regions(pci, "ALS300");
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -673,14 +676,15 @@ static int snd_als300_create(struct snd_card *card,
 		return err;
 	}
 
-	if ((err = snd_als300_new_pcm(chip)) < 0) {
+	err = snd_als300_new_pcm(chip);
+	if (err < 0) {
 		dev_err(card->dev, "Could not create PCM\n");
 		snd_als300_free(chip);
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
-						chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_als300_free(chip);
 		return err;
 	}
@@ -741,7 +745,8 @@ static int snd_als300_probe(struct pci_dev *pci,
 
 	chip_type = pci_id->driver_data;
 
-	if ((err = snd_als300_create(card, pci, chip_type, &chip)) < 0) {
+	err = snd_als300_create(card, pci, chip_type, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -758,7 +763,8 @@ static int snd_als300_probe(struct pci_dev *pci,
 	sprintf(card->longname, "%s at 0x%lx irq %i",
 				card->shortname, chip->port, chip->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

