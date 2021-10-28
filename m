Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176643E17B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 15:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29CD316B4;
	Thu, 28 Oct 2021 15:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29CD316B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635426093;
	bh=fzdyjc+KHvjnGqJ1iFWaMPB3lT6zuEb1SMjvtDElmOc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NX/uz+BMzJ4Rmj++vgLk+VvxVLGlyJ/sG6mwjLyzQ3ojyL0N2m0TYydbIcS/S/rEW
	 vgBCx3gpg5e/CACX98a3cjx1lpIJNZV3Rt6/wRnH8l/I5/+i56x+LNS89gGSgfuRTn
	 DiJJUI4OcFaPYasZTPWPjfKSA0JeeIZ0QtzUgQn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 424C8F804AE;
	Thu, 28 Oct 2021 15:00:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FE22F804AE; Thu, 28 Oct 2021 15:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71FE8F80269
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 15:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71FE8F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="o15tgRg3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Hr4dvuf0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 750F41FD52
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635426029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qGre+A2WGM9hgZ/Ltre5gPHVKVtASJo6XkyfIeyCN2w=;
 b=o15tgRg3TM/pEN5WzSVB0Eaa5tcAcTzt38aGCMEuNX5V3viqQtumI82H5QbZAk3Ic5ivwK
 uUI7f/kBc9WypcHUAtpzMQgWq96L2sA5Ti+9+p5nzlaMReWpAnaz4vSR02va8VO+k/yYns
 59wvgHMNY1h6RPl+QbqxV0VQ3OZ8Af0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635426029;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qGre+A2WGM9hgZ/Ltre5gPHVKVtASJo6XkyfIeyCN2w=;
 b=Hr4dvuf0ErJsTkdci+fFvz6wcAI4Aa2eOlhuxumtafqaZMy17P1F9UQe2q+ZrDgGXhBXXS
 V1t6SGOBGXKnTaBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 25621A3B8E;
 Thu, 28 Oct 2021 13:00:29 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC] ALSA: control: Use xarray for faster lookups
Date: Thu, 28 Oct 2021 15:00:27 +0200
Message-Id: <20211028130027.18764-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The control elements are managed in a single linked list and we
traverse the whole list for matching each numid or ctl id per every
inquiry of a control element.  This is OK-ish for a small number of
elements but obviously it doesn't scale.  Especially the matching with
the ctl id takes time because it checks each field of the snd_ctl_id
element, e.g. the name string is matched with strcmp().

This patch adds the hash tables with Xarray in addition to the linked
list for improving the lookup speed of a control element.  There are
two xarray tables added to the card; one for numid and another for ctl
id.  For the numid, we use the numid as the index, while for the ctl
id, we calculate a hash key.

The lookup is done via a single xa_load().  When nothing hits, we look
through the full list entries as a fallback.  So, the inquiry for a
non-existing element would take (even slightly longer) time with this
patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is not really meant to be merged now, but just shown as a
reference implementation, as the issue doesn't surface unless you have
a large number of elements and query the late element frequently.  In
my test, 1,000,000 queries of the 1000th element took over 12 seconds,
while the patched kernel took 0.2 second.  But for the most cases (at
most 20 or 30 elements), it doesn't matter much.


 include/sound/core.h |   3 +
 sound/core/control.c | 142 +++++++++++++++++++++++++++++++++----------
 sound/core/init.c    |   2 +
 3 files changed, 115 insertions(+), 32 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index b7e9b58d3c78..e8bb6d943f3f 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -14,6 +14,7 @@
 #include <linux/pm.h>			/* pm_message_t */
 #include <linux/stringify.h>
 #include <linux/printk.h>
+#include <linux/xarray.h>
 
 /* number of supported soundcards */
 #ifdef CONFIG_SND_DYNAMIC_MINORS
