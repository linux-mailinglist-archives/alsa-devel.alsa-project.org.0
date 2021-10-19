Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D24432F11
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83E716C0;
	Tue, 19 Oct 2021 09:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83E716C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634627565;
	bh=e19RPy14bythqyjv+H6moOuXjbGdJW+CjVEJruwQz0c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+va4/8j7yVUw2VUnVbC9d4ThkIFqH90A+eNJImPpi5OSBxaiAmjGROz6GWqVLCbH
	 5TkuZwATDs33IQd87VcKpx1Qoc0TQlskWQp0D0gV5RodTj4NeJsFVoONaQAo/mO9jY
	 F43MOcoAuxeQTWGFPZagYI16C+fb3+MCspv9Obdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C599DF804F1;
	Tue, 19 Oct 2021 09:11:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F9ABF804F1; Tue, 19 Oct 2021 09:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C85EF80254
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C85EF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="4UsJDm0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdLUkQPoLi2SoWTVeBhTWHP4jv9OKekRrwDM9ic4wVTItsW5QiMFCgmAv6TwzzWlmW8eYaHCI8CUFeBNXRHt66nbz6rD5dC4JMeg9TtvOPI11PEPDwZQHrVEpVEv7t5tgGH3lIHvQMl+ENvWq+V0VdNFUF3XUPSDk6gx0Usp4Tv5lY7XQUvUZ6DZirKxsxUdPvjfM9Iqevl4Q523qZ357QmbPY8GeqoM2nUn7amqOMXBIZnxdOr75KW2R0uvwWxz6WoXfzgO2DZv9iOJ5X1x6xCXqfNl2fD5fzecpfQ5cSkKUWNaUxOU2i4P8yMy0EvcD/fbnqDP7nR09gL4+zF5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TXC9GNT+mQF4wcImK9ZfDJfCdrImX2nJl3lOYafnx8=;
 b=O8xVoH687ZDetvEgqhZaWaroaaRJ33V4nIJkJ0HfGqZ1RPPBg57Llzy224ScgnUjqGxqT7gnKMU6hzXDVJPsxoLCYAXpyYuDWIWqSxafwjZQVEskS4UXOMJ2TDjQx5ZC/i2RADBgh3B5iHn32g1D7hHpjFrQ+sHCWhEPF8f001ju/iy99ksuZjtIHdQuKTii6arQrAqNKpsvOOQwLxJ1fCpvJ2GM4rq8hs0LiAq1r3rhYa/erj0gjxBKL+qd/5euWG+PGYlvdxMPXjsqnDITV//Oi54mtTGDZf+gIucNBnnaqI47VmKS79cZjb2sOvwLlXZZp69sKHxYVd8awXnT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TXC9GNT+mQF4wcImK9ZfDJfCdrImX2nJl3lOYafnx8=;
 b=4UsJDm0XC8zq9w5/fMwzU5oYjlOcwSJqrVJrredkQB253I4XQQ2KO9EfIZwPu0T6uJTEQ/UYo3tznfBk/gCllVcsradovj+gBjmhNTBeji/1PUDEuQ4BjLrdKAMU/BK4t5wTuE/c97u+4dHezEWhzFG1UOGxcU9XekV9hc99qFg=
Received: from MWHPR12CA0043.namprd12.prod.outlook.com (2603:10b6:301:2::29)
 by MN2PR12MB4240.namprd12.prod.outlook.com (2603:10b6:208:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 07:11:14 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::84) by MWHPR12CA0043.outlook.office365.com
 (2603:10b6:301:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 07:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:11:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 02:11:12 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Tue, 19 Oct 2021 02:11:08 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 4/8] ASoC: amd: acp: Add generic machine driver support for
 ACP cards
