Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9212779F2B6
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 22:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12EA8A4B;
	Wed, 13 Sep 2023 22:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12EA8A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694636028;
	bh=e1bcwcPpeUcCDyBdOp5GJOoFTDwTTL+Ph0r8NHJFzuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tNZj3hgar0AlR9dC7iV3rE4LeoLE6gLDVSk9XZdn6kgLgBGDKeZXtHK5LMMMiFhIo
	 Xl+mmkb6m7ydcU+qIUzTR9ILOanlC7VE6/bCmuGaPQ8zj+GH1aZIIaQr3LnohJ8wY/
	 gHofJ8S7UnCCOghatHFc2Wiw9eksZpp0MIOy82gA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8ED7F80246; Wed, 13 Sep 2023 22:12:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4461EF80246;
	Wed, 13 Sep 2023 22:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C56BF80425; Wed, 13 Sep 2023 22:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34810F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 22:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34810F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VyjLK2u7
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-26f38171174so178613a91.3
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Sep 2023 13:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694635935; x=1695240735;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl3TlM0f6hwsOXxEB00G54SYTEyT8OteTBWYpwDqT/U=;
        b=VyjLK2u7MCQpC+NbDAOGmt1GkFbadXFGoZsSHPKxD6ajDGCurb7VRoGTb2yzWmFqdI
         GlZEscyBb/9v6y3Dl9rZ/qfgORKt1mOeiEOM0lLAbc3tIVC9gDK4h0Klomyr1wGj36z5
         FIxfogePwRf+m9/GQdXsedSNbNswlG6qsNhiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694635935; x=1695240735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl3TlM0f6hwsOXxEB00G54SYTEyT8OteTBWYpwDqT/U=;
        b=A13VAQYR7GT0W0hoMzDQg9AmVXqu7tGaXeGWlI4zsppiV/ioMU4jcG2dH+W+Ne06Or
         l1ipQ00gJBwotK16y9duI4HGHkPSDcgj6tMzcClYlE3XqKiNE9SCuTBh5TQa8/v10UE1
         lQv5jOds1baVXFBW63vO1MC3PYndqISuNjJvEXWcY9AkvrbbiOK44UF2JDmyomBpzxYp
         6h45gMZMTVjfKu5zUDNcSmjiauclLmXBsVf+pY84WpksH7IZqgT7UKDZYrBC9qiqJnil
         OGkfpA0JeIVCNZvbnosQDOkfiGYc9UOMNxqGiRAb9qs5VZebzBK9vWKVNNbKPIC0Jrwg
         vMAw==
X-Gm-Message-State: AOJu0YzbELfvEyhv9sx7zJGP+QE5GWA7vfzjo/sMGlkJZWg0VkCxN/Am
	KlqUb70tqNCTm/9+mw5k+ZYVLKLyEc4A7GNBgQ==
X-Google-Smtp-Source: 
 AGHT+IHqaebgnDkCiwELABR9/n4sGpJ3D2sY7URHJv7sTLOlW41h0Ldi8/iNJ/oPH5U156eQujYmiw==
X-Received: by 2002:a17:90a:c38e:b0:267:f1d0:ca70 with SMTP id
 h14-20020a17090ac38e00b00267f1d0ca70mr3374326pjt.47.1694635934968;
        Wed, 13 Sep 2023 13:12:14 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:a3c9:d58:99ff:86e9])
        by smtp.gmail.com with UTF8SMTPSA id
 v3-20020a17090abb8300b0026d462d34ffsm1834772pjr.47.2023.09.13.13.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 13:12:14 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Min-Hua Chen <minhuadotchen@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Thierry Reding <treding@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC PATCH v2 2/2] ALSA: core: split control primitives out of
 snd_card
Date: Wed, 13 Sep 2023 13:07:44 -0700
Message-ID: <20230913200846.1894258-3-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230913200846.1894258-1-cujomalainey@chromium.org>
References: <20230913200846.1894258-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JBTANT5YDWGNA6QQNF7EBCOERUVM4GKC
X-Message-ID-Hash: JBTANT5YDWGNA6QQNF7EBCOERUVM4GKC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBTANT5YDWGNA6QQNF7EBCOERUVM4GKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Having two kobj in the same struct is broken at its core. This splits
card_dev from ctl_dev so they can properly refcount and release on their
own schedules without the workaround of having them being just a
pointer.

Change-Id: Iecc91a116dfcb5a6364c7e6bdf993949e8542ca1
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
v2:
- Fix leak rnd formatting eported by Takashi
- Collapse snd_ctl_create into snd_control_new to ease memory handling
  reported by Takashi
- Fix OSS errors reported by kbuild

 include/sound/control.h                  |   1 +
 include/sound/core.h                     |  32 +-
 sound/core/control.c                     | 362 +++++++++++++----------
 sound/core/control_compat.c              |   8 +-
 sound/core/control_led.c                 |  18 +-
 sound/core/init.c                        |  14 +-
 sound/core/oss/mixer_oss.c               |  52 ++--
 sound/pci/hda/hda_codec.c                |   3 +-
 sound/soc/intel/atom/sst-atom-controls.c |   8 +-
 sound/soc/soc-card.c                     |   2 +-
 sound/usb/media.c                        |   2 +-
 11 files changed, 269 insertions(+), 233 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 9a4f4f7138da8..32920f33eb47e 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -128,6 +128,7 @@ typedef int (*snd_kctl_ioctl_func_t) (struct snd_card * card,
 				      struct snd_ctl_file * control,
 				      unsigned int cmd, unsigned long arg);
 
+int snd_control_new(struct snd_card * card);
 void snd_ctl_notify(struct snd_card * card, unsigned int mask, struct snd_ctl_elem_id * id);
 void snd_ctl_notify_one(struct snd_card * card, unsigned int mask, struct snd_kcontrol * kctl, unsigned int ioff);
 