@@ -103,6 +104,8 @@ struct snd_card {
 	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
 	struct list_head controls;	/* all controls for this card */
 	struct list_head ctl_files;	/* active control files */
+	struct xarray ctl_numids;	/* hash table for numids */
+	struct xarray ctl_hash;		/* hash table for ctl id matching */
 
 	struct snd_info_entry *proc_root;	/* root for soundcard specific files */
 	struct proc_dir_entry *proc_root_link;	/* number link to real id */
diff --git a/sound/core/control.c b/sound/core/control.c
index a25c0d64d104..d0253cc4b22d 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -364,6 +364,78 @@ static int snd_ctl_find_hole(struct snd_card *card, unsigned int count)
 	return 0;
 }
 
+/* Compute a hash key for the corresponding ctl id
+ * It's for the name lookup, hence the numid is excluded.
+ * The hash key is bound in LONG_MAX to be used for Xarray key.
+ */
+#define MULTIPLIER	37
+static unsigned long get_ctl_id_hash(const struct snd_ctl_elem_id *id)
+{
+	unsigned long h;
+	const unsigned char *p;
+
+	h = id->iface;
+	h = MULTIPLIER * h + id->device;
+	h = MULTIPLIER * h + id->subdevice;
+	for (p = id->name; *p; p++)
+		h = MULTIPLIER * h + *p;
+	h = MULTIPLIER * h + id->index;
+	h &= LONG_MAX;
+	return h;
+}
+
+/* check whether the given id is contained in the given kctl */
+static bool elem_id_matches(const struct snd_kcontrol *kctl,
+			    const struct snd_ctl_elem_id *id)
+{
+	return kctl->id.iface == id->iface &&
+		kctl->id.device == id->device &&
+		kctl->id.subdevice == id->subdevice &&
+		!strncmp(kctl->id.name, id->name, sizeof(kctl->id.name)) &&
+		kctl->id.index <= id->index &&
+		kctl->id.index + kctl->count > id->index;
+}
+
+/* add hash entries to numid and ctl xarray tables */
+static void add_hash_entries(struct snd_card *card,
+			     struct snd_kcontrol *kcontrol)
+{
+	struct snd_ctl_elem_id id = kcontrol->id;
+	int i, err;
+
+	xa_store_range(&card->ctl_numids, kcontrol->id.numid,
+		       kcontrol->id.numid + kcontrol->count - 1,
+		       kcontrol, GFP_KERNEL);
+
+	for (i = 0; i < kcontrol->count; i++) {
+		id.index = kcontrol->id.index + i;
+		err = xa_insert(&card->ctl_hash, get_ctl_id_hash(&id),
+				kcontrol, GFP_KERNEL);
+		/* ignore errors - it's a best effort */
+	}
+}
+
+/* remove hash entries that have been added */
+static void remove_hash_entries(struct snd_card *card,
+				struct snd_kcontrol *kcontrol)
+{
+	struct snd_ctl_elem_id id = kcontrol->id;
+	struct snd_kcontrol *matched;
+	unsigned long h;
+	int i;
+
+	for (i = 0; i < kcontrol->count; i++) {
+		xa_erase(&card->ctl_numids, id.numid);
+		h = get_ctl_id_hash(&id);
+		matched = xa_load(&card->ctl_hash, h);
+		if (matched && (matched == kcontrol ||
+				elem_id_matches(matched, &id)))
+			xa_erase(&card->ctl_hash, h);
+		id.index++;
+		id.numid++;
+	}
+}
+
 enum snd_ctl_add_mode {
 	CTL_ADD_EXCLUSIVE, CTL_REPLACE, CTL_ADD_ON_REPLACE,
 };
@@ -408,6 +480,8 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	kcontrol->id.numid = card->last_numid + 1;
 	card->last_numid += kcontrol->count;
 
+	add_hash_entries(card, kcontrol);
+
 	for (idx = 0; idx < kcontrol->count; idx++)
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_ADD, kcontrol, idx);
 
