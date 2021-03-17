Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3E33F6DC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:31:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EB0D16DB;
	Wed, 17 Mar 2021 18:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EB0D16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616002310;
	bh=yKNrV5Lq3qBotUK4Fx6OaA9OC+cft2LGeAnpEdCcT5c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PH4BiQj9naD/oIsY03edMVHb4R0HJckQ9V/9kx0uVCAiYGJ9Om8Mflb5zB+UjufVz
	 G0AeR4qh+46l+Xl8i+CzYo0H4Np46lzc7bLY0/nUKgizG7ztYxYKDc6EQ2KY8xzRgo
	 8jXJA3MBo7ftNgMKZHeZjqKInvb41n5MAGitsPCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B9BF80148;
	Wed, 17 Mar 2021 18:30:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71ED1F80148; Wed, 17 Mar 2021 18:30:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03A65F80148
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:30:03 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8E8B3A0042;
 Wed, 17 Mar 2021 18:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8E8B3A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616002202; bh=KTqKDX+DCnMNvVisVqYD4DESDUL5FvK+M6H8PBf4PNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ID9Y0p8mKf0L0WCaBFx6bez+yIed3XqIsUGC0XSfNSHH5ip6mlZSrYEBeX9LxWUmY
 3mq+6EDDz+UCY86NfznIaaJg8ffDSB3yyWHLgDL8NcnYRtn4/ddP7UWd2V5XtMC2lY
 PwF9gY4Cv12CvYO2ZKgPWNbUFMB+sc+Hh7/WTp7M=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Mar 2021 18:29:58 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v4 2/6] ALSA: control - add layer registration routines
Date: Wed, 17 Mar 2021 18:29:41 +0100
Message-Id: <20210317172945.842280-3-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317172945.842280-1-perex@perex.cz>
References: <20210317172945.842280-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>
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

The layer registration allows to handle an extra functionality
on top of the control API. It can be used for the audio
LED control for example.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/control.h |  12 +++++
 sound/core/control.c    | 110 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 22f3d48163ff..175610bfa8c8 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -108,6 +108,14 @@ struct snd_ctl_file {
 	struct list_head events;	/* waiting events for read */
 };
 
+struct snd_ctl_layer_ops {
+	struct snd_ctl_layer_ops *next;
+	const char *module_name;
+	void (*lregister)(struct snd_card *card);
+	void (*ldisconnect)(struct snd_card *card);
+	void (*lnotify)(struct snd_card *card, unsigned int mask, struct snd_kcontrol *kctl, unsigned int ioff);
+};
+
 #define snd_ctl_file(n) list_entry(n, struct snd_ctl_file, list)
 
 typedef int (*snd_kctl_ioctl_func_t) (struct snd_card * card,
@@ -140,6 +148,10 @@ int snd_ctl_unregister_ioctl_compat(snd_kctl_ioctl_func_t fcn);
 #define snd_ctl_unregister_ioctl_compat(fcn)
 #endif
 
+int snd_ctl_request_layer(const char *module_name);
+void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops);
+void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops);
+
 int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type);
 
 static inline unsigned int snd_ctl_get_ioffnum(struct snd_kcontrol *kctl, struct snd_ctl_elem_id *id)
diff --git a/sound/core/control.c b/sound/core/control.c
index 8a5cedb0a4be..87630021e434 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -28,10 +28,12 @@ struct snd_kctl_ioctl {
 };
 
 static DECLARE_RWSEM(snd_ioctl_rwsem);
+static DECLARE_RWSEM(snd_ctl_layer_rwsem);
 static LIST_HEAD(snd_control_ioctls);
 #ifdef CONFIG_COMPAT
 static LIST_HEAD(snd_control_compat_ioctls);
 #endif
