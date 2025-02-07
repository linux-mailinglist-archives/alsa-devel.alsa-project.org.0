Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C76A2BB8C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:34:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A9460278;
	Fri,  7 Feb 2025 07:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A9460278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910086;
	bh=q75AvJMA/a4qWhO+GeW8YlxVTN+TVqN7BT1S1NmSZDA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HjY8SnI2uDyjbe0Gd6stOUSwM/TYck8JHFlxGDzh5a/WvJrbZkERNCrzbSIew6bRw
	 cfqBCqkAy7AduoFb/7ztFRcj0SO1PWb3Qi5WUddusGLOAP1SCIrDftHSeQQg4wpogm
	 9GnzMx6v0teSRKAaHOm59XvJThDNGKOjmP52BPNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A370F89622; Fri,  7 Feb 2025 07:30:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04892F80CBF;
	Fri,  7 Feb 2025 07:30:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E781F80C8E; Fri,  7 Feb 2025 07:30:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 538FEF80C76
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 538FEF80C76
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kO9zIe9z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INUYn9lvohWM6yJrwTOuDjDrBBiuihi46HtO7a/aIrxsU8GGk2ssCg2WGDwKpoPvM6Q2UyyUu8dDUyDe31VGNUDqDv2mUwZi3VtVsHOQudQUT840mBjlm9TiA5wDgp/NYUWwLc22auw26Hq0DbTdx5uhqdMhQTgLFr2rcWjxOLuyWLP/0oxtAWKV6bRFISCYyxGPwKB5/WWpWpA7zbS5Ht+ZXlhp33/YuFgGyGitbS6wmIoyO47HHixrqiO+IIL+hlGFmhyd8gSqT1fIHZL+ns8tHOKTZFuXDe7OUpfQi5NvARWK/1k6a5up6zQIZ8q91r3tgafkZ0y87wDAyvPbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3kFtQt56Z6fk/Gbv9G5k1gBu7mqVnykSYpygXRGQII=;
 b=mwO3s6jrXllYDzB4XqoWmzdapaMK1079uTqr3q2B7wvfWoQGqlhT+TQ7O0BjL7N/fO27VzzKCJGCwtv9Oar+Us7A+6Jn2B8xXCmIuYPTs/Tmm+uL4EsizcwDNNgrfLjngcrqZGK0DDmGfLr77z/dA5rFGgLoEJDKh4D6LmHu/NGkH+adHqwE0HVVmtDxMDh7ck1XvpLtFy/f9DPJO8S4AAHsaHyt1Q+Mx9obi2Dx0PTlo1EX7s8xFLWfZi9sayuG+FDgVd6dkyZeiGn4pTNN8LkKuAHoUoAtoEpjlL2HaYfJXh305T+lp1K0YTtBQQfaWau33tqP5TS3zj4VwyxnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3kFtQt56Z6fk/Gbv9G5k1gBu7mqVnykSYpygXRGQII=;
 b=kO9zIe9zPhwCwudJNDAn+94Lj9FLPXELxKhjXDgox6303JT+TBbWRz6qo42pcsQwIiHedOHDidueZQiojrQbMc3YHT+yHLwbXz4G4Z080fBSdXBLleeheW1ZFqzyORfmgnjKDqGKnusvznINA+mzMqNwb1sk0UddJw6iNPiSUM4=
Received: from BYAPR07CA0087.namprd07.prod.outlook.com (2603:10b6:a03:12b::28)
 by SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:30:17 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::bf) by BYAPR07CA0087.outlook.office365.com
 (2603:10b6:a03:12b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 06:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:30:16 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:11 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 18/25] ASoC: amd: ps: update module description
