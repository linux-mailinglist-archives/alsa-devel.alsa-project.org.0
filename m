Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC537428ABE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 12:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04874168B;
	Mon, 11 Oct 2021 12:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04874168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633948086;
	bh=Gg5UohZhgbRsOB5ky/BO922I9cZrioxybRMpuMp6UI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7h1jIfpO2noi7LZoY6TqkUXmxdS9VjBYWH8LJrlCDIHbqS+3RI6M3lL70VgiYH42
	 ytpfl4wOy8j6cSNTEvd0LH5pIkooHwdLAaeqfrqZIqKkHoz+lsYFRTgbVim3Yh4Hhm
	 xY3tedMVOTs4bMoc4PAacq+rdWN6EdvrGyF3+h3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A66CF804C2;
	Mon, 11 Oct 2021 12:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2A9F80430; Mon, 11 Oct 2021 12:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4714F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 12:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4714F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="1ZfNYdn/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sgz+i3GJOqjiokJ9jYCPofhJ1dZUdriIDFjagP0nVksjtIUiq6XSXLENQItqYkQzDj0HMtLB5KDcNo2eoCQQ3QXYaGTDG6EKQmLIysTIE1RPrqPcnM/wfozlaStLBN76JXOvtgLm2eHEkcuYyQE0Aji7qHwzd6+/Zc5528suw+sUTAaAjNm3uJ+wYzyqs7UnkDhRsGS96wfuDixcaQ3AH5tNMkQ+tLU+a6YQlJX9nHx+sh+lL8EaHbbcZrA+reVLiz2+94fu9FTOSejCE7djsRCDCbXRJoyrRxvoMiAXrsyHolMlkOqRu2VcH57zx2SGAopaw6+QeYl7fTjswsHrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0r/7Gihr6buXzeCukXvEHc5xdUG3eqeQ1r7P9a3SPs=;
 b=MPU+MBlrHjFVAw2wFqFrqf50n3RCA0CBTQM/WGWkrMS0RdlHfgHeao641W4mf9ecJ0HWbKyQX8nRluL4IULhP1neJqrKq1siFfrzt/vqn61Wrpr+vnaNdluADBUvFufCHSnrouU0JHqUuHTzacIBtf1VXw3A2yOj66WZMXxPfsrZ4EPXxEPUOGptAYwQI7yOpiLEuXzXVHDUq+8+pKNQt9H0vALJixUbcUrSUD7FPQQmvakOxsUUQgiDEDyNjMsD9LEE15J9fokKcOp6HzpuQ43enG7T+4nb28Fg/YOrR0pU7r1THGWYtredHyHgbGHe0VNnM12AjRLO7C+3hhWV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0r/7Gihr6buXzeCukXvEHc5xdUG3eqeQ1r7P9a3SPs=;
 b=1ZfNYdn/vmjKCBaCo+VqcTWEvZ9LgeM9f58jVb13aGQ6KeSjdpds8kOcNnhNxpdqP39OHbZOvudEJXtdJ1Uw5G4oxNANovho5An+UpYihXKxut9Y2LV4zllfvTKAimj/tPGjECUW67phI0mJP67dZYeQLZAYCKzkUSYMjPJKMzA=
Received: from MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40) by
 DM5PR12MB1371.namprd12.prod.outlook.com (2603:10b6:3:78::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.22; Mon, 11 Oct 2021 10:26:14 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::6d) by MW2PR16CA0027.outlook.office365.com
 (2603:10b6:907::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 10:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 10:26:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 05:26:12 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8
 via Frontend Transport; Mon, 11 Oct 2021 05:26:08 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/3] ASoC: amd: add vangogh machine driver
Date: Tue, 12 Oct 2021 00:17:02 +0530
Message-ID: <20211011184715.61573-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
References: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 367bab6f-f36f-495f-ed24-08d98ca18d8f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1371:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1371CBC61C71946EAF030B2497B59@DM5PR12MB1371.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wbn8DB42C1Fp4Z0cJQKv8DKVuDns8tUPnO3z9vp/FSsG2h2RnW8Ys5phhcdyuv/2wukd0A3yn9tsrpjv51uDI7LzsVOGULw/XpuFDYxKWTIQjB6xqQwQqZ6JgtB3mMH+iQ196DZiZJkBby94GRWW+/5aEI0JodBgr6Osb7SnsGKlEJ+NGhunRB0NbXYmtwTr6ep44TZTWubwHpZdUtDMG376Rvd/wEUjfAReTYyTPnle5dID5iPzORAX6LM2aZT8oIIM186GAyPllBiWtvTMu0BKup0vw5PZiXDXFPb57rIJnActq/AGVcbG+TXA4oav/4ixd4ptH8mP3TbEwfvoQA+eNsTUxLLA20WIKTdoIgjh+8p2KEk0huP2/1jDj0DNzCZbl87DBnAbx8PaEjeLXC5xgtSuXK4yo1CmfGFXXm9obTwjQZq+hL1cWuQWggId+NcSTU5VbXPYnNz+V5LYQ/Yz3L3xGlAuS6DVzsfBHAeOgVjtlrpVTAPu+BBsMT2X8/ckATXk3PqvKO44aEHJT4VAidylkFFQSVMy6Np++LTCZKtXBH4zy9c/0xo9xsLqcd4YZ2M3PoA4paWOpCC9HdHV2Xd1uu/YkyTCGKBg/VaVWzRTvdX1hRzIUtAcLwkvUhLHFvGsq/0omXywxdTphGprmDnaIzkNpL+vBa43KnicFiw4K4V8I9MLvqKLZYitoiC7MX2h7kAcSVwf6RbN+wctDZu+1O128MoWiH888P4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8936002)(82310400003)(54906003)(110136005)(186003)(336012)(426003)(81166007)(36860700001)(83380400001)(36756003)(356005)(26005)(5660300002)(4326008)(316002)(508600001)(2906002)(70206006)(70586007)(47076005)(1076003)(86362001)(6666004)(30864003)(8676002)(2616005)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 10:26:14.0741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367bab6f-f36f-495f-ed24-08d98ca18d8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1371
Cc: Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David.Rhodes@cirrus.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

