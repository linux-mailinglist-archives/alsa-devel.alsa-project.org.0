Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F119F7433
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:50:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA5C6021A;
	Thu, 19 Dec 2024 06:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA5C6021A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587409;
	bh=RJqrazA4kriZhQpfCmoIYYD1CW1tFqYn+y1qCSSXoKY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZOjycf12uCszfMQjhXVRF996WjRoyx/LhZnf0i+9L2BJpNLwX4sYW+ssUDmpvoLVh
	 BYkaWXWT0UE8M3t9YNSHvBmKzOkTANrvj7E9M/YwdnqHq1EkExuuv68Rq0V8UC5h7i
	 od4E/MEVCIhNjBu79E1NDbg5Bhsl3+Dc1dxP64a8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE667F805B5; Thu, 19 Dec 2024 06:49:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD807F8056F;
	Thu, 19 Dec 2024 06:49:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BE0BF8020D; Thu, 19 Dec 2024 06:49:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C762F800D2
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C762F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rXZN/YGv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cilemU2b5IEe/BbJ753TBcTTUQRRfoIaeOX6WxKhgSBtRjYwXW1cbZDwgbwQVxlwKgRV0s+HrWL2KYklY81xhkMgIySqO+cXiAvCsfqnuelhUInGAW/SaWeujQkADymrpsZnpd2SbOZ0ZicysM49Fnet5TrTSSonMoWUPSbZECHyrby/d9pV3evvesyCNqGaQH6seDzIMfcLbSv1bGJL5GsUIva4iMc+KFY76QwSSe6C+3d+sVLInw43qRH1XGNIlG/dC6xg+Pj2N9zSmzUOjg4e3OIJK1uOMh3eg5cK3XQq9f/wNz/iew7Bl7sd9EcAyWfcVBp48SsSzoxD/TGsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSlXRARvRGLfRdz4M6tngvDNXAhDaoNJ5J4trZ7cdS4=;
 b=U4QI2ZtjRU/PsmTUQmahsBg4c3p49WJLbInBuGqWo7a3FtAdTWtGUQb6+Rf4fXXmFbVrqxqtFNal6dbLhr8hsHADTTryaNy/SM55kmyTnkizGtPYUO+R0mNXvDcdIvPHQnYvrzg+ZryHTBucvF0u11ssPyuVFsmP8F3Cp66HpRBkEP+gn/xLidiPlszf92NHvGlOHalMzJD2o3VhORrilbrdd8+VF/fgrW8d/HASwMmVVNttXPaR+0bHcVN7SJLRciJj4pVHM/DEfsQFqNcuMdl2fCGt7ipkpfCG6QjIgcyVw+BgeZM3U/BYY6uWjljjk/HUSfd4tDSoQvNGsGDTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSlXRARvRGLfRdz4M6tngvDNXAhDaoNJ5J4trZ7cdS4=;
 b=rXZN/YGv30DxfYjc028pd0r8R9hxCDd/YQqi8XQahq9Hqx9WVMWEjeZOFgr62TludcLFpHQSUAUMjxPel6nfN/sneTD4whzQM+JqUMJr9vd1kUBVOTWt+MsTZ0dnbCHLDlitAMz+rN6bplePIB2/kbvd/Jq0NbwxIykhzeeOPyY=
Received: from CH2PR17CA0021.namprd17.prod.outlook.com (2603:10b6:610:53::31)
 by CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 05:49:18 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::7c) by CH2PR17CA0021.outlook.office365.com
 (2603:10b6:610:53::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:49:18 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:49:14 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 00/21] ASoC: amd: acp70: add soundwire and acp pdm support
