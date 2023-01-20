Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5008867528C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 11:33:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33D3330B2;
	Fri, 20 Jan 2023 11:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33D3330B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674210818;
	bh=A5bpCDwJAehtdFVGYMQR/El/o5z/HVHkMI14wit82aQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VAsWhApx/QRQz8ReLy1gigmEmdXiRhn+5us5XI1ELTg41EcG0r6D9KmZCsFdTz5JG
	 1M3tVg8APUYYNBIA+ebDHLgWaKZxTvcswWi7vWm8dZKUnyL7+/ebu7T2Vo9AorVMIi
	 M3vEnAtTAZ2NiiqLcFCCNSTaO/F4zHamjgxuquZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAF59F80524;
	Fri, 20 Jan 2023 11:32:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 136DDF80552; Fri, 20 Jan 2023 11:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E728F80524
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 11:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E728F80524
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=k3cu9FoS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30K9xwhX029234; Fri, 20 Jan 2023 10:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=rGE8YD/svfv/6rOXc2gUpVo0LlpU9zfBZO0+yvqxhIw=;
 b=k3cu9FoS+4sRLqYfJ634gLd6SGz6h6/v4KQuwIgw4uF7V2hzNlJQTxXAfXTYPSsn0o4x
 50/qTc/ldjTSEqVq8YK5Yo4pf/JMQltsKo4nCFQKcz1UtZeAwjYugGFSwqWtf02X3MM8
 9t7tyno1j0ENZItTI3iId9Nre29jBdrXGArRpnayV+kCG3idyewh/tuf/4G4nnxA4Nx4
 75c4frC3qqOKvjTAs5shfvyGohSG9SO9bnMGEij0v1hqfrBqh21RelitGtD5PBCWrP57
 vGM+Pts4hyW1OZ/IefSAwUyjBO7pTV+HoQFr2Fl1o9ErfCfUlLGeFWLIF9J/HwQ0tefx tA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6wbsbp1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 10:31:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30KAVtaL005324
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 10:31:55 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 20 Jan 2023 02:31:49 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <srinivas.kandagatla@linaro.org>,
 <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <devicetree@vger.kernel.org>, <konrad.dybcio@linaro.org>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: google,
 sc7280-herobrine: Add platform property
Date: Fri, 20 Jan 2023 16:01:25 +0530
Message-ID: <1674210685-19944-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674210685-19944-1-git-send-email-quic_srivasam@quicinc.com>
References: <1674210685-19944-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UKTq-x41vESYoqBK9AsEqeYNWhfq1dLd
X-Proofpoint-GUID: UKTq-x41vESYoqBK9AsEqeYNWhfq1dLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_06,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200099
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
This is required for binding the frontend dai driver with codec driver
and cpu driver and to do dynamic pcm routing in ADSP based platforms.

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

