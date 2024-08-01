Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42D294458A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA9C322E;
	Thu,  1 Aug 2024 09:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA9C322E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722497732;
	bh=NbcZv/PCOgFC4EYfmFXjMIR/24nanK+6sZkFQEW+FSc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YMB/jC1eStjqLESOvHegtagmdytyHfQw2MAQnR5Y4YV9lO8twGHliVb4r+XKI3sdP
	 AolcDM+Jb0aveBeCYGIH2Ou2RGXIZ/b/G5xCtNkkCj4hTHU/IZ+/vYj8P1BqE5STPQ
	 +7tKIqr9DAsnxPCqNJBN+iIgsbzzc0D5EaVd/dWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4C60F80448; Thu,  1 Aug 2024 09:35:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA39F805AE;
	Thu,  1 Aug 2024 09:34:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCE20F80579; Thu,  1 Aug 2024 08:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29260F80269
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29260F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tlFuKuDr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESnxoHPSG/aM4Z/03NhLoacs1ZSUnk1u2ypqTHIxFG8ipWPcuuxBwZbnqvNu+jcPmhKbiJL936cwlyIk6mdnfbfHNyAGQr5M7UP423LqP9C4qrGBC5ICN8byN+1ctNTus0B9IB2flLrTOwqOM6e4EFJPRZkfLApAkwFBDk3n9804HD78Bh81VEJSgBeQgTX8eXiuyDyKC+yKdladGAsY320YI7pFUyZDCY5s1MevjVxYDVXxb3P8bgoeTBdMw5MK6qNyo2AliesMvHcd7QSVwjPA5EyT9oAfQVCCRYxy28sinVHryGoD1CIKChj4XsPgSJ+e9tYn0PK2ORyVUlYlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSNiMQV9hlBgzuaph27V7tc4nVx1AOMbX54mfCmkufw=;
 b=Ly8EDtfyHUs7vOZJmd6i3qDjT9xClt4xClEo9wm8VrvouuWG0iaRHleOIiuTiw9lEWqyFFvGqmAJZZVJxmBjgX0sZeMbTDn/vLILRb3FOgLAB+UQpN0mlurs+2IyZ8sgKlsgBtq4fUSUo4l/c5Y5/bE3F5Q9vIU86mSEbEqdnHMYzqDUF8LwveQrUhsiffnQgNwt0FB5PNW0Y7n24oWM4kBuXXxiIhdXQx4ryIHOSBWxur99gMpzvSuR0kDRQkw//8F5/2nIQqZzbP559Z+lq3czOp5WeIZp0xkewFH+BFLVKBKU3JISIMvblDUhwp15fP7wfbA3RrMwKKUbA/a7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSNiMQV9hlBgzuaph27V7tc4nVx1AOMbX54mfCmkufw=;
 b=tlFuKuDrsspcemoPyMzYHFeDKE/5FNX3Nc6vWjW8KoRahvJE7m/RUvtlzUt5f6yzYmnaOC6VZixHNuVabe/7umJT6lFPm1Xb0YWMV2TaTEuhsircLFyqDtHAu/Jw+9xvQNsxcAd4kYvyZZRSxMjH+Bhhnp3wEMkahOPeArp5KaQ=
Received: from MN2PR20CA0028.namprd20.prod.outlook.com (2603:10b6:208:e8::41)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:24:23 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::9e) by MN2PR20CA0028.outlook.office365.com
 (2603:10b6:208:e8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Thu, 1 Aug 2024 06:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:24:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:24:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:24:21 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:24:17 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 00/31] AMD SOF based generic SoundWire machine driver
