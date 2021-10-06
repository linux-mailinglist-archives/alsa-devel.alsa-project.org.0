Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8282423D12
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A7FC168D;
	Wed,  6 Oct 2021 13:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A7FC168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633520603;
	bh=FTNshx8mgD/4dsjBE7iHgoCsCH/9Xhlk/9MW2GTlrRw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FzC3/avs0be5nl/NgECt6cimZfKg2JMSKrAmP1e1P0S9E3KTMTebvAzlSTL1vsTsy
	 eM/eNDT7T/s4HO3AKHyVqX7bBZmzmyGRgcAzC3Dla4w1ucYnzQ2f6DPnDgD85JZqzd
	 d7uhWuVr2Kr2eWH9EvjMJcB4XOjYVuKpnbrz3WYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3EC3F80424;
	Wed,  6 Oct 2021 13:40:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC309F8050F; Wed,  6 Oct 2021 13:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA912F80302
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA912F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VocKV+Se"
Received: by mail-wr1-x42e.google.com with SMTP id j8so7892435wro.7
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 04:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=VocKV+Sep1Qh/9L8MCyQ6Kx84oBjpB7JPRH+bXo4WZivRNBhtlMOtcKmZzK4ScF85Z
 ELKBDqgwBys8sOp5jSnEi8i+3lrZ8Gzioqhlf4tDhQ+ESL/3hvdY8y7DLjUf0crctjD1
 1MBUqtHNfdo2wYQU0EnW3PWpwt7/9wwrb6OylOXIm0se+4S2UI00C+6ASKtdZuZiomhY
 e8h5VNDcM77MV35ddDTDQYWMyRqduKRRt1L6WEWmj3ndi12Al3jzcsClFAM2XYlM6gOU
 2oLqBKDHl332WoCUXEJTYMyE4M6j6yNc69fvmRthwGYrel5b1G1Bu++K3DnhtiWJY0ZS
 DhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=53FVmS0KN2IMSeuAUZP6kpwwd7fdWwe9mA+3YlaV9S8JNqQyM3GGbTlAGyGi2hrHTz
 LFotVCr8+AUUg/kWGHX09c1ve2zwMjwk2SHQczYNTNVwuPY1nkEAVm7tpLNthwHBTot6
 74goLFgl+52BVsFSh0Yzl0tbkNWHQ5IT3PA6bOXzu9f/LbMEf1LtzivdzvzQYCyTQU7y
 kJTC8bxvlh7gCFti7DW2DPO4291t+lgdeyIfdawumjL/Rbt7Htb5FRH5w8UuBG26kCa3
 od3QyiTYfJiTHJS/5Edm34R4CMaaEJNAFOzyVQdmWfGZa50k+eYajBS/88Gqm20TtMsp
 VMxQ==
X-Gm-Message-State: AOAM530tYlewM7w1Vb74nYvU+MBSepxDVxtp6abW6EjX1DWdGU81galp
 AQDQ57F/ScgvGXJPQfYegJkxXw==
X-Google-Smtp-Source: ABdhPJxB+XWkbItuB14332DsdNb8BDqq8LaRhqpiiCHgWSmT7O/NANo6qhkcCZObEvP4Yt3HVdeNmQ==
X-Received: by 2002:adf:a504:: with SMTP id i4mr25221813wrb.35.1633520413329; 
 Wed, 06 Oct 2021 04:40:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n11sm5540110wmq.19.2021.10.06.04.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 04:40:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v9 06/17] ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai
 compatible
Date: Wed,  6 Oct 2021 12:39:39 +0100
Message-Id: <20211006113950.10782-7-srinivas.kandagatla@linaro.org>
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

on AudioReach audio Framework access to LPASS ports is via
Q6APM(Audio Process Manager) service, so add a dedicated compatible
string for this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index e6148c17419b..dc7fba7b92d5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-dais
+      - qcom,q6apm-lpass-dais
 
   reg:
     maxItems: 1
@@ -169,6 +170,32 @@ examples:
               #size-cells = <0>;
               #sound-dai-cells = <1>;
 
+              dai@22 {
+                reg = <QUATERNARY_MI2S_RX>;
+                qcom,sd-lines = <0 1 2 3>;
+              };
+            };
+        };
+      };
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        service@1 {
+            compatible = "qcom,q6apm";
+            reg = <GPR_APM_MODULE_IID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6apmdai@1 {
+              compatible = "qcom,q6apm-lpass-dais";
+              reg = <1>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+              #sound-dai-cells = <1>;
+
               dai@22 {
                 reg = <QUATERNARY_MI2S_RX>;
                 qcom,sd-lines = <0 1 2 3>;
-- 
2.21.0

