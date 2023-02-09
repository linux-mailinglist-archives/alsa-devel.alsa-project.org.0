Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983AC6908D3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:30:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06046E74;
	Thu,  9 Feb 2023 13:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06046E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945826;
	bh=6ilwTkW8Jt8lTFQ/vxUKe65ESefy3rCd4L23tsuDNBc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uLtisdi0VFjbfLkX7l4zJbhayp2wHFXdgAmhO+UVcr67ixTvNZ6EeUDD6LKPB2ReP
	 VC2732auRa0QmkX/9mEPTcnLNjNqtswZj1jZLSsbzJMqV8UG6swvlWD+WbFaQSEWTX
	 3qocZaJ2kNRFMjTA3nrWeZM/sn58/WXBHIab8QXw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F82BF804F2;
	Thu,  9 Feb 2023 13:28:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19736F8052D; Thu,  9 Feb 2023 13:28:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 131E9F800B8
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 131E9F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NjJeO8Gg
Received: by mail-wr1-x42d.google.com with SMTP id m14so1560706wrg.13
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la+zSqZHnDH4NrBUp1B5sU6rN4yJdP2UMwQ4cL39N1A=;
        b=NjJeO8GgEt5hDiYdbv5bupUhixSFr+wUIsKkd+sY5GLYBTq3Hm+wfWYDNRbQCj3qyY
         lOCho4plKkO9xSwt3s6vP5IOL3mcbj0Ex52Mfmy1ajY5I7d5jaohXOg55uyzw2cgg3KI
         zgy84M8Q2FOmONb5dw8Q94MiDi+jbATkcD7EUUIhhDRYnFxgGTlyP3aKIr+4McvVWIGu
         STr+HyKJGeHESpFdQIBMdibvzGHzG6bf02K5nMsod7TWj1YZmiLmmXL3cwAnjnQVSnB3
         FMVlG4qroocbJHKg/bHiL9zWuyvnSsHQmeD/CtqPUwprP2y2DmVZaIuGXhyRuxevolhG
         7wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la+zSqZHnDH4NrBUp1B5sU6rN4yJdP2UMwQ4cL39N1A=;
        b=pZFrN0YkrgO2viRGkvQW6/R/2gOY0cfrQuM2DI7XnG5vHdGlz4ZUjwl+/acGDVboBW
         6G27upIWhXyLaI8+KHqGTbRBAtEQ99SyhuqMrwqCdacZwBAbyrl7YRQ7d05u3gPK0pFo
         k8PF9B3n3VnFSdDsGsT5NrKvB1vdEap/PIVnlzBgbvYxOpDBFEEKai9PRxUCTci03uur
         r07JdXnmbjc2gz0EnzX1wIHPpGm1WBv3UjZYufn5OJpqzgaEBE6jU12dU4kg4RYPLfBt
         cKIq12xLZqklbvb/WL2e2+g+kVbOc1rZAGnRz3vKmpT8XdEXhfOSbW/D59KEulC5u9ag
         cl5A==
X-Gm-Message-State: AO0yUKWt5+lyRB/dVLy4gJ9y4FORK9+qG77jDDot2MUVOxNlEaBkwugM
	xrf6OMkrMH3uVxS2LOPuAGH+BA==
X-Google-Smtp-Source: 
 AK7set/AU65Rnx4Ciaza1virFRj0oTjWBnjQjLYEOCtTb8yh6x2aof018UXZTiQsjFqaLAQSMVUJWQ==
X-Received: by 2002:adf:f9cc:0:b0:2c3:e7d8:245c with SMTP id
 w12-20020adff9cc000000b002c3e7d8245cmr10617613wrr.13.1675945699206;
        Thu, 09 Feb 2023 04:28:19 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/8]  ASoC: qcom: q6apm-dai: Add SNDRV_PCM_INFO_BATCH flag
Date: Thu,  9 Feb 2023 12:28:01 +0000
Message-Id: <20230209122806.18923-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LNJZ7S35I3BMVCIM6I4NJIBDCOFHKNKB
X-Message-ID-Hash: LNJZ7S35I3BMVCIM6I4NJIBDCOFHKNKB
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNJZ7S35I3BMVCIM6I4NJIBDCOFHKNKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

At the moment, playing audio with PulseAudio with the qdsp6 driver
results in distorted sound. It seems like its timer-based scheduling
does not work properly with qdsp6 since setting tsched=0 in
the PulseAudio configuration avoids the issue.

Apparently this happens when the pointer() callback is not accurate
enough. There is a SNDRV_PCM_INFO_BATCH flag that can be used to stop
PulseAudio from using timer-based scheduling by default.

According to https://www.alsa-project.org/pipermail/alsa-devel/2014-March/073816.html:

The flag is being used in the sense explained in the previous audio
meeting -- the data transfer granularity isn't fine enough but aligned
to the period size (or less).

q6apm-dai reports the position as multiple of

prtd->pcm_count = snd_pcm_lib_period_bytes(substream)

so it indeed just a multiple of the period size.

Therefore adding the flag here seems appropriate and makes audio
work out of the box.

Comment log inspired by Stephan Gerhold sent for q6asm-dai.c few years back.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bd35067a4052..7f02f5b2c33f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -64,7 +64,8 @@ struct q6apm_dai_data {
 static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
-				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
+				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
+				 SNDRV_PCM_INFO_BATCH),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
@@ -82,7 +83,8 @@ static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 static struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
-				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
+				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
+				 SNDRV_PCM_INFO_BATCH),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
-- 
2.21.0

