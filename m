Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4C4BF84E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:46:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 409FE18A4;
	Tue, 22 Feb 2022 13:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 409FE18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645533989;
	bh=jOMDN0uQe23EKodm9qWNz14EOFNxB+W0KKWZtGFyq70=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDd1PMR6z3ZYnkpLQyoY8dPgemjSFI50tKVnVeu9ktcGxKxXfm+ID4tijiMmvWbAx
	 fGgsggy8DbuGm4Vj6t8LWktZEu12R5eX2cH0p4it21EGWISO1Ep7txoGC7kUhHpMpe
	 fsDWZ7CLbeCEYpo6qEs7qCJVTeNDxP82n1NOIpKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F16F9F8051D;
	Tue, 22 Feb 2022 13:44:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 485B4F8051C; Tue, 22 Feb 2022 13:44:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66158F8051A
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:44:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66158F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Xb9hXEqL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0YJ2PsoAi1lGnUKeCVte7hdIV85oKUI3WsnxLqqzF47MqmgIHcVfc5iFhSUkPlsoFWmwGyRZ9bhFom0841HDf8oLcgghJwlK2MqJOojLEIKV1TIMHdzk7Hs+mK7v683MyqSTCuoqF4/Oe3JwsPSDvI23dpZc8j4O1JV+xjHN060kTlIz7D97IkUM3WeRZyAUAVU7eWTvP7KgE/iyCPnHLSK7IkSKNEVIlnWVyz5xdFiPYKaoM1X+TSp3s1ZnItbKm+byPiedGlwnhe8zZNH7n5wfVQKPYDcnwDZFyX6JP5i//dZw4a05J6C1HnUS5t21PVxkPNmoE0u6n6wB8S9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PATmXLvc3Q+FQnOdjZcycRPhY3x5Sa2/WlhajbUrivY=;
 b=kQv/wtgZ8T1ZFW0rIs0BXDUkFxcQ2Hs1RARNAFcrf5lknpGUoCMlijPIDwBkSiA8mvRwpLQzTtkB0iNJZuwSNtZsjhqM0NeDmwNSR+cXFpq8B+PwsBWPimaJ/vLHWXWi+oY3+qXF3x4NrkFo2NHrrkTW56JpnHkllOcmy8P3P6QA3UkWgsIXcGGvMKxinUzYtZXOHNebTd3DY5bGDys0gxakrkgOdekxG7ycXeJnvHqDCW2hl+ibGsFP8mrx/tqyT5BN8Q7QTHZResR0z1eulYCH4dTnxaaJQJNxhWx+36QGi2A3cH6QOLBQmo8R0cnoPwihtrm3r6e1o9viaChtLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PATmXLvc3Q+FQnOdjZcycRPhY3x5Sa2/WlhajbUrivY=;
 b=Xb9hXEqLVzSDPCejeyTQ0b0l+GfOVu4+XoN8Y1kc4+RHbzkIhPHHn4V3QGEO0mUluEIx1C6jEOF0s2whABENdI6pR0aXa3EP1t3xclGIC1rFSVVCI8SSqXKKgmbmRiP28rwTOjM64BsDjdEqBezSxs6nwuKHYrQv/qUTPJkJFas=
Received: from MWHPR02CA0002.namprd02.prod.outlook.com (2603:10b6:300:4b::12)
 by BYAPR12MB3031.namprd12.prod.outlook.com (2603:10b6:a03:d8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 12:44:29 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:4b:cafe::46) by MWHPR02CA0002.outlook.office365.com
 (2603:10b6:300:4b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Tue, 22 Feb 2022 12:44:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 12:44:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 06:44:27 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Feb 2022 06:44:24 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 2/3] ASoC: amd: acp-legacy: Add legacy card support for new
 machines
Date: Tue, 22 Feb 2022 18:12:12 +0530
Message-ID: <20220222124213.721224-3-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222124213.721224-1-AjitKumar.Pandey@amd.com>
References: <20220222124213.721224-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8936a50e-fd5c-4ff0-3b67-08d9f60110eb
X-MS-TrafficTypeDiagnostic: BYAPR12MB3031:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3031D3232E968C76F155C1FD823B9@BYAPR12MB3031.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYw5+qiqCLrExmj8sCvE5JbQwn4amJoUDzWURIzS0zQfKkoQsPDEIu2mlW1m9hnvLR6hBgepVY0EeTL4aNVob3XPO0+2jmw1Avlolw53kAF1CIWDXAJL0IJvIjAdWF4Z01avzhqFidnYIDvjBNcBV8tkwL7l29anRewKCDXnuwGvv2XGWOUvf22vtXXJXV6pBXHz+oUlCZ5mz7aTgauyzRomB5OFLIVN4ayfXPnCyFueoJKkI1r5v0ci1l6C//NjiNPWQIsNSJNgnKysYIZ8mq58gXZWUwkIYfRiAUjcD2xjvYgqEOUAPUDzSOMXRmhHfWFBwTBsySgMKzuqCzGAnAGYcNL+FPRLRuO30bjPQroubbBEUBwDztuAWnT8F6fa3uDQ5Vzx3MMEsT17zaPyYqsR/q8C3o1ic+LrlkkG3y43FKR7ShlXV/TVh1doX3MYTUOyDBUAC5R8qANbJm1BOWijTO5l05GZQPBj6U/fTzExFgRxvzCKJqO1S7jw/kFXTkFTEpQAembwx51wrninyYEENR/SgZ7PBIAMcIehq+DTmlK8QB6gArVZTGvND7UOrDZHDL2PO+WRIIqeu5xN1i3CdhJDHWbBPnEwXheG//r6N/5mDlsdGbsJM1/GUmudwwc+8i6ZIu4hRwwO0yx/VHOcKimvaWqp1sa+0Q5JwJ7ORS/wAHNuQhOYLlT+5sMQ4xnJIpSlQSAgkEBtyXBnzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36756003)(6666004)(40460700003)(2616005)(7696005)(508600001)(47076005)(2906002)(36860700001)(186003)(1076003)(5660300002)(110136005)(54906003)(8936002)(26005)(316002)(82310400004)(426003)(356005)(336012)(81166007)(70586007)(70206006)(8676002)(4326008)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 12:44:28.7012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8936a50e-fd5c-4ff0-3b67-08d9f60110eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3031
Cc: Sunil-kumar.Dommati@amd.com, kernel test robot <lkp@intel.com>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
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

This also fixes error reported by kernel robot:
"error: 'EN_SPKR_GPIO_DW' undeclared here"

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c | 30 +++++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c      | 17 ++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 50a5aa4d6da9..5d276365d644 100644
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
+	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
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

