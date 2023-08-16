Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55177E600
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C34836;
	Wed, 16 Aug 2023 18:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C34836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692202018;
	bh=s21emmDN4l83Qqp4a+7PD/G55zYwVEuSBjIeWbzVW5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XTGaBHVtYo4lPsq64DjMscFUWLqk0TSdfgOSICprF0z0jlPy9C8kws680nNWpkHmY
	 Y6uChlxfxtf7wMu8O/iTuBBFnV7bBRovTAeJCp8kgjMNKSK4JKahTI+OTRqHmxuG87
	 7c9iS0zh/8X79KmOmWgwJS6Ob7XQyKF9z3QLnmh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C3FF8056F; Wed, 16 Aug 2023 18:05:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B646CF8056F;
	Wed, 16 Aug 2023 18:05:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7624CF80552; Wed, 16 Aug 2023 18:05:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66EAEF8016D
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66EAEF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TvO8faOx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=d0m89JpH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ECD37218BB;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moxFjDgMy8DuAzVahERAibZZiSndsUYjJ+/jGKNqsDE=;
	b=TvO8faOxNV+1GqfdHFXekdiCbqO48y4rbkxSMJz2vpc8tQRa/zMg1bYZ8EUaBBBEAZrjJ4
	qP9RCv+13dnVaHaTtKUrRqelR3c0l3S4LLCiH3URIeZaG/sY1DPd97w4t74yeQPX1htm6o
	0frYKF+2ALqOf0kjxz/KmZqDShIp80A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moxFjDgMy8DuAzVahERAibZZiSndsUYjJ+/jGKNqsDE=;
	b=d0m89JpHGbaMJRmDjGFud9V8MEvvxhvy/DYqVU7ynthNnzSO7YXi6mg1Tn+ln55I+yE8O9
	ysJaMEm6NG1vq4DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFA85133F2;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6IXiMS/z3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 6/9] ALSA: compress: Don't embed device
Date: Wed, 16 Aug 2023 18:02:49 +0200
Message-Id: <20230816160252.23396-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F7SGKQWX6LHKQXPZRRAH7DLUG2L6MAL3
X-Message-ID-Hash: F7SGKQWX6LHKQXPZRRAH7DLUG2L6MAL3
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7SGKQWX6LHKQXPZRRAH7DLUG2L6MAL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Embedding the struct device to snd_compr object may result in UAF when
the delayed kobj release is used.  Like other devices, let's detach
the struct device from the snd_compr by allocating dynamically via
snd_device_alloc().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/compress_driver.h |  2 +-
 sound/core/compress_offload.c   | 16 ++++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index d91289c6f00e..bcf872c17dd3 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -148,7 +148,7 @@ struct snd_compr_ops {
  */
 struct snd_compr {
 	const char *name;
-	struct device dev;
+	struct device *dev;
 	struct snd_compr_ops *ops;
 	void *private_data;
 	struct snd_card *card;
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 30f73097447b..619371aa9964 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -546,7 +546,7 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 		if (stream->runtime->dma_buffer_p) {
 
 			if (buffer_size > stream->runtime->dma_buffer_p->bytes)
-				dev_err(&stream->device->dev,
+				dev_err(stream->device->dev,
 						"Not enough DMA buffer");
 			else
 				buffer = stream->runtime->dma_buffer_p->area;
@@ -1070,7 +1070,7 @@ static int snd_compress_dev_register(struct snd_device *device)
 	/* register compressed device */
 	ret = snd_register_device(SNDRV_DEVICE_TYPE_COMPRESS,
 				  compr->card, compr->device,
-				  &snd_compr_file_ops, compr, &compr->dev);
+				  &snd_compr_file_ops, compr, compr->dev);
 	if (ret < 0) {
 		pr_err("snd_register_device failed %d\n", ret);
 		return ret;
@@ -1084,7 +1084,7 @@ static int snd_compress_dev_disconnect(struct snd_device *device)
 	struct snd_compr *compr;
 
 	compr = device->device_data;
-	snd_unregister_device(&compr->dev);
+	snd_unregister_device(compr->dev);
 	return 0;
 }
 
@@ -1158,7 +1158,7 @@ static int snd_compress_dev_free(struct snd_device *device)
 
 	compr = device->device_data;
 	snd_compress_proc_done(compr);
-	put_device(&compr->dev);
+	put_device(compr->dev);
 	return 0;
 }
 
@@ -1189,12 +1189,16 @@ int snd_compress_new(struct snd_card *card, int device,
 
 	snd_compress_set_id(compr, id);
 
-	snd_device_initialize(&compr->dev, card);
-	dev_set_name(&compr->dev, "comprC%iD%i", card->number, device);
+	ret = snd_device_alloc(&compr->dev, card);
+	if (ret)
+		return ret;
+	dev_set_name(compr->dev, "comprC%iD%i", card->number, device);
 
 	ret = snd_device_new(card, SNDRV_DEV_COMPRESS, compr, &ops);
 	if (ret == 0)
 		snd_compress_proc_init(compr);
+	else
+		put_device(compr->dev);
 
 	return ret;
 }
-- 
2.35.3

