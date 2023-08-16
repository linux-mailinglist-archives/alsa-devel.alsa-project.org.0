Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D059077E5F6
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:04:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44FD83B;
	Wed, 16 Aug 2023 18:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44FD83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201894;
	bh=2oY2EvGNFVfMvXBPDNEOnCx7UcXe6sbmA3Oi188+3Lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LYRbwx5yVXKP6TP4HWW8d2hQRfvlmfAUs1eyPS2oW2bSYPwJd3UanTqo2dglJNIKx
	 f6R4LhLVCkLnMB5WFgBWYp6fiEly9cZj4QbMnCv4Wkc6Cni6kYduiv7HAN+ak/PxtX
	 Np7PpgQxGzR+OS8crzbGq89YBCU3oqZ/4FzCLBFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E5AF8057A; Wed, 16 Aug 2023 18:03:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0FF7F8055C;
	Wed, 16 Aug 2023 18:03:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16812F80571; Wed, 16 Aug 2023 18:03:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EFC9F8016A
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EFC9F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JvklwM1i;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zuzSA1/l
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B5AA21889;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfyJ5Is//7uc8Mi6ii436xNwcPaQvKwSGrJ1SCUxrAE=;
	b=JvklwM1iK0YoaZQsXrKeuwriKBbb1JLQgFR9uDkJ0PzF3VNnafIqK+DlDl//o7yWZ30iKV
	6H6kkc55Y9rxIaPdtFMGWqKBE1z7JMPaynBwaqMDrojMSe7RFUVLBk885xUX9sLE2Bv0h8
	79xMFDVIdN9wMrqFUeNEEgLr2y1A4sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfyJ5Is//7uc8Mi6ii436xNwcPaQvKwSGrJ1SCUxrAE=;
	b=zuzSA1/l+zkTL+wzufxg77rVQCF8ehjj7NrYMWIS71aBlh6ipBm8jbNZg3k9pcNa0709Y6
	WiZcwP4nX5Jo7mDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65A17139F8;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IA3jFy/z3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 3/9] ALSA: pcm: Don't embed device
Date: Wed, 16 Aug 2023 18:02:46 +0200
Message-Id: <20230816160252.23396-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ML6ZH23D3PXRODMFNT7BPAC23FNVVHRJ
X-Message-ID-Hash: ML6ZH23D3PXRODMFNT7BPAC23FNVVHRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ML6ZH23D3PXRODMFNT7BPAC23FNVVHRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

So far we use the embedded struct device for each PCM substreams in
struct snd_pcm.  This may result in UAF when the delayed kobj release
is used; each corresponding struct device is still accessed at the
(delayed) device release, while the snd_pcm object may be already
gone.

As a workaround, detach the struct device from the snd_pcm object by
allocating via the new snd_device_alloc() helper.

A caveat is that we store the PCM substream pointer to drvdata since
the device resume and others require the access to it.

This patch is based on the fix Curtis posted initially.  In this
patch, the changes are split and use the new helper function instead.

Link: https://lore.kernel.org/r/20230801171928.1460120-1-cujomalainey@chromium.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h             |  2 +-
 sound/aoa/soundbus/i2sbus/pcm.c |  4 ++--
 sound/core/pcm.c                | 22 +++++++++++++---------
 sound/usb/media.c               |  2 +-
 4 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 19f564606ac4..0243a13e9ac4 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -510,7 +510,7 @@ struct snd_pcm_str {
 #endif
 #endif
 	struct snd_kcontrol *chmap_kctl; /* channel-mapping controls */
-	struct device dev;
+	struct device *dev;
 };
 
 struct snd_pcm {
diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index a9e502a6cdeb..3680eb6eabc9 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -972,7 +972,7 @@ i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
 			goto out_put_ci_module;
 		snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				&i2sbus_playback_ops);
-		dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].dev.parent =
+		dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]->dev.parent =
 			&dev->ofdev.dev;
 		i2sdev->out.created = 1;
 	}
