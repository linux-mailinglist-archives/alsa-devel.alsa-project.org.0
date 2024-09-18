Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F254397B7CF
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:18:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37561826;
	Wed, 18 Sep 2024 08:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37561826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640331;
	bh=Da1OBGLaUA9f0KDFOH3FHMzmqo35kmynCr3Ke5aWJyw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tQjaNWQh3QMLlev/d7l0xDiD7dBwVcVCY1vI0PFHqFPsVVLh+yZP642TMa3eoOr8a
	 h+leq2yWkAcHeMZsFjF7PLWtPe3sGdx+C7wh4xhc4Y5tYDqF7OzTN2RAJ8cVXnEhLv
	 ojv7SQGaXNoi9h84vM3Q40GSJQ+7SKA8pK5hqOMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5430FF805AE; Wed, 18 Sep 2024 08:18:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F732F805B1;
	Wed, 18 Sep 2024 08:18:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1107EF8020D; Wed, 18 Sep 2024 08:18:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 030C0F8010B
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030C0F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0lcw3woa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr0UbqpKm7pUejlb9Eb9wWPu2iCopla143Ly2Un9km6CulmEtxmT01i3DR9GD979p2mGgJhaoyrTwUjaGRUanouVObEuB+wHAJe1g8Jl7kzvtWm1gHOD0le2zIrmSBRQjjoq2kXLhrrm2f3bRzf3W34i/5jLka1oB82s1iL3XWmkXhqkF46g5rXPtMvYl0EwNPPoiaB+vGBfeNE4Qedgtsr95YD32tmn/Z4O1aNJNpSxklaYEBhK0sa/ruzN2XdxwvE0hgrgchwlSvzObOq6H+NuSWURQYT7dt3uBRH6xOd2pE4VxgvpuY4B1/Ilx7Bx9D70ffq1di62V9j7vL06RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta3Z0+E/rrZ1PmVeyWqap02k/wP1khFQdaJiv/41Qhw=;
 b=BacOrO/c/Mx1jzsl4UFTSPuUDZg8+JPJHxvSVOnSvv7oGIsV+Riv67OPjKTxU7BRvG8BPo5MZlccQMcKDBf5LfXSERUE26Y08JtOLOBIcEcMOtBPQVPsQBU21LFOGUtk8xPSa77S+qjl9+cCBa3r4Wq+FCIhjr/37/VTveG+vFEvl6MPQjpFWnTQiC/SxyCTbYUAkC1LScL/dsZ7Gd0ocgww4oSZZdDA5Et+Pus6I1pU2NtaEoW5/y2mTSp23PsF99NSw2ALtRLfb9KLfio+62NEUHUI/kuG4eKArE2RVvBI109ghYmNUhhauD87atc359isinw+dvc5O056xTfbEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ta3Z0+E/rrZ1PmVeyWqap02k/wP1khFQdaJiv/41Qhw=;
 b=0lcw3woaVL0GVYsi/n6CZ6lNaniVl3gaiD/Csi8ybLeYfYTuzX4N/btB5eej9nWOYOF8T6Xusa5y7aXqHzRtNDHyMwS3E2m63XsKD8xUx/mNZ+/AW5w0GLt4OwKUcyY3aF462cqbGB1Dsb8L+YZYI+RNDuwms9JSzvH33mRDh1Y=
Received: from SA9PR11CA0026.namprd11.prod.outlook.com (2603:10b6:806:6e::31)
 by CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 06:18:00 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:6e:cafe::5a) by SA9PR11CA0026.outlook.office365.com
 (2603:10b6:806:6e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Wed, 18 Sep 2024 06:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:17:59 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:16:10 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/8] ASoC: amd: acp: refactor acp version differentiation
 logic
