Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D034E22BB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 09:58:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9E7B16DD;
	Mon, 21 Mar 2022 09:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9E7B16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647853137;
	bh=QkrMO5edf6BhnfkEm1S1HJsBnkqdo1zfEs6as7zJY2s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvRJb2ReyU3jrEumG7MAEu8TTmZdRux3hZr+Ev2v9si4w9FtiMyPQbNG+XqkIjCdB
	 pD1+i5CZaqV7ZMaihLHLG24ODHNR9ttVb/DFjv4CgmGOsCAMEIAkx4sbSF88ey/zt5
	 /JLAByyA0TRBr0RtysS1vITize8/KkApcUdo+p5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CDC3F8051B;
	Mon, 21 Mar 2022 09:57:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDD56F8051A; Mon, 21 Mar 2022 09:57:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26A61F80515
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 09:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A61F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="fv4JG7nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647853026; x=1679389026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=M4kVC0r/rfY1s2TKqLyYnRyMBohGE64J9AJFvf+O4KQ=;
 b=fv4JG7ndRzOj1V8BZGPOcx4Q+f705VCc3HtpvCr8IR78oENDV2iLtAkz
 OQ+THyrIl1mRj+z97RmUj7jPTDaPAN1Fc3ppLq4ur0zusaOolueIo1bvu
 ZkIvL52gRa/r0OUC8rfCqZBYni8eFMNu4+JbY7GCYLdtlXJJ28hxx2WGH A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 01:56:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:56:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 01:56:55 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 01:56:50 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
 <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rohitkr@codeaurora.org>, <srinivas.kandagatla@linaro.org>,
 <dianders@chromium.org>, <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <alsa-devel@alsa-project.org>, <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 3/3] ASoC: dt-bindings: lpass-cpu: Update clocks and power
 domain names for sc7280 platform
Date: Mon, 21 Mar 2022 14:26:21 +0530
Message-ID: <1647852981-27895-4-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Update required clock-names used for MI2S primary path, VA macro's
codec memory path and HDMI path in sc7280 based platforms.
Update power domain names required for sc7280 platforms.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml       | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 2c81efb..e9a5330 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -38,8 +38,8 @@ properties:
     maxItems: 7
 
   clock-names:
-    minItems: 3
-    maxItems: 7
+    minItems: 1
+    maxItems: 10
 
   interrupts:
     minItems: 2
@@ -62,6 +62,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  power-domain-names:
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 1
 
@@ -192,15 +195,19 @@ allOf:
           oneOf:
             - items:   #for I2S
                 - const: aon_cc_audio_hm_h
+                - const: audio_cc_ext_mclk0
                 - const: core_cc_sysnoc_mport_core
+                - const: core_cc_ext_if0_ibit
                 - const: core_cc_ext_if1_ibit
             - items:   #for Soundwire
                 - const: aon_cc_audio_hm_h
+                - const: audio_cc_codec_mem
                 - const: audio_cc_codec_mem0
                 - const: audio_cc_codec_mem1
                 - const: audio_cc_codec_mem2
+                - const: aon_cc_va_mem0
             - items:   #for HDMI
-                - const: aon_cc_audio_hm_h
+                - const: core_cc_sysnoc_mport_core
 
         reg-names:
           anyOf:
@@ -228,6 +235,10 @@ allOf:
                 - const: lpass-irq-hdmi
                 - const: lpass-irq-vaif
                 - const: lpass-irq-rxtxif
+        power-domain-names:
+          allOf:
+            - items:
+                - const: lcx
 
       required:
         - iommus
-- 
2.7.4

