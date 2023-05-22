Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D428C70BFB6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 15:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A37822;
	Mon, 22 May 2023 15:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A37822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684762042;
	bh=Bn+zEVKvPdXPupDDkCI9WC7aJdrXR/BozMAkTfzeOtw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I07wZcE1UDs1J82P7zfzYyh2ygr/HfSX4WFRheHzfcGRY0IL9bl9XpHPxJffrfFqr
	 Ym0rlp92z835DY4pbqrYDnVYxiMkI2hyQ7UMNIiZbuwb68yWUnrwewgc0KQez9HlhW
	 4e+dHeXHovh0xGgx8mI6tddaSrv3DIfW3y4dXudE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A476EF80548; Mon, 22 May 2023 15:26:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A79BF80249;
	Mon, 22 May 2023 15:26:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAF93F8024E; Mon, 22 May 2023 15:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46F28F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 15:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F28F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rMOCjbX+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFlBv2k86qi0QGU4CzAmDnI6WD+dymDeycXC8vrwbqveFXQY+hPxeDjRRApJOpoaEG6GpngJ3+o0Oa1Y5INiRgIkfgnAXwen14Tw6t76FmVDrZJjpJ2XOcI0kjy0CRVltNt0EGmsKPUd4p1jEfCrXfg41TshZvQ3V+o1sjiut0gAzezl7SByaSYJerMWNifwPhUpcOijQZ7xAmWf86ac1MktQ7QUABM/0ODvCJS3BVivpPFnwborkZKhRy8rzsXZ7dhOMqxM3UsPWKiTLuJz5YrP5nh1ybunYXDtiUlogJtrdso7q9s5Gx+/wRfSmjGXq6I7phBIPTFUQ3ZT6CGT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh6xqbzSR3FacnOqPLbsnN1yS+F2lUixwRaQyKPGqrs=;
 b=clEXjzI6eQIlmF+NyM9Wd7A98ato6rOmskQxJyt8akb6XkDYdArjI9boHP0gOTTT8NXasCcR2bmb8fSpKmR0xnU/WX/01Dt9flkxhtYeKm4+F5pJQxt9ctqtEBQ4C7BvAAObZOj/f6cFD/KKrX1tupGO5dSG7CVTQP6JD64fjM/qMBVGLXNiq+4uYqPIzkomYOb+mg4onwxlLKK2WoBu60DcukPRDlFEOY6T0Ab4dWzYqaKYW3RmFkuXcgCpiqrhfLXaL0xozTPStgGznedXkshhN2hjXOce6J0Mx714IPd+jCxjXmOs/Dltko7f6BOKkgST0u5o71X2o3yFpcxGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lh6xqbzSR3FacnOqPLbsnN1yS+F2lUixwRaQyKPGqrs=;
 b=rMOCjbX+IkYtE/0KmcllVG/CLar+taSz8vWujDW8d5XQet8VtTtf09E8gyrlknmeBIn+hTCO9AMJBRKvPBs8edds/YhVUUbblQWdNT/fjzwdNdTOTJPcxhFcOLCRziNJdWBWVPQrTbKUqdxBtxILqK2EB/7dpMpRG/VdibFm1Z0=
Received: from MW4PR03CA0253.namprd03.prod.outlook.com (2603:10b6:303:b4::18)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:26:17 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::22) by MW4PR03CA0253.outlook.office365.com
 (2603:10b6:303:b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 13:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.28 via Frontend Transport; Mon, 22 May 2023 13:26:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 08:26:16 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 22 May 2023 08:26:13 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 0/9] ASoC: amd: ps: add SoundWire support
Date: Mon, 22 May 2023 19:01:13 +0530
Message-ID: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT005:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e5e279b-c662-41e3-69a1-08db5ac81f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJuuMXzh8VYb2tUwwuovGADwwRNq61EBvK6v9uMAbEzmCFQt85s9m1DYfW69T7QTfGXqywx9OoNuYatPG2beHXjygM4vGs9EIIMHp/70QZVg+S5W8qN8LZ04ApoGCoKaWQ6gOEc9KHx3Hc0kLsCc4iTLMm2rUB4MHRF9TbzqrwRMtYEkjcSemZG4i9IFSg8vvURND0cRZUTb87e/PpKL/8FZnuXh76BMSLgkok48+sUYLxQDxNrr9f5VX/HKzM5nX1+p1iidNrZBAInMps/cFHZ4Zc2Lw+kw+iT2LoZrnkGv4umYNiy6/NymQrleBhoFewF74Ky7L7RQ6x9U9YLswc0CFVxuggqUws1VldrZe9AHT4eFpYd0/ZM6qAMSxlJDaNv2xcP/OfLcpLQlNeB8v2GebCPJkd0WdNa3tUwhripE9YM5srfpxe664sl2ol6kwwt0NjxOP7TtEH5Zl7f8Y6aXfdsRoFKIvc11Q/Gkzjcu1CmtA3TDmUZPOf3XivQhXHW1cUlDYQ4vsuBAZyXv+ZJJKF+9gd8yRD29thwAxYZIpUPtg3ijUXXyDNFdABaL984fsZ+SZIZhjksZFkQ88hDRkROR+tP9sf6AUnyKZbR/cL8wyEY7NyKZsNmIsSoa3anc5etr97T7qrHA6XaaxXnIiD7/1opQXRq9SLF7u43Jo0fDCpAsqveHGYmQhr2xryrSe+2bijeRDTb/xwHDek4ao9lxjedWwX0bARM5F8A3gL9WihBIepm1YXBYQl6ix5aDFSY7nJO02nxVCGYNBw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(36860700001)(316002)(54906003)(478600001)(41300700001)(7696005)(70206006)(4326008)(6916009)(70586007)(8676002)(8936002)(81166007)(356005)(5660300002)(82740400003)(40460700003)(83380400001)(426003)(336012)(2616005)(36756003)(82310400005)(47076005)(26005)(2906002)(186003)(1076003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:26:17.0013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5e5e279b-c662-41e3-69a1-08db5ac81f7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
Message-ID-Hash: C3Y2YMHYSGTHAY5XKHWQZZKQUURJAFNC
X-Message-ID-Hash: C3Y2YMHYSGTHAY5XKHWQZZKQUURJAFNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3Y2YMHYSGTHAY5XKHWQZZKQUURJAFNC/>
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
  ASoC: amd: ps: Add SoundWire specific checks in pci driver in pm ops.

 sound/soc/amd/Kconfig         |   3 +-
 sound/soc/amd/ps/Makefile     |   2 +
 sound/soc/amd/ps/acp63.h      | 180 ++++++++++-
 sound/soc/amd/ps/pci-ps.c     | 396 +++++++++++++++++++++--
 sound/soc/amd/ps/ps-sdw-dma.c | 572 ++++++++++++++++++++++++++++++++++
 5 files changed, 1129 insertions(+), 24 deletions(-)
 create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c

-- 
2.34.1

