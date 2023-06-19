Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF87351D6
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B971F1;
	Mon, 19 Jun 2023 12:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B971F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687169977;
	bh=DhpnZ/0pS4S1J7570XPduAWPCALDUGt97qqEuqU0ZaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U8u22XydTBaIGnq6JsELQgdX2RFajlDa8ZvM2HO9Bu7gzvDK00TP0JFiT2qmRGWpg
	 23lk+HLd8/6t7O/UDbPWZeLfdGLUfmVfKiSHvq08hWhx5zn6dtje5b735RqrxCA6b2
	 CKyD1l8omka+D/ev/GT2/E05JVWVVVPbZJb36k6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3408F805AB; Mon, 19 Jun 2023 12:17:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E21D6F80563;
	Mon, 19 Jun 2023 12:17:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5556DF80557; Mon, 19 Jun 2023 12:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7D57F80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D57F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TeE5sjg5
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30fcde6a73cso2671234f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169817; x=1689761817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzGepGC6ZYnmZGsocL2P2Z4ZNGc2QuSBI4PBc8L8Xeo=;
        b=TeE5sjg5OrE2aYeX3pBftMim05QPJa+/1qvmbEQ7QqIESt06ME2tY/5wUULlHtheGN
         MlyFiC94sTyk3kzCrpXyrJeEPiecH0uvEUX5s0isGIOCV+u1979I/ihcn3ylReRR1dD2
         gF8ikSN6IaM+dloiqmY4eR5e7UBWVsgPUTwehGhqFx91Fzu1A/JL6lt5THWWLibYFg7Y
         TayBkWuQsVZh8xE0mBIcsxiyfjphS+E7Low2ppJDRJthHifZiq8YMXfi77xCnhElMUgn
         7IUJ6UdWQRcRAJeUi/T2GdS30Lz1GvFwvTYSBfQc6i5z/GzoH6v6200DB1dwk2lH8VkE
         i0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169817; x=1689761817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzGepGC6ZYnmZGsocL2P2Z4ZNGc2QuSBI4PBc8L8Xeo=;
        b=iCWR01MW8s3xA+R/HIoyyc5DpILFcqGVU6GvFuwQOzXSIgPg5K2dywU7CP7lMJhOdU
         FnE6qPjhEAz9ncZJgwCSVHNvtqq9GyRPBVCnZakBSK4CxsAp/jtbPPqN6xLf83DlALs+
         FhiF+SYraI/aUCqGqVCMjYIV306AwnxrvczmtklBT2QgLQxvcDmReSaIp3egf0C+szYZ
         4OELA5Poxxl99octMMH/sqheBbTOS7wHYVu5f8xuV7Ep0L0zoAIAwRxTA1Dc4SqUMYWl
         IChhkbFahFr5vt7xxdbJQoexvNu+MU5oOhCFxWgW8Gw9+gkBkWuA0bloPOHKphvj3COX
         h+aw==
X-Gm-Message-State: AC+VfDzZyPl4Yw18Cy5hq1LGJSbbf38BMc5JohOCDuggGFJEnRtbnGqj
	2N5PHMhga9sOXXWxYoH9G50Zow==
X-Google-Smtp-Source: 
 ACHHUZ6pAkcRKDuJ4mER66rw0TC0DL/95Zxf3iH5VEfKJr4ev+OM49ZLGU0BYRxcsKVlBBnIwgvMkA==
X-Received: by 2002:a5d:4952:0:b0:30d:43ca:55ab with SMTP id
 r18-20020a5d4952000000b0030d43ca55abmr5394016wrs.38.1687169817457;
        Mon, 19 Jun 2023 03:16:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:16:56 -0700 (PDT)
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
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 01/11] ASoC: qcom: SC7280: audioreach: Add sc7280 hardware
 param fixup callback
Date: Mon, 19 Jun 2023 11:16:43 +0100
Message-Id: <20230619101653.9750-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GKEHC2TW27TX5ZN7DIK2N5ZBTCZEZH42
X-Message-ID-Hash: GKEHC2TW27TX5ZN7DIK2N5ZBTCZEZH42
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKEHC2TW27TX5ZN7DIK2N5ZBTCZEZH42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add support to set backend params such as sampling rate and
number of channels using backend params fixup callback.
Also add no pcm check for hardware params constraints setting.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sc7280.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index da7469a6a267..787dd49e03f6 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -14,6 +14,7 @@
 #include <sound/soc.h>
 #include <sound/rt5682s.h>
 #include <linux/soundwire/sdw.h>
+#include <sound/pcm_params.h>
 
 #include "../codecs/rt5682.h"
 #include "../codecs/rt5682s.h"
@@ -196,8 +197,10 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_stream_runtime *sruntime;
 	int i;
 
-	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
-	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
+	if (!rtd->dai_link->no_pcm) {
+		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
+		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
+	}
 
 	switch (cpu_dai->id) {
 	case LPASS_CDC_DMA_TX3:
@@ -358,6 +361,20 @@ static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
+static int sc7280_snd_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					 struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+
+	return 0;
+}
+
 static int sc7280_snd_platform_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -387,6 +404,8 @@ static int sc7280_snd_platform_probe(struct platform_device *pdev)
 	for_each_card_prelinks(card, i, link) {
 		link->init = sc7280_init;
 		link->ops = &sc7280_ops;
+		if (link->no_pcm == 1)
+			link->be_hw_params_fixup = sc7280_snd_be_hw_params_fixup;
 	}
 
 	return devm_snd_soc_register_card(dev, card);
-- 
2.21.0

