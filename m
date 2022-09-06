Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD85AF430
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 21:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A14A4E;
	Tue,  6 Sep 2022 21:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A14A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662491243;
	bh=0PRgGVxWdxh7xZMpOE8HbDGmXbT6ubeLBdgXykdp1zI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LMuxluXv5rOeMnq7vn16X4yZ08PBZcM8ABICSML+4406TVo5pyHSAS1uns30WDbow
	 Z/PK3VAHCkjwEBo5m+nNJvGu5kP73LtUxOFNk4rOx0P0xEaairJ24A1DQiqqxV6Ht/
	 RehHyI+po3WYW9TxHZ3G0Wi7EH0fTuARjMvXq0Gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95807F8024C;
	Tue,  6 Sep 2022 21:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73C3FF80249; Tue,  6 Sep 2022 21:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B22F8011C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 21:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B22F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ADvCai+S"
Received: by mail-pj1-x102c.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so8484143pjl.0
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=7KHx1Yv+hEk7Y/hrqYv9UfQMba4m3xWqmPYWeA+BX2E=;
 b=ADvCai+SyN5W/C1ulJZkXa/VUtB8IPbdCUo9Hjg+bjvUMWufJOrVmDpI2ulbN+NF6/
 RptOGkIaxmGO94Dtc0R3vP+PLHRYa1wRCSj2fuLDOVatGtj2SCtlVTmwD/WC/HOsdSWJ
 DJp+70JAAxw3XgPcrBBu5mPFk+12vE5/oKvVr5tR1BiT28dqOyF0IigsD2k0opCIG+gN
 iGep6N+bWxVA8l0S+DBto68rXPyVicnEjRi8ugKCWTMEe7W7fqcw5DgvlkRGCrLbNsQN
 Ou1Dq2jSL2IEPsmM0nnJc+GGAbPHq6jyQqAL22B6c7GFIe9F2sKCOJde/t422hBhtVzB
 He4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7KHx1Yv+hEk7Y/hrqYv9UfQMba4m3xWqmPYWeA+BX2E=;
 b=Pe6ZZQHRvcauN24vlnghU1u+j3p02UA9nbQtBEx6iLTJpo2KEusiGGh4WkXEbnDcJQ
 fa8KZf6gFAmacn0oVwqUFRcdAVggcB6xcmcLnrtR5zhYhTwNvk44sPd6yQDhdEEypU+4
 nqNv4F7+vqcDT8K7nILpoF3TGxAazczun1IfHZumj6ITUrLi8RDlqwISq0RiiT07qpJj
 fCvqSLGneT6dkvIiXLyPi2ORsDUWF4hGF2BB5tU36cCBwU+ngpT4SL9RS/ZNl6VbH3Rg
 GGmmrF0Vt2zFq3waO25jINYJ2qWasLOng3xndQgJHUYt8W9o7UbqzGRNeDrxnvPKcYKE
 L4vQ==
X-Gm-Message-State: ACgBeo3J1B7jOMSnwnsfPy9Y6S+cJjf2+f+yrEscObFlzFDaYACz3VTQ
 idN8aLOal8TgSqxtKMEd4MI=
X-Google-Smtp-Source: AA6agR6E2NBlUJFJ4G2LFfqZzaBJliai50FugTV+4NYqpWcHIbzDHOZ4xJASIg5wpD8TwMM4+U3CdQ==
X-Received: by 2002:a17:90b:2242:b0:200:1c81:c108 with SMTP id
 hk2-20020a17090b224200b002001c81c108mr18779670pjb.89.1662491172521; 
 Tue, 06 Sep 2022 12:06:12 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902da8400b0017297a6b39dsm10445347plx.265.2022.09.06.12.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:06:12 -0700 (PDT)
Date: Tue, 6 Sep 2022 12:06:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: simple-card-utils: switch to using gpiod API
Message-ID: <YxeaITtlJexygQo9@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This patch switches the driver away from legacy gpio/of_gpio API to
gpiod API, and removes use of of_get_named_gpio_flags() which I want to
make private to gpiolib.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/generic/simple-card-utils.c | 28 ++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 1b201dd09259..bef16833c487 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -9,7 +9,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
@@ -729,12 +728,12 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 			  char *pin)
 {
 	struct device *dev = card->dev;
-	enum of_gpio_flags flags;
+	struct gpio_desc *desc;
 	char prop[128];
 	char *pin_name;
 	char *gpio_name;
 	int mask;
-	int det;
+	int error;
 
 	if (!prefix)
 		prefix = "";
@@ -742,36 +741,39 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 	sjack->gpio.gpio = -ENOENT;
 
 	if (is_hp) {
-		snprintf(prop, sizeof(prop), "%shp-det-gpio", prefix);
+		snprintf(prop, sizeof(prop), "%shp-det", prefix);
 		pin_name	= pin ? pin : "Headphones";
 		gpio_name	= "Headphone detection";
 		mask		= SND_JACK_HEADPHONE;
 	} else {
-		snprintf(prop, sizeof(prop), "%smic-det-gpio", prefix);
+		snprintf(prop, sizeof(prop), "%smic-det", prefix);
 		pin_name	= pin ? pin : "Mic Jack";
 		gpio_name	= "Mic detection";
 		mask		= SND_JACK_MICROPHONE;
 	}
 
-	det = of_get_named_gpio_flags(dev->of_node, prop, 0, &flags);
-	if (det == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	desc = gpiod_get_optional(dev, prop, GPIOD_IN);
+	error = PTR_ERR_OR_ZERO(desc);
+	if (error)
+		return error;
+
+	if (desc) {
+		error = gpiod_set_consumer_name(desc, gpio_name);
+		if (error)
+			return error;
 
-	if (gpio_is_valid(det)) {
 		sjack->pin.pin		= pin_name;
 		sjack->pin.mask		= mask;
 
 		sjack->gpio.name	= gpio_name;
 		sjack->gpio.report	= mask;
-		sjack->gpio.gpio	= det;
-		sjack->gpio.invert	= !!(flags & OF_GPIO_ACTIVE_LOW);
+		sjack->gpio.desc	= desc;
 		sjack->gpio.debounce_time = 150;
 
 		snd_soc_card_jack_new_pins(card, pin_name, mask, &sjack->jack,
 					   &sjack->pin, 1);
 
-		snd_soc_jack_add_gpios(&sjack->jack, 1,
-				       &sjack->gpio);
+		snd_soc_jack_add_gpios(&sjack->jack, 1, &sjack->gpio);
 	}
 
 	return 0;
-- 
2.37.2.789.g6183377224-goog


-- 
Dmitry
