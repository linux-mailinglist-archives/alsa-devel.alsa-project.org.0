Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96527C0FB
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 11:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1410018BE;
	Tue, 29 Sep 2020 11:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1410018BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601371350;
	bh=zEgMfsn7hbXxXFxB/p/ohn3xkJmTJtVmWO9EXUCLnzs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HkwwICiafMg7x7PNg5iDDGG34qehSN+MNt5zoId+I7iYh6TAx2i2Ide0xbrvpHF/a
	 P3uTiVQZ2V3MUfmdrUvgLZBTWr4V2EmsAfTwpS8IMd+qmgbBqtydkxEQ8Y/92k1Ngk
	 KQI3iMcO0zWm6X1rhCnhr2ocVsw3msO7gInm46G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04AA4F802A7;
	Tue, 29 Sep 2020 11:20:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8ECBF80273; Tue, 29 Sep 2020 11:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75E98F8022B
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 11:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E98F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="WKHqePDY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iikE2w4y7T//yhH43m4sRjGFeqsNupaEhUQiWnHeXeAsgaNnVr9MxllF3+xO7IFWcfl94AJRCn96p3BkuyxNL3qVvV0S6KbY6uG057+fBGr9m0aGG5r4aW6tDwQZifQel1NuHpnpXD4t9KokSWiBZa6fFbuM1uKogvO6WQPRhCtWXeI3TZvCkALdNmCfOlbVUNSM3qLczJMJEN42sIeB++EyzclwaCtozISodTF5hdskmDDVAyklnWFKbYjNCY6piTXprsPeXBS+llMFOtYllqwbqNQKWREmGqVP7M8hRWTOZN56ksBLsb/M3B4yPVeiCP7sTVH9NjA8m+1wGFMqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L60Q+jYo46RqCN61TxyZF2z6ZSAYZ44Roxv2vSxY3LA=;
 b=iWOVMxFHnM7YVNK9D/A+Zh6AKsOP3MO/2KEgxsOfXBSmczzBKOpq8Z3WsPNSfTScPS5ilX/df3DVP/dnA2nCv+1pi1tn4byyjt0SbI+pfPun8k5p5vd/aO9STUn8cGN2w9XAirdDUkbUc+J/w+kpaE4EeH6rgY4XuQjUGcQexQ40lq2kUp4xpd65vVPe/LfOVVL2HO2AGyvXi45Q9MlpLw8v9HpJBVVFj6ylV7yc3fFtIsN3SfgU8p9wGd8dzHZk6AYuQ9b8I/1bjaJFQMXUOiumha52c9HSgumkSclq5wZ0KeTaOYa5E32nwN1xkfZb8AE8m2OerU1HqBzH8zAI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L60Q+jYo46RqCN61TxyZF2z6ZSAYZ44Roxv2vSxY3LA=;
 b=WKHqePDYnaO4C87qBruFgrhnTfDnazxB2WqWR/6iDWolMswhbBUkudmmnLYnSmmGhIiVjx+d1hpRQV5MIEomn7+N/NB9wXrHYYWHlKIp8ksAdG/+qlhBJ/LFj5ZynBcHSFX8ApePPW2Ga9CkIqvhTb5e9+Dp04tH3HQWRxHMPC8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB4078.eurprd04.prod.outlook.com
 (2603:10a6:803:4e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 09:19:57 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 09:19:57 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Date: Tue, 29 Sep 2020 12:19:26 +0300
Message-Id: <1601371167-32239-2-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
References: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42)
 To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3412.22 via Frontend Transport; Tue, 29 Sep 2020 09:19:55 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c5403e9-3d76-4a4d-64b3-08d86458d55c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4078:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB40780D70153BEBBC58A169C7D3320@VI1PR04MB4078.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kd59sDI+RbioRRStKePkrxUAC2A8yPnGT9xYwUv5T2HXh0OZBnAGnkmSlbVyXL43kE9vJ5HbBAn2W0uXgPCAk1izgnM9kczJmK4T96dZv6V2Q+7eOPesRkvqp/guq6sCBMHyShtXJTSXO3Y/6KjrhUt6wfMTmU2wAnGBvpdDbS5JcW3f0oe8EXTckUUnibheJvoDdDrLqTgW6314I+8yc36PL1GczxKqwyUzMCmMljLogBasuSmM7hYd+Zh6FPVsLi3y2j6DHsi12rCzLzhD5KT4MjbTcxmmhUajidBZVkmHmFfNo1dmTP78vLVN2j/5LZ34n7bPYrEBHjym421gniqlGdalIrruTvvaJC3wyeoSC6NaZGqTnz5t7ufm/iPMJw4rGKZ9P15KBfW96ZSlS5fxc8fxqx+MoLZpIBhgjF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(66556008)(66476007)(186003)(66946007)(7416002)(26005)(2906002)(16526019)(6512007)(5660300002)(8676002)(6486002)(30864003)(956004)(316002)(2616005)(86362001)(478600001)(54906003)(110136005)(6506007)(8936002)(83380400001)(52116002)(6666004)(4326008)(921003)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6Y1KV8xHFv+Fzxvhi+bEmSf6UilltyDdSKiYnMuznvP3LWENSEb3wJ/i6x2nRldDvG1zqcyySPIFkGtAgMVASI8E4pdRhFfzmZxNKvBXfKKJU8/47WJKL/eVSawrPgxIDjdTDQbnPKjuikwJreS5/8QlwNa43G1fxs2q2qNpYemyymJLj4bfooiH5d8Kfoj5B9T6boo1R1Ud4jeZsUFxOtgULqk6D0go1pEXug0etTa+fswV5sdP/E7UE/SqZLEjZznQ9YYZSp4QxbvXpMB/4pql5+NBmQanZeo25tVg1oPLf6WGgntACXnfunxcZc8EhWPgGTzJHYqaL4M3pYXwGLDEMKxi4cOLRkHBE/V2KMQ5uKZ6p4sqMuQnrkbqNVVFEf8kR9dcrnxz3eTPXlWNPtGTeu6Q/Gj7n/OCZlGHZAhAVMcN+JnUgNrdT0+QKLSIQGSHcOPae/SEBsO56SbemuwPKo0d+8jkNL6kM4ksRk2xLMr3PX3jDo456p2UzpGvhEECuyaVGLvnkI1qbVJL5JHH5YHjg8n0102SJ4Xv5seiL4iV0lMx3YKPEeOoYoTLgY/pWYLOLHiI1ahwZeUcIP10LEe+utMMooCuN7nJTGYQFjog9EdOi3P5+xH4oGEAbfNc6YZxumvbLMXfR5iOrg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5403e9-3d76-4a4d-64b3-08d86458d55c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 09:19:57.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGWENs2WkfDYpKiIdDoB9HCbOE+UPldyZoRwrLS5/KcQDFteWuNTB+qrwyF8MGtqWg3qb8AqwsRz/O5YpdQUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4078
Cc: Viorel Suman <viorel.suman@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
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

From: Viorel Suman <viorel.suman@nxp.com>

XCVR (Audio Transceiver) is a on-chip functional module found
on i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/Kconfig    |   10 +
 sound/soc/fsl/Makefile   |    2 +
 sound/soc/fsl/fsl_xcvr.c | 1356 ++++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h |  266 +++++++++
 4 files changed, 1634 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 3f76ff7..d04b64d 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -95,6 +95,16 @@ config SND_SOC_FSL_EASRC
 	  destination sample rate. It is a new design module compare with the
 	  old ASRC.
 
+config SND_SOC_FSL_XCVR
+	tristate "NXP Audio Transceiver (XCVR) module support"
+	select REGMAP_MMIO
+	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y if you want to add Audio Transceiver (XCVR) support for NXP
+	  iMX CPUs. XCVR is a digital module that supports HDMI2.1 eARC,
+	  HDMI1.4 ARC and SPDIF.
+
 config SND_SOC_FSL_UTILS
 	tristate
 
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index b835eeb..1d2231f 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -25,6 +25,7 @@ snd-soc-fsl-utils-objs := fsl_utils.o
 snd-soc-fsl-dma-objs := fsl_dma.o
 snd-soc-fsl-mqs-objs := fsl_mqs.o
 snd-soc-fsl-easrc-objs := fsl_easrc.o
+snd-soc-fsl-xcvr-objs := fsl_xcvr.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_FSL_UTILS) += snd-soc-fsl-utils.o
 obj-$(CONFIG_SND_SOC_FSL_MQS) += snd-soc-fsl-mqs.o
 obj-$(CONFIG_SND_SOC_FSL_EASRC) += snd-soc-fsl-easrc.o
 obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
+obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
 
 # MPC5200 Platform Support
 obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
