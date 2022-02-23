Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF94C1756
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 16:43:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A74A1AC8;
	Wed, 23 Feb 2022 16:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A74A1AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645631006;
	bh=7uZMphQdWOLyaNaib2cAZMb8PtpqZ9f9V01Gu8vga2c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RdS+VQ3gzr2xyLel8WlHxEaObkkW7SZL8prCOpRLvRTfiy5FjSVUK6N+UtAgjBp/f
	 wiQ1+EwocLCNJZjyzg9gu4zpk//0JftQq28Hi+3hYIchTZD/ePKHIQtMpQI3pP0UYI
	 drq7xbP1ihETZYr7W/ZhsdPfaK1uM5IopCYOY5bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D4FF80118;
	Wed, 23 Feb 2022 16:40:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2317DF80553; Wed, 23 Feb 2022 16:40:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BA0DF80538
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 16:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BA0DF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="hOHgcsnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645630819; x=1677166819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kbjwhiK2tTRbM4zrwUQx7sOHj8zt1NylUTymteyHln0=;
 b=hOHgcsnu647gcmZHqSjzkhQKz0bQjyRjsYNK25xuNcjPGn+0+KMELDfU
 WcggaPi6hZ97RY9BrjBQIFNhpp2KhFcRrWSDo19Y9DnsDKMbuqKyU6+EB
 Iq+jh9p6xoJFTP2AGj17Y6wOIz+Y5zprDAuMIj60aMNw++I4UiU4VBdUZ 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Feb 2022 07:40:16 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 07:40:15 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 07:40:15 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 07:40:10 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v15 09/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
Date: Wed, 23 Feb 2022 21:09:04 +0530
Message-ID: <1645630745-25051-10-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
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

