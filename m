Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8E6FC4ED
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 13:24:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE8031115;
	Tue,  9 May 2023 13:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE8031115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683631498;
	bh=kkHwK4m8OKrTUYq7o5x1gZ7ZK6ezvwC/iRVd7xGy6JY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LlQz9/Eeif00P0YWoPGbKW+dSMH9wF5Sd6umWWatENbA7/cnsB6GXV+cDAhRcMN/0
	 HjkoCL2a+Nurwq72yY+8LL5Xh5E87RPsLjXU+rFDkZmcTh229x0IeNfwHyouA+KT9O
	 CLOglCXTJc3D2uVqBGsbeKBUO7BWN/Ebht6vn6O4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 781DBF8032D;
	Tue,  9 May 2023 13:24:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95961F8032D; Tue,  9 May 2023 13:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31614F80310
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 13:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31614F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hf+jL8rK
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30786c6082dso2189691f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631329; x=1686223329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfCcSveqMLGp6QUetB3KVscfku26PhF2QBUjnUp0yPg=;
        b=hf+jL8rKFKU/v9sPw7R1ubkn+2T4ZkSGkcWBbVdVE07z1Ve56+FJ3kVtfsRMcN6ypg
         Xhny7KBwyBSPiiW0RcXqvma4g5OvYsZPpLB04M36yBRzFnPM3JVFzUZZx09gopbsxJRT
         4GlLwiPrhNA746L4BgTnKRIpaGgo8Vv+q82XC2V42+e9swXlgSEz21dy3pvJ59LXcN+9
         TfcJRpXd8n91X3Vv8yEoiXnYAZRV0H204DgSChKjT+4cWLs5lsHExmCqx1Ld0HybPgkp
         /BPSjXcE2GGNWGXaRhwwH+31oplxz4pMIV9zwIZJfEqzzWoCLidjXxLoOjqQcUnmZCHE
         4rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631329; x=1686223329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfCcSveqMLGp6QUetB3KVscfku26PhF2QBUjnUp0yPg=;
        b=LltvI1qc6szVhmss3aQmN4Q6tT+fQi5tRZ+taPVGzVeBt2cl6IQv0G7eDTKSgsihkL
         fCTzd6pJvDyMBhmccBCAh+92Hn8Qpr2TKmSXe5l1zFq0WVJOr9bIMjNQY48MubdEgBKo
         III+4+7CIej2Rb5BYEzQSQBUJAL394mzYdyjmEr4mLM4rpnm6WbmykCkyFwqwGvKLbY4
         LcwQFEutjiYah2y/h645AHeThav4idUnLjmP9LcRdTf03WdqL1ByJF2LEQrds6r+09co
         HRdkJC9HBfv+6HqqOyr/rRMwI+p+Aa371RT5nYO+UdEkkCIzaOExmfQg3QPAGLAabgFZ
         OxVw==
X-Gm-Message-State: AC+VfDx+g4ZZGsZnNNrf/Jf2Z5Imas7vpSE49eI8xnZKOMCFBxAaKtM9
	v+fTFlOIpLrHpdsotM4qP/YgHQ==
X-Google-Smtp-Source: 
 ACHHUZ4NfB6pOeQ+HCgyqUG13YvNskOphBJkvvnDI9c2105UhklBZPaUEJCG+Wya5o9tKFl3aeNXYw==
X-Received: by 2002:a5d:5746:0:b0:306:4239:4cd with SMTP id
 q6-20020a5d5746000000b00306423904cdmr9658659wrw.31.1683631329129;
        Tue, 09 May 2023 04:22:09 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f17eded97bsm19531072wmd.19.2023.05.09.04.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:22:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/4] ASoC: qcom: q6dsp: add support to more display ports
Date: Tue,  9 May 2023 12:22:01 +0100
Message-Id: <20230509112202.21471-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
References: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HR5B4FR7GFL4MXJOHD5KG7U62GJ3SVPX
X-Message-ID-Hash: HR5B4FR7GFL4MXJOHD5KG7U62GJ3SVPX
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HR5B4FR7GFL4MXJOHD5KG7U62GJ3SVPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Existing code base only supports one display port, this patch adds
support upto 8 display ports. This support is required to allow platforms
like X13s which have 3 display ports, and some of the Qualcomm SoCs
there are upto 7 Display ports.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-lpass-ports.h            |  8 ++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 43 ++++++++++++-------
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 9f7c5103bc82..39f203256c4f 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -131,6 +131,14 @@
 #define RX_CODEC_DMA_RX_7	126
 #define QUINARY_MI2S_RX		127
 #define QUINARY_MI2S_TX		128
+#define DISPLAY_PORT_RX_0	DISPLAY_PORT_RX
+#define DISPLAY_PORT_RX_1	129
+#define DISPLAY_PORT_RX_2	130
+#define DISPLAY_PORT_RX_3	131
+#define DISPLAY_PORT_RX_4	132
+#define DISPLAY_PORT_RX_5	133
+#define DISPLAY_PORT_RX_6	134
+#define DISPLAY_PORT_RX_7	135
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index f67c16fd90b9..ac937a6bf909 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -79,6 +79,22 @@
 		.id = did,						\
 	}
 
+#define Q6AFE_DP_RX_DAI(did) {						\
+		.playback = {						\
+			.stream_name = #did" Playback",			\
+			.rates = SNDRV_PCM_RATE_48000 |			\
+				SNDRV_PCM_RATE_96000 |			\
+				SNDRV_PCM_RATE_192000,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE,		\
+			.channels_min = 2,				\
+			.channels_max = 8,				\
+			.rate_min = 48000,				\
+			.rate_max = 192000,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
 
 static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	{
@@ -528,22 +544,14 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_TDM_CAP_DAI("Quinary", 5, QUINARY_TDM_TX_5),
 	Q6AFE_TDM_CAP_DAI("Quinary", 6, QUINARY_TDM_TX_6),
 	Q6AFE_TDM_CAP_DAI("Quinary", 7, QUINARY_TDM_TX_7),
-	{
-		.playback = {
-			.stream_name = "Display Port Playback",
-			.rates = SNDRV_PCM_RATE_48000 |
-				 SNDRV_PCM_RATE_96000 |
-				 SNDRV_PCM_RATE_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
-			.channels_min = 2,
-			.channels_max = 8,
-			.rate_max =     192000,
-			.rate_min =	48000,
-		},
-		.id = DISPLAY_PORT_RX,
-		.name = "DISPLAY_PORT",
-	},
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_0),
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_1),
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_2),
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_3),
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_4),
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_5),
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_6),
+	Q6AFE_DP_RX_DAI(DISPLAY_PORT_RX_7),
 	Q6AFE_CDC_DMA_RX_DAI(WSA_CODEC_DMA_RX_0),
 	Q6AFE_CDC_DMA_TX_DAI(WSA_CODEC_DMA_TX_0),
 	Q6AFE_CDC_DMA_RX_DAI(WSA_CODEC_DMA_RX_1),
@@ -603,6 +611,9 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case DISPLAY_PORT_RX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6hdmi_ops;
 			break;
+		case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+			q6dsp_audio_fe_dais[i].ops = cfg->q6hdmi_ops;
+			break;
 		case SLIMBUS_0_RX ... SLIMBUS_6_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6slim_ops;
 			break;
-- 
2.21.0