diff --git a/include/sound/core.h b/include/sound/core.h
index a4744e142c7e3..263174eea4634 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -95,21 +95,7 @@ struct snd_card {
 	void (*private_free) (struct snd_card *card); /* callback for freeing of
 								private data */
 	struct list_head devices;	/* devices */
-
-	struct device *ctl_dev;		/* control device */
-	unsigned int last_numid;	/* last used numeric ID */
-	struct rw_semaphore controls_rwsem;	/* controls lock (list and values) */
-	rwlock_t ctl_files_rwlock;	/* ctl_files list lock */
-	int controls_count;		/* count of all controls */
-	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
-	struct list_head controls;	/* all controls for this card */
-	struct list_head ctl_files;	/* active control files */
-#ifdef CONFIG_SND_CTL_FAST_LOOKUP
-	struct xarray ctl_numids;	/* hash table for numids */
-	struct xarray ctl_hash;		/* hash table for ctl id matching */
-	bool ctl_hash_collision;	/* ctl_hash collision seen? */
-#endif
-
+	struct snd_control *ctl;	/* control devices */
 	struct snd_info_entry *proc_root;	/* root for soundcard specific files */
 	struct proc_dir_entry *proc_root_link;	/* number link to real id */
 
@@ -147,6 +133,22 @@ struct snd_card {
 #endif
 };
 
+struct snd_control {
+	struct device dev;		/* control device */
+	struct rw_semaphore controls_rwsem;	/* controls lock (list and values) */
+	rwlock_t files_rwlock;	/* ctl_files list lock */
+	int controls_count;		/* count of all controls */
+	size_t user_ctl_alloc_size;	/* current memory allocation by user controls. */
+	struct list_head controls;	/* all controls for this card */
+	struct list_head files;	/* active control files */
+	unsigned int last_numid;	/* last used numeric ID */
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	struct xarray numids;	/* hash table for numids */
+	struct xarray hash;		/* hash table for ctl id matching */
+	bool hash_collision;	/* ctl_hash collision seen? */
+#endif
+};
+
 #define dev_to_snd_card(p)	container_of(p, struct snd_card, card_dev)
 
 #ifdef CONFIG_PM
diff --git a/sound/core/control.c b/sound/core/control.c
index 59c8658966d4c..e09e9d65851b3 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -41,12 +41,70 @@ static struct snd_ctl_layer_ops *snd_ctl_layer;
 
 static int snd_ctl_remove_locked(struct snd_card *card,
 				 struct snd_kcontrol *kcontrol);
+static int snd_ctl_dev_free(struct snd_device *device);
+static int snd_ctl_dev_register(struct snd_device *device);
+static int snd_ctl_dev_disconnect(struct snd_device *device);
+static void release_control_device(struct device *dev);
+
+/**
+ * snd_control_new - Allocate and initialize snd_control
+ * @card: the card to be initialized
+ *
+ * This function creates and initializes snd_control
+ */
+int snd_control_new(struct snd_card *card)
+{
+	static const struct snd_device_ops ops = {
+		.dev_free = snd_ctl_dev_free,
+		.dev_register =	snd_ctl_dev_register,
+		.dev_disconnect = snd_ctl_dev_disconnect,
+	};
+	struct snd_control *ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
+	int err;
+
+	if (!ctl)
+		return -ENOMEM;
+	if (snd_BUG_ON(!card)) {
+		err = -EINVAL;
+		goto err_release;
+	}
+	if (snd_BUG_ON(card->number < 0 || card->number >= SNDRV_CARDS)) {
+		err = -ENXIO;
+		goto err_release;
+	}
+
+	init_rwsem(&ctl->controls_rwsem);
+	rwlock_init(&ctl->files_rwlock);
+	INIT_LIST_HEAD(&ctl->controls);
+	INIT_LIST_HEAD(&ctl->files);
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	xa_init(&ctl->numids);
+	xa_init(&ctl->hash);
+#endif
+	card->ctl = ctl;
+	/* the control interface cannot be accessed from the user space until */
+	/* snd_cards_bitmask and snd_cards are set with snd_card_register */
+
+	snd_device_init(&ctl->dev, card);
+	dev_set_name(&ctl->dev, "controlC%d", card->number);
+	ctl->dev.release = release_control_device;
+
+	err = snd_device_new(card, SNDRV_DEV_CONTROL, card, &ops);
+	if (err < 0)
+		put_device(&ctl->dev);
+
+	return err;
+err_release:
+	kfree(ctl);
+	return err;
+}
 
 static int snd_ctl_open(struct inode *inode, struct file *file)
 {
 	unsigned long flags;
 	struct snd_card *card;
-	struct snd_ctl_file *ctl;
+	struct snd_control *ctl;
+	struct snd_ctl_file *ctlf;
 	int i, err;
 
 	err = stream_open(inode, file);
@@ -58,6 +116,7 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 		err = -ENODEV;
 		goto __error1;
 	}
+	ctl = card->ctl;
 	err = snd_card_file_add(card, file);
 	if (err < 0) {
 		err = -ENODEV;
@@ -67,22 +126,22 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 		err = -EFAULT;
 		goto __error2;
 	}
-	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
-	if (ctl == NULL) {
+	ctlf = kzalloc(sizeof(*ctlf), GFP_KERNEL);
+	if (ctlf == NULL) {
 		err = -ENOMEM;
 		goto __error;
 	}
-	INIT_LIST_HEAD(&ctl->events);
-	init_waitqueue_head(&ctl->change_sleep);
-	spin_lock_init(&ctl->read_lock);
-	ctl->card = card;
+	INIT_LIST_HEAD(&ctlf->events);
+	init_waitqueue_head(&ctlf->change_sleep);
+	spin_lock_init(&ctlf->read_lock);
+	ctlf->card = card;
 	for (i = 0; i < SND_CTL_SUBDEV_ITEMS; i++)
-		ctl->preferred_subdevice[i] = -1;
-	ctl->pid = get_pid(task_pid(current));
-	file->private_data = ctl;
-	write_lock_irqsave(&card->ctl_files_rwlock, flags);
-	list_add_tail(&ctl->list, &card->ctl_files);
-	write_unlock_irqrestore(&card->ctl_files_rwlock, flags);
+		ctlf->preferred_subdevice[i] = -1;
+	ctlf->pid = get_pid(task_pid(current));
+	file->private_data = ctlf;
+	write_lock_irqsave(&ctl->files_rwlock, flags);
+	list_add_tail(&ctlf->list, &ctl->files);
+	write_unlock_irqrestore(&ctl->files_rwlock, flags);
 	snd_card_unref(card);
 	return 0;
 
@@ -113,27 +172,26 @@ static void snd_ctl_empty_read_queue(struct snd_ctl_file * ctl)
 static int snd_ctl_release(struct inode *inode, struct file *file)
 {
 	unsigned long flags;
-	struct snd_card *card;
-	struct snd_ctl_file *ctl;
+	struct snd_ctl_file *ctlf = file->private_data;
+	struct snd_card *card = ctlf->card;
+	struct snd_control *ctl = card->ctl;
 	struct snd_kcontrol *control;
 	unsigned int idx;
 
-	ctl = file->private_data;
 	file->private_data = NULL;
-	card = ctl->card;
-	write_lock_irqsave(&card->ctl_files_rwlock, flags);
-	list_del(&ctl->list);
-	write_unlock_irqrestore(&card->ctl_files_rwlock, flags);
-	down_write(&card->controls_rwsem);
-	list_for_each_entry(control, &card->controls, list)
+	write_lock_irqsave(&ctl->files_rwlock, flags);
+	list_del(&ctlf->list);
+	write_unlock_irqrestore(&ctl->files_rwlock, flags);
+	down_write(&ctl->controls_rwsem);
+	list_for_each_entry(control, &ctl->controls, list)
 		for (idx = 0; idx < control->count; idx++)
-			if (control->vd[idx].owner == ctl)
+			if (control->vd[idx].owner == ctlf)
 				control->vd[idx].owner = NULL;
-	up_write(&card->controls_rwsem);
-	snd_fasync_free(ctl->fasync);
-	snd_ctl_empty_read_queue(ctl);
-	put_pid(ctl->pid);
-	kfree(ctl);
+	up_write(&ctl->controls_rwsem);
+	snd_fasync_free(ctlf->fasync);
+	snd_ctl_empty_read_queue(ctlf);
+	put_pid(ctlf->pid);
+	kfree(ctlf);
 	module_put(card->module);
 	snd_card_file_remove(card, file);
 	return 0;
@@ -160,11 +218,11 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 		return;
 	if (card->shutdown)
 		return;
-	read_lock_irqsave(&card->ctl_files_rwlock, flags);
+	read_lock_irqsave(&card->ctl->files_rwlock, flags);
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
 	card->mixer_oss_change_count++;
 #endif
-	list_for_each_entry(ctl, &card->ctl_files, list) {
+	list_for_each_entry(ctl, &card->ctl->files, list) {
 		if (!ctl->subscribed)
 			continue;
 		spin_lock(&ctl->read_lock);
@@ -187,7 +245,7 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 		spin_unlock(&ctl->read_lock);
 		snd_kill_fasync(ctl->fasync, SIGIO, POLL_IN);
 	}
-	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
+	read_unlock_irqrestore(&card->ctl->files_rwlock, flags);
 }
 EXPORT_SYMBOL(snd_ctl_notify);
 
@@ -341,13 +399,13 @@ static bool snd_ctl_remove_numid_conflict(struct snd_card *card,
 	struct snd_kcontrol *kctl;
 
 	/* Make sure that the ids assigned to the control do not wrap around */
-	if (card->last_numid >= UINT_MAX - count)
-		card->last_numid = 0;
+	if (card->ctl->last_numid >= UINT_MAX - count)
+		card->ctl->last_numid = 0;
 
-	list_for_each_entry(kctl, &card->controls, list) {
-		if (kctl->id.numid < card->last_numid + 1 + count &&
-		    kctl->id.numid + kctl->count > card->last_numid + 1) {
-		    	card->last_numid = kctl->id.numid + kctl->count - 1;
+	list_for_each_entry(kctl, &card->ctl->controls, list) {
+		if (kctl->id.numid < card->ctl->last_numid + 1 + count &&
+		    kctl->id.numid + kctl->count > card->ctl->last_numid + 1) {
+			card->ctl->last_numid = kctl->id.numid + kctl->count - 1;
 			return true;
 		}
 	}
@@ -406,18 +464,19 @@ static void add_hash_entries(struct snd_card *card,
 			     struct snd_kcontrol *kcontrol)
 {
 	struct snd_ctl_elem_id id = kcontrol->id;
+	struct snd_control *ctl = card->ctl;
 	int i;
 
-	xa_store_range(&card->ctl_numids, kcontrol->id.numid,
+	xa_store_range(&ctl->numids, kcontrol->id.numid,
 		       kcontrol->id.numid + kcontrol->count - 1,
 		       kcontrol, GFP_KERNEL);
 
 	for (i = 0; i < kcontrol->count; i++) {
 		id.index = kcontrol->id.index + i;
-		if (xa_insert(&card->ctl_hash, get_ctl_id_hash(&id),
+		if (xa_insert(&ctl->hash, get_ctl_id_hash(&id),
 			      kcontrol, GFP_KERNEL)) {
 			/* skip hash for this entry, noting we had collision */
-			card->ctl_hash_collision = true;
+			ctl->hash_collision = true;
 			dev_dbg(card->dev, "ctl_hash collision %d:%s:%d\n",
 				id.iface, id.name, id.index);
 		}
@@ -429,17 +488,18 @@ static void remove_hash_entries(struct snd_card *card,
 				struct snd_kcontrol *kcontrol)
 {
 	struct snd_ctl_elem_id id = kcontrol->id;
+	struct snd_control *ctl = card->ctl;
 	struct snd_kcontrol *matched;
 	unsigned long h;
 	int i;
 
 	for (i = 0; i < kcontrol->count; i++) {
-		xa_erase(&card->ctl_numids, id.numid);
+		xa_erase(&ctl->numids, id.numid);
 		h = get_ctl_id_hash(&id);
-		matched = xa_load(&card->ctl_hash, h);
+		matched = xa_load(&ctl->hash, h);
 		if (matched && (matched == kcontrol ||
 				elem_id_matches(matched, &id)))
-			xa_erase(&card->ctl_hash, h);
+			xa_erase(&ctl->hash, h);
 		id.index++;
 		id.numid++;
 	}
@@ -469,7 +529,7 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	struct snd_kcontrol *old;
 	int err;
 
-	lockdep_assert_held_write(&card->controls_rwsem);
+	lockdep_assert_held_write(&card->ctl->controls_rwsem);
 
 	id = kcontrol->id;
 	if (id.index > UINT_MAX - kcontrol->count)
@@ -496,10 +556,10 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	if (snd_ctl_find_hole(card, kcontrol->count) < 0)
 		return -ENOMEM;
 
-	list_add_tail(&kcontrol->list, &card->controls);
-	card->controls_count += kcontrol->count;
-	kcontrol->id.numid = card->last_numid + 1;
-	card->last_numid += kcontrol->count;
+	list_add_tail(&kcontrol->list, &card->ctl->controls);
+	card->ctl->controls_count += kcontrol->count;
+	kcontrol->id.numid = card->ctl->last_numid + 1;
+	card->ctl->last_numid += kcontrol->count;
 
 	add_hash_entries(card, kcontrol);
 
@@ -520,9 +580,9 @@ static int snd_ctl_add_replace(struct snd_card *card,
 	if (snd_BUG_ON(!card || !kcontrol->info))
 		goto error;
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	err = __snd_ctl_add_replace(card, kcontrol, mode);
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	if (err < 0)
 		goto error;
 	return 0;
@@ -580,7 +640,7 @@ static int __snd_ctl_remove(struct snd_card *card,
 {
 	unsigned int idx;
 
-	lockdep_assert_held_write(&card->controls_rwsem);
+	lockdep_assert_held_write(&card->ctl->controls_rwsem);
 
 	if (snd_BUG_ON(!card || !kcontrol))
 		return -EINVAL;
@@ -589,7 +649,7 @@ static int __snd_ctl_remove(struct snd_card *card,
 	if (remove_hash)
 		remove_hash_entries(card, kcontrol);
 
-	card->controls_count -= kcontrol->count;
+	card->ctl->controls_count -= kcontrol->count;
 	for (idx = 0; idx < kcontrol->count; idx++)
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
 	snd_ctl_free_one(kcontrol);
@@ -618,9 +678,9 @@ int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
 {
 	int ret;
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	ret = snd_ctl_remove_locked(card, kcontrol);
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return ret;
 }
 EXPORT_SYMBOL(snd_ctl_remove);
@@ -640,14 +700,14 @@ int snd_ctl_remove_id(struct snd_card *card, struct snd_ctl_elem_id *id)
 	struct snd_kcontrol *kctl;
 	int ret;
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, id);
 	if (kctl == NULL) {
-		up_write(&card->controls_rwsem);
+		up_write(&card->ctl->controls_rwsem);
 		return -ENOENT;
 	}
 	ret = snd_ctl_remove_locked(card, kctl);
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return ret;
 }
 EXPORT_SYMBOL(snd_ctl_remove_id);
@@ -669,7 +729,7 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
 	struct snd_kcontrol *kctl;
 	int idx, ret;
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, id);
 	if (kctl == NULL) {
 		ret = -ENOENT;
@@ -686,7 +746,7 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
 		}
 	ret = snd_ctl_remove_locked(card, kctl);
 error:
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return ret;
 }
 
@@ -710,7 +770,7 @@ int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
 	unsigned int index_offset;
 	int ret;
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, id);
 	if (kctl == NULL) {
 		ret = -ENOENT;
@@ -729,13 +789,13 @@ int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
 		vd->access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 	}
 	snd_ctl_build_ioff(id, kctl, index_offset);
-	downgrade_write(&card->controls_rwsem);
+	downgrade_write(&card->ctl->controls_rwsem);
 	snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_INFO, kctl, index_offset);
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return 1;
 
  unlock:
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_ctl_activate_id);
@@ -764,10 +824,10 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 	struct snd_kcontrol *kctl;
 	int saved_numid;
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, src_id);
 	if (kctl == NULL) {
-		up_write(&card->controls_rwsem);
+		up_write(&card->ctl->controls_rwsem);
 		return -ENOENT;
 	}
 	saved_numid = kctl->id.numid;
@@ -775,7 +835,7 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 	kctl->id = *dst_id;
 	kctl->id.numid = saved_numid;
 	add_hash_entries(card, kctl);
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return 0;
 }
 EXPORT_SYMBOL(snd_ctl_rename_id);
@@ -793,7 +853,7 @@ EXPORT_SYMBOL(snd_ctl_rename_id);
 void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl,
 		    const char *name)
 {
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	remove_hash_entries(card, kctl);
 
 	if (strscpy(kctl->id.name, name, sizeof(kctl->id.name)) < 0)
@@ -801,7 +861,7 @@ void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl,
 			name, kctl->id.name);
 
 	add_hash_entries(card, kctl);
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 }
 EXPORT_SYMBOL(snd_ctl_rename);
 
@@ -836,9 +896,9 @@ snd_ctl_find_numid_locked(struct snd_card *card, unsigned int numid)
 {
 	if (snd_BUG_ON(!card || !numid))
 		return NULL;
-	lockdep_assert_held(&card->controls_rwsem);
+	lockdep_assert_held(&card->ctl->controls_rwsem);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
-	return xa_load(&card->ctl_numids, numid);
+	return xa_load(&card->ctl->numids, numid);
 #else
 	return snd_ctl_find_numid_slow(card, numid);
 #endif
@@ -861,9 +921,9 @@ struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card,
 {
 	struct snd_kcontrol *kctl;
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return kctl;
 }
 EXPORT_SYMBOL(snd_ctl_find_numid);
@@ -887,18 +947,18 @@ struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card,
 
 	if (snd_BUG_ON(!card || !id))
 		return NULL;
-	lockdep_assert_held(&card->controls_rwsem);
+	lockdep_assert_held(&card->ctl->controls_rwsem);
 	if (id->numid != 0)
 		return snd_ctl_find_numid_locked(card, id->numid);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
-	kctl = xa_load(&card->ctl_hash, get_ctl_id_hash(id));
+	kctl = xa_load(&card->ctl->hash, get_ctl_id_hash(id));
 	if (kctl && elem_id_matches(kctl, id))
 		return kctl;
-	if (!card->ctl_hash_collision)
+	if (!card->ctl->hash_collision)
 		return NULL; /* we can rely on only hash table */
 #endif
 	/* no matching in hash table - try all as the last resort */
-	list_for_each_entry(kctl, &card->controls, list)
+	list_for_each_entry(kctl, &card->ctl->controls, list)
 		if (elem_id_matches(kctl, id))
 			return kctl;
 
@@ -922,9 +982,9 @@ struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
 {
 	struct snd_kcontrol *kctl;
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, id);
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return kctl;
 }
 EXPORT_SYMBOL(snd_ctl_find_id);
@@ -965,11 +1025,11 @@ static int snd_ctl_elem_list(struct snd_card *card,
 	offset = list->offset;
 	space = list->space;
 
-	down_read(&card->controls_rwsem);
-	list->count = card->controls_count;
+	down_read(&card->ctl->controls_rwsem);
+	list->count = card->ctl->controls_count;
 	list->used = 0;
 	if (space > 0) {
-		list_for_each_entry(kctl, &card->controls, list) {
+		list_for_each_entry(kctl, &card->ctl->controls, list) {
 			if (offset >= kctl->count) {
 				offset -= kctl->count;
 				continue;
@@ -989,7 +1049,7 @@ static int snd_ctl_elem_list(struct snd_card *card,
 		}
 	}
  out:
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return err;
 }
 
@@ -1240,13 +1300,13 @@ static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 	struct snd_kcontrol *kctl;
 	int result;
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, &info->id);
 	if (kctl == NULL)
 		result = -ENOENT;
 	else
 		result = __snd_ctl_elem_info(card, kctl, info, ctl);
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return result;
 }
 
@@ -1279,7 +1339,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	const u32 pattern = 0xdeadbeef;
 	int ret;
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, &control->id);
 	if (kctl == NULL) {
 		ret = -ENOENT;
@@ -1323,7 +1383,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 		goto unlock;
 	}
 unlock:
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return ret;
 }
 
@@ -1356,10 +1416,10 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	unsigned int index_offset;
 	int result;
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, &control->id);
 	if (kctl == NULL) {
-		up_write(&card->controls_rwsem);
+		up_write(&card->ctl->controls_rwsem);
 		return -ENOENT;
 	}
 
@@ -1367,7 +1427,7 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	vd = &kctl->vd[index_offset];
 	if (!(vd->access & SNDRV_CTL_ELEM_ACCESS_WRITE) || kctl->put == NULL ||
 	    (file && vd->owner && vd->owner != file)) {
-		up_write(&card->controls_rwsem);
+		up_write(&card->ctl->controls_rwsem);
 		return -EPERM;
 	}
 
@@ -1388,16 +1448,16 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 		result = kctl->put(kctl, control);
 	snd_power_unref(card);
 	if (result < 0) {
-		up_write(&card->controls_rwsem);
+		up_write(&card->ctl->controls_rwsem);
 		return result;
 	}
 
 	if (result > 0) {
-		downgrade_write(&card->controls_rwsem);
+		downgrade_write(&card->ctl->controls_rwsem);
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, index_offset);
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 	} else {
-		up_write(&card->controls_rwsem);
+		up_write(&card->ctl->controls_rwsem);
 	}
 
 	return 0;
@@ -1437,7 +1497,7 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, &id);
 	if (kctl == NULL) {
 		result = -ENOENT;
@@ -1450,7 +1510,7 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 			result = 0;
 		}
 	}
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return result;
 }
 
