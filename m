Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F213239E07D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:31:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B22C1688;
	Mon,  7 Jun 2021 17:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B22C1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623079910;
	bh=lkCBpFQXF/UwobldSsOJHRc3hBnpB/gfLLvfP5cvBiU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KnOYFS4xdg9OchLGWPkLERnUfwIthY5wHPXkmYNVl80QrGjwPwSws4q0qnhA9oUmZ
	 aBIWnUdDQvaexDMgWkkDCcS6keF1jQWhHh5AP3M64zFJBrf3gbZZ2C7dHbJ38XjEGv
	 T4ZYyvgBkr2N4lk+zXNC0OwUfuqvefiEOZeD+pFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9106F80276;
	Mon,  7 Jun 2021 17:30:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B82F804CA; Mon,  7 Jun 2021 17:29:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E72E7F8026C
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E72E7F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wkGj5rzV"
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso13034345wmh.4
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfKfpXv/FKdYTJyCyYtnDd8R2p7FnhZ0IR4Bym/nKpw=;
 b=wkGj5rzV3qM3xQWilS7mtTQPd7a6twRqhOOKcVxbYhqE2syUo/m8UuljhncuIX9041
 Wt8F1/JKhLFqbAnW+v1Isot3jcFABJIfvfC7Gi/HUZFXjNPHjShRXZjmeH4eKWkAjuJ3
 1Y66Wf6iOOxGxJnjrQnGAhR/niTCC9pgb3cE9sg+Zh12cXSaVosbwB10jdGfNstDimh+
 8rEtZsq/qnKKtyWscjp1uT3vPYZsQXqtiYvOhhYIDyi4o1W/vO85NPq/Qu/w9MlbuE6o
 HPqGCy3hVFz/FVwO9nsREO6j+w2SSDiFntKjmnGy7gObpnOcRzgeuLrj3bbclq3fWt9b
 gTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfKfpXv/FKdYTJyCyYtnDd8R2p7FnhZ0IR4Bym/nKpw=;
 b=jidmf+MbwRKGJTEVxpGEqKjNPi0njUnV3nF3emvZyVD/hJD2n1ruEuGlh8wSjg95Gz
 ma0P7MRyCy9ryJlSOWa93rqWi+iVfju2hfgszBv/Egnqmb8R4Ya2VjshbNHHAR4II+mI
 OQF4Bkjc0lcOx4ZdFcT7/oP6qzmYGMo/aJ6Jr/nVSelUaoZyhTvEANfwTJbRjD5kToor
 ku8N2zJhY3FfOlf1PM56eZZheAtVlhtDQZG4DoBZLCOsKyZtcOFZW2nYyYvfFyMRNXjO
 tIvI/V1AunVbZzwKzrhC2lNtjt4cw9wOTTXCmx6SBFDoh7udnzeWXw9iYb/sEiv3N9Jh
 xmkQ==
X-Gm-Message-State: AOAM533NNDeXVJIg30vMR+xN6BJ3UW0zb+D7FygrZ8s8YV7VhiLB/a+b
 2MYMa4jjqk+QZiE46Pvk4ZeiiA==
X-Google-Smtp-Source: ABdhPJy+jo33/oQr90rG/P8vhsQ6lSEYBZ5NX0gOgrtpJilMBrRFqEc5ESz3yGSXx9CXMpc+/zBhLA==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr17515101wmy.54.1623079743076; 
 Mon, 07 Jun 2021 08:29:03 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:29:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 03/13] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
Date: Mon,  7 Jun 2021 16:28:26 +0100
Message-Id: <20210607152836.17154-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

This patch adds bindings support for Qualcomm Audio Processing Manager
service in Audio DSP.

Audio Process Manager is one of the static service in DSP which is
responsible for Command/response handling, graph Management
and Control/Event management between modules.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6apm.yaml | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
new file mode 100644
index 000000000000..9906ef935206
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6apm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Audio Process Manager binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm Audio Process Manager service in DSP
+
+properties:
+  compatible:
+    const: qcom,q6apm
+
+  reg:
+    maxItems: 1
+
+#APM Services
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description:
+      APM devices use subnodes for services.
+
+    properties:
+      compatible:
+        enum:
+          - qcom,q6apm-dai
+          - qcom,q6apm-bedai
+
+      iommus:
+        maxItems: 1
+
+      "#sound-dai-cels":
+        const: 1
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gprservice@1 {
+          compatible = "qcom,q6apm";
+          reg = <1>;
+
+          q6apm-dai {
+            compatible = "qcom,q6apm-dai";
+            #sound-dai-cels = <1>;
+          };
+
+          q6apm-bedai {
+            compatible = "qcom,q6apm-bedai";
+            #sound-dai-cels = <1>;
+          };
+        };
+    };
-- 
2.21.0

