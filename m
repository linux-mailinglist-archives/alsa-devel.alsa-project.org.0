Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E30CB582C15
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 18:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708F71635;
	Wed, 27 Jul 2022 18:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708F71635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658940131;
	bh=RlV8VRgS0IBCl8kbcI86FCRuTya5OWlaNq2fJ2h92s8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A0U8TFWzKXL7VJ5Ttx12wpbzZCe+msoRa75MtQ8jJ2iYTOnpWq4a2JB0weNDJDJ0/
	 QpQgbc0MvyxtreGg2x93Am5lxeA1tj0SgEGFkKTdIvTJ0avfGzi3U+Gno07UbmmdZE
	 T8i4c0bfTCRZDB9ocT59TG1uY/NI8olbe4WaZY/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5DD1F80171;
	Wed, 27 Jul 2022 18:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51ADDF800FA; Wed, 27 Jul 2022 18:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0CFEF800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 18:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CFEF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vNCansP6"
Received: by mail-lf1-x133.google.com with SMTP id q23so14701563lfr.3
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pixZf6AxzKsbblWkPgEa/wCEjEyv0eH7Z0aYp8YUpGU=;
 b=vNCansP6Trr0iw18LZc9CTOYN+jcJ/hP3lk/BF0RUdZbtfbg4+HowoEuynrmouACf7
 o04lz9lo+1IVXZtXMMJbnuK7BmlaKr2DgxuLzRhQCQjpznp8J0FkmLp4zQ2LwUkfFMtx
 6urFZ06hO/g5AibAezm9Fi9ybD/kFR6al2ZO7slNIbPv4/cpuzQFFekqkwVBvSWv5vYs
 +OwBIm6YiNQs7Abkj2eMLulvzgZSIYUFyb923C+ovEiC6j7W3BijHM+ZaRTid7+ou1Jt
 Sk8bvlrPrQQwskCrr5ogokAmvMocGONqjWs48T6Pt2l5D/GVcDKT+p0pUTi9mGIN2LgH
 aAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pixZf6AxzKsbblWkPgEa/wCEjEyv0eH7Z0aYp8YUpGU=;
 b=ZCUClOwc5++XarsP4yIoI+6A02NWakA8n5QmDAgkRpg6O3kTbgwxileV3+JXYj4KvI
 iklHGvEAOkjc30qAzlceZ6zi7IWRYJEUJByUTgup9ZS8igRKywECig1fPo8S/Hyh0NLJ
 mnfHkJrCv9A271QLQe4Y5Hno3tP1q21jjCoA7VBZwEkEuVWeTsWxv8cdJhMGGTeqvCxz
 99XmpD7hGBwH8GBOgu0s3cyuz8XuDJvVcKOCAL7SdsCFC9FHjR69VbYfLg4TctS2BouK
 6R5V64WC3CspAK05YHn8O88am5EoNW7mPZrjGXtQdcdbU8i1kAdHtlJ0osE/ItsUJM7r
 thcg==
X-Gm-Message-State: AJIora/SvGo2GhGB910YGNnOEDk0rwWrtrX/2/x4Yelr2itxIAH1ZjJK
 ssNBKr97FKgVBd2FVia/lltAF6fD9m22Zqhh
X-Google-Smtp-Source: AGRyM1sEa8xnb9s4uf0W9nB9PCobLc+j3L3f+ElRoTRRKIH1ldBG30FknIESIJMvaO4t5rvFhQ1TEQ==
X-Received: by 2002:a19:6408:0:b0:48a:139e:67b7 with SMTP id
 y8-20020a196408000000b0048a139e67b7mr7923551lfb.203.1658940059516; 
 Wed, 27 Jul 2022 09:40:59 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 v3-20020a05651203a300b00478f174c598sm489358lfp.95.2022.07.27.09.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 09:40:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: use spi-peripheral-props.yaml
Date: Wed, 27 Jul 2022 18:40:50 +0200
Message-Id: <20220727164050.385241-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Instead of listing directly properties typical for SPI peripherals,
reference the spi-peripheral-props.yaml schema.  This allows using all
properties typical for SPI-connected devices, even these which device
bindings author did not tried yet.

Remove the spi-* properties which now come via spi-peripheral-props.yaml
schema, except for the cases when device schema adds some constraints
like maximum frequency.

While changing additionalProperties->unevaluatedProperties, put it in
typical place, just before example DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Technically, this depends on [1] merged to SPI tree, if we want to
preserve existing behavior of not allowing SPI CPHA and CPOL in each of
schemas in this patch.

If this patch comes independently via different tree, the SPI CPHA and
CPOL will be allowed for brief period of time, before [1] is merged.
This will not have negative impact, just DT schema checks will be
loosened for that period.

[1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/sound/adi,adau1977.yaml          | 7 ++++---
 Documentation/devicetree/bindings/sound/wlf,wm8731.yaml  | 9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1977.yaml b/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
index b80454ad97da..847b83398d3d 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
@@ -32,8 +32,6 @@ properties:
   reset-gpios:
     maxItems: 1
 
-  spi-max-frequency: true
-
   AVDD-supply:
     description: Analog power support for the device.
 
@@ -52,7 +50,10 @@ required:
   - compatible
   - AVDD-supply
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
index e7220e8b49f0..15795f63b5a3 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
@@ -52,10 +52,6 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
-  spi-max-frequency: true
-
-additionalProperties: false
-
 required:
   - reg
   - compatible
@@ -64,6 +60,11 @@ required:
   - DBVDD-supply
   - DCVDD-supply
 
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
 examples:
   - |
     spi {
-- 
2.34.1

