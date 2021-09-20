Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F281411372
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 13:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 925151695;
	Mon, 20 Sep 2021 13:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 925151695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632136963;
	bh=V+0Ydy4XABqa0Dafxn2oK2O6VFS8B0r2iiKl4enw4gI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PXlewUI4i9YiEuaTiN31/H/tNbkYNex8SqHimO1AHl1xAnSxLF4eAR41McVNuXmfy
	 qREqmas6xZ/cd+YYUusbkwuDj8StdMQwdW+h3l9DRRg3iy7IkcLdeMjkVm0L3O/vWI
	 4jK1oVOqts5stxyOFvB3Ihhp35y7AzNzKQh3xw7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F03CCF80129;
	Mon, 20 Sep 2021 13:21:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68658F8025D; Mon, 20 Sep 2021 13:21:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 343F4F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 13:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 343F4F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="lk5VAaJP"
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DE81E3F32A
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632136870;
 bh=I2Bl07vONbEfi9yEVzej1wYQPepaUboDztwjIRW5t6c=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=lk5VAaJPKUVU/saksmecmXNTBzXFLxfgVm6qVmu89g6oAX8RRvj9lrKleSlBtK6MJ
 9eA2zFs4GGwxY9aLP/2QoeRe5/NlTOu29WueIl4aC2ZaztRT6RtoRwSKcKVkJPcVpX
 ZXDtwPx6FLmSCAFT1fLLocFh3wEOOzX9ipdhTeKSPcPnF+Cft46t8Q8PqK98rLemKS
 U+yeosYxnG9ADuRwSpGnG19FU0DIUNanuiRbSD6BGuw65Wtn12PalJpGaEihF9BUu6
 httj/NXiLmRokInL7m443UsV4ASMZJX6/mxvAzMpdrzqQp3fxydUrAtQLIk52R/Dyc
 N/9l1heIhilkw==
Received: by mail-wr1-f71.google.com with SMTP id
 v1-20020adfc401000000b0015e11f71e65so5809898wrf.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 04:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I2Bl07vONbEfi9yEVzej1wYQPepaUboDztwjIRW5t6c=;
 b=7+oAFIgsyV0guK71qJiCJ3SvSwVrOwJfmUtVdTjKoexXof24ufH54nejaecKC0FwxD
 ARUnrqGTnT6mNtH1RpwRLZgIoMBbFHS0WkNatto1j/KYyCHfg3qro3YWKe4PhDUi0iNR
 WJN1qwdDktnyrXhzqirgCzfrah9jZgyGikPAm1wG6Y0DErL5ufpc1D6JTWn9u+/vil/t
 OWGA7zKfxTNAY6aIzrwtqXJkix3AUEcXKOmnxX7NMRIEOpAtzE4+7ymrHQhf1KGZptqc
 NAC7yc4f9R0HJw8nBbtAOxAXMV5NAeuuNFULahIwlqPKLk7rXSBo6rL2b499Jp2KXOZJ
 fhyQ==
X-Gm-Message-State: AOAM531JT3kGWfPi0xeKWWe3EGDEpQmvYXCGG3z6Z70wH8ft6m3lL7XQ
 xY16u+kPeBefSEH+6isPcEZhPMHyo6c2hFZzVoIf493dETViHn/Jyr++DWH6BX7jWr89g97fM9B
 PqWNTlRiprnnO+ELVnGXorJR/ylrjlUPEq/Xd3H1H
X-Received: by 2002:a7b:c848:: with SMTP id c8mr20697842wml.187.1632136870501; 
 Mon, 20 Sep 2021 04:21:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKn0jNRJmIN+QLyVPFE4JlcLmEfhs0lY57DrjExIxaCNsxu3GXc7ms5w5ZEe76lcszwT1Ntw==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr20697831wml.187.1632136870345; 
 Mon, 20 Sep 2021 04:21:10 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id u25sm17199453wmm.5.2021.09.20.04.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 04:21:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: rt5682s: correct several errors
Date: Mon, 20 Sep 2021 13:21:06 +0200
Message-Id: <20210920112106.140918-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

Correct several errors in rt5682s dtschema:
1. The examples should be under "examples":
    'example' is not one of ['$id', '$schema', 'title', 'description', 'examples', ...

2. Missing type for vendor properties

3. clock-names should be an array:
    properties:clock-names:items: {'const': 'mclk'} is not of type 'array'

4. Example DTS should include headers:
    [scripts/Makefile.lib:386: Documentation/devicetree/bindings/sound/realtek,rt5682s.example.dt.yaml] Error 1

5. Node name in example DTS misses unit address and does not match DT
   convention (generic name):
    Warning (reg_format): /example-0/rt5682s:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)

6. Node address should be in size-cells:0 block in example DTS:
    Warning (reg_format): /example-0/codec@1a:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)

Fixes: 50159fdb144b ("ASoC: dt-bindings: rt5682s: add bindings for rt5682s")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/sound/realtek,rt5682s.yaml       | 47 ++++++++++++-------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
index fbf23696f1a7..7a5f1d0fd3e2 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -24,18 +24,21 @@ properties:
     description: The CODEC's interrupt output.
 
   realtek,dmic1-data-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum:
       - 0 # dmic1 data is not used
       - 1 # using GPIO2 pin as dmic1 data pin
       - 2 # using GPIO5 pin as dmic1 data pin
 
   realtek,dmic1-clk-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum:
       - 0 # dmic1 clk is not used
       - 1 # using GPIO1 pin as dmic1 clock pin
       - 2 # using GPIO3 pin as dmic1 clock pin
 
   realtek,jd-src:
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum:
       - 0 # No JD is used
       - 1 # using JD1 as JD source
@@ -63,7 +66,7 @@ properties:
 
   clock-names:
     items:
-      const: mclk
+      - const: mclk
 
   "#clock-cells":
     const: 1
@@ -79,22 +82,30 @@ required:
   - compatible
   - reg
 
-example:
+examples:
   - |
-    rt5682s {
-        compatible = "realtek,rt5682s";
-        reg = <0x1a>;
-        interrupt-parent = <&gpio>;
-        interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_LEVEL_HIGH>;
-        realtek,ldo1-en-gpios =
-            <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
-        realtek,dmic1-data-pin = <1>;
-        realtek,dmic1-clk-pin = <1>;
-        realtek,jd-src = <1>;
-
-        #clock-cells = <1>;
-        clock-output-names = "rt5682-dai-wclk", "rt5682-dai-bclk";
-
-        clocks = <&osc>;
-        clock-names = "mclk";
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@1a {
+            compatible = "realtek,rt5682s";
+            reg = <0x1a>;
+            interrupt-parent = <&gpio>;
+            interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_LEVEL_HIGH>;
+            realtek,ldo1-en-gpios =
+                <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+            realtek,dmic1-data-pin = <1>;
+            realtek,dmic1-clk-pin = <1>;
+            realtek,jd-src = <1>;
+
+            #clock-cells = <1>;
+            clock-output-names = "rt5682-dai-wclk", "rt5682-dai-bclk";
+
+            clocks = <&osc>;
+            clock-names = "mclk";
+        };
     };
-- 
2.30.2

