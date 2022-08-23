Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590259E57A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 16:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6A0168B;
	Tue, 23 Aug 2022 16:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6A0168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266705;
	bh=6sGqZ8yTEfU6TxAkZS5M1LIGlAlIRXsyCT40+W08r4g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BBeoo/dHy7j8R+LRTblQsYn47NxR6nLob0gxP3Zqn5RXcAUTDjsH5PzxDPfEpxReF
	 P8DpgEvxHmDD1xvtL07TxRrov3jA8XsaP2Y6ZbvhDnESNTXy9uZTTlVqGUMpGm7Uic
	 CG1VbLX09rK/T2S0n9rAUdZNlsldRQU/1A8FwCkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D064F800C9;
	Tue, 23 Aug 2022 16:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB551F804E6; Tue, 23 Aug 2022 16:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D3C7F80152
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 16:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D3C7F80152
Received: by mail-oi1-f176.google.com with SMTP id r10so10511201oie.1
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4r2rM5zFdzy3SVrsctM/aWuwaXKJMdALGKTsDp1U4c8=;
 b=KEHaG+etEp6870cCafKYurI+uM/n32OqDhXLVD66j/2wWBQk+Csah6e6bsg8/K8DXo
 qtIyAbNL8HzIW9mhIlAtnGvCns1Q8YMW4J9f3Y7V7qr2Vur+Y47y5Pb/M7ibrrUVU1hm
 WSpYUSsLcK50Zedbcp8ArIJDrW9skNedJeLibNDlSu1eWm5Cil42sRxp8Zb9B2SISznt
 0677qPmQIkMkj5MYF8hBQcNUmSyuI7n03hgRv3ZUxx4yNwNjU6dTXeiMYcHK8xrUzHZ0
 o1/I6TfMu3zB33Ij5mJlANOfqjnC3EEyDmKt7RkZ3maYUp++QVFr32Hx9bdgZK836gw7
 YN7A==
X-Gm-Message-State: ACgBeo235Lu3dyskM+7swg8OsIOoIqmRuThsg2HTmwtd9wNramksp66K
 Lc/lqsZsOGiXEgGzdn5gJA==
X-Google-Smtp-Source: AA6agR7BtJBBpCuzs2r9wKhd1XIfbpIsOwteenGRy/P4DrIAqOrII0B1zbQE/nza8I0bOcLkiqnjVA==
X-Received: by 2002:a05:6808:13c8:b0:344:eed4:af2b with SMTP id
 d8-20020a05680813c800b00344eed4af2bmr1503637oiw.180.1661266627398; 
 Tue, 23 Aug 2022 07:57:07 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 07:57:06 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>
Subject: [PATCH] dt-bindings: iio: Add missing
 (unevaluated|additional)Properties on child nodes
Date: Tue, 23 Aug 2022 09:56:33 -0500
Message-Id: <20220823145649.3118479-2-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml | 1 +
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 2 ++
 Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml     | 1 +
 .../devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml          | 1 +
 Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml | 1 +
 Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml    | 1 +
 Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml    | 4 ++++
 Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml    | 1 +
 8 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
index 74a4a9d95798..8bac0c4120dd 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
@@ -58,6 +58,7 @@ required:
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
+    additionalProperties: false
     description: |
       Represents the external channels which are connected to the ADC.
       For compatible property "qcom,spmi-vadc" following channels, also known as
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 92f9472a77ae..1970503389aa 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -72,6 +72,7 @@ additionalProperties: false
 patternProperties:
   "^filter@[0-9]+$":
     type: object
+    unevaluatedProperties: false
     description: child node
 
     properties:
@@ -225,6 +226,7 @@ patternProperties:
           patternProperties:
             "^dfsdm-dai+$":
               type: object
+              additionalProperties: false
               description: child node
 
               properties:
diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
index a3b79438a13a..2c3c2cf2145c 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
@@ -43,6 +43,7 @@ additionalProperties: false
 patternProperties:
   "^channel@[0-7]+$":
     type: object
+    additionalProperties: false
     description:
       Child nodes needed for each channel that the platform uses.
 
diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
index 3698b4b0900f..be93c109d6ac 100644
--- a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
@@ -134,6 +134,7 @@ properties:
 
   ams-pl@400:
     type: object
+    additionalProperties: false
     description:
       PL-SYSMON is capable of monitoring off chip voltage and temperature.
       PL-SYSMON block has DRP, JTAG and I2C interface to enable monitoring
diff --git a/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml b/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml
index baa65a521bad..03bb90a7f4f8 100644
--- a/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml
+++ b/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml
@@ -63,6 +63,7 @@ additionalProperties: false
 patternProperties:
   "^channel@[0-3]$":
     type: object
+    additionalProperties: false
     description: Represents the external channels which are connected to the device.
 
     properties:
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
index 9c48c76993fe..fee0f023a8c8 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
@@ -78,6 +78,7 @@ patternProperties:
 
       custom-output-range-config:
         type: object
+        additionalProperties: false
         description: Configuration of custom range when
           adi,output-range-microvolt is not present.
           The formulas for calculation the output voltages are
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
index 24ac40180ac1..c2d9ae3039b2 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
@@ -62,6 +62,7 @@ properties:
       connected to the DAC. Channel 0 can act both as a current
       source and sink.
     type: object
+    additionalProperties: false
 
     properties:
       reg:
@@ -85,6 +86,7 @@ properties:
     description: Represents an external channel which are
       connected to the DAC.
     type: object
+    additionalProperties: false
 
     properties:
       reg:
@@ -101,6 +103,7 @@ properties:
     description: Represents an external channel which are
       connected to the DAC.
     type: object
+    additionalProperties: false
 
     properties:
       reg:
@@ -116,6 +119,7 @@ properties:
 patternProperties:
   "^channel@([3-5])$":
     type: object
+    additionalProperties: false
     description: Represents the external channels which are connected to the DAC.
     properties:
       reg:
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml
index 48f9e7d29423..15cc6bf59b13 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml
@@ -48,6 +48,7 @@ properties:
 patternProperties:
   "^channel@([0-9]|1[0-5])$":
     type: object
+    additionalProperties: false
 
     properties:
       reg:
-- 
2.34.1

