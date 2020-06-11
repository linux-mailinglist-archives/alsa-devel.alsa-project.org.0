Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7621F681B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 14:46:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A954A1685;
	Thu, 11 Jun 2020 14:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A954A1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591879593;
	bh=Z+QzBA92TjWkw02+8P9+JvTgyq9pSplZRxk+7SCiPAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yq1gPFeEUcEjUo1ve+EwFXpq0q5AAmqkguC+APjzca0ywv7fS/P9JhM6tYgEkn6Vx
	 h4wrhGi/Mq5XCMiBJmC2YidlhJKhlAXYu5Tk5UAJAHPyLKM6aC0Kp2hKACR/+RhiWm
	 m5bjRVRS6ZJQu6A2cNiekVgw1nCoafiHUf6VFB2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A1CF802E1;
	Thu, 11 Jun 2020 14:42:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C129CF802C2; Thu, 11 Jun 2020 14:42:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C23EF8028D
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 14:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C23EF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YimqA/DG"
Received: by mail-wm1-x344.google.com with SMTP id r15so4898896wmh.5
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDWJk6zNujlCyrXXLRcRU5o52QIpe9IxX6A4xIUFD3E=;
 b=YimqA/DGV2y9IXS+em18DWcNd9PwU9I7vAfNpng8CQUF4/09hfEqjLnGOZaGtUfik7
 tjpB0GC5XkRtbVVKQl4LN8gMV1aUfMwO2Fuqjw3Jg4wx2zUSwwTvXlnE7OicbjJOzmOz
 OEep7Z7380yCH8FsOEu5aFTKkncS4xdmFk60NPEK4/DxUFZNWJGS19LW0StbbtFeGxg+
 SPCsPQLS3nJa0KOrP1+orj9XFm/VKPz7SNRorkk9B+SaufjLV4zkSmlMQMsR6Iroc5pa
 AYUiabfCvB8SDLPtsVPL6ucuNpWj3f45b/CeLxObiDhpV3pg6Pk/sBt4DUrQacOGAv3X
 Urqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDWJk6zNujlCyrXXLRcRU5o52QIpe9IxX6A4xIUFD3E=;
 b=IvUjDrQwz35+Zt6zzF1arYMHeE2kPk3xg8tmQvpfqIzA6dNPDYoC8ea0QrCXonmJDd
 o1XKCzXDjMMFm24mfgCmZxiXh8t8K5k/IuD4VyG8icHdecoYivz4ZBZji2kXA/A3ZIBc
 9deZFT0WEOgvOU9sk9wm6XeiolCh7FkUy2RUv9DI6wux+fz2gmSrvHu+Ry2Cv2+icssW
 sALvamhOIAwQKB5zvo7r3oO6lN/DgnZk5tc8vbG9aTe1BztGGPkZ/1otjlhCL2T1MvIM
 UKanFNokLG3iWRqC1Cv4cV3qfqw21ZA8/rk3VhPOoKj0QfAOSoRyAGCtU5hwmB9CpRd2
 wpPQ==
X-Gm-Message-State: AOAM532gBgiluGo+q1pNv67Sb4/wCApNnazFB4aVwBNhouSmq6lt5oYM
 sg31UHwLggC8ueZUqWNW089Bwg==
X-Google-Smtp-Source: ABdhPJypDNuuwJoGDTixrTH8175/f+8Rk/57Jl7flHM819AOfoHkf3bW4jf0hyDTgfOjBnOft4ldJA==
X-Received: by 2002:a1c:ab07:: with SMTP id u7mr8041754wme.130.1591879327728; 
 Thu, 11 Jun 2020 05:42:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q13sm4810355wrn.84.2020.06.11.05.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 05:42:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/8] ASoC: q6asm: make commands specific to streams
Date: Thu, 11 Jun 2020 13:41:55 +0100
Message-Id: <20200611124159.20742-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
References: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
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

Each ASM session can have multiple streams attached to it,
current design was to allow only one static stream id 1 per each session.
However for use-case like gapless, we would need 2 streams to open per session.

This patch converts all the asm apis to take stream id as argument
to allow multiple streams to open on a single session, This is useful
for gapless playback cases.

