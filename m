Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16BDCFC3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:09:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9405B1678;
	Fri, 18 Oct 2019 22:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9405B1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429365;
	bh=6vWWrwKs9XZ+JNcr3adE2C9NjDSItJqBXWUXUY3sJ9E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MGyHzAJB4K4CZAy88eUyjo1Z7nOkOV7zAXb+0Pk2DWh+tWX+YXjOSAz1+Tcp86Ue2
	 qeyzBGlZMKLAoGtZkweFVtKaBTuXvL1R0A5xlLW2nRH968pD3ytMIaqVZApZjYYZHs
	 gzNO8zp2uvrwP1WsqK1EkaW1TAGN4dwXSrB8iIM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34047F8063B;
	Fri, 18 Oct 2019 22:05:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CD02F80638; Fri, 18 Oct 2019 22:05:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E4CF80610
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E4CF80610
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SLcBHT7a"
Received: by mail-pl1-x644.google.com with SMTP id t10so3347101plr.8
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tiOlKadwueSyErqdxOHwqve+8FSYCx0NJ5pK/1pMy6E=;
 b=SLcBHT7aZlunf1IY66OW3/L44A3NkAqK0hz/xrvrTYSF3YWrWqIX+rDZ+HdoR4rYB2
 HIY8HB2I2bVgvnNrcJX5B0JuWukYIGDw+SFWrW6FTNAOizkLHw3d0remhZhmBTKC0lBn
 jdLNd3IN2MClCDbF4TXuIBYCeG+/8ourVN6ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tiOlKadwueSyErqdxOHwqve+8FSYCx0NJ5pK/1pMy6E=;
 b=kqH/n6kZOaQzrUdmFMmrFkRshCqOzeToRYpFa5SMbsWMb1aSI74Cx7nJ64b3m4KoS6
 tXo/05tia8i8LFILgyL0CAh8rM2tMUkeF0k93XXC5WJIm4F7K8ErGT/+/rKxKm7j5ijx
 4AntELGugqfeJX/OaJlmChT8kXSMoaXcbLTs1QnnBdsixDvxzbSLA0f7B/ZwB/DJJdVI
 uY5av8cgL55/RXiJjORgspv8htpJ9Pb3UZUYF6iNhpVsE7ZQtfCi9tmyUdBEYX9aSO3x
 YfANhShEjOpWH3zxOjMlOofIwwdqA5XbsvPdpFHds8G3XNi/WRcPSwAh2Qz3mPRv0v2N
 /Vbw==
X-Gm-Message-State: APjAAAXx/1HatDbxVuOjNyQJ2sDtHW4TrOhzkJ/Uym2ahRrLbEFK/17Y
 yiclcxWFFxCWEwj+LsePybdYsdlU/AaQ
X-Google-Smtp-Source: APXvYqx2yR8uRCSv/jJ1O0+cbEge+8pM1tkn83lv2a2BkNdnpz0XG51+JH9yA2sxCNhed4LV/qQssQ==
X-Received: by 2002:a17:902:44f:: with SMTP id
 73mr4555831ple.119.1571429109260; 
 Fri, 18 Oct 2019 13:05:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id v19sm7534316pff.46.2019.10.18.13.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:08 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:41 -0700
Message-Id: <20191018200449.141123-5-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2 04/12] ASoC: rt5677: Enable jack detect
	while DSP is running
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
index 13f21bf4e04ec..48955b22262fa 100644
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
@@ -746,8 +748,11 @@ static unsigned int rt5677_set_vad_source(struct rt5677_priv *rt5677)
 		RT5677_VAD_BUF_OW | RT5677_VAD_FG2ENC |
 		RT5677_VAD_ADPCM_BYPASS | 1 << RT5677_VAD_MIN_DUR_SFT);
 
-	/* IRQ Source of VAD Jack Detection = enable */
-	regmap_write(rt5677->regmap, RT5677_IRQ_CTRL2, 0x4000);
+	/* VAD/SAD is not routed to the IRQ output (i.e. MX-BE[14] = 0), but it
+	 * is routed to DSP_IRQ_0, so DSP firmware may use it to sleep and save
+	 * power. See ALC5677 datasheet section 9.17 "GPIO, Interrupt and Jack
+	 * Detection" for more info.
+	 */
 
 	/* Private register, no doc */
 	regmap_update_bits(rt5677->regmap, RT5677_PR_BASE + RT5677_BIAS_CUR4,
@@ -886,15 +891,15 @@ static void rt5677_dsp_work(struct work_struct *work)
 	if (enable && !activity) {
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
 
 		rt5677_set_vad_source(rt5677);
 		rt5677_set_dsp_mode(rt5677, true);
@@ -915,6 +920,8 @@ static void rt5677_dsp_work(struct work_struct *work)
 	} else if (!enable && activity) {
 		activity = false;
 
+		/* Don't turn off the DSP while handling irqs */
+		mutex_lock(&rt5677->irq_lock);
 		/* Set DSP CPU to Stop */
 		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
 			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
@@ -923,13 +930,12 @@ static void rt5677_dsp_work(struct work_struct *work)
 
 		/* Disable and clear VAD interrupt */
 		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
-		regmap_update_bits(rt5677->regmap, RT5677_IRQ_CTRL2,
-			0xF000, 0x0000);
 
 		/* Set GPIO1 pin back to be IRQ output for jack detect */
 		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
 			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
 
+		mutex_unlock(&rt5677->irq_lock);
 	}
 }
 
@@ -5237,6 +5243,28 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
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
@@ -5245,9 +5273,6 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 
 	mutex_lock(&rt5677->irq_lock);
 
-	if (rt5677->dsp_vad_en)
-		rt5677_spi_hotword_detected();
-
 	/*
 	 * Loop to handle interrupts until the last i2c read shows no pending
 	 * irqs. The interrupt line is shared by multiple interrupt sources.
@@ -5285,7 +5310,13 @@ static irqreturn_t rt5677_irq(int unused, void *data)
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
@@ -5296,6 +5327,7 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 		}
 	}
 exit:
+	WARN_ON_ONCE(loop == 20);
 	mutex_unlock(&rt5677->irq_lock);
 	if (irq_fired)
 		return IRQ_HANDLED;
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
