Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E47DC4E9
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 04:38:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5CD9DF6;
	Tue, 31 Oct 2023 04:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5CD9DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698723498;
	bh=Pb+U6Acg9Qr2+woUyluur7gUK1QU5JgnT8U0eENtokI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vqDQJm3KTnInBzAH/shZEmcgxADu2AfrEvIuVyDu+bHjGSALT7FyZ2stKGkr4wgSX
	 eK6DqvSdRD5YnmOaHm2IZ66OorqyB9wUmaSSw4RuQZOSSW3t3ws1lupbHBVYp1Zb/n
	 h5Ijxme0aYRndzewgMucCXCLXlXa2sAko3h5aS/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FFE6F80587; Tue, 31 Oct 2023 04:36:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8108F8055C;
	Tue, 31 Oct 2023 04:36:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14070F8057D; Tue, 31 Oct 2023 04:36:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A22CF8055C
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 04:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A22CF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JwgSCwpj
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cc30bf9e22so21085805ad.1
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Oct 2023 20:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698723399; x=1699328199;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpJJnIohFz6vEmYruDEgUewlWDQ8G1djEDuF3UHuYM8=;
        b=JwgSCwpjZX4syLQNnvJ1pRgLtTzefarExwwuwxq88J1X104Wr0rBZgsVy+uCVrbRxC
         t15q+SfXdt30XXL1twy8Etsmkap4Pl2wk+J9eBg8/zGSay/MBzyBy+8q0qheR35REzX1
         IgJ/yftz0QRfI3Q1Ke2SV/BBW7NVPAHb9d7GxFF3vVICEnHzYyVQYyKfuGXef1Co722y
         3WK3Il/bHRm0vp1KgzOQ6fkow7Zfa+XGT9nbsKy6aYpuQtmy1SgD69GMVBUoA7r3xF3U
         W2SrBCvVPgJGD7RIfVW8OyTfGxpz+o79sy48eDrMyLMtgcwVTFDEtu4dYCCwcPkG0jDn
         1CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698723399; x=1699328199;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpJJnIohFz6vEmYruDEgUewlWDQ8G1djEDuF3UHuYM8=;
        b=OG2XvOUTBTw/PxBVnq7GVMSkxY0Sj2XUOT3U2En3GgU4RCd7++KzzdaCq2VkXySIqy
         z0+N43rYoav6x0lAHYu9Tm2Fr2KbDcmSnJQUGeyBnUrt8jbXylmpmLTlXlYMpZkhEJ9Y
         Z/mn6GvxNpEit4rU4pPS5e4dTr4k56DdFnWoddVrGm05TCozvKx1p+QuiuyRKiSPNa5A
         zcO5JEkeSlT3GIfvY9f0Uts7C7K117mIaAtSjrb8gQADbqmyxYpVz45+8Xxp+YgjjRAC
         quhfJOWKIs7sKIIKnRPRw5GxF8NKIt7kEW1qkluUiEvXAPAVNAxze66JwTSSOsF0tjw7
         iuvw==
X-Gm-Message-State: AOJu0YxZ4XIJ3OKN+jPKGRDNgD8m54XzKioIBnee49N939FiwEgOtSXR
	M/jEKw1WsB4pX/MysKnF16qKCb+TmNWLYQ==
X-Google-Smtp-Source: 
 AGHT+IGVB09iLs9VGIo2fy8bcpDw7dcF4zfpE0S1YtNfaWp+Px77EwXNe0eIiqoctw7HTnuW9fgIEQ==
X-Received: by 2002:a17:902:cec4:b0:1cc:5c49:6af8 with SMTP id
 d4-20020a170902cec400b001cc5c496af8mr2156984plg.25.1698723398830;
        Mon, 30 Oct 2023 20:36:38 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 i12-20020a170902eb4c00b001ca2484e87asm224586pli.262.2023.10.30.20.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 20:36:38 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 2/3] ASoC: codecs: ES8326: Changing initialisation and
 broadcasting
Date: Tue, 31 Oct 2023 11:36:09 +0800
Message-Id: <20231031033610.86433-3-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231031033610.86433-1-zhuning0077@gmail.com>
References: <20231031033610.86433-1-zhuning0077@gmail.com>
Message-ID-Hash: KZATHJYPSAS4HC7OQTP2VPRQGXFBP235
X-Message-ID-Hash: KZATHJYPSAS4HC7OQTP2VPRQGXFBP235
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZATHJYPSAS4HC7OQTP2VPRQGXFBP235/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

