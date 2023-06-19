Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E77351DD
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E93A3DF2;
	Mon, 19 Jun 2023 12:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E93A3DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687170013;
	bh=T8UeFghN+xRl96JHCM4tgRWclFkq5LeofZ8UBCLDeu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qxmtTx/5rCOWA6AKzBh2PbZSL/u/PxYH5Rxh6B2eRYYRmpMqDAMB4yikN9DUFfHys
	 Z7Mlp7BftQjSumcmfc8/i1SlXa/tzEZEeHULU2Ntxc48KSFDF8GCzb3LtL/f1wStSe
	 fA77N/A92O0mctt2SFK7ZnGGop2zTQGC5B07TrXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 699A7F805D2; Mon, 19 Jun 2023 12:17:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1ADAF805C7;
	Mon, 19 Jun 2023 12:17:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA28CF8057C; Mon, 19 Jun 2023 12:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05680F80552
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05680F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cUWb4upm
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3111547c8f9so3861396f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169825; x=1689761825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sys5TdhsIRvy1RJtrPRmzzTf1MuduWY9oZx3ELz0gpM=;
        b=cUWb4upmBaLp26qcGEFTIUOex7qyJ6XSbeJnL0DMJfSmVyf1Kzinq75EJk2mSNy7Ma
         LGP/GyqEmB0IMk00k2ax0HQSawey79vn58f7Ef8X+crQhxvkZu4DYmvSONx42oaOClEu
         qRe/RhTquxhqfe2ekHAmfM5qJodHwCRQbirjIGtsIjd18EEe0KyR/BcpvABGf8FAtwX+
         OvaOwCgCDvleBZLKGNVeUjyjiLZC9FN6FhkjPbwE7QJpP4/cn+CmtR3Egj+lzkLVygwc
         Of7PTyq6doN3NLjn47uaGK6vcDtX7fAEjiqphyx3FvfwiomF0C6rt/tmrwAo8jdAuNFo
         aQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169825; x=1689761825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sys5TdhsIRvy1RJtrPRmzzTf1MuduWY9oZx3ELz0gpM=;
        b=gtPWEeBRt+SM3mBWYVaXYB4yRXKml58isauvhyx8ZyjlMOaYW+yqBvCXATrXT5NR9g
         Tje7A60B1gTUMCPoPoro3HVmBvooxZI1NqXHTcNrKqV6RvU/IUWEYnEQNV0g/JdfLIW5
         noIp1vpoS4tbLsp82/q8Z9omfNzm2qPVbC1NidEqrzAP8J6o0E8KcpyFtfET/uKs2g4M
         lKX47yAqn3CYjT1d9jxsgzTTyo+NUYJDY5OoBs+Y5fJaakabxSjf4C+KgWXau9qdQcLg
         wDd80zn/umau6YHnlmr2PGD0Lr9dv5Nciw0xsx0/bleNxbXIT8fHXWJYbtjd6zgOnsCL
         9Vrw==
X-Gm-Message-State: AC+VfDzlQwab3b/ktxL/tt6SUVbgz9FPo8olD+yavc2SsmgFt/v36g+6
	TyM5MghKwES0sscNLdbb+2d+9A==
X-Google-Smtp-Source: 
 ACHHUZ69d7ZaC5DAxHI5Amjpfc4qJJKsrdGiqhyJPz2JqPWO9aGl2us1iOxQB3382Pk/1CuPSrHJeA==
X-Received: by 2002:a5d:570b:0:b0:309:4da8:7713 with SMTP id
 a11-20020a5d570b000000b003094da87713mr7237177wrv.64.1687169825370;
        Mon, 19 Jun 2023 03:17:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:17:04 -0700 (PDT)
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
Subject: [PATCH v3 08/11] ASoC: q6dsp: q6apm-dai: Add compress DAI and codec
 caps get callbacks
Date: Mon, 19 Jun 2023 11:16:50 +0100
Message-Id: <20230619101653.9750-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WQY6W6VNO5ZXHUSPI6PWTB5DPZG4N6GD
X-Message-ID-Hash: WQY6W6VNO5ZXHUSPI6PWTB5DPZG4N6GD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQY6W6VNO5ZXHUSPI6PWTB5DPZG4N6GD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm get compress DAI capabilities and codec capabilities callbacks
to support compress offload playback.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

