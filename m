Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C916883338E
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 11:16:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79907822;
	Sat, 20 Jan 2024 11:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79907822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705745768;
	bh=ygvcz+NWIUIH6LHyik5hfLBedU4S6dABw75FZJaznoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VIMNR99aMrVeareAIDJbs3TYWaa05xaPvN+novEJC/iJnMZpzJcVB9Kw0xfMZvlYW
	 7Qxx4fyli+UycX7V73Ljj/2KVdxBdKDUpwaa3u8BWWCkJ8bIVUeLNN6SScKuud1V5T
	 m4YM/iGGvizOSzc/S1jr0fxfoXDqZiLqYSiKXHRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65CC4F805AF; Sat, 20 Jan 2024 11:15:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8927F80567;
	Sat, 20 Jan 2024 11:15:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D114EF8028D; Sat, 20 Jan 2024 11:13:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE43FF801F5
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 11:13:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE43FF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=msG4mcH7
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d50d0c98c3so21804315ad.1
        for <alsa-devel@alsa-project.org>;
 Sat, 20 Jan 2024 02:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705745579; x=1706350379;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Rxg5H5p4tbdSlrf4IdnunK3FrEk/iuoyb/MbENhqw8=;
        b=msG4mcH7Nc4699UuYxCiAt3nrSLG15Pu03Reok9ZBQ41WtCmigvCkhEE55HnHsYjbW
         2wqvrSTXfe9eOKVJ+FYb+3Qx7dYN1RMM/k6m2kGBd//0NKIS++qeDSg/qZvQwUlpvgfi
         7z/0sdVaZLDrYQ//uXRY71xTPJasw4OWkcc5UjZZYOp2vXVkYn38kOFzT8S0tHBHjN4C
         RPFd/L67iZG2E4LWkpzTsPU9/KETLe4fEMq03e1BlAOifPQdCZUcB2e2ET5A5Ms+KQ6C
         S5Juk3/R+8Vowgf43liRzkTT6AVJtRGQiodKSwHjoqIrEPkixNuvcMM98xpjDosiv4m0
         Bwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705745579; x=1706350379;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Rxg5H5p4tbdSlrf4IdnunK3FrEk/iuoyb/MbENhqw8=;
        b=m5iL+scAk2no5qYYvVX+3h6fKgqbXwmrhwc5x4ZwXdxyqzrML6mErXuKBcVdp3BF+G
         SBaz5Cky7TgeWKVMHiiUAdr7OIdE7H6AyScNTIEUOiL//GfGuHKt4KDM1e5FoRArhmAH
         0V6V+ljRRf24YeX9C47iiXUmgsxYuZWHbMs5c9Hxs6ui2rqWQUQbKOo9gvKY5AERAzye
         opJ04SNewkgAi5qOV3Gf2l/8kpESbhzAjcQGX+QaFOOmrCx0/kTR8zJ4Da9l0pSf7yvN
         gNNQ6JDhuavuwZI8Mm7R8IrkT9QofsP0ISd4ICYusbBq7OO3nDKkcp37qRyAQOM9xO9R
         cHpA==
X-Gm-Message-State: AOJu0Yxg68e5CR2W7Afp4wcOScB7xQFe1SWORd7wngfpBur6SYma9oNM
	WuwZ2C7pdIpguzXRWcWFYGQ/USQrWMDdUAGVYth15yYNGW7bxjhpgaGHYbNuNjGRKQ==
X-Google-Smtp-Source: 
 AGHT+IH0l2k8S9nVJIlspPFCcXsi7wS+0gjodae9/FnsCYiZASPE78/YdgGE7PEot97SaulXPWlw5g==
X-Received: by 2002:a17:902:ecc9:b0:1d7:323a:ecdc with SMTP id
 a9-20020a170902ecc900b001d7323aecdcmr453050plh.53.1705745579184;
        Sat, 20 Jan 2024 02:12:59 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 jc17-20020a17090325d100b001d72cf69508sm967365plb.23.2024.01.20.02.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 02:12:58 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 4/5] ASoC: codecs: ES8326: Minimize the pop noise on
 headphone
Date: Sat, 20 Jan 2024 18:12:39 +0800
Message-Id: <20240120101240.12496-5-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240120101240.12496-1-zhuning0077@gmail.com>
References: <20240120101240.12496-1-zhuning0077@gmail.com>
Message-ID-Hash: QS7TTXR3AS3YO4A6DFJMVPC5QY2OYGOQ
X-Message-ID-Hash: QS7TTXR3AS3YO4A6DFJMVPC5QY2OYGOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QS7TTXR3AS3YO4A6DFJMVPC5QY2OYGOQ/>
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
index 51dc8081e475..33c4ebddab40 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -609,7 +609,8 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
 		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 				ES8326_MUTE_MASK, ES8326_MUTE);
-		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xf0);
+		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF,
+				0x30, 0x00);
 	} else {
 		if (!es8326->calibrated) {
 			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_FORCE_CAL);
@@ -622,8 +623,13 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
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
@@ -643,23 +649,20 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
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
@@ -863,6 +866,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			 * Don't report jack status.
 			 */
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
+			es8326_enable_micbias(es8326->component);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
@@ -906,13 +910,10 @@ static void es8326_jack_detect_handler(struct work_struct *work)
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
@@ -1029,6 +1030,14 @@ static int es8326_resume(struct snd_soc_component *component)
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
@@ -1045,11 +1054,6 @@ static int es8326_resume(struct snd_soc_component *component)
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

