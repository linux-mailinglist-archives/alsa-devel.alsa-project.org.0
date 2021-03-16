Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1BB33D24F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 12:00:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5048F1849;
	Tue, 16 Mar 2021 11:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5048F1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615892438;
	bh=tmmKeSP6EBQPB4Ss890+X9lNNo3s3rjh8mZr1ZV0G0A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VEhT+Thsn/f5OyCXTo6xjZqwfkdWiLhDp7z8vlFLS21WlCoH1a70S6sSpvXKXczFc
	 YA7iOXZacK1XCDYM7tOieAicfXB7YSA/hu2pRHinvKv6LVXV0EAHp3vk/1fXFndyI9
	 eLzOjfN8SnoL3pW+PxMa7OJF1/hzPorGyvRJaThE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCFDF8032B;
	Tue, 16 Mar 2021 11:59:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D11DFF8032B; Tue, 16 Mar 2021 11:58:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3914F80156
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 11:58:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3914F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UGw32nzB"
Received: by mail-wm1-x329.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso1154253wma.4
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+sltUJ/pAd1guAQgZ+UXiq+728PKHR6WItd2Z4NbS+4=;
 b=UGw32nzBcODaPuUg7y5aJN3FBwb3hNt1PwkF5jVc8W4w0yiGr7mSZBEUqkfC0W0iEp
 2jkoQn+zH0DY3A229qVGmVrGOQCQwg+/QfcqKbYHoke73TaGHGHHAFNqKPzkVBncpdpO
 0WBAHHXvXGK7rdWPQen3gKplRb57homN0LQo0xe2tG82lLM1HT9YLf7SnwB6u0fcOJQD
 zsB150AGa6W6jgA9ADDvEw5+dhdBeFxfyFNzwlkqdLD1gbByV/k76Kivi6om5zG17ft6
 7CuevOmAAt4w/5+n1mAt6Mly3QKKcBuHs3nQx71sDuCunNHPQ4OnMhAFxrU8bTq/on4x
 8qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+sltUJ/pAd1guAQgZ+UXiq+728PKHR6WItd2Z4NbS+4=;
 b=RSYCorFTqkFYrm0q8LKIBU95slw0ojx9Ofd7Wg5v6rN6TmjBLTuqMsbkdgUjQc9trU
 q2I8xf9yx8BoeMtLCU5AQq0SnoJ+csbL2r7WZsF5tp6CHruJQufuLsJochrTZEgFJ/rR
 5ihU4L9iUY2ofSWG/WNYatQv1C1ODeVlyPamciG+jo3sCkIG4MbCgVAKdjV148WWF6o4
 vD2+2osFV7s03HKxlTVZM2OCgcsVC+GDuxwXYMPiJt6/2i5ZvHBctQh3pc4EdgEVN9BM
 pL+r3KHY6ak0GCGt3tuyRO6scsjCbZjoy1H9rdLouBO+vEXRzKgGgzvH+RHB5BzcoutN
 D0LQ==
X-Gm-Message-State: AOAM5307LYb/7u8KHLf5nuqI4w+9fApttCKKcPan11sCYoG9QspsHmkM
 x1vjsII8Zi6STpegTweqElvuaw==
X-Google-Smtp-Source: ABdhPJxIp5XJQOPw2zm1i9K8rroLTuc5H07/VFk3+U1PEWXxQzVYYemM7yy+CSgpXQcDsVNqLSEdtw==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr4140062wmq.123.1615892317564; 
 Tue, 16 Mar 2021 03:58:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t8sm21465956wrr.10.2021.03.16.03.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:58:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/7] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
Date: Tue, 16 Mar 2021 10:58:22 +0000
Message-Id: <20210316105828.16436-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210316105828.16436-1-srinivas.kandagatla@linaro.org>
References: <20210316105828.16436-1-srinivas.kandagatla@linaro.org>
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
 .../bindings/sound/qcom,wcd938x.yaml          | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
new file mode 100644
index 000000000000..bac93e2344c7
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
+    description: Indicates that HPHL switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-ground-switch:
+    description: Indicates that Headset Gound switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-vthreshold-microvolt:
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
+  - qcom,mbhc-vthreshold-microvolt
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
+            qcom,mbhc-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+            qcom,port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
-- 
2.21.0

