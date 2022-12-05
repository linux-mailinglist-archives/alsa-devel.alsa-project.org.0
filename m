Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B086422D2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 06:50:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8439116A4;
	Mon,  5 Dec 2022 06:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8439116A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670219432;
	bh=kF8vejyy/MUVdxyhzF6j5tC4NPN8q/25VBJh/3SO5o4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jAPR4mocYtMZJ7Nqj0F/mSQ+JuQlxQ461NIoIHu0RuBwyqw7a5yqs5m2o8L+M0iVc
	 /UorN9bCXDQaXizWImNke3DZCs0B351+/eSBtRvhAt5BwdJErkWnOZNkyeqIo7pmfo
	 y5rOZS5Hi2xEJ43TwjwfAzQK1NFMxdrdT5MFWciA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3567AF8014C;
	Mon,  5 Dec 2022 06:49:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27A2AF80236; Mon,  5 Dec 2022 06:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4BF9F8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 06:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4BF9F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="YlKyKQ4U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B55JcjY012291; Mon, 5 Dec 2022 05:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=vjpPeUwvhNX+AnV3rGNurmdHgA0ADaj5wUwb160wPjw=;
 b=YlKyKQ4UQSORqoiVCqA5CysOLsUm3aV4WkLzmKvB7boHBFqhiFrnjZx+vTe0lUhfVKho
 HSDLMpTgN4exUVPol/ef/bsU7bTQLmc6guhn6wFqk44XHkD2FVhOPMYqKpPwJb3CQi/k
 UU33heirrCRk6AFeU2aZfBGyLPofrO5qzSIJd390csJxTNKwsjRUIbipG2YZ5F2XVMk8
 mKbiFPNpQhe2xi6y0X2UlDF3uy9oMRlH9ScMIul+El1KKwxes7Y1uGwTrEGsEAVOl8pQ
 1QARSCX7ECJdWauvl8KUu0Rkz0fR15HF8d/hDABcxGaBC1LRiX8JvxWRwwjKham9XBaV cQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7yrf36wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 05:49:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B55nOZi023544
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 05:49:24 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 4 Dec 2022 21:49:19 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH] ASoC: qcom: lpass-sc7280: Add maybe_unused tag for system PM
 ops
Date: Mon, 5 Dec 2022 11:18:53 +0530
Message-ID: <1670219333-32526-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Uh68q1dvaloWT23ZNHPUEhw7_iAKjQoM
X-Proofpoint-ORIG-GUID: Uh68q1dvaloWT23ZNHPUEhw7_iAKjQoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=867
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212050026
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

Fixes: a3a96e93cc88 ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
 sound/soc/qcom/lpass-sc7280.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 65a04d3..d43f480 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -235,14 +235,14 @@ static int sc7280_lpass_exit(struct platform_device *pdev)
 	return 0;
 }
 
-static int sc7280_lpass_dev_resume(struct device *dev)
+static int __maybe_unused sc7280_lpass_dev_resume(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
 	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
 }
 
-static int sc7280_lpass_dev_suspend(struct device *dev)
+static int __maybe_unused sc7280_lpass_dev_suspend(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
@@ -253,6 +253,7 @@ static int sc7280_lpass_dev_suspend(struct device *dev)
 static const struct dev_pm_ops sc7280_lpass_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(sc7280_lpass_dev_suspend, sc7280_lpass_dev_resume)
 };
+
 static struct lpass_variant sc7280_data = {
 	.i2sctrl_reg_base		= 0x1000,
 	.i2sctrl_reg_stride		= 0x1000,
-- 
2.7.4

