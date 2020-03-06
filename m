Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529D17BB6F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 12:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFAA1667;
	Fri,  6 Mar 2020 12:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFAA1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583493430;
	bh=6M68l+zuv7s+VYkqMFURoJj4v2tthXxK7K6EhOTcoug=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcA3oULMfG+q6dmgxW9lE3WtCfYogsl2dbOVTYQu5uBuUE0zLFfeO8cRvqpzZo3/C
	 VGpbn2zh78ofZdODyn6KTu0z08pmniOxYPv7OaoK5YVJALhdMu6XXZBegXgc8VL/+Z
	 +eG4/W9z7fjET5yaoiKKgwS8v9cZm1852ypg3CG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB96F80229;
	Fri,  6 Mar 2020 12:14:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25484F80290; Fri,  6 Mar 2020 12:14:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B496DF801EC;
 Fri,  6 Mar 2020 12:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B496DF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="DzBTX9dR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFQpiSGNvXcqLgv+HSRwfMpbyI5gN+gA6CJ8eE8xu4WTb9isMzu/dwzcG5UVMKpmUk0lzfHV2Xfam3tRVa/iBR0eMKXjLpQzeVrWmaAV3WIEwVEzgIqSV3MFth+ryyU0Dad2mwr7trJYHeDmewkLEwdbKhhs45fcpMxq4r/Y4rpV0ndq79R9irX0hvJOPuU8jAgnhP4lEzYxODMZPTOf7CvooUCLsZcqz7c7bNdFyEeWxKhLhtzy1c9iTnViD9VSVpT9DR0ygpbtFHTdqxgF1UFnuLDYE6iA1XF0KWK42aA0wiRTsgWrIoXlly1k22FS27N0bsOyDd11fchulLJfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e2tQpOmki1aNBpvi5OVW1w5U7En4DG/7eHprbH9Skw=;
 b=ej+pebnSQiCLQttJdhYafz8QHzbHdfgNfiYKOcdzIxU8v9pA/IF/l5b5S0Mg3Q0ndiGnhe5D7zg9+bK189jbX4q728U7yiaBfTdXMm7qGH4gbGl+ruxgBLaQZH3fUJBOp7R2ti9p/EDrrRZeTENFcVeWTGbLJGJ42rLn8tqPjVKl96ljUFGO53Nn0kHrF4LJKVIXuJqqIiaHjhP13IdBYQiUhX8COJUidfS96eQpuzRNqXJmVzAXLcHqzMG1/bTYl2PKD5EthDoXPD4vP8wAvlPY7DCf/Ai0X16z7YWkzGgF/s4FxocHyBw3lX/dXQ/2tg2pTMo48+JaGeTtxPuisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e2tQpOmki1aNBpvi5OVW1w5U7En4DG/7eHprbH9Skw=;
 b=DzBTX9dRJ/fgxhym0GLN+L+eePUJs8eiLJC4h4C5YZkAsNUHIsfXgP7UFSI7oiLXzGdoIEEuYLOc+kRU804nAfi0a1VGEkTKfx0iVklZCsVAkWYvcmbHjmO3j4DRy5ZXHfomnf7BDk2jvGW59Oks6eq2k10pmkw+NhOcchxCD+c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB2830.eurprd04.prod.outlook.com (10.175.21.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 6 Mar 2020 11:14:21 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 11:14:21 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, peter.ujfalusi@ti.com,
 broonie@kernel.org, linux-imx@nxp.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl: Add generic CPU DAI driver
Date: Fri,  6 Mar 2020 13:13:53 +0200
Message-Id: <20200306111353.12906-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
References: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0039.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::16) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM0PR02CA0039.eurprd02.prod.outlook.com (2603:10a6:208:d2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Fri, 6 Mar 2020 11:14:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94be3b16-6776-4641-7c30-08d7c1bf84cb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2830:|VI1PR0402MB2830:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28307F1FC290DC1026BE0AA8B8E30@VI1PR0402MB2830.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(26005)(44832011)(6506007)(7416002)(186003)(956004)(16526019)(8936002)(81156014)(66946007)(66476007)(6486002)(2616005)(316002)(2906002)(81166006)(8676002)(66556008)(478600001)(5660300002)(6512007)(4326008)(6666004)(1076003)(86362001)(52116002)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2830;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhbJOFlWM0494Rmuhw3GcpAuqaGjw3V/1fVYuWe3fKAAuGAm4zCYuWoZqWDqw3JMNVQa7xf7DsrG5zCumhlX8KxO/0sfC1Qkm9nnpLtWKk6WeuXeqohjr35AnWVilk+4kzTJarQQMLfgECaqSltY+U4pntPgRbeNpVFhcm6LhjM91QXLsQygox/M/IzJV6OACEOh4HzoCikw1mau5e7j2fyl9jkLSwodBseCs0g1AjOeYLiApDRrdWwhVabUoagHAGxUx9IWugzvCD/CaKIB+y/hMqOneQ7drGf1nupoRW1hA5FEGEnaA9QeYbgcdMwHq1BWd0DGhBN1FlE7Oas8Vaw5d364Q63ZVGpGCO0V8N9oV3UeSA/Uk4GUgzMcWOVmN8vmxcOYNgBut0fXmijuFzGEsZxtKTwz2siNxaPLr7Nqd+PIRkd8nUt2vVmz84auT4CkakTNeztmd8zibwl3h/QB0pzhGtaa5spx27tNKzdTZF3FSTRElmiVEx1uSJzZ
X-MS-Exchange-AntiSpam-MessageData: rstWD/zIyOp80rTVG7Io30uUD3zrFVW0VnM83FTpllJf8zUstAqvkDPBm77dmxbex5Wbc4UtCu7bYdoWD4BDR17ZbkSiRDB8c+Rm2grnWUXPT623D/VCpObi2djDectDLWLxUHOLceqKvssxjj9xmw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94be3b16-6776-4641-7c30-08d7c1bf84cb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 11:14:21.0365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+XGvLy5DJhgJcp2lkMH9zizhZuIvNsOYGdZdvnEiv+lzyPtH2V5+NeSg2O95cT/JLcMTyQjP/h+b6fgPIqiHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2830
Cc: Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

On i.MX8 platforms that have a DSP the DAI handling is taken care
of by two entities:
	* Application Processor (AP), which runs Linux
	* DSP, which runs a firmware (typically Sound Open Firmware)

The DSP has access to DAI IP registers, but it cannot easily handle
resources like:
	* clocks
	* power domain management
	* pinctrl

For this reason we introduce a generic FSL DAI driver which will take
care of the resources above.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/Kconfig   |   8 ++
 sound/soc/fsl/Makefile  |   2 +
 sound/soc/fsl/fsl_dai.c | 288 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 298 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_dai.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 65e8cd4be930..bea8ab2c24f9 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -75,6 +75,14 @@ config SND_SOC_FSL_ESAI
 	  This option is only useful for out-of-tree drivers since
 	  in-tree drivers select it automatically.
 
+config SND_SOC_FSL_DAI
+	tristate "Generic FSL DAI support for Sound Open Firmware"
+	help
+	  Say Y if you want to enable generic FSL DAI support to be used
+	  with Sound Open Firmware. This module takes care of enabling
+	  clocks, power domain, pinctrl for FSL DAIs. The rest of DAI
+	  control is taken care of by SOF firmware.
+
 config SND_SOC_FSL_MICFIL
 	tristate "Pulse Density Modulation Microphone Interface (MICFIL) module support"
 	select REGMAP_MMIO
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 8cde88c72d93..e4ed253b6657 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -20,6 +20,7 @@ snd-soc-fsl-ssi-y := fsl_ssi.o
 snd-soc-fsl-ssi-$(CONFIG_DEBUG_FS) += fsl_ssi_dbg.o
 snd-soc-fsl-spdif-objs := fsl_spdif.o
 snd-soc-fsl-esai-objs := fsl_esai.o
+snd-soc-fsl-dai-objs := fsl_dai.o
 snd-soc-fsl-micfil-objs := fsl_micfil.o
 snd-soc-fsl-utils-objs := fsl_utils.o
 snd-soc-fsl-dma-objs := fsl_dma.o
@@ -32,6 +33,7 @@ obj-$(CONFIG_SND_SOC_FSL_SAI) += snd-soc-fsl-sai.o
 obj-$(CONFIG_SND_SOC_FSL_SSI) += snd-soc-fsl-ssi.o
 obj-$(CONFIG_SND_SOC_FSL_SPDIF) += snd-soc-fsl-spdif.o
 obj-$(CONFIG_SND_SOC_FSL_ESAI) += snd-soc-fsl-esai.o
+obj-$(CONFIG_SND_SOC_FSL_DAI) += snd-soc-fsl-dai.o
 obj-$(CONFIG_SND_SOC_FSL_MICFIL) += snd-soc-fsl-micfil.o
 obj-$(CONFIG_SND_SOC_FSL_UTILS) += snd-soc-fsl-utils.o
 obj-$(CONFIG_SND_SOC_FSL_MQS) += snd-soc-fsl-mqs.o
diff --git a/sound/soc/fsl/fsl_dai.c b/sound/soc/fsl/fsl_dai.c
new file mode 100644
index 000000000000..804e04f87841
--- /dev/null
+++ b/sound/soc/fsl/fsl_dai.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Freescale Generic DAI driver for DSP
+//
+// Copyright 2019 NXP
+// Author: Daniel Baluta <daniel.baluta@nxp.com>
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+enum fsl_dai_type {
+	FSL_DAI_TYPE_NONE,
+	FSL_DAI_TYPE_SAI,
+	FSL_DAI_TYPE_ESAI,
+};
+
+#define FSL_DAI_ESAI_CLK_NUM	4
+static const char *esai_clks[FSL_DAI_ESAI_CLK_NUM] = {
+	"core",
+	"extal",
+	"fsys",
+	"spba",
+};
+
+#define FSL_DAI_SAI_CLK_NUM	5
+static const char *sai_clks[FSL_DAI_SAI_CLK_NUM] = {
+	"bus",
+	"mclk0",
+	"mclk1",
+	"mclk2",
+	"mclk3",
+};
+
+struct fsl_dai {
+	struct platform_device *pdev;
+
+	/* DAI clocks */
+	struct clk **clks;
+	const char **clk_names;
+	int num_clks;
+
+	/* Power Domain handling */
+	int num_domains;
+	struct device **pd_dev;
+	struct device_link **link;
+
+	/* DAIS */
+	struct snd_soc_dai_driver *dai_drv;
+	int num_drv;
+};
+
+static struct snd_soc_dai_driver fsl_dai = {
+};
+
+static const struct snd_soc_component_driver fsl_dai_component = {
+	.name = "fsl-dai",
+};
+
+static int fsl_dai_init_clocks(struct fsl_dai *dai_priv)
+{
+	struct device *dev = &dai_priv->pdev->dev;
+	int i;
+
+	dai_priv->clks = devm_kcalloc(dev, dai_priv->num_clks,
+				      sizeof(*dai_priv->clks), GFP_KERNEL);
+	if (!dai_priv->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < dai_priv->num_clks; i++) {
+		dai_priv->clks[i] = devm_clk_get(dev, dai_priv->clk_names[i]);
+		if (IS_ERR(dai_priv->clks[i])) {
+			dev_dbg(dev, "Failed to get clk %s\n",
+				dai_priv->clk_names[i]);
+			dai_priv->clks[i] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+int fsl_get_dai_type(struct fsl_dai *dai_priv)
+{
+	struct device_node *np = dai_priv->pdev->dev.of_node;
+
+	if (of_device_is_compatible(np, "fsl,esai-dai"))
+		return FSL_DAI_TYPE_ESAI;
+
+	if (of_device_is_compatible(np, "fsl,sai-dai"))
+		return FSL_DAI_TYPE_SAI;
+
+	return FSL_DAI_TYPE_NONE;
+}
+
+static int fsl_dai_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct fsl_dai *priv;
+	char *dai_name;
+	int dai_type, dai_index;
+	int ret;
+	int i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->pdev = pdev;
+
+	dev_set_drvdata(&pdev->dev, priv);
+
+	ret = of_property_read_u32(np, "fsl,dai-index", &dai_index);
+	if (ret) {
+		dev_err(&pdev->dev, "dai-index missing or invalid\n");
+		return ret;
+	}
+
+	dai_type = fsl_get_dai_type(priv);
+	switch (dai_type) {
+	case FSL_DAI_TYPE_ESAI:
+		priv->clk_names = esai_clks;
+		priv->num_clks = FSL_DAI_ESAI_CLK_NUM;
+		priv->dai_drv = &fsl_dai;
+		priv->num_drv = 1;
+		dai_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "esai%d",
+					  dai_index);
+		if (!dai_name)
+			return -ENOMEM;
+		break;
+	case FSL_DAI_TYPE_SAI:
+		priv->clk_names = sai_clks;
+		priv->num_clks = FSL_DAI_SAI_CLK_NUM;
+		priv->dai_drv = &fsl_dai;
+		priv->num_drv = 1;
+		dai_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "sai%d",
+					  dai_index);
+		if (!dai_name)
+			return -ENOMEM;
+		break;
+	default:
+		dev_err(&pdev->dev, "Invalid DAI type %d\n", dai_type);
+		return -EINVAL;
+	}
+
+	fsl_dai.name = dai_name;
+
+	ret = fsl_dai_init_clocks(priv);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Error at init clocks\n");
+		return ret;
+	}
+
+	priv->num_domains = of_count_phandle_with_args(np, "power-domains",
+						       "#power-domain-cells");
+	if (priv->num_domains < 0) {
+		dev_err(&pdev->dev, "no power-domains property in %pOF\n", np);
+		return priv->num_domains;
+	}
+
+	priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
+					  sizeof(*priv->pd_dev), GFP_KERNEL);
+	if (!priv->pd_dev)
+		return -ENOMEM;
+
+	priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
+					sizeof(*priv->link), GFP_KERNEL);
+	if (!priv->link)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->num_domains; i++) {
+		priv->pd_dev[i] = dev_pm_domain_attach_by_id(&pdev->dev, i);
+		if (IS_ERR(priv->pd_dev[i])) {
+			ret = PTR_ERR(priv->pd_dev[i]);
+			goto unroll_pm;
+		}
+
+		priv->link[i] = device_link_add(&pdev->dev, priv->pd_dev[i],
+						DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+		if (!priv->link[i]) {
+			ret = -EINVAL;
+			dev_pm_domain_detach(priv->pd_dev[i], false);
+			goto unroll_pm;
+		}
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_dai_component,
+					      &fsl_dai, 1);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register DAI ret = %d\n", ret);
+		return ret;
+	}
+	return 0;
+
+unroll_pm:
+	while (--i >= 0) {
+		device_link_del(priv->link[i]);
+		dev_pm_domain_detach(priv->pd_dev[i], false);
+	}
+	return ret;
+}
+
+static int fsl_dai_remove(struct platform_device *pdev)
+{
+	struct fsl_dai *priv = platform_get_drvdata(pdev);
+	int i;
+
+	pm_runtime_disable(&priv->pdev->dev);
+
+	for (i = 0; i < priv->num_domains; i++) {
+		device_link_del(priv->link[i]);
+		dev_pm_domain_detach(priv->pd_dev[i], false);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id fsl_dai_dt_ids[] = {
+	{ .compatible = "fsl,esai-dai", },
+	{ .compatible = "fsl,sai-dai", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, fsl_dai_dt_ids);
+
+#ifdef CONFIG_PM
+static int fsl_dai_runtime_resume(struct device *dev)
+{
+	struct fsl_dai *priv = dev_get_drvdata(dev);
+	int i, ret;
+
+	for (i = 0; i < priv->num_clks; i++) {
+		ret = clk_prepare_enable(priv->clks[i]);
+		if (ret < 0) {
+			dev_err(dev, "Failed to enable clk %s\n",
+				priv->clk_names[i]);
+			goto out;
+		}
+	}
+	return 0;
+out:
+	while (--i >= 0)
+		clk_disable_unprepare(priv->clks[i]);
+
+	return ret;
+}
+
+static int fsl_dai_runtime_suspend(struct device *dev)
+{
+	struct fsl_dai *priv = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < priv->num_clks; i++)
+		clk_disable_unprepare(priv->clks[i]);
+
+	return 0;
+}
+#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops fsl_dai_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsl_dai_runtime_suspend,
+			   fsl_dai_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver fsl_dai_driver = {
+	.probe = fsl_dai_probe,
+	.remove = fsl_dai_remove,
+	.driver = {
+		.name = "fsl-dai",
+		.pm = &fsl_dai_pm_ops,
+		.of_match_table = fsl_dai_dt_ids,
+	},
+};
+
+module_platform_driver(fsl_dai_driver);
+
+MODULE_ALIAS("platform:fsl-dai");
+
+MODULE_AUTHOR("Daniel Baluta <daniel.baluta@nxp.com>");
+MODULE_DESCRIPTION("FSL Generic DAI driver for DSP");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

