Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CED61F5BC
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 15:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08CF1846;
	Mon,  7 Nov 2022 15:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08CF1846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667830960;
	bh=jl6kj3nECoxUrDh1UoLs1jcRUbywpTGZTkir/ofntiI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KrmrFb6yQLapCv3bt1ofLExGaJx5mdareVuidG0P4y41KEMQ2DqcPDfWckmHX/+jI
	 Lh3UPqFGf+2fuuU/GvmnWW21mLMsLNGVDaF1gcQukgbW2fA1+3R3UXWmNJVfbDmgWc
	 ekczYIYZSEedecQctCXJJcsurWUkewRxRw1LySt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DCE4F80559;
	Mon,  7 Nov 2022 15:21:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FB06F80557; Mon,  7 Nov 2022 15:21:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DE4CF800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 15:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DE4CF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="bsA5ulXh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A7DCSYx021408; Mon, 7 Nov 2022 14:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=64yrA0MFI+I3ReF7t3xHJrRC1266LTxGMAjG3bINsoU=;
 b=bsA5ulXhuMzA8W93EL2EJoJkyzG1TJ9pwHpk0oggzXlNki7KWbsSuRUrutTXJ77QrtSS
 xI5Clj8W8K/h/O224UsSCUUmxh37A6l0wGOB3VlfQm4gZFVP6PQWfQw3PEm2dpFwtJkI
 DjYcwjyF4rbutj7Ajxcl9HoCoMgbte8dVsr1HZm9hJtKgGwBdICgennf0P2b0y0hL8Gv
 agIuHs/3QhKqhGG9Io4G4WNJsOdlCv9vbuHS3RYZzH0LWW/DEGIWUpFk++G2d3Sskf3k
 LRpMpOCKDSFBqzPX1aX7AknXyT6RHdkaqV4pm2ycSaG0LV76BN9UiU8nQorgEKMkvW2v 4Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kphq2sjqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 14:21:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A7ELDb2006803
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Nov 2022 14:21:13 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 7 Nov 2022 06:21:07 -0800
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
Subject: [PATCH v4 1/3] arm64: dts: qcom: Update soundwire slave node names
Date: Mon, 7 Nov 2022 19:50:42 +0530
Message-ID: <1667830844-31566-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1667830844-31566-1-git-send-email-quic_srivasam@quicinc.com>
References: <1667830844-31566-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lwunYqq90vrH5HBjEewAoWCa86hP3rZ1
X-Proofpoint-ORIG-GUID: lwunYqq90vrH5HBjEewAoWCa86hP3rZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_06,2022-11-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211070115
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>,
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

Update soundwire slave nodes of WSA speaker to match with
dt-bindings pattern properties regular expression.

This modifiction is required to avoid dtbs-check errors
occurred with qcom,soundwire.yaml.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 4 ++--
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts              | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 2c08500..983e8a9 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1007,7 +1007,7 @@
 };
 
 &swr0 {
-	left_spkr: wsa8810-left {
+	left_spkr: wsa8810@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
 		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
@@ -1016,7 +1016,7 @@
 		#sound-dai-cells = <0>;
 	};
 
-	right_spkr: wsa8810-right {
+	right_spkr: wsa8810@0,4 {
 		compatible = "sdw10217211000";
 		reg = <0 4>;
 		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 8ba3188..8fbf5d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1091,7 +1091,7 @@
 	vdd-io-supply = <&vreg_s4a_1p8>;
 
 	swm: swm@c85 {
-		left_spkr: wsa8810-left {
+		left_spkr: wsa8810@0,1 {
 			compatible = "sdw10217201000";
 			reg = <0 1>;
 			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
@@ -1100,7 +1100,7 @@
 			#sound-dai-cells = <0>;
 		};
 
-		right_spkr: wsa8810-right {
+		right_spkr: wsa8810@0,2 {
 			compatible = "sdw10217201000";
 			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
 			reg = <0 2>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 0c375ec..bb8dec9 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -785,7 +785,7 @@
 	qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
 
 	swm: swm@c85 {
-		left_spkr: wsa8810-left {
+		left_spkr: wsa8810@0,3 {
 			compatible = "sdw10217211000";
 			reg = <0 3>;
 			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
@@ -794,7 +794,7 @@
 			#sound-dai-cells = <0>;
 		};
 
-		right_spkr: wsa8810-right {
+		right_spkr: wsa8810@0,4 {
 			compatible = "sdw10217211000";
 			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
 			reg = <0 4>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index f93d748..225d233 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -717,7 +717,7 @@
 	qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
 
 	swm: swm@c85 {
-		left_spkr: wsa8810-left {
+		left_spkr: wsa8810@0,3 {
 			compatible = "sdw10217211000";
 			reg = <0 3>;
 			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
@@ -726,7 +726,7 @@
 			#sound-dai-cells = <0>;
 		};
 
-		right_spkr: wsa8810-right {
+		right_spkr: wsa8810@0,4 {
 			compatible = "sdw10217211000";
 			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
 			reg = <0 4>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 9db6136..0d026c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -757,7 +757,7 @@
 };
 
 &swr0 {
-	left_spkr: wsa8810-right@0,3{
+	left_spkr: wsa8810@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
 		powerdown-gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;
@@ -766,7 +766,7 @@
 		#sound-dai-cells = <0>;
 	};
 
-	right_spkr: wsa8810-left@0,4{
+	right_spkr: wsa8810@0,4 {
 		compatible = "sdw10217211000";
 		reg = <0 4>;
 		powerdown-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
-- 
2.7.4

