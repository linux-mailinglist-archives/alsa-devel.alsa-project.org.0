Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9963C437
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 16:54:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B43168E;
	Tue, 29 Nov 2022 16:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B43168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669737250;
	bh=eZrxt4m2E2D/lTFrWqG5jyTE1omRzJPbl5OfsfdU6o4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vjJ2EOgKPYcUsCTZsLuNCMpcKX/0dReyOvzOFFjkpCpsJ0L1oH4eeqmWybek2pAPD
	 41KXcaldBB2VMa2lhaINjQzd8PlkhxmA+BrSgwBOAMdbn/iyCzb6gOO3SqVDtXcF3t
	 JhmRX0HK0Z/V4Hyvs2piJmkDGdmFeIP7U9Pd0yPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8664F80166;
	Tue, 29 Nov 2022 16:53:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACEA8F801F7; Tue, 29 Nov 2022 16:53:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C1C2F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 16:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C1C2F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="NFmyJRgu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATFDcv9016366; Tue, 29 Nov 2022 15:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ZX0B5BBuR1K+dA2SUfVbLudyajXUcyLamBRqEttKJ6k=;
 b=NFmyJRgukuDp0i84XXoTbvBpTzpgURFnxv8TlcQVed8902MA8/OzYf3IYrWF96VIVmlQ
 vWCbuQo6sHLnZOi/M6xBezvMfxdEcxMYZ+agmMdUA1T8VAt6W0HWcPUUqnBIu5C0ASm+
 kuKbgVvCebH+b+d+opCcEonvIJ7masjOHmVQK7+6fdVDNDYVcAW2JFJTleqYFwQkNklT
 tvN7JyUcbadFM7XPz8PumJg794eOedTHfTm4cw0+0GBZspXL/c65oe55HxgX3AIpUsj5
 86fm4VMIpHAT7qGSJhbjHE4z5GZll1Q/AUfesIvBEKzDON0vV8TLfdn2D4UMFLIILPOW hg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m5fjx0xj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 15:53:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ATFr4mX029742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 15:53:04 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 29 Nov 2022 07:52:57 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for system
 PM ops
Date: Tue, 29 Nov 2022 21:22:40 +0530
Message-ID: <1669737160-5282-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BPsAIBaRYB-MDZixTn5KMRp_j_R0FUlC
X-Proofpoint-GUID: BPsAIBaRYB-MDZixTn5KMRp_j_R0FUlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_10,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=847
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290087
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

Add __maybe_unused tag for system PM ops suspend and resume.
This is required to fix allmodconfig compilation issue.

Fixes: 2d68148f8f85 ("ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
--- 
Changes since v1:
    -- Updated Fixes tag.

 sound/soc/qcom/lpass-sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index b96b85a..41db661 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -163,14 +163,14 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
 	return 0;
 }
 
-static int sc7180_lpass_dev_resume(struct device *dev)
+static int __maybe_unused sc7180_lpass_dev_resume(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
 	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
 }
 
-static int sc7180_lpass_dev_suspend(struct device *dev)
+static int __maybe_unused sc7180_lpass_dev_suspend(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
-- 
2.7.4

