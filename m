Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C77285249D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 01:56:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE03CDF8;
	Tue, 13 Feb 2024 01:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE03CDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707785811;
	bh=9xhUO2oBg3VGby3vuFrh+xyofs8aRXlLZClt/1/wQLY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bej6xJvfXgyujM8PsbkpEogO3Y/OtoHIe7wVofGptjy90BI2Zm+2k8VJ9D4+STXSg
	 kEn0SnqdgqfFrKIvCUW7L+CEn2wz5scpH/MCCkm9dLhJtzQksL0U8686dxgTndkW4x
	 89wA3mzSSjyDI7RtX4NULaZBOz8gZ5Q+4jdn6/cg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DD83F805C7; Tue, 13 Feb 2024 01:55:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8441F806A9;
	Tue, 13 Feb 2024 01:55:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F784F805EE; Tue, 13 Feb 2024 01:54:57 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 049DFF804CC
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 049DFF804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=aBrqkdTZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D09Ysj016771;
	Tue, 13 Feb 2024 00:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=e3ZP4UGfMJHN9tb9hE1a
	TUT7cHSD1ZLTE7FnRsZFK6Q=; b=aBrqkdTZ61OWT36+l02qdAEAkAsimqWgdDmw
	nHMayodPCCY6qLVgFbN9ZnKe2gHxCF0Os1moVwEx9AcZsZ2TQ+rE9fQPUOoaIlYO
	kpRZBCi1+lptgzCkzLtNMziCh8yHdxmYdFIGmTxckTxD0Lmq0dkjU4dhw6d48Xko
	ZZKPlrltq3InzhICLF7kulH4KRQTbUrrCC+BzwX0wOtfWIyX6oULu8suJfAni/Ad
	ciaUmFx/DuGl2zHLhWFnPkTVvLO8FNsHOFwyrbVpNaaRYWk4sJNgQ9R7G8zORO6v
	Hud64NxIeuc3aQJns8pc64Yb5ic9MzME4xqVGHgJaJjR0ZB6vg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62kt4ty8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0sYjR026763
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
Subject: [PATCH v15 05/50] xhci: update event ring dequeue pointer position to
 controller correctly
Date: Mon, 12 Feb 2024 16:53:37 -0800
Message-ID: <20240213005422.3121-6-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: U3voO1VJLncFRE04Fk3igBRQ06DGSlg8
X-Proofpoint-ORIG-GUID: U3voO1VJLncFRE04Fk3igBRQ06DGSlg8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130005
Message-ID-Hash: O27EDDK34F7JHYW7RIWZRV56N4H2BAZG
X-Message-ID-Hash: O27EDDK34F7JHYW7RIWZRV56N4H2BAZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O27EDDK34F7JHYW7RIWZRV56N4H2BAZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

The event ring dequeue pointer field (ERDP) in xHC hardware is used to
inform controller how far the driver has processed events on the event
ring.

In the case all events are handled and event ring is empty then the
address of the TRB after the last processed one should be written.
This TRB is both the enqueue and dequeue pointer.

But in case we are writing the ERDP in the middle of processing
several events then ERDP field should be written with the "up to and
including" address of the last handled event TRB.

Currenly each ERDP write by driver is done as if all events are handled
and ring is empty.

Fix this by adjusting the order when software dequeue "inc_deq()"
is called and hardware dequeue "xhci_update_erst_dequeue()" is updated.

Details in xhci 1.2 specification section 4.9.4:

"System software shall write the Event Ring Dequeue Pointer (ERDP)
 register to inform the xHC that it has completed the processing of Event
 TRBs up to and including the Event TRB referenced by the ERDP.

 The detection of a Cycle bit mismatch in an Event TRB processed by
 software indicates the location of the xHC Event Ring Enqueue Pointer
 and that the Event Ring is empty. Software shall write the ERDP with
 the address of this TRB to indicate that it has processed all Events
 in the ring"

This change depends on fixes made to relocate inc_deq() calls captured
in the below commits:

  commit 3321f84bfae0 ("xhci: simplify event ring dequeue tracking for
  transfer events")

  commit d1830364e963 ("xhci: Simplify event ring dequeue pointer update
  for port change events")

Fixes: dc0ffbea5729 ("usb: host: xhci: update event ring dequeue pointer on purpose")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a9d2e876d62b..0289d77839cf 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2966,9 +2966,6 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		return 0;
 	}
 
-	/* Update SW event ring dequeue pointer */
-	inc_deq(xhci, ir->event_ring);
-
 	/* Are there more items on the event ring?  Caller will call us again to
 	 * check.
 	 */
@@ -3091,15 +3088,21 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	 * that clears the EHB.
 	 */
 	while (xhci_handle_event(xhci, ir) > 0) {
-		if (event_loop++ < TRBS_PER_SEGMENT / 2)
-			continue;
-		xhci_update_erst_dequeue(xhci, ir, false);
+		/*
+		 * If half a segment of events have been handled in one go then
+		 * update ERDP, and force isoc trbs to interrupt more often
+		 */
+		if (event_loop++ > TRBS_PER_SEGMENT / 2) {
+			xhci_update_erst_dequeue(xhci, ir, false);
+
+			if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
+				ir->isoc_bei_interval = ir->isoc_bei_interval / 2;
 
-		/* ring is half-full, force isoc trbs to interrupt more often */
-		if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
-			ir->isoc_bei_interval = ir->isoc_bei_interval / 2;
+			event_loop = 0;
+		}
 
-		event_loop = 0;
+		/* Update SW event ring dequeue pointer */
+		inc_deq(xhci, ir->event_ring);
 	}
 
 	xhci_update_erst_dequeue(xhci, ir, true);
