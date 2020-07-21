Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02B8228690
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:59:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DC41665;
	Tue, 21 Jul 2020 18:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DC41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350759;
	bh=siMDohX+CVS80dM9/LdnlSvyHD9f/Nq6DNxG7SwUHN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucAk1OngIoNImD4WcuEoRR3yVzwfYbkYsdqMiWsrZwxjuhMvvXssHWuKZjhDtdL9G
	 m1HzS/sv0nRu92A6pnhA9/W9vevoxoaKYgvMbrNiawcb26PLMvvoAG/wF00G+/iLDP
	 RxOS2cRqwautXlG3kvpk8o6d4uBhYyrqceNBlc54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F056F802FF;
	Tue, 21 Jul 2020 18:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F73AF802EC; Tue, 21 Jul 2020 18:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0AC3F8024A
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0AC3F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fIFUagIu"
Received: by mail-wm1-x343.google.com with SMTP id 17so3586533wmo.1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5QASc0ZtBRqm3j+AnuPnR8xk5O5k6BwP49LHKnzt08=;
 b=fIFUagIuibKbaW9rMFfbuKX5qZaOc865HrRcvvZYjBGFKo0vr8+fIOo+ZRH/hBpQpb
 /KeKX9zA15jzMLY1MRp/Altc7foBBtQtlyJnzCPEGIcK3LK6ycP3xWQ3eL3Msu9SgdXp
 twqw3JI3PKwTgrSSRE2468DbDTOFnpX5Zzu2o2Tvokyx90C+t2cEDuIB0DSFHdHGzsPK
 Kf8SMTAL1/Z/v+xjGyl4PwjDHxXqnQBlHIDp4xw7r4C2Nm0FYFtcIKMxQ1T46V3ss+dZ
 ZmZPuRo6eyfODMqPGaPJnbT+L/mUab2gRB58fUskNi22dA9kuvSN1zqD0OGlQRfRu5CM
 PL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5QASc0ZtBRqm3j+AnuPnR8xk5O5k6BwP49LHKnzt08=;
 b=TIxWUy+MWw36qF49uULj3Q35P7ncqFqlLYxJtNoNkkEp7l56y1flfaiQRtqiIHij0S
 YgLuKeu2Gvgfw7lOkDtWHqtS7cZAFk9PaYc66dAfZWjuWiENcsMp8F01PDbo8D8Y3Rjj
 /GkLeI78q/dYVz/5UiFxhwR+YzV35sy2q1lkMK8iezaxSCnWalhKsU158zINOWhRHu4V
 4SoLu+M5MiHvM5fzPzjUbXtF4DmA+voWHnBD02b1E9zb+QhKiBa8sSw5XzbuEy8rc3gb
 taICRyOfwPxQbWELCRTzdjlEDBobWWcLE48LtZNMJ+kkdPCvNRSJqPtPKeW0EN4eM8J/
 j7+Q==
X-Gm-Message-State: AOAM532Vp7w+YCvPDJQZE+ydqlN03CZpKII3vH/dIyvcoPSDjkfu1PuX
 F2Dp0XP13cqXs0KvQYgJyVsyTA==
X-Google-Smtp-Source: ABdhPJzAp1R7Y0HYndC/p76wBrMlHzHRnYNsT58qXnbMmSwr2sdx+DkYBmczR0c8WQzGG0V4GFZSkA==
X-Received: by 2002:a1c:b6c3:: with SMTP id g186mr5077837wmf.135.1595350412946; 
 Tue, 21 Jul 2020 09:53:32 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c25sm4058648wml.18.2020.07.21.09.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:53:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 8/9] ASoC: qdsp6-dai: add gapless support
Date: Tue, 21 Jul 2020 17:53:05 +0100
Message-Id: <20200721165306.29082-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

Add support to gapless playback by implementing metadata,
next_track, drain and partial drain support.

