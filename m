Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF517726B7
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:54:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8302785D;
	Mon,  7 Aug 2023 15:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8302785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416477;
	bh=RUFAT4WAzz9Iy8/CWg3K/H+kVUk5mLFxTI0IZWVm/Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OVoXZZr5EgGppenS3L/NNZCCIXZqeVbj2tKAZX8FBzzfbLSx0TvjAmfZ622aFEJlV
	 IiEM3gWg6yt9c+ua47KOOuI1px441xVdNTP2S14q1zNFfJ2dYNGt5w+ZFJiCKd9ewL
	 9XY+y2x9w+t9sb2xxui537WjIfNyB8ewbJ5XkweE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A416FF805B0; Mon,  7 Aug 2023 15:52:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 388D2F805AB;
	Mon,  7 Aug 2023 15:52:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF175F80579; Mon,  7 Aug 2023 15:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63877F8053B
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63877F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gf0q+oaa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NbcPY6Mu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FBF31FDF3;
	Mon,  7 Aug 2023 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pFPF5Nrw2GKNzuqgeRhsZPYtcyFfU6WKf4YaXth90Ak=;
	b=gf0q+oaaQhVuGC1pP5Q9zCr7GphHN0nICkoeH6FVD6MK1ZGQGpsDwhJM00cUyuZrddfKcB
	jf0LXkLgGKFCnxfQPHWpQKkVH/f5cTT74B98tNihxj7iTFBrOSRqHyltH+1q+FY8nyYG2E
	cLgTdu+F0i7GFB1Y2Qi0bgv1ALv6lF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pFPF5Nrw2GKNzuqgeRhsZPYtcyFfU6WKf4YaXth90Ak=;
	b=NbcPY6MucNkkIAZiY6YeOxHkUwTQka4OzHRiEqn2lqRH/8fE0efaC09Ff2YB7sLmNWmHMv
	RMoqJ1N37BC5weBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D1C413910;
	Mon,  7 Aug 2023 13:52:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UL9IAgz30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH RFC 4/6] ALSA: pcm: Release memory with reference
Date: Mon,  7 Aug 2023 15:52:05 +0200
Message-Id: <20230807135207.17708-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5KA3H3UCICMUFGB2E35UMH3YL4OQ32MG
X-Message-ID-Hash: 5KA3H3UCICMUFGB2E35UMH3YL4OQ32MG
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use refmem allocation for the PCM object that holds two PCM devices
(for playback and capture).  This fixes the UAF bug by the delayed
kobj release.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 461a10cc0db9..1e96437f3f0e 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -650,7 +650,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 	if (!substream_count)
 		return 0;
 
-	snd_device_initialize(&pstr->dev, pcm->card, NULL);
+	snd_device_initialize(&pstr->dev, pcm->card, pcm);
 	pstr->dev.groups = pcm_dev_attr_groups;
 	pstr->dev.type = &pcm_dev_type;
 	dev_set_name(&pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
@@ -721,7 +721,7 @@ static int _snd_pcm_new(struct snd_card *card, const char *id, int device,
 		return -ENXIO;
 	if (rpcm)
 		*rpcm = NULL;
-	pcm = kzalloc(sizeof(*pcm), GFP_KERNEL);
+	pcm = snd_refmem_alloc(sizeof(*pcm), card);
 	if (!pcm)
 		return -ENOMEM;
 	pcm->card = card;
@@ -872,7 +872,7 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 	snd_pcm_lib_preallocate_free_for_all(pcm);
 	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]);
 	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_CAPTURE]);
-	kfree(pcm);
+	snd_refmem_put(pcm);
 	return 0;
 }
 
-- 
2.35.3

