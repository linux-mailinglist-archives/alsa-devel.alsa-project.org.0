Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B4AC103
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7895315E2;
	Fri,  6 Sep 2019 21:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7895315E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799660;
	bh=xyGRq9IOeoqWWYzW8HOF0LmIVlCJ5pCOD+dUANvmt5w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EyOapBHyeIHH/EiKAir77oiZT+cEqgIF8OV3AZZJwEVRmQoe/uDUD95mE4Y1Hlze/
	 RmEf2W1wGapR3j+eEDsrD9jGFRm/ULaN1hy+OVvn/o499KKPjJueQOK0hhkEfgXw2U
	 w8q+UV/jnDET1OGuQKRN9qGirIj5p0KcUkr6jauo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1448CF8067B;
	Fri,  6 Sep 2019 21:48:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D6F0F80671; Fri,  6 Sep 2019 21:48:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B641F80649
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B641F80649
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="L78QqkeG"
Received: by mail-pl1-x644.google.com with SMTP id d3so3679328plr.1
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pllqCVA+R/UnPqv2tlb9+gzMN21zylvfyhR5C3t3ahU=;
 b=L78QqkeG1uic4wb4e4O6CpiVbEUwZshI6Av/86E51UYQ8zRG0hu8gMjd5K9J6vH+fS
 S43ekhypDVv9Cx80mG5IWFLsc+J8XFw8m4+d2pZuYPM+N2t0A3Cx2KMBZhv6D6p/rpl4
 /ALZBpLaDKEivtnJwifAQ4TlXfqB6WUvz3Fc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pllqCVA+R/UnPqv2tlb9+gzMN21zylvfyhR5C3t3ahU=;
 b=cbgKgBpOqMu3PXwzwhbO2QrPq/sGl3JXmZ+/UxUV0otjC8mmxPibstlD3SACKhb4GI
 lMrsCgsAEDXLYtlDqKuOHecdESrjq47LpJxuDunIUzOlc3sha6Phjnw9ITbxKVXrCUok
 9POsxdcm9HJQoxESTRt0df00M5JOI7lo57nOmqjCXCIsiAcHgAyu35dIgB3CCblmUP0J
 ndHyJe93RbADfW0Jirr/jPiK3/n1MwenpoZAwVoG/bZMA71CbuAOjc5mjjj3d3GDWVwf
 qm+QTu7Gq881GX5BCtetnjxn3DnVMemVHmeQ8cKMCaloOiqmTzqNeAyuS4jSZP2gqGCA
 F7QA==
X-Gm-Message-State: APjAAAUpH+YGuVVAYIVwc/PinpB03IpZbmXpY5i6QK2SVHun/LtWYHUJ
 BFdMoQMy0HxNlFNwZ+xLWOcRWiRhYQ==
X-Google-Smtp-Source: APXvYqzzA+RK/+H/vEubq0n3csZbv4Sqjupr9FXXwbj0GJRoQkbXSrJ04m4JSM9xVbZMx/KrTnL/Cw==
X-Received: by 2002:a17:902:a415:: with SMTP id
 p21mr10347968plq.319.1567799282967; 
 Fri, 06 Sep 2019 12:48:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id m19sm4842322pjv.9.2019.09.06.12.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:48:02 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:29 -0700
Message-Id: <20190906194636.217881-8-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 07/15] ASoC: rt5677: Enable jack detect while DSP
	is running
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ben Zhang <benzh@chromium.org>

Before a hotword is detected, GPIO1 pin is configured as IRQ
output so that jack detect works. When a hotword is detected,
the DSP firmware configures the GPIO1 pin as GPIO1 and
drives a 1. rt5677_irq() is called after a rising edge on
the GPIO1 pin, due to either jack detect event or hotword
event, or both. All possible events are checked and handled
in rt5677_irq() where GPIO1 pin is configured back to IRQ
output if a hotword is detected.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 64 +++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 9cdfe7d488fe..8f5e4882120c 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -312,6 +312,8 @@ static bool rt5677_volatile_register(struct device *dev, unsigned int reg)
 	case RT5677_IRQ_CTRL1:
 	case RT5677_IRQ_CTRL2:
 	case RT5677_GPIO_ST:
+	case RT5677_GPIO_CTRL1: /* Modified by DSP firmware */
+	case RT5677_GPIO_CTRL2: /* Modified by DSP firmware */
 	case RT5677_DSP_INB1_SRC_CTRL4:
 	case RT5677_DSP_INB2_SRC_CTRL4:
 	case RT5677_DSP_INB3_SRC_CTRL4:
