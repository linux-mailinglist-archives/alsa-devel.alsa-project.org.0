Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C7699767
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:29:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE66EA9;
	Thu, 16 Feb 2023 15:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE66EA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676557738;
	bh=WgNKs+LLAn7qr7DMApk5ikuqamjmUzpT9q0b9SZ6GOg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HleIGUg8eeb45+m8+11okNV9o6DOaSJurTEWZhyeEjSrtIirmeSxNutD+VW7hnjBg
	 d+4fu9pqttw9b0UXeZK5zoGb6zjR0GU5nuW4wAuhoPXokIF63tVqC+Dv60h1OnRa8s
	 YugCZH8ISeEgBEB8Nobu9ShoikAf6Rcsoz+THWwI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B3BF800E4;
	Thu, 16 Feb 2023 15:28:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12D7CF801C0; Thu, 16 Feb 2023 15:28:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D947F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D947F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WuHX8LyR
Received: by mail-wm1-x331.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so4328223wms.0
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Nz32PTC4cYcrHhpCvR0yjGez/KUmnS43OBx6qcE3Q=;
        b=WuHX8LyR3sDtCJ2pSEUglFfcrjqVHW9F9iLbRjbRb4Yog6hfv2hrWCig9GocgB2bP2
         6Ic/kOugH4WCgef5LTmI1IJ/OtLjZCPnL0yQYQjd03yI1PXUuFXh6aDpRYvRkqjxIYXC
         07/dVGj0i73WPZtvUQc4C+B4+M2XxcNhXx+p6hjzpylrRpIpzwOAslaheshDFTyB2h8K
         gk7ieOvwXKrSG2yui+sQi/qLviEZPs6iaNehfR9QOXAztkcQQ2rKA6hhnKTuFdno6A2T
         RaqoCNfgGUTX0l/lwi7/O2dZKrO083rzCzYqgLGjidV8ylGesl899JsUQ+QkimX4IQFe
         pNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1Nz32PTC4cYcrHhpCvR0yjGez/KUmnS43OBx6qcE3Q=;
        b=bX16fqiMaFsbiYhcZVfNzCQibCHHgmossdG1SHpWgAzTs7vaMRBSqnJMJb1xB1ihAA
         bJCRW1uhtxO6QB9YWg0gzm1+LhR0laNx++uGwWOYh3d8NRV5ZIFDKCWyEYbq6ENerJBO
         yk5p2MOz9yHmEbMPOIZI4uDbFcnSQcWnkiTEfYTS71rrjj6GKmJKQ83OcvCQQCIzjPYS
         kmB80kYDBaiqiPcjATeSK+eEI6/Z5uYw3yxs3abiPjRX/hahLYSeqMCEJdhcy6OJHeax
         qjpEzZ41CvWnrwTdkLr4QpwU8ikdLQlFHo30FzF8/em6ofibDawfIpVyfvcVK2dPJ5Zy
         O7pA==
X-Gm-Message-State: AO0yUKWVQYavDzeKa0JoQx1RIB/DvHjrZd9NHROlxrQbuRRd0K2fmXLL
	Q+DiRO8sO2/uU1q4LINgsSCXal3/EjA=
X-Google-Smtp-Source: 
 AK7set+eAWWSNaTr3G+0Lhk6WHJd7J76wUSKMOUYpAbJoHJfNgnOuubr0kQiZUHSnoaLrw+Lx5b8ww==
X-Received: by 2002:a05:600c:996:b0:3cf:68d3:3047 with SMTP id
 w22-20020a05600c099600b003cf68d33047mr4588800wmp.41.1676557677103;
        Thu, 16 Feb 2023 06:27:57 -0800 (PST)
Received: from localhost.localdomain (awyoung.plus.com. [81.174.138.22])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e21356bddcsm1978194wmj.33.2023.02.16.06.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:27:56 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: Change calculation of audio time from frames
Date: Thu, 16 Feb 2023 14:27:51 +0000
Message-Id: <20230216142751.1983620-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7O36KUOCCUOC76SKVEAIP4KFETJWE54N
X-Message-ID-Hash: 7O36KUOCCUOC76SKVEAIP4KFETJWE54N
X-MailFrom: consult.awy@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, Alan Young <consult.awy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7O36KUOCCUOC76SKVEAIP4KFETJWE54N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce snd_pcm_lib_frames_to_timespec64() to replace the calculation

	audio_nsecs = div_u64(audio_frames * 1000000000LL,
				runtime->rate);

which overflows after a playback duration of 4.8 days @ 44100 HZ or 0.56
days @ 384000 Hz.

The implementation of snd_pcm_lib_frames_to_timespec64() extends these
limits, to 1.5 million years (@ 384000 Hz), or the 68 year limit of
struct timespec on 32-bit systems.

Fixes: 3179f6200188 ("ALSA: core: add .get_time_info")
Fixes: 4eeaaeaea1ce ("ALSA: core: add hooks for audio timestamps")
Signed-off-by: consult.awy@gmail.com
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/pcm_lib.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 943f5396fc60..e0a6556d33ee 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -205,12 +205,19 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static inline void snd_pcm_lib_frames_to_timespec64(u64 frames, unsigned int rate, struct timespec64 *audio_tstamp)
+{
+	u32 remainder;
+	audio_tstamp->tv_sec = div_u64_rem(frames, rate, &remainder);
+	audio_tstamp->tv_nsec = div_u64(mul_u32_u32(remainder, NSEC_PER_SEC), rate);
+}
+
 static void update_audio_tstamp(struct snd_pcm_substream *substream,
 				struct timespec64 *curr_tstamp,
 				struct timespec64 *audio_tstamp)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	u64 audio_frames, audio_nsecs;
+	u64 audio_frames;
 	struct timespec64 driver_tstamp;
 
 	if (runtime->tstamp_mode != SNDRV_PCM_TSTAMP_ENABLE)
@@ -233,9 +240,7 @@ static void update_audio_tstamp(struct snd_pcm_substream *substream,
 			else
 				audio_frames +=  runtime->delay;
 		}
-		audio_nsecs = div_u64(audio_frames * 1000000000LL,
-				runtime->rate);
-		*audio_tstamp = ns_to_timespec64(audio_nsecs);
+		snd_pcm_lib_frames_to_timespec64(audio_frames, runtime->rate, audio_tstamp);
 	}
 
 	if (runtime->status->audio_tstamp.tv_sec != audio_tstamp->tv_sec ||
-- 
2.31.1

