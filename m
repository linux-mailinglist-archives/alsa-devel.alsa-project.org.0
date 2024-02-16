Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9E857448
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 05:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 988DAE69;
	Fri, 16 Feb 2024 05:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 988DAE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708056106;
	bh=SP1tDT+ZcI4HMbOwwegDpk1cEkI9cNbmVOWO+1TEhlI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RatYwQXy7GYlObM+1uc+6PNS4VZiTVm4OVpOc8CQsdySq4RJ00ZmioQwABqQHrwyK
	 7Riu+KNNUqVPUM4NTmp/G/IPmuFh1EOaZY+5/p0wE3vV2v4G1IR4B0Cntdh/68NG3i
	 mUVrEi/pIN1N1BotVLHCQG6d88X7M6wHnIOGSpJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8825CF8057C; Fri, 16 Feb 2024 05:00:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E5FF80693;
	Fri, 16 Feb 2024 05:00:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63BDBF80608; Fri, 16 Feb 2024 05:00:04 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BA2FF80238
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 04:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA2FF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=DWoskuX9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G3ePVG031287;
	Fri, 16 Feb 2024 03:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=vmf1cZXxABjiR/1HcLIk
	vsjwqfLe94Nw6IqAgIOtkyo=; b=DWoskuX9RTmG4Q62/l2UnFdm5mPMjmV2y8jL
	lKSkNfgiK5qUjDGf45kuhm4a459F7KoBg6dhmaFcGFS58eLpZS4Vagoe5XUPF7PI
	eonDJpwrcB8/t+LU+5QW2ktm9ig/O2TzjDp9Znz2b1SaYxnR9g6vLGI11i+UxIXe
	H0ihLizrlRNpRbw2QFDbrCIuOO0ZYAbssBsEaDZWXa6YH2V3s5Asij1Bl4Z7pOPF
	N9ihvoejqSRPu0IcHaN04jaEtqGUVxAaCjsY7da+uAA5vJMNmHegK4Ina6MqlIN2
	6zunykdtF6PdY5xL99TUCVQN7w0gU5ZeFMeUrZap+U88XTMZCA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9435uvcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41G3xY41024879
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
Subject: [PATCH v16 04/50] xhci: remove unnecessary event_ring_deq parameter
 from xhci_handle_event()
Date: Thu, 15 Feb 2024 19:58:37 -0800
Message-ID: <20240216035923.23392-5-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: LtG3tAf8r-sCFBYVdIgam2nQghlR91Jt
X-Proofpoint-ORIG-GUID: LtG3tAf8r-sCFBYVdIgam2nQghlR91Jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_02,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160030
Message-ID-Hash: RMCRLVA5ZL562SL2KK4BM3RVLNO5L77V
X-Message-ID-Hash: RMCRLVA5ZL562SL2KK4BM3RVLNO5L77V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMCRLVA5ZL562SL2KK4BM3RVLNO5L77V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

The event_ring_deq parameter is used to check if the event ring dequeue
position is updated while calling by xhci_handle_event(), meaning there was
an actual event on the ring to handle. In this case the driver needs to
inform hardware about the updated dequeue position.
Basically event_ring_deq just stores the old event ring dequeue position
before calling the event handler.

Keeping track of software event dequeue updates this way is no longer
useful as driver anyways reads the current hardware dequeue position
within the handle event, and checks if it needs to be updated.

The driver might anyway need to modify the EHB (event handler busy) bit in
the same register as the dequeue pointer even if the actual dequeue
position did not change.

Change-Id: I7ece833f9f52f16a40d4fc2c10530cdd4c94497e
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 37 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 49f10dc25516..1136c6170b1a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3032,30 +3032,26 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
  */
 static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 				     struct xhci_interrupter *ir,
-				     union xhci_trb *event_ring_deq,
 				     bool clear_ehb)
 {
 	u64 temp_64;
 	dma_addr_t deq;
 
 	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	/* If necessary, update the HW's version of the event ring deq ptr. */
-	if (event_ring_deq != ir->event_ring->dequeue) {
-		deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
-				ir->event_ring->dequeue);
-		if (deq == 0)
-			xhci_warn(xhci, "WARN something wrong with SW event ring dequeue ptr\n");
-		/*
-		 * Per 4.9.4, Software writes to the ERDP register shall
-		 * always advance the Event Ring Dequeue Pointer value.
-		 */
-		if ((temp_64 & ERST_PTR_MASK) == (deq & ERST_PTR_MASK))
-			return;
+	deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
+				   ir->event_ring->dequeue);
+	if (deq == 0)
+		xhci_warn(xhci, "WARN something wrong with SW event ring dequeue ptr\n");
+	/*
+	 * Per 4.9.4, Software writes to the ERDP register shall always advance
+	 * the Event Ring Dequeue Pointer value.
+	 */
+	if ((temp_64 & ERST_PTR_MASK) == (deq & ERST_PTR_MASK) && !clear_ehb)
+		return;
 
-		/* Update HC event ring dequeue pointer */
-		temp_64 = ir->event_ring->deq_seg->num & ERST_DESI_MASK;
-		temp_64 |= deq & ERST_PTR_MASK;
-	}
+	/* Update HC event ring dequeue pointer */
+	temp_64 = ir->event_ring->deq_seg->num & ERST_DESI_MASK;
+	temp_64 |= deq & ERST_PTR_MASK;
 
 	/* Clear the event handler busy flag (RW1C) */
 	if (clear_ehb)
@@ -3084,7 +3080,6 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 irqreturn_t xhci_irq(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	union xhci_trb *event_ring_deq;
 	struct xhci_interrupter *ir;
 	irqreturn_t ret = IRQ_NONE;
 	u64 temp_64;
@@ -3142,15 +3137,13 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		goto out;
 	}
 
-	event_ring_deq = ir->event_ring->dequeue;
 	/* FIXME this should be a delayed service routine
 	 * that clears the EHB.
 	 */
 	while (xhci_handle_event(xhci, ir) > 0) {
 		if (event_loop++ < TRBS_PER_SEGMENT / 2)
 			continue;
-		xhci_update_erst_dequeue(xhci, ir, event_ring_deq, false);
-		event_ring_deq = ir->event_ring->dequeue;
+		xhci_update_erst_dequeue(xhci, ir, false);
 
 		/* ring is half-full, force isoc trbs to interrupt more often */
 		if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
@@ -3159,7 +3152,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		event_loop = 0;
 	}
 
-	xhci_update_erst_dequeue(xhci, ir, event_ring_deq, true);
+	xhci_update_erst_dequeue(xhci, ir, true);
 	ret = IRQ_HANDLED;
 
 out:
