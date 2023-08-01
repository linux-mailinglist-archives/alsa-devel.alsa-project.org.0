Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE1376BB02
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 19:21:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD93210;
	Tue,  1 Aug 2023 19:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD93210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690910470;
	bh=5CF23lL++SO+oR/hZktbLcm9a27RwqKfPW9UqbUXgFI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IBmjMGsV8+aRp44RwzaDxrNpMVq0qcCjcCJW2qRtq7yM2+9q1xkMJV+A+EpCEoKf0
	 dJQgnf+dJ7G4l04+b55tq2CRukeY1cZLPntJXQIRQkCv74vzbqacGRKIxkInplA4R8
	 NlpN9IZ9lV8ofZukMGk/byd/dhra0VacmcvAP0lQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D6B9F80425; Tue,  1 Aug 2023 19:20:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1AB3F8016D;
	Tue,  1 Aug 2023 19:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A4FCF8015B; Tue,  1 Aug 2023 19:20:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4615DF8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 19:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4615DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VD2jlLVl
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68706b39c4cso3441634b3a.2
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Aug 2023 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690910382; x=1691515182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srE2zBYA5NiF+KAc/cQFKCp+fM3jDYU1wa1D4t2gGvA=;
        b=VD2jlLVlsxQhwknZrsbxpVBeush+Vum/1zXJMtBa7Wn6/PDvgmCI0tRuFnDaLGvGAM
         u8XXCRfzaqGLOIfWNPTvdzuOT1WrLf9cuiooqUozntRhmttT569pjmBII0FTtj9PRvki
         D7rG5B+9vD3/b1KuysYfq+f37dJu5+Q5L7jT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690910382; x=1691515182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srE2zBYA5NiF+KAc/cQFKCp+fM3jDYU1wa1D4t2gGvA=;
        b=R8RkwqQBR5QM4DTjslu32z7MAJb4iLnBXtx2E7MMuEpVJOXWRSO8FhyvKKBOxYV6nJ
         zhFmICSs112GkiG/irvEBZHuR2nj7QQloVC1uES9Poqa1k09ZqJ+SrPvxCIcajzEkdJA
         9ydj+o5qYjcYttdLPuSHuqqR4+n8ijuIpmWDk542Z+MJw3KmvaDeMn9TX0/J6A48ETtI
         KUx+ys4Kfr9ruKn9x62sCuwUdfy9sHDUQb8SSARSY4IETIpjF4sZNMV2qH3I68gg72sz
         74PQlDpJqpaVqFyMRIaLfNXmSFZXA8kGdQLz7sP0iV1mQq2oQTw4grnRZ5gcA4DNLncf
         CZ/w==
X-Gm-Message-State: ABy/qLb7AHwTXY+hJfzNlFnK//czYDpJosBNMz+W2wDUPgjEYNNXh7ZI
	/VOXP/dGLnxUftWEImKxlEUE7M6m97O8N92O8Q==
X-Google-Smtp-Source: 
 APBJJlGXOOchgrS88ZPlab0tgWmWu2JyI6fi0hIBxnOb579CADpXl4CIu3oL5678bPy4rHx/CSB8IQ==
X-Received: by 2002:a05:6a20:8412:b0:130:a15d:54eb with SMTP id
 c18-20020a056a20841200b00130a15d54ebmr14903034pzd.24.1690910381583;
        Tue, 01 Aug 2023 10:19:41 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:b1df:9505:872f:b559])
        by smtp.gmail.com with UTF8SMTPSA id
 l21-20020a62be15000000b0068743cab196sm3159000pff.186.2023.08.01.10.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 10:19:41 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] sound: core: fix device ownership model in card and pcm
Date: Tue,  1 Aug 2023 10:18:41 -0700
Message-ID: <20230801171928.1460120-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O7J2RRDFR2YS4BJKOFRUBMA3S4KD4WV2
X-Message-ID-Hash: O7J2RRDFR2YS4BJKOFRUBMA3S4KD4WV2
X-MailFrom: cujomalainey@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7J2RRDFR2YS4BJKOFRUBMA3S4KD4WV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

