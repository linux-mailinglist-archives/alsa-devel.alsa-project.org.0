Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A87125AE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:37:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBF4847;
	Fri, 26 May 2023 13:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBF4847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101036;
	bh=i+A1c7sTN7tccE3azVerCNLADNy0DE6Rphd7d7XW9EE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DxXzTKv7VW4ZdSy+7Sl5d7fxVj4IxbAqE6bdGLc/XYfAGUKjFkT2tsIA3QVhaz5oA
	 PUKVUaeK3HU/bi5TMA2w6mTBEDv1NYtKVKBY9B+ccwGgI+tOZJr5Pn8HLClDz+7HeR
	 1A3zBm3vjp9V8ZKPDaC3AzY+q5hVkcCuqMiFUjqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD04F805D6; Fri, 26 May 2023 13:34:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B32DF805C7;
	Fri, 26 May 2023 13:34:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B1C7F805C9; Fri, 26 May 2023 13:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38205F80589
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 13:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38205F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=bTkVwnEK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QAn7PR023720;
	Fri, 26 May 2023 11:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=+6wyrHYzVCKvqGjSOWtc9jd37WJGXs0UO6DvFprA+4w=;
 b=bTkVwnEKWCasKotmbtal/8dHkya8hqGRhK8XlXPrAZfNq/7wrOv3RYN4VrJzJ32gLLXE
 i/dXdJjh1ZNFXyHX02DP5PQ2/6MCZBC+qTtxDtPbLpz87AvXJlFGXBg4d7MfIE8BiY4m
 IfITfLUNYIZhXeYnPt5wl3Gvg98CekVg5Fw0ysOt+8X8hEdUMO8awOMctUBnQMItlg2w
 sPfbdVczTv0UUZAT6II+U86l9VrZrJtIaFj5LfAVP7+eSgsUgEY9GmyZQGYWpy0Rk5s9
 RCllxk27fJXDFmYsZ2YF8mO4fAf/fJvLMkpti49CabD0N24yKzRDVbwU3+ytpR/hr98s 8A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qt5uftsw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:34:13 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 34QBXitV016397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:33:44 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 26 May 2023 04:33:38 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <vkoul@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <dianders@chromium.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, <alsa-devel@alsa-project.org>,
        <quic_rjendra@quicinc.com>, <konrad.dybcio@somainline.org>,
        <mka@chromium.org>, <quic_visr@quicinc.com>
CC: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Mohammad Rafi Shaik
	<quic_mohs@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 3/8] arm64: dts: qcom: sc7280: Extract audio nodes from
 common idp dtsi file
Date: Fri, 26 May 2023 17:02:53 +0530
Message-ID: <20230526113258.1467276-4-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526113258.1467276-1-quic_mohs@quicinc.com>
References: <20230526113258.1467276-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YG9tBl5jwQ9-UGV4g1G3irwEMzmG18br
X-Proofpoint-GUID: YG9tBl5jwQ9-UGV4g1G3irwEMzmG18br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305260099
Message-ID-Hash: MIZCQZSDI5AQXYLZHIYEV34R2I2SFGHC
X-Message-ID-Hash: MIZCQZSDI5AQXYLZHIYEV34R2I2SFGHC
X-MailFrom: quic_mohs@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIZCQZSDI5AQXYLZHIYEV34R2I2SFGHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

Split common idp dtsi file into audio specific dtsi and common
idp dtsi file.

It is required to isolate idp and crd-rev3 platform device tree nodes
and convert crd-rev3 platform device tree nodes into audioreach specific
device tree nodes.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm64/boot/dts/qcom/sc7280-audio-idp.dtsi | 131 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts    |   1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      | 122 ----------------
 3 files changed, 132 insertions(+), 122 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi
