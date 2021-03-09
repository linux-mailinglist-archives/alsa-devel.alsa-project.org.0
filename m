Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADDE3328A4
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:31:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB95A1861;
	Tue,  9 Mar 2021 15:30:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB95A1861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615300309;
	bh=zA989dVvN7ZUDpKbEzfJ2dWamCoP/QtXNKfIZ1/KYSQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fLBnt1oTJwDE+1oNNW/3LBZp+uE0FHRjy2NgKzJvwiReciE3z1VjW9u8z5g2ykACq
	 /zS9e55pPXym7WsjukWtxitUP+96EKa28iJhjNnIbnQthZvj3wiWbVGF4cHKAFxGWQ
	 N1LWpr+7vwjcBEarOJLNGWYL1gWTtK4WWD8xkH34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23102F80166;
	Tue,  9 Mar 2021 15:30:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37331F80227; Tue,  9 Mar 2021 15:30:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1618AF80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1618AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="mGOGqhT0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpwbTndkHntA14uoSFrlvQWsgNdcJDGT+JpzWrmSqnA8qA0kHyQN973D644bf1wJJN1E99LvdQFSYV6OeAoZiOFqnFUoJHkXMLVkWRafVdI5SIvTYMj/r9Mpy7M0r+yHlRT33pzRbNHn165zmcHvxSSmdtqzHnrtqwW84qAZVbhpRFP4hNcbY7/5iUXMUtyk8QT2mF66d4EXQIjfrm7yuGHn6sIgtO63OYtWs+cthj6yBETgONBFte4R4yXzXQtnx5yAjgaJnbTMC0FMQ0sKFnlebX7FVTvQnk8Dp57fQmY/1UCrhsTdT3E8dBNKPbzkjHrt3lqmZovISbazzo85PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA0JxkuumJ4WYbt/cvb+XroniYHhBQIQbAFWkQ4HE/Q=;
 b=gyFjd4h3SYev8fGtktkQ+n/GH6py3cEJKs1k1KoyzAWXAGEwkUGAkJa6DaPrYyb5JtC+5Hdbo/d+uCIuLcv2aYBJhpPvcA5bHL0YPzMQvpkaYnpIurbt28TYxcq/Y7ImzUzn8/bZkz7Xsw2YPCMQeVAv5mAoVh3pnT/+/spcSyfRLpBnnSn1GK3J8kf9Ro+M6OR9PeRf+6dvFT5cW/WbBWdjAB1arnPihVtvEz+QclENvPMOjB6rHA1C+SLQbTqeJKdNND5X1bJ7sOOKp7J32I7tF4vyZkmNTLUF2QTGBdc8v7AqYk5OLE11vB59+ilGhWlD71ZImd/EYr0ql9Zhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA0JxkuumJ4WYbt/cvb+XroniYHhBQIQbAFWkQ4HE/Q=;
 b=mGOGqhT0Xfj+QbklgkiKaseLAqF29DOoohTJ38yLMiDYZwHIOoLoiEy4+7qJjxhWxtCDhIkjpyTa90M+A9qBnxweJWcY6SdBRTJ6TI7CYaYvjjYO52qCuANiJnLIRdEM6jqEAlIbztPC1Cs9ohxSFMY3QUMDOC7jLtqITBj+h34=
