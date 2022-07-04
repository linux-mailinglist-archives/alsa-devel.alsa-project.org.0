Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E179564B26
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 03:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD2916EA;
	Mon,  4 Jul 2022 03:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD2916EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656897992;
	bh=yAqLrBh7wFC4hhyppZSHsfoysbc7w/75Y9Aus2FTHW4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=epy8cBivwxQBXSVhtdQCMaSoQqQxWk4e/+e2m+g7TUFRK5L3EemBynxFSON28EazN
	 /Nd8fzHyNwzL2t0WI0Pa8UTYoQoxyQWRh1mf8P8OCNaTPc1emUUnnRJUMFM+cacwKH
	 xg3mnhfFaDhDGlO+bYZ4e/jjdzL52Vi6c3fpBkwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7064BF80254;
	Mon,  4 Jul 2022 03:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D9EF80249; Mon,  4 Jul 2022 03:25:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D30AF80089
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 03:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D30AF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KZ/lDy4c"
Received: by mail-pj1-x1036.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso1894413pjb.1
 for <alsa-devel@alsa-project.org>; Sun, 03 Jul 2022 18:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0j9USGn2vXnnAO/0PTojlzBxN66RHlbHpUc2bYBu488=;
 b=KZ/lDy4cewwfL0Ww/Z6iULwxKZYN6UDYNpILi4/J+Bnd0jPMhXfCSVgN2F8yXD1NDR
 E4IBxeeIGmRQsIvqd6V4wtF466jm2M/lPuglovU63fcg3QFpU2vZv2YzOJSWFpA6UYui
 5HTduS93tro9jOQHr6g93UVpF3Xk/ulqZdcc3bgo69PcqUUXlqQm0J0mhVYSV4SE3wjU
 lQx8K+xjwEfiozFmDQVESVP/NIB0E4B0z98RZsAUScQP77OG5M3W/NXj7MEyOtC/1IX1
 3eG/szev7XJU2EGEOXxVyX/n1iKl1d7o4zlHj1DDLU0BvX0eu02QfutFnDY4ckmVbSpR
 VVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0j9USGn2vXnnAO/0PTojlzBxN66RHlbHpUc2bYBu488=;
 b=FCGobUzUj67RbbLGZF5IlP73xUz6b1GxFyOtK2tdiU+q9E2rjsIo74IDVpERr4aeLY
 22+ph71tO23TRo7cY8ntzWGA+N7II7WiaQMeHU+dnlVYvU0Tkfl4X3k8g9NJ7yamN9Ke
 vkwsrtAGTW0NY2JSIEzdaxEo7wnG3c5xhTO81Tc4rLQD9suTHN/xFT0PUOx6Ye9SNWSG
 CBJJaZ55iheKbAe/hrfVQrSVn64RwEvnxpjTYGdtbCG+yba5drrmrZhB1xqxSDB1zOmG
 S0r2TStF0DNsmZWEIC9A+zkGhFNfLdJH8vxTrSCzV67GDg60qjiliY1Qy+AyEQynLr35
 2Icw==
X-Gm-Message-State: AJIora9JIhmz3mEUTxYkUoi1Xh4qUP5me7FoCp1vilTrdcvkQrs24WpV
 QWhBBNRXHRu4lgbySES6YoujxVZknbPLXA==
X-Google-Smtp-Source: AGRyM1tv2jQ0mNN7602Y4rNN76kLZkZlnpV0kOeyHT3uYCddl5/W+QlKKYtuf1EMSBtZdIpQ9/TFRA==
X-Received: by 2002:a17:902:d549:b0:16a:3ac1:354 with SMTP id
 z9-20020a170902d54900b0016a3ac10354mr33654103plf.148.1656897919951; 
 Sun, 03 Jul 2022 18:25:19 -0700 (PDT)
Received: from a-VirtualBox.. ([101.224.225.209])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170902cecb00b0016bde4cc505sm1634919plg.131.2022.07.03.18.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 18:25:19 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codes: Add support for ES8316 producer mode
Date: Mon,  4 Jul 2022 09:24:16 +0800
Message-Id: <20220704012416.3165-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Zhu Ning <zhuning0077@gmail.com>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, vijendar.mukunda@amd.com,
 David Yang <yangxiaohua@everest-semi.com>
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

The AMD acp-es8336 machine driver requires ES8316 run in producer
mode, which is not supported previously.

Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8316.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 4407166bb338..af7706f49dbf 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -401,10 +401,8 @@ static int es8316_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u8 clksw;
 	u8 mask;
 
-	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
-		dev_err(component->dev, "Codec driver only supports consumer mode\n");
-		return -EINVAL;
-	}
+	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBP_CFP)
+		serdata1 |= ES8316_SERDATA1_MASTER;
 
 	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S) {
 		dev_err(component->dev, "Codec driver only supports I2S format\n");
@@ -464,6 +462,8 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
 	u8 wordlen = 0;
+	u8 bclk_divider;
+	u16 lrck_divider;
 	int i;
 
 	/* Validate supported sample rates that are autodetected from MCLK */
@@ -477,19 +477,24 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 	if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS)
 		return -EINVAL;
-
+	lrck_divider = es8316->sysclk / params_rate(params);
+	bclk_divider = lrck_divider / 4;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		wordlen = ES8316_SERDATA2_LEN_16;
+		bclk_divider /= 16;
 		break;
 	case SNDRV_PCM_FORMAT_S20_3LE:
 		wordlen = ES8316_SERDATA2_LEN_20;
+		bclk_divider /= 20;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		wordlen = ES8316_SERDATA2_LEN_24;
+		bclk_divider /= 24;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		wordlen = ES8316_SERDATA2_LEN_32;
+		bclk_divider /= 32;
 		break;
 	default:
 		return -EINVAL;
@@ -499,6 +504,11 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 			    ES8316_SERDATA2_LEN_MASK, wordlen);
 	snd_soc_component_update_bits(component, ES8316_SERDATA_ADC,
 			    ES8316_SERDATA2_LEN_MASK, wordlen);
+	snd_soc_component_update_bits(component, ES8316_SERDATA1, 0x1f, bclk_divider);
+	snd_soc_component_update_bits(component, ES8316_CLKMGR_ADCDIV1, 0x0f, lrck_divider >> 8);
+	snd_soc_component_update_bits(component, ES8316_CLKMGR_ADCDIV2, 0xff, lrck_divider & 0xff);
+	snd_soc_component_update_bits(component, ES8316_CLKMGR_DACDIV1, 0x0f, lrck_divider >> 8);
+	snd_soc_component_update_bits(component, ES8316_CLKMGR_DACDIV2, 0xff, lrck_divider & 0xff);
 	return 0;
 }
 
-- 
2.36.1

