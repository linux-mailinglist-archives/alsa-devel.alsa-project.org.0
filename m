Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB9539058
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 14:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767E01F16;
	Tue, 31 May 2022 14:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767E01F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653998977;
	bh=FiQvt6SdxCafd3KF5xdT9Go8TKjyl6+/US6XKe/M5IE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UINkkfOeWLPB++cSC9o/2YHgtgjxsHNAjTkAk+u+xlXaYLBkB+PmBAcVstlDKh+Ma
	 r4f95jSP3NbOMCdF+iPs+swW/i//pKzFjE0H4n/ocmE5z+14fDfzT2NRu1JZ0DRe/G
	 PuBriGWv8S5rowCUw4lmLtJ1VcRALfT4VE8WGgzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F537F80511;
	Tue, 31 May 2022 14:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8440F80161; Tue, 31 May 2022 14:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC3E3F80475
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 14:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC3E3F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="mSNnMzkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8c3iDQFNtp8rXJErbOvP0kJPkmxKoYGNTPh9yscqgk2aOjvldRE2Afhcr+436jXxdMJiMH+rUgrcqZlQeh3krsUbnn1Esf+VQIeJ65FdfoIgpOw6a7vZR914JJ/Q9WV5Wa12oLpe3BqjKY/wbhrIOqhdEUM/QVJjs3CgorSj9icpNqk4aoPt0shzrbJCcQRsAUc1jfaSaVhASQJiQWHYrb79JQmkoCaVkyIUsfSrFC9ZrsFVRKNIqZFr+bQrhDndag6DSsowl+nxr1eZgNVXRwvg10NyKJi+NZszJHY0SrnnXbR48TnzoVIHWvxpCJy8wfGXLdrrmbOEJh/4n0+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URl2mmU19Td0LUrVTBMSTcqvp1DtpC1GBJbC8sUIY+c=;
 b=TbRwYWwfS5Vzc8ggW5cqRyW33D0BU+lPL/RfQ4iUfOAdI6wsP1AiTplfCT8i54ASCOESg6jW9yWbtUpK3vdqzrP+j3LXLz5C2p88vK3TiY3LLO1P/0uzI+hOnH4TuVu7gVVPMh6f5Oik8w6ALKPt4YZk+rgnmsGWgcARFYpuNOJRCKszyRSQZgWwzFmeqOPuVnDsQs9Xe4gMTrPDLfskyXBbsenNuQ0viBRK8+vibUKOt6lfQncib9auSPn7OsGybz5CjEdLL8Jjyqm+LYpC+NQLOJMt+fzaNXo4NBDmT5FSplvc4A8IrlLDmZ7JrnX5xvmWlkfIr0Fl8MUaXY5eDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URl2mmU19Td0LUrVTBMSTcqvp1DtpC1GBJbC8sUIY+c=;
 b=mSNnMzkkP1CS7NTe5baeOfydoVBw7hMKA189AdVYCdgeXlRq/eFScUSHzXsJubve74RII2fxO1zVeSIgyqE1GDrSoPjFdDFY8HmoPSfG6qGrOlou6rj5ftmWf/3ZLI9AT1rP+rGvTQ1XQ/2WCAJciJRlyYdEtvLvsyTaYMEkEXo=
Received: from BN6PR16CA0031.namprd16.prod.outlook.com (2603:10b6:405:14::17)
 by BYAPR12MB3031.namprd12.prod.outlook.com (2603:10b6:a03:d8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Tue, 31 May
 2022 12:08:33 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::ae) by BN6PR16CA0031.outlook.office365.com
 (2603:10b6:405:14::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18 via Frontend
 Transport; Tue, 31 May 2022 12:08:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 12:08:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 07:08:30 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 31 May 2022 07:08:21 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v5 2/2] ASoC: amd: acp: Add support for rt5682s and rt1019
 card with hs instance