New chip versions require new initialisation and playback processes. Changing the initialisation and playback process for better results

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 52 ++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index b390e0b949cc..22a797b27a3c 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -132,6 +132,11 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("LHPMIX", ES8326_DAC2HPMIX, 7, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("RHPMIX", ES8326_DAC2HPMIX, 3, 0, NULL, 0),
 
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "HPOR Supply", ES8326_HP_CAL,
+			 4, 7, 0, 0),
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "HPOL Supply", ES8326_HP_CAL,
+			 0, 7, 0, 0),
+
 	SND_SOC_DAPM_OUTPUT("HPOL"),
 	SND_SOC_DAPM_OUTPUT("HPOR"),
 };
@@ -156,6 +161,9 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 	{"LHPMIX", NULL, "Left DAC"},
 	{"RHPMIX", NULL, "Right DAC"},
 
+	{"HPOR", NULL, "HPOR Supply"},
+	{"HPOL", NULL, "HPOL Supply"},
+
 	{"HPOL", NULL, "LHPMIX"},
 	{"HPOR", NULL, "RHPMIX"},
 };
@@ -436,8 +444,8 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
 			es8326->calibrated = true;
 		}
-		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa0);
-		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x80);
+		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
+		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x91);
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_ON);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 				ES8326_MUTE_MASK, ~(ES8326_MUTE));
@@ -457,8 +465,6 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		if (ret)
 			return ret;
 
-		regmap_write(es8326->regmap, ES8326_RESET, 0x9f);
-		msleep(20);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
 		regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
@@ -467,19 +473,21 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0x40);
 		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x00);
 		regmap_update_bits(es8326->regmap,  ES8326_CLK_CTL, 0x20, 0x20);
-		regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_ON);
+
+		regmap_update_bits(es8326->regmap, ES8326_RESET,
+				ES8326_CSM_ON, ES8326_CSM_ON);
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		break;
-	case SND_SOC_BIAS_OFF:
-		clk_disable_unprepare(es8326->mclk);
 		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
 		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x00);
 		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
 		break;
+	case SND_SOC_BIAS_OFF:
+		clk_disable_unprepare(es8326->mclk);
+		break;
 	}
 
 	return 0;
@@ -749,13 +757,15 @@ static int es8326_calibrate(struct snd_soc_component *component)
 		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x01);
 		regmap_write(es8326->regmap, ES8326_CLK_DLL, 0x30);
 		regmap_write(es8326->regmap, ES8326_CLK_MUX, 0xed);
+		regmap_write(es8326->regmap, ES8326_CLK_DAC_SEL, 0x08);
 		regmap_write(es8326->regmap, ES8326_CLK_TRI, 0xc1);
 		regmap_write(es8326->regmap, ES8326_DAC_MUTE, 0x03);
 		regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7f);
-		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x33);
+		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x03);
 		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x88);
-		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x80);
+		usleep_range(15000, 20000);
 		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
+		usleep_range(15000, 20000);
 		regmap_write(es8326->regmap, ES8326_RESET, 0xc0);
 		usleep_range(15000, 20000);
 
@@ -788,32 +798,31 @@ static int es8326_resume(struct snd_soc_component *component)
 
 	regcache_cache_only(es8326->regmap, false);
 	regcache_sync(es8326->regmap);
-
 	/* reset internal clock state */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
 	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
 	usleep_range(10000, 15000);
-	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0x88);
+	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0xe9);
+	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0x4b);
 	/* set headphone default type and detect pin */
-	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x81);
+	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x83);
 	regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
+	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x30);
 
 	/* set internal oscillator as clock source of headpone cp */
-	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC, 0x84);
+	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC, 0x89);
 	regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_ON);
 	/* clock manager reset release */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x17);
 	/* set headphone detection as half scan mode */
-	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x08);
+	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x30);
 	regmap_write(es8326->regmap, ES8326_PULLUP_CTL, 0x00);
 
 	/* enable headphone driver */
 	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa7);
 	usleep_range(2000, 5000);
-	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xab);
-	usleep_range(2000, 5000);
-	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xbb);
-	usleep_range(2000, 5000);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xa3);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xb3);
 	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
 
 	regmap_write(es8326->regmap, ES8326_CLK_INV, 0x00);
@@ -827,9 +836,6 @@ static int es8326_resume(struct snd_soc_component *component)
 	/* set ADC and DAC in low power mode */
 	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
 
-	/* force micbias on */
-	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0x4f);
-	regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x08);
 	regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7F);
 	/* select vdda as micbias source */
 	regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x23);
@@ -857,7 +863,7 @@ static int es8326_resume(struct snd_soc_component *component)
 			((es8326->version == ES8326_VERSION_B) ?
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
-
+	regmap_write(es8326->regmap, ES8326_HP_VOL, 0x11);
 	es8326->jack_remove_retry = 0;
 	es8326->hp = 0;
 	return 0;
-- 
2.17.1