@@ -1465,7 +1525,7 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, &id);
 	if (kctl == NULL) {
 		result = -ENOENT;
@@ -1480,7 +1540,7 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 			result = 0;
 		}
 	}
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return result;
 }
 
@@ -1497,7 +1557,7 @@ struct user_element {
 // check whether the addition (in bytes) of user ctl element may overflow the limit.
 static bool check_user_elem_overflow(struct snd_card *card, ssize_t add)
 {
-	return (ssize_t)card->user_ctl_alloc_size + add > max_user_ctl_alloc_size;
+	return (ssize_t)card->ctl->user_ctl_alloc_size + add > max_user_ctl_alloc_size;
 }
 
 static int snd_ctl_elem_user_info(struct snd_kcontrol *kcontrol,
@@ -1575,7 +1635,7 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 	int i;
 	int change;
 
-	lockdep_assert_held_write(&ue->card->controls_rwsem);
+	lockdep_assert_held_write(&ue->card->ctl->controls_rwsem);
 
 	if (size > 1024 * 128)	/* sane value */
 		return -EINVAL;
@@ -1602,7 +1662,7 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 			kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
 		mask = SNDRV_CTL_EVENT_MASK_INFO;
 	} else {
-		ue->card->user_ctl_alloc_size -= ue->tlv_data_size;
+		ue->card->ctl->user_ctl_alloc_size -= ue->tlv_data_size;
 		ue->tlv_data_size = 0;
 		kvfree(ue->tlv_data);
 	}
@@ -1610,7 +1670,7 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 	ue->tlv_data = container;
 	ue->tlv_data_size = size;
 	// decremented at private_free.
-	ue->card->user_ctl_alloc_size += size;
+	ue->card->ctl->user_ctl_alloc_size += size;
 
 	mask |= SNDRV_CTL_EVENT_MASK_TLV;
 	for (i = 0; i < kctl->count; ++i)
@@ -1653,7 +1713,7 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 	unsigned int i;
 	const uintptr_t user_ptrval = ue->info.value.enumerated.names_ptr;
 
-	lockdep_assert_held_write(&ue->card->controls_rwsem);
+	lockdep_assert_held_write(&ue->card->ctl->controls_rwsem);
 
 	buf_len = ue->info.value.enumerated.names_length;
 	if (buf_len > 64 * 1024)
@@ -1680,7 +1740,7 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 	ue->priv_data = names;
 	ue->info.value.enumerated.names_ptr = 0;
 	// increment the allocation size; decremented again at private_free.
-	ue->card->user_ctl_alloc_size += ue->info.value.enumerated.names_length;
+	ue->card->ctl->user_ctl_alloc_size += ue->info.value.enumerated.names_length;
 
 	return 0;
 }
