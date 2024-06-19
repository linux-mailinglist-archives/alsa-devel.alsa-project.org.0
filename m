Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C99BC90EF42
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 15:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 341D1E65;
	Wed, 19 Jun 2024 15:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 341D1E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718804598;
	bh=1VPOAv9zIMTroZQ93L+boCVkV3gJxtdAxqRuReJhhc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yq0MC7biKx+ApXJ2GuWuiO1IpiatXba5thJQQyeNlZW1b5OOUeiEpJ4Htj4Oj73FR
	 W5XGeUp5YLveGP3Jnv8W0xJyWGp4h/BBSTg2s1k+Wl084821PVOeKiRq+bnlXHp5Xp
	 b8qri4V3qSyXZCZo9+J+wScn9g0IUtFUdRIBL/zc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C153F805FD; Wed, 19 Jun 2024 15:42:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE932F805E8;
	Wed, 19 Jun 2024 15:42:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA136F80266; Wed, 19 Jun 2024 15:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F07FF80154
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 15:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F07FF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XRatE6RQ
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42189d3c7efso67911385e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jun 2024 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718804529; x=1719409329;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiIR6yuP6t7uT4C98Yo9Rnz9eEA9tvoFuOc6X7r5ikc=;
        b=XRatE6RQZ7CTQERCVcbaZ22GbTKRJ+/IMXzHT1jPUjEnMvadVUjXbeXZBNUUrLLr0Z
         3xAYG9tBjMQxWrVmywDjJJRT30dOTwzGLg2RbyyEv2N/8d7c6Kmu9OSNsg7wzJ0Edsj7
         8PvjwsnJA+Gjp1gNNC6hSKYzzWZ7WK5Tz9erYAmE659mhvARApFigk60pEzzdAl6sn6a
         N1qoUE5Sb50PZCgbiR83MQZGGBmeLzSG2LVnOFdkQw3sT+//UnaQmfEc364uQgoQZM2z
         On5hTv7xD83BnbzYYZBVZAZfq0EfS8ab7dPRwq+l6MLd84xxaD3qTuyRVnmEC1zFo40i
         EkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718804529; x=1719409329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiIR6yuP6t7uT4C98Yo9Rnz9eEA9tvoFuOc6X7r5ikc=;
        b=vJrZkRXOlS4fvnRkVmQSvJFOIh3atY2qxauW0gxn82l02afjZj8H+9xc2hIruCWc3K
         EHd6W66AYYtXw9Gfy/KD6MydmpCvnzCx3B6urYGDcFfr2OEeGgg4aedDR/s74xTW9DD4
         SQD82Vkp1XRrRz/s+Uowbs2CmZIwxTDUWvjdAxLZowM4E0pPhrZKT4QorcB50gbmtDIN
         So9BilSaDpSwJb5JN3WT+UZG/sbb4R/J3CtaX5w2u1eRO1YJLbr3sN+jo56AYQM8Xa8o
         eodGh/js4gKAdzqCwKP2x6/bnsKUxawJdqxAWtFyf3WoyR5RMpn3NXmunJm9PoJUVhdC
         31Ew==
X-Gm-Message-State: AOJu0YyIQfBj2/yig5kCwgpUvchjW7PDuku/L/BtSY4M/R9uCLTTPxLv
	xdTPtg4Esc44eBNoWrT0gNozdbch0blD6o4XAWKNkGkHbptooDdRQhfsy/nofyYaDEQOoraW9KX
	1HSE=
X-Google-Smtp-Source: 
 AGHT+IEL2E7zktc8nOKJ1ufdgUxYq1LYBMRCdRJ9bS094cQBVvW4nNn3JAwSh7Ya50DMm7FCHGvi4g==
X-Received: by 2002:a05:600c:3b12:b0:422:1705:7549 with SMTP id
 5b1f17b1804b1-42475296a6emr20195615e9.25.1718804529047;
        Wed, 19 Jun 2024 06:42:09 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4229c60f758sm251639505e9.20.2024.06.19.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:42:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 19 Jun 2024 14:42:01 +0100
Subject: [PATCH v2 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling
 vi channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
In-Reply-To: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5620;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=1VPOAv9zIMTroZQ93L+boCVkV3gJxtdAxqRuReJhhc8=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcuArtwkiZyer7O533GpVjO78RzqhHI+cZ4KyM
 O4X8fGEpcWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnLgKwAKCRB6of1ZxzRV
 N+0RB/9+gYZdbGdZ/b70cgrn8pao6ixGcNfohMLGf+YPXIRJ7OJe6zJ4bDbEq/obMmyyviDLYJh
 AVpasiryGepcIEYZpSthUBBCiMrPERkwfXKQ6yJaGgWcM+u6GHSCgRfzrEo/bi02gTCAZ9Q38Yy
 g50u29dJFNtBiyiBSQ8aSpqMBySkqK/3i9uV54xKXBSmi7fQbqOZMKXNojFxuAmIOMJicZJivSW
 lHeOrCAa7q3AWS8WsGg1xDYs1WbZpkxIiWMDz4qcydSTkvWTm93VI8WHL98hR4gEfOkDDcst8jm
 om6ZSE7QL1LARqYchT0Yyv7AyWw97er8zJ/yh/2sz3/Xw/Q7
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: MDBU6CW7BFZFERVEAPINNOJ2MNH2UI4T
X-Message-ID-Hash: MDBU6CW7BFZFERVEAPINNOJ2MNH2UI4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDBU6CW7BFZFERVEAPINNOJ2MNH2UI4T/>
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
 sound/soc/codecs/lpass-wsa-macro.c | 112 ++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 44 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ec9f0b5d6778..e02c4f6f6061 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1163,46 +1163,11 @@ static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *kcontrol,
-					int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-	u32 tx_reg0, tx_reg1;
-	u32 rate_val;
 
-	switch (wsa->pcm_rate_vi) {
-	case 8000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
-		break;
-	case 16000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
-		break;
-	case 24000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
-		break;
-	case 32000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
-		break;
-	case 48000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
-		break;
-	default:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
-		break;
-	}
-
-	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
-	} else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
-	}
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
+static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
+						u32 tx_reg0, u32 tx_reg1, u32 val)
+{
+	if (enable) {
 		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
@@ -1212,10 +1177,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
+					      val);
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
+					      val);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
@@ -1228,9 +1193,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		/* Disable V&I sensing */
+	} else {
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1243,6 +1206,67 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
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
+static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 rate_val;
+
+	switch (wsa->pcm_rate_vi) {
+	case 8000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	case 16000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
+		break;
+	case 24000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
+		break;
+	case 32000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
+		break;
+	case 48000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
+		break;
+	default:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* Enable V&I sensing */
+		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable V&I sensing */
+		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
 		break;
 	}
 

-- 
2.25.1

