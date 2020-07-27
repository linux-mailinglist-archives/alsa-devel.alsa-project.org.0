Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD7222E962
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCFC41612;
	Mon, 27 Jul 2020 11:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCFC41612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595843128;
	bh=rs8hb0Z1tVRVg/OpMD8XShwBDuRbbWqjCsxuAFPe3WA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IheHEUKUY9PPaoltYC10wBGM0dnYrpb9fylVs7QzmsQmM2qDZjOVTX/LKyr7rizOT
	 UT4/LmghVEHzv09LIZPzMn4H526OugvwcOHVjew4Hc0sjMYwqHQKxU2gxq5GBUnFLY
	 X2pyaXGjglRfExWLX6mo/s7JOlfNmlKwT7TfmLvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 624B3F80334;
	Mon, 27 Jul 2020 11:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B70F802F7; Mon, 27 Jul 2020 11:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5C9FF802BD
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C9FF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EC/9R6GV"
Received: by mail-wr1-x442.google.com with SMTP id f18so14178071wrs.0
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xRCswOaIl01J5qLQy3MovH1KYI3bsQgHVCFW42lGX4=;
 b=EC/9R6GVQXsstq16lezcu2TCSgHPmK8uqdRZm+kmziN7yCki6EhOBoMZ+SKwznhMk6
 S6TULZu0AaJqKcmQn4ZcSp1e3TrhJvrLICb1pmBt3H4vkQEq2BdieMcM9q0K3FB6b0cJ
 K6eVdbYNscagKFREaRzdM0V1/16fGahkfZI71BBeFNweNWQrZqrGNA2s80iw5P/V7+4m
 37XD3LOUhDWV6d6uhZs2E7V+pQxFLVZpWoMJyHED/p4DOkit0WRQuR+MpaHTFl9meJd0
 l2JCzu0w5QlMd1IRoLcyu73CtMvYrX7kIplKoBy+XeKCAuX+GcFtH3Lu8+oxTLqLM3WU
 pNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xRCswOaIl01J5qLQy3MovH1KYI3bsQgHVCFW42lGX4=;
 b=fYQBPc3DA/BpVflgjbzaAcNoToLK32gpy+zo/zs55R6cUkLTnPiZeY6M6dTl6IE1JW
 b4dbeC1RUo3fnmpdvLtqqqZgCeEUYxCSUrZYJArVhwRfmCx54hayQlX0H/x5rBb0b/hx
 rYQwNMwq/ogMWOb2NAhOzja6XvDFsWzkpitZ3UAU8EmH6u3JTwo2k9/AEyG1tdQaEHOH
 XpV9jvf1GIlPPbRQZ9cjEHJXiLZRV2NlSA8fn+zFcGHFiRf+KRAQCK+Exqcriouf1yLK
 8+yhN56o9V8kXUjYbKmJFxsLOlpzA3sgGT7KHZfZZJ6AGM/RPUZgKbrGAfNpYVUzG74p
 eCZA==
X-Gm-Message-State: AOAM530HIgLewRnKwKMYXCo+bGF0dtILZiKCwXi+DFsDorXgYdj2+Cmx
 boSjVjTBLPBy8TPqM/sai2U53w==
X-Google-Smtp-Source: ABdhPJygI7BnJqAWnNtJr6Nmlh7QkfDf3Fo8hiJVO+dNvnXtolYUMPuyhhpG+8f1p+lQri8MUYZMOA==
X-Received: by 2002:adf:f58c:: with SMTP id f12mr19378761wro.314.1595842705255; 
 Mon, 27 Jul 2020 02:38:25 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 09/10] ASoC: q6asm-dai: add gapless support
Date: Mon, 27 Jul 2020 10:38:05 +0100
Message-Id: <20200727093806.17089-10-srinivas.kandagatla@linaro.org>
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

Add support to gapless playback by implementing metadata,
next_track, drain and partial drain support.

Gapless on Q6ASM is implemented by opening 2 streams in a single
q6asm stream and toggling them on next track.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 103 +++++++++++++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6asm.h     |   1 +
 2 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 420aaaa67788..4ecf9cb658ae 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -67,11 +67,14 @@ struct q6asm_dai_rtd {
 	uint16_t bits_per_sample;
 	uint16_t source; /* Encoding source bit mask */
 	struct audio_client *audio_client;
+	uint32_t next_track_stream_id;
+	bool next_track;
 	uint32_t stream_id;
 	uint16_t session_id;
 	enum stream_state state;
 	uint32_t initial_samples_drop;
 	uint32_t trailing_samples_drop;
+	bool notify_on_drain;
 };
 
 struct q6asm_dai_data {
@@ -510,13 +513,19 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 	struct q6asm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
 	unsigned long flags;
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
@@ -526,7 +535,30 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		break;
 
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		prtd->state = Q6ASM_STREAM_STOPPED;
+		spin_lock_irqsave(&prtd->lock, flags);
+		if (prtd->notify_on_drain) {
+			if (substream->partial_drain) {
+				/*
+				 * Close old stream and make it stale, switch
+				 * the active stream now!
+				 */
+				q6asm_cmd_nowait(prtd->audio_client,
+						 prtd->stream_id,
+						 CMD_CLOSE);
+				/*
+				 * vaild stream ids start from 1, So we are
+				 * toggling this between 1 and 2.
+				 */
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
@@ -542,13 +574,32 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
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
 
@@ -628,9 +679,15 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
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
@@ -905,6 +962,32 @@ static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,
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
@@ -938,6 +1021,14 @@ static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
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
index f20e1441988f..82e584aa534f 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -33,6 +33,7 @@ enum {
 
 #define MAX_SESSIONS	8
 #define FORMAT_LINEAR_PCM   0x0000
+#define ASM_LAST_BUFFER_FLAG           BIT(30)
 
 struct q6asm_flac_cfg {
         u32 sample_rate;
-- 
2.21.0

