Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E465D8B2B92
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 23:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C01E66;
	Thu, 25 Apr 2024 23:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C01E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714082106;
	bh=084IO9amp2c0jDLCGlxrmltSN1JQG9VQVJmeEY2pz/w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NWHDOfGJasRWQ1QmB5OFdyWNXJIOkFaSCALqtjINznL1aYQZwRELNk8FPqDC4pXMb
	 a6AOKEerMqbWRVHs6hoLA4ymjC6wuacA4RzzPB+4vN+ZurEgSoVRwPj0uNjs9SB09Y
	 0pNA91zJh0fjhnyeZgbFh+jBgiTVVLWTrfZP3Yow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB60F80618; Thu, 25 Apr 2024 23:53:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0099EF80619;
	Thu, 25 Apr 2024 23:53:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6944FF80423; Thu, 25 Apr 2024 23:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51B3AF80570
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 23:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B3AF80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Dm/U5A/k
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43PLpe7S027973;
	Thu, 25 Apr 2024 21:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=K7TG0JvYcwj3UB1TbQLB
	RfARa32yTzdf2KG9+GHHmGY=; b=Dm/U5A/kb1mas7WDMCcTKwwAuPjv5Zmb3H0C
	WS2oboyY0bZdeHa5+I/6V+F3ISWiGzOCXlFsOxep3m2hCmR0PUYOlcpDhIdDgMFG
	2NjKWw0IxnoapIYk7qIr9uKYKleH8nu7vAglv8j8Wo42Fif4zTX0iy88IpjrAyP5
	z3aWKHaB9HxN1k/eD15uxT2z5+tBQKgeAtD7/KGyxudKBixxPEJHsAwlwUocvUcF
	ienrOum+J0aQHZ4dm2xsh5zmtrUi4jz6ZcM1emmESM5BSyUSGpSia1CcIB0jQ3BE
	mgIOpr2qEPwiOvnF9RueJsRtG1as5eETeXYkj/uQg0d7fnLKBQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqtph8ndk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43PLpc95007949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:38 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 14:51:38 -0700
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
Subject: [PATCH v20 06/41] usb: host: xhci-sideband: Expose a sideband
 interrupter enable API
Date: Thu, 25 Apr 2024 14:50:50 -0700
Message-ID: <20240425215125.29761-7-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240425215125.29761-1-quic_wcheng@quicinc.com>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZrvtvJ4SFHHk_6h_Cuy-dKgUZwiNq8L4
X-Proofpoint-ORIG-GUID: ZrvtvJ4SFHHk_6h_Cuy-dKgUZwiNq8L4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 mlxlogscore=991 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404250159
Message-ID-Hash: ZCSQRPDQKONSA3HE66ALWE45EH6W5IE3
X-Message-ID-Hash: ZCSQRPDQKONSA3HE66ALWE45EH6W5IE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCSQRPDQKONSA3HE66ALWE45EH6W5IE3/>
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
index 255feae33c6e..6fdae9840c11 100644
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
