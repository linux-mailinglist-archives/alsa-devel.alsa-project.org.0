Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98067C369
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 04:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090A7A4E;
	Thu, 26 Jan 2023 04:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090A7A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674703187;
	bh=HDxGywGjOt408aQZJQouIoqGUZ7DcZsvgSlInxJpfx4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sGXTT1LIC0PrDqzwufmyOjsh4AY/sFVlA3n27QuswMKn56y38te4yr5IZ5x46RMV6
	 en7zh7s6fxBEygHDLF54oOGn7MIDf4ocymawO5KSyZPbmGpJC2T67sH2SAhYFRhKpL
	 5w6CKaAn7M5uAvHL/6/UuRsSI6ReVeyYGkvqy8i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4675F8055A;
	Thu, 26 Jan 2023 04:15:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEDE7F805C6; Thu, 26 Jan 2023 04:15:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF904F80543
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF904F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=j8ZCJAUm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30Q38Osk022211; Thu, 26 Jan 2023 03:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=SiGwMQVfI8qUMo4oBmUYasKXPqJDaQ0HCFvv1Uhc3es=;
 b=j8ZCJAUmctepwhJKoUCDJ1WHqWaC8eFgIArFFl+ZesONe6rhcRkjtet1ApA/MkX82isa
 iC4u2GCOzWq/2buZJ0sdKQnUBVtLyahg5Njz355JGPhTNXiFGEv1qPlZWHo2LGPHpKdu
 pa7j3XdoVZ7OTJpLgKZCSTILNNhf+CB8RHHhgS6584Eu7N4Et2aXMfPFe+5RXREZX0y/
 O7ZuJaRFP8UcO8PbP8OMGpCqMWj+61cM1byZfGtKI6ls0zgzpqiCWqZ7HgDR4VnQ7Zyx
 Rd7NqRMCDlM93n+J8QjlOw1i2h5yBPMs0Kl0nTWO+0gM27E/5gHmDEmYFgIbi9wBODms ww== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nb0qrsx77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 03:14:45 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30Q3EjBj031324
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 03:14:45 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 19:14:44 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
Subject: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND platform op
 callbacks
Date: Wed, 25 Jan 2023 19:14:14 -0800
Message-ID: <20230126031424.14582-13-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230126031424.14582-1-quic_wcheng@quicinc.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9vPalcDpYzI_lkkCJI4Ee3kCXXK1r2kB
X-Proofpoint-ORIG-GUID: 9vPalcDpYzI_lkkCJI4Ee3kCXXK1r2kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_14,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=806 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260028
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
 quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Allow for different platforms to be notified on USB SND connect/disconnect
seqeunces.  This allows for platform USB SND modules to properly initialize
and populate internal structures with references to the USB SND chip
device.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 28 ++++++++++++++++++++++++++++
 sound/usb/card.h | 20 ++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 26268ffb8274..803230343c16 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -117,6 +117,24 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
 static DEFINE_MUTEX(register_mutex);
 static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
 static struct usb_driver usb_audio_driver;
+static struct snd_usb_platform_ops *platform_ops;
+
+int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
+{
+	if (platform_ops)
+		return -EEXIST;
+
+	platform_ops = ops;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
+
+int snd_usb_unregister_platform_ops(void)
+{
+	platform_ops = NULL;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
 
 /*
  * disconnect streams
@@ -910,6 +928,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 	usb_set_intfdata(intf, chip);
 	atomic_dec(&chip->active);
 	mutex_unlock(&register_mutex);
+
+	if (platform_ops->connect_cb)
+		platform_ops->connect_cb(intf, chip);
+
 	return 0;
 
  __error:
@@ -943,6 +965,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	if (chip == USB_AUDIO_IFACE_UNUSED)
 		return;
 
+	if (platform_ops->disconnect_cb)
+		platform_ops->disconnect_cb(intf);
+
 	card = chip->card;
 
 	mutex_lock(&register_mutex);
@@ -1087,6 +1112,9 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 		chip->system_suspend = chip->num_suspended_intf;
 	}
 
+	if (platform_ops->suspend_cb)
+		platform_ops->suspend_cb(intf, message);
+
 	return 0;
 }
 
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 40061550105a..2249c411c3a1 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -206,4 +206,24 @@ struct snd_usb_stream {
 	struct list_head list;
 };
 
+struct snd_usb_platform_ops {
+	void (*connect_cb)(struct usb_interface *intf, struct snd_usb_audio *chip);
+	void (*disconnect_cb)(struct usb_interface *intf);
+	void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
+};
+
+#if IS_ENABLED(CONFIG_SND_USB_AUDIO)
+int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
+int snd_usb_unregister_platform_ops(void);
+#else
+int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
+{
+	return -EOPNOTSUPP;
+}
+
+int snd_usb_unregister_platform_ops(void)
+{
+	return -EOPNOTSUPP;
+}
+#endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
 #endif /* __USBAUDIO_CARD_H */
