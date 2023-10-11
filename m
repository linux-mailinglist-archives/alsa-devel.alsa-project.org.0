Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79E7C46B9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 02:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE86EF5;
	Wed, 11 Oct 2023 02:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE86EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696984340;
	bh=aZY9vNey226SSlIBimcR8NNH08F2H64KgmBsKPSONEQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vjinpIcB/sKLa1lM+FTgQgsOlt0g0A3tSDloM+A84D7LQf6neeGO97N1Ma0SN3l4O
	 EyqPoMEQbkwyXc+GvFWpM816/lOnvtnOdVNawnXkxtjdv9vS0jCGwOyOBCRbkzTiE9
	 bEyhqzUCq7I74TLVFfH7h1tRvH8ceYjGjhXm/XSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2190DF806BD; Wed, 11 Oct 2023 02:24:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67476F806B9;
	Wed, 11 Oct 2023 02:24:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ADB7F8069A; Wed, 11 Oct 2023 02:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60C11F8057F
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 02:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C11F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=h3+LsGWg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39ANA9DO003418;
	Wed, 11 Oct 2023 00:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=iVxHFTIcdxp/Jy4SowB2gEZbBITOj/637q7GRBYSO4k=;
 b=h3+LsGWgFhNSJNUmdPum5Yocb8xU9L7qf/qJbRWBs6/Hk9QoOgwkawVJqK45nNcwqkru
 t4W0tYoIZaid6vttF1SeIMnzP79g0u8BJQ1mtxa7163jQuBQlcBCtsFMKaH+jyv3bfqi
 XrvNX4EzX07fNDDbhqhTnJgsSmGSdC5n36fe4p4Xj7tLs0dFmXUMPNQMd4EFPL3ROdaX
 vcS5cvxA2AUX3/ogicOW1CKctdq1hohthVWbiViCdpDVlcvl4JLPIWoJGndDZYOiVgYr
 kR98Ck45gdrJ9M8mIBZ85TOLFgIJlpNxdJtaCPlAnRGEAFsj+VMOxeOp82lGc6eCvj8l +Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tne0q08kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:39 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39B0MclC004873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:38 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 17:22:38 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v8 29/34] ASoC: qcom: qdsp6: Add SND kcontrol to select
 offload device
Date: Tue, 10 Oct 2023 17:21:41 -0700
Message-ID: <20231011002146.1821-30-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231011002146.1821-1-quic_wcheng@quicinc.com>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: x8SrIPdJlHITz3zAOeYEltOd8rI29ZXu
X-Proofpoint-ORIG-GUID: x8SrIPdJlHITz3zAOeYEltOd8rI29ZXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_19,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110001
Message-ID-Hash: NNWO5LYXBRRN5O5G2JYTN2BQP63QJ7AA
X-Message-ID-Hash: NNWO5LYXBRRN5O5G2JYTN2BQP63QJ7AA
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNWO5LYXBRRN5O5G2JYTN2BQP63QJ7AA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Expose a kcontrol on the platform sound card, which will allow for
userspace to determine which USB card number and PCM device to offload.
This allows for userspace to potentially tag an alternate path for a
specific USB SND card and PCM device.  Previously, control was absent, and
the offload path would be enabled on the last USB SND device which was
connected.  This logic will continue to be applicable if no mixer input is
received for specific device selection.

An example to configure the offload device using tinymix:
tinymix -D 0 set 'Q6USB offload SND device select' 1 0

The above will set the Q6AFE device token to choose offload on card#1 and
pcm#0.  Device selection is made possible by setting the Q6AFE device
token.  The audio DSP utilizes this parameter, and will pass this field
back to the USB offload driver within the QMI stream requests.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 125 ++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index d697cbe7f184..a95276b7d91d 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -14,6 +14,7 @@
 #include <linux/dma-map-ops.h>
 
 #include <sound/pcm.h>
+#include <sound/control.h>
 #include <sound/soc.h>
 #include <sound/soc-usb.h>
 #include <sound/pcm_params.h>
@@ -35,9 +36,12 @@ struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
 	struct q6usb_offload priv;
+	struct mutex mutex;
 	unsigned long available_card_slot;
 	struct q6usb_status status[SNDRV_CARDS];
