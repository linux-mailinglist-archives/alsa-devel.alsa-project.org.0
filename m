Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18671939CC2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2024 10:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77A0384A;
	Tue, 23 Jul 2024 10:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77A0384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721723634;
	bh=b8CoiMb5iphdulrbGF9IbDlgJakpNPEN+MYJHrdNTPY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k0O/opIgvEs5tqxrjEX6/5plowbMaB6wdlP9KS5Uz5WNWjYjUhJWP/V+PibDF03hg
	 rYJcAHLk7z9EyG4nCcabNK8DwKni1n90R/oWC/bXQXNg1IZO+4dc4dhCt/RbKUNBzl
	 h4BLJRdxmZFRhz2P/dPav6M0c2Unq39JH58BfNDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA11F805AE; Tue, 23 Jul 2024 10:33:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97238F805AF;
	Tue, 23 Jul 2024 10:33:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EDF5F801F5; Tue, 23 Jul 2024 10:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBF74F800C9
	for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2024 10:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF74F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hlA8re6J
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4267300145eso45126115e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jul 2024 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721723585; x=1722328385;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1t+iNJUM6/WeeHxpFiE1OIXXIHbHfdlbLYRP84zH2DY=;
        b=hlA8re6J4NejmiG2HeZMXVvehrcdfBMIPjeLGYoqmOimtO66TvKtbxiwRC8BZJ5OwK
         3r74ZiUMhOygHJtyowuFjOuEVQyliwN0xEtj4wgM0XrLB/dwl0Miv7a+WnsxbCsXkNng
         wJzNG69YxzixUhDhNPpVQqNAvFe1OM0bA7xha+kv/eAo0s3gNh3UPg0lhBO6wYecC25L
         uAUCrb8GUx35d7t73Y4MpplViRCVMIshlXfccRCVSlSIPAA06MyMtBSo1ZrW/2MHpGBI
         3uBbOEa9yBQTKEfo1hbCqptL31r2K0Yoj2E84nlg8gsrx6bEC3lajecdSER0ggRmYlF3
         03Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721723585; x=1722328385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1t+iNJUM6/WeeHxpFiE1OIXXIHbHfdlbLYRP84zH2DY=;
        b=rdJKwUn8Ukoh6hWcX5sz4YJYVVOrOpO3I7/rdnzMihgP0ZfLbk5ArRiWeG0qmeSbv+
         SYpZ463DlbCKZdpxLpphnE1Mk1bCVkBOwN8WsdgUl3Vm02MirnlfiETmrKK0Cd9rSjrD
         1y4YiI2XUYn7QF5n0AhpyN/iEpNxwzvxGvPrH3nmY6Bba6tWl7eWPBCLmKLsBzee/00V
         apajla+j0VjALGM+c5fx2wEOpO2LmaC+4GZucuZ56Fuqny3dXsIImHg9FfJe8uS00IBc
         p2qX6kMuO001eGFfMrFUABbaxQSAAn5PoI3NmltXSOHMiPad4Gir8paGX9rA+uSOApzt
         TLrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIKANGS7AhUGULwuT/Htz4nz8wStXABcZB5OoInnAyyZM9lr2QZVYJBPW7SLqUGbvEagep2S3f5LE5eD3PyQh40Uhs2hfEjIBWyD4=
X-Gm-Message-State: AOJu0Yw/Lz8OKDhGUMCFZME5jNiTFDurV6+vmrWcp+iONuYphUy7jzmD
	/25n8d1Wu5cGRObf/eIAXGEf/wc7DcP9hsVzOIUu10yv5waBk52kdz2CQYt7/lI=
X-Google-Smtp-Source: 
 AGHT+IFr4CpzZyMvq6++T1fapTLZpMDNxT4jkNAHhBZudp0bJTnJiQ+DtD4LUAMj0LUFlA1zfq8k6Q==
X-Received: by 2002:a05:600c:1912:b0:427:d8f2:33b with SMTP id
 5b1f17b1804b1-427dc529086mr88754665e9.20.1721723585395;
        Tue, 23 Jul 2024 01:33:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa171sm162857735e9.1.2024.07.23.01.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 01:33:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to separate
 binding
