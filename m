Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B59971A2FEE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 09:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F646167C;
	Thu,  9 Apr 2020 09:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F646167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586416946;
	bh=qw89XQzqUkY536p+uv/vjAfivsEM3QUhhmgkyyOLR+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RcEjiFonYijumdIkwNgVdCeFY9y+cfVX6UIHvgCqQj9+LKYhy6B4j4HfUPkGUiSqZ
	 aqh55G6/UoQOgfBNk6iL4IYI18ahB0kZ8w647f8kmd4Gy3qyXSVS32ZKdcKMWmO8dV
	 9k96bc3Aw41hyo4EqJAwnaLdiiBDuZCheUZEAFeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 265BCF80291;
	Thu,  9 Apr 2020 09:19:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E4D1F801F9; Thu,  9 Apr 2020 09:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E718F800CB
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 09:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E718F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="QqJBJoDV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkVN0UjPuou3B5rPRdJ1DN5XBeRjBrtlutr6FPrpkRQbWSBV7Q6FOhFWeEsxuZdp8g2kAYAK1knXVqO+0cVl3jASmVvMHMc/isabbytFh6m0H0aSzF1YYK94ciGq1+e05UvPKTWg8nMYb88jD/kWyE4JdSPvx/8i5553IKR8yiB1QK6/jmmus63SOiS07Kp7GePRU/mvsKpAe0Qn78aHqnBorj5bfYLpZfngcPb/JZDfOJejQoAwDTWKpe69BMWUUeBQQo6UyiJtu0+TATuur9ngaYl0XYNt9H4VxCZ1aZVoxG8zZQMBhR43c6ZD+KzoknG7xsksKaerZiC8r4frdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38NP0S8wJQtmMN3ElfzXcDF5/EVNSf/MQU/eD4K792k=;
 b=itXXytR4uUJpw8AiYGF5uKyivISCmwyePIAaP6Ha/+JC4NrYtPn7lSxYWtPCtPyurMdC66o/0fLaqPG9O0TFwfL+qkmMD2LM18B+nlCEpNmDRz+sZPQ3oyjBmdqzB6P26sn0dTQ+2oPuA8RxchD153u/7xKLU/TS0ww+my6UytLgU/xk/SVUYIAkHWH0/EGJaI7wpU245jeOrdcINExPQr4rvAUrrR8ys8VGHV1sLmYc6kaO+FsykeSBMNTXgViKRm1iXPH9hes3kzuAo1VPEwVc9nwhrhT7HnTbIalNseRJYL9x1lod9J+JRuev1tfnE+Rg1CQXoEG0Nb7hmNuGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38NP0S8wJQtmMN3ElfzXcDF5/EVNSf/MQU/eD4K792k=;
 b=QqJBJoDVyCBYV8rAQwTd9LfadONarz65rQ6IF2nrcZEd8uqkDavVzeiJwf7ymV+2BohtEsnqtXpjd8GP5YSC5fK2IfKpX6dH34+pdRqUY545qurpk2hG4yyk3KE1/FzaK8V+c0mlxiOknEMZQ9qCOlhgh0TvN/0wQsL8oxhJ5bw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com (2603:10a6:8:3::30)
 by DB3PR0402MB3756.eurprd04.prod.outlook.com (2603:10a6:8:12::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Thu, 9 Apr
 2020 07:18:52 +0000
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c]) by DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c%7]) with mapi id 15.20.2878.023; Thu, 9 Apr 2020
 07:18:52 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 3/5] ASoC: SOF: imx: Add i.MX8M HW support
