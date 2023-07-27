Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E17656D9
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 17:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A22D86E;
	Thu, 27 Jul 2023 17:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A22D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690470342;
	bh=xd73oBDXQuPOkDGUUVWFs/YiSoWl+aZiPjr1GDi2be0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uZV9uHxtiReBu5wE4qRad3mHM4rGPSCo0vxPfnruhySxO/OkdSHfTV+9L2qzQPlVu
	 A2+FYWIroNXJnjhaRZedDkjyYQAJft/oRascOuq2qN9//bY6kZYtfCjUPtpBOHfyRl
	 T1drjSwPRmN5Rc4n9tcnZp81i20MsaG7ulVaT8/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D197FF80535; Thu, 27 Jul 2023 17:04:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76CA2F80163;
	Thu, 27 Jul 2023 17:04:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 369B1F80535; Thu, 27 Jul 2023 17:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A83FF80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 17:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A83FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=MQkN1j5N
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RE3U0q003285;
	Thu, 27 Jul 2023 17:04:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=54e2m5OKuocPe4dp4QsV6CEA9XKHKLdL/q4eaLhIrXU=;
 b=MQkN1j5NB6wKg/+mjQuh6n12Igh2DkCf1Mi06ZiIs84zKithAtkes8mIfA7akc6Sf48Y
 UlrRmvQWkx8P2YmSK3KZi5WmYZQMnvwXHT9jvNah+QSwDIjFFYrBnU0juugvuXeyLqW9
 jbPZbo8y10GmxjSSRv3HfzApHzvP2cLBvrD8yfqNAsAxdJfxBQHnkrg4iWZAuC3CKBlG
 58IezRMAaRQH9C5wkGmOsXCroYDlRu0NEsAUgQKf8hJYWQBcPBaw70/d6zyf5wDD8OZ4
 Qqis3TJmx9ON0UvdcN13Qe5h4DP32foHhA1PQbIcgLn+bqA1kntjBLuJQ1FcScoDZg1c Bw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s3nyg9x5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 17:04:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F44410002A;
	Thu, 27 Jul 2023 17:04:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9751D209BA2;
	Thu, 27 Jul 2023 17:04:39 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Jul
 2023 17:04:39 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
CC: <alsa-devel@alsa-project.org>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v2 03/11] dt-bindings: iio: stm32-dfsdm-adc: add scaling support
Date: Thu, 27 Jul 2023 17:03:14 +0200
Message-ID: <20230727150324.1157933-4-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727150324.1157933-1-olivier.moysan@foss.st.com>
References: <20230727150324.1157933-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
Message-ID-Hash: KY47KB7X7O6LDIDZB2PWI5HCJPPESGWB
X-Message-ID-Hash: KY47KB7X7O6LDIDZB2PWI5HCJPPESGWB
X-MailFrom: prvs=5572493f00=olivier.moysan@foss.st.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KY47KB7X7O6LDIDZB2PWI5HCJPPESGWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add scaling support to STM32 DFSDM.

This introduces the following changes:
- Add ADC generic channel binding and remove support of deprecated
channel bindings.
- DFSDM is now implemented as a channel provider, so remove io-channels
properties.
- Add iio-backend property to connect DFSDM to an SD modulator.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 189 ++++++------------
 1 file changed, 63 insertions(+), 126 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 1970503389aa..128545cedc7f 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -85,22 +85,14 @@ patternProperties:
         description: Specifies the DFSDM filter instance used.
         maxItems: 1
 
-      interrupts:
-        maxItems: 1
+      '#address-cells':
+        const: 1
 
-      st,adc-channels:
-        description: |
-          List of single-ended channels muxed for this ADC.
-          On stm32h7 and stm32mp1:
-          - For st,stm32-dfsdm-adc: up to 8 channels numbered from 0 to 7.
-          - For st,stm32-dfsdm-dmic: 1 channel numbered from 0 to 7.
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        items:
-          minimum: 0
-          maximum: 7
+      '#size-cells':
+        const: 0
 
-      st,adc-channel-names:
-        description: List of single-ended channel names.
+      interrupts:
+        maxItems: 1
 
       st,filter-order:
         description: |
@@ -111,39 +103,6 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         maximum: 5
 
-      "#io-channel-cells":
-        const: 1
-
-      st,adc-channel-types:
-        description: |
-          Single-ended channel input type.
-          - "SPI_R": SPI with data on rising edge (default)
-          - "SPI_F": SPI with data on falling edge
-          - "MANCH_R": manchester codec, rising edge = logic 0, falling edge = logic 1
-          - "MANCH_F": manchester codec, rising edge = logic 1, falling edge = logic 0
-        items:
-          enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
-        $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-
-      st,adc-channel-clk-src:
-        description: |
-          Conversion clock source.
-          - "CLKIN": external SPI clock (CLKIN x)
-          - "CLKOUT": internal SPI clock (CLKOUT) (default)
-          - "CLKOUT_F": internal SPI clock divided by 2 (falling edge).
-          - "CLKOUT_R": internal SPI clock divided by 2 (rising edge).
-        items:
-          enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
-        $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-
-      st,adc-alt-channel:
-        description:
-          Must be defined if two sigma delta modulators are
-          connected on same SPI input.
-          If not set, channel n is connected to SPI input n.
-          If set, channel n is connected to SPI input n + 1.
-        type: boolean
-
       st,filter0-sync:
         description:
           Set to 1 to synchronize with DFSDM filter instance 0.
