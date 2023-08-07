Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A6B7726B4
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67BA582B;
	Mon,  7 Aug 2023 15:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67BA582B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416469;
	bh=PyryD2E/JRL3Qjsm9SV25XCmOqgpKa650hXATRfl9Bw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BcN4+dFRULwh48oQWjhuALcJIh/oY/6tZdZw0bguls/h+WjG2hpf8JnO68rTSFV4o
	 s1sLjxLLEW50htxb7a4U0hcZIVbqQ+TNxGgnPWSvv8wgdBcoJchADC2Dwp/IA01DGF
	 EUXFTwHOjrazlR0szE+ykMuY64GOyS85QfXz8kTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 360A9F80587; Mon,  7 Aug 2023 15:52:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A8DF80588;
	Mon,  7 Aug 2023 15:52:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E312EF80579; Mon,  7 Aug 2023 15:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B64E2F80520
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64E2F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=I59ULtOP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=j+DuoXA0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 08A3B1FDF2;
	Mon,  7 Aug 2023 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qq2OFpTFbduTwjPLGnpBeMVjccXUznztxxu/8/5oMNo=;
	b=I59ULtOP67BoDPfnRbxgk4gfzOfTK7AnbOyB9Lj+41EVRbvH0DefAQ0Ylf4/cW4j5pMS+e
	U61+76xiyTZxt6eMeM6yeUH73ZGjyD1kZ1nMmLecgJ8q3Pnr1VV+oi/36FUz08RK21E9ka
	verrZINmL85hp7rrKc8HyYzIM93dPA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qq2OFpTFbduTwjPLGnpBeMVjccXUznztxxu/8/5oMNo=;
	b=j+DuoXA0sHsOb6JvTX38r9GcJZUe3AJGbgxTr2EAWejlCyjiAw0H/9LBuEEWvmukge4Ihi
	f/B1rC0+2bMozTBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD1F913A6F;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uCM1NQv30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH RFC 3/6] ALSA: core: Associate memory reference with device
 initialization
Date: Mon,  7 Aug 2023 15:52:04 +0200
Message-Id: <20230807135207.17708-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4XTDJ5WBFI4S7MLY7G6IHDFZADWT5YKF
X-Message-ID-Hash: 4XTDJ5WBFI4S7MLY7G6IHDFZADWT5YKF
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow to assign a refmem pointer to snd_device_initialize().  It takes
the reference, and does unreference at the release callback in turn.

A caveat is that this uses drvdata for keeping the associated
pointer.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h           | 2 +-
 sound/core/compress_offload.c  | 2 +-
 sound/core/control.c           | 2 +-
 sound/core/hwdep.c             | 2 +-
 sound/core/init.c              | 9 ++++++---
 sound/core/pcm.c               | 2 +-
 sound/core/rawmidi.c           | 2 +-
 sound/core/seq/seq_clientmgr.c | 2 +-
 sound/core/timer.c             | 2 +-
 9 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 6fccec08a12f..dfa5b44d9666 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -244,7 +244,7 @@ extern struct dentry *sound_debugfs_root;
 
 void snd_request_card(int card);
 
