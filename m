Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1439F914
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30191898;
	Tue,  8 Jun 2021 16:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30191898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162496;
	bh=hGDo0tUJ9sduzoXMHceClOGorI+S5xrVTOr/N1uAgsA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFd6KZoxPt0B1X60uLlFHn10tqDt9J2m9A2mjV/TdQjLwRtV9+snoW8QfQNOyyUEm
	 X3p9hC9Ejui+1NfIrLkmPWJPU7alkwOQoY2mD7sm4YBfDwQ7dy0fFOPhNRqcMRD7jA
	 5b+Kzuauxt8loyTB14xiTQgsGylQTabumuG1Cq50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7254FF80709;
	Tue,  8 Jun 2021 16:07:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD608F80630; Tue,  8 Jun 2021 16:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02CD3F80515
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02CD3F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xRmLkGR8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xacYYwlz"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EE647219EE
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=268R7RfcLPOHgTg88iRr0AiSpy1Cm6EldI+/sd5YZOY=;
 b=xRmLkGR8hbVH6XjSLuBgHp9qvx8cxoqe0aGacuXKFKwspcHjlJn4OwjMYTRgRbe17kW9hq
 WdYjh1iWtJTXp/7bbC3pyCWWyQyHWCWLXbwjiRkKhVQvr7jCjGI6ZpgdxMf2HgeIn7cDb8
 kYju5GqKumOzlpH5oNXj+1BaOQndMY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=268R7RfcLPOHgTg88iRr0AiSpy1Cm6EldI+/sd5YZOY=;
 b=xacYYwlzdPLeZ0P31yt+60DChJ6qm+maepam7C15qeV/0xbNEi027B2R9cO9oo666D7OaU
 ggflnOlkeXMmNyCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id DDBCEA3B88;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 44/66] ALSA: mixart: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:18 +0200
Message-Id: <20210608140540.17885-45-tiwai@suse.de>
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

PCI miXart driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/mixart/mixart.c       | 29 ++++++++++++++++++-----------
 sound/pci/mixart/mixart_hwdep.c | 17 ++++++++++++-----
 sound/pci/mixart/mixart_mixer.c | 33 ++++++++++++++++++++++-----------
 3 files changed, 52 insertions(+), 27 deletions(-)

diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index a0bbb386dc25..1b078b789604 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -954,9 +954,10 @@ static int snd_mixart_pcm_analog(struct snd_mixart *chip)
 	char name[32];
 
 	sprintf(name, "miXart analog %d", chip->chip_idx);
