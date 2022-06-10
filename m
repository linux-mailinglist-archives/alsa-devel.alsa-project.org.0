Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F437545C91
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:47:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BBE51F12;
	Fri, 10 Jun 2022 08:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BBE51F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843640;
	bh=aDPatg83uacYPi5kIWChH1XXE7FeJs6k0yUPyc94hag=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nnr14DjWiXyz9v4WyEOiLkzZ/+X5nkVDV/bphNZUIu9G4/m2K29SAKhsUf5EcLHmk
	 HnjwCfKeyUIvlA6KWsRiIzuH5TwB1dZ/Q0IaiV6c+uGv1Bjra9chUSK61xf/77PkXl
	 Q3PxF3TvnzVkJFkDmsc7Cl55xreUtyuAxi/E5/Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74AFEF8052F;
	Fri, 10 Jun 2022 08:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12DC5F80515; Fri, 10 Jun 2022 08:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE03FF804CF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 08:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE03FF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1AhK8OYv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="hTzXofzX"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 685271FDBB;
 Fri, 10 Jun 2022 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654843562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LcN2MEOV6Ipf46ce/uRY+/N1lW79pl0UyvjitITmwQE=;
 b=1AhK8OYvb1eJamSWpfGGbrZTMXIAQAJBf+bZhYwwn3PORiIIgOl+TEcjqrQTmNxKVHT5MF
 ogZJz8R4SsF5Sr3xRhhCOfNSOFnNO/j/7Pm4Ghzat7jjyZKpv7qbafhXC4hK6AoWBSy4uC
 nznTpdapSUGGGQTmGHsy/MZd0q7G5SA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654843562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LcN2MEOV6Ipf46ce/uRY+/N1lW79pl0UyvjitITmwQE=;
 b=hTzXofzX6Dl7F4C6H0SPySe19jbzdhWu/ZGQ5DTQKg7+2qpyQRCS8zhmmPMvLhNrNdg/LJ
 +aAE4bdZjYtdDgDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CBFD139ED;
 Fri, 10 Jun 2022 06:46:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qnPzEaroomIcJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 10 Jun 2022 06:46:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ALSA: control: Use xarray for faster lookups
Date: Fri, 10 Jun 2022 08:45:37 +0200
Message-Id: <20220610064537.18660-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

This patch adds the hash tables with Xarray for improving the lookup
speed of a control element.  There are two xarray tables added to the
card; one for numid and another for ctl id.  For the numid, we use the
numid as the index, while for the ctl id, we calculate a hash key.

The lookup is done via a single xa_load() execution.  As long as the
given control element is found on the Xarray table, that's fine, we
can give back a quick lookup result.  The problem is when no entry
hits on the table, and for this case, we have a slight optimization.
Namely, the driver checks whether we had a collision on Xarray table,
and do a fallback search (linear lookup of the full entries) only if a
hash key collision happened beforehand.
So, in theory, the inquiry for a non-existing element might take still
time even with this patch in a worst case, but this must be pretty
rare.

The feature is enabled via CONFIG_SND_CTL_FAST_LOOKUP, which is turned
on as default.  For simplicity, the option can be turned off only when
CONFIG_EXPERT is set ("You are expert? Then you manage 1000 knobs").

Link: https://lore.kernel.org/r/20211028130027.18764-1-tiwai@suse.de
Link: https://lore.kernel.org/r/20220609180504.775-1-tiwai@suse.de
Link: https://lore.kernel.org/all/cover.1653813866.git.quic_rbankapu@quicinc.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: optimize with collision detection, cleanups
v2->v3: Fix missing dependency on CONFIG_XARRAY_MULTI

 include/sound/core.h |   6 ++
 sound/core/Kconfig   |  10 +++
 sound/core/control.c | 180 +++++++++++++++++++++++++++++++++++--------
 sound/core/init.c    |   4 +
 4 files changed, 168 insertions(+), 32 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 6d4cc49584c6..dd28de2343b8 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -14,6 +14,7 @@
 #include <linux/pm.h>			/* pm_message_t */
 #include <linux/stringify.h>
 #include <linux/printk.h>
+#include <linux/xarray.h>
 
 /* number of supported soundcards */
 #ifdef CONFIG_SND_DYNAMIC_MINORS
