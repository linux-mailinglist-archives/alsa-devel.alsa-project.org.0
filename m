Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6AD8132FB
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 15:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F429F6;
	Thu, 14 Dec 2023 15:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F429F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702563839;
	bh=m/9IgX+05lDZCcP7jT/Hm266ZSa7Jj31op6alHjT/bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FNNXZTJJkQGuSmf47ZhE/powxUx2iZIcMX04lw4P4gT2uSda96P4E6+6JuP5EZtD3
	 av/FMZ8Hn4jxX2c2Lz6bsbQ0fbDfZesW1E3M2cSy/QYjAnHyCh/ZPycWQGbse/uhZS
	 EOO/jes9aI6Y5UQKyy3dC/eHf9vlHFImqtaHuz04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2440F80124; Thu, 14 Dec 2023 15:23:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E2EBF805EE;
	Thu, 14 Dec 2023 15:23:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73F56F8016A; Wed, 13 Dec 2023 13:36:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EA89F80166
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 13:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EA89F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k9qFcPe/
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5908a63a83fso3723448eaf.1
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Dec 2023 04:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702470985; x=1703075785;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeOaNUPzIaLpTYp3WoiPTDUVL3er+2u0oaLfnKfUysU=;
        b=k9qFcPe/e1P9rH/6xOzd9ddllMjCMtbhlHn4DXyoTiL+tQW9CKLRc5AuL0km+/cibD
         rVzMBk2s4cTBPxwaMG4vtr+Pg2GMzC8mzOBWB3ltFta9xzHWnzRqW0W5q/0mP7VqDJNX
         RGglVcftBBzDU5wulHHx7j7F3mELcSX2nn0QaWDcW66ikcnIHjtZmhouQ6GmZkgkIKzD
         HM8/22A5B+DDyHk4Ebu1r9KJ2HudvmP7xfwQCuHpQBvDQ4iK53/1j3HZq5JOqPYN5sCO
         xkbEXzcaYHkAgsPERaiZUmIXTUD6NIOq1882Obqj31BRpJL8eI6jwCS8vRzT5PoWKbvy
         Y1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702470985; x=1703075785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeOaNUPzIaLpTYp3WoiPTDUVL3er+2u0oaLfnKfUysU=;
        b=cHKTZP2Swc0/7D3gLXwm9HeTlLHWW5dps576Udh5+zhwt5w40V8y1Y3tdWDShgmG2d
         zEbKxnV3dD2oZCPDRrSYbKmnjwR+9kjK24a45PgvzVn9diEs1tusTqu6mtARCddA+1qe
         UnfMHBO+TIUxIA8aAGL5fjMt2KU8Nns27dX3qyPPrNiIAL5VwdHVwEI0NF4TcdQ1Mxoq
         0HxY4ULeRq7CeUvuJ11IxfTcIk6MLo6WbWTHfCaXI/5bQAQMLO7kFTonujZpOTmGxIqv
         BOAADj7xTTg5RiCIv37mb6363S7Lel+m5kuHzMFX6GLBNHK84PBjzst3q1wmkSLGWpbz
         NYdA==
X-Gm-Message-State: AOJu0Yyp3arFAUlFRtWUgQxq7fhh8ytczBy/+pMU0kM9otkow1R5FMTU
	vRrf71UoiGMR1uyFI4oJQPs=
X-Google-Smtp-Source: 
 AGHT+IF3mPmS92KpXb0fd2MbUmh0CWcpyP6e3laWEh/2A8gchCJz/2hR/V39DL3C2iJQDt7RFMyrgQ==
X-Received: by 2002:a05:6358:70a:b0:170:cacc:f7ee with SMTP id
 e10-20020a056358070a00b00170caccf7eemr6977763rwj.8.1702470984986;
        Wed, 13 Dec 2023 04:36:24 -0800 (PST)
Received: from localhost.localdomain ([117.189.237.103])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a056a00188300b0068fe5a5a566sm10193584pfh.142.2023.12.13.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 04:36:24 -0800 (PST)
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
Subject: [PATCH v3 2/4] ASoC: qcom: sdm845: switch to qcom_snd_tdm_hw_params
 helper
Date: Wed, 13 Dec 2023 20:35:54 +0800
Message-ID: <20231213123556.20469-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213123556.20469-1-lujianhua000@gmail.com>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HQRUQVRDB3EPODZX3YABTPVTHLORWDEE
X-Message-ID-Hash: HQRUQVRDB3EPODZX3YABTPVTHLORWDEE
X-Mailman-Approved-At: Thu, 14 Dec 2023 14:22:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQRUQVRDB3EPODZX3YABTPVTHLORWDEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use qcom_snd_tdm_hw_params helper to setup TDM ports.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v3:
  1. new patch

 sound/soc/qcom/sdm845.c | 46 +++++++----------------------------------
 1 file changed, 7 insertions(+), 39 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 252a0f0819be..5052c1410723 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -53,8 +53,6 @@ static struct snd_soc_jack_pin sdm845_jack_pins[] = {
 	},
 };
 
-static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
-
 static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
@@ -99,10 +97,9 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
-	int channels, slot_width;
+	int slot_width;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
@@ -114,39 +111,11 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	channels = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
-				8, slot_width);
-		if (ret < 0) {
-			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
-					__func__, ret);
-			goto end;
-		}
-
-		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
-				channels, tdm_slot_offset);
-		if (ret < 0) {
-			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
-					__func__, ret);
-			goto end;
-		}
-	} else {
-		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
-				8, slot_width);
-		if (ret < 0) {
-			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
-					__func__, ret);
-			goto end;
-		}
-
-		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
-				tdm_slot_offset, 0, NULL);
-		if (ret < 0) {
-			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
-					__func__, ret);
-			goto end;
-		}
+	ret = qcom_snd_tdm_hw_params(substream, params);
+	if (ret < 0) {
+		dev_err(rtd->dev, "%s: failed to setup TDM err:%d\n",
+			__func__, ret);
+		return ret;
 	}
 
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
@@ -176,8 +145,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-end:
-	return ret;
+	return 0;
 }
 
 static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
-- 
2.41.0

