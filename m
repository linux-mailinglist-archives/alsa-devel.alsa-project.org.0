Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB485748E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 05:03:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63883F94;
	Fri, 16 Feb 2024 05:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63883F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708056236;
	bh=74+W930K1wkGD35+UeXg8QjQl2pzz0ZzdVdyKeRWWQE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b458yhd/f9lRAM4E/CCXuJw0qMSgFlu0nwBQFDkeyJrUDu1zDpnzSv7+69w2I4n17
	 guo+QxxBg1/XtY4NWgECNNvV3Gs60t27Gbworrc7Q6z2kWaDM39eLriJFzTImQAQGz
	 r6GU2qTSN7xPA33cv1s2SR3SRuBhn2hWAJAAthoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D3F9F8057B; Fri, 16 Feb 2024 05:00:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37D2FF807A6;
	Fri, 16 Feb 2024 05:00:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7783F8061D; Fri, 16 Feb 2024 05:00:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0229AF8057B
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 04:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0229AF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=pclAooid
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G3UYU9009006;
	Fri, 16 Feb 2024 03:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=ft8ascdYDoVxl0EFVL6a
	RCJwWuDIAtRtIjiBqTLb+n0=; b=pclAooidF2zZ+YPVTHv/oqSWBcD9AGT75Uh4
	reRHp50UFBxoY6bSihfrnak14VJLCPwzl+iO2LoDzKGwylm6zMd005NaRHYMi+4A
	h2+DteIF3XMTtOR2p8UiTZp4BRqaIK9vj6NKH8q/b3OKH06Etw7GNbOUA1XLeaUG
	2gdpGhiKRp6pvGHpWBq8sGHyZtNxcuUW4qzAOo1DP/iUoZaIA7FoeBhJBJsV9TRW
	EuSA+roC0T+qK+l8rKRoUJWfUpyCaoxfgOPTUW8YbOTIDs4U/1fiD/J5YpQTI1X+
	7ZpL43Sykiu3ynOFN/9osGRKL56VVzfI6WzVmevTm6zpk/bi5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9yta816t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41G3xa2Z020525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:36 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 19:59:36 -0800
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
Subject: [PATCH v16 12/50] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
Date: Thu, 15 Feb 2024 19:58:45 -0800
Message-ID: <20240216035923.23392-13-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240216035923.23392-1-quic_wcheng@quicinc.com>
References: <20240216035923.23392-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m6Im_4tIk4poKeocmHEcS4r9NLZlwycV
X-Proofpoint-ORIG-GUID: m6Im_4tIk4poKeocmHEcS4r9NLZlwycV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_03,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=903
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160031
Message-ID-Hash: A7QSURRQDE6OHCGII337HJECLUOFUAQ7
X-Message-ID-Hash: A7QSURRQDE6OHCGII337HJECLUOFUAQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7QSURRQDE6OHCGII337HJECLUOFUAQ7/>
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

Change-Id: Ibf482477dde9ca2f172d5d236ff5b7c87aebe947
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d4a28ac4967f..82c10a5ac6e9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2962,14 +2962,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -3058,8 +3066,9 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 }
 
 /*
- * Handle all OS-owned events on an interrupter event ring. It may drop
- * and reaquire xhci->lock between event processing.
+ * Handle all OS-owned events on an interrupter event ring, or skip pending events
+ * for non OS owned interrupter event ring. It may drop and reaquire xhci->lock
+ * between event processing.
  */
 static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8908c3f5af6f..9039f234cf52 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1433,6 +1433,7 @@ struct xhci_interrupter {
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
 	bool			ip_autoclear;
+	bool			skip_events;
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;
