Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C529F7449
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:53:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A166021E;
	Thu, 19 Dec 2024 06:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A166021E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587586;
	bh=CYHX+EwwJM53HLYs4GjJ0KgOGSVimR/OyTNhm50CRGg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MgfInFWfINh22/b2B8auwvD5uxNXG7zy14KPThUIPg69EA2poSK7SsSZCYDbSahxE
	 9Um6JgMtxUS/apAkqc87rPFIe6ILH8LuTq3zANJVsWY/Lo4+TDks/ucqcxV090yAzt
	 k9G69u9duGvlhpnaurahhOTlapAqVbUCWFLKGvYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52A5CF80687; Thu, 19 Dec 2024 06:51:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 259F2F8068F;
	Thu, 19 Dec 2024 06:51:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EF8DF805F3; Thu, 19 Dec 2024 06:51:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E30F805C4
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E30F805C4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5ja9ZE+p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7+n55JwEtjIzQr9zJ6n+Xs/qMj8Q+gk86oO3eFOPAW8KQoNTcSjeUwjPpXUDD4digRiCh9hVi2330eBatHc+qvpcQ6Vc9pw0SL0yoJ/FsDHw9bWSLCE5i+FJkcPtQcVauHZDBrT4a6OK3uzx396+RtamlfZajrE248KhUnboprU7k5kYLgRpaVTUQFNnvfJCVAPnxCe3GW8+7+l8zUFPNWosX3xEB5ojhnfTKEeG4lqyENv7wsg8bhG/18CrDBgfzR6IhXKc4HZP73ak2pTz4r+YKBXZ2iY1OR9IQjZZpOky25kcVPzVHMAne/t5LGKWvHyd1gdx19jFgOnjAWk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8XnQZEWqTGGIli30mMhb2rL4KfNvTgzC+9DvhAG1/I=;
 b=EFTyW2tDOuNpdqFvlQ7woU9Hfa+05pW7lg3K2X6pgJh7bjk0piGkKO8YTqUVYNhl3UuI2R88XzWUjnqe7PcENapGU+SvhuRN/ROnXCg3i3yTrC4hJyw25sllUFBOmKuJ4alzHJwvVqiTjK9F1XxG4tkyjkUE9ASR5q7GISRLtONluVZ66Nty/iI1AIlSvYYa4vKa1N1wGqyXVEX6ObNGc+8l5B8o9QOVqjzA+KUkCu6Zsh6mAkDABx9Ne9vcL513yjLzvS5OWeoHJJAj7Bi8fsoNI94O4iHVOU04fnlcgTqCrKuEZ6YQfeQhUzP9sOfmgDLBUkL53M30p07zRee6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8XnQZEWqTGGIli30mMhb2rL4KfNvTgzC+9DvhAG1/I=;
 b=5ja9ZE+pVgb8owAFTWd1bHK4YOy58qf1bxInDWmU842ONJZ4xnlyth9zlJvUQSTUDubZVLqcnN5j2ErQ6qM3bCdYzCEXycF231KAPn5R4Fwqpif3rnGii6hOtaUMkwaLEyVHoMKTH4hgm5Y0t63URKz4cXUccb3M9+1PCICzEQE=
Received: from CH0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:b0::22)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:51:22 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::2) by CH0PR03CA0017.outlook.office365.com
 (2603:10b6:610:b0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend Transport; Thu,
 19 Dec 2024 05:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:22 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 10/21] ASoC: amd: update ACP7.0 KConfig option description