Date: Thu, 19 Dec 2024 11:18:36 +0530
Message-ID: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa3b375-bdbe-4051-1ed6-08dd1ff0e0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ARjCTatcC/Yb44SnSPKCtmnFlty+kqFGMUBqZ+XFVfWXi4BUquWduxSsJuqv?=
 =?us-ascii?Q?6Vl3WshEYEmFrzAglram5rW6cjb0HRCNRN9ff0bZkWym+tt3k9E3uScKD4n5?=
 =?us-ascii?Q?4ISfnZCyGmVZZnQcbhgm5aevWa0Dj7OKY+FL5MVqNjcEqgQSjhUtzYrMfMIT?=
 =?us-ascii?Q?ZqffOWjr9Ai//Zz6fG14BGm94L+MhEup3U6oCags+9ED3Q61KAuZwoYPsI7e?=
 =?us-ascii?Q?z9SCuGFPbkxaYdw6yhICzb6oBzcJyeGTBKvUfEd82gTdSkYfkRzZTR6ZScuB?=
 =?us-ascii?Q?SFaVXPModFos9Y8aNt6gh1sGmz7oYkRGF7e7rWrZq2ydYZa0+Q5sc9tp+0LS?=
 =?us-ascii?Q?ACe4WBaoHXpGX1oNfAZTmbT3oOW0YqrbFL9mTu+eU8Gz9sieZm+Q+HRArkzw?=
 =?us-ascii?Q?yxdMMbu0t+CG/MqQQMGJxxXu3oX/WL6sWCsU2PKxkeyXV+hZYshskY0T6crb?=
 =?us-ascii?Q?FvnQzHRYV1M0n5dRFlo7Fa8zMmXTBTzVf6A6nzh38BuT1alsSRexBfEy8lDy?=
 =?us-ascii?Q?wNuy9sbpRjoHSZ8F9tZGXT/pTv3rnso+KgkpDX0/Duaa54lAPoIGUrUkRSle?=
 =?us-ascii?Q?tbNKnov7vZoJ2qmOaMBnIvRAlUYU3azbHHtUtKMUG6bamz5H0PaDfofgQBco?=
 =?us-ascii?Q?FJLkd7MDjACiZlqoBlU9Ewe8Z0nHb70hwAYPgyZxZmIAth7c8eVUyc1PlZE7?=
 =?us-ascii?Q?+Zj+7NoraUdAi6fJQloygXLbaG3JDP+SDYqM565IoKHqaHusekF//CoG9NcJ?=
 =?us-ascii?Q?eoAKMmmPb+JqhJu29x1mFPwTH4jUfzQfgIbtnR8EKjroBYSel0oCZfrDUUIu?=
 =?us-ascii?Q?BPFFqi6RZvdvH/YDV6Cbp17r7CFiYp9iClPcT0Bvzowlv7pVA64N6f6mobxB?=
 =?us-ascii?Q?yg3X4AUM93fNhWnSygN93b54KjyiDXLzBqxrG/EO+d9aD50OnPAmcggsRXk9?=
 =?us-ascii?Q?X1z9MUs/1XUvvQcThimDWAtsNcx7jd7GjaH4FTBnJj73tsYBAEAJnj0wvQ11?=
 =?us-ascii?Q?nJNftQR/qcVGAtsL0XBfPwh/UnVMVa1ro9D258719u17t87zjE49R3vOi/pl?=
 =?us-ascii?Q?DeXKA1EaJqH2PoLHnmEgadw6iSmTPj4S4pagmuGa0i9nurQ3q8tct4cX7s7U?=
 =?us-ascii?Q?mfGhFTp3DtPXfHqMQ7f/Y1umYNtNap52b3co3xchxtQqlxLKi/On6sOfLYmp?=
 =?us-ascii?Q?9M6FTzuprMJtdOs2cmG10W2J93A+w7kraLajC/zpoeWj4F2CBNCzhZIsANfM?=
 =?us-ascii?Q?3xguBE0Z8aBO0r7ZM6MWpPX/75cIBhH1IHbP9SMOsLTgHYJBGl2rsSpXphyQ?=
 =?us-ascii?Q?5OVIjTb6VxvamL+IJRgEib4tCSacBHuKXusWIq58JsrIeN2HWXWgFXLqtxIz?=
 =?us-ascii?Q?1/OfkPcW1aHU66Xk+xmr9zg3zbu1drJWJCTPvVja6lr/PSN4emHgyeO0Q6Tv?=
 =?us-ascii?Q?y7XZUGuHBQuUBfVrqTRKAWA5J3Hes12IG60aQOdRUCMliJK+xcPPmpoDA0eI?=
 =?us-ascii?Q?Y3jaIKKYGF9ijXo=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:49:18.0700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eaa3b375-bdbe-4051-1ed6-08dd1ff0e0da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129
