Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44BF72BD49
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 11:55:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D01825;
	Mon, 12 Jun 2023 11:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D01825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686563755;
	bh=147W/qtfnj4R08yNTP5g7wCxvpTNjGQn9OfsgDJR8NI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BSp/AT3utUs5puGsMQnKh2A9cC4HWRYE6sFt+TaW+K8vZor4rOVittDELMca9qEVW
	 wyOVCGRX/9eFtC6KUTGjdQjVzMIkNylzI2FWsr0pTaB3fxmVGTv0k7RvJJbsY4qlp1
	 Uj6EYjd3wx7w0/7aDU4Lb7GvkDIO/5srL48Lce34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2BA8F80132; Mon, 12 Jun 2023 11:54:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 150D1F80132;
	Mon, 12 Jun 2023 11:54:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0560CF80149; Mon, 12 Jun 2023 11:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D900EF80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 11:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D900EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G/JN0pWT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBK26/WtWUE1NZqB2QR3gxKce+7pejQGTDyxiP6fDnUwbGUm8fbZ3JyC2Q/MKbVAsemTwHSGb4Hm2jk54coKyWYeeHPCgpe0EzFDkVNDKWWQydJokmVnT2IE23LZpiAagFOoX/cBWTojSR56bNBBbrIaqUHMfsVNn3r+0SNoL10oagJ+qvGrqtcKBg0PasOBFrOUFK99iiiDNaFiDeBG3TalgjKWwkDGXDlKh2d+49AI1ycTliWIdp0PDuoZL7F5/qKhYzgtj7X+buEBxL2fTKpmwXJNv5w7W40l3kcxf1ssHhVUcjqkgsJOkgPYKUUsTtNBIk6U3kJmohgfW24wGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRF0cqkbpl6N4wuVlQJqSAGPC8GSDnWthoGAzn7PtV4=;
 b=Ezc19VaQ24bSns0uXLEofuELnNL7oiU8n3DNeaVzhf3TN6poVaiNQgMoMKbQabyOB7hX5b1WQ9A869vk9rQDBQX+8bK4yTgOKwB97tZhS/XXz2BwrNfoHws3OM5rPr10QrEb3PQ4bTQZwxgWzAuKLcnBxnJAg3IIzipIN4WaNIFIZlUFiKLzoFvWCkqTKigKCEivbj1m3zMf9MgJnuYJKcbNOIr/7biVw3L+ULqViSmVK1LjfffEf9FQpa/Tc6ZzFgnrrnbj9D926edwoJdPmwZHkOdeFKAbXs3t2Wp02Se3CkIKWRDD5wKSJmNacPPswZJYXE2dk+8CrBjGvekG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRF0cqkbpl6N4wuVlQJqSAGPC8GSDnWthoGAzn7PtV4=;
 b=G/JN0pWTqZ08+m8OJnJBkN0Ggq18ARLpUEb6Lh4WWXv4kMR2jkTLSTVPb+oFcrr6VO+AiO+UgtrRFvtQaaT3V6ND+XbZQ8mQ7le+g8li4TRVce25i/f+DpCiQgf1lRtfVkBNrQQ+3E5Z56qFXIOc3EzVHz7lIofuJ2P43niR3iU=
Received: from MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41) by
 BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Mon, 12 Jun 2023 09:54:20 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::fc) by MW2PR16CA0028.outlook.office365.com
 (2603:10b6:907::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Mon, 12 Jun 2023 09:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.21 via Frontend Transport; Mon, 12 Jun 2023 09:54:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 12 Jun
 2023 04:54:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 12 Jun
 2023 04:54:18 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Mon, 12 Jun 2023 04:54:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 0/9] ASoC: amd: ps: add SoundWire support