Date: Thu, 19 Dec 2024 11:18:46 +0530
Message-ID: <20241219054857.2070420-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8f9f89-b2b9-4aad-acb4-08dd1ff12b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KpWtNiW2h8nxWpk+ndQFLu5i7Os9pKDQEw3IdblYwrUPet1mASeKzbYSj2SP?=
 =?us-ascii?Q?GMZ3QrCWalcjFs5/WwYoB294OHzVSXwrNV46baX8dBPdLUxkSoUKuYSYNEB5?=
 =?us-ascii?Q?vg1ajJ72HHIxQh4v9uIt0NXQHwgcm54ho4uMWnX9lkWnxwvYcIG1dXmLgi0T?=
 =?us-ascii?Q?RwGyYXGPS5z0Hf9NUMAmMEdwvKB8NfpKJ+dRo2TdrAmCfvcBypafaoqHiHhw?=
 =?us-ascii?Q?oKZVWeQnUuTsKWkqBJDMfOvuOzPgRqMGAVWC4Xg3kKpj+gY0TLh2x0N2nMgq?=
 =?us-ascii?Q?3pcPBeUCdrBqpYezKE84w91vtPRUYXCeVWKBVUsw5hVZ7ZWTiDWMwHuvQDVi?=
 =?us-ascii?Q?RXkC6Pq7bitBZ0q1+u4jX8615jVSVzSvyDV8fARoWGYkavXSBJKTpZ4DEK25?=
 =?us-ascii?Q?jxHUcIBC7f/CKZEC3XS5J1HwhQ36ELoAhkbMFPPe5MOd6Pnbl1HtqubYx1TN?=
 =?us-ascii?Q?KS4W7JWjDxkbcK+LKTVGE0BAMhrDXHF7cgyBLI5ervcaZYTnMpWtqCFNruYT?=
 =?us-ascii?Q?wa3NX2Y2Lq2yNeGqemmnwGvM299XFsnsiwF8oDGj6qHAOuMAApINoXwOfv2+?=
 =?us-ascii?Q?Y1Cc1dGJd7zQW9PK4fjMZL36GgBwRn4R6h/22Zr9F1ESGT2PvV0zvIqcXDD4?=
 =?us-ascii?Q?FTE7ifFauTth8tMN2NRznUyE4QLe2Vc64xgbV0zUu5DRQWt4sriLl+yyAcKf?=
 =?us-ascii?Q?DEDSNZSfNh/Xxyvu7W38arTrx2EciDXFuiN6BS0sKsp+Ptfnrc74mnwBe/8Q?=
 =?us-ascii?Q?qac8rI7Wm3mgQf38nVvHu8VTSOJewLbs9tj2tCgZyLNCnGB+Ixt4jj6qJZ7Z?=
 =?us-ascii?Q?bjzypyDyyC+7omJG6S+WDesXAvRX0IOBiF9uRw+xuC1ZFB6YOn7zOWYaMYca?=
 =?us-ascii?Q?7mfEHUAMJUpg7AZhC1AIAHj50h5oUcdOzTM/YXquJeLR1d3ZhLPp5Cto6HdE?=
 =?us-ascii?Q?zLXvr6HxV5ntEWIgqGtceUXlfFJIQ5ZZKTzRimPuXPbpWt9mLLohUj/EOMl6?=
 =?us-ascii?Q?7pZrr/VLT1wdCzdexJF6AksHixmCrIb01yQLvkzLYf85kcxkk/vLUHyoZfKa?=
 =?us-ascii?Q?0OYmVlPlg6yN+ESYTBSaicSM581EDFQ7lhHck2BqAr+nQuFkxzv+twwScYwa?=
 =?us-ascii?Q?cbQCcpGAHp4bB7NXBrrTQvcgxg3d/CcEasbP7J14haEmRXyWNAteZ5vSdoHi?=
 =?us-ascii?Q?P+ZNXO+sCXtZ0ur0LBDBldiChkPWX9AP2NJgshooxmCNba4d0tLo5OKmxVfP?=
 =?us-ascii?Q?iQWa0lwCpkZCG93nYVhroKYn10qQWSjTb8rQ3rTucXXtYzwU25VXrLPU1ZXe?=
 =?us-ascii?Q?j2ED5j0IdrvyvZZbN2q0RBjSg4yN2QANhSGqICz3E58lHfiE33apKN3vyGNp?=
 =?us-ascii?Q?gaF//+bVDKMBs/878xei1glZEHNABaSjsn01f49I7UvM0cs3sCuFqTOPTGez?=
 =?us-ascii?Q?UDaBt1eTxrLXfwbhhCAPsDqFIhp+3SbiVSsBA+Bw6AvsPAV0PH9XblnatUWh?=
 =?us-ascii?Q?J7C3mr/PKam+SL0=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:22.6092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b8f9f89-b2b9-4aad-acb4-08dd1ff12b17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841
Message-ID-Hash: PSPCMXLIJUEDWZ2RV54XYXO7QTFIRR2Y
X-Message-ID-Hash: PSPCMXLIJUEDWZ2RV54XYXO7QTFIRR2Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSPCMXLIJUEDWZ2RV54XYXO7QTFIRR2Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update Kconfig option description for "SND_SOC_AMD_ACP70".

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 9d8114909eb5..57743bc4fcea 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -190,7 +190,8 @@ config SND_SOC_AMD_ACP70
 	depends on X86 && PCI && ACPI
 	help
 	  This option enables Audio Coprocessor i.e ACP v7.0 support.
-	  By enabling this flag build will be triggered for ACP PCI driver.
+	  By enabling this flag build will be triggered for ACP PCI driver,
+	  ACP PDM DMA driver, ACP SoundWire DMA driver.
 	  Say m if you have such a device.
 	  If unsure select "N".
 
-- 
2.34.1

