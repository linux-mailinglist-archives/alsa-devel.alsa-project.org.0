Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158D847E85
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 03:38:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F40E0F;
	Sat,  3 Feb 2024 03:38:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F40E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706927921;
	bh=/ctydeO9BP9IDNCKzOW84UaD1pWVBJmsNl/Vixk3Z5M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mc4Kk0IjNp9se51aah2Mx31IFwrwSG/J/8RZ6wWAcWpQ7yP8q0xGY3GekUimt2oXr
	 N1qZ+g3mTq4rlqn1uc7XrjpRO5dyfoGm7pHOhykR4Nyl4mSn5umfXI8ayDD2umNG6B
	 C+GtCHZido7YHADsp7ZfrtD/Skl7cB4bPXHRlngM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5203F80602; Sat,  3 Feb 2024 03:37:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EC87F805FC;
	Sat,  3 Feb 2024 03:37:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1AE6F805B5; Sat,  3 Feb 2024 03:37:38 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B2321F80149
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 03:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2321F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=TksxWt9w
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4131vpjH015339;
	Sat, 3 Feb 2024 02:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=2sOcjxKmnstL/5ftZf58
	41vds3YmEI4sRJLRwbFI4Jw=; b=TksxWt9wD+hoE1wZM0dYR9Mip7EhGUvIUp0I
	H3YzlTxhKDLq1Ayl0YbckWnl52CBK4mJFQGq/svusRBpOoCcqongn1y5QXZ2HgTx
	L3dFxmD2rvVi3Q2TeGYemG/ITGYW6JqeJ1Lclz70icWi9ugkmup9OvuXBHOfZEDi
	fg5IT1Ne2OJgpyH4y16C4VYijU4G10OTqMkwt7WOM0Ri5ohBxyNAaDo74wxgkKPu
	6zVM7E2Gz8WSH79zd4KPSQhsUvKPieh25ZO+kSkT6Z8T3Q3tA0zNGPK5pe6RMBC6
	o+lvVXBJk9vxNAUzBd9ttqa5U92WQ3R5GjBJHTqDPSjS+HuKbA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w1ax4849a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 Feb 2024 02:37:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4132bHsY008154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 Feb 2024 02:37:17 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 18:37:17 -0800
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
Subject: [PATCH v13 01/53] xhci: fix possible null pointer dereference at
 secondary interrupter removal
Date: Fri, 2 Feb 2024 18:35:53 -0800
Message-ID: <20240203023645.31105-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240203023645.31105-1-quic_wcheng@quicinc.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nvPhaEaUOS4conh-P7-RduoJTWJsxWOX
X-Proofpoint-GUID: nvPhaEaUOS4conh-P7-RduoJTWJsxWOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402030015
Message-ID-Hash: 6KSUYIJP7IJ2QIMCWP4LFCTC427LSQYF
X-Message-ID-Hash: 6KSUYIJP7IJ2QIMCWP4LFCTC427LSQYF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6KSUYIJP7IJ2QIMCWP4LFCTC427LSQYF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Don't try to remove a secondary interrupter that is known to be invalid.
Also check if the interrupter is valid inside the spinlock that protects
the array of interrupters.

Found by smatch static checker

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-usb/ffaa0a1b-5984-4a1f-bfd3-9184630a97b9@moroto.mountain/
Fixes: c99b38c41234 ("xhci: add support to allocate several interrupters")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Link: https://lore.kernel.org/r/20240125152737.2983959-2-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4460fa7e9fab..d00d4d937236 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1861,14 +1861,14 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	unsigned int intr_num;
 
+	spin_lock_irq(&xhci->lock);
+
 	/* interrupter 0 is primary interrupter, don't touch it */
-	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
+	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters) {
 		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
-
-	/* fixme, should we check xhci->interrupter[intr_num] == ir */
-	/* fixme locking */
-
-	spin_lock_irq(&xhci->lock);
+		spin_unlock_irq(&xhci->lock);
+		return;
+	}
 
 	intr_num = ir->intr_num;
 