-void snd_device_initialize(struct device *dev, struct snd_card *card);
+void snd_device_initialize(struct device *dev, struct snd_card *card, void *refp);
 
 int snd_register_device(int type, struct snd_card *card, int dev,
 			const struct file_operations *f_ops,
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 30f73097447b..d91fa8925cde 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1189,7 +1189,7 @@ int snd_compress_new(struct snd_card *card, int device,
 
 	snd_compress_set_id(compr, id);
 
-	snd_device_initialize(&compr->dev, card);
+	snd_device_initialize(&compr->dev, card, NULL);
 	dev_set_name(&compr->dev, "comprC%iD%i", card->number, device);
 
 	ret = snd_device_new(card, SNDRV_DEV_COMPRESS, compr, &ops);
diff --git a/sound/core/control.c b/sound/core/control.c
index 8386b53acdcd..5b9340f5cb8c 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2395,7 +2395,7 @@ int snd_ctl_create(struct snd_card *card)
 	if (snd_BUG_ON(card->number < 0 || card->number >= SNDRV_CARDS))
 		return -ENXIO;
 
-	snd_device_initialize(&card->ctl_dev, card);
+	snd_device_initialize(&card->ctl_dev, card, NULL);
 	dev_set_name(&card->ctl_dev, "controlC%d", card->number);
 
 	err = snd_device_new(card, SNDRV_DEV_CONTROL, card, &ops);
diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index e95fa275c289..5edea1094a07 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -382,7 +382,7 @@ int snd_hwdep_new(struct snd_card *card, char *id, int device,
 	if (id)
 		strscpy(hwdep->id, id, sizeof(hwdep->id));
 
-	snd_device_initialize(&hwdep->dev, card);
+	snd_device_initialize(&hwdep->dev, card, NULL);
 	hwdep->dev.release = release_hwdep_device;
 	dev_set_name(&hwdep->dev, "hwC%iD%i", card->number, device);
 #ifdef CONFIG_SND_OSSEMUL
diff --git a/sound/core/init.c b/sound/core/init.c
index 22da438faf40..6bc77705ecc3 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -170,25 +170,28 @@ void snd_refmem_put(void *p)
 EXPORT_SYMBOL_GPL(snd_refmem_put);
 
 /* the default release callback set in snd_device_initialize() below;
- * this is just NOP for now, as almost all jobs are already done in
- * dev_free callback of snd_device chain instead.
+ * unreference the memory here if it's specified at initialization
  */
 static void default_release(struct device *dev)
 {
+	snd_refmem_put(dev_get_drvdata(dev));
 }
 
 /**
  * snd_device_initialize - Initialize struct device for sound devices
  * @dev: device to initialize
  * @card: card to assign, optional
+ * @refp: memory associated with snd_refmem
  */
-void snd_device_initialize(struct device *dev, struct snd_card *card)
+void snd_device_initialize(struct device *dev, struct snd_card *card, void *refp)
 {
 	device_initialize(dev);
 	if (card)
 		dev->parent = &card->card_dev;
 	dev->class = &sound_class;
 	dev->release = default_release;
+	dev_set_drvdata(dev, refp);
+	snd_refmem_get(refp);
 }
 EXPORT_SYMBOL_GPL(snd_device_initialize);
 
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9d95e3731123..461a10cc0db9 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -650,7 +650,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 	if (!substream_count)
 		return 0;
 
-	snd_device_initialize(&pstr->dev, pcm->card);
+	snd_device_initialize(&pstr->dev, pcm->card, NULL);
 	pstr->dev.groups = pcm_dev_attr_groups;
 	pstr->dev.type = &pcm_dev_type;
 	dev_set_name(&pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 2d3cec908154..34f124b126ca 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1906,7 +1906,7 @@ int snd_rawmidi_init(struct snd_rawmidi *rmidi,
 	if (id != NULL)
 		strscpy(rmidi->id, id, sizeof(rmidi->id));
 
-	snd_device_initialize(&rmidi->dev, card);
+	snd_device_initialize(&rmidi->dev, card, NULL);
 	rmidi->dev.release = release_rawmidi_device;
 	if (rawmidi_is_ump(rmidi))
 		dev_set_name(&rmidi->dev, "umpC%iD%i", card->number, device);
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index e3f9ea67d019..66e73b35e57e 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2730,7 +2730,7 @@ int __init snd_sequencer_device_init(void)
 {
 	int err;
 
-	snd_device_initialize(&seq_dev, NULL);
+	snd_device_initialize(&seq_dev, NULL, NULL);
 	dev_set_name(&seq_dev, "seq");
 
 	mutex_lock(&register_mutex);
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 9d0d2a5c2e15..04e77a89ecb6 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -2311,7 +2311,7 @@ static int __init alsa_timer_init(void)
 {
 	int err;
 
-	snd_device_initialize(&timer_dev, NULL);
+	snd_device_initialize(&timer_dev, NULL, NULL);
 	dev_set_name(&timer_dev, "timer");
 
 #ifdef SNDRV_OSS_INFO_DEV_TIMERS
-- 
2.35.3

