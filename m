Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F777E5F7
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A806F84C;
	Wed, 16 Aug 2023 18:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A806F84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201916;
	bh=IQ4qOf8uZ3JR8CpxsrEi6kzaQ6yDa1gco+58dFsqBQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PAjJdZxHmSL9I5l8qLTpBQbr4xdD9ylD/QbM1dAZrBDlSMSRDD4+zMw2wqBO60prM
	 EGDdaEtmurTq+ULiC/4WZW8kqMEtIDAYgXMbkKxn/zd1nh3iq64Api9BZVMdm5m7Wa
	 DHsxFCMGdibjdTM/SWPjjm9UhsCvv5OnRwn6f73I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35E05F8057F; Wed, 16 Aug 2023 18:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E536F8057E;
	Wed, 16 Aug 2023 18:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB69F80567; Wed, 16 Aug 2023 18:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C3D7F80254
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C3D7F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=z9CsTj/g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CxtEU9ex
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC8E321890;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uvkjQlv5XdKAnae/lzMDYSQYG/vfJd2EoK2s4BCYmA=;
	b=z9CsTj/gM3n3ysrVaqfTYN0RNuY4+rNJgT1+G1e2UjR9XsB/dRldTTUQzVOm5Hf3rjK39S
	4nja0PR6DnNBI/XC9gWYOuQ6S33OA+N7HdJNDIdewMfAuA5QEhIwUB+391b1hVntMkzfAX
	koE0jBPG1nzF9E43eRjxx8NSIWMgXE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uvkjQlv5XdKAnae/lzMDYSQYG/vfJd2EoK2s4BCYmA=;
	b=CxtEU9exSEg7HtuBb2gYwdtFN/0UMxnehy3jSOGrkejnRtnUzbB+nmT238EmEeiv2T2ETv
	2XmfBT6wH7abt6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B207C139F8;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YKawKi/z3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 5/9] ALSA: rawmidi: Don't embed device
