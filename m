Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD63769B45
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBC93AE8;
	Mon, 31 Jul 2023 17:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBC93AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818716;
	bh=GkDWT8o4f+GYjGVZbsKKpGNODPZ7BgMbFY2UIt63/oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MuMZareyLnBLq6rn9crlofw4GW8G0M7xSbsrmxe4qgYVVjSLwBx0jDrT5ltHjYhfb
	 sjfi2iNmREn1Y5wQAcIPJYI+9OcXmq3CYZ6iunkhxCslYp/Fp+Q4PVc2IukEpZtI/o
	 4ncsxEjVGQgvtmwsEYiflEpTczKNRGI0gA+JVCog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B909F805F9; Mon, 31 Jul 2023 17:48:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E4FF80602;
	Mon, 31 Jul 2023 17:48:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E4E9F8057B; Mon, 31 Jul 2023 17:48:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BF8CEF80564
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8CEF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ey0vACdd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qxWd8KRT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91609221CE;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOQitOkRCqNgYar/g/CXFiW9ZAZuOtiLqbpCx7obhiE=;
	b=Ey0vACdd2mxXk/3VttcLCaqGW94pjnyIOWVU0XLlR9U9t7Ec2kDq4mcc+5ecl6ETt+crsn
	vpX87qDn4UD4SWnsOYjvsvor+zCsRW+/fZE5ihpOovogi9UXPjZ2I1aDUl+5fjFYEESBR3
	lQZ2J9TPoASJIPn6anZVBdQFpafXNaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOQitOkRCqNgYar/g/CXFiW9ZAZuOtiLqbpCx7obhiE=;
	b=qxWd8KRTcuUO+0HmDnHNpvfq+pL8DPiQK8RY9JEnATPpE93isRO6BNkk3PSsSxFYcnWUyQ
	ZJj/UVtWRHv+QSDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66516138EE;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GJUSGI7Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 19/24] ASoC: qcom: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:13 +0200
Message-Id: <20230731154718.31048-20-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LU2MCIZWZIRDUWTCTMQZQXCCRS4VQC7M
X-Message-ID-Hash: LU2MCIZWZIRDUWTCTMQZQXCCRS4VQC7M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LU2MCIZWZIRDUWTCTMQZQXCCRS4VQC7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the qcom lpass driver code to use the new unified
PCM copy callback.  It's a straightforward conversion from *_user() to
*_sockptr() variants.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/lpass-platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index ef5cb40b2d9b..78bf15e768af 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1219,7 +1219,7 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 
 static int lpass_platform_copy(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream, int channel,
-			       unsigned long pos, void __user *buf, unsigned long bytes)
+			       unsigned long pos, sockptr_t buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *rt = substream->runtime;
 	unsigned int dai_id = component->id;
@@ -1230,16 +1230,16 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		if (is_cdc_dma_port(dai_id)) {
-			ret = copy_from_user_toio(dma_buf, buf, bytes);
+			ret = copy_from_sockptr_toio(dma_buf, buf, bytes);
 		} else {
-			if (copy_from_user((void __force *)dma_buf, buf, bytes))
+			if (copy_from_sockptr((void __force *)dma_buf, buf, bytes))
 				ret = -EFAULT;
 		}
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		if (is_cdc_dma_port(dai_id)) {
-			ret = copy_to_user_fromio(buf, dma_buf, bytes);
+			ret = copy_to_sockptr_fromio(buf, dma_buf, bytes);
 		} else {
-			if (copy_to_user(buf, (void __force *)dma_buf, bytes))
+			if (copy_to_sockptr(buf, (void __force *)dma_buf, bytes))
 				ret = -EFAULT;
 		}
 	}
@@ -1260,7 +1260,7 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.pcm_construct	= lpass_platform_pcm_new,
 	.suspend		= lpass_platform_pcmops_suspend,
 	.resume			= lpass_platform_pcmops_resume,
-	.copy_user		= lpass_platform_copy,
+	.copy		= lpass_platform_copy,
 
 };
 
-- 
2.35.3