Date: Tue, 31 May 2022 17:38:12 +0530
Message-ID: <20220531120813.47116-3-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531120813.47116-1-Vsujithkumar.Reddy@amd.com>
References: <20220531120813.47116-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdd0892e-f478-4d41-3e60-08da42fe4857
X-MS-TrafficTypeDiagnostic: BYAPR12MB3031:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB30316F3454E41FAC4B09F8DF92DC9@BYAPR12MB3031.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtCKFz1C9qCJi+ua0EFxVJoDcEje2bvPNYGtawa7ADEZEbRAq/tKehup08/0T2d+QSmMG56BTFJnqNQmZu+EDHs8aR/5h338n7IC4Mz8zfjfUQ3gSZLN4B6twQNJlf33ednCYZrf/W3MA5h3KExacaHbNqO9st7kGU1hNn5i8Dzdbq5tWkXFJDNuHSoh3gwebp5m/HMl9SfzvGgNT7oiCvAHKSPA5BEXXOQ+BYDwtMtZ65oEQXFev8WxFXxmNSbLJeGROLmcUIMTyHdVr4d2GA0K5OgX/lqqd7z64JKRQwVEqEgMi4OT9CJNpPe4xFlSMe6NWwtLpxG5ibK3JTDMr1ZBAdzHz3cd9I0pAonxsHUKr+X+B8DFgrzxvehmYPwTaHhKAwgO1WYbVYRRAWYR7RNZLMCgt1OhKgOEF2879Zv8beRSOYthj8dqSUBK9dXiSywh9YqB7DouD8bZHf9Kn4I95JIiRTHRl7nCR3xpe8ZKCZEOIUZGrEMcf5YYM7QHPHmJhWO3phoQhHUNet2HhyQtLbPjgb8uwW3OKsZ7LLcqkRCuyHWEgXkhZnHFCGtE/qL38PqNGDY5Lqdz9kH8rKmg1eY1K+PPCxZz70RcsMtv+GYXB+QFsd9p74r5KNW+fQMzwP2JUdAiLOLnGNdWFzSt9iT6bkEr5tJdCL7gWmqXuioroxS3Jwt5wEaOGgmRGX/mh5vkKMlJyHKlyXGj1w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(1076003)(2616005)(54906003)(2906002)(36756003)(316002)(82310400005)(26005)(40460700003)(110136005)(36860700001)(81166007)(70586007)(70206006)(186003)(5660300002)(7696005)(4326008)(8676002)(356005)(86362001)(6666004)(47076005)(83380400001)(426003)(336012)(8936002)(508600001)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 12:08:32.8525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd0892e-f478-4d41-3e60-08da42fe4857
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3031
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jia-Ju Bai <baijiaju1990@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 V sujith kumar
 Reddy <Vsujithkumar.Reddy@amd.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

We have new platform with rt5682s as a primary codec and rt1019 as an
amp codec. Add machine struct to register sof audio based sound card
on such Chrome machine.

Here we are configuring as a soc mclk master and codec slave.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/amd/acp-config.c          |  9 ++++
 sound/soc/amd/acp/acp-mach-common.c | 67 ++++++++++++++++++++++++-----
 sound/soc/amd/acp/acp-sof-mach.c    | 15 +++++++
 3 files changed, 81 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3b9f851bf50d..0932473b6394 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -147,6 +147,15 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
 		.fw_filename = "sof-rmb.ri",
 		.sof_tplg_filename = "sof-rmb-nau8825-max98360.tplg",
 	},
+	{
+		.id = "RTL5682",
+		.drv_name = "rt5682s-hs-rt1019",
+		.pdata = &acp_quirk_data,
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+		.fw_filename = "sof-rmb.ri",
+		.sof_tplg_filename = "sof-rmb-rt5682s-rt1019.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_rmb_sof_machines);
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index a03b396d96bb..7530cab24bc8 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -149,9 +149,14 @@ static int acp_card_hs_startup(struct snd_pcm_substream *substream)
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
+	unsigned int fmt;
 
-	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				   | SND_SOC_DAIFMT_CBP_CFP);
+	if (drvdata->soc_mclk)
+		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
+	else
+		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
+
+	ret =  snd_soc_dai_set_fmt(codec_dai, fmt);
 	if (ret < 0) {
 		dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
 		return ret;
@@ -162,10 +167,13 @@ static int acp_card_hs_startup(struct snd_pcm_substream *substream)
 				      &constraints_channels);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &constraints_rates);
-
-	ret = acp_clk_enable(drvdata);
-	if (ret < 0)
-		dev_err(rtd->card->dev, "Failed to enable HS clk: %d\n", ret);
+	if (!drvdata->soc_mclk) {
+		ret = acp_clk_enable(drvdata);
+		if (ret < 0) {
+			dev_err(rtd->card->dev, "Failed to enable HS clk: %d\n", ret);
+			return ret;
+		}
+	}
 
 	return ret;
 }
@@ -201,6 +209,7 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
+	unsigned int fmt;
 	int ret;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
