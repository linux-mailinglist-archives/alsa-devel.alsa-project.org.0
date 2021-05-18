Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCCB387B6D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 16:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27F8171A;
	Tue, 18 May 2021 16:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27F8171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621348843;
	bh=TZpzIl5TCYgYgq2TzpHK40lcw4m0mIy7jmnDzaRGcJE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kcs6YPjZDxlrF0bLEeOjXWw3sQZxn/S0ujvPApC8IYxUXfkzT0pYPwYBDvTkjuSZH
	 WimSnhXpPFP5RykljIRuRbO8eUvxSEyJUE8K1YftjPKVmdaptU2mX4dIeVhMR3dYE/
	 +0GcpTSaZ3lxdtBR3FfDuFpL6yt1Na2v33zoZWq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1189F804AE;
	Tue, 18 May 2021 16:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C246CF804AA; Tue, 18 May 2021 16:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 639D4F802C8
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 16:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 639D4F802C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G4VUZsx2"
Received: by mail-wr1-x42c.google.com with SMTP id d11so10495087wrw.8
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 07:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgmJGXmS6RCspCVU9ceSBH9yezcF2/kLSegrw/MRv68=;
 b=G4VUZsx2f5aesTTAUc0HKjw22l1mpxmMaYDtriJQtoi+Ul6qa23OIAriyuNbIABPPp
 8kJwTfOYFztNguzI60C8xzFQYPaPV9ppJXfy0HMba/cfsW0GPj4YAXFmuYOK2lergmMl
 QCHVKxi84469uul5Wl9t29ZE8LjefDAVlzYN2j447Jzc2gwaRZT918TxlIxelKng8zTR
 VkHo7e//MlgbhnhXCY+r0Np0CbaToU9FwL+l/YrnVnCVjS+1yK6aslA2JvqF3xv5eYDA
 d6I2DJmX2hslwWbEAXaUBEmpby7yNf22PfrBmcmijPfUVoTkcCovv/YKI/Z+0LVVN7Tg
 AuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgmJGXmS6RCspCVU9ceSBH9yezcF2/kLSegrw/MRv68=;
 b=rL1U6dw6IBCETuRDDCRrnPtomNBEftZxmhcxEb5ndWWkhzRTllBVtLFMF46ebb0FPs
 PRT/eDEMZ6jiaMYXAaeO9pw0ox+1iA03Vc1/IQXo/DN5ixw3uguxRzSMI0nX5L/p7eLs
 KQJYxhw0QJk9K3RkMohi5PsV6i9C73T7eIjP2OpI0HeiVX6GmvgFmY7WhJF0EOD42j3l
 cCoLQepkGC38luCjSv7+hSC0NuDVYFQZxqjHsbwv5yl07pLklHNioT/787pUIQEyMtAR
 Wl7heUAysdpD5dfk7cSdnVOqWpNOtRL1ABjhmc5wMP/5zGzbCr3CcfoOJfOXMBbt0vzL
 iNsA==
X-Gm-Message-State: AOAM532Kfzo0AUPRNIH50dpq+yhGU8AzOmPzyRU6jsCspSuoJnzADfbb
 yS5Ahs1mQrHjwcvIam6cvMeByg==
X-Google-Smtp-Source: ABdhPJwBK0Vgow3GRYUnf7g37TwzoMyUtYdpdHJPnwJPiNVshiVLmMQ69rwp40pVux6yA/FPuu0IqQ==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr7875105wrn.198.1621348689424; 
 Tue, 18 May 2021 07:38:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m6sm21329087wrp.29.2021.05.18.07.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:38:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v6 4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for
 wcd938x-sdw
Date: Tue, 18 May 2021 15:37:54 +0100
Message-Id: <20210518143759.16837-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210518143759.16837-1-srinivas.kandagatla@linaro.org>
References: <20210518143759.16837-1-srinivas.kandagatla@linaro.org>
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
connected over SoundWire. This device has two SoundWire devices RX and
TX respectively. This bindings is for those slave devices on WCD9380/WCD9385.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,wcd938x-sdw.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
new file mode 100644
index 000000000000..49a267b306f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd938x-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm SoundWire Slave devices on WCD9380/WCD9385
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices. This bindings is for the
+  slave devices.
+
+properties:
+  compatible:
+    const: sdw20217010d00
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between slave and master tx ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between slave and master rx ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@3210000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03210000 0x2000>;
+        wcd938x_rx: codec@0,4 {
+            compatible = "sdw20217010d00";
+            reg  = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd938x_tx: codec@0,3 {
+            compatible = "sdw20217010d00";
+            reg  = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
-- 
2.21.0

