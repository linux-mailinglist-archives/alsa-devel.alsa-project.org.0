Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8E432F17
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD21516A9;
	Tue, 19 Oct 2021 09:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD21516A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634627659;
	bh=x+uItK5t5jnVrojUb8oS/IR6vqqOe0CEVqXtUa2DSGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGi26QTR05mVa0DUIghv44FBTU9E9fF98y1hzQonFluAnb4fE/PKNkBRw7/oM2Pvo
	 rfzpV7tBYTo9HGv482l7ZHADjVdFL4cueiWdue7RF9eWELC/E5TnKO8xAo6/bSuuGs
	 6uVB6/8isU0OFSP3A1GP/KjklV+anchT6RDKJU3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07ECAF80511;
	Tue, 19 Oct 2021 09:12:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2509F80511; Tue, 19 Oct 2021 09:12:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D01FBF80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D01FBF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yxKFzrhI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra0/Dj5ZjNFZvCqNQm02XjePsYpZWrlXp7He8hB+ibXEYXOOzTEndmbH8lFkXwzWDMbvbQelhdymLI32QnkpF5ix8cTZyrHH1/SbGWOMS0JpFCT3USOD7ktewfiYYB5LSjBegYgrTwqnpfJGMgpdIfS0hHQ1nr1ag8vTyjLCxfcZV5aBdFdaOF3nrYdWKAgbw5veepOIHZRKdVCpIW2qpTl6qmz5yoXKnCdtnKuWin9dg8XnyMbFTfeh84vnvMZpBWBZ21n7OyXb/+p8gdCPm90JC6dZAmqFjgfygxcWBxxixiL9NAQBmp8+KcVJuGb9bdH4gZ0YXOJ4Xhq4gHEAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiXMHspr2Kr/cw25kQPbLXJXCUAOmj35Y1j8T3gL4VA=;
 b=GLyRG6mg+ZJgM7czxSd0cd7lQ/y2CVWrCOS/53O5Uy+F3gvWCHgZ3cD1cMIA6nBuOfWcc/bYvfUB1ygV9ihbkSVH1NRsTm7VDRaZ9ucCziMz67VhrAyy9g287qAw1F9tDlsxeUDQyYyJW/ucgGueg4uGgJvSmq6fXwGMeA6fDC1N/EJJo0DKJ3RbWTS3hjUkbgnwxXdlWkFitFmGNm/09MA3MaMFaikFXHALKkBfPdtSBpg2K52iXdV8Y7DRvq7ooo4kLRlOvuFxhdhs/xd/fEjDoWO17huOeZWShO6IQtZXORnWi5LdB6yldtwJwuzaZxzec0p/ipGk+XXBjkUleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiXMHspr2Kr/cw25kQPbLXJXCUAOmj35Y1j8T3gL4VA=;
 b=yxKFzrhIgWdT60d1iPfUfEwHdVyszwZuNnJYW8wfKgEdT0DCVpdCS4cc7MTiLiD/aaMQ4BVGN3zMICRNUkz2QP8+UXG0otlZXfZd86eerYHRT2I7jWk3MpzPhQfLhRPd+v1yxxIlJj31xYP9zxtuOGXmjRuOPCHHph7B8KQ/3xo=
Received: from DM5PR07CA0086.namprd07.prod.outlook.com (2603:10b6:4:ae::15) by
 MN2PR12MB4815.namprd12.prod.outlook.com (2603:10b6:208:1bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 07:12:23 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::21) by DM5PR07CA0086.outlook.office365.com
 (2603:10b6:4:ae::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 07:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:12:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 02:12:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 02:12:21 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Tue, 19 Oct 2021 02:12:17 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 8/8] ASoC: amd: acp: Add support for RT5682-VS codec
Date: Tue, 19 Oct 2021 12:39:38 +0530
Message-ID: <20211019070938.5076-9-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019070938.5076-1-AjitKumar.Pandey@amd.com>
References: <20211019070938.5076-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f395f1-7ea8-4c80-0e69-08d992cfcc9f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4815:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4815F1A3C7BE29B5D4F544A782BD9@MN2PR12MB4815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YMA1mJGqzixyBAWDK2m1fyu935fM4v798YQ4vleTjQFsI/R54KXDxxFroZNeSCgPNlGFUbBIFhP/S5OyNEIvETmrENpy/VOcUZ/vXLu8LDhzE8WdownahEM08cw6HiXR+1PWiJcGjoeJvBNcaizRByXIP0qlTMVpHFMH/jlkGzlaZGq7W0PHzXFEbNlqsgbA1hO7nCm+fAPSVkIWl4tY8WJAl0z1tV5CP6miiUuLJERJQs8NF7vfxZR9GNbasAsyNMoOpyRlVPR75obLmwkU4see2aVUwcaoVqeAzkd/TswXMqcov9t4LrvCxTH3c73gD2/dcceTOQ1F7iIlGDtKdVxd8WxPS0uh09I0YUKT0imjxcDejJ3Gzge+C88zdfSRcoXg1R3Wgkh/xmfFUdflKxhTWFku3+UheK1juhUIXTLpXIRxtSJ9C/OSCpiiGW1VNvA4X4RSQj5oCxUFJ6SfQO6R6kpxxM/gFBpDACtkZp2e9j/DzBjFx8Zuujsr/BSH9+hBsnWzPXjFFsiq+dyueITYcuTs1C8tu0756WZkHkBTYx2wsShKoa1etuKxzJSPJJpd/f3s7C2Fka6kzWAmRk1LDmdFH+OkyEaMsv9lUq7HvwuA30mvyBVHIvejqFjwr0Pe/TZL8cyQzGidnk2sYjwCiM6E/euRstJoPuUTYlc4aoJI9fK3W5DV7tC1k00CK7XThN5v/2Jl8/yunARJR1skgHOsQQJRKMsXMFlYKro=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8676002)(6666004)(508600001)(1076003)(47076005)(26005)(2616005)(426003)(336012)(4326008)(2906002)(36756003)(54906003)(70586007)(356005)(36860700001)(186003)(110136005)(70206006)(81166007)(7696005)(316002)(83380400001)(86362001)(82310400003)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:12:23.7703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f395f1-7ea8-4c80-0e69-08d992cfcc9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4815
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

