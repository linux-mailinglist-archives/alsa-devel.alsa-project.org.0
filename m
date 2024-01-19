Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24E8328CD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:31:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA0984C;
	Fri, 19 Jan 2024 12:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA0984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663876;
	bh=xuDPMoIv7SAAudDgGcVNuwiYOfXIYmkB8eT6qXx5Vwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rIHVveWTjanK4KddJ4PY/vX+Z/IzEhAw9NMSlaqfUKxFBP7RU2gA1DzA40Rkkh53k
	 9by+j0fN7dLrArC6v+DPZal/XkSzR6X5e4Whte/LhMkPLA6aUBTb88Vvy2dwZpPAQZ
	 DLIB6Q/jr3fxGDzzPqWMEv4BWtuzVm7fvmV8elXs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3ACBF80637; Fri, 19 Jan 2024 12:29:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28BB8F80632;
	Fri, 19 Jan 2024 12:29:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9DBDF8060D; Fri, 19 Jan 2024 12:29:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48DB2F805C6
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48DB2F805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZVB8m4d6
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6daf9d5f111so683871b3a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 03:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705663773; x=1706268573;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPFQf5Rvq4xymPBAJnoqpxqqRCx74zAcNbTt6aCN7Mk=;
        b=ZVB8m4d6CgGKzX/Gh5dFlTZ3f4MdQHT5QpNqDAnNcHE019smeybtq0xEJrWzCj1YO5
         UXVkSVtGtmIF9WziHqCR/g7XQEsLgSgL0h++UJCX0uFiYQXWbqbYCasST/xW9aSdJBq1
         BF8InlMRQ4SNPRu2PUd4uVyiYtByiSqC0hVPC6El4OEzEFjtn8P7aIskLuMR3DNr7zbK
         1xfVPAKXXwBx4vidEv5adBI1qKH6LfBcuKuXsV0+x0qhzlsZBljjqUzgwjGWDBrKUvl+
         mIAsrFqj2We/lMqsx1zQ1BYowNNecBm++8/Nn89Ly5wX81A7Tt4v6ZHzvYmB14Y4dFQC
         Ej2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705663773; x=1706268573;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPFQf5Rvq4xymPBAJnoqpxqqRCx74zAcNbTt6aCN7Mk=;
        b=dIFXHINPM8wYnKksxN8f0W5HpEsrnowVaV4ZgUlEqbgg2SEFFomXfuLTpEENPPNu05
         H3XhdJB9Aotk7YFNWJ2xLhdkPW13wUPyzxd1Pco2ucgeP4fF1aKV5a5v/KmGe8kzk6hj
         T1RzHF41AOnzZrq25dLwmgxZ1bdDma1b311gXDYqvzTTvfPY4qUC3VvAAUPYcUNzdofy
         Naq2yDbQaQUCzDssBEo35WhejQb0HuecbXZari41sb0LuQGrlOuQkaAACnRVtUFcGdSJ
         vC4S1WtVyFpcgMjJr1rCiT32dnqeTwDvE0xdyxGVxrTVMcFejpFay/+ewvuBLk8yCHIZ
         No1A==
X-Gm-Message-State: AOJu0Ywj/IYk347CdQlsn3mM24JAJ21iO/GhYpV1868u8qNcgEw/+/6O
	J0X6w8ZUoUYgcPBobwksxmcQcH4NHwP8QE5XyuAsj5Joxrt8cyM2DKruexsysQqEU4uQ
X-Google-Smtp-Source: 
 AGHT+IFXuwMOTnhFlwth1KXqXZT87fZYKesBiC5+2RRssF3Vko+e8L19p8ctmc91HveoDnSFrLITQA==
X-Received: by 2002:a05:6a00:182a:b0:6d9:b112:ef85 with SMTP id
 y42-20020a056a00182a00b006d9b112ef85mr2811280pfa.48.1705663772822;
        Fri, 19 Jan 2024 03:29:32 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b006d9b8e1971dsm4884541pff.191.2024.01.19.03.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:29:32 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 4/5] ASoC: codecs: ES8326: Minimize the pop noise on headphone
