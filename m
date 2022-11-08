Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE234621734
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 15:47:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96F4786E;
	Tue,  8 Nov 2022 15:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96F4786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667918872;
	bh=RMyu/TDNhMiSLZgPEfg4PPfz0KV8hBP6tnFr8sWoXS0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I1ltUT/UOy/HFq/D9l3L8cUQ4XaoMOYFggxnMrRhUsQsr2SfiPcYGVpF2XDCyF7wf
	 gDkFyhsfjaC++dt63Hc8EC9IMFa/vh+pGwtSvcPURAQr4VZ/jzhm66ZlKi7VbmhEAn
	 gghgVp3DiHPyIG7eZBDndmg1bWAXaM2+XShvKvQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7E6DF800EC;
	Tue,  8 Nov 2022 15:46:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC403F8025D; Tue,  8 Nov 2022 15:46:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F05F800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 15:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F05F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="DQThg95g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8E8Cwi021563; Tue, 8 Nov 2022 14:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=xY2h5+UrR73hVYHlPLptrNsNGUN3y4EyCh+wOIi6Oy8=;
 b=DQThg95gIPWRmtEtuwy2yBifaEah0HTt4sORa7P5qMZMQ/oJcBXSLPiUhJyQ9TTqSG8I
 vCHCAWbQ1Q3nHwvVqwqRZCXYKp0mN/y0eMeGGWzCtho+VYnlRW80OMZhgR5AI6mfrwZV
 On/ma0u90ctyKPeYj1s9sO3S59/aEL3c6qwiFrC9vrUAOJdQ+/XByp5rCb+rTySMvXHK
 IxAGkYaxEjH4U9fjSFSEuyDuyREFYi/yTxjoreSpAvJrCq1z9XDruBIg2lG3taINCOYd
 axmRwnnEy1LxLrhpkgaSRveZg/zJBOcs1/nEAeLILnFPW07DmY7GQM8e/Rvm+QeZQpPz mA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqht896fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 14:46:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A8EkjKR008059
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Nov 2022 14:46:45 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 8 Nov 2022 06:46:39 -0800
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
Subject: [PATCH v6 0/4]  Convert soundwire bindings to DT schema
Date: Tue, 8 Nov 2022 20:15:59 +0530
Message-ID: <1667918763-32445-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PMRg16jl0ynzdb_SRsKG26fR5zqlTGyq
X-Proofpoint-GUID: PMRg16jl0ynzdb_SRsKG26fR5zqlTGyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=863
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080089
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

Convert soundwire bindings text file to DT schema and update
device tree entries to follow strict dt-bindings.
Changes since V5:
  -- Update indentation of few properties description.
  -- Update minimum and maximum limit for few properties.
  -- Fix Typo errors in commit message.
  -- Update commit message with differences from text file.
Changes Since V4:
  -- Update interrupt names in example.
  -- Fix blank lines.
  -- Remove dependecy patch info.
  -- Split dtsi patches as per SoC.
Changes Since V3:
  -- Remove subnode description and add appropriate pattern properties.
  -- Add interrput names in example.
  -- update some properties description.
  -- Revert minIteams change in previous version.
  -- Rebase to latest code base.
  -- Update dtsi node names,
  -- Remove redundant property in soundwire node.

Srinivasa Rao Mandadapu (4):
  arm64: dts: qcom: Update soundwire secondary node names
  arm64: dts: qcom: sm8250: Remove redundant soundwire property
  arm64: dts: qcom: sc7280: Remove redundant soundwire property
  dt-bindings: soundwire: Convert text bindings to DT Schema

 .../devicetree/bindings/soundwire/qcom,sdw.txt     | 215 ----------------
 .../bindings/soundwire/qcom,soundwire.yaml         | 270 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   4 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   4 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   4 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   4 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   1 -
 9 files changed, 280 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml

-- 
2.7.4

