Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B812D217446
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:42:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57C1715E0;
	Tue,  7 Jul 2020 18:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57C1715E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594140178;
	bh=oSamxeaO4E6kbgcoDi8nWT4zfsx9cHEvhFBI5aV2D38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tq7AZTctndG5d5QlxWMNAWAcdSS7wVaJTKrd5op9ja8TbuaDH1w/b2BhwDXZCwz6Q
	 RyPbvx97OyCF+QyXM9bgtLw0wDNPRuGye98ePcXZkoxXjmbZdpK9eMNYRuqvTWJoAG
	 BTgR/aVhWZq07eW9gnWxVpSF5SPQI0VHHmpCr0Zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE336F80305;
	Tue,  7 Jul 2020 18:37:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 105DCF802E7; Tue,  7 Jul 2020 18:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33848F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33848F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GnKVgPDM"
Received: by mail-wr1-x443.google.com with SMTP id z15so34608962wrl.8
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6kwaEBrObWfb+2c3FetQO0zQ2vjoJpajn5ahSR7UDxg=;
 b=GnKVgPDMjCedTBXNXSLrR3RkZ9G68UrHIl0EIprWDN2mqlgDl0XVqWE5dHdgrc1VHl
 EQaI1tEQMGY0QozL5tCGB+TqEaGdBi8ZhR+7p8WIJhy+R9LuFRlVMdiU+RsumS8AbMVt
 NMvNEY8GGvPzaWpfUW30cc5LsZllgY9kBhpd5YkG2PIAq9CdtSYP6AHzBZwJiUXg6Q6+
 BXKyDgLscmAmojSCgI9MTX3ZJ18uNw2U7f4aH7d1eyYU3O9OMdfmEywRzrKatqrgr9ul
 FoQMfSVFhVKmH8WeS/tZ4GI0WcE7S0GJK/SWAUZwp/6+gLBJmysn1nzoSm3qLhwKw7qk
 wa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kwaEBrObWfb+2c3FetQO0zQ2vjoJpajn5ahSR7UDxg=;
 b=DsTPSLh7uviHG7dwzx5OexAvBrhmo18pd6pIqUhDtTPDu73nN2p+8fhwhJvQJ2M6z0
 0hpwZphbZWhEgaC9cKvF0dqBUiPLujPan1MY9u58LfekvLJEnVfsSrNs/PP4lCIDIpo7
 7YOnmxzVAoPiKypTZhvTfAOG0CdsNjMf2sVQqEMHxzLU4zId06BQSDUyxEUHXnULqrPm
 MQSA+3b4ayfioVeY/gtIQ57nn/GM4LKR/ePjZA396mvOkSmMOxK097qb+a5nK8pcVOCH
 1N1704XEzs+cwunYkXCFjstOXPkidWp24Pgaoy3q+Wpab1R5KJUUqHAZI9U/mmB8C0f4
 cMvw==
X-Gm-Message-State: AOAM533ZAFmmTGyaL4gWOmieurhSztZEo+5TE0PU+sRbmf5YQTh3n4rb
 /hEE62AeOYlyO8o9yHl92ttmzQ==
X-Google-Smtp-Source: ABdhPJz9YhOdjYXS34/0UTcKdDiSEct1fjMnhSdpig3z4YMvZZ6tsfDbAgWKFYETrWNqEvNXwt8zpQ==
X-Received: by 2002:a05:6000:1206:: with SMTP id
 e6mr24541680wrx.346.1594139822590; 
 Tue, 07 Jul 2020 09:37:02 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:37:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 10/11] ASoC: qdsp6-dai: add gapless support
Date: Tue,  7 Jul 2020 17:36:40 +0100
Message-Id: <20200707163641.17113-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
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

Gapless on Q6ASM is implemented by opening 2 streams in a single asm stream
and toggling them on next track.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 212 +++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/q6asm.h     |   1 +
 2 files changed, 158 insertions(+), 55 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c4b4684b7824..f48eca227fb5 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
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
@@ -510,9 +513,11 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
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
@@ -527,7 +532,25 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		break;
 
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		prtd->state = Q6ASM_STREAM_STOPPED;
+		if (prtd->notify_on_drain) {
+			if (substream->partial_drain && prtd->next_track_stream_id) {
+				/**
+				 * Close old stream and make it stale, switch
+				 * the active stream now!
+				 */
+				q6asm_cmd_nowait(prtd->audio_client,
+						 prtd->stream_id,
+						 CMD_CLOSE);
+				prtd->stream_id = prtd->next_track_stream_id;
+				prtd->next_track_stream_id = 0;
+			}
+
+			snd_compr_drain_notify(prtd->cstream);
+			prtd->notify_on_drain = false;
+
+		} else {
+			prtd->state = Q6ASM_STREAM_STOPPED;
+		}
 		break;
 
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
@@ -543,13 +566,32 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
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
 
