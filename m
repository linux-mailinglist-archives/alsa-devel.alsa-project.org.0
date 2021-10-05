Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51517422989
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 15:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4ADE16A4;
	Tue,  5 Oct 2021 15:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4ADE16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633442264;
	bh=yRSC7vOfKSRQcEylS3AbiJVjUHKvMtQOifCKVAZyrig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NB4atob1sCEtTRY/f6dYkdV0C0N0q4xlG4ajgUVGjnget/1xanh0rsiquS+YfWUod
	 Jkzq7OQBPZjT/azt+0gK4UOhq9z5SDMuN+p+K3oqrt5PG8G6g7aFkyTctw9mZ7HXii
	 m9UMkTrUOtO62TUVKUbYlPwHTiPsf02sATUZdfwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8D0F804E2;
	Tue,  5 Oct 2021 15:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACCC5F8052E; Tue,  5 Oct 2021 15:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 732C4F8020D
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 15:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 732C4F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Q7QEnhvu"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633442063; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=SIh3UOKJFyUcz7e0W0YNJa7fYKCz5HvDT8H7RKm+2KY=;
 b=Q7QEnhvuOtpffUisOzTmtOKmC7Orc4l2XBHy8VBIcL74AHRKgc5KOOqEe7nHEgYfAM/Ox/Qn
 oPrtnVvh9eEYgdZ504uc7hLQMT+Jy4OlgpYNYOjoUtEUGO7vc2GJkDvTm6i9mShdFtrtBvn0
 8Rnnu5FyfKOJh4FP2SGChPnjC44=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 615c58f563b1f186586e5729 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 13:53:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AC92EC1493F; Tue,  5 Oct 2021 13:53:55 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AFF7C48B2A;
 Tue,  5 Oct 2021 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9AFF7C48B2A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v2 6/9] ASoC: dt-bindings: Add SC7280 sound card bindings
Date: Tue,  5 Oct 2021 19:22:51 +0530
Message-Id: <1633441974-15353-7-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633441974-15353-1-git-send-email-srivasam@codeaurora.org>
References: <1633441974-15353-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Add bindings for lpass sc7280 based soundcards which supports
audio over i2s based speaker, soundwire based headset, msm dmics
and HDMI Port.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 1e23c0e..0f5a57c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -22,35 +22,36 @@ properties:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
+      - qcom,sc7280-lpass-cpu
 
   reg:
-    maxItems: 2
+    maxItems: 5
     description: LPAIF core registers
 
   reg-names:
-    maxItems: 2
+    maxItems: 5
 
   clocks:
     minItems: 3
-    maxItems: 6
+    maxItems: 7
 
   clock-names:
     minItems: 3
-    maxItems: 6
+    maxItems: 7
 
   interrupts:
-    maxItems: 2
+    maxItems: 4
     description: LPAIF DMA buffer interrupt
 
   interrupt-names:
-    maxItems: 2
+    maxItems: 4
 
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle for the audio DSP node
 
   iommus:
-    maxItems: 2
+    maxItems: 3
     description: Phandle to apps_smmu node with sid mask
 
   power-domains:
@@ -69,7 +70,7 @@ patternProperties:
   "^dai-link@[0-9a-f]$":
     type: object
     description: |
-      LPASS CPU dai node for each I2S device. Bindings of each node
+      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
       depends on the specific driver providing the functionality and
       properties.
     properties:
@@ -174,6 +175,58 @@ allOf:
         - iommus
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-lpass-cpu
+
+    then:
+      properties:
+        clock-names:
+          oneOf:
+            - items:   #for I2S
+                - const: lpass_aon_cc_audio_hm_h_clk
+                - const: lpass_core_cc_sysnoc_mport_core_clk
+                - const: lpass_core_cc_ext_if1_ibit_clk
+            - items:   #for Soundwire
+                - const: lpass_aon_cc_audio_hm_h_clk
+                - const: lpass_audio_cc_codec_mem0_clk
+                - const: lpass_audio_cc_codec_mem1_clk
+                - const: lpass_audio_cc_codec_mem2_clk
+            - items:   #for HDMI
+                - const: lpass_aon_cc_audio_hm_h_clk
+
+        reg-names:
+          anyOf:
+            - items:   #for I2S
+                - const: lpass-lpaif
+            - items:   #for I2S and HDMI
+                - const: lpass-hdmiif
+                - const: lpass-lpaif
+            - items:   #for I2S, soundwire and HDMI
+                - const: lpass-cdc-lpm
+                - const: lpass-rxtx-lpaif
+                - const: lpass-va-lpaif
+                - const: lpass-hdmiif
+                - const: lpass-lpaif
+        interrupt-names:
+          anyOf:
+            - items:   #for I2S
+                - const: lpass-irq-lpaif
+            - items:   #for I2S and HDMI
+                - const: lpass-irq-lpaif
+                - const: lpass-irq-hdmi
+            - items:   #for I2S, soundwire and HDMI
+                - const: lpass-irq-lpaif
+                - const: lpass-irq-vaif
+                - const: lpass-irq-rxtxif
+                - const: lpass-irq-hdmi
+
+      required:
+        - iommus
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/sound/sc7180-lpass.h>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

