Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905FC90D4AC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:24:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAA28E68;
	Tue, 18 Jun 2024 16:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAA28E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720658;
	bh=pqG99NiBWHTOG1yuOzvntktNTElMoxg2aP15S8zgv/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JgvmZNsEjJQqspCg2M43KV1oSVfJhm9+TrPEKZAR+qPdSVMZFwMe8B1SgSTwiHtJr
	 Aj9z4i8X+LKjOWZdaYfqKv6QHzD2gAnhOdpakJPodMtanAdeYp1xzB+ZotgRtcM+1/
	 mgqPc8JU2M4wyT4sON/LWSYYhit6kanlprI38E5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AE72F806BF; Tue, 18 Jun 2024 16:22:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A765F80690;
	Tue, 18 Jun 2024 16:22:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6DC7F80266; Tue, 18 Jun 2024 16:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RCVD_IN_SBL_CSS,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9F48F804F2
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 16:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9F48F804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tuJ2MEly
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4217a96de38so39868885e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jun 2024 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719586; x=1719324386;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cq8BNVyT1lxgezLa3xN77vJrD/ds6UBuIoYNpcAHr8=;
        b=tuJ2MElyTN9Dpkyk0LNQUzv2XJxZGZjFBqtgM7mwaBLzY+3MiQxinTodDpddPe/rWv
         5wZUichQ6jI6SvEfZxBFCw4QfYRTho5P/zGAm3A2nDNstLJSkhoaP095f+bwxU1vyvIz
         o4l5rez+3f5zGwBoB7ENv42SO5yB5PVNwBVR8UEmEzXq0vMEM+gCeLnLDLUoY0/RGmDa
         K1rT9rZy9aAEdYmtrPVJOhAvEN6wAKaLgT3PsJasvaumEY1qIzxt+Pzd0tJa2lr6n0kY
         +LqXVOFCqdB0eWBaOuf1VH8W7eoYj42M7xbLIp988SUx8/tM++qBl56GXmSNYY/Au/6t
         zA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719586; x=1719324386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cq8BNVyT1lxgezLa3xN77vJrD/ds6UBuIoYNpcAHr8=;
        b=OsmD7uWbIOIA5ZwQwWRlq2zMQM0jL3cXrHN9WM/MRDzLrmFvso8d8deTLtYLRAe8ec
         OJjEf4EDuRyc0f/NPq/YLzuv5/0k9aTBNL4M/wxiU6KdA7GOy1YYi9gMpKyOXZ/hpo1H
         TxOaf9RmL/X14oBMy+1IpDcBVgErmAr//79TLKII+mkIP7rzU1RafNGNnn8FStTJpVKm
         CJb3kkLI+5mAX31SpgxiZUfBPmTwQBQ/OL+hzYD5qPNc5Tg93e9H7JEMjbwONl6XJEOh
         pVzCLY+/l9tchtHwkm69Il06480BkncAmDGPZE+ihCVfW0u+T49QpkA2ENXJTiAQuH8k
         kYpw==
X-Gm-Message-State: AOJu0YwvmdSwTEiXk/pmqG3FJFcQCi8Y5IpkC0dkbmoIJTiMttafZBuD
	yzSNX+ohDkrUmk3LRU5iTEIIrwsum5ysDLtuxXQgZt8DKE3huMQjz4K8Zaor1bkDyDM7p0sBliK
	F95A=
X-Google-Smtp-Source: 
 AGHT+IH06zBAori5j78Ra33E+DRN1FHFA/kbfAGU8rA9O9veM5BnTvopHWzqDv6cMnW1092Kp2+/mw==
X-Received: by 2002:a50:cc9c:0:b0:57c:6efa:8381 with SMTP id
 4fb4d7f45d1cf-57cbd6a8656mr7531606a12.42.1718718560123;
        Tue, 18 Jun 2024 06:49:20 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbdfe1428sm6678397a12.27.2024.06.18.06.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:49:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 14:49:01 +0100
Subject: [PATCH 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi
 channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-lpass-wsa-vi-v1-2-416a6f162c81@linaro.org>
References: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
In-Reply-To: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5876;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=pqG99NiBWHTOG1yuOzvntktNTElMoxg2aP15S8zgv/o=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZBcvMB+6ZwW+EnK6qwhD7CqaHmPJAw6oa11a
 z5zg0bOOBKJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGQXAAKCRB6of1ZxzRV
 N9zXCAClFg7FM8O1767qza2EL7Ysm1biOGceunEJhBnkfwOpoPartajuKcOhnni0xR17yVoOLLV
 IDyZZZO8OUeftIbUjGus18unyLvGPtlSoW/H7NkUqdomkU/KBmFB6A8/2geK8t5RGyy4JuyVlTJ
 lAmoYTp42swJJKt7TxbwriZS6uyb+L93hGiZdepqMu1n1Eoe4DwzWwsUJQPM4L64sOvdu8J9EA5
 3fI6weJ1eh8rGFkdhijE/NuR0OAWwbbXEDvm+XtmO1GOPVTzUpgI2u5SopoJ4Tuimn5MDxWwwxu
 e6OhUD3ewCUb+lIPNzRt+s9LTXM/U23Dc7nmmqzMulpccknT
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: 2EWPUCFWSEFIAUUR4R4FFPY2SFUKXMNA
X-Message-ID-Hash: 2EWPUCFWSEFIAUUR4R4FFPY2SFUKXMNA
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EWPUCFWSEFIAUUR4R4FFPY2SFUKXMNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
paths eventhough we enable both of them. Fix this bug by adding proper
checks and rearranging some of the common code to able to allow setting
both TX0 and TX1 paths

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 105 ++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 7b6d495ef596..7251fb179db9 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1162,6 +1162,73 @@ static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+
+static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
+						u32 tx_reg0, u32 tx_reg1, u32 val)
+{
+	if (enable) {
+		/* Enable V&I sensing */
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      val);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      val);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+	} else {
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+	}
+}
+
+static void wsa_macro_enable_disable_vi_feedback(struct snd_soc_component *component,
+						 bool enable, u32 rate)
+{
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 tx_reg0, tx_reg1;
+
+	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+	}
+
+	if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+
+	}
+
+}
+
 static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *kcontrol,
 					int event)
@@ -1203,45 +1270,11 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 			/* Enable V&I sensing */
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* Disable V&I sensing */
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
 		break;
 	}
 

-- 
2.25.1

