Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FB822406
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 22:55:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA6EEDF;
	Tue,  2 Jan 2024 22:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA6EEDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704232550;
	bh=XHbx/v/TuXqw8WQvMgvyY6h+6CwDlT1EQepdFQ4hDLM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oW3gJKMgdx3R2COullk9TzCmwe5HWeaMuGmYSoXJziDp86+LEeY60ls7PbYFCXXat
	 YbniGtp0jFgAjye91AW79HQHBuCJ/JYvyvPqbpZzEkpqJ4zFieXgS6+sG4hG9HQ++p
	 Aab/AdYH4Ao3uB6V8V/yJb4VdZqsgIAz2LWJvgws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932F3F89827; Tue,  2 Jan 2024 22:48:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3703F89820;
	Tue,  2 Jan 2024 22:48:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00B5DF89614; Tue,  2 Jan 2024 22:47:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 66875F80589
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 22:46:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66875F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=GaGg1/2B
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 402LRwR3013459;
	Tue, 2 Jan 2024 21:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=60ObKyG9TuHBxrZeqJMr
	xbRUfxtLp+1tF0A4Dzl6/6A=; b=GaGg1/2B8T6Bj24s9s8kKs33+CNmMzvz6ohA
	Oz1R1GJ/UYoIk9N8Hy/ijhE4MHBy8/xMImW8ajKicHGfBp4jx3T229ZpbMiAyFQ5
	yEi9ygIwBVBtnrCZ2p72TlFJylOMeksNGCkSlmIa5/RnpoT3LNeOUw9k+FsuZ9B3
	ArpyPzYYbEKSaEg69ZZpEwIve3ysA1e+symzi6rXC9DzDZJkljVPiymIgAiVR9Kl
	dU0vTKFydFIp/rmFK4Xgjs1FdYpVRKsIjST/nisTjeFbUYznoQ8g4ci6dE/hp/KO
	FO8fGVdOW0IsCwvkV2JykSkoiMgL27NPMg/wMUijoqtAhs4MVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vc9nn1xjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 21:46:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 402LkRb9009883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jan 2024 21:46:27 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 13:46:26 -0800
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
Subject: [PATCH v12 31/41] ASoC: Add SND kcontrol for fetching USB offload
 status
Date: Tue, 2 Jan 2024 13:45:39 -0800
Message-ID: <20240102214549.22498-32-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240102214549.22498-1-quic_wcheng@quicinc.com>
References: <20240102214549.22498-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FL0TFDWM8FgKR2ZpwXRX_kZ80pSyuM-G
X-Proofpoint-ORIG-GUID: FL0TFDWM8FgKR2ZpwXRX_kZ80pSyuM-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=947 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401020161
Message-ID-Hash: L7WHFCE7XVQ4VD4MP5YLEGVZFV7CTGQ2
X-Message-ID-Hash: L7WHFCE7XVQ4VD4MP5YLEGVZFV7CTGQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7WHFCE7XVQ4VD4MP5YLEGVZFV7CTGQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a kcontrol to the platform sound card to fetch the current offload
status.  This can allow for userspace to ensure/check which USB SND
resources are actually busy versus having to attempt opening the USB SND
devices, which will result in an error if offloading is active.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  27 ++++++++
 sound/soc/soc-usb.c     | 150 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 20d7b32bba07..c05d9b2f5c90 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -6,6 +6,24 @@
 #ifndef __LINUX_SND_SOC_USB_H
 #define __LINUX_SND_SOC_USB_H
 
+enum snd_soc_usb_dai_state {
+	SND_SOC_USB_IDLE,
+	SND_SOC_USB_PREPARED,
+	SND_SOC_USB_RUNNING,
+};
+
+/**
+ * struct snd_soc_usb_session
+ * @active_card_idx - active offloaded sound card
+ * @active_pcm_idx - active offloaded PCM device
+ * @state - USB BE DAI link PCM state
+ */
+struct snd_soc_usb_session {
+	int active_card_idx;
+	int active_pcm_idx;
+	enum snd_soc_usb_dai_state state;
+};
+
 /**
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -25,6 +43,8 @@ struct snd_soc_usb_device {
  * @list - list head for SND SOC struct list
  * @dev - USB backend device reference
  * @component - reference to ASoC component
+ * @active_list - active sessions
+ * @num_supported_streams - number of supported concurrent sessions
  * @connection_status_cb - callback to notify connection events
  * @put_offload_dev - callback to select USB sound card/PCM device
  * @get_offload_dev - callback to fetch selected USB sound card/PCM device
@@ -33,6 +53,8 @@ struct snd_soc_usb_device {
 struct snd_soc_usb {
 	struct list_head list;
 	struct snd_soc_component *component;
+	struct snd_soc_usb_session *active_list;
+	unsigned int num_supported_streams;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
 	int (*put_offload_dev)(struct snd_kcontrol *kcontrol,
@@ -50,6 +72,11 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
 
+int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx);
+int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
+int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
+				  enum snd_soc_usb_dai_state state);
+
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 			int num_supported_streams, void *data);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb);
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index c568c67e3e4a..9c082129cb9f 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -42,11 +42,62 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device_node *node)
 }
 
 /* SOC USB sound kcontrols */
