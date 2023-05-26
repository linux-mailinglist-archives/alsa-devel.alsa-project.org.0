Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E567871259A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87CC207;
	Fri, 26 May 2023 13:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87CC207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685100902;
	bh=8KC8kiPpurJ6sf8EAA6ocYY05OG0bmWSqPWRT6nitG4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aNPGchHPshqtir5Az3Eh3fBUwyrw9l8yY2ygOM8xuRvkytQXmwL++/ZNO/Rto6Mc7
	 3gIzTG3Lm5kAFjZbCKUzs4d6Z8bkpiGw7otC2bCK0E7o1+UzYABMxPja9Q0wNobDQh
	 /Cyx0ctpBDYOv35XZtT3mDZsChj4QJLe3Ne4yPVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E96A0F80542; Fri, 26 May 2023 13:33:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A39CF8016A;
	Fri, 26 May 2023 13:33:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC145F8024E; Fri, 26 May 2023 13:33:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 05747F80053
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 13:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05747F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=SuzMJe7o
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34Q7V6lw024125;
	Fri, 26 May 2023 11:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=CXN/WLtg+szgpVqcY/RI10ElEFkV1LvPmjPuOZ5FUYs=;
 b=SuzMJe7o7ad5xhU5uejpLRiLyrbIAYOTlOU4bdn++DBIAbzQPLNcKSi51uSl8B7ZVA2z
 P8Tk4cgIjC/gZrsmDLqe3PsGG/7IHW1qiDM4PKucumIgBGgJiEULsKOe+NwZd/H6G6hp
 223FdTkNizb4vpPAG8SYYOfvyiL6zQpNRggb8J7OVXR05tXo0npTpulKlCbASJ6tmCC5
 EhCCSrRBv/JM8DNhuYBJBXdH4hTV8B+pySO/vA62HxLuAGydDr7xK4v5baICWhFBPvm7
 LS3dJgJdyhtQ/mQ7k/0AL0py7AHQN20k1kmYlX3AvfOcpD/6tGX8dCJPx3w8/auLt9Zx ug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qtrev8e48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:33:28 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 34QBXQxf023280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 11:33:26 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 26 May 2023 04:33:21 -0700
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
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v6 0/8] Add SC7280 audioreach device tree nodes
Date: Fri, 26 May 2023 17:02:50 +0530
Message-ID: <20230526113258.1467276-1-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: EvzDCBRm7xaPQ1z-Xs_DAwe3YuWMk8wm
X-Proofpoint-GUID: EvzDCBRm7xaPQ1z-Xs_DAwe3YuWMk8wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305260098
Message-ID-Hash: N7DCYUG4T5RDBT2PHADVVOP55QNEXCYT
X-Message-ID-Hash: N7DCYUG4T5RDBT2PHADVVOP55QNEXCYT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7DCYUG4T5RDBT2PHADVVOP55QNEXCYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SC7280 audioreach device tree nodes and extract audio specific
dtsi nodes and add them in new file.

This patch series depends on:
    -- https://patchwork.kernel.org/project/linux-clk/list/?series=717985
Corresponding dt-bindings not mainlined yet.
    -- https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/commit/?h=rproc-next&id=8490a99586abd480d7139893f78c019790a58979

Changes Since v5:
    -- Re-arrange the patch list, driver changes should come after binding.
    -- Remove incorrect dai cells property in "Add sound node for crd-rev3 board" patch.
    -- Remove newlines in "Add LPASS PIL node" patch.
    -- Update the commit message in "Update VA/RX/TX macro clock nodes" patch.
    -- Update the commit message in "Update lpass_tlmm node" patch.
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
  arm64: dts: qcom: sc7280: Modify lpasscc node name
  dt-bindings: remoteproc: qcom: sc7280-adsp-pil: Add missing properties
  arm64: dts: qcom: sc7280: Extract audio nodes from common idp dtsi
    file
  arm64: dts: qcom: sc7280: Add sound node for crd-rev3 board
  arm64: dts: qcom: sc7280: Add LPASS PIL node
  arm64: dts: qcom: sc7280: Modify VA/RX/TX macro clock nodes for
    audioreach solution
  arm64: dts: qcom: sc7280: Modify LPASS_MCC reg region size in the
    lpass_tlmm node
  arm64: dts: qcom: sc7280: Add qcom,adsp-pil-mode property in clock
    nodes

 .../remoteproc/qcom,sc7280-adsp-pil.yaml      |  30 ++-
 .../arm64/boot/dts/qcom/sc7280-audio-idp.dtsi | 131 +++++++++
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts    |   1 +
 .../sc7280-herobrine-audioreach-wcd9385.dtsi  | 253 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      | 122 ---------
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   4 +-
 6 files changed, 413 insertions(+), 128 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi

-- 
2.25.1