@@ -629,9 +671,15 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
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
@@ -645,15 +693,13 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
 	return 0;
 }
 
-static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
-				      struct snd_compr_stream *stream,
-				      struct snd_compr_params *params)
+static int __q6asm_dai_compr_set_codec_params(struct snd_soc_component *component,
+					      struct snd_compr_stream *stream,
+					      struct snd_compr_params *params,
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
@@ -669,43 +715,8 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
 	codec_options = &(prtd->codec_param.codec.options);
 
-
 	memcpy(&prtd->codec_param, params, sizeof(*params));
 
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
-
-	prtd->session_id = q6asm_get_session_id(prtd->audio_client);
-	ret = q6routing_stream_open(rtd->dai_link->id, LEGACY_PCM_MODE,
-			      prtd->session_id, dir);
-	if (ret) {
-		dev_err(dev, "Stream reg failed ret:%d\n", ret);
-		return ret;
-	}
-
 	switch (params->codec.id) {
 	case SND_AUDIOCODEC_FLAC:
 
@@ -722,7 +733,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		flac_cfg.min_frame_size = flac->min_frame_size;
 
 		ret = q6asm_stream_media_format_block_flac(prtd->audio_client,
-							   prtd->stream_id,
+							   stream_id,
 							   &flac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "FLAC CMD Format block failed:%d\n", ret);
@@ -782,11 +793,11 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
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
@@ -820,7 +831,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			break;
 		}
 		ret = q6asm_stream_media_format_block_alac(prtd->audio_client,
-							   prtd->stream_id,
+							   stream_id,
 							   &alac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "ALAC CMD Format block failed:%d\n", ret);
@@ -845,7 +856,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		ape_cfg.seek_table_present = ape->seek_table_present;
 
 		ret = q6asm_stream_media_format_block_ape(prtd->audio_client,
-							  prtd->stream_id,
+							  stream_id,
 							  &ape_cfg);
 		if (ret < 0) {
 			dev_err(dev, "APE CMD Format block failed:%d\n", ret);
@@ -857,6 +868,63 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
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
+	ret = __q6asm_dai_compr_set_codec_params(component, stream, params,
+						 prtd->stream_id);
+	if (ret) {
+		dev_err(dev, "codec param setup failed ret:%d\n", ret);
+		return ret;
+	}
+
 	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
 				       (prtd->pcm_size / prtd->periods),
 				       prtd->periods);
@@ -871,12 +939,13 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int q6asm_dai_compr_set_metadata(struct snd_compr_stream *stream,
+static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,
+					struct snd_compr_stream *stream,
 					struct snd_compr_metadata *metadata)
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	int ret = 0;
+	int stream_id = prtd->stream_id, ret = 0;
 
 	switch (metadata->key) {
 	case SNDRV_COMPRESS_ENCODER_PADDING:
@@ -884,6 +953,31 @@ static int q6asm_dai_compr_set_metadata(struct snd_compr_stream *stream,
 		break;
 	case SNDRV_COMPRESS_ENCODER_DELAY:
 		prtd->initial_samples_drop = metadata->value[0];
+		if (prtd->next_track_stream_id) {
+			stream_id = prtd->next_track_stream_id;
+			ret = q6asm_open_write(prtd->audio_client,
+					       prtd->next_track_stream_id,
+					       prtd->codec_param.codec.id,
+					       prtd->codec_param.codec.profile,
+					       prtd->bits_per_sample,
+				       true);
+			if (ret < 0) {
+				dev_err(component->dev, "q6asm_open_write failed\n");
+				return ret;
+			}
+			ret = __q6asm_dai_compr_set_codec_params(component, stream,
+								 &prtd->codec_param,
+								 prtd->next_track_stream_id);
+			if (ret < 0) {
+				dev_err(component->dev, "q6asm_open_write failed\n");
+				return ret;
+			}
+
+		}
+
+		q6asm_stream_remove_initial_silence(prtd->audio_client,
+						    stream_id,
+						    prtd->initial_samples_drop);
 		break;
 	default:
 		ret = -EINVAL;
@@ -917,6 +1011,14 @@ static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
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

