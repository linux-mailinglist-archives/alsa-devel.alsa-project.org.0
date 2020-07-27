Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10B22E963
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:45:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAFB5169B;
	Mon, 27 Jul 2020 11:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAFB5169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595843158;
	bh=do+ymEc6x7jNBfb2HyiVf9db82PWdPx0NKSvCx/pTNI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MV/VFXArGxAj//2C0/lvFoZeWGOydAimHEbiTzPaCn7W30Gmh2HmB8gAvB1wwFQUa
	 2xwbya1Gb1nOucieZH6twrAGEEnwbGwRz8U4cfSY0QaYOrgT8KBM3ukDOs81g76ard
	 RVYzKWX21+suCjMRw7o4Id6xzUZ5yIztg+iuBOBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E83FF80335;
	Mon, 27 Jul 2020 11:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC2B3F802FE; Mon, 27 Jul 2020 11:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DD43F802DB
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DD43F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Vw6yarDL"
Received: by mail-wm1-x344.google.com with SMTP id c80so13522717wme.0
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4g6JTg8tTLO2020Bjhn7eVLu84pNN3Ez/f+4ZOHp8Mw=;
 b=Vw6yarDLp7xE5sbxpiPl8n3EAmtDzjFJyzaxBiABIvnzdUP3KkAKxeSlW3W6SbgrD/
 T8G7ahhsdn4L46scDkPbfQNIgJNSP6CaS0LYZulaFbUhXCCYczSPNesaE0p/7s6JkX2S
 jN/wwL3RZHOsvs8MGt+5PES+T28h68H+FWZhvCnKJzWCpZ44CyL45Xq/dsNreXeeUzfb
 dna9uutJEsLRCEUHj0zu6x2o+XlnH/TelUuUpPM0755es32CmTyoidh+tmanI99WuYKS
 HM1S7BM4gG2jA8PU+Z8LzAPJIIbofzSB3eJRSuAPnVjUHwOPlC3xpJvHJAhUwe5R9FOA
 FXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4g6JTg8tTLO2020Bjhn7eVLu84pNN3Ez/f+4ZOHp8Mw=;
 b=rTKuvdQ/ucuRW7Rw0YQrFftoSWcUkkIxcGXyaKIh1JvGvAOBr2sS8mlCL1EOy9AGlz
 GOy5tiZ2A7z5SjMt9dnTB9eBZppR2niwHeCyfpCL3pVCpa48LfKzFFqbEpJaAJqsVnAd
 tufsSnrupeuQB+gyi0mnumj+d6Pg9CMt/frwLHaX8vxUGDTgdlf7S8RL8BSFZDYCsI7w
 moX//20IR8wIo2mBdwDuoaKIhyEm5H/oCtjM1LylrBxt4ZseH+70Acvo2HtGjGX0T3uJ
 v1zBCsV5L3Mv4yndp2nEVZZWKKPBcIA60z+aw7f+F4DGGL+98QuiAhFxLZxkNATfaspo
 cVXw==
X-Gm-Message-State: AOAM530BFqkmu5Mv9OR5Fnkglt1vDXMrqu4DVsJp1IlM99ucODEtspqf
 JistYvxHKB16Sf4RyKoDkq5HLA==
X-Google-Smtp-Source: ABdhPJwBe0He/oPMtUrF31nAwEubsSn+/sRTYsIOCKuy3A0IoW5Yzj6VbAPKKsNGEWXBQ4/mz68dtQ==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr18737295wmb.47.1595842706597; 
 Mon, 27 Jul 2020 02:38:26 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 10/10] ASoC: q6asm-dai: add support to copy callback
Date: Mon, 27 Jul 2020 10:38:06 +0100
Message-Id: <20200727093806.17089-11-srinivas.kandagatla@linaro.org>
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

During gapless playback, its possible for previous track to
end at unaligned boundary, starting next track on the same
boundary can lead to unaligned address exception in dsp.

So implement copy callback for finer control on the buffer offsets.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 65 +++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4ecf9cb658ae..648a64e11188 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1055,16 +1055,71 @@ static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
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
@@ -1127,7 +1182,7 @@ static struct snd_compress_ops q6asm_dai_compress_ops = {
 	.get_caps	= q6asm_dai_compr_get_caps,
 	.get_codec_caps	= q6asm_dai_compr_get_codec_caps,
 	.mmap		= q6asm_dai_compr_mmap,
-	.ack		= q6asm_dai_compr_ack,
+	.copy		= q6asm_compr_copy,
 };
 
 static int q6asm_dai_pcm_new(struct snd_soc_component *component,
-- 
2.21.0

