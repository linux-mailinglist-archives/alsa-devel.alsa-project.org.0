Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B7234185C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 10:32:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E49169D;
	Fri, 19 Mar 2021 10:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E49169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616146334;
	bh=ub650fCvx5qupGtQLA0XE5pgouP6CXwZFTdGpaFgFrk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTZyJG67DKNWgvE/o56vzCb1gZyVVbnWSIAl7HXpmUpwZkgmrmWrqMjojp91q3zr6
	 b/XbnUsHO1f4JgCnVjVeznsWqwE5Xw0MsoFjsB74SRLsYApU1b2ERHLLQwQWQZIvzp
	 ozQrQkAFuCOy4d5CL5xLaO8oNlEEvUhLt+S9oahs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80FC2F80124;
	Fri, 19 Mar 2021 10:30:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 334DCF800E0; Fri, 19 Mar 2021 10:30:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30A10F800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 10:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30A10F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="f+c8+9QO"
Received: by mail-wm1-x32a.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so4863113wmj.1
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kX11wjGhwRDOmfVtKMxRD8vF9bDHJtDwcM7zsW8G2As=;
 b=f+c8+9QOEQKy9I12fbejSVakqo8j7e49GcpQgH+DJKxlc2y0BRAJBCSPIQ+3mXSRBI
 HP55lFsgS3ZlwkJ6EXiBVLh95BZ+KNah8CYgDciBs2RWFfOyx3X4JNCTdvyPjNNgaar6
 bWuSpM22qAGlkfGEdcukg1Wj8PGaPguZeGMI5pO2oyaGTPFnGBBUy9o6kF6Jwo9Abo7V
 TtTwrfmxAEPsjJ6C73oSHoorfV+zVEcADkhfBvjIdsLs1+e8djEaMCABzrK1Wc1Ww21S
 MxKVAL28Aj43aIYcxFWrmvGgok1DHzzDVMOS7s82CWrsQSkeL2AKKbk7EZaOFND8K9qo
 HpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kX11wjGhwRDOmfVtKMxRD8vF9bDHJtDwcM7zsW8G2As=;
 b=MbWAS7Eqv8A4y3zIsR+msShqYN8nJnTeGReRHEj5Sk6qRi1nXfS+GrOxd0WIzKmKki
 nXYm6CWeQYaQZbT5SmL5XQdJO3rtIJBBeA5/7lhONbuQnF0+Euqs6NCH6Z0VrzFbCRFA
 C0MmYsSu+e895u/xOmtpf2MdRzQqh/LH2h3axa+Odl8n+ekjtHQQS8I+a9r1YhTuqMp7
 ia+Y92+B+7GougGCcdr6O2AqyUGxknByJ6qdIyutkVBHqEmbrUtGy5VQr1EhcdlZZs3j
 RQX3TbcYxmGeBahoUpY9oIBq3tBeHwJ2nhI9vvzHvIUYyw5mAH2u5ezBkSGq79HP2Heu
 I7jg==
X-Gm-Message-State: AOAM533ri7he/ZPCWGIGhu8iS4/JHtAYb97iHGxlIxqjkrJ1Vf3tk6jq
 FoMYY22/pliOXBQyy0xSAnItIw==
X-Google-Smtp-Source: ABdhPJxlOn/oy8XURhCu/Hw0PrkNF854lzvcbSpDwV/5sSRY6JFOjrqSCoc9fSiDkS5T+6QNk6I1uQ==
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr2799477wmg.87.1616146204843; 
 Fri, 19 Mar 2021 02:30:04 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id p6sm6779058wru.2.2021.03.19.02.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 02:30:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 1/7] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
Date: Fri, 19 Mar 2021 09:29:13 +0000
Message-Id: <20210319092919.21218-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire device RX and
TX respectively, supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs, MBHC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd938x.yaml          | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
new file mode 100644
index 000000000000..fe47e483d4b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd938x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WCD9380/WCD9385 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices.
+
+properties:
+  compatible:
+    const: sdw20217010d00
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  direction:
+    oneOf:
+      - const: rx
+      - const: tx
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-rxtx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  qcom,micbias1-microvolt:
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias4-microvolt:
+    description: micbias4 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,mbhc-hphl-switch:
+    description: Indicates that HPHL switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-ground-switch:
+    description: Indicates that Headset Ground switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-button0-vthreshold-microvolt:
+    description: Voltage threshold value headset button0
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button1-vthreshold-microvolt:
+    description: Voltage threshold value headset button1
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button2-vthreshold-microvolt:
+    description: Voltage threshold value headset button2
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button3-vthreshold-microvolt:
+    description: Voltage threshold value headset button3
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button4-vthreshold-microvolt:
+    description: Voltage threshold value headset button4
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button5-vthreshold-microvolt:
+    description: Voltage threshold value headset button5
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button6-vthreshold-microvolt:
+    description: Voltage threshold value headset button6
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button7-vthreshold-microvolt:
+    description: Voltage threshold value headset button7
+    minimum: 0
+    maximum: 500000
+
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 5
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - qcom,micbias4-microvolt
+  - qcom,port-mapping
+  - qcom,mbhc-hphl-switch
+  - qcom,mbhc-ground-switch
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+
+        codec@0,3 {
+            compatible = "sdw20217010d00";
+            reg  = <0 3>;
+            reset-gpios = <&tlmm 32 0>;
+            direction = "tx";
+            #sound-dai-cells = <1>;
+            qcom,micbias1-microvolt = <1800000>;
+            qcom,micbias2-microvolt = <1800000>;
+            qcom,micbias3-microvolt = <1800000>;
+            qcom,micbias4-microvolt = <1800000>;
+            qcom,mbhc-hphl-switch;
+            qcom,mbhc-ground-switch;
+            qcom,mbhc-button0-vthreshold-microvolt = <75000>;
+            qcom,mbhc-button1-vthreshold-microvolt = <150000>;
+            qcom,mbhc-button2-vthreshold-microvolt = <237000>;
+            qcom,mbhc-button3-vthreshold-microvolt = <500000>;
+            qcom,mbhc-button5-vthreshold-microvolt = <500000>;
+            qcom,mbhc-button6-vthreshold-microvolt = <500000>;
+            qcom,mbhc-button7-vthreshold-microvolt = <500000>;
+            qcom,port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
-- 
2.21.0

