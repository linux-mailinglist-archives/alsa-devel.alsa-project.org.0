Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCD9A31D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 00:40:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E07EA1615;
	Fri, 23 Aug 2019 00:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E07EA1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566513601;
	bh=1zxnDdMQrcyU4hAxfr/e3EmhdaUHr8CdapkE+BAgwM0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cwwEd7a5jS1QaYmcWlEnOVDLzBXP1DIszzFk6VZABvjIGVUbZR5kLOo+qJaC+UB77
	 QrH8E+ZdF/2n9lm1csujrBM9CHy3a+z78Y69dnRaVUKnIZiXGCSB0yR5gxCbYQZBtH
	 Gn1O1iyNoUZT7FMLQaAhN2+mZ7PwvwEJjddNfHI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F7A5F805FB;
	Fri, 23 Aug 2019 00:36:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7585F80529; Fri, 23 Aug 2019 00:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B40ABF8036E
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 00:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B40ABF8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UIbD8GdZ"
Received: by mail-wr1-x442.google.com with SMTP id k2so6864414wrq.2
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKItD6VTynhG44BbTNA1tEZDVFXwDRIxmLymjPcSI/g=;
 b=UIbD8GdZb05DvJGyoe8mUhcjQ+SEbR4I1go5jt3NvovhaS5NSHSJFJ1Zhn7URrhEbN
 VElQUAWabycOuciSESS4qCbHIFw6xUeb7HsjI5iThHVz0bBZeUMw3yVS+f9aSZ2OeZ/6
 m/FGQv9upzbh47uolgLBj6YE0VLyzp7WyBx8wGqM6q6+/CqAHn9Fs2Yt274hpZKDMOFB
 pJpB8ff93pEiB9c5L0H5gPFY8MCMuTBTFLK/0ZfaNTMtiqrg2wRdjE3XG698ck02HEI9
 zUSPGXphTpUiqi8T1UPZFArmPpY+XzuD1eQbvkXtprW64A7XzrFDS4RPgBkxbLBGfJFI
 /mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKItD6VTynhG44BbTNA1tEZDVFXwDRIxmLymjPcSI/g=;
 b=CpXwDwJvB+o4DO5qo5K3clY8cNUzC5mxl47Z3Hf2DLdQOf4wgNBn1GYGEuh3N8Nf2/
 9rcIVXUEZc5BAYzILh6L+Ub+5cX8Sm6gGoU1quE07YgheNowJ3I37uFs1KaCrwMg9bL4
 juqxDNRSs0CO4bwgjMY2fsa1bXT2Qe+r9fFLCqkN+1q35LCB9jUfRm9163IuEe/UCmi/
 qJVO/diWcO80qFoLGFbWJO2Z7+HaGL2aeNLu+c+N2WaOBA3ArVdq4wI4bAXZGnbzQbXV
 8dRtGTfBuUlt3Qtu2v8q/ZUWeYn3I3wP4Ha1TMq01yhjeecKnEXnqXh7L/TZR0guX/DS
 ddKQ==
X-Gm-Message-State: APjAAAUJfWi2EumdAZHhv9qUeJ9qG4GqeVKKNFigXktPqkEOnID2t3yi
 7OUbvq0r0p0DoUlSfppFzs5QIg==
X-Google-Smtp-Source: APXvYqy0eUrEncO6dXNEUZrNk2ZhNndpnblHusApU+VE3u0zUnQEc3+LjQadGewlrSU67VKgbRwHtQ==
X-Received: by 2002:a5d:568e:: with SMTP id f14mr1102872wrv.167.1566513385232; 
 Thu, 22 Aug 2019 15:36:25 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id m188sm1886380wmm.32.2019.08.22.15.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 15:36:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 22 Aug 2019 23:36:05 +0100
Message-Id: <20190822223606.6775-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822223606.6775-1-srinivas.kandagatla@linaro.org>
References: <20190822223606.6775-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 3/4] dt-bindings: ASoC: Add WSA881x bindings
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
---
 .../bindings/sound/qcom,wsa881x.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
new file mode 100644
index 000000000000..ad718d75c660
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0
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
+allOf:
+  - $ref: "soundwire-controller.yaml#"
+
+properties:
+  compatible:
+    const: sdw10217201000
+
+  reg:
+    maxItems: 1
+
+  pd-gpios:
+    description: GPIO spec for Powerdown/Shutdown line to use
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - pd-gpios
+  - #thermal-sensor-cells
+
+examples:
+  - |
+    efuse@1c23800 {
+        compatible = "allwinner,sun4i-a10-sid";
+        reg = <0x01c23800 0x10>;
+        pd-gpios = <&wcdpinctrl 2 0>;
+        #thermal-sensor-cells = <0>;
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
