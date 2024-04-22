Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9D8AD7B0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 00:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7738F55;
	Tue, 23 Apr 2024 00:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7738F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713826318;
	bh=ByiIc7YY39/+Ozgdnf6uOIrkHURuL4HgdYAPIFWEp8c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n8cRO3W/E+FuusRrl9ejbpGRhL+Nx9fW7qAkeIEcIMPKr9qjh9eqOJXpkeyRQpgiL
	 wEnHi4UhMZcKtqhNTZ+JkHaizt57bfTdUy52QR9HdvAxMIlx00v4rU3+M4GIE2Cssa
	 Kz09Rc+CBzisamPxh4rPaCb2UCRuyMezxNdFH77M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E10F806A9; Tue, 23 Apr 2024 00:50:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4780CF80699;
	Tue, 23 Apr 2024 00:50:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84306F805F7; Tue, 23 Apr 2024 00:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1698F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 00:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1698F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ZDXXFgXV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43MKDvMW015084;
	Mon, 22 Apr 2024 22:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=NpHBeykq8LdzEryj6A1i
	QTR5qcXhklfggTOoYTCUb0o=; b=ZDXXFgXVHtZymvXQ7D1QA1l5C+QEWOawF+XI
	HGIy32INCJ7MC3Qv5oxjO7kDakp4L57WwY57BVv4LmvwJExndKOeNUMcOhSgG5Iq
	Om5kZMn+qpnz5DHE1WTB2UTTtRRxy3X296uaSWWUxVv5HOGhFif7kOX2gMO1r60b
	serYtjwHgT8KZ/xCXk+pgI+fW+kZgnkrZC1r+wlaJ2vkWgPnQQno5jiyfaLa/olR
	62XQ2EAYwYSWJPatDBKea9nISVIcGpNCRlnbbIhwY/UvT85VlwGgE11/zLSuDwih
	kBRJASmjHWz8H+QMmRM9wcEdAz1kLbUQPjahVttPQyH3XD+Heg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnr49s99k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43MMnHPW012042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:17 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Apr 2024 15:49:16 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v19 01/41] xhci: add helper to stop endpoint and wait for
 completion
Date: Mon, 22 Apr 2024 15:48:26 -0700
Message-ID: <20240422224906.15868-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240422224906.15868-1-quic_wcheng@quicinc.com>
References: <20240422224906.15868-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uF39gMOcVuofiWDGFWx1wtIHD_Zw5uFW
X-Proofpoint-GUID: uF39gMOcVuofiWDGFWx1wtIHD_Zw5uFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_16,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404220096
Message-ID-Hash: MVWPV4Q3O4SEJ6JZZ3VHSMUK2IPW7RIZ
X-Message-ID-Hash: MVWPV4Q3O4SEJ6JZZ3VHSMUK2IPW7RIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVWPV4Q3O4SEJ6JZZ3VHSMUK2IPW7RIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Expose xhci_stop_endpoint_sync() which is a synchronous variant of
xhci_queue_stop_endpoint().  This is useful for client drivers that are
using the secondary interrupters, and need to stop/clean up the current
session.  The stop endpoint command handler will also take care of cleaning
up the ring.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8579603edaff..0680f4703c92 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2784,6 +2784,45 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 	return -ENOMEM;
 }
 
+/*
+ * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
+ * waits for the command completion before returning.
+ */
+int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
+			    gfp_t gfp_flags)
+{
+	struct xhci_command *command;
+	unsigned long flags;
+	int ret;
+
+	command = xhci_alloc_command(xhci, true, gfp_flags);
+	if (!command)
+		return -ENOMEM;
+
+	spin_lock_irqsave(&xhci->lock, flags);
+	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
+				       ep->ep_index, suspend);
+	if (ret < 0) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		goto out;
+	}
+
+	xhci_ring_cmd_db(xhci);
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	wait_for_completion(command->completion);
+
+	if (command->status == COMP_COMMAND_ABORTED ||
+	    command->status == COMP_COMMAND_RING_STOPPED) {
+		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
+		ret = -ETIME;
+	}
+out:
+	xhci_free_command(xhci, command);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
 
 /* Issue a configure endpoint command or evaluate context command
  * and wait for it to finish.
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 6f4bf98a6282..0f3ae08507ed 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1921,6 +1921,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			    int suspend, gfp_t gfp_flags);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
