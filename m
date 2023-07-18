Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65117757F2E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:15:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5EC851;
	Tue, 18 Jul 2023 16:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5EC851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689741;
	bh=SbMgOKp/Dtk3OU3upvxhl1FQGNla/w5yOt+xhBf0LM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CI7WSQ1Ce1VuxidrggBLJb0ExHgFCFF1uRKPDuFnrwUZKk7Lm+FEIEOoqTisQsjly
	 LKXTx4fUbt9pApkRdLVq6IfCOED7BPt7ZUic2WESXA5QPLdFYVGeeTh58AqxFJ1WYB
	 x+3PSlMAqEiiIuitqWZqPFkGUr23MfApMKIhMVEY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0C33F805C0; Tue, 18 Jul 2023 16:13:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E73B5F805B3;
	Tue, 18 Jul 2023 16:13:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B933EF80527; Tue, 18 Jul 2023 16:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D54F3F80552
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D54F3F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CRnIYMug;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mpjDyG0U
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D5A821921;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BM/vb7fAL/Hn07pLPymOKUcn4k96qSSJvPcodZlHYmA=;
	b=CRnIYMug2b07stZhdcYnCF7OHcKOF7ataf/3dF0nhSmbWgKdsc8xyp1FU8whaC867uJiXi
	mlj6HwdJQ3EFM4k7MqMUL+bCg9PImguvhHIaJ6IGM+D09IrkNkjMAjHYTQIjI69lj07cHl
	GXvZEBmkA4qSwSM4eUgnK6LRIozJsGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BM/vb7fAL/Hn07pLPymOKUcn4k96qSSJvPcodZlHYmA=;
	b=mpjDyG0U/q1v9HqiA6WfaRFtYhqPRjrABdZEEDk50nm94uZTN/H7tU0EVF6/62wpDyIk4y
	igUZEArwjqfPFdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD2FD138EC;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8NM8MfudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org
Subject: [PATCH 07/11] staging: greybus: Avoid abusing controls_rwsem
Date: Tue, 18 Jul 2023 16:13:00 +0200
Message-Id: <20230718141304.1032-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 54ASDGW5AXPMFIV7SIJSWXC47REFGBCS
X-Message-ID-Hash: 54ASDGW5AXPMFIV7SIJSWXC47REFGBCS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54ASDGW5AXPMFIV7SIJSWXC47REFGBCS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The controls_rwsem of snd_card object is rather an internal lock, and
not really meant to be used by others for its data protection.

This patch addresses it by replacing the controls_rwsem usages with
the own (new) mutex.

Note that the up_write() and down_write() calls around
gbaudio_remove_component_controls() are simply dropped without
replacement.  These temporary up/down were a workaround since
gbaudio_remove_component_controls() itself took the rwsem.  Now it was
also gone, we can clean up the workaround, too.

Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/staging/greybus/audio_codec.c | 18 +++++++-----------
 drivers/staging/greybus/audio_codec.h |  1 +
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 72ace74ea605..2f05e761fb9a 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -807,7 +807,6 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 {
 	int ret;
 	struct snd_soc_component *comp;
-	struct snd_card *card;
 	struct gbaudio_jack *jack = NULL;
 
 	if (!gbcodec) {
@@ -816,21 +815,20 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 	}
 
 	comp = gbcodec->component;
-	card = comp->card->snd_card;
 
-	down_write(&card->controls_rwsem);
+	mutex_lock(&gbcodec->register_mutex);
 
 	if (module->num_dais) {
 		dev_err(gbcodec->dev,
 			"%d:DAIs not supported via gbcodec driver\n",
 			module->num_dais);
-		up_write(&card->controls_rwsem);
+		mutex_unlock(&gbcodec->register_mutex);
 		return -EINVAL;
 	}
 
 	ret = gbaudio_init_jack(module, comp->card);
 	if (ret) {
-		up_write(&card->controls_rwsem);
+		mutex_unlock(&gbcodec->register_mutex);
 		return ret;
 	}
 
@@ -867,7 +865,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 		ret = snd_soc_dapm_new_widgets(comp->card);
 	dev_dbg(comp->dev, "Registered %s module\n", module->name);
 
-	up_write(&card->controls_rwsem);
+	mutex_unlock(&gbcodec->register_mutex);
 	return ret;
 }
 EXPORT_SYMBOL(gbaudio_register_module);
@@ -935,13 +933,12 @@ static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
 void gbaudio_unregister_module(struct gbaudio_module_info *module)
 {
 	struct snd_soc_component *comp = gbcodec->component;
-	struct snd_card *card = comp->card->snd_card;
 	struct gbaudio_jack *jack, *n;
 	int mask;
 
 	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
 
-	down_write(&card->controls_rwsem);
+	mutex_lock(&gbcodec->register_mutex);
 	mutex_lock(&gbcodec->lock);
 	gbaudio_codec_cleanup(module);
 	list_del(&module->list);
@@ -978,10 +975,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 		dev_dbg(comp->dev, "Removing %d controls\n",
 			module->num_controls);
 		/* release control semaphore */
-		up_write(&card->controls_rwsem);
 		gbaudio_remove_component_controls(comp, module->controls,
 						  module->num_controls);
-		down_write(&card->controls_rwsem);
 	}
 	if (module->dapm_widgets) {
 		dev_dbg(comp->dev, "Removing %d widgets\n",
@@ -992,7 +987,7 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 
 	dev_dbg(comp->dev, "Unregistered %s module\n", module->name);
 
-	up_write(&card->controls_rwsem);
+	mutex_unlock(&gbcodec->register_mutex);
 }
 EXPORT_SYMBOL(gbaudio_unregister_module);
 
@@ -1012,6 +1007,7 @@ static int gbcodec_probe(struct snd_soc_component *comp)
 	info->dev = comp->dev;
 	INIT_LIST_HEAD(&info->module_list);
 	mutex_init(&info->lock);
+	mutex_init(&info->register_mutex);
 	INIT_LIST_HEAD(&info->dai_list);
 
 	/* init dai_list used to maintain runtime stream info */
diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index ce15e800e607..f3f7a7ec6be4 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -71,6 +71,7 @@ struct gbaudio_codec_info {
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
 	struct mutex lock;
+	struct mutex register_mutex;
 };
 
 struct gbaudio_widget {
-- 
2.35.3

