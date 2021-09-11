Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB40407440
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Sep 2021 02:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 205E51698;
	Sat, 11 Sep 2021 02:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 205E51698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631321292;
	bh=faHxez5H/UEY9YQEWYEfpnn8neYtYLG1uf778DMlSwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umapBc51GwN7fEmyLzwKP2ViqUus9SIvUXQ/laTGo3cZko2J4j5SXXxM5DcHOLRb4
	 WMxyTw6/o4bd/7vQKFK0qWa18UbTSNQtEXLkiW0SVJ9YaOJOKiDdJBVW+oSXYs9K+f
	 R7JpJY4iifJ5lIE/3ElfU+nmWZUInkJ7W3NXc4ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05CDDF804B3;
	Sat, 11 Sep 2021 02:46:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 995E8F804B0; Sat, 11 Sep 2021 02:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9B74F800FC
 for <alsa-devel@alsa-project.org>; Sat, 11 Sep 2021 02:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B74F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gVUXDDpY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18B0Z7CZ013159; 
 Fri, 10 Sep 2021 19:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=IZqiyTUHD2x360lWWpykFlvpq1SKN8+9hHWr45L/WIs=;
 b=gVUXDDpYVOPaAXvtj4dr8ntOPVoUTUsUAAF5L6SFZ9Y0puPyd0+kv9By91CEjWjC0OIl
 E5HQ/60jeROYgbb63kvxCwg5s/GKVzeTlep0vmeie4evg3PM9qt0S0MoAib54RpwDS20
 ydhTGGFDKb17Y7+QUVJ1Yh3Wx7Gr+O8Ufn25n9SiHmcSRjKJ1zM0tuwVvkY1e6K0j4Nk
 OD65dN/0lvrnEzpmYgNoa/uFWPKo3DryFnnscJQgblrTMASIjGDEOvgNV5vjxkcDc2Y2
 Jjl2BZ4I0jQkOxoVMkYom0XOiO2c2+nR4WDcV/VaMhP+7Me7LMomnfIpti5sZhAwupJA 9g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3aytg79kjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 10 Sep 2021 19:46:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Sat, 11 Sep
 2021 01:46:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Sat, 11 Sep 2021 01:46:28 +0100
Received: from mail1.cirrus.com (unknown [198.61.64.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8BD8045D;
 Sat, 11 Sep 2021 00:46:26 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <ckeepax@opensource.cirrus.com>, 
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>,
 <pierre-louis.bossart@linux.intel.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 2/2] ASoC: cs35l41: Add bindings for CS35L41
Date: Fri, 10 Sep 2021 19:45:46 -0500
Message-ID: <20210911004546.2139657-3-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911004546.2139657-1-drhodes@opensource.cirrus.com>
References: <20210911004546.2139657-1-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bfr3_iXteb1C4pR3vPY1s-ycmg1GPHmr
X-Proofpoint-ORIG-GUID: bfr3_iXteb1C4pR3vPY1s-ycmg1GPHmr
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>
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

Devicetree binding documentation for CS35L41 driver

CS35L41 is a 11-V Boosted Mono Class D Amplifier with
DSP Speaker Protection and Equalization

Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cs35l41.yaml    | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cs35l41.yaml

diff --git a/Documentation/devicetree/bindings/sound/cs35l41.yaml b/Documentation/devicetree/bindings/sound/cs35l41.yaml
new file mode 100644
index 000000000000..fde78c850286
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cs35l41.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cs35l41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS35L41 Speaker Amplifier
+
+maintainers:
+  - david.rhodes@cirrus.com
+
+description: |
+  CS35L41 is a boosted mono Class D amplifier with DSP
+  speaker protection and equalization
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs35l40
+      - cirrus,cs35l41
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    description:
+      The first cell indicating the audio interface.
+    const: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  VA-supply:
+    description: voltage regulator phandle for the VA supply
+
+  VP-supply:
+    description: voltage regulator phandle for the VP supply
+
+  cirrus,boost-peak-milliamp:
+    description:
+      Boost-converter peak current limit in mA.
+      Configures the peak current by monitoring the current through the boost FET.
+      Range starts at 1600 mA and goes to a maximum of 4500 mA with increments
+      of 50 mA. See section 4.3.6 of the datasheet for details.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 1600
+    maximum: 4500
+    default: 4500
+
+  cirrus,boost-ind-nanohenry:
+    description:
+      Boost inductor value, expressed in nH. Valid
+      values include 1000, 1200, 1500 and 2200.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 1000
+    maximum: 2200
+
+  cirrus,boost-cap-microfarad:
+    description:
+      Total equivalent boost capacitance on the VBST
+      and VAMP pins, derated at 11 volts DC. The value must be rounded to the
+      nearest integer and expressed in uF.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  cirrus,asp-sdout-hiz:
+    description:
+      Audio serial port SDOUT Hi-Z control. Sets the Hi-Z
+      configuration for SDOUT pin of amplifier.
+      0 = Logic 0 during unused slots, and while all transmit channels disabled
+      1 = Hi-Z during unused slots but logic 0 while all transmit channels disabled
+      2 = (Default) Logic 0 during unused slots, but Hi-Z while all transmit channels disabled
+      3 = Hi-Z during unused slots and while all transmit channels disabled
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 3
+    default: 2
+
+  cirrus,gpio1-polarity-invert:
+    description:
+      Boolean which specifies whether the GPIO1
+      level is inverted. If this property is not present the level is not inverted.
+    type: boolean
+
+  cirrus,gpio1-output-enable:
+    description:
+      Boolean which specifies whether the GPIO1 pin
+      is configured as an output. If this property is not present the
+      pin will be configured as an input.
+    type: boolean
+
+  cirrus,gpio1-src-select:
+    description:
+      Configures the function of the GPIO1 pin.
+      Note that the options are different from the GPIO2 pin
+      0 = High Impedance (Default)
+      1 = GPIO
+      2 = Sync
+      3 = MCLK input
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 3
+
+  cirrus,gpio2-polarity-invert:
+    description:
+      Boolean which specifies whether the GPIO2
+      level is inverted. If this property is not present the level is not inverted.
+    type: boolean
+
+  cirrus,gpio2-output-enable:
+    description:
+      Boolean which specifies whether the GPIO2 pin
+      is configured as an output. If this property is not present the
+      pin will be configured as an input.
+    type: boolean
+
+  cirrus,gpio2-src-select:
+    description:
+      Configures the function of the GPIO2 pin.
+      Note that the options are different from the GPIO1 pin.
+      0 = High Impedance (Default)
+      1 = GPIO
+      2 = Open Drain INTB
+      3 = MCLK input
+      4 = Push-pull INTB (active low)
+      5 = Push-pull INT (active high)
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 5
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - cirrus,boost-peak-milliamp
+  - cirrus,boost-ind-nanohenry
+  - cirrus,boost-cap-microfarad
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      cs35l41: cs35l41@2 {
+        compatible = "cirrus,cs35l41";
+        reg = <2>;
+        VA-supply = <&dummy_vreg>;
+        VP-supply = <&dummy_vreg>;
+        reset-gpios = <&gpio 110 0>;
+        cirrus,boost-peak-milliamp = <4500>;
+        cirrus,boost-ind-nanohenry = <1000>;
+        cirrus,boost-cap-microfarad = <15>;
+      };
\ No newline at end of file
-- 
2.25.1

