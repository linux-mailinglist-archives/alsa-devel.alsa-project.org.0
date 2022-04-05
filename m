Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99B4F8FE1
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA0218FA;
	Fri,  8 Apr 2022 09:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA0218FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404296;
	bh=DobduZYAxuDiENdohSco4jPDSScRK6HkIMBA9Yz/0gQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=obcZ0TOBqD3hg21pWWbX0QauPfqG12d0RmV6WQlMeaRtpyNHs1HD+430T/Apsu+gV
	 sZE1ncumBwp0gb8BJea6AyDT6JuNXjreN39njGDMaprQcKupmRAFp5WfDnBoA28o9P
	 W2gnBsHzxZhMj/6JZQ+vTXKs9sXH84XLirwasEwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05080F8053C;
	Fri,  8 Apr 2022 09:48:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D90DF8016A; Tue,  5 Apr 2022 15:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECD71F8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD71F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kyQCz7eR"
Received: by mail-pg1-x533.google.com with SMTP id k14so11070449pga.0
 for <alsa-devel@alsa-project.org>; Tue, 05 Apr 2022 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=qNMoaRsTV11CxbP46Q/aEOd5l9nDe65UVEmEmIkF9i4=;
 b=kyQCz7eRwKo769R+hQc8TsW/kdxVcfdx8xcIRM+nXMCNhK9eXoc2SgRuDFb3IxyDyE
 lgiglyFdaDKyDjhB1Wree3GRFiyHKBg/OVEOFyDM6AxEIHj3RpIzvVZAhTj7Ihqe2ZZI
 HJWzP3TN/I1QuY91UVx/CtxKqSy7JqGhGVHa6qRfBp13xulgU8Oc5G30Q/AbZsgiLJLy
 xZCWGqtJ7nMuthLoYz7ScSu3Ig6e2Kn4rvVgLtzMw0i/wI+JD72xDyhps9f2fgS2vnLf
 CZWexm/ZybzjbbleOI0LqUcMFJLDGR9ulQ5rWrSW8PdI0+qCfRsY0M1te5IIqff3irj3
 mH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qNMoaRsTV11CxbP46Q/aEOd5l9nDe65UVEmEmIkF9i4=;
 b=fu8NKNMflm7QaVxQTvdLnHIa3eBJbfcir4nyFZoubfaOpm9K55MqgKTBzOdUvoSbuY
 We4NkY7+4ATCEPOdlRo+J5phwIFd00Wtcv25T9R6IQ7ltyuJ8yM+Qwk9dyOV8/IaoApv
 U5JUzYAHyRe3jsz2ULAYpxncQaNllA2yh890V+rFZ9XlMsGtzo7IKDYDD+qXcEYQlevf
 5eeelNHn+oUCuQRqduVfUyjJs77RGVUUKzd/QV0KBpgiJFoZ2gxCf+TrkOZaSu/hHIDh
 ftuHSkx81NnpckKGziDJCVmEFCeRtjff/7fQokXalL6m1SC1HZVerkyXR3uHDbqAJPsj
 feRw==
X-Gm-Message-State: AOAM530fYGy1vbBJwz7BsKmK5idXBZvJzJePLYFhgNYn9ljwr2cMsIhC
 mbf6GuG3Bb9Y2T55ATYD/jlWh6jzxgQyeLpy
X-Google-Smtp-Source: ABdhPJyknAMTMYWJpIGG+NGOYcaDkOR8WMRPwc2KeL41LtHPbuTQEalDcx7Dp5R+/F7USqUrLPPnhA==
X-Received: by 2002:a65:645a:0:b0:386:53e:8d61 with SMTP id
 s26-20020a65645a000000b00386053e8d61mr2864171pgv.166.1649165501071; 
 Tue, 05 Apr 2022 06:31:41 -0700 (PDT)
Received: from localhost.localdomain ([116.232.54.164])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004fb44e0cb17sm16184540pfw.116.2022.04.05.06.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 06:31:40 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: add support for ES8326 dts
Date: Tue,  5 Apr 2022 21:31:21 +0800
Message-Id: <20220405133121.2655-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: Zhu Ning <zhuning@everest-semi.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com,
 yangxiaohua <yangxiaohua@everest-semi.com>, tiwai@suse.com
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

From: yangxiaohua <yangxiaohua@everest-semi.com>

The ES8326 codec is not compatible with ES8316 and requires a dedicated driver.

This is a separate patch for ES8326 dts

Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
---
 .../bindings/sound/everest,es8326.yaml        | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
new file mode 100755
index 000000000000..8cae9c328dbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8326 audio CODEC
+
+maintainers:
+  - David Yang <yangxiaohua@everest-semi.com>
+
+properties:
+  compatible:
+    const: everest,es8326
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+  mclk-rate:
+    description:
+      clock rate of mclk
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+
+  everest,jack-pol:
+    description:
+      just the value of reg 57. Bit(3) decides whether the jack polarity is inverted.
+      Bit(2) decides whether the bottom on the headset is inverted.
+      Bit(1)/(0) decides the mic properity to be OMTP/CTIA or auto.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minimum: 0
+    maximum: 0x0f
+    default: 0x0f
+  
+  everest,mic1-src:
+    description:
+      the value of reg 2A when headset plugged.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minimum: 0x00
+    maximum: 0x77
+    default: 0x22
+
+  everest,mic2-src:
+    description:
+      the value of reg 2A when headset unplugged.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minimum: 0x00
+    maximum: 0x77
+    default: 0x44
+
+  everest,amic1-src:
+    description:
+      the value of reg 23 when headset plugged.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minimum: 0x19
+    maximum: 0x29
+    default: 0x19
+
+  everest,amic2-src:
+    description:
+      the value of reg 23 when headset unplugged.
+      Set to 0x19 if dmic used. Set to 0x29 if amic used.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minimum: 0x19
+    maximum: 0x29
+    default: 0x19
+
+  everest,jack-detect-inverted:
+    description:
+      Defined to invert the jack detection.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      es8326: codec@19 {
+        compatible = "everest,es8326";
+        reg = <0x19>;
+        clocks = <&clks 10>;
+        clock-names = "mclk";
+        #sound-dai-cells = <0>;
+        mic1-src = [22];
+        mic2-src = [44];
+        amic1-src = [19];
+        amic2-src = [19];
+        jack-pol = [0e];
+      };
+    };
-- 
2.17.1

