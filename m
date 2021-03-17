Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBB33F6E3
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:32:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFBF316E4;
	Wed, 17 Mar 2021 18:31:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFBF316E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616002360;
	bh=ENiReFCkc8rgNW/NKNWf8FdCbpDBV8OrVpN+yKnYw8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0IvPQgu7Hq3DFxmZjGg2Dfhzrg17tvk9OqTbo/lTvPrVY+TJEF3aoMTw4dsjjg55
	 3Q9vg7ThVQsFSUkkAs1VDLFB84Mj3Bh/zRMaSyyM51XoaInK4uu4Ek3juAWV2qoFI8
	 WNuBi0C8ttU7ksIcd+SDcsNs+3W5LUoS7svdBgs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C6A4F8032B;
	Wed, 17 Mar 2021 18:30:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94996F80254; Wed, 17 Mar 2021 18:30:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E225F8021C
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:29:58 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 651ADA0046;
 Wed, 17 Mar 2021 18:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 651ADA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616002198; bh=G01JjHLKvGXdGmx/X27fLakluv0iZqk6seQ+zQxthqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nBvIfsSKFW2wa8ZxHJgsK3le1ohjwGu2p23zP5VqTJ5mkMfYf+yb5cj9InY3cluQc
 q9KV/Mp7yqB7M1Kxcu4LOsq3tybPBdKst6J/UxuxC3tIdz0WV2lp+NFr0hQ6Pvo2N6
 8+WEFWAnndTtXFDYWdom0PFXAbE2lTsLKyomyVdk=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Mar 2021 18:29:54 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v4 1/6] ALSA: control - introduce snd_ctl_notify_one() helper
Date: Wed, 17 Mar 2021 18:29:40 +0100
Message-Id: <20210317172945.842280-2-perex@perex.cz>
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

This helper is required for the following generic LED mute
patch. The helper also simplifies some other functions.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/control.h |  4 +--
 sound/core/control.c    | 68 +++++++++++++++++++++++++++--------------
 2 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 77d9fa10812d..22f3d48163ff 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -115,6 +115,7 @@ typedef int (*snd_kctl_ioctl_func_t) (struct snd_card * card,
 				      unsigned int cmd, unsigned long arg);
 
 void snd_ctl_notify(struct snd_card * card, unsigned int mask, struct snd_ctl_elem_id * id);
+void snd_ctl_notify_one(struct snd_card * card, unsigned int mask, struct snd_kcontrol * kctl, unsigned int ioff);
 
 struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new * kcontrolnew, void * private_data);
 void snd_ctl_free_one(struct snd_kcontrol * kcontrol);
@@ -123,8 +124,7 @@ int snd_ctl_remove(struct snd_card * card, struct snd_kcontrol * kcontrol);
 int snd_ctl_replace(struct snd_card *card, struct snd_kcontrol *kcontrol, bool add_on_replace);
 int snd_ctl_remove_id(struct snd_card * card, struct snd_ctl_elem_id *id);
 int snd_ctl_rename_id(struct snd_card * card, struct snd_ctl_elem_id *src_id, struct snd_ctl_elem_id *dst_id);
-int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
-			int active);
+int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id, int active);
 struct snd_kcontrol *snd_ctl_find_numid(struct snd_card * card, unsigned int numid);
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card * card, struct snd_ctl_elem_id *id);
 
diff --git a/sound/core/control.c b/sound/core/control.c
index 5165741a8400..8a5cedb0a4be 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -181,6 +181,27 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 }
 EXPORT_SYMBOL(snd_ctl_notify);
 
