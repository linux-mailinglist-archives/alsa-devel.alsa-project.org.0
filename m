Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D028AFDC47
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jul 2025 02:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F32DA601F6;
	Wed,  9 Jul 2025 02:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F32DA601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752020566;
	bh=xb+WjUz+lEEdvuqmh9rXRLz2uGGnmWbIOOnVKo/Xtgk=;
	h=From:To:Cc:Subject:Date:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sFn4ra+y3JHA3g6Y1lJpRajy5Gf9RMOuddJBbxfImK2qNKHTC33mL+0l0TV1AIIfm
	 EZILgdkSxrO5eIDTd+ILg/7uiDsmIO9ueCiIcwjGjqSDKqlNWdIJ/oCAKolcAIP/i6
	 Mh8LwI9ukacEFzlGAIPhFYd/mXYSVfMbCyi5QLKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1235CF80254; Wed,  9 Jul 2025 02:22:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF76F805B5;
	Wed,  9 Jul 2025 02:22:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCEBBF804F2; Wed,  9 Jul 2025 02:22:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B77B4F800E4
	for <alsa-devel@alsa-project.org>; Wed,  9 Jul 2025 02:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B77B4F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=efs/NAjg
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250709002152epoutp01382f76e004171e5097b85ef01c4e8139~QbV_CmT0G1552215522epoutp01G
	for <alsa-devel@alsa-project.org>; Wed,  9 Jul 2025 00:21:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250709002152epoutp01382f76e004171e5097b85ef01c4e8139~QbV_CmT0G1552215522epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752020512;
	bh=F6OYWVPAwdzfoNMORMWcRQkwJY9pihVX6JYS/KO/YSo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=efs/NAjg5y5Bn131tVxPuYkyl5La99HWAGS4kOb/4nIW54ddMe7fmUPyAQQjLh2ou
	 KuOT2m/Wr2WS14fBuvfvDZUDTT+yrha9VSDDadrVA/tAY/YP3S2fGfx3ns2iMWMI1R
	 8pnozXoKv840HbgdyVNyyeMeuuMmtjPYtrau5Lio=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250709002151epcas2p3d16e2fa3daddbc27ec0ca5cb52c151eb~QbV9pPffb0865008650epcas2p3w;
	Wed,  9 Jul 2025 00:21:51 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bcJZ659c0z2SSKZ; Wed,  9 Jul
	2025 00:21:50 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250709002150epcas2p467416bdbc16754726599a0cacb1feecc~QbV8S1R_a1045510455epcas2p4E;
	Wed,  9 Jul 2025 00:21:50 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250709002150epsmtip1065851fc540dddf908051e2e773133e6~QbV8Nnik_3069530695epsmtip1W;
	Wed,  9 Jul 2025 00:21:50 +0000 (GMT)
From: ew.kim@samsung.com
To: s.nawrocki@samsung.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, ew kim <ew.kim@samsung.com>
Subject: [PATCH] ASoC: samsung: Implement abox generic structure
Date: Wed,  9 Jul 2025 09:10:02 +0900
Message-Id: <20250709001002.378246-1-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250709002150epcas2p467416bdbc16754726599a0cacb1feecc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250709002150epcas2p467416bdbc16754726599a0cacb1feecc
References: 
 <CGME20250709002150epcas2p467416bdbc16754726599a0cacb1feecc@epcas2p4.samsung.com>
Message-ID-Hash: MEWX6NEEVXWFZS5VZZ5HQIHAZXH22ZHQ
X-Message-ID-Hash: MEWX6NEEVXWFZS5VZZ5HQIHAZXH22ZHQ
X-MailFrom: ew.kim@samsung.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEWX6NEEVXWFZS5VZZ5HQIHAZXH22ZHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ew kim <ew.kim@samsung.com>

