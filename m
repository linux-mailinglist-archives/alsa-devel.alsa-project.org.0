Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4227125A1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:35:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213B03E8;
	Fri, 26 May 2023 13:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213B03E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685100931;
	bh=hYtBjRprnluv037txRusj8RIZOoOFpSW3X2qzC3KqlA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GuFvrIT+P7/zmqFPqBahOZf3/Qyzwjj7QtwwZiezY3nTV1vqegEm0AxvODizg8juA
	 Qyquk5EN3H4Jjyv9lKjHxTYgq/iUUhwqaY/QuEKhkJoEspol/QKDg3FoEG6c2tM5/e
	 hiHtl/a0bD5/RXqnJh6tdz65PWciRDk8tVqWdzf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1943EF8055A; Fri, 26 May 2023 13:33:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94755F8016A;
	Fri, 26 May 2023 13:33:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60200F80249; Fri, 26 May 2023 13:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1315FF8001F
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 13:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1315FF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=HmxLSTvc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QAcdW7022383;
	Fri, 26 May 2023 11:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=gIfIqZ+aDP5nnGyN2ziderawqXsVXDG1RnA8Nts8Kiw=;
 b=HmxLSTvcQJOZA3KJIBy9De1JKSTIc9G2S/mTaqTfAuhtqKJlGexHWJ0nTaP6RBRovsIn
 CvR3uSldd58ivuR1WizCiNQC2l4ETGogjNLWRr6vvgTWOQpvnVhXHZ0KhI5rbehOPdBP
 Ug0dW9oGbzuQmYjAEkeXdKNmDG2C6icFVNgQmTJ4oEqsRmMngnFz32TI624mWkmHkYSr
 hyoB/6Auna3gX308+jXwsEBxc4CvIz0FzTtpvMOF+AwwgtwV6MesPKFGdwjzJIRdp4or
 jU75q5RStp2jEdswIfA5nZg1QpDuxMStICjagj7idAwKK5LcE0QQsP1Rykr8gIJnxT2I YQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qtu0u03u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:33:34 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 34QBXWCY010432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:33:32 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 26 May 2023 04:33:26 -0700
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
	<quic_mohs@quicinc.com>
Subject: [PATCH v6 1/8] arm64: dts: qcom: sc7280: Modify lpasscc node name
Date: Fri, 26 May 2023 17:02:51 +0530
Message-ID: <20230526113258.1467276-2-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fUAnUcO4qMkB1gEwjXookHHQdOhDmICH
X-Proofpoint-GUID: fUAnUcO4qMkB1gEwjXookHHQdOhDmICH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=934
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305260098
Message-ID-Hash: KUOFBL3IWNWYYF5ESBNLJOZ53IJ2N3YS
X-Message-ID-Hash: KUOFBL3IWNWYYF5ESBNLJOZ53IJ2N3YS
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

Modify lpasscc clock controller node name to generic name,
that is from lpasscc to clock-controller.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 31728f461422..270618521638 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2237,7 +2237,7 @@ tcsr_2: syscon@1fc0000 {
 			reg = <0 0x01fc0000 0 0x30000>;
 		};
 
-		lpasscc: lpasscc@3000000 {
+		lpasscc: clock-controller@3000000 {
 			compatible = "qcom,sc7280-lpasscc";
 			reg = <0 0x03000000 0 0x40>,
 			      <0 0x03c04000 0 0x4>;
-- 
2.25.1

