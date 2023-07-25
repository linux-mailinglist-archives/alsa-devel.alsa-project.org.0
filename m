Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 344087605DD
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:42:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87111ED9;
	Tue, 25 Jul 2023 04:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87111ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690252965;
	bh=VJIeX9nH83I9FIgbnwG67VbwwwWZvs3Mu6rjYOftL+0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PaW5rHC11vRtu+iLD6NQtogVadbJ2f2enDiNmFHRyEYcQTX7ZJBdYECDmnBGhkj+n
	 CKeqsqlGtYU1K54wfXNdq1ikog3FK/GKZX+pAcFRH/5+Ye7pPyncALFqIu/hxxnR4K
	 5DXVbVDyVLxrHCtalq8aYttLdrwLNdMGwYIxFWyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73539F80697; Tue, 25 Jul 2023 04:35:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CEBF80690;
	Tue, 25 Jul 2023 04:35:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E15EF80684; Tue, 25 Jul 2023 04:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E46A7F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E46A7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=AaNY9OvM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P1t49w027915;
	Tue, 25 Jul 2023 02:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=iaVCk/chy30rh62yowY7DrEsgB4OaHkXkFlSvMrBeKg=;
 b=AaNY9OvMnsqvdKkFQiweWN9wtMPTKw6nJGwHUoCgpTW2hCJ3+riMXvRPxcxlLwJfDbzD
 iP1G1cBjaJvtD5i3qWNlFshbHo+YiznBSyRpb96XhEmZPz44Jmgc/L3sYHdbvL91FMZ4
 QueIh241oLwEsmcLrifNXg7KP7Li4JIJX3H/m/wiSQcNiHDAu0DplxPLPPiXl6w2nwYT
 WQlN7+xSOXJmBbzTG3nZ8iEN31kvNyAcIfL64KXpLDTvHTr/McEj0O7yY5I+3Zq/ouX/
 f55XieCzHGQ2jZfK8wZQy7DD5EfSrsFrn7fLPF7LXD+f68OusBSlXOnYOrOzCNocFZ/i WQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1vh8h4cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:51 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YoJ9020408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:50 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 19:34:49 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <pierre-louis.bossart@linux.intel.com>,
        <oneukum@suse.com>, <albertccwang@google.com>,
        <o-takashi@sakamocchi.jp>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v4 29/32] sound: soc: qcom: q6usb: Add headphone jack for
 offload connection status
Date: Mon, 24 Jul 2023 19:34:13 -0700
Message-ID: <20230725023416.11205-30-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230725023416.11205-1-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UndFFRLDaCQ5MTFL2GQMa5sB2Eb_eCOL
X-Proofpoint-GUID: UndFFRLDaCQ5MTFL2GQMa5sB2Eb_eCOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250020
Message-ID-Hash: AOO4CF5R6GWF3DSU25ZF6YR2CNQMYK34
X-Message-ID-Hash: AOO4CF5R6GWF3DSU25ZF6YR2CNQMYK34
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOO4CF5R6GWF3DSU25ZF6YR2CNQMYK34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The headphone jack framework has a well defined intrastructure for
notifying userspace entities through input devices.  Expose a jack device
that carries information about if an offload capable device is connected.
Applications can further identify specific offloading information through
other SND kcontrols.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index e4ccb9d912b0..860dff8c1438 100644
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
@@ -322,7 +330,10 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
-		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
+		if (!data->available_card_slot) {
+			snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
+			snd_jack_report(data->hs_jack.jack, 1);
+		}
 		/*
 		 * Update the latest USB headset plugged in, if session is
 		 * idle.
@@ -338,8 +349,10 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
 		clear_bit(card_idx, &data->available_card_slot);
 		data->status[card_idx].num_pcm = 0;
 		data->status[card_idx].chip_index = 0;
-		if (!data->available_card_slot)
+		if (!data->available_card_slot) {
 			snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
+			snd_jack_report(data->hs_jack.jack, 0);
+		}
 	}
 	snd_soc_dapm_sync(dapm);
 	mutex_unlock(&data->mutex);
