Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED95B886B3B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Mar 2024 12:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB8AA2232;
	Fri, 22 Mar 2024 12:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB8AA2232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711106575;
	bh=8kQEDYEW9v1tqSrqRvEKCnJox9KK2bCHALbmILJsgDE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I7YlT4qAfTTL/NMVP2sxhnUh4oDmLv6BEqNNMhBJknV0PWwh0zErjr/4b9elQ5t8k
	 jn09DXMhaVZ7awu45Ac8ciHenJy9pSiF5UtdGuX3C/mCvnAXtO8A/7wbeiBZT2Mwl3
	 x2QX+mXSu2sbiI7PioEFMOccDp1M2k52e9tlek6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE60F8057F; Fri, 22 Mar 2024 12:22:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA07F802DB;
	Fri, 22 Mar 2024 12:22:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B2FEF804E7; Fri, 22 Mar 2024 12:20:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38699F80093
	for <alsa-devel@alsa-project.org>; Fri, 22 Mar 2024 12:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38699F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=N0cqkCl+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4sQEGNVt7iat/g0oTwva4qG5wSnA0Myu7rplmauHjy18WKGvb3HVzB3XMzt93YiTLRcmwigCvXh/p2kKc58SbDlse3PwDmDmA2KnIBd/Rj2OeYC/Jx2NmqlfUCO6pVX33ns3GCADALpOtm6lK4T1UXxsN7DNCkYm8n70VW1XzgnAF1JAu/DBGa0ms5hrYmLkZFPJNiLsAPU6PDAyktDMYFyQVyTBQ26VVq1myjHaWt49U1fB9Fb46oCi43pTcPTrMcm4PKjBXh/KcqQu1c3TT6YLBW11bJapPKKPS39NpT+Y3tiUQ/YSSa5bmU0f4cTDtbX30/N4d3NCvOE53ivEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvPmvxP4a/imKBh10t3nC3rSrKRULrn9Gq7KSQ9i+KM=;
 b=iJR7bdt+4e8NdxKBAXGzX1sweiNJOLHliNj95ijF8jTBnhoEjVSfUrwUKd1QbZxWAZp8VhGUnUKLw4SzvR51C5UkSVPvna/pSL9EqlpoqCIpnU9DczcNoPpT/S/ZtsBpXtHnOpnZDXYdb4KLhOxfTqjQOrg7IRMFHmt8czv6jJ+PXSU0AO2qozE3jH5NJk8vvRZavxDn+LYrR7bRbLilpgzIHOSdd3rPGfRk/SOJna0WLaZpxAFdjsahv/dSpU3BKEE8J5o8KZCeKJaH43LMMRWXwYhz2WFBtyqbMtcEsKJ7Nl8qMol/l4uRiZ2EHyiaRpGyYDAMmL99l2++xuge2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvPmvxP4a/imKBh10t3nC3rSrKRULrn9Gq7KSQ9i+KM=;
 b=N0cqkCl+ZiHUCTCBzSNfGIFHiK8AtBkSDRLbU8cXfy64f/Xu3ArOj3Ee3veR7NrFZG9h2ICtYgA886nEKsMFvXz7DXF0lxfLnWqsmqLGq0ssv1uT3HqNA9SYCY4O+QT89C3tS5ho63NNPET3UQeuiF7YFMieo/oGuAzILbQgq4Q=
Received: from CH2PR15CA0012.namprd15.prod.outlook.com (2603:10b6:610:51::22)
 by CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 11:20:29 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::ed) by CH2PR15CA0012.outlook.office365.com
 (2603:10b6:610:51::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Fri, 22 Mar 2024 11:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 22 Mar 2024 11:20:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 06:20:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 04:20:28 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Fri, 22 Mar 2024 06:20:24 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<arnd@arndb.de>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Syed
 Saba Kareem <Syed.SabaKareem@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [RESEND] ASoC: amd: simplify soundwire dependencies for legacy stack
Date: Fri, 22 Mar 2024 16:50:15 +0530
Message-ID: <20240322112018.3063344-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|CY8PR12MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bfb310-327e-4746-09db-08dc4a621474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VHxLfXV0oO2F7m68O2Winyk7AxNpH6fikLHpg9H/clnxdkWqhpdC70roIDDGJbi+ExBZNTFzmHDhstwJWmb2tdColllcciZciBHgylnSHHBs4w0EjSrjKQAEtFiUO+fiur3CFHyTwXGhIkrO263QLEGvjrHthjdObekIHPL1hGG8NL1T54WLvYy/OIR8Q4alhxATK5Qu7yOPR2dnFjxgrgt4g2LbvxRQjF8Y/KjrgoDrDI4ARakGJ+gqNoY4cszfsEGgS4jSU6Hp6pFkSy/Ij1mT0tbuyw7qmPJJyWUq1UKSGnXiUrJilYghXaibXekz/E+XUSekElzzhRwZPgFyroYMj6xaYEkbXOxBoRzW2ZQ5kugy27KIOfx6BhMKSBO4FErY4gWSCj9e8ApJXewjrCY36jQwxJRX52BL7nnyME44YdBkEAjO9uJiyB2xzEgmpsZo8/rTt8YdSFdYJ15zWqhofm4R0tNK6ZYJ3dwlZu0OoXJiE9UqEiAGRXpYBy1pgosVySy7lL3cWIKzQiq4swx34gC2SrT24bBsCOCNNPTHaa5Fi7tBQiEu/ALdRNlSQsb7FdhPaWN4NUMBshycVMD8fDoOZd6LRfnPWQzW2RiznnMq+rVcvO/rHtQ8YrAq1xNHhw2Z2+RkIRukKuwnXBCmuqHGeDmnZGw4PRikS5nG4iqQ0zDVYp69mknhZ9ejB08mWBfCCLk+9O7xFz7Zbx2BEm6fES7pdPZvA5wv9rF9iOd/w/GZzb+UVYroWO5A
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 11:20:28.9542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4bfb310-327e-4746-09db-08dc4a621474
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7195
Message-ID-Hash: AINLJ6G677V3IXMXOI7DHSPIN2XG6CKM
X-Message-ID-Hash: AINLJ6G677V3IXMXOI7DHSPIN2XG6CKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AINLJ6G677V3IXMXOI7DHSPIN2XG6CKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CONFIG_SOUNDWIRE_AMD is a user-visible option, it should be never
selected by another driver.
So replace the extra complexity with a normal Kconfig dependency in
SND_SOC_AMD_SOUNDWIRE.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index fa74635cee08..3508f5a96b75 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -134,15 +134,14 @@ config SND_SOC_AMD_RPL_ACP6x
 
 config SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
 	tristate
-	select SOUNDWIRE_AMD if SND_SOC_AMD_SOUNDWIRE != n
 	select SND_AMD_SOUNDWIRE_ACPI if ACPI
 
 config SND_SOC_AMD_SOUNDWIRE
 	tristate "Support for SoundWire based AMD platforms"
 	default SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
 	depends on SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
-	depends on ACPI && SOUNDWIRE
-	depends on !(SOUNDWIRE=m && SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE=y)
+	depends on ACPI
+	depends on SOUNDWIRE_AMD
 	help
 	  This adds support for SoundWire for AMD platforms.
 	  Say Y if you want to enable SoundWire links with SOF.
-- 
2.34.1

