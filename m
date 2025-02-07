Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3EA2BB70
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:31:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9EF6022F;
	Fri,  7 Feb 2025 07:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9EF6022F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909914;
	bh=bLm2nzMcBRusshRXnixjmcHoTovXmabnCNUfJpvh2/s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F4GaH98BY6kMbF39ZkYzUs7pVMJRyK44mPfipLkFRyrlXjg6xwFYTy0raeWZY0G4U
	 Ra59BT2FbtO67CQfNFdOAcfzMOuTwy0V0pxJSTXTscSh51R6jrly4phSXb0lH05d1k
	 uNZQDPB9ymsFpXmY2jzg9IGZfZ09ha70VZuOyhOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6888F806F1; Fri,  7 Feb 2025 07:29:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F588F806D5;
	Fri,  7 Feb 2025 07:29:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 490B2F806A2; Fri,  7 Feb 2025 07:29:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1E8DF800ED
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E8DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iTmHBC2T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmDQ/eTDta3/+m4Yai0kjCvqgV9P7Wl2m5AiI1aGUTiUwx2S0g2s2gU8XjI5tt7U1XY+HBTDb0WjHDsG5GCWat0uGzTGOWvZrXIjQdrkIAaFLRQSB2YqkccWOaE8D7c3YxoSKwwpzrjUgvAYAQNJLGf3Ms02hDPxirYd40y+MMH6LnhRC20hKw+/297pQuzTxuJjsuIu2ttFdEQHu8D+NnW65agR/dRK3wH9jxBcICed+YSpZL8Eq/sbiuioBsRL1AtNqQ1X/KAMeMndBGZXR6CFaE2G5RfcEOmvW/AZiM7qreN3Nhlf1Ahf3rDNnWcutXYEsk8kkE4muSE5ZQtzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEXai2j6rE+VXmKAlMAmGdR+0AA2qGgBxwJDX6OWCkc=;
 b=mVZSVK1eU3m2ytDlu4YqlNGjNuNnV89CtsPQ8JhwectSqQOc0dYWmu3eKHO/4hYgIXVDA697/5n7+SHEFEP2ol9mRBlXl1HRGFnhdx7/Qupmpuq//24+0ICl3AblLIo/8/secPjA1we09cMdqCY1r7Nvn0TOEATgBI7Bveu6sg0ieQ9Hj4H+WG/Xsb6GFHUCzO1lCDSKXwuKEwTKcBWq2omu9aZZGMeAAg99gU3zrayeBHII1MvFWulUTLF7p8BYVHjktGTXPEo5wPyvtj4rGx7BqqIBp1roEDMFnwZfnw8E02s5OTe9KnhSJ1wkt+w0zORZSzpy2VcIMRjV++6YSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEXai2j6rE+VXmKAlMAmGdR+0AA2qGgBxwJDX6OWCkc=;
 b=iTmHBC2TiARH1coyb69edQOQUoN3lga6L5+vmenUb094tzFdwwc0Emn0Spssx6wnBDecU6XuxMxVpmsJhwrPtYR5h1lS11CwYAVS6YpuA5pmxaBuduYXzijncgszsya9IoMFMOwm9+DNLkuIarq3WReJjC0zyIePVhTwE/PlbKA=
Received: from MN2PR19CA0019.namprd19.prod.outlook.com (2603:10b6:208:178::32)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Fri, 7 Feb
 2025 06:29:09 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::30) by MN2PR19CA0019.outlook.office365.com
 (2603:10b6:208:178::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 06:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:29:09 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 08/25] ASoC: amd: ps: store acp revision id in SoundWire
 dma driver private data
