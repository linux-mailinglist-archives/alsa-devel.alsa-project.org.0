Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9399E8BF852
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 10:18:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88965845;
	Wed,  8 May 2024 10:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88965845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715156325;
	bh=cMddYFvxag2xiuk6mbkfydpMJeegTn2R9D7VIBWz/p4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uo4EzX+TT9DhqCINOx/DZb0WknjZoSNyEt2AOcZFnjapIx3YpbUdvA2E5WshkfK/d
	 Q3FILPneD/AFceI8FO15mYbrhmxpB2ZZGXb9FfOj9cInKfvvps5iq/L2cvsAgQGYZl
	 bjAG3CNU2wHvg8ovXr+JGlz3olRazKlGM890MQJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D825F80564; Wed,  8 May 2024 10:18:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40876F80564;
	Wed,  8 May 2024 10:18:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E1E4F80423; Wed,  8 May 2024 10:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17BE7F8049C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 10:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17BE7F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oIQJJKuL
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso830541666b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715156203; x=1715761003;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0d/mfFuQBbC2bnLXnrpmIq7nUGA3L1YuLtXQ7YCcvk8=;
        b=oIQJJKuLgizdMqnmCVpNqLHpAt13S7oGsm5K7/7gRKuUbpy3yJFsrfci9WIepEMbo2
         Agx5pXW+W1H3bUUIDb5HOIIEdh/M1MbfHZ5zfR/iuuvPFIpu8/0xE6gDVbRm5+2uimnN
         MOULx8dNABnpi2oa5B5GYT3OHQbPFdAybSuVLSzkTMQDJn7sDrw9BZUdJL5b2G+UDm6u
         BIkuec2Pe+9UATyhCPQOldqnGGChs7+PljGH/jniKXmt42jskvV/uZ/pAnqIVc1pssyh
         jlvLCnVvU2Hjmo3q+zV0wal6MgB3Z+kR1dlPnW1CHhA4HZogmvKlVkEgA1eGzg5K6Bwi
         eTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715156203; x=1715761003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0d/mfFuQBbC2bnLXnrpmIq7nUGA3L1YuLtXQ7YCcvk8=;
        b=njag+ErHM7DMiUH1rxj9CkQ33Oko9lU7i3Xfrgw8vTXgLfw8CdNPE3jia0za6L2lcr
         EcksNvQ9KBXTz2x+8p7GKI+8OFmCo4psrSlTZbijbm08DAZnwdbfYSPWPPxax2RJ4d1f
         zo2QAI8WHOIpqCileKX5BOSZDypm2XnHDbiWIU0U/J3nQia8DFbERwDffFK0hxlAkyCr
         FzJ8F7tVIo0hmdvGpVodj9T0CNMVEFL5JdTzXjE2p1G+YbEzKwdUMqA2rQlxMCW5w0SD
         rHElgZ1jIFnOFw5/0ZIFWrKEnv0JmTy8k9AeQU3XKL0OwbJIafqNSoRHOQqxUrtvx4wD
         4kOA==
X-Gm-Message-State: AOJu0YwlxmiG1WnuT25WlQx14MYkBkJptAS3JOcPbOmIgRTWVxh4yI//
	5amAaXSOTBLPm23oJaMYLhIDBi+d9t9Vu8LcZ3cJVjNsx/+2PxX5RNfDXveedpQ=
X-Google-Smtp-Source: 
 AGHT+IE1MBNbXZrLfjXyx1dCe1syvalb4+faepTXKfJQ+upTD3a+dk8JxubWK9XFT7IdyM5EGPflKw==
X-Received: by 2002:a17:906:1d5b:b0:a59:cc9b:d6ea with SMTP id
 a640c23a62f3a-a59fb955674mr108227966b.22.1715156203092;
        Wed, 08 May 2024 01:16:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 va28-20020a17090711dc00b00a59b87dd0d7sm4564734ejb.147.2024.05.08.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:16:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 08 May 2024 10:16:29 +0200
Subject: [PATCH v2 3/4] ASoC: qcom: qdsp6: Set channel mapping instead of
 fixed defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-3-ccef9a66a572@linaro.org>
References: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
In-Reply-To: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7708;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cMddYFvxag2xiuk6mbkfydpMJeegTn2R9D7VIBWz/p4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOzTjyxhpO8DzaA8ppReHM4hPV3Z/adqaBpWAV
 0H7r4EXyQyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjs04wAKCRDBN2bmhouD
 11/XD/wPSSdoWkExslTsPTSBfHnP9U/c6S/6Ai1uhniexM/T+60CUs/r9WrlcPpyJY4YifM6D9e
 hlS8kSPGPKWxGaZI7Vro6X1HuhiPcJ1fYykAr47hIWinhSBsqkVNutj7EvSfQuvW0pzxYMkc8wx
 9CW7Ice7Y8zU3I+BwFwqo8OidcMdvJ7DIMpJmZg5tzkh0ZMbcEzhozYCHjSDP/w09BvXzcc+3Z0
 H5zptJp8bSDZkXD/0wVReTpj7JFfogyhp6xOf/hATQQPpibRzEQEdYvt+cug7gX34Qx8XnIL1o0
 ckaYIsQU9jfJI0/zfILYxI/WZaBCS01DywAC00Q93N4Of8p00YP+Su22Dt3n4GIe9/NB0B6AQcj
 3/KLSSQvKB1rhZtvbvgx1NRaA1WZH7Mkg7IkJybvrBv1iyt2Ijb5+VMvit0422/5mx2l59GUP/C
 fqxBjI8/xKpDbj84LHul7HOg+w5lKJUM/D4N6/CZyoAJ/WT+rfY6f6a3ah6b5UUukOM/JYuh4NL
 OSaQNOa2JZfosVMG7zY3X8OVZwIJnN3EKV02OK005BNl5w38P2LJIoPIarQwBc0RYKMd3/M+zr7
 uYHy8QjCMlk34jsRYjdHilui/7sdjWvoJ8AJmDx7s3TV3EGjPLTreeM4WxN30wd/awInXHMsZiw
 UP8rDg7JnNIleDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: FSXFDYEW6ZECT22BUIEIMBNS76CMYA3N
