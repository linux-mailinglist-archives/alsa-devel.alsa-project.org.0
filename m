Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFC877043
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 672A885D;
	Sat,  9 Mar 2024 11:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 672A885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979361;
	bh=6VrZRSURzUXrSBObI2POcRjZjknLbdF/Dl4bUKgbr9M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z9jduDsia5VfT3ESEVV9mQ9Ls/i254Ddtluv1/8v7ZzFWZkGbRk+vtb3rr3WY97fZ
	 BZoWYiqxTLXR3Af0esl3+gGFhcSHvnWED7JBB+yUH2qnqdwx3xF4nr43s1RRkQRcZ+
	 Vn5jgBZNmDfX5ssX50LvRxGwVMfiQeFwuMd6hcgU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D915FF80713; Sat,  9 Mar 2024 11:13:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF2FDF806F2;
	Sat,  9 Mar 2024 11:13:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76854F8024E; Wed,  6 Mar 2024 10:17:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33CBDF8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 10:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33CBDF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=g3hibTTt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4265q93M026583;
	Wed, 6 Mar 2024 09:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=gQv1BqfTdUsf
	nWnODQhK96rxVTBRcHtoOh+02sf4lcI=; b=g3hibTTtKpbYCOwJlBXWXOYb4Sbv
	I1IXYHKCkppebLWb+v0gLOGg6Fyf2sH0QgXgwlUkNqqItJyM6SJYSBRJ4fxtegZv
	gwbslXAn3GCsZSGzypFpwSAD1GfvMkOfDp0QPYf+I+l8pZJzDS3dAKoej4pRk3fZ
	DXCmwKILt92uFuGgzAXKuxmFw2coW2vIq+BmK7KDHPDlKYWy18vi51EzqUo0Tt4d
	W+F2nb3KpEuRYoOffdCXkxqpAMCgUqRagjwVS2h3P7aRScpvNGiYLm9TyLom3VOC
	gBJedd6fO42gAz10/BZ+B03DDGD+ccGXc4Dg9UVMIjgW4gLLDTD7pD0k1Q==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpjqf0dae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 09:16:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id
 4269GktO022533;
	Wed, 6 Mar 2024 09:16:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3wkw6kt155-1;
	Wed, 06 Mar 2024 09:16:46 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4269GkNT022528;
	Wed, 6 Mar 2024 09:16:46 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com
 [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4269Gk91022527;
	Wed, 06 Mar 2024 09:16:46 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id C772A5001D9; Wed,  6 Mar 2024 14:46:44 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>, stable@vger.kernel.org
Subject: [PATCH v2] slimbus: qcom-ngd-ctrl: Add timeout for wait operation
Date: Wed,  6 Mar 2024 14:46:42 +0530
Message-Id: <20240306091642.9123-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jDFJ5S_vQCEQaiGFzoqot2HSa80kYa4k
X-Proofpoint-ORIG-GUID: jDFJ5S_vQCEQaiGFzoqot2HSa80kYa4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 clxscore=1011 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060072
X-MailFrom: vdadhani@qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BMX3PGFPHPNL3UOZGPFE7FZWNRKQZFMX
X-Message-ID-Hash: BMX3PGFPHPNL3UOZGPFE7FZWNRKQZFMX
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMX3PGFPHPNL3UOZGPFE7FZWNRKQZFMX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In current driver qcom_slim_ngd_up_worker() indefinitely
waiting for ctrl->qmi_up completion object. This is
resulting in workqueue lockup on Kthread.

Added wait_for_completion_interruptible_timeout to
allow the thread to wait for specific timeout period and
bail out instead waiting infinitely.

Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
v1 -> v2:
- Remove macro and add value inline.
- add fix, cc and review tag.
---
---
 drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index efeba8275a66..a09a26bf4988 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1451,7 +1451,11 @@ static void qcom_slim_ngd_up_worker(struct work_struct *work)
 	ctrl = container_of(work, struct qcom_slim_ngd_ctrl, ngd_up_work);
 
 	/* Make sure qmi service is up before continuing */
-	wait_for_completion_interruptible(&ctrl->qmi_up);
+	if (!wait_for_completion_interruptible_timeout(&ctrl->qmi_up,
+						       msecs_to_jiffies(MSEC_PER_SEC))) {
+		dev_err(ctrl->dev, "QMI wait timeout\n");
+		return;
+	}
 
 	mutex_lock(&ctrl->ssr_lock);
 	qcom_slim_ngd_enable(ctrl, true);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

