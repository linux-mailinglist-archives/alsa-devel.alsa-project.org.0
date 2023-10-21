Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 501F77D1DB6
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 16:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B62FA4A;
	Sat, 21 Oct 2023 16:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B62FA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697900220;
	bh=eAsNThPHjNWeY7hljaaLWiqK7xGAPMjwoeIYssgEKkM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EsGH87ajHXes1eiy6PgWm4CUnYILcC02zd2CR2SY8hfSXbghvg3OoNoUP0dCw8Rt/
	 F8Gpbhnv4A6vIpLne1Bi1cEkBOP9CuNbz8rVMEFdHpUwDSKMF9lU41CLJEMup9goeC
	 +iyfUg/xtcBw0Fyqary+gz+4SctTAA7Yi6hCcY1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F421F805C3; Sat, 21 Oct 2023 16:54:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83E58F805BD;
	Sat, 21 Oct 2023 16:54:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19EFF8027B; Sat, 21 Oct 2023 16:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20020F80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 16:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20020F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mF+CYNEI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcSYF1ZrH+DA7PT6LDQEnXIaffmKWK5k9jUgSHyHxQRrBKR8axraHICwJY/FqbB8F8XlGTLDkyKgdv6qUgcSBrVbuDE9IHkm+6pRQhJz61XoEWJb7HagwxcDOuIoMI26kzIUTsccIP8p9Y6jCjIXy3WCZBT5HutAzPlSUC6vpedqE5DRL3jXevuKR6V3pt5DJWU8vnCGxY07z6IEfOODEsgo78KyM6ZZ+DzDatpyqmr8U7SwtXevXWyfhzPMKWrUfHZYlcLYNgSieXS033dmG2EjDydp6Jop1bIPLA3sqi7Sw9pzhVJEo8Sli9N5k7zxXCOonBd79r4IRtV2bFZtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCfG35GUU9rE7pOjCv/q44Xh+EfGOT7Kukj6QeTuhCQ=;
 b=MSQZVG+3jOlvfhUT4UsbYdSg5jCAYzwuJyMTlF3P9jUZfKynh4+xeKZORQDLvfkYK0lf3eJ9dcruAKS8zVPeKFxqgJ+FntHPO9G8U1WpY4SnczVs+iD4QqIqp9s1sL/rUItwMUrE28FXTT9KZq1qlZobvpJxnWRJkwrk9D56I13Aw/XcowA962k8RHIRyTv0RgseYOcMVDJHBANbDNPSt0374fsfBCvNcrgex+MjwFv9kOlOT6VnTzYwbmqF5/P/NQSwtxXRKtXpPTF/W9Egavgo/sgrQ8LETEDZ2mcWbJs4OrVIuu84qXv8/dmmRasvISGVLR3nMFKtMXDeUCSb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCfG35GUU9rE7pOjCv/q44Xh+EfGOT7Kukj6QeTuhCQ=;
 b=mF+CYNEI2s7TD3yBNaES6lOEpb8WzkY1ApqaJRY1t+dKsjsKYbqofp9fNKgA+8MI4TsFggGdJqEAdJa3EYIHS1vUyB0l/KhqNAFoIyn42lmNVbM3Zr5DF13jeK3IaLfi6Jq5Rhld7LXiK+4sBxk/DL/rMQ2AdCPKPnS9EdMO+Sg=
Received: from CH2PR08CA0003.namprd08.prod.outlook.com (2603:10b6:610:5a::13)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 14:52:31 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::b8) by CH2PR08CA0003.outlook.office365.com
 (2603:10b6:610:5a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29 via Frontend
 Transport; Sat, 21 Oct 2023 14:52:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.21 via Frontend Transport; Sat, 21 Oct 2023 14:52:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:52:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:52:30 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sat, 21 Oct 2023 09:52:25 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <arungopal.kondaveeti@amd.com>,
	<mastan.katragadda@amd.com>, <juan.martinez@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Yang Li <yang.lee@linux.alibaba.com>, Dan
 Carpenter <dan.carpenter@linaro.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 08/13] ASoC: amd: acp: add condition check for i2s clock
 generation
