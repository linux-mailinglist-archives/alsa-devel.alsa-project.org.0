Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5F85249B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 01:56:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167B686E;
	Tue, 13 Feb 2024 01:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167B686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707785796;
	bh=+Lw1+4MAX2LtZpd2jn62R4vA+ALFex1PxyuYDKU/fN0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qD91cxDyfhMQYQvOo05jekiPLC/pWkQHwSkgZBdIWVoaA0Jl32lmx/krO4vUYuGZr
	 bVCycY64moWbVmA3ZAtpAdUi38S7UooBvogKC3T2IhzPg2ZDis11f5KRUA4GgxTs1e
	 d3btZ9tKQJWIZFifUU69816bcG2iCH+1fbYB7UOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB39F80682; Tue, 13 Feb 2024 01:55:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F74F80659;
	Tue, 13 Feb 2024 01:55:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93CB2F8060C; Tue, 13 Feb 2024 01:54:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5D71F8025A
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D71F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=T7NZ8y+e
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D0NBRo009799;
	Tue, 13 Feb 2024 00:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=CAxjiLONN0FsfVJGEMs1
	T7t8zj114/9U4ixQ4PoMPaY=; b=T7NZ8y+e5oI8U/bskqs1KNlL7pdIOVCYCVLn
	QNpBbh308/HgouJjD5Hgiq9PkYx68NKX/81KXjneaazT84mJSYmzuS90g/PZkfKC
	eIRCgGXtWIi1d75UzZ59xfxJQGX4hp95TrhEmVZQvIAZ7ouv+sVpLMoIerUDLD4T
	FjRm7YSDz8ROm2QO+Upy3R6ofKL+FGVWmRBXfxKThgxp4W5zaY1HqLtVZUBbmgo2
	j70k76jGBZCnw5Tagr1MTUwT75JcWgkOCEgMOeWX12OmsodGTj6ptDfCVKDRIBEY
	b0tkT2YHd2upkO/15SawIv18akJh0Ejqne66//UvdSdW4ZIwOg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62kt4ty6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0sX6M029942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:32 -0800
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
Subject: [PATCH v15 01/50] xhci: Add interrupt pending autoclear flag to each
 interrupter
Date: Mon, 12 Feb 2024 16:53:33 -0800
Message-ID: <20240213005422.3121-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240213005422.3121-1-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xYYz8C5f7TWID6_kRTK0hGUGGVnPikRk
X-Proofpoint-ORIG-GUID: xYYz8C5f7TWID6_kRTK0hGUGGVnPikRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=747 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130005
Message-ID-Hash: EAYSLMTTIPA6GUYGH6IQE2CHZDQIUMUO
X-Message-ID-Hash: EAYSLMTTIPA6GUYGH6IQE2CHZDQIUMUO
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Each interrupter has an interrupt pending (IP) bit that should be cleared
in the interrupt handler. This is done automatically for systems using
MSI/MSI-X interrupts.

Secondary interrupters used by audio offload may not actually trigger
MSI/MSI-X messages, so driver may need to clear the IP bit manually for
these, even if the primary interrupter IP is cleared automatically.

Add an ip_autoclear flag to each interrupter that driver can configure
when requesting an interrupt for that xHC interrupter, and move
the interrupt pending clearing code to its own helper function.
Use this ip_autoclear flag instead of the current hcd->msi_enabled
to check if IP flag is cleared by software.

[Moved ip_autoclear into xhci and set based on msi_enabled -wcheng]

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 21 +++++++++++++++------
 drivers/usb/host/xhci.c      |  3 +++
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 33806ae966f9..f8e78068c36f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3013,6 +3013,19 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 	xhci_write_64(xhci, temp_64, &ir->ir_set->erst_dequeue);
 }
 
+/* Clear the interrupt pending bit for a specific interrupter. */
+static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
+					 struct xhci_interrupter *ir)
+{
+	if (!ir->ip_autoclear) {
+		u32 irq_pending;
+
+		irq_pending = readl(&ir->ir_set->irq_pending);
+		irq_pending |= IMAN_IP;
+		writel(irq_pending, &ir->ir_set->irq_pending);
+	}
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error condition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
@@ -3062,12 +3075,8 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 
 	/* This is the handler of the primary interrupter */
 	ir = xhci->interrupters[0];
-	if (!hcd->msi_enabled) {
-		u32 irq_pending;
-		irq_pending = readl(&ir->ir_set->irq_pending);
-		irq_pending |= IMAN_IP;
-		writel(irq_pending, &ir->ir_set->irq_pending);
-	}
+
+	xhci_clear_interrupt_pending(xhci, ir);
 
 	if (xhci->xhc_state & XHCI_STATE_DYING ||
 	    xhci->xhc_state & XHCI_STATE_HALTED) {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c057c42c36f4..0886829d53e5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -538,6 +538,9 @@ int xhci_run(struct usb_hcd *hcd)
 	 */
 
 	hcd->uses_new_polling = 1;
+	if (hcd->msi_enabled)
+		ir->ip_autoclear = true;
+
 	if (!usb_hcd_is_primary_hcd(hcd))
 		return xhci_run_finished(xhci);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c6349e7e1e95..daee202cd369 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1431,6 +1431,7 @@ struct xhci_interrupter {
 	struct xhci_erst	erst;
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
+	bool			ip_autoclear;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;
 	u32	s3_irq_control;
