Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AE5403D0B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 17:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 127EC16C7;
	Wed,  8 Sep 2021 17:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 127EC16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631116612;
	bh=igvxnw0yOXrVKptNWVZdXvQ/VVT2hsJgr1pB9lUmpHw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JLeO/1kRLz/cVQpeHvQb04VcwbgPi+tkqDUiGHNz4Bvsxy9d1ki6oSnjqquJq6NZc
	 x9tXno4fky8NQxLM6MdvNap/0quVG14OxSPt5/RV7Vl1G4Y/tFc9Kkbcph6U+B4AnP
	 VIeVKyD7sazE57b+yxya4+LM3WvQajjj6vBMmLEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB449F804DF;
	Wed,  8 Sep 2021 17:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA1AF80149; Wed,  8 Sep 2021 17:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08FF0F80149
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 17:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FF0F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="kDVoA0kD"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188Fp9gH017908;
 Wed, 8 Sep 2021 17:55:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=TZ7ZzgGmiyQVX+gn52qM4CzzK4P/AcAj1jnWvuu2uv8=;
 b=kDVoA0kDr+rZmQIWXpRdOp+k1SQg29BnpogS5Tjg8OGz0Rv2F5LfDK9OR8UrRkZSOjaH
 3ASovSR8e2pRv/tsjsq/6c4cQR4XxzKCkbfsGiEjTcWsbQI8ZT0ZXuGo4rw/WUYI4m3g
 fqqYB5dAZ3cLvsaNwvW9AVsO5+/Zf4p+VxSLAFKDfkJkXcBcA9UKv3453MA3zSL9m2RW
 KfVc/OPC1BHgT7qOuKmFdQdN9PsrGljI4A7q3edWiW8i9xrzJ8S6NYvz+IEaR6yoMFL4
 V5mANyLPFXSnPqA0q/qoCN9BaqCZ1Otyk/QGBswkIxNSlZUCdA1CXxC7YINI0361yk0E 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3axwtygupm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 17:55:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5922100034;
 Wed,  8 Sep 2021 17:54:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFFEC21E697;
 Wed,  8 Sep 2021 17:54:59 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep 2021 17:54:59
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/7] dt-bindings: iio: adc: add generic channel binding
Date: Wed, 8 Sep 2021 17:54:46 +0200
Message-ID: <20210908155452.25458-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908155452.25458-1-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Add ADC generic channel binding. This binding should
be used as an alternate to legacy channel properties
whenever possible.
ADC generic channel binding allows to identify supported
internal channels through the following reserved label names:
"vddcore", "vrefint" and "vbat".
This binding also allows to set a different sampling time
for each channel.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
Note: The schema here is too permissive as either legacy or generic
channels properties are required. These properties are mutually
exclusive, however all attempts to describe this constraint are
failing. In particular the following schemas and their variants have
shown unsucessful.

oneOf:
  - anyOf:
	- required:
		- st,adc-channels
	- required:
		- st,adc-diff-channels
  - anyOf:
	- required:
		- $nodename

- if:
  patternProperties:
    "^channel@([0-9]|1[0-9])$":
      type: object
then:
  properties:
    st,adc-channels: false
    st,adc-diff-channels: false
else:
  - anyOf:
      - required:
          - st,adc-channels
      - required:
          - st,adc-diff-channels
---
 .../bindings/iio/adc/st,stm32-adc.yaml        | 100 ++++++++++++++++--
 1 file changed, 93 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index a58334c3bb76..a1f6cbe144ba 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -222,6 +222,12 @@ patternProperties:
       '#io-channel-cells':
         const: 1
 
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       interrupts:
         description: |
           IRQ Line for the ADC instance. Valid values are:
@@ -265,7 +271,9 @@ patternProperties:
           <vinp vinn>, <vinp vinn>,... vinp and vinn are numbered from 0 to 19.
 
           Note: At least one of "st,adc-channels" or "st,adc-diff-channels" is
-          required. Both properties can be used together. Some channels can be
+          required if no adc generic channel is defined. These legacy channel
+          properties are exclusive with adc generic channel bindings.
+          Both properties can be used together. Some channels can be
           used as single-ended and some other ones as differential (mixed). But
           channels can't be configured both as single-ended and differential.
         $ref: /schemas/types.yaml#/definitions/uint32-matrix
@@ -290,6 +298,44 @@ patternProperties:
           each channel.
         $ref: /schemas/types.yaml#/definitions/uint32-array
 
+    patternProperties:
+      "^channel@([0-9]|1[0-9])$":
+        type: object
+        $ref: "adc.yaml"
+        description: |
+          Represents the external channels which are connected to the ADC.
+
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 19
+
+          label:
+            description: |
+              Unique name to identify which channel this is.
+              Reserved label names "vddcore", "vrefint" and "vbat"
+              are used to identify internal channels with matching names.
+
+          diff-channels:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              minimum: 0
+              maximum: 19
+
+          st,min-sample-time-nsecs:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              Minimum sampling time in nanoseconds. Depending on hardware (board)
+              e.g. high/low analog input source impedance, fine tune of ADC
+              sampling time may be recommended.
+
+        required:
+          - reg
+
+    dependencies:
+      $nodename: [ '#address-cells', '#size-cells' ]
+
     allOf:
       - if:
           properties:
@@ -369,12 +415,6 @@ patternProperties:
 
     additionalProperties: false
 
-    anyOf:
-      - required:
-          - st,adc-channels
-      - required:
-          - st,adc-diff-channels
-
     required:
       - compatible
       - reg
@@ -451,4 +491,50 @@ examples:
         // other adc child node follow...
       };
 
+  - |
+    // Example 3: with stm32mp157c to setup ADC2 with:
+    // - internal channels 13, 14, 15.
+      #include <dt-bindings/interrupt-controller/arm-gic.h>
+      #include <dt-bindings/clock/stm32mp1-clks.h>
+      adc122: adc@48003000 {
+        compatible = "st,stm32mp1-adc-core";
+        reg = <0x48003000 0x400>;
+        interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rcc ADC12>, <&rcc ADC12_K>;
+        clock-names = "bus", "adc";
+        booster-supply = <&booster>;
+        vdd-supply = <&vdd>;
+        vdda-supply = <&vdda>;
+        vref-supply = <&vref>;
+        st,syscfg = <&syscfg>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        adc@100 {
+          compatible = "st,stm32mp1-adc";
+          #io-channel-cells = <1>;
+          reg = <0x100>;
+          interrupts = <1>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+          channel@13 {
+            reg = <13>;
+            label = "vrefint";
+            st,min-sample-time-nsecs = <9000>;
+          };
+          channel@14 {
+            reg = <14>;
+            label = "vddcore";
+            st,min-sample-time-nsecs = <9000>;
+          };
+          channel@15 {
+            reg = <15>;
+            label = "vbat";
+            st,min-sample-time-nsecs = <9000>;
+          };
+        };
+      };
+
 ...
-- 
2.17.1

