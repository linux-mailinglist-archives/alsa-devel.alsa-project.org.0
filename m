Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434575DDAE
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:13:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31757E85;
	Sat, 22 Jul 2023 19:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31757E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045986;
	bh=TR6J4K+KyuPiekirUe7FvwqMaPk6jyd1k1x5u0pdn0k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VZNrKiXmVk3CttoVsJ14oiL+qTajqRBsd5jXrf8kOpAD4Uo0fHm1obl02tOT4Q3es
	 Q6J5M5jZchmjjpLeCDny3L9zoqIi/2DVwqxWa9t7bHXKlqL/3yJqAJ23bQlirKchIn
	 Wt5AMW1R1svjx1sYFMkVcT+qKyoTibl3hKN1PX8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70226F8057C; Sat, 22 Jul 2023 19:11:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76000F8057C;
	Sat, 22 Jul 2023 19:11:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A98E6F8047D; Fri, 21 Jul 2023 18:49:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DA73F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 18:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DA73F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=azu1fJ5A
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36LCtWmB015885;
	Fri, 21 Jul 2023 16:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=BVIws1M4wjq3yv5C0HRVSWm08wZYWn34AD7twXGrqQ4=;
 b=azu1fJ5ATvfEB8vew6lTi+zC751LVjNF7fFsGfH7R6LqrvPkgjAUVP16FJjG8MSw6wdr
 M3eyJWkm45NZsB7epk0+XoVe3cBEqBYy4PVUQhUJ5H7fen2w7+ICfeWSRHc/p3b4/yVf
 lIk+pOVOeGg6Se+o4gTM3Hj5gF0yWVgElp5CaB85ht9HhhbOodV76KYuh7n2W0xLSRzy
 F4IOzFP1fsdG48gZw/zm1KCN3VUs4dTQb3iRsFwv8RDt9Nk803rxcr0KKh3IiAis4LFg
 k3O6Hxif0EdVuk2JTZRkPqJij0IhPDuTzySAx/IGu9GLyma+zd9qVjThcIBNwf7umW/e gA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ryhdy9npd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 16:49:24 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36LGn7Ab015423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 16:49:07 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 21 Jul 2023 09:49:06 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] soundwire: qcom: Log clk_get("iface") failures
Date: Fri, 21 Jul 2023 09:49:01 -0700
Message-ID: <20230721164901.2155287-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6ssB93ZsqB_symMR3J0sKHmRyvan4IYg
X-Proofpoint-ORIG-GUID: 6ssB93ZsqB_symMR3J0sKHmRyvan4IYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307210147
X-MailFrom: quic_bjorande@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5CKITREMJOOZBBUEE7L5HUOZCT4VUFFB
X-Message-ID-Hash: 5CKITREMJOOZBBUEE7L5HUOZCT4VUFFB
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:10:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CKITREMJOOZBBUEE7L5HUOZCT4VUFFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Failing to acquire the iface clock makes probing of the Qualcomm
SoundWire driver fail without providing any indication to the user. Make
the driver log the error to aid debugging system configuration issues.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 55be9f4b8d59..e51b1dfce82d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1550,7 +1550,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ctrl->hclk = devm_clk_get(dev, "iface");
 	if (IS_ERR(ctrl->hclk)) {
-		ret = PTR_ERR(ctrl->hclk);
+		ret = dev_err_probe(dev, PTR_ERR(ctrl->hclk), "unable to get iface clock\n");
 		goto err_init;
 	}
 
-- 
2.25.1

