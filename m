Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C857605DB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED8DEAD;
	Tue, 25 Jul 2023 04:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED8DEAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690252939;
	bh=ZkV2uRKdZ5YnHRZLgCs510ZzrTgHSrCfSNTYLmWs6k0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dD87Ko2mR0KE6RrEetpnqEGKKPJxiPU7QpS8Q1MBlN2XZzfAlOppV4kssnUXjwZ04
	 IgBc5HaCDCpdEgmA6O2r6qRYefSozj5fuJTJY8BQScS8jV7ppi2+y8E6EOyVWr+PyK
	 pr/txWIFubYQ7PhpJdkrA15co3n+LAlU7O9CMWuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20A0EF8057F; Tue, 25 Jul 2023 04:35:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD025F8068C;
	Tue, 25 Jul 2023 04:35:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A231BF8067C; Tue, 25 Jul 2023 04:35:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C757F80568
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C757F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Dk1E75hV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P1fRru013526;
	Tue, 25 Jul 2023 02:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Us/Y2DRKDikDW08y2WbZuLAfQKMNl3FFx+1nGvfHhrE=;
 b=Dk1E75hVx7YtMJwSHum8EF5agXWsLICYpqKZxWRoWCV4l4HETTChPtHCNfdC4xBztWkN
 M1qIGiHf+evz+/ezD12UC+ElcYE0xpUWCET4BuesJoGuQUfS3m0Q+NfoLjgcnuCj3/b4
 dL4TTw4rtlLnB7dLBcmAlmE8X4Vnr+ZUPF8HybESgp3qn3srOFHwX5y6IbQ0JSPTs6z4
 02jJhEr7gUPqnxMp8feMtGKMZTIHVj3PjsCTEb/6kVDhXnntWuapqILrYoUD2GtSHvei
 B64FO3HmJ4Lw9PPo7j8NgnD51LmDtklCz+jGA/tevgNNOzPytyTk9/7QL1tVUR0/cKJH EA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1y6m0q9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:49 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YmuK012997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:48 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 19:34:47 -0700
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
Subject: [PATCH v4 26/32] sound: Pass USB SND card and PCM information to SOC
 USB
Date: Mon, 24 Jul 2023 19:34:10 -0700
Message-ID: <20230725023416.11205-27-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 0AjGXzfezAJCukT_ko6tVMWrj--u2AWn
X-Proofpoint-ORIG-GUID: 0AjGXzfezAJCukT_ko6tVMWrj--u2AWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=772 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250020
Message-ID-Hash: 2N6GOKVPYCKRTMLAKC3MDZMWY27D2EWZ
X-Message-ID-Hash: 2N6GOKVPYCKRTMLAKC3MDZMWY27D2EWZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2N6GOKVPYCKRTMLAKC3MDZMWY27D2EWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, only the index to the USB SND card array is passed to the USB
backend.  Pass through more information, specifically the USB SND card
number and the number of PCM devices available.  The USB backend should
know about which sound resources are being shared between the ASoC and USB
SND paths.  This can be utilized to properly select and maintain the
offloading devices.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h           |  9 +++++----
 sound/soc/qcom/qdsp6/q6usb.c      | 20 ++++++++++++++++++--
 sound/soc/soc-usb.c               | 12 +++++++-----
 sound/usb/qcom/qc_audio_offload.c |  9 +++++----
 4 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 71e6e75e600a..606128332044 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -19,20 +19,21 @@ struct snd_soc_usb {
 	struct device *dev;
 	struct snd_soc_component *component;
 	int (*connection_status_cb)(struct snd_soc_usb *usb, int card_idx,
-				int connected);
+				int chip_idx, int num_pcm, int connected);
 	void *priv_data;
 };
 
 int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
 			int direction);
 
-int snd_soc_usb_connect(struct device *usbdev, int card_idx);
-int snd_soc_usb_disconnect(struct device *usbdev);
+int snd_soc_usb_connect(struct device *usbdev, int card_idx, int chip_idx,
+			int num_pcm);
+int snd_soc_usb_disconnect(struct device *usbdev, int card_idx);
 void snd_soc_usb_set_priv_data(struct device *dev, void *priv);
 void *snd_soc_usb_get_priv_data(struct device *usbdev);
 
 struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev, void *priv,
 			int (*connection_cb)(struct snd_soc_usb *usb, int card_idx,
-			int connected));
+			int chip_idx, int num_pcm, int connected));
 int snd_soc_usb_remove_port(struct device *dev);
 #endif
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index c4f3039ef8c4..2fb6159bd2a8 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -25,10 +25,18 @@
 
 #define SID_MASK	0xF
 
