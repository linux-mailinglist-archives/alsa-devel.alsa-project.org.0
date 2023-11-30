Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 900547FFBB4
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 20:45:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D048BE7E;
	Thu, 30 Nov 2023 20:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D048BE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701373551;
	bh=HVSp1QAdSIk2wrl2FAu53BOE+3ApnXBvs45863D7YlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UqCH+R9XyatfnTVZpKmIpm9Lt3qnDfNXHtMqHPBscD7Y+z4uKEzeQO8w0aoq+ck9r
	 G3T87Rbq02MGPxuIN3fpSL8TgPmenuF3BGafxtTZQ8kc+TuBqCBA7YNa3wMbWzwtiD
	 b5ZRTqqb1StfxaWCh+t5kxXkwa+CsnzP1IiRs4pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E993F805AB; Thu, 30 Nov 2023 20:45:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E51F805B4;
	Thu, 30 Nov 2023 20:45:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB9ADF80104; Thu, 30 Nov 2023 20:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B7A9F8055A
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 20:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B7A9F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NjQQpDv2
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9d4afb7dfso7797821fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Nov 2023 11:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701373510; x=1701978310;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC9X+I2DWGil+KYfObDh0oa4Sp4cVvyRNcYSz6qi/GY=;
        b=NjQQpDv25QcqF4ZKs61OTfvwVw5QMYA84tmyvuQGIjOOzOuncti4ZxYhh1vqfugwYt
         JbWJUy1K3gpiG9gNlBIc4Su+wL3aL5X9Ja9IYjLRoqknv4KIH5fyAW3td2DBCMrApWvf
         +2m8U9f/QvCmlYKyKvLDHbu/bYKxAGFFAdpcnIK67IKbw2dG7yYCfkvQP5g5szYG7BwC
         9IjDvtcppL9cfoWaxNa2g1jyRnfO44jyDH3Ed+h4E0MISlpPJqsjmkwqlqnHGOsHmhCi
         jvZ+nKI60LWdCc5529BvSarl+Mo3mSMoZcfRT/xUQGiRyMMReS59WuPFIPqsctR/0crx
         t5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701373510; x=1701978310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC9X+I2DWGil+KYfObDh0oa4Sp4cVvyRNcYSz6qi/GY=;
        b=FVnG/j0ixaSRxNd2WB5bj203k0Er7eZ2069kjzyEaKcpK9fPzn/fVaJNyscTEUOlp+
         b0QDPC0PWC6BqNj/foLoCj635OrYpZ23Zqyq6E+wSrs3SzSfpB6veMskU9SlI70c11i0
         T3XiOOvZwHj1FjMi1U/vpQM7nHUj0Zgay1eRQmW5cWipyMpxh0U+xwJrkhfbuCPilYnI
         b3Y5Qs5eMKk5cpabhou7AZcbdR4JixyDW001wO9puHJ9GpcS6LYqas7IGq6fFctbb5uN
         3l6bFIhF7FxGNxcVQTL8+lNw8N6/6609l/9iTul3vsdJnvb/NNICZPbjYNwhGAQx/KAI
         +RFA==
X-Gm-Message-State: AOJu0Yx9beBJ4/jVROztzBq5nCPVk4aaS8Tc+bI56v3pdzrXlKd+yU9Y
	nOcyfg1Cn7y8xXJhSKgOkqei02jmaNAAa31XbLyAZg==
X-Google-Smtp-Source: 
 AGHT+IFvub3SCGtusk+ZqhsrvxJgXcKJ9ivYgKET4m1jBYY5pnBV8bUXpwvzJHOJT7A45CaynCXmxA==
X-Received: by 2002:adf:fdcc:0:b0:333:2fd2:68fa with SMTP id
 i12-20020adffdcc000000b003332fd268famr12459wrs.141.1701367693588;
        Thu, 30 Nov 2023 10:08:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 y16-20020a170906559000b009a1dbf55665sm926713ejp.161.2023.11.30.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:08:13 -0800 (PST)
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
Subject: [PATCH v2 2/3] ASoC: qcom: audioreach: drop duplicate channel defines
Date: Thu, 30 Nov 2023 19:07:57 +0100
Message-Id: <20231130180758.212172-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
References: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VVV7Z2G7Z6TFQK2GFMSWIY6VAZ3WBHHS
X-Message-ID-Hash: VVV7Z2G7Z6TFQK2GFMSWIY6VAZ3WBHHS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVV7Z2G7Z6TFQK2GFMSWIY6VAZ3WBHHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

q6apm.h header already defines channel mapping values, so drop
duplicated devices from audioreach.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/qcom/qdsp6/audioreach.c | 12 ++++++------
 sound/soc/qcom/qdsp6/audioreach.h |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3db5ff367a29..5c7113d46b6f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -270,10 +270,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 {
 	if (num_channels == 1) {
-		ch_map[0] =  PCM_CHANNEL_L;
+		ch_map[0] =  PCM_CHANNEL_FL;
 	} else if (num_channels == 2) {
-		ch_map[0] =  PCM_CHANNEL_L;
-		ch_map[1] =  PCM_CHANNEL_R;
+		ch_map[0] =  PCM_CHANNEL_FL;
+		ch_map[1] =  PCM_CHANNEL_FR;
 	}
 }
 
@@ -839,10 +839,10 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->num_channels = cfg->num_channels;
 
 	if (num_channels == 1) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_L;
+		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
 	} else if (num_channels == 2) {
-		media_format->channel_mapping[0] = PCM_CHANNEL_L;
-		media_format->channel_mapping[1] = PCM_CHANNEL_R;
+		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
+		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index e38111ffd7b9..2c82917b7162 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -158,8 +158,6 @@ struct param_id_enc_bitrate_param {
 
 #define MEDIA_FMT_ID_PCM	0x09001000
 #define MEDIA_FMT_ID_MP3	0x09001009
-#define PCM_CHANNEL_L		1
-#define PCM_CHANNEL_R		2
 #define SAMPLE_RATE_48K		48000
 #define BIT_WIDTH_16		16
 
-- 
2.34.1

