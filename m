Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08A1F6837
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 14:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B841E167F;
	Thu, 11 Jun 2020 14:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B841E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591879721;
	bh=r6lGvB3s2rshRhYYdLrSqE29KZXfuvYlh6GNhXbEtyg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ads3SLj/FbmBbRTVgqdF6ROFawzR031g0j6oiXq5QDxmNUxzBgpwa9PHx6ChqOPoR
	 3yEyU1RJlUuy71Oo39o8qWZbbdGsetaKVnw7C/gmnJSlys2Xe1Yj9ZfyonamKXsDYe
	 uYJo45AU26E9TBDWkT3TIDa5tf9ASVEQHvRWB8RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE80F80308;
	Thu, 11 Jun 2020 14:42:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 071CDF802E3; Thu, 11 Jun 2020 14:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBE76F802BD
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 14:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE76F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zUczEBCh"
Received: by mail-wr1-x444.google.com with SMTP id r7so6033159wro.1
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0iaTLKqtIL8DWUk/Ea8kKTBBPz/6PkEw/a931KtnLFc=;
 b=zUczEBChUUwZHT2y9ySJt1h7dVBb0LEw9r5//S1h6F4fWoxkLJoau/40zVwUrWsnpk
 JDjotTYzFtz9N2DSwP3ENPIOJFEumgrCgrZ5t6UpiyumnADn7QRvdISsWTfKGDSJfPQQ
 0AniWhMBQgQCxlD5qe/mUiBK3QQmRWwGQYnpAIDpR91/bVgESxEaWljVf4E7UYGDAE4J
 fvlWL+/Y4TI/E4kiB0aih5sdsPKLcYDtnDBFtN9VQwLgAbFz8/LNiE2pcT4f525cZo/1
 VoR0TRVOX4yTKEdbO8V9SwSaSvS9m2V38M0ahs//PwLBJN300nGy+x7txI5bXdIEBwty
 glIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0iaTLKqtIL8DWUk/Ea8kKTBBPz/6PkEw/a931KtnLFc=;
 b=hKL/OyPUbsZJSy5WSRTIL8mcuXiz577sHyVlxWh1wcDZgqmbrV8+8Po8uJ8nr5Jg7n
 JzyQ5HAG9Tc23e8+ApxA+l/0nhIIHs0267/uTOp/7Kg71sk/WY29y7k/Gr9K9q+hONxW
 ApbkAevR9WHlt9XzEdd7qfvB7PjUw6MVgcXkNQXrwA04olxUewOhto1r/HZPYK2esd7C
 CaKZXhVXNQfB9pZOae3D8QYMblw3z/KB/uV3kGVFPxytd3qtDcgUwV8gJTyPxj3V/uy+
 Py+VV1tpLFomqq8+RlzXxE5zRg06bLtgzeobaFXNd7d4Gqz+MRrmULrz7g1W/TbQFW3l
 sXiw==
X-Gm-Message-State: AOAM531k2SuSINKjDUuCNpxjFnbmnRx0pO5b0IiF9/Gy8QN2aBUNTLBX
 3t96wyOAF5wvxSjGrDrF+UHtMQ==
X-Google-Smtp-Source: ABdhPJz7ZNPReQj2HsAw5XGS9FL6huhrov1XnJBxu/pHO7FKy0P6cgVaxE/opwgqpHGEudbY8YDZLw==
X-Received: by 2002:adf:f988:: with SMTP id f8mr10120025wrr.81.1591879332295; 
 Thu, 11 Jun 2020 05:42:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q13sm4810355wrn.84.2020.06.11.05.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 05:42:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 8/8] ASoC: q6asm: allow to specify buffer offset in q6asm_write
Date: Thu, 11 Jun 2020 13:41:59 +0100
Message-Id: <20200611124159.20742-9-srinivas.kandagatla@linaro.org>
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

In usecase like gapless, its possible that next stream/track
can start an offset where previous track ends, and this offset
may not be at period boundary.

So adding offset parameter to write function will provide ablity
to send buffers with an offset inside period boundary.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 15 +++++++++------
 sound/soc/qcom/qdsp6/q6asm.c     | 21 ++++++++++++++-------
 sound/soc/qcom/qdsp6/q6asm.h     |  3 ++-
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 7aba3c07810b..113929e79407 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -187,7 +187,7 @@ static void event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-				   prtd->pcm_count, 0, 0, 0);
+				   0, prtd->pcm_count, 0, 0, 0);
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6ASM_STREAM_STOPPED;
@@ -197,7 +197,7 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					   prtd->pcm_count, 0, 0, 0);
+					  0, prtd->pcm_count, 0, 0, 0);
 
 		break;
 		}
