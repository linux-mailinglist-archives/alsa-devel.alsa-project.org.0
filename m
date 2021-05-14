Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802C38076D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 12:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7FB017A0;
	Fri, 14 May 2021 12:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7FB017A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620988613;
	bh=8OVSZ9+HYuBdjFg2psovZtRw+l+wLDvHVPpsmlyOpbs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BxiyObsz+VTSYMjeO5Xqe+lwrOkxqEO5HXgiUrnu8a5XEKjFmFdM3ASCGH3LbiVm3
	 R4Tn/8VO5SnTB0TUQeufLQ6qeKqW+KRFbmkJ1Qsa/VpD2o5j+tFroBRFaxjQAqPO8R
	 msQm61P3eUb+/ZwRKHsmVxKvMR5SSu3Ff5uhK2X0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA238F8049C;
	Fri, 14 May 2021 12:34:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85D3EF80482; Fri, 14 May 2021 12:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B5A5F8027B
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 12:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B5A5F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="p7rfnDdF"
Received: by mail-wm1-x32c.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so1216111wmh.4
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 03:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wD5Koc4+Y8WGCkqYQ0J6ZM9ix1nXZLNkx7wv0f/ctNc=;
 b=p7rfnDdFplz7oQZhmZvU5pGbbefgRQBfPVgMgKRSsnp1eDEr2TQOerze2J4ouFU1PX
 NRTaowGsZqal4+mdn1QBNcAtDzPwcTnqJ1PaSQZ/2wxHZZUTEJQ4gTMitFDYaKNGjozV
 sNSjDCempf3Oxchd7Ge6rNu5tPR3M5ejVQ1SdqSpRhcdwtKmAdTt0+vJWeHh4QOic7GE
 8GyBoWcB/DWQlslLoctND0ecn9I9Y6NJMVqElsx2Dh+NICea01d+w5wS6oou+HUbUH4z
 NgBFQ8iZMxiNq0TKDb1rCrq8n8ocEB4E0RCoH4dIzm2UmBLkOGYC40E8srGUcSuCM+nh
 BBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wD5Koc4+Y8WGCkqYQ0J6ZM9ix1nXZLNkx7wv0f/ctNc=;
 b=f3VxX3u5I6nF2I9G0ANrDFUEfPMWRbR/C/3r4Kgb7XmtGX7XPnp8e/O4/KFpwUMP0r
 4FcZymo4rTOYGF4gMkeaRnxahTY7i1VTq5NMlNlgOVf7lIVympXNyfkfxo7V+FBvT8Bi
 9GjWaTe3Jfs//JHi/IU8IB53tjG8SSbsJk09FzBIw9GVnPpZvTLsZLXpGkk0uCJzoP7I
 EvF2PSsgxc8Cvw+YqYVtud6TvzzJAJS+6mXfks/QUjKGti7rVgGeVqQRp9BxpctjDZuB
 +WYSAptOzvLiOyyNyqCUWq4tOPwtUoAbSndxuMWt66RPukow5/VpF1HsyEom+Zu35kd7
 4yeA==
X-Gm-Message-State: AOAM532x83M4nvVf6lrNvtFKz/ANag9kT7rfKeRXpqw30Tj5ML3Yv3jH
 ID2KX6Hn2zFYGkvcTfZsUsOLdQ==
X-Google-Smtp-Source: ABdhPJydrg8yHoYnTefCkO3f9aDWw6ujj2A14QG5kCaRd5qk8mo49wNEOeTFpEGq8EFjJ/pqzC/0rg==
X-Received: by 2002:a1c:2685:: with SMTP id m127mr8850674wmm.135.1620988473696; 
 Fri, 14 May 2021 03:34:33 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id k16sm5015498wmi.44.2021.05.14.03.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 03:34:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for
 wcd938x-sdw
Date: Fri, 14 May 2021 11:34:00 +0100
Message-Id: <20210514103405.29927-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210514103405.29927-1-srinivas.kandagatla@linaro.org>
References: <20210514103405.29927-1-srinivas.kandagatla@linaro.org>
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

