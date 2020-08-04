Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8F823B692
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 10:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330291662;
	Tue,  4 Aug 2020 10:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330291662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596528846;
	bh=AreLftsLiSJefTuNbyVtOof0KsAUajYy8jiVFG3W7PY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFOEuvLUw58V8mmKMG59+x7J+8UDxOEymq50xaHB1DEvLFOakZp9rmZAQ40fGwCJC
	 wg5HQ1FvvfVsLVDIDosSauCmJy+z4hoouHS+1i+6Fmzmgr1PrxJhAmVkXn3mNPCg5N
	 BY9YkNw3Qc/KYHRBz9QJrQqMKlmLNhHOGHDYrsJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5627AF80316;
	Tue,  4 Aug 2020 10:09:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 460C3F80317; Tue,  4 Aug 2020 10:09:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D0F2F802EA
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 10:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D0F2F802EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="CDitBotR"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596528537; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wzkE1gcsoctw3hiDqTWdfJ/SEs/ShA6LmWUp5yuAKJA=;
 b=CDitBotRj+CRHsdxlAtV3lN2TZ6wkan/8+YnBCxpG7XlHmkDLCQQk25FUBmaektooKYn++Ze
 i6mCXYNW4Xle7af94RAjVtYAe+PywHXDqwaQKgYdggDQHw6qB9O2vLErC6aFJ6/YgLzhe3F/
 Ra/hv4hKMW+NiNkjEq0THsQLkkQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f29178c9c7be6b4a5819b06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 08:08:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 27097C433CB; Tue,  4 Aug 2020 08:08:43 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCCDFC433CB;
 Tue,  4 Aug 2020 08:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCCDFC433CB
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
Subject: [PATCH v5 07/12] dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu
 node
Date: Tue,  4 Aug 2020 13:37:28 +0530
Message-Id: <1596528453-11437-8-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
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
index 32c2cdb..c07202c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
@@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
 
 Required properties:
 
-- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
+- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
+			  "qcom,sc7180-lpass-cpu"
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
+	compatible = "qcom,sc7180-lpass-cpu";
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

