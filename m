Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6408AD84D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 01:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74569826;
	Tue, 23 Apr 2024 01:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74569826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713826849;
	bh=JR0ZF5EDYUXpz8R4hkblJP6u43VvKOsnM14+Rf6RV5c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Glbmbb4RNUcZm5Pc42DH9ZOVGq5OeIC/athEsRItXc+L/tT5M5AYSDfJ/HX8Fxswp
	 ORhGCzpzXzpgG9mXuB+Jeln5LcmL1iUrORY7MiPft6rw6YXtKYDTiJOGzbsjAgXa56
	 UtJwYiAt+kxskivIRBZ4xOJznoji4SBO3KoUjg9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5CF0F898B6; Tue, 23 Apr 2024 00:51:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33629F898B0;
	Tue, 23 Apr 2024 00:51:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F203BF8977A; Tue, 23 Apr 2024 00:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DABF8F805B3
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 00:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DABF8F805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=EeEuT9Lh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43MMlRdR027826;
	Mon, 22 Apr 2024 22:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=U6yTRai6MgB2GPETs+Ty
	FrMcQ5en+GNfoNXS76nrBjk=; b=EeEuT9LhhRVu36I01mPuBBxm6U6QHhKbfQ7g
	Wi889Q6g17Wb4eeJ1+GtaYTmj8wWkGEQAdD3b6BR0pmDCC0HnF2TEBanklXBaDcf
	eGpCpDAiLs897Rb5uXDy+vBQ3iAm/tU4K+bt1nBJcqyqz+cCo1KlQO8YyeGXjU9X
	d9U9d5tDgo53mkzdFgipLKcxTd1/l1dhyWAe5pEFuQsYFBHu9Tk3Ab3+edKZ399p
	Z0yyZPw7/GKhD81afBPc6u3ve7zP6jzaklYUB5+0UE/Rn8fnTTeBYU87JFE1/Reo
	ovP7/HKMy+/ZYORa7wjoBNTfXG9pzB8Kus+naNaJsA2B4/snsg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnmuvhu4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43MMnJv3021877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 22:49:19 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Apr 2024 15:49:18 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v19 09/41] ASoC: Add SOC USB APIs for adding an USB backend
Date: Mon, 22 Apr 2024 15:48:34 -0700
Message-ID: <20240422224906.15868-10-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240422224906.15868-1-quic_wcheng@quicinc.com>
References: <20240422224906.15868-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cG5ip3ZdAlq3lkJgi6Q4_PVKjWx-9aQS
X-Proofpoint-ORIG-GUID: cG5ip3ZdAlq3lkJgi6Q4_PVKjWx-9aQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_16,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404220096
Message-ID-Hash: IOF4UOU6AGRBTUL5V7PABYOZWWIHELJ2
X-Message-ID-Hash: IOF4UOU6AGRBTUL5V7PABYOZWWIHELJ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOF4UOU6AGRBTUL5V7PABYOZWWIHELJ2/>
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

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  95 ++++++++++++++++
 sound/soc/Kconfig       |  10 ++
 sound/soc/Makefile      |   2 +
 sound/soc/soc-usb.c     | 239 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 346 insertions(+)
 create mode 100644 include/sound/soc-usb.h
 create mode 100644 sound/soc/soc-usb.c

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
new file mode 100644
index 000000000000..5b2fa0877523
--- /dev/null
+++ b/include/sound/soc-usb.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __LINUX_SND_SOC_USB_H
+#define __LINUX_SND_SOC_USB_H
+
+/**
+ * struct snd_soc_usb_device
+ * @card_idx - sound card index associated with USB device
+ * @chip_idx - USB sound chip array index
+ * @num_playback - number of playback streams
+ * @num_capture - number of capture streams
+ **/
+struct snd_soc_usb_device {
+	int card_idx;
+	int chip_idx;
+	int num_playback;
+	int num_capture;
+};
+
+/**
+ * struct snd_soc_usb
+ * @list - list head for SND SOC struct list
+ * @component - reference to ASoC component
+ * @num_supported_streams - number of supported concurrent sessions
+ * @connection_status_cb - callback to notify connection events
+ * @priv_data - driver data
+ **/
+struct snd_soc_usb {
+	struct list_head list;
+	struct snd_soc_component *component;
+	unsigned int num_supported_streams;
+	int (*connection_status_cb)(struct snd_soc_usb *usb,
+			struct snd_soc_usb_device *sdev, bool connected);
+	void *priv_data;
+};
+
+#if IS_ENABLED(CONFIG_SND_SOC_USB)
+const char *snd_soc_usb_get_components_tag(bool playback);
+
+int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
+int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
+void *snd_soc_usb_find_priv_data(struct device *dev);
+
+struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+					      int num_streams, void *data);
+void snd_soc_usb_free_port(struct snd_soc_usb *usb);
+int snd_soc_usb_add_port(struct snd_soc_usb *usb);
+int snd_soc_usb_remove_port(struct snd_soc_usb *usb);
+#else
+static inline const char *snd_soc_usb_get_components_tag(bool playback)
+{
+	return "";
+}
+
+static inline int snd_soc_usb_connect(struct device *usbdev,
+					struct snd_soc_usb_device *sdev)
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
+static inline void *snd_soc_usb_find_priv_data(struct device *dev)
+{
+	return NULL;
+}
+
+static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
+					      struct snd_soc_component *component,
+					      int num_streams, void *data)
+{
+	return ERR_PTR(-ENOMEM);
+}
+
+static inline void snd_soc_usb_free_port(struct snd_soc_usb *usb)
+{ }
+
+static inline int snd_soc_usb_add_port(struct snd_soc_usb *usb)
+{
+	return -EINVAL;
+}
+
+static inline int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
+{
+	return -ENODEV;
+}
+#endif /* IS_ENABLED(CONFIG_SND_SOC_USB) */
+#endif /*__LINUX_SND_SOC_USB_H */
diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 439fa631c342..848493a46831 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -76,6 +76,16 @@ config SND_SOC_UTILS_KUNIT_TEST
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
index 8376fdb217ed..4c3d8b720d22 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -31,6 +31,8 @@ endif
 
 obj-$(CONFIG_SND_SOC_ACPI) += snd-soc-acpi.o
 
