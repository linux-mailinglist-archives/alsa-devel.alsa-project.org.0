Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B54A2F65
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 13:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B0F177D;
	Sat, 29 Jan 2022 13:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B0F177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643459152;
	bh=WjAdBxp5WIQgilzKveCMMtFwnljsWIPgg5aY0b4Du0c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFft/EmuVnyRrGQVnp1DtCFqrnA1pLftCbnzlGSywx60J6pvzT+l0djEwSOAwzS+j
	 CXubxoDGLLtzowF2Nli4gPpzPyyp4JLx4w/UJ4Q9p8sDgzlL0Yv72Ch7yZ1TV/fcRY
	 tHFEa64TDbRc3SK6VgZD6kDSBvljoWC59Du3wz8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99857F80510;
	Sat, 29 Jan 2022 13:24:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF33F80510; Sat, 29 Jan 2022 13:24:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C596F80510
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 13:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C596F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="hsHOsLMG"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 266C33F197
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643459074;
 bh=5FFlQVfiPYwOVz/qR1ttwGkalvSmqMhuguJRa3JpJFQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=hsHOsLMG3aed4NV0oYPPTfgR/lCkwJvnTUrQA6BzwuCvIIVuExMaMpDM4jOYOOyp6
 18pxFrxbTk9o/mACp8mX8HMbs6cNc7Xd3pSZ8STLCQ47NiSHyR6R5OgcfexNTQ+uqE
 85uqp3fidMofVOOLy4Alu5153YcyaeKoDm1bne0R8bwsLwMauQX60QD5rmqfeR85nq
 oLZVPNBtAma3k3UR1k7SGBwHwg0c9HzwSMKVGxJfd70HDnjoFdV4hYWB7iQsh2tXOy
 AN9cz1X4HX9FB/yy3LGxBW1KGIp7vbvYFr4mR4buNCwNCxGjAhgbAdP0lw6pk5+ck7
 1vAQNGvPMEjVQ==
Received: by mail-wm1-f71.google.com with SMTP id
 q71-20020a1ca74a000000b003507f38e330so7385370wme.9
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FFlQVfiPYwOVz/qR1ttwGkalvSmqMhuguJRa3JpJFQ=;
 b=Rec+G+qbnBdCoZheUNov0Fh19DNcn0fNprTC6jS6Fs+9sTF8oBZ+PNy47Tx6RXCY18
 Wfb5TwgVkM1SAr8wN2Vx4Df7a9H+Vo8omsaPr7BxOai1kpFhlvW52pPNeb9l3HSNjKyK
 MPLL5jUjze7QO7/oIc/sEU+ba9kZLPnwjdhegb3ZQjHeY2OmhBVNMSL8lP8/P8pDmYo2
 4kSlaIslQ4Gv0jlqbZZKdouba/+cBFEDgngklmQzh8VKdhvbLHzPlhCRr4sC+CNQj3Ty
 Ra7D3HoQLgricg7p5yl/gwM1j8/xIubuGOlh49P415ug+C8vNw//AbNxplg4PuwMTrei
 vuXA==
X-Gm-Message-State: AOAM532uOv2GzOJMRRomXn2t1VR0kunychA0JLsUEV9LbGp+UbnHQHi+
 HbwOnDueK1UuwyV9GGonFx24L5oUi7w5MJixXDtnRovWsOoRqea6cALxRReYOK/q/pACEgR7Cdf
 eoC8iCs0qYZrTfgO8oez1tEt+edze0NU5c3YhP7sw
X-Received: by 2002:adf:f64e:: with SMTP id x14mr10041191wrp.216.1643459073802; 
 Sat, 29 Jan 2022 04:24:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxe6dsREF4mKdGOp2shKuhk+vTGgCTqdm3WOG32IIYdm9aRaZQctbPT/4EIxznruMFid33Pw==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr10041176wrp.216.1643459073650; 
 Sat, 29 Jan 2022 04:24:33 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id m28sm1106875wms.34.2022.01.29.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 04:24:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: dt-bindings: samsung,
 arndale: convert to dtschema
Date: Sat, 29 Jan 2022 13:24:26 +0100
Message-Id: <20220129122430.45694-1-krzysztof.kozlowski@canonical.com>
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

Convert the audio complex on Arndale boards with Samsung Exynos SoC to
DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/sound/arndale.txt     | 25 -----------
 .../bindings/sound/samsung,arndale.yaml       | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/arndale.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,arndale.yaml

diff --git a/Documentation/devicetree/bindings/sound/arndale.txt b/Documentation/devicetree/bindings/sound/arndale.txt
deleted file mode 100644
index 17530120ccfc..000000000000
--- a/Documentation/devicetree/bindings/sound/arndale.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Audio Binding for Arndale boards
-
-Required properties:
-- compatible : Can be one of the following:
-		"samsung,arndale-rt5631",
-		"samsung,arndale-wm1811"
-
-- samsung,audio-cpu: The phandle of the Samsung I2S controller
-- samsung,audio-codec: The phandle of the audio codec
-
-Optional:
-- samsung,model: The name of the sound-card
-
-Arndale Boards has many audio daughter cards, one of them is
-rt5631/alc5631. Below example shows audio bindings for rt5631/
-alc5631 based codec.
-
-Example:
-
-sound {
-		compatible = "samsung,arndale-rt5631";
-
-		samsung,audio-cpu = <&i2s0>
-		samsung,audio-codec = <&rt5631>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,arndale.yaml b/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
new file mode 100644
index 000000000000..e7dc65637f02
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,arndale.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Insignal Arndale boards audio complex
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - samsung,arndale-rt5631
+      - samsung,arndale-wm1811
+
+  samsung,audio-codec:
+    description: Phandle to the audio codec.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  samsung,audio-cpu:
+    description: Phandle to the Samsung I2S controller.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  samsung,model:
+    description: The user-visible name of this sound complex.
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - samsung,audio-codec
+  - samsung,audio-cpu
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,arndale-rt5631";
+        samsung,audio-cpu = <&i2s0>;
+        samsung,audio-codec = <&rt5631>;
+    };
-- 
2.32.0

