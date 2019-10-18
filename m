Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A9BDBAC4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 02:22:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF11E1670;
	Fri, 18 Oct 2019 02:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF11E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571358155;
	bh=QoU9mAoyr0J78o1GV0lPcvYUJ3bzwvfU9VLdr39pxu8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q32uFHz7j+AAJshBWWr7YuACN9sSLJNiUexI/iFVK9FiBPq+FLJX4puW6OEc+pvTa
	 p1FIg2CFdEiOig/0AbG8O7tsBcxj4u9WccZJuHHzN3fkVCSU8kKFxyatvEVFzwvVkT
	 nC/I1gUb5rzGF0KrfM8rDcauy6ZolnkddIxcsrg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 623DAF805FF;
	Fri, 18 Oct 2019 02:20:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EF32F80322; Fri, 18 Oct 2019 02:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34296F80322
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 02:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34296F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oCiIsJX6"
Received: by mail-wm1-x32d.google.com with SMTP id y135so8124833wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4me+CazbBGjq6Vioao9/Gq1F8FYE0afxuUK4F7+V3U=;
 b=oCiIsJX6F+gH7PaC1dF1wSvdbr3nvuj/rpASrcfUBXDPa9TLVMRNynYfDh1s9gpLC+
 MaXA2dVh2of8i+tP8nNdU/uDgyq2kMPAJolA10VHH+a+6JvIzkzTQmK4wSjglc8Yhzq7
 pz2gDZ/udH1P7WEFFQyV9EPp0zeIe57FdALWZ2IjTqYFUzXkD3k+62elQAkQCUw8L21i
 QDJh//t0JwTcz4/+vgvq6iKNNu3hyYOQn+Lli+O6vbvIf0e61v5ZQRIjVhYWi5QFMxc7
 xtfEKSjK9w0VEDfWRcUILT0rBr4D3w1HJ+lIc2wM6l1EhTqhU+TPsEEcvWLoATzQ0nec
 H08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4me+CazbBGjq6Vioao9/Gq1F8FYE0afxuUK4F7+V3U=;
 b=anM7gZntYkDwPWOE45hQqx4rVKvJpPZbaii8JrRXsYEGYNHt4Gc/d2m5s/Rb2qwNdQ
 mluT/U5kMtZJb765Rl2cFUOIyM6EOtLXkbjRVUWGUWne+phAULRoBK6pFITT7xYVupwD
 8olOgOkxf4tpwS8TBb+4/+4LJP+Jkbh9GLR7vbWV0sq4RZwhbQ69mffZ5XRmOelLKUxh
 yc7cC46lw/nYCAai1dtZzUmQ9+/3apOX1xUnoSPF9+Zuy/4QwFQVnEukTSZAzRP5Up+R
 th3MR712B3QYnihAY3ojAXu3//uk08SeCKgCr+/ECSo/AjjV1dUQtstC1kiwt9TJlGMn
 s4bg==
X-Gm-Message-State: APjAAAXQGVSl6Nl1P9wtapR+pde1TASOJIp2bMTH6drWTRoyqb3aLjj8
 uMQi623GVLJIKWFVyku3KCsMOA==
X-Google-Smtp-Source: APXvYqzWAgCatyNQxkXKKY8raBcd52rYsoa3mCt4DEBAm0RxIzO4n1R2fxlWDSrxfZb7wX0q0Gcm8w==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr5178592wmc.130.1571357997300; 
 Thu, 17 Oct 2019 17:19:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z189sm4851248wmc.25.2019.10.17.17.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 17:19:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
 lee.jones@linaro.org
Date: Fri, 18 Oct 2019 01:18:39 +0100
Message-Id: <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings
	for WCD9340/WCD9341 audio codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds bindings for wcd9340/wcd9341 audio codec which can
support both SLIMbus and I2S/I2C interface.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd934x.yaml          | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
new file mode 100644
index 000000000000..299d6b96c339
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
+  It has in-built Soundwire controller, pin controller, interrupt mux and
+  supports both I2S/I2C and SLIMbus audio interfaces.
+
+properties:
+  compatible:
+    const: slim217,250
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  slim-ifc-dev:
+    description: SLIMBus Interface device phandle
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extclk
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-buck-sido-supply:
+    description: A reference to the 1.8V SIDO buck supply
+
+  vdd-rx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-tx-supply:
+    description: A reference to the 1.8V tx supply
+
+  vdd-vbat-supply:
+    description: A reference to the vbat supply
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-micbias-supply:
+    description: A reference to the micbias supply
+
+  qcom,micbias1-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias1 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,micbias2-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias2 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,micbias3-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias3 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,micbias4-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias4 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  clock-output-names:
+    const: mclk
+
+  clock-frequency:
+    description: Clock frequency of output clk in Hz
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  '#sound-dai-cells':
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description: |
+      WCD934x subnode for each slave devices. Bindings of each subnodes
+      depends on the specific driver providing the functionality and
+      documented in there respective bindings.
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - slim-ifc-dev
+  - interrupts
+  - interrupt-controller
+  - clock-frequency
+  - clock-output-names
+  - qcom,micbias1-millivolt
+  - qcom,micbias2-millivolt
+  - qcom,micbias3-millivolt
+  - qcom,micbias4-millivolt
+  - "#interrupt-cells"
+  - "#clock-cells"
+  - "#sound-dai-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    codec@1,0{
+        compatible = "slim217,250";
+        reg  = <1 0>;
+        reset-gpios = <&tlmm 64 0>;
+        slim-ifc-dev  = <&wcd9340_ifd>;
+        #sound-dai-cells = <1>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <54 4>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        #clock-cells = <0>;
+        clock-frequency = <9600000>;
+        clock-output-names = "mclk";
+        qcom,micbias1-millivolt = <1800>;
+        qcom,micbias2-millivolt = <1800>;
+        qcom,micbias3-millivolt = <1800>;
+        qcom,micbias4-millivolt = <1800>;
+        clock-names = "extclk";
+        clocks = <&rpmhcc 2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        wcdpinctrl@42 {
+            reg = <0x42 0x2>;
+        };
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
