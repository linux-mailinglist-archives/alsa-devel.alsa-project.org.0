Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D48AD81C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 00:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E66F1549;
	Tue, 23 Apr 2024 00:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E66F1549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713826624;
	bh=7iOpsTMbqEwoi14/dcN8UwbNoAatyge1GCbT8mE6mNg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nu4eNrCtRCev3z4lMdKP9iU9NDh6X6SJbOsHqTz/HWoA3D+P2ck4uKXS4C551zMbb
	 QQvtMB7NrzKzlDOetXZAsYSPhGlBl8Gpy/Ybymv+Oym155PNi6zhBgWiT0yMjMhJDp
	 xrZZU0n6R47eSejC+uFcKcVbUUfbN9ehRLO3M3W4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37A61F8975A; Tue, 23 Apr 2024 00:51:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D9DEF8974E;
	Tue, 23 Apr 2024 00:51:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39DACF80CC1; Tue, 23 Apr 2024 00:50:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C70BF805A0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 00:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C70BF805A0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Kx9k3rtr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43MLtekb015123;
	Mon, 22 Apr 2024 22:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=1ti0OFMlpvxuyvNxeli7
	4aYR9ZNdqw1HmgshCcMPrxo=; b=Kx9k3rtrUGA3Dn0SwlqssqD9Ckl7CkrSg4Ag
	hsu379BikxYoQFLf4HQNHZhWIlzwl3sSL+YC8sG6JVVbnyyVn/6M6tSq/jAZDFHs
	ZSGrp8uDzvVXyLOlu0oN1QdfQMnv3cCkWaIshtczhoTXbbrIkfn/yV9pLiEw0WHE
	rIHpQQmFF+X96XCzw5uNpJkfgsV2LS6Oh9XWI+4Qd/P7W5lG5N9tCiUzr7paYJ62
	ipZiHi3O9ZJxkRXOFJ2KyTPH9Q5edbAG65ppPK2bQJ3u/4jPWy8qP9k3yewxgSyA
	cr4yaOUGFOpTN7RcY8xV00ul563TGGJAYZIzS69I2etjBaLWSA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnr49s99u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43MMnMMB022892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:22 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Apr 2024 15:49:22 -0700
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
Subject: [PATCH v19 22/41] ASoC: usb: Add PCM format check API for USB backend
Date: Mon, 22 Apr 2024 15:48:47 -0700
Message-ID: <20240422224906.15868-23-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FgSRD-s-Mvc-OkBXa-z7uL9Q06YlLVn_
X-Proofpoint-GUID: FgSRD-s-Mvc-OkBXa-z7uL9Q06YlLVn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_16,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404220096
Message-ID-Hash: GXAGCU2STMK6DYCB6Y4GD6LPEOGXJFLZ
X-Message-ID-Hash: GXAGCU2STMK6DYCB6Y4GD6LPEOGXJFLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXAGCU2STMK6DYCB6Y4GD6LPEOGXJFLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce a helper to check if a particular PCM format is supported by the
USB audio device connected.  If the USB audio device does not have an
audio profile which can support the requested format, then notify the USB
backend.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  9 +++++++++
 sound/soc/soc-usb.c     | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 5b2fa0877523..8f2d3064b520 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -39,6 +39,8 @@ struct snd_soc_usb {
 
 #if IS_ENABLED(CONFIG_SND_SOC_USB)
 const char *snd_soc_usb_get_components_tag(bool playback);
+int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
+			int direction);
 
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
@@ -55,6 +57,13 @@ static inline const char *snd_soc_usb_get_components_tag(bool playback)
 	return "";
 }
 
+static inline int snd_soc_usb_find_format(int card_idx,
+					  struct snd_pcm_hw_params *params,
+					  int direction)
+{
+	return -EINVAL;
+}
+
 static inline int snd_soc_usb_connect(struct device *usbdev,
 					struct snd_soc_usb_device *sdev)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index d21db2345966..bc77204fd2db 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -80,6 +80,31 @@ void *snd_soc_usb_find_priv_data(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
 
+/**
+ * snd_soc_usb_find_format() - Check if audio format is supported
+ * @card_idx: USB sound chip array index
+ * @params: PCM parameters
+ * @direction: capture or playback
+ *
+ * Ensure that a requested audio profile from the ASoC side is able to be
+ * supported by the USB device.
+ *
+ * Return 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
+			int direction)
+{
+	struct snd_usb_stream *as;
+
+	as = snd_usb_find_suppported_substream(card_idx, params, direction);
+	if (!as)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);
+
 /**
  * snd_soc_usb_allocate_port() - allocate a SOC USB device
  * @component: USB DPCM backend DAI component
