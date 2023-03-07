Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668626AE07F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 14:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3198A1466;
	Tue,  7 Mar 2023 14:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3198A1466
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678195725;
	bh=JzQj8KlG9vnDcTc9SudYRD/XvYHf+ZJ57RoQO0rDylw=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=fmyahudEY4b8TnBMTjoQH4W2UBJ/hiQW5gqfa/rsS35NDCDaq4bhOqDZmIvbaFGFl
	 Zaex210hDvaU1v2ccrDOG3caMT3DbPJllN99PvskmVUeLmnSAUr9+csM73tvJiPfQK
	 gt/VlUVJEnNRtGo4Sf4jnHIZDm5WwRlWAZGrQUro=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F425F8042F;
	Tue,  7 Mar 2023 14:27:54 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH V6 0/8] Add SoundWire support for AMD platforms
Date: Tue, 7 Mar 2023 19:01:27 +0530
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167819567298.26.4782008491561930327@mailman-core.alsa-project.org>
From: Vijendar Mukunda via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BBBCF80431; Tue,  7 Mar 2023 14:27:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27887F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 14:27:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27887F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wO9Ka050
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVzlF2bIVaJGPrLNKIAHadlVdInqToLzbfi95/45tSQFBiLcEbF7AKXDOgVN3oeCXkj6E7hymsWq/Lt1Wjpz4r1CeMYDYaVn2t5ODEa8wb8v5xsUFH/TjwLjVcVHYthJ4Vf8oumZQYqyXetSm9qwz0F0Zhj6VueNJE+sot0CznrOuL+6cGP5a4yLTlU8t9FKqhLC9hGzFyORZvptpZVMTuse0vvcKpBcTIua49munBGTlsSD/7g8EJkrS9Jc/MBIE5LoGRIjn74OG8/U0vlTNpqOoeOBl7CfFqI9d8xcMBEDBSjwbYSrpIsS8VWjanBc2i1Lv4rP8doaG9mDtDRuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg1IUX9JYoY3UhaHHBVXT/gw/Ehoe2CrvsWuedog0os=;
 b=AYjtf9ASAaoklFuDwzyvdT4ii23XnZ3G7gN3l3FWTcXoyzLIPNXOouDcucOdmp6nOWzo3H2s4fWbtv0/WQgHC/AEx3+kFiVODsCBPmAJVj5+QHGXoVRGoVvcWMRlP4Sp7KXmilcDfwU7u2fKk+p+ixelJDl2CSQ/AGP9mClK8WBpXAsfDUNGxf+Z3P8eP59warq+Vnm7+pX71t5wDB3AWYO2+aHSGKQnyek0NIKBOEDZhS1BqGMBHEoOq0wLLCoDX8ax5xxhZmF2pChHcsexgwPdwHj24rOzj7S3SRctpXaDoPcpNvf1sRPY818Ji6PCdII6/NH52nIM8xzN9Nbu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg1IUX9JYoY3UhaHHBVXT/gw/Ehoe2CrvsWuedog0os=;
 b=wO9Ka0504Gv77baPFPK21YfQuHvWoKn6lz4tv6md8PZWA4MUTE56hoA6rzj4ZdH/dmQzovJhjuf64arHGtYXYPOYp733RXDaPw0pSp1+/pkbCyrSwnLeMMtlbV7ubtsedwN2pPAWRc/sxPEdiX0SVHbKt6RE1u3nFEUtYhg6yQs=
Received: from DS7PR03CA0283.namprd03.prod.outlook.com (2603:10b6:5:3ad::18)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 13:27:34 +0000
Received: from DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::8e) by DS7PR03CA0283.outlook.office365.com
 (2603:10b6:5:3ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 13:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT100.mail.protection.outlook.com (10.13.172.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 13:27:34 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 07:27:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 05:27:33 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 7 Mar 2023 07:27:30 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V6 0/8] Add SoundWire support for AMD platforms
Date: Tue, 7 Mar 2023 19:01:27 +0530
Message-ID: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT100:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: c83020ab-6569-4bb1-f5fa-08db1f0fb643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ztDrqTfbra6Tp5UKpuz2aiB3CgvSZuRSe2zyvKb1LqL9aopuQA6zK3Qv0dxm+if0yNQPNGvbckHoEFuzNLPvsCf93HaIrXSWwVIA6X67OtL/ridLfnP42i8tf5I3XuD9/m5kL+RhChb342wu1ZCZOb7s3aIdVY+t+E9JX6y1+Vd2N3tdfdTusMR6yzsE4gH3rTgWUZtT5czW+0OmVlcb2H4D1ji6xXJIn5nYPK5g5+jkRtoT6OPOqRD3a4pNdhaSrh+5TrG0DGrPQc+5Q7gZvBZ6QLmqlWDYXGL99y1cti+E7CNcZ7IIyGiSJ7ZVviBd9Iz8pogvwWMErhb3dV0AYvVu1nSnzQN/dOJ/tZphI8oB5QIqNaBahemnCEWfx7zH/nu9rFLYVlSHwZEHB67lY/D/zqFpxEQe1WTbLWKLM5arC845z8IA4hpdGwkt6wHrTDPqVN4Dzx/w0w+iE/3WeP02qhxhsmkSkrA1Kh4LrpkCsv1wMBZkWUwKb6cKlbhEKObpKRyd9gIIz0gzw8L6wRnfQHpjiNPUyownEZt4ChqZvEQY8UkRc2EZ6MsE13bZTbppa19FOt1W7wCqjVNB9PgwcOpCEwLztL1liQXv0zWl6j9w1N2E94hVJnJZDBfnwstZVfuMOx6YAYw0KS6tZGesI9lvh7G0RRldr0L8nzbeI5KDlHMvHtYp7MVsRauQ0jm8DsBI9rtO7+FJe4mVM2DMlxLsrh3hv0KSd4gzS8=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199018)(46966006)(36840700001)(40470700004)(2906002)(81166007)(186003)(82740400003)(40480700001)(336012)(26005)(1076003)(5660300002)(6666004)(2616005)(40460700003)(36860700001)(8676002)(70206006)(6916009)(70586007)(4326008)(478600001)(356005)(8936002)(47076005)(426003)(41300700001)(36756003)(316002)(83380400001)(82310400005)(86362001)(7696005)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 13:27:34.4528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c83020ab-6569-4bb1-f5fa-08db1f0fb643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
Message-ID-Hash: TIEPAJF7OCRBQJ5PEJZJ26TR7NFTP6EX
X-Message-ID-Hash: TIEPAJF7OCRBQJ5PEJZJ26TR7NFTP6EX
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP IP(v6.x) block has two SoundWire manager instance support.
This patchset adds support for AMD SoundWire manager driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

