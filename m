Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89117500D9
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 10:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC896850;
	Wed, 12 Jul 2023 10:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC896850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689149438;
	bh=ck9++4Sm2DyvHJDcivPfb2m4nq244+/mZPRgmpIwrMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FVigneGHIZuSY2quF2K3PeJ+ok6+k+yIvp1z7WaFxoj8AtEDnXMlBFrXcf7oMtYNz
	 QZdklevzMWz3ahR1d8uYonjT50Uijnzh6sk+ZymhlaYEuFPs8bgQwZDhIuD2UafRYo
	 /bVq/+wqsAKvZEEhwNQ5QA2ojdR7yG1nMHQbtBtI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D77F80578; Wed, 12 Jul 2023 10:09:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA3C8F8055B;
	Wed, 12 Jul 2023 10:09:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C9AAF8053B; Wed, 12 Jul 2023 10:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8731F80236
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 10:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8731F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=PefpH8UI
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6686a05bc66so3940397b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689149321; x=1691741321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzihyLoEi4Pp/4qx9Tt2UMrAtISAM2ju8TKaI+lAUc8=;
        b=PefpH8UIkLwJdJl93Qup9gguQdiqQX+fJTS7vPg8vnd5ymihwcjMtAE/iNu5fEia0q
         nAyU8+2QQzhP8gQQyq2FoaSZtjODqVWCUz/lkK7Fz/U+z8EQGQ74g5iFCI+A4Uy0THi3
         MJHbSnbLc1rvW0xF23CiFJb3ixAH8YGA1NqeGNRYCmOs7mXFfLGechtJ1oyABHMqxi/N
         DeuB02gtKIrxvl4tpjkPSjQOUGsIiFRR7QnaNhARW8DdCV8wqcxKVFkomfsz6hmEjize
         Ls+GUbuSkfE8J3M0V8ZcQML/UzfT8aAWTpxmHLCHNa3hF8vzMv723uMARaa63t/iuiHx
         ITBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689149321; x=1691741321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzihyLoEi4Pp/4qx9Tt2UMrAtISAM2ju8TKaI+lAUc8=;
        b=df1sccYnKQE5EpHmFwJhB0l/G2Wx0MxS1uNcvnK9bOrIS0coViAJ6/OcONlZd1t4lK
         YVsBQD8Dgv9lW7LW567mGZwA8lJhvV9fvjg7C8FB0vf96IZnW6oQLGwA8nIgQm9du5wj
         Z/f6S3RNxGuqwxV2Fk8d66gxjmw+OjUcWZPsiZMjhfSEAu37NTwOjgmtRc/p9NFcbxRw
         RRCUZgi9cnNnjPfanJIPx1+6e2m6KAg/ZL6wCqYPgK/Qp53kWdMfh5gWH329DFN036Wf
         v3iMXJVKMa8xDEynujo6ou7IM6dYcMGCsfQsHw0ejf9GOzV6/jHdZO7bEMBWJZlaOJPK
         z5Sw==
X-Gm-Message-State: ABy/qLYMgwHyxzTt5Tp3V+/4PaXpIy1Vgz6KxUkbMjbSw1U/N+Qb+8xN
	+PGJIgXZ40bAWWlUaMAbt32dw0F+BpsuuvfV
X-Google-Smtp-Source: 
 APBJJlFZqUnl9jqan9oPw8UMxIT+znacI1I01842QaVrwclkGSyi7tljsKODOVBK5Z/6MEcs7fufHw==
X-Received: by 2002:a05:6a20:5481:b0:125:a429:a19c with SMTP id
 i1-20020a056a20548100b00125a429a19cmr17761254pzk.48.1689149321296;
        Wed, 12 Jul 2023 01:08:41 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a170903018a00b001b3f9a5d4besm3285962plg.255.2023.07.12.01.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:08:41 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 2/4] ASoC: codecs: es8326: Fix power-up sequence
Date: Wed, 12 Jul 2023 16:08:28 +0800
Message-Id: <20230712080830.973766-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712080830.973766-1-zhuning0077@gmail.com>
References: <20230712080830.973766-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G34WEHPTTUNCH4TFVH4SKXWHA74SXMXW
X-Message-ID-Hash: G34WEHPTTUNCH4TFVH4SKXWHA74SXMXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G34WEHPTTUNCH4TFVH4SKXWHA74SXMXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Old power-up sequence causes large pop noise during start-up.
Using a new sequence instead.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 102 ++++++++++++++++++++++++++------------
 sound/soc/codecs/es8326.h |  11 ++--
 2 files changed, 79 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 9190a8779334..d801c8e285e2 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -159,7 +159,7 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 };
 
 static const struct regmap_range es8326_volatile_ranges[] = {
-	regmap_reg_range(ES8326_HP_DETECT, ES8326_HP_DETECT),
+	regmap_reg_range(ES8326_HPDET_TYPE, ES8326_HPDET_TYPE),
 };
 
 static const struct regmap_access_table es8326_volatile_table = {
@@ -519,7 +519,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		return;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_TYPE);
 	switch (iface) {
 	case 0x93:
 		/* pause button detected */
@@ -578,7 +578,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	unsigned int iface;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_TYPE);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
 		/* Jack unplugged or spurious IRQ */
@@ -633,40 +633,80 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 static int es8326_resume(struct snd_soc_component *component)
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
-	unsigned int reg;
 
 	regcache_cache_only(es8326->regmap, false);
 	regcache_sync(es8326->regmap);
 
+	/* reset register value to default */
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
+	usleep_range(1000, 3000);
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
+	/* reset internal state */
+	regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
+	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
+	usleep_range(10000, 15000);
+	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0x88);
+	/* set headphone default type and detect pin */
+	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x81);
+	regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
+
+	/* set internal oscillator as clock source of headpone cp */
+	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC, 0x84);
 	regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_ON);
