Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23453673884
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 13:29:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED9BE7FE8;
	Thu, 19 Jan 2023 13:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED9BE7FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674131398;
	bh=5oQ53OOlLJHI70WjTJB4D0p8YuW6Hy9eXAs2NnH2BPw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZpTJ51r7NAoch27JkjGyjJP/M57LHhrlMilpwYpOhn1y2thCMqlUZp+DyvEZGK7HS
	 iQIvaCSksiLbaY/UspZdacSfTAVbXtEgiE95SD2hZbUP4Y9po8RFTAHNJC5t9ugKCN
	 VrQdLs4mOW/8MMuwlouJNP2SrkoFNzMk+70w0UQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45ED4F80578;
	Thu, 19 Jan 2023 13:28:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23F25F80571; Thu, 19 Jan 2023 13:27:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDA45F8055C
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 13:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDA45F8055C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=W2vvdNHm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30J9UjeB030239; Thu, 19 Jan 2023 12:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=qqV5HrPtcHyfAGwEJyOdWbbki4XqJCe7+YjrWyhnoBs=;
 b=W2vvdNHmipeUqSUioxs88SAWlKKX8wdOAHv134BPoltl/MsJH8LxKsI4/qGlefyTURSe
 ZfTA1jtvU4pObyhTLx+ta6t6ldI9uVRfqm86y0yzVeG5h+1+drwQXa1l8ZKDYJPqEHhX
 L4IUx14RrjTWd00P/KQDGW/Vsxj+Rzk1cOtMpQgGMs+1qBg+udrF93//VqHxXaFxMN4o
 IoxaAK3arXwXEeKlyeY2tXllY4JT1uitbksTGhmeOc3X+rYxBk8bVFyFsOVJZsOBpMTv
 sWa7sO3+1ra4pTvbWjo9Oxk66NnfM8VjWa5SI6jrUylVQDUmg0O6SKWuWzQjIARQT9ct eg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6xkth8r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 12:27:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30JCRsMC007259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 12:27:54 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:27:48 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <vkoul@kernel.org>, <agross@kernel.org>, <andersson@kernel.org>,
 <robh+dt@kernel.org>, <broonie@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
 <dianders@chromium.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <alsa-devel@alsa-project.org>,
 <quic_rjendra@quicinc.com>, <konrad.dybcio@somainline.org>,
 <mka@chromium.org>
Subject: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Update VA/RX/TX macro clock
 nodes
Date: Thu, 19 Jan 2023 17:57:04 +0530
Message-ID: <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BxusQYJqDNQ-S4Mj4BwzR9exszHAPVWt
X-Proofpoint-GUID: BxusQYJqDNQ-S4Mj4BwzR9exszHAPVWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301190098
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Update VA, RX and TX macro and lpass_tlmm clock properties and
enable them.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
index 81e0f3a..674b01a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
@@ -8,8 +8,67 @@
 
 #include <dt-bindings/sound/qcom,q6afe.h>
 
+/delete-node/ &lpass_rx_macro;
+/delete-node/ &lpass_tx_macro;
+/delete-node/ &lpass_va_macro;
+
 /{
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
+	lpass_rx_macro: codec@3200000 {
+		compatible = "qcom,sc7280-lpass-rx-macro";
+		reg = <0 0x03200000 0 0x1000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&lpass_va_macro>;
+
+		clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+		#clock-cells = <0>;
+		#sound-dai-cells = <1>;
+	};
+
+	lpass_tx_macro: codec@3220000 {
+		compatible = "qcom,sc7280-lpass-tx-macro";
+		reg = <0 0x03220000 0 0x1000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&lpass_va_macro>;
+
+		clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+		#clock-cells = <0>;
+		#sound-dai-cells = <1>;
+	};
+
+	lpass_va_macro: codec@3370000 {
+		compatible = "qcom,sc7280-lpass-va-macro";
+		reg = <0 0x03370000 0 0x1000>;
+
+		pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+		clock-names = "mclk", "macro", "dcodec";
+
+		#clock-cells = <0>;
+		#sound-dai-cells = <1>;
+	};
+
 	sound: sound {
 		compatible = "google,sc7280-herobrine";
 		model = "SC7280-AUDIOREACH";
-- 
2.7.4

