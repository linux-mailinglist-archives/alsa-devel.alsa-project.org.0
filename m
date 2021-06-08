Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3339F8D6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A3931794;
	Tue,  8 Jun 2021 16:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A3931794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161937;
	bh=F8PIYRGN+CCr6A3FE+vbm0FJCQIzD8s7RHploxxgk4g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHHdFmv2JX6H3GnJ5ZyMK8ghBTaxxXX7ALQIRYwktQhzuo+D48EeOFwJBLcvrUs1W
	 p0efjLU2f2l/IoLZk1cf1lPCPWMxbw5yJN5HNerdIRbM1WkjBz8dka57pdqYR+rbbP
	 mY2CqSqzsrUNSesCm0Yj7jdxDNy2UTy1b167vfdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50E09F80607;
	Tue,  8 Jun 2021 16:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C764CF805F3; Tue,  8 Jun 2021 16:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AA1EF804E5
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AA1EF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="17jhbE+y"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Wtbr2TCY"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 087CF1FDED
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88AndhKdAT76x6xvspiQKrkvmk8VN4fIvqcJYXn9TQc=;
 b=17jhbE+ys9nf0T03CzzAaDx2Wt6ytQcw7xq0WuUFJkUAzoPp5sqZd4cAdbe1rLeQEgjOhh
 AkGGdZb3TDGietAy2oX2mpdVCMcA1Ggzu+qD04iTKk2ANjQHyhOxAkdruyMdhhZs+qajZc
 9mVSIxSTT2J5WndFYOOS7oyQaKYHC2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88AndhKdAT76x6xvspiQKrkvmk8VN4fIvqcJYXn9TQc=;
 b=Wtbr2TCYE9/xiBUoiSuf+LgDM+xwwN3xWgm2UR4zdx321d7ZZzUT3Dt4m7L+WOdHnbajnD
 nuMEancx0HeARiDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id ED097A3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 45/66] ALSA: nm256: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:19 +0200
Message-Id: <20210608140540.17885-46-tiwai@suse.de>
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

PCI NM256 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 6cb689aa28c2..12d02d7d3b51 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1318,7 +1318,8 @@ snd_nm256_mixer(struct nm256 *chip)
 	if (! chip->ac97_regs)
 		return -ENOMEM;
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 
 	memset(&ac97, 0, sizeof(ac97));
@@ -1476,7 +1477,8 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 
 	*chip_ret = NULL;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
@@ -1568,7 +1570,8 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 		chip->buffer_end = buffer_top;
 	else {
 		/* get buffer end pointer from signature */
-		if ((err = snd_nm256_peek_for_sig(chip)) < 0)
+		err = snd_nm256_peek_for_sig(chip);
+		if (err < 0)
 			goto __error;
 	}
 
@@ -1618,7 +1621,8 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 
 	// pci_set_master(pci); /* needed? */
 	
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0)
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0)
 		goto __error;
 
 	*chip_ret = chip;
@@ -1700,7 +1704,8 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		capture_bufsize = 4;
 	if (capture_bufsize > 128)
 		capture_bufsize = 128;
-	if ((err = snd_nm256_create(card, pci, &chip)) < 0) {
+	err = snd_nm256_create(card, pci, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1716,8 +1721,13 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		chip->reset_workaround_2 = 1;
 	}
 
-	if ((err = snd_nm256_pcm(chip, 0)) < 0 ||
-	    (err = snd_nm256_mixer(chip)) < 0) {
+	err = snd_nm256_pcm(chip, 0);
+	if (err < 0) {
+		snd_card_free(card);
+		return err;
+	}
+	err = snd_nm256_mixer(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1727,7 +1737,8 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		card->shortname,
 		chip->buffer_addr, chip->cport_addr, chip->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