The current implementation of how devices are released is valid for
production use cases (root control of memory is handled by card_dev, all
other devices are no-ops).

This model does not work though in a kernel hacking environment where
KASAN and delayed release on kobj is enabled. If the card_dev device is
released before any of the child objects a use-after-free bug is caught
by KASAN as the delayed release still has a reference to the devices
that were freed by the card_dev release. Also both snd_card and snd_pcm
both own two devices internally, so even if they released independently,
the shared struct would result in another use after free.

Solution is to move the child devices into their own memory so they can
be handled independently and released on their own schedule.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>
---
 include/sound/core.h     |  2 +-
 include/sound/pcm.h      |  2 +-
 sound/core/control.c     | 21 +++++++++++++++------
 sound/core/control_led.c |  4 ++--
 sound/core/pcm.c         | 30 ++++++++++++++++++++----------
 sound/usb/media.c        |  4 ++--
 6 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index f6e0dd648b80c..a08ab8c8cfb6d 100644
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
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 19f564606ac42..0243a13e9ac47 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -510,7 +510,7 @@ struct snd_pcm_str {
 #endif
 #endif
 	struct snd_kcontrol *chmap_kctl; /* channel-mapping controls */
-	struct device dev;
+	struct device *dev;
 };
 
 struct snd_pcm {
diff --git a/sound/core/control.c b/sound/core/control.c
index 8386b53acdcd4..8bbaf3dffce62 100644
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
@@ -2373,10 +2373,15 @@ static int snd_ctl_dev_free(struct snd_device *device)
 	xa_destroy(&card->ctl_hash);
 #endif
 	up_write(&card->controls_rwsem);
-	put_device(&card->ctl_dev);
+	put_device(card->ctl_dev);
 	return 0;
 }
 