Date: Tue, 19 Oct 2021 12:39:34 +0530
Message-ID: <20211019070938.5076-5-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019070938.5076-1-AjitKumar.Pandey@amd.com>
References: <20211019070938.5076-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b58eb72-2b06-43cc-55d8-08d992cfa31b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4240:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42401512A3DEE5A64BC7214882BD9@MN2PR12MB4240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nB6t3Y8xSY7REkN7E8xPsqXO2tzKB6TX+1d4vEMX/cY+jRLxzYJLbF3e/hdDy8zouwB3VsBg9EG+rsozB2ctX6YaSqPsG2Q+dFOhhl5di9WN/WIPI94UB5Re/J373fZAtJa+wdmbu/CutRG6U8SZFopYUqw/2IUn426UCnZ42LWRE9/5gsDD+D1qOiaqWA1+5Xf4Y9YzVuddck7IcYhOw7smozIliz2VfGH2VNgU8ZpgCNNtWrqEaIAqnv6mlvcic33N7MfUq5GRmBMIGjR1/vzNT/B37+HAZfpHbgFFCOYsmAWw9yZfHIRiPBbtFlAXnR6hr0g/+H6cz1+2H5hZhlqo53P3ZOBmfw2PoU8CoSyHXlzodBmzL+lMMvtuGqr8KFEJn+irRafiNsJ5SAS2tmM3u1Qh1iXwHwDF2Dm8B79GYimpwjlX19xCBRV2GQ0qK/diUKSrpDoD126/L4MzNN/nNVFI79o2OZCgxsRG7zo1mRsH5GNv6h5JQp7EEyht98dmhR3MQIIOu6rk3ij2fhjKOe4ZAPNzfLQ/Y+Dabi8GVMR2NZTwPe+NHTU+Ac4CGL+eXwJpHEPwMvQ1hCXA8BXA23rLgRJRtIZDP+PeziM7wJ2ysayOlpxcx9LqOyrjZsYJF6OUzrl/MHS7P582C+PJTiEQR+r1tIbSZKrhq+E1bn2OQbTTkW+FOX+3XMosuJIA+VyfjgTN3WZOtGsteRMW/vAkS9SdACU0qlGuAsQ1NRO5O2Weq82HlnGmX7NRlPXj/GrxLDmq9gM1l9aPg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(2616005)(54906003)(426003)(83380400001)(36756003)(1076003)(110136005)(70586007)(70206006)(316002)(336012)(508600001)(47076005)(36860700001)(7696005)(6666004)(5660300002)(81166007)(82310400003)(2906002)(30864003)(4326008)(8676002)(356005)(8936002)(186003)(86362001)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:11:14.0529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b58eb72-2b06-43cc-55d8-08d992cfa31b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

We have machines with different audio endpoints configurations
across various distributions. We need to support multiple sound
cards for different combinations of I2S instance and codecs hw.
Now we also need to support SOF-DSP endpoints based sound cards.
All such card combinations slightly differs in terms of machine
ops callback. This patch adds ACP generic machine driver module
that exposes method to create ACP cards dai links and define new
ops for audio endpoints configurations. Initially we have added
dailink support for RT5682 and RT1019 codec connection with ACP
I2S_SP instance. We will add newer codecs in this module to use
this for all AMD's ACP block sound cards supports in future.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig           |  10 +
 sound/soc/amd/acp/Makefile          |   5 +
 sound/soc/amd/acp/acp-mach-common.c | 467 ++++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h        |  55 ++++
 4 files changed, 537 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-mach-common.c
 create mode 100644 sound/soc/amd/acp/acp-mach.h

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index e01822ff0694..7ce43e393643 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -25,3 +25,13 @@ config SND_AMD_ASOC_RENOIR
 	depends on X86 && PCI
 	help
 	  This option enables Renoir I2S support on AMD platform.
+
+config SND_SOC_AMD_MACH_COMMON
+	tristate
+	select CLK_FIXED_FCH
+	select SND_SOC_RT5682_I2C
+	select SND_SOC_DMIC
+	select SND_SOC_RT1019
+	depends on X86 && PCI && I2C
+	help
+	  This option enables common Machine driver module for ACP.
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 42bff3515f24..a477a18272bf 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -11,7 +11,12 @@ snd-acp-i2s-objs     := acp-i2s.o
 #platform specific driver
 snd-acp-renoir-objs     := acp-renoir.o
 
+#machine specific driver
+snd-acp-mach-objs     := acp-mach-common.o
+
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
 
 obj-$(CONFIG_SND_AMD_ASOC_RENOIR) += snd-acp-renoir.o
