Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572581AF80
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 08:37:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D87483B;
	Thu, 21 Dec 2023 08:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D87483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703144230;
	bh=AeEkdijI1bX+vqgktz8PaVL+brzfzs6GIQ1by0yz5+M=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HZUI539iI1KUBXYPtsCX/lH1mKwR57o0QLRPHBhytdgBhKp6nHKWZxwwDVxK90Tyi
	 JTcKaqrJyjsTfX8V63UdrLy9F3fBhFWrBKFynqD89NruiaNrwmXKKFyMIyXYWoaKkT
	 L20QfecGkGTuk5Pnnn3sp/k1vtT35TPf1NichLXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11703F805B0; Thu, 21 Dec 2023 08:36:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA478F80578;
	Thu, 21 Dec 2023 08:36:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B9CF80212; Thu, 21 Dec 2023 08:36:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24743F800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 08:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24743F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aH0T7KuY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbfUIpFFUtIs5xW5Ok6V18CuueKaPUd5NKC9K7JKdghbbKoEQY3GiVR/95zc1slPXePznz7iMeckMwfmOKnr8ObBROJi7fTurvUQTboVn+TN+d8tqUdQdyeUEFwMu2r3k3TkeNI/1IRqy4t9R5+skECp/dCdvDseUU3Wk60Rgjt/nxRyM1zUM+BzoJoaEDdZgveEPYhNmdVnwPdncPl1zIWYesGhh14LU6KN6X8scUxXmH1S+FaKLETXdyNDtmExDS+ZnJfWGA98vZK/TuNQ3nR8m5ZYUxKxQKF+YGrQfNd7g+LKJ/IoTI0UvvfdUwKru4fEW3X9DBd+hgSdnCOCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vca3yDqby2TY6rqseptrPH1KxuJVClqmJinQ2oxtBYc=;
 b=nb6Z6KtK0i/4yJEd+Yqv0ReQxCCo7/HdmayBHdXoXn7lR3YO0MYg42Hj2/ijhB1KkShLopD6tIkwjPlgrCCOimV1+jPbWmMae3uqcPohcg+lWO01ypGIslE/1n6XE9nLE0aEJSi5w8ostz2Kpfj8cnafvz/Zzp9zX1ZHrwJdg9ueOcISpmyLWfa53Uu6d4Dlh61NtEEkJrpV8BrsIR/k373s0dkmJpjjcIu/Ba85a1YDAA80myzrn8E49fM75MRyCMMJOfnt0I3lATu3+xmbAup9T9PW3fsQmVKuF5WDWzK73VC1InVdyVGpkboDCeT9NfFLXakvTYUGOYpLmmRSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vca3yDqby2TY6rqseptrPH1KxuJVClqmJinQ2oxtBYc=;
 b=aH0T7KuYKSyyzzEtAgHI3d0yz//+FQqNV/9fdoKYkhowkkx6c2yPcSOoL7C+LixSH43mKioWaO7lyZy8T8Cx/vdSejxWdr1EyeanO1p42xJQ7/MNbEAnP0Al37Vy/mUtlIfowUjqrLGCRJVCZ/w2t7bXPl0Eak5SojTjuPLLR7I=
Received: from CY5PR18CA0041.namprd18.prod.outlook.com (2603:10b6:930:13::19)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 07:36:02 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:930:13:cafe::da) by CY5PR18CA0041.outlook.office365.com
 (2603:10b6:930:13::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Thu, 21 Dec 2023 07:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 07:36:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 01:36:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 20 Dec
 2023 23:36:01 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 21 Dec 2023 01:35:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <pierre-louis.bossart@linux.intel.com>,
	<vinod.koul@intel.com>, <venkataprasad.potturu@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH 00/12] soundwire/SOF: add SoundWire Interface support for AMD
 SOF stack
