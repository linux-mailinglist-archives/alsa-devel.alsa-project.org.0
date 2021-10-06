Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91863423D17
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5921686;
	Wed,  6 Oct 2021 13:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5921686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633520645;
	bh=+e8dvEgXvMvi1kon22tMa51uyw/ukVGI/s19D5VXDhg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljWf9gpg36YLW9MnxZndcaJB769p71unUo/iaIMmIM17PdHXZGcCKyW4Xv9Q5XujR
	 2OLdQiMKaMjufmLR3s+GCjlZ9zuqamP/suCHiClyam19/Peq7eTLGtP6JHcXFJKeDJ
	 H6Y1ziRXnKqvWvGWufQ1EbbGOld7Dmau1c4fWcgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D66C7F80533;
	Wed,  6 Oct 2021 13:40:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F06F80517; Wed,  6 Oct 2021 13:40:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6A17F80424
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6A17F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XJ38njgw"
Received: by mail-wr1-x429.google.com with SMTP id o20so7901437wro.3
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwISwd5A9r+96Ga/POOsImhvVy//AhRYwgp/dJ/hQjg=;
 b=XJ38njgwQsb7nAp2wTwdGTXZGI4OfPBun0knvwl9Y1u9mpLucDYD8gjjVwnzdjF68m
 Luz7xPd8hnsYmyijDZHf45Mz5tmslGb7gRMxqhAEB+WTnOSFmEC5RjeckDbwqfw8nwJ8
 MeHKYX05ZOyPtCcuuDO/fNjc+LLTZ2Gpq+tuXsD9ceOTD48hcon1zswKJqCJG1qdFx+U
 kzw8CWV1nu28hAs86kDfwtkng6qKxi4zsE8AKz5HAwLsLiWl9kFm1RqP3x4xkJZCheDI
 VxeZAjQY4Vx6XGpug4J2w5uLWJsE+CmtAmWn/sw/Zf8DlKTipwODTRFvNYNzGYFj+HkR
 siYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwISwd5A9r+96Ga/POOsImhvVy//AhRYwgp/dJ/hQjg=;
 b=MwsU5b1SFO/1NL6No2cUJEBKRzjq0YjwHaVw6yVNwewkvKJ/UgGbamQUpi1nUMyi07
 kIWpsCtdlF9mZFjhbtxtESKYe4p7A7Ww1AONUX/dyqcleSnA3wD22a3fyDVehHAi9K4K
 kupdamI5z62d52fCq5SlEeICPMfImEB/+YJq5cIK6kfoqOj1Hn4zgLS8kOzOSspvMhln
 MlAHNv35WEXll9rnLKs634NS0BKsohfa3wfM1jYX78OGx5T6qPotWYHaAjBbd/UTVrk3
 Cwv5TRiNVRo43W6gCSHOgbvs61RWiXmHvwdymS77rGnRTS1TRc1/Co+MiX2BQqc6NfKC
 7OPg==
X-Gm-Message-State: AOAM532ST5olDIxnTlI8y7WrSEStS6rUX3kKpPxRLxFUviLM4GpRAC+S
 J+pTuT/JxO49iQ/7WnpBeNBBRQ==
X-Google-Smtp-Source: ABdhPJz5Ei6qgaV54wktsKWl0VvahB0pJGzPNGzSU/TaR1US1wEjZnt+yHYAfgql8JAswFQfafFg8w==
X-Received: by 2002:a1c:2c2:: with SMTP id 185mr9304840wmc.85.1633520415700;
 Wed, 06 Oct 2021 04:40:15 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n11sm5540110wmq.19.2021.10.06.04.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 04:40:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v9 08/17] ASoC: dt-bindings: add q6apm digital audio stream
 bindings
Date: Wed,  6 Oct 2021 12:39:41 +0100
Message-Id: <20211006113950.10782-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

