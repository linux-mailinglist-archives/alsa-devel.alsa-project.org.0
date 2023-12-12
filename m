Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C880F185
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:54:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76DC7E7D;
	Tue, 12 Dec 2023 16:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76DC7E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702396471;
	bh=9Lf/MnNUWOjXjOd5JkgMMCDEq8SI7l4/06hXh0/M/Wg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a952QFcGjV+NEShf4d1u6liu6NruNOha/ErAAch8tEgIrz+tBqyzeO0HMVhtW51r4
	 g9+TlQx/zzDHIKg6J9jkbcJqox6Pp7WtvDv55TWj/tiCL/TAqgL7kTcO/Z7bhLa/sJ
	 Tt7eA0Y5k2SESL9G71DaKoEVqiNRSkCGf4doYcIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D62C3F806C0; Tue, 12 Dec 2023 16:52:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C6FFF8069C;
	Tue, 12 Dec 2023 16:52:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62AA5F8016A; Tue, 12 Dec 2023 10:59:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84B59F8001F
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 10:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B59F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XVqHoM8V
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6ce939ecfc2so4744430b3a.2
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702375145; x=1702979945;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HC1jaqWj/hITC47c7fEay6ZWU1sK+rJ4SAKEml501iY=;
        b=XVqHoM8Vp4g3oMttBenjG1/N1Sv6Ab5nlT5OO5SmlHMADctmHH+YU2el+qWhuaPQkZ
         zHH0LhL2y1ccKJPO5zJpUYCACap7q8oHPTYLgL/KCoH0Oczowc5FP4WqRcv9nn/Z+fB/
         sTl6LDL1SusjKoMkg4ckEwWwu+iMxR8VDqFzFMbbmkK7Uz16opwJN2e+20O6/qDAs5EU
         EJnFAbrTZipvO6B6QNCy5Wg/xU/4Ne+VIM0DR5iSxkkzqPfY3psFNL0kEC6H6mU2mjaB
         jU9CXQwuSPrA7c4z2EWnkAIycGCBFhReQfYMA8671aNvrgH/LPxMTKxvULCF/srFmNB0
         mMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702375145; x=1702979945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HC1jaqWj/hITC47c7fEay6ZWU1sK+rJ4SAKEml501iY=;
        b=AkGwsDdkhi6W+PgVjTEEbhEePi8+TtnmozXPE18EfHQcMTf2TfnJWonIsrxO11a0PX
         o3wAwlxeTvjPfNWYqHFTVTpdKar3s2cBiMa6/ur2FJay2LG7j5PqBV3EL4RheoU7sSqF
         tvpmDVeW77+hSqxHLo/Bkm1bOz1snfQc0feD6buggU6PXLgKu6DAqAgucSjr329WLcFZ
         uNba02sgGrNNcOFgUeXvbZkIRPDcgWXLu26NT3m0ad58MMUF0QZjjryWUtRTgMbBy5Zg
         8kEgzY1l21vmLjgNTGV3OrJjR86AFiOKwqkMtWTjzhtrsiGOdZxlexoa4ZX8DiP4AdAR
         qPxg==
X-Gm-Message-State: AOJu0YwBx83WmphSGGS2ZJa60Q/cTwM/QLzamzAYPCXyTuWnhsofQe1h
	5lNg0ZhYRY/uvjkf7uv1FrY=
X-Google-Smtp-Source: 
 AGHT+IF3oaoSk4UNEp37/FK6kt+vNA3UBT9+L9g7WytsaM7n4LaXWFmtLi9RLjt5/IHFTQnJSVkxVQ==
X-Received: by 2002:a05:6a00:1913:b0:6cb:bc1a:dcff with SMTP id
 y19-20020a056a00191300b006cbbc1adcffmr7424793pfi.13.1702375144999;
        Tue, 12 Dec 2023 01:59:04 -0800 (PST)
Received: from localhost.localdomain ([117.189.239.2])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a056a0010c400b006ce7344328asm7730354pfu.77.2023.12.12.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:59:04 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [RFC, PATCH v2 1/2] ASoC: qcom: sdw: Add TDM support
Date: Tue, 12 Dec 2023 17:58:49 +0800
Message-ID: <20231212095850.26482-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UBFSF2XG46E4EJLOHK3EHOO5VH3HUE2W
X-Message-ID-Hash: UBFSF2XG46E4EJLOHK3EHOO5VH3HUE2W
X-Mailman-Approved-At: Tue, 12 Dec 2023 15:52:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBFSF2XG46E4EJLOHK3EHOO5VH3HUE2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add qcom TDM setup function to support TDM ports for qcom platform.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v2:
  1. remove EXPORT_SYMBOL_GPL
  2. remove static modifier

 sound/soc/qcom/sdw.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 77dbe0c28b29..948abbd2e0e3 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "sdw.h"
 
@@ -101,6 +102,65 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
+int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	unsigned int tdm_slot_offset[8] = { 0, 4, 8, 12, 16, 20, 24, 28 };
+	int channels, slot_width;
+	int ret;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		slot_width = 16;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		slot_width = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		slot_width = 32;
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid param format 0x%x\n", __func__,
+			params_format(params));
+		return -EINVAL;
+	}
+
+	channels = params_channels(params);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3, 8, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL, channels,
+						  tdm_slot_offset);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+	} else {
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0, 8, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
+						  tdm_slot_offset, 0, NULL);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+}
+
 int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct sdw_stream_runtime **psruntime)
@@ -125,6 +185,9 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 				*psruntime = sruntime;
 		}
 		break;
+	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
+		qcom_snd_tdm_hw_params(substream, params);
+		break;
 	}
 
 	return 0;
-- 
2.41.0

