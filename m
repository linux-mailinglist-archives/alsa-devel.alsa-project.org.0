Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E650752FEF
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 05:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F4B6868;
	Fri, 14 Jul 2023 05:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F4B6868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689305290;
	bh=LeWbr6vUw5XV0j75ZpPDrpCsWURZV4Wn4JedViGs7/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PCYStFf6JT14KbbldCKup+90BrxkBqbr4zxouEyOE1SCutlVtHdADWmn3MgEjYWh5
	 f4OYuT3HM5lR1oK41oh6vlEqXBr/d6Uszc379ZdMw4FiJefV0CZ64q15/ndD8oZZmR
	 KAL+hnxeOo54lAye/xmQasJK8tzgGx08x1R/1tmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38C92F8057D; Fri, 14 Jul 2023 05:26:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6B7F80571;
	Fri, 14 Jul 2023 05:26:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65515F80249; Fri, 14 Jul 2023 05:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6983F80236
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 05:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6983F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=LVN71Y/f
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a1e6022b93so1157583b6e.1
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 20:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689305109; x=1691897109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnOD2Qquv+F8vc31QLyEZCHMqA+7uMa1rab5Dzyjz/s=;
        b=LVN71Y/fDcmMNI+CWbg2mLZvOMzC2pWxNqKxL6SWeDYdtG/KzhPgMJ7HOg6L/GNNJA
         buvpOxoNKjv4NMeKITGRkq2GjNsuPCAFrDQZGNwm2mrZ8P9XKh4ZfG1AP9P20drOkwsh
         cmn/DnnyJ+Q8lpUvxPzN77Sk5NFQs1smyHSdrj56bF6TpBdrghpZIX/ZA4iKH0q14s7m
         /TBcKJf6bDWLu0Q31ZPiuyW9i6z3aFeeIH8GqTRUIMHhf8E0FJ+4ZZdR8OuJ1dR0G3pb
         2KTN3wHw+UxTulL2xXy3JJbOEAEq3Jf5GqsNckF1RZ4tdmC6WhbILyDmRBCzS/RUN0XB
         kPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689305109; x=1691897109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnOD2Qquv+F8vc31QLyEZCHMqA+7uMa1rab5Dzyjz/s=;
        b=KPPkFgLHHlrDjw1Gxo/tPjUV+/VGrQcB+8ILfxL6D9h+L3CD1m7uVPcSYppli5dZXa
         wR8wbrMQfBMSncH9HfMDKh1K2z4Ke0CNW3TzJAPILYLePjgNTOyO43/IxQGI4sZyFlu3
         vld0m1yGrWjdyMRWAIjgad63ztvNkdVtVGu52rdhq3gGQqmPlXk3meerq+qAMDvWCara
         /bOdc59gBzcjvlIJs9WVIEE8UEL/jwAms9dg12ukyM59/B4oaXHUVlWCTK+deHy9kig6
         iFPBqz5Vj2xcuMmc8t/Jlxh+RIeN752bJXmZBkpYrYKR2CoHN6keZlFP5p77vv0wPC+3
         BGcw==
X-Gm-Message-State: ABy/qLb5IAMy4yH2H8Dkz1oG0M0mnU/G43zVhyLhuDWvD0vQQM64YbOd
	P/4jD+/rA3NMZ5wiTo/njMvcR1fSViaBVGG5
X-Google-Smtp-Source: 
 APBJJlELY0TBuiDumYJ8U6NAHgA7YLS/rguKD8nktHt7hldxQDzN0dRJpp1UDNLN0Z/4tKForhnS/g==
X-Received: by 2002:a05:6808:13c4:b0:3a3:9041:90fb with SMTP id
 d4-20020a05680813c400b003a3904190fbmr4480208oiw.14.1689305108843;
        Thu, 13 Jul 2023 20:25:08 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a17090b018300b00262d6ac0140sm216016pjs.9.2023.07.13.20.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 20:25:08 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 4/5] ASOC: codecs: ES8326: Add calibration support for
 version_b