@@ -157,14 +116,68 @@ patternProperties:
         items:
           - const: rx
 
+    patternProperties:
+      "^channel@([0-9]|1[0-9])$":
+        type: object
+        $ref: "adc.yaml"
+        description: Represents the external channels which are connected to the DFSDM.
+
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 19
+
+          label:
+            description: |
+              Unique name to identify channel.
+
+          st,adc-channel-types:
+            description: |
+              Single-ended channel input type.
+              - "SPI_R": SPI with data on rising edge (default)
+              - "SPI_F": SPI with data on falling edge
+              - "MANCH_R": manchester codec, rising edge = logic 0, falling edge = logic 1
+              - "MANCH_F": manchester codec, rising edge = logic 1, falling edge = logic 0
+            items:
+              enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
+            $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+
+          st,adc-channel-clk-src:
+            description: |
+              Conversion clock source.
+              - "CLKIN": external SPI clock (CLKIN x)
+              - "CLKOUT": internal SPI clock (CLKOUT) (default)
+              - "CLKOUT_F": internal SPI clock divided by 2 (falling edge).
+              - "CLKOUT_R": internal SPI clock divided by 2 (rising edge).
+            items:
+              enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
+            $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+
+          st,adc-alt-channel:
+            description:
+              Must be defined if two sigma delta modulators are
+              connected on same SPI input.
+              If not set, channel n is connected to SPI input n.
+              If set, channel n is connected to SPI input n + 1.
+            type: boolean
+
+          io-backends:
+            description: |
+              phandle to an external sigma delta modulator or internal ADC output.
+            $ref: /schemas/types.yaml#/definitions/phandle
+
+        required:
+          - reg
+          - io-backends
+
+        additionalProperties: false
+
     required:
       - compatible
       - reg
       - interrupts
-      - st,adc-channels
-      - st,adc-channel-names
       - st,filter-order
-      - "#io-channel-cells"
 
     allOf:
       - if:
@@ -175,14 +188,6 @@ patternProperties:
 
         then:
           properties:
-            st,adc-channels:
-              minItems: 1
-              maxItems: 8
-
-            st,adc-channel-names:
-              minItems: 1
-              maxItems: 8
-
             st,adc-channel-types:
               minItems: 1
               maxItems: 8
@@ -191,14 +196,6 @@ patternProperties:
               minItems: 1
               maxItems: 8
 
-            io-channels:
-              description:
-                From common IIO binding. Used to pipe external sigma delta
-                modulator or internal ADC output to DFSDM channel.
-
-          required:
-            - io-channels
-
       - if:
           properties:
             compatible:
@@ -207,12 +204,6 @@ patternProperties:
 
         then:
           properties:
-            st,adc-channels:
-              maxItems: 1
-
-            st,adc-channel-names:
-              maxItems: 1
-
             st,adc-channel-types:
               maxItems: 1
 
@@ -237,15 +228,9 @@ patternProperties:
                 "#sound-dai-cells":
                   const: 0
 
-                io-channels:
-                  description:
-                    From common IIO binding. Used to pipe external sigma delta
-                    modulator or internal ADC output to DFSDM channel.
-
               required:
                 - compatible
                 - "#sound-dai-cells"
-                - io-channels
 
 allOf:
   - if:
@@ -278,52 +263,4 @@ allOf:
                 minimum: 0
                 maximum: 5
 
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/stm32mp1-clks.h>
-    dfsdm: dfsdm@4400d000 {
-      compatible = "st,stm32mp1-dfsdm";
-      reg = <0x4400d000 0x800>;
-      clocks = <&rcc DFSDM_K>, <&rcc ADFSDM_K>;
-      clock-names = "dfsdm", "audio";
-      #address-cells = <1>;
-      #size-cells = <0>;
-
-      dfsdm0: filter@0 {
-        compatible = "st,stm32-dfsdm-dmic";
-        reg = <0>;
-        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
-        dmas = <&dmamux1 101 0x400 0x01>;
-        dma-names = "rx";
-        #io-channel-cells = <1>;
-        st,adc-channels = <1>;
-        st,adc-channel-names = "dmic0";
-        st,adc-channel-types = "SPI_R";
-        st,adc-channel-clk-src = "CLKOUT";
-        st,filter-order = <5>;
-
-        asoc_pdm0: dfsdm-dai {
-          compatible = "st,stm32h7-dfsdm-dai";
-          #sound-dai-cells = <0>;
-          io-channels = <&dfsdm0 0>;
-        };
-      };
-
-      dfsdm_pdm1: filter@1 {
-        compatible = "st,stm32-dfsdm-adc";
-        reg = <1>;
-        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-        dmas = <&dmamux1 102 0x400 0x01>;
-        dma-names = "rx";
-        #io-channel-cells = <1>;
-        st,adc-channels = <2 3>;
-        st,adc-channel-names = "in2", "in3";
-        st,adc-channel-types = "SPI_R", "SPI_R";
-        st,adc-channel-clk-src = "CLKOUT_F", "CLKOUT_F";
-        io-channels = <&sd_adc2 &sd_adc3>;
-        st,filter-order = <1>;
-      };
-    };
-
 ...
-- 
2.25.1

