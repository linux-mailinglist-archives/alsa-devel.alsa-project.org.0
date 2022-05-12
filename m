Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCE525175
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 17:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 274541AD0;
	Thu, 12 May 2022 17:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 274541AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652370138;
	bh=9dzZ/Bzaplo3W8kBy81dZImiq9l529EeXj+p30EPHyU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvN+31Muh9iAKb4Z8bof/3hKKGIZRlpXHltSfFSrIy2/xhJMBdxJ97fjLqVAFOgw3
	 mwW++b0V8ArdK1Z38F8UsI4iHpx3WEEuU18yRQFEpaVXIqCkIf0jxwZOr0HnxePiZx
	 RsJ6c9QM1d0E3zL9GBqcZyy3IRAMqbVhDRdvSD24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C22F8010B;
	Thu, 12 May 2022 17:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DDA5F8027C; Thu, 12 May 2022 17:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8145CF8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 17:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8145CF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="PAjDBnte"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhJix+C3ylQW7M1P+Kvvp9wkXURrmXfYc7NiraNh8QPr3uLKTUUJakWmqJ9AmaHp6MQ+J1shGwuNHoMADt5kyx8GS8qiUoCujWdr5yPXouHlVeKkhGbht3t0ftFZcAGzrzJyrPy9h/INQoQzUxyAZ63ck1bZtVWrLQKZsuQPMYgQw2HZhf5Yff6ndnpDJ3dnmdpZWWklS5CVkE2+uY1GCkrX+wFtS2WyIvNSIXF5NjL8xs0XupXkWGABq6tJLsvu/djp/GR5EE3Wesy3lguHv+qHnrWWduIYzl8AK0Lwd2MUoIrUxAet9YzUVXNIaGKCTVrd6R4L+FPclOcaGSfrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQPvmqTgDleGssMVOmqiS2gcSuFSf3RhuArBkKvRvHg=;
 b=Xj7ilv7FG9Xw2HgsW8/Amh+3V1rwVapBqDg184zq98NazK+HZopZ+yszXb3MJpRF8UHzS4JhG4CyG/Qaq5R3TsPX/XLEcm8X3ME3J+/BlM/Y4WoeZsqz8OSxkdzEx/A56xg/B6CGWd/DfnAwYp4PrFNkjixNpHoU/1uuD6sB4FBYpBf/YY7lsa7L9LOq1f98Bcj3fWuIRN7DDon6C+HMPxEYs756kzdHQbY3FXyaz75lPbE2vZCBB9Rmsigkc9uajIKtA+WoPcB9a8yqGS/wahqtqkpv2TfYRkHoRd8UWT9oNWWOlyALUwmjcvMxDmFzqSpsSC+px/mJ90paxS0XtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQPvmqTgDleGssMVOmqiS2gcSuFSf3RhuArBkKvRvHg=;
 b=PAjDBnteDREgBkgNVqEcgzE9FIKfVpqutVSDrVawT2odi0S3PpC2BUN43nTdcFSB98b2mBsOMRrrWC4vlq7EGTJzF1zxKSzBtvxJ6W0eEOBNzsNWD6o1p8hMMYM+VsW2s8/wr2wbkwqzEF8dYGgZgbw1u3UYVnZf1xHrLGFq7rg=
Received: from DM6PR21CA0030.namprd21.prod.outlook.com (2603:10b6:5:174::40)
 by CY4PR12MB1573.namprd12.prod.outlook.com (2603:10b6:910:d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 15:40:35 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::1c) by DM6PR21CA0030.outlook.office365.com
 (2603:10b6:5:174::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Thu, 12 May 2022 15:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:40:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 10:40:34 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Thu, 12 May 2022 10:40:31 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] Revert "ASoC: amd: acp: Power on/off the speaker enable
 gpio pin based on DAPM callback."
