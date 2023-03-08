Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983ED6B1776
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 01:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D545018A3;
	Thu,  9 Mar 2023 01:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D545018A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678320291;
	bh=EpdClJ2o4Ijn9eyVDGA917bJ8/Zo09oT4oN3BhfaBbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TD0de9qZXEJ1aWNlNkUjKImDoP6TifAAnynPOQI5cLboT24hntxF8LoBfA0WnYW+e
	 85jdeX2hLtTaO1ReIOHaYyhHgssIarfx9AeE8OnjPjYbShsAPWydZgJLARiWjHeWwp
	 g5oerZl16oFa2D8h6mtsewL7vgO4sFhT5TiCmdto=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 793F3F805E8;
	Thu,  9 Mar 2023 00:59:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4672FF805BE; Thu,  9 Mar 2023 00:59:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A214F80549
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 00:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A214F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oUxvtSGk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328D89M3012562;
	Wed, 8 Mar 2023 23:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=huk+KaMEoKJXon78kCi9B0/eB6R2iMd3neoEP1lz1zk=;
 b=oUxvtSGkvMefo27+fSEzURtmOw1IRSAmdjKqNTNceDG34SMoaM3auoE30gKMx5pp8a3g
 GBT5qc2ZDT6s53tl1gJDAROJf1iqUu+/9zgu0a9y5lR4t13qko4lvjaeGjgW3Dmhf7Vl
 EXcufhyceV6p60dnReknIwRxnzgjB57ZbBwiolj+tOnC9+PdhQkUBSgCRc3BTVHpQd8E
 EhpbHTERv+MTVpMJcRLKlXYbgODUoh7yw8Xq1fGV+rrZakQZQQ86v3Zom/097N3z1Nke
 BS4zfQrpF7ElSis08EVTzrlpCLQ2p1QqGWr2tbm94JpoVt9xFB4ZUVyxTZhbbTOfDbWq jw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6fgfu8pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 23:58:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 328NwBMS015030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 23:58:11 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 15:58:11 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
Subject: [PATCH v3 22/28] ASoC: qcom: qdsp6: q6afe: Split USB AFE dev_token
 param into separate API
Date: Wed, 8 Mar 2023 15:57:45 -0800
Message-ID: <20230308235751.495-23-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OIRnSBwxU824tdyky7og2RoWXtFOu7bS
X-Proofpoint-ORIG-GUID: OIRnSBwxU824tdyky7og2RoWXtFOu7bS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
Message-ID-Hash: VSOJW7DTY3UCIBJB45XEDBWP7OITQOHW
X-Message-ID-Hash: VSOJW7DTY3UCIBJB45XEDBWP7OITQOHW
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSOJW7DTY3UCIBJB45XEDBWP7OITQOHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Q6USB backend can carry information about the available USB SND cards
and PCM devices discovered on the USB bus.  The dev_token field is used by
the audio DSP to notify the USB offload driver of which card and PCM index
to enable playback on.  Separate this into a dedicated API, so the USB
backend can set the dev_token accordingly.  The audio DSP does not utilize
this information until the AFE port start command is sent, which is done
during the PCM prepare phase.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 49 +++++++++++++++++++++++++-----------
 sound/soc/qcom/qdsp6/q6afe.h |  1 +
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index e9d5fa6b6b0d..505371c96987 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1394,10 +1394,42 @@ void q6afe_tdm_port_prepare(struct q6afe_port *port,
 }
 EXPORT_SYMBOL_GPL(q6afe_tdm_port_prepare);
 
-static int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
+/**
+ * afe_port_send_usb_dev_param() - Send USB dev token
+ *
+ * @port: Instance of afe port
+ * @cardidx: USB SND card index to reference
+ * @pcmidx: USB SND PCM device index to reference
+ *
+ * The USB dev token carries information about which USB SND card instance and
+ * PCM device to execute the offload on.  This information is carried through
+ * to the stream enable QMI request, which is handled by the offload class
+ * driver.  The information is parsed to determine which USB device to query
+ * the required resources for.
+ */
+int afe_port_send_usb_dev_param(struct q6afe_port *port, int cardidx, int pcmidx)
 {
-	union afe_port_config *pcfg = &port->port_cfg;
 	struct afe_param_id_usb_audio_dev_params usb_dev;
+	int ret;
+
+	memset(&usb_dev, 0, sizeof(usb_dev));
+
+	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
+	usb_dev.dev_token = (cardidx << 16) | (pcmidx << 8);
+	ret = q6afe_port_set_param_v2(port, &usb_dev,
+				AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
+				AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
+	if (ret)
+		dev_err(port->afe->dev, "%s: AFE device param cmd failed %d\n",
+			__func__, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(afe_port_send_usb_dev_param);
+
+static int afe_port_send_usb_params(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
+{
+	union afe_port_config *pcfg = &port->port_cfg;
 	struct afe_param_id_usb_audio_dev_lpcm_fmt lpcm_fmt;
 	struct afe_param_id_usb_audio_svc_interval svc_int;
 	int ret = 0;
@@ -1408,20 +1440,9 @@ static int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb
 		goto exit;
 	}
 
-	memset(&usb_dev, 0, sizeof(usb_dev));
 	memset(&lpcm_fmt, 0, sizeof(lpcm_fmt));
 	memset(&svc_int, 0, sizeof(svc_int));
 
-	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
-	q6afe_port_set_param_v2(port, &usb_dev,
-				AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
-				AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
-	if (ret) {
-		dev_err(port->afe->dev, "%s: AFE device param cmd failed %d\n",
-			__func__, ret);
-		goto exit;
-	}
-
 	lpcm_fmt.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
 	lpcm_fmt.endian = pcfg->usb_cfg.endian;
 	ret = q6afe_port_set_param_v2(port, &lpcm_fmt,
@@ -1465,7 +1486,7 @@ void q6afe_usb_port_prepare(struct q6afe_port *port,
 	pcfg->usb_cfg.num_channels = cfg->num_channels;
 	pcfg->usb_cfg.bit_width = cfg->bit_width;
 
-	afe_port_send_usb_dev_param(port, cfg);
+	afe_port_send_usb_params(port, cfg);
 }
 EXPORT_SYMBOL_GPL(q6afe_usb_port_prepare);
 
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index e098a3e15135..7980416275e9 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -274,6 +274,7 @@ void q6afe_tdm_port_prepare(struct q6afe_port *port, struct q6afe_tdm_cfg *cfg);
 void q6afe_cdc_dma_port_prepare(struct q6afe_port *port,
 				struct q6afe_cdc_dma_cfg *cfg);
 
+int afe_port_send_usb_dev_param(struct q6afe_port *port, int cardidx, int pcmidx);
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
 			  unsigned int freq, int dir);
