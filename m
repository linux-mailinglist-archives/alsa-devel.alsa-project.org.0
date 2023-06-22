Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847D73A4E6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 17:27:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A91D844;
	Thu, 22 Jun 2023 17:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A91D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687447672;
	bh=+R4XmTrFwaSPZwH3n9c9o3zSDnKfAzvl/fm1st5WNQg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QxJ0nO/fQbdXQBMXlQCmubSESKoIIyIUk9o4rgzD0gvZF97u4eUXG70PcL+B2gyRP
	 076S063R+KbVkUdUtyJmrSzUdnu++CEOEGt5V/5YlGcnh7IoR64fb3/xYvu3+xa/gO
	 /Abw/x31cqrDLFqI6HOHL1icFmhD2ETiZEwPKmyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 748FBF805BA; Thu, 22 Jun 2023 17:26:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B807F80557;
	Thu, 22 Jun 2023 17:26:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73421F8057E; Thu, 22 Jun 2023 17:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39C1EF80563
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 17:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C1EF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PaQwTS/F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+VChYyt+gpDe5bBboFM+KtTz/Ye4jGvEEI02j+CV3D7TefjqjL5aeDTJd6V7syTSzQB0BtbZmSwtEmSJ5XPTsIl24T32oZ9inHnJS6jXeN9tCZueYIpY914uKyChiXUxI/SxhYnXW6cPHGIBGGYHvHCFSU1gYweJyZAzuDYviu3x5cuYeEK+jq23kpb1udbDVUrdTR2nDte8t9NwZTqNFi/RwuUmV0I/YRTObXUj97LHTdv7w3UFf2nfrCNc9lA1zDCO9bzqPGPpnfF+AN4GbLN50JlalUN9hjXtDa2m3Gvi7cAkQPncmxz8bUSctsKeDwrfxrG6rv8JQjS/vKGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyb4oUKPqZp6YQRg2tTH63rwDvDI64BEIOp/IMCkntM=;
 b=aXDwDyNL3If/AlWn1TbJV/u4A5BBNvkOUV0I15IAzdPvZPCpqxdIarL8TlP1YtPMuw7Ijzv0xy+CVqd79vLaWeUqW6Khv/O3TZHmeNko7flPLvdd3nLSI3pjNPdwvbEoWc9DNiB49fuaGK3o5/faL2hi2oR0EHzyTlAyaqnRnEEv0vVUNphbfvPPPKdHLgXIyRfj7kSP3qocxkn8tUnF51ntWyzwnrUxt7xN5GVXtUn4bqwThUD8CXNSftW41Agj/p00c1BsfZloi0yd8NX0M4y79aWlzwckq5HqcE1iB5+rH8PBPVJ5uYsJ+k0FG5qv53ZUBFg+mLvoZNCUOIRRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyb4oUKPqZp6YQRg2tTH63rwDvDI64BEIOp/IMCkntM=;
 b=PaQwTS/FKjj4kXXVYIyjqNi4PwSSYtJYewhljMqpu9sOMpCiDI0WLKWGP5PPkJPv77+jC+gBPUYpOeSwGZePU+QkehirC+JvwUWh9/dtWmCrQ3niB07hHXkOVAQhr5qjOzwYl/B00T7/mjSKIiJRaHuRitcXDjgz7fLVIiYK2MU=
Received: from SA1PR02CA0014.namprd02.prod.outlook.com (2603:10b6:806:2cf::21)
 by LV3PR12MB9096.namprd12.prod.outlook.com (2603:10b6:408:198::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 15:25:59 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::e8) by SA1PR02CA0014.outlook.office365.com
 (2603:10b6:806:2cf::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 15:25:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.19 via Frontend Transport; Thu, 22 Jun 2023 15:25:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 10:25:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 10:25:58 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 22 Jun 2023 10:25:54 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, V Sujith Kumar Reddy
	<vsujithkumar.reddy@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Venkata
 Prasad Potturu <venkataprasad.potturu@amd.com>, Ajit Kumar Pandey
	<AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/12] ASoC: amd: acp: remove the redundant acp enable/disable
 interrupts functions
