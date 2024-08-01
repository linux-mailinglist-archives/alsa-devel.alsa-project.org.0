Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C89447CF
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:16:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA98B3956;
	Thu,  1 Aug 2024 11:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA98B3956
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503756;
	bh=cctBst5WQtaOA5JUEHLkAivMeQsyiT6XqwpHOMVGXG4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XIikhiMfZicJOX5AB/cKqYQnt8n3ho1SJtn0XgDNWMhzClR4sknL9kwdUPi+FmlLy
	 0wB1HvEqzVG41JWrasR83qLxiLvnusvxMyyTkExTgvdVyfvfTanATH1sJdmLbz9ZcM
	 jVKmJqTGlBbHprlS08w+1HueK8Kbhp/28xwjaNDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6767CF8058C; Thu,  1 Aug 2024 11:15:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C080F805B6;
	Thu,  1 Aug 2024 11:15:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C442F80589; Thu,  1 Aug 2024 11:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EF83F80269
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF83F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=udSYwyI5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auakybDfsl6O0giC1d0LNXZi7/ZqEIiVg/ZsjxF/3O5Ww5kDjYSNyq+nheQ4v45CtpNQi0712DYz8qLhlTtl4jA698n+GkMnyFhA6xHVeMaHvyo5mN1SLUpvQQ/xkvAJGgvS55XxDXq7mwyXbq4kOaRr9Zkc/lWrJTfQ7Aht+D+TKjbEzX5zepf90u8QuvahJryvmqxjQot5C8OGQnk/CocR9ncJvgueFokrH3wFqAxbDnC7Y5CrwxYfzVu6SwYZaNL7OH+TXfyc2X9rVjY7O+012JUPU/kmLlJAOiKElgeVBQJxTRu8O298aX7GtsWUQkC70+LyA/q/HbF+YXBbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QrcztA9oVpBtTLxpPo2f/GqXPy1RPpKta7cMTaBVUU=;
 b=HubpwWvDCpup/BQDsc//rlNGe1TnDjI6gL/FGy/yXubyxLMwcgNJRahb/3ZKj7hDo+SaN6NFa0flQswdRz5w/RxtuL3iI7y6DJj7/bro8VJqpUe8FrsJwEA+REzJ9VmmNagSLQt56FtZ9LjbrW3DgfefbWCXePIfuKRzeL/ppCget3zSbso3ShqW6xU809IQSsYAjhlsA/pUXa/UcIZqaeF36+LrYoNKncujpSLZ/KcgZnwzvNDk0rgC34hYVHRMP2OTRq31HjorRyB18098VMNBsgTi3GMUdburUnlYaB2FYXiWhzPW3BpHj6eyozVGyT+BZkUkw7aIwEhAiCPdaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QrcztA9oVpBtTLxpPo2f/GqXPy1RPpKta7cMTaBVUU=;
 b=udSYwyI5kBxcIPMEWCcRv6R47na0/lbeBcWIvZtOE98cD+3lDitTNID3NWTiFcr/ceSPwV1XDYUDfbd1QyA4kG9oV3Y8GEBS0Mby/AWmXttQEDchpdLJTf3mkm9tnP24qwfvfPxP6Cbvf6ApBa865NDwQt0+n819Ou+NeOWzVno=
Received: from CH3P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::23)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 09:15:00 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::1a) by CH3P220CA0001.outlook.office365.com
 (2603:10b6:610:1e8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Thu, 1 Aug 2024 09:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:14:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:14:58 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:14:56 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND 00/31] AMD SOF based generic SoundWire machine driver