In newer variants primary codec is rt5682vs. Add support for newer
codec variants in generic machine driver module and define driver
data to register SOF sound card.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig           |  1 +
 sound/soc/amd/acp/acp-mach-common.c | 96 +++++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h        |  1 +
 sound/soc/amd/acp/acp-sof-mach.c    | 14 +++++
 4 files changed, 112 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index ef4208c3e7b7..98ec18791d35 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -33,6 +33,7 @@ config SND_SOC_AMD_MACH_COMMON
 	select SND_SOC_DMIC
 	select SND_SOC_RT1019
 	select SND_SOC_MAX98357A
+	select SND_SOC_RT5682S
 	depends on X86 && PCI && I2C
 	help
 	  This option enables common Machine driver module for ACP.
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 24d1075eb62e..7785f12aa006 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -23,6 +23,7 @@
 
 #include "../../codecs/rt5682.h"
 #include "../../codecs/rt1019.h"
+#include "../../codecs/rt5682s.h"
 #include "acp-mach.h"
 
 #define PCO_PLAT_CLK 48000000
@@ -182,6 +183,89 @@ static const struct snd_soc_ops acp_card_rt5682_ops = {
 	.shutdown = acp_card_shutdown,
 };
 
+/* Define RT5682S CODEC component*/
+SND_SOC_DAILINK_DEF(rt5682s,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RTL5682:00", "rt5682s-aif1")));
+
+static const struct snd_soc_dapm_route rt5682s_map[] = {
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+};
+
+static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	int ret;
+
+	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
+
+	if (drvdata->hs_codec_id != RT5682S)
+		return -EINVAL;
+
+	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				   | SND_SOC_DAIFMT_CBP_CFP);
+	if (ret < 0) {
+		dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL2, RT5682S_PLL_S_MCLK,
+				  PCO_PLAT_CLK, RT5682_PLL_FREQ);
+	if (ret < 0) {
+		dev_err(rtd->dev, "Failed to set codec PLL: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL2,
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
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682s_map, ARRAY_SIZE(rt5682s_map));
+}
+
+static const struct snd_soc_ops acp_card_rt5682s_ops = {
+	.startup = acp_card_hs_startup,
+	.shutdown = acp_card_shutdown,
+};
+
 /* Declare RT1019 codec components */
 SND_SOC_DAILINK_DEF(rt1019,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1019:01", "rt1019-aif"),
@@ -370,6 +454,12 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_rt5682_init;
 			links[i].ops = &acp_card_rt5682_ops;
 		}
+		if (drv_data->hs_codec_id == RT5682S) {
+			links[i].codecs = rt5682s;
+			links[i].num_codecs = ARRAY_SIZE(rt5682s);
+			links[i].init = acp_card_rt5682s_init;
+			links[i].ops = &acp_card_rt5682s_ops;
+		}
 		i++;
 	}
 
@@ -462,6 +552,12 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_rt5682_init;
 			links[i].ops = &acp_card_rt5682_ops;
 		}
+		if (drv_data->hs_codec_id == RT5682S) {
+			links[i].codecs = rt5682s;
+			links[i].num_codecs = ARRAY_SIZE(rt5682s);
+			links[i].init = acp_card_rt5682s_init;
+			links[i].ops = &acp_card_rt5682s_ops;
+		}
 		i++;
 	}
 
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index b6a43d1b9ad4..5dc47cfbff10 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -36,6 +36,7 @@ enum codec_endpoints {
 	RT5682,
 	RT1019,
 	MAX98360A,
+	RT5682S,
 };
 
 struct acp_card_drvdata {
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index f7103beedf32..854eb7214cea 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -38,6 +38,15 @@ static struct acp_card_drvdata sof_rt5682_max_data = {
 	.dmic_codec_id = DMIC,
 };
 
+static struct acp_card_drvdata sof_rt5682s_max_data = {
+	.hs_cpu_id = I2S_SP,
+	.amp_cpu_id = I2S_SP,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = RT5682S,
+	.amp_codec_id = MAX98360A,
+	.dmic_codec_id = DMIC,
+};
+
 static const struct snd_kcontrol_new acp_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -98,6 +107,10 @@ static const struct platform_device_id board_ids[] = {
 		.name = "rt5682-max",
 		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data
 	},
+	{
+		.name = "rt5682s-max",
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data
+	},
 	{ }
 };
 static struct platform_driver acp_asoc_audio = {
@@ -114,4 +127,5 @@ MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
 MODULE_DESCRIPTION("ACP chrome SOF audio support");
 MODULE_ALIAS("platform:rt5682-rt1019");
 MODULE_ALIAS("platform:rt5682-max");
+MODULE_ALIAS("platform:rt5682s-max");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

