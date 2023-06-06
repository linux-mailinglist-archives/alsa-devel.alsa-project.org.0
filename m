Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2155723730
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 08:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380D7823;
	Tue,  6 Jun 2023 08:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380D7823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686031682;
	bh=NnkiC/4E8UNZ1wh3vyXGSH7R70NVkhMAZPq8QjWiIOw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WhSk7TrgGnMPoSEU86NMY6XvC9PyFKQmmow8d6B5fFSJTrSNRicicCkwCq/py3GWA
	 v1seOXAGuzd616f/jZWxB+R3qfLSj14cPSBDqnspakAQA3eqJyctOpj7HdnLQ89gog
	 I+OsTj9cgyfB/Su6gxn8Hbd9o7If9YeK3JuahKqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F33F80571; Tue,  6 Jun 2023 08:06:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA116F8055C;
	Tue,  6 Jun 2023 08:06:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92003F80494; Tue,  6 Jun 2023 08:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 633FAF80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 08:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 633FAF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QrHY6efc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LElmFg04acsNZDbqRnBcgVGUsvRl7HksNuJUhuioUVLvjoA8/KPmiL/95PJL2onqjDx7GIRxsbvJUo1whL9Z3vhi2aif7vrCsb5zFVBMJcNwfYdIw7ch/reiKwgz1MSAMjwlk31keYWuiC2cGt+H1MxdgXRY/gsAXxkIatVQxcNV1mW9RnduOKtVqfPaxeaBr8TO//MFmyaxH0SCKom4u1ohHBAhwX6cKWg7/dXIYYhM9J0PeYAlSE0Q/UuBg59KQYNP8m1AnMYgKulAVpzpR9P1nSYPFltIrYalHopaZHbDNVd0lXr6ETgsaENBfOuLKa+42+OE3FHZNGdJkQiSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EynJSgGPqLwaCpfQCpi26NCueBbHAh7beNg+WWXvT/k=;
 b=mvnvGV+TW4hp3U/CojeYTTA2e4Opb993zkSF/bFNUmsH5uPxlYdeKqYfjUPnQQx34WMscYz9DPn0m7oqMBh9E9pjhheP7i8ggil0EnmNtNJK02kVDl34fU5gMSJUg6udKiNBzeit4NNFk1NO2bDMTqOoq/NSSC0vwitXN81vF+LDmr8ZNvRUDWw2zdnHdTZ3ndBCBKGjZD+xYPvvmhe+VoOyUqBPeqpgg41lS4XKLGUsvlb33MNDS+7ZBS1Ccjx2tVgLxtPunqDJFYBR+LpDNEdsdDTMaUpQ/r1cdglAxWbDx7X4tMSUJrTK+sFn40dq3MGRRu41Z7GfDYuMkXZTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EynJSgGPqLwaCpfQCpi26NCueBbHAh7beNg+WWXvT/k=;
 b=QrHY6efcxagJBai1f/zlap6ma/n11yW3VlTEanp1js9NJSL04mfuR04VJ5CFcN9VcdiAskPFud9qs31TcwzVzGdoOtK/2QnvdY3nKQLJCnsX0uKv2lTxvuA8NHogs6brTng/vugfwyg0j6mn+UlLeWzmzTq4RSRddlHKnk966m8=
Received: from DM6PR04CA0022.namprd04.prod.outlook.com (2603:10b6:5:334::27)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26; Tue, 6 Jun
 2023 06:02:34 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:5:334:cafe::32) by DM6PR04CA0022.outlook.office365.com
 (2603:10b6:5:334::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 06:02:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Tue, 6 Jun 2023 06:02:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 01:02:32 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 6 Jun 2023 01:02:30 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 0/9] ASoC: amd: ps: add SoundWire support
Date: Tue, 6 Jun 2023 11:37:15 +0530
Message-ID: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SA0PR12MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c8e84a-0411-4f3a-40aa-08db66539f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JC4/UGvfT+ZyzUmWdt0DqLdBeJAdfbYx3dzl8Ev8dMJvWhUKzKsFnN5+da/D074kmzq8kC1S+l06ZSZ2hc9aTI3bt/UFz8jXWlWRqW91lq5HtYprWIKk7zYCn213ycVykpTdxe8beO9FE3aaJm9/5Ikl1cL6/zbXrtejHJajOlCR58CXKzY60HcOkPauFm3auXwhauQcmh6wR76ofhQ002cz9hzpWKR/wOTNmkpNndzgYVjHY4TdCSJQ624sjlqaF9fA5y/McxPyJJLTGldP83y7TAEeUVEWqdsy0Lui4ShT2UJ4+wxCIDxiWNQc0EoztQAJcaorE09i2Of7ZyWnZI+Y8H3XbfZjZJeR29gm7HUpOdneULBGz3mMtr1WCyHm/Vt5EMJYajKDQ7dW+4jFKVMH/PfTNYZtq8UtbBQMJPdZrRmEPhwy0pGEXVyBvzZTl5J0Zn44ySCyz0h0+F6lskWOiytu/krJJd6Jizs+XJiGnBMH26mB5ChLvwyktrUWxXSzlTRvR1hkBwAsfi1IK9znlRRDqpp6CXxMBc80Ughgr2mKTCWnil/9Fvjx+QtxXvI0s0ZY3VHNAaIG8BJYIKm7IKHjaz/yAqeys1u89g6zjg4mFJiv6SRf37TlejDIMIS6eX8fpN/YT45E9YtNIAH5rBRp+gL+mLiomKf1/4egwFGZx7WMRogmUgh+E9yFfY3AlEkxPI3niPPTHC2wzxsMQt9AiNssH0tG2u1LZa3mfrjvqv08f8suVgUr9bax1+N1EpkwIRW6GUR7gbUOqA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(1076003)(186003)(70586007)(70206006)(86362001)(4326008)(2616005)(5660300002)(6916009)(336012)(426003)(8936002)(47076005)(8676002)(478600001)(2906002)(82310400005)(7696005)(82740400003)(40460700003)(356005)(316002)(81166007)(54906003)(6666004)(26005)(41300700001)(40480700001)(36860700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 06:02:34.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12c8e84a-0411-4f3a-40aa-08db66539f46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
Message-ID-Hash: WH2IS6R7XRSW7OCPHWXRMOWUVSXKA6QR
X-Message-ID-Hash: WH2IS6R7XRSW7OCPHWXRMOWUVSXKA6QR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WH2IS6R7XRSW7OCPHWXRMOWUVSXKA6QR/>
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

changes since v2:
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
	  driver.
 
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
 sound/soc/amd/ps/pci-ps.c     | 400 +++++++++++++++++++++--
 sound/soc/amd/ps/ps-sdw-dma.c | 579 ++++++++++++++++++++++++++++++++++
 5 files changed, 1138 insertions(+), 26 deletions(-)
 create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c

-- 
2.34.1

