Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50734E3A3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 10:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFD411681;
	Tue, 30 Mar 2021 10:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFD411681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617094696;
	bh=MSNYDZkJBDk/gTGlqjfzHksjXyn3RSUTi/Sl/j38yEA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NqvoLqktRnvvIPkdI0zd7ZfvP/zh1enBC8exBwPiufoyZlbTqqFPs4ROFytWt2eZN
	 ZXcUqBf0eoMIJMQTjQzz/PR/xNZ3TpuCMb0Tjm81Dtw4IH5yJhRSBCxZgIVUdrQt7A
	 GDUlnC6/CQLAcYCPUtSzXcgUw+SKjK2JlT4aBDIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA6BF800B9;
	Tue, 30 Mar 2021 10:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D558F80240; Tue, 30 Mar 2021 10:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A15DF800B9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 10:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A15DF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="NMOIfVUf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2KW0EiYdfAhWOmug6PR+OMLK20KPJbAyPQkm09J8AevWuGU3jJiKnrXS+Kz8vhy2XKkXa6AvcmLE3ZD10BlkgzhofwxAxlKP0ivqlHvhC+aEEqHLxfrsyGu90LzClqCbPUHuhAEYB4VXavcw9cWUBwn8rRc9grbhcgr4GNKk5y3kzcZt4PLml3Sz8niTksXAZEeB0BWJZ7NCSbQBL6Wi3JAqsJb9ZXTlytXzUImqnSvFNpa7bTsFptDrnhpBuH2jfMuh44sSZcXx8VjKvXfzCbARo5hhQx0hvc201kRBA9jZww1MY/nq5wU15k9aIzw5sohGct4JVbuG5UOqLIN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcLbZuPrAoF0vz+syYsFzQl/V2SXo31YQyW5HlYrO/A=;
 b=evRG0CZAcGmG7SSZqsha0CWaqcoLuZ4PJ8Hrw6IMI4krg2lcLuiqgaRJ111drFRhwGobp1dED5++wGSOTxRThsS78Co/C6yra9XKY8h7XcffcG8nCWuDbwc0qMcef3xJ7C43sgJPe0fHsQ5NyQLnb2cYjj2YSr997MIup3p0nE/0V3Jht15IIqbH50XlgilKqpaIuVNvhjODKM1vWxQC7YA+IOxAesFkJy7gd58OwE/V84xa3JPW0O9UGbfzcc6XtIrF+iEPZVBHF0KRlDtEjLreu0cA7VWCBqBvSMcyJSD+tG+1TU/rzW1fcQP0254MKEs8JNXd9UbJj0EIllev3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcLbZuPrAoF0vz+syYsFzQl/V2SXo31YQyW5HlYrO/A=;
 b=NMOIfVUfDdDyWFRqoD6f4doI9/87quuiyZGmaiIZdxOXVHiybIp3Q28OF+mNdDGbAeXmn9Zt8n+epwfOzUthD9URk8pkz/x1qyyVwcZORmCkSnAfwnhWoM9/lbBu6xXxgJLdUyqLKKHDbbZ+q/nh81HTPFI00jOJLsrZ8V8FATw=
