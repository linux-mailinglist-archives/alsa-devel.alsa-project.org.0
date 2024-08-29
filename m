Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68067964FE7
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 21:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2A6E9F;
	Thu, 29 Aug 2024 21:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2A6E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724960885;
	bh=YxPmuqFhmtIuZhaS/NK2b8xpU3pzaGGvJQvdsnZYLWY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fAheHrdzdIsZ7BRfthc/Bs2ElxZlq60wdO3AkfeoTF0D3GnEx3yjvoNWUwcsURFdm
	 bJUs22sYdX5pT6xr1PQeo7zz3d5dupsNc9N4txqCOsf/jewBcV43bW6Y6/X5nN5dkn
	 TPJ07CV+OEMiUl2p27CIexflgJ5pzFMzB8tVVyJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A68F805D7; Thu, 29 Aug 2024 21:43:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83253F896CB;
	Thu, 29 Aug 2024 21:43:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC537F80681; Thu, 29 Aug 2024 21:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFA86F805B0
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 21:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFA86F805B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=jYFF4kkU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47TGWMpl000605;
	Thu, 29 Aug 2024 19:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xzCRgwGIpiTzbcXlB3XQ9ivNnlnA25qsL/8pI+cpAY=; b=jYFF4kkUed7MfzEd
	A2vgieas3fqMim4H7Fl/vj38+IY690wNNvQjXGhNV4kSW/W7plfNat9E9Pxpaknf
	Bax6dPqYqjZ1/yMqk47siARkGmODTxovQkR6supDfEL3r36dZy/dACLVX0du66JE
	MZntlHFmjNK5MLhxZYmivKayERE9ZQaXwlprDu7lDgeRybUcwiPkJSI9kK++aoU+
	mh5utyr6j+aQhHhsleLVmPmyLhEGoG1YWdk5NwiSaepfoFj7dfuaD4VXrHkrQV2k
	1U6uTYLtdjNtQNZOn2wv52Lj4Ii43GIFxh+OqA/4YPshkDnvkZXjCxUAO15gn122
	euD4Ww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw6gmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47TJfVVg018236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:30 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 24/33] ALSA: usb-audio: Introduce USB SND platform op
 callbacks
Date: Thu, 29 Aug 2024 12:40:56 -0700
Message-ID: <20240829194105.1504814-25-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cCT5XdqZaf5PXZVrfCB99Q5jUuvbHJ_H
X-Proofpoint-GUID: cCT5XdqZaf5PXZVrfCB99Q5jUuvbHJ_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290139
Message-ID-Hash: NSCIMLBK36DBNZPUQ6DW55FNKXPJXGGT
X-Message-ID-Hash: NSCIMLBK36DBNZPUQ6DW55FNKXPJXGGT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSCIMLBK36DBNZPUQ6DW55FNKXPJXGGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for different platforms to be notified on USB SND connect/disconnect
sequences.  This allows for platform USB SND modules to properly initialize
and populate internal structures with references to the USB SND chip
device.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 sound/usb/card.h | 10 +++++++++
 2 files changed, 63 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1f9dfcd8f336..7f120aa006c0 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
 static DEFINE_MUTEX(register_mutex);
 static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
 static struct usb_driver usb_audio_driver;
+static struct snd_usb_platform_ops *platform_ops;
+
+/*
+ * Register platform specific operations that will be notified on events
+ * which occur in USB SND.  The platform driver can utilize this path to
+ * enable features, such as USB audio offloading, which allows for audio data
+ * to be queued by an audio DSP.
+ *
+ * Only one set of platform operations can be registered to USB SND.  The
+ * platform register operation is protected by the register_mutex.
+ */
+int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
+{
+	guard(mutex)(&register_mutex);
+	if (platform_ops)
+		return -EEXIST;
+
+	platform_ops = ops;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
+
+/*
+ * Unregisters the current set of platform operations.  This allows for
+ * a new set to be registered if required.
+ *
+ * The platform unregister operation is protected by the register_mutex.
+ */
+int snd_usb_unregister_platform_ops(void)
+{
+	guard(mutex)(&register_mutex);
+	platform_ops = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
 
 /*
  * Checks to see if requested audio profile, i.e sample rate, # of
@@ -946,7 +982,11 @@ static int usb_audio_probe(struct usb_interface *intf,
 	chip->num_interfaces++;
 	usb_set_intfdata(intf, chip);
 	atomic_dec(&chip->active);
+
+	if (platform_ops && platform_ops->connect_cb)
+		platform_ops->connect_cb(chip);
 	mutex_unlock(&register_mutex);
+
 	return 0;
 
  __error:
@@ -983,6 +1023,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	card = chip->card;
 
 	mutex_lock(&register_mutex);
+	if (platform_ops && platform_ops->disconnect_cb)
+		platform_ops->disconnect_cb(chip);
+
 	if (atomic_inc_return(&chip->shutdown) == 1) {
 		struct snd_usb_stream *as;
 		struct snd_usb_endpoint *ep;
@@ -1130,6 +1173,11 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 		chip->system_suspend = chip->num_suspended_intf;
 	}
 
+	mutex_lock(&register_mutex);
+	if (platform_ops && platform_ops->suspend_cb)
+		platform_ops->suspend_cb(intf, message);
+	mutex_unlock(&register_mutex);
+
 	return 0;
 }
 
@@ -1170,6 +1218,11 @@ static int usb_audio_resume(struct usb_interface *intf)
 
 	snd_usb_midi_v2_resume_all(chip);
 
+	mutex_lock(&register_mutex);
+	if (platform_ops && platform_ops->resume_cb)
+		platform_ops->resume_cb(intf);
+	mutex_unlock(&register_mutex);
+
  out:
 	if (chip->num_suspended_intf == chip->system_suspend) {
 		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 4f4f3f39b7fa..23d9e6fc69e7 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -207,7 +207,17 @@ struct snd_usb_stream {
 	struct list_head list;
 };
 
+struct snd_usb_platform_ops {
+	void (*connect_cb)(struct snd_usb_audio *chip);
+	void (*disconnect_cb)(struct snd_usb_audio *chip);
+	void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
+	void (*resume_cb)(struct usb_interface *intf);
+};
+
 struct snd_usb_stream *
 snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params,
 				  int direction);
+
+int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
+int snd_usb_unregister_platform_ops(void);
 #endif /* __USBAUDIO_CARD_H */