@@ -1695,10 +1755,10 @@ static void snd_ctl_elem_user_free(struct snd_kcontrol *kcontrol)
 	struct user_element *ue = kcontrol->private_data;
 
 	// decrement the allocation size.
-	ue->card->user_ctl_alloc_size -= compute_user_elem_size(ue->elem_data_size, kcontrol->count);
-	ue->card->user_ctl_alloc_size -= ue->tlv_data_size;
+	ue->card->ctl->user_ctl_alloc_size -= compute_user_elem_size(ue->elem_data_size, kcontrol->count);
+	ue->card->ctl->user_ctl_alloc_size -= ue->tlv_data_size;
 	if (ue->priv_data)
-		ue->card->user_ctl_alloc_size -= ue->info.value.enumerated.names_length;
+		ue->card->ctl->user_ctl_alloc_size -= ue->info.value.enumerated.names_length;
 
 	kvfree(ue->tlv_data);
 	kvfree(ue->priv_data);
@@ -1763,7 +1823,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	private_size = value_sizes[info->type] * info->count;
 	alloc_size = compute_user_elem_size(private_size, count);
 
-	down_write(&card->controls_rwsem);
+	down_write(&card->ctl->controls_rwsem);
 	if (check_user_elem_overflow(card, alloc_size)) {
 		err = -ENOMEM;
 		goto unlock;
@@ -1789,7 +1849,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	kctl->private_free = snd_ctl_elem_user_free;
 
 	// increment the allocated size; decremented again at private_free.
-	card->user_ctl_alloc_size += alloc_size;
+	card->ctl->user_ctl_alloc_size += alloc_size;
 
 	/* Set private data for this userspace control. */
 	ue->card = card;
@@ -1833,7 +1893,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	 * which locks the element.
 	 */
  unlock:
-	up_write(&card->controls_rwsem);
+	up_write(&card->ctl->controls_rwsem);
 	return err;
 }
 
