Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371935F82A
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 17:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF53167D;
	Wed, 14 Apr 2021 17:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF53167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618415474;
	bh=qJNcjS1UKoQYxkYBRpVxqqPXkv3+B6i2njufYFbofk0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+5NeQqX+ZVmIFzIvG1GnBIlnqEipnUwXFzfc2Q+d/C5+0N7/Wb0DAnPZbN6nqNYW
	 8uEZk5ASvwNryUy1WaxoHvaAghm6m38MnEFQMuvRGSNJpyaUTOhv5+wjfv4mh9pUaD
	 nwXstxB6PsAdWikECHa3A/SVFDB/b88MScct9cN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D79DEF80425;
	Wed, 14 Apr 2021 17:49:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 335A2F8032D; Wed, 14 Apr 2021 17:49:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA77F8025B
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 17:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA77F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Il2kAK6D"
Received: by mail-ej1-x62e.google.com with SMTP id v6so30859466ejo.6
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqR7BlF4HSnnBDnstX8+p5EmjKpi9oGoXkglRwnfXtQ=;
 b=Il2kAK6DaEhXk+Qu28VBaiON0vWv1u/STSJGWLYoCZQo86bwM/AkbYBHlq3XXu/uYy
 AX5uN7c/OBVfvb+tei4O5wbQkaZ77VhCfd8qHxqzA4lHJx5KFVouATL5e8vI850X23or
 +Tdt9nLraopIL8QvLgifNX9y7GxjD0fuJsJtcUUcBZBWAeCFqXL5cBn0rGBNYiBRPBuI
 e1y7zSEiPSgPSp5T718r35LzOPabgcrf4Uhq3omH8KpVpUUxjZ/TSBd4Xwh2u5x1URlG
 HNy5u2bt65Q9kBNw950LI1detP/eJl55k76NZgkNg4fCN4o2IUesYji3AYJgtF/r0nHi
 THoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aqR7BlF4HSnnBDnstX8+p5EmjKpi9oGoXkglRwnfXtQ=;
 b=OE8C4GXaX44a2v2KiscB9hxs/FqUOI5cZmZc4z/aqw34S3CbnBkfawJxDR3L9YPoH9
 QZjVLS729i6Ht5SJIMSlivluEy3BV8k3wWKfCNvL4Jrm/mAUb069KK1eVBOAXVqS9bqT
 POI2HmG3L2eJNBokamZkBeHfFmQMzvkd7g3CZvT7yl0/PTjj8fofviJa0XRTWrNmQ7Bf
 eoF4FTtGYwVU8lwCTavCmf6dZUdPO3Sb2WRYTDvZNkgbzr6iVlz13Cmeq/8e7mUEBmgx
 YVjU+HjY1e4yGzPGFFoyPuhx3xqhjzWXvMRoJHcSWmqc9bA+KE9Gpile38f3ZtLZoZTT
 kaqQ==
X-Gm-Message-State: AOAM530yoPkLCrSDlRTsN2EI1J6cHRKq/0hrclC5SKOq4U917562Sk84
 4oaqKKmAl+p593xiKugBq/HjZA==
X-Google-Smtp-Source: ABdhPJzWZ53gfi0xzVnwwXXBQEC/fU5WKuwlHPkPefaXJjw9xj0tfy9UvIFAmGFbr1grNOvT9H7zoA==
X-Received: by 2002:a17:906:d8c:: with SMTP id
 m12mr15958347eji.347.1618415364624; 
 Wed, 14 Apr 2021 08:49:24 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q12sm10495540ejy.91.2021.04.14.08.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 08:49:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 1/9] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
Date: Wed, 14 Apr 2021 16:48:37 +0100
Message-Id: <20210414154845.21964-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
References: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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
 .../bindings/sound/qcom,wcd938x.yaml          | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
new file mode 100644
index 000000000000..4c8fa8290af0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -0,0 +1,176 @@
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
+    enum:
+      - qcom,wcd9380-codec
+      - qcom,wcd9385-codec
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
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
+  qcom,tx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description: A reference to Soundwire tx device phandle
+
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description: A reference to Soundwire rx device phandle
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
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reset-gpios
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - qcom,micbias4-microvolt
+  - qcom,mbhc-hphl-switch
+  - qcom,mbhc-ground-switch
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        compatible = "qcom,wcd9380-codec";
+        reset-gpios = <&tlmm 32 0>;
+        #sound-dai-cells = <1>;
+        qcom,tx-device = <&wcd938x_tx>;
+        qcom,rx-device = <&wcd938x_rx>;
+        qcom,micbias1-microvolt = <1800000>;
+        qcom,micbias2-microvolt = <1800000>;
+        qcom,micbias3-microvolt = <1800000>;
+        qcom,micbias4-microvolt = <1800000>;
+        qcom,mbhc-hphl-switch;
+        qcom,mbhc-ground-switch;
+        qcom,mbhc-button0-vthreshold-microvolt = <75000>;
+        qcom,mbhc-button1-vthreshold-microvolt = <150000>;
+        qcom,mbhc-button2-vthreshold-microvolt = <237000>;
+        qcom,mbhc-button3-vthreshold-microvolt = <500000>;
+        qcom,mbhc-button5-vthreshold-microvolt = <500000>;
+        qcom,mbhc-button6-vthreshold-microvolt = <500000>;
+        qcom,mbhc-button7-vthreshold-microvolt = <500000>;
+    };
+
+    /* ... */
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd938x_tx: codec@0,3 {
+            compatible = "sdw20217010d00";
+            reg  = <0 3>;
+            qcom,direction = "tx";
+            qcom,port-mapping = <2 3 4 5>;
+        };
+
+        wcd938x_rx: codec@0,4 {
+            compatible = "sdw20217010d00";
+            reg  = <0 4>;
+            qcom,direction = "rx";
+            qcom,port-mapping = <1 2 3 4 5>;
+        };
+
+    };
+
+...
-- 
2.21.0

