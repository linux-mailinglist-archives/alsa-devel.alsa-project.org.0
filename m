Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B2A8C9EB3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7A11F8;
	Mon, 20 May 2024 16:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7A11F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716214970;
	bh=Ch9FJ4z3MUpybsvY/Xbh0HnZsJCcfkozAQNezxUTkUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T/xJ8uDZEfBsB4B6TguY5Gh62mhESysi3aUDeZlo0ITFVH9mDEZyCN5L5hEW3yYvn
	 4Ndn5NV9DcNGATK5rshzndPPPTjjh+z1ONtaB1xX8L9wHYn5Wcn7aMtIBIhzSXBVaQ
	 0bW3OYrvM3WtlfPir5518MfmivNXzwPFDCli2l+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D593F805E6; Mon, 20 May 2024 16:21:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A25F805E8;
	Mon, 20 May 2024 16:21:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 093B7F8042F; Mon, 20 May 2024 16:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DA3AF8026A
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA3AF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dqmzC10j
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4202c0d316cso12995705e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716214812; x=1716819612;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEUon1YHmseguu1+S9mQf/195zEF4D9sn4frgRTloEU=;
        b=dqmzC10j5EqHlFijZbu1/P/trvfvQPWbKNAP2zg0R27V/ZsJenTGO+RJYvFQRxF7Ti
         +MWnXxgOM5mWMbPJUHuJBMEE7nWM/nBXFNkl8zxzyutP8j381+J5PpFYUg92h43gPkON
         Z0Alyg4uXvTqXjfA7Ni18t0G9eT1UE+vI/kLicEFX+mw+LtB85QQ3jOKT6DE7utLj41l
         N8F4Tj4HdQ8OtS/n2ClBzvrPdEQJ2RSn8L5/a8RJGpjwT4jnNjAEpxAcc+4iFJLLybfQ
         UOECOEPqwroGDg5izdD2ZG6WHggxExjA480sYiQe4lU2XnDIdaGTut0YzbY6frLkqAR8
         ZUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214812; x=1716819612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEUon1YHmseguu1+S9mQf/195zEF4D9sn4frgRTloEU=;
        b=f8d2za1+CtudPtSO5Tg91vjLRPImQtqfifCc7HggaT/Xp1J7/0lK9yFJAVBDgEjXoZ
         EQHRYJX4Lig/QbH/9f8MF9zXbUEniSPILgZ2F1mGdg+CoUmkYx2MdAFrlW2adbJx6dfN
         gFYcZBj2uzz12hXe1bliTv+hAJa45dvSsA+4/sdORBODTZvtHGPLUznxvpHKllym+VaJ
         LFQDNx33xNb5/MwV1LzXYeMo16DkFd8GtEvTLZsiP7DPpGKwPMSUafGnl7SdcGLPRV9z
         O+cVwjhN8j3aoa21asXDBW2bXQDeRjtOyfxPofM1aIZ/x3mKvghYU6hCmLmOd56kdaYm
         EcEA==
X-Gm-Message-State: AOJu0Yx/xdOTFIP5OWKlSDxwWoKRGCejbgg6VlBjZdJq71JVKhbObRbe
	gvdGxD1R6v902lVXaZjqtcCMDoxBiSGt4viD0ZpsSPdDmnQah8sENse3mRn0/g4=
X-Google-Smtp-Source: 
 AGHT+IHUzosNwd66I4RPORx0mY0lfWq2SbcRlTyOnRdHejfyAQSpGq3RH0YaVFVvxZm+LAFlfuAFTw==
X-Received: by 2002:a7b:c4ca:0:b0:41a:56b7:eb37 with SMTP id
 5b1f17b1804b1-420e1a03c81mr44876145e9.20.1716214812422;
        Mon, 20 May 2024 07:20:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee962esm421612625e9.31.2024.05.20.07.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 07:20:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 20 May 2024 16:19:58 +0200
Subject: [PATCH v4 3/4] ASoC: qcom: qdsp6: Set channel mapping instead of
 fixed defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-3-f657159b4aad@linaro.org>
References: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
In-Reply-To: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7882;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ch9FJ4z3MUpybsvY/Xbh0HnZsJCcfkozAQNezxUTkUI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmS1wUf2oripGEvBkcrPo42DDTF9UP8Q8weHDwp
 Qvz0LOFaRGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZktcFAAKCRDBN2bmhouD
 1xpSD/9Zuq3qb30zicly4zWVmFpAI+VDd0ETscZGKmFhV0HeX0jtMeFcxGIb/m1GE1xyxZIx5LI
 4ZBUjh1qixISNeFZdy1Dhur6dGwzICYyGZU3YnGAmkk9LvyWmfD3AzrqQ/lyEKHgfGkJi/sSDsh
 GzmhToq6z947LBa8dHC04Lm9VmLsz15T98wo+2RjcR5MTYaaxpa+y4hLnh6WqVvfJ+7G3Aism7E
 zOgCQDMyGkuS+Ts1BRaJOFO832gsd+S94x0VAHUteF3winIJuBCmCMvS72bOKPawL/mvzEiKEyV
 xXhsg7RPeXFtmozFCUl38k3GW9pCIs6t5e19gVEahG5EHnvCX224DhCd/WEwbIQjRXubrZz9+Xb
 ocPnWcVS5ApSJ4uXklZMuejjuZPmg/g1FAVo2536hUh9s67qUt+v9KsVHf5CtAQqo6KT81prbta
 wRvnNyPkswVT0PZDkxn+7KhQdybvUzoR3QpqlAa7Eo3sBNz0z3SEt86bsuJ7BQz6UYYUbIvympA
 xwejd+pgF+7YHGsGETtSHY+fjQFDCRwW+LTb/OQs9uGWvlVj7szBFA4+8/C6sXIRmiTupZpqWSt
 VPfMxUmjmycigLciRFhsI4L3pPB38JgiDarlsehkr9scRAGGQ8qxLd5kom3OkRigtTMiDDuCOXs
 vb0RbI4wn844gLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: Z7PSXFIFVC56QFESZG26WEXK5YSBANIN
