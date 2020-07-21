Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10B22868C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:58:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40DFF1673;
	Tue, 21 Jul 2020 18:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40DFF1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350716;
	bh=/ZWOiZinXgyft3QbgAK5X3+CURPyV3g0BpuQGJi9XZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQevD1U52enePKD7rI5lod4HW0YATA/KpjPYhHMVzhpIs6C6htvTXbnmKY/afu3EO
	 29Xp5ubY1pNHXiqQhFkrIAJLNIyNe8br91/lEkgQZqrc6nL9rU0EnAxE/uLLPPK7Lj
	 xVnRXEIa5SkpZHZTQoJXgPfDIBL7a62VycD9+kzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB83DF802F8;
	Tue, 21 Jul 2020 18:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D7FBF802EC; Tue, 21 Jul 2020 18:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A402FF802BD
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A402FF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Fx7sh8hS"
Received: by mail-wm1-x343.google.com with SMTP id o8so3498597wmh.4
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=es6+jBGMK8ai7em1T9vvEeryxpgMOX8IQwvAkx9cMQo=;
 b=Fx7sh8hSQNz81hTJDLXs7WqJS1Gaen4E8ekXdPxKWS8mqU2W8JoWCKAyamnXo3V9Qf
 qIyEuZoh6mXqmvD4f55tFRhwwq3SJ5kFtp9cXFBGAsHVLmq1XlZpEI2girohTMYFTQiA
 lpjAfEpeFncJlLSEV/mKg4lngHtGSk3LzD9p533NkJsXsitWsjj8lGfVwLDWuJ2j9E6O
 zdD3DBK+5G3EDn/lYr+2LRWqtIp6Q1ys6YKVPFqUdk3z1yVTV8ob5zsXqdb4YLawxEmo
 ih8V0RXvRPVe1HLdNonD1Kx6c97wH7THpTFzYcdgSZh8ubhcnKNw3z/ieDWY8qPlH8K1
 ux6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=es6+jBGMK8ai7em1T9vvEeryxpgMOX8IQwvAkx9cMQo=;
 b=Kz/kJBbMxM6lbx6BNN+s8rvfJrHqiohNvWB9LARtTYr4PGEjFg8SRTH8wLB+K/DJjb
 vOzFDLnc+xlf2qO8kDdG9KgMFeWBdj9ewgO7Ljz9m/9KLRuETZsygIyRhNBQEdzBnjPv
 W5oNpncFpdIXT16qjvVT2Y363dn7ZfJMx0/AjWWtKA7dcEecxsnfBDJDb5sl8ldqCruu
 lvI7xE350SXd+Zonn0aDeNca+AHFl3t76mcHi9yxAJRCRmq4bGWAREVuwwtinneAdTcb
 rermx5tmTmT5gqdZkQZS9Zq+tUyO3lL1saGJPMlZXstohMYcI0HkW0djesslZBJAt9SD
 6z6w==
X-Gm-Message-State: AOAM533g7mTyeCOmjkSzRwoPTBFzUkmJMfxIMwchbPH2GF1aWfFuOa0V
 UJvFg3Q5RkfE6rK6HInUCW6qbg==
X-Google-Smtp-Source: ABdhPJy8DGVcnB0ReuS3Md3gtsV1gJJfunligUoL/2nZPSFt2oAeeXmUfHU0PZAARbgH4KxT3CVRmg==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr4959466wmk.34.1595350414160; 
 Tue, 21 Jul 2020 09:53:34 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c25sm4058648wml.18.2020.07.21.09.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:53:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 9/9] ASoC: q6asm-dai: add support to copy callback
Date: Tue, 21 Jul 2020 17:53:06 +0100
Message-Id: <20200721165306.29082-10-srinivas.kandagatla@linaro.org>
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

During gapless playback, its possible for previous track to
end at unaligned boundary, starting next track on the same
boundary can lead to unaligned address exception in dsp.

So implement copy callback for finer control on the buffer offsets.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 65 +++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 50055c113f10..b5c719682919 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1052,16 +1052,71 @@ static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
 	return 0;
 }
 
-static int q6asm_dai_compr_ack(struct snd_soc_component *component,
-			       struct snd_compr_stream *stream,
-			       size_t count)
+static int q6asm_compr_copy(struct snd_soc_component *component,
+			    struct snd_compr_stream *stream, char __user *buf,
+			    size_t count)
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	unsigned long flags;
+	u32 wflags = 0;
+	int avail, bytes_in_flight = 0;
+	void *dstn;
+	size_t copy;
+	u32 app_pointer;
+	u32 bytes_received;
+
+	bytes_received = prtd->bytes_received;
+
+	/**
+	 * Make sure that next track data pointer is aligned at 32 bit boundary
+	 * This is a Mandatory requirement from DSP data buffers alignment
+	 */
+	if (prtd->next_track)
+		bytes_received = ALIGN(prtd->bytes_received, prtd->pcm_count);
+
+	app_pointer = bytes_received/prtd->pcm_size;
+	app_pointer = bytes_received -  (app_pointer * prtd->pcm_size);
+	dstn = prtd->dma_buffer.area + app_pointer;
+
+	if (count < prtd->pcm_size - app_pointer) {
+		if (copy_from_user(dstn, buf, count))
+			return -EFAULT;
+	} else {
+		copy = prtd->pcm_size - app_pointer;
+		if (copy_from_user(dstn, buf, copy))
+			return -EFAULT;
+		if (copy_from_user(prtd->dma_buffer.area, buf + copy,
+				   count - copy))
+			return -EFAULT;
+	}
 
 	spin_lock_irqsave(&prtd->lock, flags);
-	prtd->bytes_received += count;
+
+	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
+
+	if (prtd->next_track) {
+		prtd->next_track = false;
+		prtd->copied_total = ALIGN(prtd->copied_total, prtd->pcm_count);
+		prtd->bytes_sent = ALIGN(prtd->bytes_sent, prtd->pcm_count);
+	}
+
+	prtd->bytes_received = bytes_received + count;
+
+	/* Kick off the data to dsp if its starving!! */
+	if (prtd->state == Q6ASM_STREAM_RUNNING && (bytes_in_flight == 0)) {
+		uint32_t bytes_to_write = prtd->pcm_count;
+
+		avail = prtd->bytes_received - prtd->bytes_sent;
+
+		if (avail < prtd->pcm_count)
+			bytes_to_write = avail;
+
+		q6asm_write_async(prtd->audio_client, prtd->stream_id,
+				  bytes_to_write, 0, 0, wflags);
+		prtd->bytes_sent += bytes_to_write;
+	}
+
 	spin_unlock_irqrestore(&prtd->lock, flags);
 
 	return count;
@@ -1124,7 +1179,7 @@ static struct snd_compress_ops q6asm_dai_compress_ops = {
 	.get_caps	= q6asm_dai_compr_get_caps,
 	.get_codec_caps	= q6asm_dai_compr_get_codec_caps,
 	.mmap		= q6asm_dai_compr_mmap,
-	.ack		= q6asm_dai_compr_ack,
+	.copy		= q6asm_compr_copy,
 };
 
 static int q6asm_dai_pcm_new(struct snd_soc_component *component,
-- 
2.21.0

