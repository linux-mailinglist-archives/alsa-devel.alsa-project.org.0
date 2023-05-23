Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 196F470E10E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412D8209;
	Tue, 23 May 2023 17:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412D8209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684857233;
	bh=hS2P7XGFZo2G8g5VwU7enDYIPndUFsqmlasjhrG9HJw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tPQHafV2Fs3qJut7ExjRE5tWuhod5vSjJhpMTE6GtA0SAI8pKv3cAAllUy1Z5X6GF
	 79d2RT9SqASV35Cy73QFu0nw8XkF1FUNrh4i7Km/5f6yx+ekON5hIVM58F0agpNXya
	 K0+svMHD5zYYFwg4WuGx7MARjvIgeSxzqZ4UrSic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E4E7F8053D; Tue, 23 May 2023 17:53:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1923FF80249;
	Tue, 23 May 2023 17:53:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9520F8024E; Tue, 23 May 2023 17:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 543D3F8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 543D3F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=js11PmSh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rs2q2Kcq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0656229D1;
	Tue, 23 May 2023 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684857169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=R0+lAUhidvAaoCOc3Qbp2gFThOZ7PeFa0wN6v4KzZaE=;
	b=js11PmShSc+9SA3stmKEBFm6He9VjiiM6N2YtLtll/nJYFtHctQNCkA049YkI/TLrMbzPN
	O9oY8nDBo5U8dSn3PtW640iOZthRwLEWtoTTs5SZSwY5N/rvJHdinM+sU+QCcRia42zyov
	bEG4scmKMXX19EUizb7XxFFD2bKdxjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684857169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=R0+lAUhidvAaoCOc3Qbp2gFThOZ7PeFa0wN6v4KzZaE=;
	b=rs2q2KcqcAz8LzO+ppv3hhSbeEW+hxCqE1/0QBHBekzjuJyUqPnqbhSClsdi2le9KpmH00
	Hv4NDN0XI0YpRlBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96FD913A10;
	Tue, 23 May 2023 15:52:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id drauI1HhbGQWDwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 15:52:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH RFC] ALSA: control: Avoid nested locks at notification
Date: Tue, 23 May 2023 17:52:44 +0200
Message-Id: <20230523155244.12347-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FAOZ5TP2P7EEVWD2MU5C6TMMRM3WPBUI
X-Message-ID-Hash: FAOZ5TP2P7EEVWD2MU5C6TMMRM3WPBUI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAOZ5TP2P7EEVWD2MU5C6TMMRM3WPBUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The new control layer stuff introduced the nested rwsem for managing
the list of registered control layer ops.  Since then, a global
snd_ctl_layer_rwsem is always read at each time a control notification
is sent via snd_ctl_notify*() in a nested matter inside the card's
controls_rwsem lock.  This also required a bit complicated way of the
lock at snd_ctl_activate_id() and snd_ctl_elem_write() with the
downgrade of rwsem.

This patch is an attempt to simplify the handling of ctl layer ops.
Now, instead of traversing the global linked list, we keep a local
list of lops in each card instance.  This reduces the need of the
global snd_ctl_layer_rwsem lock at snd_ctl_notify*() invocation.
And, since the nested lock is avoided in most places, we can also
avoid the rwsem downgrade hack in the above, too.

Since the local list entry is created dynamically,
snd_ctl_register_layer() may return an error, and the caller needs to
check the return value.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I noticed the nested lock while looking at the pending bug report
("USB sound card freezes USB after resume from suspend" -- which hasn't
been resolved yet).  Only very lightly tested.

 include/sound/control.h  |   2 +-
 include/sound/core.h     |   9 +++
 sound/core/control.c     | 138 +++++++++++++++++++++++++++------------
 sound/core/control_led.c |   3 +-
 sound/core/init.c        |   1 +
 5 files changed, 108 insertions(+), 45 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index cc3dcc6cfb0f..c40c693853e6 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -156,7 +156,7 @@ int snd_ctl_unregister_ioctl_compat(snd_kctl_ioctl_func_t fcn);
 #endif
 
 int snd_ctl_request_layer(const char *module_name);
-void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops);
+int snd_ctl_register_layer(struct snd_ctl_layer_ops *lops);
 void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops);
 
 int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type);
