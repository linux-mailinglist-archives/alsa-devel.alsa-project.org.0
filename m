Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F44339F922
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074621878;
	Tue,  8 Jun 2021 16:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074621878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162565;
	bh=TH/aTQjhgusRwX8QvgQdLt1aUHu+7lZZuLJAYFBMWgA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ojh21xH9nMfny6TpU6GxftD7JNrmkdU9f/RJGTZdgl0WhHJNX9wYTlCBruwkEFBID
	 w0eoftskSbYkZtvwfy/iG3YDunKS/spIf+WR0h95oB2vxZCRcwfLuvUkWSza2VXLVV
	 ShE6dK5EheMNaiwmnXHLMc2NyYESDlu5tYP9+/5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 649C9F8071F;
	Tue,  8 Jun 2021 16:07:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68A0CF80679; Tue,  8 Jun 2021 16:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31A3FF8051B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31A3FF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1hRsvbd6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="k8JtvboG"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AF39D219F8
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffRc5xlMTTRcVA6ruNzgSyqkyLHJ78i9/2M/dZbU25I=;
 b=1hRsvbd6HlZWTKDQr8aipGwkrqxIqGLzPrYtN8Fg7PkRtwEQAxQ3cCJfY2Hekm3CDcIug8
 6jrvk16bJXNitck9aa3ETv9QwOjkCjjoX0mB9D7ht0K1Ni7tqID1xamP75onZRgLWB5yeD
 cXWxDgpndbGBwJOeIRcKKjco1Eh4CFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffRc5xlMTTRcVA6ruNzgSyqkyLHJ78i9/2M/dZbU25I=;
 b=k8JtvboGkbufbrTe1+GalpJRv0gOhAkp2L9tvfvBatgu7waZVP+WhWup8jgfp0gZ3R645a
 SF72yMlOTCtpcDDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 9FF69A3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 58/66] ALSA: sparc: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:32 +0200
Message-Id: <20210608140540.17885-59-tiwai@suse.de>
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

SPARC drivers contain a few assignments in if condition, which is a
bad coding style that may confuse readers and occasionally lead to
bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/amd7930.c | 14 +++++++++-----
 sound/sparc/cs4231.c  | 10 ++++++----
 sound/sparc/dbri.c    | 11 ++++++-----
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index d24ae00878f5..c434b69a83f1 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -975,8 +975,9 @@ static int snd_amd7930_create(struct snd_card *card,
 
 	spin_unlock_irqrestore(&amd->lock, flags);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
-				  amd, &snd_amd7930_dev_ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
+			     amd, &snd_amd7930_dev_ops);
+	if (err < 0) {
 		snd_amd7930_free(amd);
 		return err;
 	}
@@ -1019,13 +1020,16 @@ static int amd7930_sbus_probe(struct platform_device *op)
 				      irq, dev_num, &amd)) < 0)
 		goto out_err;
 
-	if ((err = snd_amd7930_pcm(amd)) < 0)
+	err = snd_amd7930_pcm(amd);
+	if (err < 0)
 		goto out_err;
 
-	if ((err = snd_amd7930_mixer(amd)) < 0)
+	err = snd_amd7930_mixer(amd);
+	if (err < 0)
 		goto out_err;
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto out_err;
 
 	amd->next = amd7930_list;
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 35c17803a430..2942c8c7a236 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1828,8 +1828,9 @@ static int snd_cs4231_sbus_create(struct snd_card *card,
 	}
 	snd_cs4231_init(chip);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
-				  chip, &snd_cs4231_sbus_dev_ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
+			     chip, &snd_cs4231_sbus_dev_ops);
+	if (err < 0) {
 		snd_cs4231_sbus_free(chip);
 		return err;
 	}
@@ -2020,8 +2021,9 @@ static int snd_cs4231_ebus_create(struct snd_card *card,
 	}
 	snd_cs4231_init(chip);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
-				  chip, &snd_cs4231_ebus_dev_ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
+			     chip, &snd_cs4231_ebus_dev_ops);
+	if (err < 0) {
 		snd_cs4231_ebus_free(chip);
 		return err;
 	}
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index b055f5839578..6b84f66e4af4 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2226,11 +2226,12 @@ static int snd_dbri_pcm(struct snd_card *card)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(card,
-			       /* ID */		    "sun_dbri",
-			       /* device */	    0,
-			       /* playback count */ 1,
-			       /* capture count */  1, &pcm)) < 0)
+	err = snd_pcm_new(card,
+			  /* ID */	    "sun_dbri",
+			  /* device */	    0,
+			  /* playback count */ 1,
+			  /* capture count */  1, &pcm);
+	if (err < 0)
 		return err;
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_dbri_ops);
-- 
2.26.2

