Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC35964F49
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 21:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDC1B850;
	Thu, 29 Aug 2024 21:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDC1B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724960543;
	bh=RWNNCSxgtLGFngj48r+1MxveJ4spEYXQMbnYGVPbq1s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X7Aqry5FjI0On+wm1WyFKV3I83WDFiIvdG390jM/h/PFVj7R8yTfKcyLim75FTEeK
	 1kiCm3P60MMh7f0MaWHeL7oT2AFPNeGVpCmGY245q03NwlgwCKOlPV/ANXmtsrBKmm
	 Dg2lJi+mGaq9S5TeuwQz4m5VeGDwZcOWju7A7GcI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1A1DF805E6; Thu, 29 Aug 2024 21:41:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A66E6F805F0;
	Thu, 29 Aug 2024 21:41:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6848F805A1; Thu, 29 Aug 2024 21:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DEEDF800AC
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 21:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DEEDF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=W+wisluk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47THagoS020435;
	Thu, 29 Aug 2024 19:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3GTuP5XV/R6kkd/xTmcJglKVetijmZPHGg14Okx4Dk=; b=W+wislukzfPhxNhs
	DUClRCRWmJkRmuJaCGXzvCNZ7iD6nq5C8fXLAM3PqRw2b2A9JK7ldsVzD4/WsVcl
	0VVL7e7DNtGxEbHqcI0ntLS4v2ZCbQ3+zkyrPLDOp9ms8+RqytYeEs5uIFOnZy5V
	1n6zmSVKd4L2BduOf5mnYVzkmm67JxByP7qEErKuz2sZo1/sPTSu6hvjeppmDUO/
	Jw9VRqyDh6XHGSquq1J4XIo9hFRKbM2ZEyZ+c/AW3KwCEJXSpjUhP0SEO5r4vMzm
	HrxdPv48yybRkLz4mF4XZk7D7Go2Uj+x2YaO0H9SQKJcyRFZCVX5FKHedksbw7c3
	NlzHsA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xxf3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47TJfOkG016239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:25 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:24 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 02/33] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
Date: Thu, 29 Aug 2024 12:40:34 -0700
Message-ID: <20240829194105.1504814-3-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: M_XPPyT3t2R4rlwLTnfbMOfLRTMic96U
X-Proofpoint-GUID: M_XPPyT3t2R4rlwLTnfbMOfLRTMic96U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=900 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290139
Message-ID-Hash: ECKE4JMVSQEZITRKAU4G3JZBFFAAEL4D
X-Message-ID-Hash: ECKE4JMVSQEZITRKAU4G3JZBFFAAEL4D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECKE4JMVSQEZITRKAU4G3JZBFFAAEL4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Depending on the interrupter use case, the OS may only be used to handle
the interrupter event ring clean up.  In these scenarios, event TRBs don't
need to be handled by the OS, so introduce an xhci interrupter flag to tag
if the events from an interrupter needs to be handled or not.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9e90d2952760..74bdc94d863b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2951,14 +2951,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 }
 
 /*
- * This function handles one OS-owned event on the event ring. It may drop
- * xhci->lock between event processing (e.g. to pass up port status changes).
+ * This function handles one OS-owned event on the event ring, or ignores one event
+ * on interrupters which are non-OS owned. It may drop xhci->lock between event
+ * processing (e.g. to pass up port status changes).
  */
 static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 				 union xhci_trb *event)
 {
 	u32 trb_type;
 
+	/*
+	 * Some interrupters do not need to handle event TRBs, as they may be
+	 * managed by another entity, but rely on the OS to clean up.
+	 */
+	if (ir->skip_events)
+		return 0;
+
 	trace_xhci_handle_event(ir->event_ring, &event->generic);
 
 	/*
@@ -3047,8 +3055,9 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 }
 
 /*
- * Handle all OS-owned events on an interrupter event ring. It may drop
- * and reaquire xhci->lock between event processing.
+ * Handle all OS-owned events on an interrupter event ring, or skip pending events
+ * for non OS owned interrupter event ring. It may drop and reacquire xhci->lock
+ * between event processing.
  */
 static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 1c6126ed55b0..efbd1f651da4 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1430,6 +1430,7 @@ struct xhci_interrupter {
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
 	bool			ip_autoclear;
+	bool			skip_events;
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;
