Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71F59108F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 14:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59050839;
	Fri, 12 Aug 2022 14:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59050839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660306297;
	bh=vggO6Vwhqd7PILL2XsrB9i0pkMUyMrBFztBUSWQX38o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bOdIKkW8fv2AlMS1DHgZQcFjbP5aR2UYmudM/ShWsnIXli97SDNDADYnwF+zITEmU
	 Ra3ZpH4osG7GaWywF4ToL/m7E8QVomehpKyDMeOEerJmaRvU5S2d2Y2xRa2BrTapLC
	 jRbp6wt91xR0NcTCsvSkQ4OWESmgroE+gvUGhkEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4135F8055A;
	Fri, 12 Aug 2022 14:10:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9052F80551; Fri, 12 Aug 2022 14:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 650EFF80544
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 14:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 650EFF80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="zNUihnb1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPCABMQ4fwA74utA6uwjn8qFj1ywot1MR1KVcWfAd79zV5HDgtpR2hgo7b1S/Cmk+KgaMkGwdWImDGwc8G0cHWxpxqEMICAZGpxJIEF/9BES1LWYw38SonATNyjQZSLV6IgFI8ZWqcHrqMOw5krX/93G5pmuRzxLTzxjz7zFgd3yXUIEFgS7neyA1+MMiuaPZicIJ5eO70UNiXf0iX1i/SNLKwDXHwVOGRZbsA4SnSQ0L2l0tArK4IuBGw3bJDTXbWMbL2W9PEQytIYKzTrmnDwotHXmZSmMTu8JksvLkfq60/yJ4y6+TzSBma/ik6ltMTYHU9iCetDXpdDOPATd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgvAFrIfzy/bBQnMmtEiRElv64HtR6E8NZnvl5uRUKI=;
 b=JptmwRoEqcVnhCtzud6Utcooi2P58v/G9HotEm1LDwXk8fSc5oVOQQWh8un3MtIGS8J0FEmvlpoue/5ZW8z5ud8Wperb9HOlWmnqZ+3hH4Vd682A/pC3q/l4wuoq1ryXJzBMQcHgm/hoVGp8Wwe6w30YADNSnSB6ON3OWG5VG4YkDTc/4OBHEMrUsk8W5Y9CPpBIw7Pw40oHjjNeHLISnTm0ibQ/0NPu7xfpEEDKtdeoP4DFEsYd/iPJncjk26N1JqVlE0vtoI2N1H003u64JiTqHTNLzbHXJPcM57e8RzD2tckCb7QcHzOhUEt0Zq6tX8kjPwQYGnsAkIwUcN4Fiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgvAFrIfzy/bBQnMmtEiRElv64HtR6E8NZnvl5uRUKI=;
 b=zNUihnb1FYEOpLf47L/svVa0hP7GOxT/vykUgejpB0Xq+hy2bIJ8ZyW8bIaz3zlA9ihg74/fvLWfAviaE4aNuFh68/jze0kGe1didW7nV42RzwIQ3cVbl2jtvUAXdv34KMfbp02XjO4UjggNRWgca2YNn+t36gHAL27tifb5MBU=