Received: from DM6PR11CA0049.namprd11.prod.outlook.com (2603:10b6:5:14c::26)
 by BY5PR12MB3987.namprd12.prod.outlook.com (2603:10b6:a03:1a8::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 14:29:51 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::98) by DM6PR11CA0049.outlook.office365.com
 (2603:10b6:5:14c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 14:29:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB02.amd.com;
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 14:29:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 08:29:48 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 08:29:47 -0600
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 9 Mar 2021 08:29:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: add support for rt5682 codec in machine driver
Date: Tue, 9 Mar 2021 20:16:42 +0530
Message-ID: <1615301217-4556-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71209bd7-e846-433e-3e88-08d8e307cc4e
X-MS-TrafficTypeDiagnostic: BY5PR12MB3987:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39873B930D7A3CDE801B990097929@BY5PR12MB3987.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lJpLnMgPtPpEN7q0Dkck5Z30orj/MCOzA0kFf4O0AEputOcQcluZBd3yMr2+ltbT8aysBWa6CTAPeFwUnawbKpFoEYCR3THfNrZF2cM35QuhNPLDaOoXpqRUVo6Wb7ZhStFEV/SYey68ZF56dxjxC4+Oz56JwvGfMVSGN8GPf0j+E64b8S/8frbVpZG1VyfTOBNcjyHeBNYiYMlOHAWVWAC+Sersk2vK+lwoMOi3o1XMPdj0tF+NlLXVkOsgMs8eTUw4EeHBe6n4IL2S6HeBxWjlO0WQLskP6t9Kje/n0TqUEmSJAyT/MjOyULhErvUqIvZdQStmWOWa8F7jDceftBJB9E4ddRvcOyoItIJvpsl97JT8wLIq6ysf3Eul7gkfhvYKpH9U2PSUkS61tUQBFp7qre3F2UqGrtUYxF6Qrnh0k4OhkrYvj/K2YP9HNlW4jKw6QPt9XjkD88ZqxWFW5e8kYdvB0yfRuMi1oeJzrZ97khaxvaM8z6qO2SKQrcx01A8JFqLrBlFInOdEhrR+cmeTpoLAk8w4agwKAS8NjIzO7MGHvQB5bKMpygQ4LlcMvsS07DScCjYiWJRm47dB8d8+XYlm+Sl47SWqrtWT1M8P2HwQXIZ2wF4bmvgKGkAr1Fx7MDYP3CY27/Gg0CbZpTxc2rJtOmHuS6qTCbzmU22FqzZcCUGDe60vkkPmbYDG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(5660300002)(36756003)(47076005)(7416002)(26005)(54906003)(86362001)(82740400003)(7696005)(30864003)(70586007)(4326008)(186003)(478600001)(2906002)(36860700001)(81166007)(70206006)(82310400003)(356005)(83380400001)(336012)(2616005)(316002)(8676002)(110136005)(8936002)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:29:50.4011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71209bd7-e846-433e-3e88-08d8e307cc4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3987
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Chuhong Yuan <hslester96@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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

Add support for RT5682 codec in machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig                |   5 +-
 sound/soc/amd/acp-da7219-max98357a.c | 353 +++++++++++++++++++++++++++++++++--
 2 files changed, 339 insertions(+), 19 deletions(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index a6ce000..13f5b1b2 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -5,14 +5,15 @@ config SND_SOC_AMD_ACP
 	 This option enables ACP DMA support on AMD platform.
 
 config SND_SOC_AMD_CZ_DA7219MX98357_MACH
-	tristate "AMD CZ support for DA7219 and MAX9835"
+	tristate "AMD CZ support for DA7219, RT5682 and MAX9835"
 	select SND_SOC_DA7219
+	select SND_SOC_RT5682
 	select SND_SOC_MAX98357A
 	select SND_SOC_ADAU7002
 	select REGULATOR
 	depends on SND_SOC_AMD_ACP && I2C && GPIOLIB
 	help
-	 This option enables machine driver for DA7219 and MAX9835.
+	 This option enables machine driver for DA7219, RT5682 and MAX9835.
 
 config SND_SOC_AMD_CZ_RT5645_MACH
 	tristate "AMD CZ support for RT5645"
diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 849288d..ff2b639 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -1,7 +1,7 @@
 /*
  * Machine driver for AMD ACP Audio engine using DA7219 & MAX98357 codec
  *
- * Copyright 2017 Advanced Micro Devices, Inc.
+ * Copyright 2017-2021 Advanced Micro Devices, Inc.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -41,14 +41,19 @@
 #include "acp.h"
 #include "../codecs/da7219.h"
 #include "../codecs/da7219-aad.h"
+#include "../codecs/rt5682.h"
 
 #define CZ_PLAT_CLK 48000000
 #define DUAL_CHANNEL		2
+#define RT5682_PLL_FREQ (48000 * 512)
 
 static struct snd_soc_jack cz_jack;
 static struct clk *da7219_dai_wclk;
 static struct clk *da7219_dai_bclk;
-extern bool bt_uart_enable;
+static struct clk *rt5682_dai_wclk;
+static struct clk *rt5682_dai_bclk;
+extern int bt_uart_enable;
+void *soc_is_rltk_max(struct device *dev);
 
 static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -128,6 +133,88 @@ static void da7219_clk_disable(void)
 	clk_disable_unprepare(da7219_dai_bclk);
 }
 
+static int cz_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	dev_info(codec_dai->dev, "codec dai name = %s\n", codec_dai->name);
+
+	/* Set codec sysclk */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2,
+				     RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev,
+			"Failed to set rt5682 SYSCLK: %d\n", ret);
+		return ret;
+	}
+	/* set codec PLL */
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL2, RT5682_PLL2_S_MCLK,
+				  CZ_PLAT_CLK, RT5682_PLL_FREQ);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set rt5682 PLL: %d\n", ret);
+		return ret;
+	}
+
+	rt5682_dai_wclk = devm_clk_get(component->dev, "rt5682-dai-wclk");
+	if (IS_ERR(rt5682_dai_wclk))
+		return PTR_ERR(rt5682_dai_wclk);
+
+	rt5682_dai_bclk = devm_clk_get(component->dev, "rt5682-dai-bclk");
+	if (IS_ERR(rt5682_dai_bclk))
+		return PTR_ERR(rt5682_dai_bclk);
+
+	ret = snd_soc_card_jack_new(card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
+				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				    &cz_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "HP jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	ret = snd_soc_component_set_jack(component, &cz_jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int rt5682_clk_enable(struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+
+	/*
+	 * Set wclk to 48000 because the rate constraint of this driver is
+	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
+	 * minimum of 64x the LRCLK sample rate." DA7219 is the only clk
+	 * source so for all codecs we have to limit bclk to 64X lrclk.
+	 */
+	clk_set_rate(rt5682_dai_wclk, 48000);
+	clk_set_rate(rt5682_dai_bclk, 48000 * 64);
+	ret = clk_prepare_enable(rt5682_dai_bclk);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't enable master clock %d\n", ret);
+		return ret;
+	}
+	return ret;
+}
+
+static void rt5682_clk_disable(void)
+{
+	clk_disable_unprepare(rt5682_dai_bclk);
+}
+
 static const unsigned int channels[] = {
 	DUAL_CHANNEL,
 };
