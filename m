Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E064B217458
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A7801660;
	Tue,  7 Jul 2020 18:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A7801660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594140312;
	bh=imBG1cHNX+gRnIGC7c3yQDexOU8PJAaKiOhfHzsHcVE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwlZch83muEXJ+oo1RtKYS8PwRe0wHf3TXdQmKBkR0wpYsHMlChG7D0RvFqK8ATnm
	 NCLMPWUreq6DxtAFLFjRMFNmZDVvIDGqAOaLLmZwp/x4MUDbaOv8Hw7yuvYkg0MNwX
	 WivzD9jG+LlU5MrZjw/aQycAONMOzCu4NlvMGIuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A932EF80333;
	Tue,  7 Jul 2020 18:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A0BEF802EB; Tue,  7 Jul 2020 18:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 654C2F802A9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 654C2F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xDVqMh7w"
Received: by mail-wm1-x333.google.com with SMTP id g10so2105698wmc.1
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jDd/jOO1T/ruFMoY49CNrft5M2iX6NipaAY3YRHpai8=;
 b=xDVqMh7wZ28YQhZaKhWcGtAfi7MZZjMJbvcuxy1AOlzlxNBkmVAaCsGhsXyUXFRY7t
 G77qZSTKZuxbJQXI6ZyvfJIXpuBrFMfmQON4XpDAx3mzouzKGr54Y6D6F+wf8VR0Tz/j
 e+IkaxFhfYRBeeFcVafRGE6ORD2XJX5mMDz36Jxi7iPS03UCcCP/JgPHlzTQz9r63PAp
 K2eHhcTQcNZsD3r0WqRP7ZM+zOfadYIzvak16nXZnuLz7QV/LPYmtLmJDitirH9lvlrz
 XVuRAgNvArdtM4HqKPoj19mPpKGIM/NgC8bzdgMggQWQCwz4cPsQlZDNRdr0cS6tQT0N
 KaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jDd/jOO1T/ruFMoY49CNrft5M2iX6NipaAY3YRHpai8=;
 b=bln1TPr3tbw9N8EePLHEKH/X9cj/BpiXA0jt+EByyYg/Iob1OsMXF97XIn3CiYTDS5
 JFiMdpQZ8siarS8UV+1X+5Hw2k1bL0FYr0XkTyvcUw2WhObbHMzlsWAJ4PZSS6azn1ld
 wyhRj1V3uwhrDMYgKwonEKVSL3mH2FSZvHuwJoAHGEgzexEEsVbyGgckKASX/Q9dxZr7
 2X0k6tSEUIADqIwrAv9FFf7IBq+RIgAp09RvzcoOKTWYPbchpvL6zJRcspgcjj6FfSjY
 dYclhvMCQ/99ux946Xf8iP9c1ToDF0s/ezc21PZv0kuPQqf14moRWF+MbuTmtrsSoB8H
 77Yw==
X-Gm-Message-State: AOAM5336L7n7vCB1Kz+wbsOWSAXZtg2wUPGp8qz/ACqm3cdwzNA/37Yw
 fMZxgGRvUB9SsLRkxUHd/DOvSw==
X-Google-Smtp-Source: ABdhPJzfGMlbsCGk2jwZpmap5pDTN2+aTLt72kCfLypuTpmGaAsqgBzWzSeuhyB4XzW1LmwZTXZtVg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr4971353wmj.20.1594139820088; 
 Tue, 07 Jul 2020 09:37:00 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 08/11] ASoC: q6asm-dai: add next track metadata support
Date: Tue,  7 Jul 2020 17:36:38 +0100
Message-Id: <20200707163641.17113-9-srinivas.kandagatla@linaro.org>
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

This patch adds support to metadata required to do a gapless playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 8c214436a2c2..c0e1e84267bf 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -71,6 +71,8 @@ struct q6asm_dai_rtd {
 	uint32_t stream_id;
 	uint16_t session_id;
 	enum stream_state state;
+	uint32_t initial_samples_drop;
+	uint32_t trailing_samples_drop;
 };
 
 struct q6asm_dai_data {
@@ -868,6 +870,28 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static int q6asm_dai_compr_set_metadata(struct snd_compr_stream *stream,
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
@@ -984,6 +1008,7 @@ static struct snd_compress_ops q6asm_dai_compress_ops = {
 	.open		= q6asm_dai_compr_open,
 	.free		= q6asm_dai_compr_free,
 	.set_params	= q6asm_dai_compr_set_params,
+	.set_metadata	= q6asm_dai_compr_set_metadata,
 	.pointer	= q6asm_dai_compr_pointer,
 	.trigger	= q6asm_dai_compr_trigger,
 	.get_caps	= q6asm_dai_compr_get_caps,
-- 
2.21.0