Received: from BN9PR03CA0927.namprd03.prod.outlook.com (2603:10b6:408:107::32)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 12:09:43 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::e) by BN9PR03CA0927.outlook.office365.com
 (2603:10b6:408:107::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Fri, 12 Aug 2022 12:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 12 Aug 2022 12:09:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:09:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 05:09:18 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 12 Aug 2022 07:09:15 -0500
From: Syed Saba kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 00/13] Add Pink Sardine platform ASoC driver
Date: Fri, 12 Aug 2022 17:37:18 +0530
Message-ID: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52eb2764-c06d-47a0-3892-08da7c5b8a9d
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6736:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8sYWhEd2ZgVXUK1baLvl0XcZP78dtq/2KhmH3py5iSXfpWcLrtW+xhWufisu05SA7jFENpDvIV0wc+AF/ekX4fWf+bhQD1AOsKJFL1VSf/6y6KzxL72SpOffoE16UgqzROVn9YiRE9R9quJsp4hymccO4S9V1JtOnOV/kj+Dzdc5KfDTQ6zrza/afKWPSqswr+zRBkmbgS3dXItsvUQ6JR9YPXzwjD6tGet9duYiN/hXKCs7tYHSDxC8t9U3VmX/gBB3JicXYK3muSMnEb38Gg/qM3XpL4i+vzE5W1sMm9SD0bG+4BBDIvOxSHb01npGNa3NxAiWsPQBkemFB0p/YGWsw5z5VAslNfoy4FXspFndWfyi9WFV3c3uXbBdIKQ+kH/o/ZWngACn9cCVhCLbNLpPOZmaVggn9GnZXvwAewVYZ5PwzYKHPUOTWxuipuUTitohrdYHi7XdZj0JC0Xr2MLAcUrc62fO66QyKX+cAt1WVpQnVBa4iWcyC9tK6XQ+Qfx7kDqizeHyhjJeIfrPdxe/yHx3DeKA5w1DthjNaBnVOdLOTF8vIjlGvzymFL2M+bn6Puvag6VBl+0WuIG4ALwvAW95jChh8accwEhfIuoN+fLTmDYNrbC5ZfQgGUI5aUhYATTtmqGdKRHA4BfHQvu7nB8+rkRoeTzMTHhm6cQBFse0Z+Pul4R9lDzXhoJCRjTNiqzAvBhRqn2meWBOVHVUQwEvDsiS4uOvw5ojknegaafZy2kiGMtwgUJ7Q0TiDgq9/jykdp6l5HYyFB14Smyn5zCF1rJ1l5CD3Kh3wXZ1fxD2adVzrs0cC5xoO4hK5kdAeI2uvfPKBDQMyxeSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(336012)(83380400001)(426003)(478600001)(5660300002)(1076003)(47076005)(186003)(2616005)(86362001)(36756003)(40480700001)(110136005)(54906003)(40460700003)(8936002)(36860700001)(41300700001)(356005)(316002)(81166007)(82310400005)(82740400003)(2906002)(70586007)(70206006)(26005)(4326008)(8676002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 12:09:43.5149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52eb2764-c06d-47a0-3892-08da7c5b8a9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 mario.limonciello@amd.com, Syed Saba kareem <Syed.SabaKareem@amd.com>,
 Vijendar.Mukunda@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Pink Sardine platform is new APU series based on acp6.2 design.
This patch set adds an ASoC driver for the ACP (Audio CoProcessor)
block on AMD Pink Sardine APU with DMIC endpoint support.

Syed Saba kareem (13):
  ASoC: amd: add Pink Sardine platform ACP IP register header
  ASoC: amd: add Pink Sardine ACP PCI driver
  ASoC: amd: add acp6.2 init/de-init functions
  ASoC: amd: add platform devices for acp6.2 pdm driver and dmic driver
  ASoC: amd: add acp6.2 pdm platform driver
  ASoC: amd: add acp6.2 irq handler
  ASoC: amd: add acp6.2 pdm driver dma ops
  ASoC: amd: add acp6.2 pci driver pm ops
  ASoC: amd: add acp6.2 pdm driver pm ops
  ASoC: amd: enable Pink Sardine acp6.2 drivers build
  ASoC: amd: create platform device for acp6.2 machine driver
  ASoC: amd: add Pink Sardine machine driver using dmic
  ASoC: amd: enable Pink sardine platform machine driver build.

 include/sound/acp62_chip_offset_byte.h | 444 ++++++++++++++++++++++++
 sound/soc/amd/Kconfig                  |  21 ++
 sound/soc/amd/Makefile                 |   1 +
 sound/soc/amd/ps/Makefile              |   9 +
 sound/soc/amd/ps/acp62.h               | 107 ++++++
 sound/soc/amd/ps/pci-ps.c              | 356 ++++++++++++++++++++
 sound/soc/amd/ps/ps-mach.c             |  79 +++++
 sound/soc/amd/ps/ps-pdm-dma.c          | 449 +++++++++++++++++++++++++
 8 files changed, 1466 insertions(+)
 create mode 100644 include/sound/acp62_chip_offset_byte.h
 create mode 100644 sound/soc/amd/ps/Makefile
 create mode 100644 sound/soc/amd/ps/acp62.h
 create mode 100644 sound/soc/amd/ps/pci-ps.c
 create mode 100644 sound/soc/amd/ps/ps-mach.c
 create mode 100644 sound/soc/amd/ps/ps-pdm-dma.c

-- 
2.25.1

