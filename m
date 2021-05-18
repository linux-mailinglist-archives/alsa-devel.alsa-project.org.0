Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4844387DFC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C791790;
	Tue, 18 May 2021 18:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C791790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621356972;
	bh=6wHq/rtM5QG6NJeTsu9wYhhd7h/B4OcaWWpiColL0D0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GW+WnZC/UMUouzIs8qch5hS6jj/7rF5n2c/Sy+Pherxb55tOom+ttDDj8wwGlqMXu
	 kSYpDyksFere8Jsg2fmbaeY+sWK5skFpPuIiw8RN37iU0iSWXS+Qvj8udNM1d2shSh
	 S3aVb+Us0juPdBy42xGk8vomyzCKf6zUp6KfSlQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D96F804E0;
	Tue, 18 May 2021 18:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656A4F804AB; Tue, 18 May 2021 18:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D69F80272
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D69F80272
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C729B1C2;
 Tue, 18 May 2021 16:52:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ALSA: control: Track in-flight control read/write/tlv
 accesses
Date: Tue, 18 May 2021 18:51:59 +0200
Message-Id: <20210518165201.24376-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518165201.24376-1-tiwai@suse.de>
References: <20210518165201.24376-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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

Although we introduced the power state check at the entrance of the
common handler for control API (and other interfaces), there can be
still some pending tasks that already went into the ioctl handler, and
those may access the hardware even after the power state check;
currently the problem is seen typically for the kcontrol access
paths.  If a system wants to assure the free from hw access (like the
PCI rescan feature we're going to implement in future), this situation
must be avoided, and we have to sync such in-flight tasks finishing.

For that purpose, this patch introduces a few new things:
- A refcount, power_ref, and a wait queue, power_ref_sleep, to the
  card object
- A few new helpers, snd_power_ref(), snd_power_unref(),
  snd_power_ref_and_wait(), and snd_power_sync_ref()

In the code paths that call kctl info/read/write/tlv ops, we check the
power state again but at this time with the newly introduced
snd_power_ref_and_wait() instead.  This function also takes the
card.power_ref refcount for tracking this in-flight task.  Once after
the access finishes, snd_power_unref() is called to released the
refcount.  So the driver can sync via snd_power_sync_ref() assuring
that all in-flight tasks have been finished.

As of this patch, snd_power_sync_ref() is called only at
snd_card_disconnect(), but it'll be used in other places in future.

Note that atomic_t is used for power_ref intentionally instead of
refcount_t.  It's because of the design of refcount_t type; it cannot
be zero-based, and it cannot do dec_and_test() call for multiple
times.

Also, this patch changes snd_power_wait() to accept only
SNDRV_CTL_POWER_D0, which is the only value that makes sense.
In later patch, the snd_power_wait() calls will be simplified.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h        | 31 ++++++++++++++++++
 sound/core/control.c        | 23 +++++++++++---
 sound/core/control_compat.c |  5 ++-
 sound/core/init.c           | 63 ++++++++++++++++++++++++++++++++-----
 4 files changed, 108 insertions(+), 14 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index d69dfc6c4953..430d775b3c0e 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -128,7 +128,9 @@ struct snd_card {
 
 #ifdef CONFIG_PM
 	unsigned int power_state;	/* power state */
+	atomic_t power_ref;
 	wait_queue_head_t power_sleep;
+	wait_queue_head_t power_ref_sleep;
 #endif
 
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
@@ -151,12 +153,41 @@ static inline void snd_power_change_state(struct snd_card *card, unsigned int st
 	wake_up(&card->power_sleep);
 }
 
+/**
+ * snd_power_ref - Take the reference count for power control
+ * @card: sound card object
+ *
+ * The power_ref reference of the card is used for managing to block
+ * the snd_power_sync_ref() operation.  This function increments the reference.
+ * The counterpart snd_power_unref() has to be called appropriately later.
+ */
+static inline void snd_power_ref(struct snd_card *card)
+{
+	atomic_inc(&card->power_ref);
+}
+
+/**
+ * snd_power_unref - Release the reference count for power control
+ * @card: sound card object
+ */
+static inline void snd_power_unref(struct snd_card *card)
+{
+	if (atomic_dec_and_test(&card->power_ref))
+		wake_up(&card->power_ref_sleep);
+}
+
 /* init.c */
 int snd_power_wait(struct snd_card *card, unsigned int power_state);
+int snd_power_ref_and_wait(struct snd_card *card);
+void snd_power_sync_ref(struct snd_card *card);
 
 #else /* ! CONFIG_PM */
 
 static inline int snd_power_wait(struct snd_card *card, unsigned int state) { return 0; }
+static inline void snd_power_ref(struct snd_card *card) {}
+static inline void snd_power_unref(struct snd_card *card) {}
+static inline int snd_power_ref_and_wait(struct snd_card *card) { return 0; }
+static inline void snd_power_sync_ref(struct snd_card *card) {}
 #define snd_power_get_state(card)	({ (void)(card); SNDRV_CTL_POWER_D0; })
 #define snd_power_change_state(card, state)	do { (void)(card); } while (0)
 
diff --git a/sound/core/control.c b/sound/core/control.c
index 5e8b77855e5d..37f6f2ca0543 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -995,7 +995,10 @@ static int __snd_ctl_elem_info(struct snd_card *card,
 #ifdef CONFIG_SND_DEBUG
 	info->access = 0;
 #endif
-	result = kctl->info(kctl, info);
+	result = snd_power_ref_and_wait(card);
+	if (!result)
+		result = kctl->info(kctl, info);
+	snd_power_unref(card);
 	if (result >= 0) {
 		snd_BUG_ON(info->access);
 		index_offset = snd_ctl_get_ioff(kctl, &info->id);
@@ -1085,7 +1088,10 @@ static int snd_ctl_elem_read(struct snd_card *card,
 
 	if (!snd_ctl_skip_validation(&info))
 		fill_remaining_elem_value(control, &info, pattern);
-	ret = kctl->get(kctl, control);
+	ret = snd_power_ref_and_wait(card);
+	if (!ret)
+		ret = kctl->get(kctl, control);
+	snd_power_unref(card);
 	if (ret < 0)
 		return ret;
 	if (!snd_ctl_skip_validation(&info) &&
@@ -1147,7 +1153,10 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	}
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
-	result = kctl->put(kctl, control);
+	result = snd_power_ref_and_wait(card);
+	if (!result)
+		result = kctl->put(kctl, control);
+	snd_power_unref(card);
 	if (result < 0) {
 		up_write(&card->controls_rwsem);
 		return result;
@@ -1658,7 +1667,7 @@ static int call_tlv_handler(struct snd_ctl_file *file, int op_flag,
 		{SNDRV_CTL_TLV_OP_CMD,   SNDRV_CTL_ELEM_ACCESS_TLV_COMMAND},
 	};
 	struct snd_kcontrol_volatile *vd = &kctl->vd[snd_ctl_get_ioff(kctl, id)];
-	int i;
+	int i, ret;
 
 	/* Check support of the request for this element. */
 	for (i = 0; i < ARRAY_SIZE(pairs); ++i) {
@@ -1676,7 +1685,11 @@ static int call_tlv_handler(struct snd_ctl_file *file, int op_flag,
 	    vd->owner != NULL && vd->owner != file)
 		return -EPERM;
 
-	return kctl->tlv.c(kctl, op_flag, size, buf);
+	ret = snd_power_ref_and_wait(file->card);
+	if (!ret)
+		ret = kctl->tlv.c(kctl, op_flag, size, buf);
+	snd_power_unref(file->card);
+	return ret;
 }
 
 static int read_tlv_buf(struct snd_kcontrol *kctl, struct snd_ctl_elem_id *id,
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 57b73ab57506..b9fe1ead435b 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -184,7 +184,10 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 		return -ENOMEM;
 	}
 	info->id = *id;
-	err = kctl->info(kctl, info);
+	err = snd_power_ref_and_wait(card);
+	if (!err)
+		err = kctl->info(kctl, info);
+	snd_power_unref(card);
 	up_read(&card->controls_rwsem);
 	if (err >= 0) {
 		err = info->type;
diff --git a/sound/core/init.c b/sound/core/init.c
index ef41f5b3a240..d11636fac608 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -220,6 +220,8 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	mutex_init(&card->memory_mutex);
 #ifdef CONFIG_PM
 	init_waitqueue_head(&card->power_sleep);
+	init_waitqueue_head(&card->power_ref_sleep);
+	atomic_set(&card->power_ref, 0);
 #endif
 	init_waitqueue_head(&card->remove_sleep);
 	card->sync_irq = -1;
@@ -442,6 +444,7 @@ int snd_card_disconnect(struct snd_card *card)
 
 #ifdef CONFIG_PM
 	wake_up(&card->power_sleep);
+	snd_power_sync_ref(card);
 #endif
 	return 0;	
 }
@@ -1002,21 +1005,28 @@ EXPORT_SYMBOL(snd_card_file_remove);
 
 #ifdef CONFIG_PM
 /**
- *  snd_power_wait - wait until the power-state is changed.
- *  @card: soundcard structure
- *  @power_state: expected power state
+ * snd_power_ref_and_wait - wait until the card gets powered up
+ * @card: soundcard structure
+ *
+ * Take the power_ref reference count of the given card, and
+ * wait until the card gets powered up to SNDRV_CTL_POWER_D0 state.
+ * The refcount is down again while sleeping until power-up, hence this
+ * function can be used for syncing the floating control ops accesses,
+ * typically around calling control ops.
  *
- *  Waits until the power-state is changed.
+ * The caller needs to pull down the refcount via snd_power_unref() later
+ * no matter whether the error is returned from this function or not.
  *
- *  Return: Zero if successful, or a negative error code.
+ * Return: Zero if successful, or a negative error code.
  */
-int snd_power_wait(struct snd_card *card, unsigned int power_state)
+int snd_power_ref_and_wait(struct snd_card *card)
 {
 	wait_queue_entry_t wait;
 	int result = 0;
 
+	snd_power_ref(card);
 	/* fastpath */
-	if (snd_power_get_state(card) == power_state)
+	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0)
 		return 0;
 	init_waitqueue_entry(&wait, current);
 	add_wait_queue(&card->power_sleep, &wait);
@@ -1025,13 +1035,50 @@ int snd_power_wait(struct snd_card *card, unsigned int power_state)
 			result = -ENODEV;
 			break;
 		}
-		if (snd_power_get_state(card) == power_state)
+		if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0)
 			break;
+		snd_power_unref(card);
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(30 * HZ);
+		snd_power_ref(card);
 	}
 	remove_wait_queue(&card->power_sleep, &wait);
 	return result;
 }
+EXPORT_SYMBOL_GPL(snd_power_ref_and_wait);
+
+/**
+ * snd_power_wait - wait until the card gets powered up (old form)
+ * @card: soundcard structure
+ * @power_state: expected power state
+ *
+ * Wait until the card gets powered up to SNDRV_CTL_POWER_D0 state.
+ * @power_state must be SNDRV_CTL_POWER_D0.
+ *
+ * Return: Zero if successful, or a negative error code.
+ */
+int snd_power_wait(struct snd_card *card, unsigned int power_state)
+{
+	int ret;
+
+	if (WARN_ON(power_state != SNDRV_CTL_POWER_D0))
+		return 0;
+	ret = snd_power_ref_and_wait(card);
+	snd_power_unref(card);
+	return ret;
+}
 EXPORT_SYMBOL(snd_power_wait);
+
+/**
+ * snd_power_sync_ref - wait until the card power_ref is freed
+ * @card: sound card object
+ *
+ * This function is used to synchronize with the pending power_ref being
+ * released.
+ */
+void snd_power_sync_ref(struct snd_card *card)
+{
+	wait_event(card->power_ref_sleep, !atomic_read(&card->power_ref));
+}
+EXPORT_SYMBOL_GPL(snd_power_sync_ref);
 #endif /* CONFIG_PM */
-- 
2.26.2

