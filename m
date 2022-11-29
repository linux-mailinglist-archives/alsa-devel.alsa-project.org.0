Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA963B9DD
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 07:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2B3D1688;
	Tue, 29 Nov 2022 07:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2B3D1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669703873;
	bh=hhAOdWmpvvswTPxDMuObdGut4tF1NNIb4szIgfgjvqg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AubpM2MtdFj6oGF8E4yr0+9YfKC/1r9qlHzuwpF2uHUiBgO9hDrYS4rq/yPV1Ejfv
	 zyF1zCg3HQSkYDq6Sd3lAPZjIanbhHcuM0lFMRYsHO+D/MU1vN2dXRJEAlxxlpqfgR
	 CpOUhd/B5rukIBeRaRTgiEvcHK2VwNMfsN/GWf44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB50F800B6;
	Tue, 29 Nov 2022 07:36:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8C79F801F7; Tue, 29 Nov 2022 07:36:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1D03F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 07:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D03F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="iI86H45L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT4wgDc005078; Tue, 29 Nov 2022 06:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=caj+s+czmNQi0XmGAmJvS2ybhS2pZZke9jRdHEJLPhY=;
 b=iI86H45LC9FR453Ijd+dvBe58idGPajCB0ZHu+PNNzqegJL41mTNo4wcC7fP+gB1KwBe
 FuitXRobIy1tVRjkltcSSG6koVLmWiLt7le4yVx1O8WxQPIYpkV+/bxq+Rb2bov6n7XH
 vXbFEM3jZiurEGf0VSpXMeDrJQyuGwWRHkK5XU+OdArvC6k0rF8m141cvFQtVWeE1o/o
 7h4dwE/1PcnVb3CooaltGf1+70Ktpm8Xh3+BVJhH6sxFM/rT1pQJIJCi8NuQo4iKL16b
 B+qcek23Hk0NwRP6jxUXYFzc3oIuOfNPnWT+zNYXOhpDhge8tcgpmYR31huvIygosPIF GA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m56c68s0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 06:36:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AT6aiIb029608
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 06:36:44 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 28 Nov 2022 22:36:38 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH] ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops
Date: Tue, 29 Nov 2022 12:06:24 +0530
Message-ID: <1669703784-27589-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xZ2XiQUcoNkUT8SkfIcv5q2dsdGpLfDU
X-Proofpoint-GUID: xZ2XiQUcoNkUT8SkfIcv5q2dsdGpLfDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_04,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=923 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290042
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

Update lpass sc7280 platform driver with PM ops, such as
system supend and resume callbacks.
This update is required to disable clocks during supend and
avoid XO shutdown issue.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Tested-by: Rahul Ajmeriya <quic_rajmeriy@quicinc.com>
---
 sound/soc/qcom/lpass-sc7280.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 70c4df8..65a04d3 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -232,10 +232,27 @@ static int sc7280_lpass_exit(struct platform_device *pdev)
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
 
 	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	return 0;
+}
+
+static int sc7280_lpass_dev_resume(struct device *dev)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+}
+
+static int sc7280_lpass_dev_suspend(struct device *dev)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
 	return 0;
 }
 
+static const struct dev_pm_ops sc7280_lpass_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(sc7280_lpass_dev_suspend, sc7280_lpass_dev_resume)
+};
 static struct lpass_variant sc7280_data = {
 	.i2sctrl_reg_base		= 0x1000,
 	.i2sctrl_reg_stride		= 0x1000,
@@ -426,6 +443,7 @@ static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 	.driver = {
 		.name = "sc7280-lpass-cpu",
 		.of_match_table = of_match_ptr(sc7280_lpass_cpu_device_id),
+		.pm = &sc7280_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
 	.remove = asoc_qcom_lpass_cpu_platform_remove,
-- 
2.7.4

