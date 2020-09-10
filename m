Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C782643AF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 12:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FA1F1673;
	Thu, 10 Sep 2020 12:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FA1F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599733182;
	bh=rhrEcdBOQ6Wwzo5QEkrWrr1c4R2mFPZitCYPMWW5mxA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdpbA4J2dPVIF8auTqjnOxcV6a3rYVCgt1SA+mHtySHvz6T7PigOsv45tI8qQ/wmC
	 nXzkVgUYy5W5NBLg0bWFjwdvlnz+EVsqDPlFIVaYFH0880+GzNUNdOY7KVqHi65X/o
	 hSyR7f7vhGZHKkSNDovCxAxR2TR5s/tVQ0v7alww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14DBCF800E9;
	Thu, 10 Sep 2020 12:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 070F1F802C2; Thu, 10 Sep 2020 12:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFECCF800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 12:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFECCF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FWqAdG33"
Received: by mail-wr1-x442.google.com with SMTP id s12so6043603wrw.11
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XiTDwe0DE6I7Qq6iJehCoT2zSGDBsTZiTs0CApOPA1I=;
 b=FWqAdG33IxMr+QgyxdRqUDWiYgJsK8hTsj1WMNseY5YWkHruSHbiEken0vXLzsuv3L
 CWDZaqI+bxxqe24R2Lu++jFMvrDaTD4qiZnN/4Xv1Citx8DDaz8LapDrZIsAgMfq06nP
 KtXqkfwDhaTfoYWS5LNXGWaIVZmyg7lYXYbvzLZU0+0phvgbKG+WVpEhG3YDYrUD4/Pb
 b5IWVUFMHez3kOAmU8bGxtrpgZrPOjQUITEQsJP/5/Ecxx75H5DOSHxqPVHaSPQYz9xa
 8XmL0dfz1BtqFgCUikJAQKHCuI1fhsmjHiI6kBmeZwf1wex3MQpzOLdqpVfEd++3f42Z
 0r4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XiTDwe0DE6I7Qq6iJehCoT2zSGDBsTZiTs0CApOPA1I=;
 b=BmFsK0d2ILRyNwGDwluFKEWDAdG/HkNSo2qhBemdCAkSxgv3vWEhonkYrU7N1AvVe3
 Zo6OxVQU+AbbyXFRSUR1z6hkaGEljvKtv2mC//+Pf8RmmEX2gHA9kiiEeMxRXe+Mb5Ds
 Ye26WZQEzhduO3QiWK31j5a2A7dQB5wniv+OzSSb7qpBGrqVKNRs7mbu6At4Q9FXYmge
 JPTkv/tII3WYgAkcEOOFZzW7VQSFXADYWCoz/0X4ANHR9+cqef19PqIERaHlp6rx9Rzl
 LUTFJMQxdICt0RG7jeDDz4HkvQd3j9Ky8CUqMOFzdhI0tRNW15rJfasalLucxUo5+dOx
 jqzw==
X-Gm-Message-State: AOAM530KgVxPRPxafXKvzUJYDHfLBPUzfgq6nJVMYtdG3Fs6wmVyhYT4
 SMSYnIEaOUuBdCUelaD8zpnfLg==
X-Google-Smtp-Source: ABdhPJz9heXgS8rFxJS0nXHKUiSQmu7ZR9KnDg2SgCKZBNu8QkHR6CIg7pqKUo9m1ZUWj95R+WtbyA==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr9051472wrq.204.1599733069852; 
 Thu, 10 Sep 2020 03:17:49 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm8851731wro.18.2020.09.10.03.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:17:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/8] ASoC: q6dsp: q6routing: add support to Codec DMA ports