new file mode 100644
index 00000000..148bf48
--- /dev/null
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -0,0 +1,1356 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2019 NXP
+
+#include <linux/bitrev.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_iec958.h>
+#include <sound/pcm_params.h>
+
+#include "fsl_xcvr.h"
+#include "imx-pcm.h"
+
+#define FSL_XCVR_CAPDS_SIZE	256
+
+struct fsl_xcvr {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+	struct clk *ipg_clk;
+	struct clk *pll_ipg_clk;
+	struct clk *phy_clk;
+	struct clk *spba_clk;
+	struct reset_control *reset;
+	const char *fw_name;
+	u8 streams;
+	u32 mode;
+	u32 arc_mode;
+	void __iomem *ram_addr;
+	struct snd_dmaengine_dai_dma_data dma_prms_rx;
+	struct snd_dmaengine_dai_dma_data dma_prms_tx;
+	struct snd_aes_iec958 rx_iec958;
+	struct snd_aes_iec958 tx_iec958;
+	u8 cap_ds[FSL_XCVR_CAPDS_SIZE];
+};
+
+static const struct fsl_xcvr_pll_conf {
+	u8 mfi;   /* min=0x18, max=0x38 */
+	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
+	u32 mfd;  /* unsigned int */
+	u32 fout; /* Fout = Fref*(MFI + MFN/MFD), Fref is 24MHz */
+} fsl_xcvr_pll_cfg[] = {
+	{ .mfi = 54, .mfn = 1,  .mfd = 6,   .fout = 1300000000, }, /* 1.3 GHz */
+	{ .mfi = 32, .mfn = 96, .mfd = 125, .fout = 786432000, },  /* 8000 Hz */
+	{ .mfi = 30, .mfn = 66, .mfd = 625, .fout = 722534400, },  /* 11025 Hz */
+	{ .mfi = 29, .mfn = 1,  .mfd = 6,   .fout = 700000000, },  /* 700 MHz */
+};
+
+/*
+ * HDMI2.1 spec defines 6- and 12-channels layout for one bit audio
+ * stream. Todo: to check how this case can be considered below
+ */
+static const u32 fsl_xcvr_earc_channels[] = { 1, 2, 8, 16, 32, };
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_earc_channels_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_earc_channels),
+	.list = fsl_xcvr_earc_channels,
+};
+
+static const u32 fsl_xcvr_earc_rates[] = {
+	32000, 44100, 48000, 64000, 88200, 96000,
+	128000, 176400, 192000, 256000, 352800, 384000,
+	512000, 705600, 768000, 1024000, 1411200, 1536000,
+};
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_earc_rates_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_earc_rates),
+	.list = fsl_xcvr_earc_rates,
+};
+
+static const u32 fsl_xcvr_spdif_channels[] = { 2, };
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_spdif_channels_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_spdif_channels),
+	.list = fsl_xcvr_spdif_channels,
+};
+
+static const u32 fsl_xcvr_spdif_rates[] = {
+	32000, 44100, 48000, 88200, 96000, 176400, 192000,
+};
+static const struct snd_pcm_hw_constraint_list fsl_xcvr_spdif_rates_constr = {
+	.count = ARRAY_SIZE(fsl_xcvr_spdif_rates),
+	.list = fsl_xcvr_spdif_rates,
+};
+
+static int fsl_xcvr_arc_mode_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+
+	xcvr->arc_mode = snd_soc_enum_item_to_val(e, item[0]);
+
+	return 0;
+}
+
+static int fsl_xcvr_arc_mode_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	ucontrol->value.enumerated.item[0] = xcvr->arc_mode;
+
+	return 0;
+}
+
+static const u32 fsl_xcvr_phy_arc_cfg[] = {
+	FSL_XCVR_PHY_CTRL_ARC_MODE_SE_EN, FSL_XCVR_PHY_CTRL_ARC_MODE_CM_EN,
+};
+
+static const char * const fsl_xcvr_arc_mode[] = { "Single Ended", "Common", };
+static const struct soc_enum fsl_xcvr_arc_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(fsl_xcvr_arc_mode), fsl_xcvr_arc_mode);
+static struct snd_kcontrol_new fsl_xcvr_arc_mode_kctl =
+	SOC_ENUM_EXT("ARC Mode", fsl_xcvr_arc_mode_enum,
+		     fsl_xcvr_arc_mode_get, fsl_xcvr_arc_mode_put);
+
+/* Capabilities data structure, bytes */
+static int fsl_xcvr_type_capds_bytes_info(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = FSL_XCVR_CAPDS_SIZE;
+
+	return 0;
+}
+
+static int fsl_xcvr_capds_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(ucontrol->value.bytes.data, xcvr->cap_ds, FSL_XCVR_CAPDS_SIZE);
+
+	return 0;
+}
+
+static int fsl_xcvr_capds_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(xcvr->cap_ds, ucontrol->value.bytes.data, FSL_XCVR_CAPDS_SIZE);
+
+	return 0;
+}
+
+static struct snd_kcontrol_new fsl_xcvr_earc_capds_kctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+	.name = "Capabilities Data Structure",
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = fsl_xcvr_type_capds_bytes_info,
+	.get = fsl_xcvr_capds_get,
+	.put = fsl_xcvr_capds_put,
+};
+
+static int fsl_xcvr_activate_ctl(struct snd_soc_dai *dai, const char *name,
+				 bool active)
+{
+	struct snd_soc_card *card = dai->component->card;
+	struct snd_kcontrol *kctl;
+	bool enabled;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+	if (kctl == NULL)
+		return -ENOENT;
+
+	enabled = ((kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_WRITE) != 0);
+	if (active == enabled)
+		return 0; /* nothing to do */
+
+	if (active)
+		kctl->vd[0].access |=  SNDRV_CTL_ELEM_ACCESS_WRITE;
+	else
+		kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_WRITE;
+
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_INFO, &kctl->id);
+
+	return 1;
+}
+
+static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	struct snd_soc_card *card = dai->component->card;
+	struct snd_soc_pcm_runtime *rtd;
+
+	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
+
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
+			      (xcvr->mode == FSL_XCVR_MODE_ARC));
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
+			      (xcvr->mode == FSL_XCVR_MODE_EARC));
+	/* Allow playback for SPDIF only */
+	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
+	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
+		(xcvr->mode == FSL_XCVR_MODE_SPDIF ? 1 : 0);
+	return 0;
+}
+
+static int fsl_xcvr_mode_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	ucontrol->value.enumerated.item[0] = xcvr->mode;
+
+	return 0;
+}
+
+static const char * const fsl_xcvr_mode[] = { "SPDIF", "ARC RX", "eARC", };
+static const struct soc_enum fsl_xcvr_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(fsl_xcvr_mode), fsl_xcvr_mode);
+static struct snd_kcontrol_new fsl_xcvr_mode_kctl =
+	SOC_ENUM_EXT("XCVR Mode", fsl_xcvr_mode_enum,
+		     fsl_xcvr_mode_get, fsl_xcvr_mode_put);
+
+/** phy: true => phy, false => pll */
+static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	u32 val, idx, tidx;
+	int ret;
+
+	idx  = BIT(phy ? 26 : 24);
+	tidx = BIT(phy ? 27 : 25);
+
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET, reg);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_WDATA, data);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
+
+	ret = regmap_read_poll_timeout(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL, val,
+				       (val & idx) != ((val & tidx) >> 1),
+				       10, 10000);
+	if (ret)
+		dev_err(dev, "AI timeout: failed to set %s reg 0x%02x=0x%08x\n",
+			phy ? "PHY" : "PLL", reg, data);
+	return ret;
+}
+
+static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr, u32 freq, bool tx)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	u32 i, div = 0, log2;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(fsl_xcvr_pll_cfg); i++) {
+		if (fsl_xcvr_pll_cfg[i].fout % freq == 0) {
+			div = fsl_xcvr_pll_cfg[i].fout / freq;
+			break;
+		}
+	}
+
+	if (!div || i >= ARRAY_SIZE(fsl_xcvr_pll_cfg))
+		return -EINVAL;
+
+	log2 = ilog2(div);
+
+	/* Release AI interface from reset */
+	ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
+			   FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
+	if (ret < 0) {
+		dev_err(dev, "Error while setting IER0: %d\n", ret);
+		return ret;
+	}
+
+	/* PLL: BANDGAP_SET: EN_VBG (enable bandgap) */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_BANDGAP_SET,
+			  FSL_XCVR_PLL_BANDGAP_EN_VBG, 0);
+
+	/* PLL: CTRL0: DIV_INTEGER */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0, fsl_xcvr_pll_cfg[i].mfi, 0);
+	/* PLL: NUMERATOR: MFN */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_NUM, fsl_xcvr_pll_cfg[i].mfn, 0);
+	/* PLL: DENOMINATOR: MFD */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_DEN, fsl_xcvr_pll_cfg[i].mfd, 0);
+	/* PLL: CTRL0_SET: HOLD_RING_OFF, POWER_UP */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+			  FSL_XCVR_PLL_CTRL0_HROFF | FSL_XCVR_PLL_CTRL0_PWP, 0);
+	udelay(25);
+	/* PLL: CTRL0: Clear Hold Ring Off */
+	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_CLR,
+			  FSL_XCVR_PLL_CTRL0_HROFF, 0);
+	udelay(100);
+	if (tx) { /* TX is enabled for SPDIF only */
+		/* PLL: POSTDIV: PDIV0 */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+				  FSL_XCVR_PLL_PDIVx(log2, 0), 0);
+		/* PLL: CTRL_SET: CLKMUX0_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+				  FSL_XCVR_PLL_CTRL0_CM0_EN, 0);
+	} else if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC RX */
+		/* PLL: POSTDIV: PDIV1 */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+				  FSL_XCVR_PLL_PDIVx(log2, 1), 0);
+		/* PLL: CTRL_SET: CLKMUX1_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+				  FSL_XCVR_PLL_CTRL0_CM1_EN, 0);
+	} else { /* SPDIF / ARC RX */
+		/* PLL: POSTDIV: PDIV2 */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+				  FSL_XCVR_PLL_PDIVx(log2, 2), 0);
+		/* PLL: CTRL_SET: CLKMUX2_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+				  FSL_XCVR_PLL_CTRL0_CM2_EN, 0);
+	}
+
+	if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
+		/* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+				  FSL_XCVR_PHY_CTRL_TSDIFF_OE |
+				  FSL_XCVR_PHY_CTRL_PHY_EN, 1);
+		/* PHY: CTRL2_SET: EARC_TX_MODE */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
+				  FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1);
+	} else if (!tx) { /* SPDIF / ARC RX mode */
+		if (xcvr->mode == FSL_XCVR_MODE_SPDIF)
+			/* PHY: CTRL_SET: SPDIF_EN */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+					  FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
+		else	/* PHY: CTRL_SET: ARC RX setup */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+					  FSL_XCVR_PHY_CTRL_PHY_EN |
+					  FSL_XCVR_PHY_CTRL_RX_CM_EN |
+					  fsl_xcvr_phy_arc_cfg[xcvr->arc_mode], 1);
+	}
+
+	dev_dbg(dev, "PLL Fexp: %u, Fout: %u, mfi: %u, mfn: %u, mfd: %d, div: %u, pdiv0: %u\n",
+		freq, fsl_xcvr_pll_cfg[i].fout, fsl_xcvr_pll_cfg[i].mfi,
+		fsl_xcvr_pll_cfg[i].mfn, fsl_xcvr_pll_cfg[i].mfd, div, log2);
+	return 0;
+}
+
+static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	int ret;
+
+	clk_disable_unprepare(xcvr->phy_clk);
+	ret = clk_set_rate(xcvr->phy_clk, freq);
+	if (ret < 0) {
+		dev_err(dev, "Error while setting AUD PLL rate: %d\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(xcvr->phy_clk);
+	if (ret) {
+		dev_err(dev, "failed to start PHY clock: %d\n", ret);
+		return ret;
+	}
+
+	/* Release AI interface from reset */
+	ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
+			   FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
+	if (ret < 0) {
+		dev_err(dev, "Error while setting IER0: %d\n", ret);
+		return ret;
+	}
+
+	if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
+		/* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+				  FSL_XCVR_PHY_CTRL_TSDIFF_OE |
+				  FSL_XCVR_PHY_CTRL_PHY_EN, 1);
+		/* PHY: CTRL2_SET: EARC_TX_MODE */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
+				  FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1);
+	} else { /* SPDIF mode */
+		/* PHY: CTRL_SET: TX_CLK_AUD_SS | SPDIF_EN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
+				  FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS |
+				  FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
+	}
+
+	dev_dbg(dev, "PLL Fexp: %u\n", freq);
+
+	return 0;
+}
+
+#define FSL_XCVR_SPDIF_RX_FREQ	175000000
+static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	u32 m_ctl = 0, v_ctl = 0;
+	u32 r = substream->runtime->rate, ch = substream->runtime->channels;
+	u32 fout = 32 * r * ch * 10 * 2;
+	int ret = 0;
+
+	switch (xcvr->mode) {
+	case FSL_XCVR_MODE_SPDIF:
+	case FSL_XCVR_MODE_ARC:
+		if (tx) {
+			ret = fsl_xcvr_en_aud_pll(xcvr, fout);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set TX freq %u: %d\n",
+					fout, ret);
+				return ret;
+			}
+
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_TX_DPTH_CTRL_SET,
+					   FSL_XCVR_TX_DPTH_CTRL_FRM_FMT);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set TX_DPTH: %d\n", ret);
+				return ret;
+			}
+
+			/**
+			 * set SPDIF MODE - this flag is used to gate
+			 * SPDIF output, useless for SPDIF RX
+			 */
+			m_ctl |= FSL_XCVR_EXT_CTRL_SPDIF_MODE;
+			v_ctl |= FSL_XCVR_EXT_CTRL_SPDIF_MODE;
+		} else {
+			/**
+			 * Clear RX FIFO, flip RX FIFO bits,
+			 * disable eARC related HW mode detects
+			 */
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_SET,
+					   FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
+					   FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO |
+					   FSL_XCVR_RX_DPTH_CTRL_COMP |
+					   FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set RX_DPTH: %d\n", ret);
+				return ret;
+			}
+
+			ret = fsl_xcvr_en_phy_pll(xcvr, FSL_XCVR_SPDIF_RX_FREQ, tx);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set RX freq %u: %d\n",
+					FSL_XCVR_SPDIF_RX_FREQ, ret);
+				return ret;
+			}
+		}
+		break;
+	case FSL_XCVR_MODE_EARC:
+		if (!tx) {
+			/** Clear RX FIFO, flip RX FIFO bits */
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_SET,
+					   FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
+					   FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to set RX_DPTH: %d\n", ret);
+				return ret;
+			}
+
+			/** Enable eARC related HW mode detects */
+			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_CLR,
+					   FSL_XCVR_RX_DPTH_CTRL_COMP |
+					   FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
+			if (ret < 0) {
+				dev_err(dai->dev, "Failed to clr TX_DPTH: %d\n", ret);
+				return ret;
+			}
+		}
+
+		/* clear CMDC RESET */
+		m_ctl |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
+		/* set TX_RX_MODE */
+		m_ctl |= FSL_XCVR_EXT_CTRL_TX_RX_MODE;
+		v_ctl |= (tx ? FSL_XCVR_EXT_CTRL_TX_RX_MODE : 0);
+		break;
+	}
+
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
+				 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
+	if (ret < 0) {
+		dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
+		return ret;
+	}
+
+	/* clear DPATH RESET */
+	m_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, m_ctl, v_ctl);
+	if (ret < 0) {
+		dev_err(dai->dev, "Error while setting EXT_CTRL: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int fsl_xcvr_constr(const struct snd_pcm_substream *substream,
+			   const struct snd_pcm_hw_constraint_list *channels,
+			   const struct snd_pcm_hw_constraint_list *rates)
+{
+	struct snd_pcm_runtime *rt = substream->runtime;
+	int ret;
+
+	ret = snd_pcm_hw_constraint_list(rt, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+					 channels);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_pcm_hw_constraint_list(rt, 0, SNDRV_PCM_HW_PARAM_RATE,
+					 rates);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int fsl_xcvr_startup(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int ret = 0;
+
+	if (xcvr->streams & BIT(substream->stream)) {
+		dev_err(dai->dev, "%sX busy\n", tx ? "T" : "R");
+		return -EBUSY;
+	}
+
+	switch (xcvr->mode) {
+	case FSL_XCVR_MODE_SPDIF:
+	case FSL_XCVR_MODE_ARC:
+		ret = fsl_xcvr_constr(substream, &fsl_xcvr_spdif_channels_constr,
+				      &fsl_xcvr_spdif_rates_constr);
+		break;
+	case FSL_XCVR_MODE_EARC:
+		ret = fsl_xcvr_constr(substream, &fsl_xcvr_earc_channels_constr,
+				      &fsl_xcvr_earc_rates_constr);
+		break;
+	}
+	if (ret < 0)
+		return ret;
+
+	xcvr->streams |= BIT(substream->stream);
+
+	/* Disable XCVR controls if there is stream started */
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, false);
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name, false);
+	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name, false);
+
+	return 0;
+}
+
+static void fsl_xcvr_shutdown(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	u32 mask = 0, val = 0;
+	int ret;
+
+	xcvr->streams &= ~BIT(substream->stream);
+
+	/* Enable XCVR controls if there is no stream started */
+	if (!xcvr->streams) {
+		fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, true);
+		fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
+				      (xcvr->mode == FSL_XCVR_MODE_ARC));
+		fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
+				      (xcvr->mode == FSL_XCVR_MODE_EARC));
+
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
+					 FSL_XCVR_IRQ_EARC_ALL, 0);
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to set IER0: %d\n", ret);
+			return;
+		}
+
+		/* clear SPDIF MODE */
+		if (xcvr->mode == FSL_XCVR_MODE_SPDIF)
+			mask |= FSL_XCVR_EXT_CTRL_SPDIF_MODE;
+	}
+
+	if (xcvr->mode == FSL_XCVR_MODE_EARC) {
+		/* set CMDC RESET */
+		mask |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
+		val  |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
+	}
+
+	/* set DPATH RESET */
+	mask |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+	val  |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, mask, val);
+	if (ret < 0) {
+		dev_err(dai->dev, "Err setting DPATH RESET: %d\n", ret);
+		return;
+	}
+}
+
+static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
+			    struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (tx) {
+			switch (xcvr->mode) {
+			case FSL_XCVR_MODE_EARC:
+				/* set isr_cmdc_tx_en, w1c */
+				ret = regmap_write(xcvr->regmap,
+						   FSL_XCVR_ISR_SET,
+						   FSL_XCVR_ISR_CMDC_TX_EN);
+				if (ret < 0) {
+					dev_err(dai->dev, "err updating isr %d\n", ret);
+					return ret;
+				}
+				fallthrough;
+			case FSL_XCVR_MODE_SPDIF:
+				ret = regmap_write(xcvr->regmap,
+					 FSL_XCVR_TX_DPTH_CTRL_SET,
+					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
+				if (ret < 0) {
+					dev_err(dai->dev, "Failed to start DATA_TX: %d\n", ret);
+					return ret;
+				}
+				break;
+			}
+		}
+
+		/* enable DMA RD/WR */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx), 0);
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
+			return ret;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		/* disable DMA RD/WR */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx),
+					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx));
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to disable DMA: %d\n", ret);
+			return ret;
+		}
+
+		if (tx) {
+			switch (xcvr->mode) {
+			case FSL_XCVR_MODE_SPDIF:
+				ret = regmap_write(xcvr->regmap,
+					 FSL_XCVR_TX_DPTH_CTRL_CLR,
+					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
+				if (ret < 0) {
+					dev_err(dai->dev, "Failed to stop DATA_TX: %d\n", ret);
+					return ret;
+				}
+				fallthrough;
+			case FSL_XCVR_MODE_EARC:
+				/* clear ISR_CMDC_TX_EN, W1C */
+				ret = regmap_write(xcvr->regmap,
+						   FSL_XCVR_ISR_CLR,
+						   FSL_XCVR_ISR_CMDC_TX_EN);
+				if (ret < 0) {
+					dev_err(dai->dev,
+						"Err updating ISR %d\n", ret);
+					return ret;
+				}
+				break;
+			}
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	const struct firmware *fw;
+	int ret = 0, rem, off, out, page = 0, size = FSL_XCVR_REG_OFFSET;
+	u32 mask, val;
+
+	ret = request_firmware(&fw, xcvr->fw_name, dev);
+	if (ret) {
+		dev_err(dev, "failed to request firmware.\n");
+		return ret;
+	}
+
+	rem = fw->size;
+
+	/* RAM is 20KiB = 16KiB code + 4KiB data => max 10 pages 2KiB each */
+	if (rem > 16384) {
+		dev_err(dev, "FW size %d is bigger than 16KiB.\n", rem);
+		return -ENOMEM;
+	}
+
+	for (page = 0; page < 10; page++) {
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_PAGE_MASK,
+					 FSL_XCVR_EXT_CTRL_PAGE(page));
+		if (ret < 0) {
+			dev_err(dev, "FW: failed to set page %d, err=%d\n",
+				page, ret);
+			goto err_firmware;
+		}
+
+		off = page * size;
+		out = min(rem, size);
+		/* IPG clock is assumed to be running, otherwise it will hang */
+		if (out > 0) {
+			/* write firmware into code memory */
+			memcpy_toio(xcvr->ram_addr, fw->data + off, out);
+			rem -= out;
+			if (rem == 0) {
+				/* last part of firmware written */
+				/* clean remaining part of code memory page */
+				memset_io(xcvr->ram_addr + out, 0, size - out);
+			}
+		} else {
+			/* clean current page, including data memory */
+			memset_io(xcvr->ram_addr, 0, size);
+		}
+	};
+
+err_firmware:
+	release_firmware(fw);
+	if (ret < 0)
+		return ret;
+
+	/* configure watermarks */
+	mask = FSL_XCVR_EXT_CTRL_RX_FWM_MASK | FSL_XCVR_EXT_CTRL_TX_FWM_MASK;
+	val  = FSL_XCVR_EXT_CTRL_RX_FWM(FSL_XCVR_FIFO_WMK_RX);
+	val |= FSL_XCVR_EXT_CTRL_TX_FWM(FSL_XCVR_FIFO_WMK_TX);
+	/* disable DMA RD/WR */
+	mask |= FSL_XCVR_EXT_CTRL_DMA_RD_DIS | FSL_XCVR_EXT_CTRL_DMA_WR_DIS;
+	val  |= FSL_XCVR_EXT_CTRL_DMA_RD_DIS | FSL_XCVR_EXT_CTRL_DMA_WR_DIS;
+	/* Data RAM is 4KiB, last two pages: 8 and 9. Select page 8. */
+	mask |= FSL_XCVR_EXT_CTRL_PAGE_MASK;
+	val  |= FSL_XCVR_EXT_CTRL_PAGE(8);
+
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, mask, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set watermarks: %d\n", ret);
+		return ret;
+	}
+
+	/* Store Capabilities Data Structure into Data RAM */
+	memcpy_toio(xcvr->ram_addr + FSL_XCVR_CAP_DATA_STR, xcvr->cap_ds,
+		    FSL_XCVR_CAPDS_SIZE);
+	return 0;
+}
+
+static int fsl_xcvr_type_iec958_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static int fsl_xcvr_type_iec958_bytes_info(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = sizeof_field(struct snd_aes_iec958, status);
+
+	return 0;
+}
+
+static int fsl_xcvr_rx_cs_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(ucontrol->value.iec958.status, xcvr->rx_iec958.status, 24);
+
+	return 0;
+}
+
+static int fsl_xcvr_tx_cs_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(ucontrol->value.iec958.status, xcvr->tx_iec958.status, 24);
+
+	return 0;
+}
+
+static int fsl_xcvr_tx_cs_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	memcpy(xcvr->tx_iec958.status, ucontrol->value.iec958.status, 24);
+
+	return 0;
+}
+
+static struct snd_kcontrol_new fsl_xcvr_rx_ctls[] = {
+	/* Channel status controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, DEFAULT),
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = fsl_xcvr_type_iec958_info,
+		.get = fsl_xcvr_rx_cs_get,
+	},
+	/* Capture channel status, bytes */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "Capture Channel Status",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = fsl_xcvr_type_iec958_bytes_info,
+		.get = fsl_xcvr_rx_cs_get,
+	},
+};
+
+static struct snd_kcontrol_new fsl_xcvr_tx_ctls[] = {
+	/* Channel status controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = fsl_xcvr_type_iec958_info,
+		.get = fsl_xcvr_tx_cs_get,
+		.put = fsl_xcvr_tx_cs_put,
+	},
+	/* Playback channel status, bytes */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "Playback Channel Status",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = fsl_xcvr_type_iec958_bytes_info,
+		.get = fsl_xcvr_tx_cs_get,
+		.put = fsl_xcvr_tx_cs_put,
+	},
+};
+
+static struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
+	.prepare = fsl_xcvr_prepare,
+	.startup = fsl_xcvr_startup,
+	.shutdown = fsl_xcvr_shutdown,
+	.trigger = fsl_xcvr_trigger,
+};
+
+static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
+{
+	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &xcvr->dma_prms_tx, &xcvr->dma_prms_rx);
+	snd_soc_dai_set_drvdata(dai, xcvr);
+
+	snd_soc_add_dai_controls(dai, &fsl_xcvr_mode_kctl, 1);
+	snd_soc_add_dai_controls(dai, &fsl_xcvr_arc_mode_kctl, 1);
+	snd_soc_add_dai_controls(dai, &fsl_xcvr_earc_capds_kctl, 1);
+	snd_soc_add_dai_controls(dai, fsl_xcvr_tx_ctls,
+				 ARRAY_SIZE(fsl_xcvr_tx_ctls));
+	snd_soc_add_dai_controls(dai, fsl_xcvr_rx_ctls,
+				 ARRAY_SIZE(fsl_xcvr_rx_ctls));
+	return 0;
+}
+
+static struct snd_soc_dai_driver fsl_xcvr_dai = {
+	.probe  = fsl_xcvr_dai_probe,
+	.ops = &fsl_xcvr_dai_ops,
+	.playback = {
+		.stream_name = "CPU-Playback",
+		.channels_min = 1,
+		.channels_max = 32,
+		.rate_min = 32000,
+		.rate_max = 1536000,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+	},
+	.capture = {
+		.stream_name = "CPU-Capture",
+		.channels_min = 1,
+		.channels_max = 32,
+		.rate_min = 32000,
+		.rate_max = 1536000,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+	},
+};
+
+static const struct snd_soc_component_driver fsl_xcvr_comp = {
+	.name = "fsl-xcvr-dai",
+};
+
+static const struct reg_default fsl_xcvr_reg_defaults[] = {
+	{ FSL_XCVR_VERSION,	0x00000000 },
+	{ FSL_XCVR_EXT_CTRL,	0xF8204040 },
+	{ FSL_XCVR_EXT_STATUS,	0x00000000 },
+	{ FSL_XCVR_EXT_IER0,	0x00000000 },
+	{ FSL_XCVR_EXT_IER1,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR_SET,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR_CLR,	0x00000000 },
+	{ FSL_XCVR_EXT_ISR_TOG,	0x00000000 },
+	{ FSL_XCVR_IER,		0x00000000 },
+	{ FSL_XCVR_ISR,		0x00000000 },
+	{ FSL_XCVR_ISR_SET,	0x00000000 },
+	{ FSL_XCVR_ISR_CLR,	0x00000000 },
+	{ FSL_XCVR_ISR_TOG,	0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CTRL,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CTRL_SET,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CTRL_CLR,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CTRL_TOG,	0x00002C89 },
+	{ FSL_XCVR_TX_DPTH_CTRL,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CTRL_SET,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CTRL_CLR,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CTRL_TOG,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_0,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_1,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_2,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_3,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_4,	0x00000000 },
+	{ FSL_XCVR_TX_CS_DATA_5,	0x00000000 },
+	{ FSL_XCVR_DEBUG_REG_0,		0x00000000 },
+	{ FSL_XCVR_DEBUG_REG_1,		0x00000000 },
+};
+
+static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case FSL_XCVR_VERSION:
+	case FSL_XCVR_EXT_CTRL:
+	case FSL_XCVR_EXT_STATUS:
+	case FSL_XCVR_EXT_IER0:
+	case FSL_XCVR_EXT_IER1:
+	case FSL_XCVR_EXT_ISR:
+	case FSL_XCVR_EXT_ISR_SET:
+	case FSL_XCVR_EXT_ISR_CLR:
+	case FSL_XCVR_EXT_ISR_TOG:
+	case FSL_XCVR_IER:
+	case FSL_XCVR_ISR:
+	case FSL_XCVR_ISR_SET:
+	case FSL_XCVR_ISR_CLR:
+	case FSL_XCVR_ISR_TOG:
+	case FSL_XCVR_PHY_AI_CTRL:
+	case FSL_XCVR_PHY_AI_CTRL_SET:
+	case FSL_XCVR_PHY_AI_CTRL_CLR:
+	case FSL_XCVR_PHY_AI_CTRL_TOG:
+	case FSL_XCVR_PHY_AI_RDATA:
+	case FSL_XCVR_CLK_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_CTRL:
+	case FSL_XCVR_TX_DPTH_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_CS_DATA_0:
+	case FSL_XCVR_TX_CS_DATA_1:
+	case FSL_XCVR_TX_CS_DATA_2:
+	case FSL_XCVR_TX_CS_DATA_3:
+	case FSL_XCVR_TX_CS_DATA_4:
+	case FSL_XCVR_TX_CS_DATA_5:
+	case FSL_XCVR_DEBUG_REG_0:
+	case FSL_XCVR_DEBUG_REG_1:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case FSL_XCVR_EXT_CTRL:
+	case FSL_XCVR_EXT_IER0:
+	case FSL_XCVR_EXT_IER1:
+	case FSL_XCVR_EXT_ISR:
+	case FSL_XCVR_EXT_ISR_SET:
+	case FSL_XCVR_EXT_ISR_CLR:
+	case FSL_XCVR_EXT_ISR_TOG:
+	case FSL_XCVR_IER:
+	case FSL_XCVR_ISR_SET:
+	case FSL_XCVR_ISR_CLR:
+	case FSL_XCVR_ISR_TOG:
+	case FSL_XCVR_PHY_AI_CTRL:
+	case FSL_XCVR_PHY_AI_CTRL_SET:
+	case FSL_XCVR_PHY_AI_CTRL_CLR:
+	case FSL_XCVR_PHY_AI_CTRL_TOG:
+	case FSL_XCVR_PHY_AI_WDATA:
+	case FSL_XCVR_CLK_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL:
+	case FSL_XCVR_RX_DPTH_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CTRL_TOG:
+	case FSL_XCVR_TX_CS_DATA_0:
+	case FSL_XCVR_TX_CS_DATA_1:
+	case FSL_XCVR_TX_CS_DATA_2:
+	case FSL_XCVR_TX_CS_DATA_3:
+	case FSL_XCVR_TX_CS_DATA_4:
+	case FSL_XCVR_TX_CS_DATA_5:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_xcvr_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return fsl_xcvr_readable_reg(dev, reg);
+}
+
+static const struct regmap_config fsl_xcvr_regmap_cfg = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = FSL_XCVR_MAX_REG,
+	.reg_defaults = fsl_xcvr_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(fsl_xcvr_reg_defaults),
+	.readable_reg = fsl_xcvr_readable_reg,
+	.volatile_reg = fsl_xcvr_volatile_reg,
+	.writeable_reg = fsl_xcvr_writeable_reg,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static irqreturn_t irq0_isr(int irq, void *devid)
+{
+	struct fsl_xcvr *xcvr = (struct fsl_xcvr *)devid;
+	struct device *dev = &xcvr->pdev->dev;
+	struct regmap *regmap = xcvr->regmap;
+	void __iomem *reg_ctrl, *reg_buff;
+	u32 isr, isr_clr = 0, val, i;
+
+	regmap_read(regmap, FSL_XCVR_EXT_ISR, &isr);
+
+	if (isr & FSL_XCVR_IRQ_NEW_CS) {
+		dev_dbg(dev, "Received new CS block\n");
+		isr_clr |= FSL_XCVR_IRQ_NEW_CS;
+		/* Data RAM is 4KiB, last two pages: 8 and 9. Select page 8. */
+		regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				   FSL_XCVR_EXT_CTRL_PAGE_MASK,
+				   FSL_XCVR_EXT_CTRL_PAGE(8));
+
+		/* Find updated CS buffer */
+		reg_ctrl = xcvr->ram_addr + FSL_XCVR_RX_CS_CTRL_0;
+		reg_buff = xcvr->ram_addr + FSL_XCVR_RX_CS_BUFF_0;
+		memcpy_fromio(&val, reg_ctrl, sizeof(val));
+		if (!val) {
+			reg_ctrl = xcvr->ram_addr + FSL_XCVR_RX_CS_CTRL_1;
+			reg_buff = xcvr->ram_addr + FSL_XCVR_RX_CS_BUFF_1;
+			memcpy_fromio(&val, reg_ctrl, sizeof(val));
+		}
+
+		if (val) {
+			/* copy CS buffer */
+			memcpy_fromio(&xcvr->rx_iec958.status, reg_buff,
+				      sizeof(xcvr->rx_iec958.status));
+			for (i = 0; i < 6; i++) {
+				val = *(u32 *)(xcvr->rx_iec958.status + i*4);
+				*(u32 *)(xcvr->rx_iec958.status + i*4) =
+					bitrev32(val);
+			}
+			/* clear CS control register */
+			memset_io(reg_ctrl, 0, sizeof(val));
+		}
+	}
+	if (isr & FSL_XCVR_IRQ_NEW_UD) {
+		dev_dbg(dev, "Received new UD block\n");
+		isr_clr |= FSL_XCVR_IRQ_NEW_UD;
+	}
+	if (isr & FSL_XCVR_IRQ_MUTE) {
+		dev_dbg(dev, "HW mute bit detected\n");
+		isr_clr |= FSL_XCVR_IRQ_MUTE;
+	}
+	if (isr & FSL_XCVR_IRQ_FIFO_UOFL_ERR) {
+		dev_dbg(dev, "RX/TX FIFO full/empty\n");
+		isr_clr |= FSL_XCVR_IRQ_FIFO_UOFL_ERR;
+	}
+	if (isr & FSL_XCVR_IRQ_ARC_MODE) {
+		dev_dbg(dev, "CMDC SM falls out of eARC mode\n");
+		isr_clr |= FSL_XCVR_IRQ_ARC_MODE;
+	}
+	if (isr & FSL_XCVR_IRQ_DMA_RD_REQ) {
+		dev_dbg(dev, "DMA read request\n");
+		isr_clr |= FSL_XCVR_IRQ_DMA_RD_REQ;
+	}
+	if (isr & FSL_XCVR_IRQ_DMA_WR_REQ) {
+		dev_dbg(dev, "DMA write request\n");
+		isr_clr |= FSL_XCVR_IRQ_DMA_WR_REQ;
+	}
+
+	if (isr_clr) {
+		regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr_clr);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static const struct of_device_id fsl_xcvr_dt_ids[] = {
+	{ .compatible = "fsl,imx8mp-xcvr", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fsl_xcvr_dt_ids);
+
+static int fsl_xcvr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct of_device_id *of_id;
+	struct fsl_xcvr *xcvr;
+	struct resource *ram_res, *regs_res, *rx_res, *tx_res;
+	void __iomem *regs;
+	int ret, irq;
+
+	of_id = of_match_device(fsl_xcvr_dt_ids, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	xcvr = devm_kzalloc(dev, sizeof(*xcvr), GFP_KERNEL);
+	if (!xcvr)
+		return -ENOMEM;
+
+	xcvr->pdev = pdev;
+	xcvr->ipg_clk = devm_clk_get(dev, "ipg");
+	if (IS_ERR(xcvr->ipg_clk)) {
+		dev_err(dev, "failed to get ipg clock\n");
+		return PTR_ERR(xcvr->ipg_clk);
+	}
+
+	xcvr->phy_clk = devm_clk_get(dev, "phy");
+	if (IS_ERR(xcvr->phy_clk)) {
+		dev_err(dev, "failed to get phy clock\n");
+		return PTR_ERR(xcvr->phy_clk);
+	}
+
+	xcvr->spba_clk = devm_clk_get(dev, "spba");
+	if (IS_ERR(xcvr->spba_clk)) {
+		dev_err(dev, "failed to get spba clock\n");
+		return PTR_ERR(xcvr->spba_clk);
+	}
+
+	xcvr->pll_ipg_clk = devm_clk_get(dev, "pll_ipg");
+	if (IS_ERR(xcvr->pll_ipg_clk)) {
+		dev_err(dev, "failed to get pll_ipg clock\n");
+		return PTR_ERR(xcvr->pll_ipg_clk);
+	}
+
+	ram_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ram");
+	xcvr->ram_addr = devm_ioremap_resource(dev, ram_res);
+	if (IS_ERR(xcvr->ram_addr))
+		return PTR_ERR(xcvr->ram_addr);
+
+	regs_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	regs = devm_ioremap_resource(dev, regs_res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	xcvr->regmap = devm_regmap_init_mmio_clk(dev, NULL, regs,
+						 &fsl_xcvr_regmap_cfg);
+	if (IS_ERR(xcvr->regmap)) {
+		dev_err(dev, "failed to init XCVR regmap: %ld\n",
+			PTR_ERR(xcvr->regmap));
+		return PTR_ERR(xcvr->regmap);
+	}
+
+	xcvr->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(xcvr->reset)) {
+		dev_err(dev, "failed to get XCVR reset control\n");
+		return PTR_ERR(xcvr->reset);
+	}
+
+	ret = of_property_read_string(np, "firmware-name", &xcvr->fw_name);
+	if (ret) {
+		dev_err(dev, "failed to get fsl,xcvr-fw: %d\n", ret);
+		return ret;
+	}
+
+	/* get IRQs */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "no irq[0]: %d\n", irq);
+		return irq;
+	}
+
+	ret = devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr);
+	if (ret) {
+		dev_err(dev, "failed to claim IRQ0: %i\n", ret);
+		return ret;
+	}
+
+	rx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rxfifo");
+	tx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "txfifo");
+	xcvr->dma_prms_rx.chan_name = "rx";
+	xcvr->dma_prms_tx.chan_name = "tx";
+	xcvr->dma_prms_rx.addr = rx_res->start;
+	xcvr->dma_prms_tx.addr = tx_res->start;
+	xcvr->dma_prms_rx.maxburst = FSL_XCVR_MAXBURST_RX;
+	xcvr->dma_prms_tx.maxburst = FSL_XCVR_MAXBURST_TX;
+
+	platform_set_drvdata(pdev, xcvr);
+	pm_runtime_enable(dev);
+	regcache_cache_only(xcvr->regmap, true);
+
+	ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
+					      &fsl_xcvr_dai, 1);
+	if (ret) {
+		dev_err(dev, "failed to register component %s\n",
+			fsl_xcvr_comp.name);
+		return ret;
+	}
+
+	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
+	if (ret)
+		dev_err(dev, "failed to pcm register\n");
+
+	return ret;
+}
+
+static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
+{
+	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
+	int ret;
+
+	/* Assert M0+ reset */
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				 FSL_XCVR_EXT_CTRL_CORE_RESET,
+				 FSL_XCVR_EXT_CTRL_CORE_RESET);
+	if (ret < 0)
+		dev_err(dev, "Failed to assert M0+ core: %d\n", ret);
+
+	ret = reset_control_assert(xcvr->reset);
+	if (ret < 0)
+		dev_err(dev, "Failed to assert M0+ reset: %d\n", ret);
+
+	regcache_cache_only(xcvr->regmap, true);
+
+	clk_disable_unprepare(xcvr->spba_clk);
+	clk_disable_unprepare(xcvr->phy_clk);
+	clk_disable_unprepare(xcvr->pll_ipg_clk);
+	clk_disable_unprepare(xcvr->ipg_clk);
+
+	return 0;
+}
+
+static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
+{
+	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(xcvr->ipg_clk);
+	if (ret) {
+		dev_err(dev, "failed to start IPG clock.\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(xcvr->pll_ipg_clk);
+	if (ret) {
+		dev_err(dev, "failed to start PLL IPG clock.\n");
+		goto stop_ipg_clk;
+	}
+
+	ret = clk_prepare_enable(xcvr->phy_clk);
+	if (ret) {
+		dev_err(dev, "failed to start PHY clock: %d\n", ret);
+		goto stop_pll_ipg_clk;
+	}
+
+	ret = clk_prepare_enable(xcvr->spba_clk);
+	if (ret) {
+		dev_err(dev, "failed to start SPBA clock.\n");
+		goto stop_phy_clk;
+	}
+
+	regcache_cache_only(xcvr->regmap, false);
+	regcache_mark_dirty(xcvr->regmap);
+	ret = regcache_sync(xcvr->regmap);
+
+	if (ret) {
+		dev_err(dev, "failed to sync regcache.\n");
+		goto stop_spba_clk;
+	}
+
+	ret = reset_control_deassert(xcvr->reset);
+	if (ret) {
+		dev_err(dev, "failed to deassert M0+ reset.\n");
+		goto stop_spba_clk;
+	}
+
+	ret = fsl_xcvr_load_firmware(xcvr);
+	if (ret) {
+		dev_err(dev, "failed to load firmware.\n");
+		goto stop_spba_clk;
+	}
+
+	/* Release M0+ reset */
+	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
+	if (ret < 0) {
+		dev_err(dev, "M0+ core release failed: %d\n", ret);
+		goto stop_spba_clk;
+	}
+
+	/* Let M0+ core complete firmware initialization */
+	msleep(50);
+
+	return 0;
+
+stop_spba_clk:
+	clk_disable_unprepare(xcvr->spba_clk);
+stop_phy_clk:
+	clk_disable_unprepare(xcvr->phy_clk);
+stop_pll_ipg_clk:
+	clk_disable_unprepare(xcvr->pll_ipg_clk);
+stop_ipg_clk:
+	clk_disable_unprepare(xcvr->ipg_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops fsl_xcvr_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend,
+			   fsl_xcvr_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver fsl_xcvr_driver = {
+	.probe = fsl_xcvr_probe,
+	.driver = {
+		.name = "fsl,imx8mp-audio-xcvr",
+		.pm = &fsl_xcvr_pm_ops,
+		.of_match_table = fsl_xcvr_dt_ids,
+	},
+};
+module_platform_driver(fsl_xcvr_driver);
+
+MODULE_AUTHOR("Viorel Suman <viorel.suman@nxp.com>");
+MODULE_DESCRIPTION("NXP Audio Transceiver (XCVR) driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
new file mode 100644
index 00000000..7f2853c
--- /dev/null
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -0,0 +1,266 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * NXP XCVR ALSA SoC Digital Audio Interface (DAI) driver
+ *
+ * Copyright 2019 NXP
+ */
+
+#ifndef __FSL_XCVR_H
+#define __FSL_XCVR_H
+
+#define FSL_XCVR_MODE_SPDIF	0
+#define FSL_XCVR_MODE_ARC	1
+#define FSL_XCVR_MODE_EARC	2
+
+/* XCVR Registers */
+#define FSL_XCVR_REG_OFFSET		0x800 /* regs offset */
+#define FSL_XCVR_FIFO_SIZE		0x80  /* 128 */
+#define FSL_XCVR_FIFO_WMK_RX		(FSL_XCVR_FIFO_SIZE >> 1)   /* 64 */
+#define FSL_XCVR_FIFO_WMK_TX		(FSL_XCVR_FIFO_SIZE >> 1)   /* 64 */
+#define FSL_XCVR_MAXBURST_RX		(FSL_XCVR_FIFO_WMK_RX >> 2) /* 16 */
+#define FSL_XCVR_MAXBURST_TX		(FSL_XCVR_FIFO_WMK_TX >> 2) /* 16 */
+
+#define FSL_XCVR_RX_FIFO_ADDR		0x0C00
+#define FSL_XCVR_TX_FIFO_ADDR		0x0E00
+
+#define FSL_XCVR_VERSION		0x00  /* Version */
+#define FSL_XCVR_EXT_CTRL		0x10  /* Control */
+#define FSL_XCVR_EXT_STATUS		0x20  /* Status */
+#define FSL_XCVR_EXT_IER0		0x30  /* Interrupt en 0 */
+#define FSL_XCVR_EXT_IER1		0x40  /* Interrupt en 1 */
+#define FSL_XCVR_EXT_ISR		0x50  /* Interrupt status */
+#define FSL_XCVR_EXT_ISR_SET		0x54  /* Interrupt status */
+#define FSL_XCVR_EXT_ISR_CLR		0x58  /* Interrupt status */
+#define FSL_XCVR_EXT_ISR_TOG		0x5C  /* Interrupt status */
+#define FSL_XCVR_IER			0x70  /* Interrupt en for M0+ */
+#define FSL_XCVR_ISR			0x80  /* Interrupt status */
+#define FSL_XCVR_ISR_SET		0x84  /* Interrupt status set */
+#define FSL_XCVR_ISR_CLR		0x88  /* Interrupt status clear */
+#define FSL_XCVR_ISR_TOG		0x8C  /* Interrupt status toggle */
+#define FSL_XCVR_PHY_AI_CTRL		0x90
+#define FSL_XCVR_PHY_AI_CTRL_SET	0x94
+#define FSL_XCVR_PHY_AI_CTRL_CLR	0x98
+#define FSL_XCVR_PHY_AI_CTRL_TOG	0x9C
+#define FSL_XCVR_PHY_AI_WDATA		0xA0
+#define FSL_XCVR_PHY_AI_RDATA		0xA4
+#define FSL_XCVR_CLK_CTRL		0xB0
+#define FSL_XCVR_RX_DPTH_CTRL		0x180 /* RX datapath ctrl reg */
+#define FSL_XCVR_RX_DPTH_CTRL_SET	0x184
+#define FSL_XCVR_RX_DPTH_CTRL_CLR	0x188
+#define FSL_XCVR_RX_DPTH_CTRL_TOG	0x18c
+
+#define FSL_XCVR_TX_DPTH_CTRL		0x220 /* TX datapath ctrl reg */
+#define FSL_XCVR_TX_DPTH_CTRL_SET	0x224
+#define FSL_XCVR_TX_DPTH_CTRL_CLR	0x228
+#define FSL_XCVR_TX_DPTH_CTRL_TOG	0x22C
+#define FSL_XCVR_TX_CS_DATA_0		0x230 /* TX channel status bits regs */
+#define FSL_XCVR_TX_CS_DATA_1		0x234
+#define FSL_XCVR_TX_CS_DATA_2		0x238
+#define FSL_XCVR_TX_CS_DATA_3		0x23C
+#define FSL_XCVR_TX_CS_DATA_4		0x240
+#define FSL_XCVR_TX_CS_DATA_5		0x244
+#define FSL_XCVR_DEBUG_REG_0		0x2E0
+#define FSL_XCVR_DEBUG_REG_1		0x2F0
+
+#define FSL_XCVR_MAX_REG		FSL_XCVR_DEBUG_REG_1
+
+#define FSL_XCVR_EXT_CTRL_CORE_RESET	BIT(31)
+
+#define FSL_XCVR_EXT_CTRL_RX_CMDC_RESET	BIT(30)
+#define FSL_XCVR_EXT_CTRL_TX_CMDC_RESET	BIT(29)
+#define FSL_XCVR_EXT_CTRL_CMDC_RESET(t) (t ? BIT(29) : BIT(30))
+
+#define FSL_XCVR_EXT_CTRL_RX_DPTH_RESET	BIT(28)
+#define FSL_XCVR_EXT_CTRL_TX_DPTH_RESET	BIT(27)
+#define FSL_XCVR_EXT_CTRL_DPTH_RESET(t) (t ? BIT(27) : BIT(28))
+
+#define FSL_XCVR_EXT_CTRL_TX_RX_MODE	BIT(26)
+#define FSL_XCVR_EXT_CTRL_DMA_RD_DIS	BIT(25)
+#define FSL_XCVR_EXT_CTRL_DMA_WR_DIS	BIT(24)
+#define FSL_XCVR_EXT_CTRL_DMA_DIS(t)	(t ? BIT(24) : BIT(25))
+#define FSL_XCVR_EXT_CTRL_SPDIF_MODE	BIT(23)
+#define FSL_XCVR_EXT_CTRL_SLEEP_MODE	BIT(21)
+
+#define FSL_XCVR_EXT_CTRL_TX_FWM_SHFT	0
+#define FSL_XCVR_EXT_CTRL_TX_FWM_MASK	GENMASK(6, 0)
+#define FSL_XCVR_EXT_CTRL_TX_FWM(i)	(((i) << FSL_XCVR_EXT_CTRL_TX_FWM_SHFT) \
+					  & FSL_XCVR_EXT_CTRL_TX_FWM_MASK)
+#define FSL_XCVR_EXT_CTRL_RX_FWM_SHFT	8
+#define FSL_XCVR_EXT_CTRL_RX_FWM_MASK	GENMASK(14, 8)
+#define FSL_XCVR_EXT_CTRL_RX_FWM(i)	(((i) << FSL_XCVR_EXT_CTRL_RX_FWM_SHFT) \
+					  & FSL_XCVR_EXT_CTRL_RX_FWM_MASK)
+#define FSL_XCVR_EXT_CTRL_PAGE_SHFT	16
+#define FSL_XCVR_EXT_CTRL_PAGE_MASK	GENMASK(19, 16)
+#define FSL_XCVR_EXT_CTRL_PAGE(i)	(((i) << FSL_XCVR_EXT_CTRL_PAGE_SHFT) \
+					  & FSL_XCVR_EXT_CTRL_PAGE_MASK)
+
+#define FSL_XCVR_EXT_STUS_NT_FIFO_ENTR	GENMASK(7, 0)
+#define FSL_XCVR_EXT_STUS_NR_FIFO_ENTR	GENMASK(15, 8)
+#define FSL_XCVR_EXT_STUS_CM0_SLEEPING	BIT(16)
+#define FSL_XCVR_EXT_STUS_CM0_DEEP_SLP	BIT(17)
+#define FSL_XCVR_EXT_STUS_CM0_SLP_HACK	BIT(18)
+#define FSL_XCVR_EXT_STUS_RX_CMDC_RSTO	BIT(23)
+#define FSL_XCVR_EXT_STUS_TX_CMDC_RSTO	BIT(24)
+#define FSL_XCVR_EXT_STUS_RX_CMDC_COTO	BIT(25)
+#define FSL_XCVR_EXT_STUS_TX_CMDC_COTO	BIT(26)
+#define FSL_XCVR_EXT_STUS_HB_STATUS	BIT(27)
+#define FSL_XCVR_EXT_STUS_NEW_UD4_REC	BIT(28)
+#define FSL_XCVR_EXT_STUS_NEW_UD5_REC	BIT(29)
+#define FSL_XCVR_EXT_STUS_NEW_UD6_REC	BIT(30)
+#define FSL_XCVR_EXT_STUS_HPD_INPUT	BIT(31)
+
+#define FSL_XCVR_IRQ_NEW_CS		BIT(0)
+#define FSL_XCVR_IRQ_NEW_UD		BIT(1)
+#define FSL_XCVR_IRQ_MUTE		BIT(2)
+#define FSL_XCVR_IRQ_CMDC_RESP_TO	BIT(3)
+#define FSL_XCVR_IRQ_ECC_ERR		BIT(4)
+#define FSL_XCVR_IRQ_PREAMBLE_MISMATCH	BIT(5)
+#define FSL_XCVR_IRQ_FIFO_UOFL_ERR	BIT(6)
+#define FSL_XCVR_IRQ_HOST_WAKEUP	BIT(7)
+#define FSL_XCVR_IRQ_HOST_OHPD		BIT(8)
+#define FSL_XCVR_IRQ_DMAC_NO_DATA_REC	BIT(9)
+#define FSL_XCVR_IRQ_DMAC_FMT_CHG_DET	BIT(10)
+#define FSL_XCVR_IRQ_HB_STATE_CHG	BIT(11)
+#define FSL_XCVR_IRQ_CMDC_STATUS_UPD	BIT(12)
+#define FSL_XCVR_IRQ_TEMP_UPD		BIT(13)
+#define FSL_XCVR_IRQ_DMA_RD_REQ		BIT(14)
+#define FSL_XCVR_IRQ_DMA_WR_REQ		BIT(15)
+#define FSL_XCVR_IRQ_DMAC_BME_BIT_ERR	BIT(16)
+#define FSL_XCVR_IRQ_PREAMBLE_MATCH	BIT(17)
+#define FSL_XCVR_IRQ_M_W_PRE_MISMATCH	BIT(18)
+#define FSL_XCVR_IRQ_B_PRE_MISMATCH	BIT(19)
+#define FSL_XCVR_IRQ_UNEXP_PRE_REC	BIT(20)
+#define FSL_XCVR_IRQ_ARC_MODE		BIT(21)
+#define FSL_XCVR_IRQ_CH_UD_OFLOW	BIT(22)
+#define FSL_XCVR_IRQ_EARC_ALL		(FSL_XCVR_IRQ_NEW_CS | \
+					 FSL_XCVR_IRQ_NEW_UD | \
+					 FSL_XCVR_IRQ_MUTE | \
+					 FSL_XCVR_IRQ_FIFO_UOFL_ERR | \
+					 FSL_XCVR_IRQ_HOST_WAKEUP | \
+					 FSL_XCVR_IRQ_ARC_MODE)
+
+#define FSL_XCVR_ISR_CMDC_TX_EN		BIT(3)
+#define FSL_XCVR_ISR_HPD_TGL		BIT(15)
+#define FSL_XCVR_ISR_DMAC_SPARE_INT	BIT(19)
+#define FSL_XCVR_ISR_SET_SPDIF_RX_INT	BIT(20)
+#define FSL_XCVR_ISR_SET_SPDIF_TX_INT	BIT(21)
+#define FSL_XCVR_ISR_SET_SPDIF_MODE(t)	(t ? BIT(21) : BIT(20))
+#define FSL_XCVR_ISR_SET_ARC_CM_INT	BIT(22)
+#define FSL_XCVR_ISR_SET_ARC_SE_INT	BIT(23)
+
+#define FSL_XCVR_PHY_AI_ADDR_MASK	GENMASK(7, 0)
+#define FSL_XCVR_PHY_AI_RESETN		BIT(15)
+#define FSL_XCVR_PHY_AI_TOG_PLL		BIT(24)
+#define FSL_XCVR_PHY_AI_TOG_DONE_PLL	BIT(25)
+#define FSL_XCVR_PHY_AI_TOG_PHY		BIT(26)
+#define FSL_XCVR_PHY_AI_TOG_DONE_PHY	BIT(27)
+#define FSL_XCVR_PHY_AI_RW_MASK		BIT(31)
+
+#define FSL_XCVR_RX_DPTH_CTRL_PAPB_FIFO_STATUS	BIT(0)
+#define FSL_XCVR_RX_DPTH_CTRL_DIS_PRE_ERR_CHK	BIT(1)
+#define FSL_XCVR_RX_DPTH_CTRL_DIS_NOD_REC_CHK	BIT(2)
+#define FSL_XCVR_RX_DPTH_CTRL_ECC_VUC_BIT_CHK	BIT(3)
+#define FSL_XCVR_RX_DPTH_CTRL_EN_CMP_PAR_CALC	BIT(4)
+#define FSL_XCVR_RX_DPTH_CTRL_RST_PKT_CNT_FIFO	BIT(5)
+#define FSL_XCVR_RX_DPTH_CTRL_STORE_FMT		BIT(6)
+#define FSL_XCVR_RX_DPTH_CTRL_EN_PAR_CALC	BIT(7)
+#define FSL_XCVR_RX_DPTH_CTRL_UDR		BIT(8)
+#define FSL_XCVR_RX_DPTH_CTRL_CSR		BIT(9)
+#define FSL_XCVR_RX_DPTH_CTRL_UDA		BIT(10)
+#define FSL_XCVR_RX_DPTH_CTRL_CSA		BIT(11)
+#define FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO	BIT(12)
+#define FSL_XCVR_RX_DPTH_CTRL_DIS_B_PRE_ERR_CHK	BIT(13)
+#define FSL_XCVR_RX_DPTH_CTRL_PABS		BIT(19)
+#define FSL_XCVR_RX_DPTH_CTRL_DTS_CDS		BIT(20)
+#define FSL_XCVR_RX_DPTH_CTRL_BLKC		BIT(21)
+#define FSL_XCVR_RX_DPTH_CTRL_MUTE_CTRL		BIT(22)
+#define FSL_XCVR_RX_DPTH_CTRL_MUTE_MODE		BIT(23)
+#define FSL_XCVR_RX_DPTH_CTRL_FMT_CHG_CTRL	BIT(24)
+#define FSL_XCVR_RX_DPTH_CTRL_FMT_CHG_MODE	BIT(25)
+#define FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL		BIT(26)
+#define FSL_XCVR_RX_DPTH_CTRL_LAYB_MODE		BIT(27)
+#define FSL_XCVR_RX_DPTH_CTRL_PRC		BIT(28)
+#define FSL_XCVR_RX_DPTH_CTRL_COMP		BIT(29)
+#define FSL_XCVR_RX_DPTH_CTRL_FSM		GENMASK(31, 30)
+
+#define FSL_XCVR_TX_DPTH_CTRL_CS_ACK		BIT(0)
+#define FSL_XCVR_TX_DPTH_CTRL_UD_ACK		BIT(1)
+#define FSL_XCVR_TX_DPTH_CTRL_CS_MOD		BIT(2)
+#define FSL_XCVR_TX_DPTH_CTRL_UD_MOD		BIT(3)
+#define FSL_XCVR_TX_DPTH_CTRL_VLD_MOD		BIT(4)
+#define FSL_XCVR_TX_DPTH_CTRL_FRM_VLD		BIT(5)
+#define FSL_XCVR_TX_DPTH_CTRL_EN_PARITY		BIT(6)
+#define FSL_XCVR_TX_DPTH_CTRL_EN_PREAMBLE	BIT(7)
+#define FSL_XCVR_TX_DPTH_CTRL_EN_ECC_INTER	BIT(8)
+#define FSL_XCVR_TX_DPTH_CTRL_BYPASS_FEM	BIT(10)
+#define FSL_XCVR_TX_DPTH_CTRL_FRM_FMT		BIT(11)
+#define FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX	BIT(14)
+#define FSL_XCVR_TX_DPTH_CTRL_ADD_CYC_TX_OE_STR	BIT(15)
+#define FSL_XCVR_TX_DPTH_CTRL_ADD_CYC_TX_OE_END	BIT(16)
+#define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
+#define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
+
+#define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
+
+#define FSL_XCVR_PLL_CTRL0			0x00
+#define FSL_XCVR_PLL_CTRL0_SET			0x04
+#define FSL_XCVR_PLL_CTRL0_CLR			0x08
+#define FSL_XCVR_PLL_NUM			0x20
+#define FSL_XCVR_PLL_DEN			0x30
+#define FSL_XCVR_PLL_PDIV			0x40
+#define FSL_XCVR_PLL_BANDGAP_SET		0x54
+#define FSL_XCVR_PHY_CTRL			0x00
+#define FSL_XCVR_PHY_CTRL_SET			0x04
+#define FSL_XCVR_PHY_CTRL_CLR			0x08
+#define FSL_XCVR_PHY_CTRL2			0x70
+#define FSL_XCVR_PHY_CTRL2_SET			0x74
+#define FSL_XCVR_PHY_CTRL2_CLR			0x78
+
+#define FSL_XCVR_PLL_BANDGAP_EN_VBG		BIT(0)
+#define FSL_XCVR_PLL_CTRL0_HROFF		BIT(13)
+#define FSL_XCVR_PLL_CTRL0_PWP			BIT(14)
+#define FSL_XCVR_PLL_CTRL0_CM0_EN		BIT(24)
+#define FSL_XCVR_PLL_CTRL0_CM1_EN		BIT(25)
+#define FSL_XCVR_PLL_CTRL0_CM2_EN		BIT(26)
+#define FSL_XCVR_PLL_PDIVx(v, i)		((v & 0x7) << (4 * i))
+
+#define FSL_XCVR_PHY_CTRL_PHY_EN		BIT(0)
+#define FSL_XCVR_PHY_CTRL_RX_CM_EN		BIT(1)
+#define FSL_XCVR_PHY_CTRL_TSDIFF_OE		BIT(5)
+#define FSL_XCVR_PHY_CTRL_SPDIF_EN		BIT(8)
+#define FSL_XCVR_PHY_CTRL_ARC_MODE_SE_EN	BIT(9)
+#define FSL_XCVR_PHY_CTRL_ARC_MODE_CM_EN	BIT(10)
+#define FSL_XCVR_PHY_CTRL_TX_CLK_MASK		GENMASK(26, 25)
+#define FSL_XCVR_PHY_CTRL_TX_CLK_HDMI_SS	BIT(25)
+#define FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS		BIT(26)
+#define FSL_XCVR_PHY_CTRL2_EARC_TXMS		BIT(14)
+
+#define FSL_XCVR_CS_DATA_0_FS_MASK		GENMASK(31, 24)
+#define FSL_XCVR_CS_DATA_0_FS_32000		0x3000000
+#define FSL_XCVR_CS_DATA_0_FS_44100		0x0000000
+#define FSL_XCVR_CS_DATA_0_FS_48000		0x2000000
+#define FSL_XCVR_CS_DATA_0_FS_64000		0xB000000
+#define FSL_XCVR_CS_DATA_0_FS_88200		0x8000000
+#define FSL_XCVR_CS_DATA_0_FS_96000		0xA000000
+#define FSL_XCVR_CS_DATA_0_FS_176400		0xC000000
+#define FSL_XCVR_CS_DATA_0_FS_192000		0xE000000
+
+#define FSL_XCVR_CS_DATA_0_CH_MASK		0x3A
+#define FSL_XCVR_CS_DATA_0_CH_U2LPCM		0x00
+#define FSL_XCVR_CS_DATA_0_CH_UMLPCM		0x20
+#define FSL_XCVR_CS_DATA_0_CH_U1BAUD		0x30
+
+#define FSL_XCVR_CS_DATA_1_CH_MASK		0xF000
+#define FSL_XCVR_CS_DATA_1_CH_2			0x0000
+#define FSL_XCVR_CS_DATA_1_CH_8			0x7000
+#define FSL_XCVR_CS_DATA_1_CH_16		0xB000
+#define FSL_XCVR_CS_DATA_1_CH_32		0x3000
+
+/* Data memory structures */
+#define FSL_XCVR_RX_CS_CTRL_0		0x20 /* First  RX CS control register */
+#define FSL_XCVR_RX_CS_CTRL_1		0x24 /* Second RX CS control register */
+#define FSL_XCVR_RX_CS_BUFF_0		0x80 /* First  RX CS buffer */
+#define FSL_XCVR_RX_CS_BUFF_1		0xA0 /* Second RX CS buffer */
+#define FSL_XCVR_CAP_DATA_STR		0x300 /* Capabilities data structure */
+
+#endif /* __FSL_XCVR_H */
-- 
2.7.4

