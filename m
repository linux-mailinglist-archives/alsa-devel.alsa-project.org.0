Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCED53C8E0
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A181725;
	Fri,  3 Jun 2022 12:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A181725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654253016;
	bh=BoB6zoFO9Kml/TjNwzUQEyNzprqBhDLsY6s4co8znPs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C996VA4tMXrwhJBEeGtjWwgZycZKlh3QqRg4XX1ugD+ysXlP+T+9FnMAjTuKSQ5kq
	 95RqL1PjvTpJbfJedrTmFi49lbNhcSGFR5ItK0Tg63bL/hOw3uRFPwulRQEyc9FqDy
	 blTTbqLB1mb5JeMQl3by+9eKUBmeHf2T16nwyRnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66C77F800F5;
	Fri,  3 Jun 2022 12:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72AA0F804CC; Fri,  3 Jun 2022 12:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA372F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 12:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA372F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Qx2HB+zR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654252952; x=1685788952;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=FLz9wi+prSegD1xWRj5GCPmNEr/91rku7rnatUP2CFY=;
 b=Qx2HB+zRLPd9WwNRlJ2BSv8YzI5yMkzGxHMxc2kX+uodaZwBMJdw/jpn
 0acocUWPMCkcHUFoeTvQYLndmUiXAObYfOvcMZ7NT+tjvKelNfSJ9xRGI
 /kyY1FOmmWLyMydeJyTwsQL4Gz31OMtpuSJu4yMLNbsCakMzTv7fbAL+2 s=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 03 Jun 2022 03:42:28 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Jun 2022 03:42:27 -0700
X-QCInternal: smtphost
Received: from hu-rbankapu-blr.qualcomm.com (HELO
 hu-ub18template-blr.qualcomm.com) ([10.131.39.233])
 by ironmsg02-blr.qualcomm.com with ESMTP; 03 Jun 2022 16:12:18 +0530
Received: by hu-ub18template-blr.qualcomm.com (Postfix, from userid 4079802)
 id AAAC4802D96; Fri,  3 Jun 2022 16:12:17 +0530 (+0530)
From: Raghu Bankapur <quic_rbankapu@quicinc.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH V0 1/1] asoc: msm: use hashtable to check kcontrol
Date: Fri,  3 Jun 2022 16:12:11 +0530
Message-Id: <70b300567686462aa2a69ee4c7ebaad686a52640.1654252861.git.quic_rbankapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1654252861.git.quic_rbankapu@quicinc.com>
References: <cover.1654252861.git.quic_rbankapu@quicinc.com>
Cc: Krishna Jha <quic_kkishorj@quicinc.com>,
 Raghu Bankapur <quic_rbankapu@quicinc.com>
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

use hashtable instead of linear list to check kcontrol before
adding them for improving early audio KPI.
With this changes we see 600ms improvement in start of audio