-	/* Two channel ADC */
-	regmap_write(es8326->regmap, ES8326_PULLUP_CTL, 0x02);
+	/* clock manager reset release */
+	regmap_write(es8326->regmap, ES8326_RESET, 0x17);
+	/* set headphone detection as half scan mode */
+	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x08);
+	regmap_write(es8326->regmap, ES8326_PULLUP_CTL, 0x00);
+
+	/* enable headphone driver */
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa7);
+	usleep_range(2000, 5000);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xab);
+	usleep_range(2000, 5000);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xbb);
+	usleep_range(2000, 5000);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
+
 	regmap_write(es8326->regmap, ES8326_CLK_INV, 0x00);
-	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC, 0x1F);
-	regmap_write(es8326->regmap, ES8326_CLK_VMIDS1, 0xC8);
-	regmap_write(es8326->regmap, ES8326_CLK_VMIDS2, 0x88);
-	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME, 0x20);
+	regmap_write(es8326->regmap, ES8326_CLK_VMIDS1, 0xc4);
+	regmap_write(es8326->regmap, ES8326_CLK_VMIDS2, 0x81);
+	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME, 0x00);
+
+	/* turn off headphone out */
+	regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
+	/* set ADC and DAC in low power mode */
+	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
+
+	/* force micbias on */
+	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0x4f);
 	regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x08);
-	regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x22);
-	regmap_write(es8326->regmap, ES8326_ADC1_SRC, es8326->mic1_src);
-	regmap_write(es8326->regmap, ES8326_ADC2_SRC, es8326->mic2_src);
-	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0x88);
-	regmap_write(es8326->regmap, ES8326_HP_DET,
-		     ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol);
-	regmap_write(es8326->regmap, ES8326_INT_SOURCE, es8326->interrupt_src);
-	regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
+	regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7F);
+	/* select vdda as micbias source */
+	regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x23);
+	/* set dac dsmclip = 1 */
+	regmap_write(es8326->regmap, ES8326_DAC_DSM, 0x08);
+	regmap_write(es8326->regmap, ES8326_DAC_VPPSCALE, 0x15);
+
+	regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x0c);
+	regmap_write(es8326->regmap, ES8326_INTOUT_IO,
+		     es8326->interrupt_clk);
+	regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
+		    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
+	regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
+
+	regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
 	regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_ON);
-	snd_soc_component_update_bits(component, ES8326_PGAGAIN,
-				      ES8326_MIC_SEL_MASK, ES8326_MIC1_SEL);
-
-	regmap_read(es8326->regmap, ES8326_CHIP_VERSION, &reg);
-	if ((reg & ES8326_VERSION_B) == 1) {
-		regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0xDD);
-		regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7F);
-		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x0F);
-		/* enable button detect */
-		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xA0);
-	}
+	regmap_update_bits(es8326->regmap, ES8326_PGAGAIN, ES8326_MIC_SEL_MASK,
+			   ES8326_MIC1_SEL);
+
+	regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE, ES8326_MUTE_MASK,
+			   ES8326_MUTE);
+
+	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x80 |
+			((es8326->version == ES8326_VERSION_B) ?
+			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
+			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
 
 	es8326_irq(es8326->irq, es8326);
 	return 0;
@@ -712,7 +752,7 @@ static int es8326_probe(struct snd_soc_component *component)
 	ret = device_property_read_u8(component->dev, "everest,jack-pol", &es8326->jack_pol);
 	if (ret != 0) {
 		dev_dbg(component->dev, "jack-pol return %d", ret);
-		es8326->jack_pol = ES8326_HP_DET_BUTTON_POL | ES8326_HP_TYPE_OMTP;
+		es8326->jack_pol = ES8326_HP_TYPE_AUTO;
 	}
 	dev_dbg(component->dev, "jack-pol %x", es8326->jack_pol);
 
@@ -743,7 +783,7 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 
 	mutex_lock(&es8326->lock);
 	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HP_DET,
+		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
 					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
 	es8326->jack = jack;
 
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index b837ed8c4b39..9093222ae04d 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -73,15 +73,19 @@
 #define ES8326_DRC_RECOVERY	0x53
 #define ES8326_DRC_WINSIZE	0x54
 #define ES8326_HPJACK_TIMER	0x56
-#define ES8326_HP_DET		0x57
+#define ES8326_HPDET_TYPE	0x57
 #define ES8326_INT_SOURCE	0x58
 #define ES8326_INTOUT_IO	0x59
 #define ES8326_SDINOUT1_IO	0x5A
 #define ES8326_SDINOUT23_IO	0x5B
 #define ES8326_JACK_PULSE	0x5C
 
+#define ES8326_HP_MISC		0xF7
+#define ES8326_CTIA_OMTP_STA	0xF8
 #define ES8326_PULLUP_CTL	0xF9
-#define ES8326_HP_DETECT	0xFB
+#define ES8326_CSM_I2C_STA	0xFA
+#define ES8326_HPDET_STA	0xFB
+#define ES8326_CSM_MUTE_STA	0xFC
 #define ES8326_CHIP_ID1		0xFD
 #define ES8326_CHIP_ID2		0xFE
 #define ES8326_CHIP_VERSION	0xFF
@@ -177,7 +181,8 @@
 #define ES8326_HPBUTTON_FLAG (1 << 0)
 
 /* ES8326_CHIP_VERSION 0xFF */
-#define ES8326_VERSION_B (1 << 0)
+#define ES8326_VERSION (1 << 0)
+#define ES8326_VERSION_B (3 << 0)
 
 #endif
 
-- 
2.34.1

