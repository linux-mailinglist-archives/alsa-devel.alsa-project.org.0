Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41A85747A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 05:03:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F71950;
	Fri, 16 Feb 2024 05:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F71950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708056197;
	bh=BOgnzqSeugy1ePA3DxtGBMGmPersYkCAH7PyoKCwcbs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=llgLuq/8457W0HTk/eoSNrvJ84btSW16Negqh/gqNMMiTTOnGS8hnrjdEXdCBScig
	 HDJEh+/4D8PZvE3YStdGRuKNmamjNdQzDIWiKGWOtWlFJV2vB7Ye0UmQplqZWPOKWw
	 FEOeN59jMykr9VbYCtZRSXFczwlgoogKW8OBxxxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3761F80710; Fri, 16 Feb 2024 05:00:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F9DF8071F;
	Fri, 16 Feb 2024 05:00:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BDD7F8025A; Fri, 16 Feb 2024 05:00:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F434F80570
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 04:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F434F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=c6JYAr4T
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G3soTj025107;
	Fri, 16 Feb 2024 03:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=TN3VgYhI4RkpJlz88zfk
	OX4pCYpGljdOPfk96YG1FyU=; b=c6JYAr4TEXAhkAruTIKc9oGEwkO/OFUwh5cR
	yQxsFj0wJ9NPwoUdFIlXqY8zOGFLEyP6cgVErVzDbFhqpoIfR6G9yVYX4O3sN8AV
	wAhWZtmaLp+NtNmvKoDnLq46rWSCkIG9xCc9XbX9gsm7/8dtSIeM1gRdwfhgTTaj
	Xhbh6rKH3wQI4QZPJuul+yHsCDQTldFhNrDex8aScZtGCl56iT+rPKGkd882iuy7
	H+OAs/UfsNkVVUIDqS0K3SdPwdeMEqaVI3fh5DcoF2AsgYbhf1ynUcpDKMFIXuvL
	wxGYqO4YffJTYLGwUtFIUBVfEHaPc6Ihz97JyqhFfNVrwbA6oA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9fkfap2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41G3xZfL032233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:35 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 19:59:35 -0800
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
Subject: [PATCH v16 09/50] xhci: Decouple handling an event from checking for
 unhandled events
Date: Thu, 15 Feb 2024 19:58:42 -0800
Message-ID: <20240216035923.23392-10-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 9jNtm_kXG9WVq-iRdi3Ea8y64A6va-NX
X-Proofpoint-GUID: 9jNtm_kXG9WVq-iRdi3Ea8y64A6va-NX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_02,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=883
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160029
Message-ID-Hash: UGBWATHVUOPUUH2JWTH47GC7LNWDX26Q
X-Message-ID-Hash: UGBWATHVUOPUUH2JWTH47GC7LNWDX26Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGBWATHVUOPUUH2JWTH47GC7LNWDX26Q/>
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

Change-Id: Ia36a0d50267cb07be8f449b3b10c7b9cf1eddd49
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 38 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d31599d46b92..d4a28ac4967f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2962,25 +2962,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -3010,15 +3003,11 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
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
@@ -3068,9 +3057,14 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
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
@@ -3091,7 +3085,10 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
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
@@ -3107,6 +3104,9 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 
 		/* Update SW event ring dequeue pointer */
 		inc_deq(xhci, ir->event_ring);
+
+		if (err)
+			break;
 	}
 
 	xhci_update_erst_dequeue(xhci, ir, true);
