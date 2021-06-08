Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5B39F87E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85A01716;
	Tue,  8 Jun 2021 16:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85A01716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161426;
	bh=lvKCrZLd5gwmRxjjBenSSKAePxVY25oYXFN1jhpHDJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwOsugUZRgbDyoy+M1MhGR/fsYS6KePW0tVcqJ8itaywV4ndFTUtFbIagCv7H3+gY
	 OegcypBuNH6VjRzSOHknYvSV+aIyNACj1L3Nor3U4P3eylHPAtmPfS7RNRaGxDiydO
	 a5nyexWAe9edg1xxXpy+iGJpn+OxpRoNRWMm2HNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 901CAF80564;
	Tue,  8 Jun 2021 16:06:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2A08F80256; Tue,  8 Jun 2021 16:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB978F80256
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB978F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RPOiiNvh"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+YxwL0EI"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1F9A31FD55
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r164ZoeX9+AfHhRZ8VIyrywW/15dU5dZNK+xcaYOV8U=;
 b=RPOiiNvhJt8uSgUcHhrh7WDtyuBe6QntiBFQxdW3HmGd0ZBbPayn7L+BmSfma5pq7DCEUx
 UJE7QOrPLkhyH1xdHHSUK1U4L0NZbYHz3Q7Up1/CHxe25wtI72qIjzwijOAg4gO5hvE8nS
 ON1jwCCA7RsfgJlHfV4boj+epoSzUa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r164ZoeX9+AfHhRZ8VIyrywW/15dU5dZNK+xcaYOV8U=;
 b=+YxwL0EIj+6rewcbRRxqPgBFgEZENcogEC2jrOGFD2GkEd1XGIv2d1b/R73V1f1LSOlxcO
 VuCSw7Xmd7BGyeBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1BCEFA3B84;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/66] ALSA: cmi8330: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:45 +0200
Message-Id: <20210608140540.17885-12-tiwai@suse.de>
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

ISA CMI8330 driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8330.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index bc112df10fc5..6c59a3eec59b 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -284,7 +284,8 @@ static int cmi8330_add_sb_mixers(struct snd_sb *chip)
 	}
 
 	for (idx = 0; idx < ARRAY_SIZE(cmi8330_sb_mixers); idx++) {
-		if ((err = snd_sbmixer_add_ctl_elem(chip, &cmi8330_sb_mixers[idx])) < 0)
+		err = snd_sbmixer_add_ctl_elem(chip, &cmi8330_sb_mixers[idx]);
+		if (err < 0)
 			return err;
 	}
 	return 0;
@@ -307,7 +308,8 @@ static int snd_cmi8330_mixer(struct snd_card *card, struct snd_cmi8330 *acard)
 	}
 
 #ifdef ENABLE_SB_MIXER
-	if ((err = cmi8330_add_sb_mixers(acard->sb)) < 0)
+	err = cmi8330_add_sb_mixers(acard->sb);
+	if (err < 0)
 		return err;
 #endif
 	return 0;
@@ -432,7 +434,8 @@ static int snd_cmi8330_pcm(struct snd_card *card, struct snd_cmi8330 *chip)
 		snd_cmi8330_capture_open
 	};
 
-	if ((err = snd_pcm_new(card, (chip->type == CMI8329) ? "CMI8329" : "CMI8330", 0, 1, 1, &pcm)) < 0)
+	err = snd_pcm_new(card, (chip->type == CMI8329) ? "CMI8329" : "CMI8330", 0, 1, 1, &pcm);
+	if (err < 0)
 		return err;
 	strcpy(pcm->name, (chip->type == CMI8329) ? "CMI8329" : "CMI8330");
 	pcm->private_data = chip;
@@ -536,12 +539,13 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 		return -ENODEV;
 	}
 
-	if ((err = snd_sbdsp_create(card, sbport[dev],
-				    sbirq[dev],
-				    snd_sb16dsp_interrupt,
-				    sbdma8[dev],
-				    sbdma16[dev],
-				    SB_HW_AUTO, &acard->sb)) < 0) {
+	err = snd_sbdsp_create(card, sbport[dev],
+			       sbirq[dev],
+			       snd_sb16dsp_interrupt,
+			       sbdma8[dev],
+			       sbdma16[dev],
+			       SB_HW_AUTO, &acard->sb);
+	if (err < 0) {
 		snd_printk(KERN_ERR PFX "SB16 device busy??\n");
 		return err;
 	}
@@ -555,12 +559,14 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 		snd_wss_out(acard->wss, i,
 			    snd_cmi8330_image[i - CMI8330_RMUX3D]);
 
-	if ((err = snd_cmi8330_mixer(card, acard)) < 0) {
+	err = snd_cmi8330_mixer(card, acard);
+	if (err < 0) {
 		snd_printk(KERN_ERR PFX "failed to create mixers\n");
 		return err;
 	}
 
-	if ((err = snd_cmi8330_pcm(card, acard)) < 0) {
+	err = snd_cmi8330_pcm(card, acard);
+	if (err < 0) {
 		snd_printk(KERN_ERR PFX "failed to create pcms\n");
 		return err;
 	}
@@ -622,7 +628,8 @@ static int snd_cmi8330_isa_probe(struct device *pdev,
 	err = snd_cmi8330_card_new(pdev, dev, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_cmi8330_probe(card, dev)) < 0) {
+	err = snd_cmi8330_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -683,12 +690,14 @@ static int snd_cmi8330_pnp_detect(struct pnp_card_link *pcard,
 	res = snd_cmi8330_card_new(&pcard->card->dev, dev, &card);
 	if (res < 0)
 		return res;
-	if ((res = snd_cmi8330_pnp(dev, card->private_data, pcard, pid)) < 0) {
+	res = snd_cmi8330_pnp(dev, card->private_data, pcard, pid);
+	if (res < 0) {
 		snd_printk(KERN_ERR PFX "PnP detection failed\n");
 		snd_card_free(card);
 		return res;
 	}
-	if ((res = snd_cmi8330_probe(card, dev)) < 0) {
+	res = snd_cmi8330_probe(card, dev);
+	if (res < 0) {
 		snd_card_free(card);
 		return res;
 	}
-- 
2.26.2