+
+obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
new file mode 100644
index 000000000000..76300dc6ad4e
--- /dev/null
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -0,0 +1,467 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+//	    Vijendar Mukunda <Vijendar.Mukunda@amd.com>
+//
+
+/*
+ * Machine Driver Interface for ACP HW block
+ */
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-dapm.h>
+#include <sound/soc.h>
+#include <linux/input.h>
+#include <linux/module.h>
+
+#include "../../codecs/rt5682.h"
+#include "../../codecs/rt1019.h"
+#include "acp-mach.h"
+
+#define PCO_PLAT_CLK 48000000
+#define RT5682_PLL_FREQ (48000 * 512)
+#define DUAL_CHANNEL	2
+#define FOUR_CHANNEL	4
+
+static struct snd_soc_jack pco_jack;
+
+static const unsigned int channels[] = {
+	DUAL_CHANNEL,
+};
+
+static const unsigned int rates[] = {
+	48000,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_rates = {
+	.count = ARRAY_SIZE(rates),
+	.list  = rates,
+	.mask = 0,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_channels = {
+	.count = ARRAY_SIZE(channels),
+	.list = channels,
+	.mask = 0,
+};
+
+static int acp_clk_enable(struct acp_card_drvdata *drvdata)
+{
+	clk_set_rate(drvdata->wclk, 48000);
+	clk_set_rate(drvdata->bclk, 48000 * 64);
+
+	return clk_prepare_enable(drvdata->wclk);
+}
+
+/* Declare RT5682 codec components */
+SND_SOC_DAILINK_DEF(rt5682,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
+
+static const struct snd_soc_dapm_route rt5682_map[] = {
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+};
+
+/* Define card ops for RT5682 CODEC */
+static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	int ret;
+
+	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
+
+	if (drvdata->hs_codec_id != RT5682)
+		return -EINVAL;
+
+	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				   | SND_SOC_DAIFMT_CBP_CFP);
+	if (ret < 0) {
+		dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL2, RT5682_PLL2_S_MCLK,
+				  PCO_PLAT_CLK, RT5682_PLL_FREQ);
+	if (ret < 0) {
+		dev_err(rtd->dev, "Failed to set codec PLL: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2,
+				     RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "Failed to set codec SYSCLK: %d\n", ret);
+		return ret;
+	}
+
+	/* Set tdm/i2s1 master bclk ratio */
+	ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+	if (ret < 0) {
+		dev_err(rtd->dev, "Failed to set rt5682 tdm bclk ratio: %d\n", ret);
+		return ret;
+	}
+
+	drvdata->wclk = clk_get(component->dev, "rt5682-dai-wclk");
+	drvdata->bclk = clk_get(component->dev, "rt5682-dai-bclk");
+
+	ret = snd_soc_card_jack_new(card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
+				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				    &pco_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "HP jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682_map, ARRAY_SIZE(rt5682_map));
+}
+
+static int acp_card_hs_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				   | SND_SOC_DAIFMT_CBP_CFP);
+	if (ret < 0) {
+		dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
+		return ret;
+	}
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				      &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				      &constraints_rates);
+
+	ret = acp_clk_enable(drvdata);
+	if (ret < 0)
+		dev_err(rtd->card->dev, "Failed to enable HS clk: %d\n", ret);
+
+	return ret;
+}
+
+static void acp_card_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+
+	clk_disable_unprepare(drvdata->wclk);
+}
+
+static const struct snd_soc_ops acp_card_rt5682_ops = {
+	.startup = acp_card_hs_startup,
+	.shutdown = acp_card_shutdown,
+};
+
+/* Declare RT1019 codec components */
+SND_SOC_DAILINK_DEF(rt1019,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1019:01", "rt1019-aif"),
+			  COMP_CODEC("i2c-10EC1019:02", "rt1019-aif")));
+
+static const struct snd_soc_dapm_route rt1019_map_lr[] = {
+	{ "Left Spk", NULL, "Left SPO" },
+	{ "Right Spk", NULL, "Right SPO" },
+};
+
+static struct snd_soc_codec_conf rt1019_conf[] = {
+	{
+		 .dlc = COMP_CODEC_CONF("i2c-10EC1019:01"),
+		 .name_prefix = "Left",
+	},
+	{
+		 .dlc = COMP_CODEC_CONF("i2c-10EC1019:02"),
+		 .name_prefix = "Right",
+	},
+};
+
+static int acp_card_rt1019_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+
+	if (drvdata->amp_codec_id != RT1019)
+		return -EINVAL;
+
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, rt1019_map_lr,
+				       ARRAY_SIZE(rt1019_map_lr));
+}
+
+static int acp_card_rt1019_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+	struct snd_soc_dai *codec_dai;
+	int srate, i, ret = 0;
+
+	srate = params_rate(params);
+
+	if (drvdata->amp_codec_id != RT1019)
+		return -EINVAL;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (strcmp(codec_dai->name, "rt1019-aif"))
+			continue;
+
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1019_PLL_S_BCLK,
+					  64 * srate, 256 * srate);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1019_SCLK_S_PLL,
+					     256 * srate, SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int acp_card_amp_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+	int ret;
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				      &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				      &constraints_rates);
+
+	ret = acp_clk_enable(drvdata);
+	if (ret < 0)
+		dev_err(rtd->card->dev, "Failed to enable AMP clk: %d\n", ret);
+
+	return ret;
+}
+
+static const struct snd_soc_ops acp_card_rt1019_ops = {
+	.startup = acp_card_amp_startup,
+	.shutdown = acp_card_shutdown,
+	.hw_params = acp_card_rt1019_hw_params,
+};
+
+/* Declare DMIC codec components */
+SND_SOC_DAILINK_DEF(dmic_codec,
+		DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
+
+/* Declare ACP CPU components */
+static struct snd_soc_dai_link_component dummy_codec[] = {
+	{
+		.name = "snd-soc-dummy",
+		.dai_name = "snd-soc-dummy-dai",
+	}
+};
+
+static struct snd_soc_dai_link_component platform_component[] = {
+	{
+		 .name = "acp_asoc_renoir.0",
+	}
+};
+
+static struct snd_soc_dai_link_component sof_component[] = {
+	{
+		 .name = "0000:04:00.5",
+	}
+};
+
+SND_SOC_DAILINK_DEF(i2s_sp,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp-i2s-sp")));
+SND_SOC_DAILINK_DEF(sof_sp,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-sp")));
+SND_SOC_DAILINK_DEF(sof_dmic,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-dmic")));
+
+int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *links;
+	struct device *dev = card->dev;
+	struct acp_card_drvdata *drv_data = card->drvdata;
+	int i = 0, num_links = 0;
+
+	if (drv_data->hs_cpu_id)
+		num_links++;
+	if (drv_data->amp_cpu_id)
+		num_links++;
+	if (drv_data->dmic_cpu_id)
+		num_links++;
+
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) * num_links, GFP_KERNEL);
+	if (!links)
+		return -ENOMEM;
+
+	if (drv_data->hs_cpu_id == I2S_SP) {
+		links[i].name = "acp-headset-codec";
+		links[i].id = HEADSET_BE_ID;
+		links[i].cpus = sof_sp;
+		links[i].num_cpus = ARRAY_SIZE(sof_sp);
+		links[i].platforms = sof_component;
+		links[i].num_platforms = ARRAY_SIZE(sof_component);
+		links[i].dpcm_playback = 1;
+		links[i].dpcm_capture = 1;
+		links[i].nonatomic = true;
+		links[i].no_pcm = 1;
+		if (!drv_data->hs_codec_id) {
+			/* Use dummy codec if codec id not specified */
+			links[i].codecs = dummy_codec;
+			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+		}
+		if (drv_data->hs_codec_id == RT5682) {
+			links[i].codecs = rt5682;
+			links[i].num_codecs = ARRAY_SIZE(rt5682);
+			links[i].init = acp_card_rt5682_init;
+			links[i].ops = &acp_card_rt5682_ops;
+		}
+		i++;
+	}
+
+	if (drv_data->amp_cpu_id == I2S_SP) {
+		links[i].name = "acp-amp-codec";
+		links[i].id = AMP_BE_ID;
+		links[i].cpus = sof_sp;
+		links[i].num_cpus = ARRAY_SIZE(sof_sp);
+		links[i].platforms = sof_component;
+		links[i].num_platforms = ARRAY_SIZE(sof_component);
+		links[i].dpcm_playback = 1;
+		links[i].nonatomic = true;
+		links[i].no_pcm = 1;
+		if (!drv_data->amp_codec_id) {
+			/* Use dummy codec if codec id not specified */
+			links[i].codecs = dummy_codec;
+			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+		}
+		if (drv_data->amp_codec_id == RT1019) {
+			links[i].codecs = rt1019;
+			links[i].num_codecs = ARRAY_SIZE(rt1019);
+			links[i].ops = &acp_card_rt1019_ops;
+			links[i].init = acp_card_rt1019_init;
+			card->codec_conf = rt1019_conf;
+			card->num_configs = ARRAY_SIZE(rt1019_conf);
+		}
+		i++;
+	}
+
+	if (drv_data->dmic_cpu_id == DMIC) {
+		links[i].name = "acp-dmic-codec";
+		links[i].id = DMIC_BE_ID;
+		links[i].codecs = dmic_codec;
+		links[i].num_codecs = ARRAY_SIZE(dmic_codec);
+		links[i].cpus = sof_dmic;
+		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
+		links[i].platforms = sof_component;
+		links[i].num_platforms = ARRAY_SIZE(sof_component);
+		links[i].dpcm_capture = 1;
+		links[i].nonatomic = true;
+		links[i].no_pcm = 1;
+	}
+
+	card->dai_link = links;
+	card->num_links = num_links;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(acp_sofdsp_dai_links_create, SND_SOC_AMD_MACH);
+
+int acp_legacy_dai_links_create(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *links;
+	struct device *dev = card->dev;
+	struct acp_card_drvdata *drv_data = card->drvdata;
+	int i = 0, num_links = 0;
+
+	if (drv_data->hs_cpu_id)
+		num_links++;
+	if (drv_data->amp_cpu_id)
+		num_links++;
+	if (drv_data->dmic_cpu_id)
+		num_links++;
+
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) * num_links, GFP_KERNEL);
+
+	if (drv_data->hs_cpu_id == I2S_SP) {
+		links[i].name = "acp-headset-codec";
+		links[i].id = HEADSET_BE_ID;
+		links[i].cpus = i2s_sp;
+		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
+		links[i].platforms = platform_component;
+		links[i].num_platforms = ARRAY_SIZE(platform_component);
+		links[i].dpcm_playback = 1;
+		links[i].dpcm_capture = 1;
+		if (!drv_data->hs_codec_id) {
+			/* Use dummy codec if codec id not specified */
+			links[i].codecs = dummy_codec;
+			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+		}
+		if (drv_data->hs_codec_id == RT5682) {
+			links[i].codecs = rt5682;
+			links[i].num_codecs = ARRAY_SIZE(rt5682);
+			links[i].init = acp_card_rt5682_init;
+			links[i].ops = &acp_card_rt5682_ops;
+		}
+		i++;
+	}
+
+	if (drv_data->amp_cpu_id == I2S_SP) {
+		links[i].name = "acp-amp-codec";
+		links[i].id = AMP_BE_ID;
+		links[i].cpus = i2s_sp;
+		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
+		links[i].platforms = platform_component;
+		links[i].num_platforms = ARRAY_SIZE(platform_component);
+		links[i].dpcm_playback = 1;
+		if (!drv_data->amp_codec_id) {
+			/* Use dummy codec if codec id not specified */
+			links[i].codecs = dummy_codec;
+			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+		}
+		if (drv_data->amp_codec_id == RT1019) {
+			links[i].codecs = rt1019;
+			links[i].num_codecs = ARRAY_SIZE(rt1019);
+			links[i].ops = &acp_card_rt1019_ops;
+			links[i].init = acp_card_rt1019_init;
+			card->codec_conf = rt1019_conf;
+			card->num_configs = ARRAY_SIZE(rt1019_conf);
+		}
+	}
+
+	card->dai_link = links;
+	card->num_links = num_links;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(acp_legacy_dai_links_create, SND_SOC_AMD_MACH);
+
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
new file mode 100644
index 000000000000..464fb7eb802d
--- /dev/null
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license. When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Author: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+ */
+#ifndef __ACP_MACH_H
+#define __ACP_MACH_H
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-dapm.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <sound/soc.h>
+
+enum be_id {
+	HEADSET_BE_ID = 0,
+	AMP_BE_ID,
+	DMIC_BE_ID,
+};
+
+enum cpu_endpoints {
+	NONE = 0,
+	I2S_SP,
+	I2S_BT,
+	DMIC,
+};
+
+enum codec_endpoints {
+	DUMMY = 0,
+	RT5682,
+	RT1019,
+};
+
+struct acp_card_drvdata {
+	unsigned int hs_cpu_id;
+	unsigned int amp_cpu_id;
+	unsigned int dmic_cpu_id;
+	unsigned int hs_codec_id;
+	unsigned int amp_codec_id;
+	unsigned int dmic_codec_id;
+	unsigned int dai_fmt;
+	struct clk *wclk;
+	struct clk *bclk;
+};
+
+int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
+int acp_legacy_dai_links_create(struct snd_soc_card *card);
+
+#endif
-- 
2.25.1

