Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AF7FFB31
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 20:23:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62E9EDEF;
	Thu, 30 Nov 2023 20:23:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62E9EDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701372229;
	bh=UxUXzr7MUAQkO9QmIGMfi1vJoiI/YuEE7Nq9Adt6j6A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=elbOTQ+7cb2o2W/HR9RXABdpmTSTD9tPvMg/jgjNa7d8aUPSbK/DT4yofOzbIQygB
	 gGXJBtVjRAU++cHQyWGRBG4sz/3EJv1HbvSI0H8yjF6DLokBfDt0gS6sGffLwxJV9C
	 EnNdkPI4tamM2a+cGZll24IZozSXdoVMGZTK74mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60ADFF8057A; Thu, 30 Nov 2023 20:23:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B2BDF80571;
	Thu, 30 Nov 2023 20:23:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7225F8016E; Thu, 30 Nov 2023 20:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C16A9F800F5
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 20:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C16A9F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BDagFxkP
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50bba815f30so1734312e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Nov 2023 11:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701372106; x=1701976906;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWM7V+ZExvAnFj1W1dKLDuXcl2XOV1nsx6wXsgycfE=;
        b=BDagFxkPyfE+HdE14WdJ7LjO/dYeLAnMKWREheqiGKMYe1ijMYozAsg89buH55hQKl
         yx0syKrEUAOT/C1c97GZlcEAdPjCawnpMkGmT8ooerLxptTqLE3vRlkCnvhK9hSzEtc3
         BRVNxXdA5UjzV6QANPshvd3Uy9G5KkW8ouOtRw/yw0gJRJDwlsU6tKu9oV/ezbDLmiN5
         P+CPaeek/myGt5BTTAdYzAaWhnUWqUNkFJMHBYlAJcp/wZTO4S0NzNUScRZlqynxPUkW
         z06K6wxLZHZ8fNyyzuiAmqZ4Xs063RMwsvcK4gZzLA5zqogHvntWnV3Z+PgAxvM8yxsQ
         n28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701372106; x=1701976906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hWM7V+ZExvAnFj1W1dKLDuXcl2XOV1nsx6wXsgycfE=;
        b=Bbs/YMUkbbkxSAEp+fJ6HkOxVxepjdvuyhzu1jK9lvACzsc6N9bgx5dk0DqA/f9k9u
         +cFv8T7NMbPFpUvHa5rXZEfrz9+TKbgaFzzUbHGXUOa9BMBO8m7GvJGfqpVPwtUMfLDe
         b+0hlhDcCecSENtMsMPvvdWt2JOTI9bRDifuOwfmWmMvW2oRf9789PoeuUUF6/C/X3CJ
         kNgDgvlgExfmaEUpkMT5isW3YzJvwqDRI1ayo1I/5bFe5Cht+O8z2uQ63xdcEmVrHokg
         UovlBvuuuL1jiJSvVXO0jGgiK+a+gK+dHGXU9SYTI1VJS+oiXtln3isaPPp52RM9/k7x
         bg8A==
X-Gm-Message-State: AOJu0Ywv4lsRYExuEuvrI19Z0F4sNSbfTgStzaN8yefvhgzmMFgAAub/
	HCJfOoHBjYfUPbt4NBbnpp3OVXBKzZuIthBo9Ef1Lw==
X-Google-Smtp-Source: 
 AGHT+IGG8SW/XcQazf2iyEQkOuHfNKXEzI1KvqtYFQzrb/U6iIkfOpKTu2rQXzzMQj1IPVHwiHZ0mg==
X-Received: by 2002:a17:906:b88f:b0:a19:a1ba:bab7 with SMTP id
 hb15-20020a170906b88f00b00a19a1babab7mr5512ejb.93.1701367681837;
        Thu, 30 Nov 2023 10:08:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 y16-20020a170906559000b009a1dbf55665sm926713ejp.161.2023.11.30.10.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:08:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] ASoC: qcom: audioreach: Commonize setting channel
 mappings
Date: Thu, 30 Nov 2023 19:07:56 +0100
Message-Id: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FFCUH7ESMUSHHVLJBYO7ZPE6KTQYM57O
X-Message-ID-Hash: FFCUH7ESMUSHHVLJBYO7ZPE6KTQYM57O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFCUH7ESMUSHHVLJBYO7ZPE6KTQYM57O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move code assigning channel mapping values to a common helper function.
This simplifies three out of four cases, with the last case using
incompatible type (uint16_t array instead of uint8_t array).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/qcom/qdsp6/audioreach.c | 35 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5974c7929dd3..3db5ff367a29 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -267,6 +267,16 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
+static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
+{
+	if (num_channels == 1) {
+		ch_map[0] =  PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		ch_map[0] =  PCM_CHANNEL_L;
+		ch_map[1] =  PCM_CHANNEL_R;
+	}
+}
+
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  struct audioreach_container *cont)
 {
@@ -864,12 +874,8 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
 		mp3_cfg->num_channels = mcfg->num_channels;
 
-		if (mcfg->num_channels == 1) {
-			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-		} else if (mcfg->num_channels == 2) {
-			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-			mp3_cfg->channel_mapping[1] =  PCM_CHANNEL_R;
-		}
+		audioreach_set_channel_mapping(mp3_cfg->channel_mapping,
+					       mcfg->num_channels);
 		break;
 	case SND_AUDIOCODEC_AAC:
 		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
@@ -1089,13 +1095,8 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
 
-	if (num_channels == 1) {
-		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
-	} else if (num_channels == 2) {
-		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
-		media_cfg->channel_mapping[1] = PCM_CHANNEL_R;
-
-	}
+	audioreach_set_channel_mapping(media_cfg->channel_mapping,
+				       num_channels);
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -1153,12 +1154,8 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
 
-		if (mcfg->num_channels == 1)
-			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-		else if (num_channels == 2) {
-			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
-			cfg->channel_mapping[1] =  PCM_CHANNEL_R;
-		}
+		audioreach_set_channel_mapping(cfg->channel_mapping,
+					       num_channels);
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc) {
-- 
2.34.1