Date: Thu, 1 Aug 2024 11:53:45 +0530
Message-ID: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ed755f-ace7-4193-9d9a-08dcb1f295d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/ttIdQlWM7lKPxQZbgM3RCFpFrz3AhmTx/W7u74pfhG6V9IyhOFKOqqj9b+i?=
 =?us-ascii?Q?+3EQwPIV5U36ClpwqSJVgaNer311qbWhPZO+NQ594MVqoApyvD+1Rr7AaH4q?=
 =?us-ascii?Q?5eHWdgvrxoygWK8fA0A+AGvvM9XIe+UJ+/yOoIAAmN2UDc3Ovgim5qnWQ5C+?=
 =?us-ascii?Q?3ysLSryLBkX7EIRQ8Vn/Ve8cQZqLXIX9FYcGOwgBExzzNDdBzMBCl07IE4Lf?=
 =?us-ascii?Q?DaRXvaWD/3e4z52ert0ptpqRXkPHu/R4Yxy9Ib4g7QI+ZxZnsgk1Tm+W2+Uw?=
 =?us-ascii?Q?AJp2eyzD2A4Xr9PXBrMW6XOq6LcZfCM9L4dv3QKsPTO0Os2YgQP1TAUOmiUS?=
 =?us-ascii?Q?qy+Tk8aN3iXrTMNgRnp2HzuVQ8aGbbxCvLCD2DFtGFRMpzg/Weas1n8MirOM?=
 =?us-ascii?Q?CCbvJrx2lHubyQyckxwbGLjs8M07Xr4oVt5uffA7Wlk2WOGw+ZMFVFr33Ksc?=
 =?us-ascii?Q?wf1h0g+5c1h7fG+plyqmZRAnCwhLPHtl9roJCnM/b7lgNUWCDC4muaDCYgYm?=
 =?us-ascii?Q?0HpvmkocvjhFTYrx4WGY2uyeF3szeY0wZwRtZgdUQEUcUMh2ZHMRTUZvkJGD?=
 =?us-ascii?Q?1S6DWjXkwGuZvbfLZcDeQq4AFi0jOvO4HYv/N0aquU0eCd11MJeGFIPRylsO?=
 =?us-ascii?Q?vRVV+kttnXnWaqTXgKB45m3AVpZaG1KUKAc5xTFiTLof3qZTqh07Kt+Bdgcj?=
 =?us-ascii?Q?sGSed18K3as6r4Ee12DBgFe/VlCMHztnuJ83j8SJtLiV5Vu4Shn2vceH7RbU?=
 =?us-ascii?Q?h+vHURYBdy4znTY0/5DpC0KZkFTa6qjIeXv6E0dnkGnrkZizWpvRg5q+ettv?=
 =?us-ascii?Q?ahV9bh1JvfhkgiYTS5xHi09I+rhki2Ol3/RySf0n/1dCG+xBXDkigabfp1lp?=
 =?us-ascii?Q?qoPAvAiw7r0yfrNMvg0Nctc3zWhja4tqN07Ngk1HrxUSjV+xaU2x5i7vpkys?=
 =?us-ascii?Q?V74dPublrIdrZhnCgDglF6Wa+yHyHPFtDcy2mllkzWhYySszN3/jeefgAKui?=
 =?us-ascii?Q?cMqX1+t2eM+gNAOxIoan4lTwMucc/QN6jwZzib5Rby5EhVKIat1JqDAZEj5f?=
 =?us-ascii?Q?q4MC7JD70HF2N+EGv1CgVeTiyTVWcrKOQRHiH19TaxtE6ovRKs4MFw09Gb8t?=
 =?us-ascii?Q?HNLNoYgCj6Exj7qo6O8Mb3GybbIwN1KFCx1Oku+BLkms5Lpl84roP6Ls2fgn?=
 =?us-ascii?Q?EKVJaYpBZReRuEmEPW37QymszkKAvXfaBF4/aCWWIkNlk3zgvU9ePpo2afDR?=
 =?us-ascii?Q?7AynCR+EIHN8C+eo+2OxIwVDUFUzQkMQePskriDbEFVJ0njx8lBpwcKCwtb7?=
 =?us-ascii?Q?8I1kir2xdC5oHoVrYKEN9/na1TNCrbuyD0fk4m+QD1ia+X9hhdkGTWMTGtf9?=
 =?us-ascii?Q?2R62xWzwz8VpJsu8FcfZtzCNaw/nL0re1k/n8Udo74dEO1+CPg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:24:23.2862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09ed755f-ace7-4193-9d9a-08dcb1f295d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491
