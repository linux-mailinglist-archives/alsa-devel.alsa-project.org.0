Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FF358397
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 14:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563111658;
	Thu,  8 Apr 2021 14:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563111658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617886070;
	bh=w8vInKNJACSIA9IwSpNQ9UByAkLd1OobdzLgFfezaVU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GBg4i9MbHVMB3pF1YNqlyx1VjArCWZYO3MdYz2jizvjAb3rLDgkDitzHCsCU7TbI8
	 KBnc4BzrOXnxf68XINkgK8Uf15+ELBpl8ke94+AeK6clzrs9tUmpCa5ubrDzPtmYw2
	 UGttS0fSCNbNMZYyCqAtiNgWW0FipVEl+ItMZ9Fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEB7FF80246;
	Thu,  8 Apr 2021 14:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2200F8020B; Thu,  8 Apr 2021 14:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EAE3F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 14:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EAE3F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="C1AxLVrN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALJoDOp5yRzoWsTsanLXqKE4VtYC78xX7WFNLzqFVAkGsWTc5y0pVvgUXNQ268ZFf1JeaFWI3H1HQCFZ62xVR4yFrQBIbOi3Balk0vImm3aq8jZI2IOnnNAbhbNED+ElxsG4+C+0IS4T6DtPJgP/GZOpjPn3sbnAT5DIGD6yUUuP14kf84fvStO18UrkdbH5Djmhhjn8z0gQdF/fZtecE8367IqG2RY5R6iO2DAr8KwqZBEEdWntaKUqsb6spkxHB3WvsgqW3t8rM9VYSv230ljJNIqlBM2fl9YC2BA/V03zcj34grXbxyQvCUMIQMebe5r9wJaMkajZd9KriVe6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm0yhHswHOQb0oUWact4B03oexJS9u65/V2Twk6NMM4=;
 b=TRi2BawnkcjsMw5ZJYQekO0abgVck7VRdEl3lLUBXjavUpIvCyiO1l6mLn/d7CjSA1w4Ps8mue3AGQDInJsxJWysVkOgA0/OyKELsJmMqya8dXEg7FTLdL5Cd6pzy2f2f65NX389AYdmJm/1UTV1GLpDefyphnMAltV3k6s13790DfhkS3xEJzl3AUTxh0WqT+F1uIA5JsZbREN3NpLWoNBUTkb8O+kHPM2658oymPFnconGBEDy9Vvo8MtTPe002q4e6udOn6Xg5NFTrxWaV7Fm+Q4nEl9bjQGDMaNkL5+hFw0ePYW7UCpQhEpzsL9nv0p2NkHKO4RhBd3Z+cOM5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm0yhHswHOQb0oUWact4B03oexJS9u65/V2Twk6NMM4=;
 b=C1AxLVrNDKb6yfRqQZgqpsbnlmRGTyyDx59yBGzuRvQ9N0XiboCvDJ0JVLiSBiDonUPVaQAGrawLsVFRmrQwDH0u3eWI+iBXA6sXsdCZtu2MnLl5fEFTFHWuj7xja2cOFqiSxws18mWHkP4qLnzx/0zgjjhgI0vts69KLR3BF2M=
Received: from BN6PR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:405:4c::21) by DM6PR12MB2698.namprd12.prod.outlook.com
 (2603:10b6:5:42::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 12:45:49 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::c2) by BN6PR1201CA0011.outlook.office365.com
 (2603:10b6:405:4c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 12:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 12:45:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 8 Apr 2021
 07:45:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 8 Apr 2021
 07:45:48 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Thu, 8 Apr 2021 07:45:43 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ASoC: amd: Add support for ALC1015P codec in acp3x machine
 driver
Date: Thu, 8 Apr 2021 18:32:36 +0530
Message-ID: <1617886984-9500-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7ab3259-5da6-4d11-1968-08d8fa8c3ccb
X-MS-TrafficTypeDiagnostic: DM6PR12MB2698:
X-Microsoft-Antispam-PRVS: <DM6PR12MB269849D24F11A63F2663291A97749@DM6PR12MB2698.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ev3+diqBx43gVD5n7Ht5e6yHkbmqm/FvyvvwUqZOUq5EvLEQgqMS7+m9j5j19eOnW5GWuKvOcgXn85/+ndlCe2l/0Lh4yc/jVrGuQpqWfpeEIlVCW3OYs7nXY5Pi0g0gTrQ1k/JIgSmKfZmvGgPW8Uv11F5vvpJgIOzpwnQTILPj1R/InEZChrGjtM2ZdgI+r4Zcas/tMbv5YXRVkikXwktJREoySmK9CEjBs7krLBiMTuMlv0Ng6v0mjRcw6aRSlF9sqerbR9ZR+YnmBEopf3v+YHhv4gIZ7+9I3gSZ3o9UCc7bYRtXKg/ZSzMPt0lQ6cDJMap2FC+DOJjJrgAGEaSBG2Z14MP2E6tlyBi6HDtUgUuRQXgYXdLfk45yxx7E2ZS6xXYUs15olkmlpMZQcrVmV6wel00fbJngppOS1IcoQo0F8TlqhmVbuoef/VIeJ0oWlmSFupfGzPzkj+KCMBegInk2MLCOjDXkpx3n+xn8+4ISGhqJPeV0NnMQ02x11aWlKNS3/XwzieBvk8MWxnR34BKpaiRtGn8iawY2wQHnq1I3WTKHkZdISDgjIOcqEEzNSOyF3JAPe27RNidSOQ4nh506cyLo9uD2JLbqTsLvQh1jw3dnpv55SaQ3vErysql/Q2xH00ibQqzZ/IBDC7wvfK+rI1nvQq8iyn+VpUN/IACzbKgWhhoq3wuo3wIZLh8kyGz/DESrNbq6ZkhiWjiDymzH4hPiXEJ5LduXH/c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(70206006)(7696005)(336012)(36756003)(8936002)(82310400003)(2616005)(5660300002)(7416002)(186003)(4326008)(426003)(478600001)(356005)(70586007)(2906002)(86362001)(8676002)(316002)(26005)(54906003)(83380400001)(6666004)(47076005)(81166007)(36860700001)(82740400003)(110136005)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:45:49.4784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ab3259-5da6-4d11-1968-08d8fa8c3ccb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2698
Cc: jack.yu@realtek.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sunil-kumar.Dommati@amd.com, kent_chen@realtek.com,
 Arnd Bergmann <arnd@arndb.de>, Tzung-Bi Shih <tzungbi@google.com>, open
 list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander.Deucher@amd.com, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, shumingf@realtek.com, Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, flove@realtek.com,
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
v1 -> v2: update ACPI HID as "10021015" for AMD platform with RT1015p support
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
index cea320a..d9980ab 100644
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
+	{ "10021015", (unsigned long)&acp3x_1015p},
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

