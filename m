Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE7A1F03
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:25:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9282A16DD;
	Thu, 29 Aug 2019 17:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9282A16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567092326;
	bh=eJsVUvr/ZmyGRmpS+QiHiYtSMF2Raut1XgNkmdQtczc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfQoCN4TPPiIveM5RnVPIHwLyMMJ5tgN0PQuNdBiAVvJ5yrRelWKOf3H6BHqT6aZV
	 bhveSUbnZKGFV1cn9DB5+wG4CI1b8THAzf+iyaTWEwJIikWCDjyjMXSVp2RoL6CNh1
	 cHZM8bHFLl7vHzD5zmiLf5QkiTwUMU+eqSOiUHdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D55EF8073C;
	Thu, 29 Aug 2019 16:45:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1C8AF80600; Thu, 29 Aug 2019 16:45:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 220CFF802BE
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 220CFF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lj2nkTEU"
Received: by mail-wm1-x344.google.com with SMTP id t9so4140513wmi.5
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsA55jIDaNgAH1vvyh0xdmywvQzO6o3al1haxSh/eEQ=;
 b=lj2nkTEUwlAQr++xsHh4QmO1G++imUGRPr8Z/Xp168dQ+Y81aJ0yHYLia18C2Dd4sr
 qTpvlGvuyO9GKE4/chLCzYDgDbiRxfIWMAlpSSKlf5UFwf6+RkiK2Gt1b3dzKL7CLAsK
 P4kOQ6Uy0Kx+4VS522Q4CAw8xoCnvqLIj8khrICmHCuXmtcr+oM7+UpTzWRnklCPz+ll
 niAAKs2X9ubeUmNVv3wxbM74AVhIxHZqkk2KJJcoSInKnx9bnrCZD7VHaC9f0jhWV72F
 /FuEP22zatZtVQYxOx9QzraMzHQbqBGKT8rb9/BbCZVVJkRx2wfWjolfQfYT/09ex6+a
 nvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsA55jIDaNgAH1vvyh0xdmywvQzO6o3al1haxSh/eEQ=;
 b=jhCrAMhuCk4NO6/Fj2DKT7wEEhP3U5H30RVN+6yHtzhnVgRZb3sHIWYlLXJlqiGWTI
 +WTmjOdSlcFwPsO0NNbyqHwV7EWtSQ9Pyo7IdSD94SKxO7CpoFQSJPQw5+n7+QzwP6gu
 CQSIWO9FiEocgDwsFYdQt+hf9CJ9RMk2BND4aJ69Xb1lXfOrCNgLQ/5O5lfCuPZ1evPM
 Z+J4lbbh2i+w1f2lxmEPAPEoY+IrR2UHc1XT1v1O2/PCBmhS4lefBVQkTm//RBy4KCq1
 OAsG8rs2Uirfgy0rvCbFXrSJcU1T53PrHXeqzEqs32S6JkKd1ltZpIzNSCqAttD/QewF
 MyDA==
X-Gm-Message-State: APjAAAXT2xJ1oQfILg90/imCDTbKpj2ho5WgHD3YKWRB6hskcYfFzYYt
 B/X+XqGEDW0uxWD9nPQlGAmqcuDG0ts=
X-Google-Smtp-Source: APXvYqyYqpYs64DzlBCGY3T1d6Ds7TkrQjopqVx9DZ36xCeOR+R7yJn6ENhx+NAGqMVgfNrmXNZ0Rg==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr11872242wmj.31.1567089902842; 
 Thu, 29 Aug 2019 07:45:02 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p7sm3923492wmh.38.2019.08.29.07.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:45:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 29 Aug 2019 15:44:41 +0100
Message-Id: <20190829144442.6210-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
References: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v5 3/4] dt-bindings: ASoC: Add WSA881x bindings
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
 .../bindings/sound/qcom,wsa881x.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
new file mode 100644
index 000000000000..7a486c024732
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -0,0 +1,41 @@
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
+description: |
+  WSA8810 is a class-D smart speaker amplifier and WSA8815
+  is a high-output power class-D smart speaker amplifier.
+  Their primary operating mode uses a SoundWire digital audio
+  interface. This binding is for SoundWire interface.
+
+properties:
+  compatible:
+    const: "sdw10217201000"
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
+examples:
+  - |
+    speaker@0,1 {
+        compatible = "sdw10217201000";
+        reg = <0 1>;
+        powerdown-gpios = <&wcdpinctrl 2 0>;
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
