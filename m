Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFF7687DD
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 22:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16336827;
	Sun, 30 Jul 2023 22:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16336827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690748403;
	bh=0OfLB55r5UQz2HHwy0hMlyQCxbEzZMGMdYO+rmeY7ng=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FN8ickH9r8BjHHeFmXeSCcgkoBdKGjQJEJlQ59Xt5rWWL93KO+ESZj0XUfI95cWVu
	 MFDDz+kwCX7U2zO7iiBXlbnE/TvT3E3KaqrfCO3W80wPSRGanZuDc6E7uXljI/eKRZ
	 tnOW/SLQxDTG3eQDJIvd//8hIm4EDaq/bhmVz5ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FC65F80544; Sun, 30 Jul 2023 22:18:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A37F8016D;
	Sun, 30 Jul 2023 22:18:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 346A4F8016D; Sun, 30 Jul 2023 22:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A160CF80153
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 22:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A160CF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e657nhBC
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso803682266b.1
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 13:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690748320; x=1691353120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAez7RCqnvhN3o9TDW5VQ2Z834aythwp7RK5oyByXnk=;
        b=e657nhBCfJ7PUVp7OQBIBgh/S+iHhVv6moDSczAdlz5+QRdsZvBtXQ46OtbhLAUYCr
         sYGvgP/xzbmvISotm/Zobs8iZ4HK2MY1z7V1c13o8bMo069d8h/njFQpccO2VUtne1AD
         /zA9+dykn1XDfqauIh8HpPl6Vh3CfMZukAyulRT1tACCiOO7sQikadr4+F117eEFY5Kp
         yTFYKSswNbqqqFeR9iBrt+DzAi7Nj/f9fQs3varG2JsGQHXTS3MM2iM574wOkiUX+9fP
         wxDhV+yosRTztiCziOBPTqRj/2IUR2apovYOd+oEiXcSFOlVY3rU+q8fiJ4hYVPcZT0i
         v84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690748320; x=1691353120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAez7RCqnvhN3o9TDW5VQ2Z834aythwp7RK5oyByXnk=;
        b=fQWNz896Hy2jFH+ogWMsOAdXIwKtlxha1IRzIkhOSi69vnnl/XfD80q1I8bW0xWXMo
         2rVDNapitv271Gl5A1JIwyHcR1w6WeqlqaA44kNk/qmdsqCOZkNXxp7z/GsRRH//Ch6f
         YOcIa5NQIbiuEw5C7gEV4Up8qq0Mp6i2khsDNtUns59Gq/V6N3QfVM2v+oqaDdq2xnhC
         +kGRpnuKftB0KCXhMIvdBRykyGvTaRsVTSXmS7EBf6JdiZdWkw7ii0geinyAKlv86w74
         QdPOkC8R1EO4DD3OE/Mgvn9I9Mj6FQ0rXz8WhIET4Xr5KFDXDCsc7rmVFqYH2fpNB8EP
         64Mg==
X-Gm-Message-State: ABy/qLar+wcyMtjnrd6NrL7bGmWzeYcdel7JPttQNlNjvyOT1ktNOPOo
	mYV91LuO07hPbh/oXQ0e3sdHHQ==
X-Google-Smtp-Source: 
 APBJJlHKxckTZptUQgKm0YPbWSMHzXEBVWdUoVkv3Mr3l/+Mm59AxKGUk/4BDv4haqYWxgJrrOcAnw==
X-Received: by 2002:a17:906:1003:b0:992:ef60:aadd with SMTP id
 3-20020a170906100300b00992ef60aaddmr5345101ejm.13.1690748319618;
        Sun, 30 Jul 2023 13:18:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 va16-20020a17090711d000b0099bc0daf3d7sm5115533ejb.182.2023.07.30.13.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 13:18:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ryan Lee <ryans.lee@maximintegrated.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Convert maxim,max98925 to DT schema
Date: Sun, 30 Jul 2023 22:18:24 +0200
Message-Id: <20230730201826.70453-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IN6N4S7I4U4PRHGPYOPNDFKZJPAG3OVZ
X-Message-ID-Hash: IN6N4S7I4U4PRHGPYOPNDFKZJPAG3OVZ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IN6N4S7I4U4PRHGPYOPNDFKZJPAG3OVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Maxim Integrated MAX98925/MAX98926/MAX98927 speaker
amplifier bindings to DT schema format.  Changes during conversion:
1. Add "sound-dai-cells", already used by DTS.
2. Use "maxim,interleave-mode" instead previous "interleave-mode" and
   undocumented but used interleave_mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Use maxim,interleave-mode as bool.

