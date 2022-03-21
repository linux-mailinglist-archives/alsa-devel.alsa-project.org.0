Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5F4E22BA
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 09:58:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A02B16F8;
	Mon, 21 Mar 2022 09:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A02B16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647853114;
	bh=X4vZ5/kgTQBN0PDemSv57ik5liN48wtTC/R4DCBxJM8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q4o92YshbOoKmOLC1gWZWONKm5/kzc6pdPW/pFtEs7sG5sGPn3IuyTP9p9vswjaa9
	 j+6yOdA+5Z8CwhJCHVM70P8gVVROtfrmqCJvJiyKLffJATbm+7+YtpXpie2lFGKBLS
	 re2gE/5/ptivcyzyfk/j2r9Z7rRXbcGz8MBQ7/eA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACDBF80517;
	Mon, 21 Mar 2022 09:57:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A57BF80431; Mon, 21 Mar 2022 09:57:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8509F802D2
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 09:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8509F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="KxyQqX+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647853015; x=1679389015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ISCUgpFLNrcd0Zd2YYdxHLQx+tSivhuR0hYqwrnB+vc=;
 b=KxyQqX+l33G8qJE7RbDgI96WkPDr+aqL6pstCyx8q23QGJF9b51+WuK0
 stvGxKGqEdl6da8kgNCp045VDQGH9enHEMqqsn78fWqgpgrnkbEE4l7No
 EycacguetbGtIFRSHKeB/ktCEeeO6MAAbbZHmtbGm86UkBP9I0Du+Pg/n w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 01:56:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:56:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 01:56:44 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 01:56:39 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
 <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rohitkr@codeaurora.org>, <srinivas.kandagatla@linaro.org>,
 <dianders@chromium.org>, <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <alsa-devel@alsa-project.org>, <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/3] ASoC: qcom: dt-bindings: Update bindings for clocks in
 lpass digital codes
Date: Mon, 21 Mar 2022 14:26:19 +0530
Message-ID: <1647852981-27895-2-git-send-email-quic_srivasam@quicinc.com>
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

Update dt-bindings for clocks as per ADSP bypass solutions, in which macro
dcodec GDSCs are enabled using power domains in lpass digital codec drivers.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++------
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 17 +++++++++++------
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 11 +++++++----
 3 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 6127df5..a6905bc 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -28,12 +28,17 @@ properties:
     maxItems: 5
 
   clock-names:
-    items:
-      - const: mclk
-      - const: npl
-      - const: macro
-      - const: dcodec
-      - const: fsgen
+    oneOf:
+      - items:   #for ADSP based platforms
+          - const: mclk
+          - const: npl
+          - const: macro
+          - const: dcodec
+          - const: fsgen
+      - items:   #for ADSP bypass based platforms
+          - const: mclk
+          - const: npl
+          - const: fsgen
 
   clock-output-names:
     items:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 3f0f99c..324595a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -28,12 +28,17 @@ properties:
     maxItems: 5
 
   clock-names:
-    items:
-      - const: mclk
-      - const: npl
-      - const: macro
-      - const: dcodec
-      - const: fsgen
+    oneOf:
+      - items:   #for ADSP based platforms
+          - const: mclk
+          - const: npl
+          - const: macro
+          - const: dcodec
+          - const: fsgen
+      - items:   #for ADSP bypass based platforms
+          - const: mclk
+          - const: npl
+          - const: fsgen
 
   clock-output-names:
     items:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 9868a5e..7b4cc84 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -28,10 +28,13 @@ properties:
     maxItems: 3
 
   clock-names:
-    items:
-      - const: mclk
-      - const: core
-      - const: dcodec
+    oneOf:
+      - items:   #for ADSP based platforms
+          - const: mclk
+          - const: core
+          - const: dcodec
+      - items:   #for ADSP bypass based platforms
+          - const: mclk
 
   clock-output-names:
     items:
-- 
2.7.4

