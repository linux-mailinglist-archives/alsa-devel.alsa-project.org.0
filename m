Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADD49D614
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 00:16:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E5C51EE8;
	Thu, 27 Jan 2022 00:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E5C51EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643238991;
	bh=FS8t8Qq+Y14AeaQXtCODrigWa25vUcv0f/ooNmPq/hc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P/vafrrTuDt33zfSZVvrU52oSQmo8T2MKFKaNqxZJCb3E5v3SDSCwL+L4Y8SuFLu6
	 URIi0e28ItMuPGDUllihhbZ9xRS9I8cSgDtZIB3gWEXjWioX60LdjkjbC4BGmpRxOl
	 59Ah+9SBGnRNdgUOmfEHM+LvyS8NudgWm2XyVOCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5400F800E4;
	Thu, 27 Jan 2022 00:15:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFED6F8049C; Thu, 27 Jan 2022 00:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D77CAF80118
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 00:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D77CAF80118
Received: by mail-ot1-f45.google.com with SMTP id
 10-20020a9d030a000000b0059f164f4a86so788832otv.13
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 15:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USh4ZKQd0ykCQmyD3X8QEx6xuAYg/3tTmEquSCXUgC4=;
 b=AZCC2uk4qv/KCcuHcsaR4AICrBlPiaxT2gGoG63VyHwKIaXFQxaS2wtKq67sUcxmEH
 BQb7K3E2engd7gazPzJh2xrs/cX6x9xofKdVKH2+9Ves5YISQ2oJVL9CnSdW7yflTaUv
 quiiNSWoVTSXo9o/yUKK913QPHbxzLKSO1mJz+mAQPzCdrnNDQbmUdDHmIjTM7F14+J7
 xtczkmGm4LbXZ7KYduZL83Qb0IlrK0mqnlsMN6pI13LWv9DdzSA+f73X/1mlcRmBYa2D
 Y7AamLNOKqpxFa98d2I8kTxVuInVN31YBY3jCxmR6gmkfucvblboNiW8u8LiWslPI7qb
 bxgg==
X-Gm-Message-State: AOAM530zD/FATJLuFtfkfUFsvy3WH8Apym4bBTa3HlcslH361BvHwAoT
 SiaYt154fS+oeM0nhgBKdg==
X-Google-Smtp-Source: ABdhPJwmQKZBGA0pTVSSUmeSxOamS9FngZ5chEYJhCeBHNAHNiomaWmP8s3T6rH2dsCoGgJguFxtWg==
X-Received: by 2002:a9d:6747:: with SMTP id w7mr674778otm.238.1643238916815;
 Wed, 26 Jan 2022 15:15:16 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id m23sm8023856oos.6.2022.01.26.15.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 15:15:15 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Rohit kumar <rohitkr@codeaurora.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
Date: Wed, 26 Jan 2022 17:14:27 -0600
Message-Id: <20220126231427.1638089-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
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

'sound-dai' is a common property, but has duplicate type definitions.
Create a new common definition to define the type and then update all
the other occurrences to just define how many entries there are just
like other phandle+arg properties.