Date: Thu, 10 Sep 2020 11:17:26 +0100
Message-Id: <20200910101732.23484-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
References: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 121 ++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 25d23e0266c7..b12539fae6ed 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -113,7 +113,19 @@
 	{ mix_name, "QUIN_TDM_TX_4", "QUIN_TDM_TX_4"},		\
 	{ mix_name, "QUIN_TDM_TX_5", "QUIN_TDM_TX_5"},		\
 	{ mix_name, "QUIN_TDM_TX_6", "QUIN_TDM_TX_6"},		\
-	{ mix_name, "QUIN_TDM_TX_7", "QUIN_TDM_TX_7"}
+	{ mix_name, "QUIN_TDM_TX_7", "QUIN_TDM_TX_7"},		\
+	{ mix_name, "WSA_CODEC_DMA_TX_0", "WSA_CODEC_DMA_TX_0"},	\
+	{ mix_name, "WSA_CODEC_DMA_TX_1", "WSA_CODEC_DMA_TX_1"},	\
+	{ mix_name, "WSA_CODEC_DMA_TX_2", "WSA_CODEC_DMA_TX_2"},	\
+	{ mix_name, "VA_CODEC_DMA_TX_0", "VA_CODEC_DMA_TX_0"},	\
+	{ mix_name, "VA_CODEC_DMA_TX_1", "VA_CODEC_DMA_TX_1"},	\
+	{ mix_name, "VA_CODEC_DMA_TX_2", "VA_CODEC_DMA_TX_2"},	\
+	{ mix_name, "TX_CODEC_DMA_TX_0", "TX_CODEC_DMA_TX_0"},	\
+	{ mix_name, "TX_CODEC_DMA_TX_1", "TX_CODEC_DMA_TX_1"},	\
+	{ mix_name, "TX_CODEC_DMA_TX_2", "TX_CODEC_DMA_TX_2"},	\
+	{ mix_name, "TX_CODEC_DMA_TX_3", "TX_CODEC_DMA_TX_3"},	\
+	{ mix_name, "TX_CODEC_DMA_TX_4", "TX_CODEC_DMA_TX_4"},	\
+	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"}
 
 #define Q6ROUTING_TX_MIXERS(id)						\
 	SOC_SINGLE_EXT("PRI_MI2S_TX", PRIMARY_MI2S_TX,			\
@@ -267,6 +279,42 @@
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("QUIN_TDM_TX_7", QUINARY_TDM_TX_7,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("WSA_CODEC_DMA_TX_0", WSA_CODEC_DMA_TX_0,	\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("WSA_CODEC_DMA_TX_1", WSA_CODEC_DMA_TX_1,	\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("WSA_CODEC_DMA_TX_2", WSA_CODEC_DMA_TX_2,	\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("VA_CODEC_DMA_TX_0", VA_CODEC_DMA_TX_0,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("VA_CODEC_DMA_TX_1", VA_CODEC_DMA_TX_1,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("VA_CODEC_DMA_TX_2", VA_CODEC_DMA_TX_2,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_0", TX_CODEC_DMA_TX_0,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_1", TX_CODEC_DMA_TX_1,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_2", TX_CODEC_DMA_TX_2,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_3", TX_CODEC_DMA_TX_3,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_4", TX_CODEC_DMA_TX_4,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_5", TX_CODEC_DMA_TX_5,		\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),
 
@@ -609,6 +657,36 @@ static const struct snd_kcontrol_new quin_tdm_rx_6_mixer_controls[] = {
 static const struct snd_kcontrol_new quin_tdm_rx_7_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(QUINARY_TDM_RX_7) };
 
+static const struct snd_kcontrol_new wsa_codec_dma_rx_0_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(WSA_CODEC_DMA_RX_0) };
+
+static const struct snd_kcontrol_new wsa_codec_dma_rx_1_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(WSA_CODEC_DMA_RX_1) };
+
+static const struct snd_kcontrol_new rx_codec_dma_rx_0_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_0) };
+
+static const struct snd_kcontrol_new rx_codec_dma_rx_1_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_1) };
+
+static const struct snd_kcontrol_new rx_codec_dma_rx_2_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_2) };
+
+static const struct snd_kcontrol_new rx_codec_dma_rx_3_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_3) };
+
+static const struct snd_kcontrol_new rx_codec_dma_rx_4_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_4) };
+
+static const struct snd_kcontrol_new rx_codec_dma_rx_5_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_5) };
+
+static const struct snd_kcontrol_new rxcodec_dma_rx_6_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_6) };
+
+static const struct snd_kcontrol_new rx_codec_dma_rx_7_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_7) };
+
 
 static const struct snd_kcontrol_new mmul1_mixer_controls[] = {
 	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA1) };
