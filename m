Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B58524A5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 01:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30AC383E;
	Tue, 13 Feb 2024 01:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30AC383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707785840;
	bh=V8MdAsKTPp0AteG57V12qaeFcyZsxonTIhHZ2e6F4Bs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=smYSuiEKgrnqmOazqk9U/tGeIIgO4Dc1mSlTwkRuEuDWSt8/bFSYLuHJyzKaLD1UB
	 69akIP3NTz1BzPP0yvMflzWY+7Dr9OBhbxPK0foaIGIG4fqz5IV0EbnyZtkvfufyhf
	 KQBlIjOhpy9n1vYjEW41s1N6FcP0sxwZxRm3irU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50FB7F806E2; Tue, 13 Feb 2024 01:55:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 057FFF806E3;
	Tue, 13 Feb 2024 01:55:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 010AEF8061C; Tue, 13 Feb 2024 01:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CADF6F80567
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CADF6F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=a3NiQawg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D0bZj9005335;
	Tue, 13 Feb 2024 00:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=r/s48r7Nd+rNVTCx+HL8
	7L+3Njw26bFVh6+6XCcEXOU=; b=a3NiQawgLCWE1XTKxeDeI6RWlDd12MzOPzpb
	awDzHtKo/O4kL1aDJu3eoca9G7U7+H0UKLywqgHYg5ycpT+jUvtvDvR+V+qtXbRx
	VD/ThNo2cRLcuW9HHESGx324nY9RlgzVNrdudqKMaD5G9lS20fASbwg4vOjCmU1T
	x/nchYFGZoNfCWU/NDWRxuCP7VnO6e5BYF7cIf1JcUYDtIRPMulsm0emWtzw7a58
	LHxlzIYKszPE5tQHiflI1jM11MmNyQPEJmNRgEVbkXAgmOnXtr+IM/8M48L3Rb9X
	oh7NhAXAWvEidOrPaArMtyS8yLy9m3QyJyTCKXfb8WQ/Mjq3Dw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62kt4ty9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0sYWW026767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:34 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:34 -0800
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
Subject: [PATCH v15 06/50] xhci: move event processing for one interrupter to
 a separate function
Date: Mon, 12 Feb 2024 16:53:38 -0800
Message-ID: <20240213005422.3121-7-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: qBvbpYauSl0v5LFXg7yx5sJbrhM-xZAt
X-Proofpoint-ORIG-GUID: qBvbpYauSl0v5LFXg7yx5sJbrhM-xZAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130005
Message-ID-Hash: ZWJR5ALZDJJLCZ2RMREVX46JKOPTCG6J
X-Message-ID-Hash: ZWJR5ALZDJJLCZ2RMREVX46JKOPTCG6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWJR5ALZDJJLCZ2RMREVX46JKOPTCG6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Split the main XHCI interrupt handler into a different API, so that other
potential interrupters can utilize similar event ring handling.  A scenario
would be if a secondary interrupter required to skip pending events in the
event ring, which would warrant a similar set of operations.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 87 +++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0289d77839cf..338b6fddedc3 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3019,6 +3019,46 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 	}
 }
 
+static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+{
+	int event_loop = 0;
+	u64 temp;
+
+	xhci_clear_interrupt_pending(xhci, ir);
+
+	if (xhci->xhc_state & XHCI_STATE_DYING ||
+	    xhci->xhc_state & XHCI_STATE_HALTED) {
+		xhci_dbg(xhci, "xHCI dying, ignoring interrupt. Shouldn't IRQs be disabled?\n");
+
+		/* Clear the event handler busy flag (RW1C) */
+		temp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+		xhci_write_64(xhci, temp | ERST_EHB, &ir->ir_set->erst_dequeue);
+		return -ENODEV;
+	}
+
+	while (xhci_handle_event(xhci, ir) > 0) {
+		/*
+		 * If half a segment of events have been handled in one go then
+		 * update ERDP, and force isoc trbs to interrupt more often
+		 */
+		if (event_loop++ > TRBS_PER_SEGMENT / 2) {
+			xhci_update_erst_dequeue(xhci, ir, false);
+
+			if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
+				ir->isoc_bei_interval = ir->isoc_bei_interval / 2;
+
+			event_loop = 0;
+		}
+
+		/* Update SW event ring dequeue pointer */
+		inc_deq(xhci, ir->event_ring);
+	}
+
+	xhci_update_erst_dequeue(xhci, ir, true);
+
+	return 0;
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error condition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
@@ -3027,11 +3067,8 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 irqreturn_t xhci_irq(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_interrupter *ir;
 	irqreturn_t ret = IRQ_NONE;
-	u64 temp_64;
 	u32 status;
-	int event_loop = 0;
 
 	spin_lock(&xhci->lock);
 	/* Check if the xHC generated the interrupt, or the irq is shared */
@@ -3064,50 +3101,10 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	 */
 	status |= STS_EINT;
 	writel(status, &xhci->op_regs->status);
-
-	/* This is the handler of the primary interrupter */
-	ir = xhci->interrupters[0];
-
-	xhci_clear_interrupt_pending(xhci, ir);
-
-	if (xhci->xhc_state & XHCI_STATE_DYING ||
-	    xhci->xhc_state & XHCI_STATE_HALTED) {
-		xhci_dbg(xhci, "xHCI dying, ignoring interrupt. "
-				"Shouldn't IRQs be disabled?\n");
-		/* Clear the event handler busy flag (RW1C);
-		 * the event ring should be empty.
-		 */
-		temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-		xhci_write_64(xhci, temp_64 | ERST_EHB,
-				&ir->ir_set->erst_dequeue);
-		ret = IRQ_HANDLED;
-		goto out;
-	}
-
-	/* FIXME this should be a delayed service routine
-	 * that clears the EHB.
-	 */
-	while (xhci_handle_event(xhci, ir) > 0) {
-		/*
-		 * If half a segment of events have been handled in one go then
-		 * update ERDP, and force isoc trbs to interrupt more often
-		 */
-		if (event_loop++ > TRBS_PER_SEGMENT / 2) {
-			xhci_update_erst_dequeue(xhci, ir, false);
-
-			if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
-				ir->isoc_bei_interval = ir->isoc_bei_interval / 2;
-
-			event_loop = 0;
-		}
-
-		/* Update SW event ring dequeue pointer */
-		inc_deq(xhci, ir->event_ring);
-	}
-
-	xhci_update_erst_dequeue(xhci, ir, true);
 	ret = IRQ_HANDLED;
 
+	/* This is the handler of the primary interrupter */
+	xhci_handle_events(xhci, xhci->interrupters[0]);
 out:
 	spin_unlock(&xhci->lock);
 
