Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8399F9CB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 23:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8ED3BC0;
	Tue, 15 Oct 2024 23:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8ED3BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729028261;
	bh=kuXvZj2O2+6sLb6+HCTWSvVJ9L05ubY9bD4DgQROLzQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VDWtx5IlW85Z7cUUTAdZ6qQd3WOkKnMSU4SbXnGDtojf5ROto31xNCXVeYwdLYDFX
	 xUQ57E7lkmfvf/nn8Gk95+c+mvZw8uaD6ocfChsmhu7seE6ti4DSFM3dEOO1BHqUgo
	 E5DGp8hZygplUHX1FObvpY9UCv7Cmw+D0yteaAek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EB89F89799; Tue, 15 Oct 2024 23:31:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68C70F8977E;
	Tue, 15 Oct 2024 23:31:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E439F80698; Tue, 15 Oct 2024 23:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1A79F805B1
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 23:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1A79F805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=kMeqxvJW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49FHpJbq007382;
	Tue, 15 Oct 2024 21:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5qz9jWyU4v1+Ht9Jgi80H4Z4CwhOfh2aqovq123O+U=; b=kMeqxvJWMbIzBys/
	2XabYM5jhDBlPT5RGyl15eaa3PwipXmmSrbPx3VD8E8ft6jq1Ulg2I5YIYw4k0ZW
	SZTVzCQBB3OzVwEYrapGpWxygdAPJrMhEg3Qt2PympTD1bqstfmeYhnUQIH0n77L
	letRCuQkuoVWzjBJpT2LQLRavG8xVjpJXKCFN4Mx8oK4ui78LQpI633n8QtkSro3
	5iKj6Zo/J3LQuLhAt0MTJFBNsi1Ad71Jh7tOJE50oEpul5MO6rE+KA9Fvzcq0DwZ
	Q4xWvNrqJ4bTojsjqdVmN6ON8xKGA8XtxFyvQkD6xpCMtsM1IKrgNwcd1TiUFcaG
	0vqTTQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh5287y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49FLTVXF030507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:30 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v29 15/33] ASoC: Add SOC USB APIs for adding an USB backend
Date: Tue, 15 Oct 2024 14:28:57 -0700
Message-ID: <20241015212915.1206789-16-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yuqcltY4t7cZYxs6CpzcADhNg7oXQ_Ek
X-Proofpoint-ORIG-GUID: yuqcltY4t7cZYxs6CpzcADhNg7oXQ_Ek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143
Message-ID-Hash: 2AMV5DVDXJNEODWQHCDR7R2KE7NV65MJ
X-Message-ID-Hash: 2AMV5DVDXJNEODWQHCDR7R2KE7NV65MJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AMV5DVDXJNEODWQHCDR7R2KE7NV65MJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some platforms may have support for offloading USB audio devices to a
dedicated audio DSP.  Introduce a set of APIs that allow for management of
USB sound card and PCM devices enumerated by the USB SND class driver.
This allows for the ASoC components to be aware of what USB devices are
available for offloading.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  97 ++++++++++++++++++
 sound/soc/Kconfig       |  10 ++
 sound/soc/Makefile      |   2 +
 sound/soc/soc-usb.c     | 218 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 327 insertions(+)
 create mode 100644 include/sound/soc-usb.h
 create mode 100644 sound/soc/soc-usb.c

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
new file mode 100644
index 000000000000..34240321bbca
--- /dev/null
+++ b/include/sound/soc-usb.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __LINUX_SND_SOC_USB_H
+#define __LINUX_SND_SOC_USB_H
+
+#include <sound/soc.h>
+
+/**
+ * struct snd_soc_usb_device
+ * @card_idx - sound card index associated with USB device
+ * @chip_idx - USB sound chip array index
+ * @cpcm_idx - capture PCM index array associated with USB device
+ * @ppcm_idx - playback PCM index array associated with USB device
+ * @num_capture - number of capture streams
+ * @num_playback - number of playback streams
+ * @list - list head for SoC USB devices
+ **/
+struct snd_soc_usb_device {
+	int card_idx;
+	int chip_idx;
+
+	/* PCM index arrays */
+	unsigned int *cpcm_idx; /* TODO: capture path is not tested yet */
+	unsigned int *ppcm_idx;
+	int num_capture; /* TODO: capture path is not tested yet */
+	int num_playback;
+
+	struct list_head list;
+};
+
+/**
+ * struct snd_soc_usb
+ * @list - list head for SND SOC struct list
+ * @component - reference to ASoC component
+ * @connection_status_cb - callback to notify connection events
+ * @priv_data - driver data
+ **/
+struct snd_soc_usb {
+	struct list_head list;
+	struct snd_soc_component *component;
+	int (*connection_status_cb)(struct snd_soc_usb *usb,
+				    struct snd_soc_usb_device *sdev,
+				    bool connected);
+	void *priv_data;
+};
+
+#if IS_ENABLED(CONFIG_SND_SOC_USB)
+int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
+int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
+void *snd_soc_usb_find_priv_data(struct device *usbdev);
+
+struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+					      void *data);
+void snd_soc_usb_free_port(struct snd_soc_usb *usb);
+void snd_soc_usb_add_port(struct snd_soc_usb *usb);
+void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
+#else
+static inline int snd_soc_usb_connect(struct device *usbdev,
+				      struct snd_soc_usb_device *sdev)
+{
+	return -ENODEV;
+}
+
+static inline int snd_soc_usb_disconnect(struct device *usbdev,
+					 struct snd_soc_usb_device *sdev)
+{
+	return -EINVAL;
+}
+
+static inline void *snd_soc_usb_find_priv_data(struct device *usbdev)
+{
+	return NULL;
+}
+
+static inline struct snd_soc_usb *
+snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
+{
+	return ERR_PTR(-ENOMEM);
+}
+
+static inline void snd_soc_usb_free_port(struct snd_soc_usb *usb)
+{ }
+
+static inline void snd_soc_usb_add_port(struct snd_soc_usb *usb)
+{
+	return -EINVAL;
+}
+
+static inline void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
+{
+	return -ENODEV;
+}
+#endif /* IS_ENABLED(CONFIG_SND_SOC_USB) */
+#endif /*__LINUX_SND_SOC_USB_H */
diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index a52afb423b46..c993705c8ac2 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -84,6 +84,16 @@ config SND_SOC_UTILS_KUNIT_TEST
 config SND_SOC_ACPI
 	tristate
 
