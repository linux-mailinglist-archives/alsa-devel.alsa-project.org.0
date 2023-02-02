Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC56886C2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 19:39:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3A3ED4;
	Thu,  2 Feb 2023 19:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3A3ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675363166;
	bh=D2+8waWGdQDq5vcLBu8LAPugcaNAoS6HUSTb+IOlYJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KEilPGH3dFyKFn/o/qCSqv6wwcUo83b3p5NU9Y26WqE2OLl7H4aBSrHrzITtUvpIk
	 bPlf4rD3WCq9d9Ob4EMwBqp03bSRKL3VMHUL1U2qk8LZUO9cAcvSzgAJ5kLCJlvldh
	 gN7zplCl4M1d3vvsxjU9gbOpw1wbGK/ckxLjzRG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BFB5F80558;
	Thu,  2 Feb 2023 19:37:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32561F8055B; Thu,  2 Feb 2023 19:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4F46F80551
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 19:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F46F80551
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xaYuudaL
Received: by mail-wr1-x436.google.com with SMTP id m14so2524142wrg.13
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 10:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZDf/HLHsmXllvXlzMaBba2wF4a3xInBovmR2gll1NE=;
 b=xaYuudaLyB+uAk3PVQ8DP1LP3TKOxSqkpwctcjT4Z0iVbrSjlIK7ROCuOD4TzGetXo
 tgqj0nGRsRQJe072REFgPgVjHQ61dQkyQ5aEa/e1iHKNSevRrsRIF1xECSFXNThvxi8q
 PwFwhy/U4yfMzR+lsF4xgGiPi+SKpVMSj4sxR3WM/+My7FdcSoHpJmJ23HL4wFjcipNM
 JTB+yER/k59c2hjSoR533p4BYEdcUx7B5RLfR0YaDmPSpm/sp83jQTcs18KIfbZhK2du
 ELJ9eRv3HiVXVpuad6m6/Z/hcVB7PWmib8ZJlJvx+Py4/mEjinnOAWxXh9fSxRK0LwYM
 NhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZDf/HLHsmXllvXlzMaBba2wF4a3xInBovmR2gll1NE=;
 b=HyaftGEeYu4PmyT04H+dxsACdg3PRex/TZgHAafrft47369n1y0kztoGaJLxyQkGn6
 Zo4b9fLby8OEMtD67BtXzbYHCaw9xP1H9Q4B7k7C8rN3xAu/rYeFyru+Mf8gJkivMJco
 KQyrPa22xzcKw7xmZC+RlR2fzMexDznaquh+K0ISaNAm0z3gh1ZBIGuLwf3Y62p0yx5O
 Twx6R4oC8RhjheR4/Gm8hQv2Idau7JanbXknsXcqS4t2YFJs+Zw9On1M72sIi4FGtDve
 ias9Ik9xqISx5PgVgrmxf/0itaOJ+mSTnYCADJOjOZI844nQkYnQ68Zgm+/Iyv+gIEHW
 bhyw==
X-Gm-Message-State: AO0yUKUVm96QAU+qS8B7h2SypgDOMDPsRTzpW3oHU/OEPkveJ2cpF2M2
 1WdbdQLckELny/NDjqnOCNKZ0A==
X-Google-Smtp-Source: AK7set87mrYHNE/0/I372ct8ZaVBEWpNKw4XOYrrrvcmO7iVSYhOhxapZ0+s93W5U33cXIJHeAn8Sg==
X-Received: by 2002:a5d:6da3:0:b0:2bf:ae11:c40c with SMTP id
 u3-20020a5d6da3000000b002bfae11c40cmr7784287wrs.32.1675363054576; 
 Thu, 02 Feb 2023 10:37:34 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74]) by smtp.googlemail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:37:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH 3/9] ASoC: dt-bindings: meson: convert axg tdm interface to
 schema
Date: Thu,  2 Feb 2023 19:36:47 +0100
Message-Id: <20230202183653.486216-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert the DT binding documentation for the Amlogic tdm interface to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 -------
 .../bindings/sound/amlogic,axg-tdm-iface.yaml | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
deleted file mode 100644
index cabfb26a5f22..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Audio TDM Interfaces
-
-Required properties:
-- compatible: 'amlogic,axg-tdm-iface'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "sclk" : bit clock.
-  * "lrclk": sample clock
-  * "mclk" : master clock
-	     -> optional if the interface is in clock slave mode.
-- #sound-dai-cells: must be 0.
-
-Example of TDM_A on the A113 SoC:
-
-tdmif_a: audio-controller@0 {
-	compatible = "amlogic,axg-tdm-iface";
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-	clock-names = "mclk", "sclk", "lrclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
new file mode 100644
index 000000000000..362414fc9a9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio TDM Interfaces
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller-.*"
+
+  compatible:
+    items:
+      - const: 'amlogic,axg-tdm-iface'
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    items:
+      - description: Bit clock
+      - description: Sample clock
+      - description: Master clock #optional
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: sclk
+      - const: lrclk
+      - const: mclk
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    tdmif_a: audio-controller-0 {
+        compatible = "amlogic,axg-tdm-iface";
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+        clock-names = "sclk", "lrclk", "mclk";
+    };
-- 
2.39.0