Date: Thu,  9 Apr 2020 10:18:30 +0300
Message-Id: <20200409071832.2039-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409071832.2039-1-daniel.baluta@oss.nxp.com>
References: <20200409071832.2039-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM4P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::12) To DB3PR0402MB3835.eurprd04.prod.outlook.com
 (2603:10a6:8:3::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 07:18:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e6b067a-1d56-4fe6-1977-08d7dc56419b
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3756:|DB3PR0402MB3756:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB37563170BC93512F1F41BA5EB8C10@DB3PR0402MB3756.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0402MB3835.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(4326008)(5660300002)(478600001)(316002)(26005)(1076003)(66476007)(6512007)(81156014)(81166007)(66556008)(6506007)(2906002)(66946007)(52116002)(956004)(2616005)(8936002)(6916009)(6486002)(8676002)(86362001)(6666004)(186003)(16526019)(44832011);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /CTPHpygRC4fRnmo6N4dtVhptRdJqGpYnPbpuUTGCKhfn+cQKf2nyYKd0Uy9979ZXWcuRsLYMn0yEjHZxEeDT630lFlexQ4RG8d3jEhDKTqsPTnGrzfQjnBiLsoKj7Iq281FfB/D1OUL+mWiHqfdZG29GuzdPjT6X7M4yPzIKuetlL3kxBJ7N4mG7yD9MrTdHhZE1TMGqf2z9jI6PWTcqSuLE2RIaA+VM0KGoycq1yrBJ8MifofL16NLQDkeIR/pBz+OFvAvbF6ZbFPkfmkbfbvpvn16lNunjtCUj6TwdOtnWeWM4JfThyB9+2/rApdb5HjmhjLwB18CeyslaYj0kXktb1CkWBPyNIuObL7kyyyDcoalSTD89KSgz0eHut3orYS9D/6WjrmtkKx9tK9m218ppxJnXYNp/1vPiHqnicJWCnhVUESGTsv0lnXLKPTh
X-MS-Exchange-AntiSpam-MessageData: 5mHV9UiDcCWcBB5LDLMpzeoxt34tkmiN8W0RZAq8C5XS++spYszOAcmId8x8QoRR7lU43UAXsq7etsfiYYAwOqUJNtHKYDEDwbdwWKSb73/LxkLDjxFlPVvwMU++uODXmUxL9SO1yHv3dejG5WouBA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6b067a-1d56-4fe6-1977-08d7dc56419b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 07:18:52.3735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX9s1cdPqzLMfIzjjhW+dNXjQhXeonVjBF6f/gUjLPsiTq00CSg2oXmNd4SOb7uPwmvjE6gZKvrJmIvHRJLlAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3756
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 shengjiu.wang@nxp.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-imx@nxp.com, festevam@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This adds skeleton support for the audio DSP hardware found on NXP i.MX8M
platform.

There is one notable difference between i.MX8M and i.MX8, which doesn't
allow us to reuse HW support from imx8.c file designed for i.MX8:

On i.MX8M resources (clocks, power, pinctrl, etc) are managed by the
Linux kernel while on i.MX8 resources are managed by a separate
System Controller Firmware. This makes the interface to those resources
completely different.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/Kconfig  |  15 ++
 sound/soc/sof/imx/Makefile |   2 +
 sound/soc/sof/imx/imx8m.c  | 279 +++++++++++++++++++++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 sound/soc/sof/imx/imx8m.c

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 9586635cf8ab..0e7964bf4448 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -14,6 +14,7 @@ if SND_SOC_SOF_IMX_TOPLEVEL
 config SND_SOC_SOF_IMX_OF
 	def_tristate SND_SOC_SOF_OF
 	select SND_SOC_SOF_IMX8 if SND_SOC_SOF_IMX8_SUPPORT
+	select SND_SOC_SOF_IMX8M if SND_SOC_SOF_IMX8M_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -33,4 +34,18 @@ config SND_SOC_SOF_IMX8
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_IMX8M_SUPPORT
+	bool "SOF support for i.MX8M"
+	help
+	  This adds support for Sound Open Firmware for NXP i.MX8M platforms
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_IMX8M
+	tristate
+	depends on IMX_DSP
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
 endif ## SND_SOC_SOF_IMX_IMX_TOPLEVEL
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index 6ef908e8c807..d9d8dc1765b8 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 snd-sof-imx8-objs := imx8.o
+snd-sof-imx8m-objs := imx8m.o
 
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
+obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
new file mode 100644
index 000000000000..07451ba4efae
--- /dev/null
+++ b/sound/soc/sof/imx/imx8m.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// Copyright 2020 NXP
+//
+// Author: Daniel Baluta <daniel.baluta@nxp.com>
+//
+// Hardware interface for audio DSP on i.MX8M
+
+#include <linux/firmware.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+#include <linux/module.h>
+#include <sound/sof.h>
+#include <sound/sof/xtensa.h>
+#include <linux/firmware/imx/dsp.h>
+
+#include "../ops.h"
+
+#define MBOX_OFFSET	0x800000
+#define MBOX_SIZE	0x1000
+
+struct imx8m_priv {
+	struct device *dev;
+	struct snd_sof_dev *sdev;
+
+	/* DSP IPC handler */
+	struct imx_dsp_ipc *dsp_ipc;
+	struct platform_device *ipc_dev;
+};
+
+static void imx8m_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply reply;
+	int ret = 0;
+
+	if (!msg) {
+		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
+		return;
+	}
+
+	/* get reply */
+	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
+
+	if (reply.error < 0) {
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		ret = reply.error;
+	} else {
+		/* reply has correct size? */
+		if (reply.hdr.size != msg->reply_size) {
+			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
+				msg->reply_size, reply.hdr.size);
+			ret = -EINVAL;
+		}
+
+		/* read the message */
+		if (msg->reply_size > 0)
+			sof_mailbox_read(sdev, sdev->host_box.offset,
+					 msg->reply_data, msg->reply_size);
+	}
+
+	msg->reply_error = ret;
+}
+
+static int imx8m_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_OFFSET;
+}
+
+static int imx8m_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return MBOX_OFFSET;
+}
+
+static void imx8m_dsp_handle_reply(struct imx_dsp_ipc *ipc)
+{
+	struct imx8m_priv *priv = imx_dsp_get_data(ipc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
+	imx8m_get_reply(priv->sdev);
+	snd_sof_ipc_reply(priv->sdev, 0);
+	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
+}
+
+static void imx8m_dsp_handle_request(struct imx_dsp_ipc *ipc)
+{
+	struct imx8m_priv *priv = imx_dsp_get_data(ipc);
+
+	snd_sof_ipc_msgs_rx(priv->sdev);
+}
+
+struct imx_dsp_ops imx8m_dsp_ops = {
+	.handle_reply		= imx8m_dsp_handle_reply,
+	.handle_request		= imx8m_dsp_handle_request,
+};
+
+static int imx8m_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->private;
+
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+			  msg->msg_size);
+	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
+
+	return 0;
+}
+
+/*
+ * DSP control.
+ */
+static int imx8m_run(struct snd_sof_dev *sdev)
+{
+	/* TODO: start DSP using Audio MIX bits */
+	return 0;
+}
+
+static int imx8m_probe(struct snd_sof_dev *sdev)
+{
+	struct platform_device *pdev =
+		container_of(sdev->dev, struct platform_device, dev);
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *res_node;
+	struct resource *mmio;
+	struct imx8m_priv *priv;
+	struct resource res;
+	u32 base, size;
+	int ret = 0;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	sdev->private = priv;
+	priv->dev = sdev->dev;
+	priv->sdev = sdev;
+
+	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
+						      PLATFORM_DEVID_NONE,
+						      pdev, sizeof(*pdev));
+	if (IS_ERR(priv->ipc_dev))
+		return PTR_ERR(priv->ipc_dev);
+
+	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
+	if (!priv->dsp_ipc) {
+		/* DSP IPC driver not probed yet, try later */
+		ret = -EPROBE_DEFER;
+		dev_err(sdev->dev, "Failed to get drvdata\n");
+		goto exit_pdev_unregister;
+	}
+
+	imx_dsp_set_data(priv->dsp_ipc, priv);
+	priv->dsp_ipc->ops = &imx8m_dsp_ops;
+
+	/* DSP base */
+	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (mmio) {
+		base = mmio->start;
+		size = resource_size(mmio);
+	} else {
+		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
+		ret = -EINVAL;
+		goto exit_pdev_unregister;
+	}
+
+	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
+	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
+		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
+			base, size);
+		ret = -ENODEV;
+		goto exit_pdev_unregister;
+	}
+	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
+
+	res_node = of_parse_phandle(np, "memory-region", 0);
+	if (!res_node) {
+		dev_err(&pdev->dev, "failed to get memory region node\n");
+		ret = -ENODEV;
+		goto exit_pdev_unregister;
+	}
+
+	ret = of_address_to_resource(res_node, 0, &res);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get reserved region address\n");
+		goto exit_pdev_unregister;
+	}
+
+	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
+							  res.end - res.start +
+							  1);
+	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
+		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
+			base, size);
+		ret = -ENOMEM;
+		goto exit_pdev_unregister;
+	}
+	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
+
+	/* set default mailbox offset for FW ready message */
+	sdev->dsp_box.offset = MBOX_OFFSET;
+
+	return 0;
+
+exit_pdev_unregister:
+	platform_device_unregister(priv->ipc_dev);
+	return ret;
+}
+
+static int imx8m_remove(struct snd_sof_dev *sdev)
+{
+	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->private;
+
+	platform_device_unregister(priv->ipc_dev);
+
+	return 0;
+}
+
+/* on i.MX8 there is 1 to 1 match between type and BAR idx */
+static int imx8m_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	return type;
+}
+
+static void imx8m_ipc_msg_data(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       void *p, size_t sz)
+{
+	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+}
+
+static int imx8m_ipc_pcm_params(struct snd_sof_dev *sdev,
+				struct snd_pcm_substream *substream,
+				const struct sof_ipc_pcm_params_reply *reply)
+{
+	return 0;
+}
+
+static struct snd_soc_dai_driver imx8m_dai[] = {
+{
+	.name = "sai-port",
+},
+};
+
+/* i.MX8 ops */
+struct snd_sof_dsp_ops sof_imx8m_ops = {
+	/* probe and remove */
+	.probe		= imx8m_probe,
+	.remove		= imx8m_remove,
+	/* DSP core boot */
+	.run		= imx8m_run,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* ipc */
+	.send_msg	= imx8m_send_msg,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset	= imx8m_get_mailbox_offset,
+	.get_window_offset	= imx8m_get_window_offset,
+
+	.ipc_msg_data	= imx8m_ipc_msg_data,
+	.ipc_pcm_params	= imx8m_ipc_pcm_params,
+
+	/* module loading */
+	.load_module	= snd_sof_parse_module_memcpy,
+	.get_bar_index	= imx8m_get_bar_index,
+	/* firmware loading */
+	.load_firmware	= snd_sof_load_firmware_memcpy,
+
+	/* DAI drivers */
+	.drv = imx8m_dai,
+	.num_drv = 1, /* we have only 1 SAI interface on i.MX8M */
+};
+EXPORT_SYMBOL(sof_imx8m_ops);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.17.1