-	int active_idx;
+	bool idx_valid;
+	int sel_card_idx;
+	int sel_pcm_idx;
 };
 
 static const struct snd_soc_dapm_widget q6usb_dai_widgets[] = {
@@ -53,9 +57,34 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct q6afe_port *q6usb_afe;
 	int direction = substream->stream;
+	int chip_idx;
+	int ret;
+
+	mutex_lock(&data->mutex);
+	chip_idx = data->status[data->sel_card_idx].chip_index;
+
+	ret = snd_soc_usb_find_format(chip_idx, params, direction);
+	if (ret < 0)
+		goto out;
+
+	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
+	if (IS_ERR(q6usb_afe))
+		goto out;
 
-	return snd_soc_usb_find_format(data->active_idx, params, direction);
+	ret = afe_port_send_usb_dev_param(q6usb_afe, data->sel_card_idx,
+						data->sel_pcm_idx);
+	if (ret < 0)
+		goto out;
+
+	data->status[data->sel_card_idx].pcm_index = data->sel_pcm_idx;
+out:
+	mutex_unlock(&data->mutex);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops q6usb_ops = {
@@ -86,6 +115,89 @@ static struct snd_soc_dai_driver q6usb_be_dais[] = {
 	},
 };
 
+static int q6usb_get_offload_dev(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	int pcm_idx;
+	int card_idx;
+
+	mutex_lock(&data->mutex);
+	if (!data->idx_valid) {
+		card_idx = -1;
+		pcm_idx = -1;
+	} else {
+		card_idx = data->sel_card_idx;
+		pcm_idx = data->sel_pcm_idx;
+	}
+
+	ucontrol->value.integer.value[0] = card_idx;
+	ucontrol->value.integer.value[1] = pcm_idx;
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
+
+static int q6usb_put_offload_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	int changed = 0;
+	int pcmidx;
+	int cardidx;
+
+	cardidx = ucontrol->value.integer.value[0];
+	pcmidx = ucontrol->value.integer.value[1];
+
+	mutex_lock(&data->mutex);
+	if ((cardidx >= 0 && test_bit(cardidx, &data->available_card_slot))) {
+		data->sel_card_idx = cardidx;
+		changed = 1;
+	}
+
+	if ((pcmidx >= 0 && pcmidx < data->status[cardidx].num_pcm)) {
+		data->sel_pcm_idx = pcmidx;
+		data->idx_valid = true;
+		changed = 1;
+	}
+	mutex_unlock(&data->mutex);
+
+	return changed;
+}
+
+static int q6usb_offload_dev_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = -1;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new q6usb_offload_dev_ctrl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.name = "Q6USB offload SND device select",
+	.info = q6usb_offload_dev_info,
+	.get = q6usb_get_offload_dev,
+	.put = q6usb_put_offload_dev,
+};
+
+/* Build a mixer control for a UAC connector control (jack-detect) */
+static void q6usb_connector_control_init(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = snd_ctl_add(component->card->snd_card,
+				snd_ctl_new1(&q6usb_offload_dev_ctrl, component));
+	if (ret < 0)
+		return;
+}
+
 static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
 					const struct of_phandle_args *args,
 					const char **dai_name)
@@ -115,9 +227,11 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	data = dev_get_drvdata(usb->component->dev);
 
+	mutex_lock(&data->mutex);
 	if (connected) {
 		/* We only track the latest USB headset plugged in */
-		data->active_idx = sdev->card_idx;
+		if (!data->idx_valid || data->sel_card_idx < 0)
+			data->sel_card_idx = sdev->card_idx;
 
 		set_bit(sdev->card_idx, &data->available_card_slot);
 		data->status[sdev->card_idx].num_pcm = sdev->num_playback;
@@ -127,6 +241,7 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 		data->status[sdev->card_idx].num_pcm = 0;
 		data->status[sdev->card_idx].chip_index = 0;
 	}
+	mutex_unlock(&data->mutex);
 
 	return 0;
 }
@@ -135,6 +250,8 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 {
 	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
 
+	q6usb_connector_control_init(component);
+
 	data->usb = snd_soc_usb_add_port(component->dev, &data->priv, q6usb_alsa_connection_cb);
 	if (IS_ERR(data->usb)) {
 		dev_err(component->dev, "failed to add usb port\n");
@@ -189,6 +306,8 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
 
 	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
 
+	mutex_init(&data->mutex);
+
 	data->priv.dev = dev;
 	dev_set_drvdata(dev, data);
 
