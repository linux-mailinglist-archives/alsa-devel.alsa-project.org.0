Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA473858BB7
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 01:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 919A91928;
	Sat, 17 Feb 2024 01:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 919A91928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708129553;
	bh=hk7In+ww81z4Qk7+BraCCdvs1dyXyuUDvjG/d3CCxYY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RyxgFSy1vYQEOctWXOqr+P0WZUNAMn68BDLGuqKy/8gbLGCZ4YL29hwpQOHh9mA07
	 MPbNFkEnnj8ASpdQ4s4zJ6i5JbpXRD3pJX4ffLgtYJV/dwpJqPKo1m2u9DI8WtY1zR
	 KG9BUYZBMUZ2yP52xh4nl7m1XOwc5JUdfPUcVeWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20A33F80642; Sat, 17 Feb 2024 01:22:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BCA5F8078F;
	Sat, 17 Feb 2024 01:22:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD4FBF80238; Sat, 17 Feb 2024 01:13:01 +0100 (CET)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8045F805B2
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 01:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8045F805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=FljXZe8p
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GNfKZU025501;
	Sat, 17 Feb 2024 00:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=8WSJ8FulDBKQfYgUGO7D
	0IPBKMSABhMchwkTts6ZjaY=; b=FljXZe8pNsnrpTjt06h2zx7tRUBLYHmYnZgk
	IsOcEV/sOhSUkLpQZJi1QFYHttGtMPi8WhL0FlZKShvyi+7CQ4p3ddn7kXMkiZN2
	n0PBc1iH0ZAAYedwq9hEEcbYE8DAK2icx0LFRanZmLeHuIkBrBJQwLe/DCkhmYhw
	Zizhr2Dl3P+xdIhbv+Mv58WXSemTG++8rbd62O/vY14rZpj2BbT6Atlc6xZ/YHUw
	gwmECIoU9yqQsuvX+OpgcjSLgqIv1EUA6Epw4Hr8L3ihuEZpIpZ7sT0i35yoaX/j
	cFlclZzv3wTuTPxK8BtgNe+KT0CDOFAPZ9l/tN8jtFTBm0Ogiw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9fkfcv5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41H0AfLH025793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 00:10:41 GMT
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
Subject: [PATCH v17 40/51] ASoC: qcom: qdsp6: Add SOC USB offload select
 get/put callbacks
Date: Fri, 16 Feb 2024 16:10:06 -0800
Message-ID: <20240217001017.29969-41-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: aWDbpRiCMMtcpsd-DKiZyVIVREWfG4_9
X-Proofpoint-GUID: aWDbpRiCMMtcpsd-DKiZyVIVREWfG4_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_23,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160189
Message-ID-Hash: 3XMOS4HH3NLG2NH2ODTW3YKBDFVNWCRF
X-Message-ID-Hash: 3XMOS4HH3NLG2NH2ODTW3YKBDFVNWCRF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XMOS4HH3NLG2NH2ODTW3YKBDFVNWCRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order for device selection to be supported, the Q6USB backend DAI link
will need to be notified about the device to start the offloading session
on. Device selection is made possible by setting the Q6AFE device token.
The audio DSP utilizes this parameter, and will pass this field back to
the USB offload driver within the QMI stream requests.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 115 +++++++++++++++++++++++++++++++++--
 1 file changed, 111 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index e539b411c35e..72ec7d45f916 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -36,9 +36,12 @@ struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
 	struct q6usb_offload priv;
-	int active_usb_chip_idx;
+	struct mutex mutex;
 	unsigned long available_card_slot;
 	struct q6usb_status status[SNDRV_CARDS];
+	bool idx_valid;
+	int sel_card_idx;
+	int sel_pcm_idx;
 };
 
 static const struct snd_soc_dapm_widget q6usb_dai_widgets[] = {
@@ -54,10 +57,34 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct q6afe_port *q6usb_afe;
 	int direction = substream->stream;
+	int chip_idx;
+	int ret;
+
+	mutex_lock(&data->mutex);
+	chip_idx = data->status[data->sel_card_idx].sdev->chip_idx;
+
+	ret = snd_soc_usb_find_format(chip_idx, params, direction);
+	if (ret < 0)
+		goto out;
+
+	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
+	if (IS_ERR(q6usb_afe))
+		goto out;
 
-	return snd_soc_usb_find_format(data->active_usb_chip_idx, params,
-					direction);
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
@@ -88,6 +115,70 @@ static struct snd_soc_dai_driver q6usb_be_dais[] = {
 	},
 };
 
+static int q6usb_get_offload_dev(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol,
+				 enum snd_soc_usb_kctl type)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	int idx;
+
+	mutex_lock(&data->mutex);
+
+	if (!data->available_card_slot) {
+		idx = -1;
+	} else {
+		if (type == SND_SOC_USB_KCTL_CARD_ROUTE)
+			idx = data->sel_card_idx;
+		else
+			idx = data->sel_pcm_idx;
+	}
+
+	ucontrol->value.integer.value[0] = idx;
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
+
+static int q6usb_put_offload_dev(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol,
+				 enum snd_soc_usb_kctl type)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	int changed = 0;
+	int idx;
+
+	idx = ucontrol->value.integer.value[0];
+
+	mutex_lock(&data->mutex);
+	switch (type) {
+	case SND_SOC_USB_KCTL_CARD_ROUTE:
+		if (idx >= 0 && test_bit(idx, &data->available_card_slot)) {
+			data->sel_card_idx = idx;
+			changed = 1;
+		}
+		break;
+	case SND_SOC_USB_KCTL_PCM_ROUTE:
+		if (idx >= 0 && data->sel_card_idx >= 0 &&
+		    idx < data->status[data->sel_card_idx].sdev->num_playback) {
+			data->sel_pcm_idx = idx;
+			changed = 1;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (changed)
+		data->idx_valid = true;
+
+out:
+	mutex_unlock(&data->mutex);
+
+	return changed;
+}
+
 static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
 					const struct of_phandle_args *args,
 					const char **dai_name)
@@ -117,16 +208,28 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	data = dev_get_drvdata(usb->component->dev);
 
+	mutex_lock(&data->mutex);
 	if (connected) {
 		/* We only track the latest USB headset plugged in */
-		data->active_usb_chip_idx = sdev->card_idx;
+		if (!data->idx_valid) {
+			data->sel_card_idx = sdev->card_idx;
+			data->sel_pcm_idx = 0;
+		}
 
 		set_bit(sdev->card_idx, &data->available_card_slot);
 		data->status[sdev->card_idx].sdev = sdev;
 	} else {
 		clear_bit(sdev->card_idx, &data->available_card_slot);
 		data->status[sdev->card_idx].sdev = NULL;
+
+		if (data->sel_card_idx == sdev->card_idx) {
+			data->idx_valid = false;
+			data->sel_card_idx = data->available_card_slot ?
+					ffs(data->available_card_slot) - 1 : 0;
+			data->sel_pcm_idx = 0;
+		}
 	}
+	mutex_unlock(&data->mutex);
 
 	return 0;
 }
@@ -142,6 +245,8 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
+	usb->put_offload_dev = q6usb_put_offload_dev;
+	usb->get_offload_dev = q6usb_get_offload_dev;
 
 	ret = snd_soc_usb_add_port(usb);
 	if (ret < 0) {
@@ -205,6 +310,8 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
 
 	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
 
+	mutex_init(&data->mutex);
+
 	data->priv.dev = dev;
 	dev_set_drvdata(dev, data);
 