Implemet basic abox generic drivers.
This driver is a management driver for the generic drivers used in
Automotive Abox, connecting them to SOC drivers.
It supports various Exynos Automotive SOCs.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 sound/soc/samsung/Kconfig                     |   2 +
 sound/soc/samsung/Makefile                    |   1 +
 sound/soc/samsung/auto_abox/Kconfig           |  14 +
 sound/soc/samsung/auto_abox/generic/Kbuild    |  12 +
 .../samsung/auto_abox/generic/abox_generic.c  | 568 ++++++++++++++++++
 .../auto_abox/generic/include/abox_generic.h  |  87 +++
 6 files changed, 684 insertions(+)
 create mode 100644 sound/soc/samsung/auto_abox/Kconfig
 create mode 100644 sound/soc/samsung/auto_abox/generic/Kbuild
 create mode 100644 sound/soc/samsung/auto_abox/generic/abox_generic.c
 create mode 100644 sound/soc/samsung/auto_abox/generic/include/abox_generic.h

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 60b4b7b75215..359aa67f49db 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -148,4 +148,6 @@ config SND_SOC_SAMSUNG_MIDAS_WM1811
 	help
 	  Say Y if you want to add support for SoC audio on the Midas boards.
 
+source "sound/soc/samsung/auto_abox/Kconfig"
+
 endif #SND_SOC_SAMSUNG
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 8d5f09147900..5d99cfbfa71c 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_SND_SOC_ARNDALE) += snd-soc-arndale.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994) += snd-soc-aries-wm8994.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811) += snd-soc-midas-wm1811.o
+obj-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) += auto_abox/generic/
\ No newline at end of file
diff --git a/sound/soc/samsung/auto_abox/Kconfig b/sound/soc/samsung/auto_abox/Kconfig
new file mode 100644
index 000000000000..d5f565d3d9c2
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/Kconfig
@@ -0,0 +1,14 @@
+#: SPDX-License-Identifier: GPL-2.0-only
+
+menu "Exynosauto Automotive Abox Modules Options"
+
+config SND_SOC_SAMSUNG_AUTO_ABOX
+	tristate "ASoC support for Samsung Exynosauto Automotive ABOX Audio"
+	select SND_SOC_COMPRESS
+	help
+		Say Y or M if you want to add support for codecs attached to
+		the Samsung SoC Auto ABOX interface. You will also need to
+		select the audio interfaces to support below.
+
+endmenu
+
diff --git a/sound/soc/samsung/auto_abox/generic/Kbuild b/sound/soc/samsung/auto_abox/generic/Kbuild
new file mode 100644
index 000000000000..fa6ba7091730
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/Kbuild
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+# Exynosauto Automotive Abox Driver Support
+
+snd-soc-samsung-abox-generic-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) := \
+	abox_generic.o
+
+ccflags-y += -I./include
+
+obj-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) += \
+	snd-soc-samsung-abox-generic.o
+
+
diff --git a/sound/soc/samsung/auto_abox/generic/abox_generic.c b/sound/soc/samsung/auto_abox/generic/abox_generic.c
new file mode 100644
index 000000000000..c4588e0a6a60
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/abox_generic.c
@@ -0,0 +1,568 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ *        http://www.samsung.com/
+ *
+ * EXYNOS - sound/soc/samsung/auto_abox/generic/abox_generic.c
+ */
+
+//#define DEBUG
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/delay.h>
+#include <linux/suspend.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm_params.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/sched/clock.h>
+#include <linux/ktime.h>
+#include <linux/iommu.h>
+#include <linux/clk-provider.h>
+#include <linux/kmod.h>
+#include <linux/umh.h>
+#include <linux/string.h>
+
+#include "include/abox_generic.h"
+
+static struct abox_generic_data *g_abox_generic_data;
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox_generic}
+ * @ALM_Link {work item url}
+ * @purpose "get value from virtual address"
+ * @logic "return global abox_generic_data"
+ * \image html
+ * @params
+ * @param{in, -, -, -}
+ * @endparam
+ * @retval {-, struct *abox_generic_data, !NULL, NULL}
+ */
+struct abox_generic_data *abox_generic_get_abox_generic_data(void)
+{
+	return g_abox_generic_data;
+}
+
+static struct abox_generic_data *abox_generic_get_generic_data_from_child(struct device *child_dev)
+{
+	struct device *generic_dev = child_dev->parent;
+	struct abox_generic_data *generic_data = NULL;
+
+	if (!generic_dev) {
+		pr_err("%s Failed to get generic device\n", __func__);
+		return NULL;
+	}
+	generic_data = dev_get_drvdata(generic_dev);
+	if (!generic_data) {
+		dev_err(generic_dev, "%s Failed to get generic data\n", __func__);
+		return NULL;
+	}
+	return generic_data;
+}
+
+int abox_generic_set_dma_buffer(struct device *pcm_dev)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+	int ret = 0;
+
+	if (!generic_data) {
+		dev_err(pcm_dev, "%s Failed to get generic data\n", __func__);
+		return 0;
+	}
+
+	if (!generic_data->soc_ioctl) {
+		dev_err(pcm_dev, "%s Failed to get soc_ioctl\n", __func__);
+		return 0;
+	}
+	ret = generic_data->soc_ioctl(generic_data->soc_dev, ABOX_SOC_IOCTL_SET_DMA_BUFFER, pcm_dev);
+
+	return ret;
+}
+
+int abox_generic_set_pp_pointer(struct device *pcm_dev)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+	int ret = 0;
+
+	if (!generic_data) {
+		dev_err(pcm_dev, "%s Failed to get generic data\n", __func__);
+		return 0;
+	}
+	if (!generic_data->soc_ioctl) {
+		dev_err(pcm_dev, "%s Failed to get soc_ioctl\n", __func__);
+		return 0;
+	}
+	ret = generic_data->soc_ioctl(generic_data->soc_dev, ABOX_SOC_IOCTL_SET_PP_POINTER, pcm_dev);
+
+	return ret;
+}
+
+int abox_generic_attach_soc_callback(struct device *soc_dev,
+	SOC_IOCTL soc_ioctl)
+{
+	struct abox_generic_data *generic_data = ABOX_GENERIC_DATA;
+
+	dev_info(soc_dev, "%s(%d) Attach SoC IOCTL\n", __func__, __LINE__);
+	if (!generic_data) {
+		dev_err(soc_dev, "%s Generic Drv is not ready\n", __func__);
+		return -ENODATA;
+	}
+	generic_data->soc_dev = soc_dev;
+	generic_data->soc_ioctl = soc_ioctl;
+
+	generic_data->num_of_rdma = generic_data->soc_ioctl(generic_data->soc_dev,
+		ABOX_SOC_IOCTL_GET_NUM_OF_RDMA, NULL);
+	generic_data->num_of_wdma = generic_data->soc_ioctl(generic_data->soc_dev,
+		ABOX_SOC_IOCTL_GET_NUM_OF_WDMA, NULL);
+	generic_data->num_of_uaif = generic_data->soc_ioctl(generic_data->soc_dev,
+		ABOX_SOC_IOCTL_GET_NUM_OF_UAIF, NULL);
+	dev_info(soc_dev, "%s(%d) num_of_rdma:%d\n", __func__, __LINE__, generic_data->num_of_rdma);
+	dev_info(soc_dev, "%s(%d) num_of_wdma:%d\n", __func__, __LINE__, generic_data->num_of_wdma);
+	dev_info(soc_dev, "%s(%d) num_of_uaif:%d\n", __func__, __LINE__, generic_data->num_of_uaif);
+
+	return 0;
+}
+EXPORT_SYMBOL(abox_generic_attach_soc_callback);
+
+struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id, int stream_type)
+{
+	struct abox_generic_data *generic_data = ABOX_GENERIC_DATA;
+	struct platform_device **pdev_pcm = NULL;
+
+	if (stream_type == SNDRV_PCM_STREAM_PLAYBACK)
+		pdev_pcm = generic_data->pdev_pcm_playback;
+	else
+		pdev_pcm = generic_data->pdev_pcm_capture;
+
+	return pdev_pcm[pcm_id];
+}
+EXPORT_SYMBOL(abox_generic_get_pcm_platform_dev);
+
+int abox_generic_get_num_of_pcm(int stream_type)
+{
+	struct abox_generic_data *generic_data = ABOX_GENERIC_DATA;
+
+	if (!generic_data) {
+		pr_err("%s Failed to get abox_generic_data\n", __func__);
+		return -ENODATA;
+	}
+
+	return (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ? generic_data->num_of_pcm_playback :
+		generic_data->num_of_pcm_capture;
+}
+EXPORT_SYMBOL(abox_generic_get_num_of_pcm);
+
+int abox_generic_get_num_of_i2s_dummy(void)
+{
+	struct abox_generic_data *generic_data = ABOX_GENERIC_DATA;
+
+	if (!generic_data) {
+		pr_err("%s Failed to get abox_generic_data\n", __func__);
+		return -ENODATA;
+	}
+
+	return generic_data->num_of_i2s_dummy;
+}
+EXPORT_SYMBOL(abox_generic_get_num_of_i2s_dummy);
+
+int abox_generic_get_num_of_dma(struct device *pcm_dev, int stream_type)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+
+	return (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		generic_data->num_of_rdma : generic_data->num_of_wdma;
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox generic}
+ * @ALM_Link {work item url}
+ * @purpose "Registering the pcm_playback/pcm_capture pdev to abox driver"
+ * @logic "Get the pcm playback instance and update the pcm playback/capture id and
+ * increament the pcm playback/capture count"
+ * \image html
+ * @params
+ * @param{in, pdev_pcm_dev, struct platform_device *, !NULL}
+ * @param{in, id, unsigned int, 0 ~ 32}
+ * @param{in, stream_type, int, 0 ~ 1}
+ * @endparam
+ * @retval{ret, int, Undefined, 0, <0}
+ */
+int abox_generic_register_pcm_dev(struct platform_device *pdev_pcm,
+	unsigned int id, int stream_type)
+{
+	struct device *pcm_dev = &pdev_pcm->dev;
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+	int num_of_pcm_dev = 0;
+
+	dev_dbg(pcm_dev, "[%s] PCM%d Attached Stream_type:%d\n", __func__, id, stream_type);
+	num_of_pcm_dev = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		generic_data->num_of_pcm_playback : generic_data->num_of_pcm_capture;
+	if (id >= num_of_pcm_dev) {
+		dev_err(pcm_dev, "%s: invalid id(%u) : Stream Type:%d\n", __func__, id, stream_type);
+		return -EINVAL;
+	}
+
+	if (stream_type == SNDRV_PCM_STREAM_PLAYBACK)
+		generic_data->pdev_pcm_playback[id] = pdev_pcm;
+	else
+		generic_data->pdev_pcm_capture[id] = pdev_pcm;
+
+	return 0;
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox}
+ * @ALM_Link {work item url}
+ * @purpose "finding struct device of frontend from backend"
+ * @logic "get device of backend using component and alsa macro"
+ * \image html audio-interface_abox_abox_find_fe_dev_from_rtd.png
+ * @params
+ * @param{in, be, struct snd_soc_pcm_runtime *, -}
+ * @endparam
+ * @retval {-, struct device *, !NULL, NULL}
+ */
+struct device *abox_generic_find_fe_dev_from_rtd(struct snd_soc_pcm_runtime *be)
+{
+	struct abox_generic_data *generic_data = ABOX_GENERIC_DATA;
+	struct snd_soc_dpcm *dpcm = NULL;
+	struct snd_soc_pcm_runtime *fe = NULL;
+	int stream_type = 0;
+
+	if (!generic_data)
+		return NULL;
+
+	for (stream_type = 0; stream_type <= SNDRV_PCM_STREAM_LAST; stream_type++) {
+		int cmpnt_index = 0;
+		struct snd_soc_component *component = NULL;
+
+		for_each_dpcm_fe(be, stream_type, dpcm) {
+			fe = dpcm->fe;
+			if (fe)
+				break;
+		}
+		if (!fe)
+			continue;
+
+		for_each_rtd_components(fe, cmpnt_index, component) {
+			struct platform_device **pdev = NULL;
+			int num_of_pcm_dev = 0;
+			int i = 0;
+
+			if (stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+				num_of_pcm_dev = generic_data->num_of_pcm_playback;
+				pdev = generic_data->pdev_pcm_playback;
+			} else {
+				num_of_pcm_dev = generic_data->num_of_pcm_capture;
+				pdev = generic_data->pdev_pcm_capture;
+			}
+			for (i = 0; i < num_of_pcm_dev; i++)
+				if (pdev[i] && component->dev == &pdev[i]->dev)
+					return component->dev;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(abox_generic_find_fe_dev_from_rtd);
+
+int abox_generic_request_soc_ioctl(struct device *generic_dev, enum abox_soc_ioctl_cmd cmd,
+	void *data)
+{
+	struct abox_generic_data *generic_data = dev_get_drvdata(generic_dev);
+	struct device *soc_dev = generic_data->soc_dev;
+
+	if (IS_ERR_OR_NULL(soc_dev)) {
+		dev_err(generic_dev, "%s SoC Device is not ready\n", __func__);
+		return -ENODATA;
+	}
+	return generic_data->soc_ioctl(soc_dev, cmd, data);
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox generic}
+ * @ALM_Link
+ * @purpose "suspend of the abox generic to be called by S2R"
+ * @logic
+ * \image html
+ * @params
+ * @param{in, dev, struct device *, !NULL}
+ * @endparam
+ * @retval{ret, int, Undefined, 0, <0}
+ */
+static int abox_generic_suspend(struct device *dev)
+{
+	struct abox_generic_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+
+	dev_info(dev, "%s start\n", __func__);
+	if (!data) {
+		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
+		return -ENODATA;
+	}
+
+	dev_info(dev, "%s end\n", __func__);
+
+	return ret;
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox generic}
+ * @ALM_Link
+ * @purpose "Resume the abox generic during S2R operation"
+ * @logic
+ * \image html
+ * @params
+ * @param{in, dev, struct device *, !NULL}
+ * @endparam
+ * @retval{ret, int, Undefined, 0, <0}
+ */
+static int abox_generic_resume(struct device *dev)
+{
+	struct abox_generic_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+
+	dev_info(dev, "%s start\n", __func__);
+	if (!data) {
+		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
+		return -ENODATA;
+	}
+
+	dev_info(dev, "%s end\n", __func__);
+	return ret;
+}
+
+static struct platform_driver *abox_generic_sub_drivers[] = {
+};
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox}
+ * @ALM_Link {work item url}
+ * @purpose "Read property from device tree node"
+ * @logic
+ * \image html
+ * @params
+ * @param{in, dev, struct:: device *, !NULL}
+ * @param{in, dev->of_node, struct:: device_node, !NULL}
+ * @param{out, data->num_of_pcm_playback, unsigned int, 0}
+ * @param{out, data->num_of_pcm_capture, unsigned int, 0}
+ * @param{out, data->num_of_i2s_dummy, unsigned int, 0}
+ * @param{out, abox_sfr_set, int, 0}
+ * @endparam
+ * @retval{ret, int, 0, 0, > 0}
+ */
+static int abox_generic_read_property_from_dt(struct device *dev, struct abox_generic_data *data)
+{
+	struct device_node *np = dev->of_node;
+	int ret = 0;
+
+	ret = of_property_read_u32(np, "samsung,num-of-pcm_playback", &data->num_of_pcm_playback);
+	if (ret < 0) {
+		dev_err(dev, "%s property reading fail\n", "samsung,num-of-pcm_playback");
+		return ret;
+	}
+	ret = of_property_read_u32(np, "samsung,num-of-pcm_capture", &data->num_of_pcm_capture);
+	if (ret < 0) {
+		dev_err(dev, "%s property reading fail\n", "samsung,num-of-pcm_capture");
+		return ret;
+	}
+	ret = of_property_read_u32(np, "samsung,num-of-i2s-dummy-backend", &data->num_of_i2s_dummy);
+	if (ret < 0) {
+		dev_err(dev, "%s property reading fail\n", "samsung,num-of-i2s-dummy-backend");
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox generic}
+ * @ALM_Link {work item url}
+ * @purpose "Allocate memory for abox generic"
+ * @logic
+ * \image html
+ * @params
+ * @param{in, dev, struct:: device *, !NULL}
+ * @param{in, data, struct:: abox_gneric_data, !NULL}
+ * @param{out, data->pdev_pcm_playback, struct:: platform_device, !NULL}
+ * @param{out, data->pdev_pcm_capture, struct:: platform_device, !NULL}
+ * @endparam
+ * @retval{ret, int, 0, 0, > 0}
+ */
+static int abox_generic_allocate_memory(struct device *dev, struct abox_generic_data *data)
+{
+	int ret = 0;
+
+	data->pdev_pcm_playback = devm_kzalloc(dev,
+		sizeof(struct platform_device *) * data->num_of_pcm_playback, GFP_KERNEL);
+	if (!data->pdev_pcm_playback) {
+		dev_err(dev, "%s Can't allocate memory for pdev_pcm_playback\n", __func__);
+		ret = -ENOMEM;
+		return ret;
+	}
+	data->pdev_pcm_capture = devm_kzalloc(dev,
+		sizeof(struct platform_device *) * data->num_of_pcm_capture, GFP_KERNEL);
+	if (!data->pdev_pcm_capture) {
+		dev_err(dev, "%s Can't allocate memory for pdev_pcm_capture\n", __func__);
+		ret = -ENOMEM;
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox generic}
+ * @ALM_Link {work item url}
+ * @purpose "Probing the abox generic"
+ * @logic
+ * \image html
+ * @params
+ * @param{in, pdev, struct platform_device *, !NULL}
+ * @param{in, pdev->dev, struct:: device, !NULL}
+ * @endparam
+ * @retval{ret, int, 0, 0, > 0}
+ */
+static int samsung_abox_generic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct abox_generic_data *data;
+	int ret = 0;
+
+	dev_info(dev, "%s\n", __func__);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		return -ENOMEM;
+	}
+
+	data->pdev = pdev;
+	ret = abox_generic_read_property_from_dt(dev, data);
+	if (ret < 0) {
+		dev_err(dev, "%s Failed to read property. ret:%d\n", __func__, ret);
+		return ret;
+	}
+	ret = abox_generic_allocate_memory(dev, data);
+	if (ret < 0) {
+		dev_err(dev, "%s Failed to allocate memory. ret:%d\n", __func__, ret);
+		return ret;
+	}
+	g_abox_generic_data = data;
+	platform_set_drvdata(pdev, data);
+
+	platform_register_drivers(abox_generic_sub_drivers, ARRAY_SIZE(abox_generic_sub_drivers));
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to populate sub-platform_devices. ret:%d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox generic}
+ * @ALM_Link {work item url}
+ * @purpose "Disbaling the abox generic"
+ * @logic "Disbale the abox generic"
+ * \image html
+ * @params
+ * @param{in, pdev->dev, struct::device, !NULL}
+ * @endparam
+ * @noret
+ */
+static void samsung_abox_generic_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct abox_generic_data *data = dev_get_drvdata(dev);
+
+	dev_info(dev, "%s\n", __func__);
+
+	if (!data) {
+		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
+		return;
+	}
+	return;
+}
+
+/**
+ * @cnotice
+ * @prdcode
+ * @Sub_SW_Component{abox generic}
+ * @ALM_Link {work item url}
+ * @purpose "shutdown of the abox generic"
+ * @logic "Disbale the abox hardware by calling the following function
+ * pm_runtime_disable(dev)"
+ * \image html
+ * @params
+ * @param{in, pdev->dev, struct:: device, !NULL}
+ * @endparam
+ * @noret
+ */
+static void samsung_abox_generic_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct abox_generic_data *data = dev_get_drvdata(dev);
+
+	if (!data) {
+		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
+		return;
+	}
+	return;
+}
+
+static const struct of_device_id samsung_abox_generic_match[] = {
+	{
+		.compatible = "samsung,abox_generic",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, samsung_abox_generic_match);
+
+static const struct dev_pm_ops samsung_abox_generic_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(abox_generic_suspend, abox_generic_resume)
+};
+
+struct platform_driver samsung_abox_generic_driver = {
+	.probe  = samsung_abox_generic_probe,
+	.remove = samsung_abox_generic_remove,
+	.shutdown = samsung_abox_generic_shutdown,
+	.driver = {
+		.name = "samsung-abox-generic",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(samsung_abox_generic_match),
+		.pm = &samsung_abox_generic_pm,
+	},
+};
+
+module_platform_driver(samsung_abox_generic_driver);
+/* Module information */
+MODULE_AUTHOR("Eunwoo Kim, <ew.kim@samsung.com>");
+MODULE_DESCRIPTION("Samsung ASoC A-Box Generic Driver");
+MODULE_ALIAS("platform:samsung-abox-generic");
+MODULE_LICENSE("GPL v2");
+
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
new file mode 100644
index 000000000000..1c954272e2b5
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ALSA SoC - Samsung ABOX Share Function and Data structure
+ * for Exynos specific extensions
+ *
+ * Copyright (C) 2013-2020 Samsung Electronics Co., Ltd.
+ *
+ * EXYNOS - sound/soc/samsung/abox/include/abox_generic.h
+ */
+
+#ifndef __SND_SOC_ABOX_GENERIC_BASE_H
+#define __SND_SOC_ABOX_GENERIC_BASE_H
+
+#define ABOX_GENERIC_DATA		abox_generic_get_abox_generic_data();
+
+struct snd_soc_pcm_runtime;
+
+enum abox_soc_ioctl_cmd {
+	ABOX_SOC_IOCTL_GET_NUM_OF_RDMA,
+	ABOX_SOC_IOCTL_GET_NUM_OF_WDMA,
+	ABOX_SOC_IOCTL_GET_NUM_OF_UAIF,
+	ABOX_SOC_IOCTL_GET_SOC_TIMER,
+	ABOX_SOC_IOCTL_SET_DMA_BUFFER,
+	ABOX_SOC_IOCTL_SET_PP_POINTER,
+	ABOX_SOC_IOCTL_SET_PERF_PERIOD,
+	ABOX_SOC_IOCTL_CHECK_TIME_MUTEX,
+	ABOX_SOC_IOCTL_CHECK_TIME_NO_MUTEX,
+	ABOX_SOC_IOCTL_PCM_DUMP_INTR,
+	ABOX_SOC_IOCTL_PCM_DUMP_CLOSE,
+	ABOX_SOC_IOCTL_PCM_DUMP_ADD_CONTROL,
+	ABOX_SOC_IOCTL_MAX
+};
+
+typedef int (*SOC_IOCTL)(struct device *soc_dev, enum abox_soc_ioctl_cmd cmd, void *data);
+
+struct abox_generic_data {
+	struct platform_device *pdev;
+	struct platform_device **pdev_pcm_playback;
+	struct platform_device **pdev_pcm_capture;
+	unsigned int num_of_pcm_playback;
+	unsigned int num_of_pcm_capture;
+	unsigned int num_of_i2s_dummy;
+	unsigned int num_of_rdma;
+	unsigned int num_of_wdma;
+	unsigned int num_of_uaif;
+	struct device *soc_dev;
+	SOC_IOCTL soc_ioctl;
+};
+
+
+/************ Internal API ************/
+
+struct abox_generic_data *abox_generic_get_abox_generic_data(void);
+
+int abox_generic_set_dma_buffer(struct device *pcm_dev);
+
+int abox_generic_request_soc_ioctl(struct device *generic_dev, enum abox_soc_ioctl_cmd cmd,
+	void *data);
+
+int abox_generic_set_pp_pointer(struct device *pcm_dev);
+
+
+
+
+/************ External API ************/
+
+extern struct device *abox_generic_find_fe_dev_from_rtd(struct snd_soc_pcm_runtime *be);
+
+extern struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id,
+	int stream_type);
+
+extern int abox_generic_get_num_of_pcm(int stream_type);
+
+extern int abox_generic_get_num_of_i2s_dummy(void);
+
+extern int abox_generic_get_num_of_dma(struct device *pcm_dev,
+	int stream_type);
+
+extern int abox_generic_attach_soc_callback(struct device *soc_dev,
+	SOC_IOCTL soc_ioctl);
+
+extern int abox_generic_register_pcm_dev(struct platform_device *pdev_pcm_dev,
+	unsigned int id, int stream_type);
+
+
+#endif //__SND_SOC_ABOX_GENERIC_BASE_H
+
-- 
2.25.1