Change-Id: I1a95d88ef41b48430b57307a0e6a8e82788b4372
Signed-off-by: Raghu Bankapur <quic_rbankapu@quicinc.com>
---
 include/sound/control.h |   2 +
 include/sound/core.h    |   5 +-
 sound/core/control.c    | 106 +++++++++++++++++++++++-----------------
 sound/core/init.c       |   1 +
 4 files changed, 68 insertions(+), 46 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 985c51a8fb74..e50db5c45114 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -70,6 +70,8 @@ struct snd_kcontrol_volatile {
 struct snd_kcontrol {
 	struct list_head list;		/* list of controls */
 	struct snd_ctl_elem_id id;
+	struct hlist_node hnode;
+	unsigned int knametoint;	/* kctl name to uint, hash key value */
 	unsigned int count;		/* count of same elements */
 	snd_kcontrol_info_t *info;
 	snd_kcontrol_get_t *get;
diff --git a/include/sound/core.h b/include/sound/core.h
index b7e9b58d3c78..90341d6f1573 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -14,6 +14,7 @@
 #include <linux/pm.h>			/* pm_message_t */
 #include <linux/stringify.h>
 #include <linux/printk.h>
+#include <linux/hashtable.h>
 
 /* number of supported soundcards */
 #ifdef CONFIG_SND_DYNAMIC_MINORS
@@ -24,6 +25,8 @@
 
 #define CONFIG_SND_MAJOR	116	/* standard configuration */
 
+#define SND_CTL_HASH_TABLE_BITS 14	/* buckets numbers: 1 << 14 */
+
 /* forward declarations */
 struct pci_dev;
 struct module;
@@ -103,7 +106,7 @@ struct snd_card {
 	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
 	struct list_head controls;	/* all controls for this card */
 	struct list_head ctl_files;	/* active control files */
-
+	DECLARE_HASHTABLE(ctl_htable, SND_CTL_HASH_TABLE_BITS);
 	struct snd_info_entry *proc_root;	/* root for soundcard specific files */
 	struct proc_dir_entry *proc_root_link;	/* number link to real id */
 
diff --git a/sound/core/control.c b/sound/core/control.c
index a25c0d64d104..e00a02015837 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -331,43 +331,49 @@ void snd_ctl_free_one(struct snd_kcontrol *kcontrol)
 }
 EXPORT_SYMBOL(snd_ctl_free_one);
 
-static bool snd_ctl_remove_numid_conflict(struct snd_card *card,
-					  unsigned int count)
+enum snd_ctl_add_mode {
+	CTL_ADD_EXCLUSIVE, CTL_REPLACE, CTL_ADD_ON_REPLACE,
+};
+
+char snd_ctl_string[50] = { '\0' };
+
+/* Used to convert the string into int value -- BKDRHash */
+static unsigned int snd_ctl_strtoint(const char *s)
 {
-	struct snd_kcontrol *kctl;
+	unsigned int res = 0;
 
-	/* Make sure that the ids assigned to the control do not wrap around */
-	if (card->last_numid >= UINT_MAX - count)
-		card->last_numid = 0;
+	while (*s)
+		res = (res << 5) - res + (*s++);
 
-	list_for_each_entry(kctl, &card->controls, list) {
-		if (kctl->id.numid < card->last_numid + 1 + count &&
-		    kctl->id.numid + kctl->count > card->last_numid + 1) {
-		    	card->last_numid = kctl->id.numid + kctl->count - 1;
-			return true;
-		}
-	}
-	return false;
+	return (res & 0x7FFFFFFF);
 }
 
-static int snd_ctl_find_hole(struct snd_card *card, unsigned int count)
+/**
+ * snd_ctl_hash_check - Check the duplicate enrty on snd hashtable
+ * @card: the card instance
+ * @nametoint: kctl name to uint
+ *
+ * Finds the control instance with the given nametoint from the card.
+ *
+ * Return: The pointer of the instance if found, or %NULL if not.
+ *
+ */
+static struct snd_kcontrol *snd_ctl_hash_check(struct snd_card *card,
+				 unsigned int nametoint)
 {
-	unsigned int iter = 100000;
+	struct snd_kcontrol *kctl = NULL;
 
-	while (snd_ctl_remove_numid_conflict(card, count)) {
-		if (--iter == 0) {
-			/* this situation is very unlikely */
-			dev_err(card->dev, "unable to allocate new control numid\n");
-			return -ENOMEM;
-		}
+	if (snd_BUG_ON(!card))
+		return NULL;
+
+	hash_for_each_possible(card->ctl_htable, kctl, hnode, nametoint) {
+		if (kctl->knametoint != nametoint)
+			continue;
+		return kctl;
 	}
-	return 0;
+	return NULL;
 }
 
-enum snd_ctl_add_mode {
-	CTL_ADD_EXCLUSIVE, CTL_REPLACE, CTL_ADD_ON_REPLACE,
-};
-
 /* add/replace a new kcontrol object; call with card->controls_rwsem locked */
 static int __snd_ctl_add_replace(struct snd_card *card,
 				 struct snd_kcontrol *kcontrol,
@@ -382,26 +388,34 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	if (id.index > UINT_MAX - kcontrol->count)
 		return -EINVAL;
 
-	old = snd_ctl_find_id(card, &id);
-	if (!old) {
-		if (mode == CTL_REPLACE)
-			return -EINVAL;
-	} else {
-		if (mode == CTL_ADD_EXCLUSIVE) {
-			dev_err(card->dev,
-				"control %i:%i:%i:%s:%i is already present\n",
-				id.iface, id.device, id.subdevice, id.name,
-				id.index);
-			return -EBUSY;
-		}
+	snprintf(snd_ctl_string, strlen(kcontrol->id.name) + 6, "%s%d%d%d",
+		kcontrol->id.name, kcontrol->id.iface, kcontrol->id.device,
+		kcontrol->id.subdevice);
 
-		err = snd_ctl_remove(card, old);
-		if (err < 0)
-			return err;
-	}
+	kcontrol->knametoint = snd_ctl_strtoint(snd_ctl_string);
+	if (kcontrol->knametoint < 0)
+		return -EINVAL;
 
-	if (snd_ctl_find_hole(card, kcontrol->count) < 0)
-		return -ENOMEM;
+	old = snd_ctl_hash_check(card, kcontrol->knametoint);
+	if (old) {
+		old = snd_ctl_find_id(card, &id);
+		if (!old) {
+			if (mode == CTL_REPLACE)
+				return -EINVAL;
+		} else {
+			if (mode == CTL_ADD_EXCLUSIVE) {
+				dev_err(card->dev,
+					"control %i:%i:%i:%s:%i is already present\n",
+					id.iface, id.device, id.subdevice, id.name,
+					id.index);
+				return -EBUSY;
+			}
+
+			err = snd_ctl_remove(card, old);
+			if (err < 0)
+				return err;
+		}
+	}
 
 	list_add_tail(&kcontrol->list, &card->controls);
 	card->controls_count += kcontrol->count;
@@ -411,6 +425,8 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	for (idx = 0; idx < kcontrol->count; idx++)
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_ADD, kcontrol, idx);
 
+	hash_add(card->ctl_htable, &kcontrol->hnode, kcontrol->knametoint);
+
 	return 0;
 }
 
diff --git a/sound/core/init.c b/sound/core/init.c
index 31ba7024e3ad..24138902e5f2 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -284,6 +284,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	INIT_LIST_HEAD(&card->ctl_files);
 	spin_lock_init(&card->files_lock);
 	INIT_LIST_HEAD(&card->files_list);
+	hash_init(card->ctl_htable);
 	mutex_init(&card->memory_mutex);
 #ifdef CONFIG_PM
 	init_waitqueue_head(&card->power_sleep);
-- 
2.17.1

