Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6362286C0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 19:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E55B1670;
	Tue, 21 Jul 2020 19:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E55B1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595351059;
	bh=zsagIlIanPFpEyOP9rYo3Qxro3m7Vong3MGwGyVKzbg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQuu6PTJFvEaYj/XTM0rnm1jy//My7FwtyYI2fiSC2YtRbyFlY7rRFFd9VcIjhBSA
	 Rj8hb9PbeJRFLR0PnrXqVdc0Fv/dzuUAYgLRmdDvT2cyXYGUuDmxukW9alRgMWjVYm
	 +MJyPpo5RVACX4hqDmMQ2BqKFS3qic4bWh/O1OK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D078F802EA;
	Tue, 21 Jul 2020 19:00:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA87F800CE; Tue, 21 Jul 2020 19:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5FF4F800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 19:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5FF4F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nmH+p02U"
Received: by mail-wr1-x442.google.com with SMTP id o11so21903760wrv.9
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAD/7xPPoJF64yaCntuggxRA+ZJ8WHNmGopHS69UMKw=;
 b=nmH+p02UiIUVCenN/Sk7WaDAvRMuPBMbiWgg0viEISI8LAsuH4XSELcKuXFlo4E1jG
 3Ba38x4iQ1l2M+mHUXYoEFuvl6hUqCKceiKb6umj+bXwai6455HJcrCifX4F4L5xSvla
 hOQNlYvdTlE2zqU9p/kqPaBWD1XdHWZ5ivnmwrtNADm45lM4oGP0a95FGH4F/jJ3/dkx
 Znz1H27E1mv6SMM699FO6lQE7Syy2Gm+8DY5uhpQMZgHO8JPx1PX2jVOXnezZWbnolce
 sLsgyiEM6QNFvsMv3D+wimiCt+M4b2lpsMeGNaErObzykdrflmIRoYl21sKkKvpvDAVW
 M8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAD/7xPPoJF64yaCntuggxRA+ZJ8WHNmGopHS69UMKw=;
 b=eVwmr8TGlD5Slow4SBKeeGTJFdWyPE00jB0Pr85/fgjB8IoDAnI7EnbRy6GNlpDVY9
 xhCnWJ+P7W3/TDod1xqH/4DQna4lmWJabKlwAsmNN+CEMQc2l7wslR+2pAafeTGF9OzF
 ObIwohj7rGoiVwwdwbXP1igNlXrAkseax8ncRTioICGL/xZ1u0fkiMZyBXVdi0Kno7KS
 3RKCClDq+hxwEExijOcRyFZ3W2jKP3cMPJqLC0gH6SZpEyaZb/s/sZTKZEM+IW6LvGvN
 fF+jyCbwEa6el7ST+EULd2hTYL6sMAKGty48KyCvf9I4jzV/n8i57AXyvI8rr4Nvb71C
 61ew==
X-Gm-Message-State: AOAM533SuLTO8UWG1KwiQLP3nDrYzTg/HeiS2rnqTjNl0FsDdnMeItoZ
 6pZrEJn5WiPlSg9p2JzTh9hBbQ==
X-Google-Smtp-Source: ABdhPJycW1Xaq3CU8qG7QJBKBhsJckOLmd/4VRs8/GBxAiRAaiByjeY3LRfYRQRK2YrDLo6uukpb1Q==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr27509083wrn.52.1595350820384; 
 Tue, 21 Jul 2020 10:00:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id h11sm15526327wrb.68.2020.07.21.10.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:00:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH v2 6/6] ASoC: q6asm-dai: add support to set_codec_params
Date: Tue, 21 Jul 2020 18:00:07 +0100
Message-Id: <20200721170007.4554-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
References: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
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

Make use of new set_codec_params callback to allow decoder switching
during gapless playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b5c719682919..a8cfb1996614 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -876,6 +876,37 @@ static int __q6asm_dai_compr_set_codec_params(struct snd_soc_component *componen
 	return 0;
 }
 
+static int q6asm_dai_compr_set_codec_params(struct snd_soc_component *component,
+					    struct snd_compr_stream *stream,
+					    struct snd_codec *codec)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	int ret;
+
+	ret = q6asm_open_write(prtd->audio_client, prtd->next_track_stream_id,
+			       codec->id, codec->profile, prtd->bits_per_sample,
+			       true);
+	if (ret < 0) {
+		pr_err("q6asm_open_write failed\n");
+		return ret;
+	}
+
+	ret = __q6asm_dai_compr_set_codec_params(component, stream, codec,
+						 prtd->next_track_stream_id);
+	if (ret < 0) {
+		pr_err("q6asm_open_write failed\n");
+		return ret;
+	}
+
+	ret = q6asm_stream_remove_initial_silence(prtd->audio_client,
+						   prtd->next_track_stream_id,
+						   prtd->initial_samples_drop);
+	prtd->next_track_stream_id = 0;
+
+	return ret;
+}
+
 static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 				      struct snd_compr_stream *stream,
 				      struct snd_compr_params *params)
@@ -1144,6 +1175,7 @@ static int q6asm_dai_compr_get_caps(struct snd_soc_component *component,
 	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
 	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
 	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
+	caps->flags = SND_COMPR_CAP_FLAGS_DSP_CAN_SWITCH_DECODER;
 	caps->num_codecs = 5;
 	caps->codecs[0] = SND_AUDIOCODEC_MP3;
 	caps->codecs[1] = SND_AUDIOCODEC_FLAC;
@@ -1173,6 +1205,7 @@ static struct snd_compress_ops q6asm_dai_compress_ops = {
 	.open		= q6asm_dai_compr_open,
 	.free		= q6asm_dai_compr_free,
 	.set_params	= q6asm_dai_compr_set_params,
+	.set_codec_params = q6asm_dai_compr_set_codec_params,
 	.set_metadata	= q6asm_dai_compr_set_metadata,
 	.pointer	= q6asm_dai_compr_pointer,
 	.trigger	= q6asm_dai_compr_trigger,
-- 
2.21.0

