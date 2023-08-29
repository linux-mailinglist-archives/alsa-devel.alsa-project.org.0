Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A978CE6D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 23:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88381886;
	Tue, 29 Aug 2023 23:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88381886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693343345;
	bh=ptZTgKYwlOo2qF79GMQObjGMyd6mNET2skO8lcOfC4U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DquaI9Ij0RFkgcGCLZo7sHUjTp5zhVbgkKjN8OBjgnXyStpiqGla2GuTgj3fy1knO
	 niLtgcX6f4n9DOWpmusZIUi2RyT5SwtAIQt/w6n51IYSs+sqaYfiYECikJ+RBnco/r
	 KOU4QKqVnezUAWUXSABiUWSfMHfvOcghbYjYGKGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D5E8F805A0; Tue, 29 Aug 2023 23:07:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 995C3F80578;
	Tue, 29 Aug 2023 23:07:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0125FF805A8; Tue, 29 Aug 2023 23:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92E4BF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 23:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92E4BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=AZ2o4qzz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKaUT7024759;
	Tue, 29 Aug 2023 21:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=3lo4gimlUv1KryCkLcmojwfyH5zzqAMvP6LLie+DG/0=;
 b=AZ2o4qzz9fkdCckl8fU1MRRSjmxQI5PlA0c6uQD3JonfRQL5kNV/x/FQV9qQ1mlL3Kqd
 sykMOfbmAXi3+o/ZthEyQDtzlF+9dvo66RSafVHyfB0gbrWcwk4afOxqRNvwHPvDdD77
 8LjFVwD0IyHqP9wDoIiHjHiRIECTPjC+yGfjO6p7bPMn3uhaD3qbzC/4O32+JZdXbbrk
 LMaEq0NYxt0kvRQLFWNd7FfdFzBuMt3UIEw+jOQ6bC9VW+4QCVj8ORcgJaIMWIpz91+t
 fwDSQdQkv+TYJS9J3rQupnwqCgyvoX006J/bdg3eFr+aQzuaWJlSsY7DDR8TzuNkN4UE OQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssbm2swb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37TL78C5020682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:07:08 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 14:07:08 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v5 04/32] usb: host: xhci-mem: Cleanup pending secondary event
 ring events
Date: Tue, 29 Aug 2023 14:06:29 -0700
Message-ID: <20230829210657.9904-5-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230829210657.9904-1-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Je3_JJYMIVWowUcjmOD1gi3vLFvboh1b
X-Proofpoint-ORIG-GUID: Je3_JJYMIVWowUcjmOD1gi3vLFvboh1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_14,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxlogscore=840 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290181
Message-ID-Hash: X5MDJZAU2CZFVL3LWQ2SOGOVKQJRGK4P
X-Message-ID-Hash: X5MDJZAU2CZFVL3LWQ2SOGOVKQJRGK4P
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5MDJZAU2CZFVL3LWQ2SOGOVKQJRGK4P/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As part of xHCI bus suspend, the XHCI is halted.  However, if there are
pending events in the secondary event ring, it is observed that the xHCI
controller stops responding to further commands upon host or device
initiated bus resume.  Iterate through all pending events and updating the
dequeue pointer to the last pending event trb.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c  |  9 ++++---
 drivers/usb/host/xhci-ring.c | 46 ++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c      |  2 +-
 drivers/usb/host/xhci.h      |  3 +++
 4 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2f9228d7d22d..94cbc25e77ca 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1801,7 +1801,6 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	size_t erst_size;
-	u64 tmp64;
 	u32 tmp;
 
 	if (!ir)
@@ -1823,10 +1822,6 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp = readl(&ir->ir_set->erst_size);
 		tmp &= ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
-
-		tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-		tmp64 &= (u64) ERST_PTR_MASK;
-		xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
 	}
 
 	/* free interrrupter event ring */
@@ -1851,6 +1846,10 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 	/* fixme, should we check xhci->interrupter[intr_num] == ir */
 	spin_lock(&xhci->lock);
 	intr_num = ir->intr_num;
+
+	/* cleanup secondary interrupter to ensure there are no pending events */
+	xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
+
 	xhci_free_interrupter(xhci, ir);
 	xhci->interrupters[intr_num] = NULL;
 	spin_unlock(&xhci->lock);
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 93233cf5ff21..fdef1b82b1ff 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3026,6 +3026,52 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 	xhci_write_64(xhci, temp_64, &ir->ir_set->erst_dequeue);
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
+	union xhci_trb *erdp_trb, *current_trb;
+	struct xhci_segment	*seg;
+	u64 erdp_reg;
+	u32 iman_reg;
+	dma_addr_t deq;
+	unsigned long segment_offset;
+
+	/* disable irq, ack pending interrupt and ack all pending events */
+	xhci_disable_interrupter(ir);
+	iman_reg = readl_relaxed(&ir->ir_set->irq_pending);
+	if (iman_reg & IMAN_IP)
+		writel_relaxed(iman_reg, &ir->ir_set->irq_pending);
+
+	/* last acked event trb is in erdp reg  */
+	erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	deq = (dma_addr_t)(erdp_reg & ~ERST_PTR_MASK);
+	if (!deq) {
+		xhci_dbg(xhci, "event ring handling not required\n");
+		return;
+	}
+
+	seg = ring->first_seg;
+	segment_offset = deq - seg->dma;
+
+	erdp_trb = current_trb = ir->event_ring->dequeue;
+	while (1) {
+		inc_deq(xhci, ir->event_ring);
+		erdp_trb = ir->event_ring->dequeue;
+		/* cycle state transition */
+		if ((le32_to_cpu(erdp_trb->event_cmd.flags) & TRB_CYCLE) !=
+		    ring->cycle_state)
+			break;
+	}
+
+	xhci_update_erst_dequeue(xhci, ir, current_trb);
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error condition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 163d533d6200..2bb7895c1cd6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -309,7 +309,7 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+int xhci_disable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 15ade8ec6b6c..e2133f125974 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2029,6 +2029,9 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 		int type, gfp_t flags);
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+	struct xhci_ring *ring,	struct xhci_interrupter *ir);
+int xhci_disable_interrupter(struct xhci_interrupter *ir);
 
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
