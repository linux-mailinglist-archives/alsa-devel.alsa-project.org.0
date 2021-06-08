Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FC39F931
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C189183A;
	Tue,  8 Jun 2021 16:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C189183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162708;
	bh=82YEt0pvuV1FlxcXiBWNaZiZKRK/LBQm4hOI15Eh4IQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IzedcJDhuv1fMZOdngQHaAC0VZTvKFez1jLBawXsUIK8O6m0MBGG/Mc9AI2K3js/N
	 uZTIJPSSewVx5ZqU2pCCo0qEUtH5tSghMDZazBo3oO18IKlOcaXVLv9K1SXPXAv8Io
	 LkRczkSXKF6HjMPpsfRd404VzAy7Wk/qMKEUET60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E64B2F80727;
	Tue,  8 Jun 2021 16:07:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91033F80527; Tue,  8 Jun 2021 16:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F2D4F80527
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F2D4F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="j+Q1/C/B"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0CTUv/k/"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2173A219E5
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkDVfz5cNXVWMIl5RMgrDNULy68gT5mvb6UX6fZL9Hc=;
 b=j+Q1/C/B4KVvJRhmSlUpwc0nUpdqhY1qjVYogBsHueSp9tvjfdbQtSyFBvLmaK4L/Ggb+T
 s1/3tKLIj8Wzw1pPrV+eF9rcIOuW5wayUstG2PUs29J50rKuMIP2mMQ+RSEe4pF8IZhi7B
 EDOEw2yURkxbHcFBVXFzXqVSKgvQzjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkDVfz5cNXVWMIl5RMgrDNULy68gT5mvb6UX6fZL9Hc=;
 b=0CTUv/k/UVSFEkDLWDnf0RS4UJDKn5undJiVQKjFmbt3WOXSoXhBwFNskNCaYA5hShfz3i
 TFxTv9kwWlRm/gDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 121E9A3B88;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 29/66] ALSA: maestro3: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:03 +0200
Message-Id: <20210608140540.17885-30-tiwai@suse.de>
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

PCI maestro3 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index cdc4b6106252..77a484bc8c0d 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1765,7 +1765,8 @@ snd_m3_playback_open(struct snd_pcm_substream *subs)
 	struct snd_pcm_runtime *runtime = subs->runtime;
 	int err;
 
-	if ((err = snd_m3_substream_open(chip, subs)) < 0)
+	err = snd_m3_substream_open(chip, subs);
+	if (err < 0)
 		return err;
 
 	runtime->hw = snd_m3_playback;
@@ -1789,7 +1790,8 @@ snd_m3_capture_open(struct snd_pcm_substream *subs)
 	struct snd_pcm_runtime *runtime = subs->runtime;
 	int err;
 
-	if ((err = snd_m3_substream_open(chip, subs)) < 0)
+	err = snd_m3_substream_open(chip, subs);
+	if (err < 0)
 		return err;
 
 	runtime->hw = snd_m3_capture;
@@ -2036,12 +2038,14 @@ static int snd_m3_mixer(struct snd_m3 *chip)
 		.read = snd_m3_ac97_read,
 	};
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 	
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = chip;
-	if ((err = snd_ac97_mixer(pbus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(pbus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 
 	/* seems ac97 PCM needs initialization.. hack hack.. */
@@ -2642,16 +2646,19 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	if (err < 0)
 		goto free_chip;
 
-	if ((err = snd_m3_mixer(chip)) < 0)
+	err = snd_m3_mixer(chip);
+	if (err < 0)
 		return err;
 
 	for (i = 0; i < chip->num_substreams; i++) {
 		struct m3_dma *s = &chip->substreams[i];
-		if ((err = snd_m3_assp_client_init(chip, s, i)) < 0)
+		err = snd_m3_assp_client_init(chip, s, i);
+		if (err < 0)
 			return err;
 	}
 
-	if ((err = snd_m3_pcm(chip, 0)) < 0)
+	err = snd_m3_pcm(chip, 0);
+	if (err < 0)
 		return err;
 
 #ifdef CONFIG_SND_MAESTRO3_INPUT
-- 
2.26.2