Date: Thu, 1 Aug 2024 14:44:15 +0530
Message-ID: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: f15a1b59-16ee-4104-cc59-08dcb20a6b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?amgzhfCwOZZD6GHjOJH6hLUodojp8tVKJ6fyNh2TkGaDHMt/o3hMbg97w61x?=
 =?us-ascii?Q?ogZaTM3WK3UUxgYaUl6Qhueo4YI1C9cDvmsMPRE7EXDVh9o0+4YlPfIYSENG?=
 =?us-ascii?Q?5euicBACyk7aO/3NP6QJAe6WDwVMb6ofDaylYVU3BgUGdsz9oOgFBi/2PQco?=
 =?us-ascii?Q?E/Q3ZjOpOevfG9QBq3dn+rBUw3pTjSB7GNuJmePdBKFajaosIb6/5wWSki25?=
 =?us-ascii?Q?C28dU0XlEOZmap9x/4AgM4SUg1/b8ueFy6/XnO1KEP3YJDWVnPUeE8arDsGP?=
 =?us-ascii?Q?sXbSDRfRr43bdZyh55dbmT+kfRTNmn5gMP6EBrhxQ5QyYhkY5Fxtu/IcyTxp?=
 =?us-ascii?Q?hGyKr/hVKebQ+lNBTMw4uwUAMDyTtzei99Fwqe1y8u1HDfnMc4H61B4JvcFX?=
 =?us-ascii?Q?bT3pqX7bZALPRHiQzing7ogHpQ1ueUFRNNZoiCftfY4Jd6f+tEzfbB2mcFhr?=
 =?us-ascii?Q?U69I2YkgLw7ltKU+NmXlICRoG5NV0ldeeLb+tEdrapmBBeHChJwhGGmnF6o+?=
 =?us-ascii?Q?8TjOyVwG5254+QdB5k6dKfx2VGqQupyeAwOyxk45jgiVgHLcZ1W/LPBMWLSd?=
 =?us-ascii?Q?0nEzv/hRFmlQkE5Yk8A2K5W9xvfu8gwWPD/A3laAJC+Hvjd9b8SNSJqH47SN?=
 =?us-ascii?Q?KO1zx4QPXLAw2kLIlymcIz8B4GIQjMZTckqpiyK8/gcaEPPlH2Sbqj9YHWFg?=
 =?us-ascii?Q?Zc2mi+3ys95eBDsncxyoM86E6qrcoLNs89poKh+wvNCOOCxGzLgQsGVLZxkX?=
 =?us-ascii?Q?gGkoURgCWi/086lCB40Y6Dk1lmcEoqB9l3eKpLoeOiv71WEE36vhWLQWhcs3?=
 =?us-ascii?Q?R5CL6rUAZAA7zBPLAY7d7gRQBBiYasbzc4q00ahP+GHRkiCJKaPLJ2U/XfnM?=
 =?us-ascii?Q?4aCiuNAY/421wpyM+k+OZUp/Qfda2ahzb6VNZJmt4iKyEWqPtQBodBDkAlZt?=
 =?us-ascii?Q?LPZr5MkjgT/gPiLFZcvWFlW2ArTJ7eWEPzjOejsmeeASAgXrb06cc9Vbo1Cj?=
 =?us-ascii?Q?5C/+XBEyMRxD79N+XnHPA+idzSXU40iHX4FehyqzLOoFZEbys8hPza/o4u8V?=
 =?us-ascii?Q?cmFmoBglpiyt7sMH1Vxp0Mc6tYRGpTB3cbyrmjYNC/j9bzbtnlnk+LPVRoda?=
 =?us-ascii?Q?COPPplYsx1pG1W1Z23Fj8ctwyeW926GuG3hYTHZA3RZ29mgM9F+DhLPUZ+7w?=
 =?us-ascii?Q?geOv7Pbc97YzjGj+DU7kxD0F4hxxELzOd50PJhF+gQ26ZKrUuaR2HI3U7Cuz?=
 =?us-ascii?Q?AiSCM1WFQkCV/aNb1lRHNXB6/lH76uaWX/oeojYRKTq8yCaFcMPQdk6EyoAa?=
 =?us-ascii?Q?U0pNoyCjQj2dibGzVSJsouDnKSR1NuClsO0Oen8Ti678NL8tjRaVjGspOBR/?=
 =?us-ascii?Q?j/IpSGEGnG5vsWBhBxJ0jHoUZW2l?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:14:59.4535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f15a1b59-16ee-4104-cc59-08dcb20a6b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142
Message-ID-Hash: JRYQKFFFN6DUS3JP5B4FSY4FBNPVYM5Y
X-Message-ID-Hash: JRYQKFFFN6DUS3JP5B4FSY4FBNPVYM5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRYQKFFFN6DUS3JP5B4FSY4FBNPVYM5Y/>
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
- AMD SOF based generic SoundWire machine driver for ACP 6.3 variant.

This work started a couple of months ago to avoid duplication of code
that wasn't really Intel-specific in the "sof_sdw" machine driver.
The code went through multiple iterations, was tested for multiple weeks
and a couple of build issues reported by the Intel kbuild bots were
corrected.

This is the initial version of SoundWire machine driver for AMD
platforms. Additional code refactoring will be done in the next step on
the AMD side.

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

