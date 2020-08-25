Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A681A254B40
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 18:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B1D180B;
	Thu, 27 Aug 2020 18:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B1D180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598547351;
	bh=iSP2CcT424m9Co8ZhGY5odLKU5s0HgOlL6A/28TSj2k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvwkmE8PDjT9m/DGkQrMPr2VUiporfxmLEzerqoqtrM/p9X08nldYEOBmv+kbQsFC
	 nD1E7zXBrxssHURdSydFrYs+wsuv/873V5fmktbo0WmQXi7vb8/5XlOVqzrqSmC9V5
	 3H5vaxqG101uP/X1lr0anwHd/2/rnJIa83B+xcNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 421B2F802EB;
	Thu, 27 Aug 2020 18:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46A19F80260; Tue, 25 Aug 2020 19:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44290F800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 19:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44290F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="vsbigBwn"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598375847; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YYsGW89VSOJPl2rRXD3Jg5UkBGJkDM8ZNokckaK0LRk=;
 b=vsbigBwneX1C1WDxPm+txtp/Sa6Zn1I9w7B1hMvogmwYuYUbgJUd+xukYE9VG/Uk7p0Z0xLc
 TxKvS3YWWlWvzi97BiqahO83SLFy+LyihraTUajAvw59PCZe3npY50MrjtJ9qfXcRSGlHFBC
 2SgA9RgwNVu764UXkEr2PwqHkJ8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f454799e2cf79f0e26bba20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 17:17:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 020CEC433A0; Tue, 25 Aug 2020 17:17:12 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 91792C433C6;
 Tue, 25 Aug 2020 17:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91792C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: Add dts entry for lpass-hdmi dp audio
Date: Tue, 25 Aug 2020 22:46:25 +0530
Message-Id: <1598375788-1882-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598375788-1882-1-git-send-email-srivasam@codeaurora.org>
References: <1598375788-1882-1-git-send-email-srivasam@codeaurora.org>
X-Mailman-Approved-At: Thu, 27 Aug 2020 18:50:45 +0200
Cc: vsujithk <vsujithk@codeaurora.org>, Srinivasa Rao <srivasam@codeaurora.org>
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

From: vsujithk <vsujithk@codeaurora.org>

Includes dts file entries for supporting lpass-hdmi
audio driver over dp port in yaml format

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 09c9bd2..2029325 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
+      - qcom,sc7180-lpass-hdmi
 
   reg:
     maxItems: 1
@@ -145,6 +146,23 @@ allOf:
         - iommus
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7180-lpass-hdmi
+
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
@@ -184,6 +202,30 @@ examples:
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
2.7.4

