Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229C28E09A
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 14:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB3F16EE;
	Wed, 14 Oct 2020 14:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB3F16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602679066;
	bh=bItWHSBK+DOqnLcbFuQNlH4S5+xU9l2gOsuHomUy9Wk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwNfFTiX5GImriodju6d+bwWRfd9rpn4/65Ut0znKdApylXFzw3VH2lfTN9M2WjmL
	 RxozWWDJ+iK52wQ8U8RQro6F7H7FdlOLToVfUi2j0Sq45gNcNvZVAdWPlVR1JeXynP
	 E7pCo04q1ejgruE4flddEORDySy4udI0C6yRFLMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B77FF800F6;
	Wed, 14 Oct 2020 14:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5042CF80217; Wed, 14 Oct 2020 14:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC64F8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 14:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC64F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="0gW3dTGU"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09ECRGnc023713; Wed, 14 Oct 2020 14:35:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=a6IV5Cv8z3GpD5NHvsPPGT16JAZW0AbP5VtlTBCZgbY=;
 b=0gW3dTGUMUCPCrLlHSKbLXNUakOrE1zSS5pc8R4iwImq9dmyN8jYSMPtrnaYSkyrykfV
 7+fnKYW3/gxGpk1teSImS2SFtMyGBfTAQ1mSF+IxGduO+IT6i/MQMDTuxp2Q/R8s4O68
 EyH5zrjGFmkmZd61NQdVcNamD0ru9hXfZ0Jw+iTQxrWWSjYKw/Q+3BXTZ021nSyh6X1y
 RKcwAtrn9B01U+7SNaQOqIjhUTgEHeGTtwtlixKDnYtBmB+OuVLC7QWa5oN00DGtltbh
 +ZnktVyB3bRl2RVsa1n0IdnjMmckEGTKcr6PxZRQb516T16Jn8Z7Se3BCVfUq7uI8XB5 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3435875rh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 14:35:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 732A010002A;
 Wed, 14 Oct 2020 14:35:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8B382D0088;
 Wed, 14 Oct 2020 14:35:53 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 14:35:53
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <olivier.moysan@st.com>
Subject: [PATCH 1/1] ASoC: dt-bindings: stm32: convert audio dfsdm to
 json-schema
Date: Wed, 14 Oct 2020 14:35:31 +0200
Message-ID: <20201014123531.6991-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_07:2020-10-14,
 2020-10-14 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org,
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

Convert the STM32 DFSDM audio bindings to DT schema format
using json-schema.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 .../bindings/sound/st,stm32-adfsdm.txt        | 63 -------------------
 .../bindings/sound/st,stm32-adfsdm.yaml       | 42 +++++++++++++
 2 files changed, 42 insertions(+), 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt b/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
deleted file mode 100644
index 864f5b00b031..000000000000
--- a/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-STMicroelectronics Audio Digital Filter Sigma Delta modulators(DFSDM)
-
-The DFSDM allows PDM microphones capture through SPI interface. The Audio
-interface is seems as a sub block of the DFSDM device.
-For details on DFSDM bindings refer to ../iio/adc/st,stm32-dfsdm-adc.txt
-
-Required properties:
-  - compatible: "st,stm32h7-dfsdm-dai".
-
-  - #sound-dai-cells : Must be equal to 0
-
-  - io-channels : phandle to iio dfsdm instance node.
-
-Example of a sound card using audio DFSDM node.
-
-	sound_card {
-		compatible = "audio-graph-card";
-
-		dais = <&cpu_port>;
-	};
-
-	dfsdm: dfsdm@40017000 {
-		compatible = "st,stm32h7-dfsdm";
-		reg = <0x40017000 0x400>;
-		clocks = <&rcc DFSDM1_CK>;
-		clock-names = "dfsdm";
-		#interrupt-cells = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dfsdm_adc0: filter@0 {
-			compatible = "st,stm32-dfsdm-dmic";
-			reg = <0>;
-			interrupts = <110>;
-			dmas = <&dmamux1 101 0x400 0x00>;
-			dma-names = "rx";
-			st,adc-channels = <1>;
-			st,adc-channel-names = "dmic0";
-			st,adc-channel-types = "SPI_R";
-			st,adc-channel-clk-src = "CLKOUT";
-			st,filter-order = <5>;
-
-			dfsdm_dai0: dfsdm-dai {
-				compatible = "st,stm32h7-dfsdm-dai";
-				#sound-dai-cells = <0>;
-				io-channels = <&dfsdm_adc0 0>;
-				cpu_port: port {
-				dfsdm_endpoint: endpoint {
-					remote-endpoint = <&dmic0_endpoint>;
-				};
-			};
-		};
-	};
-
-	dmic0: dmic@0 {
-		compatible = "dmic-codec";
-		#sound-dai-cells = <0>;
-		port {
-			dmic0_endpoint: endpoint {
-				remote-endpoint = <&dfsdm_endpoint>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.yaml b/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.yaml
new file mode 100644
index 000000000000..d953ec524ba2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/st,stm32-adfsdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics Audio Digital Filter Sigma Delta modulators(DFSDM)
+
+maintainers:
+  - Olivier Moysan <olivier.moysan@st.com>
+
+description:
+  The DFSDM allows PDM microphones capture through the SPI interface.
+  The Audio interface is seen as a sub block of the DFSDM device.
+  For details on DFSDM bindings refer to ../iio/adc/st,stm32-dfsdm-adc.yaml
+
+properties:
+  compatible:
+    enum:
+      - st,stm32h7-dfsdm-dai
+
+  "#sound-dai-cells":
+    const: 0
+
+  io-channels:
+    description: phandle to iio dfsdm instance node
+    maxItems: 1
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - io-channels
+
+examples:
+  - |
+    asoc_pdm0: dfsdm-dai {
+      compatible = "st,stm32h7-dfsdm-dai";
+      #sound-dai-cells = <0>;
+      io-channels = <&dfsdm0 0>;
+    };
+
+...
-- 
2.17.1

