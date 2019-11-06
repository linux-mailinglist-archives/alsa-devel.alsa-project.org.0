Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BAEF0B88
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20ED716E3;
	Wed,  6 Nov 2019 02:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20ED716E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003040;
	bh=4nQ5RNlUScFJs8nc6vvhsiYa4DgMqeXSznqI2Q+3WGs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBtXaWd/jdu3OgS65c4hQiTUSAywoQ4d4EDXRdwFzWqq1u4xvEAjXyHbdRW+G2z/e
	 bt7T+OELNpz0Mf+iPDsQ+aECCijhekVzTXdVCcaXNnWwgyf7AR8/WaU+J/Aj9oKV5q
	 TS+3pu/b9ooIlhSc+OZaSKHosi7k9BiAM8KhEA/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F66F80634;
	Wed,  6 Nov 2019 02:14:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19A97F80639; Wed,  6 Nov 2019 02:14:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C76A7F805FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C76A7F805FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="BBjSYW3n"
Received: by mail-pf1-x443.google.com with SMTP id p26so17503083pfq.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suzykPZWHLuHg55uAlqcAUdQBIgbRcnWoF1QNByFTXM=;
 b=BBjSYW3nlEC+2413ZgardQMWyP/69mBYfQ3JeDGbt3SMbc1ODuuNSCTx2sprJL0MB8
 NrxN+kyuIz8gVXOCd0j9dht9LX24VeBBuEAQBFhwX12nvEMym7Kjawi8B+oP4OtDAzNp
 bSOjNRrFuBsyJcx8EayffG5lWp7dqnTnTkSBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=suzykPZWHLuHg55uAlqcAUdQBIgbRcnWoF1QNByFTXM=;
 b=RGJAsrjbDBSToMe9UJBgT6Lb9VDt4z2Keh3gTb8QGGAMu8yN9kQW/HUaEzvyPnFfAc
 w/sJoGdH9g7YDAOZGWdAGXpEdNlFk4XC7kcNb99evx315DzNAbuwPfZ8FrNPuzozp1KU
 XHdYyTtxELsJGCfaxr7tNnbLfTCgRMzAka4+o8OVgoObdCSD1UWdnu/B7J7nSt46ff6g
 zuHqIPwDjHmZcM5UU4PYUon60Eqs1QyAJfEfHr3xcyN7/b8WjNG8aNwgGflqd62iR0Zh
 cmTzDEnvOBkyRu1qtU6yZL5cUafjqp58DKtxcKRDjOXxPtINXBQTwRnI3t+re9jaov05
 7nbA==
X-Gm-Message-State: APjAAAXu2MSrt34GuSfHMGNwG2t+PZTLooJbysQRcqCD2bBEDadSZbJx
 gk50qirEPkkEv6VJ3bOIjRJHDYkZIQi9
X-Google-Smtp-Source: APXvYqyrV6ZzQwpjpf16qRV4Hasa7J3Xf3tAyIPsEBJtOc5elcXuzgvHYjnkOWyRz0cg55XpVIOcSw==
X-Received: by 2002:a63:3812:: with SMTP id f18mr39716493pga.320.1573002837580; 
 Tue, 05 Nov 2019 17:13:57 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id l22sm19601845pgj.4.2019.11.05.17.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:13:56 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:28 -0800
Message-Id: <20191106011335.223061-4-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 03/11] ASoC: rt5677: Enable jack detect
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
index 13f21bf4e04e..48955b22262f 100644
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
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