@@ -1959,7 +2019,7 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
 	struct snd_ctl_elem_id id;
 	struct snd_kcontrol_volatile *vd;
 
-	lockdep_assert_held(&file->card->controls_rwsem);
+	lockdep_assert_held(&file->card->ctl->controls_rwsem);
 
 	if (copy_from_user(&header, buf, sizeof(header)))
 		return -EFAULT;
@@ -2036,19 +2096,19 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 	case SNDRV_CTL_IOCTL_SUBSCRIBE_EVENTS:
 		return snd_ctl_subscribe_events(ctl, ip);
 	case SNDRV_CTL_IOCTL_TLV_READ:
-		down_read(&ctl->card->controls_rwsem);
+		down_read(&ctl->card->ctl->controls_rwsem);
 		err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_READ);
-		up_read(&ctl->card->controls_rwsem);
+		up_read(&ctl->card->ctl->controls_rwsem);
 		return err;
 	case SNDRV_CTL_IOCTL_TLV_WRITE:
-		down_write(&ctl->card->controls_rwsem);
+		down_write(&ctl->card->ctl->controls_rwsem);
 		err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_WRITE);
-		up_write(&ctl->card->controls_rwsem);
+		up_write(&ctl->card->ctl->controls_rwsem);
 		return err;
 	case SNDRV_CTL_IOCTL_TLV_COMMAND:
