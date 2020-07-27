Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F022E95A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FBB31667;
	Mon, 27 Jul 2020 11:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FBB31667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595843049;
	bh=8+eQzUW86zN1zN8wCqvB/tndgN0S7aOWzeRddITrsbk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T9pOU1Bief1g6gsLaZHufImAnfdZlRAliw+D2MeG4Fl5YPeBi/jaVfiA4UFCZz5/k
	 +h06fc6sUvMvcBwdtNJGd4smyc0uc6NDfI/ynDCoGgt3LeHjtwBHWqT7nNw9JNNckf
	 GfnvKJ9N7lvhoxhJ4DW/Ku9Vr8JKxSBhxkbVGkJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DCC9F802FF;
	Mon, 27 Jul 2020 11:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1925FF802E8; Mon, 27 Jul 2020 11:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0160FF8028D
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0160FF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IgYqDGNl"
Received: by mail-wr1-x441.google.com with SMTP id r4so11196958wrx.9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaYEBHP1hA6Z0ty3CQH+DbAz1Fhh0daXJSUmhh2mbvQ=;
 b=IgYqDGNlWZlVtL4DvjwvDyWn3GBJBeuwqEmt703cfv1shUXl27ma+zt571HhruqxUj
 BxZdyUWY/ANHk5RxffcRH8EQjXdy8QOevLkHZuncm5kB5hYQVE/OHiY69HmQizzQop3m
 POsj+Gd5NMmebPTAIb+HwrYKkvnfkam/g6IJcYE/LAcV3GvPeZAJiLONqaE37ALKGTsD
 mh8epq7GDMJhg2wVhDdWku/UYFz3Id5onxSWBWFdj10qlglQmxj/vExBMxbeTu0L0Nbx
 TtVtgYlv6xluYSXLqqUpI6ivOPanW/iCO8d4YoPgJndgHsLzlYOYce+vpKCG19k89Qc6
 wTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PaYEBHP1hA6Z0ty3CQH+DbAz1Fhh0daXJSUmhh2mbvQ=;
 b=s9mavRxYE2tn3LaajU53ZSDYkUfCyfahu1sphfu59FVxEYg6T7VHuNpPdiPRigiwi6
 NfdmZnFvhehTODI59F0crDYkKAA6KM4kDgkeod9wTAYsRAs4WellaKL4xzE8odrJHOBm
 54MHUm8+ZyHFDTxVru/Ttkuwg+zsAlaQIuRit0RglzSAppDD2w1PB8PWOXbKuQUHlEOM
 d7h4MUxSOMTiQLG9a8z91ljJjkm/trcZpMH08kFMt2G6I/HvNGvqzUnonnLsKHv9HPwg
 hYFi+Q2dVZSP5mjgoehc7BXILyMPFd8Xc5zyVMe/pq2w6d93XU11vGiLoOCTBg1fsrB5
 DwdA==
X-Gm-Message-State: AOAM533oSckRhFw6Pd0s2a9y7WTADwqZqRydol05J1AmQqN1ziGax0RP
 nlraa7ykCYiGH7sW00P/RVoKkg==
X-Google-Smtp-Source: ABdhPJxzomdcvXn6uVYVrGr10wI1q2tY6BaUV5/UymLlF1nGwt7zdE0RZvHcbMt5a3lSdkbPn5kXEQ==
X-Received: by 2002:a5d:4a90:: with SMTP id o16mr18732461wrq.87.1595842704041; 
 Mon, 27 Jul 2020 02:38:24 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 08/10] ASoC: q6asm-dai: prepare set params to accept
 profile change
Date: Mon, 27 Jul 2020 10:38:04 +0100
Message-Id: <20200727093806.17089-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
References: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

rearrange code so that it will be easy to change the codec
profile at runtime. This means moving exiting set_params
to an internal wrapper which can be called when codec
profile changes.

This is also preparing the code for easy to use in gapless cases.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 149 ++++++++++++++++++-------------
 1 file changed, 85 insertions(+), 64 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index a7fe4147c0a2..420aaaa67788 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -53,7 +53,7 @@ enum stream_state {
 struct q6asm_dai_rtd {
 	struct snd_pcm_substream *substream;
 	struct snd_compr_stream *cstream;
-	struct snd_compr_params codec_param;
+	struct snd_codec codec;
 	struct snd_dma_buffer dma_buffer;
 	spinlock_t lock;
 	phys_addr_t phys;
@@ -644,15 +644,13 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
 	return 0;
 }
 
-static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
-				      struct snd_compr_stream *stream,
-				      struct snd_compr_params *params)
+static int __q6asm_dai_compr_set_codec_params(struct snd_soc_component *component,
+					      struct snd_compr_stream *stream,
+					      struct snd_codec *codec,
+					      int stream_id)
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = stream->private_data;
-	int dir = stream->direction;
-	struct q6asm_dai_data *pdata;
 	struct q6asm_flac_cfg flac_cfg;
 	struct q6asm_wma_cfg wma_cfg;
 	struct q6asm_alac_cfg alac_cfg;
