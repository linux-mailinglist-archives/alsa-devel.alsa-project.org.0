Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20255D4437
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 17:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167EB1665;
	Fri, 11 Oct 2019 17:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167EB1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570807785;
	bh=aN+YMs348YMVHoGePgUCSWuUdQYwdcdKdcNs1YHLhPU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/yes5f0iBX/dlMgvTIUR6ptdl/+jsybE6IthdJYePd1EvzzWpHK8rRkHZXavKX4L
	 j17kQkuq53GbokFtfDYwK+vqGiPZeBezbVJNBo+0ypGMVCBASJADsEQqUQ0kE4fcy2
	 ObH8GeqGTi4n7U4NsXtK3FkxmXTYwxj19eR5fULc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DE6F805FB;
	Fri, 11 Oct 2019 17:27:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D93F80308; Fri, 11 Oct 2019 17:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A17F802BD
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 17:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A17F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="smkDpgyP"
Received: by mail-wr1-x430.google.com with SMTP id r3so12405362wrj.6
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RzjK5Ht69tgaUqi7M8XuzUgX+3LalFIhFT3YvqgXYI=;
 b=smkDpgyPUSRs3qWiU19SbRGZJoJ00Tl2Mk2aMAhPuQjVoakddit71i7zOGifuz6s9b
 08c/rchHohR8rKZwiFQi0ApGao+RWbpHUPcywc6LBymwM3FIBiogo53kGp57SpJKD7ak
 nXIuPM7llcdu4AI2wIr0DQ1tpwKJ18Fzi3lvCBk20SNjl44Hsj8mIRGOJrk+W9/TSQxO
 HlybBTHjE7/4NhsHCM/q8oSszBr/nLAdN7k+x6KX4PukJk37OAsDArI3YaCirXsw+UL4
 vxHLT7EFUGSk/+KY4B17wxSPufn/wMWlVSYFZQMsOfK4pPOn91rPIbwU1My+jhxuCib4
 fP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RzjK5Ht69tgaUqi7M8XuzUgX+3LalFIhFT3YvqgXYI=;
 b=Vm0/Cg5zx0rLLk2owF3G4fex8ytmv18zn7C6dswUe/KnVYmzCkX7pmRDTA6+ZzUJh6
 7h1p+oSdJ4q7VF6GC/cP4tdikcwxh8zFvlwBqzzKcMSVzJEcGglGXchvfQIaBwUtbG+Z
 jb947Qvgo/whdc5Cy3I1tGNeBUNxY27RYg/XhRqGzcvWj1WCs5i1Z/xruVYTt5eVX7U5
 recSdZz/iwbPm08kmzbNesWFDj9Ysvvs+P6qRRtR8EutAH3Xk5icH+U9X8CR+4zFcj9N
 cSj5p6Z/I7PlsMVHORG84DgChRAzsKhad46LD3bF7lTvlvaC6IJ+EzBPxBhfSDQ8zSkH
 mWTA==
X-Gm-Message-State: APjAAAVTOxCsF4CUDfvov0NFTsBqDTEWrIvhPygPSOEnkSB3/W+xLscc
 Ie+wzuw6yecvcS0g1SeV0TJkZw==
X-Google-Smtp-Source: APXvYqyagr6ebQfEXwwaoxQrIjpTGZYVrfZOh1+amPFcWgoLg3hETqbk93jkUGgYSZzL4N/dtiJfHg==
X-Received: by 2002:adf:f306:: with SMTP id i6mr14115948wro.196.1570807628953; 
 Fri, 11 Oct 2019 08:27:08 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id a204sm16439979wmh.21.2019.10.11.08.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:27:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org
Date: Fri, 11 Oct 2019 16:24:44 +0100
Message-Id: <20191011152446.5925-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
References: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v8 1/3] dt-bindings: ASoC: Add WSA881x bindings
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