-		down_write(&ctl->card->controls_rwsem);
+		down_write(&ctl->card->ctl->controls_rwsem);
 		err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_CMD);
-		up_write(&ctl->card->controls_rwsem);
+		up_write(&ctl->card->ctl->controls_rwsem);
 		return err;
 	case SNDRV_CTL_IOCTL_POWER:
 		return -ENOPROTOOPT;
@@ -2258,15 +2318,15 @@ int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type)
 	int subdevice = -1;
 	unsigned long flags;
 
-	read_lock_irqsave(&card->ctl_files_rwlock, flags);
-	list_for_each_entry(kctl, &card->ctl_files, list) {
+	read_lock_irqsave(&card->ctl->files_rwlock, flags);
+	list_for_each_entry(kctl, &card->ctl->files, list) {
 		if (kctl->pid == task_pid(current)) {
 			subdevice = kctl->preferred_subdevice[type];
 			if (subdevice != -1)
 				break;
 		}
 	}
-	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
+	read_unlock_irqrestore(&card->ctl->files_rwlock, flags);
 	return subdevice;
 }
 EXPORT_SYMBOL_GPL(snd_ctl_get_preferred_subdevice);
@@ -2326,9 +2386,9 @@ void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
 		card = snd_card_ref(card_number);
 		if (card) {
-			down_read(&card->controls_rwsem);
+			down_read(&card->ctl->controls_rwsem);
 			lops->lregister(card);
-			up_read(&card->controls_rwsem);
+			up_read(&card->ctl->controls_rwsem);
 			snd_card_unref(card);
 		}
 	}
@@ -2389,15 +2449,15 @@ static int snd_ctl_dev_register(struct snd_device *device)
 	int err;
 
 	err = snd_register_device(SNDRV_DEVICE_TYPE_CONTROL, card, -1,
-				  &snd_ctl_f_ops, card, card->ctl_dev);
+				  &snd_ctl_f_ops, card, &card->ctl->dev);
 	if (err < 0)
 		return err;
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	down_read(&snd_ctl_layer_rwsem);
 	for (lops = snd_ctl_layer; lops; lops = lops->next)
 		lops->lregister(card);
 	up_read(&snd_ctl_layer_rwsem);
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return 0;
 }
 
@@ -2411,21 +2471,21 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	struct snd_ctl_layer_ops *lops;
 	unsigned long flags;
 
-	read_lock_irqsave(&card->ctl_files_rwlock, flags);
-	list_for_each_entry(ctl, &card->ctl_files, list) {
+	read_lock_irqsave(&card->ctl->files_rwlock, flags);
+	list_for_each_entry(ctl, &card->ctl->files, list) {
 		wake_up(&ctl->change_sleep);
 		snd_kill_fasync(ctl->fasync, SIGIO, POLL_ERR);
 	}
-	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
+	read_unlock_irqrestore(&card->ctl->files_rwlock, flags);
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	down_read(&snd_ctl_layer_rwsem);
 	for (lops = snd_ctl_layer; lops; lops = lops->next)
 		lops->ldisconnect(card);
 	up_read(&snd_ctl_layer_rwsem);
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 
-	return snd_unregister_device(card->ctl_dev);
+	return snd_unregister_device(&card->ctl->dev);
 }
 
 /*
@@ -2436,48 +2496,26 @@ static int snd_ctl_dev_free(struct snd_device *device)
 	struct snd_card *card = device->device_data;
 	struct snd_kcontrol *control;
 
-	down_write(&card->controls_rwsem);
-	while (!list_empty(&card->controls)) {
-		control = snd_kcontrol(card->controls.next);
+	down_write(&card->ctl->controls_rwsem);
+	while (!list_empty(&card->ctl->controls)) {
+		control = snd_kcontrol(card->ctl->controls.next);
 		__snd_ctl_remove(card, control, false);
 	}
 
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
-	xa_destroy(&card->ctl_numids);
-	xa_destroy(&card->ctl_hash);
+	xa_destroy(&card->ctl->numids);
+	xa_destroy(&card->ctl->hash);
 #endif
-	up_write(&card->controls_rwsem);
-	put_device(card->ctl_dev);
+	up_write(&card->ctl->controls_rwsem);
+	put_device(&card->ctl->dev);
 	return 0;
 }
 
-/*
- * create control core:
- * called from init.c
- */
-int snd_ctl_create(struct snd_card *card)
+static void release_control_device(struct device *dev)
 {
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_ctl_dev_free,
-		.dev_register =	snd_ctl_dev_register,
-		.dev_disconnect = snd_ctl_dev_disconnect,
-	};
-	int err;
+	struct snd_control *ctl = container_of(dev, struct snd_control, dev);
 
