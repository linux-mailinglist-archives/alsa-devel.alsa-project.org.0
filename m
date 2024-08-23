Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A595D70C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 22:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105E2823;
	Fri, 23 Aug 2024 22:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105E2823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724443735;
	bh=u1dWUqIEca7XH/A4ra7W55fG56soe/paLClrACCbIY0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G1BQ/DFcpMP8uCauvPqmK/P0yev7LhOx4hmrWJIsVShINHcZDHsJ7+JQUJc95SI10
	 4EYP805tVMvmBZWEpONFngXg4e1/wZBJXTbtCt8rxzoMsf2R17tMfvDWRZLMpMbnG2
	 hiv2Ql/u9i9DlnjofTQIHaxyodmr36x3ji/RGM14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40DF2F805BD; Fri, 23 Aug 2024 22:05:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 816D0F807CA;
	Fri, 23 Aug 2024 22:05:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DBE6F80517; Fri, 23 Aug 2024 22:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91942F805A9
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 22:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91942F805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=fvb8GXrJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47NEFXn8011175;
	Fri, 23 Aug 2024 20:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ouBODxkb/nIv7zI5SdwMqKG6
	w7PPLR6pL5rn8EaKM/g=; b=fvb8GXrJPENxEKUplc7ITobT2mOKqJKGkrIJIRlm
	aUp6hwTi/WhNJZfBsSjt3Ve0pG86oEYy1c1aY0pCkQ58keBMSIK53d+vhHPONvU8
	dwqhGoQRR/TntqRTkN2/HlsfxemnIJA8prYw4qS0dfsWsYRxzLd3QFlner25yoUK
	L8SpzmMIkgPQZ1ZAcQ4G/dkGd9jHW7nPWeNZjMC4CdujDGrr52SGtj3GtXAhxjTp
	6ejeBLwoapydophjwwSByr4Nib+lIciAu5YGM+1jKh/tC8fDpaAx2Gl5Q9ltntPU
	bJIyR++1gbpmRkPdDcZg9LoeQ49TdVDaIDdhPCl27lHcOg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 416mnma6ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47NK1H85021606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:18 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 13:01:17 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v25 15/33] ASoC: usb: Fetch ASoC card and pcm device
 information
Date: Fri, 23 Aug 2024 13:00:43 -0700
Message-ID: <20240823200101.26755-16-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: THJe7NmAbX_cbvNhgG_MGAcRBlDuMDk_
X-Proofpoint-GUID: THJe7NmAbX_cbvNhgG_MGAcRBlDuMDk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=926 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230147
Message-ID-Hash: SUXVRF2BRDASRLQYYO2TKY5ZO67R6KOF
X-Message-ID-Hash: SUXVRF2BRDASRLQYYO2TKY5ZO67R6KOF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUXVRF2BRDASRLQYYO2TKY5ZO67R6KOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

USB SND needs to know how the USB offload path is being routed.  This would
allow for applications to open the corresponding sound card and pcm device
when it wants to take the audio offload path.  This callback should return
the mapped indexes based on the USB SND device information.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 12 ++++++++++++
 sound/soc/soc-usb.c     | 31 +++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 3ad15e9b8e15..34cd2860df86 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -36,6 +36,7 @@ struct snd_soc_usb_device {
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
  * @connection_status_cb - callback to notify connection events
+ * @update_offload_route_info - callback to fetch mapped ASoC device
  * @priv_data - driver data
  **/
 struct snd_soc_usb {
@@ -43,6 +44,9 @@ struct snd_soc_usb {
 	struct snd_soc_component *component;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
+	int (*update_offload_route_info)(struct snd_soc_component *component,
+					 int card, int pcm, int direction,
+					 long *route);
 	void *priv_data;
 };
 
@@ -57,6 +61,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
 int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
 					struct snd_soc_jack *jack);
 int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+				     int direction, long *route);
 
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
@@ -99,6 +105,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
 	return 0;
 }
 
+static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+					    int direction, long *route)
+{
+	return -ENODEV;
+}
+
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 					      struct snd_soc_component *component,
 					      void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 90266fd7a7ff..81de64884817 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -117,6 +117,37 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
 
+/**
+ * snd_soc_usb_update_offload_route - Find active USB offload path
+ * @dev - USB device to get offload status
+ * @card - USB card index
+ * @pcm - USB PCM device index
+ * @direction - playback or capture direction
+ * @route - pointer to route output array
+ *
+ * Fetch the current status for the USB SND card and PCM device indexes
+ * specified.
+ */
+int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+				     int direction, long *route)
+{
+	struct snd_soc_usb *ctx;
+	int ret;
+
+	ctx = snd_soc_find_usb_ctx(dev);
+	if (!ctx)
+		return -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->update_offload_route_info)
+		ret = ctx->update_offload_route_info(ctx->component, card, pcm,
+						     direction, route);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_update_offload_route);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference
