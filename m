Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A20B983D0E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 08:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5BDB71;
	Tue, 24 Sep 2024 08:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5BDB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727158927;
	bh=loQzfQmJhsQ0pWkbcGsa188ZKhzzVpYxkEQOWXeanRE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h/lrBa/HQLm5n2qkYAEMGPnq/7PUlb9fvpe32En7/mA2g/XaoQUIxyPDtSwKIARD6
	 yvrJBSeJtv/UEQAHx1aY4/64UpnFx0RADXO5j3vkXVuh5zvOdEiIxlKUnvEWSXMrNW
	 TcQTDlCUV8WbPNSaucdfgxNAM83v/4WHUSkhmiGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27131F806F8; Tue, 24 Sep 2024 08:19:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5026BF80716;
	Tue, 24 Sep 2024 08:19:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FFD3F80654; Tue, 24 Sep 2024 08:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC872F80642
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 08:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC872F80642
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ie20jkRH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4mv6/+AFj3wmmVga4B2gDOklPzqnzGqRxmOaHC/4FKbbSNJ72Y4AexrRcRzx7lNj2184s1vU8S2GAl0o8UngLBIl9a7vaMzztuRJHHKHHPYbPlEw8107q1nrdO/9N2s8kZ+7Ln59TkQnZP6tHpslz3D6CKtKb57oPcs8K4lxFtY/9/HO19w/6mHSrsDsxaYjLdSlVBMPJPrwdoARVk5CUQuztXuHgA+oUdaVqQgNrlJAKWt7y7qrwWzgaTmXYOzj7BNmilc5MI9Ph6Pmt9OgnlBXHfdO1aPAHq25rkHSfaPkyuEnYKF7dudFWbRhZtGYcY4tO7/rBFgxLAKd1GR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf4LILkITo6sRTgwpXVGJGnK3u/PXFXhO0mgTbTkqgE=;
 b=yqRqe7Gv+1+rYRCPk21foZbjH+dt1j/HeE0Iz4KdxXRU0mpVCPaZmX2WCCnclcVwMuLNEZvNrzT1s3TkgkSK/ARFhBxI2+WYMzBMQotObSRIHFvlgOqafDWuuvHooA7eoI7wLC3c7WEx8Z9RdnMybm63pdPWtSRj4lIXFA6yuK3446sN/DeS62Y+HPkqU+3/vQH+ot4J0nUZyTKJqcjKtE1G8bOtW8ZXadnx/rc9t6mqCKpctyAphS8HjWF+Z/33093tzjcLTbrPT5FgQlTOwVGxIeHULigNGgnZlivSA5VOEfe3PcC8i9hV4girG1VIu2F+nbl1MyPreFc0BjFDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf4LILkITo6sRTgwpXVGJGnK3u/PXFXhO0mgTbTkqgE=;
 b=ie20jkRHrK/WxsWvNiUMXvlHDLdwbg+5LqWGZtS0h7pr2i71yQ6Tc5Y/dZPw57G/4hTTwXgTZ5ewOZkaU84I8PeTHJNForn5L2rVhAnQJ7QAiITy4S2UtNKINoXwAjcf3TCazXE8ZgtssS4m+MS4ZJzVZIU6uvTbw6U3+JLYQ2s=
Received: from SA9PR13CA0056.namprd13.prod.outlook.com (2603:10b6:806:22::31)
 by MW5PR12MB5597.namprd12.prod.outlook.com (2603:10b6:303:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 06:19:11 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:22:cafe::e2) by SA9PR13CA0056.outlook.office365.com
 (2603:10b6:806:22::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 24 Sep 2024 06:19:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 24 Sep 2024 06:19:10 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 01:19:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 9/9] ASoC: amd: acp: remove unused variable from acp
 platform driver
