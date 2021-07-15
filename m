Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE73C9AA5
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6264176A;
	Thu, 15 Jul 2021 10:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6264176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337856;
	bh=BrnnahUI/+BrdJk1v74pDJ5S3309FQKChtYS0sh9WMY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRKS4MnNAYN62nu8mwJ9yY4pc4cYVTdwKvzdzucXMqZ64eKSPUHyhCzveocFI05+k
	 8+ypRad3usQoJtHKZACCbbC1sLqwnIEBZ+CrLdC5hVL0Tsyu3pOL7+5Nv65kDmEtMh
	 5RqxOy5BLkoRM+GAdQX1yEPNYY0uGnonsnbs3HQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C045F808AF;
	Thu, 15 Jul 2021 10:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD2FAF80834; Thu, 15 Jul 2021 10:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC2CCF805C1
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC2CCF805C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BWuBZbSq"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8DFFwlzN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 823BA1FDEA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9/wjL8XOFPcYFn7iEzZ+N6ui4168KzCi9G2P7u0p70=;
 b=BWuBZbSqQJtj8ejT3muO6JDS/Ypch761+HRtdC6b77tQCGWqQizoEuuJyAL0ZBzp0d0UI5
 MD31gVgpzkV4FXCJPFCmw/bqB9SHOZHAVqCHiPrVLI6vYRQQMLviqpKoZkjM8RV9wUn3Bf
 FLrLfgGu8wKDt0pC2D9YxL5CVh9HSnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9/wjL8XOFPcYFn7iEzZ+N6ui4168KzCi9G2P7u0p70=;
 b=8DFFwlzNUtyItbwCrw1sXmKiCG52qy8k/dTNvr0n/I/4MLh4iyKPF4pbZ/MyGeaxJX/RAz
 KkwRXwCXQkeRLcBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 72384A3B8F;
 Thu, 15 Jul 2021 08:00:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 78/79] ALSA: dummy: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:40 +0200
Message-Id: <20210715075941.23332-79-tiwai@suse.de>
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

Use the new snd_devm_card_new() for the card object allocation, and
clean up the superfluous remove callback.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 01a3eab50d7b..2a7fc49c1a7c 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -1025,8 +1025,8 @@ static int snd_dummy_probe(struct platform_device *devptr)
 	int idx, err;
 	int dev = devptr->id;
 
-	err = snd_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_dummy), &card);
+	err = snd_devm_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_dummy), &card);
 	if (err < 0)
 		return err;
 	dummy = card->private_data;
@@ -1047,7 +1047,7 @@ static int snd_dummy_probe(struct platform_device *devptr)
 			pcm_substreams[dev] = MAX_PCM_SUBSTREAMS;
 		err = snd_card_dummy_pcm(dummy, idx, pcm_substreams[dev]);
 		if (err < 0)
-			goto __nodev;
+			return err;
 	}
 
 	dummy->pcm_hw = dummy_pcm_hardware;
@@ -1078,7 +1078,7 @@ static int snd_dummy_probe(struct platform_device *devptr)
 
 	err = snd_card_dummy_new_mixer(dummy);
 	if (err < 0)
-		goto __nodev;
+		return err;
 	strcpy(card->driver, "Dummy");
 	strcpy(card->shortname, "Dummy");
 	sprintf(card->longname, "Dummy %i", dev + 1);
@@ -1086,18 +1086,9 @@ static int snd_dummy_probe(struct platform_device *devptr)
 	dummy_proc_init(dummy);
 
 	err = snd_card_register(card);
-	if (err == 0) {
-		platform_set_drvdata(devptr, card);
-		return 0;
-	}
-      __nodev:
-	snd_card_free(card);
-	return err;
-}
-
-static int snd_dummy_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
+	if (err < 0)
+		return err;
+	platform_set_drvdata(devptr, card);
 	return 0;
 }
 
@@ -1128,7 +1119,6 @@ static SIMPLE_DEV_PM_OPS(snd_dummy_pm, snd_dummy_suspend, snd_dummy_resume);
 
 static struct platform_driver snd_dummy_driver = {
 	.probe		= snd_dummy_probe,
-	.remove		= snd_dummy_remove,
 	.driver		= {
 		.name	= SND_DUMMY_DRIVER,
 		.pm	= SND_DUMMY_PM_OPS,
-- 
2.26.2

