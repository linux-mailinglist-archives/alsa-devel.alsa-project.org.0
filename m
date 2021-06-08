Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5539F8FD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A95E61825;
	Tue,  8 Jun 2021 16:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A95E61825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162294;
	bh=jR/yXyXL8RkTk507GQl8Fyc4Iytko6yVQakxk+/tFuI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAMBguyFBKJicLmvv7KZEMAYxNaJrpQaXNxIJVZgx+lPrPa0C6wc9opljhFaOzLDk
	 t/r+EUjFNONDnNnw/KuHjhACNANwKXPNEg+1CXM3qofxXfqm0F8oIHRs0277oFDUNV
	 vEJ9VEgBfRK1jYsZrbAiE1mRW/tnHQSy5r43YDBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A05E9F80520;
	Tue,  8 Jun 2021 16:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5161BF8061C; Tue,  8 Jun 2021 16:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AAD0F80218
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AAD0F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="JhjO2f2D"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aOOr90Q1"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DB0CE219E4
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6xoBu+SlD976qWqssA9xQPt1AXjcZ48xWP2e8xlD7w=;
 b=JhjO2f2D1Xa517eIu6N8RkvW467yTxZ+1EWi8jRxO96ohF54vZZv7bVz8GK6Lpq5+JlzMA
 A5OJqYwChY4PtrHqiV9abWl3ccWHzkofXncCAjX3iPaPk9iajkhBK7c5Z4NizAasvM7bDW
 it85rxUg4aZcbXz5gPlXuJTrQZkXZe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6xoBu+SlD976qWqssA9xQPt1AXjcZ48xWP2e8xlD7w=;
 b=aOOr90Q1BlgDU3xZvBB1Sh9HFz9opAic3I9l7vvChsRDvtJH1wh2CKVNKdkblS6tO6lIXu
 NsZ33qZZeX1623DA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CAE6AA3B88;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 25/66] ALSA: es1938: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:59 +0200
Message-Id: <20210608140540.17885-26-tiwai@suse.de>
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

PCI ES1938 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1938.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index afc66347d162..33b1eb347a27 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -293,7 +293,8 @@ static void snd_es1938_write_cmd(struct es1938 *chip, unsigned char cmd)
 	int i;
 	unsigned char v;
 	for (i = 0; i < WRITE_LOOP_TIMEOUT; i++) {
-		if (!(v = inb(SLSB_REG(chip, READSTATUS)) & 0x80)) {
+		v = inb(SLSB_REG(chip, READSTATUS));
+		if (!(v & 0x80)) {
 			outb(cmd, SLSB_REG(chip, WRITEDATA));
 			return;
 		}
@@ -309,9 +310,11 @@ static int snd_es1938_get_byte(struct es1938 *chip)
 {
 	int i;
 	unsigned char v;
-	for (i = GET_LOOP_TIMEOUT; i; i--)
-		if ((v = inb(SLSB_REG(chip, STATUS))) & 0x80)
+	for (i = GET_LOOP_TIMEOUT; i; i--) {
+		v = inb(SLSB_REG(chip, STATUS));
+		if (v & 0x80)
 			return inb(SLSB_REG(chip, READDATA));
+	}
 	dev_err(chip->card->dev, "get_byte timeout: status 0x02%x\n", v);
 	return -ENODEV;
 }
@@ -993,7 +996,8 @@ static int snd_es1938_new_pcm(struct es1938 *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(chip->card, "es-1938-1946", device, 2, 1, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "es-1938-1946", device, 2, 1, &pcm);
+	if (err < 0)
 		return err;
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_es1938_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_es1938_capture_ops);
@@ -1553,7 +1557,8 @@ static int snd_es1938_create(struct snd_card *card,
 	*rchip = NULL;
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
         /* check, if we can restrict PCI DMA transfers to 24 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
@@ -1573,7 +1578,8 @@ static int snd_es1938_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	if ((err = pci_request_regions(pci, "ESS Solo-1")) < 0) {
+	err = pci_request_regions(pci, "ESS Solo-1");
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -1599,7 +1605,8 @@ static int snd_es1938_create(struct snd_card *card,
 
 	snd_es1938_chip_init(chip);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_es1938_free(chip);
 		return err;
 	}
@@ -1731,7 +1738,8 @@ static int snd_es1938_mixer(struct es1938 *chip)
 				kctl->private_free = snd_es1938_hwv_free;
 				break;
 			}
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 	}
 	return 0;
@@ -1765,7 +1773,8 @@ static int snd_es1938_probe(struct pci_dev *pci,
 		    	return -ENODEV;
 		}
 	}
-	if ((err = snd_es1938_create(card, pci, &chip)) < 0) {
+	err = snd_es1938_create(card, pci, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1778,11 +1787,13 @@ static int snd_es1938_probe(struct pci_dev *pci,
 		chip->revision,
 		chip->irq);
 
-	if ((err = snd_es1938_new_pcm(chip, 0)) < 0) {
+	err = snd_es1938_new_pcm(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_es1938_mixer(chip)) < 0) {
+	err = snd_es1938_mixer(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1793,11 +1804,13 @@ static int snd_es1938_probe(struct pci_dev *pci,
 		dev_err(card->dev, "OPL3 not detected at 0x%lx\n",
 			   SLSB_REG(chip, FMLOWADDR));
 	} else {
-	        if ((err = snd_opl3_timer_new(opl3, 0, 1)) < 0) {
+		err = snd_opl3_timer_new(opl3, 0, 1);
+		if (err < 0) {
 	                snd_card_free(card);
 	                return err;
 		}
-	        if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
+		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+		if (err < 0) {
 	                snd_card_free(card);
 	                return err;
 		}
@@ -1815,7 +1828,8 @@ static int snd_es1938_probe(struct pci_dev *pci,
 
 	snd_es1938_create_gameport(chip);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

