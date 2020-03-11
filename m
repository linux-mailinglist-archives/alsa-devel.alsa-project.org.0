Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BB181963
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 14:15:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2030B15F9;
	Wed, 11 Mar 2020 14:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2030B15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583932559;
	bh=nvA6BQl6PI2KP1cqD+maPlYuL84hxcsQenGC1RViT6c=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Zxz42nyNAOt7UG6tsmdScfadhzsbHFLZcbAYxWiFs0Z62buiyy1O5yZpALnFLXDXn
	 qxnfKuSnHNIdrZEq4NyR4h/LeeFEatuFR84f1lYwLn+6ZsDYdYX0iNZmcm7RXgMzYu
	 0G3FPyQM6Ppxld9YJHP/qHfrnStHa8BxmajLkDBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 108F1F801F7;
	Wed, 11 Mar 2020 14:14:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72ACDF801EB; Wed, 11 Mar 2020 14:14:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B6B46F800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 14:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B46F800B5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95FC731B;
 Wed, 11 Mar 2020 06:14:09 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AA4C3F67D;
 Wed, 11 Mar 2020 06:14:08 -0700 (PDT)
Date: Wed, 11 Mar 2020 13:14:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Applied "ASoC: Convert cirrus,
 cs42l51 to json-schema" to the asoc tree
In-Reply-To: <20200228152706.29749-1-benjamin.gaignard@st.com>
Message-Id: <applied-20200228152706.29749-1-benjamin.gaignard@st.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 olivier.moysan@st.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: Convert cirrus,cs42l51 to json-schema

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 97249a89c17e8f1288fed1ebc617ea2e9e88d501 Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@st.com>
Date: Fri, 28 Feb 2020 16:27:06 +0100
Subject: [PATCH] ASoC: Convert cirrus,cs42l51 to json-schema

Convert cirrus,cs42l51 to yaml format.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20200228152706.29749-1-benjamin.gaignard@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/cirrus,cs42l51.yaml        | 69 +++++++++++++++++++
 .../devicetree/bindings/sound/cs42l51.txt     | 33 ---------
 2 files changed, 69 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs42l51.txt

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
new file mode 100644
index 000000000000..efce847a3408
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs42l51.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CS42L51 audio codec DT bindings
+
+maintainers:
+  - Olivier Moysan <olivier.moysan@st.com>
+
+properties:
+  compatible:
+      const: cirrus,cs42l51
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: MCLK
+
+  reset-gpios:
+    maxItems: 1
+
+  VL-supply:
+    description: phandle to voltage regulator of digital interface section
+
+  VD-supply:
+    description: phandle to voltage regulator of digital internal section
+
+  VA-supply:
+    description: phandle to voltage regulator of analog internal section
+
+  VAHP-supply:
+    description: phandle to voltage regulator of headphone
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c@0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cs42l51@4a {
+        compatible = "cirrus,cs42l51";
+        reg = <0x4a>;
+        #sound-dai-cells = <0>;
+        clocks = <&mclk_prov>;
+        clock-names = "MCLK";
+        VL-supply = <&reg_audio>;
+        VD-supply = <&reg_audio>;
+        VA-supply = <&reg_audio>;
+        VAHP-supply = <&reg_audio>;
+        reset-gpios = <&gpiog 9 GPIO_ACTIVE_LOW>;
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/cs42l51.txt b/Documentation/devicetree/bindings/sound/cs42l51.txt
deleted file mode 100644
index acbd68ddd2cb..000000000000
--- a/Documentation/devicetree/bindings/sound/cs42l51.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-CS42L51 audio CODEC
-
-Required properties:
-
-  - compatible : "cirrus,cs42l51"
-
-  - reg : the I2C address of the device for I2C.
-
-Optional properties:
-  - VL-supply, VD-supply, VA-supply, VAHP-supply: power supplies for the device,
-    as covered in Documentation/devicetree/bindings/regulator/regulator.txt.
-
-  - reset-gpios : GPIO specification for the reset pin. If specified, it will be
-    deasserted before starting the communication with the codec.
-
-  - clocks : a list of phandles + clock-specifiers, one for each entry in
-    clock-names
-
-  - clock-names : must contain "MCLK"
-
-Example:
-
-cs42l51: cs42l51@4a {
-	compatible = "cirrus,cs42l51";
-	reg = <0x4a>;
-	clocks = <&mclk_prov>;
-	clock-names = "MCLK";
-	VL-supply = <&reg_audio>;
-	VD-supply = <&reg_audio>;
-	VA-supply = <&reg_audio>;
-	VAHP-supply = <&reg_audio>;
-	reset-gpios = <&gpiog 9 GPIO_ACTIVE_LOW>;
-};
-- 
2.20.1

