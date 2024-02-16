Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB50C857463
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 05:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F84E94;
	Fri, 16 Feb 2024 05:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F84E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708056154;
	bh=k6s6kSzB8/svTWWBzzyoeJjnSh+acgVjWEnkvkjb4oQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rLLaNfoaLiGqgEm/hJMt9bjdKH32VNmqpTxkf8S0GHNTZ0u4SC3cUEbB6XukiQdAq
	 Ok9QMn4Qt5jqIe3pge9BQFqqSmD7A1zsEdAumh3/Rpre1AwiSRN5xhw4dYz9Xic4zk
	 8+ljiywmuOLHjIQ5i4hgbKgvLnAAwWcQ4Q1DXhfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A28EFF806D6; Fri, 16 Feb 2024 05:00:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23815F806DD;
	Fri, 16 Feb 2024 05:00:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5F19F804CC; Fri, 16 Feb 2024 05:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A953AF800BF
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 04:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A953AF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=SeTzvPmv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G1PUwG032194;
	Fri, 16 Feb 2024 03:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=lsO4yJmUdVXVXdBsL097
	H3KqmzQU/C4+YUsXlA/2pPc=; b=SeTzvPmvlHEOs6SBOScAbEyX6vvlIX2/kGfx
	J5/mYR/+cmJCVv0Jrp4CZFgI9zNu05bT3IhDtlz/Clu2iorAwOVPpCouSSvUWl8K
	jZrSvvq+Sy9nHCkQdwHvf16LeqI/RJ6Jn45eJQRPKvmLae0pDfrm2xMA9sf0g2pX
	a+f8Bpifs4SUzmaImaEYurln5TUU29D5ddmSO2NH+9hYO8KElPR143WLQgAVHV/c
	g79qQR8SvfamDwW78zqxkq8UNeqZQA5Jo3IAzKjOghfCAmWe0dXrfQRNS3W9ZaIq
	hFi0LtRxCxgR+edZQJ0MQabxr30Z4pMqunZ8v6HbuV/sxeyVUQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9wxf06ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41G3xY9M020515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:34 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 19:59:33 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v16 03/50] xhci: make isoc_bei_interval variable interrupter
 specific.
Date: Thu, 15 Feb 2024 19:58:36 -0800
Message-ID: <20240216035923.23392-4-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240216035923.23392-1-quic_wcheng@quicinc.com>
References: <20240216035923.23392-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5UP8p9E9-BQSRHm0RypC6ulgAD84eovK
X-Proofpoint-ORIG-GUID: 5UP8p9E9-BQSRHm0RypC6ulgAD84eovK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_02,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=732
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160029
Message-ID-Hash: 3DXGBZGEPQDARQ5EIRQMRA7ZTRHTZV3E
X-Message-ID-Hash: 3DXGBZGEPQDARQ5EIRQMRA7ZTRHTZV3E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DXGBZGEPQDARQ5EIRQMRA7ZTRHTZV3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

isoc_bei_interval is used to balance how often completed isochronous
events cause interrupts. If interval is too large then the event ring
may fill up before the completed isoc TRBs are handled.

isoc_bei_interval is tuned based on how full the event ring is.

isoc_bei_interval variable needs to be per interrupter as
with several interrupters each one has its own event ring.

move isoc_bei_interval variable to the interrupter structure.

if a secondary interrupter does not care about this feature then
keep isoc_bei_interval 0.

Change-Id: Ic6c7fbebf4f657768ca35d49af327d8de8459b1c
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c  |  2 +-
 drivers/usb/host/xhci-ring.c | 15 +++++++++------
 drivers/usb/host/xhci.h      |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a7716202a8dd..450adaca68ee 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2533,7 +2533,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (xhci_add_interrupter(xhci, ir, 0))
 		goto fail;
 
-	xhci->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
+	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
 	/*
 	 * XXX: Might need to set the Interrupter Moderation Register to
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3d9ec78bfb9f..49f10dc25516 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3153,8 +3153,8 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		event_ring_deq = ir->event_ring->dequeue;
 
 		/* ring is half-full, force isoc trbs to interrupt more often */
-		if (xhci->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
-			xhci->isoc_bei_interval = xhci->isoc_bei_interval / 2;
+		if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
+			ir->isoc_bei_interval = ir->isoc_bei_interval / 2;
 
 		event_loop = 0;
 	}
@@ -4022,7 +4022,8 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
 }
 
 /* Check if we should generate event interrupt for a TD in an isoc URB */
-static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
+static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i,
+				 struct xhci_interrupter *ir)
 {
 	if (xhci->hci_version < 0x100)
 		return false;
@@ -4033,8 +4034,8 @@ static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
 	 * If AVOID_BEI is set the host handles full event rings poorly,
 	 * generate an event at least every 8th TD to clear the event ring
 	 */
-	if (i && xhci->quirks & XHCI_AVOID_BEI)
-		return !!(i % xhci->isoc_bei_interval);
+	if (i && ir->isoc_bei_interval && xhci->quirks & XHCI_AVOID_BEI)
+		return !!(i % ir->isoc_bei_interval);
 
 	return true;
 }
@@ -4043,6 +4044,7 @@ static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
 static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index)
 {
+	struct xhci_interrupter *ir;
 	struct xhci_ring *ep_ring;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
@@ -4060,6 +4062,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
+	ir = xhci->interrupters[0];
 
 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4147,7 +4150,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				td->last_trb = ep_ring->enqueue;
 				td->last_trb_seg = ep_ring->enq_seg;
 				field |= TRB_IOC;
-				if (trb_block_event_intr(xhci, num_tds, i))
+				if (trb_block_event_intr(xhci, num_tds, i, ir))
 					field |= TRB_BEI;
 			}
 			/* Calculate TRB length */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 36c3ba64da51..6e09b9130fae 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1433,6 +1433,7 @@ struct xhci_interrupter {
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
 	bool			ip_autoclear;
+	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;
 	u32	s3_irq_control;
@@ -1505,7 +1506,6 @@ struct xhci_hcd {
 	u8		isoc_threshold;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
-	u32		isoc_bei_interval;
 	int		event_ring_max;
 	/* 4KB min, 128MB max */
 	int		page_size;
