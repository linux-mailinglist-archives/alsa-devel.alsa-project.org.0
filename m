Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34072902D20
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 02:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1AFE80;
	Tue, 11 Jun 2024 02:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1AFE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718064217;
	bh=eq9B7wvPHHy8ITaHjmVpk1TMWrJ8tV6O5YMzPlM5Tn4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PrSfGcd+2mS3HJ62/w3OzxUBlKZELBpTMN/B33MiJAMjYH07TnNbuhOVm3oaxcknA
	 Uw+RHaGTdQlNxI+bN2psbO+FFVq1rLMQWWJkf86D1ciGA/kZ1V4K6YDKVMH+XucG1r
	 XT5MG+JpfmJp/gaHU7BjQ8BSJ7kvwlAXcweGEMl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C3D9F89630; Tue, 11 Jun 2024 01:59:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CF4BF8962D;
	Tue, 11 Jun 2024 01:59:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28AF1F805D3; Tue, 11 Jun 2024 01:59:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B5B36F805B4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 01:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B36F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YZl7N3Du
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45AEGPeX021285;
	Mon, 10 Jun 2024 23:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ljRFKHzHBdtdLh7sNzOKjhzu
	HqqNrvTbosJU34+TiKU=; b=YZl7N3Duca5+s5Xy6uDWORiFYiYrJGT7litmCOs8
	OedZB6vZ5UWj1wVqtaoYcdaYA1r3jYkGX7zc/g/UBVoNqDzCrPlRgwRR0Lt+HskG
	fjqpVqZBWaCfW+YKixsqACwgdU6ens04RItwd3tRubyeqSKhUdlZEUkhsLz8oRk9
	Peclph2VnxdLF2RAlygoOGYjMQMxGlqkjDMJhcDZ4HE0gqsMUog+WkOmJSuQ0Eft
	iAcRlIQrnmq6t0gVdNMW26pB+OPwD7UTg5sC+CAAn6F4GVIEvoUdRAUbogQWCgwT
	oprgDx8MCYpJ5wTNAxH4iOzf5WLTCsQQAE2DrLL/JbzQwA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymea6mxpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45ANwPnO007433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:25 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Jun 2024 16:58:24 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v23 21/32] ASoC: Introduce SND kcontrols to select sound card
 and PCM device
Date: Mon, 10 Jun 2024 16:57:57 -0700
Message-ID: <20240610235808.22173-22-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240610235808.22173-1-quic_wcheng@quicinc.com>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IMoJ5Yxm3Gs6YgXylNlySEkt1V1w0gG_
X-Proofpoint-ORIG-GUID: IMoJ5Yxm3Gs6YgXylNlySEkt1V1w0gG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100176
Message-ID-Hash: PDCEEZLV5HYJKU4SXOA5TZQASYTPPUAP
X-Message-ID-Hash: PDCEEZLV5HYJKU4SXOA5TZQASYTPPUAP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDCEEZLV5HYJKU4SXOA5TZQASYTPPUAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SND kcontrol to SOC USB, which will allow for userpsace to determine
which USB card number and PCM device to offload.  This allows for userspace
to potentially tag an alternate path for a specific USB SND card and PCM
device.  Previously, control was absent, and the offload path would be
enabled on the last USB SND device which was connected.  This logic will
continue to be applicable if no mixer input is received for specific device
selection.

An example to configure the offload device using tinymix:
tinymix -D 0 set 'USB Offload Playback Route Card Select' 1
tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0

The above command will configure the offload path to utilize card#1 and PCM
stream#0.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  16 ++++
 sound/soc/soc-usb.c     | 167 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 183 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 4b1b992c8b27..495de5143db8 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -6,6 +6,12 @@
 #ifndef __LINUX_SND_SOC_USB_H
 #define __LINUX_SND_SOC_USB_H
 