Ryan,
As original author, I added you as bindings maintainer. Is that okay or
maybe someone else from Maxim should take care about the bindings?
---
 .../devicetree/bindings/sound/max9892x.txt    | 44 ---------
 .../bindings/sound/maxim,max98925.yaml        | 98 +++++++++++++++++++
 2 files changed, 98 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/max9892x.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98925.yaml

diff --git a/Documentation/devicetree/bindings/sound/max9892x.txt b/Documentation/devicetree/bindings/sound/max9892x.txt
deleted file mode 100644
index 98cb9ba5b328..000000000000
--- a/Documentation/devicetree/bindings/sound/max9892x.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Maxim Integrated MAX98925/MAX98926/MAX98927 Speaker Amplifier
-
-This device supports I2C.
-
-Required properties:
-
-  - compatible : should be one of the following
-    - "maxim,max98925"
-    - "maxim,max98926"
-    - "maxim,max98927"
-
-  - vmon-slot-no : slot number used to send voltage information
-                   or in inteleave mode this will be used as
-                   interleave slot.
-                   MAX98925/MAX98926 slot range : 0 ~ 30,  Default : 0
-                   MAX98927 slot range : 0 ~ 15,  Default : 0
-
-  - imon-slot-no : slot number used to send current information
-                   MAX98925/MAX98926 slot range : 0 ~ 30,  Default : 0
-                   MAX98927 slot range : 0 ~ 15,  Default : 0
-
-  - interleave-mode : When using two MAX9892X in a system it is
-                   possible to create ADC data that that will
-                   overflow the frame size. Digital Audio Interleave
-                   mode provides a means to output VMON and IMON data
-                   from two devices on a single DOUT line when running
-                   smaller frames sizes such as 32 BCLKS per LRCLK or
-                   48 BCLKS per LRCLK.
-                   Range : 0 (off), 1 (on),  Default : 0
-
-  - reg : the I2C address of the device for I2C
-
-Optional properties:
-  - reset-gpios : GPIO to reset the device
-
-Example:
-
-codec: max98927@3a {
-   compatible = "maxim,max98927";
-   vmon-slot-no = <0>;
-   imon-slot-no = <1>;
-   interleave-mode = <0>;
-   reg = <0x3a>;
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max98925.yaml b/Documentation/devicetree/bindings/sound/maxim,max98925.yaml
new file mode 100644
index 000000000000..32fd86204a7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98925.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98925.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX98925/MAX98926/MAX98927 speaker amplifier
+
+maintainers:
+  - Ryan Lee <ryans.lee@maximintegrated.com>
+
+properties:
+  compatible:
+    enum:
+      - maxim,max98925
+      - maxim,max98926
+      - maxim,max98927
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  vmon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 30
+    default: 0
+    description:
+      Slot number used to send voltage information or in inteleave mode this
+      will be used as interleave slot.
+
+  imon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 30
+    default: 0
+    description:
+      Slot number used to send current information.
+
+  maxim,interleave-mode:
+    type: boolean
+    description:
+      When using two MAX9892X in a system it is possible to create ADC data
+      that will overflow the frame size. When enabled, the Digital Audio
+      Interleave mode provides a means to output VMON and IMON data from two
+      devices on a single DOUT line when running smaller frames sizes such as
+      32 BCLKS per LRCLK or 48 BCLKS per LRCLK.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max98927
+    then:
+      properties:
+        vmon-slot-no:
+          minimum: 0
+          maximum: 15
+
+        imon-slot-no:
+          minimum: 0
+          maximum: 15
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        #include <dt-bindings/gpio/gpio.h>
+        audio-codec@3a {
+            compatible = "maxim,max98927";
+            reg = <0x3a>;
+            #sound-dai-cells = <0>;
+
+            pinctrl-0 = <&speaker_default>;
+            pinctrl-names = "default";
+
+            reset-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+
+            vmon-slot-no = <1>;
+            imon-slot-no = <0>;
+        };
+    };
-- 
2.34.1

