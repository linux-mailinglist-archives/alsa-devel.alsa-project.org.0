Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E77605CC
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1146B84D;
	Tue, 25 Jul 2023 04:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1146B84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690252751;
	bh=+9hTeOADNfSohPt81UeeXFaLyEUCuhClD7U6js5t/vM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o8EMqmfXGctKSTlQTGf9q9GkzNRep/aMRlwPuS+iZk/ywuohipWsRRHo/meguURrg
	 wqQiKCpibLoxqWjJrGXV2kegePwnNxAWywF2x62p6WLAI5pj8VpbjEsu2rvrpeGkXz
	 Km3ZyfVRRhJ7pRJnQTi4lJUGMTQL3iUqvJOyL0Tc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69111F8060C; Tue, 25 Jul 2023 04:35:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D30EBF805FF;
	Tue, 25 Jul 2023 04:35:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02FEDF805FA; Tue, 25 Jul 2023 04:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBC31F80549
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC31F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Vz2QpOE5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P29ieL004483;
	Tue, 25 Jul 2023 02:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=hNMyBmIu9r/HwzkzpGQFW5q035L4p8kfphT92WFsXks=;
 b=Vz2QpOE5suUjDqIIqiVHIJ6hCe8FNagudfCabm/UxT92wo8LIKUoKitDMzt5lVs+lxzf
 SIQoBNd9IQKuwe+1etIlJg55DdHK0k9vMJKTlX55q4VzdG8Zj4atNFI3Tn2SDZQcF294
 9Tgm6r+TdUzNpVwzJdtMCA/I5cg90CKT18gHxV6QEqatb8KKLGpMpth1r6KwUpeMF6rI
 DqAZm5Tp1sk/fbZbvQy8xZsv0yJI30fblhyGHuSBqPAG1dZ6OxbJD2w3iqNtELdl4+hL
 07wzc6jC9f2LB7MQAn1aEVZbgN85dsXpjr/f50h17Ky55Z4cpZ4/yw2pqRAWOdFetI+b 6Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1r4v9sw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:39 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YXeJ012417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 19:34:32 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <pierre-louis.bossart@linux.intel.com>,
        <oneukum@suse.com>, <albertccwang@google.com>,
        <o-takashi@sakamocchi.jp>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v4 05/32] usb: host: xhci-mem: Allow for interrupter clients
 to choose specific index
Date: Mon, 24 Jul 2023 19:33:49 -0700
Message-ID: <20230725023416.11205-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230725023416.11205-1-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8NtBFMTlu9DJf5AFkOujwuY3Lw0IY9tG
X-Proofpoint-ORIG-GUID: 8NtBFMTlu9DJf5AFkOujwuY3Lw0IY9tG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxlogscore=593
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250021
Message-ID-Hash: CHPNR6AQNKF3COF4YMFHELKT7ZBSDG55
X-Message-ID-Hash: CHPNR6AQNKF3COF4YMFHELKT7ZBSDG55
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHPNR6AQNKF3COF4YMFHELKT7ZBSDG55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some clients may operate only on a specific XHCI interrupter instance.
Allow for the associated class driver to request for the interrupter that
it requires.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c   | 12 ++++++------
 include/linux/usb/xhci-intr.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 6b01d56c176f..310137df06eb 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2396,7 +2396,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2411,15 +2411,15 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd)
 		return NULL;
 
 	spin_lock_irq(&xhci->lock);
-
 	/* Find available secondary interrupter, interrupter 0 is reserverd for primary */
 	for (i = 1; i < xhci->max_interrupters; i++) {
-		if (xhci->interrupters[i] == NULL) {
-			err = xhci_add_interrupter(xhci, ir, i);
-			break;
+		if ((intr_num > 0 && i == intr_num) || intr_num <= 0) {
+			if (xhci->interrupters[i] == NULL) {
+				err = xhci_add_interrupter(xhci, ir, i);
+				break;
+			}
 		}
 	}
-
 	spin_unlock_irq(&xhci->lock);
 
 	if (!err) {
diff --git a/include/linux/usb/xhci-intr.h b/include/linux/usb/xhci-intr.h
index e0091ee2c73a..738b0f0481a6 100644
--- a/include/linux/usb/xhci-intr.h
+++ b/include/linux/usb/xhci-intr.h
@@ -81,6 +81,6 @@ struct xhci_interrupter {
 };
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir);
 #endif
