Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6E85476A
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 11:43:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 694B3E69;
	Wed, 14 Feb 2024 11:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 694B3E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707907396;
	bh=7GGyMLEmrKyv1Dfla83PwBrwUZjtTfLvANUynd8clGE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jqOy6WjKbp9NOH9tojmrBNK+NXW5MrwDN7mxFXVfyxDiFmSA08hYV8qGFGhUxrbdB
	 wIy+YVGymXe9mwrBUSptfxiXf0IlNcuMAMwOt5Eg8quIJhe0wdyu5sZLTJOizrp7tR
	 xWqm2DazxGQCBmTNqZA3qqGRnq8bNVYRDWYXNf+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C55C6F805E8; Wed, 14 Feb 2024 11:42:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C362F805F5;
	Wed, 14 Feb 2024 11:42:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD916F80238; Wed, 14 Feb 2024 11:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29A71F8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 11:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A71F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AEaFl/zq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkMLW38ZwfwaU7v0zV1pzZlCp+AAtVPm/psY4ENZdKHga1BRv+EyZeM3tvgbIZpwh8+hclwKTokjrFVa/eR2hMoQFPSJ33O2dL6WqoA5dndtHq7zs8JjR+snj/BYkOO41JplLy/EW4Jcfn2p/kXUdaEUBGGawwI3OsWgG4aF903wMonsWwFqJ2Td67nshjB4YDSzlQ4s3ZYHkARLlt82f9bWQ8DKX/gs3xVXlCx2f8mbi88iTDQhbxhdO1I6Lm53cPe3Iq4QycdDaKmoKHnaf7wGBFLoLpy4qI4tAML2B3GNY0EkiH32CS5HrHMiVdGVAK/ao28cubryYgUFtcKIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap7PtlHEPoDBQ0VbLhy3Dz2qryEYO951wa7bkPP/0P8=;
 b=U9Hg/vJ42wgFqtEmxbIiw5bZEU5gv+Lc5/9Tq+WyfQmBgcg7zRbpUD/w2i0SeJ7iPxXA++qi6MfmAUYS3a/RLrI7pSx4S4LdKKzBC9BdLmtYI9m+LYDvv+4q6QmmnkjuQKwG/ghbYrEJ4zOyx76gUsSR+OBIzNHdyg0brWsPdFj3su6RXvYNlEdkoi30GL5OMayqbUp36F+PWAlKLJBW5WQP9pPDux0sVmCRdmsorfjeIC0HKoWb6FBwOMKlIRAMxGK9fPFQ0m1Kn2FVcC7g9q8G+F4xTzLpSEZVIU1VLRNH8wIJCqLZ9w6WIcI7/L1yqI1WjmwEPgHj0/koykrF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap7PtlHEPoDBQ0VbLhy3Dz2qryEYO951wa7bkPP/0P8=;
 b=AEaFl/zq0r9ben/KpTymQ0MXo1Lg8DsI9o0x5CDg/ghVgEbkKFOpaih9EFXdDyUnNW560XVdNsTNj8bNY8ZUtN/BgX2O0LGisZMKN4j0ABgUrj4iskm1Q0fGA/xM3R4ZLqP7MvyMu67+nFhWWq0LKMBG7O/rqzOSg1nJgKlW+ig=
Received: from DS7PR03CA0268.namprd03.prod.outlook.com (2603:10b6:5:3b3::33)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 10:41:01 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::43) by DS7PR03CA0268.outlook.office365.com
 (2603:10b6:5:3b3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 10:41:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 14 Feb 2024 10:41:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 04:41:00 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 02:40:59 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 14 Feb 2024 04:40:51 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Carlos Bilbao <carlos.bilbao@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] ASoC: amd: ps: remove acp_reset flag
Date: Wed, 14 Feb 2024 16:10:03 +0530
Message-ID: <20240214104014.1144668-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214104014.1144668-1-Vijendar.Mukunda@amd.com>
References: <20240214104014.1144668-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: ff13c1c8-2353-45aa-132e-08dc2d496fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oVGqQlsmL0XR4AuHxN2XEJd+1ZbSBAI2Z0EUa7QkJGoAppic99R7A6/+2NfMc0qd7QoSZtJ71bD/xmum870HFL6gbxkLGKfwp/lDep8c4TXiweiffC2vs0oL6CQM+zmn376k0nhhxPt48wefxXB6inbhv622vrLskK9exdM9Cy0e4zoFwIY704mFg5Kp7tqqebCuOlDxE4t0GtQL6HVp/H5eeLkpZTDdnnFXaXBA0CKHHY6wUj38fJCeygoY//ht/LICbOF/VvFLppFYBEFycqD0zB5QQsBRRFM+XZ0nr3dR/UAsHM4fYJ/GsW3GwlpO+Gj0Ppf7W2YkQ/b9SLHpdr3DPp4/RJRn9TnHuKn2swiiCjKpFDNq33uTO2O5MHgPM1v6jphxh4O2AyTIfJhTijuJl6PM31wH14/qJdGzeAMi5cobF7c0vbHDo7XOU8Dcrr9OUNYsMU18SQAywVb4aziaRvsh3fSqo6qDzMyyvpPg18HjuWYoll40Y4+p4tplsextewsB3gANDPONkUDEGxbFQFJYBOkbeBLVR1YOL/IvETCD6Q6P6xYBcMjnOr4kzqY8JYi6FtV4jQcKa1Wfe/XtDQmGyLO15rs6E47UWDs=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(2906002)(1076003)(2616005)(41300700001)(478600001)(26005)(83380400001)(70206006)(426003)(4326008)(8936002)(6916009)(70586007)(336012)(8676002)(7696005)(5660300002)(36756003)(81166007)(54906003)(316002)(6666004)(356005)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 10:41:01.0923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff13c1c8-2353-45aa-132e-08dc2d496fe8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
Message-ID-Hash: QYNXZIT6FTJJAFK72V2P745UBYQFEGP2
X-Message-ID-Hash: QYNXZIT6FTJJAFK72V2P745UBYQFEGP2
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYNXZIT6FTJJAFK72V2P745UBYQFEGP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The earlier acp_reset flag is set to true in two instances as mentioned
below.
1. When active SoundWire manager instances power mode is set to
Power off mode when SoundWire configuration is selected.
2. For other acp configurations