Date: Fri, 7 Feb 2025 11:58:02 +0530
Message-ID: <20250207062819.1527184-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: db9cb580-882a-48e0-2f5a-08dd4740baac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wm5LrFR0djG2dwNXhcJfZlNorLllgg+tIQCalwvBzz0lW1Z/UneRXwKxgnJ8?=
 =?us-ascii?Q?h0pyZp1GUMLQQVzy4Ew7kj2lIBQpH4GDygRoMI0K+qyG2wwGU8xc40tUYo+3?=
 =?us-ascii?Q?AcU4Au/IgLuMwO7BaJZnyrcgTrIRWbbI0E8TU6plr74WyjxgB1RRx0/OF0DS?=
 =?us-ascii?Q?a96IQcX9oKcOyLfim8oGTCOi/Li5MoQ/R+/ObmpyffFrAnWXmDZBDe08T79H?=
 =?us-ascii?Q?RdSL8uaw7l2BalupwmB3ZCw/jlqqgHJvUgr7XOzRb7VnuUwto8Urqhnl5lpp?=
 =?us-ascii?Q?qYGCH0GeIfAqvDKa6LKCKcR83bejP6dGphNN80aR0BQGRRCT083R+8Y/es7J?=
 =?us-ascii?Q?ITtLqpmOo+hkFKAxWfuOzKemUvBAk7TjCyD3Fw9mObqwbzRhb7/L2KjDro0U?=
 =?us-ascii?Q?FtIkcl8cET4IHOUEqE+whDkeq3fdXTlYReIzzofbz/a8X156oTwsQtSdHFc2?=
 =?us-ascii?Q?gk3QTA6bg4EoEEydeaxcBE4C97dghvDtGovnEWeTBEUt7guthvqdtDNaod5/?=
 =?us-ascii?Q?6Nh8vywIOq1XSG/BaTcWdGu3QlOWJpk49azl5u82bn1wwQZi/8LKl5yJ/f0Z?=
 =?us-ascii?Q?y6/V4RjbpMb0LqoThfrt42xbT4yestKJMkvEtaokZ69Pe/1+xh52lo12p49v?=
 =?us-ascii?Q?GcRj1+/SukKhrEcbq42cJjscywt1ZbzVfGv+W5u5/6ukR03jiP5AFJWxJCVD?=
 =?us-ascii?Q?I0pRv9ChTrtLZ+i7uTNsOpPiLD3BZUuZVPEKw0E/htUGzCV0PNLPWNR2uC0q?=
 =?us-ascii?Q?GPX0MIVpO+1W3CnuvU3OZeFUlgtks+OHGNI8oDeGa6wOpGZswSGq9fUfJ3/r?=
 =?us-ascii?Q?4sJRFbdqPUzlnw1rrVQsLS0onV4O4C9t8CFx/IPSfIBrAOVRVLqftANJNUVg?=
 =?us-ascii?Q?OEKB8X7BRz2cnr0/w1JS1T2lPO1nzaNoRx63zCM9yVZlPdrfIjSFHA2ML0Hm?=
 =?us-ascii?Q?O9aqvXSxcJezwBH/mInBbEg0qNYhBXbheke1/9IcbqQwcfAvCWOav7h11iK7?=
 =?us-ascii?Q?ZajECspDOmS3usz7WT9Y0xxxBoNbItwK7qG829xjFqscHQr7TtmuT4YGcgSO?=
 =?us-ascii?Q?r04SoWJMMxDAvgy8DwK5dyyGQBertk50gx0XEiS55O0+05sWCfZ6P5jWhW8S?=
 =?us-ascii?Q?zfVWCSqVzSTaItUy4Poy1j9kLXLCLLTDZfC7r9yHT7ye/x72Qyiz/iMJ4hdw?=
 =?us-ascii?Q?JV9nSqPE4yUHKDyR/31GjBBG9hQ5WFlF1wyQmMjP5+htWWJaXsMVQKCjGTPr?=
 =?us-ascii?Q?F1UX2JpT4QWWXznKERvWjZqiF6PXIVKXFDQjoKBhFvP4czVM/8bH8fbvJnod?=
 =?us-ascii?Q?BSrlRcJRIkPeybuep5xI2QheUT50btPjgMg9wbcyrXawbydQ97F5PvGv7c4E?=
 =?us-ascii?Q?Zb2MbLl+J0s/w5oSH3EOFJP0fcq+KxSSk/rn2dz6nYwOAYyHpu8II2+DOrIQ?=
 =?us-ascii?Q?OE7+bBCfil9pcZ7o01CzOcbQP/hRGVs6U4dj4IWr9K4FBDYaSJRaQFxnjgIg?=
 =?us-ascii?Q?ETMOyw7FPpbKfcA=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:09.1178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db9cb580-882a-48e0-2f5a-08dd4740baac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663
Message-ID-Hash: IP5PXS34GWXTRIOWMFY6UYG2BBU7BCLK
X-Message-ID-Hash: IP5PXS34GWXTRIOWMFY6UYG2BBU7BCLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IP5PXS34GWXTRIOWMFY6UYG2BBU7BCLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store acp pci revision id in SoundWire dma driver private data structure.
It will be used to distinguish platform specific code.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h      | 1 +
 sound/soc/amd/ps/ps-sdw-dma.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 9a20846d30ff..098597d92bf9 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -183,6 +183,7 @@ struct pdm_dev_data {
 struct sdw_dma_dev_data {
 	void __iomem *acp_base;
 	struct mutex *acp_lock; /* used to protect acp common register access */
+	u32 acp_rev;
 	struct snd_pcm_substream *acp63_sdw0_dma_stream[ACP63_SDW0_DMA_MAX_STREAMS];
 	struct snd_pcm_substream *acp63_sdw1_dma_stream[ACP63_SDW1_DMA_MAX_STREAMS];
 };
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 878683619a05..b3c716371d15 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -474,6 +474,7 @@ static int acp63_sdw_platform_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sdw_data->acp_lock = &acp_data->acp_lock;
+	sdw_data->acp_rev = acp_data->acp_rev;
 	dev_set_drvdata(&pdev->dev, sdw_data);
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp63_sdw_component,
-- 
2.34.1