Date: Sat, 21 Oct 2023 20:20:49 +0530
Message-ID: <20231021145110.478744-8-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a61db00-820a-401c-7498-08dbd2455a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BaCvimpujZ496Hclyw7s/yfRYHEIYKw4m+N88pa5qicIkhYF5f/yRuQ97wBJVt/oaUsGnZehu8sMDug/l4vft19txBEPvOBttah5Qia9YU9dnlje4a3nZfgcPJn9PDxPvCsXu+fHnjWI8DxSH9Ra08bqToHRLDKNuus4GwCU1k7winnPZNAjhS4YU5SaXGj7+BSzADXMjhROJ3Dm7MmIPsd51j3/WoZKTgrSQ6AWIO36YxIdQdFcRV6EJSeYRnX2+F2rNRqNqjtbgPqiF0dPn+dynBZZtRI4eiN8aWcus0N5/TXc0d8INn6R935TYS2HOvQDcFXqV4Uo4859su2LA1lxg4ys7tUkjvEQVtKphtfeLDC57iWahjbgY2kqKOE69G9U4jfhtQPrVWkMOe60oBF8ykbhtLD4ZMEEaLvXVuzvegC3tIDDezRPUg3OHjzxCcJLrJWagnETcsWPB728thG1Nz9Swzs7ZLOPIdtDPLT0IlM3k8wmDx+/Sl3YSibFpE1BTDekl52nOUgkrd1xkir/4SZ5BovoCe6vXYgdCB6ErNHJxymwiUOJMkV9q5bvp8vAQ2j1SHWIrsM1Ni0RzF31w4xz+Moplp/91BPMHqS2d/NSMs0ccwiM39hPBjZ6rD1OirTGq7fq9XxtMGHlYrsOJfFo/G4PACDYqT0gspcLGW4yCoughigdPKgaDEgeYdjDZb8JwZXGclu50LFk1SczMWMJb1YCraDKWMqttUAQ0vLHX65x6EGf4IIX9NhTw9mXRzLLtH7gbctCDUJ0Yg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799009)(40470700004)(46966006)(36840700001)(40480700001)(36756003)(40460700003)(316002)(110136005)(70206006)(54906003)(70586007)(86362001)(356005)(81166007)(82740400003)(36860700001)(83380400001)(2616005)(26005)(426003)(1076003)(336012)(7696005)(6666004)(2906002)(478600001)(41300700001)(5660300002)(8936002)(47076005)(4326008)(8676002)(7416002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 14:52:31.2074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a61db00-820a-401c-7498-08dbd2455a50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
Message-ID-Hash: 2PZIGD2462QS73NOLPB64G5TOY7LS67G
X-Message-ID-Hash: 2PZIGD2462QS73NOLPB64G5TOY7LS67G
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PZIGD2462QS73NOLPB64G5TOY7LS67G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

for only PDM endpoint i2s master clock is not required.
Add a condition check for the same based on chip flag value.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-rembrandt.c | 12 ++++++++++--
 sound/soc/amd/acp/acp63.c         | 12 ++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index ef5fe6438efd..158f819f8da4 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -191,6 +191,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	struct acp_chip_info *chip;
 	struct acp_dev_data *adata;
 	struct resource *res;
+	u32 ret;
 
 	chip = dev_get_platdata(&pdev->dev);
 	if (!chip || !chip->base) {
@@ -234,7 +235,12 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	acp_machine_select(adata);
 
 	dev_set_drvdata(dev, adata);
-	acp6x_master_clock_generate(dev);
+
+	if (chip->flag != FLAG_AMD_LEGACY_ONLY_DMIC) {
+		ret = acp6x_master_clock_generate(dev);
+		if (ret)
+			return ret;
+	}
 	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
@@ -263,7 +269,9 @@ static int __maybe_unused rmb_pcm_resume(struct device *dev)
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	acp6x_master_clock_generate(dev);
+	if (adata->flag != FLAG_AMD_LEGACY_ONLY_DMIC)
+		acp6x_master_clock_generate(dev);
+
 	spin_lock(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
 		substream = stream->substream;
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 0cec6ecaadfa..b871a216a6af 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -244,10 +244,12 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	adata->machines = snd_soc_acpi_amd_acp63_acp_machines;
 	acp_machine_select(adata);
 	dev_set_drvdata(dev, adata);
-	ret = acp63_i2s_master_clock_generate(adata);
-	if (ret)
-		return ret;
 
+	if (chip->flag != FLAG_AMD_LEGACY_ONLY_DMIC) {
+		ret = acp63_i2s_master_clock_generate(adata);
+		if (ret)
+			return ret;
+	}
 	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
@@ -276,7 +278,9 @@ static int __maybe_unused acp63_pcm_resume(struct device *dev)
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	acp63_i2s_master_clock_generate(adata);
+	if (adata->flag != FLAG_AMD_LEGACY_ONLY_DMIC)
+		acp63_i2s_master_clock_generate(adata);
+
 	spin_lock(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
 		if (stream) {
-- 
2.25.1

