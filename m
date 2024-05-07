Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54E8BDFCA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 12:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7DC320E;
	Tue,  7 May 2024 12:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7DC320E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715077917;
	bh=61rdmjNwJzA0Rtp3TjaO5PN4giA8+BNLRSAlZB30sVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q4ttoExpkUYbDSYut6pLgGm/TbGeEkGc3ngJxB/i0IF3lHACj9ArNSJHJ8rCMTsKV
	 uJ+IfzrgAhuMXG9aNATToJnlHgRFKcoutDX019h1lwHZ9Dp28goY/FaNQv5pJfsryV
	 Qk2AlIWvHaqEnqAuRVZytdtAEPQbIpZYNqqyDbjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC067F80601; Tue,  7 May 2024 12:30:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58AF9F80607;
	Tue,  7 May 2024 12:30:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8AC2F80423; Tue,  7 May 2024 12:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A208DF804E7
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 12:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A208DF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xkE2hmai
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59b81d087aso618097666b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715077667; x=1715682467;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fudiQRTJbxGJqty5CRk/uevh8tsrjGRaaIqrnS9XFA8=;
        b=xkE2hmaiMDrmhy277zq3blNnpmfG6+XvplJvZMqF+lLwioDfO/wmznwSj+RdhrAvd5
         hfd2BmoDKxjap/zeuR/xsD6UcQyRLz00OBpkV9KQkHwODQX3pAzbZWPrO8b5Hfj2gHB3
         b+kItj1ncOX0RYZE8sYWaLdogLkAilTyes28+AzejuGRdho/kfuY6HQaWfWJqWRpYisa
         5DfQVdtUOQCuJt1z4cmgPvxqSSXayZSJ85L61eYE4Ha/r5RE8WxxZp8bQO/x4Ia/4wML
         i5PHyirDBQkxn/RSvM3jK4y7WQ4QldO8axT5SiXS3X7LKnG/MKGN1J+2yXcxxsjW/uHm
         zymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715077667; x=1715682467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fudiQRTJbxGJqty5CRk/uevh8tsrjGRaaIqrnS9XFA8=;
        b=A10TEPucW8CHyshaxmJAntTT3j6mWlLZoI8pD5efx3ZwRhGrLTTtSsU8MVBsEYqcQr
         KnRJ3lOR78wq8ytFdEHN/vnzy5Qjoc4LC4MrBaXYLgSAUCUo+ornSQBncXX4D0A2RHJx
         jekJ+EeLIg+saSDydeLe5OYJQZMxOm4rMWIM92tB6sQJxs8uyDsssoe4ZliSCPOC4Lo9
         4Es/MHbur8UZKT4HAywddfAobbZx1gJLQTwnf773IUgVCDPIVVOQMp2AHjwz6x/VLEaP
         ZW8EeIxfAhPDT5K8fRYuXDifzyAzU16sKm/C7CybMEwjoxhOXDo6H2iWZEVvaHc3V4sq
         S1/g==
X-Gm-Message-State: AOJu0YwbWOnoMUvE5o87NMsEK4ng8QNE8di+rRNxUwbAUHw1J4FKQAFt
	v5q+nB8bksQes96Eo1tGF0MzlJKAtvoqDvs8RVlumB1BMmMGxDNapPeVcz2RRxc=
X-Google-Smtp-Source: 
 AGHT+IHeOlkBiIXj8Ch31jd6t9X4LVA9p4Vu0ILX858d59ZVwRVIRHE6OkXJlDTMC2ytyTIzzPodsw==
X-Received: by 2002:a17:907:968a:b0:a59:d39a:8d6b with SMTP id
 hd10-20020a170907968a00b00a59d39a8d6bmr5605681ejc.43.1715077667462;
        Tue, 07 May 2024 03:27:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 bo15-20020a170906d04f00b00a59b87dd0bbsm3370093ejb.161.2024.05.07.03.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:27:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 07 May 2024 12:27:32 +0200
Subject: [PATCH 3/4] ASoC: qcom: q6dsp: Set channel mapping instead of
 fixed defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-3-b12c13e0a55d@linaro.org>