Date: Tue, 23 Jul 2024 10:33:00 +0200
Message-ID: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DUFU5HDY2XKIWBX2Y43B32H3UKTHQLSP
X-Message-ID-Hash: DUFU5HDY2XKIWBX2Y43B32H3UKTHQLSP
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUFU5HDY2XKIWBX2Y43B32H3UKTHQLSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The APQ8016 SBC and MSM8916 QDSP6 sound cards are a bit different from
others: they have additional IO muxing address space and pin control.
Move them to separate schema, so the original qcom,sm8250.yaml will be
easier to manage.  New schema is going to grow for other platforms
having more of IO muxing address spaces.

Cc: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../sound/qcom,apq8016-sbc-sndcard.yaml       | 205 ++++++++++++++++++
 .../bindings/sound/qcom,sm8250.yaml           | 137 ------------
 2 files changed, 205 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
new file mode 100644
index 000000000000..6ad451549036
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
@@ -0,0 +1,205 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm APQ8016 and similar sound cards
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Stephan Gerhold <stephan@gerhold.net>
+
+properties:
+  compatible:
+    enum:
+      - qcom,apq8016-sbc-sndcard
+      - qcom,msm8916-qdsp6-sndcard
+
+  reg:
+    items:
+      - description: Microphone I/O mux register address
+      - description: Speaker I/O mux register address
+
+  reg-names:
+    items:
+      - const: mic-iomux
+      - const: spkr-iomux
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source. Valid names could be power supplies,
+      MicBias of codec and the jacks on the board.
+
+  aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandles pointing to auxiliary devices, such
+      as amplifiers, to be added to the sound card.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User visible long sound card name
+
+  pin-switches:
+    description: List of widget names for which pin switches should be created.
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  widgets:
+    description: User specified audio sound widgets.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+
+patternProperties:
+  ".*-dai-link$":
+    description:
+      Each subnode represents a dai link. Subnodes of each dai links would be
+      cpu/codec dais.
+
+    type: object
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name.
+        $ref: /schemas/types.yaml#/definitions/string
+        maxItems: 1
+
+      cpu:
+        description: Holds subnode which indicates cpu dai.
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            maxItems: 1
+
+      platform:
+        description: Holds subnode which indicates platform dai.
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            maxItems: 1
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+
+    required:
+      - link-name
+      - cpu
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,lpass.h>
+    sound@7702000 {
+        compatible = "qcom,apq8016-sbc-sndcard";
+        reg = <0x07702000 0x4>, <0x07702004 0x4>;
+        reg-names = "mic-iomux", "spkr-iomux";
+
+        model = "DB410c";
+        audio-routing =
+            "AMIC2", "MIC BIAS Internal2",
+            "AMIC3", "MIC BIAS External1";
+
+        pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
+        pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
+        pinctrl-names = "default", "sleep";
+
+        quaternary-dai-link {
+            link-name = "ADV7533";
+            cpu {
+                sound-dai = <&lpass MI2S_QUATERNARY>;
+            };
+            codec {
+                sound-dai = <&adv_bridge 0>;
+            };
+        };
+
+        primary-dai-link {
+            link-name = "WCD";
+            cpu {
+                sound-dai = <&lpass MI2S_PRIMARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+            };
+        };
+
+        tertiary-dai-link {
+            link-name = "WCD-Capture";
+            cpu {
+                sound-dai = <&lpass MI2S_TERTIARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    #include <dt-bindings/sound/qcom,q6asm.h>
+    sound@7702000 {
+        compatible = "qcom,msm8916-qdsp6-sndcard";
+        reg = <0x07702000 0x4>, <0x07702004 0x4>;
+        reg-names = "mic-iomux", "spkr-iomux";
+
+        model = "msm8916";
+        widgets =
+            "Speaker", "Speaker",
+            "Headphone", "Headphones";
+        pin-switches = "Speaker";
+        audio-routing =
+            "Speaker", "Speaker Amp OUT",
+            "Speaker Amp IN", "HPH_R",
+            "Headphones", "HPH_L",
+            "Headphones", "HPH_R",
+            "AMIC1", "MIC BIAS Internal1",
+            "AMIC2", "MIC BIAS Internal2",
+            "AMIC3", "MIC BIAS Internal3";
+        aux-devs = <&speaker_amp>;
+
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&cdc_pdm_lines_act>;
+        pinctrl-1 = <&cdc_pdm_lines_sus>;
+
+        mm1-dai-link {
+            link-name = "MultiMedia1";
+            cpu {
+                sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+            };
+        };
+
+        primary-dai-link {
+            link-name = "Primary MI2S";
+            cpu {
+                sound-dai = <&q6afedai PRIMARY_MI2S_RX>;
+            };
+            platform {
+                sound-dai = <&q6routing>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index c9076dcd44c1..1d3acdc0c733 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -27,9 +27,7 @@ properties:
               - qcom,sm8650-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
-          - qcom,apq8016-sbc-sndcard
           - qcom,apq8096-sndcard
-          - qcom,msm8916-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qrb5165-rb5-sndcard
@@ -58,18 +56,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
-  pin-switches:
-    description: List of widget names for which pin switches should be created.
-    $ref: /schemas/types.yaml#/definitions/string-array
-
-  widgets:
-    description: User specified audio sound widgets.
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-
-  # Only valid for some compatibles (see allOf if below)
-  reg: true
-  reg-names: true
-
 patternProperties:
   ".*-dai-link$":
     description:
@@ -122,34 +108,6 @@ required:
   - compatible
   - model
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,apq8016-sbc-sndcard
-              - qcom,msm8916-qdsp6-sndcard
-    then:
-      properties:
-        reg:
-          items:
-            - description: Microphone I/O mux register address
-            - description: Speaker I/O mux register address
-        reg-names:
-          items:
-            - const: mic-iomux
-            - const: spkr-iomux
-      required:
-        - compatible
-        - model
-        - reg
-        - reg-names
-    else:
-      properties:
-        reg: false
-        reg-names: false
-
 additionalProperties: false
 
 examples:
@@ -231,98 +189,3 @@ examples:
             };
         };
     };
-
-  - |
-    #include <dt-bindings/sound/qcom,lpass.h>
-    sound@7702000 {
-        compatible = "qcom,apq8016-sbc-sndcard";
-        reg = <0x07702000 0x4>, <0x07702004 0x4>;
-        reg-names = "mic-iomux", "spkr-iomux";
-
-        model = "DB410c";
-        audio-routing =
-            "AMIC2", "MIC BIAS Internal2",
-            "AMIC3", "MIC BIAS External1";
-
-        pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
-        pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
-        pinctrl-names = "default", "sleep";
-
-        quaternary-dai-link {
-            link-name = "ADV7533";
-            cpu {
-                sound-dai = <&lpass MI2S_QUATERNARY>;
-            };
-            codec {
-                sound-dai = <&adv_bridge 0>;
-            };
-        };
-
-        primary-dai-link {
-            link-name = "WCD";
-            cpu {
-                sound-dai = <&lpass MI2S_PRIMARY>;
-            };
-            codec {
-                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
-            };
-        };
-
-        tertiary-dai-link {
-            link-name = "WCD-Capture";
-            cpu {
-                sound-dai = <&lpass MI2S_TERTIARY>;
-            };
-            codec {
-                sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
-            };
-        };
-    };
-
-  - |
-    #include <dt-bindings/sound/qcom,q6afe.h>
-    #include <dt-bindings/sound/qcom,q6asm.h>
-    sound@7702000 {
-        compatible = "qcom,msm8916-qdsp6-sndcard";
-        reg = <0x07702000 0x4>, <0x07702004 0x4>;
-        reg-names = "mic-iomux", "spkr-iomux";
-
-        model = "msm8916";
-        widgets =
-            "Speaker", "Speaker",
-            "Headphone", "Headphones";
-        pin-switches = "Speaker";
-        audio-routing =
-            "Speaker", "Speaker Amp OUT",
-            "Speaker Amp IN", "HPH_R",
-            "Headphones", "HPH_L",
-            "Headphones", "HPH_R",
-            "AMIC1", "MIC BIAS Internal1",
-            "AMIC2", "MIC BIAS Internal2",
-            "AMIC3", "MIC BIAS Internal3";
-        aux-devs = <&speaker_amp>;
-
-        pinctrl-names = "default", "sleep";
-        pinctrl-0 = <&cdc_pdm_lines_act>;
-        pinctrl-1 = <&cdc_pdm_lines_sus>;
-
-        mm1-dai-link {
-            link-name = "MultiMedia1";
-            cpu {
-                sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
-            };
-        };
-
-        primary-dai-link {
-            link-name = "Primary MI2S";
-            cpu {
-                sound-dai = <&q6afedai PRIMARY_MI2S_RX>;
-            };
-            platform {
-                sound-dai = <&q6routing>;
-            };
-            codec {
-                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
-            };
-        };
-    };
-- 
2.43.0

