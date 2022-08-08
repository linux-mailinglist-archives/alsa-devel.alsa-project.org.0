Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2258C6EE
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 12:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BFECAE9;
	Mon,  8 Aug 2022 12:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BFECAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659955806;
	bh=UaJHi2WauUAFOzhz18nClfGbOLyiBnInV0m78VaPSYE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HfITkkiv1QzZlccLW+8wxYiTX4kFE+zhLfX8GjmW0UYRtYmWGzmYcVC3JHb1F+yAq
	 3CXu8AF2n6FJLiiLwpBsCPeaif8LhNqQRWuUjUlIDMLZ7peWLkxa6th/jXCc6SO8xa
	 TLPEP+ulywb6i4XR4lgo0DLcaaa7YHdyqpGWA5uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A927EF8055A;
	Mon,  8 Aug 2022 12:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8972F80558; Mon,  8 Aug 2022 12:48:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70B3BF80430
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 12:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70B3BF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CuVZZAuR"
Received: by mail-lf1-x134.google.com with SMTP id t1so12057409lft.8
 for <alsa-devel@alsa-project.org>; Mon, 08 Aug 2022 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2me5XEAf0ofFirE+9ir/dwTvKRWjjaESV5ln3eJw2Hw=;
 b=CuVZZAuRK7wnpkN4SgjBYiCNJctDMSXGAa5tukH+acTFa5KoHplR3S6yO3Zg8IsTiK
 FXfKau4gB1IULpTxjrFJGwFlVnDp2FSRo0mLHy6Rr4Y0fJuivOjbk1wTypPV2+Y8TtNh
 qXkp3tkgVqzVAbaoGMkBF0u+nLxe4qLWkA1wAjIVCz5MhKCOr4RmSxPKVFcHxPBfzSrI
 Xy5SMIO5qZja0iBGcYJvDkQuCUEQHuqcneGCV+jiN6MTbhzmsrWKUjlOS1BD+qYyfRxX
 NOmyfe5nGk1MU7HPF9NGkLXVnPK1QScHtKSpOeih02tYIzIsjds2LJgApgk7bpfbgt0B
 Vg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2me5XEAf0ofFirE+9ir/dwTvKRWjjaESV5ln3eJw2Hw=;
 b=aPq1rkvlME9CRApnOeTMO5xkew8Rn/dPMS4SUo3qK9k0IIdqY+TgssOTpbs5wtstLs
 J9bZdZxrr1nOsOwqIHJvhj50VRSzWFwlhshIXsiYBUxHVJzvE34Y5/9qvpKs2akWz1FL
 oHPWIU9EZYBPZdFNVodbY5ggMzTANlBnw5cBX93riYhK+2+GUu4z3wUotAHmUlR85BL4
 38j+C99fvNTcJx+qesnQf/RDitW+VBOKuSbUnmkhRt5LkhvB8QYMNj9D3bQRy+PcMmus
 fT7Mv9HhJvsP2ecT0hZ9e081jsDhSdxg2PuNXDXGoqojYjMG10fSGW8qKLq2NgQT8YBa
 ZJAg==
X-Gm-Message-State: ACgBeo0+WROrJQKQ+J93fm0mgYHopxPntuHkYPQp9Pi9Lx4ZGu6kiJXx
 SYScfMW+Xaw7K0HZDZbaxWGaQw==
X-Google-Smtp-Source: AA6agR7SHBGl5VdYjMKVL5UzdrTUUcHRsum2qdgVfy4yK3qFurC9b/riPzx+QLdQbigJ4aBmocHf2Q==
X-Received: by 2002:a05:6512:3d0e:b0:48b:3976:b319 with SMTP id
 d14-20020a0565123d0e00b0048b3976b319mr5532909lfv.362.1659955673039; 
 Mon, 08 Aug 2022 03:47:53 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a2ea312000000b0025e040510e7sm1314321lje.74.2022.08.08.03.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:47:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Tim Harvey <tharvey@gateworks.com>,
 Robert Jones <rjones@gateworks.com>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ricardo Rivera-Matos <r-rivera-matos@ti.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 4/5] dt-bindings: Drop Robert Jones
Date: Mon,  8 Aug 2022 13:47:11 +0300
Message-Id: <20220808104712.54315-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Emails to Robert Jones bounce ("550 5.2.1 The email account that you
tried to reach is disabled").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml | 2 +-
 Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
index 479e7065d4eb..0203b83b8587 100644
--- a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale FXOS8700 Inertial Measurement Unit
 
 maintainers:
-  - Robert Jones <rjones@gateworks.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 description: |
   Accelerometer and magnetometer combo device with an i2c and SPI interface.
diff --git a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
index 5a1e8d21f7a0..5e0fe3ebe1d2 100644
--- a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
+++ b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
@@ -19,7 +19,6 @@ description: |
 
 maintainers:
   - Tim Harvey <tharvey@gateworks.com>
-  - Robert Jones <rjones@gateworks.com>
 
 properties:
   $nodename:
-- 
2.34.1

