Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5962B2EA
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:41:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F52616C1;
	Wed, 16 Nov 2022 06:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F52616C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577294;
	bh=MqYVBm1MALPjfQ33UeddpZHm+HPXOJ9xjCGd4D6rVSM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/gb64TrQQwWIRputeyQnNVe3FeInHWjRI0hI0LZwTPGmFV7GiB/TNgjjvjtASp9s
	 OcRK5bERHEhVHix5N93uCUWa2FvqS9rkw+hp7wTHpBcldRQsAgRPAP8RCKoyLVdasE
	 CNPCv4UMN0y+uTJoiyaNfbkqWsY3a8AZueMzHT6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D4AF805A0;
	Wed, 16 Nov 2022 06:38:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 838B7F80588; Wed, 16 Nov 2022 06:38:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A6BBF8057E
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A6BBF8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AJH+sKrg"
Received: by mail-pg1-x52c.google.com with SMTP id q71so15684028pgq.8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1IwnG/hkjmxOvKDimBi/CuJjoVrJcOnhShxdmIQmZM=;
 b=AJH+sKrgK8wjc0DzG0SIQ7l1SSdtx55kH1AEFOqUsobc7Y7+O7Z44slvWjjsdTpVLE
 rRI7V8xfg0yqJZef/dCf41xX8Rpc2rgwEOZU8Hfg4hGt5LWXz+sDnLhs0NcG63BJKnMI
 UhxI0dTqPhc0b3X42PNLFigo/BQNY0g+ZRZt8CKy9CT2P1qk49ESs7VINIvMnRiwiqkw
 rU6DAMgSR2x9ygBn9BOzq2IJIUr/3EZMWzuwE+rN34PZ0f3rTHTjkmD4dn/KhFKJ+MbD
 QyeMz2cgGtcXis+IdLypKJgofMzjCDmYAxPtrv7XWDcGSmR2ZQqAmkjNvd96VPx6/HHE
 s0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1IwnG/hkjmxOvKDimBi/CuJjoVrJcOnhShxdmIQmZM=;
 b=ix/vxEy+XzBaYmzZjQPvZduWXzisaW4R+Ljxk2jNH8IX0kMb4HV6H9+qAxoFXZChTN
 uBNJHKJcZ8DzaIdpLJZnCGb6i3h4J72/NFRm6d5+k0B0/Bus77fK5jP/wk99Ah7IcUZy
 nD4HVk3tOGyOtPCTiZjNuX5vUKdkVvkxD1rMrNa5yEjnRqJie8XL7CqLBDMeEbHsnJpz
 0yxzXpNgcDcJz35l9V1i9NRIB+t71TsT0smTTIqhYtMsQ+g8AgJu2ig0Hso1KzmMY8mP
 GyWKuWNqmrZpB0sFxzvMuj91/BVJaJyGFCBgw+NZGugWYXWDOvPW7HnSUjyhs017IHFN
 D8OA==
X-Gm-Message-State: ANoB5plscuEWrrrR4oTW9YM38EvfgnnjHeFSILmD/Y8KdC+cOiNS3S04
 JPOfuNCSwyObEHSNbFm4wK8=
X-Google-Smtp-Source: AA0mqf6NXcALMKPdpbXz4RgcSqvLnP/6gMKWXgP7QBDEKte7NKuqA15W/jE79PCse92kRUTjqGLFWA==
X-Received: by 2002:a62:7955:0:b0:56b:e64c:5c7e with SMTP id
 u82-20020a627955000000b0056be64c5c7emr21484613pfc.18.1668577120853; 
 Tue, 15 Nov 2022 21:38:40 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:40 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 11/11] ASoC: wcd938x: switch to using gpiod API
Date: Tue, 15 Nov 2022 21:38:17 -0800
Message-Id: <20221116053817.2929810-11-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Switch the driver from legacy gpio API that is deprecated to the newer
gpiod API that respects line polarities described in ACPI/DT.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/wcd938x.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index aca06a4026f3..b85bc750c7e0 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -6,12 +6,14 @@
 #include <linux/platform_device.h>
 #include <linux/device.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -194,7 +196,7 @@ struct wcd938x_priv {
 	int flyback_cur_det_disable;
 	int ear_rx_path;
 	int variant;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct gpio_desc *us_euro_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
@@ -4234,18 +4236,19 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
 	int ret;
 
-	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
-	if (wcd938x->reset_gpio < 0) {
-		dev_err(dev, "Failed to get reset gpio: err = %d\n",
-			wcd938x->reset_gpio);
-		return wcd938x->reset_gpio;
+	wcd938x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	ret = PTR_ERR_OR_ZERO(wcd938x->reset_gpio);
+	if (ret) {
+		dev_err(dev, "Failed to get reset gpio: err = %d\n", ret);
+		return ret;
 	}
 
 	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
 						GPIOD_OUT_LOW);
-	if (IS_ERR(wcd938x->us_euro_gpio)) {
+	ret = PTR_ERR_OR_ZERO(wcd938x->us_euro_gpio);
+	if (ret) {
 		dev_err(dev, "us-euro swap Control GPIO not found\n");
-		return PTR_ERR(wcd938x->us_euro_gpio);
+		return ret;
 	}
 
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
@@ -4285,11 +4288,11 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 
 static int wcd938x_reset(struct wcd938x_priv *wcd938x)
 {
-	gpio_direction_output(wcd938x->reset_gpio, 0);
-	/* 20us sleep required after pulling the reset gpio to LOW */
+	gpiod_set_value_cansleep(wcd938x->reset_gpio, 1);
+	/* 20us sleep required after asserting the reset gpio */
 	usleep_range(20, 30);
-	gpio_set_value(wcd938x->reset_gpio, 1);
-	/* 20us sleep required after pulling the reset gpio to HIGH */
+	gpiod_set_value_cansleep(wcd938x->reset_gpio, 0);
+	/* 20us sleep required after releasing the reset gpio */
 	usleep_range(20, 30);
 
 	return 0;
-- 
2.38.1.431.g37b22c650d-goog