+static void snd_ctl_dev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 /*
  * create control core:
  * called from init.c
@@ -2394,13 +2399,17 @@ int snd_ctl_create(struct snd_card *card)
 		return -ENXIO;
 	if (snd_BUG_ON(card->number < 0 || card->number >= SNDRV_CARDS))
 		return -ENXIO;
+	card->ctl_dev = kzalloc(sizeof(*card->ctl_dev), GFP_KERNEL);
+	if (!card->ctl_dev)
+		return -ENOMEM;
 
-	snd_device_initialize(&card->ctl_dev, card);
-	dev_set_name(&card->ctl_dev, "controlC%d", card->number);
+	snd_device_initialize(card->ctl_dev, card);
+	card->ctl_dev->release = snd_ctl_dev_release;
+	dev_set_name(card->ctl_dev, "controlC%d", card->number);
 
 	err = snd_device_new(card, SNDRV_DEV_CONTROL, card, &ops);
 	if (err < 0)
-		put_device(&card->ctl_dev);
+		put_device(card->ctl_dev);
 	return err;
 }
 
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index ee77547bf8dcb..760e46cf25cc8 100644
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
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9d95e37311230..9026ccc56dbe7 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -604,7 +604,7 @@ static const struct attribute_group *pcm_dev_attr_groups[];
 #ifdef CONFIG_PM_SLEEP
 static int do_pcm_suspend(struct device *dev)
 {
-	struct snd_pcm_str *pstr = container_of(dev, struct snd_pcm_str, dev);
+	struct snd_pcm_str *pstr = dev_get_drvdata(dev);
 
 	if (!pstr->pcm->no_device_suspend)
 		snd_pcm_suspend_all(pstr->pcm);
@@ -622,6 +622,11 @@ static const struct device_type pcm_dev_type = {
 	.pm = &pcm_dev_pm_ops,
 };
 
+static void snd_pcm_dev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 /**
  * snd_pcm_new_stream - create a new PCM stream
  * @pcm: the pcm instance
@@ -641,6 +646,10 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 	struct snd_pcm_str *pstr = &pcm->streams[stream];
 	struct snd_pcm_substream *substream, *prev;
 
+	pstr->dev = kzalloc(sizeof(*pstr->dev), GFP_KERNEL);
+	if (!pstr->dev)
+		return -ENOMEM;
+	dev_set_drvdata(pstr->dev, pstr);
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	mutex_init(&pstr->oss.setup_mutex);
 #endif
@@ -650,10 +659,11 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 	if (!substream_count)
 		return 0;
 
-	snd_device_initialize(&pstr->dev, pcm->card);
-	pstr->dev.groups = pcm_dev_attr_groups;
-	pstr->dev.type = &pcm_dev_type;
-	dev_set_name(&pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
+	snd_device_initialize(pstr->dev, pcm->card);
+	pstr->dev->release = snd_pcm_dev_release;
+	pstr->dev->groups = pcm_dev_attr_groups;
+	pstr->dev->type = &pcm_dev_type;
+	dev_set_name(pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
 		     stream == SNDRV_PCM_STREAM_PLAYBACK ? 'p' : 'c');
 
 	if (!pcm->internal) {
@@ -699,7 +709,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 		prev = substream;
 	}
 	return 0;
-}				
+}
 EXPORT_SYMBOL(snd_pcm_new_stream);
 
 static int _snd_pcm_new(struct snd_card *card, const char *id, int device,
@@ -847,7 +857,7 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 #endif
 	free_chmap(pstr);
 	if (pstr->substream_count)
-		put_device(&pstr->dev);
+		put_device(pstr->dev);
 }
 
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
@@ -1017,7 +1027,7 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 static ssize_t pcm_class_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-	struct snd_pcm_str *pstr = container_of(dev, struct snd_pcm_str, dev);
+	struct snd_pcm_str *pstr = dev_get_drvdata(dev);
 	struct snd_pcm *pcm = pstr->pcm;
 	const char *str;
 	static const char *strs[SNDRV_PCM_CLASS_LAST + 1] = {
@@ -1078,7 +1088,7 @@ static int snd_pcm_dev_register(struct snd_device *device)
 		/* register pcm */
 		err = snd_register_device(devtype, pcm->card, pcm->device,
 					  &snd_pcm_f_ops[cidx], pcm,
-					  &pcm->streams[cidx].dev);
+					  pcm->streams[cidx].dev);
 		if (err < 0) {
 			list_del_init(&pcm->list);
 			goto unlock;
@@ -1125,7 +1135,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	pcm_call_notify(pcm, n_disconnect);
 	for (cidx = 0; cidx < 2; cidx++) {
-		snd_unregister_device(&pcm->streams[cidx].dev);
+		snd_unregister_device(pcm->streams[cidx].dev);
 		free_chmap(&pcm->streams[cidx]);
 	}
 	mutex_unlock(&pcm->open_mutex);
diff --git a/sound/usb/media.c b/sound/usb/media.c
index 840f42cb9272c..d48db6f3ae659 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -35,7 +35,7 @@ int snd_media_stream_init(struct snd_usb_substream *subs, struct snd_pcm *pcm,
 {
 	struct media_device *mdev;
 	struct media_ctl *mctl;
-	struct device *pcm_dev = &pcm->streams[stream].dev;
+	struct device *pcm_dev = pcm->streams[stream].dev;
 	u32 intf_type;
 	int ret = 0;
 	u16 mixer_pad;
@@ -163,7 +163,7 @@ void snd_media_stop_pipeline(struct snd_usb_substream *subs)
 
 static int snd_media_mixer_init(struct snd_usb_audio *chip)
 {
-	struct device *ctl_dev = &chip->card->ctl_dev;
+	struct device *ctl_dev = chip->card->ctl_dev;
 	struct media_intf_devnode *ctl_intf;
 	struct usb_mixer_interface *mixer;
 	struct media_device *mdev = chip->media_dev;
-- 
2.41.0.585.gd2178a4bd4-goog

