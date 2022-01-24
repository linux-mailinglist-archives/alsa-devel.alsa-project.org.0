Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCF4985D3
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 18:06:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8DCA28D7;
	Mon, 24 Jan 2022 18:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8DCA28D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643043999;
	bh=mAXheLg2Zo5bYnktJxkJkK4xHBKkybeDekyPSipPZDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gbHSuO90ZqF2t+cPbPPOcQaDfsJ/CLTgcSnl5zqvhoiRpfOzJuK5J/ClzKHoOyRtg
	 qr//ziBzWGcNhleIrnDwL9GdEWTVrHipBreGmnQFVd8sDN8vcx2tL1Jp82kqs4Jzva
	 5k+M5giFdYrkGVG+nmGWtbK/iHHnWHIc62RCMJqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EE45F8051C;
	Mon, 24 Jan 2022 18:04:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FC35F80517; Mon, 24 Jan 2022 18:04:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9904DF80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 18:04:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9904DF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="LKNKXlRB"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 29DE33F1E0
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643043866;
 bh=m/SJzOvCGXryS1758Fh3hpAtkFdWGlrBiM3VxRdkYrE=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=LKNKXlRBGJtgEP2d98D8QFuAKMkOOxirr9Vr1HYCxNNYJsnlA4xCoJi77HUIokMlt
 waG+1sHcJVPzkPLl5Mdq+P+QvrLT9sA6QqHu6jEloKyv9Ek2eAr2iKx26HxTIrre7b
 MizlLl5cfBHDVhuMYGzOghWULMt88FGRseGZXd6SVaeHsZc+uPOdCZfwzkUdWbKQ+5
 bgcBLpXYR3+K+rAukRJG+qkPYx32bV3Iq7rbtpcB/vCo7+oOp1JC6W4jjhb0Df+OaS
 Ul7o4+6ml6lTSIsLqJsQCnMT94zTuaSTb4IQLPaGaOC3ISUzTHUlWru+YoQ5fx1GZC
 MtqEPcGvyk9Mw==
Received: by mail-ej1-f69.google.com with SMTP id
 ky6-20020a170907778600b0068e4bd99fd1so2347979ejc.15
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 09:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m/SJzOvCGXryS1758Fh3hpAtkFdWGlrBiM3VxRdkYrE=;
 b=tvb10Y0qLgBidnidllqUkENu2JSPdCBTGiJjDWU7tNtdUUjktEaBSMmzH1xFzIG6DP
 bU+pbQV6SAHH3/OXDiWzdAhPzMVxiMWlpPmO+iYk/M9RRfdx9FmYH5WzvXsBM5KPoVCA
 KrFeFNBD/iomhlV62Wn6Ouum/CHjakapwDFZMPYb+jOHBApJ49HtE/2WNDPN6BqkYf2p
 bQSNVUpc5+rm1Cdft4XeoQ7wTZ5AfmzOvGDCCGeqmmtA3kn7HzI8PvPRoCFN1a8ZMTqg
 Zj2hrT/5KH3cd6ji2ZlPfKq6kl4BvhknCqk6S8hB6xjzsLlisSniUYD5gUTs9NSwGG2D
 uKMQ==
X-Gm-Message-State: AOAM531Wzw/ESH4QPIK9AXAleCg+Iw4j0tUfZmNBgwHJ9SM0pmNxFO1v
 L9Gcekdecx9FKUAlvZ4t5Mf423iksQkf3Z3/rxZJf5GhKSjcpEbIZaJ3xMzaSfuFX2dqndpWQpn
 RXdsuXd+LgPGrrSLexicmpPF0N5uzbOguQ3E2YX8y
X-Received: by 2002:a17:906:9c82:: with SMTP id
 fj2mr12667488ejc.699.1643043865736; 
 Mon, 24 Jan 2022 09:04:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQjQyxA1HcV6BfnXmwkoNRaO8orvjbUNf88YPPwPUgaCU+EwbK3OjKEFnrhzcCFEEQ+666QQ==
X-Received: by 2002:a17:906:9c82:: with SMTP id
 fj2mr12667473ejc.699.1643043865565; 
 Mon, 24 Jan 2022 09:04:25 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id o11sm6903846edh.75.2022.01.24.09.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:04:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 5/6] ASoC: dt-bindings: samsung,snow: convert to dtschema
Date: Mon, 24 Jan 2022 18:03:35 +0100
Message-Id: <20220124170336.164320-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
References: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
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

TODO: The DTS do not pass cleanly. cpu/sound-dai should be fixed.
---
 .../bindings/sound/samsung,snow.yaml          | 78 +++++++++++++++++++
 .../devicetree/bindings/sound/snow.txt        | 31 --------
 2 files changed, 78 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,snow.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/snow.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,snow.yaml b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
new file mode 100644
index 000000000000..df969b384839
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
@@ -0,0 +1,78 @@
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
+        $ref: /schemas/types.yaml#/definitions/phandle-array
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
+        $ref: /schemas/types.yaml#/definitions/phandle
+        items:
+          - description: Phandle of the I2S controller.
+          - description: Index of the I2S controller.
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

