Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394A68C2E2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 17:18:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7534836;
	Mon,  6 Feb 2023 17:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7534836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675700295;
	bh=jzTKJEV799yCgwcgEJFK5dKgTezG27y0PD6IUngRf7U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TVW18fuqv0sVSLheLiFdOKcwnK9HTxbZfA+i1dXDXjmQXdObUDZdnliLNq77HFWh0
	 UxrAtQW9z8ka23j5X7/7sp5I6+uabAwbB5VFeqtZQu6RvV99FD4/A9GyLHTpOK+dpu
	 MP8bb9Q71cq+Ty0mxOzOG3QOm2VB6Lmae4xYyXc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F84F804FB;
	Mon,  6 Feb 2023 17:17:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B806BF804F1; Mon,  6 Feb 2023 17:17:15 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 89666F8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 17:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89666F8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=GoJPFcgo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316FYITd023602; Mon, 6 Feb 2023 16:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Peiayn3TZDzpZtvrbG7ocZtCxKhQO0i+HE+2mMzaTU4=;
 b=GoJPFcgowVd3ap3dxcIJ69k+VRB/f8IpDdpZlA62OYXpC9Aq6chyc7QpAbvjgyi5yC5D
 qiM3qQEEp9pSUn/S92Je4n/Pm+VvEiDYuAcH6eT31MTNtWqe+RtqtW9LbxUYjHng8rph
 WG7pBJh+PAuyC03u+DgQBllfJ6H4d+pWW/NNSXa07bOF2LOiDAvANM3hXERFCxBldYq5
 6rwYvQ8wCjukFR7FUcjtMkgKgYGFudKOpBk0ETobxmwauIu6l6tLPousB5swbxe/F1Mc
 dMxOQHFrijujVSD/pVVNdFrJzk+HckzWaoWe/VWVuszDcVcCsU917qVBtxu1iu00g+DJ pw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhfkac12x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 16:17:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316GH5e7017813
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Feb 2023 16:17:05 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Feb 2023 08:16:59 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <vkoul@kernel.org>,
 <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
 <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
 <dianders@chromium.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <alsa-devel@alsa-project.org>,
 <quic_rjendra@quicinc.com>, <konrad.dybcio@somainline.org>,
 <mka@chromium.org>, <quic_mohs@quicinc.com>
Subject: [PATCH v5 0/8] Add SC7280 audioreach device tree nodes
Date: Mon, 6 Feb 2023 21:46:33 +0530
Message-ID: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hL3XLMLQYNBNOUpQ0Il4Xp3z3Z6y-9yH
X-Proofpoint-GUID: hL3XLMLQYNBNOUpQ0Il4Xp3z3Z6y-9yH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060141
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

Add SC7280 audioreach device tree nodes and extract audio specific
dtsi nodes and add them in new file.

This patch series depends on:
    -- https://patchwork.kernel.org/project/linux-clk/list/?series=717985
Corresponding dt-bindings not mainlined yet.
    -- https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/commit/?h=rproc-next&id=8490a99586abd480d7139893f78c019790a58979

Changes Since v4:
    -- Modify lpasscc clock controller node name.
    -- Disable lpass_core node.
    -- Modify Model name in sound node in "Add sound node for crd-rev3 board" patch.
    -- Remove protection domain property in "Add LPASS PIL node".
Changes Since v3:
    -- Remove deleting digital codecs in crd-rev3 board specific dtsi and upadate them using phandle.
    -- Update commit message in "Update lpass_tlmm node" patch.
    -- Change the position of status property in LPASS PIL node.
    -- Update commit message in "Add sound node" patch.
Changes Since v2:
    -- Remove Patch related to Add CGCR reset property.
    -- Remove Patch related to Disable legacy path clock nodes.
    -- Add dt-bindings for missing properties.
    -- Change the order of nodes.
    -- Move digictal codec macro nodes to root node from soc node.
    -- Add adsp-pil-mode property in required clock nodes.
Changes Since v1:
    -- Move remoteproc node to soc dtsi file.
    -- Add qcom, adsp-pil-mode reg property in lpasscc node.
    -- Fix typo errors.
    -- Remove redundant status properties.

Srinivasa Rao Mandadapu (8):
  arm64: dts: qcom: sc7280: Extract audio nodes from common idp dtsi
    file
  arm64: dts: qcom: sc7280: Add sound node for crd-rev3 board
  arm64: dts: qcom: sc7280: Add LPASS PIL node
  arm64: dts: qcom: sc7280: Update VA/RX/TX macro clock nodes
  arm64: dts: qcom: sc7280: Update lpass_tlmm node
  arm64: dts: qcom: sc7280: Add qcom,adsp-pil-mode property in clock
    nodes
  arm64: dts: qcom: sc7280: Modify lpasscc node name
  dt-bindings: remoteproc: qcom: sc7280-adsp-pil: Add missing properties

 .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  |  30 +++-
 arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi     | 135 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         |  24 +--
 .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 171 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 126 ---------------
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  95 +++++++++++-
 6 files changed, 427 insertions(+), 154 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi

-- 
2.7.4