Gapless on Q6ASM is implemented by opening 2 streams in a single
q6asm stream and toggling them on next track.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 253 ++++++++++++++++++++++---------
 sound/soc/qcom/qdsp6/q6asm.h     |   1 +
 2 files changed, 182 insertions(+), 72 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c4b4684b7824..50055c113f10 100644
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
@@ -67,12 +67,15 @@ struct q6asm_dai_rtd {
 	uint16_t bits_per_sample;
 	uint16_t source; /* Encoding source bit mask */
 	struct audio_client *audio_client;
+	uint32_t next_track_stream_id;
+	bool next_track;
 	/* Active */
 	uint32_t stream_id;
 	uint16_t session_id;
 	enum stream_state state;
 	uint32_t initial_samples_drop;
 	uint32_t trailing_samples_drop;
+	bool notify_on_drain;
 };
 
 struct q6asm_dai_data {
@@ -510,14 +513,20 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 {
 	struct q6asm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
-	unsigned long flags;
+	unsigned long flags = 0;
+	u32 wflags = 0;
 	uint64_t avail;
-	uint32_t bytes_written;
+	uint32_t bytes_written, bytes_to_write;
+	bool is_last_buffer = false;
 
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		spin_lock_irqsave(&prtd->lock, flags);
 		if (!prtd->bytes_sent) {
+			q6asm_stream_remove_initial_silence(prtd->audio_client,
+						    prtd->stream_id,
+						    prtd->initial_samples_drop);
+
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
 					  prtd->pcm_count, 0, 0, 0);
 			prtd->bytes_sent += prtd->pcm_count;
@@ -527,7 +536,26 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		break;
 
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		prtd->state = Q6ASM_STREAM_STOPPED;
+		spin_lock_irqsave(&prtd->lock, flags);
+		if (prtd->notify_on_drain) {
+			if (substream->partial_drain) {
+				/**
+				 * Close old stream and make it stale, switch
+				 * the active stream now!
+				 */
+				q6asm_cmd_nowait(prtd->audio_client,
+						 prtd->stream_id,
+						 CMD_CLOSE);
+				prtd->stream_id = (prtd->stream_id == 1 ? 2 : 1);
+			}
+
+			snd_compr_drain_notify(prtd->cstream);
+			prtd->notify_on_drain = false;
+
+		} else {
+			prtd->state = Q6ASM_STREAM_STOPPED;
+		}
+		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
@@ -543,13 +571,32 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		}
 
 		avail = prtd->bytes_received - prtd->bytes_sent;
+		if (avail > prtd->pcm_count) {
+			bytes_to_write = prtd->pcm_count;
+		} else {
+			if (substream->partial_drain || prtd->notify_on_drain)
+				is_last_buffer = true;
+			bytes_to_write = avail;
+		}
+
+		if (bytes_to_write) {
+			if (substream->partial_drain && is_last_buffer) {
+				wflags |= ASM_LAST_BUFFER_FLAG;
+				q6asm_stream_remove_trailing_silence(prtd->audio_client,
+						     prtd->stream_id,
+						     prtd->trailing_samples_drop);
+			}
 
-		if (avail >= prtd->pcm_count) {
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					   prtd->pcm_count, 0, 0, 0);
-			prtd->bytes_sent += prtd->pcm_count;
+					  bytes_to_write, 0, 0, wflags);
+
+			prtd->bytes_sent += bytes_to_write;
 		}
 
+		if (prtd->notify_on_drain && is_last_buffer)
+			q6asm_cmd_nowait(prtd->audio_client,
+					 prtd->stream_id, CMD_EOS);
+
 		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
