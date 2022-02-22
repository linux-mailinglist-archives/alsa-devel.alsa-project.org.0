Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 777AE4BF1F4
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 07:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6164175A;
	Tue, 22 Feb 2022 07:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6164175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645510491;
	bh=DnfhFAQmLtz7EYDE8KicN53YtrLB2rZcm+61A/PP8yo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uW9Xae5HinOAG46zSmOYdJkjskvwcORwOmSxegjt/+FKzIlSbjIw7RXugUZScppFR
	 9X8BG1hYNKpTxqzXa62xEGu7PuZpM6956NQCkoH7vSA2gXtQaUvyUalLe+n/MIBvD1
	 4+lhrj1L9aCYPkTnbjc5shSdg4EUKP9TmN7p/UiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C5BBF80519;
	Tue, 22 Feb 2022 07:13:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC420F80518; Tue, 22 Feb 2022 07:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A648CF80511
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 07:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A648CF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="wZULgDjm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5ay1zZ0C0IGvVnGrgTOmMbRCT3L6B545pVBBGoCnGWMFV/HHNJtqypLW1tSyH5QwDQiK3pfyOLKI18xcmtqW84+YKFt5NV+ceZQTha0kUMhvwfwW+nKrLsaWlkQygKKB6qT68/k44lPk9zsvy5b6lYQAsRSdaFgHY4WykzKKtxJIxxHYeBHJHkn5/l0xF7C9wmOdOG3o0qYDIvZYYEGVeBAiIlra7lOzytqVKtIz0M62PvNBbIaDXXHDpVD+SBQYioWdbGz8azhJ3M5Ylp7RsTW6Jsts9bUJtuSFQJozruqLgfUwI39dp4q4zgmpcV6SfoRsDf4eOkOIRHMaROIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKB0ilVSAxrVRVAWHmYdw037mYAIeaU1A5Th3hKnnps=;
 b=TELE39BygBTb6FiDHAHIRN/6/tLq+91X7o4FZTjgaZJeJlnFdllPjtj0ggIItyx8bHKAiZoqMicItR2h/9Bc0MiCkojTIuW79yqz0Wpa61uJ6+nqLWXmWqyNGJP40GXk3HGLb8V0qUfmm2U3yMq/1hqUDZR2k6wYlgZ74JMvIAhQ2hD+t7zjXOgVM2MjV4zoJBJbzv4KBBowvfST9Y1rvyphl1USNFPUDjgJSzBtaMRNPial2hxYGJ4tOj4OUCc6D9U5awhOCEKMWHBFVYH0DI5+HeCLkM0JXHZxRo0OT0e35uEJ4kXKrA3/oKDWwgAM+q+o9c5fY1cCQ3191VFVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKB0ilVSAxrVRVAWHmYdw037mYAIeaU1A5Th3hKnnps=;
 b=wZULgDjmwkO2zW5J3Jg3DbvYFHE0N8uoBGvVKddI9IKxAxW/2VwqjIECGKcjSABJTEdOo1xWQJrmSIuXiDEY0wnFlEZTieGelO7waWfWCMcJFHopUGV14ar1UK2229akpUrgetTay/YhjtTLH07GybmL5cqgY/YVv3pv+EE8c3E=
Received: from MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::11)
 by MN2PR12MB3006.namprd12.prod.outlook.com (2603:10b6:208:cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 06:13:16 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::ee) by MW4P221CA0006.outlook.office365.com
 (2603:10b6:303:8b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 22 Feb 2022 06:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 06:13:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 00:13:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 00:13:13 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Feb 2022 00:13:10 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/3] ASoC: amd: acp-legacy: Add legacy card support for new
 machines