@@ -666,53 +664,18 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 	struct snd_dec_alac *alac;
 	struct snd_dec_ape *ape;
 
-	codec_options = &(prtd->codec_param.codec.options);
-
-
-	memcpy(&prtd->codec_param, params, sizeof(*params));
-
-	pdata = snd_soc_component_get_drvdata(component);
-	if (!pdata)
-		return -EINVAL;
-
-	if (!prtd || !prtd->audio_client) {
-		dev_err(dev, "private data null or audio client freed\n");
-		return -EINVAL;
-	}
-
-	prtd->periods = runtime->fragments;
-	prtd->pcm_count = runtime->fragment_size;
-	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
-	prtd->bits_per_sample = 16;
-	if (dir == SND_COMPRESS_PLAYBACK) {
-		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
-				       params->codec.id, params->codec.profile,
-				       prtd->bits_per_sample, true);
-
-		if (ret < 0) {
-			dev_err(dev, "q6asm_open_write failed\n");
-			q6asm_audio_client_free(prtd->audio_client);
-			prtd->audio_client = NULL;
-			return ret;
-		}
-	}
+	codec_options = &(prtd->codec.options);
 
-	prtd->session_id = q6asm_get_session_id(prtd->audio_client);
-	ret = q6routing_stream_open(rtd->dai_link->id, LEGACY_PCM_MODE,
-			      prtd->session_id, dir);
-	if (ret) {
-		dev_err(dev, "Stream reg failed ret:%d\n", ret);
-		return ret;
-	}
+	memcpy(&prtd->codec, codec, sizeof(*codec));
 