diff --git a/include/sound/core.h b/include/sound/core.h
index 4ea5f66b59d7..3e49fb483340 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -75,6 +75,14 @@ struct snd_device {
 
 #define snd_device(n) list_entry(n, struct snd_device, list)
 
+/* control layer ops */
+struct snd_ctl_layer_ops;
+
+struct snd_ctl_lops_list {
+	struct snd_ctl_layer_ops *lops;
+	struct list_head list;
+};
+
 /* main structure for soundcard */
 
 struct snd_card {
@@ -104,6 +112,7 @@ struct snd_card {
 	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
 	struct list_head controls;	/* all controls for this card */
 	struct list_head ctl_files;	/* active control files */
+	struct list_head lops_list;	/* list of associated control layer ops */
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
 	struct xarray ctl_numids;	/* hash table for numids */
 	struct xarray ctl_hash;		/* hash table for ctl id matching */
diff --git a/sound/core/control.c b/sound/core/control.c
index 82aa1af1d1d8..70515521fc49 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -202,15 +202,13 @@ void snd_ctl_notify_one(struct snd_card *card, unsigned int mask,
 			struct snd_kcontrol *kctl, unsigned int ioff)
 {
 	struct snd_ctl_elem_id id = kctl->id;
-	struct snd_ctl_layer_ops *lops;
+	struct snd_ctl_lops_list *llist;
 
 	id.index += ioff;
 	id.numid += ioff;
 	snd_ctl_notify(card, mask, &id);
-	down_read(&snd_ctl_layer_rwsem);
-	for (lops = snd_ctl_layer; lops; lops = lops->next)
-		lops->lnotify(card, mask, kctl, ioff);
-	up_read(&snd_ctl_layer_rwsem);
+	list_for_each_entry(llist, &card->lops_list, list)
+		llist->lops->lnotify(card, mask, kctl, ioff);
 }
 EXPORT_SYMBOL(snd_ctl_notify_one);
 
@@ -710,11 +708,8 @@ int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
 		vd->access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 	}
 	snd_ctl_build_ioff(id, kctl, index_offset);
-	downgrade_write(&card->controls_rwsem);
 	snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_INFO, kctl, index_offset);
-	up_read(&card->controls_rwsem);
-	return 1;
-
+	ret = 1;
  unlock:
 	up_write(&card->controls_rwsem);
 	return ret;
@@ -1283,16 +1278,16 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	down_write(&card->controls_rwsem);
 	kctl = snd_ctl_find_id(card, &control->id);
 	if (kctl == NULL) {
-		up_write(&card->controls_rwsem);
-		return -ENOENT;
+		result = -ENOENT;
+		goto unlock;
 	}
 
 	index_offset = snd_ctl_get_ioff(kctl, &control->id);
 	vd = &kctl->vd[index_offset];
 	if (!(vd->access & SNDRV_CTL_ELEM_ACCESS_WRITE) || kctl->put == NULL ||
 	    (file && vd->owner && vd->owner != file)) {
-		up_write(&card->controls_rwsem);
-		return -EPERM;
+		result = -EPERM;
+		goto unlock;
 	}
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
@@ -1311,20 +1306,15 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	if (!result)
 		result = kctl->put(kctl, control);
 	snd_power_unref(card);
-	if (result < 0) {
-		up_write(&card->controls_rwsem);
-		return result;
-	}
+	if (result < 0)
+		goto unlock;
 
-	if (result > 0) {
-		downgrade_write(&card->controls_rwsem);
+	if (result > 0)
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, index_offset);
-		up_read(&card->controls_rwsem);
-	} else {
-		up_write(&card->controls_rwsem);
-	}
-
-	return 0;
+	result = 0;
+ unlock:
+	up_write(&card->controls_rwsem);
+	return result;
 }
 
 static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
@@ -2225,6 +2215,58 @@ int snd_ctl_request_layer(const char *module_name)
 }
 EXPORT_SYMBOL_GPL(snd_ctl_request_layer);
 
+/* register a control layer to the given card */
+static int snd_ctl_card_register_lops(struct snd_card *card,
+				      struct snd_ctl_layer_ops *lops)
+{
+	struct snd_ctl_lops_list *llist;
+
+	llist = kmalloc(sizeof(*llist), GFP_KERNEL);
+	if (!llist)
+		return -ENOMEM;
+	llist->lops = lops;
+	down_read(&card->controls_rwsem);
+	list_add_tail(&llist->list, &card->lops_list);
+	lops->lregister(card);
+	up_read(&card->controls_rwsem);
+	return 0;
+}
+
+static void delete_lops_list(struct snd_card *card,
+			     struct snd_ctl_lops_list *llist)
+{
+	list_del(&llist->list);
+	llist->lops->ldisconnect(card);
+	kfree(llist);
+}
+
+/* disconnect a control layer from the given card */
+static void snd_ctl_card_disconnect_lops(struct snd_card *card,
+					 struct snd_ctl_layer_ops *lops)
+{
+	struct snd_ctl_lops_list *llist;
+
+	down_read(&card->controls_rwsem);
+	list_for_each_entry(llist, &card->lops_list, list) {
+		if (llist->lops == lops) {
+			delete_lops_list(card, llist);
+			break;
+		}
+	}
+	up_read(&card->controls_rwsem);
+}
+
+/* disconnect all control layers from the given card */
+static void snd_ctl_card_disconnect_all_lops(struct snd_card *card)
+{
+	struct snd_ctl_lops_list *llist, *next;
+
+	down_read(&card->controls_rwsem);
+	list_for_each_entry_safe(llist, next, &card->lops_list, list)
+		delete_lops_list(card, llist);
+	up_read(&card->controls_rwsem);
+}
+
 /**
  * snd_ctl_register_layer - register new control layer
  * @lops: operation structure
@@ -2232,10 +2274,10 @@ EXPORT_SYMBOL_GPL(snd_ctl_request_layer);
  * The new layer can track all control elements and do additional
  * operations on top (like audio LED handling).
  */
