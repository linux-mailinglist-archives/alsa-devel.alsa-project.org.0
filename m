Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692493B417
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 17:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEBE9F52;
	Wed, 24 Jul 2024 17:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEBE9F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721835932;
	bh=CfM3czNrOYOVJj6So3sf8WZ8hbH2fmRvvQx8EoGR4B8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cNbDQtXySekAugPphPojWGNvu0+/XlJ+qlsSFepXj2puEwN+nOkUJg/SX14grLXFq
	 J1ZPtIZDLlHdAg+wqLILilDye3LZLvVtqwWus39+rLnYwrd2KlY93IakYyo0vXnu74
	 NreiQb8NJG0YZseiLyUwwb+N+iehAfUBslkQTU+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AD27F805D6; Wed, 24 Jul 2024 17:44:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CBAF805D9;
	Wed, 24 Jul 2024 17:44:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4021F8026D; Wed, 24 Jul 2024 17:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF1E4F8007E
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 17:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF1E4F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=6qNFYsx0
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46OBRJaZ025712;
	Wed, 24 Jul 2024 17:39:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	opIVBJcqT90KCt+B1wmwMEzKfiskRGNNy4kpQrfUzOM=; b=6qNFYsx0vDn0VSRp
	tu9vmY5UU3X8CM58NYGKezZCO5QGB3rsem6qjpZpK/tywbDf99v6w9OAjwVxd3FC
	2XEaYVTMRT6sDlB4oOkoAwFi7xh20Lej9szyki3Yiykvaa1nysK5c9VSReSX6Eed
	XjjukYkNmgznUPLRV29gM5UcZT7NbwQqeojp18RCKawWKqNFKLRyw958pmk1cJXv
	2clXkJymfdhQgUbQ0GeYUKmyufB/WM65qguCbGI8j9GShsmxjFt9rkxkk/BlWRAl
	eOhu2jhSqMmrZMMGWPL7TKT6lldP0xsg4Y2Ntjd+3IQvb7Xfz1Nuajm1RMcKmj14
	qojnKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40gr6j5x2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 17:39:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 569F540045;
	Wed, 24 Jul 2024 17:39:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4FF22414BA;
	Wed, 24 Jul 2024 17:38:31 +0200 (CEST)
Received: from localhost (10.252.12.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 24 Jul
 2024 17:38:31 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>,
        Olivier Moysan
	<olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <alsa-devel@alsa-project.org>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/9] dt-bindings: iio: dfsdm: move to backend framework
Date: Wed, 24 Jul 2024 17:36:32 +0200
Message-ID: <20240724153639.803263-5-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240724153639.803263-1-olivier.moysan@foss.st.com>
References: <20240724153639.803263-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.12.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_15,2024-07-24_01,2024-05-17_01
Message-ID-Hash: FGA3T7MP4VEGC25OJTO4UMY256P3ICPG
X-Message-ID-Hash: FGA3T7MP4VEGC25OJTO4UMY256P3ICPG
X-MailFrom: prvs=7935aa3e7e=olivier.moysan@foss.st.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGA3T7MP4VEGC25OJTO4UMY256P3ICPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the DFSDM binding to use the new IIO backend framework,
along with the adoption of IIO generic channels.
This binding change allows to add scaling support to the DFSDM.

Keep the legacy binding as deprecated for backward compatibility.

The io-backends property is supported only in generic IIO channel
binding.

- Channel description with the generic binding (Audio and Analog):

  Properties superseded by generic properties:
    st,adc-channels: becomes "reg" property in channel node
    st,adc-channel-names: becomes "label" property in channel node
  Properties moved to channel child node:
    st,adc-channel-types: becomes st,adc-channel-type
    st,adc-channel-clk-src, st,adc-alt-channel

- Analog binding:

  DFSDM filter channel is configured as an IIO backend consumer.
  Add io-backends property in channel child nodes.

  DFSDM is no more configured as a channel consumer from SD modulator.
  Use of io-channels in DFSDM node is deprecated.

- Audio binding:

  DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
  No change compare to legacy.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 124 +++++++++++++++---
 1 file changed, 108 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 2722edab1d9a..ceadd73504a4 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -102,9 +102,11 @@ patternProperties:
         items:
           minimum: 0
           maximum: 7
+        deprecated: true
 
       st,adc-channel-names:
         description: List of single-ended channel names.
+        deprecated: true
 
       st,filter-order:
         description: |
@@ -118,6 +120,12 @@ patternProperties:
       "#io-channel-cells":
         const: 1
 
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       st,adc-channel-types:
         description: |
           Single-ended channel input type.
@@ -128,6 +136,7 @@ patternProperties:
         items:
           enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
         $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+        deprecated: true
 
       st,adc-channel-clk-src:
         description: |