As code being refactored and common function being used for scanning
SoundWire controller, acp_reset flag update logic is dropped.

Instead of it, check the SoundWire manager instance enable state, based on
it update sdw_en_stat flag which will be used to apply ACP init/de-init
sequence during suspend/resume callbacks based on flag set value when
SoundWire configuration is selected.
For other acp configurations, acp init/de-init will be called by default.

Refactor existing pm ops logic for SoundWire configuration and use
sdw_en_stat flag for invoking acp init/de-init sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h  |  5 ++---
 sound/soc/amd/ps/pci-ps.c | 44 +++++++++++++++++++++++----------------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index b2fd554d50d2..fb4261f7fa4b 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -226,12 +226,11 @@ struct sdw_dma_ring_buf_reg {
  * @is_pdm_dev: flag set to true when ACP PDM controller exists
  * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
  * @is_sdw_config: flag set to true when SDW configuration is selected from BIOS
+ * @sdw_en_stat: flag set to true when any one of the SoundWire manager instance is enabled
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @sdw0-dma_intr_stat: DMA interrupt status array for SoundWire manager-SW0 instance
  * @sdw_dma_intr_stat: DMA interrupt status array for SoundWire manager-SW1 instance
- * @acp_reset: flag set to true when bus reset is applied across all
- * the active SoundWire manager instances
  */
 
 struct acp63_dev_data {
@@ -248,11 +247,11 @@ struct acp63_dev_data {
 	bool is_pdm_dev;
 	bool is_pdm_config;
 	bool is_sdw_config;
+	bool sdw_en_stat;
 	u32 addr;
 	u32 reg_range;
 	u16 sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
 	u16 sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
-	bool acp_reset;
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index b7cb3f98707f..c141397a2cac 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -503,13 +503,6 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	}
 	adata->addr = addr;
 	adata->reg_range = ACP63_REG_END - ACP63_REG_START;
-	/*
-	 * By default acp_reset flag is set to true. i.e acp_deinit() and acp_init()
-	 * will be invoked for all ACP configurations during suspend/resume callbacks.
-	 * This flag should be set to false only when SoundWire manager power mode
-	 * set to ClockStopMode.
-	 */
-	adata->acp_reset = true;
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	mutex_init(&adata->acp_lock);
@@ -552,31 +545,46 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static bool check_acp_sdw_enable_status(struct acp63_dev_data *adata)
+{
+	u32 sdw0_en, sdw1_en;
+
+	sdw0_en = readl(adata->acp63_base + ACP_SW0_EN);
+	sdw1_en = readl(adata->acp63_base + ACP_SW1_EN);
+	return (sdw0_en || sdw1_en);
+}
+
 static int __maybe_unused snd_acp63_suspend(struct device *dev)
 {
 	struct acp63_dev_data *adata;
-	int ret = 0;
+	int ret;
 
 	adata = dev_get_drvdata(dev);
-	if (adata->acp_reset) {
-		ret = acp63_deinit(adata->acp63_base, dev);
-		if (ret)
-			dev_err(dev, "ACP de-init failed\n");
+	if (adata->is_sdw_dev) {
+		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
+		if (adata->sdw_en_stat)
+			return 0;
 	}
+	ret = acp63_deinit(adata->acp63_base, dev);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+
 	return ret;
 }
 
 static int __maybe_unused snd_acp63_resume(struct device *dev)
 {
 	struct acp63_dev_data *adata;
-	int ret = 0;
+	int ret;
 
 	adata = dev_get_drvdata(dev);
-	if (adata->acp_reset) {
-		ret = acp63_init(adata->acp63_base, dev);
-		if (ret)
-			dev_err(dev, "ACP init failed\n");
-	}
+	if (adata->sdw_en_stat)
+		return 0;
+
+	ret = acp63_init(adata->acp63_base, dev);
+	if (ret)
+		dev_err(dev, "ACP init failed\n");
+
 	return ret;
 }
 
-- 
2.34.1

