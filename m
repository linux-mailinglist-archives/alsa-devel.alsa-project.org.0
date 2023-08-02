Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F277776D5DA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 19:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08E184E;
	Wed,  2 Aug 2023 19:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08E184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690998387;
	bh=C1s2J3OqODEGnfOp/VIklgxuCYfzNTghT8RF7vdyetE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=snUvh5aT0he9W5SeHnxGOHR5wAkE2AAuFOxmq7OM75/T8hvsvHUIG0W8JYnPAm3E4
	 AT2ExJ9UAme6h/vdFzNSUqSsFMDvHJa6MfPflFUTg+JFx/6awS3L2+1BLjPFMRFSNZ
	 68SUcwqi36PYxBztNvKhGhMxQE3/USw6dVJii1/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7792CF8016D; Wed,  2 Aug 2023 19:45:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB9DF801D5;
	Wed,  2 Aug 2023 19:45:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA4A5F8025A; Wed,  2 Aug 2023 19:45:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A0E0F8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A0E0F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=OEXjNIK3
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68336d06620so32611b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690998318; x=1691603118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K87XLXVquwnl3qmCcrFhcIvWdGeHY8cFdYOKxYWU6t0=;
        b=OEXjNIK3MaXT7tq13huCDJtg8v612rdhGYKWRy5FcjWtXEDCvS4oTZru491rXCdegj
         RX0CSupkwK4/TA0SO2FrIBPl42OFZbsYfUeE3qITQN3obeNuC5sDh0cuUMyLPfqz+mTO
         gsTe7Rg6MHFsGHKwHfb1viRlsBXCtDivC+vRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690998318; x=1691603118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K87XLXVquwnl3qmCcrFhcIvWdGeHY8cFdYOKxYWU6t0=;
        b=GTd8Rxq3P9G5aX0EpfsdsR4Ta3CS0LVbGWw+0cEBbNLGEQf4+VelRmY8IZ6Lczgv19
         zOPfnWM8gykfYwiW/QQHRaPHEFt4OtB2/qAmovqws0FEkLUrEquFpyazHWVqblWG2Jfa
         3b6EsVPXzvqaoPJu4FnJtnq8M4ee2yUrp0Mb705IlrJtv3fYkmnccgCG74Xi3HB8uYrm
         nFMGSVgZ3AuVR97uuLfOB3au8MDPvnQenGZ0+6K7V2Ohw/7Hi2c6zoHD9hK/SDSUliib
         KWpBPnaofhPTcmhTzu8hJisJvqxmf5Ekpgo13I1+JnwDUpwN/+38G9FusJuySxyex1qU
         UIgg==
X-Gm-Message-State: ABy/qLZPaB9WaBY5DFAPb19QzanV29o7Bg3fGV/eyMNI7heeUfp/XgBu
	iT27Qi47cYuOU0/X6NyYkVElP9Zc4MIdbRHqog==
X-Google-Smtp-Source: 
 APBJJlH7NwXo6gLtvcgu3suWruQkDFuaA0S6oWbODk5/+OdoaY1IJYp9FmmcXSLOZYrb09UNVDn3GA==
X-Received: by 2002:a05:6a20:7f8b:b0:135:32b1:b03d with SMTP id
 d11-20020a056a207f8b00b0013532b1b03dmr20639794pzj.42.1690998317882;
        Wed, 02 Aug 2023 10:45:17 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:ed25:8900:2491:cc45])
        by smtp.gmail.com with UTF8SMTPSA id
 n9-20020aa78a49000000b00668652b020bsm11342341pfa.105.2023.08.02.10.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 10:45:17 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: [PATCH v2] sound: core: fix device ownership model in card and pcm
Date: Wed,  2 Aug 2023 10:43:49 -0700
Message-ID: <20230802174451.3611976-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: 
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
References: 
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2ZNYYDLFST5TTTNZNVGUS24VPN37GQLW
X-Message-ID-Hash: 2ZNYYDLFST5TTTNZNVGUS24VPN37GQLW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZNYYDLFST5TTTNZNVGUS24VPN37GQLW/>
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
 include/sound/core.h            |  2 +-
 include/sound/pcm.h             |  2 +-
 sound/aoa/soundbus/i2sbus/pcm.c |  4 ++--
 sound/core/control.c            | 21 +++++++++++++++------
 sound/core/control_led.c        |  4 ++--
 sound/core/pcm.c                | 30 ++++++++++++++++++++----------
 sound/usb/media.c               |  4 ++--
 7 files changed, 43 insertions(+), 24 deletions(-)

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
diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index a9e502a6cdeb8..07df5cc0f2d7c 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -972,7 +972,7 @@ i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
 			goto out_put_ci_module;
 		snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				&i2sbus_playback_ops);
-		dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].dev.parent =
+		dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].dev->parent =
 			&dev->ofdev.dev;
 		i2sdev->out.created = 1;
 	}
@@ -989,7 +989,7 @@ i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
 			goto out_put_ci_module;
 		snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_CAPTURE,
 				&i2sbus_record_ops);
-		dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE].dev.parent =
+		dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE].dev->parent =
 			&dev->ofdev.dev;
 		i2sdev->in.created = 1;
 	}
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

