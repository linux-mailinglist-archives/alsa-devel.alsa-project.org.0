Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B494A5628B3
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 04:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95741662;
	Fri,  1 Jul 2022 04:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95741662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656641242;
	bh=5LqABOwU7PRl8AyX3TSuTo1Ooo2dzVh8BYd3WBe6bkY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tPwL0a3cZwAawpxNKtvDvM11pueYRh3gOkMit10N9cLJ8pFTP3dz+hgDGvD5OF5T3
	 iua5JjuqmRW7XtuZiU6hKWruViTqJ0wned/y0ZQ06Wx8VlNaAfV5y0EpunlmAij8DY
	 XJmwQFyqouPgs6lyn98smmG3KXWHn4ojrh7jju5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F0BF8014E;
	Fri,  1 Jul 2022 04:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0518F80155; Fri,  1 Jul 2022 04:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF3CF800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 04:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF3CF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NezqvSu3"
Received: by mail-pl1-x629.google.com with SMTP id r1so993275plo.10
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 19:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WOEbmrluy6n0qZQ0qx31+0c9J/UAi7O4vtM5hSkBBIQ=;
 b=NezqvSu3489yDURzbF2rCHi+p/HUPuel63C1yAWiNKlbSqbRguw1TccyDm5Lm61aEJ
 YMneiDQxNECVRK6gnSXTx0JgisqhKyHdfxcAAyJ+EmnJmv+xA0X1LnXxC+1utRVz08Kg
 vpcz8UwwRYQ4lepjOL6pez0ahlWL136hH4yK60Zu1qfXNlteyfHa5IwkwHV/b+AnO5hF
 D+WJNMYS3ykMA9Afi+QPYHu2/RUpLQViHe6LnsScl4tl5Ze8OOaWHKjtnq9J/xnc7b4v
 VxowTLvM/ADGJDldOPWJEYdJ5DZP1YwYWQ1VQ/q9GAAl+CGpJ1KNrk2AgPsB+Y455eCU
 ZMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WOEbmrluy6n0qZQ0qx31+0c9J/UAi7O4vtM5hSkBBIQ=;
 b=XOM9L1BDlVss1hDGk2HICQNAjd5EGt5YWUdson0AW3QSW+em333ZMUs6/Dw2TphcKS
 /CeWR64/m0Zw9tcfX7xNL1iSegJZdJIcf4LdVyHp/QwAuoWkC2UFCoWiGIbfJb9RnReL
 3/qV1rKnWto3i5Ajq6khaOgxqpPjQsQemSyZ7XnCeOM+E2H3CrUJw8nZk50xwqoZSZmC
 2/eYaKtPaxW9RroNZiwjfgo1vpTCk0qb/WG/EssZ4I4+US9tUT7F9TasAllnALh7XIDI
 tKSrL36LdOs80s5Mn2LKTzp4N1DOfkPuE5o+YwTva9onfpgJcJ5SyqsshDaf5ugX6Up1
 UobQ==
X-Gm-Message-State: AJIora/NEDC+Z6ITkItu8kvkgy5JQ+kdVgkXKx5+AFY5ZbAUJ+XqP/Pq
 xSnOGVhkdLRyevkZHE1PnwSGOfuvpjX00RHS
X-Google-Smtp-Source: AGRyM1tqIVe6kDC8Fy8NURMzgWi99WV+TfO+rbj92/65sl+wEXDxP8zqDxLvQuzqcHd3RY9SbpFc3w==
X-Received: by 2002:a17:90a:f684:b0:1ec:b252:4cd2 with SMTP id
 cl4-20020a17090af68400b001ecb2524cd2mr13462025pjb.196.1656641171915; 
 Thu, 30 Jun 2022 19:06:11 -0700 (PDT)
Received: from a-VirtualBox.. ([101.224.225.209])
 by smtp.gmail.com with ESMTPSA id
 bo7-20020a056a000e8700b0052515a79b78sm14109431pfb.189.2022.06.30.19.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 19:06:11 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codes: Add support for ES8316 producer mode
Date: Fri,  1 Jul 2022 10:05:37 +0800
Message-Id: <20220701020537.970950-1-zhuning0077@gmail.com>
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
 sound/soc/codecs/es8316.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 4407166bb338..34176dc8af8b 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -401,9 +401,8 @@ static int es8316_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u8 clksw;
 	u8 mask;
 
-	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
-		dev_err(component->dev, "Codec driver only supports consumer mode\n");
-		return -EINVAL;
+	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBP_CFP) {
+		serdata1|=ES8316_SERDATA1_MASTER;
 	}
 
 	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S) {
@@ -464,6 +463,8 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
 	u8 wordlen = 0;
+	u8 bclk_divider;
+	u16 lrck_divider;
 	int i;
 
 	/* Validate supported sample rates that are autodetected from MCLK */
@@ -477,19 +478,24 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 	if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS)
 		return -EINVAL;
-
+	lrck_divider = es8316->sysclk/params_rate(params);
+	bclk_divider = lrck_divider/4;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		wordlen = ES8316_SERDATA2_LEN_16;
+		bclk_divider/=16;
 		break;
 	case SNDRV_PCM_FORMAT_S20_3LE:
 		wordlen = ES8316_SERDATA2_LEN_20;
+		bclk_divider/=32;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		wordlen = ES8316_SERDATA2_LEN_24;
+		bclk_divider/=24;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		wordlen = ES8316_SERDATA2_LEN_32;
+		bclk_divider/=32;
 		break;
 	default:
 		return -EINVAL;
@@ -499,6 +505,11 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
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
 
@@ -510,7 +521,7 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute, int direction)
 }
 
 #define ES8316_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
-			SNDRV_PCM_FMTBIT_S24_LE)
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops es8316_ops = {
 	.startup = es8316_pcm_startup,
-- 
2.36.1

