Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5206B174E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 01:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE6518A4;
	Thu,  9 Mar 2023 00:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE6518A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678320031;
	bh=BThFckjoOr3jiFBSkaXATNpKgz2qAmWEnHXIdxU0Z/4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jnrF+MnRjNjQN9RKeCovY7Gu/ZaEhYXG8kbZYpgK0cf5oWz/b9NPUkGWTd6p5YzKd
	 Rcar+vab9hpJUDJRdS9/z771JAyFZfZFgLOAN95mQ5KPofAWpGeHWifu/esENCaonC
	 5oBM4ZiGJRHKkO9/kE/VusF/6dzwIkasZzELP2b4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3076EF80529;
	Thu,  9 Mar 2023 00:58:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 133EAF80567; Thu,  9 Mar 2023 00:58:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AE89F80482
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 00:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AE89F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MD7z7sYu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328N0K19029377;
	Wed, 8 Mar 2023 23:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Xl6YdkXFRf/sfYrpGRAA4A85mwlAfIqs98hW2KqCf2U=;
 b=MD7z7sYuHCglqnk9j1t9qfzcRHZyDMzPHilSboo1kMjwROkKEyKDkNR2d+elh29AHavW
 bQKHn0HzHVRacH93pvRj2C69+4uAllWJ3IBVRkyD1xiy8DT5hXASg01ijL3Toeu3FO3+
 ov4eJdJmkJjpz7d7J9VGjBeaoRprSp1o9kd4Tdb6aCiSymmvg+uaJWvnvooPoBBxS8KX
 3h5il6jqGm261RP8vGCBLh0Kc3rgdSHgzfMV3VQcv/x02S+03Pwyn1S65e1crVR3Oo8b
 efr3/s54dHEcaJCwohkQQdG7vC6kCg2w3TygOKOphS0OeT7UtaF2ed5ofjkjl5vxHSgZ WQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6ffku8pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 23:58:07 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 328Nw5oR016240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 23:58:05 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 15:58:05 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
Subject: [PATCH v3 03/28] usb: host: xhci-mem: Cleanup pending secondary event
 ring events
Date: Wed, 8 Mar 2023 15:57:26 -0800
Message-ID: <20230308235751.495-4-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZNBcE3At_moo4lFXDujM7h8-IcfNi1W4
X-Proofpoint-ORIG-GUID: ZNBcE3At_moo4lFXDujM7h8-IcfNi1W4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxlogscore=678
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
Message-ID-Hash: U765F7EWVDMWT2A3G6X5JFYRB2OZ6BAW
X-Message-ID-Hash: U765F7EWVDMWT2A3G6X5JFYRB2OZ6BAW
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U765F7EWVDMWT2A3G6X5JFYRB2OZ6BAW/>
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
initiated bus resume.  Iterate through all pending events and updating the
dequeue pointer to the last pending event trb.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c | 74 ++++++++++++++++++++++++++++++++++---
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c303a8e1a33d..7d0e7ac63c1c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1819,17 +1819,85 @@ int xhci_alloc_erst(struct xhci_hcd *xhci,
 	return 0;
 }
 
+static void xhci_handle_sec_intr_events(struct xhci_hcd *xhci,
+	struct xhci_ring *ring,	struct xhci_intr_reg __iomem *ir_set,
+	struct xhci_erst *erst)
+{
+	union xhci_trb *erdp_trb, *current_trb;
+	struct xhci_segment	*seg;
+	u64 erdp_reg;
+	u32 iman_reg;
+	dma_addr_t deq;
+	unsigned long segment_offset;
+
+	/* disable irq, ack pending interrupt and ack all pending events */
+	iman_reg = readl_relaxed(&ir_set->irq_pending);
+	iman_reg &= ~IMAN_IE;
+	writel_relaxed(iman_reg, &ir_set->irq_pending);
+	iman_reg = readl_relaxed(&ir_set->irq_pending);
+	if (iman_reg & IMAN_IP)
+		writel_relaxed(iman_reg, &ir_set->irq_pending);
+
+	/* last acked event trb is in erdp reg  */
+	erdp_reg = xhci_read_64(xhci, &ir_set->erst_dequeue);
+	deq = (dma_addr_t)(erdp_reg & ~ERST_PTR_MASK);
+	if (!deq) {
+		xhci_dbg(xhci, "event ring handling not required\n");
+		return;
+	}
+
+	seg = ring->first_seg;
+	segment_offset = deq - seg->dma;
+
+	/* find out virtual address of the last acked event trb */
+	erdp_trb = current_trb = &seg->trbs[0] +
+				(segment_offset/sizeof(*current_trb));
+
+	/* read cycle state of the last acked trb to find out CCS */
+	ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
+
+	while (1) {
+		/* last trb of the event ring: toggle cycle state */
+		if (current_trb == &seg->trbs[TRBS_PER_SEGMENT - 1]) {
+			ring->cycle_state ^= 1;
+			current_trb = &seg->trbs[0];
+		} else {
+			current_trb++;
+		}
+
+		/* cycle state transition */
+		if ((le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE) !=
+		    ring->cycle_state)
+			break;
+	}
+
+	if (erdp_trb != current_trb) {
+		deq = xhci_trb_virt_to_dma(ring->deq_seg, current_trb);
+		if (deq == 0)
+			xhci_warn(xhci,
+				"WARN invalid SW event ring dequeue ptr.\n");
+		/* Update HC event ring dequeue pointer */
+		erdp_reg &= ERST_PTR_MASK;
+		erdp_reg |= ((u64) deq & (u64) ~ERST_PTR_MASK);
+	}
+
+	/* Clear the event handler busy flag (RW1C); event ring is empty. */
+	erdp_reg |= ERST_EHB;
+	xhci_write_64(xhci, erdp_reg, &ir_set->erst_dequeue);
+}
+
 static void
 xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	size_t erst_size;
-	u64 tmp64;
 	u32 tmp;
 
 	if (!ir)
 		return;
 
+	xhci_handle_sec_intr_events(xhci, ir->event_ring, ir->ir_set, &ir->erst);
+
 	erst_size = sizeof(struct xhci_erst_entry) * (ir->erst.num_entries);
 	if (ir->erst.entries)
 		dma_free_coherent(dev, erst_size,
@@ -1846,10 +1914,6 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	tmp &= ERST_SIZE_MASK;
 	writel(tmp, &ir->ir_set->erst_size);
 
-	tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	tmp64 &= (u64) ERST_PTR_MASK;
-	xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
-
 	/* free interrrupter event ring */
 	if (ir->event_ring)
 		xhci_ring_free(xhci, ir->event_ring);
