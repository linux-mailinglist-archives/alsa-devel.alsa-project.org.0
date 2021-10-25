Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C24439D67
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F8816E3;
	Mon, 25 Oct 2021 19:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F8816E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635182455;
	bh=wMkgM8CoglY0fvE9Zf5Mt39swOo7BxD8RsI2fUnIV9I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fsehRuKfv7kjLHA6rQesO1QuPa5FWo6FAxVDklXfK9Iz+u88EWNh3xUCyoGQu9Ui1
	 4MIT1vZwC+nZ8levNGfYCt4c8qRf5n9F8FFxycqBtnSmbLYQRfafFHNoI7C6zWDna4
	 FXvfZHXQp7+4Gb1NxRKgmt+QpXm/4kooI/ifSnMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DB3CF8025A;
	Mon, 25 Oct 2021 19:17:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E77F8051B; Mon, 25 Oct 2021 19:17:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18348F8010A
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 19:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18348F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wzF5Nefa"
Received: by mail-wr1-x436.google.com with SMTP id d10so10034270wrb.1
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUTQPGMld1NjfHqBeBgP6Q5d4oV2F6unCGQSSDbPgkI=;
 b=wzF5NefaWuJV1SiBItHQZTQ+EQ6Wii51YLv2LcaNV+DYBZcevM3rTvH9bVI7Nt1ItL
 TNvgVRW8Agz91hECjveULwumyf1CDpjFOsdSu/3CRZueKjvBSXkKtZmOt906+hXZaPJ8
 qEqlHb0qQhYsk4jqpQQwmHQ2IMDyRXI+HMm4VpO5nSyZWWwQsUYFjjnq8ab3VGu2eflG
 HXURgLuGzqk9lklIpHgyudqDKK7vMs3f858vsSy7V3+yeH5I1w4kslpUaaK3Mg/6yupC
 Kkw8Gs92pH8tcaUcxensMMqXg94rfEsP5BA7EESEyaeHDjqayDBDsWxH5QT5/Fbe9MbU
 GKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUTQPGMld1NjfHqBeBgP6Q5d4oV2F6unCGQSSDbPgkI=;
 b=WVOmL0Wg/hkvXXdwLclw5EDTSULxgBJYxlqQ5NAXcU7MhSq/R3k4pCp95WDyb15ylK
 YL8/2244CL7w5T1mdHE/AJ3d2v/Fhk1M5S5mST64eueM8RSg5RmVBCiLx3FTbGQOxZfS
 ao2D0o4oiBxEaCG+3+PzBXALhU4RiBXMjY1rqGtSaHsOJvR/EgHyQG1SaOJ9NyN4tb0m
 Nlir1I2jsvlPCGOE2irOJGjv4Sr0RdbbEioKAFRPfyhLSnteCD8mIE2gvfvcG4L/Q2iY
 Y5DemVi9ITkAKjQiDEeGKSzvyJzUREH/mhiwjXYrP3TAekPmJLIyzz6bF1d0/885WwP6
 tggA==
X-Gm-Message-State: AOAM533D2ic7mZ9JX33KCCDJpBDkkA6xypNW+2zZL95JSzbbdhB782HE
 n1kNxdJD+lh0hqcZTcH/nKbZIA==
X-Google-Smtp-Source: ABdhPJwoWPto9WG3m61QzjZnDE2aejUvuK9tn0SIenbQwblhQt6IR2sBdd+St+GgOOSRYa4qenIoOQ==
X-Received: by 2002:a5d:438b:: with SMTP id i11mr9969426wrq.188.1635182238986; 
 Mon, 25 Oct 2021 10:17:18 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r11sm5181012wrt.42.2021.10.25.10.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:17:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v10 08/17] ASoC: dt-bindings: add q6apm digital audio stream
 bindings
Date: Mon, 25 Oct 2021 18:16:40 +0100
Message-Id: <20211025171649.17730-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
References: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
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

Hi Rob, 

You might see a dt_binding_check errors as QCOM SoC relevant non-audio patches
in this series have been merged into the Qualcomm drivers-for-5.16 tree,
as this series depends those patches an immutable tag is available at:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
tags/20210927135559.738-6-srinivas.kandagatla@linaro.org

thanks,
srini

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

