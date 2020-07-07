Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F338F21743B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7982823;
	Tue,  7 Jul 2020 18:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7982823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594140070;
	bh=pJhF2DUqiEYWxVEECuZMY25AfV31t+rSSGM1Y8uO47s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npDYRfwQrkRryese+fq2WCL9BBAyojUmCc8f0BhTh0Db43hW6HAfigrwtoi6/J47L
	 g3A6p5Pb31fJ+EwgVXcfaMXUOnOVN4VozkktRWauF8KNNLuAd85VjRpXq1luTUB8ed
	 jZa2hgtKIoJQHusJ49jaE+sdeJXpXBZMLg4C3NKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF85F800D0;
	Tue,  7 Jul 2020 18:37:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70F3FF801F9; Tue,  7 Jul 2020 18:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F191FF8025A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F191FF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XOqlyXwn"
Received: by mail-wr1-x442.google.com with SMTP id q5so45857648wru.6
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2O4wJdzZbZHu5daty2CCXYU82Av0QneczC79M2bN6wY=;
 b=XOqlyXwn6PyrBvXgRXFf3Qh9pekT+zdbeo4VJeoxdOabiS+DV6ZVNYcAmNm1l4rY9q
 WyZlyZDkaf5yWOw4fKMTN2xCqiBoLMiSBr6SZp6k+3G29MhoJ7Of8SL/EoIZwAeo3OJO
 iuokI1GXuTw3U7HcvHP7ODEHLTg8iu7RPbx6n6MG2qSYU/swBFw4LtpphG4nPVOCdEEt
 F1pM2FsZRTI1laePfn7Pt/j5KffVTnO1NGFMhB/IjZkFDuiiz+2c8oEcuHh0fFC/oHkV
 FZgLoJg+TuFWj1xzCZXIyAhPbbztrqhIt/5jWUUHm9EhSRdNkvh1HlFndlafU+d88pqy
 Cb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2O4wJdzZbZHu5daty2CCXYU82Av0QneczC79M2bN6wY=;
 b=AS4zEzPgchguS0WeoX3HFcaskfEFA0DggRj5C+Ztx2Ap3QZ1EqWL0B/DAWsSc2S8fL
 lIQQpSw1f98ayV8ckhYkN3w1+ria4WE7HAfv10oUQpgzCatOQHU/euMS+KsruYuGqxsf
 wJNdDdbZ072jWVn4o4aZ5siZlnmeTqS2/Gejx0wv4w0BmuDcOoshZgdyj2qR+WNYPBql
 GktwscRr4Xx30ttrIrWLbHbcAJQqDI7Mehwf/jFc9qdxVdwzm+cHy1iv3GhdkN9WqYNq
 VJqcBw2ZCWUZlsPa12YYLHHFYyhM7yOdD7z6FKXPBU4JespNENR7hcYRs9LzugL7pe7e
 9+oQ==
X-Gm-Message-State: AOAM530VYev7kh0BA35O9Cd95nYBf62NGJi0a0QR8kx35LV/KOCPK+Qi
 pbi/Qvl8iDDun2fYaS1jaXOReg==
X-Google-Smtp-Source: ABdhPJzBykB5S6/CR2PFZ1Nt8DoH/YqS01INCIPYPBcLXvhadQm1/0MW6F4spZy7LVkvpKPYaWW0iw==
X-Received: by 2002:adf:ed87:: with SMTP id c7mr52913187wro.422.1594139816058; 
 Tue, 07 Jul 2020 09:36:56 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 05/11] ASoC: q6asm: add length to write command token
Date: Tue,  7 Jul 2020 17:36:35 +0100
Message-Id: <20200707163641.17113-6-srinivas.kandagatla@linaro.org>
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

Add length to write command packet token so that we can track exactly
how many bytes are consumed by DSP in the command reply.

This is useful in some use-cases where the end of the file/stream
is not aligned with period size.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +++-
 sound/soc/qcom/qdsp6/q6asm.c     | 7 ++++---
 sound/soc/qcom/qdsp6/q6asm.h     | 3 +++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index bcedcc3f8a5c..c3558288242a 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -509,6 +509,7 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 	struct snd_compr_stream *substream = prtd->cstream;
 	unsigned long flags;
 	uint64_t avail;
+	uint32_t bytes_written;
 
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
@@ -529,7 +530,8 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
 		spin_lock_irqsave(&prtd->lock, flags);
 
-		prtd->copied_total += prtd->pcm_count;
+		bytes_written = token >> ASM_WRITE_TOKEN_LEN_SHIFT;
+		prtd->copied_total += bytes_written;
 		snd_compr_fragment_elapsed(substream);
 
 		if (prtd->state != Q6ASM_STREAM_RUNNING) {
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index d6728304ce6a..205453d1c1fc 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -670,6 +670,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		if (ac->io_mode & ASM_SYNC_IO_MODE) {
 			phys_addr_t phys;
 			unsigned long flags;
+			int token = hdr->token & ASM_WRITE_TOKEN_MASK;
 
 			spin_lock_irqsave(&ac->lock, flags);
 
@@ -681,12 +682,12 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 
-			phys = port->buf[hdr->token].phys;
+			phys = port->buf[token].phys;
 
 			if (lower_32_bits(phys) != result->opcode ||
 			    upper_32_bits(phys) != result->status) {
 				dev_err(ac->dev, "Expected addr %pa\n",
-					&port->buf[hdr->token].phys);
+					&port->buf[token].phys);
 				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
@@ -1535,7 +1536,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
 
 	ab = &port->buf[port->dsp_buf];
-	pkt->hdr.token = port->dsp_buf;
+	pkt->hdr.token = port->dsp_buf | (len << ASM_WRITE_TOKEN_LEN_SHIFT);
 	pkt->hdr.opcode = ASM_DATA_CMD_WRITE_V2;
 	write->buf_addr_lsw = lower_32_bits(ab->phys);
 	write->buf_addr_msw = upper_32_bits(ab->phys);
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index ceece124dd3d..0379580f0742 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -20,6 +20,9 @@
 #define ASM_CLIENT_EVENT_CMD_RUN_DONE		0x1008
 #define ASM_CLIENT_EVENT_DATA_WRITE_DONE	0x1009
 #define ASM_CLIENT_EVENT_DATA_READ_DONE		0x100a
+#define ASM_WRITE_TOKEN_MASK			GENMASK(15, 0)
+#define ASM_WRITE_TOKEN_LEN_MASK		GENMASK(31, 16)
+#define ASM_WRITE_TOKEN_LEN_SHIFT		16
 
 enum {
 	LEGACY_PCM_MODE = 0,
-- 
2.21.0

