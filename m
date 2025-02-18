Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E709A3926B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2025 06:13:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4FF56034F;
	Tue, 18 Feb 2025 06:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4FF56034F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739855581;
	bh=NQNBrmA08AJnaKeguoVZjoiXNlu6aaRDB2hnkfznkrU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DcTKbEGf4hnbN65IE0fyF6BW36W45IMLlimJCV5hGBp2GnZQWGAqUDrBkc4FDEJKI
	 u8sHIu6AGvOrLkQPtRfB6T2S6N9x9GGyJPmgdbRP5z7DBToYS3b/LbV9fn0q0LESuN
	 wo689NUkD7LV9lOH4nxNzoqXdufeJz0PiZnjSsnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B695F805B2; Tue, 18 Feb 2025 06:12:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 258D7F805BB;
	Tue, 18 Feb 2025 06:12:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9FEFF80518; Tue, 18 Feb 2025 06:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5701CF8025A
	for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2025 06:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5701CF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sr1I313A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FChrDerF6tpwYuQD+DyfWBwjLGnyNcU5RYuyUzf9xgoiOBT2GmiMRhTYD88b3o6sCeYsHLMQUZbQPCc1tDzG3wu89Qb3srZ0myB8VBEvwbUZM6P1FKXP6iqCMxup78Wx+V9Why4QBMgmSYeQ0wCD1cAzzFQaI8fiNe2UwrQ5kS9PU5R+zy8b71AfitwBlfWf/oTSU+q94dTBbRSGgYr/VsScCdCvNPaVxCBvM4KjPkd0gsKtvUpPLKFC3d3fYxkanZu8xF1CUEB3dIdG9/ajMd6m/JgZHu0jzyLR9AzEtuknfb7nqpwhLsBIVBfkprbxjpX9vg0NuMYensweYIzSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znLxHlOrgSpLn3xlANZIe2Ewij6YgDgv5/qcUlvoxNs=;
 b=QuskOn4TDDTiBLRiTnSQDFovFU+GD+thUbM+MASmgfHozzRSIUnrW0Di4WX7GgNhgfU0IHvZBfjcOoOR9xWiM+A71sVVgnt1ponmoYEj8ImUDSlgcVrMhWRByuz2prScr9lM0IQxIUpT6i60Cq8ww3KCscoZmoz8oBnIkfQkDMpcOm84JsliYWRx56eghSuU9SrJO0wR4oZAsZkmAlFiymuf3vg1xRjhMMeCgElwvkywQ0g3+uoHo7R+5Gmf6SnrzP9Zu1VkK11hJr5GZALR2WAYa9c8lZ1rJjTsUEaMXgAMm3QHSWY3l5jO4YHOduuj/sUv8uzE9sKxHlC6zPyvqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znLxHlOrgSpLn3xlANZIe2Ewij6YgDgv5/qcUlvoxNs=;
 b=sr1I313A7RzHQXfBtUiaxaBy/545iC24bn7RdOmS8gK+VAJ+AmT1qsYUKHKEkaHLdfr9x+UxRXdwzn8TWvbobdFtcAJOIfnsLeKrSIEerc1tmIJPY/16IOVpvd5hHH1DW23MTaJNHT5w1bwpEQMqoy1ZyG8Oc4ifRIvle+Cx8F8=
