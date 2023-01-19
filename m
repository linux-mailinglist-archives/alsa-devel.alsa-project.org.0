Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E244B673886
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 13:30:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A0E47F95;
	Thu, 19 Jan 2023 13:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A0E47F95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674131408;
	bh=W6PZBIPkBWl/n2Hm5Z0FHmU6ZaM48nJCav97/DK8uOI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BvKgeKWzRRgSyM+YpBut2dnpIqeDOPCHgh9Y40F0lWeuoMQJj0R2+6PclU5b7kzoQ
	 CiXlnpu6DzPMu/1kydTdXlWPAaJFKqHxIkopQW5zQQ3dPb3b7M6BbQ/LlvEOaYYCv0
	 h82tLcSNaKKvBA1OxXY6TrxLtW/VHToHp8x/keBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F30B4F804F2;
	Thu, 19 Jan 2023 13:28:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D71F8057B; Thu, 19 Jan 2023 13:28:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D036F80571
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 13:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D036F80571
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=XothStJo
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JBDaKa011274; Thu, 19 Jan 2023 12:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=eQ9IrEL8HB6ph/lJww9uSNQrZJwCqGpv1nUycTEFXB4=;
 b=XothStJoczyqBx5PD8TeRFNk+qNv8bt0GYdow1jQecRNcFWkBQbQXSVo5JwyihhJqkix
 6gtm6I56Kgnh/2A+4g/itAL4CjkH2hicPXwyxIXfXy59/x3sQDmZml1Cl7WSVkaAPRk/
 x2WHXiCJkNZZFklNkyVbPTHQ6wMiIIgFshpYG+FDXq0tVOFrBSWz9uxHM/dz2giqx+F8
 Xm/kk7bRmB84lk+DIg2XjQegjYyhlVh43svZBlFCuIoU5akbaJ7q3FtOdP3AWlTrLxWR
 bifea4EHL76ZfGupR8z/AAkM01Oy4wsRW/1S4Dzf9Eck4fLq+YTHliQhE2a2Zs8zQgSb XA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6yksh428-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 12:28:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30JCS0TL014373
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 12:28:00 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:27:54 -0800
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
Subject: [PATCH v3 5/7] arm64: dts: qcom: sc7280: Update lpass_tlmm node
Date: Thu, 19 Jan 2023 17:57:05 +0530
Message-ID: <1674131227-26456-6-git-send-email-quic_srivasam@quicinc.com>
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
X-Proofpoint-GUID: 7pK8HrFuWaGPb__Z7cVvkFhujis4nj52
X-Proofpoint-ORIG-GUID: 7pK8HrFuWaGPb__Z7cVvkFhujis4nj52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190098
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

Update lpass_tlmm clock properties, as different clock sources
are required in ADSP enabled platforms

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 .../arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
index 674b01a..232e1dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
@@ -167,6 +167,15 @@
 	};
 };
 
+&lpass_tlmm {
+	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+	clock-names = "core", "audio";
+	reg = <0 0x033c0000 0x0 0x20000>,
+	      <0 0x03550000 0x0 0xa100>;
+};
+
 &remoteproc_adsp {
 	status = "okay";
 };
-- 
2.7.4

