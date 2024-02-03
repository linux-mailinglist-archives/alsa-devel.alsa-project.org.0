Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19915847F8A
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 03:52:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8BF14FD;
	Sat,  3 Feb 2024 03:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8BF14FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706928767;
	bh=SI/xXqTaKb918srbROgcUJ5EMq0uUfJ689ErJLs6vMk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WSx7cu+3rHd3eTZsfJJWnXhXmEBkcVV+zQq1QEcCQxqBwj4m9RpatkV3dkb44gziO
	 EVRRwawpTGS3n4eUxt0BS5aeZB1HfCNyT9Tsx+ay6//JDKAq49f48xMt+1OD3uCpwz
	 6SazBnU17ebsAuXBfD7C6gBhVoZNJtMN5I8+ZCcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1949F8999D; Sat,  3 Feb 2024 03:41:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62DD7F8085B;
	Sat,  3 Feb 2024 03:41:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D673F806D0; Sat,  3 Feb 2024 03:39:53 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 68806F8063A
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 03:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68806F8063A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Q9mwtihL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4132Yc0K014625;
	Sat, 3 Feb 2024 02:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=R0hg4dDBYEp27ZuNyVb3
	W+iuKNUNsrbwtnpJmQVwa24=; b=Q9mwtihLN8V3cZBMvOG3mSYH+bCwIRamKpYX
	y9ridLpR4KwKIv3mPn3gikcX8VVY7RyI1RiVzjb900ujF03BCY0qaD3uJF+y5U1h
	yhJi1CQgYPpdz5JDjA74wcl1tRV4i3caEr5sZIPf5iAtBVFRS0dscmAC3ClC2wUS
	DnBonCovZIW+JQ4NpxYSTTnh8XZpkxIWxZjGHzzt1CJP5zDRpfhjphEXjd/Zd1Nb
	hXMFmpRxrWOOpHWE21smdHcfcffzehEHBXF+aPlq6YPKZJcWaaOpXy9KX9y7ungW
	9FeHTvDsH5wD2rFBuGWEdJjEbbpiYiULd956jhdL8SgMUT5tqA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w1ctq003b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 Feb 2024 02:37:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4132bMgn004240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 Feb 2024 02:37:22 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 18:37:22 -0800
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
Subject: [PATCH v13 17/53] usb: host: xhci-sideband: Expose a sideband
 interrupter enable API
Date: Fri, 2 Feb 2024 18:36:09 -0800
Message-ID: <20240203023645.31105-18-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: eZDW89bTix9xxiCcb_iZeol03daH3Mct
X-Proofpoint-GUID: eZDW89bTix9xxiCcb_iZeol03daH3Mct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 mlxlogscore=861 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402030015
Message-ID-Hash: ZZLG2Z3CLSO4LZONIYY3CJIV4GTGO6L6
X-Message-ID-Hash: ZZLG2Z3CLSO4LZONIYY3CJIV4GTGO6L6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZLG2Z3CLSO4LZONIYY3CJIV4GTGO6L6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some use cases maybe require that the secondary interrupter's events to
be handled by the OS.  In this case, configure the IMOD and the
skip_events property to enable the interrupter's events.  By default,
assume that the secondary interrupter doesn't want to enable OS event
handling.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-sideband.c  | 28 ++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 0944bf31d772..504a6f1586b5 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -237,6 +237,30 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 
+/**
+ * xhci_sideband_enable_interrupt - enable interrupt for secondary interrupter
+ * @sb: sideband instance for this usb device
+ * @imod_interval: number of event ring segments to allocate
+ *
+ * Enables OS owned event handling for a particular interrupter if client
+ * requests for it.  In addition, set the IMOD interval for this particular
+ * interrupter.
+ *
+ * Returns 0 on success, negative error otherwise
+ */
+int xhci_sideband_enable_interrupt(struct xhci_sideband *sb, u32 imod_interval)
+{
+	if (!sb || !sb->ir)
+		return -ENODEV;
+
+	xhci_set_interrupter_moderation(sb->ir, imod_interval);
+	sb->ir->skip_events = false;
+	xhci_enable_interrupter(sb->ir);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_enable_interrupt);
+
 /**
  * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
  * @sb: sideband instance for this usb device
@@ -275,6 +299,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	}
 
 	sb->ir->ip_autoclear = ip_autoclear;
+	/* skip events for secondary interrupters by default */
+	sb->ir->skip_events = true;
 
 out:
 	mutex_unlock(&sb->mutex);
@@ -297,6 +323,8 @@ xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
 		return;
 
 	mutex_lock(&sb->mutex);
+	if (!sb->ir->skip_events)
+		xhci_disable_interrupter(sb->ir);
 	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
 
 	sb->ir = NULL;
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 1035dae43cee..a749ae307ba7 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -54,6 +54,8 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 struct sg_table *
 xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
 
+int xhci_sideband_enable_interrupt(struct xhci_sideband *sb, u32 imod_interval);
+
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear);
