Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F34CC006
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 15:33:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB5C1A60;
	Thu,  3 Mar 2022 15:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB5C1A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646317980;
	bh=1110rBC2opJCr+5YXXDq/cPW5YsDN3IIKftp9I25cGE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYEpvhCTzKbzOsN1WXpQUfMAB5QI4p61TkW4q+sCGwmNDmYttL1aV0s7eXjJjMjsQ
	 irvUQc5+GrHhPdFoLRIy5SI9aPZPaVHlk5SS/BHxGml1aNAnZ9xuOdyM90gYWMEihq
	 4csm/E1ghegiwVM524EKI34D5wjvuidsLGY9fNbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2851EF8051B;
	Thu,  3 Mar 2022 15:31:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7314F8051A; Thu,  3 Mar 2022 15:31:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2571DF80518
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 15:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2571DF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="BXCh+0AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646317890; x=1677853890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=1OEDCAILDJIzwlcYB3Ba5Zf8RYIgYUNs/PC/xso+VGU=;
 b=BXCh+0AJRVmfpspiFSaJAKMokF0MnOcxjMAjJQqFdktLLam17hZHUaOd
 pNib1cyQSocTfIJUkFMCYUwlADwuIBSj/s5mv5nMJjutlqhUgByEj4Rw1
 p9zEdDvBvQpKcJDICTRqIy+z4tQPPMgkrTKiXX4zg/SbfjsdsYLSMgtQY M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Mar 2022 06:31:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:31:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 06:31:22 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 06:31:15 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <sanyog.r.kale@intel.com>, <vkoul@kernel.org>
Subject: [RESEND v7 2/2] dt-bindings: soundwire: qcom: Add bindings for audio
 clock reset control property
Date: Thu, 3 Mar 2022 20:00:51 +0530
Message-ID: <1646317851-14414-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
References: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
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

Update description for audio clock reset control property, which is required
for latest chipsets, to allow rx, tx and wsa bus clock enabling in software
 control mode by configuring dynamic clock gating control registers.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index b93a2b3..32e156d 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -150,6 +150,18 @@ board specific bus parameters.
 		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
+- reset:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: Should specify the SoundWire audio CSR reset controller interface,
+		    which is required for SoundWire version 1.6.0 and above.
+
+- reset-names:
+	Usage: optional
+	Value type: <stringlist>
+	Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
+		    controller interface.
+
 Note:
 	More Information on detail of encoding of these fields can be
 found in MIPI Alliance SoundWire 1.0 Specifications.
@@ -168,6 +180,8 @@ soundwire: soundwire@c85 {
 	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
 	clocks = <&wcc>;
 	clock-names = "iface";
+	resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
+	reset-names = "swr_audio_cgcr";
 	#sound-dai-cells = <1>;
 	qcom,dports-type = <0>;
 	qcom,dout-ports	= <6>;
-- 
2.7.4

