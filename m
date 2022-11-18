Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7810D63003B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 23:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00C915E2;
	Fri, 18 Nov 2022 23:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00C915E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668811104;
	bh=5bQdz6uEOXD4yFD5oCTu8+prVxg+CnsNECc5/sPq6Jw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HnP5f74RDULdGIyYxzT3tcTozR/865n1i7Dife4HDWzMeY4zr+sumMFh4hVTYusly
	 12u1pfano6WOukvpcsemOlD6bpEA8VuWwvH72xFCIVp0wc8oCc9hEbfWLKqhKnCwZj
	 BxLwnqrX6EMei0Dxp/nE6NNMH3cDULdVmbPJ66bA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90612F800B5;
	Fri, 18 Nov 2022 23:37:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C72EF801D8; Fri, 18 Nov 2022 23:37:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 530D2F800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 23:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 530D2F800FD
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-13c2cfd1126so7586201fac.10
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 14:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Ty2VrocLp2bLlPjZebG8L9XIVrPCqIEByvMG3rAIeo=;
 b=BdmEjfACkMd8pXzVR+rG8914TqeZhswmyBnzIxi/U+XDeGbZD7w/NewR52nvrti/59
 GyhwJqc6FTRBx/y+z6X00sL0VZhH1KGNT2AFAFh73gaO7xQ9cfvk2iM7hK4OwfHSrqKI
 /1mhwNdP8Xn3rR1VgpJC7AT8oGe5irXKzQvXhN8fTnwk411h1INBg522qY0WmmRzQf56
 cQAUz08RiV1Stda/YXhQ5TFxCUOqV6XEtvYC9dy1P4A9Ge2zLcfjRqDKK2qE4dlvFZuk
 QFxdYDoOHKddGZwmcPe34rtg/YjJz3w61hQbVFTU0yrbrRmv2n3Qq8M4yrhvWp1RdMRf
 podw==
X-Gm-Message-State: ANoB5pkffBtTLCuDp7svfC8VQAXfi1ZE3+8DJwuOSOY0oQvCuQMpsaVJ
 Lb+3S7LRKReHDThWHSR+Lw==
X-Google-Smtp-Source: AA0mqf5KA6oRNEPIyQHxPlu0P6RyjLJsjmwGgO5GTTQ8syn9I4hRIeraDisFZa93FVBweGZ8ATxWFQ==
X-Received: by 2002:a05:6870:7d0e:b0:142:821a:590e with SMTP id
 os14-20020a0568707d0e00b00142821a590emr3600236oab.55.1668811041798; 
 Fri, 18 Nov 2022 14:37:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q9-20020a9d7c89000000b0066c495a651dsm2064777otn.38.2022.11.18.14.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 14:37:21 -0800 (PST)
Received: (nullmailer pid 1721500 invoked by uid 1000);
 Fri, 18 Nov 2022 22:37:23 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jerome Neanne <jerome.neanne@baylibre.com>,
 Andrew Davis <afd@ti.com>
Subject: [PATCH] dt-bindings: Move fixed string node names under 'properties'
Date: Fri, 18 Nov 2022 16:37:07 -0600
Message-Id: <20221118223708.1721134-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Fixed string node names should be under 'properties' rather than
'patternProperties'. Additionally, without beginning and end of line
anchors, any prefix or suffix is allowed on the specified node name.
These cases don't appear to want a prefix or suffix, so move them under
'properties'.

In some cases, the diff turns out to look like we're moving some
patterns rather than the fixed string properties.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 54 ++++++++--------
 .../bindings/regulator/ti,tps65219.yaml       | 14 ++--
 .../bindings/sound/tlv320adcx140.yaml         | 64 +++++++++----------
 3 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 7fd8d47b1be4..4a00593b9f7f 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -123,6 +123,33 @@ properties:
       some PLLs, clocks and then brings up CPU0 for resuming the
       system.
 
+  core-supply:
+    description:
+      Phandle to voltage regulator connected to the SoC Core power rail.
+
+  core-domain:
+    type: object
+    description: |
+      The vast majority of hardware blocks of Tegra SoC belong to a
+      Core power domain, which has a dedicated voltage rail that powers
+      the blocks.
+
+    properties:
+      operating-points-v2:
+        description:
+          Should contain level, voltages and opp-supported-hw property.
+          The supported-hw is a bitfield indicating SoC speedo or process
+          ID mask.
+
+      "#power-domain-cells":
+        const: 0
+
+    required:
+      - operating-points-v2
+      - "#power-domain-cells"
+
+    additionalProperties: false
+
   i2c-thermtrip:
     type: object
     description:
