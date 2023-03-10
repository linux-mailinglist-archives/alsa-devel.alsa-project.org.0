Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271B6B4CBA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 17:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8066118AE;
	Fri, 10 Mar 2023 17:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8066118AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678465398;
	bh=0+/146WTZfICNB1NyuWmE/CWeYAidzAD+08YG0FGJN4=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=DWGCdyKLrcxbXFdXN9laFh77lVvlSopdxik/iRnwMGCz1nQ1GGKNTQB5VZQDh6QUi
	 9hHF6HcVDL2+Y80gfRi8PtcFvzm+LgTOnmyG9+oCUPmw5R9ejH70Mh61Uf+D594YVY
	 F4cIUdoCOaY/mCLpr+ZGK1lveIUANWVWWzuSUQg8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2DE6F80236;
	Fri, 10 Mar 2023 17:22:27 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH V7 0/8] Add SoundWire support for AMD platforms
Date: Fri, 10 Mar 2023 21:55:46 +0530
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55YKEICKJZFT6VF425OUEZQ2NVZSPRSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167846534670.26.8055589033873148829@mailman-core.alsa-project.org>
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
	id 3CD4CF804B1; Fri, 10 Mar 2023 17:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BB19F800DF
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 17:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB19F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qM0oLMDn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POKOAYagPTuLVhZe3i89v2n+rg8GX6hOWy+SVW4NdISI/RpNcmeVCirQzhr0OUz60hm5JnsFg/HdGRXCsbAHpuWuUHOkx/XEx6dFh/ekcTGeL0KzL49o6pfmTL83ui3bH6vlU9+Bf+/7QLrH6T9/LPiQIAGA1k174KhmQE2o9G4DOvHzHBTGb8B2Yu5xr96aplBiKcIqMcl1vy8snjPFuKHucDjm+aILjvXlBDZjsDLGUqhpCVsV4M9ZYwqHUGAjOikKTpjl0DLpxePSEUN2Qo9lytlsajeaB/3bjYVEXzJ+4LydYomDSO1FMRvAY4gvupX8Y9OYGf5GdQcafK2Mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyFIXsMujr40nMnzHe1Qm/Y+c+KzuyWTkwuN2iMUi8k=;
 b=ZhBeCI9stoDUiDYazZWnNW3RPsacWnNNHDiTBxsPU9KbqVQ44wY7WE0pYxKxQ2Y4V83fQc2vw8fHOjkFU5T/XMrqrA03HMw40cbA1m6eCKTQutdHtD90zvqaLzUJATirrG2hVjces6yritlCMWt15uv+MyxnLamySyst3gk277aSj8K/BzAN1oZJ27y5chGvHhTp6ddRKkIZZMbGXO7rL+W0stIJaK3wBY6LqR6QShkKDZCVb8Q8hGmuOel9pWunPo7YrosSM322yHXQ/lSo3Nkk1VjmDt8K9ayeWiZ4ZFCzynRXwjCi5PErxs+R3Pg6o2ZLe8QIVuFgXE33twm6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyFIXsMujr40nMnzHe1Qm/Y+c+KzuyWTkwuN2iMUi8k=;
 b=qM0oLMDnalV1zvXuTwybcBIqa3eB2f/dKLw7TteQLCay8r3jFdOML+ecm6sVT6REBNpjoZ5wbJvFdtQnIOr9HqI2J1d7Xu14whdclOy1Zroaj7Us1yrCspTy2Kfu+e4DP61fbqaTNtuwwloO4Y9gP5tkuBAZsRyB2NKlATXwvwQ=
Received: from BN0PR02CA0018.namprd02.prod.outlook.com (2603:10b6:408:e4::23)
 by DM6PR12MB5008.namprd12.prod.outlook.com (2603:10b6:5:1b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 16:22:02 +0000
Received: from BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::d3) by BN0PR02CA0018.outlook.office365.com
 (2603:10b6:408:e4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 16:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT082.mail.protection.outlook.com (10.13.176.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 16:22:01 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 10:22:00 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 08:22:00 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 10 Mar 2023 10:21:58 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V7 0/8] Add SoundWire support for AMD platforms
Date: Fri, 10 Mar 2023 21:55:46 +0530
Message-ID: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT082:EE_|DM6PR12MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 96824207-3329-4b2b-5a17-08db21839467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z21olsw+vZBDnM79Va3/xwcV8i+yrElCaps2gX+mpsSnuOsTePGYARajabAk3VWCml5F0QhEUI0IsAkuj6WbirW0QQZJnMWZkU/CqJVwgWVSUspnb7SNcZa1GBbR67vAPDTYzeL37u46ghcehlQgY1CXNl/pYtffGL2Y2QcIBlQOYkg/Zr/s96KeBMbY5k0jX5S++QIYyaeHCmScg9Nltw8yyVVlNGUdoeB6SnZjax0GpZADsptGrYZpLHIJ0fFB2wy4CtcDE7KmayqE+3nfUBrf+LN6CtJweDgEy5N6au5v2G3inJbRcPDhH0roJFL/R643bloS+79aSaS1RrxJRpnsGuNdZNyiD20y6aw6c29kkHz2xkeWdOv2UZVAJAhEQBpDmZs+sMMGPufjDJU9d/2U6hLf28Pvpl8HaWjwKy1Y3G/+84uHLSIyyiYHpUQwjn8NpTc20PmtyaEMLA2GM1ef052AJtSz0GqYCihe2SoLe1s1sRrPZSt3y+WQ8b0oti5F5OzSQ2HryTCSGuEbJ80Gvh2fcXzO4IWz5dg6DNLXUEU+Z1o6AorkUDE0VHi0f0FpzwOpabF3VKCsKGkIC6Yfal779+Oi/LSyqEnJfmbkl2SZ9j1QBr65rQPqaf8adMZMUKXGQ8uZc9W1sLgGmv3CMu/ywVfDmnl+cZvL/KqVLfEHzg+oY+UvUQBQ363L63z02ijIOsnxm6plbQ8v+DU4Jeb475/uLBK5kn2D8jA=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199018)(36840700001)(40470700004)(46966006)(6916009)(70206006)(5660300002)(356005)(26005)(2906002)(8676002)(1076003)(8936002)(36756003)(70586007)(316002)(4326008)(40460700003)(54906003)(86362001)(7696005)(478600001)(40480700001)(41300700001)(6666004)(82740400003)(81166007)(36860700001)(2616005)(186003)(336012)(82310400005)(83380400001)(426003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 16:22:01.6822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96824207-3329-4b2b-5a17-08db21839467
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5008
Message-ID-Hash: 55YKEICKJZFT6VF425OUEZQ2NVZSPRSC
X-Message-ID-Hash: 55YKEICKJZFT6VF425OUEZQ2NVZSPRSC
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55YKEICKJZFT6VF425OUEZQ2NVZSPRSC/>
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

changes since v6:
	- remove pm suspend check in amd_resume_child_device()
	  and always return 0.
	- use same name convention for command and response
	  variables.

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
 drivers/soundwire/amd_manager.c               | 1244 +++++++++++++++++
 drivers/soundwire/amd_manager.h               |  274 ++++
 drivers/soundwire/bus.h                       |    9 +
 .../soundwire/generic_bandwidth_allocation.c  |   12 +-
 include/linux/soundwire/sdw_amd.h             |  109 ++
 7 files changed, 1653 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soundwire/amd_manager.c
 create mode 100644 drivers/soundwire/amd_manager.h
 create mode 100644 include/linux/soundwire/sdw_amd.h

-- 
2.34.1