Date: Thu, 12 May 2022 21:10:23 +0530
Message-ID: <20220512154023.1185311-2-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512154023.1185311-1-Vsujithkumar.Reddy@amd.com>
References: <20220512154023.1185311-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65af7c28-b5e8-4e8a-6280-08da342dc1c5
X-MS-TrafficTypeDiagnostic: CY4PR12MB1573:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1573DC33676B042E1E7A1FE892CB9@CY4PR12MB1573.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yDHxiLTRC7EEIcfJ4gLkhZ1i9rhkTahmnVJzBe0VV/iR93bB7vsq8HXj1Su1S1J+HlLWpaW+Gu8leGOw7aE6vtXI8gUvBx0NgZTPZ9NI/DpfdLp1ic5kaq5Y4+d5f38HZA9L7jHZzMMsoK0KHT9E532x0h1jIO8A7HbcC20fcUXa5T1iwCWk5axS//tG3GABbA7mV7mJxUh8FdTAyC2n0otJwLjEWPpORPyopTZGvgqg/NE1NMT2q4Te9UetyY83lCIoCewV+hpPfrozwdszmyyMre00a5YzSASdIDLuyb17QIe5+4o3HIkfL9SzgDefWHEgxDPBtCmNVl9d8nXoP0Y7QjkEobn/pwTlqkFUhP7UFfRJFKJTnHPS3rVFAMuEhkWBN8BUmiQjObB0FfSziDzWP7f7JVJsRNroBDxZ0bLq0eIiHAP2y0k1CGUrOLJOFsXcCYTo89KrMMw8PWKyf/N17FMzlGOeV4XZfJLjzl6ZPpRyjRBVbsnu750tD6GsxsQFRmPnOkE7JiPATIIykCGnbgThyT4TzeY6NAARBn4+u+QXSkx9vTc2BfWheQ6cmVKbFhz2dhMcQfwmi5oZAsOYhzEO4TnGAV2H60NbOYq6RDXCHA8WG0mU3dmmVHj80sLnsxfAoLn+2WrnQSriUyBPTUNd0ZLihqRTriYKvRU/nF6ChiyopDimS0hsEcZrLDzGhin7x2/w9A1JV/WsIVV0EKfjev2KiwWzzcvKSA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(70206006)(70586007)(4326008)(8676002)(356005)(6666004)(86362001)(110136005)(426003)(47076005)(40460700003)(36860700001)(336012)(316002)(83380400001)(54906003)(186003)(1076003)(82310400005)(81166007)(7696005)(26005)(2616005)(5660300002)(36756003)(2906002)(8936002)(461764006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:40:35.4363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65af7c28-b5e8-4e8a-6280-08da342dc1c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1573
Cc: V sujith kumar
 Reddy <Vsujithkumar.Reddy@amd.com>, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Vijendar.Mukunda@amd.com
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

RT1019 codec has two ways of controlling the en_spkr.
one way is controlling through gpio pin method the another way is through codec register update.

Now Speaker enable/disable is controlled  through register update in BIOS.
So this patch reverse gpio logic, which is no longer in use.

This reverts commit 5c5f08f7fc0bee9a1bc3fbdcb7a21cfd0648ab14.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/amd/acp/Kconfig           |  6 +++---
 sound/soc/amd/acp/acp-legacy-mach.c | 21 +++------------------
 sound/soc/amd/acp/acp-mach-common.c | 25 -------------------------
 sound/soc/amd/acp/acp-mach.h        | 10 +---------
 sound/soc/amd/acp/acp-sof-mach.c    | 21 +++------------------
 5 files changed, 10 insertions(+), 73 deletions(-)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 626e4a5cb06a..9dae2719084c 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -42,7 +42,7 @@ config SND_AMD_ASOC_RENOIR
 
 config SND_SOC_AMD_MACH_COMMON
 	tristate
-	depends on X86 && PCI && I2C && GPIOLIB
+	depends on X86 && PCI && I2C
 	select CLK_FIXED_FCH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
@@ -54,14 +54,14 @@ config SND_SOC_AMD_MACH_COMMON
 
 config SND_SOC_AMD_LEGACY_MACH
 	tristate "AMD Legacy Machine Driver Support"
-	depends on X86 && PCI && I2C && GPIOLIB
+	depends on X86 && PCI && I2C
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables legacy sound card support for ACP audio.
 
 config SND_SOC_AMD_SOF_MACH
 	tristate "AMD SOF Machine Driver Support"
