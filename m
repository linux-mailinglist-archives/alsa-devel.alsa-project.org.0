Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825348152F0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 23:02:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCAF0ECA;
	Fri, 15 Dec 2023 23:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCAF0ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702677763;
	bh=dOPe1mJClSQIpRCzsjeCtfvU3YlKJ4n/3TVeFilcQy8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HkkRV/JnyAsyKZSzlYjtC9o1+rWUxhxfXgVWVzeKs5hj1i/xsgKdmHpnclal/anCR
	 s13gJk45Hlv0aBAga6fb2kQkBbRMK3XZQozbYU7pOZslJ2a6aT5YPHmY68iJ58beD+
	 jbH7gkpEpW1en1MeLP00Yz/AcOyzREvByJNNdkqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 178C5F898CC; Fri, 15 Dec 2023 22:53:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FCD6F898C6;
	Fri, 15 Dec 2023 22:53:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4019F8020D; Fri, 15 Dec 2023 22:53:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E76D7F8020D
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 22:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E76D7F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=i9+XhRiV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BFICufM018057;
	Fri, 15 Dec 2023 21:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=q9wsZr9hk6oekRD8z74N
	6sV+NK+QirK5GCM36reO4w4=; b=i9+XhRiVUinf62GXHrhlztr2bZ/UiDisMEQA
	lkOJnq+DQLL5WSAjTaMQcrG+crbyJE3OOCV0aMZQsJrBZCXlqu9721ySlw7me8Zs
	FTYm44JXJiXvJZ1exdUN2e3VMX6Z6ithwLvSdsgmJTOadPgXOWDvLI7aUUS0khso
	6/tn+R8mEEJXKm6m9mIu/9jVRyZrtyBtco76s/NJg4vVr86glihUMWDmiDerb3hD
	KYy74ys/ERJ5QPnOHoYFmaVSjvdyoM2DNv0xUBWLoBan1I9gW9yrxmcuPa5eCN1r
	DlVCqvPsbRblatVP0B16hdSobF5BJX0N9L9MWS1FuAg4OIV9Wg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0up20gj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BFLo7kL031379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:07 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Dec 2023 13:50:06 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@linaro.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v10 05/41] usb: host: xhci-mem: Allow for interrupter clients
 to choose specific index
Date: Fri, 15 Dec 2023 13:49:19 -0800
Message-ID: <20231215214955.12110-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231215214955.12110-1-quic_wcheng@quicinc.com>
References: <20231215214955.12110-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Vs9MvHT2FyNcssrHT_nc3ibWWyVyFFC-
X-Proofpoint-ORIG-GUID: Vs9MvHT2FyNcssrHT_nc3ibWWyVyFFC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=666
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150152
Message-ID-Hash: Q4FR4IXY5ZX7UCUQ5QL4J33SOVQ5XM2Q
X-Message-ID-Hash: Q4FR4IXY5ZX7UCUQ5QL4J33SOVQ5XM2Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4FR4IXY5ZX7UCUQ5QL4J33SOVQ5XM2Q/>
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
 drivers/usb/host/xhci-mem.c       | 30 ++++++++++++++++--------------
 drivers/usb/host/xhci-sideband.c  |  4 ++--
 drivers/usb/host/xhci.h           |  2 +-
 include/linux/usb/xhci-sideband.h |  3 ++-
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 5bf74c37cbf6..8e24342a19c5 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2356,7 +2356,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg, int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2371,28 +2371,30 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg)
 		return NULL;
 
 	spin_lock_irq(&xhci->lock);
-
-	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
+	/* Find available secondary interrupter, interrupter 0 is reserverd for primary */
 	for (i = 1; i < xhci->max_interrupters; i++) {
-		if (xhci->interrupters[i] == NULL) {
-			err = xhci_add_interrupter(xhci, ir, i);
-			break;
+		if ((intr_num > 0 && i == intr_num) || intr_num <= 0) {
+			if (xhci->interrupters[i] == NULL) {
+				err = xhci_add_interrupter(xhci, ir, i);
+				if (err) {
+					spin_unlock_irq(&xhci->lock);
+					goto free_ir;
+				}
+				break;
+			}
 		}
 	}
-
 	spin_unlock_irq(&xhci->lock);
 
-	if (err) {
-		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
-			  xhci->max_interrupters);
-		xhci_free_interrupter(xhci, ir);
-		return NULL;
-	}
-
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 i, xhci->max_interrupters);
 
 	return ir;
+
+free_ir:
+	xhci_free_interrupter(xhci, ir);
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index eb5ac5fc5c09..624044dc6228 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -243,13 +243,13 @@ EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
  * Returns 0 on success, negative error otherwise
  */
 int
-xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg)
+xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg, int intr_num)
 {
 	if (sb->ir)
 		return -EBUSY;
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-			num_seg);
+			num_seg, intr_num);
 	if (!sb->ir)
 		return -ENOMEM;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 37887c2f0653..966681195e41 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2090,7 +2090,7 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg, int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 823f9314d93a..3ff0afbf3a05 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -54,7 +54,8 @@ struct sg_table *
 xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
 
 int
-xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg);
+xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
+				 int intr_num);
 
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
