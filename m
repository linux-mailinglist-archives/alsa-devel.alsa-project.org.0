Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E498328C7
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F223201;
	Fri, 19 Jan 2024 12:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F223201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663827;
	bh=/pkr9+xZ8Qa17bkZvZ5paQEsHAiTKL2OaIl0xlSNsQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZZqJ6t/IpizDVZ/HjERCyfjYVbL04WqAsskg5DhUhMmXRBCwZpCc1fvS5q1VV6Ajs
	 eUbqooW7zI70Hfz5mqZ1GAGr4YRnFJShPr3dQJFQmNAJN5AIBZmCd/7mVP1tsAbDcn
	 vjtyat6Rikyc7mw94GL7gejzhor/NPk6mj3qCMoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C9EF80587; Fri, 19 Jan 2024 12:29:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4BEF805C7;
	Fri, 19 Jan 2024 12:29:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6449AF801F5; Fri, 19 Jan 2024 12:29:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D59F6F80236
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D59F6F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ervB1nT4
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5986cb7bb61so308845eaf.2
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705663758; x=1706268558;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pIRKL85FnZ07zglYZHqKUrP254oS82SHQ7x66LFSCYc=;
        b=ervB1nT4KYvzJOVaZGHOxuWnpuZJAUBi0nFgdjcMEKzOZy4DDnWoz7MbUhtZolWMlP
         At52Wn6J3XKkCTCvniRwAa4NH6w/Vc2jbGbLNg1TgVMaWy4JoLF8h8jczgpdiBnFQJNH
         jJJHHvDE7lqW3YP6mbKCsM9xJDEUmcTGUvImUHsvv61kc6GuQM8tKiZ3yd0oTMpujVVd
         HO/B8vHV02gIa6LwsJ2Ac8M7XYulxo8S/SZDaWiT8yTh4Ju9BQiF0wA2ThCP2moPYmI6
         Lqwb4vBDnGOXX3ltqMHRBz8PcaV8US5Ec7YtL+IjOsv/lmWIbRpKORn3N0QaTeWOvm/+
         RjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705663758; x=1706268558;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pIRKL85FnZ07zglYZHqKUrP254oS82SHQ7x66LFSCYc=;
        b=jTIE7mg77U9kPZIwO74W2XSNTvxzB2WTipKQNaWJ47qQ6pbfWoAdfj70Gx94cDB2sW
         okSs/KET9L9IZhIWsl54ynjGnmmcO5jkReW1ljopOF9RhtzPumuM5EiTSUPQbY9SXau9
         Po5vSH4BaTZRdRXOl0t24VUkbKg+T24h/a187fHF9FIp9ZW4FJxGPQF5MpFxT4nJQlI+
         J0yVKfNtGsK0aYQp+Z3zzYAvGsfEcKzbqr4TNM/Lbqyn1NMmjFjXaCwV6vj6l/y3F+5c
         SYokB/YRQVeeEFJUkbeuqygO78VOxo4x+IDTmsyrjBsSM3Zef8h97Ipdpjffy+a6Zl9a
         l0rA==
X-Gm-Message-State: AOJu0YyMotMV1cwkxrY/GHRul+8gVDq3bDq4hM1+aldjIWoQ1cFRRkp9
	bY7bFhDdN9Huj00D+ylozxsfvRv5kqRR87tQXXZkX5W8lPphwUq7qqHDFQO4cOzcF/5D
X-Google-Smtp-Source: 
 AGHT+IEu79lL3+mVAjAtQg9LfxckB4AIZhP1P5afw4GzGe5cO9c31EgdYRjBunEzgS9OHeGcpmKjuw==
X-Received: by 2002:a05:6358:8822:b0:175:745e:dbef with SMTP id
 hv34-20020a056358882200b00175745edbefmr3014887rwb.61.1705663758000;
        Fri, 19 Jan 2024 03:29:18 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b006d9b8e1971dsm4884541pff.191.2024.01.19.03.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:29:17 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 2/5] ASoC: codecs: ES8326: Improving the THD+N performance
