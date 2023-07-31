Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB9769B36
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D6CA4D;
	Mon, 31 Jul 2023 17:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D6CA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818643;
	bh=GzD/OiBqwFwTQoA7/K3mv6VkJidkxuxHBQ470+G/Tyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NRswFLfjp9C3vwUCuapkXFbCLxlhIzsKaWvKUiMqq2VoJ7XiArkMbu3Igq3syKYNJ
	 xbfT2MTRi/VCpVu6DAVqJzOkpQ3PjfRbkkxrad3XzJLcgfRWde+r6YaNQAIXxweJIm
	 HVJZ0FtRiwPIzFNq/0LgjvbNPqqyorN5+nYWwGGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D76C7F805E2; Mon, 31 Jul 2023 17:48:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29943F805CB;
	Mon, 31 Jul 2023 17:48:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C489DF805B1; Mon, 31 Jul 2023 17:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A38D9F80557
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A38D9F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gUuRlm5Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jHraE8xB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA67A1F8C2;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4bZzw6ghIKo8Le7pLFTGbdRqYfmO/nvgpbKIlcIbmQ=;
	b=gUuRlm5QKoFla1olfVq/ETjA34X9hiAXFvFDNI2WrKrYmglFlsdHWSWD8JqOAm5m45bCPJ
	Nj5AqA7V0abu5pa14OSDjBwIFVeUs3Mn1tas1Mdz2PG4FCdFbjsKV4/1rBoi0Zfzkn4HBU
	DFteoovV0hrP8sZns/6upCvPc6C2p7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4bZzw6ghIKo8Le7pLFTGbdRqYfmO/nvgpbKIlcIbmQ=;
	b=jHraE8xBR736ujjUwsAs4qGove4VUh6r3FbvRsJolUhHRby9senbFnXlgN6Vp6MxJR/PsK
	egC4ZWd6srUAtBDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 982A11322C;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uKpGJI7Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 20/24] ASoC: dmaengine: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:14 +0200
Message-Id: <20230731154718.31048-21-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4VKYXQQ7JLEDC4D5FU5IAQGZXP3L3DHZ
X-Message-ID-Hash: 4VKYXQQ7JLEDC4D5FU5IAQGZXP3L3DHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VKYXQQ7JLEDC4D5FU5IAQGZXP3L3DHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the ASoC dmaenging driver code to use the new
unified PCM copy callback.  It's a straightforward conversion from
*_user() to *_sockptr() variants.

The process callback is still using the direct pointer as of now, but
it'll be converted in the next patch.

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 3b99f619e37e..25b8de7e9bb2 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -287,10 +287,10 @@ static snd_pcm_uframes_t dmaengine_pcm_pointer(
 		return snd_dmaengine_pcm_pointer(substream);
 }
 
-static int dmaengine_copy_user(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream,
-			       int channel, unsigned long hwoff,
-			       void __user *buf, unsigned long bytes)
+static int dmaengine_copy(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  int channel, unsigned long hwoff,
+			  sockptr_t buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
@@ -302,17 +302,17 @@ static int dmaengine_copy_user(struct snd_soc_component *component,
 			channel * (runtime->dma_bytes / runtime->channels);
 
 	if (is_playback)
-		if (copy_from_user(dma_ptr, buf, bytes))
+		if (copy_from_sockptr(dma_ptr, buf, bytes))
 			return -EFAULT;
 
 	if (process) {
-		int ret = process(substream, channel, hwoff, (__force void *)buf, bytes);
+		int ret = process(substream, channel, hwoff, buf.kernel, bytes);
 		if (ret < 0)
 			return ret;
 	}
 
 	if (!is_playback)
-		if (copy_to_user(buf, dma_ptr, bytes))
+		if (copy_to_sockptr(buf, dma_ptr, bytes))
 			return -EFAULT;
 
 	return 0;
@@ -337,7 +337,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.hw_params	= dmaengine_pcm_hw_params,
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
-	.copy_user	= dmaengine_copy_user,
+	.copy		= dmaengine_copy,
 	.pcm_construct	= dmaengine_pcm_new,
 };
 
-- 
2.35.3