@@ -509,14 +509,14 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 	struct snd_compr_stream *substream = prtd->cstream;
 	unsigned long flags;
 	uint64_t avail;
-	uint32_t bytes_written;
+	uint32_t bytes_written, offset;
 
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		spin_lock_irqsave(&prtd->lock, flags);
 		if (!prtd->bytes_sent) {
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					  prtd->pcm_count, 0, 0, 0);
+					  0, prtd->pcm_count, 0, 0, 0);
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
@@ -532,7 +532,10 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 
 		bytes_written = token >> ASM_WRITE_TOKEN_LEN_SHIFT;
 		prtd->copied_total += bytes_written;
-		snd_compr_fragment_elapsed(substream);
+		offset = prtd->copied_total % prtd->pcm_count;
+
+		if (bytes_written && !offset)
+			snd_compr_fragment_elapsed(substream);
 
 		avail = prtd->bytes_received - prtd->bytes_sent;
 		if (prtd->state != Q6ASM_STREAM_RUNNING || avail <= 0) {
@@ -542,7 +545,7 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 
 		if (avail >= prtd->pcm_count) {
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					   prtd->pcm_count, 0, 0, 0);
+					  0, prtd->pcm_count, 0, 0, 0);
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 205453d1c1fc..8e3746ce4fa4 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -238,6 +238,7 @@ struct asm_session_cmd_run_v2 {
 struct audio_buffer {
 	phys_addr_t phys;
 	uint32_t size;		/* size of buffer */
+	uint32_t offset;
 };
 
 struct audio_port_data {
@@ -671,6 +672,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			phys_addr_t phys;
 			unsigned long flags;
 			int token = hdr->token & ASM_WRITE_TOKEN_MASK;
+			struct audio_buffer *ab;
 
 			spin_lock_irqsave(&ac->lock, flags);
 
@@ -682,12 +684,13 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 
-			phys = port->buf[token].phys;
+			ab = &port->buf[token];
+			phys = ab->phys + ab->offset;
 
-			if (lower_32_bits(phys) != result->opcode ||
+			if (lower_32_bits(phys) != (result->opcode) ||
 			    upper_32_bits(phys) != result->status) {
 				dev_err(ac->dev, "Expected addr %pa\n",
-					&port->buf[token].phys);
+					&ab->phys + ab->offset);
 				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
@@ -1504,6 +1507,7 @@ EXPORT_SYMBOL_GPL(q6asm_open_read);
  *
  * @ac: audio client pointer
  * @stream_id: stream id
+ * @offset: offset in the period buffer
  * @len: length in bytes
  * @msw_ts: timestamp msw
  * @lsw_ts: timestamp lsw
@@ -1511,8 +1515,9 @@ EXPORT_SYMBOL_GPL(q6asm_open_read);
  *
  * Return: Will be an negative value on error or zero on success
  */
-int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
-		      uint32_t msw_ts, uint32_t lsw_ts, uint32_t wflags)
+int q6asm_write_async(struct audio_client *ac, uint32_t stream_id,
+		      uint32_t offset, uint32_t len, uint32_t msw_ts,
+		      uint32_t lsw_ts, uint32_t wflags)
 {
 	struct asm_data_cmd_write_v2 *write;
 	struct audio_port_data *port;
@@ -1538,7 +1543,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	ab = &port->buf[port->dsp_buf];
 	pkt->hdr.token = port->dsp_buf | (len << ASM_WRITE_TOKEN_LEN_SHIFT);
 	pkt->hdr.opcode = ASM_DATA_CMD_WRITE_V2;
-	write->buf_addr_lsw = lower_32_bits(ab->phys);
+	write->buf_addr_lsw = lower_32_bits(ab->phys + offset);
 	write->buf_addr_msw = upper_32_bits(ab->phys);
 	write->buf_size = len;
 	write->seq_id = port->dsp_buf;
@@ -1549,7 +1554,9 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 
 	write->flags = wflags;
 
-	port->dsp_buf++;
+	ab->offset = offset;
+	if ((offset + len) == ab->size)
+		port->dsp_buf++;
 
 	if (port->dsp_buf >= port->num_periods)
 		port->dsp_buf = 0;
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 0379580f0742..ad7e2f6f122f 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -96,7 +96,8 @@ struct audio_client *q6asm_audio_client_alloc(struct device *dev,
 					      q6asm_cb cb, void *priv,
 					      int session_id, int perf_mode);
 void q6asm_audio_client_free(struct audio_client *ac);
-int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
+int q6asm_write_async(struct audio_client *ac, uint32_t stream_id,
+		      uint32_t offset, uint32_t len,
 		      uint32_t msw_ts, uint32_t lsw_ts, uint32_t flags);
 int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 		     uint32_t format, u32 codec_profile,
-- 
2.21.0

