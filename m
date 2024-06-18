Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688090D55C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D9183E;
	Tue, 18 Jun 2024 16:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D9183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718721352;
	bh=XbOLlOWlwcD1EYYwvE5qAsvZWmsWuvVl0dXINENlJqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W9hHqMnlWroeTqVm8Wecmx9Ok214BhP+5uKnNpS8GcTn+qAki+vCoTuO0YGS0qWrB
	 JkQwlZMCPWm6sxMaJW3htgkUC4gE3dOngGTFiDPC3CzmyPRLNbKkZsQ3Dj10v4/iuI
	 ZLUmXF7i4Zig1jiLuoifgIQYsQdQJykMU604bJiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91E38F805AB; Tue, 18 Jun 2024 16:35:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F7E6F80589;
	Tue, 18 Jun 2024 16:35:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 206AFF8023A; Tue, 18 Jun 2024 16:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4732FF800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 16:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4732FF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VxUI/FGV
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35f06861ae6so4788056f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jun 2024 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718721311; x=1719326111;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mT8eUKe7uKBDcnOx0sNjTt1FDPm4Rm6266oWd39xCYo=;
        b=VxUI/FGVsqe4IXtRk/xgry5+K2lpdVRh5idro8AkA0oCWabnxfbVdCq2OVZ1MPXhCw
         6OBHVbK8HzndUtFwuwkA+yDxdkcFylZ10pSCtaU/53DO3d/79/vKzfoCCj4GgZx/ENb8
         w5d+4j1FEwFXGrg+phgQB+EY1i114+TVUFjUgLyyH2sIxBhvTxcrRzbJtMy0eQAsXyC5
         OWFeLgfGD9wlKwrMSm4/lneaUsY2986TKcq0Q0qp68UVfUsV/QZIelLz+twUry0v9188
         GL/7eXrNEiXjZBuKBxwhGtH/KA3ofuF5TXVIMdMbHTxbBMWcFNIl9aCzPbBGFe84i+dT
         boTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721311; x=1719326111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT8eUKe7uKBDcnOx0sNjTt1FDPm4Rm6266oWd39xCYo=;
        b=miLPDv7/jpDMOS8+JGajU2XDWWGL4XpARLs/JIlZLkgBqOYabFq638BbUfAMJugMJr
         WyhJSrk8wUjr2fNGRzvYxieRSKRWua3AqNJtHul/jnHLlpmkAaSmGbiNkwNx8lnWqQe8
         luuD0DRnNFxB1kQUys6AwoevmAYUUA85KhDRlxCPqQyrTfJFQyUbMWVwToGZio1itp3p
         +pzcxihbydFSqxSLEAeps2SX71Qw1cP0iy9NN7HOYJmDQ3LlPbB2vPuz4Ol6Oqx+JMdS
         jEvuOUvcS0wK+0TRoSVwLL2IwiHkMbMelbWmAUy3PgNhY0jwWKqqwcCSOtvhz0JdW9+G
         7Ebg==
X-Gm-Message-State: AOJu0YyTWLLPBznLcP7MgvQO4M4oIQ1jaskLpmVq8zD2gQ4CaaJYQXVr
	bHyDLVCQx4zTD7gKLxG5/rbk7n18B/iwtsobRKcFuI15Z/7BDntBpA2Whf91ExSw4sXEKHHElnY
	bRYo=
X-Google-Smtp-Source: 
 AGHT+IHT9mgFIP4gnreH1Y2uJj9kPskt5MMHqGXeZ9KFWYTuiCUeGqK0leKSOhfBMrPQANcKRdxP7Q==
X-Received: by 2002:a05:6402:2881:b0:57d:c8:d295 with SMTP id
 4fb4d7f45d1cf-57d00c9385fmr771440a12.4.1718718558796;
        Tue, 18 Jun 2024 06:49:18 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbdfe1428sm6678397a12.27.2024.06.18.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:49:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 14:49:00 +0100
Subject: [PATCH 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-lpass-wsa-vi-v1-1-416a6f162c81@linaro.org>
References: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
In-Reply-To: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=XbOLlOWlwcD1EYYwvE5qAsvZWmsWuvVl0dXINENlJqE=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZBc9D7yd3a5UzFrmBLYPMBR3Ul/av8RYu1jp
 AzNLuv0aYGJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGQXAAKCRB6of1ZxzRV
 N1oBB/9ZFw/xEXGQ83UmQrU2jJQjhaofE3cC2STGIKGSKk+FJThNkXePz/nsaUlq+jS3SkPejGx
 ezNvz9MKSAClo2teAXL++zyAVx3vj/V27DkNGBAo9XshdHCl75B3dvtCRqd55US4Hs+OuKY9SQT
 HnWhy2NzMhFK4knArLNnhoIzZe/hijWhfigU1bPD6rJsKZldekk6nryqs/0J+kK7kUrEzi6l5Mq
 LIL97KGRCVc+nazheV3t9wOusLYmEs+4Za+/0+o1UgjB02kSkaatAcZ1hPgmGDSk1TZUzCEgLMl
 +PGrImS171EIMWVKgqdYQzo99POMH/JANZIqv0fKZhj8cP4T
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: 7RMU6R7AHGESOW7HDF6O4DAC2FO4JY2P
X-Message-ID-Hash: 7RMU6R7AHGESOW7HDF6O4DAC2FO4JY2P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RMU6R7AHGESOW7HDF6O4DAC2FO4JY2P/>
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
 sound/soc/codecs/lpass-wsa-macro.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..7b6d495ef596 100644
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
@@ -986,6 +992,10 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		if (dai->id == WSA_MACRO_AIF_VI)
+			wsa->pcm_rate_vi = params_rate(params);
+
 	default:
 		break;
 	}
@@ -1159,6 +1169,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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
@@ -1179,10 +1211,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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

