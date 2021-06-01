Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188B397282
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 13:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05A216D6;
	Tue,  1 Jun 2021 13:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05A216D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622547429;
	bh=TZpzIl5TCYgYgq2TzpHK40lcw4m0mIy7jmnDzaRGcJE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UtpdbTGUJ9O83VL8vQ26LwT8JwqPj21g6iJsk276Ik5vLpo/t2DJzvBlAqYZvw7b5
	 +bCcPBp/iciI0lRxUuFRpdMWusQq9zl8P3Fp0j+TbrYr36ZwUPE3PSzZBD+Yt0hQUB
	 nU/L0VsxAoihgBJlIHOkqf6KCw851SreRJx2dnAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03FFF804D6;
	Tue,  1 Jun 2021 13:34:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED8E7F804D2; Tue,  1 Jun 2021 13:34:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A583AF80254
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 13:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A583AF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rlf6Krry"
Received: by mail-ed1-x52e.google.com with SMTP id o5so16909262edc.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgmJGXmS6RCspCVU9ceSBH9yezcF2/kLSegrw/MRv68=;
 b=rlf6KrryNjuWoFtwfTRdj7mc8GaC0XMcJLK9BFjt41Ahu+ewXHkB0kHEz0+M5qhPW3
 PieA2QDzIQPNNUGmz1mSWJEGg9pUnrHaMG5xWru0TiaYrS2g/2OIHYa/Bt55KwaAfTZM
 TzQ8CBaPzLr7JHxwU8w11ApDbF0+3PmFWZKgmxQKXRB8RK7kmd18FG6SWaX71gsa2fM+
 JFfKA/8ab1QxwyhF/UbrIPn1onrRbRA8I4P4BgHH+MGpL0f0G+huzp7FG8rS+mKS++jc
 FaT9bbsamvLW7FA2jSbCHQieE2mwV8PICaT8gxsYGSidezkAAyibOPevYx6QwBKyV93B
 Gbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgmJGXmS6RCspCVU9ceSBH9yezcF2/kLSegrw/MRv68=;
 b=rvm9L0vYmNwCVR3xC1K/iK3iWdvHEwT+mVCsKM1uF7AVARzpefXZzb4NlDfzw7LzKJ
 nEnld7yK8m5IxwUc1n/33bW75n4MpRw40nxkJFa+mRpkG2S/Q6YON3/isoBJsCSPO9I0
 ZHh9a58nezCvTmnm2TVERcI8ZcXXMLHhTgjyIkQfv2w0/bAO+r+ecq9nksbitjBsrT+M
 OPm6SEoEwdQrfvSn19CdWn8DR77DAAprRRxitjMWv9TCOl7SSqaJhiwxG+VcYzJ3S6Ut
 IE+RbCrR37XIrnp80ZtcJbfiuwYPGwA3kdMi49JTVegXvNU/WmvQIoUlw+vLZAWuOJdO
 GlQQ==
X-Gm-Message-State: AOAM532dTtBbyfWOSBZLjv3kc4MyhRJAlAJaBSBKOnv9jRRFcQvvBsTt
 lycfueaXnNzWmOQjXfZM/EFcBQ==
X-Google-Smtp-Source: ABdhPJwnKVMnDNrwENaMY4q2eTkpFgp8qJlQO+hU4fuTZg+wUkJcD6cAlKy8Rp3Sw9QSnv1pqtT53w==
X-Received: by 2002:aa7:d1d1:: with SMTP id g17mr4309925edp.86.1622547280063; 
 Tue, 01 Jun 2021 04:34:40 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f10sm4729487edx.60.2021.06.01.04.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 04:34:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v8 4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for
 wcd938x-sdw
Date: Tue,  1 Jun 2021 12:31:53 +0100
Message-Id: <20210601113158.16085-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
References: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
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

