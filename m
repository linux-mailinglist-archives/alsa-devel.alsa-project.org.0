Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB36621118
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 13:41:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D1315E2;
	Tue,  8 Nov 2022 13:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D1315E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667911296;
	bh=JPwBSTL1ZnBHJBbkmHYaLBe7H9iTtp7tdrl2/yCFq5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8Y5vOIBS99nih+jENemlrTTx8gV1YSsuDoyDIYmZ1fqmsQUrFBIAiyjdhDN0NUib
	 Jt9uyzr2PYuNVB4E3H2dg6Bj4htbU0IjgWhnerfShvpVXxq2OHqjfIWAVpAC6Fj3xj
	 BAlaZ0xr/USQeFeuOVdWeEDD+J5R+vEkQwXDnJJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990A4F8055C;
	Tue,  8 Nov 2022 13:40:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C12C4F801D8; Tue,  8 Nov 2022 13:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18346F801D8
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 13:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18346F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Vm85AE2w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8BHKFf027473; Tue, 8 Nov 2022 12:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=cX7FZc3jEmQUhiwgS8NCoCB1Yjw+v7A7EvphLKLAlFI=;
 b=Vm85AE2wcDV9vgmoIEJBFqjbcVyPHkBc0HfODkcpuhb+pF0HrUfQ27lDfTt+p5uFZUbZ
 2gNvrm8diPCSYeGjaf1xKjG97lM7HOLGTGoj+28OEALmTLFcA43ycYyUir+J+YQlUqV5
 vjhVRVwH3y2iRlHSU4Ce6XNJ4/facT8so1qiIeV94MHq+4GXobFd/JXgmXTrZMU2MpQ4
 uaPpbC6hCMq+bjz2pmoK2xLo/uGX2CPU0+eFbyG2TaJxrLTr4uqOuRL5YOz3Jwas0R4/
 8WVFtG9JR+CfNWevA3N3zQqd7q4BQlqBB8H9mJXcKKR2ZD932CTgC5mqUnSb+8hH46cf hA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqhmk8u28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 12:40:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A8CdxDZ003027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Nov 2022 12:39:59 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 8 Nov 2022 04:39:53 -0800
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
Subject: [PATCH v5 3/4] arm64: dts: qcom: sc7280: Remove redundant soundwire
 property
Date: Tue, 8 Nov 2022 18:09:15 +0530
Message-ID: <1667911156-19238-4-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
References: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SFiwtp0Rc8Uiszc00ALWeCMJYebMGvxL
X-Proofpoint-ORIG-GUID: SFiwtp0Rc8Uiszc00ALWeCMJYebMGvxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxlogscore=727
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211080073
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

Remove redundant and undocumented property qcom,port-offset in
soundwire controller nodes.
This patch is required to avoid dtbs_check errors with
qcom,soundwie.yaml

Fixes: 12ef689f09ab ("arm64: dts: qcom: sc7280: Add nodes for soundwire and va tx rx digital macro codecs")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 748eef6..71be873 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2317,7 +2317,6 @@
 			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
 			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
 			qcom,ports-lane-control =	/bits/ 8 <0x00 0x01 0x00>;
-			qcom,port-offset = <1>;
 
 			#sound-dai-cells = <1>;
 			#address-cells = <2>;
-- 
2.7.4