Date: Fri, 14 Jul 2023 11:24:52 +0800
Message-Id: <20230714032453.3334-4-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714032453.3334-1-zhuning0077@gmail.com>
References: <20230714032453.3334-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RRSV3UJ2YM5QYZMWEAB7KTNRLJVMU4FK
X-Message-ID-Hash: RRSV3UJ2YM5QYZMWEAB7KTNRLJVMU4FK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRSV3UJ2YM5QYZMWEAB7KTNRLJVMU4FK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Version_b requires a new way of calibrating headset offset. A new
calibration function is added.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 83 ++++++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 653b09600887..0474bfd79aa5 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -388,6 +388,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int offset_l, offset_r;
 
 	if (mute) {
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
@@ -398,10 +399,16 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (!es8326->calibrated) {
 			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_FORCE_CAL);
 			msleep(30);
+			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
+			regmap_read(es8326->regmap, ES8326_HPL_OFFSET_INI, &offset_l);
+			regmap_read(es8326->regmap, ES8326_HPR_OFFSET_INI, &offset_r);
+			regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
+			regmap_write(es8326->regmap, ES8326_HPL_OFFSET_INI, offset_l);
+			regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
 			es8326->calibrated = true;
 		}
 		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa0);
-		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x00);
+		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x80);
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_ON);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 				ES8326_MUTE_MASK, ~(ES8326_MUTE));
@@ -420,15 +427,17 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		ret = clk_prepare_enable(es8326->mclk);
 		if (ret)
 			return ret;
-		regmap_write(es8326->regmap, ES8326_RESET, ES8326_PWRUP_SEQ_EN);
-		regmap_write(es8326->regmap, ES8326_INTOUT_IO, 0x45);
+
+		regmap_write(es8326->regmap, ES8326_RESET, 0x9f);
+		msleep(20);
+		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
+		regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
 			    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
-		regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
-		regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
-		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x02);
+		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
 		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0x40);
-		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0xAA);
+		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x00);
+		regmap_update_bits(es8326->regmap,  ES8326_CLK_CTL, 0x20, 0x20);
 		regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_ON);
 		break;
 	case SND_SOC_BIAS_PREPARE:
@@ -437,15 +446,10 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		break;
 	case SND_SOC_BIAS_OFF:
 		clk_disable_unprepare(es8326->mclk);
-		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x11);
-		regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_OFF);
-		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0xF8);
+		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
 		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x00);
-		regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x08);
+		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
-		regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
-		regmap_write(es8326->regmap, ES8326_RESET,
-			     ES8326_CODEC_RESET | ES8326_PWRUP_SEQ_EN);
 		break;
 	}
 
@@ -635,6 +639,54 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int es8326_calibrate(struct snd_soc_component *component)
+{
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int reg;
+	unsigned int offset_l, offset_r;
+
+	regmap_read(es8326->regmap, ES8326_CHIP_VERSION, &reg);
+	es8326->version = reg;
+
+	if ((es8326->version == ES8326_VERSION_B) && (es8326->calibrated == false)) {
+		dev_dbg(component->dev, "ES8326_VERSION_B, calibrating\n");
+		regmap_write(es8326->regmap, ES8326_CLK_INV, 0xc0);
+		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x01);
+		regmap_write(es8326->regmap, ES8326_CLK_DLL, 0x30);
+		regmap_write(es8326->regmap, ES8326_CLK_MUX, 0xed);
+		regmap_write(es8326->regmap, ES8326_CLK_TRI, 0xc1);
+		regmap_write(es8326->regmap, ES8326_DAC_MUTE, 0x03);
+		regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7f);
+		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x33);
+		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x88);
+		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x80);
+		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
+		regmap_write(es8326->regmap, ES8326_RESET, 0xc0);
+		usleep_range(15000, 20000);
+
+		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, ES8326_HP_OFF);
+		regmap_read(es8326->regmap, ES8326_CSM_MUTE_STA, &reg);
+		if ((reg & 0xf0) != 0x40)
+			msleep(50);
+
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0xd4);
+		msleep(200);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x4d);
+		msleep(200);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
+		regmap_read(es8326->regmap, ES8326_HPL_OFFSET_INI, &offset_l);
+		regmap_read(es8326->regmap, ES8326_HPR_OFFSET_INI, &offset_r);
+		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
+		regmap_write(es8326->regmap, ES8326_HPL_OFFSET_INI, offset_l);
+		regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
+		regmap_write(es8326->regmap, ES8326_CLK_INV, 0x00);
+
+		es8326->calibrated = true;
+	}
+
+	return 0;
+}
+
 static int es8326_resume(struct snd_soc_component *component)
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
@@ -673,7 +725,8 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_CLK_VMIDS1, 0xc4);
 	regmap_write(es8326->regmap, ES8326_CLK_VMIDS2, 0x81);
 	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME, 0x00);
-
+	/* calibrate for B version */
+	es8326_calibrate(component);
 	/* turn off headphone out */
 	regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
 	/* set ADC and DAC in low power mode */
-- 
2.34.1