Add Vangogh machine driver using NAU8821 & CS35L41 Codecs.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-nu8821-cs35l41.c | 357 +++++++++++++++++++
 1 file changed, 357 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/acp5x-nu8821-cs35l41.c

diff --git a/sound/soc/amd/vangogh/acp5x-nu8821-cs35l41.c b/sound/soc/amd/vangogh/acp5x-nu8821-cs35l41.c
new file mode 100644
index 000000000000..a443950ffa1e
--- /dev/null
+++ b/sound/soc/amd/vangogh/acp5x-nu8821-cs35l41.c
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Machine driver for AMD Vangogh platform using NAU8821 & CS35L41
+//
+//Copyright 2021 Advanced Micro Devices, Inc.
+
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+
+#include <sound/jack.h>
+#include <linux/clk.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/io.h>
+#include <linux/acpi.h>
+
+#include "../../codecs/nau8821.h"
+#include "../../codecs/cs35l41.h"
+
+#include "acp5x.h"
+
+#define DRV_NAME "acp5x_nu8821_cs35l41_mach"
+#define DUAL_CHANNEL		2
+#define ACP5X_NUVOTON_CODEC_DAI	"nau8821-hifi"
+
+static struct snd_soc_jack vg_headset;
+
+static struct snd_soc_jack_pin acp5x_nau8821_jack_pins[] = {
+	{
+		.pin	= "Headphone",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		.pin	= "Headset Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+};
+
+static int acp5x_8821_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_component *component =
+					asoc_rtd_to_codec(rtd, 0)->component;
+
+	/*
+	 * Headset buttons map to the google Reference headset.
+	 * These can be configured by userspace.
+	 */
+	ret = snd_soc_card_jack_new(card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0,
+				    &vg_headset, acp5x_nau8821_jack_pins,
+				    ARRAY_SIZE(acp5x_nau8821_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(vg_headset.jack, SND_JACK_BTN_0, KEY_MEDIA);
+	nau8821_enable_jack_detect(component, &vg_headset);
+	return ret;
+}
+
+static int acp5x_cs35l41_init(struct snd_soc_pcm_runtime *rtd)
+{
+	return 0;
+}
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
+static const unsigned int channels[] = {
+	2,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_channels = {
+	.count = ARRAY_SIZE(channels),
+	.list = channels,
+	.mask = 0,
+};
+
+static int acp5x_8821_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->play_i2s_instance = I2S_SP_INSTANCE;
+	machine->cap_i2s_instance = I2S_SP_INSTANCE;
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+	return 0;
+}
+
+static int acp5x_nau8821_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai =
+			snd_soc_card_get_codec_dai(card,
+						   ACP5X_NUVOTON_CODEC_DAI);
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8821_CLK_FLL_BLK, 0,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(card->dev, "can't set FS clock %d\n", ret);
+	ret = snd_soc_dai_set_pll(codec_dai, 0, 0, snd_soc_params_to_bclk(params),
+				  params_rate(params) * 256);
+	if (ret < 0)
+		dev_err(card->dev, "can't set FLL: %d\n", ret);
+
+	return ret;
+}
+
+static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->play_i2s_instance = I2S_HS_INSTANCE;
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+	return 0;
+}
+
+static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+	unsigned int num_codecs = rtd->num_codecs;
+	unsigned int bclk_val;
+
+	for (i = 0; i < num_codecs; i++) {
+		codec_dai = asoc_rtd_to_codec(rtd, i);
+		if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
+		    (strcmp(codec_dai->name, "spi-VLV1776:01") == 0)) {
+			switch (params_rate(params)) {
+			case 48000:
+				bclk_val = 1536000;
+				break;
+			default:
+				dev_err(card->dev, "Invalid Samplerate:0x%x\n",
+					params_rate(params));
+				return -EINVAL;
+			}
+			ret = snd_soc_component_set_sysclk(codec_dai->component,
+							   0, 0, bclk_val, SND_SOC_CLOCK_IN);
+			if (ret < 0) {
+				dev_err(card->dev, "failed to set sysclk for CS35l41 dai\n");
+				return ret;
+			}
+		}
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_ops acp5x_8821_ops = {
+	.startup = acp5x_8821_startup,
+	.hw_params = acp5x_nau8821_hw_params,
+};
+
+static const struct snd_soc_ops acp5x_cs35l41_play_ops = {
+	.startup = acp5x_cs35l41_startup,
+	.hw_params = acp5x_cs35l41_hw_params,
+};
+
+static struct snd_soc_codec_conf cs35l41_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("spi-VLV1776:00"),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("spi-VLV1776:01"),
+		.name_prefix = "Right",
+	},
+};
+
+SND_SOC_DAILINK_DEF(acp5x_i2s,
+		    DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.0")));
+
+SND_SOC_DAILINK_DEF(acp5x_bt,
+		    DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.1")));
+
+SND_SOC_DAILINK_DEF(nau8821,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-NVTN2020:00",
+						  "nau8821-hifi")));
+
+SND_SOC_DAILINK_DEF(cs35l41,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("spi-VLV1776:00", "cs35l41-pcm"),
+				       COMP_CODEC("spi-VLV1776:01", "cs35l41-pcm")));
+
+SND_SOC_DAILINK_DEF(platform,
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp5x_i2s_dma.0")));
+
+static struct snd_soc_dai_link acp5x_dai[] = {
+	{
+		.name = "acp5x-8825-play",
+		.stream_name = "Playback/Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S  | SND_SOC_DAIFMT_NB_NF |
+			   SND_SOC_DAIFMT_CBC_CFC,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &acp5x_8821_ops,
+		.init = acp5x_8821_init,
+		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
+	},
+	{
+		.name = "acp5x-CS35L41-Stereo",
+		.stream_name = "CS35L41 Stereo Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S  | SND_SOC_DAIFMT_NB_NF |
+			   SND_SOC_DAIFMT_CBC_CFC,
+		.dpcm_playback = 1,
+		.playback_only = 1,
+		.ops = &acp5x_cs35l41_play_ops,
+		.init = acp5x_cs35l41_init,
+		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
+	},
+};
+
+static int platform_clock_control(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *k, int  event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dai *codec_dai;
+	int ret = 0;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, ACP5X_NUVOTON_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev, "Codec dai not found\n");
+		return -EIO;
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8821_CLK_INTERNAL,
+					     0, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "set sysclk err = %d\n", ret);
+			return -EIO;
+		}
+	}
+	return ret;
+}
+
+static const struct snd_kcontrol_new acp5x_8821_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+};
+
+static const struct snd_soc_dapm_widget acp5x_8821_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			    platform_clock_control, SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route acp5x_8821_audio_route[] = {
+	/* HP jack connectors - unknown if we have jack detection */
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
+	{ "MICL", NULL, "Headset Mic" },
+	{ "MICR", NULL, "Headset Mic" },
+	{ "DMIC", NULL, "Int Mic" },
+
+	{ "Headphone", NULL, "Platform Clock" },
+	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Int Mic", NULL, "Platform Clock" },
+};
+
+static struct snd_soc_card acp5x_card = {
+	.name = "acp5x",
+	.owner = THIS_MODULE,
+	.dai_link = acp5x_dai,
+	.num_links = ARRAY_SIZE(acp5x_dai),
+	.dapm_widgets = acp5x_8821_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp5x_8821_widgets),
+	.dapm_routes = acp5x_8821_audio_route,
+	.num_dapm_routes = ARRAY_SIZE(acp5x_8821_audio_route),
+	.codec_conf = cs35l41_conf,
+	.num_configs = ARRAY_SIZE(cs35l41_conf),
+	.controls = acp5x_8821_controls,
+	.num_controls = ARRAY_SIZE(acp5x_8821_controls),
+};
+
+static int acp5x_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct acp5x_platform_info *machine;
+	struct snd_soc_card *card;
+
+	machine = devm_kzalloc(&pdev->dev, sizeof(struct acp5x_platform_info),
+			       GFP_KERNEL);
+	if (!machine)
+		return -ENOMEM;
+
+	card = &acp5x_card;
+	acp5x_card.dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		return dev_err_probe(&pdev->dev, ret,
+				     "snd_soc_register_card(%s) failed\n",
+				     acp5x_card.name);
+	}
+	return 0;
+}
+
+static struct platform_driver acp5x_mach_driver = {
+	.driver = {
+		.name = "acp5x_nu8821_cs35l41_mach",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = acp5x_probe,
+};
+
+module_platform_driver(acp5x_mach_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("NAU8821 & CS35L41 audio support");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.25.1

