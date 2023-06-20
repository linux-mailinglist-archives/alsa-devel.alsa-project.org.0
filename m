Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E9573735C
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 19:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40898822;
	Tue, 20 Jun 2023 19:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40898822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687283887;
	bh=LEAe0NsxUirzrz1/vb7i4AnyoOYRet9FQaA6901ajn0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zm1G5kVVfoiG2TZjKvqyZHXbM7N0Tb18hZ0aK0FEe85XYK8W8AP648SwszdVwPBl9
	 xsGqHbD1up8jXrU2+88pQOEg/tFqI9hOHjYBaU+1hvyxd7hpQ7QKYJqetyobDhTkyr
	 3nYOw8zqbmKcQVDpUovdqEnjTJ5xeYdec+DS3fiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9154EF801D5; Tue, 20 Jun 2023 19:56:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCAAF80132;
	Tue, 20 Jun 2023 19:56:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1E6EF80141; Tue, 20 Jun 2023 19:56:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC204F80130
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 19:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC204F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=YIRZ/eYW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5FD8C61336;
	Tue, 20 Jun 2023 17:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7049FC433CC;
	Tue, 20 Jun 2023 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687283799;
	bh=LEAe0NsxUirzrz1/vb7i4AnyoOYRet9FQaA6901ajn0=;
	h=From:To:Cc:Subject:Date:From;
	b=YIRZ/eYWd+fOtXdsGARBHdShsNOAhtDClS5GCF3QOhXmq3zYHqvR6bRLS5oMTGbY/
	 g5r1Xq/8squEOcLnwH2mdVIudEjsRTTwIbSO/0XC0epo+/6/FCLptoxsDT9mWg99m7
	 DI5ts+0H2ESi+keQ7H9Vvkus61ejCdGW76DCc7Jg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geoff Levand <geoff@infradead.org>,
	Thierry Reding <treding@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] sound: make all 'class' structures const
Date: Tue, 20 Jun 2023 19:56:34 +0200
Message-ID: <20230620175633.641141-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4811;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=1cb14i/gwAIZV/k9GgRzsiloc4sYqdiaG2JT6hlz55Q=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDCkTXwRKPnlQtZJ9S+He/186Pqt+XnTrxfOIDYHX+7wlO
 76ma3RIdMSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBENDYyLFj88XGRTZ0p69lD
 e/aVeqt35QbdFmVYcLLR+uaX3+5HWn2sM/69zfrGuIIhBwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4SLHOPCCKP54KFLHQFPN6YD6PFDEMDZN
X-Message-ID-Hash: 4SLHOPCCKP54KFLHQFPN6YD6PFDEMDZN
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SLHOPCCKP54KFLHQFPN6YD6PFDEMDZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ivan Orlov <ivan.orlov0322@gmail.com>

Now that the driver core allows for struct class to be in read-only
memory, making all 'class' structures to be declared at build time
placing them into read-only memory, instead of having to be dynamically
allocated at load time.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/sound/core.h     |  2 +-
 sound/core/control_led.c |  2 +-
 sound/core/init.c        |  4 ++--
 sound/sound_core.c       | 23 ++++++++++++-----------
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 3edc4ab08774..bbcecfff723d 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -232,7 +232,7 @@ static inline struct device *snd_card_get_device_link(struct snd_card *card)
 
 extern int snd_major;
 extern int snd_ecards_limit;
-extern struct class *sound_class;
+extern const struct class sound_class;
 #ifdef CONFIG_SND_DEBUG
 extern struct dentry *sound_debugfs_root;
 #endif
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 3cadd40100f3..ee77547bf8dc 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -737,7 +737,7 @@ static int __init snd_ctl_led_init(void)
 	unsigned int group;
 
 	device_initialize(&snd_ctl_led_dev);
-	snd_ctl_led_dev.class = sound_class;
+	snd_ctl_led_dev.class = &sound_class;
 	snd_ctl_led_dev.release = snd_ctl_led_dev_release;
 	dev_set_name(&snd_ctl_led_dev, "ctl-led");
 	if (device_add(&snd_ctl_led_dev)) {
diff --git a/sound/core/init.c b/sound/core/init.c
index df0c22480375..baef2688d0cf 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -129,7 +129,7 @@ void snd_device_initialize(struct device *dev, struct snd_card *card)
 	device_initialize(dev);
 	if (card)
 		dev->parent = &card->card_dev;
-	dev->class = sound_class;
+	dev->class = &sound_class;
 	dev->release = default_release;
 }
 EXPORT_SYMBOL_GPL(snd_device_initialize);
@@ -331,7 +331,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 
 	device_initialize(&card->card_dev);
 	card->card_dev.parent = parent;
-	card->card_dev.class = sound_class;
+	card->card_dev.class = &sound_class;
 	card->card_dev.release = release_card_device;
 	card->card_dev.groups = card->dev_groups;
 	card->dev_groups[0] = &card_dev_attr_group;
diff --git a/sound/sound_core.c b/sound/sound_core.c
index 4f6911274d56..d81fed1c1226 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -23,9 +23,6 @@ static inline int init_oss_soundcore(void)	{ return 0; }
 static inline void cleanup_oss_soundcore(void)	{ }
 #endif
 
-struct class *sound_class;
-EXPORT_SYMBOL(sound_class);
-
 MODULE_DESCRIPTION("Core sound module");
 MODULE_AUTHOR("Alan Cox");
 MODULE_LICENSE("GPL");
@@ -37,6 +34,12 @@ static char *sound_devnode(const struct device *dev, umode_t *mode)
 	return kasprintf(GFP_KERNEL, "snd/%s", dev_name(dev));
 }
 
+const struct class sound_class = {
+	.name = "sound",
+	.devnode = sound_devnode,
+};
+EXPORT_SYMBOL(sound_class);
+
 static int __init init_soundcore(void)
 {
 	int rc;
@@ -45,21 +48,19 @@ static int __init init_soundcore(void)
 	if (rc)
 		return rc;
 
-	sound_class = class_create("sound");
-	if (IS_ERR(sound_class)) {
+	rc = class_register(&sound_class);
+	if (rc) {
 		cleanup_oss_soundcore();
-		return PTR_ERR(sound_class);
+		return rc;
 	}
 
-	sound_class->devnode = sound_devnode;
-
 	return 0;
 }
 
 static void __exit cleanup_soundcore(void)
 {
 	cleanup_oss_soundcore();
-	class_destroy(sound_class);
+	class_unregister(&sound_class);
 }
 
 subsys_initcall(init_soundcore);
@@ -276,7 +277,7 @@ static int sound_insert_unit(struct sound_unit **list, const struct file_operati
 		}
 	}
 
-	device_create(sound_class, dev, MKDEV(SOUND_MAJOR, s->unit_minor),
+	device_create(&sound_class, dev, MKDEV(SOUND_MAJOR, s->unit_minor),
 		      NULL, "%s", s->name+6);
 	return s->unit_minor;
 
@@ -302,7 +303,7 @@ static void sound_remove_unit(struct sound_unit **list, int unit)
 		if (!preclaim_oss)
 			__unregister_chrdev(SOUND_MAJOR, p->unit_minor, 1,
 					    p->name);
-		device_destroy(sound_class, MKDEV(SOUND_MAJOR, p->unit_minor));
+		device_destroy(&sound_class, MKDEV(SOUND_MAJOR, p->unit_minor));
 		kfree(p);
 	}
 }
-- 
2.41.0

