Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A19901A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 12:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75D8168F;
	Thu, 22 Aug 2019 12:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75D8168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566468067;
	bh=Nhcq74SslY3hr8IXjR3glGn6Lh6a5JoIzSxV81tBrY4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUwc8/0/yNgWqtQch/N2uCRgHPdzcZuYwUkYDBITeDiUMDWyHvuSafVRhmuHSyWYZ
	 yGSJGqfN2dn2qeOdilzmAFRUVAicgPwi/Av/gPKmL5fnYaGNCFnwcOFJ0iGYTbOF8K
	 55epGGN2djd+vlWhWMTrZeSe7pq6PNurdKaU55XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B4DF805FB;
	Thu, 22 Aug 2019 11:58:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34794F805A1; Thu, 22 Aug 2019 11:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBCB2F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 11:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBCB2F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G36uhWdj"
Received: by mail-wm1-x344.google.com with SMTP id f72so4984959wmf.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ODWBtpVLXMipclxHeFDJwXNUN4EjiRweHSVWcVI6sA=;
 b=G36uhWdjCUarled0tt/nSqTGRJQobhmevHt5CRxzXkO/id6ns//zyh8swvKcYiP5hP
 MePfesYxsFXE+AH+vUpilA6rkLRBJ60Ami99R4xugrNxzNGYXhlYndPwx7r8fCspudEC
 5dTZ5I9O7i15l2VxKUyEGtr3pKlSrTedwqFffBImWCL5QM4j4RQb5JY7kcqXMsx9ONlP
 DOPHXkE2zWy8y48D4N7xbSn9FB3XIjYe4L+1c1qSu8wsbhbeMaa7U0Ok9t2KLJBJn3+9
 g0+9o6mCl0LRK634Bl4jG8LFfJ9q/h9Y89CHoJ2ipMsCxuFDrXAhXKHKIECZhs04Rr/9
 hiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ODWBtpVLXMipclxHeFDJwXNUN4EjiRweHSVWcVI6sA=;
 b=eU0VCGhRjCO2ahOUkU0FibXhBcDWvyEweSv6XW/I2nHDZbqludM0ou4QYfuIsJogQV
 qlvTYVml71BfDPIenSDmvHe1mdg+CY4Are7idKIDiveEYzcgoxKMQHif//NCkt8udBwj
 JlvoxgVPa5rqcfQyzdYWEnSApFa9GrT+GjVPsvAwP3MkFQmdnvW2dJqagjOzpF7kpP2k
 kAD/PKNy//YgYYUEAdKC2QKKihUT4NKyQVPL8+QGeevML397v/0gGNpb3Bt86ASOAo1O
 S59k9cCIVhVBLWkhmLUZQ9YMZZbyUFw1aDu574d3X98Zlfv1yE5eDgXUgdndn2cQ3UOd
 5pww==
X-Gm-Message-State: APjAAAXuZXmpIfnkbG9OtWd4f15ZEqTl9au6ktd+h+pBPOy64vOcUR+0
 TD/LIkvcr6ICdwm+iFWudkjYPmD39UY=
X-Google-Smtp-Source: APXvYqxjfvPKXwZ5wrQs6B9UpLQ68Dhwn+dJarTiv+pkkJKtnaXNqYzjP96D+uOlERQ+0fxYsHfW4w==
X-Received: by 2002:a05:600c:24cb:: with SMTP id
 11mr5205419wmu.94.1566467852327; 
 Thu, 22 Aug 2019 02:57:32 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t24sm3298909wmj.14.2019.08.22.02.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 02:57:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Thu, 22 Aug 2019 10:56:52 +0100
Message-Id: <20190822095653.7200-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
References: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, plai@codeaurora.org
Subject: [alsa-devel] [PATCH v2 3/4] ASoC: qdsp6: q6afe-dai: Update max rate
	for slim and tdm dais
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

QDSP supports up to 384000 rates on SLIM dais and 352800 rate on TDM dais.
Add this missing rates.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 92 +++++++++++---------------------
 1 file changed, 32 insertions(+), 60 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index c1a7624eaf17..ae2baefdb6e2 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -18,14 +18,14 @@
 			.stream_name = pre" TDM"#num" Playback",	\
 			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800,\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 352800,				\
 		},							\
 		.name = #did,						\
 		.ops = &q6tdm_ops,					\
@@ -39,14 +39,14 @@
 			.stream_name = pre" TDM"#num" Capture",		\
 			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800,\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 352800,				\
 		},							\
 		.name = #did,						\
 		.ops = &q6tdm_ops,					\
@@ -646,15 +646,13 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.playback = {
 			.stream_name = "Slimbus Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.name = "SLIMBUS_0_TX",
@@ -664,28 +662,24 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.capture = {
 			.stream_name = "Slimbus Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.playback = {
 			.stream_name = "Slimbus1 Playback",
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
-				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 2,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 		.name = "SLIMBUS_1_RX",
 		.ops = &q6slim_ops,
@@ -700,28 +694,24 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.capture = {
 			.stream_name = "Slimbus1 Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.playback = {
 			.stream_name = "Slimbus2 Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 		.name = "SLIMBUS_2_RX",
 		.ops = &q6slim_ops,
@@ -737,28 +727,24 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.capture = {
 			.stream_name = "Slimbus2 Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.playback = {
 			.stream_name = "Slimbus3 Playback",
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
-				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 2,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 		.name = "SLIMBUS_3_RX",
 		.ops = &q6slim_ops,
@@ -774,28 +760,24 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.capture = {
 			.stream_name = "Slimbus3 Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.playback = {
 			.stream_name = "Slimbus4 Playback",
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
-				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 2,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 		.name = "SLIMBUS_4_RX",
 		.ops = &q6slim_ops,
@@ -811,28 +793,24 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.capture = {
 			.stream_name = "Slimbus4 Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.playback = {
 			.stream_name = "Slimbus5 Playback",
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
-				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 2,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 		.name = "SLIMBUS_5_RX",
 		.ops = &q6slim_ops,
@@ -848,28 +826,24 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.capture = {
 			.stream_name = "Slimbus5 Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.playback = {
 			.stream_name = "Slimbus6 Playback",
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
-				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 2,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 		.ops = &q6slim_ops,
 		.name = "SLIMBUS_6_RX",
@@ -885,15 +859,13 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.remove = msm_dai_q6_dai_remove,
 		.capture = {
 			.stream_name = "Slimbus6 Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_384000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 		},
 	}, {
 		.playback = {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
