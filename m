Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E8894C41E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7534D843;
	Thu,  8 Aug 2024 20:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7534D843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723140668;
	bh=ex7B6V0lrijfFWFpq3gHEcX4n9dh9E3WIaSEXvhZuGQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mHQqffUeNP3V7E2ULd52tAQRgemZRTj6lm7St7Uuo+hpKPZOOPEXzKDmiAqMpVbSy
	 9pZ3ckHqo4uV1jEBLwjZr1wUSgl+TNWy8oBMEok72e13BngtKGP59gpX7oU8fsdlEh
	 3zCll2PnNAoZxbNqokLfjrOxOU2bmlkejNweoFZ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DB6AF8058C; Thu,  8 Aug 2024 20:10:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A5F3F805AC;
	Thu,  8 Aug 2024 20:10:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A93F8047C; Thu,  8 Aug 2024 18:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68A2EF800B0;
	Thu,  8 Aug 2024 18:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68A2EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QCd5/ijQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pU5iNuFD6bUJtN912jpJFVIEyx33j2UADGLQHIgPWrdQYDdcJ3hqzj/g0rXOQg1qY76sMwLbRzahsZfWCOlPhG+41xeISbB7uaHn8pheej8ACftE14vk1WaS0qhM5r8mT/kbBHZXlocDccYx5Ik05WcpviVNMUKQIQ7HOb73eZvfEYBUPaGjy086rYFe8rQGDR2A/c/Dpdb5YuS7zq1E9yzXBhf7oec7SzMRB2PahgR+DzFUZzRv6CMslalWVzc5Xqvrc0nvV3SePLlAmTvjQACaDUw/cQqwnIvTDjb2MU4K9hLyRzNfVz8PCjSmidnY/BQeY00mqiNwGcYMGBGZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qg3kiNEPQGX/I2YEZc5TuZUgdQu5BfCY0a/r75ORUM=;
 b=IVF59zlh0NnWh54/ZRSmqDRMoP5QgImzMfqYeruv8ohqcaPgt3fQ4mkgSJvRIswfO2uwChai9zcQFDXqTkT82EPrfvNslVOlHMhtI4hPu4lpKwSRyfkp62pz48jwNFTq9aSttz7lzxVowC3fFdzHGNaWvQwV379Cw+61Hbl0BZN7H9mRe13menhDkBq/3Lrsgnnv5Prupd4XbKBHw5gyQHccQuA83R13eeRAxVymBRZyI9ageupE8n5ZS+CuTk6ScDTB4Z9QCZhzfkb0GX5pMdh/HYl1l4QoIOKkXtKrEc0zcXIRJyzy2HjUXoXdI/0yzgHSZfhBQFKQHPenubvPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qg3kiNEPQGX/I2YEZc5TuZUgdQu5BfCY0a/r75ORUM=;
 b=QCd5/ijQKgA8ZUL0BrfhXTAei3pn4bplSYVsyLmbhqKPJflRwRoiUctWab+9nfZ2yn9XrdoDxELizgtQqBLGhQkFTitF93n1CFm839iIO2lnVE8vUfB/2Z9lWcBB+6wERAyJptKcJrp/G+PO4TgP+w8tVJvDR4ylzWGAMT/dshw=
Received: from BN9PR03CA0186.namprd03.prod.outlook.com (2603:10b6:408:f9::11)
 by PH8PR12MB6793.namprd12.prod.outlook.com (2603:10b6:510:1c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 16:58:12 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::e) by BN9PR03CA0186.outlook.office365.com
 (2603:10b6:408:f9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30 via Frontend
 Transport; Thu, 8 Aug 2024 16:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 16:58:11 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:58:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<pierre-louis.bossart@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<lgirdwood@gmail.com>, <kai.vehmanen@linux.intel.com>,
	<daniel.baluta@nxp.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<cristian.ciocaltea@collabora.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND 0/8] AMD SOF stack fixes and improvements
