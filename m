Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934F641CAA
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Dec 2022 12:37:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C5061732;
	Sun,  4 Dec 2022 12:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C5061732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670153845;
	bh=t46D2lehaOd3iQnY7JUYoTG6PPTWgPcTcbR+D2aiC0U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CQJxZ/Cu/RB7spka9dk++JAJd6FwvBQd6cqVU/SSIiTrEshMMhvKUS120GczJ+Bq9
	 wa+uLSsx5H7EfrzFtAMwgaTDJj+gnI0dW81CP8u9em0Vk/xt0IVokaf28HkaabZuHD
	 fN7ORkWzKtFZY91f5jhTLgpZLaqgff69uR0DkWW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F4DF80155;
	Sun,  4 Dec 2022 12:36:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20347F8025A; Sun,  4 Dec 2022 12:36:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC40F800AE
 for <alsa-devel@alsa-project.org>; Sun,  4 Dec 2022 12:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC40F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iHSWCfoM"
Received: by mail-lf1-x12f.google.com with SMTP id p8so14394640lfu.11
 for <alsa-devel@alsa-project.org>; Sun, 04 Dec 2022 03:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQnmM+tbwGp1xjm6EZSQWhKQr6qx3wPe7/rpEovRxCE=;
 b=iHSWCfoM2DsUGan2y+UsdRNgZYt9qnt1mCs/08M91Nr2hm/gsydZ26zVvLXnUs5zE2
 02s98zcI86ueIErQqw+GggAK1BG2cfexSJbwRmaLN0Ctddu1pzgZKhFrCTi105+DNjlV
 20NCT54gJM+NEeD9RYLKHBcL2BmzW+jlEIu4gQnCDC/nBILxCNxBHC1KKGJoF0W9DSdm
 RUBUOXnt91SBnd5qJCOr5I5nOEePAZPhZk9p474cPOm8QHBJ1y7Hqj3k0yaPZITL9J1n
 10jyDocD1Kc4N9Pqj80eovu3TcGqEaSL1W1cd+jg0GYKekKX8vhoR94e8EpN5+WNGPMX
 3iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZQnmM+tbwGp1xjm6EZSQWhKQr6qx3wPe7/rpEovRxCE=;
 b=XXxjUqYEBdmChc/8wQI7rWOvpA55aGYcRKcU7EKHfgpni2qhjHcFlRiY0sQUgPoaL0
 dFg6I62XE9mrjd8h4I/uMX6zGDLCrZljsvUCuDDDCHy0Zh0oXqCouRuLJZ2Fa+ownXOg
 mMV5LvbGh+hM8xtPCGwcpkIMqUBKYYwD102ZHYHrYEXGhtLqKyqbQWOkBJIl+OzSz0wY
 oblzgMi+K9f4AI0l2Dcr72jFRbl9fMhG74j9vzyRKJFLUOgVb8w6ZXXoqOIxGxkRKea5
 ElErlQ3z4fZjm1jXNP0ExCvA0NCR/GtgHgNaQVhrjxJTvfj1xxoYBw61hc7y4Pr7zUu/
 9oYw==
X-Gm-Message-State: ANoB5pktIm/3r8O6l4evXjPvOabB+GhoQQByEV4OAJ1TxcDTs7fEGwwn
 u1T2bOexWkTRc1OYO2yRtEKDRA==
X-Google-Smtp-Source: AA0mqf6gsHCWXt2fpz1ejjG10S9Wwiec/P26LeDcw2/HmjdfxG25h/zsFmoJ4CfF2sEUUwZ4bn4irQ==
X-Received: by 2002:a05:6512:2a97:b0:4a2:5522:d37c with SMTP id
 dt23-20020a0565122a9700b004a25522d37cmr25307066lfb.662.1670153783740; 
 Sun, 04 Dec 2022 03:36:23 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a2eb753000000b002778a9b0c34sm1097107ljo.45.2022.12.04.03.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 03:36:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: maxim,max98504: Convert to DT schema
Date: Sun,  4 Dec 2022 12:36:21 +0100
Message-Id: <20221204113621.151303-1-krzysztof.kozlowski@linaro.org>
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

