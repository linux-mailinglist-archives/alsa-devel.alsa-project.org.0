Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E801922E957
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9519B1683;
	Mon, 27 Jul 2020 11:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9519B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595842985;
	bh=lb2TUk/DiRspgPf6GzFlrWoTpgxIoYRrRM9bNeiu3t0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DsbWzdFOYncEidqHCWcTxPVt1b/LITDdqgW+ojRAjIpli1a0COV5Y8TFWQdLOIYAB
	 ozqFaOJwtbQZt84J+zefi/dyVO5jTTQ5QEBQrkIvtjAeM35x/HVRY7WN910ABjfFG+
	 TzyJyWVAZvQeQD5InY/y9W0oSH0jHwnP6UNkIUiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D998EF802EB;
	Mon, 27 Jul 2020 11:38:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEE58F802DB; Mon, 27 Jul 2020 11:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C136F8029B
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C136F8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DNKtH2g1"
Received: by mail-wr1-x441.google.com with SMTP id a15so14150396wrh.10
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=meC3a0XMpAMCvTskSaE7QuXxyexgyd30xROgIhSgThI=;
 b=DNKtH2g18mJYE1u0xN+/OtwLdcKmahBm9SuH8kQ8ltOh+kDu/iF/2zyUVtLawUgRLJ
 XIsz1RhiIkcRi6I6M9biuxcsUhDESmb+oA+kmIks6o0yxhYiOSo21NWqa+s2cTmNOZcV
 9BU7Kx0RkS6vnesCtTts2vNVK185edqeJ8dk8T0AAV5H3a0omh8meJF6cyxMA9R9xT0n
 1aSoKFB99ufrnNBnr++A0N5xNspTp3BDEmcJtxeGVZoFsC1L+9JDob5CStsbU31bA0YH
 FSedbIBTZHDu6UTzSFvL4fa//SQu7NdnnrMZzoM/jitPlQkog0w2V4+Z3hBwOOneLPrH
 /idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=meC3a0XMpAMCvTskSaE7QuXxyexgyd30xROgIhSgThI=;
 b=tVjc+zf5m1Z+va5ocAC7r58W7awhYzn7FKWTzUnbxH0G4Tfvn6hOXG7ehJ7I9SQbqz
 jB5gBnimewUCIlsTcSpXdQSX6sBcKirw3XYGd5Q2aTkQqFdOEe30HzKVo7lJKiHrHOzi
 VrtkZrZDZlzD71vlej6/ObZA3Gd/CtoHWQhjtRoUh/sV3sF485E1AcvkVAIbxs1pT7cu
 uu6pxKMu7392e3OCvXCgWYjhoIxNuQ5apuiAPLO1aFl6hGx8sTREniSvfwE854hgnDtr
 21pxrr7Now9gn3H1GsAH2f8o1/lz55NFWwNWd9wXewyog1R7XsRw7uLANB4ibXBNQ/QL
 lOEA==
X-Gm-Message-State: AOAM530SldYWK8zicQvQrKnoDfQmXE/FkDymzDV8CnU7BHfWeJqWYoc6
 WeV3QSNrBhLEORwU7K1bpgOyng==
X-Google-Smtp-Source: ABdhPJyq0mHzjPsa4xocEL27Qs9vKdQBHRKmGqlsIlTmA8ty/1rjygg6XNsxdiUBeAoaLQ9EYmuklQ==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr14301158wrs.273.1595842702847; 
 Mon, 27 Jul 2020 02:38:22 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 07/10] ASoC: q6asm-dai: add next track metadata support
Date: Mon, 27 Jul 2020 10:38:03 +0100
Message-Id: <20200727093806.17089-8-srinivas.kandagatla@linaro.org>
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

This patch adds support to metadata required to do a gapless playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4652c78d57c5..a7fe4147c0a2 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -70,6 +70,8 @@ struct q6asm_dai_rtd {
 	uint32_t stream_id;
 	uint16_t session_id;
 	enum stream_state state;
+	uint32_t initial_samples_drop;
+	uint32_t trailing_samples_drop;
 };
 
 struct q6asm_dai_data {
@@ -868,6 +870,29 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,
+					struct snd_compr_stream *stream,
+					struct snd_compr_metadata *metadata)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	int ret = 0;
+
+	switch (metadata->key) {
+	case SNDRV_COMPRESS_ENCODER_PADDING:
+		prtd->trailing_samples_drop = metadata->value[0];
+		break;
+	case SNDRV_COMPRESS_ENCODER_DELAY:
+		prtd->initial_samples_drop = metadata->value[0];
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
 				   struct snd_compr_stream *stream, int cmd)
 {
@@ -984,6 +1009,7 @@ static struct snd_compress_ops q6asm_dai_compress_ops = {
 	.open		= q6asm_dai_compr_open,
 	.free		= q6asm_dai_compr_free,
 	.set_params	= q6asm_dai_compr_set_params,
+	.set_metadata	= q6asm_dai_compr_set_metadata,
 	.pointer	= q6asm_dai_compr_pointer,
 	.trigger	= q6asm_dai_compr_trigger,
 	.get_caps	= q6asm_dai_compr_get_caps,
-- 
2.21.0