Date: Mon, 12 Jun 2023 15:28:54 +0530
Message-ID: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT051:EE_|BL1PR12MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 92518109-e6f9-4413-dd75-08db6b2afdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	18ePHwc+qC9ZVdptJ17db84L6rq95kiHdB9haY+zd0aybV1sc9DEa1MWv8MnJTFNw3BYlJoac1WGNsRY1ly8eFFuk8CC/ueeujcDCiDO9obLOFBIurJAWKZDbqH5RKMBsnXzHRkWBhydFQia5cqf4lHgowTGg1qx3TRh0QuTSds9yN49/bC897QfIZFG8qJKoruc2WuzU3xNV19Vew+gb/txHv6WG13tpZp0nzgcZOFSg0O7W4/cIzeQxSXY3pgYFBDEMz+gZXDX5RTWCgJIbovEGsamo+I8RCPUvglZXwVkvbex5ecDh1QpWQhKh0blDd8znAHSPaDjpvaGIwiFfqaJVCquiHCSfeKf5ozOjlrxFPYRuBTae2myAN3nD0o6w7AxE/RgYLHUIBAC5VOevMLYa5uHq7WGZ1GTIAY4uAFx+Zw8Bfr4a1mWiBdgvQi66ajtpu5NxjG3DrSuSiDEs1REGGFyWDq2AvHfbfiwUkGuQFjWzj5AOWUc6heDmNnpFwcnNbm+N4EOf5HlT3NOcxneRi/8zPolDfLL5KXyJF2I0BFyke6Taop2aWHvZIBydoFJfHrWnxCjhlneIbStqHHiW7G8vVvheanTxdeI8e6q1I9fd33C75YFy/mHugmul54pkYRGl6XfQFPJOEusQE/YxjvRGJ95V+11K2bVilxvrivYL0qjSiv2mspYQ/+DniWDbRVoTSIcXPPjs9YCJ8nQ/mBjU9wo44d32Yt7khJqBBKcR29cOKHNX71Ke9RGaECiS0H8xAP5p+TteKqaDA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(1076003)(26005)(82740400003)(83380400001)(81166007)(70586007)(86362001)(40460700003)(36860700001)(36756003)(316002)(2906002)(8676002)(186003)(41300700001)(5660300002)(2616005)(8936002)(40480700001)(82310400005)(426003)(356005)(4326008)(6916009)(70206006)(47076005)(6666004)(54906003)(336012)(7696005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 09:54:19.2314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 92518109-e6f9-4413-dd75-08db6b2afdc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850
Message-ID-Hash: IWVIXFH4YHANITXJAXATDRCV7YJ4YASD
X-Message-ID-Hash: IWVIXFH4YHANITXJAXATDRCV7YJ4YASD
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWVIXFH4YHANITXJAXATDRCV7YJ4YASD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series add support for
	- Platform device creation for SoundWire Manager instances and
	  PDM controller.
	- SoundWire DMA driver.
	- Interrupt handling for SoundWire manager related interrupts,
	  SoundWire DMA interrupts and ACP error interrupts.
	- ACP PCI driver PM ops modification with respect to SoundWire
	  Power modes.

Changes since v3:
	- use pdev_config instead of pdev_mask in the code.
	- define platform device configuration macros rather than enums
	- add comments for MIPI DisCo version
	- refactor SoundWire DMA start/stop sequence using single
	  function
	- refactor "acp_reset" flag related functionality.

Changes since v2:
	- add comments in irq handler.
	- remove workqueue for SoundWire DMA interrupts and use thread
	  implementation for DMA interrupt handling.
	- add error checks in sdw_amd_scan_controller()
	- remove passing "acp_lock" as platform resource for SoundWire DMA driver
	  and PDM driver.
	- retrieve "acp_lock" reference from parent driver directly and
	  use the reference in SoundWire DMA driver.
	- add handling for acp pci driver probe even when no ACP PDM or
	  SoundWire manager platform devices created.
	- Fix indentation for acp_sdw_dma_count structure variables.
	- Use macro instead of hard coded values for FIFO offset and PTE offset.
	- Change pm_runtime enable sequence in SoundWire DMA driver
	  probe function.
	- Refactor system level resume callback in SoundWire DMA

Changes since v1:
	- update "soundwire" as "SoundWire" in code.
	- add comments for platform device mask and platform device
	  count
	- remove unused variables in acp pci driver private data
	  structure
	- refactor dma enable register structures in SoundWire DMA driver
	- add TODO comments in IRQ handler
	- update IRQ mask values using bit macros
	- Fix build error reported in Makefile
	- rename "sdw_dma_stream_instance" structure name as "acp_sdw_dma_stream"
 
Vijendar Mukunda (9):
  ASoC: amd: ps: create platform devices based on acp config
  ASoC: amd: ps: handle SoundWire interrupts in acp pci driver
  ASoC: amd: ps: add SoundWire dma driver
  ASoC: amd: ps: add SoundWire dma driver dma ops
  ASoC: amd: ps: add support for SoundWire DMA interrupts
  ASoC: amd: ps: add pm ops support for SoundWire dma driver
  ASoC: amd: ps: enable SoundWire dma driver build
  ASoC: amd: update comments in Kconfig file
  ASoC: amd: ps: add acp_reset flag check in acp pci driver pm ops.

 sound/soc/amd/Kconfig         |   3 +-
 sound/soc/amd/ps/Makefile     |   2 +
 sound/soc/amd/ps/acp63.h      | 172 ++++++++++-
 sound/soc/amd/ps/pci-ps.c     | 419 +++++++++++++++++++++++--
 sound/soc/amd/ps/ps-sdw-dma.c | 555 ++++++++++++++++++++++++++++++++++
 5 files changed, 1115 insertions(+), 36 deletions(-)
 create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c

-- 
2.34.1