Date: Thu, 22 Jun 2023 20:53:46 +0530
Message-ID: <20230622152406.3709231-9-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230622152406.3709231-1-Syed.SabaKareem@amd.com>
References: <20230622152406.3709231-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|LV3PR12MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd7b68c-101e-4943-4da0-08db7334faf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HsU5gIQfByngOmQivmzUFV65gKD0yUGXysXWNR1UrKtHzY1c8MCo3Ch6A3b7jlqNVCx06QqNV1iOZc+KNfoxRkoFQUZ1D+G43DEYMV5ILAcmHlMXkV8p35SXq5VjdzYdYzPt9peofm0bBBhqz3neu51jvg1gpKt8Z0E0kudmObKLErzOrVNBR5P4SMd4ZfAZG03F3RIKTz7Xq1KGoW3no10P/cifXSA54tYviR/GPjIPiZrkbyOgfIfkOQKMDApIqcBhqgEH2z+BhLmtrt6JARGx41ylKD0oSCyGGm79yD1zcLXc9p2kSbNP9lV9l+FRGvFpnCv7i2AEBxlExFdwLKX2513eG0En9YVMZE3ZsS+HN4dF+4qKtYZqZ2Sh09J8hLf0WHeHFkfkdjJchllDOyIPeDX1ZU9VQ3ouRK+oAGdcVSasAGwTdcRp06bhBwp1krIuKPOrGVhPMsNtUKblwK8KUOF9LKZHj3E4J3ibb/oMg912x4Vg2qs86MfxFGxRtS5h+k+rUJL9ZopmYlnqlp/S7ePpIPcNwdGOKiPLoDRFwcDFgtanyr3ucu55E+n98yBKK4UnTg5GwDGhO2DizxMLIxEeza/aN8/dzmsabOOR+fESES9KyzcI4npRXgYk/Dxmg1HUBn3DlhPVNjvUbR7SyzRuB/W+LdOPnRn9uUEVYYf+H2ScHaPorv4eDs0Bqdkg9tlbn3zzfnE77ja3IT82iU+3ZOx8uDf0ZR7Y3MWL2jbPWudBvGWG7vONJ8z0PWJH97gbC7LZZX9ovVqS2w==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(70586007)(82310400005)(7696005)(8936002)(8676002)(41300700001)(316002)(356005)(70206006)(36756003)(2906002)(81166007)(82740400003)(83380400001)(26005)(6666004)(336012)(426003)(110136005)(54906003)(478600001)(4326008)(86362001)(40460700003)(47076005)(5660300002)(40480700001)(2616005)(186003)(36860700001)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:25:58.8174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebd7b68c-101e-4943-4da0-08db7334faf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9096
Message-ID-Hash: PZKF3ATJ3HRXXBIXMIOAQ7Y5ZFHUMUPT
X-Message-ID-Hash: PZKF3ATJ3HRXXBIXMIOAQ7Y5ZFHUMUPT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZKF3ATJ3HRXXBIXMIOAQ7Y5ZFHUMUPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of having individual acp enable/disable interrupts functions for
each platform, implement common place holder to handle the same for all
AMD platforms.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 21 +++++++++++++++++++++
 sound/soc/amd/acp/acp-rembrandt.c     | 24 ++----------------------
 sound/soc/amd/acp/acp-renoir.c        | 23 ++---------------------
 sound/soc/amd/acp/amd.h               |  2 ++
 4 files changed, 27 insertions(+), 43 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 4302d8db88a4..45a45d002915 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -16,6 +16,27 @@
 #include <linux/pci.h>
 #include <linux/export.h>
 
