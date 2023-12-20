Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3581A958
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 23:47:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D481E825;
	Wed, 20 Dec 2023 23:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D481E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703112465;
	bh=Jc2Mpwhk0poVuDshNre4am0eWc84tHRBF0AiFPuoIWY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cDSJxDXB6bY03rRn5Z9+CTphqaHHk7M/eD7KQWyUMsXKP0Q90c3CjKJr/njT6FEoa
	 w7O4B/Sl9SfiDr/CNCE0hmeLw8ax9keRaHtBwfZsQdKRMs/8Tsdt0Yvl/5jkRwnwtz
	 rKEs68f7TTRmsanIIf3bx+hBaDOAIYQxOoBqDkCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B93BBF80641; Wed, 20 Dec 2023 23:46:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3E5F8063E;
	Wed, 20 Dec 2023 23:46:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE67F805D2; Wed, 20 Dec 2023 23:46:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E196AF8016E
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 23:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E196AF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eaQ4n4as
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKLJSCA024546;
	Wed, 20 Dec 2023 22:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=dvSeSujDsWAxoUgpDofY
	eTPsm6P/pMlRxfIJ/11lUYU=; b=eaQ4n4as4L3eylyBW1WUWyCYYpaxuipPP+P4
	dVpvDNUHH/XDbYdkQPr7DE0gZE+JWU31mZ0//B+xbCuYLdZI2wgluPjYbSzkcMAj
	5H2dUNjszNUygS0Yy+4vBFRvJArwuOTCk9Sk4dh5hQBgJtRGSyO2D3jD92ogLQf3
	sTNs6jGuFXAKLFvH2QRHf4n9bfGfpAA1uII055SW/BH4tvZ+C2A8KMy/RH7CpCrU
	ZpMHHjlm6qJ6tisn/cKSCbcBDRSDDssT1tzvtnWgMAPsl9UYdbvPLtmus17dd4tB
	ggjXwoF4d41fy9XxgJ77RHZvJDBAEF4E14T197Js8fGK0HP9mA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v37vxw2s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 22:45:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BKMjsIh007919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 22:45:54 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 20 Dec 2023 14:45:54 -0800
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
Subject: [PATCH v11 04/41] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
Date: Wed, 20 Dec 2023 14:45:07 -0800
Message-ID: <20231220224544.18031-5-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220224544.18031-1-quic_wcheng@quicinc.com>
References: <20231220224544.18031-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ptU1pFl-9Z2v7wQukOHceXaTLVQ45Z3r
X-Proofpoint-GUID: ptU1pFl-9Z2v7wQukOHceXaTLVQ45Z3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=796
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200163
Message-ID-Hash: ATL7MSYUA3XTUXWRZW5QPUY2QKKLWWQ5
X-Message-ID-Hash: ATL7MSYUA3XTUXWRZW5QPUY2QKKLWWQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATL7MSYUA3XTUXWRZW5QPUY2QKKLWWQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As part of xHCI bus suspend, the XHCI is halted.  However, if there are
pending events in the secondary event ring, it is observed that the xHCI
controller stops responding to further commands upon host or device
initiated bus resume.  Iterate through all pending events and update the
dequeue pointer to the beginning of the event ring.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c  | 11 +++++----
 drivers/usb/host/xhci-ring.c | 46 +++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.c      |  2 +-
 drivers/usb/host/xhci.h      |  7 ++++++
 4 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4460fa7e9fab..5bf74c37cbf6 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1827,7 +1827,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp &= ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
-		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
+		xhci_update_erst_dequeue(xhci, ir, ir->event_ring->first_seg->trbs, true);
 	}
 }
 
@@ -1865,11 +1865,12 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
 		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
 
-	/* fixme, should we check xhci->interrupter[intr_num] == ir */
-	/* fixme locking */
-
 	spin_lock_irq(&xhci->lock);
-
+	/*
+	 * Cleanup secondary interrupter to ensure there are no pending events.
+	 * This also updates event ring dequeue pointer back to the start.
+	 */
+	xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
 	intr_num = ir->intr_num;
 
 	xhci_remove_interrupter(xhci, ir);
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 33806ae966f9..448417c5d5b1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2980,7 +2980,7 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
  * - When all events have finished
  * - To avoid "Event Ring Full Error" condition
  */
-static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 				     struct xhci_interrupter *ir,
 				     union xhci_trb *event_ring_deq,
 				     bool clear_ehb)
@@ -3013,6 +3013,50 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 	xhci_write_64(xhci, temp_64, &ir->ir_set->erst_dequeue);
 }
 
+/*
+ * Move the event ring dequeue pointer to skip events kept in the secondary
+ * event ring.  This is used to ensure that pending events in the ring are
+ * acknowledged, so the XHCI HCD can properly enter suspend/resume.  The
+ * secondary ring is typically maintained by an external component.
+ */
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+	struct xhci_ring *ring,	struct xhci_interrupter *ir)
+{
+	union xhci_trb *erdp_trb, *current_trb;
+	u64 erdp_reg;
+	u32 iman_reg;
+	dma_addr_t deq;
+
+	/* disable irq, ack pending interrupt and ack all pending events */
+	xhci_disable_interrupter(ir);
+	iman_reg = readl_relaxed(&ir->ir_set->irq_pending);
+	if (iman_reg & IMAN_IP)
+		writel_relaxed(iman_reg, &ir->ir_set->irq_pending);
+
+	/* last acked event trb is in erdp reg  */
+	erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
+	if (!deq) {
+		xhci_err(xhci, "event ring handling not required\n");
+		return;
+	}
+
+	erdp_trb = current_trb = ir->event_ring->dequeue;
+	/* read cycle state of the last acked trb to find out CCS */
+	ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
+
+	while (1) {
+		inc_deq(xhci, ir->event_ring);
+		erdp_trb = ir->event_ring->dequeue;
+		/* cycle state transition */
+		if ((le32_to_cpu(erdp_trb->event_cmd.flags) & TRB_CYCLE) !=
+		    ring->cycle_state)
+			break;
+	}
+
+	xhci_update_erst_dequeue(xhci, ir, current_trb, true);
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error condition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 573ca5c4f31a..eb15c63e6775 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -333,7 +333,7 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+int xhci_disable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index e98099b960e4..37887c2f0653 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2093,6 +2093,9 @@ struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+	struct xhci_ring *ring,	struct xhci_interrupter *ir);
+int xhci_disable_interrupter(struct xhci_interrupter *ir);
 
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
@@ -2180,6 +2183,10 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
+void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+				     struct xhci_interrupter *ir,
+				     union xhci_trb *event_ring_deq,
+				     bool clear_ehb);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