Date: Wed, 18 Sep 2024 11:45:32 +0530
Message-ID: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9b4e2e-7852-4c54-4e1c-08dcd7a9a525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5CQWzp4Tz1mhYOJJm4E+kLK8x9deuC0Y4UGwcfvzjxmToxaZcxpxshbCrUal?=
 =?us-ascii?Q?K376oOV8Y01gwu5ymRppmO7Ed2Jq5JK+DhhNU+ZtyegvzTi/GzfQKXEA9Dzp?=
 =?us-ascii?Q?sqi9Ql9/+PFPrqV9UhQ5svk/GgPpMpg0pT6+5Ykwg+MzKJnIobsioRED6CvE?=
 =?us-ascii?Q?pAtybbc/19DGYVfnj2KrIUlzKNcGfDWYDVYTBMfsV/qkAGvwgJS3Z4Iqd+Om?=
 =?us-ascii?Q?vAmwGxI6xQ1BJ4ubAKafNpBKJu5LW9NjjTa3JW2qZ/YAyHreNhkXfNNAw7M5?=
 =?us-ascii?Q?4RxtMbPWo/dJryNPBAFTIe/3g9aVuH39U/Ul8IP0Ri1IL4NSxIRD96LfvPIg?=
 =?us-ascii?Q?rqCDUiQXpPF4ty6mDbhfeQ/b+LC///HPaGVtXFQI9nDtPJrVRAq6xvcvtzdB?=
 =?us-ascii?Q?1N3aLWuZ6XtHE++gTuD06lj8dV8hlKz4xEZCl31PTI3tro7miZUACOh8Su20?=
 =?us-ascii?Q?fbThWGvnkK2nv8eAYgyy9Eg/1qOFp0qRnkc+pBiuDnnI5mEP2pIF2NF+eC92?=
 =?us-ascii?Q?HyvV5kxJhEm6vy/flnTtyVyDY4YiIX+MpHk5FpqbdETcQtP9ETvq8+JD9PAs?=
 =?us-ascii?Q?iiqQXbg2yQE0APZnMYtBQzebTMiuQBYHtKsgyAaBkRHLYJUDudR5dmEzFk0L?=
 =?us-ascii?Q?qdNwTppKaiYSRbCk8IatWWB7j8nGZaCDTsQ/gsPtjzEwjYQboUUpRHocDG7t?=
 =?us-ascii?Q?ESjoBJWFSX+LCljk4zfDX1iTcirvzgsneA/uDLR1FA518XeyTP3Z800b27ZR?=
 =?us-ascii?Q?TP5A6t2tS0NcZ96curNgGc8E3yq7SKZMXDSjasZgexS4SjlYZksNDs8OdMj/?=
 =?us-ascii?Q?6MUwJS8ZgA747pV0gK3/Zp1kHrkU9TKPXQX1aBuL1FYd5NjKSriWbgHGAlKI?=
 =?us-ascii?Q?57dAE7xgoZw5BVb3fSq8ZmvEtke15T/H0+CI6SFFt3TkHwN67koRIP/wrLCl?=
 =?us-ascii?Q?lBtrPAzpve07mowGiIQvuCZROsgowkqzyNbl/V9Xp60BRIidzC3BcRMxv6YY?=
 =?us-ascii?Q?2ghSu83w2fcDbPytNDy77NYdrbFOUBdAxUGWLvGK9CtmUErItxRN4wtHbNkV?=
 =?us-ascii?Q?0nNorYSxOj2DGe+v84oyqk8GduawQxO+FA/KnJ1OpJhuBMv8jjBeT0IDBsAg?=
 =?us-ascii?Q?9xSXg7mqN/eNAAasW2HX0K8n9OQwsODIaJMV+YZnZoMEatd7Ekj0zkf3LTm9?=
 =?us-ascii?Q?Sl6lJvEcoZh4/G5x34HEUkwdcuSa9JQ8IAJUI3ApNxBLZpSOgcItmU5mIqw8?=
 =?us-ascii?Q?N9FmZ8UUmV883fOTJUfBUVecQGrCsND5BSI3nSjyM1LAhXp00TjpmtjkP27q?=
 =?us-ascii?Q?9WdzBmnSKjkNs7aR+1kaf5DBhpBECo8wGvfBdHMyo6GAHGUHWK7MsD2BrH1U?=
 =?us-ascii?Q?PsWwiUgXzkPDL5dTjWi1FGe0oY2q2iSX7cpXjuwhP/iiR/T/5XtTu4Kle2oa?=
 =?us-ascii?Q?KEKjkzQGCmxGUfKQEHsZjThONGPuHfyZ?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:17:59.9116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f9b4e2e-7852-4c54-4e1c-08dcd7a9a525
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132
Message-ID-Hash: E5WMP4D3RWWRR3DAVWMZIAZETKWESRAA
X-Message-ID-Hash: E5WMP4D3RWWRR3DAVWMZIAZETKWESRAA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5WMP4D3RWWRR3DAVWMZIAZETKWESRAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently different logics being used in the code for acp version
differentiation. This patch series refactors the code to use acp pci
revision id for handling acp version specific code.

Vijendar Mukunda (8):
  ASoC: amd: acp: simplify platform conditional checks code
  ASoC: amd: acp: use acp_rev for platform specific conditional checks
  ASoC: amd: acp: use acp pci revision id for platform differntiation
  ASoC: amd: acp: store acp pci rev id in platform driver private
    structure
  ASoC: amd: acp: pass acp pci revision id as platform data
  ASoC: amd: acp: remove unused variable from acp_card_drvdata structure
  ASoC: amd: acp: replace adata->platform conditional check
  ASoC: amd: acp: remove unused variable from acp platform driver

 sound/soc/amd/acp/acp-i2s.c           | 38 +++++++++++++--------------
 sound/soc/amd/acp/acp-legacy-common.c | 24 ++++++++---------
 sound/soc/amd/acp/acp-legacy-mach.c   |  8 +++---
 sound/soc/amd/acp/acp-mach-common.c   | 38 +++++++++++++++++++--------
 sound/soc/amd/acp/acp-mach.h          | 12 +++------
 sound/soc/amd/acp/acp-pci.c           |  7 +----
 sound/soc/amd/acp/acp-pdm.c           |  2 +-
 sound/soc/amd/acp/acp-platform.c      | 14 +++++-----
 sound/soc/amd/acp/acp-rembrandt.c     |  4 +--
 sound/soc/amd/acp/acp-renoir.c        |  4 +--
 sound/soc/amd/acp/acp-sof-mach.c      |  6 ++---
 sound/soc/amd/acp/acp63.c             |  4 +--
 sound/soc/amd/acp/acp70.c             | 14 ++++------
 sound/soc/amd/acp/acp_common.h        | 19 ++++++++++++++
 sound/soc/amd/acp/amd.h               |  9 ++-----
 15 files changed, 108 insertions(+), 95 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp_common.h

-- 
2.34.1