X-Message-ID-Hash: FSXFDYEW6ZECT22BUIEIMBNS76CMYA3N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSXFDYEW6ZECT22BUIEIMBNS76CMYA3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When constructing packets to DSP, the Audioreach code uses 'struct
audioreach_module_config' to configure parameters like number of
channels, bitrate, sample rate etc, but uses defaults for the channel
mapping.

Rework this code to copy the channel mapping from 'struct
audioreach_module_config', instead of using the default.  This requires
all callers to fill that structure: add missing initialization of
channel mapping.

Entire patch makes code more logical and easier to follow:
1. q6apm-dai and q6apm-lpass-dais code which allocates 'struct
   audioreach_module_config' initializes it fully, so fills both
   the number of channels and the channel mapping.
2. Audioreach code, which uses 'struct audioreach_module_config' when
   constructing packets, copies entire contents of passed config, not
   only pieces of it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Extend commit msg, rationale.
2. Rework to new approach, but most of the code stays.
3. Export audioreach_set_channel_mapping() (needed by Q6APM DAIS and
   LPASS DAIS)
4. Correct channel mapping also in audioreach_mfc_set_media_format(),
   because MFC DAI is now part of backend.
5. Do not adjust dynamic DAIs (drop audioreach_dai_load()).
---
 sound/soc/qcom/qdsp6/audioreach.c       | 30 +++++++-----------------------
 sound/soc/qcom/qdsp6/audioreach.h       |  1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  2 ++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  5 ++++-
 4 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5291deac0a0b..750b8ba64211 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -267,7 +267,7 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
-static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
+void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 {
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
@@ -281,6 +281,7 @@ static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 		ch_map[3] =  PCM_CHANNEL_RS;
 	}
 }
+EXPORT_SYMBOL_GPL(audioreach_set_channel_mapping);
 
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  struct audioreach_container *cont)
@@ -819,7 +820,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	uint32_t num_channels = cfg->num_channels;
 	int payload_size;
 	struct gpr_pkt *pkt;
-	int rc;
+	int rc, i;
 	void *p;
 
 	payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
@@ -842,18 +843,8 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->sample_rate = cfg->sample_rate;
 	media_format->bit_width = cfg->bit_width;
 	media_format->num_channels = cfg->num_channels;
-
-	if (num_channels == 1) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
-	} else if (num_channels == 2) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
-		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
-	} else if (num_channels == 4) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
-		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
-		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
-		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
-	}
+	for (i = 0; i < num_channels; i++)
+		media_format->channel_mapping[i] = cfg->channel_map[i];
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -883,9 +874,6 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		mp3_cfg->q_factor = mcfg->bit_width - 1;
 		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
 		mp3_cfg->num_channels = mcfg->num_channels;
-
-		audioreach_set_channel_mapping(mp3_cfg->channel_mapping,
-					       mcfg->num_channels);
 		break;
 	case SND_AUDIOCODEC_AAC:
 		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
@@ -1104,9 +1092,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->num_channels = mcfg->num_channels;
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
-
-	audioreach_set_channel_mapping(media_cfg->channel_mapping,
-				       num_channels);
+	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -1163,9 +1149,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
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
index eb9306280988..208b74e50445 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -766,6 +766,7 @@ struct audioreach_module_config {
 /* Packet Allocation routines */
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
 				    token);
+void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..8ab55869e8a2 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -243,6 +243,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.num_channels = runtime->channels;
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
+	audioreach_set_channel_mapping(cfg.channel_map, runtime->channels);
 
 	if (prtd->state) {
 		/* clear the previous setup if any  */
@@ -669,6 +670,7 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 		cfg.num_channels = 2;
 		cfg.bit_width = prtd->bits_per_sample;
 		cfg.fmt = codec->id;
+		audioreach_set_channel_mapping(cfg.channel_map, cfg.num_channels);
 		memcpy(&cfg.codec, codec, sizeof(*codec));
 
 		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index a4ad1d0e6abd..8340e4fb78f4 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -106,6 +106,7 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
 	cfg->num_channels = channels;
+	audioreach_set_channel_mapping(cfg->channel_map, channels);
 
 	switch (dai->id) {
 	case DISPLAY_PORT_RX_0:
@@ -130,10 +131,12 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
 
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
-	cfg->num_channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
+	cfg->num_channels = channels;
+	audioreach_set_channel_mapping(cfg->channel_map, channels);
 
 	return 0;
 }

-- 
2.43.0