Date: Wed, 16 Aug 2023 18:02:48 +0200
Message-Id: <20230816160252.23396-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BMHGUSXSWIOH6JVOL4M34LICKZ7SEKOZ
X-Message-ID-Hash: BMHGUSXSWIOH6JVOL4M34LICKZ7SEKOZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMHGUSXSWIOH6JVOL4M34LICKZ7SEKOZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch detaches the struct device from the snd_rawmidi object by
allocating via snd_device_alloc(), just like done for other devices.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h |  2 +-
 sound/core/rawmidi.c    | 29 +++++++++++++----------------
 sound/core/ump.c        |  8 ++++----
 3 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index b0197b1d1fe4..f31cabf0158c 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -135,7 +135,7 @@ struct snd_rawmidi {
 	struct mutex open_mutex;
 	wait_queue_head_t open_wait;
 
-	struct device dev;
+	struct device *dev;
 
 	struct snd_info_entry *proc_entry;
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 2d3cec908154..ba06484ac4aa 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -44,11 +44,11 @@ static LIST_HEAD(snd_rawmidi_devices);
 static DEFINE_MUTEX(register_mutex);
 
 #define rmidi_err(rmidi, fmt, args...) \
-	dev_err(&(rmidi)->dev, fmt, ##args)
+	dev_err((rmidi)->dev, fmt, ##args)
 #define rmidi_warn(rmidi, fmt, args...) \
-	dev_warn(&(rmidi)->dev, fmt, ##args)
+	dev_warn((rmidi)->dev, fmt, ##args)
 #define rmidi_dbg(rmidi, fmt, args...) \
-	dev_dbg(&(rmidi)->dev, fmt, ##args)
+	dev_dbg((rmidi)->dev, fmt, ##args)
 
 struct snd_rawmidi_status32 {
 	s32 stream;
@@ -1877,11 +1877,6 @@ static int snd_rawmidi_alloc_substreams(struct snd_rawmidi *rmidi,
 	return 0;
 }
 
-static void release_rawmidi_device(struct device *dev)
-{
-	kfree(container_of(dev, struct snd_rawmidi, dev));
-}
-
 /* used for both rawmidi and ump */
 int snd_rawmidi_init(struct snd_rawmidi *rmidi,
 		     struct snd_card *card, char *id, int device,
@@ -1906,12 +1901,13 @@ int snd_rawmidi_init(struct snd_rawmidi *rmidi,
 	if (id != NULL)
 		strscpy(rmidi->id, id, sizeof(rmidi->id));
 
-	snd_device_initialize(&rmidi->dev, card);
-	rmidi->dev.release = release_rawmidi_device;
+	err = snd_device_alloc(&rmidi->dev, card);
+	if (err < 0)
+		return err;
 	if (rawmidi_is_ump(rmidi))
-		dev_set_name(&rmidi->dev, "umpC%iD%i", card->number, device);
+		dev_set_name(rmidi->dev, "umpC%iD%i", card->number, device);
 	else
-		dev_set_name(&rmidi->dev, "midiC%iD%i", card->number, device);
+		dev_set_name(rmidi->dev, "midiC%iD%i", card->number, device);
 
 	err = snd_rawmidi_alloc_substreams(rmidi,
 					   &rmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT],
@@ -1996,7 +1992,8 @@ int snd_rawmidi_free(struct snd_rawmidi *rmidi)
 	snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT]);
 	if (rmidi->private_free)
 		rmidi->private_free(rmidi);
-	put_device(&rmidi->dev);
+	put_device(rmidi->dev);
+	kfree(rmidi);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_rawmidi_free);
@@ -2038,7 +2035,7 @@ static int snd_rawmidi_dev_register(struct snd_device *device)
 
 	err = snd_register_device(SNDRV_DEVICE_TYPE_RAWMIDI,
 				  rmidi->card, rmidi->device,
-				  &snd_rawmidi_f_ops, rmidi, &rmidi->dev);
+				  &snd_rawmidi_f_ops, rmidi, rmidi->dev);
 	if (err < 0) {
 		rmidi_err(rmidi, "unable to register\n");
 		goto error;
@@ -2103,7 +2100,7 @@ static int snd_rawmidi_dev_register(struct snd_device *device)
 	return 0;
 
  error_unregister:
-	snd_unregister_device(&rmidi->dev);
+	snd_unregister_device(rmidi->dev);
  error:
 	mutex_lock(&register_mutex);
 	list_del(&rmidi->list);
@@ -2142,7 +2139,7 @@ static int snd_rawmidi_dev_disconnect(struct snd_device *device)
 		rmidi->ossreg = 0;
 	}
 #endif /* CONFIG_SND_OSSEMUL */
-	snd_unregister_device(&rmidi->dev);
+	snd_unregister_device(rmidi->dev);
 	mutex_unlock(&rmidi->open_mutex);
 	mutex_unlock(&register_mutex);
 	return 0;
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 246348766ec1..fbe2892e72fd 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -13,10 +13,10 @@
 #include <sound/ump.h>
 #include <sound/ump_convert.h>
 
-#define ump_err(ump, fmt, args...)	dev_err(&(ump)->core.dev, fmt, ##args)
-#define ump_warn(ump, fmt, args...)	dev_warn(&(ump)->core.dev, fmt, ##args)
-#define ump_info(ump, fmt, args...)	dev_info(&(ump)->core.dev, fmt, ##args)
-#define ump_dbg(ump, fmt, args...)	dev_dbg(&(ump)->core.dev, fmt, ##args)
+#define ump_err(ump, fmt, args...)	dev_err((ump)->core.dev, fmt, ##args)
+#define ump_warn(ump, fmt, args...)	dev_warn((ump)->core.dev, fmt, ##args)
+#define ump_info(ump, fmt, args...)	dev_info((ump)->core.dev, fmt, ##args)
+#define ump_dbg(ump, fmt, args...)	dev_dbg((ump)->core.dev, fmt, ##args)
 
 static int snd_ump_dev_register(struct snd_rawmidi *rmidi);
 static int snd_ump_dev_unregister(struct snd_rawmidi *rmidi);
-- 
2.35.3