-	depends on X86 && PCI && I2C && GPIOLIB
+	depends on X86 && PCI && I2C
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables SOF sound card support for ACP audio.
diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 442d5644e0f3..7f04a048ca3a 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -27,7 +27,6 @@ static struct acp_card_drvdata rt5682_rt1019_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_GB,
 };
 
 static struct acp_card_drvdata rt5682s_max_data = {
@@ -37,7 +36,6 @@ static struct acp_card_drvdata rt5682s_max_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
 };
 
 static struct acp_card_drvdata rt5682s_rt1019_data = {
@@ -47,7 +45,6 @@ static struct acp_card_drvdata rt5682s_rt1019_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
 };
 
 static const struct snd_kcontrol_new acp_controls[] = {
@@ -62,16 +59,15 @@ static const struct snd_kcontrol_new acp_controls[] = {
 static const struct snd_soc_dapm_widget acp_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Left Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Right Spk", event_spkr_handler),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static int acp_asoc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = NULL;
 	struct device *dev = &pdev->dev;
-	unsigned int spkr_gpio;
 	int ret;
 
 	if (!pdev->id_entry)
@@ -89,20 +85,9 @@ static int acp_asoc_probe(struct platform_device *pdev)
 	card->controls = acp_controls;
 	card->num_controls = ARRAY_SIZE(acp_controls);
 	card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
-	spkr_gpio = ((struct acp_card_drvdata *)(card->drvdata))->gpio_spkr_en;
 
 	acp_legacy_dai_links_create(card);
 
-	if (gpio_is_valid(spkr_gpio)) {
-		ret = devm_gpio_request(dev, spkr_gpio, "spkren");
-		if (ret) {
-			dev_err(dev, "(%s) gpio request failed: %d\n",
-				__func__, ret);
-			return ret;
-		}
-		gpio_direction_output(spkr_gpio, 0);
-	}
-
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev,
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 51adb8f3f83e..6ae454bf60af 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -71,31 +71,6 @@ static const struct snd_soc_dapm_route rt5682_map[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-int event_spkr_handler(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct acp_card_drvdata *drvdata = snd_soc_card_get_drvdata(card);
-
-	if (!gpio_is_valid(drvdata->gpio_spkr_en))
-		return 0;
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		gpio_set_value(drvdata->gpio_spkr_en, 1);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
-		gpio_set_value(drvdata->gpio_spkr_en, 0);
-		break;
-	default:
-		dev_warn(card->dev, "%s invalid setting\n", __func__);
-		break;
-	}
-	return 0;
-}
-EXPORT_SYMBOL_NS_GPL(event_spkr_handler, SND_SOC_AMD_MACH);
-
 /* Define card ops for RT5682 CODEC */
 static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index fd6299844ebe..5dc47cfbff10 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -17,12 +17,6 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-
-#define EN_SPKR_GPIO_GB                0x11F
-#define EN_SPKR_GPIO_NK                0x146
-#define EN_SPKR_GPIO_NONE      -EINVAL
 
 enum be_id {
 	HEADSET_BE_ID = 0,
@@ -55,11 +49,9 @@ struct acp_card_drvdata {
 	unsigned int dai_fmt;
 	struct clk *wclk;
 	struct clk *bclk;
-	unsigned int gpio_spkr_en;
 };
 
 int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
 int acp_legacy_dai_links_create(struct snd_soc_card *card);
-int event_spkr_handler(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int event);
+
 #endif
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 8243765d490f..d1531cdab110 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -27,7 +27,6 @@ static struct acp_card_drvdata sof_rt5682_rt1019_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_GB,
 };
 
 static struct acp_card_drvdata sof_rt5682_max_data = {
@@ -37,7 +36,6 @@ static struct acp_card_drvdata sof_rt5682_max_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NK,
 };
 
 static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
@@ -56,7 +54,6 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NK,
 };
 
 static const struct snd_kcontrol_new acp_controls[] = {
@@ -70,16 +67,15 @@ static const struct snd_kcontrol_new acp_controls[] = {
 static const struct snd_soc_dapm_widget acp_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Left Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Right Spk", event_spkr_handler),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static int acp_sof_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = NULL;
 	struct device *dev = &pdev->dev;
-	unsigned int spkr_gpio;
 	int ret;
 
 	if (!pdev->id_entry)
@@ -97,20 +93,9 @@ static int acp_sof_probe(struct platform_device *pdev)
 	card->controls = acp_controls;
 	card->num_controls = ARRAY_SIZE(acp_controls);
 	card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
-	spkr_gpio = ((struct acp_card_drvdata *)(card->drvdata))->gpio_spkr_en;
 
 	acp_sofdsp_dai_links_create(card);
 
-	if (gpio_is_valid(spkr_gpio)) {
-		ret = devm_gpio_request(dev, spkr_gpio, "spkren");
-		if (ret) {
-			dev_err(dev, "(%s) gpio request failed: %d\n",
-				__func__, ret);
-			return ret;
-		}
-		gpio_direction_output(spkr_gpio, 0);
-	}
-
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
2.25.1

