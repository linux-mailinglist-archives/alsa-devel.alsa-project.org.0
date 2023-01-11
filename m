Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C166656A5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 10:00:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 248D06221;
	Wed, 11 Jan 2023 09:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 248D06221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673427646;
	bh=QXUwUqDUy25sy3wN2WyddCwfB7ZyFYq3LckZ/lnnEuE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fm64UaYsHqvzbWd22OGMdHugRg1X/ckCwFn9TM4hP8HsbyV2XkY7Xw58G/KlxwWJ+
	 6Yoxwuwwui/qzMbkXso0wi/CweEmS95RP9lDxMVTn9Mkjg/3FEuph09YDqxKiMfprS
	 ZunOizSFq7MrOspKiHy81px9JnYSZFjFeblfaM4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A41F8026A;
	Wed, 11 Jan 2023 09:59:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C085F803DC; Wed, 11 Jan 2023 09:59:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1C7DF8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 09:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1C7DF8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=P5mwLkgs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeCJts6MCdMjoJsvLM3To86c0bO+347ogXVJ1Ag9xEfr7fIzlBvs3cCs68KorUfEcW5S/96l+34bq6twCfzDrDkf2PnOe4VqIERhBQsKxpNx5xcgjWfV8NSKXQ4V1f4bfdetoszPyx5e7BB8+JhYuEc1Dk8x7HgtTcNVzKsViENbP0pVyWP1UsHxBF5UDnNBQwLUHJiR5faMXD+LNO7xV4yemc49oIzv8B6w9y9IPIZkCOn76VeINzK+b53PZHpUFfLzdIpBNiJKMg9u6NgQe+ocAdv2ejC3VKgEDvPcS/xEbH2abWtRFWexxjHjUpl+uKWzfPRRpZ2CswtFsd0fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/Dq54cz1Zpjc6s67M4ZFb4KDc/Lp15Nv9TCi2sz6/U=;
 b=DiUcEYWUt0XvIiD9KWIB938is88FJpCeot7QCm56Mg7oxyNROrD4LpeFbGCaSkIUTooxUh3ZG/Peh6keh4FF65mrlT4+1rDYlb4qOAaB3WS1KcffuO1rf5GSPWfokEbaAxxNZq+MF87NtmW5xsGmRL8t9ZbrTEWpMjBLxZk1jKkqM2aeLWHBkhaHF/1hK4t4Fyytg/9YLNJzdthoIN0SmLClVqZTzZXzCtXWdq3I0l6xosasTwbKxJD7j0vwXo0LWSIwKLNd7cwdd8jHjhZF7TBv6XupqQmKp/Gl/WUfjLKBkfges+r/rcsY02G51xuYvqsaUlJ3HLG4N2OmUv4YLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Dq54cz1Zpjc6s67M4ZFb4KDc/Lp15Nv9TCi2sz6/U=;
 b=P5mwLkgsohDPryeIFee22Wz2NxLusm6KvPo8sC2W4pgIG7gCpqBLOJ4sM4YODIkX198JvdgEvnfOfwZSw/MCbpHV+YDqFL7lZvTnPSXOJWtryZZ39Fvcrq0JOOxs1MGGXwKbulQo6xYYrlqBtQNezLkAUYuXw7WezZq/Imt2XBk=
Received: from DS7PR03CA0177.namprd03.prod.outlook.com (2603:10b6:5:3b2::32)
 by SA0PR12MB7074.namprd12.prod.outlook.com (2603:10b6:806:2d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 08:59:37 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::10) by DS7PR03CA0177.outlook.office365.com
 (2603:10b6:5:3b2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 08:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 08:59:36 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 02:59:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 00:59:14 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 11 Jan 2023 02:59:11 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 00/19] Add soundwire support for Pink Sardine platform
