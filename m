Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A53C8899
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 18:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B067169C;
	Wed, 14 Jul 2021 18:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B067169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626279969;
	bh=pJH+k4n78qTSx/8F3EQ4TuOosJnuhQn23CaP1wCy45Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R56lum1bEcpFRuPNnCmfcnLTqfcxbD+hVh3d1tmnAUk1VFtqpvVQHGUVAQW+1QgGX
	 An5IUCGF0pMHhzwOz8B/pX2mh6Du2fdxE0uuXo3q/VKo+fctI+0St6ZXv1WDYEnQyd
	 7J8uwMudEDAdsGeZSVZupEykM052U1rFxknN6AXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9308F802E7;
	Wed, 14 Jul 2021 18:24:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FC86F80300; Wed, 14 Jul 2021 18:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62E8BF800D3
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 18:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E8BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="sK206tkz"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8N6MVneC"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 041F41FD73;
 Wed, 14 Jul 2021 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626279866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkYBwDr/0voGP40tNoLigeQDnPGQMYg5UUyJQQb1+Qk=;
 b=sK206tkzHpQyHeMZMSajwvwtlVVZspP2ljlwnWdMM8ofFzfX0KbxemzDmodu57dga7YbC6
 tv31jeKqrswVqwlKCn/py70HpFFaXdYrdRgNtCZBYZU1M1BYXwfiL/g16uf3bxIJWIlSJF
 rWsrCAgyDgLnlSrUcAGedyhD6P5Inl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626279866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkYBwDr/0voGP40tNoLigeQDnPGQMYg5UUyJQQb1+Qk=;
 b=8N6MVneCzsJKJiiubxpih3Ul/yRCmkJDT1TkXOcDpZPdb2ulXCGj/Zdou3dSkOGKqWW4/s
 Vzf3cha6rKAuviAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E768DA3B92;
 Wed, 14 Jul 2021 16:24:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: compress: Drop unused functions
Date: Wed, 14 Jul 2021 18:24:23 +0200
Message-Id: <20210714162424.4412-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210714162424.4412-1-tiwai@suse.de>
References: <20210714162424.4412-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
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

snd_compress_register() and snd_compress_deregister() API functions
have been never used by in-tree drivers.
Let's clean up the dead code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/compress_driver.h |  2 -
 sound/core/compress_offload.c   | 68 ---------------------------------
 2 files changed, 70 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 277087f635f3..d91289c6f00e 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -165,8 +165,6 @@ struct snd_compr {
 };
 
 /* compress device register APIs */
-int snd_compress_register(struct snd_compr *device);
-int snd_compress_deregister(struct snd_compr *device);
 int snd_compress_new(struct snd_card *card, int device,
 			int type, const char *id, struct snd_compr *compr);
 
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 21ce4c056a92..ed5546ae300a 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -47,8 +47,6 @@
  *	driver should be able to register multiple nodes
  */
 
-static DEFINE_MUTEX(device_mutex);
-
 struct snd_compr_file {
 	unsigned long caps;
 	struct snd_compr_stream stream;
@@ -1193,72 +1191,6 @@ int snd_compress_new(struct snd_card *card, int device,
 }
 EXPORT_SYMBOL_GPL(snd_compress_new);
 
-static int snd_compress_add_device(struct snd_compr *device)
-{
-	int ret;
-
-	if (!device->card)
-		return -EINVAL;
-
-	/* register the card */
-	ret = snd_card_register(device->card);
-	if (ret)
-		goto out;
-	return 0;
-
-out:
-	pr_err("failed with %d\n", ret);
-	return ret;
-
-}
-
-static int snd_compress_remove_device(struct snd_compr *device)
-{
-	return snd_card_free(device->card);
-}
-
-/**
- * snd_compress_register - register compressed device
- *
- * @device: compressed device to register
- */
-int snd_compress_register(struct snd_compr *device)
-{
-	int retval;
-
-	if (device->name == NULL || device->ops == NULL)
-		return -EINVAL;
-
-	pr_debug("Registering compressed device %s\n", device->name);
-	if (snd_BUG_ON(!device->ops->open))
-		return -EINVAL;
-	if (snd_BUG_ON(!device->ops->free))
-		return -EINVAL;
-	if (snd_BUG_ON(!device->ops->set_params))
-		return -EINVAL;
-	if (snd_BUG_ON(!device->ops->trigger))
-		return -EINVAL;
-
-	mutex_init(&device->lock);
-
-	/* register a compressed card */
-	mutex_lock(&device_mutex);
-	retval = snd_compress_add_device(device);
-	mutex_unlock(&device_mutex);
-	return retval;
-}
-EXPORT_SYMBOL_GPL(snd_compress_register);
-
-int snd_compress_deregister(struct snd_compr *device)
-{
-	pr_debug("Removing compressed device %s\n", device->name);
-	mutex_lock(&device_mutex);
-	snd_compress_remove_device(device);
-	mutex_unlock(&device_mutex);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_compress_deregister);
-
 MODULE_DESCRIPTION("ALSA Compressed offload framework");
 MODULE_AUTHOR("Vinod Koul <vinod.koul@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.26.2

