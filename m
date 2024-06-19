Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9F90EF41
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 15:43:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BCDE82;
	Wed, 19 Jun 2024 15:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BCDE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718804580;
	bh=k9yry0x1tI/DYruAhQA7fXL7Cnn7I6rwM4/ndUzrwrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HoOZ6f/mfVThk5UHOdPHNZx5tXYiyr4Y6J/pAJdDNnxBdFNj5mTcLu60QJLS/aBRC
	 4ygG7ZBPWEyeJWryCOERJumhynpc3EHZSGfYeTobMCm9AtQZjbBUqJ44xkZiu5ETd2
	 PD5Gafh9koa1NBI5Dd8Rwyj9ciFSfzosok9Krht4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E0D1F805E3; Wed, 19 Jun 2024 15:42:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96C93F805C9;
	Wed, 19 Jun 2024 15:42:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70F0FF8023A; Wed, 19 Jun 2024 15:42:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95586F80154
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 15:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95586F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LxpBbXyk
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52cccd44570so657012e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jun 2024 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718804527; x=1719409327;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqG7W4vsUEFDpItqcWYue/XYKARV+F1uUdRAmQJH5WU=;
        b=LxpBbXyk1zk+lpffflYrPWPf508E1ufXL6S5vs50+4OW+FRBNUmoijQ7RFbSyEDn0o
         blVmSw5Z1j4rk8psj3z2wV40PviaN1ESiytIZ/7Ih6DBo4Hn/yrhUIE5BsIavTb86K2O
         mpEqGjVIuXM+XUZ6SeXQy49PCyQ0qwe3LG3q/pHuIJelqmbawt8++SA9Oq1X8JaTrZkI
         E6XmP38be7BFr7bzliv4xKCPe+9GgRaMdssRjgxAkTPPwtnao/VfZXyOeS17dDBd2k86
         X7Xyj4wMMT62Gn8ViFOGiHf1zxKSwy7Bm4MB5W0fHEdANeRFSe/Tki3zjvKa6ixoK/NG
         d1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718804527; x=1719409327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqG7W4vsUEFDpItqcWYue/XYKARV+F1uUdRAmQJH5WU=;
        b=QPBrHcIMNAU4jD8+7S0lQjx5hyeKLft+xJ1jNkxyvy0LYUwgDyb97WTzU3oYJoyP9e
         HjJMLlYkIpt8hnKGsynPvNoIYujULMUGNarjZPslZV6e6Hz53ls9BsubvE9Vgmg6riOy
         xmBQBTkVW13aaXH78edgqBmpS0Z6NpKXMyTMqF5TqH+IhKjnzhWh2krC2+fJx+qG4t0t
         rk5pg9c71Y7w/srP6k5cCvqLFjUBZNztTUvDlcy2LShrlDq5F4IM/2cww3OsDMpkBPOy
         Y8vVEhTJaccM0aXzrJ26rlMO5qRA6gKuHH+WBFy4jzrAjql1lv71ArqPuCCymkt5Nnlo
         H7jw==
X-Gm-Message-State: AOJu0YzibMe0YQMhC1ke/aQpBAbDLnvztabtgUlWufRVP3bWp9bZ8cJB
	TbOOWT8HhMWEKXE3NfTCpqSl/EjbeffQ+FJnI1f2XSUId3HSCyQVhjKOgzRmGw2QdyMvPzwepV8
	N2bc=
X-Google-Smtp-Source: 
 AGHT+IG0QObZ8D+w+vfiFfGk4A3wWZ/+yy902ax8lcbmkRjM6EjVLp3sZqUq/XmJ+Tbwt9b/SL9u1A==
X-Received: by 2002:a05:6512:33c9:b0:52c:8a4e:f4bf with SMTP id
 2adb3069b0e04-52ccaa98d21mr1608954e87.51.1718804525621;
        Wed, 19 Jun 2024 06:42:05 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4229c60f758sm251639505e9.20.2024.06.19.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:42:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 19 Jun 2024 14:42:00 +0100
Subject: [PATCH v2 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-lpass-wsa-vi-v2-1-7aff3f97a490@linaro.org>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
In-Reply-To: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3882;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=k9yry0x1tI/DYruAhQA7fXL7Cnn7I6rwM4/ndUzrwrY=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcuArTnuTeqCt7QYNfZuRWG2mF/M+R4MypmoAM
 Jb+3llU/MWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnLgKwAKCRB6of1ZxzRV
 N5N9B/42MjFdIVdRluns1Wk5nB11XhbXa0yUC0tzwsZmpRIeqgWVGY7O4ucCA+OXMrek8yaLA2W
 H2F6fALzPvxVkgbEAZRfLo1Rb2GYd/RIGk0ZS5aPNxGtcUlPy4D72oqeZEkQJF7due68f0xIUi5
 ZYlxXPwqWERVLh4LtWmIh5RyabRk+z87b/HgmDSilGhsNGuUvaAoMpbY6VowJfALSLoxvLsObdC
 cUETwLGzZrYn8wge5SoRTl8iefYWfFVNVvp5kK1JCbdrVube6FfYtGFibfUhpbnXgCcq4CrVIsY
 1U94s56FIaaMfgKAA3yzcfeXX1EH5iFnF6WiYjQ21wUkXL6a
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: LKU2LSTBRFEE2J7E3Z5IJIPU7O2DXEYR
X-Message-ID-Hash: LKU2LSTBRFEE2J7E3Z5IJIPU7O2DXEYR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKU2LSTBRFEE2J7E3Z5IJIPU7O2DXEYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the VI feedback rate is set to fixed 8K, fix this by getting
the correct rate from params_rate.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 39 +++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..ec9f0b5d6778 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -66,6 +66,10 @@
 #define CDC_WSA_TX_SPKR_PROT_CLK_DISABLE	0
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK	GENMASK(3, 0)
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K	0
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K	1
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K	2
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K	3
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K	4
 #define CDC_WSA_TX0_SPKR_PROT_PATH_CFG0		(0x0248)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CTL		(0x0264)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CFG0		(0x0268)
@@ -347,6 +351,7 @@ struct wsa_macro {
 	int ear_spkr_gain;
 	int spkr_gain_offset;
 	int spkr_mode;
+	u32 pcm_rate_vi;
 	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
 	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
 	struct regmap *regmap;
@@ -974,6 +979,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (substream->stream) {
@@ -985,6 +991,11 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 				__func__, params_rate(params));
 			return ret;
 		}
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		if (dai->id == WSA_MACRO_AIF_VI)
+			wsa->pcm_rate_vi = params_rate(params);
+
 		break;
 	default:
 		break;
@@ -1159,6 +1170,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	u32 tx_reg0, tx_reg1;
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
 
 	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
 		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
@@ -1170,7 +1203,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-			/* Enable V&I sensing */
+		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1179,10 +1212,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);

-- 
2.25.1