Now the dai driver can specify which stream id for each command.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 86 ++++++++++++++++++-----------
 sound/soc/qcom/qdsp6/q6asm.c     | 92 ++++++++++++++++++--------------
 sound/soc/qcom/qdsp6/q6asm.h     | 38 ++++++++-----
 3 files changed, 133 insertions(+), 83 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 125af00bba53..57fb19f6c306 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -67,6 +67,8 @@ struct q6asm_dai_rtd {
 	uint16_t bits_per_sample;
 	uint16_t source; /* Encoding source bit mask */
 	struct audio_client *audio_client;
+	/* Active */
+	uint32_t stream_id;
 	uint16_t session_id;
 	enum stream_state state;
 };
@@ -184,8 +186,8 @@ static void event_handler(uint32_t opcode, uint32_t token,
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			q6asm_write_async(prtd->audio_client,
-				   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+			q6asm_write_async(prtd->audio_client, prtd->stream_id,
+				   prtd->pcm_count, 0, 0, 0);
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6ASM_STREAM_STOPPED;
@@ -194,8 +196,8 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
-			q6asm_write_async(prtd->audio_client,
-					   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+			q6asm_write_async(prtd->audio_client, prtd->stream_id,
+					   prtd->pcm_count, 0, 0, 0);
 
 		break;
 		}
@@ -203,7 +205,7 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
-			q6asm_read(prtd->audio_client);
+			q6asm_read(prtd->audio_client, prtd->stream_id);
 
 		break;
 	default:
@@ -235,7 +237,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	/* rate and channels are sent to audio driver */
 	if (prtd->state) {
 		/* clear the previous setup if any  */
-		q6asm_cmd(prtd->audio_client, CMD_CLOSE);
+		q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
 		q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
 		q6routing_stream_close(soc_prtd->dai_link->id,
@@ -254,11 +256,13 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ret = q6asm_open_write(prtd->audio_client, FORMAT_LINEAR_PCM,
+		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
+				       FORMAT_LINEAR_PCM,
 				       0, prtd->bits_per_sample);
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		ret = q6asm_open_read(prtd->audio_client, FORMAT_LINEAR_PCM,
-				       prtd->bits_per_sample);
+		ret = q6asm_open_read(prtd->audio_client, prtd->stream_id,
+				      FORMAT_LINEAR_PCM,
+				      prtd->bits_per_sample);
 	}
 
 	if (ret < 0) {
@@ -278,17 +282,19 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		ret = q6asm_media_format_block_multi_ch_pcm(
-				prtd->audio_client, runtime->rate,
-				runtime->channels, NULL,
+				prtd->audio_client, prtd->stream_id,
+				runtime->rate, runtime->channels, NULL,
 				prtd->bits_per_sample);
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		ret = q6asm_enc_cfg_blk_pcm_format_support(prtd->audio_client,
-					runtime->rate, runtime->channels,
-					prtd->bits_per_sample);
+							   prtd->stream_id,
+							   runtime->rate,
+							   runtime->channels,
+							   prtd->bits_per_sample);
 
 		/* Queue the buffers */
 		for (i = 0; i < runtime->periods; i++)
-			q6asm_read(prtd->audio_client);
+			q6asm_read(prtd->audio_client, prtd->stream_id);
 
 	}
 	if (ret < 0)
@@ -310,15 +316,18 @@ static int q6asm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		ret = q6asm_run_nowait(prtd->audio_client, 0, 0, 0);
+		ret = q6asm_run_nowait(prtd->audio_client, prtd->stream_id,
+				       0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		prtd->state = Q6ASM_STREAM_STOPPED;
-		ret = q6asm_cmd_nowait(prtd->audio_client, CMD_EOS);
+		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
+				       CMD_EOS);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = q6asm_cmd_nowait(prtd->audio_client, CMD_PAUSE);
+		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
+				       CMD_PAUSE);
 		break;
 	default:
 		ret = -EINVAL;
@@ -363,6 +372,9 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 		return ret;
 	}
 