@@ -629,9 +676,15 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
 
 	if (prtd->audio_client) {
-		if (prtd->state)
+		if (prtd->state) {
 			q6asm_cmd(prtd->audio_client, prtd->stream_id,
 				  CMD_CLOSE);
+			if (prtd->next_track_stream_id) {
+				q6asm_cmd(prtd->audio_client,
+					  prtd->next_track_stream_id,
+					  CMD_CLOSE);
+			}
+		}
 
 		snd_dma_free_pages(&prtd->dma_buffer);
 		q6asm_unmap_memory_regions(stream->direction,
@@ -645,15 +698,13 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
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
@@ -667,53 +718,18 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
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
@@ -722,7 +738,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		flac_cfg.min_frame_size = flac->min_frame_size;
 
 		ret = q6asm_stream_media_format_block_flac(prtd->audio_client,
-							   prtd->stream_id,
+							   stream_id,
 							   &flac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "FLAC CMD Format block failed:%d\n", ret);
@@ -735,10 +751,10 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
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
@@ -752,7 +768,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			return -EINVAL;
 
 		/* check the codec profile */
-		switch (params->codec.profile) {
+		switch (codec->profile) {
 		case SND_AUDIOPROFILE_WMA9:
 			wma_cfg.fmtag = 0x161;
 			wma_v9 = 1;
@@ -776,17 +792,17 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
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
@@ -798,10 +814,10 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
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
@@ -811,7 +827,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		alac_cfg.compatible_version = alac->compatible_version;
 		alac_cfg.max_frame_bytes = alac->max_frame_bytes;
 
-		switch (params->codec.ch_in) {
+		switch (codec->ch_in) {
 		case 1:
 			alac_cfg.channel_layout_tag = ALAC_CH_LAYOUT_MONO;
 			break;
@@ -820,7 +836,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			break;
 		}
 		ret = q6asm_stream_media_format_block_alac(prtd->audio_client,
-							   prtd->stream_id,
+							   stream_id,
 							   &alac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "ALAC CMD Format block failed:%d\n", ret);
@@ -832,8 +848,8 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		memset(&ape_cfg, 0x0, sizeof(ape_cfg));
 		ape = &codec_options->ape_d;
 
-		ape_cfg.sample_rate = params->codec.sample_rate;
-		ape_cfg.num_channels = params->codec.ch_in;
+		ape_cfg.sample_rate = codec->sample_rate;
+		ape_cfg.num_channels = codec->ch_in;
 		ape_cfg.bits_per_sample = prtd->bits_per_sample;
 
 		ape_cfg.compatible_version = ape->compatible_version;
@@ -845,7 +861,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		ape_cfg.seek_table_present = ape->seek_table_present;
 
 		ret = q6asm_stream_media_format_block_ape(prtd->audio_client,
-							  prtd->stream_id,
+							  stream_id,
 							  &ape_cfg);
 		if (ret < 0) {
 			dev_err(dev, "APE CMD Format block failed:%d\n", ret);
@@ -857,6 +873,64 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
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
@@ -871,7 +945,8 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int q6asm_dai_compr_set_metadata(struct snd_compr_stream *stream,
+static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,
+					struct snd_compr_stream *stream,
 					struct snd_compr_metadata *metadata)
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
@@ -884,6 +959,32 @@ static int q6asm_dai_compr_set_metadata(struct snd_compr_stream *stream,
 		break;
 	case SNDRV_COMPRESS_ENCODER_DELAY:
 		prtd->initial_samples_drop = metadata->value[0];
+		if (prtd->next_track_stream_id) {
+			ret = q6asm_open_write(prtd->audio_client,
+					       prtd->next_track_stream_id,
+					       prtd->codec.id,
+					       prtd->codec.profile,
+					       prtd->bits_per_sample,
+				       true);
+			if (ret < 0) {
+				dev_err(component->dev, "q6asm_open_write failed\n");
+				return ret;
+			}
+			ret = __q6asm_dai_compr_set_codec_params(component, stream,
+								 &prtd->codec,
+								 prtd->next_track_stream_id);
+			if (ret < 0) {
+				dev_err(component->dev, "q6asm_open_write failed\n");
+				return ret;
+			}
+
+			ret = q6asm_stream_remove_initial_silence(prtd->audio_client,
+						    prtd->next_track_stream_id,
+						    prtd->initial_samples_drop);
+			prtd->next_track_stream_id = 0;
+
+		}
+
 		break;
 	default:
 		ret = -EINVAL;
@@ -917,6 +1018,14 @@ static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
 		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
 				       CMD_PAUSE);
 		break;
+	case SND_COMPR_TRIGGER_NEXT_TRACK:
+		prtd->next_track = true;
+		prtd->next_track_stream_id = (prtd->stream_id == 1 ? 2 : 1);
+		break;
+	case SND_COMPR_TRIGGER_DRAIN:
+	case SND_COMPR_TRIGGER_PARTIAL_DRAIN:
+		prtd->notify_on_drain = true;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 69513ac1fa55..a8dddfeb28da 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -34,6 +34,7 @@ enum {
 #define MAX_SESSIONS	8
 #define NO_TIMESTAMP    0xFF00
 #define FORMAT_LINEAR_PCM   0x0000
+#define ASM_LAST_BUFFER_FLAG           BIT(30)
 
 struct q6asm_flac_cfg {
         u32 sample_rate;
-- 
2.21.0

