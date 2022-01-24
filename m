Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FD4985D9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 18:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B771028BB;
	Mon, 24 Jan 2022 18:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B771028BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643044019;
	bh=WjAdBxp5WIQgilzKveCMMtFwnljsWIPgg5aY0b4Du0c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xs3qUKdaUrn5BqxUCeXm6x6nTSDKrfIxZr4jARqEQZR7XWziICtXWlDhrBqvGsWq0
	 YnuKPbSY4mYxDm9EAcX9DRgW1v5dMWJS4KjX/HgRvZcuJz5KV9F9vcC8zNalMqilvZ
	 +S5XRq4FZlCmIwi2wX3nI/0eSRECEkKNrh6Jjcf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EAD4F8051D;
	Mon, 24 Jan 2022 18:04:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F84F8051A; Mon, 24 Jan 2022 18:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 662B1F80424
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 18:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 662B1F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="pKa54jeS"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 118BD3F1A4
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643043862;
 bh=5FFlQVfiPYwOVz/qR1ttwGkalvSmqMhuguJRa3JpJFQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=pKa54jeSkusUE3Hw9673mak37Y6Y0iuo84fM4+oaPUm2/vC4kNLvKVosDEjRbfp/p
 Bx/qFQVkKr0ywfJEFSqeGuwihIbnL/KlaNi7moVqeh5DAy9/0jBIqaMUfvZCXWTqcj
 XrplZk5tA9XlUebtdgEWu1hWZeHUefDClDc0tv/iNR9xSgpepApOIrMBtJBn84OXcz
 X/0jlyc2xbgUnQ+VCzfqgG/YrFzpMzQ6bLInOSRoi2zazmDKvAkNZdDxnTJp8C1OhQ
 xktUbeBFCmIFnz6INGwIwsOSl8q8Xd81YDqePH2SmmWqUFup8s4Sz61ceuo328CX5i
 iTQQLrk4kGAww==
Received: by mail-ej1-f72.google.com with SMTP id
 d18-20020a1709063ed200b006a5eeb2ee4dso2330107ejj.3
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 09:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FFlQVfiPYwOVz/qR1ttwGkalvSmqMhuguJRa3JpJFQ=;
 b=llsxb+43Lbg9zLywrdo4k7lZlD0DKn7zdK21Aa7fjPaX7BrNObfTp2PydtHBDMP9kH
 VGfYSNXRq943lbGRc/qLs+EFO1GCXY3S0JJ00KI5YvDn5DBwXyGPHeWpM9AK6xmnuByh
 wbX37ukTR8X3en25zbSmlumPocG6J9+ReiDXxgd+zyxQHp3XbDjbo4H1YU+jpziQif/w
 k0n0RJ2KasFd9eg0QrUnWDvGDWCT1TQ2dem8qN7lfXcjfzdBlLB1aRkCcFUlYGCki58k
 12pBKANYzCPJpwGZ7oRVQsPcXKrd8VyNEpA0DZDVDToOWV+X8nu5m4KwyEJFXPaNR6F0
 2J8Q==
X-Gm-Message-State: AOAM530KNXLFL1BTVYtDcsAo0AvRGGaykcL/9SV8Ee/T192ZaOsH/9mT
 1eSoGJwBYfwsyewO1ihpbogmNRZDZGgXHFoqXm1BU3K8CLTkFuuESuUY1a2+M8MEXnq8gf+7/qn
 xlhOTQU28TacAn4zxvn8GtmrbA+/S8WxbXBG2fFXs
X-Received: by 2002:a17:906:7003:: with SMTP id
 n3mr13196766ejj.160.1643043861295; 
 Mon, 24 Jan 2022 09:04:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSHmcPIiDwaWIhrNLyt3hgJ6DEahlcrBImfV1TaDHD72Fiq6kwC/08hZHQNxbcb99lYE/AuA==
X-Received: by 2002:a17:906:7003:: with SMTP id
 n3mr13196752ejj.160.1643043861075; 
 Mon, 24 Jan 2022 09:04:21 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id o11sm6903846edh.75.2022.01.24.09.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:04:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] ASoC: dt-bindings: samsung,arndale: convert to dtschema
Date: Mon, 24 Jan 2022 18:03:32 +0100
Message-Id: <20220124170336.164320-2-krzysztof.kozlowski@canonical.com>
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

