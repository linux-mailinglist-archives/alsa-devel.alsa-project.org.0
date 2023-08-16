Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D3E77E5F5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5051E82B;
	Wed, 16 Aug 2023 18:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5051E82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201890;
	bh=KIzidWZOWWg0oICJwd0Nqp/docUSis/K/1sEdFm4ypA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WjBaR8uegftaaU6wYdWcn2N4VsH8uGSZlUHLKQUywlUxooEifIPht8iC72NIgKD6T
	 mNcyW1EX6J/Qd8eYspzMh6M/CtLBh+XHPOfGJFrRG4ivsZ5ZRtPX1eGWAcZPsMikDW
	 VIxtoFaQ6clSonZZnSbRyeEn8KCwtP6xwgvZmx/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A688F80563; Wed, 16 Aug 2023 18:03:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B4BF8055C;
	Wed, 16 Aug 2023 18:03:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69517F80551; Wed, 16 Aug 2023 18:03:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28608F800EE
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28608F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=z+SqeBwk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=t6gtf0z9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF6621F85D;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09GtIE4nldCqlVqLMDoa3/hcoV1GSd+mdT8pNG5Mxu4=;
	b=z+SqeBwkG3zCGP4kUTZtHxwYDsRszv0kA4wNvCy74TmMDqgvZGoIPTmzYhvyqCgym1A8TZ
	krOKgicA4ePn0hZIfkc6JQvQJWghuYGa55BVfdJxz+vWRgSWxtKJZPIVLjxU/r86DtQxIl
	fv5ZPzY4SGbaI6+FIntquaYeVy9+3M4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09GtIE4nldCqlVqLMDoa3/hcoV1GSd+mdT8pNG5Mxu4=;
	b=t6gtf0z9mmD4/gd8XlWfYSm7puEcWYVdxh0Gy5vy8DavWW96muOYSj1NjTdgbYrpk7StPS
	HLuZwdL2CBuFBOBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DFE5133F2;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iMnmIS/z3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 4/9] ALSA: hwdep: Don't embed device
