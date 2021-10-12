Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52016429E8B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 09:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1A1168D;
	Tue, 12 Oct 2021 09:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1A1168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634023482;
	bh=RG8h5mFAurM3G4CmZBe2oclSs9QzordbplrqX3NQgOk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4Z2oJ7fZPwpOh9Uje8IIWjiIT633ceTWxinlwjwZdQ07MRY58LPIRHx7JzLZAkz/
	 6PaW7p1I8J/VuPXCOviK/U13QMeVBA9THQS0YGe8jId9OJfOE+Y2GtvKjsxzSPu7ee
	 kPG4aLQGA5f9sq3DhR62mLfTkCRMOyIdNqbN+IAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C34F804E3;
	Tue, 12 Oct 2021 09:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD11BF804E3; Tue, 12 Oct 2021 09:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBD1EF80245
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 09:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBD1EF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="UnKQD9lz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA0pVWf+u5F+/nIF4WLLjrU3Byx3Z4M/DbZCVyBB9wpjUz58Wykzv53TMAm83JzQuxBsiURKV21aqKpVO+MQBCZnu+rzzleDHeUAbERFwZtuYiWPeQ9IXaxnqhzbxcaQUrw8SsxAWU4JcN0HX5/NCZwZI17T7iVn1RNkmRhj5Pgp1+tfGCT1qCAN62zx4P0/yLR3k870R579IfFXzLuGP4t5N9eyvcqW0aZvRrvw/TDA7ALXkoJnsFde4GmFvTmen2ZBuxsZABF9F/NNOuvZr9qXU774cVloLPj2IbX3NCPWrQF/aGcOnQJmzrkXs/sg2erHK5uyvmNnwyJCI0Pphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+6xXuQ8/j+Xjoadnn4vNO1NCPwsyOR0CzmlDZOGwZ4=;
 b=ERTMZ2eTwmXE1r0nmFM4QvNEF2UQWTOQQAr1AApjc6T47x0bfkuevV12ew35+ZhdUs4TS3GlDRFzgVReqa04yuc+yn2wEn98+mxFEa00qlosf9Cu0aBD0Eurz5jVe3pI2AARNr5U2ZN0pCOsJ3N/8GLATAo98qgmwsThwgThGyeu9PAofIArLS1y+ny/AltFL239U3WDQRWVAtj8KVsVR2d2wxoNDFJVR3oLhPkJhaEFJGAGsp2h9EEIl3p0PirnQ1WUxuAq5zPx5n0FTIZbn065kLBgD6j5bU/KASunuoz4q8KVVSFKNMufcm7m0fs9qfXsIvzLu5YEn83VW/W0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+6xXuQ8/j+Xjoadnn4vNO1NCPwsyOR0CzmlDZOGwZ4=;
 b=UnKQD9lzl4ovhElYE6E2EFwhd9TmibgTuCwMLK9yHYckfDBa8xLXCNUz049CgAX7kRv3bkWVU6H0J68tnU5i8cJwx/09URjHIixS8ZWkwRcReQP9EFid2ZSAA3Ddu0qbs1lZHPxzOUaQchmPgSmgvCx32sA/E3X2ANqiOxwAQL0=
Received: from DM6PR17CA0035.namprd17.prod.outlook.com (2603:10b6:5:1b3::48)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 07:23:17 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::27) by DM6PR17CA0035.outlook.office365.com
 (2603:10b6:5:1b3::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 07:23:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 07:23:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 02:23:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 00:23:15 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 12 Oct 2021 02:23:11 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 7/8] ASoC: amd: acp: Add support for Maxim amplifier codec
Date: Tue, 12 Oct 2021 12:49:38 +0530
Message-ID: <20211012071939.97002-8-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
References: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fcb72a1-72ac-44e8-37bf-08d98d512929
X-MS-TrafficTypeDiagnostic: DM6PR12MB4482:
X-Microsoft-Antispam-PRVS: <DM6PR12MB44820D192ADBE4E502CE24AB82B69@DM6PR12MB4482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTxReIUTcNrPsjbK9td1yakG7YCoLrLWg+dWa/Hc6LuUBsPtWXELVwdBhtEskYdmgmk+zSlvyrvvequW1MSQmuaGzyoQA2sIVdvC//6ZK2H5Fyi42S1Y5B2xSY0IUjnnPFILtfau4wGQKjAMHUGs5bRa0aijG+eTqlvAUrWmcL7OWCYDZWUlA7d8XKWLFb4Pmo4qTbfBgSnhD4ygLiG0LpFtXMdnGWCWUftBL74wgINPIXqLBR8gEZeX0waY6KXjwZp6nQr1wme3iiS2yvoL4GyJufmvN/dPUoTc+faT9tHeq79aspOdkzBwV4PK7iVRetyjFaUWUgJu8QISn1fyMqC1UpvxIBl3M0s92pLox4I81APMTzibLb5EBTr2xDBQYsmt3dpU3eFCF/MPH8SSyJcFgSJzAfBTGiHkDiELxnu7SjnLX36mALlGyk2fn+DjkwEV49TY9fvODiL6Dy7iuhO3WXwGrTFEhB0cjPyhu5R3I2ZXt9mqmC89XgOk+H6qQ8HsyqjTV6W+vl6jPeW08l47W4uTdhoZYAUf7VP+Fg3q85dwYl4X8BzIQEQPxhJeQAdumGYIRwB28I0VhBZrXR/7UeV1RfSjVZXSXxRZvU3+7DfCQp4qL5natOj5IHFthb51WRmylj108yQjdYdY0cmr8Vt79C+ya8n24Wq7XkLXim6xxGwCLuJGHnRr3ZuDl9DLdihRVT6trx4aybCmz3eKfXnpJya2lEjcDekNSYQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(81166007)(36756003)(6666004)(508600001)(54906003)(356005)(4326008)(70206006)(7696005)(70586007)(1076003)(186003)(26005)(8936002)(8676002)(316002)(5660300002)(110136005)(2616005)(2906002)(336012)(36860700001)(82310400003)(426003)(47076005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:23:17.1190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcb72a1-72ac-44e8-37bf-08d98d512929
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
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

