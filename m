Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE8228694
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 19:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF7E1673;
	Tue, 21 Jul 2020 18:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF7E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350817;
	bh=JLCL/N90X9hWB1UTPFMinm67/VDoyquCZwQMSrQ1w1A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDUusEd70/O7wPPS+ZG/EnM3iiVE7NkgkS86q5AGbp2n0aRxw3oS3wdKAnr1nXfo+
	 lszHB2v88rIKBYQwqQcKR7V7HoSCYVX4EN0rILCQj6sjdP+HuIzpb7bGX6aLv7Grr0
	 VCVzuuWvxw4NqA9P1NJiWsEdB8sf2+OZaAcIsibE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A370F80316;
	Tue, 21 Jul 2020 18:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47304F802EC; Tue, 21 Jul 2020 18:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6843F80274
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6843F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LcdyzJ1L"
Received: by mail-wm1-x330.google.com with SMTP id c80so3525804wme.0
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VmuP26pFXhq32+z5mcBmskWxvyaip5dpiXSHlITuiYI=;
 b=LcdyzJ1L9NT7IlmRky2XGOi2dgCFGrHMpH9KW3K0KDnm9PRj9VQy05ZL/O1QsS621d
 qBffdUU1ScWZ4v1PuOw+0KJfXsvDnbuqmzB4ueaSGEEOJQfY7hdgB4eF8/1s7j56IBTZ
 mKUq3unYHA0D4FBQ4B0fp+K8W2rpfcaU6f7Ac3bD3WBW/FuxDaESlvDdZA95MmxQWF0v
 RVKVjvl1EOtfxBBo5fAsnWy8EueV2i+KigQBiuPn4U0qXRHVzbAHDGzIhCOZu2p+OaQl
 RQ7DzP6g7rTmMFGbEg2eRRuYLy2rWXHHoaFS5vyP1RHvY1ZWmpxpqQ9fb2/PM+UpQjs9
 yXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VmuP26pFXhq32+z5mcBmskWxvyaip5dpiXSHlITuiYI=;
 b=gCFB9Tb5zaawkVL+KXBi/ID4AOte9LER8dX7ZtY7s+Zsq0XcLUg+8PWJbE8fkTO3aO
 HGeS0XFYB0IeWJ/PgZ7wIU9/HEz/1hr080FoaKAREkowmjFAxEaPZz6thKtrZSMJw4An
 adR7DVcWM7eaf2U8262GTSrxyVy3PxXQ8B4z1dZTgbrfpg01QOX18Uqe6s2OwnMcEhs6
 JF70+bEUBSWU9daOT3lim9fo0lfdcfkOZu62wsmvht3aWBtlUEjEQ9qHrzUZx3e8HJSm
 Ps6skS0MnXYhIEZfNeuFNzcK7k7qgmj2/MVabl7QgTBRPi/9zafBze8k1ZvQipZ/C+zJ
 tcMQ==
X-Gm-Message-State: AOAM5323f4kR5F1UGfL8GAjMTV4t7HURIvI3hDK65jTDZt/wMZrFyLI6
 R2l9mVU8k4rrBOIzApCKXWxz1A==
X-Google-Smtp-Source: ABdhPJy1BZSc/XQ0qyoKoKoKDVWcSK8KAWiqlSbx6Vi2eEAQs2S9ZN6lynnWU9MMZ6w8cilLW1ffvQ==
X-Received: by 2002:a1c:3dc3:: with SMTP id k186mr5147693wma.66.1595350411794; 
 Tue, 21 Jul 2020 09:53:31 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c25sm4058648wml.18.2020.07.21.09.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:53:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 7/9] ASoC: q6asm-dai: add next track metadata support
Date: Tue, 21 Jul 2020 17:53:04 +0100
Message-Id: <20200721165306.29082-8-srinivas.kandagatla@linaro.org>
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

This patch adds support to metadata required to do a gapless playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index a493350c8cc2..c4b4684b7824 100644
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
@@ -869,6 +871,28 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
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
@@ -985,6 +1009,7 @@ static struct snd_compress_ops q6asm_dai_compress_ops = {
 	.open		= q6asm_dai_compr_open,
 	.free		= q6asm_dai_compr_free,
 	.set_params	= q6asm_dai_compr_set_params,
+	.set_metadata	= q6asm_dai_compr_set_metadata,
 	.pointer	= q6asm_dai_compr_pointer,
 	.trigger	= q6asm_dai_compr_trigger,
 	.get_caps	= q6asm_dai_compr_get_caps,
-- 
2.21.0