Date: Fri, 19 Jan 2024 19:28:57 +0800
Message-Id: <20240119112858.2982-5-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240119112858.2982-1-zhuning0077@gmail.com>
References: <20240119112858.2982-1-zhuning0077@gmail.com>
Message-ID-Hash: LGQZTLACL7JEUJB2DOM2TCSYN3PXBU4Z
X-Message-ID-Hash: LGQZTLACL7JEUJB2DOM2TCSYN3PXBU4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGQZTLACL7JEUJB2DOM2TCSYN3PXBU4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    We modify the register settings to minimize headphone pop noise
    during ES8326 power-up and music start/stop.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index c7f89c990178..fd3e73c4b7e9 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -553,7 +553,8 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 				ES8326_MUTE_MASK, ES8326_MUTE);
-		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xf0);
+		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF,
+				0x30, 0x00);
 	} else {
 		if (!es8326->calibrated) {
 			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_FORCE_CAL);
@@ -566,8 +567,13 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
 			es8326->calibrated = true;
 		}
+		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x01);
+		usleep_range(1000, 5000);
+		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
+		usleep_range(1000, 5000);
+		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x30, 0x20);
+		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x30, 0x30);
 		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
-		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x91);
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_ON);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 				ES8326_MUTE_MASK, ~(ES8326_MUTE));
@@ -587,23 +593,20 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		if (ret)
 			return ret;
 
-		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
+		regmap_update_bits(es8326->regmap, ES8326_RESET, 0x02, 0x02);
+		usleep_range(5000, 10000);
 		regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
 			    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
-		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
 		regmap_write(es8326->regmap, ES8326_PGA_PDN, 0x40);
 		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x00);
 		regmap_update_bits(es8326->regmap,  ES8326_CLK_CTL, 0x20, 0x20);
-
-		regmap_update_bits(es8326->regmap, ES8326_RESET,
-				ES8326_CSM_ON, ES8326_CSM_ON);
+		regmap_update_bits(es8326->regmap, ES8326_RESET, 0x02, 0x00);
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
-		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x00);
 		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
 		break;
@@ -807,6 +810,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			 * Don't report jack status.
 			 */
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
+			es8326_enable_micbias(es8326->component);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
@@ -850,13 +854,10 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 static irqreturn_t es8326_irq(int irq, void *dev_id)
 {
 	struct es8326_priv *es8326 = dev_id;
-	struct snd_soc_component *comp = es8326->component;
 
 	if (!es8326->jack)
 		goto out;
 
-	es8326_enable_micbias(comp);
-
 	if (es8326->jack->status & SND_JACK_HEADSET)
 		queue_delayed_work(system_wq, &es8326->jack_detect_work,
 				   msecs_to_jiffies(10));
@@ -973,6 +974,14 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_DAC_DSM, 0x08);
 	regmap_write(es8326->regmap, ES8326_DAC_VPPSCALE, 0x15);
 
+	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x80 |
+			((es8326->version == ES8326_VERSION_B) ?
+			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
+			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
+	usleep_range(5000, 10000);
+	es8326_enable_micbias(es8326->component);
+	usleep_range(50000, 70000);
+	regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 	regmap_write(es8326->regmap, ES8326_INT_SOURCE,
 		    (ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 	regmap_write(es8326->regmap, ES8326_INTOUT_IO,
@@ -989,11 +998,6 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE, ES8326_MUTE_MASK,
 			   ES8326_MUTE);
 
-	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x80 |
-			((es8326->version == ES8326_VERSION_B) ?
-			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
-			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
-	regmap_write(es8326->regmap, ES8326_HP_VOL, 0x11);
 
 	es8326->jack_remove_retry = 0;
 	es8326->hp = 0;
-- 
2.17.1

