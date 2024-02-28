Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643886A55E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 02:39:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C2682C;
	Wed, 28 Feb 2024 02:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C2682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709084390;
	bh=zR0MiJLCu3Slj0Xo8nwhAizKu0E/rCxCMd64N0Xy0RQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TsvNheSg4kYgYUMqFnyfMQPaLBU9mKiNFHgA9SrReKsDL3SvQSv94Ic/5Yd+RGCig
	 5bvTyI4SgxuulxuQITYLl2/ZJ4N5+idg9XTVWH+bH/PV0eBKLVPydwwbld5x/C/4jG
	 0khrrqsrhYl1bdcHvvNSVWn6HVH8xdOIkgT1PRTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B6EFF805E8; Wed, 28 Feb 2024 02:37:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BB33F806DD;
	Wed, 28 Feb 2024 02:37:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA3B3F8063A; Wed, 28 Feb 2024 02:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADA8AF80570
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 02:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADA8AF80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=FYR2LrpU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41S0HIhR026109;
	Wed, 28 Feb 2024 01:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=SqD97Far38NWycDJIWSe
	iiV0wKorK1dncOw/VpcPQ2Q=; b=FYR2LrpUgzyqdCHSxP6j2sH9qzuSO33GkPc/
	/J9c1M04EEx5Kb2EoRg7z9aiYN4er8OkclR8BnsyGkdsoJJOmSrnac4vtFct3+x1
	oltdYYiEmMVjcSFwOeZA4DsIaXpDK5bYxzJiQ+8TRZVnM5wDR946+730NIl4rD1s
	e5uCFRGNeyD2XJUo3SA+HcQW8eQkrNzsDpf35Cm9SUkjYs9rQhUNO4bRmmW3u/DI
	Dr0VwRRrQIfCuSmBa4pOsZKxlgxdkHIO4i5Ez/VVOu8oWTfq0VyFpHnoe9NxQ/RE
	2pjJvQ6XiOJmwaK0gFMffQsYX0ebxy1mcZhq80lANsbJF4RAFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh8aujrak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 01:36:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41S1aVlk004871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 01:36:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 27 Feb 2024 17:36:31 -0800
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
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v18 07/41] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
Date: Tue, 27 Feb 2024 17:35:45 -0800
Message-ID: <20240228013619.29758-8-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240228013619.29758-1-quic_wcheng@quicinc.com>
References: <20240228013619.29758-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: btQddTAx79UMG-5TFieEc-_G_yLfz67C
X-Proofpoint-GUID: btQddTAx79UMG-5TFieEc-_G_yLfz67C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=921 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280011
Message-ID-Hash: ZZEXFKZJWC56OP47DF42VBXYYNXKG6E7
X-Message-ID-Hash: ZZEXFKZJWC56OP47DF42VBXYYNXKG6E7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZEXFKZJWC56OP47DF42VBXYYNXKG6E7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As part of xHCI bus suspend, the XHCI is halted.  However, if there are
pending events in the secondary event ring, it is observed that the xHCI
controller stops responding to further commands upon host or device
initiated bus resume.  Iterate through all pending events and update the
dequeue pointer to the beginning of the event ring.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c  |  7 ++++++-
 drivers/usb/host/xhci-ring.c | 33 ++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |  5 +++++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 450adaca68ee..e4c13f056c1a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1827,7 +1827,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp &= ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
-		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
+		xhci_update_erst_dequeue(xhci, ir, true);
 	}
 }
 
@@ -1870,6 +1870,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 		return;
 	}
 
+	/*
+	 * Cleanup secondary interrupter to ensure there are no pending events.
+	 * This also updates event ring dequeue pointer back to the start.
+	 */
+	xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
 	intr_num = ir->intr_num;
 
 	xhci_remove_interrupter(xhci, ir);
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 82c10a5ac6e9..dd78662122ea 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3023,7 +3023,7 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
  * - When all events have finished
  * - To avoid "Event Ring Full Error" condition
  */
-static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 				     struct xhci_interrupter *ir,
 				     bool clear_ehb)
 {
@@ -3123,6 +3123,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 	return 0;
 }
 
+/*
+ * Move the event ring dequeue pointer to skip events kept in the secondary
+ * event ring.  This is used to ensure that pending events in the ring are
+ * acknowledged, so the XHCI HCD can properly enter suspend/resume.  The
+ * secondary ring is typically maintained by an external component.
+ */
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+	struct xhci_ring *ring,	struct xhci_interrupter *ir)
+{
+	union xhci_trb *current_trb;
+	u64 erdp_reg;
+	dma_addr_t deq;
+
+	/* disable irq, ack pending interrupt and ack all pending events */
+	xhci_disable_interrupter(ir);
+
+	/* last acked event trb is in erdp reg  */
+	erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
+	if (!deq) {
+		xhci_err(xhci, "event ring handling not required\n");
+		return;
+	}
+
+	current_trb = ir->event_ring->dequeue;
+	/* read cycle state of the last acked trb to find out CCS */
+	ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
+
+	xhci_handle_events(xhci, ir);
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error condition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 22aa9f2a2c0a..92ff1cf23556 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1840,6 +1840,8 @@ struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+	struct xhci_ring *ring,	struct xhci_interrupter *ir);
 
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
@@ -1931,6 +1933,9 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
+void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+				     struct xhci_interrupter *ir,
+				     bool clear_ehb);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