Message-ID-Hash: DLYEDSKN64FWDMUL4UA75SG46WADWYJX
X-Message-ID-Hash: DLYEDSKN64FWDMUL4UA75SG46WADWYJX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLYEDSKN64FWDMUL4UA75SG46WADWYJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series majorly consists of below changes.
- Rename structures, macros and codec helper names used in Intel
SoundWire generic driver to make it generic.
- Move Intel SoundWire driver common structures, macros and codec
helper functions to common placeholder so that it can be used by
other platform machine driver.
- Refactor few SoundWire common codec helper functions.
- AMD SOF based generic SoundWire machine driver for ACP 6.3 variant

Link: https://github.com/thesofproject/linux/pull/5068
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Vijendar Mukunda (31):
  ASoC: intel: rename codec_info and dai_info structures names
  ASoC: intel: rename soundwire common header macros
  ASoC: intel: rename soundwire machine driver soc ops
  ASoC: intel: rename soundwire codec helper functions
  ASoC: intel: rename maxim codec macros
  ASoC: intel: rename ignore_pch_dmic variable name
  ASoC: intel/sdw-utils: move soundwire machine driver soc ops
  ASoC: intel: move soundwire machine driver common structures
  ASoC: intel/sdw_utils: move soundwire machine driver helper functions
  ASoC: intel/sdw_utils: move dmic codec helper function
  ASoC: intel/sdw_utils: move rtk dmic helper functions
  ASoC: intel/sdw_utils: move rt712 sdca helper functions
  ASoC: intel/sdw_utils: move rt722 sdca helper functions
  ASoC: intel: split soundwire machine driver private data
  ASoC: intel/sdw_utils: move rt5682 codec helper function
  ASoC: intel/sdw_utils: move rtk jack common helper functions
  ASoC: intel/sdw_utils: move rt700 and rt711 codec helper functions
  ASoC: intel/sdw_utils: move rtk amp codec helper functions
  ASoC: intel/sdw_utils: move cirrus soundwire codec helper functions
  ASoC: intel/sdw_utils: move maxim codec helper functions
  ASoC: intel/sdw_utils: move dai id common macros
  ASoC: intel/sdw_utils: move soundwire dai type macros
  ASoC: intel/sdw_utils: move soundwire codec_info_list structure
  ASoC: intel/sdw_utils: move machine driver dai link helper functions
  ASoC: sdw_utils: refactor sof_sdw_card_late_probe function
  ASoC: intel/sdw_utils: refactor init_dai_link() and
    init_simple_dai_link()
  ASoC: soc-acpi: add pci revision id field in mach params structure
  ASoC: amd: acp: add soundwire machines for acp6.3 based platform
  ASoC: SOF: amd: add alternate machines for acp6.3 based platform
  ASoC: SOF: amd: update mach params subsystem_rev variable
  ASoC: amd/sdw_utils: add sof based soundwire generic machine driver

 include/sound/soc-acpi.h                      |    2 +
 include/sound/soc_sdw_utils.h                 |  216 ++++
 sound/soc/Kconfig                             |    2 +
 sound/soc/Makefile                            |    1 +
 sound/soc/amd/acp/Kconfig                     |   22 +
 sound/soc/amd/acp/Makefile                    |    4 +
 sound/soc/amd/acp/acp-sdw-sof-mach.c          |  742 +++++++++++
 sound/soc/amd/acp/amd-acp63-acpi-match.c      |   90 ++
 sound/soc/amd/acp/soc_amd_sdw_common.h        |   44 +
 sound/soc/amd/mach-config.h                   |    1 +
 sound/soc/intel/boards/Kconfig                |    1 +
 sound/soc/intel/boards/Makefile               |    9 -
 sound/soc/intel/boards/sof_sdw.c              | 1142 ++---------------
 sound/soc/intel/boards/sof_sdw_common.h       |  166 +--
 sound/soc/intel/boards/sof_sdw_hdmi.c         |   14 +-
 sound/soc/sdw_utils/Kconfig                   |    6 +
 sound/soc/sdw_utils/Makefile                  |   11 +
 .../soc_sdw_bridge_cs35l56.c}                 |   56 +-
 .../soc_sdw_cs42l42.c}                        |   13 +-
 .../soc_sdw_cs42l43.c}                        |   38 +-
 .../soc_sdw_cs_amp.c}                         |   18 +-
 .../soc_sdw_dmic.c}                           |   10 +-
 .../soc_sdw_maxim.c}                          |   56 +-
 .../soc_sdw_rt5682.c}                         |   12 +-
 .../soc_sdw_rt700.c}                          |   12 +-
 .../soc_sdw_rt711.c}                          |   38 +-
 .../soc_sdw_rt712_sdca.c}                     |   10 +-
 .../soc_sdw_rt722_sdca.c}                     |   10 +-
 .../soc_sdw_rt_amp.c}                         |   32 +-
 .../soc_sdw_rt_amp_coeff_tables.h}            |    6 +-
 .../soc_sdw_rt_dmic.c}                        |   11 +-
 .../soc_sdw_rt_sdca_jack_common.c}            |   40 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  990 ++++++++++++++
 sound/soc/sof/amd/Kconfig                     |    1 +
 sound/soc/sof/amd/acp-common.c                |    3 +
 sound/soc/sof/amd/acp.c                       |    1 +
 sound/soc/sof/amd/acp.h                       |    1 +
 sound/soc/sof/amd/pci-acp63.c                 |    1 +
 38 files changed, 2475 insertions(+), 1357 deletions(-)
 create mode 100644 include/sound/soc_sdw_utils.h
 create mode 100644 sound/soc/amd/acp/acp-sdw-sof-mach.c
 create mode 100644 sound/soc/amd/acp/amd-acp63-acpi-match.c
 create mode 100644 sound/soc/amd/acp/soc_amd_sdw_common.h
 create mode 100644 sound/soc/sdw_utils/Kconfig
 create mode 100644 sound/soc/sdw_utils/Makefile
 rename sound/soc/{intel/boards/bridge_cs35l56.c => sdw_utils/soc_sdw_bridge_cs35l56.c} (63%)
 rename sound/soc/{intel/boards/sof_sdw_cs42l42.c => sdw_utils/soc_sdw_cs42l42.c} (82%)
 rename sound/soc/{intel/boards/sof_sdw_cs42l43.c => sdw_utils/soc_sdw_cs42l43.c} (73%)
 rename sound/soc/{intel/boards/sof_sdw_cs_amp.c => sdw_utils/soc_sdw_cs_amp.c} (66%)
 rename sound/soc/{intel/boards/sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c} (71%)
 rename sound/soc/{intel/boards/sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c} (63%)
 rename sound/soc/{intel/boards/sof_sdw_rt5682.c => sdw_utils/soc_sdw_rt5682.c} (82%)
 rename sound/soc/{intel/boards/sof_sdw_rt700.c => sdw_utils/soc_sdw_rt700.c} (81%)
 rename sound/soc/{intel/boards/sof_sdw_rt711.c => sdw_utils/soc_sdw_rt711.c} (70%)
 rename sound/soc/{intel/boards/sof_sdw_rt712_sdca.c => sdw_utils/soc_sdw_rt712_sdca.c} (74%)
 rename sound/soc/{intel/boards/sof_sdw_rt722_sdca.c => sdw_utils/soc_sdw_rt722_sdca.c} (68%)
 rename sound/soc/{intel/boards/sof_sdw_rt_amp.c => sdw_utils/soc_sdw_rt_amp.c} (87%)
 rename sound/soc/{intel/boards/sof_sdw_amp_coeff_tables.h => sdw_utils/soc_sdw_rt_amp_coeff_tables.h} (97%)
 rename sound/soc/{intel/boards/sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c} (70%)
 rename sound/soc/{intel/boards/sof_sdw_rt_sdca_jack_common.c => sdw_utils/soc_sdw_rt_sdca_jack_common.c} (78%)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_utils.c

-- 
2.34.1

