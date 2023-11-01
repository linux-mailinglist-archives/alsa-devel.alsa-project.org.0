Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB6A7DDD31
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 08:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 094A1E0F;
	Wed,  1 Nov 2023 08:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 094A1E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698823762;
	bh=YANgm3pBNGWq5hea7w7mZq5Si4N6AwN9U2UapNB0Oj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EcwwF4LegMMoeikxnvt53XmKjm/wGpKo3HNrGsKwiR2L4HHQ5RkiCLQ4A//5YY6vo
	 vynUD2tV71TttHY03iA29yIhThvFvoeWHwD1GG89rVi+oRpJ8eHywwFqbDlu8GdNRL
	 xj0P5Z+2jPoPAPq0Y2aYipxQptrju3IjGlctajDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46B9DF8057D; Wed,  1 Nov 2023 08:27:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B42CDF8057B;
	Wed,  1 Nov 2023 08:27:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07E50F8057C; Wed,  1 Nov 2023 08:27:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30FF2F80571
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 08:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30FF2F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lgdM1r//
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3b566ee5f1dso851797b6e.0
        for <alsa-devel@alsa-project.org>;
 Wed, 01 Nov 2023 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698823656; x=1699428456;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZNGCp85Sb48vfGGEHxxzRTqvObGu/JMazz3oNhyWMw=;
        b=lgdM1r//72YqNVMkNIgiVd6lJpg+Rxrzk/7nfz/ZDTrzeB2/s9DXHz3yBODkgQC/ht
         whf0Fxv/HRH/ZBQvwuDPZQ/zDFoknW5x0QIfDKb3bXvLF76nkNzUmdwJMYP1Hn7hS7XV
         t54hTNOs53y1V5rkelZGDQsCVhJ/AkFqddgwLe8OID3gl1B7YGvM8/Z306j1FF8udG8/
         bmtENNipeQSyXVXsR+q2VEmcie6O1JYzqWLzrYN5Rtf+NO6c+yeaFyeUpk28asaWkDp0
         dSwImbM9l+OO7axOp36JkPQbZSgate7azOAYmGSgXZNd2/4a5Q1j8jtuoGko/PyD91dG
         yp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698823656; x=1699428456;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZNGCp85Sb48vfGGEHxxzRTqvObGu/JMazz3oNhyWMw=;
        b=n8/1N6L0wRbaude+ufaKttNV0OoO641O8mj6AQS9XXwf98tUkk9rZQ2imoEhg9XsKs
         /rGN9dQg/XIlJDzrQUyhEz1EdxX+a2lTIsJj/eZr3eOTV2gPf7dDy8Lz19EXexK+1mju
         se+CgdFcpZsGHcSrUIrW8ZJ3U+qLYGMrh/33t824ygRpp52Hchl9X4fpD74WOiwmvAib
         CUFipVbCJi6ZZ7B85aA3u4tKtvK6Is20u/gMMHgBu3ynaL4DKRyLB/UgW9Wr4zk5Jgfx
         jOXn0JHy9dX28ruHhWLl+tsCSgRhr6GbzWP+m2s9wAYhMGnAobwloEHslsYrF/pSUhKy
         2VJQ==
X-Gm-Message-State: AOJu0YyZAUyYfYE69YV800Dck61ce4whiPLg4WgWTwcRNEWNeR+wOZ7K
	EupMzzM3dFrO2mw3yNVX8i6AVeGpneZnFw==
X-Google-Smtp-Source: 
 AGHT+IGVlCw/7yhoJ5158FLbE6oO85lGChc8Mb6BOq9VGxKakGsQroTzb/ZUxKuMku0ybhY0ZuUqwg==
X-Received: by 2002:a05:6808:14c4:b0:3b5:663c:9b91 with SMTP id
 f4-20020a05680814c400b003b5663c9b91mr4632048oiw.12.1698823655594;
        Wed, 01 Nov 2023 00:27:35 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 t23-20020aa78f97000000b0068ff0a633fdsm686124pfs.131.2023.11.01.00.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 00:27:35 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 2/3] ASoC: codecs: ES8326: Changing initialisation and
 broadcasting
Date: Wed,  1 Nov 2023 15:27:01 +0800
Message-Id: <20231101072702.91316-3-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231101072702.91316-1-zhuning0077@gmail.com>
References: <20231101072702.91316-1-zhuning0077@gmail.com>
Message-ID-Hash: 7XXTUQG7EWYY2YBT6C4SJWJMWZDJFAXN
X-Message-ID-Hash: 7XXTUQG7EWYY2YBT6C4SJWJMWZDJFAXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XXTUQG7EWYY2YBT6C4SJWJMWZDJFAXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    New chip versions require new initialisation and playback processes.
    Changing the initialisation and playback process for better results.
    The old chip versions are going to work well with the new sequences.
    We've tested this with version_v0 and version_v3 chips
    under the new sequence and they both pass.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 51 ++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 7400c3d8af23..772788811197 100755
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
@@ -307,7 +315,6 @@ static inline int get_coeff(int mclk, int rate, int array,
 	return -EINVAL;
 }
 
-
 static int es8326_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 				 int clk_id, unsigned int freq, int dir)
 {
@@ -449,8 +456,8 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
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
@@ -470,8 +477,6 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		if (ret)
 			return ret;
 
-		regmap_write(es8326->regmap, ES8326_RESET, 0x9f);
-		msleep(20);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
 		regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
@@ -480,19 +485,21 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
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
@@ -762,13 +769,15 @@ static int es8326_calibrate(struct snd_soc_component *component)
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
 
@@ -806,27 +815,27 @@ static int es8326_resume(struct snd_soc_component *component)
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
@@ -840,9 +849,6 @@ static int es8326_resume(struct snd_soc_component *component)
 	/* set ADC and DAC in low power mode */
 	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
 
-	/* force micbias on */
-	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0x4f);
-	regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x08);
 	regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7F);
 	/* select vdda as micbias source */
 	regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x23);
@@ -870,6 +876,7 @@ static int es8326_resume(struct snd_soc_component *component)
 			((es8326->version == ES8326_VERSION_B) ?
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
+	regmap_write(es8326->regmap, ES8326_HP_VOL, 0x11);
 
 	es8326->jack_remove_retry = 0;
 	es8326->hp = 0;
-- 
2.17.1

