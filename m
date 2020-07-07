Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8B21744B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEDFB15E0;
	Tue,  7 Jul 2020 18:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEDFB15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594140245;
	bh=j7/Yjo4gmYp3nCfCBF1HwFCZxZHO/iAIRWWfrV37FF0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDkdKaABvP0rFEI6zwm7PZtOuxcy4oEsNgyuPE/dQp73UvCezDXbDi6PNoFUoAVm2
	 fZVPCBXh7iu6EDS8EemZqsHm/P2gJg2ksIT4S+GuM/iiwNVrfI0GfiJ3DCRF2NlWu6
	 7aKDRiWQ6WBSl3hIqaIvNzwBHVnBtciJv+NMovdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A094F80321;
	Tue,  7 Jul 2020 18:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A983BF802EA; Tue,  7 Jul 2020 18:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ED12F802DB
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED12F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="z2/7iVEP"
Received: by mail-wm1-x343.google.com with SMTP id q15so43984138wmj.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0LCQd23Yogjcuva7hnoMUmTS7Zo4+fh0cqMsuVwvVHs=;
 b=z2/7iVEPi6c4YzePA7lVJFqlxQru4flzloqCa6AmzydzcLXSHjRmP6u6E97J+Gfaad
 knpysLVgJ5DAsxr30ZgCeAkqV7BiXkx8lS474vk8i2UI407yuTbOCu43WBO+8wG/bzAb
 Hgv4q55N/tU7w2nnr7GmLX6BJcZtuxiCYzaYoCTYDwXXnaXVKGXBdELSlyaX4pVqLFXt
 O3x9g4lt+CO2/KXQorj2EamsHhF96qNWaJJFpX9eR/bDj07WU3EplKQTR6WuhhWLDnuV
 iMm1BT+Z/oZyGE0p08X4oPgJsq5yHeh3ZXmttChWtSBnUpEqTe7UqSClja8841qZ1nqS
 aXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0LCQd23Yogjcuva7hnoMUmTS7Zo4+fh0cqMsuVwvVHs=;
 b=APZ/uE4fEAnDpgDD0pDeLMCi0XqHc+6JTVJjShsidEqMES32QkQoWdQVNH/aAq4rWx
 bXq626IbR4UqOGlCJHmPYO3ORcZGeEVylbEZn3rbD/9NrWpAx23uAaXzuRUsBcCCB+KE
 j+eaCosXJkO5RiIqj8Mc0DfG0WaP8e+QcP7GHRtflp/3ZnuXVR1ej/YcqSFBxgh8Dd4A
 OMBnx/FLUkEdSr/ixZrDDDQbPS63jFy3446vi4jwEHotAMT+FEtk2xEWC/W32VjFzKQQ
 AcW//8sdcjjVZt8vahtFPw6ilodAdemE/JIyGDaC/LykaZb9UgjFwolIKUFxx+RrkNkQ
 tcPw==
X-Gm-Message-State: AOAM531uvX37qQOoxrO+kSJaA2s2NEQ3xv0zf9r4uUDPexEZ86DHrNQk
 DKGgpNlwR2dQAUKRhpos6LKoCA==
X-Google-Smtp-Source: ABdhPJxEGLcIU0q2DNdl3HjVtQCCXNoNR/WiMWN+ecXbpoBqpJ0jbw+EHwixtcDEmaz0Y5yoWECKfw==
X-Received: by 2002:a1c:7d85:: with SMTP id y127mr5259971wmc.181.1594139823817; 
 Tue, 07 Jul 2020 09:37:03 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:37:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 11/11] ASoC: q6asm-dai: add support to copy callback
Date: Tue,  7 Jul 2020 17:36:41 +0100
Message-Id: <20200707163641.17113-12-srinivas.kandagatla@linaro.org>
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

During gapless playback, its possible for previous track to
end at unaligned boundary, starting next track on the same
boundary can lead to unaligned address exception in dsp.

So implement copy callback for finer control on the buffer offsets.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 65 +++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index f48eca227fb5..0b285b759409 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1045,16 +1045,71 @@ static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
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
@@ -1117,7 +1172,7 @@ static struct snd_compress_ops q6asm_dai_compress_ops = {
 	.get_caps	= q6asm_dai_compr_get_caps,
 	.get_codec_caps	= q6asm_dai_compr_get_codec_caps,
 	.mmap		= q6asm_dai_compr_mmap,
-	.ack		= q6asm_dai_compr_ack,
+	.copy		= q6asm_compr_copy,
 };
 
 static int q6asm_dai_pcm_new(struct snd_soc_component *component,
-- 
2.21.0

