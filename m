Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2F268F2CF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 17:06:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7346D836;
	Wed,  8 Feb 2023 17:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7346D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675872367;
	bh=RBkyhn4cfOW9DG7kJ+ZjWF/DLGpPp13q1O/Sk0c88qU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Db7GIqH7MU4/4jPtcKrp672d3dpC53CgRQklChHIdkYGKVvKFqf2MIk41jvQYWcee
	 KEYCfCWcuKTD8CAaeAoumMniJix2C/uYg0wtmewfedjLEPP9SGgzsWqW7ZmvIBQpvS
	 N5TFrDXH5/p3vzhO7zOlXN4g4JgEtrerBFG6HnXo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A8BEF80224;
	Wed,  8 Feb 2023 17:04:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BF9DF804CC; Wed,  8 Feb 2023 17:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D478FF800E4
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 17:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D478FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Edc74Fsg
Received: by mail-wm1-x32e.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1848321wmb.5
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 08:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3CDLhH74FCeSUPTOHzbalK9eb79PCH4NRsNL5rLPMM=;
        b=Edc74FsgmKXLOG0ZR6HQjwP9yftQcJizuP+WZlO9qUoJcFg7kg8qut22i1j8qOLwxu
         1bTWi4XRAeDnOIps51NKqboATk3FGa+C7fy6JsQF294KpLb6OnWD65NoEdJ3I/WBPjSn
         yxSHzTnH+39143fhysMVHRwrQs07TeMJggyX5/ee9kp/hdpGGmnVjoLhkYgEOedfuRbC
         z0mAyCTkgnWrTom0VpzZHujQGrk4bZJCZ9PW8o8Myq4A16un3K5CN9B3e/hqsTccu1UX
         e2k+HjkrdQn9/S9OtbrhfAVes0as0stPG/LASwHdlu5k45Ptgj2Zs23K8LiCfBn2dxjT
         8h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3CDLhH74FCeSUPTOHzbalK9eb79PCH4NRsNL5rLPMM=;
        b=kE5Yqy1Ujl+9qfsB2bOu6mYlK7ep+Ct3vHVL35mjS7+89xGJ8gB9w2YFf3Etehk/+x
         nMrg2gWrVh3vea+sNetRJ+fCGj3wSor8203NeAGhBV3xnNfkVS9F08rYGVHkak2SdF4f
         QRb22MSffIiF897SrFb2jj8AP22RvqYgUXB+TJ0J9HkLEIGYpGFazSdfrPnbUSR39a2n
         gKgQnzw/A5iM2r94NzwRaz1gHimo4PBdFuBmvTeE2dvtaXLH93lNLDuG76EZqTt0bFTh
         IdwtDTxHVZGgy0RkKQXpvZMkrbkD2x7c0rXCvOfxMNquKP+1rD+E7qR2urO7if87nwYJ
         ZMgw==
X-Gm-Message-State: AO0yUKVzNj3CuygDOufOPByZbWp/xWIvbjiR/AYRLSZnzzI79YFUwuOQ
	JoqvLb/oVEIeoXJd2AmxxbHDwQ==
X-Google-Smtp-Source: 
 AK7set8rRNl5+WiwFKafSSJy9OG2By4H+IU1mLIA2v3InH/jpHuaUb65+tJa2NrGIG7RJ8JoJ4YQdw==
X-Received: by 2002:a05:600c:328f:b0:3dc:5674:66e6 with SMTP id
 t15-20020a05600c328f00b003dc567466e6mr7093228wmp.25.1675872253263;
        Wed, 08 Feb 2023 08:04:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c2e1200b003dd1b00bd9asm2169890wmf.32.2023.02.08.08.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:04:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: maxim,max98090: Convert to dtschema
Date: Wed,  8 Feb 2023 17:04:09 +0100
Message-Id: <20230208160410.371609-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XJK2YL6IC7DEMVGIFUIBP4L75PDWE5RX
X-Message-ID-Hash: XJK2YL6IC7DEMVGIFUIBP4L75PDWE5RX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJK2YL6IC7DEMVGIFUIBP4L75PDWE5RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Maxim Integrated MAX98090/MAX98091 audio codecs bindings to
DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/max98090.txt    | 59 -------------
 .../bindings/sound/maxim,max98090.yaml        | 84 +++++++++++++++++++
 2 files changed, 84 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/max98090.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98090.yaml

diff --git a/Documentation/devicetree/bindings/sound/max98090.txt b/Documentation/devicetree/bindings/sound/max98090.txt
deleted file mode 100644
index 39d640294c62..000000000000
--- a/Documentation/devicetree/bindings/sound/max98090.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-MAX98090 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-- compatible : "maxim,max98090" or "maxim,max98091".
-
-- reg : The I2C address of the device.
-
-- interrupts : The CODEC's interrupt output.
-
-Optional properties:
-
-- clocks: The phandle of the master clock to the CODEC
-
-- clock-names: Should be "mclk"
-
-- #sound-dai-cells : should be 0.
-
-- maxim,dmic-freq: Frequency at which to clock DMIC
-
-- maxim,micbias: Micbias voltage applies to the analog mic, valid voltages value are:
-	0 - 2.2v
-	1 - 2.55v
-	2 - 2.4v
-	3 - 2.8v
-
-Pins on the device (for linking into audio routes):
-
-  * MIC1
-  * MIC2
-  * DMICL
-  * DMICR
-  * IN1
-  * IN2
-  * IN3
-  * IN4
-  * IN5
-  * IN6
-  * IN12
-  * IN34
-  * IN56
-  * HPL
-  * HPR
-  * SPKL
-  * SPKR
-  * RCVL
-  * RCVR
-  * MICBIAS
-
-Example:
-
-audio-codec@10 {
-	compatible = "maxim,max98090";
-	reg = <0x10>;
-	interrupt-parent = <&gpio>;
-	interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_LEVEL_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max98090.yaml b/Documentation/devicetree/bindings/sound/maxim,max98090.yaml
new file mode 100644
index 000000000000..65e4c516912f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98090.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98090.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98090/MAX98091 audio codecs
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description: |
+  Pins on the device (for linking into audio routes):
+  MIC1, MIC2, DMICL, DMICR, IN1, IN2, IN3, IN4, IN5, IN6, IN12, IN34, IN56,
+  HPL, HPR, SPKL, SPKR, RCVL, RCVR, MICBIAS
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - maxim,max98090
+      - maxim,max98091
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: master clock
+
+  clock-names:
+    items:
+      - const: mclk
+
+  interrupts:
+    maxItems: 1
+
+  maxim,dmic-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 2500000
+    description:
+      DMIC clock frequency
+
+  maxim,micbias:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2, 3 ]
+    default: 3
+    description: |
+      Micbias voltage applied to the analog mic, valid voltages value are:
+        0 - 2.2v
+        1 - 2.55v
+        2 - 2.4v
+        3 - 2.8v
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@10 {
+            compatible = "maxim,max98090";
+            reg = <0x10>;
+            interrupt-parent = <&gpx3>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            clocks = <&i2s0 0>;
+            clock-names = "mclk";
+            #sound-dai-cells = <0>;
+        };
+    };
-- 
2.34.1

