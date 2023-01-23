Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 119146778DF
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 11:15:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F74B41EE;
	Mon, 23 Jan 2023 11:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F74B41EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674468916;
	bh=AF3nQ8sZIiYFLJXKe5ERgvKJUluMYCj7GGpFHJzwf6A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RbRk/Kg7eZ7jtfOFUCgYA8Aa81eoYdpSqw1/vv+mUzrGmuxdpa2+usnVAgvbHQhNT
	 iZJqXqoXuucE+IitpUmJyXD5X7H2deyMQ688Vc2ElLe8TSnq33NUotn0hTFXmNCpiX
	 qDNUO6moXHvcA+0DB/CVL42ZzDwK6efBTNYzWDK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1C1F801D5;
	Mon, 23 Jan 2023 11:13:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDA77F804FC; Mon, 23 Jan 2023 11:13:52 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FE49F801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 11:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE49F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=SOuwmJTc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30N9Y08b023475; Mon, 23 Jan 2023 10:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=YWI5OKQOfgmmNpChdnlly9Z5RsxQR1esA305lIQPxfY=;
 b=SOuwmJTcH+MGliscux60rGlkbuvtVhFnqVcv7THJRQRluySjt3Kecv8a/70gHrvSairx
 QA/IA9nBO7+0yKpczTjmYAB8Wp/EthcRTh9Vq6J1zvUVuAA2hgws0U64DWrao0t34pH5
 yL7yAU2AJnd9NPBmN3CHnAiVWEBfwkyYcB3y3M+951KFQNQ8Frz5QTQD2caFhTGwBSY5
 eYKAA69ocDR+Tkg/KNE7upfrS7fLsGlvn450vigz0KpKvUOgGyYQugF7M2ujgMRYTDE4
 gDutTDH6yZkuZHwNE5zkkxiuINnqyPiD0Er0RB5ZBcuvc2VIGU3yCNIB6x04dYKSTdSv Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89hk2nma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:13:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NADkcB030162
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:13:46 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 02:13:41 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH v3 1/2] ASoC: qcom: dt-bindings: lpass-va-macro: Update clock
 name
Date: Mon, 23 Jan 2023 15:43:21 +0530
Message-ID: <1674468802-14834-2-git-send-email-quic_srivasam@quicinc.com>
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
X-Proofpoint-GUID: LVrPWa_g2bS28d5SDTpchz1zQJa8p0OZ
X-Proofpoint-ORIG-GUID: LVrPWa_g2bS28d5SDTpchz1zQJa8p0OZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_05,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230095
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

Update clock name from core to macro in lpass-va-macro node
to make it compatible with existing driver and existing DTS files.

Fixes: 67d99b23c881 ("ASoC: qcom: dt-bindings: add bindings for lpass va macro codec")
Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 26f0343..0a3c688 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -36,7 +36,7 @@ properties:
     oneOf:
       - items:   #for ADSP based platforms
           - const: mclk
-          - const: core
+          - const: macro
           - const: dcodec
       - items:   #for ADSP bypass based platforms
           - const: mclk
@@ -77,7 +77,7 @@ examples:
       clocks = <&aoncc 0>,
                <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
                <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-      clock-names = "mclk", "core", "dcodec";
+      clock-names = "mclk", "macro", "dcodec";
       clock-output-names = "fsgen";
       qcom,dmic-sample-rate = <600000>;
       vdd-micb-supply = <&vreg_s4a_1p8>;
-- 
2.7.4