@@ -260,6 +347,118 @@ static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
 	da7219_clk_disable();
 }
 
+static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->play_i2s_instance = I2S_SP_INSTANCE;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->cap_i2s_instance = I2S_SP_INSTANCE;
+	machine->capture_channel = CAP_CHANNEL1;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_max_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->play_i2s_instance = I2S_BT_INSTANCE;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->cap_i2s_instance = I2S_BT_INSTANCE;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_dmic1_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->cap_i2s_instance = I2S_SP_INSTANCE;
+	machine->capture_channel = CAP_CHANNEL0;
+	return rt5682_clk_enable(substream);
+}
+
+static void cz_rt5682_shutdown(struct snd_pcm_substream *substream)
+{
+	rt5682_clk_disable();
+}
+
 static const struct snd_soc_ops cz_da7219_play_ops = {
 	.startup = cz_da7219_play_startup,
 	.shutdown = cz_da7219_shutdown,
@@ -285,6 +484,31 @@ static const struct snd_soc_ops cz_dmic1_cap_ops = {
 	.shutdown = cz_da7219_shutdown,
 };
 
+static const struct snd_soc_ops cz_rt5682_play_ops = {
+	.startup = cz_rt5682_play_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_cap_ops = {
+	.startup = cz_rt5682_cap_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_max_play_ops = {
+	.startup = cz_rt5682_max_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_dmic0_cap_ops = {
+	.startup = cz_rt5682_dmic0_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_dmic1_cap_ops = {
+	.startup = cz_rt5682_dmic1_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
 SND_SOC_DAILINK_DEF(designware1,
 	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
 SND_SOC_DAILINK_DEF(designware2,
@@ -294,6 +518,8 @@ SND_SOC_DAILINK_DEF(designware3,
 
 SND_SOC_DAILINK_DEF(dlgs,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00", "da7219-hifi")));
+SND_SOC_DAILINK_DEF(rt5682,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
 SND_SOC_DAILINK_DEF(mx,
 	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
 SND_SOC_DAILINK_DEF(adau,
@@ -353,6 +579,57 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 	},
 };
 
+static struct snd_soc_dai_link cz_dai_5682_98357[] = {
+	{
+		.name = "amd-rt5682-play",
+		.stream_name = "Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.init = cz_rt5682_init,
+		.dpcm_playback = 1,
+		.ops = &cz_rt5682_play_ops,
+		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
+	},
+	{
+		.name = "amd-rt5682-cap",
+		.stream_name = "Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_capture = 1,
+		.ops = &cz_rt5682_cap_ops,
+		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
+	},
+	{
+		.name = "amd-max98357-play",
+		.stream_name = "HiFi Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_playback = 1,
+		.ops = &cz_rt5682_max_play_ops,
+		SND_SOC_DAILINK_REG(designware3, mx, platform),
+	},
+	{
+		/* C panel DMIC */
+		.name = "dmic0",
+		.stream_name = "DMIC0 Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_capture = 1,
+		.ops = &cz_rt5682_dmic0_cap_ops,
+		SND_SOC_DAILINK_REG(designware3, adau, platform),
+	},
+	{
+		/* A/B panel DMIC */
+		.name = "dmic1",
+		.stream_name = "DMIC1 Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_capture = 1,
+		.ops = &cz_rt5682_dmic1_cap_ops,
+		SND_SOC_DAILINK_REG(designware2, adau, platform),
+	},
+};
+
 static const struct snd_soc_dapm_widget cz_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
@@ -368,6 +645,14 @@ static const struct snd_soc_dapm_route cz_audio_route[] = {
 	{"PDM_DAT", NULL, "Int Mic"},
 };
 
+static const struct snd_soc_dapm_route cz_rt5682_audio_route[] = {
+	{"Headphones", NULL, "HPOL"},
+	{"Headphones", NULL, "HPOR"},
+	{"IN1P", NULL, "Headset Mic"},
+	{"Speakers", NULL, "Speaker"},
+	{"PDM_DAT", NULL, "Int Mic"},
+};
+
 static const struct snd_kcontrol_new cz_mc_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
@@ -388,6 +673,28 @@ static struct snd_soc_card cz_card = {
 	.num_controls = ARRAY_SIZE(cz_mc_controls),
 };
 
+static struct snd_soc_card cz_rt5682_card = {
+	.name = "acpr5682m98357",
+	.owner = THIS_MODULE,
+	.dai_link = cz_dai_5682_98357,
+	.num_links = ARRAY_SIZE(cz_dai_5682_98357),
+	.dapm_widgets = cz_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cz_widgets),
+	.dapm_routes = cz_rt5682_audio_route,
+	.controls = cz_mc_controls,
+	.num_controls = ARRAY_SIZE(cz_mc_controls),
+};
+
+void *soc_is_rltk_max(struct device *dev)
+{
+	const struct acpi_device_id *match;
+
+	match = acpi_match_device(dev->driver->acpi_match_table, dev);
+	if (!match)
+		return NULL;
+	return (void *)match->driver_data;
+}
+
 static struct regulator_consumer_supply acp_da7219_supplies[] = {
 	REGULATOR_SUPPLY("VDD", "i2c-DLGS7219:00"),
 	REGULATOR_SUPPLY("VDDMIC", "i2c-DLGS7219:00"),
@@ -425,29 +732,39 @@ static int cz_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct acp_platform_info *machine;
 	struct regulator_dev *rdev;
-
-	acp_da7219_cfg.dev = &pdev->dev;
-	rdev = devm_regulator_register(&pdev->dev, &acp_da7219_desc,
-				       &acp_da7219_cfg);
-	if (IS_ERR(rdev)) {
-		dev_err(&pdev->dev, "Failed to register regulator: %d\n",
-			(int)PTR_ERR(rdev));
-		return -EINVAL;
+	struct device *dev = &pdev->dev;
+
+	card = (struct snd_soc_card *)soc_is_rltk_max(dev);
+	if (!card)
+		return -ENODEV;
+	if (!strcmp(card->name, "acpd7219m98357")) {
+		acp_da7219_cfg.dev = &pdev->dev;
+		rdev = devm_regulator_register(&pdev->dev, &acp_da7219_desc,
+					       &acp_da7219_cfg);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "Failed to register regulator: %d\n",
+				(int)PTR_ERR(rdev));
+			return -EINVAL;
+		}
 	}
 
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct acp_platform_info),
 			       GFP_KERNEL);
 	if (!machine)
 		return -ENOMEM;
-	card = &cz_card;
-	cz_card.dev = &pdev->dev;
+	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
-	ret = devm_snd_soc_register_card(&pdev->dev, &cz_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
-				cz_card.name, ret);
+				card->name, ret);
+		else
+			dev_dbg(&pdev->dev,
+				"devm_snd_soc_register_card(%s) probe deferred: %d\n",
+				card->name, ret);
 		return ret;
 	}
 	bt_uart_enable = !device_property_read_bool(&pdev->dev,
@@ -457,7 +774,8 @@ static int cz_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cz_audio_acpi_match[] = {
-	{ "AMD7219", 0 },
+	{ "AMD7219", (unsigned long)&cz_card },
+	{ "AMDI5682", (unsigned long)&cz_rt5682_card},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, cz_audio_acpi_match);
@@ -475,5 +793,6 @@ static struct platform_driver cz_pcm_driver = {
 module_platform_driver(cz_pcm_driver);
 
 MODULE_AUTHOR("akshu.agrawal@amd.com");
-MODULE_DESCRIPTION("DA7219 & MAX98357A audio support");
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("DA7219, RT5682 & MAX98357A audio support");
 MODULE_LICENSE("GPL v2");
-- 
2.7.4

