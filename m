Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE862B6A5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 10:34:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50BB1DA;
	Wed, 16 Nov 2022 10:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50BB1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668591274;
	bh=vAeR7ryPgT2rwbPtvD8NYM7ovo68MIgPLMuJJ8LOLvw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LkOpTKoPs6zrFtFh5ulPDD5hbBqBlSMJJj/lrIgwOfqTVa0sJd2DpOerojvdLw0Wb
	 br3/TDRNffJX+nlaVG1aIeDeyc02VmAyB6u/PR4PfT6o+7EuhItrByCny5NoFUGdxc
	 GiwakLoscAsb62CbEpiJC1ZbqCq8YZIAi4bn1Qo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE26F800B8;
	Wed, 16 Nov 2022 10:33:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B6EF80169; Wed, 16 Nov 2022 10:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 577E4F80089
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 10:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 577E4F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="UZQCL49b"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AG5tRVP007337; Wed, 16 Nov 2022 09:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=nw66B9LNbqDj5SmgApOL3AqR2/tJYCQvQbYXi6fcGAc=;
 b=UZQCL49bV0txTZneGapgij4YjI6o8VKRvtszyhsCKINKEKgyqBE5kUUnNGaVO5/meGAJ
 PACW33VaSe8iJ1DhJp0lXovn4miF4qDglALHKW1uMYOef6g9ffyHBcXxhk+6ocqGpm9l
 DmFTMKKiGHHp+wjD433cSndzS6cs8GoY4XiXjrBwzb12c5wI1srXLWOummnGDbVcEfy6
 XRU+tpZaATPlGFV07IWelrQGBD2UddCX2I0Ru6AviY7QeNBmlBHm4iwLI6aQ+oMh7b52
 oA6h1DJno9CZWmiRkpygcDp8G0mMEnzWWzXPKY+SVcWPIvpt+NTKNsBPHXOKBsOSWAJj fA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvt508kgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 09:33:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AG9XRKc006715
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 09:33:27 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 16 Nov 2022 01:33:20 -0800
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
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Remove unused sleep pin control
 nodes
Date: Wed, 16 Nov 2022 15:03:04 +0530
Message-ID: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: plkx8DxGqjsQB5fVCjO3-WOqBp6h9Wmr
X-Proofpoint-GUID: plkx8DxGqjsQB5fVCjO3-WOqBp6h9Wmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160066
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Remove unused and redundant sleep pin control entries as they are
not referenced anywhere in sc7280 based platform's device tree variants.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
Chnges Since v1:
    -- Update subject prefixes and commit message.

 .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |  8 -----
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 20 -----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 20 -----------
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 40 ----------------------
 4 files changed, 88 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
index cf34334..1ca11a1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
@@ -148,10 +148,6 @@ hp_i2c: &i2c2 {
 	bias-disable;
 };
 
-&lpass_dmic01_clk_sleep {
-	drive-strength = <2>;
-};
-
 &lpass_dmic01_data {
 	bias-pull-down;
 };
@@ -161,10 +157,6 @@ hp_i2c: &i2c2 {
 	bias-disable;
 };
 
-&lpass_dmic23_clk_sleep {
-	drive-strength = <2>;
-};
-
 &lpass_dmic23_data {
 	bias-pull-down;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
index c72e53a..ae25520 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
@@ -167,10 +167,6 @@
 	bias-disable;
 };
 
-&lpass_dmic01_clk_sleep {
-	drive-strength = <2>;
-};
-
 &lpass_dmic01_data {
 	bias-pull-down;
 };
@@ -180,10 +176,6 @@
 	bias-disable;
 };
 
-&lpass_dmic23_clk_sleep {
-	drive-strength = <2>;
-};
-
 &lpass_dmic23_data {
 	bias-pull-down;
 };
@@ -194,30 +186,18 @@
 	bias-disable;
 };
 
-&lpass_rx_swr_clk_sleep {
-	bias-pull-down;
-};
-
 &lpass_rx_swr_data {
 	drive-strength = <2>;
 	slew-rate = <1>;
 	bias-bus-hold;
 };
 
