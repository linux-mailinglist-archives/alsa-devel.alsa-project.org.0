Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A126022F361
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 17:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4F416B8;
	Mon, 27 Jul 2020 17:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4F416B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595862333;
	bh=oaQfzEc5BOeLnSUPwpbfEsxNQ9uYw5WBmTgMCHqGQZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSlYjSBYRsH7MODhOa1yWRfGvvOMrm1KJ+BLITYMj7h3sj7ud+aTs4Cmkuts6Gz2z
	 KtoPHLAenkMOy64cE04rJPjXGbpOmvT8HlH52NnTRjc/JEkLVP6VvZYwrTN4fQ5TRH
	 w518kmhQBhV/lxghVlLRtaNdXc5QLDziqOtDz47k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB4B0F802E0;
	Mon, 27 Jul 2020 17:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCB73F802DF; Mon, 27 Jul 2020 17:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4992F802DB
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 17:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4992F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="yGQErhdG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLOZ/zJwoSJ6WE30kKIOU53c8OXQgdyM1LQLSAPB5o/bhfseAOZ4ZjSKaNXVSjanWjl5nsaXOmUtk/gWLGkCR9rJ73rE5BvsoFmcirDGynedF2CnqBV7Lf/ivEfC8ubOdHBuT61YfySoEnyaYT+6KqayZrok7Idwk9cW+vUcs/W19PiC4mlk39hVH5SkEsxI5uHEOmm3gdctsnEuuXM0vGuSKZeoZMUw+CbVTh4ETHu+SyiQBsUHgS9nFkTf+/4Njs9Sq4A+Z5x1V6Yc7HkmDzrk/GJ8EXoVcING25wtCYaa+U1y+vhb5saG3yInv5WrV2/DH/SldkLxiCHl2zDqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjpHPW4m4qtDpibv0qHdCBCVCb/Ry0z/U6zuWOCnkLc=;
 b=MXrFWUa8vB12C8WPxOeX54txr0CAfo3KIKjinT08YLDkUuj+N0T2qb0YtpxVmwHjccbwFfWDECi+voBhS4LcysRdDee+EYvorReVgDpa3Ef/J2HWukr9/w5m96uWYDHUdLqeiqIwHMNW3cQi05G6oNah30YzNL/1PQ8mwQ/y0lrYfYxrxBMdCLdPNjbJnCVVqKb/DHw70sw1t6jmO37VaS6sbEYUcAqNiAORbZWlY/mNfK/wTX1c8ke7s4DkFg0EBIsh5Ru1KWFdvhepihF1hrDubSFBJwZKBsTlZBWwnbnQ8OVsgn5jGtc1vpCasCMkmlUYVk+lFzi8w8FYO2PWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjpHPW4m4qtDpibv0qHdCBCVCb/Ry0z/U6zuWOCnkLc=;
 b=yGQErhdGXZ/qyjYLz/EffWkb4xj8AbRHZGUdxbIe+eJtfkT2W8B9aniKrAEBms7gJD6RO4w35cN9LV/Kz7Y+LmpgwEeDVeJ5ZkoOJlm63saYDz3+8pYoBSf8qZzDdssRVoA59MRgBh+dBVpZzFOa6vZKyN3MZxQ/K2G+9qscSHk=
Received: from DM5PR12CA0011.namprd12.prod.outlook.com (2603:10b6:4:1::21) by
 BN6PR12MB1826.namprd12.prod.outlook.com (2603:10b6:404:106::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23; Mon, 27 Jul 2020 15:02:09 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::cc) by DM5PR12CA0011.outlook.office365.com
 (2603:10b6:4:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Mon, 27 Jul 2020 15:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 15:02:09 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:02:08 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 27 Jul 2020 10:02:04 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH 4/6] ASoC: amd: Adding support for ALC1015 codec in machine
 driver
Date: Mon, 27 Jul 2020 20:28:29 +0530
Message-ID: <20200727145840.25142-4-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2029c26-1794-48ae-a620-08d8323e091d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1826:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1826AF4B5300C9FDB9090ECAE7720@BN6PR12MB1826.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Q/Kkx92Etz9yppikYjxzuOo0p+LXE3YFC54BIjbKFnXaxNmNHAaopYAjmkZDw9f1xz77lX3151DC7xPQAg3xgNmKfQo6slcLkDXtvbV6D0hUrfRP3nlDpF3/FXbiBNcFYVLh1P6KiamuBckA0v0DDgd5HX4SxVW18CeXTr+bbVpZCTAhsvL9jtmFVQqoJM9NyAZf+gmToHtT9RFv3Njsal7TjztMSK7esWfZIMGFep553WC0DwfncMcTccud5ElSZXXCTIIxhJTzP+LSH1fiUYKl1reeJPXNzRGP0XiK/P5HK7voVwTsU1h2BpUiJUqtCBM1ZRm4d9zSPPTAbodH3RKex7dM2RBMPoPeyrpTnjz/nCmtJizFltkWyZD7E+Pfdl9lmLJ8Tzl5qLjCS2K+8YV5A5dGEyQB4J+nXt+zjc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(82310400002)(86362001)(83380400001)(82740400003)(47076004)(356005)(81166007)(336012)(426003)(2616005)(5660300002)(70206006)(36756003)(70586007)(1076003)(2906002)(316002)(109986005)(4326008)(54906003)(8676002)(186003)(6666004)(7696005)(26005)(7416002)(478600001)(8936002)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 15:02:09.4364 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2029c26-1794-48ae-a620-08d8323e091d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1826
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Arnd Bergmann <arnd@arndb.de>,
 open
 list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi
 Iwai <tiwai@suse.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Akshu Agrawal <akshu.agrawal@amd.com>
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

