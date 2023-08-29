Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5430578CEA2
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 23:14:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDAF6E7E;
	Tue, 29 Aug 2023 23:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDAF6E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693343668;
	bh=NGpr+64J8oCw5YykAAwJ0/JEKKzE0FMq4bdwH822eRQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=duus4I+xjy36+HEOewdnBJbWCnOJ3AiMlbOeXwnAS5UUQ0cJtIALuNahyPagtV9uV
	 eQ7dQ7w97ZIQrTVKzzPRk/4MzZwtf19FkLHiq4AIDdkX0dKuEhRrsdrPTDpZ56Pr8M
	 wdmyAVYwjKQUdZgcDYFB28USEkA9/YQdk+z4UUho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 465DFF80683; Tue, 29 Aug 2023 23:08:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9624AF80682;
	Tue, 29 Aug 2023 23:08:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61E66F80633; Tue, 29 Aug 2023 23:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B12FF80158
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 23:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B12FF80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=EfYmQooC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKi69u016674;
	Tue, 29 Aug 2023 21:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=r31eiFMh/CBoLoST6JeTG7QMm3NUYna5E/5qOM98ZVk=;
 b=EfYmQooCe4L8CpmQAMAa5XBSW7TFRkILBs+fkU/WLdgPBKQ6qPA7qm51+/1qfP7lH28F
 cABS1sdGZyj4lrS49s04PYgg0Q3vi635NvclT8wnz46J5Kv45ybQJwdKN/K92HCVSYE8
 lic86IblkGQcG9CWGJgVbnj4k3edS37evrcD/URe8JvZM/QQdGFwL/aGByMURDGj5eeP
 3pKcFiynu6xozXDOY/se6zNB5H6F71k6qTz3ut+3hrG8F1CzNysJJMKnQvmUMUF6ryDF
 reFpx/3Bk4ILjnpUSCfLnHeThSO/YHg8A7vmaMe6YyUxUgFgapt/td6HRtgaoFtyrUU6 gQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssjvb0tyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37TL79hA014461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:09 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 14:07:08 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v5 05/32] usb: host: xhci-mem: Allow for interrupter clients
 to choose specific index
Date: Tue, 29 Aug 2023 14:06:30 -0700
Message-ID: <20230829210657.9904-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230829210657.9904-1-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kZAXBwe3ZLRQtxN1ZGsHZssKG7Nbv6sD
X-Proofpoint-GUID: kZAXBwe3ZLRQtxN1ZGsHZssKG7Nbv6sD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_14,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=518 priorityscore=1501 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290182
Message-ID-Hash: UZUELAEOTGFVQUYRJE7T46NFS4BYRJQF
X-Message-ID-Hash: UZUELAEOTGFVQUYRJE7T46NFS4BYRJQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZUELAEOTGFVQUYRJE7T46NFS4BYRJQF/>
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
index 94cbc25e77ca..9d07aea34fc6 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2328,7 +2328,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2343,15 +2343,15 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd)
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
 	if (err) {
 		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
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