changes since v5:
	- replace loops logic with read_poll_timeout()
	  throughout the code.

changes since v4:
	- fix nit-picks in the code.
	- update naming convention for control word and response
	  buffer vairables.
	- drop pm_suspend check in prepare callback.
	- use return statement instead of returning ret variable.

changes since v3:
	- add usleep_range() in command/response implementation.
	- add usleep_range() in clock stop sequence.
	- modify usleep_range() values throughout the code.
	- remove unncessary debug statement from code.
	- update comment in probe() call.
	- fix timeout condition checks in the code.
	- drop "ret" variable in amd_disable_sdw_manager().

changes since v2:
	- Remove useless variable initializations.
	- Add helper function to interpret peripheral status.
	- Move runtime pm sequence to probe_work workqueue.
	- Use string "SoundWire" instead of "soundwire" in code.
	- Update comments in interrupt handler and probe sequence.
	- Rename "sdw_lock" as "acp_sdw_lock".
	- Remove __func__ from dev_dbg statements.

changes since v1:
	- Drop asoc tree based patches. will send asoc patches as a separate series.
	- Fixed double space errors.
	- Use dev instead of pci->dev.
	- Use SoundWire manager terminology.
	- Remove amd_sdw_compute_slave_ports() function and use exported
	  sdw_compute_slave_ports() function.
	- Remove unused variable "num_ports" from amd_manager structure.
	- Drop startup and shutdown dai callbacks.
	- Drop reset_page_addr callback. - Use relative address offset to program SoundWire manager
	  registers throughout the code.
	- Separate wake enable interrupt handling from slave status handling logic.
	- Use acp_mmio to program ACP common registers.
	- Use dai_runtime_array implementation in dai_ops.
	- Refactor port_ops callbacks.
	- Add comments in port_ops callbacks.
	- Add retry count logic in irq thread to address faulty case.
	- Add helper function to interpret command response.
	- Add generic bandwidth allocation dependency in Kconfig options.
	- Add comments for AMD SoundWire power modes.
	- Add missing timeout check in amd_init_sdw_manager callback.
	- Declare frameshape parameters in probe call.
	- Handle error case in clock stop sequence.
	- Add comments in pm_prepare and pm_ops callbacks.

Vijendar Mukunda (8):
  soundwire: export sdw_compute_slave_ports() function
  soundwire: amd: Add support for AMD Manager driver
  soundwire: amd: register SoundWire manager dai ops
  soundwire: amd: enable build for AMD SoundWire manager driver
  soundwire: amd: add SoundWire manager interrupt handling
  soundwire: amd: add runtime pm ops for AMD SoundWire manager driver
  soundwire: amd: handle SoundWire wake enable interrupt
  soundwire: amd: add pm_prepare callback and pm ops support

 drivers/soundwire/Kconfig                     |   10 +
 drivers/soundwire/Makefile                    |    4 +
 drivers/soundwire/amd_manager.c               | 1245 +++++++++++++++++
 drivers/soundwire/amd_manager.h               |  274 ++++
 drivers/soundwire/bus.h                       |    9 +
 .../soundwire/generic_bandwidth_allocation.c  |   12 +-
 include/linux/soundwire/sdw_amd.h             |  109 ++
 7 files changed, 1654 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soundwire/amd_manager.c
 create mode 100644 drivers/soundwire/amd_manager.h
 create mode 100644 include/linux/soundwire/sdw_amd.h

-- 
2.34.1

