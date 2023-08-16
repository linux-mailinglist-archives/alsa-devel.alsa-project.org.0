Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164EE77E5F1
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A4B204;
	Wed, 16 Aug 2023 18:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A4B204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201839;
	bh=phT/Z1n5QJx4DPCoY+oX8Fj7hPpA6tzgNSIdh2jKP+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SQ1/frgA77wmsWYuaFokwO/OXFEzh7NboBhF0R7a7loBuC7pXaZ7ysFo9nsYvgC1Q
	 t9CUATGJsWIXHrzEnV7H5PITlA06RirxLUbyAO1H7Y/FOTti7CFlkmvQTXS95ESIZb
	 pfRbVcInjJR9GBWOyce6nRKOu/zoF52uQDJPuozg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D65AF80510; Wed, 16 Aug 2023 18:03:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9598FF80074;
	Wed, 16 Aug 2023 18:03:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 114BDF80551; Wed, 16 Aug 2023 18:03:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBB68F80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBB68F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=L5C6XzFd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Uc++qM6S
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 618CD1F74A;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0W1/5bP7xDvKRYzs9yjyIX8JnhqCK16JlRRetS5RYY=;
	b=L5C6XzFdAucuOtoS4K2+JqTAoWfowlPVq6bmx0lDUZPuTqFPVyP8KJ6kriRfQpv218uXsV
	WQTzt09pb36tK+I1Y8vTmrHcvt2Veq0dz1hSF5SYvcCk8PTfd7dB8/ZqQ3hq1xQ4klShZQ
	+OQAbikcHj39vuhiozXMXq9rh7YQvfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0W1/5bP7xDvKRYzs9yjyIX8JnhqCK16JlRRetS5RYY=;
	b=Uc++qM6S1siTFULF/99EIlfwNod7g3sTMkp4RXr1o0ctau2WqBpPfQNSeJQy4A2bd0BZYF
	DdP7DyjQ7DrksfCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43B45133F2;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GMGUDy/z3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 2/9] ALSA: control: Don't embed ctl_dev
Date: Wed, 16 Aug 2023 18:02:45 +0200
Message-Id: <20230816160252.23396-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DI2SWF4C3TLIA77AKPX3AW6MCQ3SIDKL
X-Message-ID-Hash: DI2SWF4C3TLIA77AKPX3AW6MCQ3SIDKL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DI2SWF4C3TLIA77AKPX3AW6MCQ3SIDKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Embedding the ctl_dev in the snd_card object may result in UAF when
the delayed kobj release is used; at the delayed kobj release, it
still accesses the struct device itself while the card memory (that
embeds the struct device) may be already gone.

As a workaround, detach the struct device from the card object by
allocating via the new snd_device_alloc() helper.  The rest are just
replacing ctl_dev access to the pointer.

This is based on the fix Curtis posted initially.  In this patch, the
changes are split and use the new helper function instead.

Link: https://lore.kernel.org/r/20230801171928.1460120-1-cujomalainey@chromium.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h     |  2 +-
 sound/core/control.c     | 14 ++++++++------
 sound/core/control_led.c |  4 ++--
 sound/usb/media.c        |  2 +-
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index f986fcc5f18f..f3f6b720a278 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -96,7 +96,7 @@ struct snd_card {
 								private data */
 	struct list_head devices;	/* devices */
 
-	struct device ctl_dev;		/* control device */
+	struct device *ctl_dev;		/* control device */
 	unsigned int last_numid;	/* last used numeric ID */
 	struct rw_semaphore controls_rwsem;	/* controls lock (list and values) */
 	rwlock_t ctl_files_rwlock;	/* ctl_files list lock */
diff --git a/sound/core/control.c b/sound/core/control.c
index 8386b53acdcd..eb975df067fb 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2315,7 +2315,7 @@ static int snd_ctl_dev_register(struct snd_device *device)
 	int err;
 
 	err = snd_register_device(SNDRV_DEVICE_TYPE_CONTROL, card, -1,
-				  &snd_ctl_f_ops, card, &card->ctl_dev);
+				  &snd_ctl_f_ops, card, card->ctl_dev);
 	if (err < 0)
 		return err;
 	down_read(&card->controls_rwsem);
@@ -2351,7 +2351,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	up_read(&snd_ctl_layer_rwsem);
 	up_read(&card->controls_rwsem);
 
-	return snd_unregister_device(&card->ctl_dev);
+	return snd_unregister_device(card->ctl_dev);
 }
 
 /*
@@ -2373,7 +2373,7 @@ static int snd_ctl_dev_free(struct snd_device *device)
 	xa_destroy(&card->ctl_hash);
 #endif
 	up_write(&card->controls_rwsem);
-	put_device(&card->ctl_dev);
+	put_device(card->ctl_dev);
 	return 0;
 }
 
@@ -2395,12 +2395,14 @@ int snd_ctl_create(struct snd_card *card)
 	if (snd_BUG_ON(card->number < 0 || card->number >= SNDRV_CARDS))
 		return -ENXIO;
 
-	snd_device_initialize(&card->ctl_dev, card);
-	dev_set_name(&card->ctl_dev, "controlC%d", card->number);
+	err = snd_device_alloc(&card->ctl_dev, card);
+	if (err < 0)
+		return err;
+	dev_set_name(card->ctl_dev, "controlC%d", card->number);
 
 	err = snd_device_new(card, SNDRV_DEV_CONTROL, card, &ops);
 	if (err < 0)
-		put_device(&card->ctl_dev);
+		put_device(card->ctl_dev);
 	return err;
 }
 
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index ee77547bf8dc..760e46cf25cc 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -688,7 +688,7 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 			goto cerr;
 		led->cards[card->number] = led_card;
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
-		WARN(sysfs_create_link(&card->ctl_dev.kobj, &led_card->dev.kobj, link_name),
+		WARN(sysfs_create_link(&card->ctl_dev->kobj, &led_card->dev.kobj, link_name),
 			"can't create symlink to controlC%i device\n", card->number);
 		WARN(sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj, "card"),
 			"can't create symlink to card%i\n", card->number);
@@ -714,7 +714,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
 		if (!led_card)
 			continue;
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
-		sysfs_remove_link(&card->ctl_dev.kobj, link_name);
+		sysfs_remove_link(&card->ctl_dev->kobj, link_name);
 		sysfs_remove_link(&led_card->dev.kobj, "card");
 		device_unregister(&led_card->dev);
 		led->cards[card->number] = NULL;
diff --git a/sound/usb/media.c b/sound/usb/media.c
index 840f42cb9272..6d11fedb4632 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -163,7 +163,7 @@ void snd_media_stop_pipeline(struct snd_usb_substream *subs)
 
 static int snd_media_mixer_init(struct snd_usb_audio *chip)
 {
-	struct device *ctl_dev = &chip->card->ctl_dev;
+	struct device *ctl_dev = chip->card->ctl_dev;
 	struct media_intf_devnode *ctl_intf;
 	struct usb_mixer_interface *mixer;
 	struct media_device *mdev = chip->media_dev;
-- 
2.35.3

