Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389F633886
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C400B1672;
	Tue, 22 Nov 2022 10:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C400B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109545;
	bh=OFsNWOp6SSIJoWXtOXzn2TrPEnoCQRam21CnyFiGTiA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAF2F9hYdts1nTCDvgle5g+jKOzzkfOBrnY3mBr3SW7IF8yeXVVEAUunru5Dr8PND
	 isc/FRUObO3G5tPOdq2IxRsV2nJ1Dfm81Mxtj0lmGIIiJc5c78O89WnQatzQTVo+6G
	 VIrtFzX0GZQhKepzkd5Xi5rvAks5m6ztiJyJh0FU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 155F4F805C5;
	Tue, 22 Nov 2022 10:27:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01ECAF80519; Mon, 21 Nov 2022 12:06:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FEBBF80149
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 12:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FEBBF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r7hKUlGF"
Received: by mail-lf1-x131.google.com with SMTP id b3so18301443lfv.2
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFWc0lyVlH95oooJGcIUPfd8EfwgVQvFO8qkEV+ffsc=;
 b=r7hKUlGFZHSmUo8e9T5ttNSJVAtUIkxa+sycNhz6yjMvfgsi4BsfKebzRywymxymx0
 5u8F1YiUTZQCXcqMn0sfhionqeBApbXWdupVJzyFaxfv5GrU+U3eV6uFF8Uc+bn9QYY9
 Lms8Y8Dy0jualOb6Q3esqic3f7gurcqjMFZcZ+d9NzQOJ86H32u/XDiWQ2YkDuliRZvv
 nRAaqsKnXNUtg68nfvEmkjWN8H79Sk3dDjy/u/sisLO3c+s0yeylT32uwz3f7gvWfFaj
 gF7udl05HElld877JkEGkfP5OdFi8KqGkr7SLX3btVOqu0mHwPCN9Sin0XvK+TjDxtSD
 nJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFWc0lyVlH95oooJGcIUPfd8EfwgVQvFO8qkEV+ffsc=;
 b=hdFGUCdZe8l+1jXKzS3i2vYzTr3Eukf1BFlYvBGoR3N8qMIIMpGH4wZz5gw3fKqdYc
 9+FHMz7IsGlq7y3f/ZZawB6zhW+oeq2czJofQ7HyPtwxGTJGR9QQy43ph0hekGpE28nO
 bcJPUD7BXPzw/cof/rLnX+ncv4LkIh2vzYjCKIzU/lDijCSWwqw7xS/DRmQwxA0LySz+
 b/9+2LQWy+xZAPOGtdn2sV/qM/RuqHGwwhAkowA+rqlEkxPov2gbXkhkFsLSOgxPYomg
 RDMjNjtL792on0oxAmBy5oxs0T/ST7xj5wW5gX1VRze8G2MFrhinH2+erV1elV/IhExZ
 jC7g==
X-Gm-Message-State: ANoB5pkIun1+8TbxjHD2Xrt47FS6ak+Hr4jP0XB0SMFAniHad74HxmKS
 hayGbrSXYUdQFF3kaDliywT2dA==
X-Google-Smtp-Source: AA0mqf636Kajsl/vCtaPitrxYhf2ypiEKfsGbHJhGytuU/U+YWfw7NKkZ181BWLvvcggxq6Qzec5vw==
X-Received: by 2002:a19:dc08:0:b0:4b4:6460:24d with SMTP id
 t8-20020a19dc08000000b004b46460024dmr5540013lfg.386.1669028786293; 
 Mon, 21 Nov 2022 03:06:26 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05651203e100b0049313f77755sm1991521lfq.213.2022.11.21.03.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:06:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Viresh Kumar <vireshk@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/9] dt-bindings: clock: st,stm32mp1-rcc: add proper title
Date: Mon, 21 Nov 2022 12:06:09 +0100
Message-Id: <20221121110615.97962-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
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

Add device name in the title, because "Reset Clock Controller" sounds
too generic.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 242fe922b035..5194be0b410e 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/st,stm32mp1-rcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Reset Clock Controller Binding
+title: STMicroelectronics STM32MP1 Reset Clock Controller
 
 maintainers:
   - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
-- 
2.34.1