+/**
+ * snd_ctl_notify_one - Send notification to user-space for a control change
+ * @card: the card to send notification
+ * @mask: the event mask, SNDRV_CTL_EVENT_*
+ * @kctl: the pointer with the control instance
+ * @ioff: the additional offset to the control index
+ *
+ * This function calls snd_ctl_notify() and does additional jobs
+ * like LED state changes.
+ */
+void snd_ctl_notify_one(struct snd_card *card, unsigned int mask,
+			struct snd_kcontrol *kctl, unsigned int ioff)
+{
+	struct snd_ctl_elem_id id = kctl->id;
+
+	id.index += ioff;
+	id.numid += ioff;
+	snd_ctl_notify(card, mask, &id);
+}
+EXPORT_SYMBOL(snd_ctl_notify_one);
+
 /**
  * snd_ctl_new - create a new control instance with some elements
  * @kctl: the pointer to store new control instance
@@ -342,7 +363,6 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 {
 	struct snd_ctl_elem_id id;
 	unsigned int idx;
-	unsigned int count;
 	struct snd_kcontrol *old;
 	int err;
 
@@ -376,10 +396,8 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	kcontrol->id.numid = card->last_numid + 1;
 	card->last_numid += kcontrol->count;
 
-	id = kcontrol->id;
-	count = kcontrol->count;
-	for (idx = 0; idx < count; idx++, id.index++, id.numid++)
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_ADD, &id);
+	for (idx = 0; idx < kcontrol->count; idx++)
+		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_ADD, kcontrol, idx);
 
 	return 0;
 }
@@ -462,16 +480,14 @@ EXPORT_SYMBOL(snd_ctl_replace);
  */
 int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
 {
-	struct snd_ctl_elem_id id;
 	unsigned int idx;
 
 	if (snd_BUG_ON(!card || !kcontrol))
 		return -EINVAL;
 	list_del(&kcontrol->list);
 	card->controls_count -= kcontrol->count;
-	id = kcontrol->id;
-	for (idx = 0; idx < kcontrol->count; idx++, id.index++, id.numid++)
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_REMOVE, &id);
+	for (idx = 0; idx < kcontrol->count; idx++)
+		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
 	snd_ctl_free_one(kcontrol);
 	return 0;
 }
@@ -584,11 +600,13 @@ int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
 		vd->access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 	}
 	snd_ctl_build_ioff(id, kctl, index_offset);
-	ret = 1;
+	downgrade_write(&card->controls_rwsem);
+	snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_INFO, kctl, index_offset);
+	up_read(&card->controls_rwsem);
+	return 1;
+
  unlock:
 	up_write(&card->controls_rwsem);
-	if (ret > 0)
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO, id);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_ctl_activate_id);
@@ -1110,25 +1128,34 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	unsigned int index_offset;
 	int result;
 
+	down_write(&card->controls_rwsem);
 	kctl = snd_ctl_find_id(card, &control->id);
-	if (kctl == NULL)
+	if (kctl == NULL) {
+		up_write(&card->controls_rwsem);
 		return -ENOENT;
+	}
 
 	index_offset = snd_ctl_get_ioff(kctl, &control->id);
 	vd = &kctl->vd[index_offset];
 	if (!(vd->access & SNDRV_CTL_ELEM_ACCESS_WRITE) || kctl->put == NULL ||
 	    (file && vd->owner && vd->owner != file)) {
+		up_write(&card->controls_rwsem);
 		return -EPERM;
 	}
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
 	result = kctl->put(kctl, control);
-	if (result < 0)
+	if (result < 0) {
+		up_write(&card->controls_rwsem);
 		return result;
+	}
 
 	if (result > 0) {
-		struct snd_ctl_elem_id id = control->id;
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
+		downgrade_write(&card->controls_rwsem);
+		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, index_offset);
+		up_read(&card->controls_rwsem);
+	} else {
+		up_write(&card->controls_rwsem);
 	}
 
 	return 0;
@@ -1150,9 +1177,7 @@ static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
 	if (result < 0)
 		goto error;
 
-	down_write(&card->controls_rwsem);
 	result = snd_ctl_elem_write(card, file, control);
-	up_write(&card->controls_rwsem);
 	if (result < 0)
 		goto error;
 
@@ -1301,7 +1326,6 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 {
 	struct user_element *ue = kctl->private_data;
 	unsigned int *container;
-	struct snd_ctl_elem_id id;
 	unsigned int mask = 0;
 	int i;
 	int change;
@@ -1333,10 +1357,8 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 	ue->tlv_data_size = size;
 
 	mask |= SNDRV_CTL_EVENT_MASK_TLV;
-	for (i = 0; i < kctl->count; ++i) {
-		snd_ctl_build_ioff(&id, kctl, i);
-		snd_ctl_notify(ue->card, mask, &id);
-	}
+	for (i = 0; i < kctl->count; ++i)
+		snd_ctl_notify_one(ue->card, mask, kctl, i);
 
 	return change;
 }
-- 
2.29.2
