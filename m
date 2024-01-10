Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C98829695
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 10:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C9C9E66;
	Wed, 10 Jan 2024 10:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C9C9E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704880237;
	bh=w02X0wn8xs5RY26hGNTLICG7NbCX4/tAts5dJZcUXcE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aR3wJ/PXKLsMBRx7N7ReVKsdg45DSygVigTxaAHLhtHgJnLUthBxi+OESXDo/SOV3
	 KSFn1VEPQqYt3ON5CyCM5c72ejYmyAxcAhcfJk2vas5R9RNN3eN+c+iF+n3J0D+57M
	 U21nCU+d354t57FOe3LKmy48873uk9g16eTxyfro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52879F8057A; Wed, 10 Jan 2024 10:49:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F8C9F80602;
	Wed, 10 Jan 2024 10:49:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EF05F80548; Wed, 10 Jan 2024 10:46:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C598EF8014B
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 10:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C598EF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4B++PpZk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIoAX1mw2R1eErN91DlGEY0SmkcqooNhwdCa6tvZlAxjWb/FR6f7QrJTrRVYgVgtQg90rsdIuI5p2oSoS1EtLU+UopnbwxBiodNVLlHHhI1jMNdxaEVBskseSAjurddAKJayl1s64lxPrSWQ99kmu5xdyq/i5P2J3KUPpxBJxC2oqZVqWXkpxBW3+C8oJisVF40YANcndgK4eqRl68/C2Q/2MrJaYv85Yg7dKymmZ7vPCLgHVnmvvsY6tvkaRn08BTdrAfYxhzwe0KA47SVVZamvRZQHnk+eU1IGzlXX4mX4bk2TWM7Yu205Xd5Hzbwuz/1fm6WkhAdUGx1NavmlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIO9cVwFVtMiWfvHoN0EgCrh7uJQ0WUSPX88GKT7QpY=;
 b=mDraEykxhcGFo8gKJ3LzBT0RVolZMjzONA39PzU6l+rojG88kCKYeB8B3NfOyb8/wp4PSD9IazLn1678IA78v5TDLIcv6gF6/+TYpBnybsNlsqAwbS4Wd6KSca1rbOWNatoqU+QNZRMHtj6Scv4JFleIsny2SQX5vmz+kd1RHjqnGUJ1VKxwsPKjt07PnD6xPq4jgLh+u+kxpdcx+JeNGPdLv1E4fydgl4j7bGAj3tGj4K3l/uogDqsCyXynTcwAUjP7hF/m1oXqc7RSXUozXsYqtFyv9l0CT+CitcGZMCDwMh9DE5EIE+LyWdXR+PWLsEyZ80GFqlep9ghO9E/NIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIO9cVwFVtMiWfvHoN0EgCrh7uJQ0WUSPX88GKT7QpY=;
 b=4B++PpZkv3GHoI5aFJ+f1j8CMCjOy//M/xKlfYqTTdo5qDDK5D7X320R22eGG9TA0Ti+6PPUJqhWOaUNYIl6LAwPGHgU/822qim8v8+deDvzcuJ8iHBgkqD3VSrwRre4B5JqWG4tXHIaJKrNTeQlF3XsV2CG54Gb6MDHeWn3/nc=
Received: from DM6PR01CA0004.prod.exchangelabs.com (2603:10b6:5:296::9) by
 SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.24; Wed, 10 Jan 2024 09:45:06 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:296:cafe::6a) by DM6PR01CA0004.outlook.office365.com
 (2603:10b6:5:296::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24 via Frontend
 Transport; Wed, 10 Jan 2024 09:45:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 09:45:06 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 03:44:58 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 10 Jan
 2024 01:44:45 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 10 Jan 2024 03:44:42 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 00/13] soundwire/SOF: add SoundWire Interface support for
 AMD SOF stack