-	if ((err = snd_pcm_new(chip->card, name, MIXART_PCM_ANALOG,
-			       MIXART_PLAYBACK_STREAMS,
-			       MIXART_CAPTURE_STREAMS, &pcm)) < 0) {
+	err = snd_pcm_new(chip->card, name, MIXART_PCM_ANALOG,
+			  MIXART_PLAYBACK_STREAMS,
+			  MIXART_CAPTURE_STREAMS, &pcm);
+	if (err < 0) {
 		dev_err(chip->card->dev,
 			"cannot create the analog pcm %d\n", chip->chip_idx);
 		return err;
@@ -987,9 +988,10 @@ static int snd_mixart_pcm_digital(struct snd_mixart *chip)
 	char name[32];
 
 	sprintf(name, "miXart AES/EBU %d", chip->chip_idx);
-	if ((err = snd_pcm_new(chip->card, name, MIXART_PCM_DIGITAL,
-			       MIXART_PLAYBACK_STREAMS,
-			       MIXART_CAPTURE_STREAMS, &pcm)) < 0) {
+	err = snd_pcm_new(chip->card, name, MIXART_PCM_DIGITAL,
+			  MIXART_PLAYBACK_STREAMS,
+			  MIXART_CAPTURE_STREAMS, &pcm);
+	if (err < 0) {
 		dev_err(chip->card->dev,
 			"cannot create the digital pcm %d\n", chip->chip_idx);
 		return err;
@@ -1042,7 +1044,8 @@ static int snd_mixart_create(struct mixart_mgr *mgr, struct snd_card *card, int
 	chip->mgr = mgr;
 	card->sync_irq = mgr->irq;
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_mixart_chip_free(chip);
 		return err;
 	}
@@ -1243,7 +1246,8 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	}
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	pci_set_master(pci);
 
@@ -1267,7 +1271,8 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	mgr->irq = -1;
 
 	/* resource assignment */
-	if ((err = pci_request_regions(pci, CARD_NAME)) < 0) {
+	err = pci_request_regions(pci, CARD_NAME);
+	if (err < 0) {
 		kfree(mgr);
 		pci_disable_device(pci);
 		return err;
@@ -1332,7 +1337,8 @@ static int snd_mixart_probe(struct pci_dev *pci,
 			"Digigram miXart at 0x%lx & 0x%lx, irq %i [PCM #%d]",
 			mgr->mem[0].phys, mgr->mem[1].phys, mgr->irq, i);
 
-		if ((err = snd_mixart_create(mgr, card, i)) < 0) {
+		err = snd_mixart_create(mgr, card, i);
+		if (err < 0) {
 			snd_card_free(card);
 			snd_mixart_free(mgr);
 			return err;
@@ -1343,7 +1349,8 @@ static int snd_mixart_probe(struct pci_dev *pci,
 			snd_mixart_proc_init(mgr->chip[i]);
 		}
 
-		if ((err = snd_card_register(card)) < 0) {
+		err = snd_card_register(card);
+		if (err < 0) {
 			snd_mixart_free(mgr);
 			return err;
 		}
diff --git a/sound/pci/mixart/mixart_hwdep.c b/sound/pci/mixart/mixart_hwdep.c
index f579f7698bba..689c0f995a9c 100644
--- a/sound/pci/mixart/mixart_hwdep.c
+++ b/sound/pci/mixart/mixart_hwdep.c
@@ -306,9 +306,13 @@ static int mixart_first_init(struct mixart_mgr *mgr)
 	int err;
 	struct mixart_msg request;
 
-	if((err = mixart_enum_connectors(mgr)) < 0) return err;
+	err = mixart_enum_connectors(mgr);
+	if (err < 0)
+		return err;
 
-	if((err = mixart_enum_physio(mgr)) < 0) return err;
+	err = mixart_enum_physio(mgr);
+	if (err < 0)
+		return err;
 
 	/* send a synchro command to card (necessary to do this before first MSG_STREAM_START_STREAM_GRP_PACKET) */
 	/* though why not here */
@@ -528,15 +532,18 @@ static int mixart_dsp_load(struct mixart_mgr* mgr, int index, const struct firmw
         for (card_index = 0; card_index < mgr->num_cards; card_index++) {
 		struct snd_mixart *chip = mgr->chip[card_index];
 
-		if ((err = snd_mixart_create_pcm(chip)) < 0)
+		err = snd_mixart_create_pcm(chip);
+		if (err < 0)
 			return err;
 
 		if (card_index == 0) {
-			if ((err = snd_mixart_create_mixer(chip->mgr)) < 0)
+			err = snd_mixart_create_mixer(chip->mgr);
+			if (err < 0)
 	        		return err;
 		}
 
-		if ((err = snd_card_register(chip->card)) < 0)
+		err = snd_card_register(chip->card);
+		if (err < 0)
 			return err;
 	}
 
diff --git a/sound/pci/mixart/mixart_mixer.c b/sound/pci/mixart/mixart_mixer.c
index d2e7c3381267..2727f3345795 100644
--- a/sound/pci/mixart/mixart_mixer.c
+++ b/sound/pci/mixart/mixart_mixer.c
@@ -1114,10 +1114,12 @@ int snd_mixart_create_mixer(struct mixart_mgr *mgr)
 		temp = mixart_control_analog_level;
 		temp.name = "Master Playback Volume";
 		temp.private_value = 0; /* playback */
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 		/* output mute controls */
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&mixart_control_output_switch, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&mixart_control_output_switch, chip));
+		if (err < 0)
 			return err;
 
 		/* analog input level control only on first two chips !*/
@@ -1125,7 +1127,8 @@ int snd_mixart_create_mixer(struct mixart_mgr *mgr)
 			temp = mixart_control_analog_level;
 			temp.name = "Master Capture Volume";
 			temp.private_value = 1; /* capture */
-			if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+			err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+			if (err < 0)
 				return err;
 		}
 
@@ -1133,45 +1136,53 @@ int snd_mixart_create_mixer(struct mixart_mgr *mgr)
 		temp.name = "PCM Playback Volume";
 		temp.count = MIXART_PLAYBACK_STREAMS;
 		temp.private_value = 0; /* playback analog */
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 
 		temp.name = "PCM Capture Volume";
 		temp.count = 1;
 		temp.private_value = MIXART_VOL_REC_MASK; /* capture analog */
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 
 		if(mgr->board_type == MIXART_DAUGHTER_TYPE_AES) {
 			temp.name = "AES Playback Volume";
 			temp.count = MIXART_PLAYBACK_STREAMS;
 			temp.private_value = MIXART_VOL_AES_MASK; /* playback AES/EBU */
-			if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+			err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+			if (err < 0)
 				return err;
 
 			temp.name = "AES Capture Volume";
 			temp.count = 0;
 			temp.private_value = MIXART_VOL_REC_MASK | MIXART_VOL_AES_MASK; /* capture AES/EBU */
-			if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+			err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+			if (err < 0)
 				return err;
 		}
 		temp = mixart_control_pcm_switch;
 		temp.name = "PCM Playback Switch";
 		temp.private_value = 0; /* playback analog */
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+		if (err < 0)
 			return err;
 
 		if(mgr->board_type == MIXART_DAUGHTER_TYPE_AES) {
 			temp.name = "AES Playback Switch";
 			temp.private_value = MIXART_VOL_AES_MASK; /* playback AES/EBU */
-			if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip))) < 0)
+			err = snd_ctl_add(chip->card, snd_ctl_new1(&temp, chip));
+			if (err < 0)
 				return err;
 		}
 
 		/* monitoring */
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&mixart_control_monitor_vol, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&mixart_control_monitor_vol, chip));
+		if (err < 0)
 			return err;
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&mixart_control_monitor_sw, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&mixart_control_monitor_sw, chip));
+		if (err < 0)
 			return err;
 
 		/* init all mixer data and program the master volumes/switches */
-- 
2.26.2