-&lpass_rx_swr_data_sleep {
-	bias-pull-down;
-};
-
 &lpass_tx_swr_clk {
 	drive-strength = <2>;
 	slew-rate = <1>;
 	bias-disable;
 };
 
-&lpass_tx_swr_clk_sleep {
-	bias-pull-down;
-};
-
 &lpass_tx_swr_data {
 	drive-strength = <2>;
 	slew-rate = <1>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8ca2281..f7efb99 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -576,10 +576,6 @@
 	bias-disable;
 };
 
-&lpass_dmic01_clk_sleep {
-	drive-strength = <2>;
-};
-
 &lpass_dmic01_data {
 	bias-pull-down;
 };
@@ -589,10 +585,6 @@
 	bias-disable;
 };
 
-&lpass_dmic23_clk_sleep {
-	drive-strength = <2>;
-};
-
 &lpass_dmic23_data {
 	bias-pull-down;
 };
@@ -603,30 +595,18 @@
 	bias-disable;
 };
 
-&lpass_rx_swr_clk_sleep {
-	bias-pull-down;
-};
-
 &lpass_rx_swr_data {
 	drive-strength = <2>;
 	slew-rate = <1>;
 	bias-bus-hold;
 };
 
-&lpass_rx_swr_data_sleep {
-	bias-pull-down;
-};
-
 &lpass_tx_swr_clk {
 	drive-strength = <2>;
 	slew-rate = <1>;
 	bias-disable;
 };
 
-&lpass_tx_swr_clk_sleep {
-	bias-pull-down;
-};
-
 &lpass_tx_swr_data {
 	drive-strength = <2>;
 	slew-rate = <1>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 448879d..4970864 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2483,80 +2483,40 @@
 				function = "dmic1_clk";
 			};
 
-			lpass_dmic01_clk_sleep: dmic01-clk-sleep-state {
-				pins = "gpio6";
-				function = "dmic1_clk";
-			};
-
 			lpass_dmic01_data: dmic01-data-state {
 				pins = "gpio7";
 				function = "dmic1_data";
 			};
 
-			lpass_dmic01_data_sleep: dmic01-data-sleep-state {
-				pins = "gpio7";
-				function = "dmic1_data";
-			};
-
 			lpass_dmic23_clk: dmic23-clk-state {
 				pins = "gpio8";
 				function = "dmic2_clk";
 			};
 
-			lpass_dmic23_clk_sleep: dmic23-clk-sleep-state {
-				pins = "gpio8";
-				function = "dmic2_clk";
-			};
-
 			lpass_dmic23_data: dmic23-data-state {
 				pins = "gpio9";
 				function = "dmic2_data";
 			};
 
-			lpass_dmic23_data_sleep: dmic23-data-sleep-state {
-				pins = "gpio9";
-				function = "dmic2_data";
-			};
-
 			lpass_rx_swr_clk: rx-swr-clk-state {
 				pins = "gpio3";
 				function = "swr_rx_clk";
 			};
 
-			lpass_rx_swr_clk_sleep: rx-swr-clk-sleep-state {
-				pins = "gpio3";
-				function = "swr_rx_clk";
-			};
-
 			lpass_rx_swr_data: rx-swr-data-state {
 				pins = "gpio4", "gpio5";
 				function = "swr_rx_data";
 			};
 
-			lpass_rx_swr_data_sleep: rx-swr-data-sleep-state {
-				pins = "gpio4", "gpio5";
-				function = "swr_rx_data";
-			};
-
 			lpass_tx_swr_clk: tx-swr-clk-state {
 				pins = "gpio0";
 				function = "swr_tx_clk";
 			};
 
-			lpass_tx_swr_clk_sleep: tx-swr-clk-sleep-state {
-				pins = "gpio0";
-				function = "swr_tx_clk";
-			};
-
 			lpass_tx_swr_data: tx-swr-data-state {
 				pins = "gpio1", "gpio2", "gpio14";
 				function = "swr_tx_data";
 			};
-
-			lpass_tx_swr_data_sleep: tx-swr-data-sleep-state {
-				pins = "gpio1", "gpio2", "gpio14";
-				function = "swr_tx_data";
-			};
 		};
 
 		gpu: gpu@3d00000 {
-- 
2.7.4

