Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB98524A2
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 01:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E79DF8;
	Tue, 13 Feb 2024 01:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E79DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707785833;
	bh=mMfpAsIQkrbAWVmvCtRxOhWRPl8nuSyQX1IpdSaNgfg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jyArsvJT9GwEnsCcl66VzpIn/48izykqCTGRw1IppUcSRcHdlwrkhJcDOHx6aWoPQ
	 yCyYKl9TYAM0s/TG37iMycM2CFiHyOgcXUKj8qR0n/Zqt6zw+KJy/Yd09VoZV5v9sX
	 8/79rCupLeNkpJZ6DCLazpFemXT5VxKMLb09GZmY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A2D8F806C1; Tue, 13 Feb 2024 01:55:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3BE8F805D6;
	Tue, 13 Feb 2024 01:55:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BECEF80635; Tue, 13 Feb 2024 01:54:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 57C10F80238
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C10F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=XygPBqvB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D0qOTG012544;
	Tue, 13 Feb 2024 00:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=0+4zaN2NaOvE5eSNuM7R
	vaMAH7ifIk0BKTL8NmYDuJc=; b=XygPBqvB61Sy75jhoawIbZ1cieWNgHmQUtKX
	9NU0C0A3vM4CSR49dAh4IC4oNR1/tI0cmb7htbUnQ6W8fb7GQR13cfpoSZB+JhM4
	3/iSZenxhv+MyAV/4skt4LGTo4ZROKGg5PnezpnwIU9uF/fvpRmoAVUE+IyuZhF8
	nNagSFghvU1XOHSH+BORbCRbwVaKp57AiBKnzVu51yQueIX06XhsbPb7RyLk2oCg
	CSoop2f+xaOgos4zWpi2ibmKf7o28j7N9mQAbVOC0mtrS2CkekypiYzbLDxOVSC1
	Z4/H5hEOuqdlQogtibzNnW6IDUTSiTFZYG4bUZ1gEdgDZs9Njw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7gvjhuww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0sXYw029955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:33 -0800
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
Subject: [PATCH v15 03/50] xhci: make isoc_bei_interval variable interrupter
 specific.
Date: Mon, 12 Feb 2024 16:53:35 -0800
Message-ID: <20240213005422.3121-4-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240213005422.3121-1-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UAkEcM17QQNU8EHc-qS7S-DnD_kVorXP
X-Proofpoint-ORIG-GUID: UAkEcM17QQNU8EHc-qS7S-DnD_kVorXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=638 adultscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130004
Message-ID-Hash: YW2QESZVRSNIC6KMUFINK7ZOJ2GIV5GI
X-Message-ID-Hash: YW2QESZVRSNIC6KMUFINK7ZOJ2GIV5GI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW2QESZVRSNIC6KMUFINK7ZOJ2GIV5GI/>
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
index f8e78068c36f..1b619a290446 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3103,8 +3103,8 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		event_ring_deq = ir->event_ring->dequeue;
 
 		/* ring is half-full, force isoc trbs to interrupt more often */
-		if (xhci->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
-			xhci->isoc_bei_interval = xhci->isoc_bei_interval / 2;
+		if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
+			ir->isoc_bei_interval = ir->isoc_bei_interval / 2;
 
 		event_loop = 0;
 	}
@@ -3972,7 +3972,8 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
 }
 
 /* Check if we should generate event interrupt for a TD in an isoc URB */
-static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
+static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i,
+				 struct xhci_interrupter *ir)
 {
 	if (xhci->hci_version < 0x100)
 		return false;
@@ -3983,8 +3984,8 @@ static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
 	 * If AVOID_BEI is set the host handles full event rings poorly,
 	 * generate an event at least every 8th TD to clear the event ring
 	 */
-	if (i && xhci->quirks & XHCI_AVOID_BEI)
-		return !!(i % xhci->isoc_bei_interval);
+	if (i && ir->isoc_bei_interval && xhci->quirks & XHCI_AVOID_BEI)
+		return !!(i % ir->isoc_bei_interval);
 
 	return true;
 }
@@ -3993,6 +3994,7 @@ static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
 static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index)
 {
+	struct xhci_interrupter *ir;
 	struct xhci_ring *ep_ring;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
@@ -4010,6 +4012,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
+	ir = xhci->interrupters[0];
 
 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4097,7 +4100,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				td->last_trb = ep_ring->enqueue;
 				td->last_trb_seg = ep_ring->enq_seg;
 				field |= TRB_IOC;
-				if (trb_block_event_intr(xhci, num_tds, i))
+				if (trb_block_event_intr(xhci, num_tds, i, ir))
 					field |= TRB_BEI;
 			}
 			/* Calculate TRB length */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index daee202cd369..44e447fdad62 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1432,6 +1432,7 @@ struct xhci_interrupter {
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
 	bool			ip_autoclear;
+	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;
 	u32	s3_irq_control;
@@ -1504,7 +1505,6 @@ struct xhci_hcd {
 	u8		isoc_threshold;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
-	u32		isoc_bei_interval;
 	int		event_ring_max;
 	/* 4KB min, 128MB max */
 	int		page_size;
