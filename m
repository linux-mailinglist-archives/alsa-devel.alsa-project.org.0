Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC93C9A7F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F662172E;
	Thu, 15 Jul 2021 10:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F662172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337416;
	bh=vS2kG263snHYynEC+gjMlsptsj+n6Ckvppmm8r66knI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTOR+zlNrbjyrnqB21NXIVjhcv4vVfodHQCQM0yypMQwRTf1YWqNIQHFQ/PvkKQp7
	 C5i8dXSX9Iwfp4J30J2U3yiK1Ww79pDAcU36kppDcpgLrlJp7QVd3rPLN6nlzGQC3U
	 e7mT0qR7GcjxuoENcgrOX+kedaDpPJQ0uwOdfE5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFCF8F8051F;
	Thu, 15 Jul 2021 10:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81060F80726; Thu, 15 Jul 2021 10:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C0EF80553
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C0EF80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FJLfVL8M"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="VI34KC1q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C108A22854
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4o4JwLbDRxjkXT0ACxAkJ3kh+7NKemqHzCxqG+DWwS0=;
 b=FJLfVL8M02O3Vyd61oyeYYgJ9yNfsm1877u0pHMSOwqlVuXjm4v6zbYfq937F4ye7awvb4
 TIswQK5PQVO+MrLEYDkZMe3BelHvlRSrLKFm9q18LaL0skSmAbqIwxg0Wwg3dwjFzl5Q+S
 qivnbgLLotQVN44I4aYFTwu9iiYq/Ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336016;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4o4JwLbDRxjkXT0ACxAkJ3kh+7NKemqHzCxqG+DWwS0=;
 b=VI34KC1q52lqNW4Hj/c5K3uIL+kcXT5VQglKFBjCE7j5IWYIOZEUH2MXV4iK3hwct/y0ns
 0mxNAjSGQrV8pXCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BA8FDA3B8F;
 Thu, 15 Jul 2021 08:00:16 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 57/79] ALSA: als100: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:19 +0200
Message-Id: <20210715075941.23332-58-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

This patch converts the resource management in ISA als100 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/als100.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/sound/isa/als100.c b/sound/isa/als100.c
index d4597fdfe091..d582eff64082 100644
--- a/sound/isa/als100.c
+++ b/sound/isa/als100.c
@@ -170,18 +170,16 @@ static int snd_card_als100_probe(int dev,
 	struct snd_card_als100 *acard;
 	struct snd_opl3 *opl3;
 
-	error = snd_card_new(&pcard->card->dev,
-			     index[dev], id[dev], THIS_MODULE,
-			     sizeof(struct snd_card_als100), &card);
+	error = snd_devm_card_new(&pcard->card->dev,
+				  index[dev], id[dev], THIS_MODULE,
+				  sizeof(struct snd_card_als100), &card);
 	if (error < 0)
 		return error;
 	acard = card->private_data;
 
 	error = snd_card_als100_pnp(dev, acard, pcard, pid);
-	if (error) {
-		snd_card_free(card);
+	if (error)
 		return error;
-	}
 
 	if (pid->driver_data == SB_HW_DT019X)
 		dma16[dev] = -1;
@@ -191,10 +189,8 @@ static int snd_card_als100_probe(int dev,
 				  dma8[dev], dma16[dev],
 				  pid->driver_data,
 				  &chip);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	acard->chip = chip;
 
 	if (pid->driver_data == SB_HW_DT019X) {
@@ -213,16 +209,12 @@ static int snd_card_als100_probe(int dev,
 	}
 
 	error = snd_sb16dsp_pcm(chip, 0);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 
 	error = snd_sbmixer_new(chip);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 
 	if (mpu_port[dev] > 0 && mpu_port[dev] != SNDRV_AUTO_PORT) {
 		int mpu_type = MPU401_HW_ALS100;
@@ -249,23 +241,17 @@ static int snd_card_als100_probe(int dev,
 				   fm_port[dev], fm_port[dev] + 2);
 		} else {
 			error = snd_opl3_timer_new(opl3, 0, 1);
-			if (error < 0) {
-				snd_card_free(card);
+			if (error < 0)
 				return error;
-			}
 			error = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
-			if (error < 0) {
-				snd_card_free(card);
+			if (error < 0)
 				return error;
-			}
 		}
 	}
 
 	error = snd_card_register(card);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	return 0;
 }
@@ -291,12 +277,6 @@ static int snd_als100_pnp_detect(struct pnp_card_link *card,
 	return -ENODEV;
 }
 
-static void snd_als100_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 #ifdef CONFIG_PM
 static int snd_als100_pnp_suspend(struct pnp_card_link *pcard, pm_message_t state)
 {
@@ -327,7 +307,6 @@ static struct pnp_card_driver als100_pnpc_driver = {
 	.name		= "als100",
         .id_table       = snd_als100_pnpids,
         .probe          = snd_als100_pnp_detect,
-	.remove		= snd_als100_pnp_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_als100_pnp_suspend,
 	.resume		= snd_als100_pnp_resume,
-- 
2.26.2