In newer chrome boards we have max98360a as an amplifier codec.
Add support for max98360a in generic machine driver and configure
driver data to enable SOF sound card support on newer boards .

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig           |  1 +
 sound/soc/amd/acp/acp-mach-common.c | 37 +++++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h        |  1 +
 sound/soc/amd/acp/acp-sof-mach.c    | 14 +++++++++++
 4 files changed, 53 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index f03af79de592..ef4208c3e7b7 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -32,6 +32,7 @@ config SND_SOC_AMD_MACH_COMMON
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_RT1019
+	select SND_SOC_MAX98357A
 	depends on X86 && PCI && I2C
 	help
 	  This option enables common Machine driver module for ACP.
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 5dda2d92a5aa..b9d77d761cca 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -274,6 +274,31 @@ static const struct snd_soc_ops acp_card_rt1019_ops = {
 	.hw_params = acp_card_rt1019_hw_params,
 };
 
+/* Declare Maxim codec components */
+SND_SOC_DAILINK_DEF(max98360a,
+	DAILINK_COMP_ARRAY(COMP_CODEC("MX98360A:00", "HiFi")));
+
+static const struct snd_soc_dapm_route max98360a_map[] = {
+	{"Spk", NULL, "Speaker"},
+};
+
+static int acp_card_maxim_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+
+	if (drvdata->amp_codec_id != MAX98360A)
+		return -EINVAL;
+
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, max98360a_map,
+				       ARRAY_SIZE(max98360a_map));
+}
+
+static const struct snd_soc_ops acp_card_maxim_ops = {
+	.startup = acp_card_amp_startup,
+	.shutdown = acp_card_shutdown,
+};
+
 /* Declare DMIC codec components */
 SND_SOC_DAILINK_DEF(dmic_codec,
 		DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
@@ -371,6 +396,12 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			card->codec_conf = rt1019_conf;
 			card->num_configs = ARRAY_SIZE(rt1019_conf);
 		}
+		if (drv_data->amp_codec_id == MAX98360A) {
+			links[i].codecs = max98360a;
+			links[i].num_codecs = ARRAY_SIZE(max98360a);
+			links[i].ops = &acp_card_maxim_ops;
+			links[i].init = acp_card_maxim_init;
+		}
 		i++;
 	}
 
@@ -455,6 +486,12 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			card->codec_conf = rt1019_conf;
 			card->num_configs = ARRAY_SIZE(rt1019_conf);
 		}
+		if (drv_data->amp_codec_id == MAX98360A) {
+			links[i].codecs = max98360a;
+			links[i].num_codecs = ARRAY_SIZE(max98360a);
+			links[i].ops = &acp_card_maxim_ops;
+			links[i].init = acp_card_maxim_init;
+		}
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 464fb7eb802d..b6a43d1b9ad4 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -35,6 +35,7 @@ enum codec_endpoints {
 	DUMMY = 0,
 	RT5682,
 	RT1019,
+	MAX98360A,
 };
 
 struct acp_card_drvdata {
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index e143aa24afb3..f7103beedf32 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -29,6 +29,15 @@ static struct acp_card_drvdata sof_rt5682_rt1019_data = {
 	.dmic_codec_id = DMIC,
 };
 
+static struct acp_card_drvdata sof_rt5682_max_data = {
+	.hs_cpu_id = I2S_SP,
+	.amp_cpu_id = I2S_SP,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = RT5682,
+	.amp_codec_id = MAX98360A,
+	.dmic_codec_id = DMIC,
+};
+
 static const struct snd_kcontrol_new acp_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -85,6 +94,10 @@ static const struct platform_device_id board_ids[] = {
 		.name = "rt5682-rt1019",
 		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data
 	},
+	{
+		.name = "rt5682-max",
+		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data
+	},
 	{ }
 };
 static struct platform_driver acp_asoc_audio = {
@@ -100,4 +113,5 @@ module_platform_driver(acp_asoc_audio);
 MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
 MODULE_DESCRIPTION("ACP chrome SOF audio support");
 MODULE_ALIAS("platform:rt5682-rt1019");
+MODULE_ALIAS("platform:rt5682-max");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

