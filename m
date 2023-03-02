Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA86A7B44
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 07:18:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6CBC1FA;
	Thu,  2 Mar 2023 07:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6CBC1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677737934;
	bh=7BTzVbxYbP7sSKqzMKua4OzRRlXfp0vN5f0LP99mHI4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gJf4dslPj1i3Zxyll8kb1vRH7lqDZn7uBwgYn9USb8s6osoMomPP3fNHqohhQD04p
	 reaZzpvRIfC5VTXkIyGp9cxg3LYLz8mlV17OeQGouMlgvTVOdqtjDgfqhluGYScNTY
	 /s4Xd2XxHq4J2xnpUEtT5Ohwc3FH5p9hZKPKXDMA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8861F80310;
	Thu,  2 Mar 2023 07:18:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE676F8049C; Thu,  2 Mar 2023 07:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90D5AF80236
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 07:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90D5AF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YxGdgkEx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThxRoRrfSrc2KHUKlvB8JzsUEE7GAi0tOu9nY2quU7uWnAX36RWWRsJG/2VacC+VdvJdCIGkxp+UckrHnMDa2wmCClsWCnUtwFhtQtbMYHe6JHhb2K6aIaeYjecRk42Y7FGgJiDwxrxftnIfK6mrgOMtm6bHFceNl30I5pn27pIFk72fvRcSOj9jNRqTa4FefZ07vmc4Kd4FpMa1ZKOlurdRcEv2wKZg+GX/ZsZRLOC3AqgLlMtyUZv/xPEpr3CvRwkRm+LvvVx0qtmxLzRuXF9ae4OuFa4rNdn4pD+S35BehQN+6XDBcYYqMrtEckh9Cfh3jSB4SP1C8wPOkb1S2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPSmZbkej0ZzybGLduIT72Fx8ErEh6xGhSij5xwA5Bg=;
 b=NWecGgJ9TWs+JKTeEKXib94Gs2rY8bq/oAi9p9+O7siWWvK4qmtJIbdl0LaD5kmfIR+sBh8BD5t6a+MuXuAOQnGH0zMDMFtLrKfcb1T2Q86tZKofgZHj1edlsNCrFwfHR1z60I0F48jKzZ/C/hhdUlaPXwrDAke3b3z6hkCBdmXya/Jq40Vo/BzdzfG3yKNzIVzA6uP5zjZIrcTxG30i2aMaZrKyKAWotuEo1PPVecyZbSo9J3b00NTS7EZBQ8lPjVrVRAxH/PtCD2KN4XW0G2uvZLTFDf37pIKdDzTk/HfzToEZ4JIeYOeQqnoRC0YTDL1Rv9u/0K+YLcpR0JL0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPSmZbkej0ZzybGLduIT72Fx8ErEh6xGhSij5xwA5Bg=;
 b=YxGdgkExdgwrQxcsJms0KUNZ2Bk2RKFGLgzBIBr4Szj1Z6Vea3vuVx1NPvIxntPFPKWfo9nzQXFWnvfE9uDJjwDbUDvPnmN/Oa/xhV3LrmG40dR1PxbriC4NjqNFvRxj8gjLWh1o70PPlLuYpghor17rO5nG8L7TjJgVF7SLnCg=
Received: from DM6PR13CA0039.namprd13.prod.outlook.com (2603:10b6:5:134::16)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.30; Thu, 2 Mar 2023 06:17:38 +0000
Received: from DS1PEPF0000B079.namprd05.prod.outlook.com
 (2603:10b6:5:134:cafe::c3) by DM6PR13CA0039.outlook.office365.com
 (2603:10b6:5:134::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 06:17:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000B079.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Thu, 2 Mar 2023 06:17:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 00:17:38 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Mar
 2023 22:17:00 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 2 Mar 2023 00:16:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V5 0/8] Add SoundWire support for AMD platforms
Date: Thu, 2 Mar 2023 11:50:59 +0530
Message-ID: <20230302062107.207845-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B079:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f61534-f713-46a9-7ba0-08db1ae5d2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rXk13y+2mA1BZBYBbq1pmb3fNb7zHxIZXtDl6GhDeDc9koGibOC1VrZAoI0Xol6j+uIMKIt94e1RWh0NPa98kcDBV9RytCk+HYDpB+9cZ+nFs0ye2CicQAXJ9aDqLGalKQ+136PRT70fVXv+tea4wtlU55iwVDa7YumdDKbT9gUiW4+rYVUJ1sFdt8ac6jSX2KPm3CAp+Yzv0dMXubDew02MIjn6gZcF5PYYomK0bp/XYZmx+FEG73Nz2ws3ESg8eMijd/qIXwaAwyMdrbP5Xr+HR/rz/VFP68nyrKCcxVCoDE9wxY703V8G+HhwKmr30MLgschv/QWhDONu8oWqKF3DfMcJLXky4X2Rio1uaurk9g/5/H60LY/64i6H4mBaqNvYwwdS7bCzheOxAgyfhsQtOAIJTZvQEuuRf4vElSKBNroxyVt2gonf8A+pi8r3scCbX1nyPjOaTX9QJjINiuWTAv1JKu8laAs+tLZxLCREDQ0jvd+9VfMfrlw6fsR+qhmywmToQBXWLTWVyHrZCRRj46Q1TcnhDwbVhiFiHb2y+7B74MgpgQTkwIeQOykeNSAz4V65N0za1GCaa5GTzRGfOi99M1PIKq/EtoSuMaWxdcrpcRiW+qIdJgx/cTi3VhOLRSNCqQyjUQ+eeBd6lCbyiLPr0bUMlj6ngb1I/Orqa8UYsEUwbZ6bgWdu1sLMu7KzKOK05AYOVZ9ki4LSoI10KSZI3eKvaGSwhB5lvmk=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(356005)(8676002)(6916009)(36860700001)(81166007)(4326008)(36756003)(86362001)(5660300002)(41300700001)(70206006)(40480700001)(8936002)(2906002)(82740400003)(70586007)(82310400005)(7696005)(336012)(478600001)(2616005)(26005)(40460700003)(1076003)(186003)(47076005)(426003)(83380400001)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 06:17:38.7676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e6f61534-f713-46a9-7ba0-08db1ae5d2bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0000B079.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206
Message-ID-Hash: UWO2UXHKKNFZZIAWCRDPMIFHLR264MNE
X-Message-ID-Hash: UWO2UXHKKNFZZIAWCRDPMIFHLR264MNE
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
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWO2UXHKKNFZZIAWCRDPMIFHLR264MNE/>
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

Changes since v2:
	- Remove useless variable initializations.
	- Add helper function to interpret peripheral status.
	- Move runtime pm sequence to probe_work workqueue.
	- Use string "SoundWire" instead of "soundwire" in code.
	- Update comments in interrupt handler and probe sequence.
	- Rename "sdw_lock" as "acp_sdw_lock".
	- Remove __func__ from dev_dbg statements.

Changes since v1:
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
 drivers/soundwire/amd_manager.c               | 1324 +++++++++++++++++
 drivers/soundwire/amd_manager.h               |  275 ++++
 drivers/soundwire/bus.h                       |    9 +
 .../soundwire/generic_bandwidth_allocation.c  |   12 +-
 include/linux/soundwire/sdw_amd.h             |  109 ++
 7 files changed, 1734 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soundwire/amd_manager.c
 create mode 100644 drivers/soundwire/amd_manager.h
 create mode 100644 include/linux/soundwire/sdw_amd.h

-- 
2.34.1

