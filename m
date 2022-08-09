Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A258DC15
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 18:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D57AE8;
	Tue,  9 Aug 2022 18:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D57AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660062598;
	bh=vuIX3rTSg6qzuHDbt3forNFkJzZDFsetzpSUIS+0oeg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRWvl29CXPPqF5DkvvCarwrMTrMeymCfD0gYZVGKHiHhulUwH4AsaCrfegq3He8Y2
	 NveeTGoW7BnQ09cS2y0UHw+lxMCaz2A4H3GuCc/PXctLRpOXZZ5fapW7qa+gsfGN4n
	 tPoqu3DHGdNK30gj21Hod6zcppSzeFKzZgYDy6MM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFE0F8055A;
	Tue,  9 Aug 2022 18:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEAD8F80549; Tue,  9 Aug 2022 18:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDA4BF800E8
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 18:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDA4BF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ICG/3Y0P"
Received: by mail-lj1-x22f.google.com with SMTP id v10so10026801ljh.9
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvjM538Lt57aPAtY3bjfgbW8emF1tmOhCzp45F4HTBs=;
 b=ICG/3Y0P4RWgA/0Gi/4UlpWVRyTdyma//p23F60dT0+Zmw3VXvEqVGA5ukzEv+cw2t
 PnWHJ99YeOEmlzLjMF9eAACAKuU7E1VvZ8UeYybhftlXIDyduv8eOqYd7Fm+zF+1mXws
 bzmQoxqiwasnz+YqZtVqpfpQacvrfybziWBylA2q9ia2G/5HJiSA+mqhSx4FIBF0yYEK
 b8Xkwbr0Mh61hsjdAUOMku/GiQW51z6ykQ/t9abh5f+VkoRpAP7VfIEEu0R2AAgysp7O
 UA1RmYBz2NzfEidhLjPpQ5vQ3muEqkJ5DE7PX6mVHQuay4bboakfxaxkS5MZB6JEhCuz
 SgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvjM538Lt57aPAtY3bjfgbW8emF1tmOhCzp45F4HTBs=;
 b=M7LwLsQcE+9QGQjyhfsntJ4QUFLbi5DcFqRcA5UACcTWj93KlwS7eEt75C0KWjpMq4
 oNsa0razHK33vvT0Xxaj+rV3531JIKyreJXvbZYOCuwRa3NN83j+RF4wCIqkiWvhpXj0
 M6pBYAIfjAwi1vRMuckWhacA6nFxEMa698buB4vSbFCp+zdkNDUZh5TvxyoSCKf9AZZR
 IeZxpe211htZn9qqqI03Zx5qFV8G3XwvJXTPzRKdxV7M63rNBasE8v/U58+1OTWnLm24
 dHkYjgDCOr4zkKlhYIv00vqBKHcFC7C5hXb6uZoOvS20W2kKLQolxY3uczguY1TSQ2iO
 FslA==
X-Gm-Message-State: ACgBeo1RopCP4ZJfmBUQpk5WXpoutfrFR4L7rSym0XTWHpHfRqM9ZfXo
 fUs4tybdw5FaNon8I/5me5Afvg==
X-Google-Smtp-Source: AA6agR4nSP4Nvz03+ppBOMLl8U1WhyjNooB6UiKwR/ZbuBfV0W58Zp1a5YPASidYywxtpOignuTHhw==
X-Received: by 2002:a2e:a884:0:b0:25d:d8a2:d18c with SMTP id
 m4-20020a2ea884000000b0025dd8a2d18cmr6982978ljq.305.1660062478560; 
 Tue, 09 Aug 2022 09:27:58 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:27:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Tim Harvey <tharvey@gateworks.com>,
 Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andrew Davis <afd@ti.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 1/5] dt-bindings: iio: Drop Joachim Eastwood
Date: Tue,  9 Aug 2022 19:27:48 +0300
Message-Id: <20220809162752.10186-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

Emails to Joachim Eastwood bounce ("552 5.2.2 The email account that you
tried to reach is over quota and inactive.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
index 7c8f8bdc2333..9c7c66feeffc 100644
--- a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MMA7455 and MMA7456 three axis accelerometers
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
   - Jonathan Cameron <jic23@kernel.org>
 
 description:
diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
index 6404fb73f8ed..43abb300fa3d 100644
--- a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP LPC1850 ADC bindings
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 description:
   Supports the ADC found on the LPC1850 SoC.
-- 
2.34.1

