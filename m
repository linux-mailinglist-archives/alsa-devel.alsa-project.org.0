Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E7452B91
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 08:26:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFA6168E;
	Tue, 16 Nov 2021 08:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFA6168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637047589;
	bh=BUp8u6NV9PdNWLe+CeXdqTrah2G5aYQMAR4fRVAEaJk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RKjEPIFVIJcqo66ikQ6zsV0vO9K/5dJeew0Ei1CbaYv1m0HFfFB/UxbtXYTIrbvyM
	 vQL6EJ4wQgQJ0fYkVdbTLmiORyW2qzIo0KG2ovaq3zFc/1A/3HxA8QLaV/d/YQdXMC
	 tUrsgg1z+sPJaxdlhWBOxOuGhARCK0eWRkJgf3cM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71453F80089;
	Tue, 16 Nov 2021 08:25:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABB20F80272; Tue, 16 Nov 2021 08:25:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B59D2F800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 08:25:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B59D2F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1jVIu4Ep"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="XgQPm8vy"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 76A961FCA1
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 07:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637047500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EIXLqrbkOIvwCngI1dGwsgdc3L+08disgZ8Oz1YB5Bc=;
 b=1jVIu4EpkienCEdzVA9Qp5ouk5aCQXMe648CX8yjK8gr1Nb5YoOl5VOjSeP7DEoBpCP7lZ
 BV2bXi50noc9/LTiaPY98OplitU0XdTXtZSAPUyqU1zqYEQpipuYpDJ1c8UdPNUdcsrbza
 mUA8UsY4pPSWSGOfHqCb1FKxz/CF53g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637047500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EIXLqrbkOIvwCngI1dGwsgdc3L+08disgZ8Oz1YB5Bc=;
 b=XgQPm8vyUfj85GKyOlDXV3c8RDtFu/1//1H11ye/E5wavbLZNm0/Y5gB8W4utC/zq4P6zW
 tlCHBRNWNmo0k+AQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6FC6DA3B83;
 Tue, 16 Nov 2021 07:25:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Fix potential deadlock at codec unbinding
Date: Tue, 16 Nov 2021 08:24:59 +0100
Message-Id: <20211116072459.18930-1-tiwai@suse.de>
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

When a codec is unbound dynamically via sysfs while its stream is in
use, we may face a potential deadlock at the proc remove or a UAF.
This happens since the hda_pcm linked list, as it handles the hda_pcm
object release via kref.

When a PCM was opened at the unbinding time, the release of hda_pcm
gets delayed and it ends up with the close of the PCM stream releasing
the associated hda_pcm object of its own.  The hda_pcm destructor
contains the PCM device release that includes the removal of procfs
entries.  And, this removal has the sync of the close of all in-use
files -- which would never finish because it's called from the PCM
file descriptor itself, i.e. it's trying to shoot its foot.

For addressing the deadlock above, this patch changes the way to
manage and release the hda_pcm object.  The kref of hda_pcm is
dropped, and instead a simple refcount is introduced in hda_codec for
keeping the track of the active PCM streams, and at each PCM open and
close, this refcount is adjusted accordingly.  At unbinding, the
driver calls snd_device_disconnect() for each PCM stream, then
synchronizes with the refcount finish, and finally releases the object
resources.

Fixes: bbbc7e8502c9 ("ALSA: hda - Allocate hda_pcm objects dynamically")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h |  8 +++++---
 sound/pci/hda/hda_bind.c  |  5 +++++
 sound/pci/hda/hda_codec.c | 42 ++++++++++++++++++++++++---------------
 sound/pci/hda/hda_local.h |  1 +
 4 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 0e45963bb767..82d9daa17851 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -8,7 +8,7 @@
 #ifndef __SOUND_HDA_CODEC_H
 #define __SOUND_HDA_CODEC_H
 
-#include <linux/kref.h>
+#include <linux/refcount.h>
 #include <linux/mod_devicetable.h>
 #include <sound/info.h>
 #include <sound/control.h>
@@ -166,8 +166,8 @@ struct hda_pcm {
 	bool own_chmap;		/* codec driver provides own channel maps */
 	/* private: */
 	struct hda_codec *codec;
-	struct kref kref;
 	struct list_head list;
+	unsigned int disconnected:1;
 };
 
 /* codec information */
@@ -187,6 +187,8 @@ struct hda_codec {
 
 	/* PCM to create, set by patch_ops.build_pcms callback */
 	struct list_head pcm_list_head;
+	refcount_t pcm_ref;
+	wait_queue_head_t remove_sleep;
 
 	/* codec specific info */
 	void *spec;
@@ -420,7 +422,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
 static inline void snd_hda_codec_pcm_get(struct hda_pcm *pcm)
 {
-	kref_get(&pcm->kref);
+	refcount_inc(&pcm->codec->pcm_ref);
 }
 void snd_hda_codec_pcm_put(struct hda_pcm *pcm);
 
diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 1c8bffc3eec6..7153bd53e189 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -156,6 +156,11 @@ static int hda_codec_driver_remove(struct device *dev)
 		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
 	}
 
