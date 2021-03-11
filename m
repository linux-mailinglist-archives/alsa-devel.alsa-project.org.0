Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE1337AFB
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 18:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82041172A;
	Thu, 11 Mar 2021 18:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82041172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615484212;
	bh=jpmHmT2szYBfQSwiM8GbmMJXNHmA4fCb4hwoQgDWcUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tnDdY/WW+OUSTMUNS8v9ZBNhgebxXfRx9cXSKliB2nRAAOwseDlApMhgvs2ayP5mV
	 D5gMInlV2KtVJXOeD2h/cKXXu+yY/xApqMjVSJ5KsQvppMbhlxE6uotbJOWFpzzaeY
	 XVRU/Vnook6NK2lK6wlSQcmeepk1xVExB9+dn+y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A7AEF802E7;
	Thu, 11 Mar 2021 18:35:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FAA0F80276; Thu, 11 Mar 2021 18:35:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E27D0F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 18:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E27D0F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rga90TJQ"
Received: by mail-wr1-x42f.google.com with SMTP id w11so2951975wrr.10
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 09:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0j7/mJ9hsNyjCz2UBWw3RsdNjgdghs6t6j2jgPrVNrk=;
 b=rga90TJQbvQrd3kwdDuvr+LQ7z/gzSpin1AY+VA1GT+L1ZqklkHgPTy4pJK5eEXVhi
 AmLINd6V2mM8ZaZ6hLOf+DL/VPF1M++87p+S/SrIF6cpz0dAlnhbN/pnjRWY3qI952iU
 0ABAq3eVC3UYrvFuF0acbZQ8KGX4b1Tix/UN+/PmWgpMCAvPgaTRenSlL5diXEyQpqdJ
 lXuKNEswB5aktZEyPz/1vTX4CzQSQnInjzm8ZjDosLsIKbE0TdqBCY7qvDQ4XvV/Uh6K
 bgTxG55DvvjUViEGvMKy86UqMw2nHAsv+VaLTOYeJJG+Q6LvfJpnRHTE1SHHo8fqTeOD
 TpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0j7/mJ9hsNyjCz2UBWw3RsdNjgdghs6t6j2jgPrVNrk=;
 b=Vnd1a8F8CstV8hZE1voZRNfTPKE5R5dHgpSyCAHNA3iQXRNkmOr9iAK8xXneHtRFqB
 T8heJyr4DohNCmCT1fXmMiYvT8x8rbT9PSMeUm01BuN6LlLp9jKp3wMs6Hy5bBCG6ZQ9
 H45HvawdCWMraeJVErcFpQ/9TUqWD+Drc+z6ZY3/orPegWF67FwuO8krGPS7AWQTzhP2
 fgWQ2GsPojpWyesYNL+i+YAoOucqkdzTo9X1M+AHWayyDhaFk4afwlN/KOQe5zNRuPN8
 1G39JChu5XBGt2ey6+0gfL3w1t/OPLSye3OGDmjxDW9dBl5SuUu5c94aGPpZ+mnE6OEq
 w3dg==
X-Gm-Message-State: AOAM533+ERf637SeQE1stq8lpceUam8noZ2eYhjyzHiWiQ6Geu/uzXEq
 Vu/CZ2f38LO6Qc+hN7Uy3LmeSQ==
X-Google-Smtp-Source: ABdhPJxEUFo6cMD0/ZpJBZmxQy4BlsY81g5xJ2+fwPZDElx+nFy+7zBVOW0yKqaFbs682soKa6bW4g==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr10144419wrq.41.1615484100414; 
 Thu, 11 Mar 2021 09:35:00 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 36sm5221152wrh.94.2021.03.11.09.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:34:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/7] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
Date: Thu, 11 Mar 2021 17:34:10 +0000
Message-Id: <20210311173416.25219-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
References: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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
 .../bindings/sound/qcom,wcd938x.yaml          | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
new file mode 100644
index 000000000000..81c8957145d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -0,0 +1,127 @@
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
+    description: Indicates that HPHL switch type is normally closed!
+    type: boolean
+
+  qcom,mbhc-ground-switch:
+    description: Indicates that Headset Gound switch type is normally closed!
+    type: boolean
+
+  qcom,mbhc-vthreshold:
+    description: |
+      Voltage threshold values for all the headset buttons
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
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
+  - qcom,mbhc-vthreshold
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
+            qcom,mbhc-vthreshold = <75 150 237 500 500 500 500 500>;
+            qcom,port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
-- 
2.21.0

