Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E44293CE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 17:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A655F1693;
	Mon, 11 Oct 2021 17:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A655F1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633967373;
	bh=wrn1YhCplKbT53OlfJUTJoL7izTRXOwbPt+N3mYNO30=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+hDbOyCnjZcnUkLb+d6jF3l7fv6c3R0aCX5AMEUeYIEV3UdF9LSYfXlsFM7ig/BI
	 Q/b7tNHwF0CDS2seqNdiOwQ1R7GbBXf0jG2XgJIh10YpZxR6/1iFKBp5nZsHZ/fyu3
	 9ilHckGz0GvH09wjpbt/u8mCDbXxl1w04L/Z8FrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C092F80269;
	Mon, 11 Oct 2021 17:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 633E1F80506; Mon, 11 Oct 2021 17:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A027F804FA
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 17:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A027F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yOKloZJq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2cHOeMyvHqz6/fZJAvpJ0DFUPNvI+1lrP5taSGOmpDUKwlj3zyzF1e2lPnAnC7uIcRGHnuP445CV7NUrmg27fpeMe7tJb2gz3GSKQDAUnQ8nYbrDkrW3+3JAzorTO0Yz6gEJEmUlvYfWtz68fP49vd2YcOF46mMFlB184mf6asJvxnbHw2ENDakIbQAL5UNCZILfXTCHrUimdUGMLrevba3l1eIbzPknUrijyzaZ8cN7PM8Qn9BbmUpPrHXJ9P29Z+TPfIVRiy7Z6w19CtLC6C7j2gh0q13hl7JSPnjyaz3+cYjfsuvlwMJlD4oE9xB+dhf1tHAYL1FA/wmtf7CIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS1tKaaOGkuD6OByJE5ZxCtJdjY33eLCbUVZzJTPfyc=;
 b=jm0kg34gHUeZesE9ejC+v7WwF6llMiQ8dw4naCRjIjdjjMfDGWTwNeAasYyUpCIO6yMttLh5YakDL5qVK8O40FMR/96yp1pZGCupeIGXQmJNOFBjBTfe7OPdDM5JaAuD6ELo0i3WTjkNHBNtppy1Z/Sjg7CCtxRnvmmPG8nr8tuwdp3fQd14xvNuylv5TNIgPTIIf54LCoWOBQs4MH3b/928cGLPHdC45/+i26chzRJcGyp+vigcyJbK7Z3uTJsFOQrsSxRznLxPnVeEmoW0irVGwYBS+0rh0qMIvkp+CfqTegSSr+ZaxhyXabcbfxkka6UawqOTelyT9PqosDBwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS1tKaaOGkuD6OByJE5ZxCtJdjY33eLCbUVZzJTPfyc=;
 b=yOKloZJqAuaTseURgyuI9eaM1w+uNZBN9F5cylc+KuDBpZs+MCbA+VwJxvUS2XksIYem23xgXrzdrveMW6hE8JyQRaJpCfslTQyQcS/E11Q1hhywYQM+w2/EjrCneCrQQY8Bkw1i8BcYYSw87hZR/3SmXJRCjNBPwq/Uh4gvZU8=
Received: from BN9PR03CA0106.namprd03.prod.outlook.com (2603:10b6:408:fd::21)
 by BL0PR12MB2500.namprd12.prod.outlook.com (2603:10b6:207:4e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 15:47:29 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::ce) by BN9PR03CA0106.outlook.office365.com
 (2603:10b6:408:fd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 15:47:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 15:47:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:47:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 08:47:27 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 10:47:23 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 8/8] ASoC: amd: acp: Add support for RT5682-VS codec
Date: Mon, 11 Oct 2021 21:14:52 +0530
Message-ID: <20211011154452.76849-9-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
References: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbb4568f-b028-40aa-7039-08d98cce6e39
X-MS-TrafficTypeDiagnostic: BL0PR12MB2500:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25005B8BF204DC150C24A56E82B59@BL0PR12MB2500.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNOvg+flmB2q+nb0+XtnvXeQwSdZ/TNl41eGybjlCyjsgRXrsDlqJw4oxqDkAU8muspy6jVy3Pk/znrOVXVepP6NWL9o3vZ/UBS1VdM3S8mNZ75sXvT9Iyt8BIG7cDPwfcMvoS3OGBGj1CAs8DTR/aN/nQmnYAAhLVGtSVnXO41X3bAet+Ok0yVid70Hzhfbro4mTLCliOOEyI8n2HlUGmBjyOrHCMbGLdg9bwCj4YxlFfdwCZUza4GElEoY84UzVQMQEmAv9dk7Unh2FD8Sm1l8Pyarx4rrjOLY6e2LyiLmuSSX8lrVrswXJ1OLovpa/oghmSh/Qr/+P2GHYCvcB/R4nWaOE2fvbH919B3csnsOTDdq1G6f1eQVtTpKxhXe5w3/hVsjjzc1iUab+KXKbaGN/LdYEVtWsIEnLyK8LeJoHR1iJ/qGr9v4myCA3RczbHAZX9AzjnSAWVxg5cDGSVy7qIbeMQ4HUai/FL/sIcC/BELf1MWJEzFZ8G3v2q9WjmZPhhSA1Ity+SWQb7FGy1cAX7ByIqNWZCbpJhblJikiRBwVn0TKlIp+BH6LXfELHA0fZXnNP/67tn7OQseb2pG5hbvkyYxCJeqG/NyKKoPW4p03Nr0KnYEnH9iiQR3s9+70D+kQVrnxqOjWW79yl8FTSySJBDyvGE+yD/C/AnMRfH+3bFWSkbTAkrLKYVUZ2SR6/X0XjekTobF1fiVpvKpCZvnWGBpeHLt3DE9B0BQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(356005)(316002)(81166007)(508600001)(54906003)(336012)(110136005)(47076005)(5660300002)(6666004)(426003)(36756003)(2616005)(82310400003)(1076003)(4326008)(8936002)(2906002)(86362001)(8676002)(83380400001)(186003)(70206006)(7696005)(36860700001)(26005)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:47:28.9245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb4568f-b028-40aa-7039-08d98cce6e39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2500
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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
index 04d8df7a6e11..3279894414da 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -32,6 +32,7 @@ config SND_SOC_AMD_MACH_COMMON
 	select SND_SOC_DMIC
 	select SND_SOC_RT1019
 	select SND_SOC_MAX98357A
+	select SND_SOC_RT5682S
 	depends on X86 && PCI && I2C
 	help
 	  This option enables common Machine driver module for ACP.
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index b9d77d761cca..cecf7e5a44e2 100644
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

