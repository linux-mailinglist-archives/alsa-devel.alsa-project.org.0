Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C2087703D
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD5782B;
	Sat,  9 Mar 2024 11:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD5782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979257;
	bh=gko5LiT43eZItnKMJB9HHVK2NT64FE9JFLWsNR0WBdw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u3P0wEjmhPWJn6/kXQqjnKXY5+p9v2RPV/9mcbluyzp/pASqGCd322ZwjzTTeCyoA
	 iRKRsWcxGB6BarhYppo4JPQZ1EiOzA8C0vG/EtS/5rhbx6+El5+MPjsVGP1qRjGi0H
	 GZdVFVF0QWesb1MEJqZSwovXB8hBb8FMCJSTBCl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C58A8F80610; Sat,  9 Mar 2024 11:12:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6720F80615;
	Sat,  9 Mar 2024 11:12:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2D4BF8024E; Mon,  4 Mar 2024 14:50:11 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D3E40F8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 14:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E40F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=EumKsbqn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 424CG1pt029325;
	Mon, 4 Mar 2024 13:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=59j3cPuBFO21
	Qe0hjlg1itT25ek1fVrsV6C+IVu7aNM=; b=EumKsbqn5Gu5U8/90ntp6SrY8Ys+
	+MDqn9nDdWVg2owugl39xDR6RJvTAQ3s6TGIGQg3rlqRCTmeuAPcvzRh4vdXLx8B
	4QZjEos+GeqjNRqvjfk8V6/PNHtTTLEzOw5qaE6tpdnHAoUc1bJktUTia7W82ueF
	XENyzqPZzC0fNZi4grmNtgrQB8xSRcbpZ8BT0tMQMLBDIp+QBtOlRVS60qxbRe8U
	v8ipsd8ecYLqlCiVxel/BcGki4g0ryBbuiSXpq1W7AbIMuyeWkDNR7ssWg7HojTl
	u0dGVBC/qz+Xoy/eeby+L49QAfH8U9KPoTWfkSWvZwx1vF/r5au86Lsidg==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wn6sas1t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 13:50:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id
 424Do34w009814;
	Mon, 4 Mar 2024 13:50:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3wkw6kj0d0-1;
	Mon, 04 Mar 2024 13:50:03 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 424Do3WD009807;
	Mon, 4 Mar 2024 13:50:03 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com
 [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 424Do38L009804;
	Mon, 04 Mar 2024 13:50:03 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id B7D115001CE; Mon,  4 Mar 2024 19:20:02 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
Date: Mon,  4 Mar 2024 19:20:00 +0530
Message-Id: <20240304135000.21432-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fy-DMK52z5uUUHPcVqfRLX6MlasQNm9i
X-Proofpoint-ORIG-GUID: fy-DMK52z5uUUHPcVqfRLX6MlasQNm9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_09,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=720 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040104
X-MailFrom: vdadhani@qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OTBPSS5S6A2HQ273DDCLNQZMYHSXKHRK
X-Message-ID-Hash: OTBPSS5S6A2HQ273DDCLNQZMYHSXKHRK
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:10:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTBPSS5S6A2HQ273DDCLNQZMYHSXKHRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently we have auto suspend delay of 1s which is
very high and it takes long time to driver for runtime
suspend after use case is done.

Hence to optimize runtime PM ops, reduce auto suspend
delay to 100ms.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index efeba8275a66..5de45a0e3da5 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -81,7 +81,7 @@
 #define SLIM_USR_MC_DISCONNECT_PORT	0x2E
 #define SLIM_USR_MC_REPEAT_CHANGE_VALUE	0x0
 
-#define QCOM_SLIM_NGD_AUTOSUSPEND	MSEC_PER_SEC
+#define QCOM_SLIM_NGD_AUTOSUSPEND	(MSEC_PER_SEC / 10)
 #define SLIM_RX_MSGQ_TIMEOUT_VAL	0x10000
 
 #define SLIM_LA_MGR	0xFF
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