+static struct snd_ctl_layer_ops *snd_ctl_layer;
 
 static int snd_ctl_open(struct inode *inode, struct file *file)
 {
@@ -195,10 +197,15 @@ void snd_ctl_notify_one(struct snd_card *card, unsigned int mask,
 			struct snd_kcontrol *kctl, unsigned int ioff)
 {
 	struct snd_ctl_elem_id id = kctl->id;
+	struct snd_ctl_layer_ops *lops;
 
 	id.index += ioff;
 	id.numid += ioff;
 	snd_ctl_notify(card, mask, &id);
+	down_read(&snd_ctl_layer_rwsem);
+	for (lops = snd_ctl_layer; lops; lops = lops->next)
+		lops->lnotify(card, mask, kctl, ioff);
+	up_read(&snd_ctl_layer_rwsem);
 }
 EXPORT_SYMBOL(snd_ctl_notify_one);
 
@@ -1997,6 +2004,86 @@ EXPORT_SYMBOL_GPL(snd_ctl_get_preferred_subdevice);
 #define snd_ctl_ioctl_compat	NULL
 #endif
 
+/*
+ * control layers (audio LED etc.)
+ */
+
+/**
+ * snd_ctl_request_layer - request to use the layer
+ * @module_name: Name of the kernel module (NULL == build-in)
+ *
+ * Return an error code when the module cannot be loaded.
+ */
+int snd_ctl_request_layer(const char *module_name)
+{
+	struct snd_ctl_layer_ops *lops;
+
+	if (module_name == NULL)
+		return 0;
+	down_read(&snd_ctl_layer_rwsem);
+	for (lops = snd_ctl_layer; lops; lops = lops->next)
+		if (strcmp(lops->module_name, module_name) == 0)
+			break;
+	up_read(&snd_ctl_layer_rwsem);
+	if (lops)
+		return 0;
+	return request_module(module_name);
+}
+EXPORT_SYMBOL_GPL(snd_ctl_request_layer);
+
+/**
+ * snd_ctl_register_layer - register new control layer
+ * @lops: operation structure
+ *
+ * The new layer can track all control elements and do additional
+ * operations on top (like audio LED handling).
+ */
+void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
+{
+	struct snd_card *card;
+	int card_number;
+
+	down_write(&snd_ctl_layer_rwsem);
+	lops->next = snd_ctl_layer;
+	snd_ctl_layer = lops;
+	up_write(&snd_ctl_layer_rwsem);
+	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
+		card = snd_card_ref(card_number);
+		if (card) {
+			down_read(&card->controls_rwsem);
+			lops->lregister(card);
+			up_read(&card->controls_rwsem);
+			snd_card_unref(card);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(snd_ctl_register_layer);
+
+/**
+ * snd_ctl_disconnect_layer - disconnect control layer
+ * @lops: operation structure
+ *
+ * It is expected that the information about tracked cards
+ * is freed before this call (the disconnect callback is
+ * not called here).
+ */
+void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops)
+{
+	struct snd_ctl_layer_ops *lops2, *prev_lops2;
+
+	down_write(&snd_ctl_layer_rwsem);
+	for (lops2 = snd_ctl_layer, prev_lops2 = NULL; lops2; lops2 = lops2->next)
+		if (lops2 == lops) {
+			if (!prev_lops2)
+				snd_ctl_layer = lops->next;
+			else
+				prev_lops2->next = lops->next;
+			break;
+		}
+	up_write(&snd_ctl_layer_rwsem);
+}
+EXPORT_SYMBOL_GPL(snd_ctl_disconnect_layer);
+
 /*
  *  INIT PART
  */
@@ -2020,9 +2107,20 @@ static const struct file_operations snd_ctl_f_ops =
 static int snd_ctl_dev_register(struct snd_device *device)
 {
 	struct snd_card *card = device->device_data;
+	struct snd_ctl_layer_ops *lops;
+	int err;
 
-	return snd_register_device(SNDRV_DEVICE_TYPE_CONTROL, card, -1,
-				   &snd_ctl_f_ops, card, &card->ctl_dev);
+	err = snd_register_device(SNDRV_DEVICE_TYPE_CONTROL, card, -1,
+				  &snd_ctl_f_ops, card, &card->ctl_dev);
+	if (err < 0)
+		return err;
+	down_read(&card->controls_rwsem);
+	down_read(&snd_ctl_layer_rwsem);
+	for (lops = snd_ctl_layer; lops; lops = lops->next)
+		lops->lregister(card);
+	up_read(&snd_ctl_layer_rwsem);
+	up_read(&card->controls_rwsem);
+	return 0;
 }
 
 /*
@@ -2032,6 +2130,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 {
 	struct snd_card *card = device->device_data;
 	struct snd_ctl_file *ctl;
+	struct snd_ctl_layer_ops *lops;
 	unsigned long flags;
 
 	read_lock_irqsave(&card->ctl_files_rwlock, flags);
@@ -2041,6 +2140,13 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 
+	down_read(&card->controls_rwsem);
+	down_read(&snd_ctl_layer_rwsem);
+	for (lops = snd_ctl_layer; lops; lops = lops->next)
+		lops->ldisconnect(card);
+	up_read(&snd_ctl_layer_rwsem);
+	up_read(&card->controls_rwsem);
+
 	return snd_unregister_device(&card->ctl_dev);
 }
 
-- 
2.29.2
