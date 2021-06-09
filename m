Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 960003A0F6A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 11:12:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA8916E9;
	Wed,  9 Jun 2021 11:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA8916E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623229944;
	bh=TZpzIl5TCYgYgq2TzpHK40lcw4m0mIy7jmnDzaRGcJE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qKLRS7a6WqoZA7RTDrGXc3MGphepNwn9yHJIg8m8kbwIHO4saEqFJp4axSwVlCbzS
	 Q0kJk72nOHkgTQpZZgatIX3cW2omvtkWQ/ZEXF6tV15q1fXHetD/nFOrekv9tnNgDY
	 E5oCAsK/3NA1mmOnxVI7z8+E3nsrRkI/7Dglci9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49BD7F804CF;
	Wed,  9 Jun 2021 11:10:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E64A3F804C1; Wed,  9 Jun 2021 11:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D657CF800F4
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 11:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D657CF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zJKzEkIN"
Received: by mail-wm1-x32a.google.com with SMTP id f17so3548628wmf.2
 for <alsa-devel@alsa-project.org>; Wed, 09 Jun 2021 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgmJGXmS6RCspCVU9ceSBH9yezcF2/kLSegrw/MRv68=;
 b=zJKzEkINFVhTGIUS4kvq63QgUNmb7dwAHM4RxIWLdNr89TLi7MlVi/PsQnkHWAi2iN
 D+/3MnhgYQAE5IKjvPD9qKpbMBGHGKMoG0kDQnU7/mcF9NNVCNA6phEC+nm5vCiqkchb
 VLYV6eQU/N9z8c5a+9M7oQCzWifyJyhI3eCqljbgVzYzUw1kT+WZttHvo/68FUObZcAt
 nJetzZWhgWBgwdNcaw7EdkUE/Nn1B9mqJSxFOAuD7qDKy9DL4T7VzOC4RjFQfg7pwuGN
 YVxUGfnaCCocs5rH3ENlYq09AuTrzY3t0VlCPvnckCz4Niq9yUXd9v+Osqi44Ht0oYzs
 JD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgmJGXmS6RCspCVU9ceSBH9yezcF2/kLSegrw/MRv68=;
 b=IXs7lTRjI4k4Mpq+9U4IcPViKI+ehv3PwfqC6VCVJASOJQchFAgbcfzifCbTBE7vxt
 ZO7cAPsm3iTXGlf+eKKHyFi1Js3MganLLfpUBbMTIGbS1OnyEPR7d7g4Mu01VaAA42Y5
 HLDvEutALK7HDyBbl1DYKS9SwdC/N/n1mVGKc+csYEl2yWHW9WaxKL6Ifj2K0H2NdQjZ
 Kn2Vuv9ntDceJ/R/fnibCkSdm3i6LYq8+IBj7iRdycZIQsDYZbTPZGvBq0sCKt8cS+cq
 QlpMWmFrePX4DwhPNSMexeWB0ZEu/Skp6+WVQPiwrsWAoea49b9C5omjHvOO3N6UdSi7
 SWXA==
X-Gm-Message-State: AOAM530Q8rLOeT4unLfmyRlVQJHbUA5dyW/fssRnUwJT79mJUNTc2RvX
 A3CkkFTrDnek2XiXp6sxGqUTkg==
X-Google-Smtp-Source: ABdhPJz1AiXkIVoLEr7RGwcbRdPADxa1JH+h3T2dtqh/OxpslVTb6IVPwdwgb6LW31S+gph/mhLDWA==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr26629127wms.150.1623229803768; 
 Wed, 09 Jun 2021 02:10:03 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v18sm25165385wrb.10.2021.06.09.02.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:10:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v9 4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for
 wcd938x-sdw
Date: Wed,  9 Jun 2021 10:09:38 +0100
Message-Id: <20210609090943.7896-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210609090943.7896-1-srinivas.kandagatla@linaro.org>
References: <20210609090943.7896-1-srinivas.kandagatla@linaro.org>
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