Received: from MN0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::29)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 05:12:00 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:52e:cafe::bb) by MN0P220CA0001.outlook.office365.com
 (2603:10b6:208:52e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Tue,
 18 Feb 2025 05:12:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 05:11:41 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Feb 2025 23:10:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: amd: ps: fix inconsistent indenting warning in
 check_and_handle_sdw_dma_irq()
Date: Tue, 18 Feb 2025 10:40:00 +0530
Message-ID: <20250218051000.254265-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a08bd7b-119a-4d65-3ef5-08dd4fdac5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xXnu02xJ42OHmza5vpAyRJuAnIfx0s0Zv86Yp3PD1Z54gysSo8NObDfD33gA?=
 =?us-ascii?Q?hcx04R9dCQS958cCWoMLkSrEeN4mqPX0H36kh+a+k13QAnhel2Wpbk10Gm7b?=
 =?us-ascii?Q?JpRW3n/3wKW4sYzoCjF4X49WE/PyWcj2ufdpJbywI58Vb84cjZXOFMOS3P+s?=
 =?us-ascii?Q?+VsN/2XgdDpAcZL9SsoOSL2hBHxsmA3E7FIuV5MCQpVf3DCUQjgvqobo1mCm?=
 =?us-ascii?Q?lEQ5yTh/51eOVorqnQfoWbl3PrApFV4V3YuvLYiDuDgKHMP4VfDDKggSPhLV?=
 =?us-ascii?Q?kAWN0HliGiVxc/+JPmsU3sivIRJKRQVw7JCT/6m1Rn7EhiUwtCTvGbraJFvr?=
 =?us-ascii?Q?liTmyj5tCPoj/PcBAJTkcy9+rd3VBgzxdKyU5mHl4kNKAcy42C6Og3oIHWrx?=
 =?us-ascii?Q?uyYpU7AbnTnIPQUsTxMJo4QQkLusptZ/zsW+t5D4P28CLb+DNzO9VESWXpnL?=
 =?us-ascii?Q?G4upm+qpyeE5gi62WwuDAfc0sZC8cA2eVFILbmxKxVxYUzApyau7clLYU6BV?=
 =?us-ascii?Q?Fr5JWE6Oqg8wQnlrbBHsSBw21ky7qpvbLeFB4lStGbWrwmymTg+ZS0ZbOTAj?=
 =?us-ascii?Q?WLd1K8U5ssfbSKNWiKRgYu6ASCTuKkQEr0P4B+pjpjYuBauAYKMXX7GAbCw4?=
 =?us-ascii?Q?ClWdGNs62lqOn1q/kxKg8g7VNzl/uqmf0vhEtdBdVJDChTRz6VpHQ5cI+G2T?=
 =?us-ascii?Q?A9drToSJ+ySXxPvATcaZLSyjONMl1j3xpjCN39VKhiCtUT8AFF5Fa8LxW4eD?=
 =?us-ascii?Q?BtCAJA7g1Y3gUXdIzdfe6zk4lRmZ0tucYcs78ks0IP2E9zRqS1sKuoWabX6U?=
 =?us-ascii?Q?Gul8N+LTW+LY3mhwmaTzf4whLJmMZk/okL8HiOCNYHonB/hemz994SUJ0mqN?=
 =?us-ascii?Q?A007lj64bSmoTZj2vIUlqv726zQEB8/IdITLEkV6M8YlMnFSZlrR5WVq7uNT?=
 =?us-ascii?Q?FMXiYPC21uyKwjuJtx/udf6iIWXZPNpEzUXMArwhYLXgqIY13p5Ma1/8FiZb?=
 =?us-ascii?Q?LrXPHP/DNzWXpofhdxu6Pl4YQL3TTeUW5WxGqoHGFybgQ8W+BHPT0yiIFI05?=
 =?us-ascii?Q?dmNDjcsWpau79gqnIhmbV0RNoC/MuOxDpwqsiP4Tihs5zblgjWBDva5rdYcW?=
 =?us-ascii?Q?gElifiTDXv7rdflbwxgZw0o/+UNQGlyXtwKeRc+/Ybl17CUp+4oxHgMvKteb?=
 =?us-ascii?Q?XsXbdDDcHyfZmjBNTRMNXMADXFkZXM6rPCrnA4wzthBQh7BKB4gkD/1u3Igo?=
 =?us-ascii?Q?aHhGX4mhdYE1rMVVar0r/1n0kUjOec0SJOEFndfrIeJ0uAZsS2kWT96aPw8Y?=
 =?us-ascii?Q?8tTDClWKau4nXklznOrPPTuFcBmpIUkVYhElXHWu8xEMQ/3UWlB1Pl87BtrJ?=
 =?us-ascii?Q?R4AbIODnXCsC1sowvFiq9l4cVSroHjdbT9bA2ARx/WDPnfo48zFJRS12VQIa?=
 =?us-ascii?Q?n2QtjNK7FJt8ZRuqbpvCGqwcc2P7Ex8Ny3xuiYQoYaHwdAvGbqwMiSzoSEfX?=
 =?us-ascii?Q?OgL7odL3sYklssM=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 05:11:41.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a08bd7b-119a-4d65-3ef5-08dd4fdac5f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
Message-ID-Hash: YKK7HY7ZMEWU62PJ6KSOS53FTXH7SE5J
X-Message-ID-Hash: YKK7HY7ZMEWU62PJ6KSOS53FTXH7SE5J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKK7HY7ZMEWU62PJ6KSOS53FTXH7SE5J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix below inconsistent indenting smatch warning.
smatch warnings:
sound/soc/amd/ps/pci-ps.c:68 check_and_handle_sdw_dma_irq() warn: inconsistent indenting

Fixes: 4516be370ced ("ASoC: amd: ps: refactor soundwire dma interrupt handling")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502132134.BlkNw1Iq-lkp@intel.com/
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 2ff8e67c19bd..221c65ff03c9 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -129,7 +129,7 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 		if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
 			writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
 			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		       adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
+			adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
 			sdw_dma_irq_flag = 1;
 		}
 		if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
-- 
2.34.1

