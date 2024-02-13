Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FD85251C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 02:07:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED4BDE9F;
	Tue, 13 Feb 2024 02:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED4BDE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707786423;
	bh=fB9L2CwDa6c9tniwnRTAxl2vqhAxsIPrZMUFh4ruZBs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CxjqRqnysORDntny7D/6MaHdWlv1v+VnlmTz4Q//U8MK6N71TbtJ2mk0R/6AS2HdK
	 Pxz78by3SAOcCtLmvucX6gL7w8z3D0+XFKMMuScgg4xolqZPY6VqAY9wY1bMY1VMgz
	 ey+8NCs94LgZ9xgKGHy6IG2zwbLsYMLpWfc9Fruk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A8D4F8990D; Tue, 13 Feb 2024 01:57:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CE74F89913;
	Tue, 13 Feb 2024 01:57:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A13F8973E; Tue, 13 Feb 2024 01:56:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AA629F805B5
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 01:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA629F805B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=IEk8bqKC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D08PwV015741;
	Tue, 13 Feb 2024 00:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=OzAPwOhD063cYXhXZ6rD
	+ByLWp9zE5bjwd61D6t1YZ4=; b=IEk8bqKCZHX4WbI2t2OeDGPEx1Fj6mDjf25p
	7piPY8xTfnmq4/Q4ZTBl0LAQReN3JoIdez/XPM7bWL7WXZYXkKkKRPIK3ZC17GBT
	dVC9J+EiFXxk25VrcgIDat9Nh+TCZRJ9yKAdfZUoxO5O8kNGMtBAse6wsvwetE7L
	3ZpUTs3IsIvNLbIBWFp+Rym3QSIE5w7e64lw+ERZSaAuh/mUHd26+qtwITXLx2x/
	E357d9/F0XGuSoEAdAmcINMsRzaB/aXC6WFQaebHciCh2urVYKvPH3HhOY5fcV00
	tKdecW6nlxDMWx/8r6+0RyXzY+VcJzufUJg/FgVguq0JzLdVGw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7gse1tuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41D0sipK031157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:44 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:44 -0800
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
Subject: [PATCH v15 41/50] ASoC: Add SND kcontrol for fetching USB offload
 status
Date: Mon, 12 Feb 2024 16:54:13 -0800
Message-ID: <20240213005422.3121-42-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240213005422.3121-1-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Bu0Ctvp1a7SqRliZwA1QS_Zkdqe19jLJ
X-Proofpoint-ORIG-GUID: Bu0Ctvp1a7SqRliZwA1QS_Zkdqe19jLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130005
Message-ID-Hash: NTIEXNTGFM2GEKCBF34FCW7KG7BOLTSN
X-Message-ID-Hash: NTIEXNTGFM2GEKCBF34FCW7KG7BOLTSN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTIEXNTGFM2GEKCBF34FCW7KG7BOLTSN/>
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

An example of fetching the USB offloading status would look like:
tinymix -D 0 get 'USB Offload Playback Route Status'
-1, -1 (range -1->32) --> [Offload is idle]

tinymix -D 0 get 'USB Offload Playback Route Status'
1, 0 (range -1->32)  --> [Offload active on card#1 pcm#0]

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  46 ++++++++++++
 sound/soc/soc-usb.c     | 150 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 7b0531f975c2..41e59892c360 100644
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
@@ -51,6 +73,11 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
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
@@ -86,6 +113,25 @@ static inline void *snd_soc_usb_find_priv_data(struct device *dev)
 	return NULL;
 }
 
+static inline int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx,
+						int pcm_idx)
+{
+	return -EINVAL;
+}
+
+static inline int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb,
+						int session_id)
+{
+	return -EINVAL;
+}
+
+static inline int snd_soc_usb_set_session_state(struct snd_soc_usb *usb,
+						int session_id,
+						enum snd_soc_usb_dai_state state)
+{
+	return -EINVAL;
+}
+
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 						struct snd_soc_component *component,
 						int num_supported_streams, void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index a55d1c509297..d3183c0d3844 100644
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
+	.name = "USB Offload Playback Route Status",
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
