Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C70F285F5BA
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 11:29:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA355820;
	Thu, 22 Feb 2024 11:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA355820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708597793;
	bh=FKultOKtsTKp2TwITMeCASQHTfP/auhDEPhN5dxj8Ew=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e+x3+2vs2+54Bp7QR0Ou3wtmJ4ZLzlS9Ckqd80g0Cnzv89bfLwlGt9gPzj6vkHQsJ
	 USOt+s5AdumeqzPE3QU5sOWyMRZCMAbZXGIBBLNGiHKVa/h63OVj6PDAXVzMIbIBCu
	 Qb3sY8CC1fNylwkGuxd9gjxHqZ2JH0xXVuJteo5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AD90F8047D; Thu, 22 Feb 2024 11:29:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C3CF804CC;
	Thu, 22 Feb 2024 11:29:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12AEDF804B0; Thu, 22 Feb 2024 11:27:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68890F8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 11:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68890F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RQh0c8Jh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6zy+6ynYw9JyU2CpZcdwzA1RU0kpYBBMto5m1XPFfgiYZF/lz9NQjQeJommD6RP+wiIjT4Qayf3ocwNKp+3kcgwW6aQa5HaF3BBHNztLkxPzza/4H6oDXQHXkggGOiwZo1hY1ZtM1myG5JydW55JQbzzWrmuTGOXFvLyR+S6KMBlVLZmtRwFbYwPKU4TlLO9+DUuu+mf9p76jl4YpnDf6UZxnGNe547ydN5SyIkllBqpaMS11OAstu7egsOHJkULzCtXEFem9raGmnBx7jbVgBk+vriIANRkx1/aXE24opPvf+DDJw2byXu1D6PruhIFrG1wQbUsnG/c4SAhXZZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utQRZSoPuLj8ixvhRGZRozdBRzpUdm7ndmufKj6dyc4=;
 b=PigtasgSaejByFFiDkVTiZH+ETE5ymbQetlKw5090RlZkb1sJr6u4LgUSnKgeeaIsEfU8QdvAI6lGCYe2T9OS0fx2pF5yqLbZCu7gtAg34tlYFTkf4ftX863n0Hgy2Qqn2tA98b5MrCOH3YnYL3J1a65nbx68w3tPejBrt/VRiPV+LdxobO4dLYwXQEJXm5TgkgydVd3D+IeKHyEjFSJ1wjQbh5rbCnMgjFKZ0VaZ5gYo55ERqfRoqQNRVuZAphd3tJLITe+zTVJEMnUl+ivz0DaLpw/2n4YPOEQBKDcRtsUF6uWm99qiqFjJAO9slIjFnhfsan0P2IDj8n2rKNhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utQRZSoPuLj8ixvhRGZRozdBRzpUdm7ndmufKj6dyc4=;
 b=RQh0c8Jhejwri3VkXHpgqVBNm1F5C1s08piYDO41NlYJdLktEAYO/I4Zb7HPlx+lGM11Ajd+pgwSVnSh3p7kTr4nE2czIsyIV0r0sYaZG0OBRcAeLLkTFmwb9/D9uXQx+i3MMh84cK9wPEuWWBK+ZS1saF38qAXM3b0P8v/Y6wk=
Received: from MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::22)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 10:27:02 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::79) by MW4P222CA0017.outlook.office365.com
 (2603:10b6:303:114::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.42 via Frontend
 Transport; Thu, 22 Feb 2024 10:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 10:27:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 04:27:00 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 22 Feb 2024 04:26:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<arnd@arndb.de>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: amd: ps: update license
Date: Thu, 22 Feb 2024 15:56:55 +0530
Message-ID: <20240222102656.631144-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe93a7a-8b79-4de7-ba81-08dc3390cef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G5NeJ6p06hUBFcEf1HQ4xMHM23qT4Tr6CP/NdBvrRrozxFtCJbDSJp6Of+yGTwbjSCqIybxg5xOuzhApWl523iCy5f3rU6Sb2GON8I/3Z3BafMMOGfJVrgaQPOpvsfHXIs1069qwRv3M02A4HtqVkmiRo80tmj7f4/xL/sPSwAYokA7qPOUFAdDTMYXm6NbqTslOF3sbhB4DJ7Miz0TsoqdL7CMOTNVMOj7tGRUNbj6EPkv5wlyHytmTJeFiMa5FutpK76z8o46I8YemgBzCNKAiGPLYvkD4uH6mJ8/IZBIIdhXSwbeLA2gIcEdaTSNZ5K72az42lX2vqFshwUFz9pu2TVH+uq8N0/JKtsE5uA8QiI94q5z3gtq2AyDjIocPFxQXx9DYN/y7xB1psAopFYFzV1DiJ4GytxJAkQZ8ritHEPwqWdqrfdGUJleHKy5U9j3HWwibgyTqRzGQf8TXbYjgeFPRtWcQ4AjLX6xhINzC4+JGLHGxy6AfVDe71nKNAZHw0BmVEh/138/61Ixfv06b243w3mXm+LUlbsPsHdHyHPwS3OAzH3TlI45OagFbkmyQDMUPK53sUpYXTkph7agZxwnidHw7Ftbwp8PQCJIyHPJ2flvTgcHxX6yxflCp/xAIbDOpX19nfYmk5uQkVnIon1T1wDVz7agcAkNXkWU=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 10:27:01.8551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fe93a7a-8b79-4de7-ba81-08dc3390cef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785
Message-ID-Hash: FQG4DP53KHK22ES26IJCB55HZFEQH7ZQ
X-Message-ID-Hash: FQG4DP53KHK22ES26IJCB55HZFEQH7ZQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQG4DP53KHK22ES26IJCB55HZFEQH7ZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To align with AMD SoundWire manager driver license, update license as
GPL-2.0-only for Pink Sardine ACP PCI driver and corresponding child
drivers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/Makefile     | 2 +-
 sound/soc/amd/ps/pci-ps.c     | 2 +-
 sound/soc/amd/ps/ps-mach.c    | 2 +-
 sound/soc/amd/ps/ps-pdm-dma.c | 2 +-
 sound/soc/amd/ps/ps-sdw-dma.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/ps/Makefile b/sound/soc/amd/ps/Makefile
index f2a5eaf2fa4d..b3c254886fd9 100644
--- a/sound/soc/amd/ps/Makefile
+++ b/sound/soc/amd/ps/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0+
+# SPDX-License-Identifier: GPL-2.0-only
 # Pink Sardine platform Support
 snd-pci-ps-objs := pci-ps.o
 snd-ps-pdm-dma-objs := ps-pdm-dma.o
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 205bca95aa06..c72d666d51bd 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * AMD Pink Sardine ACP PCI Driver
  *
diff --git a/sound/soc/amd/ps/ps-mach.c b/sound/soc/amd/ps/ps-mach.c
index 3ffbe4fdafdf..e675b8f569eb 100644
--- a/sound/soc/amd/ps/ps-mach.c
+++ b/sound/soc/amd/ps/ps-mach.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Machine driver for AMD Pink Sardine platform using DMIC
  *
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index d48f7c5af289..7bbacbab1095 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * AMD ALSA SoC Pink Sardine PDM Driver
  *
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 9b59063798f2..66b800962f8c 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * AMD ALSA SoC Pink Sardine SoundWire DMA Driver
  *
-- 
2.34.1