-	if (snd_BUG_ON(!card))
-		return -ENXIO;
-	if (snd_BUG_ON(card->number < 0 || card->number >= SNDRV_CARDS))
-		return -ENXIO;
-
-	err = snd_device_alloc(&card->ctl_dev, card);
-	if (err < 0)
-		return err;
-	dev_set_name(card->ctl_dev, "controlC%d", card->number);
-
-	err = snd_device_new(card, SNDRV_DEV_CONTROL, card, &ops);
-	if (err < 0)
-		put_device(card->ctl_dev);
-	return err;
+	kfree(ctl);
 }
 
 /*
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 0e8b1bfb040e0..0e0b555f71537 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -172,15 +172,15 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	struct snd_ctl_elem_info *info;
 	int err;
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_id_locked(card, id);
 	if (! kctl) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return -ENOENT;
 	}
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return -ENOMEM;
 	}
 	info->id = *id;
@@ -188,7 +188,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	if (!err)
 		err = kctl->info(kctl, info);
 	snd_power_unref(card);
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	if (err >= 0) {
 		err = info->type;
 		*countp = info->count;
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index a78eb48927c7b..6b53de7660438 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -243,6 +243,7 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 			      unsigned int group, bool set)
 {
 	struct snd_card *card;
+	struct snd_control *ctl;
 	struct snd_kcontrol *kctl;
 	struct snd_kcontrol_volatile *vd;
 	unsigned int ioff, access, new_access;
@@ -250,7 +251,8 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 
 	card = snd_card_ref(card_number);
 	if (card) {
-		down_write(&card->controls_rwsem);
+		ctl = card->ctl;
+		down_write(&ctl->controls_rwsem);
 		kctl = snd_ctl_find_id_locked(card, id);
 		if (kctl) {
 			ioff = snd_ctl_get_ioff(kctl, id);
@@ -271,7 +273,7 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 			err = -ENOENT;
 		}
 unlock:
-		up_write(&card->controls_rwsem);
+		up_write(&ctl->controls_rwsem);
 		snd_card_unref(card);
 	} else {
 		err = -ENXIO;
@@ -357,7 +359,7 @@ static void snd_ctl_led_register(struct snd_card *card)
 	snd_ctl_led_card_valid[card->number] = true;
 	mutex_unlock(&snd_ctl_led_mutex);
 	/* the register callback is already called with held card->controls_rwsem */
-	list_for_each_entry(kctl, &card->controls, list)
+	list_for_each_entry(kctl, &card->ctl->controls, list)
 		for (ioff = 0; ioff < kctl->count; ioff++)
 			snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, ioff);
 	snd_ctl_led_refresh();
@@ -617,12 +619,14 @@ static ssize_t list_show(struct device *dev,
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	struct snd_card *card;
 	struct snd_ctl_led_ctl *lctl;
+	struct snd_control *ctl;
 	size_t l = 0;
 
 	card = snd_card_ref(led_card->number);
 	if (!card)
 		return -ENXIO;
-	down_read(&card->controls_rwsem);
+	ctl = card->ctl;
+	down_read(&ctl->controls_rwsem);
 	mutex_lock(&snd_ctl_led_mutex);
 	if (snd_ctl_led_card_valid[led_card->number]) {
 		list_for_each_entry(lctl, &led_card->led->controls, list) {
@@ -635,7 +639,7 @@ static ssize_t list_show(struct device *dev,
 		}
 	}
 	mutex_unlock(&snd_ctl_led_mutex);
-	up_read(&card->controls_rwsem);
+	up_read(&ctl->controls_rwsem);
 	snd_card_unref(card);
 	return l;
 }
@@ -688,7 +692,7 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 			goto cerr;
 		led->cards[card->number] = led_card;
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
-		WARN(sysfs_create_link(&card->ctl_dev->kobj, &led_card->dev.kobj, link_name),
+		WARN(sysfs_create_link(&card->ctl->dev.kobj, &led_card->dev.kobj, link_name),
 			"can't create symlink to controlC%i device\n", card->number);
 		WARN(sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj, "card"),
 			"can't create symlink to card%i\n", card->number);
@@ -714,7 +718,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
 		if (!led_card)
 			continue;
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
-		sysfs_remove_link(&card->ctl_dev->kobj, link_name);
+		sysfs_remove_link(&card->ctl->dev.kobj, link_name);
 		sysfs_remove_link(&led_card->dev.kobj, "card");
 		device_unregister(&led_card->dev);
 		led->cards[card->number] = NULL;
diff --git a/sound/core/init.c b/sound/core/init.c
index 87b5368d20350..9cd2cb22de728 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -328,14 +328,6 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	card->module = module;
 #endif
 	INIT_LIST_HEAD(&card->devices);
-	init_rwsem(&card->controls_rwsem);
-	rwlock_init(&card->ctl_files_rwlock);
-	INIT_LIST_HEAD(&card->controls);
-	INIT_LIST_HEAD(&card->ctl_files);
-#ifdef CONFIG_SND_CTL_FAST_LOOKUP
-	xa_init(&card->ctl_numids);
-	xa_init(&card->ctl_hash);
-#endif
 	spin_lock_init(&card->files_lock);
 	INIT_LIST_HEAD(&card->files_list);
 	mutex_init(&card->memory_mutex);
@@ -360,11 +352,9 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	snprintf(card->irq_descr, sizeof(card->irq_descr), "%s:%s",
 		 dev_driver_string(card->dev), dev_name(&card->card_dev));
 
-	/* the control interface cannot be accessed from the user space until */
-	/* snd_cards_bitmask and snd_cards are set with snd_card_register */
-	err = snd_ctl_create(card);
+	err = snd_control_new(card);
 	if (err < 0) {
-		dev_err(parent, "unable to register control minors\n");
+		dev_err(parent, "unable to create controls and register\n");
 		goto __error;
 	}
 	err = snd_info_card_create(card);
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index dae2da3808351..d9457f2e73550 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -539,10 +539,10 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return;
 	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -560,7 +560,7 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (uinfo->count > 1)
 		*right = snd_mixer_oss_conv1(uctl->value.integer.value[1], uinfo->value.integer.min, uinfo->value.integer.max, &pslot->volume[1]);
       __unalloc:
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
       	kfree(uctl);
       	kfree(uinfo);
 }
@@ -578,10 +578,10 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return;
 	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -600,7 +600,7 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (uinfo->count > 1 && !uctl->value.integer.value[route ? 3 : 1])
 		*right = 0;
       __unalloc:
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
       	kfree(uctl);
 	kfree(uinfo);
 }
