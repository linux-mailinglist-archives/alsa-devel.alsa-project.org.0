Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143C67C34D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 04:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B55DEB;
	Thu, 26 Jan 2023 04:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B55DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674703002;
	bh=1ULdXrdy+hlFnnRB9F6e2iOvzgn63RoutRMI//6W2FE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FH98unDJDFJJr8EM3k5vHZloYx518RnVVopRK9sMGE4B99u5hzOf81GfLq8yAqRkv
	 cmMvv1CpsadJL2nfsZAQpzKVqGHwLWwAg/otFqBbiq0eU4ZPm615qqHAAQbo0vSomj
	 KQtNg2yJv3EGyAq5PmaOB8i25gGCcEvZTKTd8Ie0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 162F3F803DC;
	Thu, 26 Jan 2023 04:15:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88AC9F80567; Thu, 26 Jan 2023 04:14:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B2A1F802DF
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B2A1F802DF
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=cWR2YZVa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30Q2rXli011227; Thu, 26 Jan 2023 03:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=WFZq4UMSCH856PMLB3UVkAwA4Wl+MSgSWggJjWLXJ6A=;
 b=cWR2YZVaU3JWSUcega+o7RXn2iak4OHL+r2PG1aBCdNhByOW4hHu8N82AFsLp8MaPi0Q
 0Ysg87YlD+aDPiGxSbXsjYSL3KFHuF+GR52odkKF5W5togVwE4SUfx75tZtXDz2CDlPF
 dKkPugWxag8QbDjReUEncaI+YpXVvoEMlEbAaGp20p5ZjVjw9Sh9oIDBdzO+8Iyok9sL
 1ayuIHaDw+JSy4P7vgaPbipcZZGeM0MSQH5PZPCywDc0LdPCaJsdie6uo/mkqnv9XNqY
 xj3h84l/wL+rvPtWfvYcl+9rw2K18GtDscDwlNsKoSnd7Sxb+tNGY3A0/1GqVTDROWuR 0w== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nb6jc9brw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 03:14:42 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30Q3EfMI031142
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 03:14:41 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 19:14:41 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
Subject: [RFC PATCH v2 06/22] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
Date: Wed, 25 Jan 2023 19:14:08 -0800
Message-ID: <20230126031424.14582-7-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230126031424.14582-1-quic_wcheng@quicinc.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kDhATwC0d0NyYk1o5n1L56LWOe4NiDHT
X-Proofpoint-GUID: kDhATwC0d0NyYk1o5n1L56LWOe4NiDHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_14,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=616
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260028
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
 quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

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
index 45ac77a5d8e4..5c5266c18910 100644
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
@@ -1842,10 +1910,6 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	tmp &= ERST_SIZE_MASK;
 	writel(tmp, &ir->ir_set->erst_size);
 
-	tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	tmp64 &= (u64) ERST_PTR_MASK;
-	xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
-
 	/* free interrrupter event ring */
 	if (ir->event_ring)
 		xhci_ring_free(xhci, ir->event_ring);