@@ -479,6 +553,26 @@ int snd_ctl_replace(struct snd_card *card, struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL(snd_ctl_replace);
 
+static int __snd_ctl_remove(struct snd_card *card,
+			    struct snd_kcontrol *kcontrol,
+			    bool remove_hash)
+{
+	unsigned int idx;
+
+	if (snd_BUG_ON(!card || !kcontrol))
+		return -EINVAL;
+	list_del(&kcontrol->list);
+
+	if (remove_hash)
+		remove_hash_entries(card, kcontrol);
+
+	card->controls_count -= kcontrol->count;
+	for (idx = 0; idx < kcontrol->count; idx++)
+		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
+	snd_ctl_free_one(kcontrol);
+	return 0;
+}
+
 /**
  * snd_ctl_remove - remove the control from the card and release it
  * @card: the card instance
@@ -492,16 +586,7 @@ EXPORT_SYMBOL(snd_ctl_replace);
  */
 int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
 {
-	unsigned int idx;
-
-	if (snd_BUG_ON(!card || !kcontrol))
-		return -EINVAL;
-	list_del(&kcontrol->list);
-	card->controls_count -= kcontrol->count;
-	for (idx = 0; idx < kcontrol->count; idx++)
-		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
-	snd_ctl_free_one(kcontrol);
-	return 0;
+	return __snd_ctl_remove(card, kcontrol, true);
 }
 EXPORT_SYMBOL(snd_ctl_remove);
 
@@ -642,9 +727,11 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
 	}
+	remove_hash_entries(card, kctl);
 	kctl->id = *dst_id;
 	kctl->id.numid = card->last_numid + 1;
 	card->last_numid += kctl->count;
+	add_hash_entries(card, kctl);
 	up_write(&card->controls_rwsem);
 	return 0;
 }
@@ -665,15 +752,9 @@ EXPORT_SYMBOL(snd_ctl_rename_id);
  */
 struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card, unsigned int numid)
 {
-	struct snd_kcontrol *kctl;
-
 	if (snd_BUG_ON(!card || !numid))
 		return NULL;
-	list_for_each_entry(kctl, &card->controls, list) {
-		if (kctl->id.numid <= numid && kctl->id.numid + kctl->count > numid)
-			return kctl;
-	}
-	return NULL;
+	return xa_load(&card->ctl_numids, numid);
 }
 EXPORT_SYMBOL(snd_ctl_find_numid);
 
@@ -699,21 +780,15 @@ struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
 		return NULL;
 	if (id->numid != 0)
 		return snd_ctl_find_numid(card, id->numid);
-	list_for_each_entry(kctl, &card->controls, list) {
-		if (kctl->id.iface != id->iface)
-			continue;
-		if (kctl->id.device != id->device)
-			continue;
-		if (kctl->id.subdevice != id->subdevice)
-			continue;
-		if (strncmp(kctl->id.name, id->name, sizeof(kctl->id.name)))
-			continue;
-		if (kctl->id.index > id->index)
-			continue;
-		if (kctl->id.index + kctl->count <= id->index)
-			continue;
+	kctl = xa_load(&card->ctl_hash, get_ctl_id_hash(id));
+	if (kctl && elem_id_matches(kctl, id))
 		return kctl;
-	}
+
+	/* no matching in hash table - try all as the last resort */
+	list_for_each_entry(kctl, &card->controls, list)
+		if (elem_id_matches(kctl, id))
+			return kctl;
+
 	return NULL;
 }
 EXPORT_SYMBOL(snd_ctl_find_id);
@@ -2195,8 +2270,11 @@ static int snd_ctl_dev_free(struct snd_device *device)
 	down_write(&card->controls_rwsem);
 	while (!list_empty(&card->controls)) {
 		control = snd_kcontrol(card->controls.next);
-		snd_ctl_remove(card, control);
+		__snd_ctl_remove(card, control, false);
 	}
+
+	xa_destroy(&card->ctl_numids);
+	xa_destroy(&card->ctl_hash);
 	up_write(&card->controls_rwsem);
 	put_device(&card->ctl_dev);
 	return 0;
diff --git a/sound/core/init.c b/sound/core/init.c
index ac335f5906c6..a1979fe27d53 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -282,6 +282,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	rwlock_init(&card->ctl_files_rwlock);
 	INIT_LIST_HEAD(&card->controls);
 	INIT_LIST_HEAD(&card->ctl_files);
+	xa_init(&card->ctl_numids);
+	xa_init(&card->ctl_hash);
 	spin_lock_init(&card->files_lock);
 	INIT_LIST_HEAD(&card->files_list);
 	mutex_init(&card->memory_mutex);
-- 
2.31.1

