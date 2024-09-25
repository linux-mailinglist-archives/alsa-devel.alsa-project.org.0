Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17A984FB3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 03:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08041B60;
	Wed, 25 Sep 2024 03:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08041B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727226087;
	bh=S7gNn/zMH9Mq7yohNCakzHW+ZK7IqUedqKKHCL3FDOU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hEq3SxoloNdJ6Ws2MipnE317387XLe1g/UZ1txH3f6mXP+jr6ObuW3Jm4t+FRUJPi
	 mI7tPV+ePCobsrsu6PdiOMxvxuSmyTQ1p3KKjtW+j7cjLlQoiLgb2N/JCwlERW8qBC
	 38ZnPGzW3AdTd4yWpfQN5ARl1aYJpTl1nOTxrDew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA58FF80616; Wed, 25 Sep 2024 03:00:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E11F80603;
	Wed, 25 Sep 2024 03:00:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FE57F805AA; Wed, 25 Sep 2024 03:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD79F802DB
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 03:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD79F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=gOY1VxMN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48OHnxLj030180;
	Wed, 25 Sep 2024 01:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c5gwoddCxMnmmFAKaTw4cQrxCONcapW95+AyW+pR6yQ=; b=gOY1VxMN5b76TVVW
	MLxJTbwzxWf7oXPgpfolJloTPTycHmPbJeyh2ma4A/uB4oTJyDbDOsUi09ZlOsDT
	3OYCZcj+UxQGxzdhx6B3Cm3I9JntI8jlU1FrvdGy9SoaPtuY7P525JZeQYS7g9Qa
	WwVXRuteMtaCf+5KYEgMfWfpkNNNI7c+qwUxU2Xg+WlDFyYFQCd6j7b8nhbdQM6Q
	Ce3B8Xj//85fZeIksaJ+82xOJ7WB5apR4ZrDwyu8K1b1QLxtONz+cAsFKslc4sjh
	OT1GQ38MAU26d74BtyVRbH55Gl8+Cf6LP3P7zMGUML9nYHdhXoedYhLLWIpKXcDu
	8UPxKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7ujj77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 48P10CRs032382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:12 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 18:00:12 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v28 04/32] usb: xhci: xhci-sideband: Set IMOD for xHCI
 sideband clients
Date: Tue, 24 Sep 2024 17:59:32 -0700
Message-ID: <20240925010000.2231406-5-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MSXKG88uuFqnuUmaDxAA4ItNFXJ8SOSA
X-Proofpoint-ORIG-GUID: MSXKG88uuFqnuUmaDxAA4ItNFXJ8SOSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=680 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409250005
Message-ID-Hash: HBEDRH4GCKWVZMI6J3YRIGFENQVQDFRS
X-Message-ID-Hash: HBEDRH4GCKWVZMI6J3YRIGFENQVQDFRS
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBEDRH4GCKWVZMI6J3YRIGFENQVQDFRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When creating a secondary interrupter over xHCI, add an argument for
xHCI sideband clients to specify an interrupt moderation value for
the interrupter context assigned.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-sideband.c  | 4 ++--
 include/linux/usb/xhci-sideband.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 69bc234818d2..248d9713570e 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -259,7 +259,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
  */
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear)
+				 bool ip_autoclear, u32 imod_interval)
 {
 	int ret = 0;
 
@@ -273,7 +273,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	}
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg);
+						   num_seg, imod_interval);
 	if (!sb->ir) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 6c11e240fbca..bc5b56a77e37 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -59,7 +59,7 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
 
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear);
+				 bool ip_autoclear, u32 imod_interval);
 
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
