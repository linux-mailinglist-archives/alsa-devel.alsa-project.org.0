Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C367A2B44
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 02:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D37D8;
	Sat, 16 Sep 2023 02:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D37D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694823127;
	bh=ptZTgKYwlOo2qF79GMQObjGMyd6mNET2skO8lcOfC4U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PVoiecz+a6FAxyqcUFt0SXyAlC09rXTnM4PYbFcr/6+JylWa+hCiT8VggUFBMXShC
	 tRXuMNaufl3476ykeHz549znCM4LHB9V7vFGbF40VD8k1VruE6igT1cDLiPPDVwlpW
	 T2glJwNT0Y1xlOth7RlKdwjzFgCjxmbb5rOqT5C8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90220F8058C; Sat, 16 Sep 2023 02:10:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F986F80212;
	Sat, 16 Sep 2023 02:10:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8D51F8057E; Sat, 16 Sep 2023 02:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D3A6F80212
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 02:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D3A6F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Px+4H07a
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FNlhtS019006;
	Sat, 16 Sep 2023 00:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=3lo4gimlUv1KryCkLcmojwfyH5zzqAMvP6LLie+DG/0=;
 b=Px+4H07aw8nSi/C5x8aTFp9jg+bkvFz6jrTDGx3RIOd/t7/aHR9pb+foNLvkRIMrSsvq
 myzeNjLlmuqYtM15/cgt3Npb5c+YHr2KW/rkYurpzkhq1jYYA4sR5yHg/Pgj721FKiqt
 xhXxeQxaY+QHNiUtwQRV25PW9gAt4qcAr5FCEGuwV4hYije6lUt4OtwtBTVso8wWPbfe
 2RvpU8F81bIfH5jVkVFXieIq2GL6hXnTxESNFp7a6iQ0bHUDHVpaibPj5jMrtz3pC4UB
 C8Y1V1xBFamMOoSHm7UisvfsNxLYGlcDlg0bBiPyR56CZ2SMqUSVzgASVR8ZNP/8nfoW Iw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4fsfam5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:10:38 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38G0AbUc018220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:10:37 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 17:10:37 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v6 04/33] usb: host: xhci-mem: Cleanup pending secondary event
 ring events
Date: Fri, 15 Sep 2023 17:09:57 -0700
Message-ID: <20230916001026.315-5-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230916001026.315-1-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aSYFYUddoAtT3GEPDbM6zMnsk5HQ0QTS
X-Proofpoint-GUID: aSYFYUddoAtT3GEPDbM6zMnsk5HQ0QTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxlogscore=803 mlxscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309160000
Message-ID-Hash: JKN75OQWS6A5FGKFMOXBXXAZAQYMMF4R
X-Message-ID-Hash: JKN75OQWS6A5FGKFMOXBXXAZAQYMMF4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKN75OQWS6A5FGKFMOXBXXAZAQYMMF4R/>
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