Date: Fri, 19 Jan 2024 19:28:55 +0800
Message-Id: <20240119112858.2982-3-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240119112858.2982-1-zhuning0077@gmail.com>
References: <20240119112858.2982-1-zhuning0077@gmail.com>
Message-ID-Hash: 3PGSXQDR2JBU5FIPQ63UQBZ3ERYTUCTV
X-Message-ID-Hash: 3PGSXQDR2JBU5FIPQ63UQBZ3ERYTUCTV
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PGSXQDR2JBU5FIPQ63UQBZ3ERYTUCTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    We update the values of some registers in the initialization
    sequence in es8326_resume function to improve THD+N performance.
    THD+N performance decreases if the output level on headphone is
    close to full scale. So we change the register setting in
    es8326_jack_detect_handler function to improve THD+N performance
    if headphone pulgged. Also, the register setting should be restored
    when the headset is unplugged

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 21 +++++++++++++--------
 sound/soc/codecs/es8326.h |  2 +-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 82d1c4f8324c..10157a4bd500 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -752,6 +752,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			es8326->hp = 0;
 		}
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
+		regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x0a);
+		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x03);
 		/*
 		 * Inverted HPJACK_POL bit to trigger one IRQ to double check HP Removal event
 		 */
@@ -777,6 +779,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
+			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
+			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x08);
 			queue_delayed_work(system_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
@@ -846,14 +850,14 @@ static int es8326_calibrate(struct snd_soc_component *component)
 	if ((es8326->version == ES8326_VERSION_B) && (es8326->calibrated == false)) {
 		dev_dbg(component->dev, "ES8326_VERSION_B, calibrating\n");
 		regmap_write(es8326->regmap, ES8326_CLK_INV, 0xc0);
-		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x01);
+		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x03);
 		regmap_write(es8326->regmap, ES8326_CLK_DLL, 0x30);
 		regmap_write(es8326->regmap, ES8326_CLK_MUX, 0xed);
 		regmap_write(es8326->regmap, ES8326_CLK_DAC_SEL, 0x08);
 		regmap_write(es8326->regmap, ES8326_CLK_TRI, 0xc1);
 		regmap_write(es8326->regmap, ES8326_DAC_MUTE, 0x03);
 		regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7f);
-		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x03);
+		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x23);
 		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x88);
 		usleep_range(15000, 20000);
 		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
@@ -894,13 +898,13 @@ static int es8326_resume(struct snd_soc_component *component)
 	/* reset internal clock state */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
 	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
+	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
 	usleep_range(10000, 15000);
 	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0xe9);
-	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0x4b);
+	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0xcb);
 	/* set headphone default type and detect pin */
 	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x83);
 	regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
-	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x30);
 
 	/* set internal oscillator as clock source of headpone cp */
 	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC, 0x89);
@@ -908,14 +912,15 @@ static int es8326_resume(struct snd_soc_component *component)
 	/* clock manager reset release */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x17);
 	/* set headphone detection as half scan mode */
-	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x30);
+	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x3d);
 	regmap_write(es8326->regmap, ES8326_PULLUP_CTL, 0x00);
 
 	/* enable headphone driver */
+	regmap_write(es8326->regmap, ES8326_HP_VOL, 0xc4);
 	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa7);
 	usleep_range(2000, 5000);
-	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xa3);
-	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xb3);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0x23);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0x33);
 	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
 
 	regmap_write(es8326->regmap, ES8326_CLK_INV, 0x00);
@@ -946,7 +951,7 @@ static int es8326_resume(struct snd_soc_component *component)
 		    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
 	regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
 
-	regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
+	regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x00);
 	regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_ON);
 	regmap_update_bits(es8326->regmap, ES8326_PGAGAIN, ES8326_MIC_SEL_MASK,
 			   ES8326_MIC1_SEL);
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index dfef808673f4..4234bbb900c4 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -101,7 +101,7 @@
 #define ES8326_MUTE (3 << 0)
 
 /* ES8326_CLK_CTL */
-#define ES8326_CLK_ON (0x7f << 0)
+#define ES8326_CLK_ON (0x7e << 0)
 #define ES8326_CLK_OFF (0 << 0)
 
 /* ES8326_CLK_INV */
-- 
2.17.1

