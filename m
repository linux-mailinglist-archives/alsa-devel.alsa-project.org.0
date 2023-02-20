Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0AB69C836
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 11:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A4DEC7;
	Mon, 20 Feb 2023 11:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A4DEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676887416;
	bh=tFwWCdU/Yv4yNQ4yXOaNmsFJz7hxh4wEMYrhB2fb6+o=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jWRgo1uOdP+pfMrbDhL70Ek2sE9eP1HdCNfHGK/lsXyWL/OnkDZT4fmp7noz7kGxX
	 isRMHBveQxszL2noaufh9Dgq6EBvKvd+yfy72w97/rpv10/b9SjhmHEA7ErVotoGb3
	 KvrJB789l6jdlTp4M/Lrajo4MasfhElN0ElVzios=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20884F804FC;
	Mon, 20 Feb 2023 11:01:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B097EF8047C; Mon, 20 Feb 2023 11:01:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_PASS,
	T_SPF_HELO_TEMPERROR,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BB3AF800B6
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 11:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB3AF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LtF3wOQl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+PvKdewWRH3IpYM6ZIkojpk1lWwTZyzzgbdh9YA0OzQUKs+yUj+Ky/QQ/Dm/5f0QJPX4aBE4EygsPtZwNdXHDJQa2kFw8LzxW/gaZDm5Zv3Ih6+4icLNKsOWEMN7ETA41XItRn0XeaIs984OHBdZW45/Yh5z8SKH/YHbKuo7JAG2qqG2u+3PUqx4gKwjb5QNl3jQjcjYCBEdKkCAxlIldwJjbTrB/3v9jN8Zo3O1Mth3j2OjVMbuvbU+cVOYXoVU0xd5y3bMinVemvmY8L3eSEHjFnkJXJFY7nPgzbEZ+lxwSou+lVR11TYfOc/bZYIlOVyfsMNlKYvCz2UNqcxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHRIQtbGZJtHLIYTcSX20BZnItPCgbV/ysJWabxp6b0=;
 b=RdQ6/tlkqjMUss/f6vxokSUdnrtORR/rt7prqxBtEVWXkGp812gunXfEs++qS/qZ66XAqFjYtOabT+tjWLRx4QVBgxDm26LgpbyVZn597viaUqrKoHIaVBljev5Nwqu57ry+1oUqb9XfHNaONGLOcMQNxFXjDiHUku8R1ye3GqEPLebDKXAnTLq2Uml01g/9O8Y7PeSpCbxpzE30L2qM4VjqpCqPfpvNNE1Xt1ZaOFLu92sGX/FVb19JRvWWnoy94p+qe8FPrbBMvECuQp4k5PjTfqR0HhucqkltJOdeEXaNcnEVFrDcc5kGTtGYc7wrLtB6IB0V23h00y+ZWX4yxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHRIQtbGZJtHLIYTcSX20BZnItPCgbV/ysJWabxp6b0=;
 b=LtF3wOQlQ0NKjhIPDUH5BtqTybRKgUvsc58FxB4sc8PKgoFTM9t3wQRPdJcr3OaJc383qMqj3PmTV1tQyhfHJPJ/RNqJhdsktC8ytdtEPX5+At8QAtuu6sSZV8lkL+ahupJdcrriSWHROK4Roc1TObGLmngHSiKS1W8CAnrXpgY=
Received: from MW3PR06CA0026.namprd06.prod.outlook.com (2603:10b6:303:2a::31)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:01:31 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::b1) by MW3PR06CA0026.outlook.office365.com
 (2603:10b6:303:2a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20 via Frontend
 Transport; Mon, 20 Feb 2023 10:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.20 via Frontend Transport; Mon, 20 Feb 2023 10:01:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Feb
 2023 04:01:30 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 20 Feb 2023 04:01:27 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V3 0/8] Add SoundWire support for AMD platforms
Date: Mon, 20 Feb 2023 15:34:10 +0530
Message-ID: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT034:EE_|CH0PR12MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a337d2d-f126-4ce4-d18a-08db132970d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lU8CDO16k8GiBrm6qvofUVKcisNd9V3UJSWtmG/FOPHHBvvihznPVvsmRvPM9N+k2AKIe/cLIy3QGqU+TcEc+W1irFu0uKUnoqmv1wXublabrXkS2w0sT/me5x1Xovtce8FvClzvKammAVju5PzG2yQW+pMLRSnjpegVXt+1kxmbkL4bHR1dTRrO1IuSZxJohs11jmUwLZnrE9e9tSHUvQdlF7+2mSWRAF8ZQCFBT4SPcQ4Po39bAFYk7aNBOVS8PwX9rUkQvJijQdsF+s1hIHkm3qNiUyKbzjeWbHnMB4rRD1TDSBIKgGVHPn5+YO5Er6Gizoaut5o9pok2KsSiQJx3syiwCoXrjcys4g2YHeGwFCwxH9kdGyao2/JYmWF4vjj4SE/MNuuT4hrwUrmFhid1tn4zZhTsBON2yJ85f0+jihMO+PHzYhkljpa/INF0pZvQA2FEfaIq6v9HHUJH8BAUk6IGgdoOzbko7SyFv9FNmkfqEfHqTE7Fu+j9s2f/uv3BBF3uIm24gfqoiunHK+g/oiOJRtmuHLtbwDsnmF/ZrfpFzZY/Q0d6LZQurso7tTwGuTytFLyD9dzVjCpz8S6z+R2yGbnkSbGGp7HEBEhziurFKWYipup5C8kwHyupgEeSGr0GCejqyVSbQ1hTrjSayz6pKfUazkRkpbDsRrmK+W6pjfwirV9rNHMPtLlCfwKVFrqfctb0Df86FVGRO6G8cpVfBiyzERVOPYTeeLQ=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(2906002)(186003)(26005)(41300700001)(356005)(82740400003)(6666004)(81166007)(1076003)(5660300002)(36860700001)(2616005)(8936002)(478600001)(316002)(40460700003)(70206006)(70586007)(86362001)(6916009)(8676002)(4326008)(336012)(7696005)(82310400005)(47076005)(426003)(40480700001)(36756003)(54906003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:01:30.9011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a337d2d-f126-4ce4-d18a-08db132970d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
Message-ID-Hash: IAA4KCW5TKDHBGK6RJMKWDYXRX5AJBIN
X-Message-ID-Hash: IAA4KCW5TKDHBGK6RJMKWDYXRX5AJBIN
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAA4KCW5TKDHBGK6RJMKWDYXRX5AJBIN/>
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
 drivers/soundwire/amd_manager.c               | 1335 +++++++++++++++++
 drivers/soundwire/amd_manager.h               |  275 ++++
 drivers/soundwire/bus.h                       |    9 +
 .../soundwire/generic_bandwidth_allocation.c  |   12 +-
 include/linux/soundwire/sdw_amd.h             |  108 ++
 7 files changed, 1744 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soundwire/amd_manager.c
 create mode 100644 drivers/soundwire/amd_manager.h
 create mode 100644 include/linux/soundwire/sdw_amd.h

-- 
2.34.1

