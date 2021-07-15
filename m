Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E283F3C9AA8
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:31:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78EE71798;
	Thu, 15 Jul 2021 10:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78EE71798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337878;
	bh=2SmcCjFcjQPx/wvX1ZIYejRsTsdh6xlVOmCKJS2/2RQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zr/0w0jOXNv8PrMaM/Jv0ItY61iNY5u9uisr/R7KM/DTLBcXARZDU44vaLdLb1t/5
	 uWFJ8rdwYkmjDRXe97BTV47ynRgvGIu8R0QWYfbTu5/BXUJ7V3MCX5HLXqYdrU7mPg
	 TdezHH8BCRASamZYwovKKGwUziTTq3Xo7JQSN6oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8C20F808C2;
	Thu, 15 Jul 2021 10:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24CE6F80845; Thu, 15 Jul 2021 10:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 194BFF805C3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 194BFF805C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bodB12GR"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xz3NEwIs"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DDE171FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pz+RApgN44AKKQQ1URRIssEFrG77OnAyrrJtH5E+/Q=;
 b=bodB12GRqtB5UyMdKTyQsIcUUkY0iqRA3OSzLMCU4WqMya1tUh+9LoBgd1s3s2a7pJTNKr
 dfoGh+YWVXl/8Tdo8onajQXk9wF3GwVIxS6sBvxutTkG3u+Nqd5wXz3/vrXwsLELMwwDbx
 ang0gkgcsfBII9wSXlhiNrjsHzN4Pj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pz+RApgN44AKKQQ1URRIssEFrG77OnAyrrJtH5E+/Q=;
 b=xz3NEwIsAcD6Gmm9PR3gFg/aw8Vb82lHFSQe4tCbP4A+1q303GATulkaq6WOwit35R8dde
 5CsSeTNwEY7lzkCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CD9E3A3B8F;
 Thu, 15 Jul 2021 08:00:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 77/79] ALSA: aloop: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:39 +0200
Message-Id: <20210715075941.23332-78-tiwai@suse.de>
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
 sound/drivers/aloop.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 80b814b9922a..9b4a7cdb103a 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1712,8 +1712,8 @@ static int loopback_probe(struct platform_device *devptr)
 	int dev = devptr->id;
 	int err;
 
-	err = snd_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct loopback), &card);
+	err = snd_devm_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct loopback), &card);
 	if (err < 0)
 		return err;
 	loopback = card->private_data;
@@ -1730,13 +1730,13 @@ static int loopback_probe(struct platform_device *devptr)
 
 	err = loopback_pcm_new(loopback, 0, pcm_substreams[dev]);
 	if (err < 0)
-		goto __nodev;
+		return err;
 	err = loopback_pcm_new(loopback, 1, pcm_substreams[dev]);
 	if (err < 0)
-		goto __nodev;
+		return err;
 	err = loopback_mixer_new(loopback, pcm_notify[dev] ? 1 : 0);
 	if (err < 0)
-		goto __nodev;
+		return err;
 	loopback_cable_proc_new(loopback, 0);
 	loopback_cable_proc_new(loopback, 1);
 	loopback_timer_source_proc_new(loopback);
@@ -1744,18 +1744,9 @@ static int loopback_probe(struct platform_device *devptr)
 	strcpy(card->shortname, "Loopback");
 	sprintf(card->longname, "Loopback %i", dev + 1);
 	err = snd_card_register(card);
-	if (!err) {
-		platform_set_drvdata(devptr, card);
-		return 0;
-	}
-      __nodev:
-	snd_card_free(card);
-	return err;
-}
-
-static int loopback_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
+	if (err < 0)
+		return err;
+	platform_set_drvdata(devptr, card);
 	return 0;
 }
 
@@ -1786,7 +1777,6 @@ static SIMPLE_DEV_PM_OPS(loopback_pm, loopback_suspend, loopback_resume);
 
 static struct platform_driver loopback_driver = {
 	.probe		= loopback_probe,
-	.remove		= loopback_remove,
 	.driver		= {
 		.name	= SND_LOOPBACK_DRIVER,
 		.pm	= LOOPBACK_PM_OPS,
-- 
2.26.2

