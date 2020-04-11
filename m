Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C81A752F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:50:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6697016A8;
	Tue, 14 Apr 2020 09:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6697016A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850630;
	bh=Ly6GyzOS21YKoRiNGPxinmTHsrHqHxJEX/JZJ3eqoi8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7XeejSeIq7gzew6vgcuE/rDOBQOxIeFeiIL4LvOOcaFIaCssFYga/UpgbgcJVtAZ
	 wEKhmxFkhk5S3+poubf/hyVorTVpeJpkbcx4TV+8V8qIt7HMXCQjTay1aF7fgVxg3W
	 hfugASDSauRjx/H3ifO9IlT57iB+Q7mBY/aZyeZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC769F802FB;
	Tue, 14 Apr 2020 09:42:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45A18F801DA; Sat, 11 Apr 2020 10:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D438FF800B9
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 10:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D438FF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="tn6HNak1"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586592278; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CGSSIIgOQonIzRJ2aP9akavKHcdXJYuY2r+uW6Fff4s=;
 b=tn6HNak1VPeBxIfTi5dm/ZQ7JNhW2lzLRSxJjY1kccQPQH4tI4LDSVb3kNc8IcpMAyQVRZwK
 abwLk6r9B1zVFYG11j6LAtgOxVRLNhgbEhMV8SZTm3PazRUtCEATlVmr50HMvUOZI7Q4qMI1
 mG6SuuFY9sV7hV2bte7Wd8qJm6U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e917a14.7f0504ab22d0-smtp-out-n05;
 Sat, 11 Apr 2020 08:04:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AEFD3C432C2; Sat, 11 Apr 2020 08:04:35 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F031EC43636;
 Sat, 11 Apr 2020 08:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F031EC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 devicetree@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH 09/11] device-tree: bindings: sound: lpass-cpu: Add new
 compatible soc
Date: Sat, 11 Apr 2020 13:32:49 +0530
Message-Id: <1586592171-31644-10-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:47 +0200
Cc: Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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

SC7180 soc varaints of LPASS uses lpass-cpu node but required few extra
devictree configuration. Update bindings documents with sc7180 compatible
string specific dts properties.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 25 +++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 727ec03..84bd95c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - qcom,lpass-cpu
       - qcom,apq8016-lpass-cpu
+      - qcom,lpass-cpu-sc7180
 
   reg:
     items:
@@ -68,6 +69,14 @@ properties:
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
 
@@ -108,6 +117,17 @@ required:
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
@@ -120,7 +140,10 @@ examples:
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
1.9.1
