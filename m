Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5B857532
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 05:14:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE81D210D;
	Fri, 16 Feb 2024 05:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE81D210D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708056846;
	bh=xdOkzCgg9LhiJrn/IOI09DYF8Zlmqa0SrtbvI/ey4hQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ekT5GBRqm+1PIumku6WY5waTy1z3kpoJ8ODHVj58hC2EGWwd7CgIvsH4/0tdMycie
	 mM9rrbvwjW0TauDWFK0d6ALKe6GmDAqBnzchtqEcP44hLWLuICd9x9PWPIVGzFFQyX
	 1YxJgOzKjJun6Q/gySjE59in65vz2vMN05rv9ki8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5F6F80808; Fri, 16 Feb 2024 05:03:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5405F89984;
	Fri, 16 Feb 2024 05:03:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30FB1F8970E; Fri, 16 Feb 2024 05:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0B98F805C3
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 04:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0B98F805C3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=BXnT4RMN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G3sNWK030335;
	Fri, 16 Feb 2024 03:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=oLnn+66EtwDPUcYCf35t
	1CWt9sha3OSbLBeKHwa2G8w=; b=BXnT4RMNtQvS1vmOmAHAhPj5wi/+CB3pk5o2
	qYZFLAagQn6pU9Bhm+KX8jBq1A8fPRdUcOPtxLlVsbGUvgOTN0pK1NLRcV+2B4JF
	KWoqLTCmrGphr57a+ZwaEpr7gKDHv2HtKaLhdtzUjnbi95sv0o3w7QQztgBs1set
	EMCGYY9Khzud9/Mf9iLx4JzeuGpubfocDCA2gJECXNFkOM/jbrG+WpzaOEEK67m/
	FVxtBr5BhoVgeFlw3c8KEGsyQjqsh7tcWaouDirqt3/CR6O5WLKiqKFjkPz+zcog
	zodiS23Mj7v6h5tpkIpt1nPVtRoBzoxTvbGGGLqW2iLDB0ZMTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9qbc14hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41G3xkV8014745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 03:59:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 19:59:46 -0800
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
Subject: [PATCH v16 49/50] ASoC: qcom: Populate SoC components string
Date: Thu, 15 Feb 2024 19:59:22 -0800
Message-ID: <20240216035923.23392-50-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240216035923.23392-1-quic_wcheng@quicinc.com>
References: <20240216035923.23392-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jMjTa4m1eaIAZJPLoFSxEg803nbzXJz4
X-Proofpoint-ORIG-GUID: jMjTa4m1eaIAZJPLoFSxEg803nbzXJz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_03,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160031
Message-ID-Hash: VT6LATOXBFLWT2RBR77IFJSN3MKNFH36
X-Message-ID-Hash: VT6LATOXBFLWT2RBR77IFJSN3MKNFH36
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VT6LATOXBFLWT2RBR77IFJSN3MKNFH36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For userspace to know about certain capabilities of the current platform
card, add tags to the components string that it can use to enable support
for that audio path.  In case of USB offloading, the "usboffldplybk: 1" tag
is added to the string.

Change-Id: I454631f8ddbceb7db6a65c7e5ab57bd918a2c88a
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/sm8250.c            |  3 +++
 sound/soc/qcom/usb_offload_utils.c | 22 ++++++++++++++++++++++
 sound/soc/qcom/usb_offload_utils.h |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a4e87dfb1b93..5e3007e2e061 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -39,6 +39,9 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 						&data->usb_offload_jack_setup);
 	else
 		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	qcom_snd_add_components_string(rtd);
+
 	return ret;
 }
 
diff --git a/sound/soc/qcom/usb_offload_utils.c b/sound/soc/qcom/usb_offload_utils.c
index 0be05c1f87a9..8b137e1593e5 100644
--- a/sound/soc/qcom/usb_offload_utils.c
+++ b/sound/soc/qcom/usb_offload_utils.c
@@ -26,4 +26,26 @@ int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_setup);
+
+int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	const char *prev = card->components;
+
+	switch (cpu_dai->id) {
+	case USB_RX:
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s %s",
+					  card->components,
+					  snd_soc_usb_get_components_tag(true));
+	default:
+		break;
+	}
+
+	if (prev && prev != card->components)
+		devm_kfree(card->dev, prev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_add_components_string);
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/usb_offload_utils.h b/sound/soc/qcom/usb_offload_utils.h
index 283e81f57f43..03780a12a326 100644
--- a/sound/soc/qcom/usb_offload_utils.h
+++ b/sound/soc/qcom/usb_offload_utils.h
@@ -10,11 +10,17 @@
 #if IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS)
 int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
+int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd);
 #else
 static inline int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup)
 {
 	return -ENODEV;
 }
+
+static inline int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd)
+{
+	return -ENODEV;
+}
 #endif /* IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) */
 #endif /* __QCOM_SND_USB_OFFLOAD_UTILS_H__ */
