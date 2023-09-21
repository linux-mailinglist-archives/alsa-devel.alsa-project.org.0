Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454267AA448
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 00:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4718E80;
	Fri, 22 Sep 2023 00:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4718E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695333849;
	bh=QPXbZurBEj+nErYOW5fU3Ac8GM0SQxj2MNnt4DP4Hhg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sA0QeY8/z6MOaKc9S62/oo6JbRgbJ7lvyCkj/KDPZlJGZs+cpCCtZCXo3PXaBWtP/
	 1vgfHLFVezcwf1riG2hHneObAipu9g7oc9ilnM5MqLYSh8atSiEyVPU6NtRWHywTgS
	 aTMrO8U7SAwikb4YwlbfrmmzWzuGTR03pqyxCSM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 935BCF805B2; Fri, 22 Sep 2023 00:02:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A84CF8057F;
	Fri, 22 Sep 2023 00:02:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20D5DF801F5; Thu, 21 Sep 2023 23:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA7A5F80568
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 23:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA7A5F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=EtCpCykj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38LL73K6030494;
	Thu, 21 Sep 2023 21:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=680s6K8kYHmaW6UIbNRQKTuIHSDR5nqIKTvG3Ugh8so=;
 b=EtCpCykjlsdAs9I3zHo8WpZIQwK44yI6R9ZS4nXc8DJbvD+pmumsnmEq2W5vTccdwoWp
 nbKtUYkQ+vocM/RhE9KUeYTZVU7F7kHKjkT6IA8lymM3nVh1nvG+BvRzMrZSWgMM80gV
 MuYhJDJr1TG/mrbsMaaN6P9g4MWQuD4cGViTN3rX6GVOsjFjp0YkJXOObR3Sa4MiX49W
 M83vVOkRjagRA2QEMhPmQczaMfOQi2Mr6IP5B8ZDbcaxRJpfk++jIyP6nHpgHbz4/kNF
 //cODA6n8mw0AMX6Gb6+6DBAn0TeDncOrzSTa4F/SeqUoV6b1xu+BufdKVkXcTAL11e+ gQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u5n0bq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 21:49:18 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38LLn2ZO032184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 21:49:02 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 21 Sep 2023 14:49:01 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v7 30/33] ASoC: qcom: qdsp6: Add headphone jack for offload
 connection status
Date: Thu, 21 Sep 2023 14:48:40 -0700
Message-ID: <20230921214843.18450-31-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230921214843.18450-1-quic_wcheng@quicinc.com>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ai0bEh-pGLtYGP1cLya_lgAgYwPJi8FQ
X-Proofpoint-GUID: ai0bEh-pGLtYGP1cLya_lgAgYwPJi8FQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210189
Message-ID-Hash: HYDPPZNJ4FBG2OGZXWAHOJAMP6WBLUZA
X-Message-ID-Hash: HYDPPZNJ4FBG2OGZXWAHOJAMP6WBLUZA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYDPPZNJ4FBG2OGZXWAHOJAMP6WBLUZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The headphone jack framework has a well defined infrastructure for
notifying userspace entities through input devices.  Expose a jack device
that carries information about if an offload capable device is connected.
Applications can further identify specific offloading information through
other SND kcontrols.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index d2f60ce66cf3..9fa6c4016222 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -20,6 +20,7 @@
 #include <sound/pcm_params.h>
 #include <sound/asound.h>
 #include <sound/q6usboffload.h>
+#include <sound/jack.h>
 
 #include "q6dsp-lpass-ports.h"
 #include "q6afe.h"
@@ -37,6 +38,7 @@ struct q6usb_status {
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
+	struct snd_soc_jack hs_jack;
 	struct q6usb_offload priv;
 	struct mutex mutex;
 	unsigned long available_card_slot;
@@ -279,6 +281,7 @@ static const struct snd_kcontrol_new q6usb_offload_control = {
 /* Build a mixer control for a UAC connector control (jack-detect) */
 static void q6usb_connector_control_init(struct snd_soc_component *component)
 {
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
 	int ret;
 
 	ret = snd_ctl_add(component->card->snd_card,
@@ -290,6 +293,11 @@ static void q6usb_connector_control_init(struct snd_soc_component *component)
 				snd_ctl_new1(&q6usb_offload_dev_ctrl, component));
 	if (ret < 0)
 		return;
+
+	ret = snd_soc_card_jack_new(component->card, "USB offload",
+					SND_JACK_HEADSET, &data->hs_jack);
+	if (ret)
+		return;
 }
 
 static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
@@ -323,6 +331,9 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
+		if (!data->available_card_slot)
+			snd_jack_report(data->hs_jack.jack, 1);
+
 		/*
 		 * Update the latest USB headset plugged in, if session is
 		 * idle.
@@ -338,6 +349,9 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 		clear_bit(sdev->card_idx, &data->available_card_slot);
 		data->status[sdev->card_idx].num_pcm = 0;
 		data->status[sdev->card_idx].chip_index = 0;
+
+		if (!data->available_card_slot)
+			snd_jack_report(data->hs_jack.jack, 0);
 	}
 	mutex_unlock(&data->mutex);
 