X-Message-ID-Hash: Z7PSXFIFVC56QFESZG26WEXK5YSBANIN
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7PSXFIFVC56QFESZG26WEXK5YSBANIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When constructing packets to DSP, the Audioreach code uses 'struct
audioreach_module_config' to configure parameters like number of
channels, bitrate, sample rate etc, but uses defaults for the channel
mapping.

Rework this code to copy the channel mapping from 'struct
audioreach_module_config', instead of using the default.  This requires
all callers to fill that structure: add missing initialization of
channel mapping.

Entire patch makes code more logical and easier to follow:
1. q6apm-dai and q6apm-lpass-dais code which allocates 'struct
   audioreach_module_config' initializes it fully, so fills both
   the number of channels and the channel mapping.
2. Audioreach code, which uses 'struct audioreach_module_config' when
   constructing packets, copies entire contents of passed config, not
   only pieces of it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Rename audioreach_set_channel_mapping -> audioreach_set_default_channel_mapping

Changes in v2:
1. Extend commit msg, rationale.
2. Rework to new approach, but most of the code stays.
3. Export audioreach_set_channel_mapping() (needed by Q6APM DAIS and
   LPASS DAIS)
4. Correct channel mapping also in audioreach_mfc_set_media_format(),
   because MFC DAI is now part of backend.
5. Do not adjust dynamic DAIs (drop audioreach_dai_load()).
---
 sound/soc/qcom/qdsp6/audioreach.c       | 30 +++++++-----------------------
 sound/soc/qcom/qdsp6/audioreach.h       |  1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  3 +++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  5 ++++-
 4 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5291deac0a0b..4ebaaf736fb9 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -267,7 +267,7 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
-static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
+void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
@@ -281,6 +281,7 @@ static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 		ch_map[3] =  PCM_CHANNEL_RS;
 	}
 }
+EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
 
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  struct audioreach_container *cont)
@@ -819,7 +820,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	uint32_t num_channels = cfg->num_channels;
 	int payload_size;
 	struct gpr_pkt *pkt;
-	int rc;
+	int rc, i;
 	void *p;
 
 	payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
@@ -842,18 +843,8 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->sample_rate = cfg->sample_rate;
 	media_format->bit_width = cfg->bit_width;
 	media_format->num_channels = cfg->num_channels;
-
-	if (num_channels == 1) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
-	} else if (num_channels == 2) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
-		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
-	} else if (num_channels == 4) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
-		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
-		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
-		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
-	}
+	for (i = 0; i < num_channels; i++)
+		media_format->channel_mapping[i] = cfg->channel_map[i];
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -883,9 +874,6 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		mp3_cfg->q_factor = mcfg->bit_width - 1;
 		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
 		mp3_cfg->num_channels = mcfg->num_channels;
-
-		audioreach_set_channel_mapping(mp3_cfg->channel_mapping,
-					       mcfg->num_channels);
 		break;
 	case SND_AUDIOCODEC_AAC:
 		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
@@ -1104,9 +1092,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->num_channels = mcfg->num_channels;
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
-
-	audioreach_set_channel_mapping(media_cfg->channel_mapping,
-				       num_channels);
+	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -1163,9 +1149,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->q_factor = mcfg->bit_width - 1;
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
-
-		audioreach_set_channel_mapping(cfg->channel_mapping,
-					       num_channels);
+		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc) {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index eb9306280988..61a69df4f50f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -766,6 +766,7 @@ struct audioreach_module_config {
 /* Packet Allocation routines */
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
 				    token);
+void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..3361c10d69a4 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -243,6 +243,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.num_channels = runtime->channels;
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
+	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
 
 	if (prtd->state) {
 		/* clear the previous setup if any  */
@@ -669,6 +670,8 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 		cfg.num_channels = 2;
 		cfg.bit_width = prtd->bits_per_sample;
 		cfg.fmt = codec->id;
+		audioreach_set_default_channel_mapping(cfg.channel_map,
+						       cfg.num_channels);
 		memcpy(&cfg.codec, codec, sizeof(*codec));
 
 		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index a4ad1d0e6abd..ba28ec9dff86 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -106,6 +106,7 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
 	cfg->num_channels = channels;
+	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
 
 	switch (dai->id) {
 	case DISPLAY_PORT_RX_0:
@@ -130,10 +131,12 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
 
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
-	cfg->num_channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
+	cfg->num_channels = channels;
+	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
 
 	return 0;
 }

-- 
2.43.0

