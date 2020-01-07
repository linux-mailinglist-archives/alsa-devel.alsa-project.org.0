Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49526132859
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 15:02:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912141845;
	Tue,  7 Jan 2020 15:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912141845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578405739;
	bh=4GuhMq2ELnYq4Kvh33ApurO3UK3M7DFk1NE1pfRL9F0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TZ5mhRPstoaIgMeLmU8bhzLG0jNLqZCbG3+LX8HnPTPbqE/vhG1PojJHU2O/zFIJw
	 Ha1JMbqlX0JmCGl1ibYJhb7V8ZOrQOtoEblo783vDg2vbg0Tc9g96WR8WrgQCf+rB/
	 6Cc2uiJE6jkdTo1ClsFvWp32ek8wGZKmXMDRelQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF4BF80116;
	Tue,  7 Jan 2020 14:59:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19A84F8010B; Tue,  7 Jan 2020 14:59:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1018EF80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 14:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1018EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bG3iH1M7"
Received: by mail-wr1-x436.google.com with SMTP id w15so41457767wru.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JxDh75uEh0RK6rR9f3O8ETEE0JCmuUTTTLAdzg4vg4=;
 b=bG3iH1M7Fv6ZqIXQs8IWpv51ohYNpKRXk9Mm4Dpvl5/Mz7/AM6mbuEaGsq0VdNCHnJ
 +sF97/yP2uc6c31oznDRd7zQjl+iFn8vMh57i1sv7p+I2eWBVlsWowaicDtZe1wWeZjI
 m40UyCGytdUSF4ZWztDjduAvfHnjJ3E82AG2IxYUzrVsofBftQqdpNq+I8od28nCCXpu
 DYiNYliNY1YBi4lSgWEFRtE8taJ3DfnkuB0dNy9yNvTB1KpTXu+Fz8ZH7XtRR6A43NuD
 kyqt0kCsSIWFtU2DFmUqu1iCrL490nLyX5Reg1TlbSFibmqt3T6ay0PWHhOQ3WGzpfU7
 OVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JxDh75uEh0RK6rR9f3O8ETEE0JCmuUTTTLAdzg4vg4=;
 b=hEVZkLm8vbpr94t7ZUbuBmDomyXRqBAvc7gmlcWH3iI0TIklSIYoYLd4XPd7jCncDx
 KoFp1AOYQopVjlcI59FG0hFBknzPreUN/5vKeJ48Fmk9lqLxBD0u9zghalYkhGxVJRg5
 jweNnbomlehIReOl53k7SPQpQxkWfMQdtG6et6qE+8aibwbOgwa1iFeIDrVPx+Na5cOa
 iQpwIQ79rAZamI3V0kKIcQF61p0DDZeS6OCOoXE4W5Ayj7m/NODzCrssXAx8naQQ9jg9
 62MtlKfAtgJ3Y4IkBg/RFFAkFRsMBFKuFKSYEvD/6x/QyhdWYIiHgwIaOn9cLmqLZpZl
 2NyA==
X-Gm-Message-State: APjAAAWR0OkIGE+UNzqAPcRXZLNAcCOVeD3ApVhz1fD583Ya9dAPoyro
 F8xjrE/uClNOYWCdTcu4gaYuuw==
X-Google-Smtp-Source: APXvYqxt9r0uB+ee+CbL6b/s+UeAnYZqgtgFQnBNnfzhfPV6o+OgFSQ6lFGWxWTPSk8M0Spw66Y3bg==
X-Received: by 2002:a5d:6ca1:: with SMTP id a1mr105588833wra.36.1578405583141; 
 Tue, 07 Jan 2020 05:59:43 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t190sm26769617wmt.44.2020.01.07.05.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 05:59:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Tue,  7 Jan 2020 13:59:28 +0000
Message-Id: <20200107135929.3267-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200107135929.3267-1-srinivas.kandagatla@linaro.org>
References: <20200107135929.3267-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v11 1/2] dt-bindings: ASoC: Add WSA881x bindings
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
 .../bindings/sound/qcom,wsa881x.yaml          | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
new file mode 100644
index 000000000000..ea44d03e58ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -0,0 +1,68 @@
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
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - powerdown-gpios
+  - "#thermal-sensor-cells"
+  - "#sound-dai-cells"
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
+            #sound-dai-cells = <0>;
+        };
+
+        speaker@0,2 {
+            compatible = "sdw10217201000";
+            reg = <0 2>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
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
