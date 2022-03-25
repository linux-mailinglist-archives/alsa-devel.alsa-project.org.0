Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31B24E77C2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:36:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5677816E6;
	Fri, 25 Mar 2022 16:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5677816E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222592;
	bh=2n8SZxW/c+uKNScbsLPpkBSsbkkXDn51crnHh0yts1w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vYd3tiUThlBD5ra3n4hnrmFRix9o63QtbCiLywtX3zzi7ULrFGmlm1Z3dd/98tPS5
	 1w2h6dGXLAlQmswnSUkllvn4h87/TQp9C0v9ngeUJPYbj9hUx/UCMK76b+aTFffOi1
	 9j4AF8iCvK/T98um5tZBwEYXogXhHE6OBgcJDd9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BFCBF8053E;
	Fri, 25 Mar 2022 16:33:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A046EF80536; Fri, 25 Mar 2022 16:33:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4D81F80527
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4D81F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F26rIHzt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1D0FB828FA;
 Fri, 25 Mar 2022 15:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1895C340F3;
 Fri, 25 Mar 2022 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222394;
 bh=2n8SZxW/c+uKNScbsLPpkBSsbkkXDn51crnHh0yts1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F26rIHztqZl9eGZku9QIjKCIILKpD+fw6vTwrZ7eNUVjwrYnavFhOqv/3coM+4Yc3
 /797kFY7Qg+DJJY+V1fluQZkS4xHGG2eSJNo9VPN20FJ/OMNu8Aldb3FciJ9WsDqVZ
 RGtPG8Te4VDMRbsWQr3Cqzuh6UTxlAnaR2tCw3Bb34hdEZyflqNdqGuaUAwn4jybkd
 ipumTHsCKzJz51MiA8cbEwndU1Tb8oyiTCDZANPYl3OmpK0gwkrbbe1fAmohaRqNkB
 q2PjBCgcCatgV+WGniGSZFFzzDTJyLoW4vlYLbsXkOTvdtuqWPQ52YmaJ5z1D9dRjF
 F6zuohaxwd+nQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 6/7] ASoC: wm8731: Convert DT bindings to YAML format
Date: Fri, 25 Mar 2022 15:31:20 +0000
Message-Id: <20220325153121.1598494-7-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4272; h=from:subject;
 bh=2n8SZxW/c+uKNScbsLPpkBSsbkkXDn51crnHh0yts1w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBHO9ZXU/9OFKM3UQF17aC9qjtZqidSyQ+uGa4a
 /kxT82uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gRwAKCRAk1otyXVSH0NzSCA
 CDv94myW3KiuJnWu2P+bkOK3LKLY+xHrIVubeIzbMFzM8690rO0XC0AmGSE/DqwGrXeIQgAyN7+SU5
 vvXcfXJaX0PZRVoSyyYxKwvYmwYGbgdAL/0imsXfLGNK6UMzOsICZOb6L63EymfcREY5dSllHu+AOf
 LrIYmeWQLHDWK2Q2IgNOZQYQvpiyFYf2r4jWO6T1vtyuGGP3pELVl9fUso9mijJcww3DlR/5MW74mN
 Rj0D3BgkbaDT7SjHt6jwAM77/9RIXmkJuLkqlBMiQrUqMAWkp02TxGkFyTRBlfK2bSV49wpTqLUPN0
 C8GjXYaAxTQEUl2EKcnha3IKDx0IRl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
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

Convert the WM8731 DT bindings to YAML format, including addition of
documentation for the regulator and clock bindings which the driver has
had for some time but which were not covered in the bindings document.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/sound/wlf,wm8731.yaml | 97 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8731.txt      | 27 ------
 2 files changed, 97 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8731.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
new file mode 100644
index 000000000000..e7220e8b49f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8731.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson Microelectromics WM8731 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description: |
+  Wolfson Microelectronics WM8731 audio CODEC
+
+  Pins on the device (for linking into audio routes):
+    * LOUT: Left Channel Line Output
+    * ROUT: Right Channel Line Output
+    * LHPOUT: Left Channel Headphone Output
+    * RHPOUT: Right Channel Headphone Output
+    * LLINEIN: Left Channel Line Input
+    * RLINEIN: Right Channel Line Input
+    * MICIN: Microphone Input
+
+properties:
+  compatible:
+    enum:
+      - wlf,wm8731
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    description: Clock provider for MCLK pin.
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  AVDD-supply:
+    description: Analog power supply regulator on the AVDD pin.
+
+  HPVDD-supply:
+    description: Headphone power supply regulator on the HPVDD pin.
+
+  DBVDD-supply:
+    description: Digital buffer supply regulator for the DBVDD pin.
+
+  DCVDD-supply:
+    description: Digital core supply regulator for the DCVDD pin.
+
+  spi-max-frequency: true
+
+additionalProperties: false
+
+required:
+  - reg
+  - compatible
+  - AVDD-supply
+  - HPVDD-supply
+  - DBVDD-supply
+  - DCVDD-supply
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        wm8731_i2c: codec@0 {
+            compatible = "wlf,wm8731";
+            reg = <0>;
+            spi-max-frequency = <12500000>;
+
+            AVDD-supply = <&avdd_reg>;
+            HPVDD-supply = <&hpvdd_reg>;
+            DCVDD-supply = <&dcvdd_reg>;
+            DBVDD-supply = <&dbvdd_reg>;
+        };
+    };
+  - |
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        wm8731_spi: codec@1b {
+            compatible = "wlf,wm8731";
+            reg = <0x1b>;
+
+            AVDD-supply = <&avdd_reg>;
+            HPVDD-supply = <&hpvdd_reg>;
+            DCVDD-supply = <&dcvdd_reg>;
+            DBVDD-supply = <&dbvdd_reg>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8731.txt b/Documentation/devicetree/bindings/sound/wm8731.txt
deleted file mode 100644
index f660d9bb0e69..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8731.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-WM8731 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8731"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Example:
-
-wm8731: codec@1a {
-	compatible = "wlf,wm8731";
-	reg = <0x1a>;
-};
-
-Available audio endpoints for an audio-routing table:
- * LOUT: Left Channel Line Output
- * ROUT: Right Channel Line Output
- * LHPOUT: Left Channel Headphone Output
- * RHPOUT: Right Channel Headphone Output
- * LLINEIN: Left Channel Line Input
- * RLINEIN: Right Channel Line Input
- * MICIN: Microphone Input
-- 
2.30.2