Received: from BN9PR03CA0545.namprd03.prod.outlook.com (2603:10b6:408:138::10)
 by BN6PR1201MB0116.namprd12.prod.outlook.com (2603:10b6:405:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Tue, 30 Mar
 2021 08:56:32 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::d) by BN9PR03CA0545.outlook.office365.com
 (2603:10b6:408:138::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Tue, 30 Mar 2021 08:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Tue, 30 Mar 2021 08:56:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 03:56:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 03:56:30 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 30 Mar 2021 03:56:26 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: Add support for ALC1015P codec in acp3x machine
 driver
Date: Tue, 30 Mar 2021 14:43:15 +0530
Message-ID: <1617095628-8324-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 252a04fb-5613-442c-6645-08d8f359b71a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0116:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB01169646A18C9FEB801B4B68977D9@BN6PR1201MB0116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8t6gqmLu9IwB8ptyD2QFOefmVfk3E8vn68HJM+IHdvAi9xxBPuOY65G9KxaMpFm3XwVHa+TK1jeB7O1s5HL0hZf4+EGx6S1/+0r/dUUW7PEySsl2g386Zv+48VcTCfMRSQJwzc0TIb/qst9N2HTrKjDlhtBziOmD4W67wC9HNexvwXrqAkrwbhoLGZUjpfr2DhXZE7PhNMSNgF1lDlFwfg7rbgrxgsn9ClTDBrbeMk2NncF9snQg4K9hdcIcVKGHQUtvRYXNBGqbB1+4yOseh7aoUdkhF1yRGid/ezH4TjpGgOP2dyD6v8slGuDRsUJyijL0ReY4W32EN6G9YXQHkRNbEn7JXhkwAGEQHmbSL+u9nbA9PlNQyW1NQKj6mifpkk8P8qVNEQq5KhGjwV25VBxKYavtRRtgUc9ECy8Gc3LsBFGPlCQuAt9y5FQkrfDWjTUnWeEuYYOaieKlF42Icn7/DNKrrm9FbxZGAs+h06jWyTWUSFw4U/WSpIsLBaErF1m0sEUE/5qa/fZisazzknN7TZu4lxcH51NoXZTvfuW8P7okgKv+QeYug39QVg6KVu3zNBcV2i0SxTyO+Ru1Nm3S2C9N5CHZSQIhiRwtoZr+6UlvvT8EkwxFOhatD2+ExFXo0jpPyss5cUk1gj17FiyiL5zUZ0UbcOzcpZJobcccHBIG6N39gQAGHeQyHdK2IzCAC6pHmPg6q1PGlv8V+Sq+J6e3Icp/NLL6g4VDLkg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(478600001)(47076005)(81166007)(70206006)(356005)(7696005)(336012)(26005)(70586007)(36756003)(2906002)(82740400003)(316002)(110136005)(54906003)(4326008)(2616005)(82310400003)(86362001)(83380400001)(8676002)(36860700001)(426003)(6666004)(7416002)(8936002)(186003)(5660300002)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 08:56:32.2074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 252a04fb-5613-442c-6645-08d8f359b71a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0116
Cc: jack.yu@realtek.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sunil-kumar.Dommati@amd.com, kent_chen@realtek.com,
 Arnd Bergmann <arnd@arndb.de>, Tzung-Bi Shih <tzungbi@google.com>, open
 list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander.Deucher@amd.com, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, shumingf@realtek.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, flove@realtek.com,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

Add ALC1015p codec support for acp3x machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig                |  1 +
 sound/soc/amd/acp3x-rt5682-max9836.c | 46 +++++++++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 256c192..ba5a85b 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_AMD_RV_RT5682_MACH
 	select SND_SOC_CROS_EC_CODEC
 	select I2C_CROS_EC_TUNNEL
 	select SND_SOC_RT1015
+	select SND_SOC_RT1015P
 	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC
 	help
 	 This option enables machine driver for RT5682 and MAX9835.
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index cea320a..8e11bb8 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -275,6 +275,8 @@ SND_SOC_DAILINK_DEF(rt5682,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
 SND_SOC_DAILINK_DEF(max,
 	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
+SND_SOC_DAILINK_DEF(rt1015p,
+	DAILINK_COMP_ARRAY(COMP_CODEC("RTL1015:00", "HiFi")));
 SND_SOC_DAILINK_DEF(rt1015,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1015:00", "rt1015-aif"),
 			COMP_CODEC("i2c-10EC1015:01", "rt1015-aif")));
@@ -419,6 +421,43 @@ static struct snd_soc_card acp3x_1015 = {
 	.num_controls = ARRAY_SIZE(acp3x_mc_1015_controls),
 };
 
+static const struct snd_soc_dapm_widget acp3x_1015p_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0,
+			 &acp3x_dmic_mux_control),
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+};
+
+static const struct snd_soc_dapm_route acp3x_1015p_route[] = {
+	{"Headphone Jack", NULL, "HPOL"},
+	{"Headphone Jack", NULL, "HPOR"},
+	{"IN1P", NULL, "Headset Mic"},
+	{"Dmic Mux", "Front Mic", "DMIC"},
+	{"Dmic Mux", "Rear Mic", "DMIC"},
+	/* speaker */
+	{ "Speakers", NULL, "Speaker" },
+};
+
+static const struct snd_kcontrol_new acp3x_mc_1015p_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_card acp3x_1015p = {
+	.name = "acp3xalc56821015p",
+	.owner = THIS_MODULE,
+	.dai_link = acp3x_dai,
+	.num_links = ARRAY_SIZE(acp3x_dai),
+	.dapm_widgets = acp3x_1015p_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp3x_1015p_widgets),
+	.dapm_routes = acp3x_1015p_route,
+	.num_dapm_routes = ARRAY_SIZE(acp3x_1015p_route),
+	.controls = acp3x_mc_1015p_controls,
+	.num_controls = ARRAY_SIZE(acp3x_mc_1015p_controls),
+};
+
 void *soc_is_rltk_max(struct device *dev)
 {
 	const struct acpi_device_id *match;
@@ -435,6 +474,9 @@ static void card_spk_dai_link_present(struct snd_soc_dai_link *links,
 	if (!strcmp(card_name, "acp3xalc56821015")) {
 		links[1].codecs = rt1015;
 		links[1].num_codecs = ARRAY_SIZE(rt1015);
+	} else if (!strcmp(card_name, "acp3xalc56821015p")) {
+		links[1].codecs = rt1015p;
+		links[1].num_codecs = ARRAY_SIZE(rt1015p);
 	} else {
 		links[1].codecs = max;
 		links[1].num_codecs = ARRAY_SIZE(max);
@@ -486,6 +528,7 @@ static int acp3x_probe(struct platform_device *pdev)
 static const struct acpi_device_id acp3x_audio_acpi_match[] = {
 	{ "AMDI5682", (unsigned long)&acp3x_5682},
 	{ "AMDI1015", (unsigned long)&acp3x_1015},
+	{ "AMDP1015", (unsigned long)&acp3x_1015p},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
@@ -503,5 +546,6 @@ module_platform_driver(acp3x_audio);
 
 MODULE_AUTHOR("akshu.agrawal@amd.com");
 MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
-MODULE_DESCRIPTION("ALC5682 ALC1015 & MAX98357 audio support");
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("ALC5682 ALC1015, ALC1015P & MAX98357 audio support");
 MODULE_LICENSE("GPL v2");
-- 
2.7.4

