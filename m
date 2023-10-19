Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D497CFE12
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 17:38:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86950844;
	Thu, 19 Oct 2023 17:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86950844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697729903;
	bh=X9Xw0NSbM4goJc/MQqALLGsnyj/Ebs6lMKLJmapXHiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QKjTpOt+IRj5bSSi0Dhvpg51qJnYZFdrz+gkkvyBUceGRcPzHfKDHjLgdKCOtI7Gd
	 uwcYNFqVDJTHG3zowYz5fyI1YDGL+qGfVhXZmO8657i00wNIWD8YMF0xSSGnQ8thxL
	 NuUaVyx2J7QNcusdDjiTmhENtYoQaq+KGFI8WzKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5247AF80536; Thu, 19 Oct 2023 17:37:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE85F8025F;
	Thu, 19 Oct 2023 17:37:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43398F8027B; Thu, 19 Oct 2023 17:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C520EF8024E
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 17:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C520EF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XiNep+jk
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53db1fbee70so13618772a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697729761; x=1698334561;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BSOa/ysYuWf3yTm4IHQkqxUatJT3g/WJSTaVnMkDXw=;
        b=XiNep+jkRrB8h4io4eUzLNyQ11frLtQsvr2aIS8D0OpNFd3B8JeDaCG57bbC4LTTso
         i6tGn/t8WBkmbQk7TiHAbuJNs3bfo99HdGJ0ZaNUFVhjsdzNHC2LwIIkh179CsWX0mUG
         DkV9A3LjtN+EHXpJmlQK/beabG/izF3ZUutTkq0lks1HKwXemSOZMU6iJHzsVex1/Q2f
         qOuakGn5CmWzEDM73Y9Uv+CWdJBxekUgMixoRakp9sP7c8g+cTBx82QutalXYDzMIPSz
         NlnPMb4uN9l9zq5Cs5JxyFCd2h+RakCJgqBLrzsZSRHqTQi13/wxDXHRi8VW3DWlHcaJ
         ScZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697729761; x=1698334561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BSOa/ysYuWf3yTm4IHQkqxUatJT3g/WJSTaVnMkDXw=;
        b=PUCMbUliB7Cezsc+n1eRRRe0rycQP0MwKFMeq1qg2kOteL65KyRcAa1L+a8ZxQF87O
         N6+V+GwbtFdtzvtU8Nvz+DVmOuJnu7yfWQ8Z6rY5fyj5K9HA0+lzjpNG8MmbKp0HUTaj
         LSLn9IWYCqTttPGqTenFS379mG7rZZqRFaI8uvdGHwSE0wBrXGrSgkBdW3k28317GPvH
         eUoOwLlhnQkwmYB3Yvz8SqXHgzld6lzjyph0z0W/ggQU4bXW/PpqWF+xX4wF59yTdOQh
         dDHgdCn+VCS0/v0/R7RDAShK2b8L5JS6NZSQoKFpgRxO2nLIx+gj0RaTR5aJlGX5oXRy
         gs5g==
X-Gm-Message-State: AOJu0Yy9MK48rCLRP24tC1pdYBjx1tNfPI+mRkhq22hP6pcZUkd5vJH+
	0gxZTUQx12Y8AzxnNDaq1PZpOA==
X-Google-Smtp-Source: 
 AGHT+IFXYH7+hKuQQl+Fqbwy+yO2TSI4ihbMrNPxs0SPhL+f20RzcSdgUJdVyGGNe4Mo2eUVbR2SKA==
X-Received: by 2002:a50:9e87:0:b0:53e:34c5:ad8e with SMTP id
 a7-20020a509e87000000b0053e34c5ad8emr2060982edf.19.1697729761711;
        Thu, 19 Oct 2023 08:36:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 c64-20020a509fc6000000b0053ebafe7a60sm4743875edf.59.2023.10.19.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:36:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: Add support for WSA2 LPASS