@@ -103,6 +104,11 @@ struct snd_card {
 	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
 	struct list_head controls;	/* all controls for this card */
 	struct list_head ctl_files;	/* active control files */
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	struct xarray ctl_numids;	/* hash table for numids */
+	struct xarray ctl_hash;		/* hash table for ctl id matching */
+	bool ctl_hash_collision;	/* ctl_hash collision seen? */
+#endif
 
 	struct snd_info_entry *proc_root;	/* root for soundcard specific files */
 	struct proc_dir_entry *proc_root_link;	/* number link to real id */
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index dd7b40734723..25b2434e4556 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -154,6 +154,16 @@ config SND_VERBOSE_PRINTK
 
 	  You don't need this unless you're debugging ALSA.
 
+config SND_CTL_FAST_LOOKUP
+	bool "Fast lookup of control elements" if EXPERT
+	default y
+	select XARRAY_MULTI
+	help
+	  This option enables the faster lookup of control elements.
+	  It will consume more memory because of the additional Xarray.
+	  If you want to choose the memory footprint over the performance
+	  inevitably, turn this off.
+
 config SND_DEBUG
 	bool "Debug"
 	help
diff --git a/sound/core/control.c b/sound/core/control.c
index a25c0d64d104..6a8fd9933f06 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -364,6 +364,93 @@ static int snd_ctl_find_hole(struct snd_card *card, unsigned int count)
 	return 0;
 }
 
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
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
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
+/* add hash entries to numid and ctl xarray tables */
+static void add_hash_entries(struct snd_card *card,
+			     struct snd_kcontrol *kcontrol)
+{
+	struct snd_ctl_elem_id id = kcontrol->id;
+	int i;
+
+	xa_store_range(&card->ctl_numids, kcontrol->id.numid,
+		       kcontrol->id.numid + kcontrol->count - 1,
+		       kcontrol, GFP_KERNEL);
+
+	for (i = 0; i < kcontrol->count; i++) {
+		id.index = kcontrol->id.index + i;
+		if (xa_insert(&card->ctl_hash, get_ctl_id_hash(&id),
+			      kcontrol, GFP_KERNEL)) {
+			/* skip hash for this entry, noting we had collision */
+			card->ctl_hash_collision = true;
+			dev_dbg(card->dev, "ctl_hash collision %d:%s:%d\n",
+				id.iface, id.name, id.index);
+		}
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
+#else /* CONFIG_SND_CTL_FAST_LOOKUP */
+static inline void add_hash_entries(struct snd_card *card,
+				    struct snd_kcontrol *kcontrol)
+{
+}
+static inline void remove_hash_entries(struct snd_card *card,
+				       struct snd_kcontrol *kcontrol)
+{
+}
+#endif /* CONFIG_SND_CTL_FAST_LOOKUP */
+
 enum snd_ctl_add_mode {
 	CTL_ADD_EXCLUSIVE, CTL_REPLACE, CTL_ADD_ON_REPLACE,
 };
@@ -408,6 +495,8 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	kcontrol->id.numid = card->last_numid + 1;
 	card->last_numid += kcontrol->count;
 
+	add_hash_entries(card, kcontrol);
+
 	for (idx = 0; idx < kcontrol->count; idx++)
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_ADD, kcontrol, idx);
 
@@ -479,6 +568,26 @@ int snd_ctl_replace(struct snd_card *card, struct snd_kcontrol *kcontrol,
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
@@ -492,16 +601,7 @@ EXPORT_SYMBOL(snd_ctl_replace);
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
 
@@ -642,14 +742,30 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
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
 EXPORT_SYMBOL(snd_ctl_rename_id);
 
+#ifndef CONFIG_SND_CTL_FAST_LOOKUP
+static struct snd_kcontrol *
+snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
+{
+	struct snd_kcontrol *kctl;
+
+	list_for_each_entry(kctl, &card->controls, list) {
+		if (kctl->id.numid <= numid && kctl->id.numid + kctl->count > numid)
+			return kctl;
+	}
+	return NULL;
+}
+#endif /* !CONFIG_SND_CTL_FAST_LOOKUP */
+
 /**
  * snd_ctl_find_numid - find the control instance with the given number-id
  * @card: the card instance
@@ -665,15 +781,13 @@ EXPORT_SYMBOL(snd_ctl_rename_id);
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
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	return xa_load(&card->ctl_numids, numid);
+#else
+	return snd_ctl_find_numid_slow(card, numid);
+#endif
 }
 EXPORT_SYMBOL(snd_ctl_find_numid);
 
@@ -699,21 +813,18 @@ struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
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
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	kctl = xa_load(&card->ctl_hash, get_ctl_id_hash(id));
+	if (kctl && elem_id_matches(kctl, id))
 		return kctl;
-	}
+	if (!card->ctl_hash_collision)
+		return NULL; /* we can rely on only hash table */
+#endif
+	/* no matching in hash table - try all as the last resort */
+	list_for_each_entry(kctl, &card->controls, list)
+		if (elem_id_matches(kctl, id))
+			return kctl;
+
 	return NULL;
 }
 EXPORT_SYMBOL(snd_ctl_find_id);
@@ -2195,8 +2306,13 @@ static int snd_ctl_dev_free(struct snd_device *device)
 	down_write(&card->controls_rwsem);
 	while (!list_empty(&card->controls)) {
 		control = snd_kcontrol(card->controls.next);
-		snd_ctl_remove(card, control);
+		__snd_ctl_remove(card, control, false);
 	}
+
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	xa_destroy(&card->ctl_numids);
+	xa_destroy(&card->ctl_hash);
+#endif
 	up_write(&card->controls_rwsem);
 	put_device(&card->ctl_dev);
 	return 0;
diff --git a/sound/core/init.c b/sound/core/init.c
index 726a8353201f..1870aee7b64f 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -310,6 +310,10 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	rwlock_init(&card->ctl_files_rwlock);
 	INIT_LIST_HEAD(&card->controls);
 	INIT_LIST_HEAD(&card->ctl_files);
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	xa_init(&card->ctl_numids);
+	xa_init(&card->ctl_hash);
+#endif
 	spin_lock_init(&card->files_lock);
 	INIT_LIST_HEAD(&card->files_list);
 	mutex_init(&card->memory_mutex);
-- 
2.35.3

