Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DCD6E2FFB
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B889183E;
	Sat, 15 Apr 2023 11:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B889183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549912;
	bh=BlWJQbfAxmqzCyKltZtuChU+IXB1xFpetJoDryTxfwY=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=F+Ow7rZsTsChAVtHzz0J0fKKf/O4FGs/DRhjmXy9jujvN/IKdJh5cOcCSh014a40U
	 evtgbj+Jwab0sPhp5TBCFKliQ/OVZV+Jjm3/rrQnNg4zgPzDxFLu0sAP289U9J/6ER
	 F503JeRFD1Y86XaI3S+4VheOIeS8XmC9lX7JZl84=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 640C2F80548;
	Sat, 15 Apr 2023 11:09:30 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 7/9] ASoC: ssm2602: Add mute gpio
Date: Fri, 14 Apr 2023 16:02:01 +0200
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3DTLIQYF4AM23UIDRROBEJD3YM5QVVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154976963.26.12831314436545841195@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB47F8023A; Fri, 14 Apr 2023 16:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF7DAF80448
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF7DAF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=JzlusrDN
Received: by mail-lj1-x232.google.com with SMTP id a10so2280300ljr.5
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480971; x=1684072971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l00HAAnjKLxvI4M71LWAa1g6hA4VFu1YZpxf8JORAUs=;
        b=JzlusrDNdzUZCKHh7U6SmI+KlP/mVczAn9Xb3MZfbiz5r8m1L0lqAf9Z0JgZD3Tqxx
         X/DTdKdcVdFoEc02n65cBpez+thdu+oE08qMKBCO03cEzFiculVhVRZbG5DLG4CFH5bk
         EuymseLwwLz74StstE7lynJG+54dZLY4rdi+sSD39UBUKIAUmFkdUUPAgn0+lE7xe9xI
         aXGxbRy0yeAy20z1zjWdIESJpZ63qTDpzC6yhXnOVrFJUvqPVIkSeblw+Zm3H288fGw7
         1AGJlriLqc33CclcKMinnVNJN0MwG6Pgb1IsmYYrXUCl7cZ0DdbTtOPnhdownoKzOkWs
         bywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480971; x=1684072971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l00HAAnjKLxvI4M71LWAa1g6hA4VFu1YZpxf8JORAUs=;
        b=GrFK6C6FbN5BPUa9c8RRMQZO6nqZ5q7fq4gqpzvcswr9KbtEDh3GD6JSzeHVJ1NQcU
         er1WHbYEmMUGotAoqjuPG/q5NVBMU8QNpFI9qDcjOAzUcB/jWlv4j2egcwSG3YqBuSqR
         5+Ae/o4ySo1zx0zrW9GWPvVE16sYfyAbFOnsDsUskSbKyhyTWqgB7+uaub75iUWZhCIS
         BhJcLJ6bONm39kd+orxFQxsYMmH+KgURS55PP+cZH5UDlNP58/ebFFhGgvYHyOhqA26F
         UX+USgzQRBGPpL0dbz/ZsIgdevjhA1egls6CWDqO2CQwm9JOr5seEfrdX/e38eIzHIgN
         fuXg==
X-Gm-Message-State: AAQBX9fdlUyI2a+GCUz4zrtm73LXLt2/64Pb42R/te0Ewn36Qbigvk96
	mjgX0URq2b3MjTWaM7TjN1aYOtbKMUXFpod8U3BJzg==
X-Google-Smtp-Source: 
 AKy350ZxhF8jz5Saa4u19lC/KyENjhrRMahkQQL0VeYcZWqgqY9MaL+3miI6fzj/xv1zhuIzYZZSRw==
X-Received: by 2002:a2e:99d2:0:b0:2a7:ace8:e0ba with SMTP id
 l18-20020a2e99d2000000b002a7ace8e0bamr2212415ljj.42.1681480971325;
        Fri, 14 Apr 2023 07:02:51 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:51 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 7/9] ASoC: ssm2602: Add mute gpio
Date: Fri, 14 Apr 2023 16:02:01 +0200
Message-ID: <20230414140203.707729-8-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R3DTLIQYF4AM23UIDRROBEJD3YM5QVVJ
X-Message-ID-Hash: R3DTLIQYF4AM23UIDRROBEJD3YM5QVVJ
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:57 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3DTLIQYF4AM23UIDRROBEJD3YM5QVVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SSM2603 has a hardware mute pin. Add an optional mute gpio to
control it.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 sound/soc/codecs/ssm2602.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index 35c4743e756e..dd81e62d7a3b 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 
 #include <sound/pcm.h>
@@ -32,6 +33,8 @@ struct ssm2602_priv {
 
 	enum ssm2602_type type;
 	unsigned int clk_out_pwr;
+
+	struct gpio_desc *mute_gpiod;
 };
 
 /*
@@ -352,6 +355,10 @@ static int ssm2602_mute(struct snd_soc_dai *dai, int mute, int direction)
 	else
 		regmap_update_bits(ssm2602->regmap, SSM2602_APDIGI,
 				    APDIGI_ENABLE_DAC_MUTE, 0);
+
+	if (ssm2602->mute_gpiod)
+		gpiod_set_value_cansleep(ssm2602->mute_gpiod, mute);
+
 	return 0;
 }
 
@@ -680,6 +687,10 @@ int ssm2602_probe(struct device *dev, enum ssm2602_type type,
 	ssm2602->type = type;
 	ssm2602->regmap = regmap;
 
+	ssm2602->mute_gpiod = devm_gpiod_get_optional(dev, "mute", GPIOD_OUT_LOW);
+	if (IS_ERR(ssm2602->mute_gpiod))
+		return PTR_ERR(ssm2602->mute_gpiod);
+
 	return devm_snd_soc_register_component(dev, &soc_component_dev_ssm2602,
 		&ssm2602_dai, 1);
 }
-- 
2.40.0.634.g4ca3ef3211-goog