Date: Thu, 19 Oct 2023 17:35:41 +0200
Message-Id: <20231019153541.49753-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
References: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22WTQMCJ6WTULUH3H2TUAQXD522HAONN
X-Message-ID-Hash: 22WTQMCJ6WTULUH3H2TUAQXD522HAONN
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22WTQMCJ6WTULUH3H2TUAQXD522HAONN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for Qualcomm WSA2 LPASS (Low Power Audio SubSystem) audio
ports to several Qualcomm ADSP drivers: Q6APM LPASS DAIs, Q6DSP LPASS
ports and shared Q6DSP Soundwire code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c  | 5 +++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 6 ++++++
 sound/soc/qcom/sdw.c                     | 5 +++++
 3 files changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index c5e065a21e27..2ae10f9dc78e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -36,6 +36,9 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 	case WSA_CODEC_DMA_TX_0:
 	case WSA_CODEC_DMA_TX_1:
 	case WSA_CODEC_DMA_TX_2:
+	case WSA2_CODEC_DMA_TX_0:
+	case WSA2_CODEC_DMA_TX_1:
+	case WSA2_CODEC_DMA_TX_2:
 	case VA_CODEC_DMA_TX_0:
 	case VA_CODEC_DMA_TX_1:
 	case VA_CODEC_DMA_TX_2:
@@ -60,6 +63,8 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+	case WSA2_CODEC_DMA_RX_0:
+	case WSA2_CODEC_DMA_RX_1:
 	case RX_CODEC_DMA_RX_0:
 	case RX_CODEC_DMA_RX_1:
 	case RX_CODEC_DMA_RX_2:
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4919001de08b..a6502884531d 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -557,6 +557,11 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_CDC_DMA_RX_DAI(WSA_CODEC_DMA_RX_1),
 	Q6AFE_CDC_DMA_TX_DAI(WSA_CODEC_DMA_TX_1),
 	Q6AFE_CDC_DMA_TX_DAI(WSA_CODEC_DMA_TX_2),
+	Q6AFE_CDC_DMA_RX_DAI(WSA2_CODEC_DMA_RX_0),
+	Q6AFE_CDC_DMA_TX_DAI(WSA2_CODEC_DMA_TX_0),
+	Q6AFE_CDC_DMA_RX_DAI(WSA2_CODEC_DMA_RX_1),
+	Q6AFE_CDC_DMA_TX_DAI(WSA2_CODEC_DMA_TX_1),
+	Q6AFE_CDC_DMA_TX_DAI(WSA2_CODEC_DMA_TX_2),
 	Q6AFE_CDC_DMA_TX_DAI(VA_CODEC_DMA_TX_0),
 	Q6AFE_CDC_DMA_TX_DAI(VA_CODEC_DMA_TX_1),
 	Q6AFE_CDC_DMA_TX_DAI(VA_CODEC_DMA_TX_2),
@@ -622,6 +627,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 			q6dsp_audio_fe_dais[i].ops = cfg->q6tdm_ops;
 			break;
 		case WSA_CODEC_DMA_RX_0 ... RX_CODEC_DMA_RX_7:
+		case WSA2_CODEC_DMA_RX_0 ... WSA2_CODEC_DMA_TX_2:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6dma_ops;
 			break;
 		default:
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 1a41419c7eb8..612865b26f88 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -21,6 +21,8 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+	case WSA2_CODEC_DMA_RX_0:
+	case WSA2_CODEC_DMA_RX_1:
 	case RX_CODEC_DMA_RX_0:
 	case RX_CODEC_DMA_RX_1:
 	case TX_CODEC_DMA_TX_0:
@@ -70,6 +72,7 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+	case WSA2_CODEC_DMA_RX_0:
 	case RX_CODEC_DMA_RX_0:
 	case RX_CODEC_DMA_RX_1:
 	case TX_CODEC_DMA_TX_0:
@@ -98,6 +101,8 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+	case WSA2_CODEC_DMA_RX_0:
+	case WSA2_CODEC_DMA_RX_1:
 	case RX_CODEC_DMA_RX_0:
 	case RX_CODEC_DMA_RX_1:
 	case TX_CODEC_DMA_TX_0:
-- 
2.34.1