+enum snd_soc_usb_kctl {
+	SND_SOC_USB_KCTL_CARD_ROUTE,
+	SND_SOC_USB_KCTL_PCM_ROUTE,
+	SND_SOC_USB_KCTL_MAX,
+};
+
 /**
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -24,16 +30,26 @@ struct snd_soc_usb_device {
  * struct snd_soc_usb
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
+ * @kctl - list of kcontrols created
  * @num_supported_streams - number of supported concurrent sessions
  * @connection_status_cb - callback to notify connection events
+ * @put_offload_dev - callback to select USB sound card/PCM device
+ * @get_offload_dev - callback to fetch selected USB sound card/PCM device
  * @priv_data - driver data
  **/
 struct snd_soc_usb {
 	struct list_head list;
 	struct snd_soc_component *component;
+	struct snd_kcontrol *kctl[SND_SOC_USB_KCTL_MAX];
 	unsigned int num_supported_streams;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
+	int (*put_offload_dev)(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol,
+			       enum snd_soc_usb_kctl type);
+	int (*get_offload_dev)(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol,
+			       enum snd_soc_usb_kctl type);
 	void *priv_data;
 };
 
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 3bb66808f196..ef84957014dd 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -15,6 +15,9 @@ static struct device_node *snd_soc_find_phandle(struct device *dev)
 {
 	struct device_node *node;
 
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
 	node = of_parse_phandle(dev->of_node, "usb-soc-be", 0);
 	if (!node)
 		return ERR_PTR(-ENODEV);
@@ -57,6 +60,162 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
 	return ctx ? ctx : NULL;
 }
 
+/* SOC USB sound kcontrols */
+static int soc_usb_put_offload_pcm_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int ret = 0;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->put_offload_dev)
+		ret = ctx->put_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_PCM_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+
+static int soc_usb_get_offload_pcm_dev(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++)
+		ucontrol->value.integer.value[i] = -1;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->get_offload_dev)
+		ret = ctx->get_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_PCM_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+
+}
+
+static int soc_usb_put_offload_card_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int ret = 0;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->put_offload_dev)
+		ret = ctx->put_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_CARD_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+
+static int soc_usb_get_offload_card_dev(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++)
+		ucontrol->value.integer.value[i] = -1;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->get_offload_dev)
+		ret = ctx->get_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_CARD_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+
+}
+
+static int soc_usb_offload_pcm_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ctx->num_supported_streams;
+	uinfo->value.integer.min = -1;
+	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
+	uinfo->value.integer.max = 0xff;
+
+	return 0;
+}
+
+static int soc_usb_offload_card_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ctx->num_supported_streams;
+	uinfo->value.integer.min = -1;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new soc_usb_kcontrols[] = {
+	[SND_SOC_USB_KCTL_CARD_ROUTE] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.name = "USB Offload Playback Route Card Select",
+		.info = soc_usb_offload_card_info,
+		.get = soc_usb_get_offload_card_dev,
+		.put = soc_usb_put_offload_card_dev,
+	},
+	[SND_SOC_USB_KCTL_PCM_ROUTE] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.name = "USB Offload Playback Route PCM Select",
+		.info = soc_usb_offload_pcm_info,
+		.get = soc_usb_get_offload_pcm_dev,
+		.put = soc_usb_put_offload_pcm_dev,
+	},
+};
+
+static int snd_soc_usb_control_remove(struct snd_soc_usb *usb)
+{
+	struct snd_soc_component *component = usb->component;
+	int i;
+
+	for (i = 0; i < SND_SOC_USB_KCTL_MAX; i++) {
+		if (usb->kctl[i]) {
+			snd_ctl_remove(component->card->snd_card,
+					usb->kctl[i]);
+			snd_ctl_free_one(usb->kctl[i]);
+			usb->kctl[i] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int snd_soc_usb_control_init(struct snd_soc_usb *usb)
+{
+	struct snd_soc_component *component = usb->component;
+	int ret;
+	int i;
+
+	for (i = 0; i < SND_SOC_USB_KCTL_MAX; i++) {
+		usb->kctl[i] = snd_ctl_new1(&soc_usb_kcontrols[i], component);
+		ret = snd_ctl_add(component->card->snd_card, usb->kctl[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
+}
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference
@@ -152,6 +311,12 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
  */
 void snd_soc_usb_add_port(struct snd_soc_usb *usb)
 {
+	int ret;
+
+	ret = snd_soc_usb_control_init(usb);
+	if (ret < 0)
+		return;
+
 	mutex_lock(&ctx_mutex);
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
@@ -178,6 +343,8 @@ void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
 		}
 	}
 	mutex_unlock(&ctx_mutex);
+
+	snd_soc_usb_control_remove(usb);
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
 
