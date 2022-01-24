Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A054985CC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 18:06:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C3A328C8;
	Mon, 24 Jan 2022 18:05:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C3A328C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643043969;
	bh=w3jaXEw89uah6bQhp9pupDriGii4X30rhU3VXVX/Bu0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdsulwWeYcY0237OrcsHLM1ew0z3W5G2rjLdoJw8PeYGQCHiJ9KAOPj8lfJDJ4kaq
	 QAMGenNPQqbF0EEr0zsodjFviYn/dmqfkLrUpYkXROsxsjYBZaHxrZapIFQz+lk4ND
	 fOap56XGpdWgkmQJ8fAtu267hAnqzgKvFRQA8VSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B9F3F80508;
	Mon, 24 Jan 2022 18:04:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1161F80424; Mon, 24 Jan 2022 18:04:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7833CF8027C
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 18:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7833CF8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="SiQ4G+BF"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE9603F1D8
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643043864;
 bh=aFma7LFfbMy+pdLU8XgqpfQtVODFsB45EwHFjG4cPHo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=SiQ4G+BFKx8MddiYx4chwyr2IFI6lXHfzKaLtP6uEhUsw0hSoUStiwrR+NPhOF1ux
 +ToWy/5kJ7TNxoipEcQCGhDKbZXZWCC5+W2obtdXdT4J+g1zwv6sx1v+At0rnzYKZI
 IFWAx/BQ6KAWTdbeWJhXsrPM9iU2LvqY9A2lS3ab543GBceZEEMRO1lePfuGyq339C
 CTTXPWHCNXFzWjd6UPMwA9RJO7q+XEilpARIfcvp9zfeJKQLtNM9XzQbqzMXstpxGy
 hFMVHskYG9713tw4ouiqd98Z3usGAAdA8rR+T2jcXBc+ioqPENU8QLrgHfWbZELv5s
 OS+GExtH5apXA==
Received: by mail-ed1-f71.google.com with SMTP id
 k5-20020a508ac5000000b00408dec8390aso760605edk.13
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 09:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFma7LFfbMy+pdLU8XgqpfQtVODFsB45EwHFjG4cPHo=;
 b=RvtE92VAuvBXp2q8yjZiggKkJ0Suz4qx6rZRNUZRAb7v+CVdzvSbKcGs7BcW3xErlU
 sK50/oP6yNZZwhJhGPraay9GwcVSOD/K17RJ3bbebsb1huE4fJnXkPofjWRotJFRa2VJ
 /E9DGmXg8y2E5EJbIXKouiQG58aWJsUwtta/ZFYhEOzUOAZVbPjWu1F3WsRp7wwe+0FT
 G/plgySaXn3hc1RjlKansT/ve2MuNpzNHnmddSa2f9ZyH8bmUQ/rILHirDfjQB0NoWx6
 A18dqcJy3JOalPiWjjP8sGeNWsYBaJg5dC9mRwzY4SxPc9TVuRb9lSXVlKezIa3bGwkc
 X7Zw==
X-Gm-Message-State: AOAM533pdqYbkCOj3h5ETAqHCCdeJhSALqgm2oQho5oZUjk1f0y2Ux+z
 pcpjxMSrGbcIXIz/66MV72mNs4FKBA+oa/e+f/u9dwPHWPsdqPWsmBF3AVkV7LUMULU1SY+WK8p
 PaZRebI2RQk7ukcJQkFfjqYxpRVuNgI0ED4blAKCm
X-Received: by 2002:a17:907:160d:: with SMTP id
 hb13mr2478835ejc.609.1643043864494; 
 Mon, 24 Jan 2022 09:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8dy0UNUYy8V7YlFigpm3/abtk7yXYoxh8/7MuNjbTZltb26qnfPnsmVYy3oKPQLI1sLWBSA==
X-Received: by 2002:a17:907:160d:: with SMTP id
 hb13mr2478820ejc.609.1643043864305; 
 Mon, 24 Jan 2022 09:04:24 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id o11sm6903846edh.75.2022.01.24.09.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:04:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] ASoC: dt-bindings: samsung,smdk5250: convert to dtschema
Date: Mon, 24 Jan 2022 18:03:34 +0100
Message-Id: <20220124170336.164320-4-krzysztof.kozlowski@canonical.com>
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

Convert the audio complex on SMDK5250 boards with Samsung Exynos SoC to
DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
 .../bindings/sound/samsung,smdk5250.yaml      | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
deleted file mode 100644
index 4686646fb122..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Samsung SMDK audio complex
-
-Required properties:
-- compatible : "samsung,smdk-wm8994"
-- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
-- samsung,audio-codec: The phandle of the WM8994 audio codec
-Example:
-
-sound {
-		compatible = "samsung,smdk-wm8994";
-
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&wm8994>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml b/Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml
new file mode 100644
index 000000000000..cb51af90435e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,smdk5250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SMDK5250 audio complex with WM8994 codec
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,smdk-wm8994
+
+  samsung,audio-codec:
+    description: Phandle to the audio codec.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  samsung,i2s-controller:
+    description: Phandle to the Samsung I2S controller.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - samsung,audio-codec
+  - samsung,i2s-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,smdk-wm8994";
+        samsung,i2s-controller = <&i2s0>;
+        samsung,audio-codec = <&wm8994>;
+    };
-- 
2.32.0

