Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B699F9BA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 23:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C71391518;
	Tue, 15 Oct 2024 23:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C71391518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729028190;
	bh=2azGS4Mn0hl3bJLIVZjYNoRlE2MsVGBfb5n8aG0ud74=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PoDS1IO9v6P/crsorD6bnza4nMDKDqwgw2erV/azJkd0kxuG/LRrVSG5goApkNFzK
	 fBwjqFz6BrW13zdZOt6mv12o/BGwHBfBWbzxBQDi44E30wiyIGP9ZJPQJvOz2ZSa0w
	 ePxwmlW0oXr/wKfM2seWLQZVY1BX3poZlHbQKzKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1C79F80641; Tue, 15 Oct 2024 23:31:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26213F8062E;
	Tue, 15 Oct 2024 23:31:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 468D2F8067E; Tue, 15 Oct 2024 23:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACE24F80527
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 23:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE24F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=VKGBFrTw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49FJG82n003634;
	Tue, 15 Oct 2024 21:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8pUtfboEtVwzj3gvJFEJdvS9Fn04qc2yCNOn552kLBs=; b=VKGBFrTwEMeZEZNV
	wNPw0MOUr20Xy2mZQX1ZA67V78NkyCR68MyCzxVyq6lRilu2P7P2zmVea/AYp1DF
	aecVcgYp5j4ASWeS8GNAJAemkkErY+UMFz4c4zWKaFT2un+tkEWt1kUG89C3kEiR
	W7o6TXhzCYf5idhU0qC+J+n15xeXvg3xv3IIJNYMrAfCOIuTeYwG92+vjYxY02j3
	ltzEMajGusM6t5Amd0UDraSdshVmc5dGD8x5pgjpjExFgZMeGVSUqeIhfjXyhor2
	AhQLXIK7UeodjZ1u+pPm5bQ2FQUBSfMmzGuPXHzQIkdmseEgoik9k2Vfzo0whBqh
	BTcSew==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429xdb8a2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49FLTRWL026390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:28 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:27 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v29 03/33] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
Date: Tue, 15 Oct 2024 14:28:45 -0700
Message-ID: <20241015212915.1206789-4-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CYwzxnLAF86VcLP-4puC6RHVMlXjokcH
X-Proofpoint-GUID: CYwzxnLAF86VcLP-4puC6RHVMlXjokcH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=929 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143
Message-ID-Hash: M3EDVFV36CWTYN362RQQWW2GQRP4T3OI
X-Message-ID-Hash: M3EDVFV36CWTYN362RQQWW2GQRP4T3OI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3EDVFV36CWTYN362RQQWW2GQRP4T3OI/>
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
index 51a992d8ffcf..a6fbfc11fb1d 100644
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