+	refcount_dec(&codec->pcm_ref);
+	snd_hda_codec_disconnect_pcms(codec);
+	wait_event(codec->remove_sleep, !refcount_read(&codec->pcm_ref));
+	snd_power_sync_ref(codec->bus->card);
+
 	if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
 	snd_hda_codec_cleanup_for_unbind(codec);
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index eda70814369b..7016b48227bf 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -703,20 +703,10 @@ get_hda_cvt_setup(struct hda_codec *codec, hda_nid_t nid)
 /*
  * PCM device
  */
-static void release_pcm(struct kref *kref)
-{
-	struct hda_pcm *pcm = container_of(kref, struct hda_pcm, kref);
-
-	if (pcm->pcm)
-		snd_device_free(pcm->codec->card, pcm->pcm);
-	clear_bit(pcm->device, pcm->codec->bus->pcm_dev_bits);
-	kfree(pcm->name);
-	kfree(pcm);
-}
-
 void snd_hda_codec_pcm_put(struct hda_pcm *pcm)
 {
-	kref_put(&pcm->kref, release_pcm);
+	if (refcount_dec_and_test(&pcm->codec->pcm_ref))
+		wake_up(&pcm->codec->remove_sleep);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_pcm_put);
 
@@ -731,7 +721,6 @@ struct hda_pcm *snd_hda_codec_pcm_new(struct hda_codec *codec,
 		return NULL;
 
 	pcm->codec = codec;
-	kref_init(&pcm->kref);
 	va_start(args, fmt);
 	pcm->name = kvasprintf(GFP_KERNEL, fmt, args);
 	va_end(args);
@@ -741,6 +730,7 @@ struct hda_pcm *snd_hda_codec_pcm_new(struct hda_codec *codec,
 	}
 
 	list_add_tail(&pcm->list, &codec->pcm_list_head);
+	refcount_inc(&codec->pcm_ref);
 	return pcm;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_pcm_new);
@@ -748,15 +738,31 @@ EXPORT_SYMBOL_GPL(snd_hda_codec_pcm_new);
 /*
  * codec destructor
  */
+void snd_hda_codec_disconnect_pcms(struct hda_codec *codec)
+{
+	struct hda_pcm *pcm;
+
+	list_for_each_entry(pcm, &codec->pcm_list_head, list) {
+		if (pcm->disconnected)
+			continue;
+		if (pcm->pcm)
+			snd_device_disconnect(codec->card, pcm->pcm);
+		snd_hda_codec_pcm_put(pcm);
+		pcm->disconnected = 1;
+	}
+}
+
 static void codec_release_pcms(struct hda_codec *codec)
 {
 	struct hda_pcm *pcm, *n;
 
 	list_for_each_entry_safe(pcm, n, &codec->pcm_list_head, list) {
-		list_del_init(&pcm->list);
+		list_del(&pcm->list);
 		if (pcm->pcm)
-			snd_device_disconnect(codec->card, pcm->pcm);
-		snd_hda_codec_pcm_put(pcm);
+			snd_device_free(pcm->codec->card, pcm->pcm);
+		clear_bit(pcm->device, pcm->codec->bus->pcm_dev_bits);
+		kfree(pcm->name);
+		kfree(pcm);
 	}
 }
 
@@ -769,6 +775,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 		codec->registered = 0;
 	}
 
+	snd_hda_codec_disconnect_pcms(codec);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
 	if (!codec->in_freeing)
 		snd_hda_ctls_clear(codec);
@@ -792,6 +799,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	remove_conn_list(codec);
 	snd_hdac_regmap_exit(&codec->core);
 	codec->configured = 0;
+	refcount_set(&codec->pcm_ref, 1); /* reset refcount */
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_cleanup_for_unbind);
 
@@ -958,6 +966,8 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
 	INIT_LIST_HEAD(&codec->conn_list);
 	INIT_LIST_HEAD(&codec->pcm_list_head);
+	refcount_set(&codec->pcm_ref, 1);
+	init_waitqueue_head(&codec->remove_sleep);
 
 	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
 	codec->depop_delay = -1;
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index ea8ab8b43337..4662a47add7e 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -137,6 +137,7 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 int snd_hda_codec_reset(struct hda_codec *codec);
 void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
+void snd_hda_codec_disconnect_pcms(struct hda_codec *codec);
 
 #define snd_hda_regmap_sync(codec)	snd_hdac_regmap_sync(&(codec)->core)
 
-- 
2.31.1