Convert the Maxim Integrated MAX98504 amplifier bindings to DT schema.
Few properties are made optional:
1. interrupts: current Linux driver implementation does not use them,
2. supplies: on some boards these might be wired to battery, for which
   no regulator is provided.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/max98504.txt    | 44 ----------
 .../bindings/sound/maxim,max98504.yaml        | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/max98504.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98504.yaml

diff --git a/Documentation/devicetree/bindings/sound/max98504.txt b/Documentation/devicetree/bindings/sound/max98504.txt
deleted file mode 100644
index 583ed5fdfb28..000000000000
--- a/Documentation/devicetree/bindings/sound/max98504.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Maxim MAX98504 class D mono speaker amplifier
-
-This device supports I2C control interface and an IRQ output signal. It features
-a PCM and PDM digital audio interface (DAI) and a differential analog input.
-
-Required properties:
-
- - compatible : "maxim,max98504"
- - reg : should contain the I2C slave device address
- - DVDD-supply, DIOVDD-supply, PVDD-supply: power supplies for the device,
-   as covered in ../regulator/regulator.txt
- - interrupts : should specify the interrupt line the device is connected to,
-   as described in ../interrupt-controller/interrupts.txt
-
-Optional properties:
-
- - maxim,brownout-threshold - the PVDD brownout threshold, the value must be
-   from 0, 1...21 range, corresponding to 2.6V, 2.65V...3.65V voltage range
- - maxim,brownout-attenuation - the brownout attenuation to the speaker gain
-   applied during the "attack hold" and "timed hold" phase, the value must be
-   from 0...6 (dB) range
- - maxim,brownout-attack-hold-ms - the brownout attack hold phase time in ms,
-   0...255 (VBATBROWN_ATTK_HOLD, register 0x0018)
- - maxim,brownout-timed-hold-ms - the brownout timed hold phase time in ms,
-   0...255 (VBATBROWN_TIME_HOLD, register 0x0019)
- - maxim,brownout-release-rate-ms - the brownout release phase step time in ms,
-   0...255 (VBATBROWN_RELEASE, register 0x001A)
-
-The default value when the above properties are not specified is 0,
-the maxim,brownout-threshold property must be specified to actually enable
-the PVDD brownout protection.
-
-Example:
-
- max98504@31 {
-	compatible = "maxim,max98504";
-	reg = <0x31>;
-	interrupt-parent = <&gpio_bank_0>;
-	interrupts = <2 0>;
-
-	DVDD-supply = <&regulator>;
-	DIOVDD-supply = <&regulator>;
-	PVDD-supply = <&regulator>;
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max98504.yaml b/Documentation/devicetree/bindings/sound/maxim,max98504.yaml
new file mode 100644
index 000000000000..23f19a9d2c06
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98504.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98504.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98504 class D mono speaker amplifier
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  Maxim Integrated MAX98504 speaker amplifier supports I2C control interface
+  with an IRQ output signal, PCM and PDM digital audio interface (DAI) and a
+  differential analog input.
+
+properties:
+  compatible:
+    const: maxim,max98504
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  DIOVDD-supply: true
+  DVDD-supply: true
+  PVDD-supply: true
+
+  maxim,brownout-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 21
+    default: 0
+    description:
+      PVDD brownout threshold, where values correspond to 2.6V, 2.65V...3.65V
+      voltage range.  Property also enables the PVDD brownout protection.
+
+  maxim,brownout-attenuation:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 6
+    default: 0
+    description:
+      Brownout attenuation to the speaker gain applied during the "attack hold"
+      and "timed hold" phase, the value must be from 0...6 (dB) range.
+
+  maxim,brownout-attack-hold-ms:
+    maximum: 255
+    default: 0
+    description:
+      Brownout attack hold phase time in ms, VBATBROWN_ATTK_HOLD, register 0x0018.
+
+  maxim,brownout-timed-hold-ms:
+    maximum: 255
+    default: 0
+    description:
+      Brownout timed hold phase time in ms, VBATBROWN_TIME_HOLD, register 0x0019.
+
+  maxim,brownout-release-rate-ms:
+    maximum: 255
+    default: 0
+    description:
+      Brownout release phase step time in ms, VBATBROWN_RELEASE, register 0x001A.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@31 {
+            compatible = "maxim,max98504";
+            reg = <0x31>;
+
+            DIOVDD-supply = <&ldo3_reg>;
+            DVDD-supply = <&ldo3_reg>;
+        };
+    };
-- 
2.34.1