+	/* DSP expects stream id from 1 */
+	prtd->stream_id = 1;
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		runtime->hw = q6asm_dai_hardware_playback;
 	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -429,7 +441,8 @@ static int q6asm_dai_close(struct snd_soc_component *component,
 
 	if (prtd->audio_client) {
 		if (prtd->state)
-			q6asm_cmd(prtd->audio_client, CMD_CLOSE);
+			q6asm_cmd(prtd->audio_client, prtd->stream_id,
+				  CMD_CLOSE);
 
 		q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
@@ -501,8 +514,8 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		spin_lock_irqsave(&prtd->lock, flags);
 		if (!prtd->bytes_sent) {
-			q6asm_write_async(prtd->audio_client, prtd->pcm_count,
-					  0, 0, NO_TIMESTAMP);
+			q6asm_write_async(prtd->audio_client, prtd->stream_id,
+					  prtd->pcm_count, 0, 0, 0);
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
@@ -527,8 +540,8 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		avail = prtd->bytes_received - prtd->bytes_sent;
 
 		if (avail >= prtd->pcm_count) {
-			q6asm_write_async(prtd->audio_client,
-					   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+			q6asm_write_async(prtd->audio_client, prtd->stream_id,
+					   prtd->pcm_count, 0, 0, 0);
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
@@ -562,6 +575,9 @@ static int q6asm_dai_compr_open(struct snd_compr_stream *stream)
 	if (!prtd)
 		return -ENOMEM;
 
+	/* DSP expects stream id from 1 */
+	prtd->stream_id = 1;
+
 	prtd->cstream = stream;
 	prtd->audio_client = q6asm_audio_client_alloc(dev,
 					(q6asm_cb)compress_event_handler,
@@ -608,7 +624,8 @@ static int q6asm_dai_compr_free(struct snd_compr_stream *stream)
 
 	if (prtd->audio_client) {
 		if (prtd->state)
-			q6asm_cmd(prtd->audio_client, CMD_CLOSE);
+			q6asm_cmd(prtd->audio_client, prtd->stream_id,
+				  CMD_CLOSE);
 
 		snd_dma_free_pages(&prtd->dma_buffer);
 		q6asm_unmap_memory_regions(stream->direction,
@@ -663,8 +680,9 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
 	prtd->bits_per_sample = 16;
 	if (dir == SND_COMPRESS_PLAYBACK) {
-		ret = q6asm_open_write(prtd->audio_client, params->codec.id,
-				params->codec.profile, prtd->bits_per_sample);
+		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
+				       params->codec.id, params->codec.profile,
+				       prtd->bits_per_sample);
 
 		if (ret < 0) {
 			dev_err(dev, "q6asm_open_write failed\n");
@@ -698,6 +716,7 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 		flac_cfg.min_frame_size = flac->min_frame_size;
 
 		ret = q6asm_stream_media_format_block_flac(prtd->audio_client,
+							   prtd->stream_id,
 							   &flac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "FLAC CMD Format block failed:%d\n", ret);
@@ -757,10 +776,12 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 
 		if (wma_v9)
 			ret = q6asm_stream_media_format_block_wma_v9(
-					prtd->audio_client, &wma_cfg);
+					prtd->audio_client, prtd->stream_id,
+					&wma_cfg);
 		else
 			ret = q6asm_stream_media_format_block_wma_v10(
-					prtd->audio_client, &wma_cfg);
+					prtd->audio_client, prtd->stream_id,
+					&wma_cfg);
 		if (ret < 0) {
 			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
 			return -EIO;
@@ -793,6 +814,7 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 			break;
 		}
 		ret = q6asm_stream_media_format_block_alac(prtd->audio_client,
+							   prtd->stream_id,
 							   &alac_cfg);
 		if (ret < 0) {
 			dev_err(dev, "ALAC CMD Format block failed:%d\n", ret);
@@ -817,6 +839,7 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 		ape_cfg.seek_table_present = ape->seek_table_present;
 
 		ret = q6asm_stream_media_format_block_ape(prtd->audio_client,
+							  prtd->stream_id,
 							  &ape_cfg);
 		if (ret < 0) {
 			dev_err(dev, "APE CMD Format block failed:%d\n", ret);
@@ -852,15 +875,18 @@ static int q6asm_dai_compr_trigger(struct snd_compr_stream *stream, int cmd)
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		ret = q6asm_run_nowait(prtd->audio_client, 0, 0, 0);
+		ret = q6asm_run_nowait(prtd->audio_client, prtd->stream_id,
+				       0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		prtd->state = Q6ASM_STREAM_STOPPED;
-		ret = q6asm_cmd_nowait(prtd->audio_client, CMD_EOS);
+		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
+				       CMD_EOS);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = q6asm_cmd_nowait(prtd->audio_client, CMD_PAUSE);
+		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
+				       CMD_PAUSE);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 51da3717a6a6..f5d1f3c2c1ec 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -270,7 +270,6 @@ struct audio_client {
 	wait_queue_head_t cmd_wait;
 	struct aprv2_ibasic_rsp_result_t result;
 	int perf_mode;
-	int stream_id;
 	struct q6asm *q6asm;
 	struct device *dev;
 };
@@ -862,8 +861,6 @@ struct audio_client *q6asm_audio_client_alloc(struct device *dev, q6asm_cb cb,
 	ac->priv = priv;
 	ac->io_mode = ASM_SYNC_IO_MODE;
 	ac->perf_mode = perf_mode;
-	/* DSP expects stream id from 1 */
-	ac->stream_id = 1;
 	ac->adev = a->adev;
 	kref_init(&ac->refcount);
 
@@ -919,8 +916,9 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_open_write(struct audio_client *ac, uint32_t format,
-		     u32 codec_profile, uint16_t bits_per_sample)
+int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
+		     uint32_t format, u32 codec_profile,
+		     uint16_t bits_per_sample)
 {
 	struct asm_stream_cmd_open_write_v3 *open;
 	struct apr_pkt *pkt;
@@ -935,7 +933,7 @@ int q6asm_open_write(struct audio_client *ac, uint32_t format,
 
 	pkt = p;
 	open = p + APR_HDR_SIZE;
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_STREAM_CMD_OPEN_WRITE_V3;
 	open->mode_flags = 0x00;
@@ -998,8 +996,9 @@ int q6asm_open_write(struct audio_client *ac, uint32_t format,
 }
 EXPORT_SYMBOL_GPL(q6asm_open_write);
 
-static int __q6asm_run(struct audio_client *ac, uint32_t flags,
-	      uint32_t msw_ts, uint32_t lsw_ts, bool wait)
+static int __q6asm_run(struct audio_client *ac, uint32_t stream_id,
+		       uint32_t flags, uint32_t msw_ts, uint32_t lsw_ts,
+		       bool wait)
 {
 	struct asm_session_cmd_run_v2 *run;
 	struct apr_pkt *pkt;
@@ -1014,7 +1013,7 @@ static int __q6asm_run(struct audio_client *ac, uint32_t flags,
 	pkt = p;
 	run = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_SESSION_CMD_RUN_V2;
 	run->flags = flags;
@@ -1042,10 +1041,10 @@ static int __q6asm_run(struct audio_client *ac, uint32_t flags,
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_run(struct audio_client *ac, uint32_t flags,
+int q6asm_run(struct audio_client *ac, uint32_t stream_id, uint32_t flags,
 	      uint32_t msw_ts, uint32_t lsw_ts)
 {
-	return __q6asm_run(ac, flags, msw_ts, lsw_ts, true);
+	return __q6asm_run(ac, stream_id, flags, msw_ts, lsw_ts, true);
 }
 EXPORT_SYMBOL_GPL(q6asm_run);
 
@@ -1053,16 +1052,17 @@ EXPORT_SYMBOL_GPL(q6asm_run);
  * q6asm_run_nowait() - start the audio client withou blocking
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  * @flags: flags associated with write
  * @msw_ts: timestamp msw
  * @lsw_ts: timestamp lsw
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_run_nowait(struct audio_client *ac, uint32_t flags,
-	      uint32_t msw_ts, uint32_t lsw_ts)
+int q6asm_run_nowait(struct audio_client *ac, uint32_t stream_id,
+		     uint32_t flags, uint32_t msw_ts, uint32_t lsw_ts)
 {
-	return __q6asm_run(ac, flags, msw_ts, lsw_ts, false);
+	return __q6asm_run(ac, stream_id, flags, msw_ts, lsw_ts, false);
 }
 EXPORT_SYMBOL_GPL(q6asm_run_nowait);
 
@@ -1070,6 +1070,7 @@ EXPORT_SYMBOL_GPL(q6asm_run_nowait);
  * q6asm_media_format_block_multi_ch_pcm() - setup pcm configuration
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  * @rate: audio sample rate
  * @channels: number of audio channels.
  * @channel_map: channel map pointer
@@ -1078,6 +1079,7 @@ EXPORT_SYMBOL_GPL(q6asm_run_nowait);
  * Return: Will be an negative value on error or zero on success
  */
 int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
+					  uint32_t stream_id,
 					  uint32_t rate, uint32_t channels,
 					  u8 channel_map[PCM_MAX_NUM_CHANNEL],
 					  uint16_t bits_per_sample)
@@ -1096,7 +1098,7 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 	pkt = p;
 	fmt = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
 	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
@@ -1125,8 +1127,8 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 }
 EXPORT_SYMBOL_GPL(q6asm_media_format_block_multi_ch_pcm);
 
-
 int q6asm_stream_media_format_block_flac(struct audio_client *ac,
+					 uint32_t stream_id,
 					 struct q6asm_flac_cfg *cfg)
 {
 	struct asm_flac_fmt_blk_v2 *fmt;
@@ -1142,7 +1144,7 @@ int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 	pkt = p;
 	fmt = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
 	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
@@ -1163,6 +1165,7 @@ int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_flac);
 
 int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
+					   uint32_t stream_id,
 					   struct q6asm_wma_cfg *cfg)
 {
 	struct asm_wmastdv9_fmt_blk_v2 *fmt;
@@ -1178,7 +1181,7 @@ int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
 	pkt = p;
 	fmt = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
 	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
@@ -1200,6 +1203,7 @@ int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v9);
 
 int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
+					    uint32_t stream_id,
 					    struct q6asm_wma_cfg *cfg)
 {
 	struct asm_wmaprov10_fmt_blk_v2 *fmt;
@@ -1215,7 +1219,7 @@ int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
 	pkt = p;
 	fmt = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
 	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
@@ -1238,6 +1242,7 @@ int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v10);
 
 int q6asm_stream_media_format_block_alac(struct audio_client *ac,
+					 uint32_t stream_id,
 					 struct q6asm_alac_cfg *cfg)
 {
 	struct asm_alac_fmt_blk_v2 *fmt;
@@ -1253,7 +1258,7 @@ int q6asm_stream_media_format_block_alac(struct audio_client *ac,
 	pkt = p;
 	fmt = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
 	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
@@ -1279,6 +1284,7 @@ int q6asm_stream_media_format_block_alac(struct audio_client *ac,
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_alac);
 
 int q6asm_stream_media_format_block_ape(struct audio_client *ac,
+					uint32_t stream_id,
 					struct q6asm_ape_cfg *cfg)
 {
 	struct asm_ape_fmt_blk_v2 *fmt;
@@ -1294,7 +1300,7 @@ int q6asm_stream_media_format_block_ape(struct audio_client *ac,
 	pkt = p;
 	fmt = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
 	fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
@@ -1321,6 +1327,7 @@ EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_ape);
  * q6asm_enc_cfg_blk_pcm_format_support() - setup pcm configuration for capture
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  * @rate: audio sample rate
  * @channels: number of audio channels.
  * @bits_per_sample: bits per sample
@@ -1328,7 +1335,9 @@ EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_ape);
  * Return: Will be an negative value on error or zero on success
  */
 int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
-		uint32_t rate, uint32_t channels, uint16_t bits_per_sample)
+					 uint32_t stream_id, uint32_t rate,
+					 uint32_t channels,
+					 uint16_t bits_per_sample)
 {
 	struct asm_multi_channel_pcm_enc_cfg_v2  *enc_cfg;
 	struct apr_pkt *pkt;
@@ -1344,7 +1353,7 @@ int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
 
 	pkt = p;
 	enc_cfg = p + APR_HDR_SIZE;
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
 
 	pkt->hdr.opcode = ASM_STREAM_CMD_SET_ENCDEC_PARAM;
 	enc_cfg->encdec.param_id = ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2;
@@ -1376,10 +1385,11 @@ EXPORT_SYMBOL_GPL(q6asm_enc_cfg_blk_pcm_format_support);
  * q6asm_read() - read data of period size from audio client
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_read(struct audio_client *ac)
+int q6asm_read(struct audio_client *ac, uint32_t stream_id)
 {
 	struct asm_data_cmd_read_v2 *read;
 	struct audio_port_data *port;
@@ -1400,7 +1410,7 @@ int q6asm_read(struct audio_client *ac)
 
 	spin_lock_irqsave(&ac->lock, flags);
 	port = &ac->port[SNDRV_PCM_STREAM_CAPTURE];
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
 	ab = &port->buf[port->dsp_buf];
 	pkt->hdr.opcode = ASM_DATA_CMD_READ_V2;
 	read->buf_addr_lsw = lower_32_bits(ab->phys);
@@ -1428,7 +1438,7 @@ int q6asm_read(struct audio_client *ac)
 }
 EXPORT_SYMBOL_GPL(q6asm_read);
 
-static int __q6asm_open_read(struct audio_client *ac,
+static int __q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
 		uint32_t format, uint16_t bits_per_sample)
 {
 	struct asm_stream_cmd_open_read_v3 *open;
@@ -1444,7 +1454,7 @@ static int __q6asm_open_read(struct audio_client *ac,
 	pkt = p;
 	open = p + APR_HDR_SIZE;
 
-	q6asm_add_hdr(ac, &pkt->hdr,  pkt_size, true, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr,  pkt_size, true, stream_id);
 	pkt->hdr.opcode = ASM_STREAM_CMD_OPEN_READ_V3;
 	/* Stream prio : High, provide meta info with encoded frames */
 	open->src_endpointype = ASM_END_POINT_DEVICE_MATRIX;
@@ -1475,15 +1485,16 @@ static int __q6asm_open_read(struct audio_client *ac,
  * q6asm_open_read() - Open audio client for reading
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  * @format: audio sample format
  * @bits_per_sample: bits per sample
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_open_read(struct audio_client *ac, uint32_t format,
-			uint16_t bits_per_sample)
+int q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
+		    uint32_t format, uint16_t bits_per_sample)
 {
-	return __q6asm_open_read(ac, format, bits_per_sample);
+	return __q6asm_open_read(ac, stream_id, format, bits_per_sample);
 }
 EXPORT_SYMBOL_GPL(q6asm_open_read);
 
@@ -1491,6 +1502,7 @@ EXPORT_SYMBOL_GPL(q6asm_open_read);
  * q6asm_write_async() - non blocking write
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  * @len: length in bytes
  * @msw_ts: timestamp msw
  * @lsw_ts: timestamp lsw
@@ -1498,8 +1510,8 @@ EXPORT_SYMBOL_GPL(q6asm_open_read);
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_write_async(struct audio_client *ac, uint32_t len, uint32_t msw_ts,
-		       uint32_t lsw_ts, uint32_t wflags)
+int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
+		      uint32_t msw_ts, uint32_t lsw_ts, uint32_t wflags)
 {
 	struct asm_data_cmd_write_v2 *write;
 	struct audio_port_data *port;
@@ -1520,7 +1532,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t len, uint32_t msw_ts,
 
 	spin_lock_irqsave(&ac->lock, flags);
 	port = &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, ac->stream_id);
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
 
 	ab = &port->buf[port->dsp_buf];
 	pkt->hdr.token = port->dsp_buf;
@@ -1567,9 +1579,9 @@ static void q6asm_reset_buf_state(struct audio_client *ac)
 	spin_unlock_irqrestore(&ac->lock, flags);
 }
 
-static int __q6asm_cmd(struct audio_client *ac, int cmd, bool wait)
+static int __q6asm_cmd(struct audio_client *ac, uint32_t stream_id, int cmd,
+		       bool wait)
 {
-	int stream_id = ac->stream_id;
 	struct apr_pkt pkt;
 	int rc;
 
@@ -1616,13 +1628,14 @@ static int __q6asm_cmd(struct audio_client *ac, int cmd, bool wait)
  * q6asm_cmd() - run cmd on audio client
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  * @cmd: command to run on audio client.
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_cmd(struct audio_client *ac, int cmd)
+int q6asm_cmd(struct audio_client *ac, uint32_t stream_id, int cmd)
 {
-	return __q6asm_cmd(ac, cmd, true);
+	return __q6asm_cmd(ac, stream_id, cmd, true);
 }
 EXPORT_SYMBOL_GPL(q6asm_cmd);
 
@@ -1630,13 +1643,14 @@ EXPORT_SYMBOL_GPL(q6asm_cmd);
  * q6asm_cmd_nowait() - non blocking, run cmd on audio client
  *
  * @ac: audio client pointer
+ * @stream_id: stream id
  * @cmd: command to run on audio client.
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_cmd_nowait(struct audio_client *ac, int cmd)
+int q6asm_cmd_nowait(struct audio_client *ac, uint32_t stream_id, int cmd)
 {
-	return __q6asm_cmd(ac, cmd, false);
+	return __q6asm_cmd(ac, stream_id, cmd, false);
 }
 EXPORT_SYMBOL_GPL(q6asm_cmd_nowait);
 
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 38a207d6cd95..ceece124dd3d 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -93,37 +93,47 @@ struct audio_client *q6asm_audio_client_alloc(struct device *dev,
 					      q6asm_cb cb, void *priv,
 					      int session_id, int perf_mode);
 void q6asm_audio_client_free(struct audio_client *ac);
-int q6asm_write_async(struct audio_client *ac, uint32_t len, uint32_t msw_ts,
-		       uint32_t lsw_ts, uint32_t flags);
-int q6asm_open_write(struct audio_client *ac, uint32_t format,
-		     u32 codec_profile, uint16_t bits_per_sample);
-
-int q6asm_open_read(struct audio_client *ac, uint32_t format,
+int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
+		      uint32_t msw_ts, uint32_t lsw_ts, uint32_t flags);
+int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
+		     uint32_t format, u32 codec_profile,
 		     uint16_t bits_per_sample);
+
+int q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
+		    uint32_t format, uint16_t bits_per_sample);
 int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
-		uint32_t rate, uint32_t channels, uint16_t bits_per_sample);
-int q6asm_read(struct audio_client *ac);
+					 uint32_t stream_id, uint32_t rate,
+					 uint32_t channels,
+					 uint16_t bits_per_sample);
+
+int q6asm_read(struct audio_client *ac, uint32_t stream_id);
 
 int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
+					  uint32_t stream_id,
 					  uint32_t rate, uint32_t channels,
 					  u8 channel_map[PCM_MAX_NUM_CHANNEL],
 					  uint16_t bits_per_sample);
 int q6asm_stream_media_format_block_flac(struct audio_client *ac,
+					 uint32_t stream_id,
 					 struct q6asm_flac_cfg *cfg);
 int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
+					   uint32_t stream_id,
 					   struct q6asm_wma_cfg *cfg);
 int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
+					    uint32_t stream_id,
 					    struct q6asm_wma_cfg *cfg);
 int q6asm_stream_media_format_block_alac(struct audio_client *ac,
+					 uint32_t stream_id,
 					 struct q6asm_alac_cfg *cfg);
 int q6asm_stream_media_format_block_ape(struct audio_client *ac,
+					uint32_t stream_id,
 					struct q6asm_ape_cfg *cfg);
-int q6asm_run(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
-	      uint32_t lsw_ts);
-int q6asm_run_nowait(struct audio_client *ac, uint32_t flags, uint32_t msw_ts,
-		     uint32_t lsw_ts);
-int q6asm_cmd(struct audio_client *ac, int cmd);
-int q6asm_cmd_nowait(struct audio_client *ac, int cmd);
+int q6asm_run(struct audio_client *ac, uint32_t stream_id, uint32_t flags,
+	      uint32_t msw_ts, uint32_t lsw_ts);
+int q6asm_run_nowait(struct audio_client *ac, uint32_t stream_id,
+		     uint32_t flags, uint32_t msw_ts, uint32_t lsw_ts);
+int q6asm_cmd(struct audio_client *ac, uint32_t stream_id,  int cmd);
+int q6asm_cmd_nowait(struct audio_client *ac, uint32_t stream_id,  int cmd);
 int q6asm_get_session_id(struct audio_client *ac);
 int q6asm_map_memory_regions(unsigned int dir,
 			     struct audio_client *ac,
-- 
2.21.0

