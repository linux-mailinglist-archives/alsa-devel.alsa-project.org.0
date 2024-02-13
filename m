Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C38524AA
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 01:57:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A7A386F;
	Tue, 13 Feb 2024 01:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A7A386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707785866;
	bh=Jk0LMWaa/SpQYHxNARX1Jnkq4LIW4HOuymWLQdv26ls=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RfKA5L/pnKJekWpXpwH0Y8L+QTXek11yAZPPD7b2qD6OH073M832ghE4mdJ/X3Nqb
	 D0NiG9MTMW5NTy78PIxYKVYSRTOrK93k4oE7co13E2f9QEholLqkBLWx3Emcl2X6fH
	 zcA5eZ7h3fRhtYVMYjGsuxJx2IMZX/Jber8CjytI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A684F806F8; Tue, 13 Feb 2024 01:55:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 843CAF8070E;
	Tue, 13 Feb 2024 01:55:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E385F80637; Tue, 13 Feb 2024 01:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13A31F80570
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A31F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=DoBqXamO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D0sa51001435;
	Tue, 13 Feb 2024 00:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=KLjeKKCPmPfKQrXevx6P
	EsBCLzPg435el7fcR46yWyc=; b=DoBqXamOhXervrR6deZ/k9rCaIFCIg92Xl6p
	gCVoBxWVXzoTQ7YuJQcVA98jQ/edMRm8CPCIt0VMG8nc5rtEP2ak/rBupifsUgJZ
	1a5ck0QYeaADbl44D5N8QaRqrhWhyiCA6yQmpX2vVCp5Vq+Fx3KyJmSDEGYt59b2
	3gj6Tx7N1UMtlTXgaLMcatSc6ttE7KBl5AiI+rqE5hGAwf1eroSB6HQydVx/mjbR
	g3Gyrd58CKfRodlC/6M1zMyTl1057igQZFB1k3WqSLGyUhRQq6aOWbUEaqoBRR+b
	Hsl6eOXzlG/txfOedMmNVNT+DviRGr9S9yiNbqhTQTKW9KHibg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7s390kbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0sZmb031075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:35 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:34 -0800
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
Subject: [PATCH v15 08/50] xhci: Don't check if the event ring is valid before
 every event TRB
Date: Mon, 12 Feb 2024 16:53:40 -0800
Message-ID: <20240213005422.3121-9-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: yprBD-P_vUWcNNinZbNpqAwESbsCnXXu
X-Proofpoint-GUID: yprBD-P_vUWcNNinZbNpqAwESbsCnXXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=476 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402130005
Message-ID-Hash: 6BHOD6YIWN4TXBAQMAWVS3YTNZ6EQCNL
X-Message-ID-Hash: 6BHOD6YIWN4TXBAQMAWVS3YTNZ6EQCNL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BHOD6YIWN4TXBAQMAWVS3YTNZ6EQCNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Check if the event ring exists and is valid once when the event handler
is called, not before every individual event TRB.

At this point the interrupter is valid, so no need to check that.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 48388bc16b24..293239d8fab0 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2922,12 +2922,6 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	union xhci_trb *event;
 	u32 trb_type;
 
-	/* Event ring hasn't been allocated yet. */
-	if (!ir || !ir->event_ring || !ir->event_ring->dequeue) {
-		xhci_err(xhci, "ERROR interrupter not ready\n");
-		return -ENOMEM;
-	}
-
 	event = ir->event_ring->dequeue;
 
 	if (!unhandled_event_trb(ir->event_ring))
@@ -3031,6 +3025,12 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 
 	xhci_clear_interrupt_pending(xhci, ir);
 
+	/* Event ring hasn't been allocated yet. */
+	if (!ir->event_ring || !ir->event_ring->dequeue) {
+		xhci_err(xhci, "ERROR interrupter event ring not ready\n");
+		return -ENOMEM;
+	}
+
 	if (xhci->xhc_state & XHCI_STATE_DYING ||
 	    xhci->xhc_state & XHCI_STATE_HALTED) {
 		xhci_dbg(xhci, "xHCI dying, ignoring interrupt. Shouldn't IRQs be disabled?\n");