new file mode 100644
index 000000000000..994a13325477
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * sc7280 Audio IDP board device tree source (common between SKU1 and SKU2)
+ *
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+/{
+	/* BOARD-SPECIFIC TOP LEVEL NODES */
+	sound: sound {
+		compatible = "google,sc7280-herobrine";
+		model = "sc7280-wcd938x-max98360a-1mic";
+
+		audio-routing =
+			"IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC1", "MIC BIAS1",
+			"AMIC2", "MIC BIAS2",
+			"VA DMIC0", "MIC BIAS3",
+			"VA DMIC1", "MIC BIAS3",
+			"VA DMIC2", "MIC BIAS1",
+			"VA DMIC3", "MIC BIAS1",
+			"TX SWR_ADC0", "ADC1_OUTPUT",
+			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_ADC2", "ADC3_OUTPUT",
+			"TX SWR_DMIC0", "DMIC1_OUTPUT",
+			"TX SWR_DMIC1", "DMIC2_OUTPUT",
+			"TX SWR_DMIC2", "DMIC3_OUTPUT",
+			"TX SWR_DMIC3", "DMIC4_OUTPUT",
+			"TX SWR_DMIC4", "DMIC5_OUTPUT",
+			"TX SWR_DMIC5", "DMIC6_OUTPUT",
+			"TX SWR_DMIC6", "DMIC7_OUTPUT",
+			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			link-name = "MAX98360A";
+			reg = <0>;
+
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_SECONDARY>;
+			};
+
+			codec {
+				sound-dai = <&max98360a>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "DisplayPort";
+			reg = <1>;
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_DP_RX>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp>;
+			};
+		};
+
+		dai-link@2 {
+			link-name = "WCD9385 Playback";
+			reg = <2>;
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_CDC_DMA_RX0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9385 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+			};
+		};
+
+		dai-link@3 {
+			link-name = "WCD9385 Capture";
+			reg = <3>;
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_CDC_DMA_TX3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9385 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+			};
+		};
+
+		dai-link@4 {
+			link-name = "DMIC";
+			reg = <4>;
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_va_macro 0>;
+			};
+		};
+	};
+};
+
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mi2s1_data0>, <&mi2s1_sclk>, <&mi2s1_ws>;
+
+	dai-link@1 {
+		reg = <MI2S_SECONDARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+
+	dai-link@5 {
+		reg = <LPASS_DP_RX>;
+	};
+
+	dai-link@6 {
+		reg = <LPASS_CDC_DMA_RX0>;
+	};
+
+	dai-link@19 {
+		reg = <LPASS_CDC_DMA_TX3>;
+	};
+
+	dai-link@25 {
+		reg = <LPASS_CDC_DMA_VA_TX0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
index afae7f46b050..15f7f26b80cd 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-idp.dtsi"
+#include "sc7280-audio-idp.dtsi"
 #include "sc7280-idp-ec-h1.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index c6dc200c00ce..c09ee1b93511 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -87,100 +87,6 @@ nvme_3v3_regulator: nvme-3v3-regulator {
 		pinctrl-names = "default";
 		pinctrl-0 = <&nvme_pwren>;
 	};
-
-	sound: sound {
-		compatible = "google,sc7280-herobrine";
-		model = "sc7280-wcd938x-max98360a-1mic";
-
-		audio-routing =
-			"IN1_HPHL", "HPHL_OUT",
-			"IN2_HPHR", "HPHR_OUT",
-			"AMIC1", "MIC BIAS1",
-			"AMIC2", "MIC BIAS2",
-			"VA DMIC0", "MIC BIAS3",
-			"VA DMIC1", "MIC BIAS3",
-			"VA DMIC2", "MIC BIAS1",
-			"VA DMIC3", "MIC BIAS1",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dai-link@0 {
-			link-name = "MAX98360A";
-			reg = <0>;
-
-			cpu {
-				sound-dai = <&lpass_cpu MI2S_SECONDARY>;
-			};
-
-			codec {
-				sound-dai = <&max98360a>;
-			};
-		};
-
-		dai-link@1 {
-			link-name = "DisplayPort";
-			reg = <1>;
-
-			cpu {
-				sound-dai = <&lpass_cpu LPASS_DP_RX>;
-			};
-
-			codec {
-				sound-dai = <&mdss_dp>;
-			};
-		};
-
-		dai-link@2 {
-			link-name = "WCD9385 Playback";
-			reg = <2>;
-
-			cpu {
-				sound-dai = <&lpass_cpu LPASS_CDC_DMA_RX0>;
-			};
-
-			codec {
-				sound-dai = <&wcd9385 0>, <&swr0 0>, <&lpass_rx_macro 0>;
-			};
-		};
-
-		dai-link@3 {
-			link-name = "WCD9385 Capture";
-			reg = <3>;
-
-			cpu {
-				sound-dai = <&lpass_cpu LPASS_CDC_DMA_TX3>;
-			};
-
-			codec {
-				sound-dai = <&wcd9385 1>, <&swr1 0>, <&lpass_tx_macro 0>;
-			};
-		};
-
-		dai-link@4 {
-			link-name = "DMIC";
-			reg = <4>;
-
-			cpu {
-				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
-			};
-
-			codec {
-				sound-dai = <&lpass_va_macro 0>;
-			};
-		};
-	};
 };
 
 &apps_rsc {
@@ -373,34 +279,6 @@ &gpi_dma1 {
 	status = "okay";
 };
 
-&lpass_cpu {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&mi2s1_data0>, <&mi2s1_sclk>, <&mi2s1_ws>;
-
-	dai-link@1 {
-		reg = <MI2S_SECONDARY>;
-		qcom,playback-sd-lines = <0>;
-	};
-
-	dai-link@5 {
-		reg = <LPASS_DP_RX>;
-	};
-
-	dai-link@6 {
-		reg = <LPASS_CDC_DMA_RX0>;
-	};
-
-	dai-link@19 {
-		reg = <LPASS_CDC_DMA_TX3>;
-	};
-
-	dai-link@25 {
-		reg = <LPASS_CDC_DMA_VA_TX0>;
-	};
-};
-
 &lpass_rx_macro {
 	status = "okay";
 };
-- 
2.25.1

