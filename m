Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22ED7351E1
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D2086F;
	Mon, 19 Jun 2023 12:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D2086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687170038;
	bh=ZYqGQdzbwH5O8sSWHntgNb4HLTgGhf/AzpNUHu+2nlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+TvwE61GDDPTnVFMc/6szq3+lwJZWNfl1EkeTX/3o6MeAlz5f8Stwsuzrrxza1v4
	 vB1UDUn8qOa0q9+JpwYlRm8hg3dOsx/EN6s+2Lf+FPa8FpgzGwyPiOsys5aAqwvgR9
	 jx8MpjWUm7cruOXTkz9fY+dFTmt1Mbn7ySzMew7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1F22F805E1; Mon, 19 Jun 2023 12:17:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 988DEF805D6;
	Mon, 19 Jun 2023 12:17:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FBF9F8057D; Mon, 19 Jun 2023 12:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E81B0F80567
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E81B0F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wy9CQ5VT
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f97e08b012so12228095e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169828; x=1689761828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jmFbS7HPXuVPo+Ttg6W++jAmeGcDWis3QnGP8fIhMU=;
        b=wy9CQ5VTjjJKyhnudYc6Tzx0GC4cGmsexR7mqUP65SLBywiqJeqPlYkCZKqkRYGmGj
         0euK9Yci70dqdesZoqJLE7SugOZ8j+XtrLvOckhbq+9HDgCnzD8gIgpaj3b6QaDG1LOl
         rZE7jRUXsNsaSyip7hcbTs28iOcLP2MHCQwCXhZdI4WbvJOAWX9kpb6/q4r/mHQwCj4G
         4Piq+qWW9ZFQT8bgNPIUxPLBbmBsCviWql/+64tHy6PcmD36aEOBESy8qK168mbm6eEM
         Lq+ofnZA+GveTZ2EyLonzWe2QvWPFYzMNey/tDyzjpioMu+8Lyst9HYnyMiSLhZlGCBL
         w1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169828; x=1689761828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jmFbS7HPXuVPo+Ttg6W++jAmeGcDWis3QnGP8fIhMU=;
        b=S1X1JoP1iOGu63fNFg0fgkIFQQQCOxt3zWUppruQQi5+ieKOSCk5htiI3d3CkDq+YF
         uL6iUIhRpnF37WkJIgFHSI9b0O78Flavp1MblfUdsuu9qxjo0EBABD5UcGjQRTq0STRC
         K1liy8/glV4vd9KxN0l8R7gBcXfAODW0Hiw6qU8kbMh3kYzEhbxalw+VelqVn6SFgi+g
         2vUmoOF+ElRUPJ0ZDGRS1s8yuTFBuA2KdMGblReRwXL2EWa0SDd1Hj4Y5LVyc94TFcwW
         imCYNjBdtnPf7oLjNDA4ncbl+eofY6/cfE55yjQskiJLxJN2rDdJB3o2wYg8k1KjcPGN
         +ypg==
X-Gm-Message-State: AC+VfDwxPPjVh5yJ7t/MYCJzTdclow8ubwQhu8g8i5zh1ZTXZgkcIJvr
	Pmg/yABAOrspxy65ReSkh2KNcw==
X-Google-Smtp-Source: 
 ACHHUZ79GAF/rMepsxEO8EbbcqC5rfSTBEWArAY5CuoL4lXM+FTQV0Ep868fL2F2hoL5TNbq1ev8/g==
X-Received: by 2002:a5d:595a:0:b0:311:1a91:cdac with SMTP id
 e26-20020a5d595a000000b003111a91cdacmr7112812wri.57.1687169827878;
        Mon, 19 Jun 2023 03:17:07 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:17:07 -0700 (PDT)
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
Subject: [PATCH v3 10/11] ASoC: q6dsp: q6apm-dai: Add compress set params and
 metadata DAI callbacks
Date: Mon, 19 Jun 2023 11:16:52 +0100
Message-Id: <20230619101653.9750-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KS5GT2G4JQK3FWAXWWZO2IGKNDA5DK72
X-Message-ID-Hash: KS5GT2G4JQK3FWAXWWZO2IGKNDA5DK72
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KS5GT2G4JQK3FWAXWWZO2IGKNDA5DK72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm compress DAI callbacks for setting params and metadata to support
compress offload playback.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

