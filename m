Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F4DD0A51
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 10:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ABC11657;
	Wed,  9 Oct 2019 10:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ABC11657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570611273;
	bh=aN+YMs348YMVHoGePgUCSWuUdQYwdcdKdcNs1YHLhPU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bd5AjR/ULA9yTT/FLdeTuWmGhA3PuURwOc5gyzYMmr0jFoEknlgcEGQZODg3sQiZ2
	 WjcEa01rB/ljtGKM+/DosI1W7JBNVTVONY2teong7ct6qD8PVbSPadLLrWkgfJuiYJ
	 9DD4xcArhiapqynvOxkNqjVueutLkGSf3Lr/kc0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02ED0F805A8;
	Wed,  9 Oct 2019 10:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21526F800AE; Wed,  9 Oct 2019 10:52:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AF6DF800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 10:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF6DF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vVm0pPMk"
Received: by mail-wm1-x32c.google.com with SMTP id y135so4251828wmc.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RzjK5Ht69tgaUqi7M8XuzUgX+3LalFIhFT3YvqgXYI=;
 b=vVm0pPMkQYy/h5VYDpnrGaE9yQfO5VH/YkKrb5BIS8ENJCQnTTgeO4ll019fenRPkc
 lkKutuyod/dNvtejtkIcwnxvzF8q7QNJd7QpZb/l9cxe3mJtymzycCCKHqGPHxlhfn6V
 /acQLp0pPgPOq2AZ7905BLPctteb8uSTVrHcshHjphSsAx/MiU2L2wxLXDoL8WjNS1Q2
 05lce6NsUMpXS6LaaoRKA9Bq17MwPuXOROCkOlVqTO4sju/9Q0g+hwQ7+07IRHmmDLec
 JA2I/G25CUIt857fxL33xiwd4QE/ulsRt/agB77cOFpp3hHH5P4pQ6QvuV+i3oL8avWv
 FkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RzjK5Ht69tgaUqi7M8XuzUgX+3LalFIhFT3YvqgXYI=;
 b=QGRP4Lxvc9N341Evh7/3kNqSqs/dYaJA/UZE5cwT+dGcaC/ZNeAEYduxMRTRp1/sF7
 8mzgR4/fna3QhN0m9eFq4F5f7OHplfcNSV11F86KBpUdK/Z1pLUQlmaCeqB+x0sDSA/B
 1sBoSxiksWM4leRgRzlse4/eH/V8XEIBFojhOFvls8ABloO5cW/wJ30F2lE+F2XZh9ul
 JB+V8e4YpBU20cAcSIUo6UsWCXPU6mHXL7SejbV2U/txcK0Ol6MyZWqMZaZtYu0N0nXW
 GSPWjRM1yOAuaCcppRJ2TtBu6arUrT26v1724tsggkNKj+iYuHBaYYy/RoYKGKhGrfRE
 f8Rg==
X-Gm-Message-State: APjAAAWPQfRKGS9mmydxWdoVWtpS51wOO1LIxIBPiBNwmCzsUMdUaD2D
 WQu8mb8xaopnygKcS9n430+I1A==
X-Google-Smtp-Source: APXvYqwWsN+PW6LcmLg6/1IPcJS1sIpL1XjH2WZIlo5h77kq6x0RCdyaTNOd1We6G30Z5Os4jb3uWg==
X-Received: by 2002:a1c:f714:: with SMTP id v20mr1764594wmh.55.1570611118575; 
 Wed, 09 Oct 2019 01:51:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id b144sm2476291wmb.3.2019.10.09.01.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 01:51:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  9 Oct 2019 09:51:07 +0100
Message-Id: <20191009085108.4950-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v7 1/2] dt-bindings: ASoC: Add WSA881x bindings
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

This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
Amplifier. This Amplifier also has a simple thermal sensor for
over temperature and speaker protection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,wsa881x.yaml          | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
new file mode 100644
index 000000000000..faa90966a33a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  WSA8810 is a class-D smart speaker amplifier and WSA8815
+  is a high-output power class-D smart speaker amplifier.
+  Their primary operating mode uses a SoundWire digital audio
+  interface. This binding is for SoundWire interface.
+
+properties:
+  compatible:
+    const: sdw10217201000
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO spec for Powerdown/Shutdown line to use
+    maxItems: 1
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - powerdown-gpios
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@c2d0000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x0c2d0000 0x2000>;
+
+        speaker@0,1 {
+            compatible = "sdw10217201000";
+            reg = <0 1>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+        };
+
+        speaker@0,2 {
+            compatible = "sdw10217201000";
+            reg = <0 2>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
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
