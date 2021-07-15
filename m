Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB13C9A14
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD0F169B;
	Thu, 15 Jul 2021 10:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD0F169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336208;
	bh=5tTHYYQ5v3MBBQitDlfw8tM+z5RB/PxEsu0/G4osaW8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MK/R3CuPeAT6likoK8UYe/3bgLI+5T8KxWzPlIaCpk3epuILx7aG6LBboQn/R1AYi
	 sGfCMUtYkdBwiTyMmGxE42Bgsq2eUMSChNNyEl9mQTefav54WVEERYZqlhIXGFWhvW
	 p6nTXZ04xlwuibVpf7/1Opp2MWrUbbx8scpTTEOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8731BF80544;
	Thu, 15 Jul 2021 10:00:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1325EF80240; Thu, 15 Jul 2021 10:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0550AF8020C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0550AF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yUg90BZa"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="DG2F/NfK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 545FB2284E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vklpQFKwIuhfxYLlJB9POJCv52g3xNBgveJ+77rJc90=;
 b=yUg90BZaTeus9YqP1rD58Vsj3Az1HukeYES0+tbxIUb3ZRcwJoSl5Y2D9TQgZ0XoPXJ3ju
 vkwRFTKAs4iiqLn2UOesBY9wvfVh//keWtAF3HYb+vFwt8D606GhpTob5+joj62sLTOcWS
 mheSVu0aKluYiIl9aRj7d8kKvaab+1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vklpQFKwIuhfxYLlJB9POJCv52g3xNBgveJ+77rJc90=;
 b=DG2F/NfKIw2gsrY8MwtqfqN1TcW7CShz++iINOHpn9dWcw1XtUAr44ZBC4IHAo8v6Ptni3
 HvuKdbQLJKtKuCCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 413E8A3B8F;
 Thu, 15 Jul 2021 07:59:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/79] ALSA: core: Add managed card creation
Date: Thu, 15 Jul 2021 09:58:24 +0200
Message-Id: <20210715075941.23332-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

As a second step for preliminary to widen the devres usages among
sound drivers, this patch adds a new ALSA core API function,
snd_devm_card_new(), to create a snd_card object via devres.
When a card object is created by this new function, snd_card_free() is
called automatically and the card object resource gets released at the
device unbinding time.

However, the story isn't that simple.  A caveat is that we have to
call snd_card_free() at the very first of the whole resource release
procedure, in order to assure that the all exposed devices on
user-space are deleted and sync with processes accessing those devices
before releasing resources.

For achieving it, snd_card_register() adds a new devres action to
trigger snd_card_free() automatically when the given card object is a
"managed" one.  Since usually snd_card_register() is the last step of
the initialization, this should work in most cases.

With all these tricks, some drivers can get rid of the whole driver
remove callback code.

About a bit of implementation details: the patch adds two new flags to
snd_card object: managed and releasing.  The former indicates that the
object was created via snd_devm_card_new(), and the latter is used for
avoiding the double-free of snd_card_free() calls.  Both flags are
fairly internal and likely uninteresting to normal users.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  5 +++
 sound/core/init.c    | 99 ++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 96 insertions(+), 8 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index c4ade121727d..7885f903cd5a 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -117,6 +117,8 @@ struct snd_card {
 	struct device card_dev;		/* cardX object for sysfs */
 	const struct attribute_group *dev_groups[4]; /* assigned sysfs attr */
 	bool registered;		/* card_dev is registered? */
+	bool managed;			/* managed via devres */
+	bool releasing;			/* during card free process */
 	int sync_irq;			/* assigned irq, used for PCM sync */
 	wait_queue_head_t remove_sleep;
 
@@ -274,6 +276,9 @@ extern int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int cmd);
 int snd_card_new(struct device *parent, int idx, const char *xid,
 		 struct module *module, int extra_size,
 		 struct snd_card **card_ret);
+int snd_devm_card_new(struct device *parent, int idx, const char *xid,
+		      struct module *module, size_t extra_size,
+		      struct snd_card **card_ret);
 
 int snd_card_disconnect(struct snd_card *card);
 void snd_card_disconnect_sync(struct snd_card *card);
diff --git a/sound/core/init.c b/sound/core/init.c
index 1490568efdb0..e985185ebc91 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -134,6 +134,9 @@ void snd_device_initialize(struct device *dev, struct snd_card *card)
 }
 EXPORT_SYMBOL_GPL(snd_device_initialize);
 
+static int snd_card_init(struct snd_card *card, struct device *parent,
+			 int idx, const char *xid, struct module *module,
+			 size_t extra_size);
 static int snd_card_do_free(struct snd_card *card);
 static const struct attribute_group card_dev_attr_group;
 
