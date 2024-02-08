Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2A84ED7F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 00:29:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08083F51;
	Fri,  9 Feb 2024 00:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08083F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707434940;
	bh=iy+moeOwHnE7dgEZhZINQgamHIdgTcysBEEcZ7EgGr0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jn9v4tOX2/nIeIMNPD8syRFNs66qicfbaN4QevZNhGMHJHUYP+h1nXtBv/h/A2NZf
	 MmKfPHNo62DiLjbZeGhD3QQlyXY4woFlZZZchVmoNpgbMbO585dWEl+ZNaHgWJPeW4
	 Ziyvlp1y2fYdm+PMR5ZS0CEH5XvPikAvrLkc+D6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A228BF899CB; Fri,  9 Feb 2024 00:18:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE5EBF899CE;
	Fri,  9 Feb 2024 00:18:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E5F6F80570; Fri,  9 Feb 2024 00:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00B9EF80570
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 00:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00B9EF80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=QQGMyYKZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418MHjX4008175;
	Thu, 8 Feb 2024 23:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=SG5fCDVTmpRgSZycQx3K
	EfThnpA6x5R39MnhiUzJey0=; b=QQGMyYKZQSj7Zxcr4HjbXUGi6coFHJMF0KJR
	5cGUEOu7zKpNv5pwwi+k8Pgqpx2eM/ySwRV9qNEyh4KwvBcS+1Lw0NWLhCcS99mR
	gfeXI6SKOch8ZQ8uAPNgjyaYk8GHyqtFrUX/AgqY/OzwJYCAODvqJzfn9CVxEfgt
	LnDg6urIFf9XhMlPnwVy9nSMdF6FOqfbZIBkm7thhq28RkJEhPYu9P67w305o8OF
	35EXEpGrmw+kwOyHIHEqAHi4/+glsHmyE/5E6PxTACq4ShJqr5aWe/2MEugk0EWp
	JC2RzVXbu9eFTsqIEoQ+gACc7qtsUefJLcsyP64v00A3bn+hMQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4pavjs04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 23:14:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 418NEJwq012220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 23:14:19 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 8 Feb 2024 15:14:19 -0800
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
Subject: [PATCH v14 13/53] usb: host: xhci: Export enable and disable
 interrupter APIs
Date: Thu, 8 Feb 2024 15:13:26 -0800
Message-ID: <20240208231406.27397-14-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208231406.27397-1-quic_wcheng@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: iD9s3Gr8mxmebLAxQYVMbpxS1U9mPmX8
X-Proofpoint-GUID: iD9s3Gr8mxmebLAxQYVMbpxS1U9mPmX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=527 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080131
Message-ID-Hash: ERZLVIM33ZNNHNWEYEOGWAPPXEOS2VJH
X-Message-ID-Hash: ERZLVIM33ZNNHNWEYEOGWAPPXEOS2VJH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERZLVIM33ZNNHNWEYEOGWAPPXEOS2VJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Secondary interrupters can be OS owned, so expose the enable and disable
interrupter APIs, so that the interrupts can be configured as requested
depending on the client.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci.c | 6 ++++--
 drivers/usb/host/xhci.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 872ce8c1a5ba..834d8d160da4 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -320,7 +320,7 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 		xhci_info(xhci, "Fault detected\n");
 }
 
-static int xhci_enable_interrupter(struct xhci_interrupter *ir)
+int xhci_enable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
@@ -332,8 +332,9 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_enable_interrupter);
 
-static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+int xhci_disable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
@@ -345,6 +346,7 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_disable_interrupter);
 
 /* interrupt moderation interval imod_interval in nanoseconds */
 static int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index eaea676c85d2..7c2481838f79 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1871,6 +1871,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		struct usb_device *hdev,
 		struct usb_tt *tt, gfp_t mem_flags);
+int xhci_enable_interrupter(struct xhci_interrupter *ir);
+int xhci_disable_interrupter(struct xhci_interrupter *ir);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
