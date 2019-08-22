Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BC9A404
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 01:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108621657;
	Fri, 23 Aug 2019 01:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108621657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566517318;
	bh=1zxnDdMQrcyU4hAxfr/e3EmhdaUHr8CdapkE+BAgwM0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyFciz/+Fk+XfNmeZ/l7xAudFX7r0rz3Cnd4wkMt7O+dAOMvpNhN6dzLCnbiV4xAF
	 1MJ+o6sJsUdE7hqZrRUrL2zw7E3HD53HF2/1zlur7W1G5crf4t7mI9z/h9nzW3+RH2
	 JzTNpwaWkyt19TPlcU7RsjUPbXH5Ib+IkZp6TDBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FB09F805FB;
	Fri, 23 Aug 2019 01:38:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65BE2F805A1; Fri, 23 Aug 2019 01:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68272F80112
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 01:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68272F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QVFV+tCm"
Received: by mail-wr1-x443.google.com with SMTP id t16so6946984wra.6
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKItD6VTynhG44BbTNA1tEZDVFXwDRIxmLymjPcSI/g=;
 b=QVFV+tCmy73EcWKH38tXOwHM6SjX/FN3fkinZ7uN/cE2EylFPohB4Y1zd2SHcj7jlV
 2FEPd68dT+aA3c5GZ1Rn9TorNwaCs2Lbq8cdHyCbTe2Y0+4ohF3kEvIQ97cbOR8fVrd8
 P5oeaNwy35bkTttplbIAsm8Ek0dt4krXJs+Pxo7LtnziZnoklTADfgvQ64CL1Tkd3Hpt
 j0CNaeNBlnMKXAaR6v0fZvv1yX647dEYtqq3pVywqhF/9+Oo8ZNoMRgSFVWL15+ia7Kn
 kw3vwnq0dVB7Z6McBw6FakPSQ5Hj/AR3es/4NhqknOUsek+vamh/fGQvPkGQS9pvxUmb
 Bakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKItD6VTynhG44BbTNA1tEZDVFXwDRIxmLymjPcSI/g=;
 b=MFxR+hwtARKYX1r3sV3+cdVMHrzILuiZzZM9ByoETBdlGpAHO28hp7fpgJBtd5SjnM
 bGGkZyltdMK1IKAed7ftgDQHibWywanPHZ0vePzR+43y3Zw4vZGwKIEN9qZCERomx9zX
 0gn3Vt4j2J3eE5+jvSdfoKWHqEMTSNdNc8bJroi6O/U0wy8jLFauRKkaCmkGxf1Om3A1
 8Bb7fJ7nqVWfZuAL9siJsBHnLeP7TwN91O9LI9cH1/g+GrKMYScZDBv7UBlXm4j/1kFW
 iacZKoycSDPkepfNEQuJKNgpuEaswIpsWLlAdMAfZZ77EUEjQ530id3zIRHZ4g1eBgWk
 USPw==
X-Gm-Message-State: APjAAAWrSW4BsrS7WVhtIwv79rTKlaOFatFar27uZ9w6/tXYd/dfIJB1
 Ty+h+sVYkUUQhXXeyHoVDo1fF2Dq8ic=
X-Google-Smtp-Source: APXvYqyVlH6GOM5XCUzQUNZg2t2gprlrtcS5VkO7+x5WYPnk12cSbxatchRYDwtle4pkss+6BBvh9g==
X-Received: by 2002:adf:db01:: with SMTP id s1mr1357911wri.164.1566517103228; 
 Thu, 22 Aug 2019 16:38:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f134sm1705157wmg.20.2019.08.22.16.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 16:38:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Fri, 23 Aug 2019 00:37:58 +0100
Message-Id: <20190822233759.12663-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RESEND PATCH v4 3/4] dt-bindings: ASoC: Add WSA881x
	bindings
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
