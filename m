Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987F6C29A7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 06:15:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A747D204;
	Tue, 21 Mar 2023 06:14:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A747D204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679375717;
	bh=794qc77l7wgoL/vRm1p3XS/Xbksyd2EfZUAMnsJcLeo=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=vmoWI7QcEqQnnKDmi3/hWwSJ+BQBuxhgW5ByvmbsrN9nhCjF8not/ifPZ8U3G2WHc
	 8BG6ZJX2v44u78tf+qQazD9b6YmFcJi+kDRiimXP+9XHcExUbtSpm9tytmLo/QrEaL
	 rVPKvJqT2ov4kbYH9pAkn3XWTZYDmVN4J2g0HXYU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C56CDF802E8;
	Tue, 21 Mar 2023 06:13:38 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH V8 0/8] Add SoundWire support for AMD platforms
Date: Tue, 21 Mar 2023 10:38:53 +0530
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJY4APDK5WMQ5JU5JJJQY5TLIYV4XBSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167937547902.26.12341972374702478222@mailman-core.alsa-project.org>
From: Vijendar Mukunda via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: vinod.koul@linaro.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED78CF80520; Tue, 21 Mar 2023 06:08:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59FD6F8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 06:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FD6F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fSuj0oww
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/CUCtlMDU5+SHl7Q5o7UzKCjutojHRjmU+UQDtqo7lOrJbHZCns1MO9BUL8VMom5D4MJZE54rAcxvkl8Oa2mNatWbU0nfnPdsXowph5K2mV6dvk+LaUMdx2v+kfr9neeoNeDHcv0aVa//WwDcnW7DucnoClFgnwB7uIDJA7RLmM5RTC+CgDr29hkblG3iEgKRSqFEBAAC/Bu8bJ6NqAVniHn1NK6V/U9NdDA6DyKiXe0wKYBTxGXyIIsM8qYbfJhOuwq06Jh+7lsrek+yZ3gCwEkwSOxtj7e26xo5++4yYI88zFYrJbFqj9Awf6gYUVZiEHZDvkTI7yVTFnhitLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATZimk7bTGrgcnBbZwlfRisJweIJjfTK4yKFCCt1Ccs=;
 b=KJFJ5jDQ94//HQEzeD7w+UOdalRAXAF3tXnzretllHDN90UlP0UGcQLCBC+KIGS2VTP5YwnVwHGi51ymf8mQBjU5K08635kSsfJTN+Ed62quVmVIIOTBWU3QFER9qdWd1TMRt2Jg5Rilc0eiQvVWq1o80w6UqCXsEbIXW2SObafleKACjAaFr0U1xZQuo3QD3MgOqsIT2XkkQEEEb0EGcemefAP8frCvMmwfqsmkdfp73XbpWM9pbdDFgYiGq7KC0maeRoVkKUTyGMzNtQFx6pq0KeiC8Kv/p2A6JJTywr/cUqTWoXfoF3nVepaPzTbSNgarup5hQG6lAZSq6qAiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATZimk7bTGrgcnBbZwlfRisJweIJjfTK4yKFCCt1Ccs=;
 b=fSuj0owwy0SVx1ABNZDx9IUb1NRUK8bcikvhxVbCpRo2+N1u3j26dSKQVrpzx7Mn3hrAuGEOqDnHc10Wv3CIRmoPpStM1+dFTR7YA808cuwbtC/pyU8hyf1DZd7uhrHV8k1v8v8JpkyjMWJAzAHWSnGESWRBHGHkCJCef8KHeVQ=
Received: from BN0PR04CA0005.namprd04.prod.outlook.com (2603:10b6:408:ee::10)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 05:05:14 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::a8) by BN0PR04CA0005.outlook.office365.com
 (2603:10b6:408:ee::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 05:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 05:05:13 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 00:05:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 22:05:12 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 00:05:09 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V8 0/8] Add SoundWire support for AMD platforms
Date: Tue, 21 Mar 2023 10:38:53 +0530
Message-ID: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebf31aa-ac65-4248-88fb-08db29c9da8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eyZdaBR5zS8Wbe5VxnZQ2Hky0glxIYhnjTEKzaFoYdkOEIHKpzw8erZVeV3TDELV0drQL5joNsJ2VJrxHhGH7qMf72+O5a7T5sSPbaKBsS//2cG+4MXl4rCwd5vMuEbKI+G8483/Ajz6rcInHi+5AXDVfIt0bOLrTVskE2UkVOPLckeV5rmyZRLx4vt+XAb5jYLDzm6EOWswetO8bFfmGGjvXWh+K4RNIPds7RO4ifdkoDX55rN3bYk696f1Eu5+5ianu7i6TptVdtABRveRi78bgR1wsLfaikcb+ng+Br/fn1zp/JR3jHNJwVslVWy0rnFWQwgbzBprnRbeEsl5BNRL7EPQ2LJEyvdxUyp/x5GuPExyTOwbUeWJ1c5SEX4MZhapU9cq2YHQk7dU2Q67O3tyQTroXtde+gaSksK4ToMmHOoNvv95iAXG0blyfgowyf35C5FfjFPKQXaXPoRodH1CxuL38qHqg/eeu29EUW1f5ICe9Gl1y31a/1QqFJYmQIuaM4WKWV4iyh+Mi2wHakQInMu5DsH4Oo548ps2UXqumBBeXvv6I5z5nLzqKt0yogDgUIvxsrQJfft/p0gsLeJS3tvE7jeUH7WS+0V7xYM+bb02Lt9z/wBaMWtri2lb1zCeo6yli+6uQ3vhzejPbv6Sb5rBSobV+aS+hhABR9Fa/I4VWy0Aqvbovnz4fNBlr7c3qyPxOAzCKqfBJIEjtilXK/p29O7R4UNoTY4mFYA=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199018)(46966006)(36840700001)(40470700004)(82310400005)(2616005)(426003)(47076005)(54906003)(83380400001)(86362001)(82740400003)(336012)(81166007)(40460700003)(356005)(36860700001)(8936002)(4326008)(8676002)(36756003)(6916009)(2906002)(70206006)(70586007)(41300700001)(40480700001)(5660300002)(186003)(1076003)(26005)(7696005)(478600001)(316002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 05:05:13.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ebf31aa-ac65-4248-88fb-08db29c9da8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066
Message-ID-Hash: HJY4APDK5WMQ5JU5JJJQY5TLIYV4XBSD
X-Message-ID-Hash: HJY4APDK5WMQ5JU5JJJQY5TLIYV4XBSD
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJY4APDK5WMQ5JU5JJJQY5TLIYV4XBSD/>
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

changes since v7:
	- use readl/writel instead of acp_reg_readl() & acp_reg_writel().
	- drop acp_reg_readl() & acp_reg_writel()
	- use readl_poll_timeout() instead of read_poll_timeout()
	- refactor command prepration and response error handling.
	- Modify switch statement in amd_sdw_fill_slave_status().
	- use lower case for hex values.
	- restrict debug logs to single line.

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
 drivers/soundwire/amd_manager.c               | 1208 +++++++++++++++++
 drivers/soundwire/amd_manager.h               |  258 ++++
 drivers/soundwire/bus.h                       |    9 +
 .../soundwire/generic_bandwidth_allocation.c  |   12 +-
 include/linux/soundwire/sdw_amd.h             |  109 ++
 7 files changed, 1601 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soundwire/amd_manager.c
 create mode 100644 drivers/soundwire/amd_manager.h
 create mode 100644 include/linux/soundwire/sdw_amd.h

-- 
2.34.1