@@ -208,8 +217,12 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	if (drvdata->hs_codec_id != RT5682S)
 		return -EINVAL;
 
-	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				   | SND_SOC_DAIFMT_CBP_CFP);
+	if (drvdata->soc_mclk)
+		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
+	else
+		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
+
+	ret =  snd_soc_dai_set_fmt(codec_dai, fmt);
 	if (ret < 0) {
 		dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
 		return ret;
@@ -236,8 +249,10 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	drvdata->wclk = clk_get(component->dev, "rt5682-dai-wclk");
-	drvdata->bclk = clk_get(component->dev, "rt5682-dai-bclk");
+	if (!drvdata->soc_mclk) {
+		drvdata->wclk = clk_get(component->dev, "rt5682-dai-wclk");
+		drvdata->bclk = clk_get(component->dev, "rt5682-dai-bclk");
+	}
 
 	ret = snd_soc_card_jack_new(card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
@@ -298,6 +313,9 @@ static const struct snd_soc_ops acp_card_dmic_ops = {
 SND_SOC_DAILINK_DEF(rt1019,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1019:00", "rt1019-aif"),
 			  COMP_CODEC("i2c-10EC1019:01", "rt1019-aif")));
+SND_SOC_DAILINK_DEF(rt1019_1,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1019:02", "rt1019-aif"),
+		    COMP_CODEC("i2c-10EC1019:01", "rt1019-aif")));
 
 static const struct snd_soc_dapm_route rt1019_map_lr[] = {
 	{ "Left Spk", NULL, "Left SPO" },
@@ -315,6 +333,17 @@ static struct snd_soc_codec_conf rt1019_conf[] = {
 	},
 };
 
+static struct snd_soc_codec_conf rt1019_1_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1019:02"),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1019:01"),
+		.name_prefix = "Right",
+	},
+};
+
 static int acp_card_rt1019_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -618,6 +647,12 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_nau8825_init;
 			links[i].ops = &acp_card_nau8825_ops;
 		}
+		if (drv_data->hs_codec_id == RT5682S) {
+			links[i].codecs = rt5682s;
+			links[i].num_codecs = ARRAY_SIZE(rt5682s);
+			links[i].init = acp_card_rt5682s_init;
+			links[i].ops = &acp_card_rt5682s_ops;
+		}
 		i++;
 	}
 
@@ -674,6 +709,18 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].ops = &acp_card_maxim_ops;
 			links[i].init = acp_card_maxim_init;
 		}
+		if (drv_data->amp_codec_id == RT1019) {
+			links[i].codecs = rt1019;
+			links[i].num_codecs = ARRAY_SIZE(rt1019);
+			links[i].ops = &acp_card_rt1019_ops;
+			links[i].init = acp_card_rt1019_init;
+			card->codec_conf = rt1019_conf;
+			card->num_configs = ARRAY_SIZE(rt1019_conf);
+			links[i].codecs = rt1019_1;
+			links[i].num_codecs = ARRAY_SIZE(rt1019_1);
+			card->codec_conf = rt1019_1_conf;
+			card->num_configs = ARRAY_SIZE(rt1019_1_conf);
+		}
 		i++;
 	}
 
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index adbae809f2aa..f19f064a7527 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -66,6 +66,16 @@ static struct acp_card_drvdata sof_nau8825_data = {
 	.soc_mclk = true,
 };
 
+static struct acp_card_drvdata sof_rt5682s_hs_rt1019_data = {
+	.hs_cpu_id = I2S_HS,
+	.amp_cpu_id = I2S_HS,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = RT5682S,
+	.amp_codec_id = RT1019,
+	.dmic_codec_id = DMIC,
+	.soc_mclk = true,
+};
+
 static const struct snd_kcontrol_new acp_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -138,6 +148,10 @@ static const struct platform_device_id board_ids[] = {
 		.name = "nau8825-max",
 		.driver_data = (kernel_ulong_t)&sof_nau8825_data
 	},
+	{
+		.name = "rt5682s-hs-rt1019",
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data
+	},
 	{ }
 };
 static struct platform_driver acp_asoc_audio = {
@@ -158,4 +172,5 @@ MODULE_ALIAS("platform:rt5682-max");
 MODULE_ALIAS("platform:rt5682s-max");
 MODULE_ALIAS("platform:rt5682s-rt1019");
 MODULE_ALIAS("platform:nau8825-max");
+MODULE_ALIAS("platform:rt5682s-hs-rt1019");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

