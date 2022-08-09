Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855B58DC13
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 18:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30AAF82A;
	Tue,  9 Aug 2022 18:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30AAF82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660062574;
	bh=7bvYpzB1jMllPb6WTP3CWIV6IdikHOwX8Pl9cDgNZTw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bpqWWJv+Ns4BvGuSxVfU88urwDtyl/uFGe2Ts/P/cuxMaEkxVPeIwdRQA8slLanH/
	 TTHPvT8eskRvAJKKoAdoVXQpoMr4ZOkjDQgXhkgXSFM5HVowzxVMqn/BavIxuLF+Vu
	 4Ew1S8SUhdcY0Msb1S7Us0AVAlBXy4jt6cbsOIMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D929F8054A;
	Tue,  9 Aug 2022 18:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC23F80551; Tue,  9 Aug 2022 18:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6171FF80132
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 18:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6171FF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="j79cXYWF"
Received: by mail-lf1-x12a.google.com with SMTP id d14so17668258lfl.13
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQqWBeEw3qmpRlqqPzE7ts9pNLZupNqxFvrZxuptWIw=;
 b=j79cXYWF8zWqA57u666uDxDQhQSxVG4iHrBRVvIitGuWL3K37eFf18TlAp2CYAcAvf
 k/cvVQQag/Jn2M+i8GJ41Ar4NcO7nre1mhTl3A36V6Xpsz5Bni6NO6pWjwavxsWPrVKH
 tI2kusCmuH3F6Uj10cVQ7EftmfmtzZqnopM958bWnpYTWKObaSzu8zXuyOITi5j/onEB
 Z5plD+zVaKsjLLhb1QmZOqK/3L6VJq4eVxpgqk2QwugxZCTU4evWptwT62bEmnhwWHa3
 npd0xSDsOVJhgvboIJTo/8h8iegXTYZgZPwn74VBjOtej/oGhF6hMzRQwVs/4J0epcPt
 5XAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQqWBeEw3qmpRlqqPzE7ts9pNLZupNqxFvrZxuptWIw=;
 b=HAs6SKJrPOaxOnMOP7tuC/2/MW/D+miLAaqndgtPRmXfInr7NmikiUvO/zlIEDF/nL
 GzSkgzQLVisoAu9Eiq4VGnCSxTFomhyUX2LcUJyIGXXpjD41ht2b5VS2YFwfK2AV6xKN
 3+DvVAs9aucgueVZM5xv3PspiqHkXbAlk7yCMGSz9dd9gMDGyN1y6jDW0CpBEMmtegAM
 CrbX0f91W/Hb6/SlsLzbgQ7kWKzEt1VOuwW7NxziMXLaBVuA+2qCDP87A3EMEFUPA+7f
 f3eq3hNGZyWB5uieb9PXCkQyLBpxnuH5A79izWZTU4OFQx9xRNQ6FJVIUwnA4786jPIx
 qO1g==
X-Gm-Message-State: ACgBeo0l1eAZvxJQ7YGgjUF+MbYe4CBHyIeQzzcbn3XZ5QPO7pFK3rLD
 zk/8jTncHPEdIrBHaiwrnJk3Lw==
X-Google-Smtp-Source: AA6agR7eDE6idEdhMhZWlMx2pyUpEsLs29Q4eIc0ackncepXx/MXNZjkccFDQoE9WCyEbZAey+9A4A==
X-Received: by 2002:a05:6512:3b06:b0:48b:239e:be with SMTP id
 f6-20020a0565123b0600b0048b239e00bemr8058254lfv.586.1660062480249; 
 Tue, 09 Aug 2022 09:28:00 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:27:59 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: iio: Drop Bogdan Pricop
Date: Tue,  9 Aug 2022 19:27:49 +0300
Message-Id: <20220809162752.10186-3-krzysztof.kozlowski@linaro.org>
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

Emails to Bogdan Pricop bounce ("550 5.4.1 Recipient address rejected:
Access denied. AS(201806281)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
index 54955f03df93..ae5ce60987fe 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Texas Instruments ADC108S102 and ADC128S102
 
 maintainers:
-  - Bogdan Pricop <bogdan.pricop@emutex.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 description: |
   Family of 8 channel, 10/12 bit, SPI, single ended ADCs.
-- 
2.34.1