Date: Wed, 11 Jan 2023 14:32:03 +0530
Message-ID: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT009:EE_|SA0PR12MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 4517f72f-2e2f-4ffb-3c25-08daf3b22a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vY3AcJ7ZsaPTHCgQyETlO8DaI977RxD0naL9K1Uu2TbT/9k0+fRXL4W/Y82LUvpWzBx/Q6IyGdZpLT/YeoG9S+GfrpG8pdp/NvZfcaF2FpI5JPl2OHk+/dTZ/wgU/4J55oZUalYr4MYJlYr6p7JI60OvZec/tqMnBQFBxOLdDzyJ/24SbHp/wj/KjuDxdM51CFBUk6lcLMilhn1tQ7nx0cfbFkHfGZBgCxgOECVwPFoiXgxANMl4HrSm88fqqx3A2uIiT8OQdJAl44IDTGfUb2bBKaUv/zBMuZc3t0ppQQqpPxjJiv4m/eWvTyCyqsXMz6VoVReQJuviAL1pgzbv21WaoQ+AQN00Xeh3Ws20r2hDaCNX9QYhG/Fx3VIgUSYhgPlzIvykXHDg7w1hb/+3XC1spEKiWgGqRctdMjzVO210aEkwAfwqFmcMUMnuq9D4BYuK5qnyneiuZmmqzbYGQsFMxhcAqGMIEZa0Y3kgNa742VR6yQ2mljdR5RoB3xQvt3Ep7PLSH+p94YOZfYG+w48CbTga6YAEhxIEfgZjYlJ9IauHl4Pz7ygTRrqMXe3XpH7TzN6nIsC2hI6qj1vQXWlHD3Ro+TJ7iTZ50i/7XFOkc5H5gu76FTmDQhTbSUPTIATsJK1TT5QS9RYAz1JjkaWHrieXwvEu9BUv6TgEwUMv+4QC77Q57pSg9FQR357Kw6vUsQAtCh45PZmYZcpGtN2Qhy5izsCd62kgcOvWN2Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(82310400005)(47076005)(83380400001)(336012)(36860700001)(426003)(81166007)(7696005)(2616005)(1076003)(40480700001)(5660300002)(8936002)(6666004)(36756003)(186003)(26005)(478600001)(70586007)(70206006)(8676002)(54906003)(110136005)(41300700001)(86362001)(356005)(316002)(4326008)(40460700003)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 08:59:36.8406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4517f72f-2e2f-4ffb-3c25-08daf3b22a81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7074
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, arungopal.kondaveeti@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Pink Sardine(ps) platform is based on ACP6.3 Architecture.
ACP6.3 IP has two soundwire controller instance support.
This patchset add support for Soundwire controller on Pink Sardine
platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Vijendar Mukunda (19):
  ASoC: amd: ps: create platform devices based on acp config
  soundwire: amd: Add support for AMD Master driver
  soundwire: amd: register sdw controller dai ops
  soundwire: amd: enable build for AMD soundwire master driver
  soundwire: amd: add soundwire interrupt handling
  ASoC: amd: ps: add support for soundwire interrupts in acp pci driver
  ASoC: amd: ps: add soundwire dma driver for pink sardine platform
  ASoC: amd: ps: add soundwire dma driver dma ops
  ASoC: amd: ps: add support for Soundwire DMA interrupts
  ASoC: amd: ps: enable Soundwire DMA driver build
  ASoC: amd: update comments in Kconfig file
  ASoC: amd: ps: Add soundwire specific checks in pci driver in pm ops.
  ASoC: amd: ps: add support for runtime pm ops for soundwire dma driver
  soundwire: amd: add runtime pm ops for AMD master driver
  soundwire: amd: add startup and shutdown dai ops
  soundwire: amd: handle wake enable interrupt
  soundwire: amd: add pm_prepare callback and pm ops support
  ASoC: amd: ps: implement system level pm ops for soundwire dma driver
  ASoC: amd: ps: increase runtime suspend delay

 drivers/soundwire/Kconfig         |    9 +
 drivers/soundwire/Makefile        |    4 +
 drivers/soundwire/amd_master.c    | 1734 +++++++++++++++++++++++++++++
 drivers/soundwire/amd_master.h    |  284 +++++
 include/linux/soundwire/sdw_amd.h |   65 ++
 sound/soc/amd/Kconfig             |    3 +-
 sound/soc/amd/ps/Makefile         |    2 +
 sound/soc/amd/ps/acp63.h          |   98 +-
 sound/soc/amd/ps/pci-ps.c         |  383 ++++++-
 sound/soc/amd/ps/ps-sdw-dma.c     |  728 ++++++++++++
 10 files changed, 3287 insertions(+), 23 deletions(-)
 create mode 100644 drivers/soundwire/amd_master.c
 create mode 100644 drivers/soundwire/amd_master.h
 create mode 100644 include/linux/soundwire/sdw_amd.h
 create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c

-- 
2.34.1