Date: Wed, 10 Jan 2024 15:14:03 +0530
Message-ID: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SA1PR12MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: c741c8d4-8daa-4b68-ab83-08dc11c0d3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q8eoHj3remrA4pZqwrtuyT9Cx5Ywx0Koyy4ScdwfixVo1Ds7EtFuCAzD7l3na7re5NAyLNGS1/ybNvnkQl/xe8r3E93XsOjLHZ4hatW5+7QSkrEPg/o9i6ltz93FjP+QMf46Su2DVY6p9vokYvK8zIAudvr5Ji31vCl7ogQmJ93JxAoUj+MCZbWAjUI9saCa52yStecucz0k++bFF3+6vGOsKycvRKY/DhzdXI0juD4OI9cfGjTwMIUBhFfNbxaO8cMr/u3eqRwGv1ITgMNo9j5Yb1HoCcugNrAQqAE8qX8C7ouptkssk5Ry5WnQAoE9yba76PG3lvtUclbeBxXpesgx53IQElKKnBCfjHiPZkcCJTiejVlZ1ntsAsEGZqB7bSpHtEds1AWK/r0MuzUEhTnDtXyL/LaoHKIKSbghtdO/MU2Rm9k/uL5aoewSZ71PgpDSGVlhp8PPAtiJ2Tq8CwF3VlU5VyOEJ2T9t4Ae334MCq5YuHCihmzNFNaaTcHmWp5agdRZbyFd5gHxariadcceezTK4hLxm5EuD1RHeIQVFZTonsvmkqgww/IuR44DCtTR2aIJk4sD3Ml5JXB+c9xcxINkfjfs64IXDzdLa3oGIXWkEymuirANCmiIWouKCFubQonuP+sKVkgSg1cCdUfVKWdTamZq+ZSqRE1dblUSmzC74BJIsffvSfMDLhVKKQ6Ki8+B6nMQsOChlP/d/nLJBvNnoH4xoThxVTOne6b4h8giH105iWxA4VEk1p1f
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(40470700004)(46966006)(36840700001)(478600001)(36860700001)(966005)(5660300002)(6666004)(7696005)(86362001)(2616005)(8676002)(316002)(110136005)(41300700001)(54906003)(70206006)(70586007)(36756003)(47076005)(82740400003)(83380400001)(426003)(1076003)(336012)(26005)(8936002)(81166007)(356005)(4326008)(40480700001)(2906002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 09:45:06.1375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c741c8d4-8daa-4b68-ab83-08dc11c0d3ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246
Message-ID-Hash: AKL7MYUXCUEHDUQJNQIV5UZTBA4IL7CA
X-Message-ID-Hash: AKL7MYUXCUEHDUQJNQIV5UZTBA4IL7CA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKL7MYUXCUEHDUQJNQIV5UZTBA4IL7CA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to redesign existing platform device creation logic
for SoundWire managers and Implement generic functions for SoundWire
manager probe, start and exit sequence which are common for both Legacy
(NO DSP enabled) and SOF stack, and add SoundWire Interface support for AMD
SOF stack (ACP 6.3 based platform).

Below patch series is reviewed in
https://github.com/thesofproject/linux/pull/4699

Changes since V1:
	- add new commit to update license for amd soundwire manager
	  driver files.
	- wrap the commit message with in 75 characters.
	- add amd tag in commit title for soundwire patches

This patch series has dependencies.

"drivers: soundwire: amd: refactor amd soundwire manager device node
creation" patch has dependency on below patch.

"ASoC/soundwire: implement generic api for scanning amd soundwire
controller"

Similarly SOF patches has dependency on Soundwire tree patches.
This patch series has to be reviewed and merged in one go.


Vijendar Mukunda (13):
  ASoC/soundwire: implement generic api for scanning amd soundwire
    controller
  drivers: soundwire: amd: update license
  drivers: soundwire: amd: refactor amd soundwire manager device node
    creation
  drivers: soundwire: amd: implement function to extract slave
    information
  drivers: soundwire: amd: refactor soundwire pads enable
  drivers: soundwire: amd: refactor register mask structure
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
 drivers/soundwire/amd_manager.c    |  45 ++----
 drivers/soundwire/amd_manager.h    |  14 +-
 include/linux/soundwire/sdw_amd.h  |  81 ++++++++--
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
 22 files changed, 802 insertions(+), 71 deletions(-)
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c

-- 
2.34.1