+config SND_SOC_USB
+	tristate "SoC based USB audio offloading"
+	depends on SND_USB_AUDIO
+	help
+	  Enable this option if an ASoC platform card has support to handle
+	  USB audio offloading.  This enables the SoC USB layer, which will
+	  notifies the ASoC USB DPCM backend DAI link about available USB audio
+	  devices.  Based on the notifications, sequences to enable the audio
+	  stream can be taken based on the design.
+
 # All the supported SoCs
 source "sound/soc/adi/Kconfig"
 source "sound/soc/amd/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index fd61847dd1eb..adf9d9203778 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -35,6 +35,8 @@ endif
 
 obj-$(CONFIG_SND_SOC_ACPI) += snd-soc-acpi.o
 
+obj-$(CONFIG_SND_SOC_USB) += soc-usb.o
+
 obj-$(CONFIG_SND_SOC)	+= snd-soc-core.o
 obj-$(CONFIG_SND_SOC)	+= codecs/
 obj-$(CONFIG_SND_SOC)	+= generic/
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
new file mode 100644
index 000000000000..bd2d68164206
--- /dev/null
+++ b/sound/soc/soc-usb.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/of.h>
+#include <linux/usb.h>
+#include <sound/soc-usb.h>
+#include "../usb/card.h"
+
+static DEFINE_MUTEX(ctx_mutex);
+static LIST_HEAD(usb_ctx_list);
+
+static struct device_node *snd_soc_find_phandle(struct device *dev)
+{
+	struct device_node *node;
+
+	node = of_parse_phandle(dev->of_node, "usb-soc-be", 0);
+	if (!node)
+		return ERR_PTR(-ENODEV);
+
+	return node;
+}
+
+static struct snd_soc_usb *snd_soc_usb_ctx_lookup(struct device_node *node)
+{
+	struct snd_soc_usb *ctx;
+
+	if (!node)
+		return NULL;
+
+	mutex_lock(&ctx_mutex);
+	list_for_each_entry(ctx, &usb_ctx_list, list) {
+		if (ctx->component->dev->of_node == node) {
+			mutex_unlock(&ctx_mutex);
+			return ctx;
+		}
+	}
+	mutex_unlock(&ctx_mutex);
+
+	return NULL;
+}
+
+static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
+{
+	struct snd_soc_usb *ctx;
+	struct device_node *node;
+
+	node = snd_soc_find_phandle(dev);
+	if (!IS_ERR(node)) {
+		ctx = snd_soc_usb_ctx_lookup(node);
+		of_node_put(node);
+	} else {
+		ctx = snd_soc_usb_ctx_lookup(dev->of_node);
+	}
+
+	return ctx ? ctx : NULL;
+}
+
+/**
+ * snd_soc_usb_find_priv_data() - Retrieve private data stored
+ * @usbdev: device reference
+ *
+ * Fetch the private data stored in the USB SND SOC structure.
+ *
+ */
+void *snd_soc_usb_find_priv_data(struct device *usbdev)
+{
+	struct snd_soc_usb *ctx;
+
+	ctx = snd_soc_find_usb_ctx(usbdev);
+
+	return ctx ? ctx->priv_data : NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
+
+/**
+ * snd_soc_usb_allocate_port() - allocate a SOC USB port for offloading support
+ * @component: USB DPCM backend DAI component
+ * @num_streams: number of offloading sessions supported
+ * @data: private data
+ *
+ * Allocate and initialize a SOC USB port.  The SOC USB port is used to communicate
+ * different USB audio devices attached, in order to start audio offloading handled
+ * by an ASoC entity.  USB device plug in/out events are signaled with a
+ * notification, but don't directly impact the memory allocated for the SOC USB
+ * port.
+ *
+ */
+struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+					      void *data)
+{
+	struct snd_soc_usb *usb;
+
+	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
+	if (!usb)
+		return ERR_PTR(-ENOMEM);
+
+	usb->component = component;
+	usb->priv_data = data;
+
+	return usb;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
+
+/**
+ * snd_soc_usb_free_port() - free a SOC USB port used for offloading support
+ * @usb: allocated SOC USB port
+
+ * Free and remove the SOC USB port from the available list of ports.  This will
+ * ensure that the communication between USB SND and ASoC is halted.
+ *
+ */
+void snd_soc_usb_free_port(struct snd_soc_usb *usb)
+{
+	snd_soc_usb_remove_port(usb);
+	kfree(usb);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
+
+/**
+ * snd_soc_usb_add_port() - Add a USB backend port
+ * @usb: soc usb port to add
+ *
+ * Register a USB backend DAI link to the USB SOC framework.  Memory is allocated
+ * as part of the USB backend DAI link.
+ *
+ */
+void snd_soc_usb_add_port(struct snd_soc_usb *usb)
+{
+	mutex_lock(&ctx_mutex);
+	list_add_tail(&usb->list, &usb_ctx_list);
+	mutex_unlock(&ctx_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
+
+/**
+ * snd_soc_usb_remove_port() - Remove a USB backend port
+ * @usb: soc usb port to remove
+ *
+ * Remove a USB backend DAI link from USB SOC.  Memory is freed when USB backend
+ * DAI is removed, or when snd_soc_usb_free_port() is called.
+ *
+ */
+void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
+{
+	struct snd_soc_usb *ctx, *tmp;
+
+	mutex_lock(&ctx_mutex);
+	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
+		if (ctx == usb) {
+			list_del(&ctx->list);
+			break;
+		}
+	}
+	mutex_unlock(&ctx_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
+
+/**
+ * snd_soc_usb_connect() - Notification of USB device connection
+ * @usbdev: USB bus device
+ * @sdev: USB SND device to add
+ *
+ * Notify of a new USB SND device connection.  The sdev->card_idx can be used to
+ * handle how the DPCM backend selects, which device to enable USB offloading
+ * on.
+ *
+ */
+int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+{
+	struct snd_soc_usb *ctx;
+
+	if (!usbdev)
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(usbdev);
+	if (IS_ERR(ctx))
+		return -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, sdev, true);
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_connect);
+
+/**
+ * snd_soc_usb_disconnect() - Notification of USB device disconnection
+ * @usbdev: USB bus device
+ * @sdev: USB SND device to remove
+ *
+ * Notify of a new USB SND device disconnection to the USB backend.
+ *
+ */
+int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+{
+	struct snd_soc_usb *ctx;
+
+	if (!usbdev)
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(usbdev);
+	if (IS_ERR(ctx))
+		return -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, sdev, false);
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_disconnect);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SoC USB driver for offloading");
