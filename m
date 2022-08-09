Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE958DC14
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 18:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE20E850;
	Tue,  9 Aug 2022 18:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE20E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660062585;
	bh=3TD4LmnEcqhZov+8pJNe/fVEMfRWmiLi+39y56h+xR8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAa1iudDS9dQHXhU3qaMLdXrzIwa75HJ9OCk2taofXnnaMgIocdf8FA7l3OkilqF+
	 gfu84IJadzw7AwudKfQMhBtvjHeSbro/PZKZaN6aVDEfaLDEdDBQPYvFC5fxRz/BOa
	 UpHkPkLYuIGIMeB8lQ7qZ0jROBmU4J9hVDXwWSBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8038CF80551;
	Tue,  9 Aug 2022 18:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35455F8054A; Tue,  9 Aug 2022 18:28:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF465F802A0
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 18:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF465F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n9b8Cvea"
Received: by mail-lf1-x131.google.com with SMTP id o2so10389805lfb.1
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FskYPTv76833n+1Hq30omnxb9L5MZLnaEUwuBASTaa0=;
 b=n9b8Cvea5EVIT7ZHPBapKzhf/u8xMO3geKItvh4tXL5VfoRjWNI0D2590zpirb8aPY
 T6Qhg9ZxvmhiQZt94wtqCAOdbxAyeYNu720/AI9yUJES8KaGF0Xe2/EltRejIw/bs6CJ
 OWqBJZfbYEOClWPMwzI4Rp8pTeVnZv/F1nDJCJQg9dlD9layQ6Ni+I/DedxKO1fdf7lJ
 L6cEBSbhbSuwxg9TdWGECrJwq5UFvA6tt4ZUoLz4oboMxMfzccOAkHM1CUEI7ZGk3GTk
 UgQOveV1H6a2yLhKI65F7ePdq5dusok+lHZFEWDtmAqxGILLEhWQWprWrBUHBPusdbtz
 vy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FskYPTv76833n+1Hq30omnxb9L5MZLnaEUwuBASTaa0=;
 b=XM8vXXAJVhZ/2UXxEp21l2FAespNyJB6ri3iuoyQfmKBbSHpHclO29ExUpDDXZIIlo
 AHu2LvbWYpNm2Z7OVsO/Zooa/ok4E6zRQVPjqDwmTGly4Jqgd5XbnyYX0vKvKrlwzAXB
 x9fkFZyjA4RXSRRJjJJPFqiWIfMeyOOdiCD/kDQ0ztbaBlVKK46m7WBcp2Z8qOK7yw+S
 EoGFT0Zfkehht0UMCjDzQS8Q4HQHfu7czy/vfxKCKCeSVbue8mowliDGnns6oHXCakR5
 uyCB4o1KpxEYp7/9mkwf8dN9wz3n4AnD0t0fNrlAZpctDvhQaAu+VaCXuK4uC3WiTm/r
 LL5w==
X-Gm-Message-State: ACgBeo34lcdXuGx28X2IHET5y/D6KGqD3diiKVHRpka11HnzenPkp2ut
 AXix8eHHjEJ1aA/ogbf60v3/lA==
X-Google-Smtp-Source: AA6agR767hSt1vi/jf4SWD0G245jpJ0a3tCpFTASnOz48JrJ7rf8nR0ufvWHqiESt46jw+PhIubt1Q==
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr7842204lfa.380.1660062483418; 
 Tue, 09 Aug 2022 09:28:03 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:28:02 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: Drop Robert Jones
Date: Tue,  9 Aug 2022 19:27:51 +0300
Message-Id: <20220809162752.10186-5-krzysztof.kozlowski@linaro.org>
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

Emails to Robert Jones bounce ("550 5.2.1 The email account that you
tried to reach is disabled").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

For maintainers entry see:
https://lore.kernel.org/all/20220808111113.71890-1-krzysztof.kozlowski@linaro.org/
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