Date: Thu, 21 Dec 2023 13:05:46 +0530
Message-ID: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: c046669d-5621-4751-8f4a-08dc01f77be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nyZvR4orLMWAE+b58huy3ni8hVAyalsaGahU2BZ7DHpIKNSG2anaQzYX079S4grgIjLpSpcv3EBE9UrPu65/1qTDpcpUYtYCn/LCACQUYx3b5NgnU8TLscOyS4+YOWpw0Cl9Q4do35h8pJqlQrTV8n2mh+MsQ/h8c4NaON/RfS9rgoijiwcu8H0+WWzRdnH0y/hoQl+qD96f4PHyElwoDgJwXvPMkOGTdcMDheHTCg7JqHvmWc9vaE5b02n2kI0RteIFQvB+m2jl7eSY8ED9osA3McpEO/j0xQc2B7c4/oLScEkj67k/jwLcRlBar/bsXlSVe/BRKl6FtQhdw7l9KBmKytyZxfjcYxSb+HzL0SqOlyK0WKXYFQnA0FI9P75El0zfNMA2VuQzBWg3rZVQaqLTsWvkSIUc3ZFGEHhgE0TyOS1NMVHqHHoUdaHhNO5VRMOdouYGfMNsMQUDe7Y/hE9woAXFOFQeKK0Z61y1ga0EVGyYSeDU0Pw6TChjNPk+DhvMUdKF6UJUU3ReK3FPyZdPJA2pkM+rSAV84Vs0T74SI8oTMtbBESQamCPu92Ts0ZvAls69IzP5DBqUSautIaZBI6mDBWZu037m+9O69fFhiErHRIj8Lks1YEJsnpn29oZbnvFKm24TmVhVQlodplYW1BCGiok21kq+p2L+fpnN6f83zr6K+DdQqaRKO/K481WNMXhCbUnwWpDzl65Bg2m3nRYX7jQj9hOMC5cCQc+GO8w4NqSAM6E5747ynHk2YEU35hcSI6vLOyJrgMjJBw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(36840700001)(40470700004)(46966006)(110136005)(70206006)(70586007)(40480700001)(54906003)(316002)(8936002)(8676002)(4326008)(40460700003)(81166007)(336012)(426003)(47076005)(83380400001)(26005)(1076003)(2616005)(82740400003)(5660300002)(41300700001)(36756003)(86362001)(356005)(7696005)(6666004)(2906002)(36860700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 07:36:02.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c046669d-5621-4751-8f4a-08dc01f77be1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
Message-ID-Hash: HCIYFFFPSKAUOWVI7M7QPZR3AUEP6DVI
X-Message-ID-Hash: HCIYFFFPSKAUOWVI7M7QPZR3AUEP6DVI
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCIYFFFPSKAUOWVI7M7QPZR3AUEP6DVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to redesign existing platform device
creation logic for SoundWire managers and Implement generic
functions for SoundWire manager probe, start and exit sequence
which are common for both Legacy(NO DSP enabled) and SOF stack,
and add SoundWire Interface support for AMD SOF stack
(ACP 6.3 based platforms).

Vijendar Mukunda (12):
  ASoC/soundwire: implement generic api for scanning amd soundwire
    controller
  drivers: soundwire: refactor amd soundwire manager device node
    creation
  drivers: soundwire: implement function to extract slave information
  drivers: soundwire: refactor soundwire pads enable
  drivers: soundwire: refactor register mask structure
  ASoC: SOF: amd: add code for invoking soundwire manager helper
    functions
  ASoC: SOF: amd: add interrupt handling for SoundWire manager devices
  ASoC: SOF: amd: Add Soundwire DAI configuration support for AMD
    platforms
  ASoC: SOF: amd: add machine select logic for soundwire based platforms
  ASoC: SOF: amd: update descriptor fields for acp6.3 based platform
  ASoC: SOF: amd: select soundwire dependency flag for acp6.3 based
    platform
  ASoC: SOF: amd: refactor acp driver pm ops

 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/amd_init.c       | 235 +++++++++++++++++++++++++++++
 drivers/soundwire/amd_init.h       |  13 ++
 drivers/soundwire/amd_manager.c    |  41 +----
 drivers/soundwire/amd_manager.h    |  12 +-
 include/linux/soundwire/sdw_amd.h  |  79 ++++++++--
 include/sound/sof/dai-amd.h        |   7 +
 include/sound/sof/dai.h            |   2 +
 include/uapi/sound/sof/tokens.h    |   4 +
 sound/soc/amd/acp/Kconfig          |   7 +
 sound/soc/amd/acp/Makefile         |   2 +
 sound/soc/amd/acp/amd-sdw-acpi.c   |  62 ++++++++
 sound/soc/sof/amd/Kconfig          |  18 +++
 sound/soc/sof/amd/acp-common.c     |  65 +++++++-
 sound/soc/sof/amd/acp-dsp-offset.h |  10 ++
 sound/soc/sof/amd/acp.c            | 202 ++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h            |  26 +++-
 sound/soc/sof/amd/pci-acp63.c      |   7 +
 sound/soc/sof/ipc3-pcm.c           |  25 +++
 sound/soc/sof/ipc3-topology.c      |  40 +++++
 sound/soc/sof/sof-audio.h          |   1 +
 sound/soc/sof/topology.c           |   5 +
 22 files changed, 798 insertions(+), 67 deletions(-)
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c

-- 
2.34.1

