Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C02418152DF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 23:00:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63412E99;
	Fri, 15 Dec 2023 23:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63412E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702677650;
	bh=HLIdB6RAlEjWf7lTGhPmbI2b17RKXb3d6jAWDjFfQqI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q2fJW+z0thneWiF1P7/7Fb6gDuyts4VRgWL+7B/JfKjP9AXxdv8BuC7L0jtj7SWTf
	 N/n4xwNug7jfS7lcjbcC3AdXoQkikLEBUOlYOtaoSIXKsfUQ+OrUpFeF3XSFLDI/L/
	 nvlICrfc7J3g1KtU6/w6E0TY+7+RZwTG6H6gCQ/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14933F80616; Fri, 15 Dec 2023 22:53:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C7FF89815;
	Fri, 15 Dec 2023 22:53:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F1DEF805F5; Fri, 15 Dec 2023 22:52:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 46A2AF805A1
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 22:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46A2AF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oQmxXtee
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BFKRWJB019422;
	Fri, 15 Dec 2023 21:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=l/SogG1mwYpfrMkIwODI
	+k6bupo64StismUhwsMTISY=; b=oQmxXteeEiAQ4qOK14U4lOYc3BEbT6pdqV/s
	X0AI1RLt9V5ALUZOUl8anB+UKYo0VOncNUOmcBL++xBOwTCfnO6Yh4V046N28Ey5
	3Y93t/sxOuJ+5cXsoBXg30qP6uTWY7u2BZMIIghEz4PaIqgt1IxZWNWxqfN15f4C
	cUtRD9vVFoHrjt6MhtKY7vwTndR1Q7DaEff5OaNeteFwzQrrEdWos5wcl1IRsRjl
	0eR38nuUEn2Ef0yLrwV0a+evWpnSbISg3j4MWhfoaXZpZMejScA3l/Z5Z4A1lTIY
	6e68M4XQLlukQ1XDCT6N72wbMAmm2J8pv4KkxiaNmfJo8w/s5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0w1989h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BFLoGaN008371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:16 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Dec 2023 13:50:16 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@linaro.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v10 35/41] ASoC: usb: Fetch ASoC sound card information
Date: Fri, 15 Dec 2023 13:49:49 -0800
Message-ID: <20231215214955.12110-36-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231215214955.12110-1-quic_wcheng@quicinc.com>
References: <20231215214955.12110-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bjmxWrLk81zgQlwU4_pydulmvcZgbyVD
X-Proofpoint-ORIG-GUID: bjmxWrLk81zgQlwU4_pydulmvcZgbyVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150152
Message-ID-Hash: 6IY5NQJBFDD3GFAQ3U3R4ZENJNSCP3AI
X-Message-ID-Hash: 6IY5NQJBFDD3GFAQ3U3R4ZENJNSCP3AI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IY5NQJBFDD3GFAQ3U3R4ZENJNSCP3AI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For USB sound to expose mixer controls to fetch information about the ASoC
sound card, add an API that returns the platform sound card number that is
registered with SOC USB.  Knowing this allows for applications to further
query about the offload status.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  1 +
 sound/soc/soc-usb.c     | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 6bbd4339e8c5..77c19fc591ea 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -73,6 +73,7 @@ int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
+int snd_soc_usb_device_offload_available(struct device *dev);
 
 int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx);
 int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 7d202b0a2680..b272945dcab0 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -340,6 +340,32 @@ int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);
 
+/**
+ * snd_soc_usb_device_offload_available() - Fetch BE DAI link sound card
+ * @dev: the device to find in SOC USB
+ *
+ * Finds the component linked to a specific SOC USB instance, and returns
+ * the sound card number for the platform card supporting offloading.
+ *
+ */
+int snd_soc_usb_device_offload_available(struct device *dev)
+{
+	struct snd_soc_usb *ctx;
+	struct device_node *node;
+
+	node = snd_soc_find_phandle(dev);
+	if (IS_ERR(node))
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(node);
+	of_node_put(node);
+	if (!ctx)
+		return -ENODEV;
+
+	return ctx->component->card->snd_card->number;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_device_offload_available);
+
 /**
  * snd_soc_usb_allocate_port() - allocate a SOC USB device
  * @component: USB DPCM backend DAI component