References: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
In-Reply-To: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=61rdmjNwJzA0Rtp3TjaO5PN4giA8+BNLRSAlZB30sVw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOgIbJbQul/L/8gMPvUdCdFm1n2BLVDa2rGuTT
 vd895AN+lyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjoCGwAKCRDBN2bmhouD
 1xuFD/4j2Tg7l1A0ljCHS9wL5fFYDjnOz06WS1T18RBCRlyN4NQ/j474jqc2h/FBN0Zlo+v3Ovl
 J7qzwq7HL5C4l+Zan5FRXXcAujOhPK4USRvN4uZFKEyNz8LLKEx+Rk2XACNcZYDO8NQie2+IqVf
 IvE0prnkEjVOTrqmGWzbUV7Yrw5jzR9fmGG0iTYcLhsdmpC3GX+iKqiMZPy+lsc77EKJfe6ajpw
 kad/dTTUbHuWNyfygNAwZ4fmq0gZ3+VihnTIhcxDvli84fEr2reiZfzjtIo0oIWLqE9AO4mFoMI
 svJiGg5z0l64QhSnN4AWf3euEdUat7oViLkMpY06lrENrr/Vg4gIqTGRr7tnkOueOt/wGFoHXUG
 wIa65wXzRNA1TpNPaB6Fox6Pig6ImS8qbvPsBdigarlh49d42NKlPGTFHmNbtqnUTyoKfiz1yP6
 pMB5UD2vF7SvKSsHImW7dHuXdVYGKkbRnimEi0pcGrCoG1VQEGqrYaTbuxs+Y/0YvObF3bk1Sx+
 90pYsJ8rX+RxNRs2LyfuC6jxIrzxvrWkSjkmt+Lo7Nl/dIH3ChQ013kmKXfYIxk9zRF9Gmow8/O
 rnHDyhpunMW9tGqAfJx+VOOVD4sopCh7ZCGOQnbwwJJQuypXuZlFsitiyFkTZ/h4jQZLlerg99v
 fK+FD8dkPIwZB/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 4MOQJY3WXRVENMVCV5EQDX5OYUYBOO6E
X-Message-ID-Hash: 4MOQJY3WXRVENMVCV5EQDX5OYUYBOO6E
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MOQJY3WXRVENMVCV5EQDX5OYUYBOO6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use previously set channel mapping instead of defaults when preparing
frontent Q6APM component.  This allows machine sound card drivers to
override channel mappings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 14 +++++---------
 sound/soc/qcom/qdsp6/audioreach.h |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 12 ++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      |  2 +-
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 8175678d8843..83b33e4c9de2 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -267,7 +267,7 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
-void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
+void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
@@ -884,8 +884,8 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
 		mp3_cfg->num_channels = mcfg->num_channels;
 
-		audioreach_set_channel_mapping(mp3_cfg->channel_mapping,
-					       mcfg->num_channels);
+		audioreach_set_default_channel_mapping(mp3_cfg->channel_mapping,
+						       mcfg->num_channels);
 		break;
 	case SND_AUDIOCODEC_AAC:
 		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
@@ -1104,9 +1104,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->num_channels = mcfg->num_channels;
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
-
-	audioreach_set_channel_mapping(media_cfg->channel_mapping,
-				       num_channels);
+	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -1163,9 +1161,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->q_factor = mcfg->bit_width - 1;
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
-
-		audioreach_set_channel_mapping(cfg->channel_mapping,
-					       num_channels);
+		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc) {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index cef9a9015dcc..6ae95eb85118 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -767,7 +767,7 @@ struct audioreach_module_config {
 /* Packet Allocation routines */
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
 				    token);
-void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
+void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..5dfbd011bb97 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
+#include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <linux/spinlock.h>
 #include <sound/pcm.h>
@@ -223,7 +224,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	struct q6apm *apm = prtd->graph->apm;
 	struct audioreach_module_config cfg;
 	struct device *dev = component->dev;
 	struct q6apm_dai_data *pdata;
@@ -238,9 +242,17 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
+	if (cpu_dai->id >= ARRAY_SIZE(apm->dai_config)) {
+		dev_err(dev, "Unsupported DAI ID number %d (%s)\n",
+			cpu_dai->id, cpu_dai->name);
+		return -EINVAL;
+	}
+
 	cfg.direction = substream->stream;
 	cfg.sample_rate = runtime->rate;
 	cfg.num_channels = runtime->channels;
+	memcpy(cfg.channel_map, apm->dai_config[cpu_dai->id].channel_map,
+	       runtime->channels);
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index c29a2dd36992..f6fa15f42633 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -758,7 +758,7 @@ static int apm_probe(gpr_device_t *gdev)
 	apm->dev = dev;
 	apm->gdev = gdev;
 	for (i = 0; i < ARRAY_SIZE(apm->dai_config); i++)
-		audioreach_set_channel_mapping(apm->dai_config[i].channel_map, 4);
+		audioreach_set_default_channel_mapping(apm->dai_config[i].channel_map, 4);
 	init_waitqueue_head(&apm->wait);
 
 	INIT_LIST_HEAD(&apm->widget_list);

-- 
2.43.0

