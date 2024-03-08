Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F87877056
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:20:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54AC822AD;
	Sat,  9 Mar 2024 11:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54AC822AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979616;
	bh=pICe2GlJL7NcXxK2+pFuQf8AqphEs57jHM44QIo2Vcc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ME2SRF3vVmaIytXpwoPX5Z0bCaeoClsM4ssvZ4pJ1cexY2IX4jQjquK/zsqreAxHM
	 m7N+EhNBLaAqaf5wZlKq9QylWvPHJyA0eGtVts8NAaLvP8VtTQ9ctxGXZXbLv38JTO
	 nwekjTifM/7B2tmfbOb1e4mGkBbGHXWJkZH0C+JY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C368EF805E4; Sat,  9 Mar 2024 11:14:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6859F89743;
	Sat,  9 Mar 2024 11:14:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AAFFF8024E; Fri,  8 Mar 2024 13:41:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63F1AF80093
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 13:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F1AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MmeNv1j2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4283tO98012824;
	Fri, 8 Mar 2024 12:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=xWK+KGxSm6EY
	uf9aKqHSC0xJscIex/nm/iyXNhqPd/o=; b=MmeNv1j2bvvUXSnA9lMPzNInCs/K
	wv0HfF1gBYsEFdUHq4RDY0KHmb9TxXNNyNxjsSfyVBeONBn+x+GzjNk7ZTsBivFJ
	/Bx9SoOYNAg2JDCbMnccKGxtKiqiPrGYVFFwVg1d0VkBj18vE0dLB7g+W9XcNj+Y
	IBPHY2tHq2COVv6H6q+EbCTgq2xeHvienHbbf6nCvUC1vOW0ELP2CmP3eQObiXjP
	o92iJsDXWiJjrmbchqs34MCbRipMSgX08kxWldwSoUl/1DMDCBnsRDUTZOFeAW4T
	bV7wUZCP/tucJTtLvmz1exd9MMO7skNjR809bhFJfXBYU6QTNs1OAl/vRw==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqn8m1rsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 12:41:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id
 428CfW9u024479;
	Fri, 8 Mar 2024 12:41:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3wkw6m415d-1;
	Fri, 08 Mar 2024 12:41:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 428CfWWW024474;
	Fri, 8 Mar 2024 12:41:32 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com
 [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 428CfW5o024472;
	Fri, 08 Mar 2024 12:41:32 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 68FA95001D9; Fri,  8 Mar 2024 18:11:31 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v2] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
Date: Fri,  8 Mar 2024 18:11:29 +0530
Message-Id: <20240308124129.7833-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N7kfrcuy2M1ezXttnyc7DxW46hEm_5JO
X-Proofpoint-ORIG-GUID: N7kfrcuy2M1ezXttnyc7DxW46hEm_5JO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=658 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080101
X-MailFrom: vdadhani@qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JTPR6LYEMKJDPCYYL2LQDGRP7QVGEXBF
X-Message-ID-Hash: JTPR6LYEMKJDPCYYL2LQDGRP7QVGEXBF
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:12:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JTPR6LYEMKJDPCYYL2LQDGRP7QVGEXBF/>
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
v1 -> v2:
- Remove macro and add value inline.
- Link to v1: https://lore.kernel.org/linux-arm-msm/d784e46d-974d-4bf3-a2d3-491e7ad19701@linaro.org/T/
---
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index efeba8275a66..5e132273c6c4 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -81,7 +81,6 @@
 #define SLIM_USR_MC_DISCONNECT_PORT	0x2E
 #define SLIM_USR_MC_REPEAT_CHANGE_VALUE	0x0
 
-#define QCOM_SLIM_NGD_AUTOSUSPEND	MSEC_PER_SEC
 #define SLIM_RX_MSGQ_TIMEOUT_VAL	0x10000
 
 #define SLIM_LA_MGR	0xFF
@@ -1571,7 +1570,7 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctrl);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, QCOM_SLIM_NGD_AUTOSUSPEND);
+	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
 	pm_runtime_get_noresume(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

