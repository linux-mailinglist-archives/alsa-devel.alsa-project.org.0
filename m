Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81940858B47
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 01:18:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E1C5E69;
	Sat, 17 Feb 2024 01:18:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E1C5E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708129108;
	bh=q7zkNjeVjlvi8Zzo5h3Qzp59mUx4EA1dyovBNof5Slk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bNKGiPqQItM9i/h44tL4aDHNaqJjhhMen3gnmrOnto+0rMFea550oQ0EG7Is8AMVS
	 kLZcIeJSkjpYdAVYViB9N/jLTY2J+AjQ1qRQw3VShVQKxF2Eqg3+8I7n7EvBUvlQhx
	 9j3MpafP8KUU1l6zjJSC6G/aWR8vof680l53DBY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 346C6F80695; Sat, 17 Feb 2024 01:16:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96BA2F80571;
	Sat, 17 Feb 2024 01:16:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72EA0F804CC; Sat, 17 Feb 2024 01:11:23 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4D4BF80579
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 01:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D4BF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=p3uSqiq2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41H0AW1o004012;
	Sat, 17 Feb 2024 00:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=hP3Dy860dLQ9yKYDrQhg
	94kIWgx1+3NOAWbDKxKPxWs=; b=p3uSqiq2uju8VrhRERvwbjGJVlv9XoMkmzw2
	ZhOteSLu9jJmKfDxZXZFSHtAqHeya69ZoRiqQVHuml962U5SAti7SRYBC0vLCRS3
	RDntuAsvbZFN1+I47BYSbs5yaIZEogQknxxUXgNWwOSoHxsUUOkGTaxytifjLUYi
	aqAiUyFh3M3ftqqM6xDDPEC4sOzPq3YjXLEKHD5YrAbmYmtcIJ/lNBkC2/qXooJz
	Szwr3nBDUjMKVLhE0lb75kcNl5DZrILrGfa1R8TjhvayFGUyjzjub1Wbawn5yhnF
	wySvugdjJ2JEraX/8cf8plr0ZunfsmjU3MFWchwU58IjSTxoxQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9xdxa96c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41H0AXSe017213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 16:10:33 -0800
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
Subject: [PATCH v17 13/51] xhci: export XHCI IMOD setting helper for
 interrupters
Date: Fri, 16 Feb 2024 16:09:39 -0800
Message-ID: <20240217001017.29969-14-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240217001017.29969-1-quic_wcheng@quicinc.com>
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3iByqtOfElKj-YdXf1D-_j3fqxsdIUD1
X-Proofpoint-GUID: 3iByqtOfElKj-YdXf1D-_j3fqxsdIUD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_23,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=760 adultscore=0 phishscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160189
Message-ID-Hash: W5ILEG3QHHAWDTDOHPJFGKN7IOUQS73Y
X-Message-ID-Hash: W5ILEG3QHHAWDTDOHPJFGKN7IOUQS73Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5ILEG3QHHAWDTDOHPJFGKN7IOUQS73Y/>
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
index 834d8d160da4..d2ce1e1421e6 100644
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
index 9039f234cf52..77042df42b46 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1875,6 +1875,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct usb_tt *tt, gfp_t mem_flags);
 int xhci_enable_interrupter(struct xhci_interrupter *ir);
 int xhci_disable_interrupter(struct xhci_interrupter *ir);
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+					   u32 imod_interval);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
