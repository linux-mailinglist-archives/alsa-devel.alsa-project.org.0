Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7A229668
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 12:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0251666;
	Wed, 22 Jul 2020 12:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0251666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595414420;
	bh=Z5REv/MLy92sNCQDGDPycuLo8rWnk+GY0qJV7T9cvYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDGaZmyWwdEM/qkGdxc/PymCw7xOprYgS87S6F5dj3p9cXG0WC2esUzZXursQbObp
	 eZLdulQ9wef3mTkFW7RS6YAkzDO+Kc4C4jBSGmCq6OSu4LBcKNVhBb3BkATuo480wK
	 +VDlI6Zr+TNsVlptLVFPOjKl4K979rQhXUSwucj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CACDCF80161;
	Wed, 22 Jul 2020 12:34:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9294F8032A; Wed, 22 Jul 2020 12:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3BAAF8014C
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 12:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3BAAF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Nv1C/g25"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595414091; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4ZcJZRqgWj+6QIY6hkUHcRQ09IHCpYWQan00993+llo=;
 b=Nv1C/g25KqEN/M/NE5goEapwop2IotWMHviteCiUP9mXrRiw2cJKn9FCk9Vqt/3jwv6TyO80
 JVyJczBNQpKN1UZ7z7Evzohg9wAvRIC24EKUwmsVL+eLJrOgmCKhInzJ0SgYDiKv8KZs1Vyb
 Q4E+2wlk3lKBS791v+lHgcvRQxA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f1815ec65270fa595c90103 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:33:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DC581C433AD; Wed, 22 Jul 2020 10:33:15 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F322DC43395;
 Wed, 22 Jul 2020 10:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F322DC43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/12] dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu
 node
Date: Wed, 22 Jul 2020 16:01:50 +0530
Message-Id: <1595413915-17867-8-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
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

Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 55 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
index 32c2cdb..c21392e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
@@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
 
 Required properties:
 
-- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
+- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
+			  "qcom,lpass-cpu-sc7180"
 - clocks		: Must contain an entry for each entry in clock-names.
 - clock-names		: A list which must include the following entries:
 				* "ahbix-clk"
@@ -18,6 +19,13 @@ Required properties:
 				* "mi2s-bit-clk3"
 				* "pcnoc-mport-clk"
 				* "pcnoc-sway-clk"
+			: required clocks for "qcom,lpass-cpu-sc7180"
+				* "audio-core"
+				* "mclk0"
+				* "mi2s-bit-clk0"
+				* "mi2s-bit-clk1"
+				* "pcnoc-sway-clk"
+				* "pcnoc-mport-clk"
 
 - interrupts		: Must contain an entry for each entry in
 			  interrupt-names.
@@ -53,7 +61,8 @@ Required properties for each DAI (represented by a subnode):
 Note that adding a subnode changes the default to "no lines configured",
 so both playback and capture lines should be configured when a subnode is added.
 
-Example:
+Examples:
+1)
 
 lpass@28100000 {
 	compatible = "qcom,lpass-cpu";
@@ -77,3 +86,45 @@ lpass@28100000 {
 		qcom,playback-sd-lines = <0 1>;
 	};
 };
+
+2)
+
+#include <dt-bindings/sound/sc7180-lpass.h>
+
+lpass_cpu: lpass {
+	compatible = "qcom,lpass-cpu-sc7180";
+
+	reg = <0 0x62F00000 0 0x29000>;
+
+	iommus = <&apps_smmu 0x1020 0>;
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
+	clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
+		<&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
+		<&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
+		<&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
+		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
+		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
+	clock-names = "pcnoc-sway-clk", "audio-core",
+			"mclk0", "pcnoc-mport-clk",
+			"mi2s-bit-clk0", "mi2s-bit-clk1";
+	interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "lpass-irq-lpaif";
+
+
+	#sound-dai-cells = <1>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mi2s-primary@0 {
+		reg = <MI2S_PRIMARY>;
+		qcom,playback-sd-lines = <1>;
+		qcom,capture-sd-lines = <0>;
+	};
+
+	mi2s-secondary@1 {
+		reg = <MI2S_SECONDARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+};
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

