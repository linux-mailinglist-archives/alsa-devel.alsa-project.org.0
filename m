Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552EE84EC6D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 00:15:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD91FDEC;
	Fri,  9 Feb 2024 00:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD91FDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707434143;
	bh=9xhUO2oBg3VGby3vuFrh+xyofs8aRXlLZClt/1/wQLY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ekdvyS0ZOKBAhTGJdieRT9wQ5RWp06i1Rnjdvo2M2vcT6oCua/qYG62dHupBD3l3d
	 s5lRbfNrBmXRHDYucDZAaJ68gOyr6tC09L1plHLuIZZOYpzblB3TYzRA64oVKhLPSu
	 GVSx7jaTO7iR3xAvI573GG3Z6XHQzUnQh90qI5B4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3D47F80633; Fri,  9 Feb 2024 00:14:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D135BF8062F;
	Fri,  9 Feb 2024 00:14:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03557F805F1; Fri,  9 Feb 2024 00:14:36 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D46DF80568
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 00:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D46DF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=AEBApGw/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418Mk55W029816;
	Thu, 8 Feb 2024 23:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=e3ZP4UGfMJHN9tb9hE1a
	TUT7cHSD1ZLTE7FnRsZFK6Q=; b=AEBApGw/IkkSrovJhMhdHqhx/5YmH5UwFutq
	NcqlEU8nn2qvyDNBKEofFhdBlQFno0LUc3SMcAns3QWmDMZeBZcyJtQtR01OQre4
	jRMfL+NSIERXEvWPPMQCyJOs10zjLDY9wWWpz+7FAp/8ckbrobkXH4J5UIu8vEEa
	Anw+NvwdVqgnlSmaL4RJhBfkOL/UHb/tDpyTF8SRTL3W6gUiZVTQmoKng3nCZ05F
	EjmrpvRgq4Wl56nR33BNYAUw0rkAoVev/zTkwAbCgyFQrhDrPQLzf5izTKubjoFb
	pIagp1OFB3Dx77tW59XUfIJLfP206MhS1rP5mVVzRT2LuOXVuw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4m3ak1p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 23:14:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 418NEIGl012196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 23:14:18 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 8 Feb 2024 15:14:17 -0800
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
Subject: [PATCH v14 07/53] xhci: update event ring dequeue pointer position to
 controller correctly
Date: Thu, 8 Feb 2024 15:13:20 -0800
Message-ID: <20240208231406.27397-8-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208231406.27397-1-quic_wcheng@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sP22P7Fda8SrKVI3FRS9q_RMAUOS53sY
X-Proofpoint-GUID: sP22P7Fda8SrKVI3FRS9q_RMAUOS53sY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080131
Message-ID-Hash: GEZI5QRJ63VI3M2JEVUN4S2KAHJLYQPB
X-Message-ID-Hash: GEZI5QRJ63VI3M2JEVUN4S2KAHJLYQPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEZI5QRJ63VI3M2JEVUN4S2KAHJLYQPB/>
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
