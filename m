Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E2858BBB
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 01:26:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F281605;
	Sat, 17 Feb 2024 01:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F281605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708129587;
	bh=mNGYCfbVjv1RkgO1ltuiv0AvcvnAFu5EcL4uKtFiNjo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LcTM5OzaHaInqrzMZ+KFUrbMPJ0DiOiWGc1ZzMohP2EQfFR/AFKKTDc5provko2K8
	 3dzRpPnWwakJiZloRZxYVpHeOQ2bpm7kQUTH/o/V0htti5O7smBvwFO5S7JlEiGNuz
	 SyRuoY8O4Qhtnm6bVJAjFFzVZnaeHE6YA0C352j8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF12EF806F1; Sat, 17 Feb 2024 01:22:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AE9EF8074A;
	Sat, 17 Feb 2024 01:22:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3A35F800BF; Sat, 17 Feb 2024 01:13:01 +0100 (CET)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D8D7F805B1
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 01:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D8D7F805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=X8sez+mi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GNNjjJ014382;
	Sat, 17 Feb 2024 00:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Rkv9f88Rww7ljRWsPJlk
	3Lnpj1OGecXVn5H1NkvCJBM=; b=X8sez+miW6kPVRsuoMB3m4wqwAVyjhkLzUuB
	eqa8B++eT7lsjHdnDLficc4yrzgfSFYfUPj+pa/HutkIWyj0UuSH+LpF+ozOiJvf
	8B3qf9aPhfaOCk3GIv4RIdu+wUHenj381ROb0NPQ6a2XVSwAOi3zwykfxGJByw3O
	9lXbEnHAGhJmmm9N+cadHcpnmiYr37aETk12KZuxakU4m0rQyuSYwV3+/ENGPS8X
	u//mHI8WS9S+PxFlyA4AK5RnAmGxzKE5Y9rK7bdzbuukTtQEJhTjaZ+qqo8c+pAw
	HhMulv52xvEXRtgB9+/OwJgwO8CVPKT4sWtU+kXVxrPFB/ZLng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wa03ra3eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41H0AeMU017253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:40 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 16:10:40 -0800
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
Subject: [PATCH v17 39/51] ASoC: Introduce SND kcontrols to select sound card
 and PCM device
Date: Fri, 16 Feb 2024 16:10:05 -0800
Message-ID: <20240217001017.29969-40-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 04uwsYUiu9MrbAQCcHKsBeMqjPztk0HX
X-Proofpoint-GUID: 04uwsYUiu9MrbAQCcHKsBeMqjPztk0HX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_23,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402160189
Message-ID-Hash: F2TPHXTSE6PTH4QNQ3WMIVQJFNLOFNHH
X-Message-ID-Hash: F2TPHXTSE6PTH4QNQ3WMIVQJFNLOFNHH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2TPHXTSE6PTH4QNQ3WMIVQJFNLOFNHH/>
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
tinymix -D 0 set 'USB Offload Playback Route Select' 1 0

The above command will configure the offload path to utilize card#1 and PCM
stream#0.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  16 ++++
 sound/soc/soc-usb.c     | 157 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 8f2d3064b520..18cdc59df9aa 100644
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
index bc77204fd2db..ade09b416d45 100644
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
@@ -38,6 +41,152 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device_node *node)
 	return NULL;
 }
 
+/* SOC USB sound kcontrols */
+static int soc_usb_put_offload_pcm_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
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
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+	int ret = 0;
+
+	ucontrol->value.integer.value[0] = -1;
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
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
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
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+	int ret = 0;
+
+	ucontrol->value.integer.value[0] = -1;
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
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
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
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
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
  * snd_soc_usb_get_components_tag() - Retrieve SOC USB component tag
  * @playback: direction of audio stream
@@ -158,6 +307,12 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
  */
 int snd_soc_usb_add_port(struct snd_soc_usb *usb)
 {
+	int ret;
+
+	ret = snd_soc_usb_control_init(usb);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&ctx_mutex);
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
@@ -187,6 +342,8 @@ int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
 	}
 	mutex_unlock(&ctx_mutex);
 
+	snd_soc_usb_control_remove(usb);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
