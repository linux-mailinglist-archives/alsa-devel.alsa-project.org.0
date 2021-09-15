Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDD40C642
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F17B8182D;
	Wed, 15 Sep 2021 15:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F17B8182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631712055;
	bh=pZIr869HvnGMHpMOYdNAwaUtmC3QNsCxlK+QDwpACaw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGp0BhRsSUDRtBeQzOG8ZAwYKST/w31n761AJLHAZu7OBYnpzn7VHsDkKlnM3Qs1t
	 NpPM4AawfwEUq64Y6Gf359tI0zb9qlLcoX5IaesjuJ7zO5bEDJnSizPKaucpvRXJPo
	 p4yc6M/ggEsxVD/PhQIu7zjPKiAOV2z7pasNDF5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50AA6F8057C;
	Wed, 15 Sep 2021 15:15:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DC8EF8053E; Wed, 15 Sep 2021 15:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC67F80507
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC67F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nJvOEzs6"
Received: by mail-wm1-x32a.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3869275wmh.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GaajfoQqAau0UKWbY5qFjUEbOMH+WVAHfniHoso/nwc=;
 b=nJvOEzs6UB5elX7UFs0R01PkpLS1TeypZcxaOFYGqj8/UfKoHSwwuglzE+5OcOs+Sj
 Fm4z/WHaptcT8JyamQIZbXJ9KerOO1pt/OPrndMd89RkNBka1N8HhoCUCl5CHTGFkMJy
 JN12OWa/sFe/7J4HorCA9wV/9AvNsW6NnmQWI0r3ssMpPbZt+rVOZ7Zp/IcB4amHIjY2
 HWf0nikvs4eSxJGEVCY5rDc+Pww2uiXH91cybBvZdNAZle6rY0Le5l8HR0d1ORVv4yFV
 UKj3o5fdxzSbVi+ILf5ZSMuXpgdG3Cwqsvr8fdTDzFsjeortW7jZ+37BKDcR6z4KO043
 g8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GaajfoQqAau0UKWbY5qFjUEbOMH+WVAHfniHoso/nwc=;
 b=yAOu8vTYW+HqikaKwymPyAtzSNX3gsjZ1MP+9wUWFB0JBdmxGSjlEHBidHoC5woHfa
 EpHGOla+XiAKmP+iw9WJweuTaa3CLY6DABTfU/cN7Dwm3dPAX8Qb8DbrnJcBLrHXzxMS
 VXjRQcuBYT/A6eaXMFBK2Dsc79mrDr85IEF1izUB5kdLkp6UtGSh4a9/tu9FKnjB7Yza
 oZrWFmJ4EwPND5On6wr7oqCCY+WyMsU6uOqBUCDuhPm6GEKbzDvgQXjmWkJP3/5yfFlQ
 Z1aIcdyrZutK4Mni5cPQ0k5UNSypQjatqfzS0BR/MCbQv0Wt1Y6SGbE+kb1OU5BJkogd
 KwWQ==
X-Gm-Message-State: AOAM533O/zJxNB1YNFJcK9B8QaOlXCtln7rBKHNx9zaunMASzR/DMDwp
 Yapr7uu7mrHDFge45/eW1WMtNQ==
X-Google-Smtp-Source: ABdhPJzi7m1bzrnbEsZ0kgjPXtlQ12jUW6US1Wq7WwxVNzH3kKZZG+u0s8NwAXjWfiLLg4yB4pawtA==
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr4388742wmj.110.1631711697062; 
 Wed, 15 Sep 2021 06:14:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m29sm14501717wrb.89.2021.09.15.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:14:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v6 13/22] ASoC: dt-bindings: add q6apm digital audio stream
 bindings
Date: Wed, 15 Sep 2021 14:13:24 +0100
Message-Id: <20210915131333.19047-14-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

On AudioReach audio Framework, Audio Streams (PCM/Compressed) are managed by
Q6APM(Audio Process Manager) service. This patch adds bindings for this DAIs
exposed by the DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,q6apm-dai.yaml        | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
new file mode 100644
index 000000000000..5d972784321d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Audio Process Manager Digital Audio Interfaces binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm APM DAIs in DSP
+
+properties:
+  compatible:
+    const: qcom,q6apm-dais
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        service@1 {
+          compatible = "qcom,q6apm";
+          reg = <1>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          apm-dai@1 {
+            compatible = "qcom,q6apm-dais";
+            iommus = <&apps_smmu 0x1801 0x0>;
+            reg = <1>;
+          };
+        };
+    };
-- 
2.21.0