Date: Tue, 22 Feb 2022 11:41:27 +0530
Message-ID: <20220222061128.719400-3-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
References: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca50f751-67a8-44fb-6b37-08d9f5ca69a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3006:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3006E526640224D9602E9BA9823B9@MN2PR12MB3006.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nffm/4bPrx0Lw9HKSzWB9pLOtZw9MNGuWLVA/plApoX4YOIndbPD2rdfhHEzEruWM+Je3WxbF8mOs63E/AEZ1NYD+SF/v6zDrCJLUIsBX0xWFTb26bEztnGYmHCUvQ97QlUIMubtzxOGBSwUXnWLxwRasxQ+Zy52OqoyFE2B9zKLZQqjeblHn/WCp/cM4COjRyvTHP4Crup/caYCCE/Eq1uZTaMrxRhHJ7bjlU2NO/2T252151raNLsUj/HE+dDC34jxEGQqNy1ci/ZTHeeucGp0CYNzCgpYQOnqU35wnWkgrge1vGds8DNLAdK8mXobCXRYNoTQrbKq3Gf+Yc2Nn3+Ic+zRQhaCnzVeXMVoTKSKiJbuJ6XDUaSjQzUOINekxmfJCdfu1f9jVMa1gJZZDUSmibPfdweUOHPNRXFGvFpYzOEVj0vkzVL6XNmhcRKFSbgw2DFZb1Tt7Cq1k6cqniPpDZ+W5nbgj4S7U0U2+Mri0Gk5beQoaUBonV8J44pcm/PPVIrAjjapkw68gB4vCbFJh4xxxqJtwvM8isrOU7vnZ+AC4ZSjn0QoqgvpUFJw5SwXYmf+hl/i9SouSfjNkXaH5YIizA33HviNF2Gexy9/nQLi9HjVMv/Utxl1O3GgsIHPXbnDG04uQxiyGfjy3g6ADhVFu3teg6FCnEFX46Mg721oydz9dtVGlVr7ZVGh/K8yWiJbfjSsdtVJHauR/A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(26005)(82310400004)(1076003)(70206006)(70586007)(2616005)(36860700001)(7696005)(86362001)(110136005)(508600001)(316002)(6666004)(54906003)(8676002)(81166007)(356005)(336012)(426003)(4326008)(47076005)(5660300002)(8936002)(2906002)(40460700003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 06:13:15.2080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca50f751-67a8-44fb-6b37-08d9f5ca69a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3006
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, V sujith
 kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
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

We have newer renoir platforms with different codecs combinations.
Add struct in legacy machine driver and add to list of supported
renoir machine to support sound card registration on platform with
rt5682s as primary headset codec and max98360 and rt1019 as speaker
amp codec.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c | 30 +++++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c      | 17 ++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 50a5aa4d6da9..8118577d5620 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -30,6 +30,26 @@ static struct acp_card_drvdata rt5682_rt1019_data = {
 	.gpio_spkr_en = EN_SPKR_GPIO_GB,
 };
 
+static struct acp_card_drvdata rt5682s_max_data = {
+	.hs_cpu_id = I2S_SP,
+	.amp_cpu_id = I2S_SP,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = RT5682S,
+	.amp_codec_id = MAX98360A,
+	.dmic_codec_id = DMIC,
+	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
+};
+
+static struct acp_card_drvdata rt5682s_rt1019_data = {
+	.hs_cpu_id = I2S_SP,
+	.amp_cpu_id = I2S_SP,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = RT5682S,
+	.amp_codec_id = RT1019,
+	.dmic_codec_id = DMIC,
+	.gpio_spkr_en = EN_SPKR_GPIO_DW,
+};
+
 static const struct snd_kcontrol_new acp_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -99,6 +119,14 @@ static const struct platform_device_id board_ids[] = {
 		.name = "acp3xalc56821019",
 		.driver_data = (kernel_ulong_t)&rt5682_rt1019_data,
 	},
+	{
+		.name = "acp3xalc5682sm98360",
+		.driver_data = (kernel_ulong_t)&rt5682s_max_data,
+	},
+	{
+		.name = "acp3xalc5682s1019",
+		.driver_data = (kernel_ulong_t)&rt5682s_rt1019_data,
+	},
 	{ }
 };
 static struct platform_driver acp_asoc_audio = {
@@ -114,4 +142,6 @@ module_platform_driver(acp_asoc_audio);
 MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
 MODULE_DESCRIPTION("ACP chrome audio support");
 MODULE_ALIAS("platform:acp3xalc56821019");
+MODULE_ALIAS("platform:acp3xalc5682sm98360");
+MODULE_ALIAS("platform:acp3xalc5682s1019");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index b8dc25a1d31d..35d66454e5a3 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -44,6 +44,11 @@ static struct snd_soc_acpi_codecs amp_rt1019 = {
 	.codecs = {"10EC1019"}
 };
 
+static struct snd_soc_acpi_codecs amp_max = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
 static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
 	{
 		.id = "10EC5682",
@@ -51,6 +56,18 @@ static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &amp_rt1019,
 	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682sm98360",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682s1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
 	{
 		.id = "AMDI1019",
 		.drv_name = "renoir-acp",
-- 
2.25.1

