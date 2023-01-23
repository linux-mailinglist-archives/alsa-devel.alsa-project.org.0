Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4241C6778E2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 11:15:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48AB41F2;
	Mon, 23 Jan 2023 11:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48AB41F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674468937;
	bh=DTN3mKVnBuiDx0L45S72DQE3uP/xELwG/fE1OpA0zUY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ka9h358gFbdsM02oBw/uiwYelFz4uFG/u10qnua//ohsOWo2vqzjcYFcmzDQKTOpX
	 T+NOJ7X2LlvVnfWJSPnrHNbvg6XLy8jtUvUSb4RGL2Var7aFQu0Vgla1M496V+CCJd
	 a+LnB2EzWhazOeTbETN3A0zXmzkm5rWC+jiosBOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C4F0F80548;
	Mon, 23 Jan 2023 11:14:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 820CBF80551; Mon, 23 Jan 2023 11:14:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A97BF80515
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 11:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A97BF80515
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=FkXVlU0m
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30N9PlO4013961; Mon, 23 Jan 2023 10:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=CIxBfpf69T8ceKlQmzHXwuv4JP5pnPAQyhTnowpSVXA=;
 b=FkXVlU0m2hw0HS+clA0SMqBrQcFKecB/COPR20PcocuGD+NvDdO2g/0DF66y5+GSap5V
 P6aMKuLP542aYijLH1A6NiI1OFPC4HnPiSGewz7K2FrUjv5S3JwfXiv/q8dETLV9XUjW
 cIkluGXoX0Ow4Jeq2ZJ3rszbl/4oZSTSTSLbc3D7pKvrPYt6qFI05NgWplPLb92pgIpD
 NGCrTBd/iSkeBwr+RONKEBfFUBYpD0s0qf+OwFJaZOfFma67Zcgpilfjb2el+LnA4QOd
 TgZRta4D1ZCLKFKn/2d2/RBDRhMB0qnbqgYRMDp1Oy4taf/EVzigzOndzJ8+WAiShfFH zg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89gt2n6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:13:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NADqG6024690
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:13:52 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 02:13:46 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH v3 2/2] ASoC: dt-bindings: google,
 sc7280-herobrine: Add platform property
Date: Mon, 23 Jan 2023 15:43:22 +0530
Message-ID: <1674468802-14834-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674468802-14834-1-git-send-email-quic_srivasam@quicinc.com>
References: <1674468802-14834-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZZx_2Jjg0lVAimrOTMOlOR14FPEAMBr9
X-Proofpoint-ORIG-GUID: ZZx_2Jjg0lVAimrOTMOlOR14FPEAMBr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_05,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230096
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

Add platform property in sc7280 machine driver bindings for including
platform subnode in dai-links.
This is required for binding the frontend dai driver to do dynamic pcm
routing in ADSP based platforms.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
 .../devicetree/bindings/sound/google,sc7280-herobrine.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
index 869b403..0b1a01a 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
@@ -75,6 +75,18 @@ patternProperties:
 
         additionalProperties: false
 
+      platform:
+        description: Holds subnode which includes the phandle of q6apm platform device.
+        type: object
+        properties:
+          sound-dai:
+            maxItems: 1
+
+        required:
+          - sound-dai
+
+        additionalProperties: false
+
     required:
       - link-name
       - cpu
-- 
2.7.4