Date: Wed, 16 Aug 2023 18:02:47 +0200
Message-Id: <20230816160252.23396-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JLILG2MKAKEOR3BN4A4JXQUD4CIBQ67P
X-Message-ID-Hash: JLILG2MKAKEOR3BN4A4JXQUD4CIBQ67P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLILG2MKAKEOR3BN4A4JXQUD4CIBQ67P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like control and PCM devices, it's better to avoid the embedded struct
device for hwdep (although it's more or less well working), too.
Change it to allocate via snd_device_alloc(), and free the memory at
the common snd_hwdep_free().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hwdep.h     |  2 +-
 sound/core/hwdep.c        | 38 +++++++++++++++++++++-----------------
 sound/pci/hda/hda_hwdep.c |  4 ++--
 3 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/include/sound/hwdep.h b/include/sound/hwdep.h
index 8d6cdb254039..b0da633184cd 100644
--- a/include/sound/hwdep.h
+++ b/include/sound/hwdep.h
@@ -53,7 +53,7 @@ struct snd_hwdep {
 	wait_queue_head_t open_wait;
 	void *private_data;
 	void (*private_free) (struct snd_hwdep *hwdep);
-	struct device dev;
+	struct device *dev;
 
 	struct mutex open_mutex;
 	int used;			/* reference counter */
diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index e95fa275c289..de7476034f2c 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -338,9 +338,14 @@ static const struct file_operations snd_hwdep_f_ops =
 	.mmap =		snd_hwdep_mmap,
 };
 
-static void release_hwdep_device(struct device *dev)
+static void snd_hwdep_free(struct snd_hwdep *hwdep)
 {
-	kfree(container_of(dev, struct snd_hwdep, dev));
+	if (!hwdep)
+		return;
+	if (hwdep->private_free)
+		hwdep->private_free(hwdep);
+	put_device(hwdep->dev);
+	kfree(hwdep);
 }
 
 /**
@@ -382,16 +387,20 @@ int snd_hwdep_new(struct snd_card *card, char *id, int device,
 	if (id)
 		strscpy(hwdep->id, id, sizeof(hwdep->id));
 
-	snd_device_initialize(&hwdep->dev, card);
-	hwdep->dev.release = release_hwdep_device;
-	dev_set_name(&hwdep->dev, "hwC%iD%i", card->number, device);
+	err = snd_device_alloc(&hwdep->dev, card);
+	if (err < 0) {
+		snd_hwdep_free(hwdep);
+		return err;
+	}
+
+	dev_set_name(hwdep->dev, "hwC%iD%i", card->number, device);
 #ifdef CONFIG_SND_OSSEMUL
 	hwdep->oss_type = -1;
 #endif
 
 	err = snd_device_new(card, SNDRV_DEV_HWDEP, hwdep, &ops);
 	if (err < 0) {
-		put_device(&hwdep->dev);
+		snd_hwdep_free(hwdep);
 		return err;
 	}
 
@@ -403,12 +412,7 @@ EXPORT_SYMBOL(snd_hwdep_new);
 
 static int snd_hwdep_dev_free(struct snd_device *device)
 {
-	struct snd_hwdep *hwdep = device->device_data;
-	if (!hwdep)
-		return 0;
-	if (hwdep->private_free)
-		hwdep->private_free(hwdep);
-	put_device(&hwdep->dev);
+	snd_hwdep_free(device->device_data);
 	return 0;
 }
 
@@ -426,9 +430,9 @@ static int snd_hwdep_dev_register(struct snd_device *device)
 	list_add_tail(&hwdep->list, &snd_hwdep_devices);
 	err = snd_register_device(SNDRV_DEVICE_TYPE_HWDEP,
 				  hwdep->card, hwdep->device,
-				  &snd_hwdep_f_ops, hwdep, &hwdep->dev);
+				  &snd_hwdep_f_ops, hwdep, hwdep->dev);
 	if (err < 0) {
-		dev_err(&hwdep->dev, "unable to register\n");
+		dev_err(hwdep->dev, "unable to register\n");
 		list_del(&hwdep->list);
 		mutex_unlock(&register_mutex);
 		return err;
@@ -439,12 +443,12 @@ static int snd_hwdep_dev_register(struct snd_device *device)
 	if (hwdep->oss_type >= 0) {
 		if (hwdep->oss_type == SNDRV_OSS_DEVICE_TYPE_DMFM &&
 		    hwdep->device)
-			dev_warn(&hwdep->dev,
+			dev_warn(hwdep->dev,
 				 "only hwdep device 0 can be registered as OSS direct FM device!\n");
 		else if (snd_register_oss_device(hwdep->oss_type,
 						 card, hwdep->device,
 						 &snd_hwdep_f_ops, hwdep) < 0)
-			dev_warn(&hwdep->dev,
+			dev_warn(hwdep->dev,
 				 "unable to register OSS compatibility device\n");
 		else
 			hwdep->ossreg = 1;
@@ -471,7 +475,7 @@ static int snd_hwdep_dev_disconnect(struct snd_device *device)
 	if (hwdep->ossreg)
 		snd_unregister_oss_device(hwdep->oss_type, hwdep->card, hwdep->device);
 #endif
-	snd_unregister_device(&hwdep->dev);
+	snd_unregister_device(hwdep->dev);
 	list_del_init(&hwdep->list);
 	mutex_unlock(&hwdep->open_mutex);
 	mutex_unlock(&register_mutex);
diff --git a/sound/pci/hda/hda_hwdep.c b/sound/pci/hda/hda_hwdep.c
index 125e97fe0b1c..727f39acedfc 100644
--- a/sound/pci/hda/hda_hwdep.c
+++ b/sound/pci/hda/hda_hwdep.c
@@ -114,8 +114,8 @@ int snd_hda_create_hwdep(struct hda_codec *codec)
 #endif
 
 	/* for sysfs */
-	hwdep->dev.groups = snd_hda_dev_attr_groups;
-	dev_set_drvdata(&hwdep->dev, codec);
+	hwdep->dev->groups = snd_hda_dev_attr_groups;
+	dev_set_drvdata(hwdep->dev, codec);
 
 	return 0;
 }
-- 
2.35.3

