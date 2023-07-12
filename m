Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A387500D8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 10:10:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 247FD843;
	Wed, 12 Jul 2023 10:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 247FD843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689149437;
	bh=QoC4LmEeLO9bidHaIjCrJhGprZJWeZV0pvVZGVVkXaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DJcIhr6aEMWclO4YDp/GtUsvs4tl8BMySlTFnmTfP9GmKECY+n9dCIhzgrsJ7uPzW
	 DBtUIOEbPIr91XOF3iDpewOq+gTVqRTA8yH1QMQozlEMDjJLjcHZOtBpCn446h1vNG
	 CjoEKXMnNb2nf9O681BkXsVZYDkjkqG6OCEsW6so=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14EADF8055A; Wed, 12 Jul 2023 10:08:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D4C5F80553;
	Wed, 12 Jul 2023 10:08:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7752F8027B; Wed, 12 Jul 2023 10:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A2CCF800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 10:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A2CCF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=piXw1AVM
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-66869feb7d1so3669607b3a.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689149324; x=1691741324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XcPoCIPEymFxD+qRV/I+hxidD4oqFTNgSpdqCNbubE=;
        b=piXw1AVMZflk4oS2CbIPO+6uV6rMpGjUo41NZ5rHjlmYmYtuwMMOhMvEIbTUIBA8t9
         EBsAsMjlozHiEurkGCEyxBL3gYrnh/yJsuik5PhyanISi2xPiaWHwG5oKtU/V4xRQcyK
         JxLo+31EhfeOCl53XY4YHctsO4/H9aYV0wAMeg5DcAKygLb8H8CIri7yBpRUg5fmxaAL
         FVsWfM9UVOyhMGys00w8THFtMadTHWAsoEn+UzOkBq7aE+tAhI7N320cJ0bD8ujOMNHa
         Crw6RttYsQv1HlL2a2jpp+VIw1XR+pTNViL9bcdumFA1oqrXNI0LAgfEFgeNdQVBeFky
         /nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689149324; x=1691741324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XcPoCIPEymFxD+qRV/I+hxidD4oqFTNgSpdqCNbubE=;
        b=M0UHwE1vYCMK4U1iYymRvzgWFh8t9ix6R//pkv+Y9Z9kpHNvTzuaeU3q1QPjqTF9ZX
         UxyKeu6b3fBKWuP61r7kMMBucLumSFRJZawI3PgdtJh44zyMeCHWEH9k3oa63POSx5bX
         x+tG1e48lY0AO2Ub1eop+Lyf7YwZ2OdjbgziIE+YcOl/g6oRQonjVgaZM+TxPTGIJmNX
         J8283Fp20Jrhp0oITmiuq8w2oJL+3DxDI2Z2qHigi5dH33w34bGMu3Uda5JOhLErZOgK
         6+W2Az2xzczHvJ3Eba75fNUFAihOjqUKGumkol2XvFeuTqAJ5NkVW/snxjmEAMMdLmFO
         40Wg==
X-Gm-Message-State: ABy/qLaVHrrV2GLePCEV7/+6JePFuzPVVN+DFRId5rRv+saAuvkPMCKT
	2fKbSi7VJARKGKc8VqniyCOtQ2wKfvl9VsQO
X-Google-Smtp-Source: 
 APBJJlEz86DUY/cjvxRRF+Vzyv0fR9PiK0TmtAMbvAIctMc1PyiM3SCEJnnfNgpozRXNyoWqNcptTQ==
X-Received: by 2002:a05:6a20:4ce:b0:12c:9518:7899 with SMTP id
 14-20020a056a2004ce00b0012c95187899mr12949610pzd.24.1689149324096;
        Wed, 12 Jul 2023 01:08:44 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a170903018a00b001b3f9a5d4besm3285962plg.255.2023.07.12.01.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:08:43 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 3/4] ASOC: codecs: ES8326: Add calibration support for
 version_b
Date: Wed, 12 Jul 2023 16:08:29 +0800
Message-Id: <20230712080830.973766-3-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712080830.973766-1-zhuning0077@gmail.com>
References: <20230712080830.973766-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DYQLULXJ2PVYRBZZOGEANYWOGWQ7APTD
X-Message-ID-Hash: DYQLULXJ2PVYRBZZOGEANYWOGWQ7APTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYQLULXJ2PVYRBZZOGEANYWOGWQ7APTD/>
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
 sound/soc/codecs/es8326.c | 106 +++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index d801c8e285e2..4fc5190d8494 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -158,20 +158,25 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 	{"HPOR", NULL, "RHPMIX"},
 };
 
-static const struct regmap_range es8326_volatile_ranges[] = {
-	regmap_reg_range(ES8326_HPDET_TYPE, ES8326_HPDET_TYPE),
-};
-
-static const struct regmap_access_table es8326_volatile_table = {
-	.yes_ranges = es8326_volatile_ranges,
-	.n_yes_ranges = ARRAY_SIZE(es8326_volatile_ranges),
-};
+static bool es8326_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES8326_HPL_OFFSET_INI:
+	case ES8326_HPR_OFFSET_INI:
+	case ES8326_HPDET_STA:
+	case ES8326_CTIA_OMTP_STA:
+	case ES8326_CSM_MUTE_STA:
+		return true;
+	default:
+		return false;
+	}
+}
 
 static const struct regmap_config es8326_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0xff,
-	.volatile_table = &es8326_volatile_table,
+	.volatile_reg = es8326_volatile_register,
 	.cache_type = REGCACHE_RBTREE,
 };
 
@@ -383,6 +388,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int offset_l, offset_r;
 
 	if (mute) {
 		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
@@ -393,10 +399,16 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (!es8326->calibrated) {
 			regmap_write(es8326->regmap, ES8326_HP_CAL, 0x88);
 			msleep(30);
+			regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
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
 		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x77);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 				ES8326_MUTE_MASK, ~(ES8326_MUTE));
@@ -415,15 +427,17 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
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
@@ -432,15 +446,10 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
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
 
@@ -630,6 +639,54 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
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
+		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x00);
+		regmap_read(es8326->regmap, ES8326_CSM_MUTE_STA, &reg);
+		if ((reg & 0xf0) != 0x40)
+			msleep(50);
+
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0xd4);
+		msleep(200);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x4d);
+		msleep(200);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
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
@@ -672,7 +729,8 @@ static int es8326_resume(struct snd_soc_component *component)
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