@@ -787,8 +789,11 @@ static unsigned int rt5677_set_vad_source(
 	regmap_update_bits(rt5677->regmap, RT5677_DSP_INB_CTRL1,
 		RT5677_IB01_SRC_MASK, 4 << RT5677_IB01_SRC_SFT);
 
-	/* IRQ Source of VAD Jack Detection = enable */
-	regmap_write(rt5677->regmap, RT5677_IRQ_CTRL2, 0x4000);
+	/* VAD/SAD is not routed to the IRQ output (i.e. MX-BE[14] = 0), but it
+	 * is routed to DSP_IRQ_0, so DSP firmware may use it to sleep and save
+	 * power. See ALC5677 datasheet section 9.17 "GPIO, Interrupt and Jack
+	 * Detection" for more info.
+	 */
 
 	/* Enable Gating Mode with MCLK = enable */
 	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x1, 0x1);
@@ -924,15 +929,15 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 	if (on && !activity) {
 		activity = true;
 
-		/* Set GPIO1 as an output pin driving a 0. Firmware will
-		 * raise GPIO1 upon hotword detect.
+		/* Before a hotword is detected, GPIO1 pin is configured as IRQ
+		 * output so that jack detect works. When a hotword is detected,
+		 * the DSP firmware configures the GPIO1 pin as GPIO1 and
+		 * drives a 1. rt5677_irq() is called after a rising edge on
+		 * the GPIO1 pin, due to either jack detect event or hotword
+		 * event, or both. All possible events are checked and handled
+		 * in rt5677_irq() where GPIO1 pin is configured back to IRQ
+		 * output if a hotword is detected.
 		 */
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL2,
-			RT5677_GPIO1_DIR_MASK |	RT5677_GPIO1_OUT_MASK |
-			RT5677_GPIO1_P_MASK, RT5677_GPIO1_DIR_OUT |
-			RT5677_GPIO1_OUT_LO | RT5677_GPIO1_P_NOR);
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
-			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_GPIO1);
 
 		rt5677_set_vad_source(component);
 		rt5677_set_dsp_mode(component, true);
@@ -952,6 +957,8 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 	} else if (!on && activity) {
 		activity = false;
 
+		/* Don't turn off the DSP while handling irqs */
+		mutex_lock(&rt5677->irq_lock);
 		/* Set DSP CPU to Stop */
 		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
 			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
@@ -959,13 +966,12 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 
 		/* Disable and clear VAD interrupt */
 		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
-		regmap_update_bits(rt5677->regmap, RT5677_IRQ_CTRL2,
-			0xF000, 0x0000);
 
 		/* Set GPIO1 pin back to be IRQ output for jack detect */
 		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
 			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
 
+		mutex_unlock(&rt5677->irq_lock);
 	}
 
 	return 0;
@@ -5273,6 +5279,28 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
 	},
 };
 
+bool rt5677_check_hotword(struct rt5677_priv *rt5677)
+{
+	int reg_gpio;
+
+	if (!rt5677->is_dsp_mode)
+		return false;
+
+	if (regmap_read(rt5677->regmap, RT5677_GPIO_CTRL1, &reg_gpio))
+		return false;
+
+	/* Firmware sets GPIO1 pin to be GPIO1 after hotword is detected */
+	if ((reg_gpio & RT5677_GPIO1_PIN_MASK) == RT5677_GPIO1_PIN_IRQ)
+		return false;
+
+	/* Set GPIO1 pin back to be IRQ output for jack detect */
+	regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+
+	rt5677_spi_hotword_detected();
+	return true;
+}
+
 static irqreturn_t rt5677_irq(int unused, void *data)
 {
 	struct rt5677_priv *rt5677 = data;
@@ -5281,9 +5309,6 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 
 	mutex_lock(&rt5677->irq_lock);
 
-	if (rt5677->dsp_vad_en)
-		rt5677_spi_hotword_detected();
-
 	/*
 	 * Loop to handle interrupts until the last i2c read shows no pending
 	 * irqs. The interrupt line is shared by multiple interrupt sources.
@@ -5321,7 +5346,13 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 				reg_irq ^= rt5677_irq_descs[i].polarity_mask;
 			}
 		}
-		if (!irq_fired)
+
+		/* Exit the loop only when we know for sure that GPIO1 pin
+		 * was low at some point since irq_lock was acquired. Any event
+		 * after that point creates a rising edge that triggers another
+		 * call to rt5677_irq().
+		 */
+		if (!irq_fired && !rt5677_check_hotword(rt5677))
 			goto exit;
 
 		ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
@@ -5332,6 +5363,7 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 		}
 	}
 exit:
+	WARN_ON_ONCE(loop == 20);
 	mutex_unlock(&rt5677->irq_lock);
 	if (irq_fired)
 		return IRQ_HANDLED;
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