@@ -989,7 +989,7 @@ i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
 			goto out_put_ci_module;
 		snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_CAPTURE,
 				&i2sbus_record_ops);
-		dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE].dev.parent =
+		dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE]->dev.parent =
 			&dev->ofdev.dev;
 		i2sdev->in.created = 1;
 	}
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9d95e3731123..317a25b68159 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -604,7 +604,7 @@ static const struct attribute_group *pcm_dev_attr_groups[];
 #ifdef CONFIG_PM_SLEEP
 static int do_pcm_suspend(struct device *dev)
 {
-	struct snd_pcm_str *pstr = container_of(dev, struct snd_pcm_str, dev);
+	struct snd_pcm_str *pstr = dev_get_drvdata(dev);
 
 	if (!pstr->pcm->no_device_suspend)
 		snd_pcm_suspend_all(pstr->pcm);
@@ -650,11 +650,14 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 	if (!substream_count)
 		return 0;
 
-	snd_device_initialize(&pstr->dev, pcm->card);
-	pstr->dev.groups = pcm_dev_attr_groups;
-	pstr->dev.type = &pcm_dev_type;
-	dev_set_name(&pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
+	err = snd_device_alloc(&pstr->dev, pcm->card);
+	if (err < 0)
+		return err;
+	dev_set_name(pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
 		     stream == SNDRV_PCM_STREAM_PLAYBACK ? 'p' : 'c');
+	pstr->dev->groups = pcm_dev_attr_groups;
+	pstr->dev->type = &pcm_dev_type;
+	dev_set_drvdata(pstr->dev, pstr);
 
 	if (!pcm->internal) {
 		err = snd_pcm_stream_proc_init(pstr);
@@ -847,7 +850,7 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 #endif
 	free_chmap(pstr);
 	if (pstr->substream_count)
-		put_device(&pstr->dev);
+		put_device(pstr->dev);
 }
 
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
@@ -1017,7 +1020,7 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 static ssize_t pcm_class_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-	struct snd_pcm_str *pstr = container_of(dev, struct snd_pcm_str, dev);
+	struct snd_pcm_str *pstr = dev_get_drvdata(dev);
 	struct snd_pcm *pcm = pstr->pcm;
 	const char *str;
 	static const char *strs[SNDRV_PCM_CLASS_LAST + 1] = {
@@ -1078,7 +1081,7 @@ static int snd_pcm_dev_register(struct snd_device *device)
 		/* register pcm */
 		err = snd_register_device(devtype, pcm->card, pcm->device,
 					  &snd_pcm_f_ops[cidx], pcm,
-					  &pcm->streams[cidx].dev);
+					  pcm->streams[cidx].dev);
 		if (err < 0) {
 			list_del_init(&pcm->list);
 			goto unlock;
@@ -1125,7 +1128,8 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	pcm_call_notify(pcm, n_disconnect);
 	for (cidx = 0; cidx < 2; cidx++) {
-		snd_unregister_device(&pcm->streams[cidx].dev);
+		if (pcm->streams[cidx].dev)
+			snd_unregister_device(pcm->streams[cidx].dev);
 		free_chmap(&pcm->streams[cidx]);
 	}
 	mutex_unlock(&pcm->open_mutex);
diff --git a/sound/usb/media.c b/sound/usb/media.c
index 6d11fedb4632..d48db6f3ae65 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -35,7 +35,7 @@ int snd_media_stream_init(struct snd_usb_substream *subs, struct snd_pcm *pcm,
 {
 	struct media_device *mdev;
 	struct media_ctl *mctl;
-	struct device *pcm_dev = &pcm->streams[stream].dev;
+	struct device *pcm_dev = pcm->streams[stream].dev;
 	u32 intf_type;
 	int ret = 0;
 	u16 mixer_pad;
-- 
2.35.3