+void acp_enable_interrupts(struct acp_dev_data *adata)
+{
+	struct acp_resource *rsrc = adata->rsrc;
+	u32 ext_intr_ctrl;
+
+	writel(0x01, ACP_EXTERNAL_INTR_ENB(adata));
+	ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	ext_intr_ctrl |= ACP_ERROR_MASK;
+	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+}
+EXPORT_SYMBOL_NS_GPL(acp_enable_interrupts, SND_SOC_ACP_COMMON);
+
+void acp_disable_interrupts(struct acp_dev_data *adata)
+{
+	struct acp_resource *rsrc = adata->rsrc;
+
+	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
+	writel(0x00, ACP_EXTERNAL_INTR_ENB(adata));
+}
+EXPORT_SYMBOL_NS_GPL(acp_disable_interrupts, SND_SOC_ACP_COMMON);
+
 static int acp_power_on(struct acp_chip_info *chip)
 {
 	u32 val, acp_pgfsm_stat_reg, acp_pgfsm_ctrl_reg;
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 83515ee753f3..bc8e1de45170 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -185,26 +185,6 @@ int acp6x_master_clock_generate(struct device *dev)
 	return 0;
 }
 
-static void acp6x_enable_interrupts(struct acp_dev_data *adata)
-{
-	struct acp_resource *rsrc = adata->rsrc;
-	u32 ext_intr_ctrl;
-
-	writel(0x01, ACP_EXTERNAL_INTR_ENB(adata));
-	ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
-	ext_intr_ctrl |= ACP_ERROR_MASK;
-	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
-}
-
-static void acp6x_disable_interrupts(struct acp_dev_data *adata)
-{
-	struct acp_resource *rsrc = adata->rsrc;
-
-	writel(ACP_EXT_INTR_STAT_CLEAR_MASK,
-	       ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-	writel(0x00, ACP_EXTERNAL_INTR_ENB(adata));
-}
-
 static int rembrandt_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -254,7 +234,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, adata);
 	acp6x_master_clock_generate(dev);
-	acp6x_enable_interrupts(adata);
+	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
 
 	return 0;
@@ -265,7 +245,7 @@ static void rembrandt_audio_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
 
-	acp6x_disable_interrupts(adata);
+	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 }
 
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index a73fd70171c1..1899658ab25d 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -140,25 +140,6 @@ static struct snd_soc_dai_driver acp_renoir_dai[] = {
 },
 };
 
-static void acp3x_enable_interrupts(struct acp_dev_data *adata)
-{
-	struct acp_resource *rsrc = adata->rsrc;
-	u32 ext_intr_ctrl;
-
-	writel(0x01, ACP_EXTERNAL_INTR_ENB(adata));
-	ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
-	ext_intr_ctrl |= ACP_ERROR_MASK;
-	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
-}
-
-static void acp3x_disable_interrupts(struct acp_dev_data *adata)
-{
-	struct acp_resource *rsrc = adata->rsrc;
-
-	writel(ACP_EXT_INTR_STAT_CLEAR_MASK,
-	       ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-	writel(0x00, ACP_EXTERNAL_INTR_ENB(adata));
-}
 
 static int renoir_audio_probe(struct platform_device *pdev)
 {
@@ -207,7 +188,7 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	acp_machine_select(adata);
 
 	dev_set_drvdata(dev, adata);
-	acp3x_enable_interrupts(adata);
+	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
 
 	return 0;
@@ -218,7 +199,7 @@ static void renoir_audio_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
 
-	acp3x_disable_interrupts(adata);
+	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 }
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 96bd87290eee..0d8c0febbbfc 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -192,6 +192,8 @@ int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data);
 
 int acp_init(struct acp_chip_info *chip);
 int acp_deinit(void __iomem *base);
+void acp_enable_interrupts(struct acp_dev_data *adata);
+void acp_disable_interrupts(struct acp_dev_data *adata);
 /* Machine configuration */
 int snd_amd_acp_find_config(struct pci_dev *pci);
 
-- 
2.25.1