+static int snd_soc_usb_get_offload_status(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+	int control_idx = 0;
+	int pcm_idx;
+	int card_idx;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++) {
+		card_idx = -1;
+		pcm_idx = -1;
+
+		if (ctx->active_list[i].state == SND_SOC_USB_RUNNING) {
+			card_idx = ctx->active_list[i].active_card_idx;
+			pcm_idx = ctx->active_list[i].active_pcm_idx;
+		}
+
+		ucontrol->value.integer.value[control_idx] = card_idx;
+		control_idx++;
+		ucontrol->value.integer.value[control_idx] = pcm_idx;
+		control_idx++;
+	}
+
+	return 0;
+}
+
+static int snd_soc_usb_offload_status_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2*ctx->num_supported_streams;
+	uinfo->value.integer.min = -1;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new soc_usb_status_ctrl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.name = "SNDUSB OFFLD playback status",
+	.info = snd_soc_usb_offload_status_info,
+	.get = snd_soc_usb_get_offload_status,
+	.put = NULL,
+};
+
 static int soc_usb_put_offload_dev(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_usb *ctx = snd_soc_usb_find_priv_data(component->dev);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
 	int ret = 0;
 
 	mutex_lock(&ctx_mutex);
@@ -61,7 +112,7 @@ static int soc_usb_get_offload_dev(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_usb *ctx = snd_soc_usb_find_priv_data(component->dev);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
 	int ret = 0;
 
 	mutex_lock(&ctx_mutex);
@@ -95,10 +146,96 @@ static const struct snd_kcontrol_new soc_usb_dev_ctrl = {
 
 static int snd_soc_usb_control_init(struct snd_soc_component *component)
 {
+	int ret;
+
+	ret = snd_ctl_add(component->card->snd_card,
+				snd_ctl_new1(&soc_usb_status_ctrl, component));
+	if (ret < 0)
+		return ret;
+
 	return snd_ctl_add(component->card->snd_card,
 				snd_ctl_new1(&soc_usb_dev_ctrl, component));
 }
 
+/**
+ * snd_soc_usb_set_session_state() - Set the session state for a session
+ * @usb: SOC USB device
+ * @session_id: index to active_list
+ * @state: USB PCM device index
+ *
+ * Set the session state for an entry in active_list.  This should be only
+ * called after snd_soc_usb_prepare_session.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
+				  enum snd_soc_usb_dai_state state)
+{
+	if (session_id < 0 || session_id >= usb->num_supported_streams)
+		return -EINVAL;
+
+	mutex_lock(&ctx_mutex);
+	if (usb->active_list[session_id].state == state) {
+		mutex_unlock(&ctx_mutex);
+		return 0;
+	}
+
+	usb->active_list[session_id].state = state;
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_set_session_state);
+
+/**
+ * snd_soc_usb_prepare_session() - Find and prepare a session
+ * @usb: SOC USB device
+ * @card_idx: USB card index
+ * @pcm_idx: USB PCM device index
+ *
+ * Find an open active session slot on the SOC USB device.  If all slots
+ * are busy, return an error.  If not, claim the slot and place it into
+ * the SND_SOC_USB_PREPARED state.  This should be called first before
+ * calling snd_soc_usb_set_session_state or snd_soc_usb_shutdown_session.
+ *
+ * Returns the session id (index) to active_list, negative on error.
+ *
+ */
+int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx)
+{
+	int i;
+
+	mutex_lock(&ctx_mutex);
+	for (i = 0; i < usb->num_supported_streams; i++) {
+		if (usb->active_list[i].state == SND_SOC_USB_IDLE) {
+			usb->active_list[i].active_card_idx = card_idx;
+			usb->active_list[i].active_pcm_idx = pcm_idx;
+			usb->active_list[i].state = SND_SOC_USB_PREPARED;
+			mutex_unlock(&ctx_mutex);
+			return i;
+		}
+	}
+	mutex_unlock(&ctx_mutex);
+
+	return -EBUSY;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_prepare_session);
+
+/**
+ * snd_soc_usb_shutdown_session() - Set USB SOC to idle state
+ * @usb: SOC USB device
+ * @session_id: index to active_list
+ *
+ * Place the session specified by session_id into the idle/shutdown state.
+ *
+ */
+int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id)
+{
+	return snd_soc_usb_set_session_state(usb, session_id, SND_SOC_USB_IDLE);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_shutdown_session);
+
 /**
  * snd_soc_usb_get_components_tag() - Retrieve SOC USB component tag
  * @playback: direction of audio stream
@@ -185,8 +322,16 @@ struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *componen
 	if (!usb)
 		return ERR_PTR(-ENOMEM);
 
+	usb->active_list = kcalloc(num_streams, sizeof(struct snd_soc_usb_session),
+				   GFP_KERNEL);
+	if (!usb->active_list) {
+		kfree(usb);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	usb->component = component;
 	usb->priv_data = data;
+	usb->num_supported_streams = num_streams;
 
 	return usb;
 }
@@ -202,6 +347,7 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb)
 {
 	snd_soc_usb_remove_port(usb);
+	kfree(usb->active_list);
 	kfree(usb);
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
