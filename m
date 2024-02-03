Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B60E847ED1
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 03:42:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1063CEB6;
	Sat,  3 Feb 2024 03:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1063CEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706928120;
	bh=9xhUO2oBg3VGby3vuFrh+xyofs8aRXlLZClt/1/wQLY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SF3nAy4W4rwFMcUlx/SI4tp76bOl3llg764vKfJlTOrgpuHZWv5YgtYoV0Y//ZlfF
	 SlGSV0ZeJW0haxBl9ylKwdQQJdTeQ/EIUiI/auUv+uQL1EYNUe3ha2MgqxgJ51qWPg
	 Ec1GY2dlFriusEH76nHJrigLcnRqEhy9xVvWF2yE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03E82F89618; Sat,  3 Feb 2024 03:38:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06B1AF80C7E;
	Sat,  3 Feb 2024 03:38:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F09CCF806F8; Sat,  3 Feb 2024 03:38:11 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 96430F8056F
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 03:37:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96430F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Rs/2DVS7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4132RJUM018892;
	Sat, 3 Feb 2024 02:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=e3ZP4UGfMJHN9tb9hE1a
	TUT7cHSD1ZLTE7FnRsZFK6Q=; b=Rs/2DVS7ZkmFdv2TOud1oT2ALdKcZ8+mqiND
	8eQ6AvxfivXSOZcY0Ns/CiAgHcr0g5D2zFkEl6U8gm5o2YBTlrVPajYXvxKwweQt
	wEGNu05ASHym0CAeoCdUiI6odAwcKRaX8gE4mh5FF6JCds8roawqZVmSnJ5HCc+h
	qgZ/6FrmsRpX2DzjGQNazbbyTo8X5QsPyduWRjulPjkxFj7U6D6M9uCpqItNnCBN
	96cWNOayJEDcca37SRbtjv4EmRpVYmF90U9EJo3mFPGxTGcxBkruCxGXTxNbrt7d
	e+Mo2+u/hoMQwsM7XJPbK5QLxT+Ud4Cp6sjKgrJv5Kz0nZjnmA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w1019sgtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 Feb 2024 02:37:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4132bJtf012236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 Feb 2024 02:37:19 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 18:37:19 -0800
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
Subject: [PATCH v13 07/53] xhci: update event ring dequeue pointer position to
 controller correctly
Date: Fri, 2 Feb 2024 18:35:59 -0800
Message-ID: <20240203023645.31105-8-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Q7yUTL1p54P9ck1l1l0VLUU7Bbv3I9sT
X-Proofpoint-GUID: Q7yUTL1p54P9ck1l1l0VLUU7Bbv3I9sT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402030015
Message-ID-Hash: HZLSMI6TC2OTDRNNHVZRZTXIEWY5WUBA
X-Message-ID-Hash: HZLSMI6TC2OTDRNNHVZRZTXIEWY5WUBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZLSMI6TC2OTDRNNHVZRZTXIEWY5WUBA/>
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
