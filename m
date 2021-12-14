Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 633534749DC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:40:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2BA820AE;
	Tue, 14 Dec 2021 18:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2BA820AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639503643;
	bh=7uZMphQdWOLyaNaib2cAZMb8PtpqZ9f9V01Gu8vga2c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cd5QZwRz24JTLYX8er9ECi4mkWWt9xyKKSb/W9ne3tLTzf34NeHISfKJa2Xx+FNrW
	 UZMKx9P15PV0FQl5IAEeBB8h0zQLi+SwoBx2F0M11SvoCwxGvExeb0jMBncgFcVPuv
	 LV8OxiW35SakcDr2BT3eIC6Z92BPTUtwLjWgkfFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7961F80548;
	Tue, 14 Dec 2021 18:38:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36FB1F80518; Tue, 14 Dec 2021 18:37:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 713BEF8053E
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 713BEF8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Gb/+BlOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639503473; x=1671039473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kbjwhiK2tTRbM4zrwUQx7sOHj8zt1NylUTymteyHln0=;
 b=Gb/+BlOY+JTqPJyu5zEuB+GHFg7YL7W5bVgSkgHyHoYdJtw6H4tA/GDo
 2YftiM2ivJ9Ge6U+S6dK7tgH2+0WlRvDslAn/mceW/i4p1aBrqE6ulPLR
 OVPd22/a7oWx8QfkXMKwXvv2Jn6wwRfO7B3ZMy8MZe+rI/0Vir6h8VlFa s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Dec 2021 09:37:47 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:37:47 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 14 Dec 2021 09:37:46 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 14 Dec 2021 09:37:41 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <plai@codeaurora.org>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v10 09/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
Date: Tue, 14 Dec 2021 23:06:30 +0530
Message-ID: <1639503391-10715-10-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639503391-10715-1-git-send-email-quic_srivasam@quicinc.com>
References: <1639503391-10715-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Add bindings for sc7280 lpass cpu driver which supports
audio over i2s based speaker, soundwire based headset, msm dmics
and HDMI Port.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 75 +++++++++++++++++++---
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 1e23c0e..2c81efb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -22,35 +22,41 @@ properties:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
+      - qcom,sc7280-lpass-cpu
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 6
     description: LPAIF core registers
 
   reg-names:
-    maxItems: 2
+    minItems: 2
+    maxItems: 6
 
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
+    minItems: 2
+    maxItems: 4
     description: LPAIF DMA buffer interrupt
 
   interrupt-names:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
 
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle for the audio DSP node
 
   iommus:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
     description: Phandle to apps_smmu node with sid mask
 
   power-domains:
@@ -69,7 +75,7 @@ patternProperties:
   "^dai-link@[0-9a-f]$":
     type: object
     description: |
-      LPASS CPU dai node for each I2S device. Bindings of each node
+      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
       depends on the specific driver providing the functionality and
       properties.
     properties:
@@ -174,6 +180,59 @@ allOf:
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
+                - const: aon_cc_audio_hm_h
+                - const: core_cc_sysnoc_mport_core
+                - const: core_cc_ext_if1_ibit
+            - items:   #for Soundwire
+                - const: aon_cc_audio_hm_h
+                - const: audio_cc_codec_mem0
+                - const: audio_cc_codec_mem1
+                - const: audio_cc_codec_mem2
+            - items:   #for HDMI
+                - const: aon_cc_audio_hm_h
+
+        reg-names:
+          anyOf:
+            - items:   #for I2S
+                - const: lpass-lpaif
+            - items:   #for I2S and HDMI
+                - const: lpass-hdmiif
+                - const: lpass-lpaif
+            - items:   #for I2S, soundwire and HDMI
+                - const: lpass-hdmiif
+                - const: lpass-lpaif
+                - const: lpass-rxtx-cdc-dma-lpm
+                - const: lpass-rxtx-lpaif
+                - const: lpass-va-lpaif
+                - const: lpass-va-cdc-dma-lpm
+        interrupt-names:
+          anyOf:
+            - items:   #for I2S
+                - const: lpass-irq-lpaif
+            - items:   #for I2S and HDMI
+                - const: lpass-irq-lpaif
+                - const: lpass-irq-hdmi
+            - items:   #for I2S, soundwire and HDMI
+                - const: lpass-irq-lpaif
+                - const: lpass-irq-hdmi
+                - const: lpass-irq-vaif
+                - const: lpass-irq-rxtxif
+
+      required:
+        - iommus
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/sound/sc7180-lpass.h>
-- 
2.7.4

