Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E1D74D9E6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70893851;
	Mon, 10 Jul 2023 17:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70893851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689003097;
	bh=S6LZ2JFrlhFS6RDIomGqzHVVAx4nA8FN6m+I7CU/mPY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nGdyz+OUAE93DvG9fBiJqV/hXCn+AvaJT8g26YMd0Ak4OgnqYX/08BhL/TUivuC/B
	 aul/dzJsNF8r/8vOFA2eM/dfpEK1kIKpqMmCU+EuL5gapLQ3MuApZInpuc5u71eNXI
	 OD1ij2c/+hHzW56bjJWcyRUftmQ54lV5+C73Qj6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2703F80570; Mon, 10 Jul 2023 17:30:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E97C6F8055B;
	Mon, 10 Jul 2023 17:30:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA199F80125; Fri,  7 Jul 2023 08:53:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 054BAF80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 08:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 054BAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=bV+SS682
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3676lEWK017832;
	Fri, 7 Jul 2023 06:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=jSeIcUTc4fFDi+649dihFqOXbWSmjqqdFLpRKOEH0GY=;
 b=bV+SS682GeSkxQOMs6r25u1sLNTEoLbHQ99Pxe4YlKtOmCCxT++3l3MN20MZIrQGOjMx
 HqQbDFenx3L9p4eS9i6uu/o+bnZYuxP5ZRKlQPFRgvVOsELNqFas44nQG/R8c1pdiz6v
 b1zH3rLpAKtxPsOR7M7qoFBDEa0P/zpVtREnPRV1Mn4z/qR2EmU3lj3ct9Rs/Vk/mtp1
 nMXuNVK/qwbWPB4PinH8SLEZwJjGIEF3UbnLjl/SVK3BuqN2psCXrsaP2ncI5+hZEtQ7
 vYBJRo8jZtEUVRPNiUCa86KekVt4n2lo8cxdEUcKMRDzJ2SlnTWfzK3lLLbTDf3fsJHT ZQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rp8a60jd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 06:53:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3676rL8V010661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jul 2023 06:53:21 GMT
Received: from rohkumar-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 23:53:16 -0700
From: Rohit kumar <quic_rohkumar@quicinc.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_rohkumar@quicinc.com>,
        <cychiang@chromium.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] dt-bindings: sound: Update maintainer email id
Date: Fri, 7 Jul 2023 12:22:59 +0530
Message-ID: <20230707065259.3099569-1-quic_rohkumar@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: e5bfGYX6PDiD6qAYIu_3lmEA-inm5sHE
X-Proofpoint-GUID: e5bfGYX6PDiD6qAYIu_3lmEA-inm5sHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1011 phishscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070061
X-MailFrom: quic_rohkumar@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RQSPIZ7QDHE5WYI24RAZQ23MY42XHD6L
X-Message-ID-Hash: RQSPIZ7QDHE5WYI24RAZQ23MY42XHD6L
X-Mailman-Approved-At: Mon, 10 Jul 2023 15:29:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQSPIZ7QDHE5WYI24RAZQ23MY42XHD6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Updated my mail id to latest quicinc id.

Signed-off-by: Rohit kumar <quic_rohkumar@quicinc.com>
---
 .../devicetree/bindings/sound/google,sc7180-trogdor.yaml        | 2 +-
 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index 666a95ac22c8..ba5b7728cf33 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Google SC7180-Trogdor ASoC sound card driver
 
 maintainers:
-  - Rohit kumar <rohitkr@codeaurora.org>
+  - Rohit kumar <quic_rohkumar@quicinc.com>
   - Cheng-Yi Chiang <cychiang@chromium.org>
 
 description:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 6cc8f86c7531..3a559bd07a79 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -8,7 +8,7 @@ title: Qualcomm Technologies Inc. LPASS CPU dai driver
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
-  - Rohit kumar <rohitkr@codeaurora.org>
+  - Rohit kumar <quic_rohkumar@quicinc.com>
 
 description: |
   Qualcomm Technologies Inc. SOC Low-Power Audio SubSystem (LPASS) that consist
-- 
2.25.1