@@ -644,10 +644,10 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return;
 	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -668,7 +668,7 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (res > 0)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
       __unalloc:
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
       	kfree(uctl);
 	kfree(uinfo);
 }
@@ -687,10 +687,10 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return;
 	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -715,7 +715,7 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (res > 0)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
       __unalloc:
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
       	kfree(uctl);
 	kfree(uinfo);
 }
@@ -832,7 +832,7 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 		err = -ENOMEM;
 		goto __free_only;
 	}
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (! kctl) {
 		err = -ENOENT;
@@ -860,7 +860,7 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	}
 	err = 0;
       __unlock:
-     	up_read(&card->controls_rwsem);
+     	up_read(&card->ctl->controls_rwsem);
       __free_only:
       	kfree(uctl);
       	kfree(uinfo);
@@ -885,7 +885,7 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 		err = -ENOMEM;
 		goto __free_only;
 	}
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (! kctl) {
 		err = -ENOENT;
@@ -916,7 +916,7 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 		snd_ctl_notify(fmixer->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 	err = 0;
       __unlock:
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
       __free_only:
 	kfree(uctl);
 	kfree(uinfo);
@@ -936,25 +936,25 @@ static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *sl
 	struct snd_card *card = mixer->card;
 	int err;
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 	kcontrol = snd_mixer_oss_test_id(mixer, name, index);
 	if (kcontrol == NULL) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return 0;
 	}
 	info = kmalloc(sizeof(*info), GFP_KERNEL);
 	if (! info) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		return -ENOMEM;
 	}
 	err = kcontrol->info(kcontrol, info);
 	if (err < 0) {
-		up_read(&card->controls_rwsem);
+		up_read(&card->ctl->controls_rwsem);
 		kfree(info);
 		return err;
 	}
 	slot->numid[item] = kcontrol->id.numid;
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	if (info->count > slot->channels)
 		slot->channels = info->count;
 	slot->present |= 1 << item;
@@ -1068,7 +1068,7 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	memset(slot.numid, 0xff, sizeof(slot.numid)); /* ID_UNKNOWN */
 	if (snd_mixer_oss_build_test_all(mixer, ptr, &slot))
 		return 0;
-	down_read(&mixer->card->controls_rwsem);
+	down_read(&mixer->card->ctl->controls_rwsem);
 	kctl = NULL;
 	if (!ptr->index)
 		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
@@ -1077,12 +1077,12 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 
 		uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 		if (! uinfo) {
-			up_read(&mixer->card->controls_rwsem);
+			up_read(&mixer->card->ctl->controls_rwsem);
 			return -ENOMEM;
 		}
 			
 		if (kctl->info(kctl, uinfo)) {
-			up_read(&mixer->card->controls_rwsem);
+			up_read(&mixer->card->ctl->controls_rwsem);
 			kfree(uinfo);
 			return 0;
 		}
@@ -1098,7 +1098,7 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 			for (slot.capture_item = 1; slot.capture_item < uinfo->value.enumerated.items; slot.capture_item++) {
 				uinfo->value.enumerated.item = slot.capture_item;
 				if (kctl->info(kctl, uinfo)) {
-					up_read(&mixer->card->controls_rwsem);
+					up_read(&mixer->card->ctl->controls_rwsem);
 					kfree(uinfo);
 					return 0;
 				}
@@ -1110,7 +1110,7 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 		}
 		kfree(uinfo);
 	}
-	up_read(&mixer->card->controls_rwsem);
+	up_read(&mixer->card->ctl->controls_rwsem);
 	if (slot.present != 0) {
 		pslot = kmalloc(sizeof(slot), GFP_KERNEL);
 		if (! pslot)
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 33af707a65ab1..7afc9a29ea9ec 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1784,13 +1784,14 @@ void snd_hda_ctls_clear(struct hda_codec *codec)
 int snd_hda_lock_devices(struct hda_bus *bus)
 {
 	struct snd_card *card = bus->card;
+	struct snd_control *ctl = card->ctl;
 	struct hda_codec *codec;
 
 	spin_lock(&card->files_lock);
 	if (card->shutdown)
 		goto err_unlock;
 	card->shutdown = 1;
-	if (!list_empty(&card->ctl_files))
+	if (!list_empty(&ctl->files))
 		goto err_clear;
 
 	list_for_each_codec(codec, bus) {
diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 38116c7587174..8cd5681de9fbd 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -1434,9 +1434,9 @@ static int sst_fill_widget_module_info(struct snd_soc_dapm_widget *w,
 	struct snd_card *card = component->card->snd_card;
 	char *idx;
 
-	down_read(&card->controls_rwsem);
+	down_read(&card->ctl->controls_rwsem);
 
-	list_for_each_entry(kctl, &card->controls, list) {
+	list_for_each_entry(kctl, &card->ctl->controls, list) {
 		idx = strchr(kctl->id.name, ' ');
 		if (idx == NULL)
 			continue;
@@ -1469,12 +1469,12 @@ static int sst_fill_widget_module_info(struct snd_soc_dapm_widget *w,
 		}
 
 		if (ret < 0) {
-			up_read(&card->controls_rwsem);
+			up_read(&card->ctl->controls_rwsem);
 			return ret;
 		}
 	}
 
-	up_read(&card->controls_rwsem);
+	up_read(&card->ctl->controls_rwsem);
 	return 0;
 }
 
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 285ab4c9c7168..1129eb33f78c9 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -35,7 +35,7 @@ struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 	if (unlikely(!name))
 		return NULL;
 
-	list_for_each_entry(kctl, &card->controls, list)
+	list_for_each_entry(kctl, &card->ctl->controls, list)
 		if (!strncmp(kctl->id.name, name, sizeof(kctl->id.name)))
 			return kctl;
 	return NULL;
diff --git a/sound/usb/media.c b/sound/usb/media.c
index d48db6f3ae659..5298c2f49a164 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -163,7 +163,7 @@ void snd_media_stop_pipeline(struct snd_usb_substream *subs)
 
 static int snd_media_mixer_init(struct snd_usb_audio *chip)
 {
-	struct device *ctl_dev = chip->card->ctl_dev;
+	struct device *ctl_dev = &chip->card->ctl->dev;
 	struct media_intf_devnode *ctl_intf;
 	struct usb_mixer_interface *mixer;
 	struct media_device *mdev = chip->media_dev;
-- 
2.42.0.283.g2d96d420d3-goog

