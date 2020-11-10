Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B282AD18E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 09:44:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9110516D9;
	Tue, 10 Nov 2020 09:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9110516D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604997897;
	bh=tVPqdCnPJpimcMkVMjJnn3nWDO1JO1eKwlc1060pVOw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DI4NScEjYNzhklqPR7x6/pADSsmeACRrZBrKFjmu5deVMWMLcdxrsEmPKCFZ+FVmd
	 4Q/eGh+/4xMt0gFHzSW/RUR/5o2OkOLvRZJdQNN3ALTyuBJ1cAPQelBZbJQS5nRTdT
	 EUWKVRUJpfuiINzTpZKcyIQcezve1xvGJ3VrS+Aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F294EF800AE;
	Tue, 10 Nov 2020 09:43:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5348F801EB; Tue, 10 Nov 2020 09:43:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9EBEF800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 09:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9EBEF800EB
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AA8ddPR003483; Tue, 10 Nov 2020 03:43:12 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 34nsc90cv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 03:43:12 -0500
Received: from SCSQMBX11.ad.analog.com (SCSQMBX11.ad.analog.com [10.77.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0AA8hArq014669
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
 verify=FAIL); Tue, 10 Nov 2020 03:43:10 -0500
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 10 Nov 2020 00:43:09 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 10 Nov 2020 00:43:09 -0800
Received: from localhost.localdomain ([10.48.65.12])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AA8h2G7020044;
 Tue, 10 Nov 2020 03:43:03 -0500
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] dt-bindings: adau1977: convert text binding to yaml format
Date: Tue, 10 Nov 2020 10:47:54 +0200
Message-ID: <20201110084754.46756-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106102052.32582-1-alexandru.ardelean@analog.com>
References: <20201106102052.32582-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_03:2020-11-05,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011100062
Cc: broonie@kernel.org, lars@metafoo.de, lgirdwood@gmail.com,
 robh+dt@kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>
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

This change converts the old device-tree binding for ADAU1977 from text
format to the new yaml format.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---

Changelog v1 -> v2:
* updated libraries to catch newer schema errors/warnings
* fixed examples, added i2c & spi nodes

 .../bindings/sound/adi,adau1977.txt           | 61 ------------
 .../bindings/sound/adi,adau1977.yaml          | 92 +++++++++++++++++++
 2 files changed, 92 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau1977.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,adau1977.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1977.txt b/Documentation/devicetree/bindings/sound/adi,adau1977.txt
deleted file mode 100644
index 37f8aad01203..000000000000
--- a/Documentation/devicetree/bindings/sound/adi,adau1977.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-Analog Devices ADAU1977/ADAU1978/ADAU1979
-
-Datasheets:
-https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1977.pdf
-https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1978.pdf
-https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1979.pdf
-
-This driver supports both the I2C and SPI bus.
-
-Required properties:
- - compatible: Should contain one of the following:
-               "adi,adau1977"
-               "adi,adau1978"
-               "adi,adau1979"
-
- - AVDD-supply: analog power supply for the device, please consult
-                Documentation/devicetree/bindings/regulator/regulator.txt
-
-Optional properties:
- - reset-gpios: the reset pin for the chip, for more details consult
-                Documentation/devicetree/bindings/gpio/gpio.txt
-
- - DVDD-supply: supply voltage for the digital core, please consult
-                Documentation/devicetree/bindings/regulator/regulator.txt
-
-- adi,micbias: configures the voltage setting for the MICBIAS pin.
-		Select 0/1/2/3/4/5/6/7/8 to specify MICBIAS voltage
-		5V/5.5V/6V/6.5V/7V/7.5V/8V/8.5V/9V
-		If not specified the default value will be "7" meaning 8.5 Volts.
-		This property is only valid for the ADAU1977
-
-For required properties on SPI, please consult
-Documentation/devicetree/bindings/spi/spi-bus.txt
-
-Required properties on I2C:
-
- - reg:         The i2c address. Value depends on the state of ADDR0
-                and ADDR1, as wired in hardware.
-
-Examples:
-
-	adau1977_spi: adau1977@0 {
-		compatible = "adi,adau1977";
-		spi-max-frequency = <600000>;
-
-		AVDD-supply = <&regulator>;
-		DVDD-supply = <&regulator_digital>;
-
-		adi,micbias = <3>;
-		reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
-	};
-
-	adau1977_i2c: adau1977@11 {
-		compatible = "adi,adau1977";
-		reg = <0x11>;
-
-		AVDD-supply = <&regulator>;
-		DVDD-supply = <&regulator_digital>;
-
-		reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/adi,adau1977.yaml b/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
new file mode 100644
index 000000000000..b80454ad97da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,adau1977.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,adau1977.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADAU1977/ADAU1978/ADAU1979 Quad ADC with Diagnostics
+
+maintainers:
+  - Lars-Peter Clausen <lars@metafoo.de>
+  - Bogdan Togorean <bogdan.togorean@analog.com>
+
+description: |
+  Analog Devices ADAU1977 and similar quad ADC with Diagnostics
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1977.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1978.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1979.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,adau1977
+      - adi,adau1978
+      - adi,adau1979
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  reset-gpios:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  AVDD-supply:
+    description: Analog power support for the device.
+
+  DVDD-supply:
+    description: Supply voltage for digital core.
+
+  adi,micbias:
+    description: |
+      Configures the voltage setting for the MICBIAS pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6, 7, 8]
+    default: 7
+
+required:
+  - reg
+  - compatible
+  - AVDD-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        adau1977_spi: adau1977@0 {
+            compatible = "adi,adau1977";
+            reg = <0>;
+            spi-max-frequency = <600000>;
+
+            AVDD-supply = <&regulator>;
+            DVDD-supply = <&regulator_digital>;
+
+            reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
+
+            adi,micbias = <3>;
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        adau1977_i2c: adau1977@11 {
+            compatible = "adi,adau1977";
+            reg = <0x11>;
+
+            AVDD-supply = <&regulator>;
+            DVDD-supply = <&regulator_digital>;
+
+            reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.17.1

