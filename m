Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7F39F8C0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE261785;
	Tue,  8 Jun 2021 16:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE261785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161745;
	bh=qFLOavU54pz6bidWQlC5CS7tNMdI1uf/yHGjTXKEOyY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FG64w5BnP+mZabv7FYmKLH6rTcTUhUOWEhSWo0H2ayu4sC1oCeBs3zY3KgMs9odHf
	 4xqcwAU8fttHyvScEVObPLcJ0Sqr5ogVmv6eAOTWsCCM6YqMEddgiS4y7xJr3AzjQ/
	 TKTuUaHQwexW8rOJnm3a+OqMxvYcIcC0qU8Iz4hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C211BF805E5;
	Tue,  8 Jun 2021 16:06:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 102B5F805B2; Tue,  8 Jun 2021 16:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 015C5F804D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 015C5F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="mHgVkZLg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="17/XaTbq"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BE3EC1FD5E
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/anyIUUM+4LjLDTbEqhbDnHp5tyg5myDxU7hYPe1kqM=;
 b=mHgVkZLgHZjbeYuC1LFcWzPnE6NO3kBGOCJOcBX+YHMaTfNz4zEu21JzjmbotESc+v+4bD
 c4D4zlIphr1wodKFvMMIAu+VRF5yk+b4WrITFjkDAXm41ExM9X9nj2KTUKwFOoitP5EoUm
 AVCVaBym6A1w/vJUPdQMIbfi1X/jr2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/anyIUUM+4LjLDTbEqhbDnHp5tyg5myDxU7hYPe1kqM=;
 b=17/XaTbqSocQgurOGF2rRP1JeE6OtllG2dFde6OJsqyFYmP94wprUrfO0k1r4gLy5xq2ty
 9jibYVib9bWeuwBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AF691A3B88;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 23/66] ALSA: cs4281: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:57 +0200
Message-Id: <20210608140540.17885-24-tiwai@suse.de>
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

PCI CS4281 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs4281.c | 54 ++++++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index bf3bb70ffaf9..e122a168c148 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1068,23 +1068,28 @@ static int snd_cs4281_mixer(struct cs4281 *chip)
 		.read = snd_cs4281_ac97_read,
 	};
 
-	if ((err = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus)) < 0)
+	err = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus);
+	if (err < 0)
 		return err;
 	chip->ac97_bus->private_free = snd_cs4281_mixer_free_ac97_bus;
 
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = chip;
 	ac97.private_free = snd_cs4281_mixer_free_ac97;
-	if ((err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 	if (chip->dual_codec) {
 		ac97.num = 1;
-		if ((err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97_secondary)) < 0)
+		err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97_secondary);
+		if (err < 0)
 			return err;
 	}
-	if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4281_fm_vol, chip))) < 0)
+	err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4281_fm_vol, chip));
+	if (err < 0)
 		return err;
-	if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4281_pcm_vol, chip))) < 0)
+	err = snd_ctl_add(card, snd_ctl_new1(&snd_cs4281_pcm_vol, chip));
+	if (err < 0)
 		return err;
 	return 0;
 }
@@ -1308,7 +1313,8 @@ static int snd_cs4281_create(struct snd_card *card,
 	};
 
 	*rchip = NULL;
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL) {
@@ -1326,7 +1332,8 @@ static int snd_cs4281_create(struct snd_card *card,
 	}
 	chip->dual_codec = dual_codec;
 
-	if ((err = pci_request_regions(pci, "CS4281")) < 0) {
+	err = pci_request_regions(pci, "CS4281");
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -1356,7 +1363,8 @@ static int snd_cs4281_create(struct snd_card *card,
 		return tmp;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_cs4281_free(chip);
 		return err;
 	}
@@ -1395,12 +1403,14 @@ static int snd_cs4281_chip_init(struct cs4281 *chip)
          * space between 0e4h and 0ffh to be written. */	
 	snd_cs4281_pokeBA0(chip, BA0_CWPR, 0x4281);
 	
-	if ((tmp = snd_cs4281_peekBA0(chip, BA0_SERC1)) != (BA0_SERC1_SO1EN | BA0_SERC1_AC97)) {
+	tmp = snd_cs4281_peekBA0(chip, BA0_SERC1);
+	if (tmp != (BA0_SERC1_SO1EN | BA0_SERC1_AC97)) {
 		dev_err(chip->card->dev,
 			"SERC1 AC'97 check failed (0x%x)\n", tmp);
 		return -EIO;
 	}
-	if ((tmp = snd_cs4281_peekBA0(chip, BA0_SERC2)) != (BA0_SERC2_SI1EN | BA0_SERC2_AC97)) {
+	tmp = snd_cs4281_peekBA0(chip, BA0_SERC2);
+	if (tmp != (BA0_SERC2_SI1EN | BA0_SERC2_AC97)) {
 		dev_err(chip->card->dev,
 			"SERC2 AC'97 check failed (0x%x)\n", tmp);
 		return -EIO;
@@ -1748,7 +1758,8 @@ static int snd_cs4281_midi(struct cs4281 *chip, int device)
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(chip->card, "CS4281", device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(chip->card, "CS4281", device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 	strcpy(rmidi->name, "CS4281");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_cs4281_midi_output);
@@ -1881,32 +1892,38 @@ static int snd_cs4281_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	if ((err = snd_cs4281_create(card, pci, &chip, dual_codec[dev])) < 0) {
+	err = snd_cs4281_create(card, pci, &chip, dual_codec[dev]);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	card->private_data = chip;
 
-	if ((err = snd_cs4281_mixer(chip)) < 0) {
+	err = snd_cs4281_mixer(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_cs4281_pcm(chip, 0)) < 0) {
+	err = snd_cs4281_pcm(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_cs4281_midi(chip, 0)) < 0) {
+	err = snd_cs4281_midi(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_opl3_new(card, OPL3_HW_OPL3_CS4281, &opl3)) < 0) {
+	err = snd_opl3_new(card, OPL3_HW_OPL3_CS4281, &opl3);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	opl3->private_data = chip;
 	opl3->command = snd_cs4281_opl3_command;
 	snd_opl3_init(opl3);
-	if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
+	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1918,7 +1935,8 @@ static int snd_cs4281_probe(struct pci_dev *pci,
 		chip->ba0_addr,
 		chip->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2