@@ -139,6 +148,7 @@ patternProperties:
         items:
           enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
         $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+        deprecated: true
 
       st,adc-alt-channel:
         description:
@@ -147,6 +157,7 @@ patternProperties:
           If not set, channel n is connected to SPI input n.
           If set, channel n is connected to SPI input n + 1.
         type: boolean
+        deprecated: true
 
       st,filter0-sync:
         description:
@@ -165,11 +176,60 @@ patternProperties:
       - compatible
       - reg
       - interrupts
-      - st,adc-channels
-      - st,adc-channel-names
       - st,filter-order
       - "#io-channel-cells"
 
+    patternProperties:
+      "^channel@([0-7])$":
+        type: object
+        $ref: adc.yaml
+        unevaluatedProperties: false
+        description: Represents the external channels which are connected to the DFSDM.
+
+        properties:
+          reg:
+            maximum: 7
+
+          label:
+            description:
+              Unique name to identify which channel this is.
+
+          st,adc-channel-type:
+            description: |
+              Single-ended channel input type.
+              - "SPI_R": SPI with data on rising edge (default)
+              - "SPI_F": SPI with data on falling edge
+              - "MANCH_R": manchester codec, rising edge = logic 0, falling edge = logic 1
+              - "MANCH_F": manchester codec, rising edge = logic 1, falling edge = logic 0
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
+
+          st,adc-channel-clk-src:
+            description: |
+              Conversion clock source.
+              - "CLKIN": external SPI clock (CLKIN x)
+              - "CLKOUT": internal SPI clock (CLKOUT) (default)
+              - "CLKOUT_F": internal SPI clock divided by 2 (falling edge).
+              - "CLKOUT_R": internal SPI clock divided by 2 (rising edge).
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
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
+            description:
+              Used to pipe external sigma delta modulator or internal ADC backend to DFSDM channel.
+            maxItems: 1
+
+        required:
+          - reg
+
     allOf:
       - if:
           properties:
@@ -199,9 +259,19 @@ patternProperties:
               description:
                 From common IIO binding. Used to pipe external sigma delta
                 modulator or internal ADC output to DFSDM channel.
+              deprecated: true
 
-          required:
-            - io-channels
+          if:
+            required:
+              - st,adc-channels
+          then:
+            required:
+              - io-channels
+
+          patternProperties:
+            "^channel@([0-7])$":
+              required:
+                - io-backends
 
       - if:
           properties:
@@ -298,6 +368,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
+      // Example 1: Audio use case with generic binding
       dfsdm0: filter@0 {
         compatible = "st,stm32-dfsdm-dmic";
         reg = <0>;
@@ -305,12 +376,18 @@ examples:
         dmas = <&dmamux1 101 0x400 0x01>;
         dma-names = "rx";
         #io-channel-cells = <1>;
-        st,adc-channels = <1>;
-        st,adc-channel-names = "dmic0";
-        st,adc-channel-types = "SPI_R";
-        st,adc-channel-clk-src = "CLKOUT";
+        #address-cells = <1>;
+        #size-cells = <0>;
         st,filter-order = <5>;
 
+        channel@1 {
+          reg = <1>;
+          label = "dmic0";
+          st,adc-channel-type = "SPI_R";
+          st,adc-channel-clk-src = "CLKOUT";
+          st,adc-alt-channel;
+        };
+
         asoc_pdm0: dfsdm-dai {
           compatible = "st,stm32h7-dfsdm-dai";
           #sound-dai-cells = <0>;
@@ -318,20 +395,35 @@ examples:
         };
       };
 
-      dfsdm_pdm1: filter@1 {
+      // Example 2: Analog use case with generic binding
+      dfsdm1: filter@1 {
         compatible = "st,stm32-dfsdm-adc";
         reg = <1>;
         interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
         dmas = <&dmamux1 102 0x400 0x01>;
         dma-names = "rx";
-        #io-channel-cells = <1>;
-        st,adc-channels = <2 3>;
-        st,adc-channel-names = "in2", "in3";
-        st,adc-channel-types = "SPI_R", "SPI_R";
-        st,adc-channel-clk-src = "CLKOUT_F", "CLKOUT_F";
-        io-channels = <&sd_adc2 &sd_adc3>;
         st,filter-order = <1>;
+        #io-channel-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@2 {
+          reg = <2>;
+          label = "in2";
+          st,adc-channel-type = "SPI_F";
+          st,adc-channel-clk-src = "CLKOUT";
+          st,adc-alt-channel;
+          io-backends = <&sd_adc2>;
+        };
+
+        channel@3 {
+          reg = <3>;
+          label = "in3";
+          st,adc-channel-type = "SPI_R";
+          st,adc-channel-clk-src = "CLKOUT";
+          io-backends = <&sd_adc3>;
+        };
       };
     };
 
-...
+...
\ No newline at end of file
-- 
2.25.1