Date: Tue, 24 Sep 2024 11:48:21 +0530
Message-ID: <20240924061821.1127054-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
References: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|MW5PR12MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: dead6033-bd9f-4ac2-6b91-08dcdc60cde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wakeq3q+lZfy6dpyd1Pg+0618ezgobtFHCk+SR/fFVIHrfXFxSsFeT45mk36?=
 =?us-ascii?Q?76nFkB4PshRsj/kXWOIytJ7da/bm2shRuwkONW7p1q39LhTtC0ssxBq2dEp/?=
 =?us-ascii?Q?E1tb/EZ1i5njDlgoB88GWAEznkkG2PpxSDuuSwSbl9hORMZR4HVsGO3/H8Zq?=
 =?us-ascii?Q?uMnSN9Dmp32MbE+6swq9SJxyiRXOe/dC46OTl4oS0y7FoQ8gwgomoeMR1L9e?=
 =?us-ascii?Q?r1UpWDI3+0Xccpw10w729EYMCr81aulvfe2tGgVRreWYx0flGVJ1NjOiHgXL?=
 =?us-ascii?Q?e9UdlsqD39aBYNcybXPp03aZqDhaom2W2yugmpyAxl6GZppm4hjKs2hqXRV8?=
 =?us-ascii?Q?wgCOzglzwwznGAqKlamCiiDn9pp2BLqiCZw2J6QYwrWADH8Zxc2CfkVDvUZA?=
 =?us-ascii?Q?z6pOrW3qASK3EglDb2vMDwPHD54b3QIBvJtYumEOmvUJQ/apaSk2VTPnDtCo?=
 =?us-ascii?Q?IrX/Mbi60ZcknlZ+swjoj6qDVBRaDr7/vpBXsLa3I2VqGL1bl7ZuDLpfvuDr?=
 =?us-ascii?Q?XdgtVRGyHdi35UNFnAYZz+SJG3GL4QaRD6+7YnIEjCLeJQbjS4fl2LdnqoKx?=
 =?us-ascii?Q?Ce4Alr4u1fzybALGG70F3F1boDpHMH0Aq0IqSR8BNmPgj5bbcTiZa6Pywini?=
 =?us-ascii?Q?t1AD6frl8jLrj540JNlB/wU5EgY/S8biHsmxXW2vVGbW2TePCtse/hx+Q4OM?=
 =?us-ascii?Q?2E/3qZgXsVOHLcwHjIwp51QlSeP4SypPr4bzzAmDrzV+Z5YQCjzDe2yjNaZ+?=
 =?us-ascii?Q?4jR9LVt46de/TIy+ohKYpyEfhZEhOta9TGh9a4wlulT0OF+Wjk138wo/C9Pj?=
 =?us-ascii?Q?2HsDsMoiBmHqlsrtES1V0fLRzKeP4vXBasrfLU+ihFjspE7OUIoLcUGZ56DV?=
 =?us-ascii?Q?ovaDsEsvoJ9kQVhf3QYiJJCVumJ8E9yWOtHT0Mi6p3jDTz+eRO69SdjWTjKs?=
 =?us-ascii?Q?usbK7UsH9CqSobjTjw8FQt9RziCZztvJDrqDwrDVHyJtBQ7XolOCnMaRrljO?=
 =?us-ascii?Q?r9I1g5Nz3+kVh6U8PEEr/w4+Hku/GM+T+ZKZnMBgF9PTJSHp1HQ96LWuOIT2?=
 =?us-ascii?Q?oovSUygOZ01xIv5PmHjURm4vx74zzZrcppydeFC09XGz7y3pYnKqxJmSW+0o?=
 =?us-ascii?Q?bLaQyYEU/OFcD1/t3Hlhxu93AKcFznohY23wywB/KHJ6ug8LpT92UOGogfOS?=
 =?us-ascii?Q?P061yl6xAlcR/FKiIe2ui0Bcri+FnG2tS8LAGOy5/lZx1/KwD63cuAkFphP1?=
 =?us-ascii?Q?FDXpbueNPykc+va8h8ipFGZcO0G8ZeIfjpc+KfZ0G9cQk8LDJW4YEwEU9Pt2?=
 =?us-ascii?Q?6iUb2jhNlYu9MwdQIVuqr0WH1vsCEHcD+y2tQThhWp2bRYyCVJILUbxuof2u?=
 =?us-ascii?Q?GAj1Q5+bAXWwtFsRoXGqXX+P6d2Ot6EPH+W2G0maaQBkEt05CQl4Nafy3zql?=
 =?us-ascii?Q?jdgLZ+hbm6RfDXFhc5BhOqRof/wAlDJ+?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 06:19:10.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dead6033-bd9f-4ac2-6b91-08dcdc60cde5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5597
Message-ID-Hash: BBQKF5JTX6E3PWLMAW6KB67ODHPLBUFY
X-Message-ID-Hash: BBQKF5JTX6E3PWLMAW6KB67ODHPLBUFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBQKF5JTX6E3PWLMAW6KB67ODHPLBUFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove 'platform' variable from acp platform driver private data
structure. For platform differentiation, ACP pci revision id being
used through out the code. As platform variable is no longer used in
code, drop the code corresponding to 'platform' variable.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-mach.h      | 8 --------
 sound/soc/amd/acp/acp-rembrandt.c | 1 -
 sound/soc/amd/acp/acp-renoir.c    | 1 -
 sound/soc/amd/acp/acp63.c         | 1 -
 sound/soc/amd/acp/acp70.c         | 5 -----
 sound/soc/amd/acp/amd.h           | 1 -
 6 files changed, 17 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 414d0175988b..f94c30c20f20 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -53,14 +53,6 @@ enum codec_endpoints {
 	ES83XX,
 };
 
-enum platform_end_point {
-	RENOIR = 0,
-	REMBRANDT,
-	ACP63,
-	ACP70,
-	ACP71,
-};
-
 struct acp_mach_ops {
 	int (*probe)(struct snd_soc_card *card);
 	int (*configure_link)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 065ac13b2220..008d97598b62 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -227,7 +227,6 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp_rmb_dai;
 	adata->num_dai = ARRAY_SIZE(acp_rmb_dai);
 	adata->rsrc = &rsrc;
-	adata->platform = REMBRANDT;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index f372a56a0a17..166f1efacf1d 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -185,7 +185,6 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp_renoir_dai;
 	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
 	adata->rsrc = &rsrc;
-	adata->platform = RENOIR;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index f0c516ccf96b..e0b86132eb95 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -237,7 +237,6 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp63_dai;
 	adata->num_dai = ARRAY_SIZE(acp63_dai);
 	adata->rsrc = &rsrc;
-	adata->platform = ACP63;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index db5dd64969b0..3e4fd113a8a4 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -210,11 +210,6 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->rsrc = &rsrc;
 	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
 	adata->acp_rev = chip->acp_rev;
-	if (chip->acp_rev == ACP70_PCI_ID)
-		adata->platform = ACP70;
-	else
-		adata->platform = ACP71;
-
 	adata->flag = chip->flag;
 	acp_machine_select(adata);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index dcfc29b2f072..ee69dfb10cb8 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -201,7 +201,6 @@ struct acp_dev_data {
 	u32 xfer_tx_resolution[3];
 	u32 xfer_rx_resolution[3];
 	unsigned int flag;
-	unsigned int platform;
 };
 
 enum acp_config {
-- 
2.34.1

