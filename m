Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F04DDF07
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 17:31:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A023E18B0;
	Fri, 18 Mar 2022 17:30:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A023E18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647621066;
	bh=d4pOgmWLH2AN0/vLZvvEU75NtwO+RNilito/Gin9Fhk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJMdY2HzMTrvsFRwkW9docEEdTiUFb8plrsNhH9fSAckpcZImwX3yTciCcdrw9OiT
	 TB4+rks5z+9SbRUsARQHSn+IRbtxUO7P8vgQ9xHW+3koJRBgkKHzkuK1nRv52Yqmfx
	 N65GAOuM8vmlb+J3pe8xxIzRBFDZXd/EpSRPguo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F255BF80118;
	Fri, 18 Mar 2022 17:29:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18DD4F804DA; Fri, 18 Mar 2022 17:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1361F80118
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 17:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1361F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JfaMbQWP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22ICwIRC029747;
 Fri, 18 Mar 2022 11:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=l0NijwQytPoPG4dLdvOKFpBqnKyQFX/aINmIG43AWEk=;
 b=JfaMbQWPES688gHHkz6CLnteAvfE4KwBlmyXrPXCw1Dl1BiwOgUwnQRZTSOegeS3DGky
 +ei+gHQ5f0zLrweM+Zrd4lAcqY5trgvgFJUwgKx4cpNjUgYagFaupmQcPDrqJNu0VKEk
 t2IEUMMgMq/EeX4TlYOZs0CA9PVjiOyXSUnQngfufQN92aC70BgHXZmZ67kqSkKwbS3C
 GLNa8BYmB24G8OYkcz8ZR2xOwYmJ1R8T6TqvAcKz63npGCGhhwomEkW6BHxLYJojFffy
 lgKj8SK+okrsPhzUFk8K5j9lfT5vU0242rTV0qZ2XnLGlbwsMBoYL3HiIWAL5DXwbbCm tg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3et5yp677a-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Mar 2022 11:29:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Mar
 2022 16:29:44 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 18 Mar 2022 16:29:44 +0000
Received: from debianA11184.ad.cirrus.com (debianA11184.ad.cirrus.com
 [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 906D5B16;
 Fri, 18 Mar 2022 16:29:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH 4/5] ASoC: dt-bindings: cs35l45: Cirrus Logic CS35L45 Smart Amp
Date: Fri, 18 Mar 2022 16:29:42 +0000
Message-ID: <20220318162943.1578102-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220318162943.1578102-1-rf@opensource.cirrus.com>
References: <20220318162943.1578102-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: u-rQOLOt-rSSuFI52R6XCuBSzBQ7qCBh
X-Proofpoint-GUID: u-rQOLOt-rSSuFI52R6XCuBSzBQ7qCBh
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

This adds the schema binding for the Cirrus Logic CS35L45 Smart Amp
and associated header file.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../bindings/sound/cirrus,cs35l45.yaml        | 75 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 include/dt-bindings/sound/cs35l45.h           | 20 +++++
 3 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
 create mode 100644 include/dt-bindings/sound/cs35l45.h

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
new file mode 100644
index 000000000000..184a1344ea76
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs35l45.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS35L45 Speaker Amplifier
+
+maintainers:
+  - Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
+  - Richard Fitzgerald <rf@opensource.cirrus.com>
+
+description: |
+  CS35L45 is a Boosted Mono Class D Amplifier with DSP
+  Speaker Protection and Adaptive Battery Management.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs35l45
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-a-supply:
+    description: voltage regulator phandle for the VDD_A supply
+
+  vdd-batt-supply:
+    description: voltage regulator phandle for the VDD_BATT supply
+
+  spi-max-frequency:
+    maximum: 5000000
+
+  cirrus,asp-sdout-hiz-ctrl:
+    description:
+      Audio serial port SDOUT Hi-Z control. Sets the Hi-Z
+      configuration for SDOUT pin of amplifier. Logical OR of
+      CS35L45_ASP_TX_HIZ_xxx values.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 3
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/cs35l45.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cs35l45: cs35l45@2 {
+          #sound-dai-cells = <1>;
+          compatible = "cirrus,cs35l45";
+          reg = <2>;
+          spi-max-frequency = <5000000>;
+          vdd-a-supply = <&dummy_vreg>;
+          vdd-batt-supply = <&dummy_vreg>;
+          reset-gpios = <&gpio 110 0>;
+          cirrus,asp-sdout-hiz-ctrl = <(CS35L45_ASP_TX_HIZ_UNUSED |
+                                        CS35L45_ASP_TX_HIZ_DISABLED)>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46ffe05eaeb7..0a2a8bcabbea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4580,10 +4580,12 @@ CIRRUS LOGIC AUDIO CODEC DRIVERS
 M:	James Schulman <james.schulman@cirrus.com>
 M:	David Rhodes <david.rhodes@cirrus.com>
 M:	Lucas Tanure <tanureal@opensource.cirrus.com>
+M:	Richard Fitzgerald <rf@opensource.cirrus.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	patches@opensource.cirrus.com
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/cirrus,cs*
+F:	include/dt-bindings/sound/cs*
 F:	sound/pci/hda/cs*
 F:	sound/soc/codecs/cs*
 
diff --git a/include/dt-bindings/sound/cs35l45.h b/include/dt-bindings/sound/cs35l45.h
new file mode 100644
index 000000000000..076da4b2c28d
--- /dev/null
+++ b/include/dt-bindings/sound/cs35l45.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * cs35l45.h -- CS35L45 ALSA SoC audio driver DT bindings header
+ *
+ * Copyright 2022 Cirrus Logic, Inc.
+ */
+
+#ifndef DT_CS35L45_H
+#define DT_CS35L45_H
+
+/*
+ * cirrus,asp-sdout-hiz-ctrl
+ *
+ * TX_HIZ_UNUSED:   TX pin high-impedance during unused slots.
+ * TX_HIZ_DISABLED: TX pin high-impedance when all channels disabled.
+ */
+#define CS35L45_ASP_TX_HIZ_UNUSED	0x1
+#define CS35L45_ASP_TX_HIZ_DISABLED	0x2
+
+#endif /* DT_CS35L45_H */
-- 
2.30.2

