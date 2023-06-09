Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F950729D86
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:57:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFED6E95;
	Fri,  9 Jun 2023 16:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFED6E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322631;
	bh=hi1AeZ0GCnk6o+EYVqxBTte1jHjOGOhIQob033Gi2Hg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ecn/14DjuuIwvRZdTnN1eNGELmvXdgwP24/0ewD8JnEms9maLcSxe0/iNZbH9NQXw
	 aP+Id8EgKGvWL5gt9qRACtKVCGs5Z+RF4jE5avjQZHvLyDEX07ig9GhKwljSkoAmWl
	 iGaA3vMsKX4KWVFGuR5TGSK/qMntOLIdGNQ0KVAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04AE0F80587; Fri,  9 Jun 2023 16:55:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C05F80571;
	Fri,  9 Jun 2023 16:55:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE31F80199; Fri,  9 Jun 2023 16:55:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4425F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4425F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KnoVAq2J
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6e4554453so14805575e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322544; x=1688914544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUxfLsYF7Nu3sb5ZtsLU4AYKkp6avkU3Rrr4hZloVjM=;
        b=KnoVAq2JS0/z/FdaxeliMNHC4v2r82hPnhb+Gc2gxUqkf5M9awco3trP/l+Rzv2MKg
         /FOM8Ac1YOMdHW2KzNz96/Ib6O1cYWzX5+bZ9a7kyP4UkouW13NLZTrws/bE6qHpSW8b
         oF39Xrc1KzCgTYViz7IMbsB7nX7fgSZuN2c8NlJiRaTYQNcABFKmCffiZfdme7b7wYWO
         ZFpBpLnLpgPfwdaihVZa2+53iTENjJhzigSmpNdmlfbeK6yhPawfkNzxmeS0xvmzs9QW
         lQswvR26gLD3nj5O9xDHEnq6j1y4uscbqnC9P4rjrSUcogb4pbEdp8g/unrWv0sO3nXW
         b/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322544; x=1688914544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUxfLsYF7Nu3sb5ZtsLU4AYKkp6avkU3Rrr4hZloVjM=;
        b=TiuEm2Kz4o3H8WhwffVW6SCK3+4aY9SDoPt1k1FkJb02dPjsDn7bYAElQGIdOtQmGi
         dJdh5z997Jm8niWPAcoGntQyfFQUwnbXedmHHfjR5c6Qt1z1kJSGat6576OgzabSOe96
         2kxM6QiofvVSCNJwvgelSRO1s7jDqkQDLbE1lS2frA018vR5uVyN1shzFrmgqCseGbEG
         mq+GBfYryRLS33mtLv/aadWygazKGfQkIg0BL+IW0iry2F6+pmISUOGHCbDeD0YRif5t
         5RWFQtXF/QzoZXzQFoe3kpm9CDEXPDd4kBiXjsVPsl2P9eDz5HfohXBflpakPhaWEyvV
         aumQ==
X-Gm-Message-State: AC+VfDzCYL4sQRaJqkHs+E7cC3P3RyJZDRwzan/mMZ3AFeRG5lKcVvZR
	XBNj6ZqT7D9WIgIxx7xosjHRoA==
X-Google-Smtp-Source: 
 ACHHUZ6Dvm6xYWLAMBQdbRthwd09flGv8K/+0G+/L3BhiMdQPd+pyaItSJMcXsTdL+dfe/6wCAYDWg==
X-Received: by 2002:a05:600c:2204:b0:3f6:be1:b8d9 with SMTP id
 z4-20020a05600c220400b003f60be1b8d9mr1376592wml.6.1686322543941;
        Fri, 09 Jun 2023 07:55:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:55:43 -0700 (PDT)
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
Subject: [PATCH v2 08/11] ASoC: q6dsp: q6apm-dai: Add compress DAI and codec
 caps get callbacks
Date: Fri,  9 Jun 2023 15:54:04 +0100
Message-Id: <20230609145407.18774-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B3SU6MXCRRXNYVGYRIZ2O4NVKA2UAN4D
X-Message-ID-Hash: B3SU6MXCRRXNYVGYRIZ2O4NVKA2UAN4D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3SU6MXCRRXNYVGYRIZ2O4NVKA2UAN4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm get compress DAI capabilities and codec capabilities callbacks
to support compress offload playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 32df5db014d3..d43705bf523a 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -30,8 +30,25 @@
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
 #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
+#define COMPR_PLAYBACK_MIN_FRAGMENT_SIZE (8 * 1024)
+#define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
 #define SID_MASK_DEFAULT	0xF
 
+static const struct snd_compr_codec_caps q6apm_compr_caps = {
+	.num_descriptors = 1,
+	.descriptor[0].max_ch = 2,
+	.descriptor[0].sample_rates = {	8000, 11025, 12000, 16000, 22050,
+					24000, 32000, 44100, 48000, 88200,
+					96000, 176400, 192000 },
+	.descriptor[0].num_sample_rates = 13,
+	.descriptor[0].bit_rate[0] = 320,
+	.descriptor[0].bit_rate[1] = 128,
+	.descriptor[0].num_bitrates = 2,
+	.descriptor[0].profiles = 0,
+	.descriptor[0].modes = SND_AUDIOCHANMODE_MP3_STEREO,
+	.descriptor[0].formats = 0,
+};
+
 enum stream_state {
 	Q6APM_STREAM_IDLE = 0,
 	Q6APM_STREAM_STOPPED,
@@ -41,6 +58,7 @@ enum stream_state {
 struct q6apm_dai_rtd {
 	struct snd_pcm_substream *substream;
 	struct snd_compr_stream *cstream;
+	struct snd_codec codec;
 	struct snd_compr_params codec_param;
 	struct snd_dma_buffer dma_buffer;
 	phys_addr_t phys;
@@ -54,6 +72,7 @@ struct q6apm_dai_rtd {
 	uint16_t bits_per_sample;
 	uint16_t source; /* Encoding source bit mask */
 	uint16_t session_id;
+	bool next_track;
 	enum stream_state state;
 	struct q6apm_graph *graph;
 	spinlock_t lock;
@@ -517,9 +536,43 @@ static int q6apm_dai_compr_free(struct snd_soc_component *component,
 
 	return 0;
 }
+
+static int q6apm_dai_compr_get_caps(struct snd_soc_component *component,
+				    struct snd_compr_stream *stream,
+				    struct snd_compr_caps *caps)
+{
+	caps->direction = SND_COMPRESS_PLAYBACK;
+	caps->min_fragment_size = COMPR_PLAYBACK_MIN_FRAGMENT_SIZE;
+	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
+	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
+	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
+	caps->num_codecs = 3;
+	caps->codecs[0] = SND_AUDIOCODEC_MP3;
+	caps->codecs[1] = SND_AUDIOCODEC_AAC;
+	caps->codecs[2] = SND_AUDIOCODEC_FLAC;
+
+	return 0;
+}
+
+static int q6apm_dai_compr_get_codec_caps(struct snd_soc_component *component,
+					  struct snd_compr_stream *stream,
+					  struct snd_compr_codec_caps *codec)
+{
+	switch (codec->codec) {
+	case SND_AUDIOCODEC_MP3:
+		*codec = q6apm_compr_caps;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
 static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.open		= q6apm_dai_compr_open,
 	.free		= q6apm_dai_compr_free,
+	.get_caps	= q6apm_dai_compr_get_caps,
+	.get_codec_caps	= q6apm_dai_compr_get_codec_caps,
 };
 
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
-- 
2.21.0

