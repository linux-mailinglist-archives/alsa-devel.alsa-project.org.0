Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A24C5755
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Feb 2022 19:11:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF15318CC;
	Sat, 26 Feb 2022 19:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF15318CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645899100;
	bh=R636mawCmHZS6LFUz22Ak3VWtJw8kwEP62jFKJVU1o4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTC+6+TYSd697k98BlHLfajXjxDRluv8S74cbNGaOSPyI6AXe8x7EaxhUpnAnBa5C
	 Fzpz5nWnPJ3cez7YQjDFCBptw6QLFeOhKzqHrYJxMHPfv1rKH5D+Q+jVCRzpBYAvEp
	 CYIqx01KBXFwrSTJk+ZbRGNL+eJBBNtZ+vsXQXg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9755F8012E;
	Sat, 26 Feb 2022 19:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 904B6F800ED; Sat, 26 Feb 2022 19:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE06F80511
 for <alsa-devel@alsa-project.org>; Sat, 26 Feb 2022 19:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE06F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="RbxmCIdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645899042; x=1677435042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RSfdJwuCbYLQ64ELpUKd+PcIHa7v60+qAk66UHs9+Vk=;
 b=RbxmCIdljNE67nkqv1xO1hOvPLE1NECzyI7Pw0A+FwbTvdypqvps03tM
 efCflLBc7BN2V6vDRud6JrfUZT/dXG0eCiU4KdREHKiopfoIz7MkmpSvI
 dUrP9eaGKWJq7R/4TbwoyPmQXJ+BcI276Qd+qgywQos2yLDq9+L0mxEWa 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 26 Feb 2022 10:10:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2022 10:10:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 26 Feb 2022 10:09:53 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 26 Feb 2022 10:09:48 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v5 2/2] ASoC: qcom: dt-bindings: Add bindings for power
 domains in lpass digital codecs
Date: Sat, 26 Feb 2022 23:39:19 +0530
Message-ID: <1645898959-11231-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645898959-11231-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645898959-11231-1-git-send-email-quic_srivasam@quicinc.com>
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

Include power domain dt-bindings for lpass digital codecs RX, TX and
VA macros, which are required for ADSP bypass architecture.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 8 ++++++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 8 ++++++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index bc762b3..6127df5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -39,6 +39,14 @@ properties:
     items:
       - const: mclk
 
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: macro
+      - const: dcodec
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 74f5386..3f0f99c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -39,6 +39,14 @@ properties:
     items:
       - const: mclk
 
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: macro
+      - const: dcodec
+
   qcom,dmic-sample-rate:
     description: dmic sample rate
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 99f2c36..9868a5e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -37,6 +37,14 @@ properties:
     items:
       - const: fsgen
 
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: macro
+      - const: dcodec
+
   qcom,dmic-sample-rate:
     description: dmic sample rate
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.7.4