Adding support for ALC1015 RTK codec in machine driver.
Passing specific card structure based on its ACPI ID.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/Kconfig                |  1 +
 sound/soc/amd/acp3x-rt5682-max9836.c | 63 ++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 77ffdb41bee5..3e19995a74bc 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -30,6 +30,7 @@ config SND_SOC_AMD_ACP3x
 config SND_SOC_AMD_RV_RT5682_MACH
 	tristate "AMD RV support for RT5682"
 	select SND_SOC_RT5682
+	select SND_SOC_RT1015
 	select SND_SOC_MAX98357A
 	select SND_SOC_CROS_EC_CODEC
 	select I2C_CROS_EC_TUNNEL
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 1e446e4bab25..ac96ef70aafa 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -21,6 +21,7 @@
 
 #include "raven/acp3x.h"
 #include "../codecs/rt5682.h"
+#include "../codecs/rt1015.h"
 
 #define PCO_PLAT_CLK 48000000
 #define RT5682_PLL_FREQ (48000 * 512)
@@ -246,7 +247,18 @@ SND_SOC_DAILINK_DEF(cros_ec,
 SND_SOC_DAILINK_DEF(platform,
 	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp3x_rv_i2s_dma.0")));
 
-static struct snd_soc_dai_link acp3x_dai_5682_98357[] = {
+static struct snd_soc_codec_conf rt1015_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1015:00"),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1015:01"),
+		.name_prefix = "Right",
+	},
+};
+
+static struct snd_soc_dai_link acp3x_dai[] = {
 	{
 		.name = "acp3x-5682-play",
 		.stream_name = "Playback",
@@ -316,8 +328,8 @@ static const struct snd_kcontrol_new acp3x_5682_mc_controls[] = {
 static struct snd_soc_card acp3x_5682 = {
 	.name = "acp3xalc5682m98357",
 	.owner = THIS_MODULE,
-	.dai_link = acp3x_dai_5682_98357,
-	.num_links = ARRAY_SIZE(acp3x_dai_5682_98357),
+	.dai_link = acp3x_dai,
+	.num_links = ARRAY_SIZE(acp3x_dai),
 	.dapm_widgets = acp3x_5682_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(acp3x_5682_widgets),
 	.dapm_routes = acp3x_5682_audio_route,
@@ -326,6 +338,47 @@ static struct snd_soc_card acp3x_5682 = {
 	.num_controls = ARRAY_SIZE(acp3x_5682_mc_controls),
 };
 
+static const struct snd_soc_dapm_widget acp3x_1015_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0,
+			 &acp3x_dmic_mux_control),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route acp3x_1015_route[] = {
+	{"Headphone Jack", NULL, "HPOL"},
+	{"Headphone Jack", NULL, "HPOR"},
+	{"IN1P", NULL, "Headset Mic"},
+	{"Dmic Mux", "Front Mic", "DMIC"},
+	{"Dmic Mux", "Rear Mic", "DMIC"},
+	{"Left Spk", NULL, "Left SPO"},
+	{"Right Spk", NULL, "Right SPO"},
+};
+
+static const struct snd_kcontrol_new acp3x_mc_1015_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static struct snd_soc_card acp3x_1015 = {
+	.name = "acp3xalc56821015",
+	.owner = THIS_MODULE,
+	.dai_link = acp3x_dai,
+	.num_links = ARRAY_SIZE(acp3x_dai),
+	.dapm_widgets = acp3x_1015_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp3x_1015_widgets),
+	.dapm_routes = acp3x_1015_route,
+	.num_dapm_routes = ARRAY_SIZE(acp3x_1015_route),
+	.codec_conf = rt1015_conf,
+	.num_configs = ARRAY_SIZE(rt1015_conf),
+	.controls = acp3x_mc_1015_controls,
+	.num_controls = ARRAY_SIZE(acp3x_mc_1015_controls),
+};
+
 void *soc_is_rltk_max(struct device *dev)
 {
 	const struct acpi_device_id *match;
@@ -374,6 +427,7 @@ static int acp3x_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id acp3x_audio_acpi_match[] = {
 	{ "AMDI5682", (unsigned long)&acp3x_5682},
+	{ "AMDI1015", (unsigned long)&acp3x_1015},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
@@ -390,5 +444,6 @@ static struct platform_driver acp3x_audio = {
 module_platform_driver(acp3x_audio);
 
 MODULE_AUTHOR("akshu.agrawal@amd.com");
-MODULE_DESCRIPTION("ALC5682 & MAX98357 audio support");
+MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
+MODULE_DESCRIPTION("ALC5682 ALC1015 & MAX98357 audio support");
 MODULE_LICENSE("GPL v2");
-- 
2.17.1