+struct q6usb_status {
+	unsigned int num_pcm;
+	unsigned int chip_index;
+	unsigned int pcm_index;
+};
+
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
 	struct q6usb_offload priv;
+	unsigned long available_card_slot;
+	struct q6usb_status status[SNDRV_CARDS];
 	int active_idx;
 };
 
@@ -97,7 +105,7 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
 }
 
 static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
-			int connected)
+			int chip_idx, int num_pcm, int connected)
 {
 	struct snd_soc_dapm_context *dapm;
 	struct q6usb_port_data *data;
@@ -109,8 +117,16 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
 		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
 		/* We only track the latest USB headset plugged in */
 		data->active_idx = card_idx;
+
+		set_bit(card_idx, &data->available_card_slot);
+		data->status[card_idx].num_pcm = num_pcm;
+		data->status[card_idx].chip_index = chip_idx;
 	} else {
-		snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
+		clear_bit(card_idx, &data->available_card_slot);
+		data->status[card_idx].num_pcm = 0;
+		data->status[card_idx].chip_index = 0;
+		if (!data->available_card_slot)
+			snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
 	}
 	snd_soc_dapm_sync(dapm);
 
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index cdce1bb42df5..84dc6d0b2eab 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -95,7 +95,7 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);
  */
 struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev, void *priv,
 			int (*connection_cb)(struct snd_soc_usb *usb, int card_idx,
-			int connected))
+			int chip_idx, int num_pcm, int connected))
 {
 	struct snd_soc_usb *usb;
 
@@ -149,7 +149,8 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
  * handle how the USB backend selects, which device to enable offloading on.
  *
  */
-int snd_soc_usb_connect(struct device *usbdev, int card_idx)
+int snd_soc_usb_connect(struct device *usbdev, int card_idx, int chip_idx,
+			int num_pcm)
 {
 	struct snd_soc_usb *ctx;
 
@@ -161,7 +162,8 @@ int snd_soc_usb_connect(struct device *usbdev, int card_idx)
 		return -ENODEV;
 
 	if (ctx->connection_status_cb)
-		ctx->connection_status_cb(ctx, card_idx, 1);
+		ctx->connection_status_cb(ctx, card_idx, chip_idx,
+						num_pcm, 1);
 
 	return 0;
 }
@@ -174,7 +176,7 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_connect);
  * Notify of a new USB SND device disconnection to the USB backend.
  *
  */
-int snd_soc_usb_disconnect(struct device *usbdev)
+int snd_soc_usb_disconnect(struct device *usbdev, int card_idx)
 {
 	struct snd_soc_usb *ctx;
 
@@ -186,7 +188,7 @@ int snd_soc_usb_disconnect(struct device *usbdev)
 		return -ENODEV;
 
 	if (ctx->connection_status_cb)
-		ctx->connection_status_cb(ctx, -1, 0);
+		ctx->connection_status_cb(ctx, card_idx, 0, 0, 0);
 
 	return 0;
 }
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a2ae0d31df97..c90824751da9 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1591,7 +1591,8 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	atomic_inc(&uaudio_qdev->qdev_in_use);
 	mutex_unlock(&qdev_mutex);
 
-	snd_soc_usb_connect(usb_get_usb_backend(udev), chip->index);
+	snd_soc_usb_connect(usb_get_usb_backend(udev), chip->card->number,
+				chip->index, chip->pcm_devs);
 }
 
 /**
@@ -1677,12 +1678,12 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
 	dev->chip = NULL;
 	mutex_unlock(&chip->mutex);
 
+	snd_soc_usb_disconnect(usb_get_usb_backend(udev), card_num);
+
 	mutex_lock(&qdev_mutex);
 	atomic_dec(&uaudio_qdev->qdev_in_use);
-	if (!atomic_read(&uaudio_qdev->qdev_in_use)) {
-		snd_soc_usb_disconnect(usb_get_usb_backend(udev));
+	if (!atomic_read(&uaudio_qdev->qdev_in_use))
 		qc_usb_audio_cleanup_qmi_dev();
-	}
 	mutex_unlock(&qdev_mutex);
 
 	xhci_sideband_unregister(dev->sb);
