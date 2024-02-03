Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF7847F74
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 03:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62DBBE7D;
	Sat,  3 Feb 2024 03:50:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62DBBE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706928639;
	bh=noUq46uIIl4c54Ml8nUqG/zmcTMdZmp/uQzsEWtdfvc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hCb4efT/xaTHGK74pKmnDdk/4MhaPrzlNW5lM9uztyulDx3PEkSlKRowfr+cY8eC3
	 teQGY6+NjrhnySFX6sJu95fx0c1ORwbLpZIH5YGu9sLkM9wzNDi86R+GBMw/O3ZwtQ
	 jRw6x3ekAYzbjySbiNSdFBrR8zeL8xfAo8Ik5+LQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99CC7F8997B; Sat,  3 Feb 2024 03:40:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA5EF8990A;
	Sat,  3 Feb 2024 03:40:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCD07F897DC; Sat,  3 Feb 2024 03:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1AFEF805E2
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 03:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AFEF805E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=pzfWvprK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4132Q6pU011583;
	Sat, 3 Feb 2024 02:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=YEmwQFMFTsyU12bZ+DA3
	QUirFGkywDIHtACo1YVzlzE=; b=pzfWvprKD/xArMyTZ9GG8SN2JhDChzTFjivw
	pKiOFrWLmHmZ+rCBOjvmFRUz2K/RdazLn9c8WMUeLr2NYe7FKaNu4aSAbAFzkoml
	3EOTeWev7GsIPvw7vlcGlSv+PrsQzo8w7yanlSjRoAFU7Ca2BUUeZiXoyWoHqPL3
	39X71RE3O6tX+EPOVpw9IsjTBDrOTTxWSyk3fSZGS45R3EeH38/L004MnwqUIHRv
	K5gZyDa6gETzGU4G2tJF4hbgI+uULfYCzmgv+QOA7nZBDdbd1F1DuRrxI0vpvgSZ
	JcWvyO7RV22O4oD7NLMGND/6fjuIe7G0zcWlsDIeIFMwl1xlKw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w1cgcg0r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 Feb 2024 02:37:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4132bKAU003516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 Feb 2024 02:37:20 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 18:37:20 -0800
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
Subject: [PATCH v13 11/53] xhci: Decouple handling an event from checking for
 unhandled events
Date: Fri, 2 Feb 2024 18:36:03 -0800
Message-ID: <20240203023645.31105-12-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240203023645.31105-1-quic_wcheng@quicinc.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8dmOrL1HiVl1reC7TCUxjJB6MvR2plPf
X-Proofpoint-ORIG-GUID: 8dmOrL1HiVl1reC7TCUxjJB6MvR2plPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=739 spamscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402030015
Message-ID-Hash: VFW4OJEWH5PIDEBUWPURSANOYUMHS2Z3
X-Message-ID-Hash: VFW4OJEWH5PIDEBUWPURSANOYUMHS2Z3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFW4OJEWH5PIDEBUWPURSANOYUMHS2Z3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Some sequences, will require traversing through the entire event ring
without handling the event TRB.  This is ideal for when secondary
interrupters that are utilized by external entities need to clean up the
interrupter's event rings during halting of the XHCI HCD.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 38 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 293239d8fab0..6ef95f67970a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2912,25 +2912,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 }
 
 /*
- * This function handles all OS-owned events on the event ring.  It may drop
+ * This function handles one OS-owned event on the event ring. It may drop
  * xhci->lock between event processing (e.g. to pass up port status changes).
- * Returns >0 for "possibly more events to process" (caller should call again),
- * otherwise 0 if done.  In future, <0 returns should indicate error code.
  */
-static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
+				 union xhci_trb *event)
 {
-	union xhci_trb *event;
 	u32 trb_type;
 
-	event = ir->event_ring->dequeue;
-
-	if (!unhandled_event_trb(ir->event_ring))
-		return 0;
-
 	trace_xhci_handle_event(ir->event_ring, &event->generic);
 
 	/*
-	 * Barrier between reading the TRB_CYCLE (valid) flag above and any
+	 * Barrier between reading the TRB_CYCLE (valid) flag before, and any
 	 * speculative reads of the event's flags/data below.
 	 */
 	rmb();
@@ -2960,15 +2953,11 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	 * to make sure a watchdog timer didn't mark the host as non-responsive.
 	 */
 	if (xhci->xhc_state & XHCI_STATE_DYING) {
-		xhci_dbg(xhci, "xHCI host dying, returning from "
-				"event handler.\n");
-		return 0;
+		xhci_dbg(xhci, "xHCI host dying, returning from event handler.\n");
+		return -ENODEV;
 	}
 
-	/* Are there more items on the event ring?  Caller will call us again to
-	 * check.
-	 */
-	return 1;
+	return 0;
 }
 
 /*
@@ -3018,9 +3007,14 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 	}
 }
 
+/*
+ * Handle all OS-owned events on an interrupter event ring. It may drop
+ * and reaquire xhci->lock between event processing.
+ */
 static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	int event_loop = 0;
+	int err;
 	u64 temp;
 
 	xhci_clear_interrupt_pending(xhci, ir);
@@ -3041,7 +3035,10 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 		return -ENODEV;
 	}
 
-	while (xhci_handle_event(xhci, ir) > 0) {
+	/* Process all OS owned event TRBs on this event ring */
+	while (unhandled_event_trb(ir->event_ring)) {
+		err = xhci_handle_event_trb(xhci, ir, ir->event_ring->dequeue);
+
 		/*
 		 * If half a segment of events have been handled in one go then
 		 * update ERDP, and force isoc trbs to interrupt more often
@@ -3057,6 +3054,9 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 
 		/* Update SW event ring dequeue pointer */
 		inc_deq(xhci, ir->event_ring);
+
+		if (err)
+			break;
 	}
 
 	xhci_update_erst_dequeue(xhci, ir, true);
