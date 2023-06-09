Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7AF729D8C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:57:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC22E88;
	Fri,  9 Jun 2023 16:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC22E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322667;
	bh=ByPpk4/aj5+fn9NzrIvec6xI/PPQNeYjEwxEGICXnmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RFw2w8heWt6oHJJM2VG/JWTBKrYnE2jCtW6zdUjRvXxae2WsLSuPu3KDBi44TCdeG
	 VE1kHqsMTppR1xuEgcjlb5zyDbU1ySD7C5vDE5aErY6keDqi9DBoxohD2wUmlmihiN
	 6aNxGgCL4DLoMRZNDZ+odEt3dANnvV1fDfL8Rjjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD80F805B2; Fri,  9 Jun 2023 16:56:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F05BF805B2;
	Fri,  9 Jun 2023 16:56:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2199DF80552; Fri,  9 Jun 2023 16:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A69BF80254
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A69BF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aipY2JLl
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f735bfcbbbso14103865e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322546; x=1688914546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDTHAoTD8UW2CusT+8oVB9TCJ1eQ8kR6GrrvgY5ydt0=;
        b=aipY2JLl8aF3VEwqPW5eGQ7DZc1TockTkm3/IVxpaQoBzqgYHuYkPghfaVRvHlNkcQ
         5PAClx7cGJ+wIxWnjs24kNPL0LxWp79O+jjB7O3eOCpE3uzYOwnwH1VO/8TgfeA8ypgY
         ve0PUnfSDnu1PcfZM4I64BeXjzC1xAZhOVOUOG0iwzqhRW52FqmS002ue8BJGpyntOj4
         vG1L6YUx1SN4zWUua5kyuKEkPbSM42kw2udX06h/gt6QM6Q9M7pZO9hWcwG7oT+iUANY
         NpQyIv307wwMxqLo6fUUqglHtHVRlOW0tXcmr0CBFp7kl+X65XLeRfQNBmNXJZWF3Xjq
         tAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322546; x=1688914546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDTHAoTD8UW2CusT+8oVB9TCJ1eQ8kR6GrrvgY5ydt0=;
        b=TmUgSdsfo3Agx1HclhUy+rKP8ySquaaerfT5nB00Eq0NqABZ5TENrtkHCtqNY7rVMs
         0DQxwXMEEbZ9rmDBLoG8bcH9N/3SRRt580EuNKfjw6QHZjhRvlBXLXoVfck/vFQ2LFWv
         1J0Dq5Tem04KZE33D6RPzQNTF4sR2CAVax+wqHLHaaByNuJdHRAnXg0AVRrzyKpOI61c
         ESsd1XrmXZEV+wKnXR22JiVnoK01d/XDy7pkTwvp8qNuMe5XVMCKgj9W9lbt2U3P5NBh
         MY9aB1w71sODBS1jTfdiaxSpmBbg3H8qFKrdwiP4v1LekiRzNZTth0He49+Qq2i6qork
         WT9A==
X-Gm-Message-State: AC+VfDwPo2YGmOOCt35yfCy18t0Gkj9uW9IoxSw9wmeatlKkbt5VIsrB
	PeyEzY/KZUrGgbnNLeAJ9WUwEg==
X-Google-Smtp-Source: 
 ACHHUZ6ZtNL/tW7OcVMfj1SrOwMGTN210HRaFxEhXm8zNWcifVgfdkWsHwmdxU9y8d5IVMVTQqg61Q==
X-Received: by 2002:a05:600c:219a:b0:3f1:9b85:e305 with SMTP id
 e26-20020a05600c219a00b003f19b85e305mr1145537wme.34.1686322546589;
        Fri, 09 Jun 2023 07:55:46 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:55:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v2 10/11] ASoC: q6dsp: q6apm-dai: Add compress set params and
 metadata DAI callbacks