Message-ID-Hash: FTBF426VKGTIWJ34XNW4HMX3SDK42R2S
X-Message-ID-Hash: FTBF426VKGTIWJ34XNW4HMX3SDK42R2S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTBF426VKGTIWJ34XNW4HMX3SDK42R2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series includes below changes
	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
	SoundWire IO and ACP PDM controller combination.
	- Add common driver modules for ACP7.0 and ACP7.1 platforms
	(acp pci driver, Soundwire dma driver, pdm platform driver).
	- Add SoundWire generic machine driver changes for legacy stack
	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.

Vijendar Mukunda (21):
  ASoC: amd: add register header file for ACP7.0 platform
  ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
  ASoC: amd: acp70: add acp init and de-init functions
  ASoC: amd: acp70: add logic for scanning acp child devices
  ASoC: amd: acp70: create platform devices for acp child nodes
  ASoC: amd: acp70: enable driver build for ACP7.0 platform
  ASoC: amd: acp70: add acp pdm platform driver
  ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
  ASoC: amd: acp70: add acp soundwire dma driver
  ASoC: amd: update ACP7.0 KConfig option description
  ASoC: amd: acp70: add soundwire dma driver dma ops
  ASoC: amd: acp70: add acp ip interrupt handler
  ASoC: amd: acp70: add acp pdm driver pm ops
  ASoC: amd: acp70: add pm ops support for soundwire dma driver
  ASoC: amd: acp70: add acp driver pm ops support
  ASoC: amd: acp70: enable wake capability for acp pci driver
  ASoC: amd: acp70: add soundwire host wake interrupt handling
  ASoC: amd: acp70: create a device node for soundwire machine driver
  ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1
    platforms
  ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
  ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support

 include/sound/acp70_chip_offset_byte.h   | 484 ++++++++++++++
 sound/soc/amd/Kconfig                    |  12 +
 sound/soc/amd/Makefile                   |   1 +
 sound/soc/amd/acp/Makefile               |   2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c  |  16 +
 sound/soc/amd/acp/acp-sdw-mach-common.c  |  34 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 132 ++++
 sound/soc/amd/acp/soc_amd_sdw_common.h   |  11 +
 sound/soc/amd/acp70/Makefile             |   9 +
 sound/soc/amd/acp70/acp70-pdm-dma.c      | 463 +++++++++++++
 sound/soc/amd/acp70/acp70-sdw-dma.c      | 586 ++++++++++++++++
 sound/soc/amd/acp70/acp70.h              | 283 ++++++++
 sound/soc/amd/acp70/pci-acp70.c          | 807 +++++++++++++++++++++++
 sound/soc/amd/mach-config.h              |   1 +
 14 files changed, 2840 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/acp70_chip_offset_byte.h
 create mode 100644 sound/soc/amd/acp/amd-acp70-acpi-match.c
 create mode 100644 sound/soc/amd/acp70/Makefile
 create mode 100644 sound/soc/amd/acp70/acp70-pdm-dma.c
 create mode 100644 sound/soc/amd/acp70/acp70-sdw-dma.c
 create mode 100644 sound/soc/amd/acp70/acp70.h
 create mode 100644 sound/soc/amd/acp70/pci-acp70.c

-- 
2.34.1

