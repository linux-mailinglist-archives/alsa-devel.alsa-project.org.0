Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 774894A2F6B
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 13:27:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 288E817A9;
	Sat, 29 Jan 2022 13:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 288E817A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643459228;
	bh=Tu7817+0usu6hbukyQzb8DhUKIzlRh/yNKTf7AwXdj8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CknGzYKylDKb328heczz9gzx8znWWdzpdWDSOBEgN1NYMr1073WNieatJzVc9xQ2j
	 N+apRIH40GwRvAr0zs70H8lc/Z+VuRxj3/Kaw0YrMUinkJ+kO+kMSne57ddtxN2DJi
	 UeYPfKiaGIgWAhBUuCrKjY2pfVlJvuK2/u7r5H3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 340AAF80524;
	Sat, 29 Jan 2022 13:25:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B791F804B3; Sat, 29 Jan 2022 13:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E745F80517
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 13:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E745F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="a8PXgV6i"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 334D03FE09
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643459078;
 bh=bD5z5ffYf36ZpADiFx82Y+cqZ1Jq4IWx6Gvq+Okhbqw=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=a8PXgV6iaqq9y6n1Wn1VxbzYagq3gX3g0YmpRwyKt6VsvtBpvikpVtMrpfHWa0aNO
 FwiJ2MWLxY2g606nEbnGlPFBKbd9YpfGa/TT3bRnoIQu3sP4JYkB3cM+MUl+82oizp
 zohLjQyh3+9Rh9glO0Fnd1RgmS7Uzknf2Twq5rakzI8MVBW4FWi4YqI/NPv100fDsp
 wGHVyp4htoNg/HnYSb2i/XoamWGpw/j0fRXru2LM/Fq+dSur7reldJxe+X4w+miuF+
 7xAKZW7c22o072NLTNacf+KenMIQnlAA6EhWPSU5Yp+F0UGEp7zVM3Hxb9xOS8VQHM
 k6NyEFsita4fg==
Received: by mail-wm1-f71.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so616953wmj.5
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bD5z5ffYf36ZpADiFx82Y+cqZ1Jq4IWx6Gvq+Okhbqw=;
 b=zlWih1k4a7ajef81hB90l93HE7Hj9A59jva8iOki68Nb1YB94g6XQnfbeha83x0mgQ
 SlhvEY/2wEdOEeLDi7JhFAMffL9hbfkF5ng3esBnZPCbzOUisbqedi0OCfTlEHN5O/6B
 u9cmZ1ljUmc7dJWYK4eQv/xy6bPsWUsn4BqzVIBvRdP1ZICHehSY+ca5D1mgwOOypaaW
 xVHBFnu6EOKMTMwd4xtCkq+2PVro2/hXW11OjKRpkJZ2MQ17VFs2xyjH11sNVvR0ThT/
 YYsiW4Kqpdb/pbNvLGFoKXa08xYbAIrhsYX8Idv4bukj+BGJAqVK+jbtgE8YgD2CmluM
 kU3w==
X-Gm-Message-State: AOAM532OknUJKXGR30rZ31vH21bkAmIj/O0yVkGW+wGFAI/ITw8KqI4d
 oAaVPsUd/BeFiyKkOO3CUQZfyHTaCRb849cTwjjT0xtblva1e+9l8kBA+jnnz668XwaZl47bE1E
 gcd8A8Cbc/lq7DKobBjUqphwb2SFhyVI6347o4Py5
X-Received: by 2002:a05:600c:3c9:: with SMTP id
 z9mr11015918wmd.148.1643459077821; 
 Sat, 29 Jan 2022 04:24:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPb7GAtVKBWV4J0Pm7ej5eDXtc7ns7KfzMdGQW666plXAAi8bJ6GsApeCPfihWqlNq7cTw2A==
X-Received: by 2002:a05:600c:3c9:: with SMTP id
 z9mr11015910wmd.148.1643459077657; 
 Sat, 29 Jan 2022 04:24:37 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id m28sm1106875wms.34.2022.01.29.04.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 04:24:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] ASoC: dt-bindings: samsung,snow: convert to dtschema
Date: Sat, 29 Jan 2022 13:24:29 +0100
Message-Id: <20220129122430.45694-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert the audio complex on Google Snow boards with Samsung Exynos SoC
to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/sound/samsung,snow.yaml          | 74 +++++++++++++++++++
 .../devicetree/bindings/sound/snow.txt        | 31 --------
 2 files changed, 74 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,snow.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/snow.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,snow.yaml b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
new file mode 100644
index 000000000000..0c3b3302b842
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,snow.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Snow audio complex with MAX9809x codec
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - google,snow-audio-max98090
+      - google,snow-audio-max98091
+      - google,snow-audio-max98095
+
+  codec:
+    type: object
+    properties:
+      sound-dai:
+        description: List of phandles to the CODEC and HDMI IP nodes.
+        items:
+          - description: Phandle to the MAX98090, MAX98091 or MAX98095 CODEC.
+          - description: Phandle to the HDMI IP block node.
+    required:
+      - sound-dai
+
+  cpu:
+    type: object
+    properties:
+      sound-dai:
+        description: Phandle to the Samsung I2S controller.
+        maxItems: 1
+    required:
+      - sound-dai
+
+  samsung,audio-codec:
+    description: Phandle to the audio codec.
+    $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
+
+  samsung,i2s-controller:
+    description: Phandle to the Samsung I2S controller.
+    $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
+
+  samsung,model:
+    description: The user-visible name of this sound complex.
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - codec
+  - cpu
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "google,snow-audio-max98095";
+        samsung,model = "Snow-I2S-MAX98095";
+
+        cpu {
+            sound-dai = <&i2s0 0>;
+        };
+
+        codec {
+            sound-dai = <&max98095 0>, <&hdmi>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/snow.txt b/Documentation/devicetree/bindings/sound/snow.txt
deleted file mode 100644
index 80fd9a87bb3f..000000000000
--- a/Documentation/devicetree/bindings/sound/snow.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Audio Binding for Snow boards
-
-Required properties:
-- compatible : Can be one of the following,
-			"google,snow-audio-max98090" or
-			"google,snow-audio-max98091" or
-			"google,snow-audio-max98095"
-- samsung,i2s-controller (deprecated): The phandle of the Samsung I2S controller
-- samsung,audio-codec (deprecated): The phandle of the audio codec
-
-Required sub-nodes:
-
- - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
-    controller
- - 'codec' subnode with a 'sound-dai' property containing list of phandles
-    to the CODEC nodes, first entry must be the phandle of the MAX98090,
-    MAX98091 or MAX98095 CODEC (exact device type is indicated by the compatible
-    string) and the second entry must be the phandle of the HDMI IP block node
-
-Optional:
-- samsung,model: The name of the sound-card
-
-Example:
-
-sound {
-		compatible = "google,snow-audio-max98095";
-
-		samsung,model = "Snow-I2S-MAX98095";
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&max98095>;
-};
-- 
2.32.0

