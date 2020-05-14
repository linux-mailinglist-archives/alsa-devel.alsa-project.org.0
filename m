Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F7B1D36DA
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7255D1661;
	Thu, 14 May 2020 18:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7255D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589474704;
	bh=DRKUy6+fbp7+B6u3m+ee7rRBjESLw220q0Q9rT32sH8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KbB8vSYvUXPd5vx3VLRhbPE6/ahzGx3D7E/N3hbUxeeB0ejq+10xx1T1uwXjfBkqK
	 hQ1SAUjxoHPK7SYhddhWwTMAAQNM5Q5uNeaiaJNIuxF3VN4OehPdYEMPLcu6V5I6Yy
	 9lMip5BQOm4WZ0iCYgtc2y421cHKMLy6gdRHyje8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 622A8F802EA;
	Thu, 14 May 2020 18:40:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF837F802E2; Thu, 14 May 2020 18:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9EBCF802DF
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9EBCF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="N8+ktV2F"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589474445; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=i5T+01NesX4JAdr1b1nGj/ncRYyzjRnXX+hWqJ5jSwg=;
 b=N8+ktV2FsTaggJBqig/poluOzdDNqe86ZEn4h1eUpbic+dmlo9QoMC/MZqLoa1dvGTAEv+v1
 cu2PrZuhxyhEFfQK87i696i4OhMmHfAOFLjj0FKsYYPVel3WEp1vmMJ3QYzqLea6YAC6S6HE
 h8zTQJHUMr0km3LJGMp7W8NhYco=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd7479.7fa94a00ad88-smtp-out-n03;
 Thu, 14 May 2020 16:40:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 703E9C433F2; Thu, 14 May 2020 16:40:24 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76FC6C433D2;
 Thu, 14 May 2020 16:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76FC6C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH v2 6/7] device-tree: bindings: sound: lpass-cpu: Add new
 compatible soc
Date: Thu, 14 May 2020 22:08:17 +0530
Message-Id: <1589474298-29437-7-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
References: <“1586592171-31644-1-git-send-email-ajitp@codeaurora.org”>
 <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <ajitp@codeaurora.org>
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

SC7180 soc variants of LPASS uses lpass-cpu node but required few extra
devictree configuration. Update bindings documents with sc7180 compatible
string specific dts properties.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 25 +++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index f2bcafc..5246d59 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
+      - qcom,lpass-cpu-sc7180
 
   reg:
     items:
@@ -66,6 +67,14 @@ properties:
     maxItems: 1
     description: Phandle for the audio DSP node
 
+  iommus:
+    maxItems: 1
+    description: Phandle to apps_smmu node with sid mask
+
+  power-domains:
+    maxItems: 1
+    description: Phandle for power domain node
+
   '#sound-dai-cells':
     const: 1
 
@@ -102,6 +111,17 @@ required:
 optional:
   - qcom,adsp
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,lpass-cpu-sc7180
+
+then:
+  required:
+    - iommus
+    - power-domains
+
 examples:
   lpass@28100000 {
 	compatible = "qcom,lpass-cpu";
@@ -114,7 +134,10 @@ examples:
 		      "mi2s-bit-clk";
 
 	interrupts = <0 85 1>;
-	interrupt-names = "lpass-irq-lpaif";
+        interrupt-names = "lpass-irq-lpaif";
+
+	iommus = <&apps_smmu 0x1020 0>;
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
 
 	reg = <0x28100000 0x10000>;
 	reg-names = "lpass-lpaif";
-- 
('The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project')