+obj-$(CONFIG_SND_SOC_USB) += soc-usb.o
+
 obj-$(CONFIG_SND_SOC)	+= snd-soc-core.o
 obj-$(CONFIG_SND_SOC)	+= codecs/
 obj-$(CONFIG_SND_SOC)	+= generic/
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
new file mode 100644
index 000000000000..d21db2345966
--- /dev/null
+++ b/sound/soc/soc-usb.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/of.h>
+#include <linux/usb.h>
+#include <sound/soc.h>
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
+static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device_node *node)
+{
+	struct snd_soc_usb *ctx;
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
+/**
+ * snd_soc_usb_get_components_tag() - Retrieve SOC USB component tag
+ * @playback: direction of audio stream
+ *
+ * Returns the USB offload component tag used in the ASoC components
+ * string.
+ *
+ */
+const char *snd_soc_usb_get_components_tag(bool playback)
+{
+	if (playback)
+		return "usbplybkoffld: 1";
+	else
+		return "usbcapoffld: 1";
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_get_components_tag);
+
+/**
+ * snd_soc_usb_find_priv_data() - Retrieve private data stored
+ * @dev: device reference
+ *
+ * Fetch the private data stored in the USB SND SOC structure.
+ *
+ */
+void *snd_soc_usb_find_priv_data(struct device *dev)
+{
+	struct snd_soc_usb *ctx;
+	struct device_node *node;
+
+	node = snd_soc_find_phandle(dev);
+	if (!IS_ERR(node)) {
+		ctx = snd_soc_find_usb_ctx(node);
+		of_node_put(node);
+	} else {
+		/* Check if backend device */
+		ctx = snd_soc_find_usb_ctx(dev->of_node);
+	}
+
+	return ctx ? ctx->priv_data : NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
+
+/**
+ * snd_soc_usb_allocate_port() - allocate a SOC USB device
+ * @component: USB DPCM backend DAI component
+ * @num_streams: number of offloading sessions supported
+ * @data: private data
+ *
+ * Allocate and initialize a SOC USB device.  This will populate parameters that
+ * are used in subsequent sequences.
+ *
+ */
+struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+					      int num_streams, void *data)
+{
+	struct snd_soc_usb *usb;
+
+	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
+	if (!usb)
+		return ERR_PTR(-ENOMEM);
+
+	usb->component = component;
+	usb->priv_data = data;
+	usb->num_supported_streams = num_streams;
+
+	return usb;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
+
+/**
+ * snd_soc_usb_free_port() - free a SOC USB device
+ * @usb: allocated SOC USB device
+
+ * Free and remove the SOC USB device from the available list of devices.
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
+ * @dev: USB backend device
+ * @priv: private data
+ * @connection_cb: connection status callback
+ *
+ * Register a USB backend device to the SND USB SOC framework.  Memory is
+ * allocated as part of the USB backend device.
+ *
+ */
+int snd_soc_usb_add_port(struct snd_soc_usb *usb)
+{
+	mutex_lock(&ctx_mutex);
+	list_add_tail(&usb->list, &usb_ctx_list);
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
+
+/**
+ * snd_soc_usb_remove_port() - Remove a USB backend port
+ * @dev: USB backend device
+ *
+ * Remove a USB backend device from USB SND SOC.  Memory is freed when USB
+ * backend is removed.
+ *
+ */
+int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
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
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
+
+/**
+ * snd_soc_usb_connect() - Notification of USB device connection
+ * @usbdev: USB bus device
+ * @card_idx: USB SND card instance
+ *
+ * Notify of a new USB SND device connection.  The card_idx can be used to
+ * handle how the DPCM backend selects, which device to enable USB offloading
+ * on.
+ *
+ */
+int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+{
+	struct snd_soc_usb *ctx;
+	struct device_node *node;
+
+	if (!usbdev)
+		return -ENODEV;
+
+	node = snd_soc_find_phandle(usbdev);
+	if (IS_ERR(node))
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(node);
+	of_node_put(node);
+	if (!ctx)
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
+ *
+ * Notify of a new USB SND device disconnection to the USB backend.
+ *
+ */
+int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+{
+	struct snd_soc_usb *ctx;
+	struct device_node *node;
+
+	if (!usbdev)
+		return -ENODEV;
+
+	node = snd_soc_find_phandle(usbdev);
+	if (IS_ERR(node))
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(node);
+	of_node_put(node);
+	if (!ctx)
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
