Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B9B254B4E
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 18:59:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18D69181B;
	Thu, 27 Aug 2020 18:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18D69181B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598547550;
	bh=efKqBny9Xuy7qd1R1neLKwB6INAiegIZcN0JH6viFMY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jR6TRqAK8dE1BkhjjWZo/q7PZ+8EMzq4xJgT81YpIPBGVZ6OQR06Tyog/1G+2aa3h
	 CjbViXOMtvjiyKxIOfZorEChg8bfe0gJV4nUrgP9i+p37Lndq6d2FEOck7XapfzW/2
	 dTkXH3a9f/eCxkwYC4px96Hfw1E5sdZQedpy0WhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45656F80334;
	Thu, 27 Aug 2020 18:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4E8F800EB; Thu, 27 Aug 2020 11:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37C64F800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 11:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37C64F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="awffycuD"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598520521; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lONjzqCsTmfjTnMJDPuGaZHl39mxwwURVQG61QsV/DI=;
 b=awffycuDA43PGgML6/U5DWYT3d4/MMCyxzD/C2OfX4PjU15Dxb4PnsDe0lN/b4B5/VwtBAM6
 fCuKYweN9fAzIRt5vWhVRuiaoIHocTmaGyRTX48Y4GJkkhJxJ0GqzsACtbRl7AXcYmRYV2ZY
 /ysuLVj4cbo5NtNsHgSdgD9rQ6Q=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f477cc87ea9bd290935a3b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 Aug 2020 09:28:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 35F17C433B1; Thu, 27 Aug 2020 09:28:39 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A848C433A0;
 Thu, 27 Aug 2020 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A848C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
Date: Thu, 27 Aug 2020 14:58:12 +0530
Message-Id: <1598520495-21741-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598520495-21741-1-git-send-email-srivasam@codeaurora.org>
References: <1598520495-21741-1-git-send-email-srivasam@codeaurora.org>
X-Mailman-Approved-At: Thu, 27 Aug 2020 18:50:45 +0200
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Adds bindings for lpass hdmi interface
which can support audio path over dp.

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 51 ++++++++++++++++++++--
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 09c9bd2..7c2ac0c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
+      - qcom,sc7180-lpass-hdmi
 
   reg:
     maxItems: 1
@@ -60,10 +61,12 @@ properties:
     const: 0
 
 patternProperties:
-  "(^mi2s-[0-9a-f]$|mi2s)":
+  "^dai@[0-9a-f]$":
     type: object
-    description: Required properties for each DAI
-
+    description: |
+      LPASS CPU dai node for each I2S device. Bindings of each node
+      depends on the specific driver providing the functionality and
+      properties.
     properties:
       reg:
         maxItems: 1
@@ -145,6 +148,22 @@ allOf:
         - iommus
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7180-lpass-hdmi
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pcnoc-sway-clk
+            - const: audio-core
+            - const: pcnoc-mport-clk
+      required:
+        - iommus
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/sound/sc7180-lpass.h>
@@ -178,12 +197,36 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
             /* Optional to set different MI2S SD lines */
-            mi2s-primary@0 {
+            dai@mi2s-primary {
                 reg = <MI2S_PRIMARY>;
                 qcom,playback-sd-lines = <1>;
                 qcom,capture-sd-lines = <0>;
             };
         };
+
+        lpassh@62d87000 {
+            compatible = "qcom,sc7180-lpass-hdmi";
+
+            reg = <0 0x62d87000 0 0x68000>;
+
+            iommus = <&apps_smmu 0x1032 0>;
+
+            power-domains = <&lpass_hm 0>;
+
+            clocks = <&gcc 131>,
+                 <&lpasscc 6>,
+                 <&lpasscc 10>;
+
+            clock-names = "pcnoc-sway-clk", "audio-core",
+                          "pcnoc-mport-clk";
+
+            #sound-dai-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            interrupts = <0 268 1>;
+        };
     };
 
 ...
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