Date: Fri,  9 Jun 2023 15:54:06 +0100
Message-Id: <20230609145407.18774-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3MUPBFW7IRFI7RASZ5O66AEGYUJJSIOB
X-Message-ID-Hash: 3MUPBFW7IRFI7RASZ5O66AEGYUJJSIOB
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MUPBFW7IRFI7RASZ5O66AEGYUJJSIOB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm compress DAI callbacks for setting params and metadata to support
compress offload playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 107 +++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 9543b79ce83d..c67147e5388b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -76,6 +76,8 @@ struct q6apm_dai_rtd {
 	enum stream_state state;
 	struct q6apm_graph *graph;
 	spinlock_t lock;
+	uint32_t initial_samples_drop;
+	uint32_t trailing_samples_drop;
 	bool notify_on_drain;
 };
 
@@ -632,6 +634,109 @@ static int q6apm_dai_compr_ack(struct snd_soc_component *component, struct snd_c
 	return count;
 }
 
+static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
+				      struct snd_compr_stream *stream,
+				      struct snd_compr_params *params)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	struct q6apm_dai_data *pdata;
+	struct audioreach_module_config cfg;
+	struct snd_codec *codec = &params->codec;
+	int dir = stream->direction;
+	int ret;
+
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata)
+		return -EINVAL;
+
+	prtd->periods = runtime->fragments;
+	prtd->pcm_count = runtime->fragment_size;
+	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
+	prtd->bits_per_sample = 16;
+
+	prtd->pos = 0;
+
+	if (prtd->next_track != true) {
+		memcpy(&prtd->codec, codec, sizeof(*codec));
+
+		ret = q6apm_set_real_module_id(component->dev, prtd->graph, codec->id);
+		if (ret)
+			return ret;
+
+		cfg.direction = dir;
+		cfg.sample_rate = codec->sample_rate;
+		cfg.num_channels = 2;
+		cfg.bit_width = prtd->bits_per_sample;
+		cfg.fmt = codec->id;
+		memcpy(&cfg.codec, codec, sizeof(*codec));
+
+		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
+		if (ret < 0)
+			return ret;
+
+		ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
+		if (ret)
+			return ret;
+
+		ret = q6apm_map_memory_regions(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK,
+					       prtd->phys, (prtd->pcm_size / prtd->periods),
+					       prtd->periods);
+		if (ret < 0)
+			return -ENOMEM;
+
+		ret = q6apm_graph_prepare(prtd->graph);
+		if (ret)
+			return ret;
+
+		ret = q6apm_graph_start(prtd->graph);
+		if (ret)
+			return ret;
+
+	} else {
+		cfg.direction = dir;
+		cfg.sample_rate = codec->sample_rate;
+		cfg.num_channels = 2;
+		cfg.bit_width = prtd->bits_per_sample;
+		cfg.fmt = codec->id;
+		memcpy(&cfg.codec, codec, sizeof(*codec));
+
+		ret = audioreach_compr_set_param(prtd->graph,  &cfg);
+		if (ret < 0)
+			return ret;
+	}
+	prtd->state = Q6APM_STREAM_RUNNING;
+
+	return 0;
+}
+
+static int q6apm_dai_compr_set_metadata(struct snd_soc_component *component,
+					struct snd_compr_stream *stream,
+					struct snd_compr_metadata *metadata)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	int ret = 0;
+
+	switch (metadata->key) {
+	case SNDRV_COMPRESS_ENCODER_PADDING:
+		prtd->trailing_samples_drop = metadata->value[0];
+		q6apm_remove_trailing_silence(component->dev, prtd->graph,
+					      prtd->trailing_samples_drop);
+		break;
+	case SNDRV_COMPRESS_ENCODER_DELAY:
+		prtd->initial_samples_drop = metadata->value[0];
+		q6apm_remove_initial_silence(component->dev, prtd->graph,
+					     prtd->initial_samples_drop);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.open		= q6apm_dai_compr_open,
 	.free		= q6apm_dai_compr_free,
@@ -640,6 +745,8 @@ static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.pointer	= q6apm_dai_compr_pointer,
 	.trigger	= q6apm_dai_compr_trigger,
 	.ack		= q6apm_dai_compr_ack,
+	.set_params	= q6apm_dai_compr_set_params,
+	.set_metadata	= q6apm_dai_compr_set_metadata,
 };
 
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
-- 
2.21.0