-	switch (params->codec.id) {
+	switch (codec->id) {
 	case SND_AUDIOCODEC_FLAC:
 
 		memset(&flac_cfg, 0x0, sizeof(struct q6asm_flac_cfg));
 		flac = &codec_options->flac_d;
 
-		flac_cfg.ch_cfg = params->codec.ch_in;
-		flac_cfg.sample_rate =  params->codec.sample_rate;
+		flac_cfg.ch_cfg = codec->ch_in;
+		flac_cfg.sample_rate = codec->sample_rate;
 		flac_cfg.stream_info_present = 1;
 		flac_cfg.sample_size = flac->sample_size;
 		flac_cfg.min_blk_size = flac->min_blk_size;
@@ -721,7 +684,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		flac_cfg.min_frame_size = flac->min_frame_size;
 
 		ret = q6asm_stream_media_format_block_flac(prtd->audio_client,
-							   prtd->stream_id,
+							   stream_id,
 							   &flac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "FLAC CMD Format block failed:%d\n", ret);
@@ -734,10 +697,10 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
 		memset(&wma_cfg, 0x0, sizeof(struct q6asm_wma_cfg));
 
-		wma_cfg.sample_rate =  params->codec.sample_rate;
-		wma_cfg.num_channels = params->codec.ch_in;
-		wma_cfg.bytes_per_sec = params->codec.bit_rate / 8;
-		wma_cfg.block_align = params->codec.align;
+		wma_cfg.sample_rate =  codec->sample_rate;
+		wma_cfg.num_channels = codec->ch_in;
+		wma_cfg.bytes_per_sec = codec->bit_rate / 8;
+		wma_cfg.block_align = codec->align;
 		wma_cfg.bits_per_sample = prtd->bits_per_sample;
 		wma_cfg.enc_options = wma->encoder_option;
 		wma_cfg.adv_enc_options = wma->adv_encoder_option;
@@ -751,7 +714,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			return -EINVAL;
 
 		/* check the codec profile */
-		switch (params->codec.profile) {
+		switch (codec->profile) {
 		case SND_AUDIOPROFILE_WMA9:
 			wma_cfg.fmtag = 0x161;
 			wma_v9 = 1;
@@ -775,17 +738,17 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
 		default:
 			dev_err(dev, "Unknown WMA profile:%x\n",
-				params->codec.profile);
+				codec->profile);
 			return -EIO;
 		}
 
 		if (wma_v9)
 			ret = q6asm_stream_media_format_block_wma_v9(
-					prtd->audio_client, prtd->stream_id,
+					prtd->audio_client, stream_id,
 					&wma_cfg);
 		else
 			ret = q6asm_stream_media_format_block_wma_v10(
-					prtd->audio_client, prtd->stream_id,
+					prtd->audio_client, stream_id,
 					&wma_cfg);
 		if (ret < 0) {
 			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
@@ -797,10 +760,10 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		memset(&alac_cfg, 0x0, sizeof(alac_cfg));
 		alac = &codec_options->alac_d;
 
-		alac_cfg.sample_rate = params->codec.sample_rate;
-		alac_cfg.avg_bit_rate = params->codec.bit_rate;
+		alac_cfg.sample_rate = codec->sample_rate;
+		alac_cfg.avg_bit_rate = codec->bit_rate;
 		alac_cfg.bit_depth = prtd->bits_per_sample;
-		alac_cfg.num_channels = params->codec.ch_in;
+		alac_cfg.num_channels = codec->ch_in;
 
 		alac_cfg.frame_length = alac->frame_length;
 		alac_cfg.pb = alac->pb;
@@ -810,7 +773,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		alac_cfg.compatible_version = alac->compatible_version;
 		alac_cfg.max_frame_bytes = alac->max_frame_bytes;
 
-		switch (params->codec.ch_in) {
+		switch (codec->ch_in) {
 		case 1:
 			alac_cfg.channel_layout_tag = ALAC_CH_LAYOUT_MONO;
 			break;
@@ -819,7 +782,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			break;
 		}
 		ret = q6asm_stream_media_format_block_alac(prtd->audio_client,
-							   prtd->stream_id,
+							   stream_id,
 							   &alac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "ALAC CMD Format block failed:%d\n", ret);
@@ -831,8 +794,8 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		memset(&ape_cfg, 0x0, sizeof(ape_cfg));
 		ape = &codec_options->ape_d;
 
-		ape_cfg.sample_rate = params->codec.sample_rate;
-		ape_cfg.num_channels = params->codec.ch_in;
+		ape_cfg.sample_rate = codec->sample_rate;
+		ape_cfg.num_channels = codec->ch_in;
 		ape_cfg.bits_per_sample = prtd->bits_per_sample;
 
 		ape_cfg.compatible_version = ape->compatible_version;
@@ -844,7 +807,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		ape_cfg.seek_table_present = ape->seek_table_present;
 
 		ret = q6asm_stream_media_format_block_ape(prtd->audio_client,
-							  prtd->stream_id,
+							  stream_id,
 							  &ape_cfg);
 		if (ret < 0) {
 			dev_err(dev, "APE CMD Format block failed:%d\n", ret);
@@ -856,6 +819,64 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		break;
 	}
 
+	return 0;
+}
+
+static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
+				      struct snd_compr_stream *stream,
+				      struct snd_compr_params *params)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	struct snd_soc_pcm_runtime *rtd = stream->private_data;
+	int dir = stream->direction;
+	struct q6asm_dai_data *pdata;
+	struct device *dev = component->dev;
+	int ret;
+
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata)
+		return -EINVAL;
+
+	if (!prtd || !prtd->audio_client) {
+		dev_err(dev, "private data null or audio client freed\n");
+		return -EINVAL;
+	}
+
+	prtd->periods = runtime->fragments;
+	prtd->pcm_count = runtime->fragment_size;
+	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
+	prtd->bits_per_sample = 16;
+
+	if (dir == SND_COMPRESS_PLAYBACK) {
+		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id, params->codec.id,
+				params->codec.profile, prtd->bits_per_sample,
+				true);
+
+		if (ret < 0) {
+			dev_err(dev, "q6asm_open_write failed\n");
+			q6asm_audio_client_free(prtd->audio_client);
+			prtd->audio_client = NULL;
+			return ret;
+		}
+	}
+
+	prtd->session_id = q6asm_get_session_id(prtd->audio_client);
+	ret = q6routing_stream_open(rtd->dai_link->id, LEGACY_PCM_MODE,
+			      prtd->session_id, dir);
+	if (ret) {
+		dev_err(dev, "Stream reg failed ret:%d\n", ret);
+		return ret;
+	}
+
+	ret = __q6asm_dai_compr_set_codec_params(component, stream,
+						 &params->codec,
+						 prtd->stream_id);
+	if (ret) {
+		dev_err(dev, "codec param setup failed ret:%d\n", ret);
+		return ret;
+	}
+
 	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
 				       (prtd->pcm_size / prtd->periods),
 				       prtd->periods);
-- 
2.21.0