@@ -300,33 +327,6 @@ patternProperties:
 
     additionalProperties: false
 
-  core-domain:
-    type: object
-    description: |
-      The vast majority of hardware blocks of Tegra SoC belong to a
-      Core power domain, which has a dedicated voltage rail that powers
-      the blocks.
-
-    properties:
-      operating-points-v2:
-        description:
-          Should contain level, voltages and opp-supported-hw property.
-          The supported-hw is a bitfield indicating SoC speedo or process
-          ID mask.
-
-      "#power-domain-cells":
-        const: 0
-
-    required:
-      - operating-points-v2
-      - "#power-domain-cells"
-
-    additionalProperties: false
-
-  core-supply:
-    description:
-      Phandle to voltage regulator connected to the SoC Core power rail.
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index 78be79930fda..78e64521d401 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -51,13 +51,6 @@ properties:
       where the board has a button wired to the pin and triggers
       an interrupt on pressing it.
 
-patternProperties:
-  "^buck[1-3]-supply$":
-    description: Input supply phandle of one regulator.
-
-  "^ldo[1-4]-supply$":
-    description: Input supply phandle of one regulator.
-
   regulators:
     type: object
     description: |
@@ -82,6 +75,13 @@ patternProperties:
 
     additionalProperties: false
 
+patternProperties:
+  "^buck[1-3]-supply$":
+    description: Input supply phandle of one regulator.
+
+  "^ldo[1-4]-supply$":
+    description: Input supply phandle of one regulator.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index ee698614862e..6b8214071115 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -109,38 +109,6 @@ properties:
       maximum: 7
     default: [0, 0, 0, 0]
 
-  ti,asi-tx-drive:
-    type: boolean
-    description: |
-      When set the device will set the Tx ASI output to a Hi-Z state for unused
-      data cycles. Default is to drive the output low on unused ASI cycles.
-
-patternProperties:
-  '^ti,gpo-config-[1-4]$':
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-    description: |
-       Defines the configuration and output driver for the general purpose
-       output pins (GPO).  These values are pairs, the first value is for the
-       configuration type and the second value is for the output drive type.
-       The array is defined as <GPO_CFG GPO_DRV>
-
-       GPO output configuration can be one of the following:
-
-       0 - (default) disabled
-       1 - GPOX is configured as a general-purpose output (GPO)
-       2 - GPOX is configured as a device interrupt output (IRQ)
-       3 - GPOX is configured as a secondary ASI output (SDOUT2)
-       4 - GPOX is configured as a PDM clock output (PDMCLK)
-
-       GPO output drive configuration for the GPO pins can be one of the following:
-
-       0d - (default) Hi-Z output
-       1d - Drive active low and active high
-       2d - Drive active low and weak high
-       3d - Drive active low and Hi-Z
-       4d - Drive weak low and active high
-       5d - Drive Hi-Z and active high
-
   ti,gpio-config:
     description: |
        Defines the configuration and output drive for the General Purpose
@@ -183,6 +151,38 @@ patternProperties:
       maximum: 15
     default: [2, 2]
 
+  ti,asi-tx-drive:
+    type: boolean
+    description: |
+      When set the device will set the Tx ASI output to a Hi-Z state for unused
+      data cycles. Default is to drive the output low on unused ASI cycles.
+
+patternProperties:
+  '^ti,gpo-config-[1-4]$':
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+       Defines the configuration and output driver for the general purpose
+       output pins (GPO).  These values are pairs, the first value is for the
+       configuration type and the second value is for the output drive type.
+       The array is defined as <GPO_CFG GPO_DRV>
+
+       GPO output configuration can be one of the following:
+
+       0 - (default) disabled
+       1 - GPOX is configured as a general-purpose output (GPO)
+       2 - GPOX is configured as a device interrupt output (IRQ)
+       3 - GPOX is configured as a secondary ASI output (SDOUT2)
+       4 - GPOX is configured as a PDM clock output (PDMCLK)
+
+       GPO output drive configuration for the GPO pins can be one of the following:
+
+       0d - (default) Hi-Z output
+       1d - Drive active low and active high
+       2d - Drive active low and weak high
+       3d - Drive active low and Hi-Z
+       4d - Drive weak low and active high
+       5d - Drive Hi-Z and active high
+
 required:
   - compatible
   - reg
-- 
2.35.1