Date: Thu, 8 Aug 2024 22:27:45 +0530
Message-ID: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|PH8PR12MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4a89c2-3e81-4b14-9a98-08dcb7cb493f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/bngjULU+sLDdgw+X39ORUlHcrJVAlDvj42f4U1lmeJMoWkjfNFLAkW/jYLL?=
 =?us-ascii?Q?UhPiGSryNupTydp4oNu68DvoJdYAeymok5nIzNc5ZiDcP6PikiY9fcNJlNHj?=
 =?us-ascii?Q?HzIGhA6GfN+o+uMSDIbuKdf88xtWOeyFtaDvH69HafICU7zO5XkY6dXH+s1O?=
 =?us-ascii?Q?0Ln3OzoCdvoNc9uMF7H1GqxmFBKGnvTej+6w31ECEDGgdxsS2DUBorrpBSoP?=
 =?us-ascii?Q?KugUjP5rhGsyh8FwI9BLKLsxCFl3lduu61meLJLWcr3ZU0V8RQ937OYMBqgA?=
 =?us-ascii?Q?npD1oHynSVmri22M4E7wEf8BD5mGclB2I17+p9e3TJ56qW+wrCLgGQ6lC8Lu?=
 =?us-ascii?Q?PCA7alFukkYRPEl5DB/Q1KfZyw6nCFHvxw1HMTEmxqqRMKb7Fdb8AMAT2IyE?=
 =?us-ascii?Q?03Zi21Ki4iXFfa7eunc8NVVx7SrG5RGuumVmWLwGzvan5leefQrGqwNe+fhv?=
 =?us-ascii?Q?zLOJBsE6QOH/TxraY2ErqfW5qkzLC+LKwrPMeliZ0vrusS03O7Gr8GhPwZGx?=
 =?us-ascii?Q?FVJbeafXkseN/BxxbktI7+OZoPVc1I6CrkibHEUJsUfrmv2Bz4e5dZjDRbsi?=
 =?us-ascii?Q?HGHMUEdyP096UqLbVjfh42Vg5/cdaC7ipgyB+NjK84xu0ncQxEEMtDZEazGw?=
 =?us-ascii?Q?iZrEMpBXnZzIIVvX3n97BkCo2tFnKdPXH8lHOJ0tRPI4qasMs2ODanG3807W?=
 =?us-ascii?Q?89cfuP6speMsOeEO5LYgPmDOL2DFkJ28n8ywTcT8JtIOAnBnGDh6eRCUHAyr?=
 =?us-ascii?Q?ZtSQpQSzItz4U4mrflgBmnN1CaANyjVZNUyeZmwSIbb8e1Cf07vcnDqbY1kY?=
 =?us-ascii?Q?dPmeDTDyO1QkUpxThpk5WpWEVIjM6dXgU7Y9wBd35SvTppbIGSUbMceP89pQ?=
 =?us-ascii?Q?uPRuoOF6ZKuG9SGY9NKA6Ro/FLxBbyrHGPQjGBgwHSFzJ7+u5FCzwXhzvOyV?=
 =?us-ascii?Q?61kn5beRMq7To2HP3OVl+DWOxHbbEctusYSA4WzMtrUtW3fMm3IXqqP+jJYD?=
 =?us-ascii?Q?zkoWzbkEEyroD2jqLvmd32XvvXYHsze7810BWaPEyKA9Qbgl/PrTWdWVmPhb?=
 =?us-ascii?Q?OG3ERfrGsrrQMPixsQmyZasqzOnpsA9MOw4y+GvGW4W0My8s15A55mYk9bia?=
 =?us-ascii?Q?9DrrfajmSARjg5xFgBbjkr68IUEvzYIFbiP/vrnkrReG3mnGdrv9gUAHoXAg?=
 =?us-ascii?Q?SWDFVBMAG5Uoy1KM9iERh2PYYSyGemU1m+V76XixyCQt/BhdyP9evKmF8mDf?=
 =?us-ascii?Q?6IWKojgz2/ip+1P8UGg50N3rD0niHRWgUbRXp+THLNrmJSdfyJJlipxBUCWc?=
 =?us-ascii?Q?at7FXi95F5Zg23n/zroC80Oao9450Ktnd22bdiSdub5uqnT5eqa34Bh8KhGK?=
 =?us-ascii?Q?P3r9ttElyoHPdk48c+/0x3C5tyMA?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:58:11.4135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f4a89c2-3e81-4b14-9a98-08dcb7cb493f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6793
Message-ID-Hash: WUYIDLZBVJ3MVBTIH7TOCLYKPR6NZF4G
X-Message-ID-Hash: WUYIDLZBVJ3MVBTIH7TOCLYKPR6NZF4G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WUYIDLZBVJ3MVBTIH7TOCLYKPR6NZF4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series consists of few fixes and improvments for AMD SOF
stack.

Link: https://github.com/thesofproject/linux/pull/5103
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Vijendar Mukunda (8):
  ASoC: SOF: amd: Fix for incorrect acp error satus register offset
  ASoC: SOF: amd: fix for acp error reason registers wrong offset
  ASoC: SOF: amd: move iram-dram fence register programming sequence
  ASoC: SOF: amd: fix for acp init sequence
  ASoC: SOF: amd: update conditional check for cache register update
  ASoC: SOF: amd: modify psp send command conditional checks
  ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
  ASoC: amd: acp: Convert comma to semicolon

 sound/soc/amd/acp/acp-sdw-sof-mach.c |  6 +--
 sound/soc/sof/amd/acp-dsp-offset.h   |  6 ++-
 sound/soc/sof/amd/acp-loader.c       |  2 +-
 sound/soc/sof/amd/acp.c              | 59 ++++++++++++++++++----------
 sound/soc/sof/amd/acp.h              | 10 +++--
 sound/soc/sof/amd/pci-acp63.c        |  3 +-
 sound/soc/sof/amd/pci-rmb.c          |  3 +-
 sound/soc/sof/amd/pci-rn.c           |  3 +-
 sound/soc/sof/amd/pci-vangogh.c      |  1 -
 9 files changed, 60 insertions(+), 33 deletions(-)

-- 
2.34.1

