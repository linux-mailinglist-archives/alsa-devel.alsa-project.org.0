Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C3D8AD80B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 00:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 297CDF51;
	Tue, 23 Apr 2024 00:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 297CDF51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713826537;
	bh=W2P7l4KLZK19YrZcXmIf+wo2rOM8o2Fu5wEMGpg2QRA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WeikhHgH28tlfliJImebMHW43U2u8+PXosgtKOYhZVt67xQ4/LRLqtqJmBnhJxKS9
	 z6AnypXLVn0HzdwYnyj93NwHvPKsRWihmum3n7ecaKxUWZLjnpD/3UDVFLAKltsbyc
	 vZFsJfprQvycYeHs3RGUxk81bzzmlbBjIgVZw22c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A663F89664; Tue, 23 Apr 2024 00:50:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B60F896B6;
	Tue, 23 Apr 2024 00:50:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC97DF805C3; Tue, 23 Apr 2024 00:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCF9CF80587
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 00:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF9CF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=TgTWm5NP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43MLivLr019869;
	Mon, 22 Apr 2024 22:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=1yoLXLgWNYKdotyAO8VB
	1mL3mjJ8Idj2ssbXkzyvOfs=; b=TgTWm5NPvvzn8HbdcbsaERcfgP7tVi31HBx1
	HSQdyX7Qka8rgPGUrUZQX/xl/zuyg/PzMjbqGPRxXKIQI6p7klqjSYoghPQHsz9l
	5JbIsQkvCa6gNkK7NxjizqIuTL3+lq27Y9YaOlfuc8W/NXfxaWdOh0vUv8c2YXph
	VPocwJR2UZvexKSOktq+AgctINVCXsdu2/A+D+aqgTqElXNr4Fmjk70gcO2og+jc
	4ILS08s48JuTqRQv0S/TEcpLfHJz3/9bdSlTJdShUzwnWT89cnL+SgysZimHFx6S
	+3TVHSpSpuM2klgeWJD8kFz91ED0mqHgRj6WCNYrOlEjQCiMPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnet7ajv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43MMnHAY027701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:17 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Apr 2024 15:49:17 -0700
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
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v19 04/41] xhci: export XHCI IMOD setting helper for
 interrupters
Date: Mon, 22 Apr 2024 15:48:29 -0700
Message-ID: <20240422224906.15868-5-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 54w7qpVuPzDa3poSxPzrcdDPI4TxqRAu
X-Proofpoint-ORIG-GUID: 54w7qpVuPzDa3poSxPzrcdDPI4TxqRAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_16,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=776 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220096
Message-ID-Hash: CPUQBOFRXOFRJJKBATXXFN52IASIYJDR
X-Message-ID-Hash: CPUQBOFRXOFRJJKBATXXFN52IASIYJDR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPUQBOFRXOFRJJKBATXXFN52IASIYJDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Utilize the xhci_set_interrupter_moderation() API to set the IMOD value for
interrupters, so that secondary interrupts can also configure this
parameter when clients request for it.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci.c | 3 ++-
 drivers/usb/host/xhci.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 061cb60ffac1..1e31a0811574 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -349,7 +349,7 @@ int xhci_disable_interrupter(struct xhci_interrupter *ir)
 EXPORT_SYMBOL_GPL(xhci_disable_interrupter);
 
 /* interrupt moderation interval imod_interval in nanoseconds */
-static int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 					   u32 imod_interval)
 {
 	u32 imod;
@@ -364,6 +364,7 @@ static int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_set_interrupter_moderation);
 
 static void compliance_mode_recovery(struct timer_list *t)
 {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 67d729635d56..bc3f18651494 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1876,6 +1876,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct usb_tt *tt, gfp_t mem_flags);
 int xhci_enable_interrupter(struct xhci_interrupter *ir);
 int xhci_disable_interrupter(struct xhci_interrupter *ir);
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+					   u32 imod_interval);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