@@ -163,9 +166,6 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 {
 	struct snd_card *card;
 	int err;
-#ifdef CONFIG_SND_DEBUG
-	char name[8];
-#endif
 
 	if (snd_BUG_ON(!card_ret))
 		return -EINVAL;
@@ -176,6 +176,74 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	card = kzalloc(sizeof(*card) + extra_size, GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
+
+	err = snd_card_init(card, parent, idx, xid, module, extra_size);
+	if (err < 0) {
+		kfree(card);
+		return err;
+	}
+
+	*card_ret = card;
+	return 0;
+}
+EXPORT_SYMBOL(snd_card_new);
+
+static void __snd_card_release(struct device *dev, void *data)
+{
+	snd_card_free(data);
+}
+
+/**
+ * snd_devm_card_new - managed snd_card object creation
+ * @parent: the parent device object
+ * @idx: card index (address) [0 ... (SNDRV_CARDS-1)]
+ * @xid: card identification (ASCII string)
+ * @module: top level module for locking
+ * @extra_size: allocate this extra size after the main soundcard structure
+ * @card_ret: the pointer to store the created card instance
+ *
+ * This function works like snd_card_new() but manages the allocated resource
+ * via devres, i.e. you don't need to free explicitly.
+ *
+ * When a snd_card object is created with this function and registered via
+ * snd_card_register(), the very first devres action to call snd_card_free()
+ * is added automatically.  In that way, the resource disconnection is assured
+ * at first, then released in the expected order.
+ */
+int snd_devm_card_new(struct device *parent, int idx, const char *xid,
+		      struct module *module, size_t extra_size,
+		      struct snd_card **card_ret)
+{
+	struct snd_card *card;
+	int err;
+
+	*card_ret = NULL;
+	card = devres_alloc(__snd_card_release, sizeof(*card) + extra_size,
+			    GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+	card->managed = true;
+	err = snd_card_init(card, parent, idx, xid, module, extra_size);
+	if (err < 0) {
+		devres_free(card);
+		return err;
+	}
+
+	devres_add(parent, card);
+	*card_ret = card;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_devm_card_new);
+
+static int snd_card_init(struct snd_card *card, struct device *parent,
+			 int idx, const char *xid, struct module *module,
+			 size_t extra_size)
+{
+	int err;
+#ifdef CONFIG_SND_DEBUG
+	char name[8];
+#endif
+
 	if (extra_size > 0)
 		card->private_data = (char *)card + sizeof(struct snd_card);
 	if (xid)
@@ -197,7 +265,6 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 		mutex_unlock(&snd_card_mutex);
 		dev_err(parent, "cannot find the slot for index %d (range 0-%i), error: %d\n",
 			 idx, snd_ecards_limit - 1, err);
-		kfree(card);
 		return err;
 	}
 	set_bit(idx, snd_cards_lock);		/* lock it */
@@ -256,8 +323,6 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	sprintf(name, "card%d", idx);
 	card->debugfs_root = debugfs_create_dir(name, sound_debugfs_root);
 #endif
-
-	*card_ret = card;
 	return 0;
 
       __error_ctl:
@@ -266,7 +331,6 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	put_device(&card->card_dev);
   	return err;
 }
-EXPORT_SYMBOL(snd_card_new);
 
 /**
  * snd_card_ref - Get the card object from the index
@@ -481,6 +545,7 @@ EXPORT_SYMBOL_GPL(snd_card_disconnect_sync);
 
 static int snd_card_do_free(struct snd_card *card)
 {
+	card->releasing = true;
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
 	if (snd_mixer_oss_notify_callback)
 		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
@@ -498,7 +563,8 @@ static int snd_card_do_free(struct snd_card *card)
 #endif
 	if (card->release_completion)
 		complete(card->release_completion);
-	kfree(card);
+	if (!card->managed)
+		kfree(card);
 	return 0;
 }
 
@@ -745,6 +811,14 @@ int snd_card_add_dev_attr(struct snd_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_card_add_dev_attr);
 
+static void trigger_card_free(void *data)
+{
+	struct snd_card *card = data;
+
+	if (!card->releasing)
+		snd_card_free(data);
+}
+
 /**
  *  snd_card_register - register the soundcard
  *  @card: soundcard structure
@@ -768,6 +842,15 @@ int snd_card_register(struct snd_card *card)
 		if (err < 0)
 			return err;
 		card->registered = true;
+	} else {
+		if (card->managed)
+			devm_remove_action(card->dev, trigger_card_free, card);
+	}
+
+	if (card->managed) {
+		err = devm_add_action(card->dev, trigger_card_free, card);
+		if (err < 0)
+			return err;
 	}
 
 	err = snd_device_register_all(card);
-- 
2.26.2

