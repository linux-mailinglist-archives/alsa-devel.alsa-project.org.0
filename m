Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE047752FED
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 05:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11A6EDF1;
	Fri, 14 Jul 2023 05:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11A6EDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689305266;
	bh=lx4zJIhH/mz5tDxICKaknRBims/nhtBBp0BCb5nWwL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c01AIWU3xg3VqcQqc8KH+2bmNkua09825KDt/B4lox3AVuaL97KfHepVDsddEUPu7
	 PsVh34Rkx9QZw3bIuiIknjQqCcFMHL5Vzv5Ra1XkHjTqQZKC55qCaqf3Q5xh93YJ6W
	 zdGF0Rfwz5Cdz5vEq2606x8QAAonFV5IY+Xe83go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03762F80579; Fri, 14 Jul 2023 05:26:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34932F8055B;
	Fri, 14 Jul 2023 05:26:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00B28F80153; Fri, 14 Jul 2023 05:25:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADBB1F80249
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 05:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADBB1F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lYx7mbO9
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-262dc1ced40so924830a91.3
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 20:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689305106; x=1691897106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1sZYpHNwHCNEFRw1rqvEwmWszqBq8c1n0mQ8Bp/6Hs=;
        b=lYx7mbO9hvWRGLtsOM/bbU7zSeOY4ixWsocQNp7BvRBdwb/aAV57YIGTxsoZfYH+Co
         SPi65KRqZPvi0kTQ0dtwmmPge05rnbxA35xkYu5b2Pt5fe+byPFgvu8hJjvJrUJ0F/9D
         r0t4k29f9wkBmIyj+CqXsT34A8bqCz+OYDmhNw9VxJ1UXP8YpqCAOIUNhDWGJY7S85S+
         6/yn90fYxHoA5NAw5foSTyE8RfzkOFM6555eGmc1IzbsHy/oGbL5kkrFzHRkKFDTaGYn
         o7XgvrbaFOY2vf8qMGEx0bSfcVTbnANaJy3NOpE5aEai0pcqoHt0n1+GgoAniwtqaVkS
         OrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689305106; x=1691897106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1sZYpHNwHCNEFRw1rqvEwmWszqBq8c1n0mQ8Bp/6Hs=;
        b=lU61TNuGAJOykf6lD112j5XE9uPZFa5wnbe+0PG0XnrqSoCmjnPNqxcIfigm6j+KtD
         PSgMqpvylVvKUVhricH6w1AWHClAFh25dCvhvivaHYmvJbsBLnEbrYT56eXipeAUZCg7
         w96QfoCaaqF32s5FdQ5KTFecrC3PAju8qEqO70Fh9zM1hOBC+pyuS7s2gmT0bJes4ULe
         jgCPV4ANO692VRBGSncINp4swktS69mMtJIC9qky7w+wdHYHe72txi4Z5AYL1uWzA0zD
         qgsDS5P9NxXdVDdSP6SUsz3rcD+10E66xVc/po6LzxPRuzmKVQmsbYT5j7Op3h3ummsc
         XNeQ==
X-Gm-Message-State: ABy/qLa3D7E2bkbkp1NsdKlJKPV1sipp/6HXGct5H3kRDNoNRwG8bpwr
	hCim0VkJUcltVEC7MYJU49TwdToaNmW3ChOa
X-Google-Smtp-Source: 
 APBJJlFjmqR9wt3Dyl26mV7bvm/W7Us98ihUUuwIC+mNztaNrX564HFHVyvSOJPYViMenOw0PXA2FQ==
X-Received: by 2002:a17:90b:118:b0:24e:4b1c:74d2 with SMTP id
 p24-20020a17090b011800b0024e4b1c74d2mr3238109pjz.32.1689305106303;
        Thu, 13 Jul 2023 20:25:06 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a17090b018300b00262d6ac0140sm216016pjs.9.2023.07.13.20.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 20:25:06 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 3/5] ASoC: codecs: ES8326: Fix power-up sequence
Date: Fri, 14 Jul 2023 11:24:51 +0800
Message-Id: <20230714032453.3334-3-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714032453.3334-1-zhuning0077@gmail.com>
References: <20230714032453.3334-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G27ZCTGQO3UGLNQPMNNJIFO5O6ENJI2M
X-Message-ID-Hash: G27ZCTGQO3UGLNQPMNNJIFO5O6ENJI2M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G27ZCTGQO3UGLNQPMNNJIFO5O6ENJI2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Old power-up sequence causes large pop noise during start-up.
Using a new sequence instead.

Also, the registers are now reset to default value in suspend
function.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 97 ++++++++++++++++++++++++++++-----------
 sound/soc/codecs/es8326.h | 10 +++-
 2 files changed, 78 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 8c78f0bf514b..653b09600887 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -522,9 +522,9 @@ static void es8326_jack_button_handler(struct work_struct *work)
 
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
-
 	mutex_lock(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
+
 	switch (iface) {
 	case 0x93:
 		/* pause button detected */
@@ -638,40 +638,77 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 static int es8326_resume(struct snd_soc_component *component)
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
-	unsigned int reg;
 
 	regcache_cache_only(es8326->regmap, false);
 	regcache_sync(es8326->regmap);
 
+	/* reset internal clock state */
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
+	regmap_write(es8326->regmap, ES8326_INT_SOURCE,
+		    (ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
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
@@ -688,6 +725,10 @@ static int es8326_suspend(struct snd_soc_component *component)
 	regcache_cache_only(es8326->regmap, true);
 	regcache_mark_dirty(es8326->regmap);
 
+	/* reset register value to default */
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
+	usleep_range(1000, 3000);
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
 	return 0;
 }
 
@@ -717,7 +758,7 @@ static int es8326_probe(struct snd_soc_component *component)
 	ret = device_property_read_u8(component->dev, "everest,jack-pol", &es8326->jack_pol);
 	if (ret != 0) {
 		dev_dbg(component->dev, "jack-pol return %d", ret);
-		es8326->jack_pol = ES8326_HP_DET_BUTTON_POL | ES8326_HP_TYPE_OMTP;
+		es8326->jack_pol = ES8326_HP_TYPE_AUTO;
 	}
 	dev_dbg(component->dev, "jack-pol %x", es8326->jack_pol);
 
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 6cb8e3ed76e3..868a3f528b14 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -160,6 +160,13 @@
 #define ES8326_HP_TYPE_AUTO	(1 << 0)
 #define ES8326_HP_TYPE_AUTO_INV	(0 << 0)
 
+/* ES8326_INT_SOURCE */
+#define ES8326_INT_SRC_DAC_MOZ (1 << 0)
+#define ES8326_INT_SRC_ADC_MOZ (1 << 1)
+#define ES8326_INT_SRC_BUTTON (1 << 2)
+#define ES8326_INT_SRC_PIN9 (1 << 3)
+#define ES8326_INT_SRC_PIN27 (1 << 4)
+
 /* ES8326_SDINOUT1_IO */
 #define ES8326_IO_INPUT	(0 << 0)
 #define ES8326_IO_SDIN_SLOT0 (1 << 0)
@@ -183,7 +190,8 @@
 #define ES8326_HPBUTTON_FLAG (1 << 0)
 
 /* ES8326_CHIP_VERSION 0xFF */
-#define ES8326_VERSION_B (1 << 0)
+#define ES8326_VERSION (1 << 0)
+#define ES8326_VERSION_B (3 << 0)
 
 #endif
 
-- 
2.34.1