Date: Fri, 7 Feb 2025 11:58:12 +0530
Message-ID: <20250207062819.1527184-19-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SJ2PR12MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 2974a25b-81a3-4e65-fd13-08dd4740e316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tFvnQoDHMJibATpyC9EmCKYlTfXoEx3mo/RX9WP5KT7k6NcLu9W8IJeF81ca?=
 =?us-ascii?Q?AQyyH83e8iACI2Km+Kg/p+XO493eBjSbh2ubYlOCkABJq3wwXueoGJLy8CUw?=
 =?us-ascii?Q?lpJ/jhZZyf2+RTGMWXrSFVCv/cZNFwvBYCyWYXYeV/CvST8v9BkJ0ps49hAb?=
 =?us-ascii?Q?Cmh1kM3xVwMSe4SFxebUCrhrnmQocAOUrFwRwKxgbQ+pN40phbQNxX8PfbBP?=
 =?us-ascii?Q?8d2pc3b/sEOSquFm72LVZae7TCOMHJxidKxrjYisEuoeMBKUwtYyE5pO/2iZ?=
 =?us-ascii?Q?FvOy3NS+9BTGnuouWU/6ke//eo3R/uX+FPSeYX2iBJgS5bZ88276GawqUjbO?=
 =?us-ascii?Q?itDBbd+qAlcy+++2cvR/0IV34r/GbUoFyCPcOR3K1VM4lk5BnWlDva7tOh+o?=
 =?us-ascii?Q?e8QeBhnv5hxe+MTONzgums8QK9pnfkWIbHzOo9PCsVSS+eoOc3AFooABy/qH?=
 =?us-ascii?Q?okIM6JDqZb5XIlgUsGMrPr9IJDfSSHGGcNTNjuYwuhFUW/SoElT9D5PMhmkI?=
 =?us-ascii?Q?kIlhkyx08RBqiXekNsmbXlHSu7oOI5QeTJj9/5d0FuEZgo1CIA4culuDcaRk?=
 =?us-ascii?Q?U2/UydBSacQmiSX+8q4b81QAigx7H+BZuMRNEpvXMj9sVxW6FgSURJ9g6VzN?=
 =?us-ascii?Q?e+jWAXknXJfZJHOWoGr6QOJyvdMx8cfwog2CseLsfYcJJXbc5f9natj7xxdj?=
 =?us-ascii?Q?98bIoL/SiPv02jdjYQqGwiIxGw+3jla37YEvxWPaPyYNXPngZR8D4xvYVGlj?=
 =?us-ascii?Q?DLTbtwXkLvbE+vkz8L9awQtMtpXv+3Kz6XvBNTpZx+j6aCBhpYwPzF4RRhvr?=
 =?us-ascii?Q?AflFkenenyckiyZoVwMjxB/13Yz8KVXsiuUYjFeCjpG4WrSOIQfQpAPGHRzW?=
 =?us-ascii?Q?sFsxJGeSq1tmTArbLjsfqu1cMaQ98u6T1Gc+eDLIBTLY9BVoFEdC1CBXKi/b?=
 =?us-ascii?Q?j8CYLvpyMPdWbyd5JotsrHFjUHK86bSawfh1xiyjWVYgt6eotivSUGOn3x6b?=
 =?us-ascii?Q?6o4Zdl0vTZT1Uw/wVYZLHcRaEGH0C4jnKMBK3T3u3mDOZZ/MdLQkznGfvFec?=
 =?us-ascii?Q?PqfAD07Wu3p0Z7BcFfJFz8MaGhWUK/lS4/v3+K3Yt8crDcB5Ii8DyevvYm/8?=
 =?us-ascii?Q?ENNoSJSjfYOy8N9zN5xDYfsKp933jJ2aI8afPpswZeGc1dus3J2Wm8lK3lDf?=
 =?us-ascii?Q?cdn8PnSBG0V+AVhq34Q8mc6NCVQoABQn856sccVJ0Btf/9R/7217p+rFIheu?=
 =?us-ascii?Q?oWApygnDLLQXCXnsmydwJ6zyJeVL4dFkIjp9I6hqlJ4aou4foc1+OKSxiH6J?=
 =?us-ascii?Q?2dTtX1xFFlClRpc+5JyYCr9knAEe3GtKrooE9f8IqujGHMuH80b36gJiH/8+?=
 =?us-ascii?Q?FkbSIPdRtQooBo77JFcw0r1ablr+Z++yH+ElWZPohnZ/6ZlQtSso8sPYHHXx?=
 =?us-ascii?Q?E+UhnZgYFKXv9+UrmqqcDg4V0FeugSLIwiI8rROaAP6w0qWnwl2n0kUN8Byu?=
 =?us-ascii?Q?vhOryXiV8hrppew=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:16.8329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2974a25b-81a3-4e65-fd13-08dd4740e316
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847
Message-ID-Hash: HGKI7C3VVZBQKW2VUDGMJW7MM3PB5MTJ
X-Message-ID-Hash: HGKI7C3VVZBQKW2VUDGMJW7MM3PB5MTJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGKI7C3VVZBQKW2VUDGMJW7MM3PB5MTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update module description for Pink Sardine platform acp pci driver,
SoundWire dma driver and PDM driver modules.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c     | 2 +-
 sound/soc/amd/ps/ps-pdm-dma.c | 2 +-
 sound/soc/amd/ps/ps-sdw-dma.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 6a725cf36345..3a6034e074f5 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -723,7 +723,7 @@ module_pci_driver(ps_acp63_driver);
 
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_AUTHOR("Syed.SabaKareem@amd.com");
-MODULE_DESCRIPTION("AMD ACP Pink Sardine PCI driver");
+MODULE_DESCRIPTION("AMD common ACP PCI driver for ACP6.3, ACP7.0 & ACP7.1 platforms");
 MODULE_IMPORT_NS("SOUNDWIRE_AMD_INIT");
 MODULE_IMPORT_NS("SND_AMD_SOUNDWIRE_ACPI");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 318fc260f293..e726186fe8c6 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -458,6 +458,6 @@ static struct platform_driver acp63_pdm_dma_driver = {
 module_platform_driver(acp63_pdm_dma_driver);
 
 MODULE_AUTHOR("Syed.SabaKareem@amd.com");
-MODULE_DESCRIPTION("AMD PINK SARDINE PDM Driver");
+MODULE_DESCRIPTION("AMD common PDM Driver for ACP6.3, ACP7,0 & ACP7.1 platforms");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 557d312a23b2..2461c6421ae9 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -793,6 +793,6 @@ static struct platform_driver acp63_sdw_dma_driver = {
 module_platform_driver(acp63_sdw_dma_driver);
 
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
-MODULE_DESCRIPTION("AMD ACP6.3 PS SDW DMA Driver");
+MODULE_DESCRIPTION("AMD common SDW DMA Driver for ACP6.3, ACP7.0 & ACP7.1 platforms");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.34.1

