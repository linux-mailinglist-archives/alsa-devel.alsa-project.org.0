Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AA4A2F67
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 13:26:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF768178F;
	Sat, 29 Jan 2022 13:25:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF768178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643459177;
	bh=w3jaXEw89uah6bQhp9pupDriGii4X30rhU3VXVX/Bu0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+LyqeBwyUvcv8jYsJ9wTdBehJgxstN1cXNGS4sPdG6Gb4ck6430A2HuIzZYNWSB8
	 UgvmOiVxQZ+oDoC6parN/vGU32QBC2kKTLiQZkTDjHlkDmYOOusu8C2WbOozECvftw
	 fwvcbDITcE9ywEruvnRjHJtZeNB1Peuu9lUql3Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C43F8051C;
	Sat, 29 Jan 2022 13:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CBA2F8051A; Sat, 29 Jan 2022 13:24:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D88F80516
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 13:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D88F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="RCuxcgW+"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DFD783F1D9
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643459076;
 bh=aFma7LFfbMy+pdLU8XgqpfQtVODFsB45EwHFjG4cPHo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=RCuxcgW+KUeRyLhFSOEFTrmg6B6VRtdisIDeQRW5TqPHMAnxNKqJeLKpqMb7rKlzl
 yX4g4mGfttHR42wdG5pnCLDk843xf1279O2BiwgpbqCa5JTVsVsBd+RYO4swED3nE1
 08t9J7Yam/2jYTja/NpJa+FC8SPfvqABSQt8fb5ffn5lhdryR9rC7i/TmZAk5KExzU
 sctskBNEz6gp558TZWpKkhcNn7XooCkTGk61VgXfcsmB3BXRcYwKt/EfmmkWVSpRQU
 Bg+MRYkdcJden+f9XVKdUJpOF7BfQNLgUdK/BgJW+u3NnuwQlW9CjlUMv2CyXchijL
 hhSstXI7Bz2rg==
Received: by mail-wr1-f69.google.com with SMTP id
 o26-20020adfa11a000000b001dd1d3a73c7so2935449wro.21
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFma7LFfbMy+pdLU8XgqpfQtVODFsB45EwHFjG4cPHo=;
 b=Zg16PprzwCJyeUK1FrftlcWK2fwrZzMxmgqb2Lm4pSR+bSnyGVP8XHM/aBq6szi9OT
 Jg2a+MLhsYsh5/Ex0P4g71fMt3DGiLIzpx8NrUrP1EddR6XykWe4/t0g1kNyOVYRx1QU
 fZyzXUnlNCN0/ScnLuNLpcLOS4luyrYXpuEontP280sFlaV9dlu1w9i2oZ8fCl/xROdh
 Z9ikWbIaSxGN48/6PwaDd9bR5vdsLGoTdWxdRbSJKNnHfPBuTvWK1ymIWn7RbdZN59h9
 uYXh6S+C40ytJmWc5GF7m7K3YD/6mjDdzxqTjhGWR88WesdQ8GKLZR/hYXmbC8GFg0eZ
 d6RQ==
X-Gm-Message-State: AOAM532Jldu/4Qq5jNqY0h4Mo/dBSd7L82oPVZDio6Y5S5r2vSwMI1OE
 77cVuygnHJxMA6shMfxjKbKSO2+Rm+pFgkQyxVL08437EqZcqNhvCKzJlUGqjKdp+hjcOUcLycr
 ElraeDVzfO0roDiCk2rp9oWx8r2T45MTI8eMdmBgu
X-Received: by 2002:adf:f046:: with SMTP id t6mr10225196wro.684.1643459076553; 
 Sat, 29 Jan 2022 04:24:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6uVQv1yZoAqdrgKAJVhPpKtEPV3VRQWrLgTAFRKnvJZBUsYggRfijpP0h3y5+sFPo0x/DpA==
X-Received: by 2002:adf:f046:: with SMTP id t6mr10225189wro.684.1643459076349; 
 Sat, 29 Jan 2022 04:24:36 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id m28sm1106875wms.34.2022.01.29.04.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 04:24:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] ASoC: dt-bindings: samsung,
 smdk5250: convert to dtschema
Date: Sat, 29 Jan 2022 13:24:28 +0100
Message-Id: <20220129122430.45694-3-krzysztof.kozlowski@canonical.com>
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

