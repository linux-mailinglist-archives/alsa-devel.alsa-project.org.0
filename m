Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021839F880
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373A71732;
	Tue,  8 Jun 2021 16:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373A71732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161450;
	bh=jJBra0MhxW1522PRDcJFyqZRY73pOv32Kv5AhHgrprw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EEW6445o9nqedL1Doi4EFGJPFzvRTmI63dtYZXuy3TFsngKqoCxV90qSAjEF7mk91
	 2M7zPG6wH8c4F8noMjldkPZkK7GxabZkiE9xB5Elrq7YQCMMyzxMtrEj7YwyAQquFh
	 mUbKZlDUTv85C1DZMISBK3lxJ8ZfhnLn+KWYrfGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E93EEF80568;
	Tue,  8 Jun 2021 16:06:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ABECF80557; Tue,  8 Jun 2021 16:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5983F804AD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5983F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="l7gkBm5T"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="kK+8hlLc"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 592A81FD58
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYYO28bjeU8Exu1/ElDX7Ep5x15PkwvUSZJv08j/XB8=;
 b=l7gkBm5Tcd4IK95KbNCPnYrYnzZH/SRxtlR+qedth1KyduVmDHkVa5EAAzIdl+mWn0Lw4Z
 xcSHG2J6Y0S9xh7WWhwMbHQXih/X0y6wpgoMQIS45povRPlMzffeYrdSZET6uKS1tPJB++
 CISDNY0bJVjBxBGu/PRsSNcjAp2GwH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYYO28bjeU8Exu1/ElDX7Ep5x15PkwvUSZJv08j/XB8=;
 b=kK+8hlLcdWTq0lpiSIw4ivXhfdIxt7SkXKa/8s3sL/ozaBYQLFE26RNx71lBawIXXoflo1
 BTeR1yTPMHA2vrDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 48AF7A3B84;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/66] ALSA: ad1889: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:49 +0200
Message-Id: <20210608140540.17885-16-tiwai@suse.de>
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

PCI AD1889 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 4520022801d9..5c78951dd596 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -852,7 +852,8 @@ snd_ad1889_create(struct snd_card *card,
 
 	*rchip = NULL;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	/* check PCI availability (32bit DMA) */
@@ -863,7 +864,8 @@ snd_ad1889_create(struct snd_card *card,
 	}
 
 	/* allocate chip specific data with zero-filled memory */
-	if ((chip = kzalloc(sizeof(*chip), GFP_KERNEL)) == NULL) {
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	if (!chip) {
 		pci_disable_device(pci);
 		return -ENOMEM;
 	}
@@ -874,7 +876,8 @@ snd_ad1889_create(struct snd_card *card,
 	chip->irq = -1;
 
 	/* (1) PCI resource allocation */
-	if ((err = pci_request_regions(pci, card->driver)) < 0)
+	err = pci_request_regions(pci, card->driver);
+	if (err < 0)
 		goto free_and_ret;
 
 	chip->bar = pci_resource_start(pci, 0);
@@ -900,12 +903,14 @@ snd_ad1889_create(struct snd_card *card,
 	card->sync_irq = chip->irq;
 
 	/* (2) initialization of the chip hardware */
-	if ((err = snd_ad1889_init(chip)) < 0) {
+	err = snd_ad1889_init(chip);
+	if (err < 0) {
 		snd_ad1889_free(chip);
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_ad1889_free(chip);
 		return err;
 	}
-- 
2.26.2

