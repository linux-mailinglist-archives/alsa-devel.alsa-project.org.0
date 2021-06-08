Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D827239F913
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E1741890;
	Tue,  8 Jun 2021 16:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E1741890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162472;
	bh=cyPMYi3kgA6+/R75kuLZeGfZBIeqA7H6hy/I1NyB+5g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNgKiOPFW8y23TUmy9OcWSp6x22vYaB3T6r3ceWQ/N+FlVWCkbVosLTeukk3h2t62
	 dbnF+ujvJ8NAzTKAW1S9hCHP9SGRxMYzsv0hIU6CcScs3SHog2Fll4WpCtn1Xq5wrP
	 TjR08mWYYhcIzYJFaeJaVtvoYFjlbUzVBDtoXxdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC7DF8052E;
	Tue,  8 Jun 2021 16:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D85F8062F; Tue,  8 Jun 2021 16:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8B7CF80511
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8B7CF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="biEeE+rN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/NoP4Aa9"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0C231219EF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlwkpZP81U+zmwbLULv50cqDXSnlmjB0VciTF/cHS6M=;
 b=biEeE+rNf5ToIs+68Oqb2t70Op2uXKfiF4HR24Of+coSpBO4aBvjG6WTusM/WYitJv9cWl
 QG6M0aiRJK2qT83yp0A8U/1f0r25edXzeaFGEhIhYxoBUoOpsRc5bWIjJZiLa1ha1Ec8jR
 ZeRuYf1aJNpOHciHxGtu10g/TYqghWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlwkpZP81U+zmwbLULv50cqDXSnlmjB0VciTF/cHS6M=;
 b=/NoP4Aa9TrswM2RBwe0+x8mU9NKPuCiQ3GU+0HUEje7DkaaTu77i+neysKJWaBYJD+cIaB
 PDvRHOYH02yTE8CA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 076C3A3B88;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 46/66] ALSA: pcxhr: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:20 +0200
Message-Id: <20210608140540.17885-47-tiwai@suse.de>
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

PCI PCXHR driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/pcxhr/pcxhr.c       | 22 ++++++++++++++--------
 sound/pci/pcxhr/pcxhr_hwdep.c |  9 ++++++---
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 751f9744b089..96b9371c201a 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1134,9 +1134,10 @@ int pcxhr_create_pcm(struct snd_pcxhr *chip)
 	char name[32];
 
 	snprintf(name, sizeof(name), "pcxhr %d", chip->chip_idx);
-	if ((err = snd_pcm_new(chip->card, name, 0,
-			       chip->nb_streams_play,
-			       chip->nb_streams_capt, &pcm)) < 0) {
+	err = snd_pcm_new(chip->card, name, 0,
+			  chip->nb_streams_play,
+			  chip->nb_streams_capt, &pcm);
+	if (err < 0) {
 		dev_err(chip->card->dev, "cannot create pcm %s\n", name);
 		return err;
 	}
@@ -1202,7 +1203,8 @@ static int pcxhr_create(struct pcxhr_mgr *mgr,
 			chip->nb_streams_capt = 1;	/* or 1 stereo stream */
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		pcxhr_chip_free(chip);
 		return err;
 	}
@@ -1492,7 +1494,8 @@ static int pcxhr_probe(struct pci_dev *pci,
 	}
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	pci_set_master(pci);
 
@@ -1537,7 +1540,8 @@ static int pcxhr_probe(struct pci_dev *pci,
 		mgr->granularity = PCXHR_GRANULARITY;
 
 	/* resource assignment */
-	if ((err = pci_request_regions(pci, card_name)) < 0) {
+	err = pci_request_regions(pci, card_name);
+	if (err < 0) {
 		kfree(mgr);
 		pci_disable_device(pci);
 		return err;
@@ -1608,7 +1612,8 @@ static int pcxhr_probe(struct pci_dev *pci,
 		snprintf(card->longname, sizeof(card->longname),
 			 "%s [PCM #%d]", mgr->name, i);
 
-		if ((err = pcxhr_create(mgr, card, i)) < 0) {
+		err = pcxhr_create(mgr, card, i);
+		if (err < 0) {
 			snd_card_free(card);
 			pcxhr_free(mgr);
 			return err;
@@ -1618,7 +1623,8 @@ static int pcxhr_probe(struct pci_dev *pci,
 			/* init proc interface only for chip0 */
 			pcxhr_proc_init(mgr->chip[i]);
 
-		if ((err = snd_card_register(card)) < 0) {
+		err = snd_card_register(card);
+		if (err < 0) {
 			pcxhr_free(mgr);
 			return err;
 		}
diff --git a/sound/pci/pcxhr/pcxhr_hwdep.c b/sound/pci/pcxhr/pcxhr_hwdep.c
index 2258bd698844..249805065f61 100644
--- a/sound/pci/pcxhr/pcxhr_hwdep.c
+++ b/sound/pci/pcxhr/pcxhr_hwdep.c
@@ -322,14 +322,17 @@ static int pcxhr_dsp_load(struct pcxhr_mgr *mgr, int index,
         for (card_index = 0; card_index < mgr->num_cards; card_index++) {
 		struct snd_pcxhr *chip = mgr->chip[card_index];
 
-		if ((err = pcxhr_create_pcm(chip)) < 0)
+		err = pcxhr_create_pcm(chip);
+		if (err < 0)
 			return err;
 
 		if (card_index == 0) {
-			if ((err = pcxhr_create_mixer(chip->mgr)) < 0)
+			err = pcxhr_create_mixer(chip->mgr);
+			if (err < 0)
 				return err;
 		}
-		if ((err = snd_card_register(chip->card)) < 0)
+		err = snd_card_register(chip->card);
+		if (err < 0)
 			return err;
 	}
 	err = pcxhr_start_pipes(mgr);
-- 
2.26.2

