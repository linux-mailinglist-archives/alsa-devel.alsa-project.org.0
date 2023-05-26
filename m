Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A227125A7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7559852;
	Fri, 26 May 2023 13:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7559852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685100988;
	bh=aRRvIgcaeCp6y73HG8PXOSnJGZqWh+9i+p9O+abSGDs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QrkZ49nUgR9I0YkZEpFLePKmSmvqKFbzz7j67ubE1wn6pihlWu9fFi862zSNTot4y
	 rBslp19/iTSfZNw6rGVpeoe8zF3PGR8RSgxeECITnvaGlbZEIw149nCznqC2Vb9iCt
	 71TcSYLOAgfINTEyll6Q5HHV1Hsq4RH7VjSDDsB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E39F8053D; Fri, 26 May 2023 13:34:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA62F805B1;
	Fri, 26 May 2023 13:34:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07E9CF805B0; Fri, 26 May 2023 13:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46AACF80588
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 13:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46AACF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=SR0qRgTE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QBVlGo005518;
	Fri, 26 May 2023 11:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=9EasbwjkgY555aeepIggTFPhfOoBZLIPmztEaJof+C0=;
 b=SR0qRgTEeOO1An3EN7hDdOUqIdiaAiYlrWxOv035lcz8L3RHuHpa07zcgk60ZaKjFove
 oRTk0d9IS5zYGx40c9efBSTqkjjl7VPfCnRT5LCmpLvRg6QOLRd0YtY0i2mcvTL88Ooy
 jWhQRy5zDUQn2X5ERSWLFaqvnUZ1YMuAZwEsSzp0w84DeoFby+0F3WtZut0jyF2D1bV1
 5gpLlFyyXlSXGVnIlXYJfYflKt+EYg9hqeUE3gff1BoWs1CEawOTdypM+sqPpgZOKEM0
 7TcNNIqMg4bG+V+ZP5RI3u3Ku4kAYgaHCpN3+op2L8DoQHjh6OXgoI2x60N7esyUd06u /g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qtp4wgrpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:34:03 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 34QBY2Pl031689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:34:02 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 26 May 2023 04:33:56 -0700
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
Subject: [PATCH v6 6/8] arm64: dts: qcom: sc7280: Modify VA/RX/TX macro clock
 nodes for audioreach solution
Date: Fri, 26 May 2023 17:02:56 +0530
Message-ID: <20230526113258.1467276-7-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: lRFZMM-7l2wBlXjsF_cbGCPJ2dF-04Gi
X-Proofpoint-ORIG-GUID: lRFZMM-7l2wBlXjsF_cbGCPJ2dF-04Gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 mlxlogscore=996
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305260098
Message-ID-Hash: 6V2VBZD2NWFEOCCQHQIMBRCEAWXWLNM6
X-Message-ID-Hash: 6V2VBZD2NWFEOCCQHQIMBRCEAWXWLNM6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6V2VBZD2NWFEOCCQHQIMBRCEAWXWLNM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

Modify VA, RX and TX macro and lpass_tlmm clock properties and
enable them. For audioreach solution mclk, npl and fsgen clocks
are enabled through the q6prm clock driver.

Delete the power domain properties from VA, RX and TX macro,
for audioreach solution the macro, dcodec power domains enabled
through the q6prm clock driver.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 .../sc7280-herobrine-audioreach-wcd9385.dtsi  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
index 9daea1b25656..c02ca393378f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
@@ -196,3 +196,46 @@ q6prmcc: clock-controller {
 		};
 	};
 };
+
+&lpass_rx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+	status = "okay";
+};
+
+&lpass_tlmm {
+	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "core", "audio";
+};
+
+&lpass_tx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+	status = "okay";
+};
+
+&lpass_va_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk", "macro", "dcodec";
+
+	status = "okay";
+};
-- 
2.25.1