@@ -819,6 +897,37 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("QUIN_TDM_RX_7 Audio Mixer", SND_SOC_NOPM, 0, 0,
 				quin_tdm_rx_7_mixer_controls,
 				ARRAY_SIZE(quin_tdm_rx_7_mixer_controls)),
+
+	SND_SOC_DAPM_MIXER("WSA_CODEC_DMA_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		wsa_codec_dma_rx_0_mixer_controls,
+		ARRAY_SIZE(wsa_codec_dma_rx_0_mixer_controls)),
+	SND_SOC_DAPM_MIXER("WSA_CODEC_DMA_RX_1 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		wsa_codec_dma_rx_1_mixer_controls,
+		ARRAY_SIZE(wsa_codec_dma_rx_1_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rx_codec_dma_rx_0_mixer_controls,
+		ARRAY_SIZE(rx_codec_dma_rx_0_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_1 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rx_codec_dma_rx_1_mixer_controls,
+		ARRAY_SIZE(rx_codec_dma_rx_1_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_2 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rx_codec_dma_rx_2_mixer_controls,
+		ARRAY_SIZE(rx_codec_dma_rx_2_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_3 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rx_codec_dma_rx_3_mixer_controls,
+		ARRAY_SIZE(rx_codec_dma_rx_3_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_4 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rx_codec_dma_rx_4_mixer_controls,
+		ARRAY_SIZE(rx_codec_dma_rx_4_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_5 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rx_codec_dma_rx_5_mixer_controls,
+		ARRAY_SIZE(rx_codec_dma_rx_5_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_6 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rxcodec_dma_rx_6_mixer_controls,
+		ARRAY_SIZE(rxcodec_dma_rx_6_mixer_controls)),
+	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_7 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		rx_codec_dma_rx_7_mixer_controls,
+		ARRAY_SIZE(rx_codec_dma_rx_7_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
 		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
@@ -901,6 +1010,16 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("QUIN_TDM_RX_5 Audio Mixer", "QUIN_TDM_RX_5"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUIN_TDM_RX_6 Audio Mixer", "QUIN_TDM_RX_6"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUIN_TDM_RX_7 Audio Mixer", "QUIN_TDM_RX_7"),
+	Q6ROUTING_RX_DAPM_ROUTE("WSA_CODEC_DMA_RX_0 Audio Mixer", "WSA_CODEC_DMA_RX_0"),
+	Q6ROUTING_RX_DAPM_ROUTE("WSA_CODEC_DMA_RX_1 Audio Mixer", "WSA_CODEC_DMA_RX_1"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_0 Audio Mixer", "RX_CODEC_DMA_RX_0"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_1 Audio Mixer", "RX_CODEC_DMA_RX_1"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_2 Audio Mixer", "RX_CODEC_DMA_RX_2"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_3 Audio Mixer", "RX_CODEC_DMA_RX_3"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_4 Audio Mixer", "RX_CODEC_DMA_RX_4"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_5 Audio Mixer", "RX_CODEC_DMA_RX_5"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_6 Audio Mixer", "RX_CODEC_DMA_RX_6"),
+	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer", "RX_CODEC_DMA_RX_7"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia1 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia2 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia3 Mixer"),
-- 
2.21.0