The constraints on the number of entries is based on the examples and
could be wrong.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack, this depends on commit abf0fee97313 ("dt-bindings: Improve
phandle-array schemas") in my tree.
---
 .../bindings/sound/amlogic,gx-sound-card.yaml |  4 ++--
 .../bindings/sound/google,sc7180-trogdor.yaml |  6 ++++--
 .../bindings/sound/imx-audio-card.yaml        |  7 +++++--
 .../bindings/sound/qcom,sm8250.yaml           | 10 +++++++---
 .../bindings/sound/samsung,aries-wm8994.yaml  |  5 +----
 .../bindings/sound/samsung,midas-audio.yaml   |  2 --
 .../bindings/sound/samsung,odroid.yaml        |  9 +++------
 .../devicetree/bindings/sound/sound-dai.yaml  | 20 +++++++++++++++++++
 8 files changed, 42 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/sound-dai.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 2e35aeaa8781..8b5be4b92f35 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -57,7 +57,7 @@ patternProperties:
           rate
 
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
+        maxItems: 1
         description: phandle of the CPU DAI
 
     patternProperties:
@@ -71,7 +71,7 @@ patternProperties:
 
         properties:
           sound-dai:
-            $ref: /schemas/types.yaml#/definitions/phandle-array
+            maxItems: 1
             description: phandle of the codec DAI
 
         required:
diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index 837e3faa63a9..233caa0ade87 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -62,13 +62,15 @@ patternProperties:
         description: Holds subnode which indicates cpu dai.
         type: object
         properties:
-          sound-dai: true
+          sound-dai:
+            maxItems: 1
 
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
         properties:
-          sound-dai: true
+          sound-dai:
+            maxItems: 1
 
     required:
       - link-name
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index d1816dd061cf..bb3a435722c7 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -59,13 +59,16 @@ patternProperties:
         description: Holds subnode which indicates cpu dai.
         type: object
         properties:
-          sound-dai: true
+          sound-dai:
+            maxItems: 1
 
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
         properties:
-          sound-dai: true
+          sound-dai:
+            minItems: 1
+            maxItems: 2
 
       fsl,mclk-equal-bclk:
         description: Indicates mclk can be equal to bclk, especially for sai interface
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4bfda04b4608..4ecd4080bb96 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -69,19 +69,23 @@ patternProperties:
         description: Holds subnode which indicates cpu dai.
         type: object
         properties:
-          sound-dai: true
+          sound-dai:
+            maxItems: 1
 
       platform:
         description: Holds subnode which indicates platform dai.
         type: object
         properties:
-          sound-dai: true
+          sound-dai:
+            maxItems: 1
 
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
         properties:
-          sound-dai: true
+          sound-dai:
+            minItems: 1
+            maxItems: 4
 
     required:
       - link-name
diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index eb487ed3ca3b..4ffa275b3c49 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -27,9 +27,6 @@ properties:
       sound-dai:
         minItems: 2
         maxItems: 2
-        items:
-          maxItems: 1
-        $ref: /schemas/types.yaml#/definitions/phandle-array
         description: |
           phandles to the I2S controller and bluetooth codec,
           in that order
@@ -38,7 +35,7 @@ properties:
     type: object
     properties:
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
+        maxItems: 1
         description: phandle to the WM8994 CODEC
 
   samsung,audio-routing:
diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 095775c598fa..ec50bcb4af5f 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -21,7 +21,6 @@ properties:
     type: object
     properties:
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
         maxItems: 1
         description: phandle to the I2S controller
     required:
@@ -31,7 +30,6 @@ properties:
     type: object
     properties:
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
         maxItems: 1
         description: phandle to the WM1811 CODEC
     required:
diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index e8122bc87362..db2513f3e168 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -37,18 +37,15 @@ properties:
     type: object
     properties:
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
         description: phandles to the I2S controllers
 
   codec:
     type: object
     properties:
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
-        description: |
-          List of phandles to the CODEC nodes,
-          first entry must be corresponding to the MAX98090 CODEC and
-          the second entry must be the phandle of the HDMI IP block node.
+        items:
+          - description: phandle of the MAX98090 CODEC
+          - description: phandle of the HDMI IP block node
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
diff --git a/Documentation/devicetree/bindings/sound/sound-dai.yaml b/Documentation/devicetree/bindings/sound/sound-dai.yaml
new file mode 100644
index 000000000000..61c6f7abc4e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sound-dai.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sound-dai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Digital Audio Interface consumer Device Tree Bindings
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+select: true
+
+properties:
+  sound-dai:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A phandle plus args to digital audio interface provider(s)
+
+additionalProperties: true
+...
-- 
2.32.0

