Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A6858B66
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 01:19:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54116F52;
	Sat, 17 Feb 2024 01:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54116F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708129174;
	bh=soUlhEMLV8DNY0sLUBveVCiDs9XLA3RtItIiQZ90Sdg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mnsWyPJJtM/sGjczpo0jZxJovQ8SA4rbJV1K31wM1V70aWbd/GC1VxY8FKucLSS8X
	 x8QcJnBFGpFoN3Ln87KuIzG3e64NshN+jVP/aS5fYVdNnlSLxNZA1Z1/2rT2jixEpZ
	 oWJFRqj9CxRXd/1cY6pgh9onc3ULqF2g+SP5FZv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71486F8078F; Sat, 17 Feb 2024 01:16:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5ACBF80799;
	Sat, 17 Feb 2024 01:16:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CD20F804CC; Sat, 17 Feb 2024 01:11:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 916CDF8057F
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 01:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 916CDF8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=nsD/o4oT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GNNKmx000823;
	Sat, 17 Feb 2024 00:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=8dRN7NS8PzIoGdi4HEjV
	3ns3wsExyILDVgq4w72pbG4=; b=nsD/o4oTbMfLk9e8wt1okptHKE/p8k0HlKfP
	0qZ/2j46isAmnjvAxREDEmm4Pz/et3/JAf5YR8gV6/KPxlU04XUSI1vTkN+CmrbY
	LaKmXL/TpoaGfZYD5W1krCqEQ6SInWHIDCaNsNanlWpKkAxWkfx7Qpt+OqC071O2
	r3Ll9UQYF8AGBDMluZdQf9PEAnW94GIXUuHZbtM532X6cTOTSK7BQ7Wms6EteaAE
	D1R6Egw4OwIb4H7lqmu77b82+IGJhbum5OmeYDO++Ge4MrEm9fYWo4BQsTj5RYZw
	7org0hnt+WCACasl+7BZmXete+stNfxANUdWhBiRhwFMXKiIEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9xv9j897-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41H0AYKQ012892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:34 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 16:10:34 -0800
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
Subject: [PATCH v17 17/51] usb: host: xhci-mem: Allow for interrupter clients
 to choose specific index
Date: Fri, 16 Feb 2024 16:09:43 -0800
Message-ID: <20240217001017.29969-18-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MPGgzqC7DVBrYYTVloEbUAh1VL0TCoyn
X-Proofpoint-GUID: MPGgzqC7DVBrYYTVloEbUAh1VL0TCoyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_23,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=624
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160189
Message-ID-Hash: BNGDCNNTWMUFLLBZJW5TB4YM23IDTDU2
X-Message-ID-Hash: BNGDCNNTWMUFLLBZJW5TB4YM23IDTDU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNGDCNNTWMUFLLBZJW5TB4YM23IDTDU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some clients may operate only on a specific XHCI interrupter instance.
Allow for the associated class driver to request for the interrupter that
it requires.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c       | 30 ++++++++++++++++--------------
 drivers/usb/host/xhci-sideband.c  |  4 ++--
 drivers/usb/host/xhci.h           |  2 +-
 include/linux/usb/xhci-sideband.h |  2 +-
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index e4c13f056c1a..ae28dac7a747 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2360,7 +2360,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg, int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2375,28 +2375,30 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg)
 		return NULL;
 
 	spin_lock_irq(&xhci->lock);
-
-	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
+	/* Find available secondary interrupter, interrupter 0 is reserverd for primary */
 	for (i = 1; i < xhci->max_interrupters; i++) {
-		if (xhci->interrupters[i] == NULL) {
-			err = xhci_add_interrupter(xhci, ir, i);
-			break;
+		if ((intr_num > 0 && i == intr_num) || intr_num <= 0) {
+			if (xhci->interrupters[i] == NULL) {
+				err = xhci_add_interrupter(xhci, ir, i);
+				if (err) {
+					spin_unlock_irq(&xhci->lock);
+					goto free_ir;
+				}
+				break;
+			}
 		}
 	}
-
 	spin_unlock_irq(&xhci->lock);
 
-	if (err) {
-		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
-			  xhci->max_interrupters);
-		xhci_free_interrupter(xhci, ir);
-		return NULL;
-	}
-
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 i, xhci->max_interrupters);
 
 	return ir;
+
+free_ir:
+	xhci_free_interrupter(xhci, ir);
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 504a6f1586b5..3acbf23095e9 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -278,7 +278,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_enable_interrupt);
  */
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear)
+				 int intr_num, bool ip_autoclear)
 {
 	int ret = 0;
 
@@ -292,7 +292,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	}
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-			num_seg);
+			num_seg, intr_num);
 	if (!sb->ir) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 92ff1cf23556..dc5f472f5501 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1837,7 +1837,7 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg, int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index a749ae307ba7..1026502739c5 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -58,7 +58,7 @@ int xhci_sideband_enable_interrupt(struct xhci_sideband *sb, u32 imod_interval);
 
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear);
+				 int intr_num, bool ip_autoclear);
 
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
