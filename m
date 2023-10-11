Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991107C4684
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 02:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16ABCA4C;
	Wed, 11 Oct 2023 02:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16ABCA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696983881;
	bh=m1DpfrPpGuoT0CSyU2x/iMieq7hlEXVzGS7lXLSjWeQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WR58R0QZjXA8ja5pOe6YKHPjA0CkIcOngnm3r4/03sQ5TkUgJK5IUI4xgjRAKjE2j
	 kA2vr1dObuKc5HlnFzh8sWM8meoPKtinFD2b2MKHrCaI0N0gz0ZiOwUdeQRd8TF5OB
	 e4V6OD/xXsKDaB0wqn+jWjUGJ7Q0mqhp7rpdIX5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35012F805BF; Wed, 11 Oct 2023 02:22:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7AA7F805BA;
	Wed, 11 Oct 2023 02:22:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DF0EF80589; Wed, 11 Oct 2023 02:22:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5416BF8027B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 02:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5416BF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=VZ6GeSq0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39B02b9g008268;
	Wed, 11 Oct 2023 00:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Eipf0qdUNseeeCPv1ROKNIpVDYWm+TtqgG+NoHVraz8=;
 b=VZ6GeSq0fsgkmUkZGjdUn56xQbY0SgQIPQTadXltXDYGe1FC67lCsIIGOMsHm//0jdbA
 tlCCDUebur5/GcRp/9q09B3HstTEYRG/xAbvOM/5ttiAbp2XHwuYpvrMKQ59IK8y5OJ0
 QqhPB/e+khmM+nzNnhWRFk+CXcTPCp+imbi8R39EEKL7nG0/LLWxuJKOM/XPcyk14WVN
 gq/wJgyJBO2qbEJ7/VvkLPXnR44f0wwiME4Tpn75gTsPNq0dONQGSDlaR8MFxrEQijmg
 lEIV8aoq0wy+ABn5jxZPkd7COFbcnEW2ZdD6aQg4QPSVvrjapZ0eb77qvCAYRZMpKXRD vw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tngtp80t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:29 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39B0MS85027057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:29 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 17:22:28 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v8 01/34] xhci: split free interrupter into separate remove
 and free parts
Date: Tue, 10 Oct 2023 17:21:13 -0700
Message-ID: <20231011002146.1821-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231011002146.1821-1-quic_wcheng@quicinc.com>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qfiOPaBh_7do5sbz9Iwe1ZJDBa7wNOIh
X-Proofpoint-GUID: qfiOPaBh_7do5sbz9Iwe1ZJDBa7wNOIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_19,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=939
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110001
Message-ID-Hash: URZAWY7RS7OPML3LBY7RXFD5G4HHHZJL
X-Message-ID-Hash: URZAWY7RS7OPML3LBY7RXFD5G4HHHZJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URZAWY7RS7OPML3LBY7RXFD5G4HHHZJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

The current function that both removes and frees an interrupter isn't
optimal when using several interrupters. The array of interrupters need
to be protected with a lock while removing interrupters, but the default
xhci spin lock can't be used while freeing the interrupters event ring
segment table as dma_free_coherent() should be called with IRQs enabled.

There is no need to free the interrupter under the lock, so split this
code into separate unlocked free part, and a lock protected remove part.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 8714ab5bf04d..a54f74933437 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1797,23 +1797,14 @@ int xhci_alloc_erst(struct xhci_hcd *xhci,
 }
 
 static void
-xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
-	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
-	size_t erst_size;
 	u64 tmp64;
 	u32 tmp;
 
 	if (!ir)
 		return;
 
-	erst_size = sizeof(struct xhci_erst_entry) * ir->erst.num_entries;
-	if (ir->erst.entries)
-		dma_free_coherent(dev, erst_size,
-				  ir->erst.entries,
-				  ir->erst.erst_dma_addr);
-	ir->erst.entries = NULL;
-
 	/*
 	 * Clean out interrupter registers except ERSTBA. Clearing either the
 	 * low or high 32 bits of ERSTBA immediately causes the controller to
@@ -1828,10 +1819,28 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp64 &= (u64) ERST_PTR_MASK;
 		xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
 	}
+}
+
+static void
+xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+{
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	size_t erst_size;
+
+	if (!ir)
+		return;
+
+	erst_size = sizeof(struct xhci_erst_entry) * ir->erst.num_entries;
+	if (ir->erst.entries)
+		dma_free_coherent(dev, erst_size,
+				  ir->erst.entries,
+				  ir->erst.erst_dma_addr);
+	ir->erst.entries = NULL;
 
-	/* free interrrupter event ring */
+	/* free interrupter event ring */
 	if (ir->event_ring)
 		xhci_ring_free(xhci, ir->event_ring);
+
 	ir->event_ring = NULL;
 
 	kfree(ir);
@@ -1844,6 +1853,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
+	xhci_remove_interrupter(xhci, xhci->interrupter);
 	xhci_free_interrupter(xhci, xhci->interrupter);
 	xhci->interrupter = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed primary event ring");