-void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
+int snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 {
 	struct snd_card *card;
-	int card_number;
+	int ret, card_number;
 
 	down_write(&snd_ctl_layer_rwsem);
 	lops->next = snd_ctl_layer;
@@ -2244,12 +2286,17 @@ void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
 		card = snd_card_ref(card_number);
 		if (card) {
-			down_read(&card->controls_rwsem);
-			lops->lregister(card);
-			up_read(&card->controls_rwsem);
+			ret = snd_ctl_card_register_lops(card, lops);
+			if (ret < 0)
+				goto error;
 			snd_card_unref(card);
 		}
 	}
+	return 0;
+
+ error:
+	snd_ctl_disconnect_layer(lops);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_ctl_register_layer);
 
@@ -2264,6 +2311,16 @@ EXPORT_SYMBOL_GPL(snd_ctl_register_layer);
 void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops)
 {
 	struct snd_ctl_layer_ops *lops2, *prev_lops2;
+	struct snd_card *card;
+	int card_number;
+
+	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
+		card = snd_card_ref(card_number);
+		if (card) {
+			snd_ctl_card_disconnect_lops(card, lops);
+			snd_card_unref(card);
+		}
+	}
 
 	down_write(&snd_ctl_layer_rwsem);
 	for (lops2 = snd_ctl_layer, prev_lops2 = NULL; lops2; lops2 = lops2->next) {
@@ -2310,13 +2367,16 @@ static int snd_ctl_dev_register(struct snd_device *device)
 				  &snd_ctl_f_ops, card, &card->ctl_dev);
 	if (err < 0)
 		return err;
-	down_read(&card->controls_rwsem);
 	down_read(&snd_ctl_layer_rwsem);
-	for (lops = snd_ctl_layer; lops; lops = lops->next)
-		lops->lregister(card);
+	for (lops = snd_ctl_layer; lops; lops = lops->next) {
+		err = snd_ctl_card_register_lops(card, lops);
+		if (err < 0) {
+			snd_ctl_card_disconnect_all_lops(card);
+			break;
+		}
+	}
 	up_read(&snd_ctl_layer_rwsem);
-	up_read(&card->controls_rwsem);
-	return 0;
+	return err;
 }
 
 /*
@@ -2326,7 +2386,6 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 {
 	struct snd_card *card = device->device_data;
 	struct snd_ctl_file *ctl;
-	struct snd_ctl_layer_ops *lops;
 	unsigned long flags;
 
 	read_lock_irqsave(&card->ctl_files_rwlock, flags);
@@ -2336,12 +2395,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 
-	down_read(&card->controls_rwsem);
-	down_read(&snd_ctl_layer_rwsem);
-	for (lops = snd_ctl_layer; lops; lops = lops->next)
-		lops->ldisconnect(card);
-	up_read(&snd_ctl_layer_rwsem);
-	up_read(&card->controls_rwsem);
+	snd_ctl_card_disconnect_all_lops(card);
 
 	return snd_unregister_device(&card->ctl_dev);
 }
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 3cadd40100f3..18b366207a9c 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -762,8 +762,7 @@ static int __init snd_ctl_led_init(void)
 			return -ENOMEM;
 		}
 	}
-	snd_ctl_register_layer(&snd_ctl_led_lops);
-	return 0;
+	return snd_ctl_register_layer(&snd_ctl_led_lops);
 }
 
 static void __exit snd_ctl_led_exit(void)
diff --git a/sound/core/init.c b/sound/core/init.c
index df0c22480375..34bda15ad9ef 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -314,6 +314,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	rwlock_init(&card->ctl_files_rwlock);
 	INIT_LIST_HEAD(&card->controls);
 	INIT_LIST_HEAD(&card->ctl_files);
+	INIT_LIST_HEAD(&card->lops_list);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
 	xa_init(&card->ctl_numids);
 	xa_init(&card->ctl_hash);
-- 
2.35.3

