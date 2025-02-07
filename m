Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD456A2BB5A
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D9CE601E9;
	Fri,  7 Feb 2025 07:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D9CE601E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909769;
	bh=+mBpLmycUlCfiitKjl6a76EezUY/iCs1larNWMf4yAU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qJhEELHy8tM5Eb55IM2v91uE51WwxUGEGwks0gmZ6EylXRxqU9F59fx2/3tlwRBw2
	 8pTlIbClW1HyciOafrSwcF+QQHQaAMzlMxqfAsPdgHMlmtorwloud6aZ1vlio+DTBn
	 +oiW1fUUV3Hy37ZN3LLOuzlWyHRt4IwTNfts4F/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32CBFF805BE; Fri,  7 Feb 2025 07:28:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12522F805AD;
	Fri,  7 Feb 2025 07:28:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CAA9F8025A; Fri,  7 Feb 2025 07:28:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DBACF8013D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBACF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rVAXS3gC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pz2CD6WoE4aRzDAIt9Zmzx3QXYG9/MarE/LrbdCiGzU0UXnJRnbR+hRQ2uL6Gpuqsc83d7YuNvc8MQXf57P28ImK27xbrzQt3gBEbqMs8ic/X0GODME0JFyQc60s72OT9KA2jHDaX8/5AxHwiw8FlS+KMTryPhB7PJUv+UZ/JvNAHijTKSfK/JuArWD666e/vc4ZrKJZLCTp46opRz7Bw960SL2yxOvgdUf51YeeO4iUkxf2WCQRAcn0CfGCaBsD7QST56UR4PQGPYtk94JtP968AGHoku956Y5v2yi976AjMsn+oORCNDX6KFt91GItAITsYDWhmYFZqicLosnJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AILZHYnDRap1QlBVOCcw6u3XoWsy+6XgVuiV9lyYLEg=;
 b=rdIneGapz0JfFPo05vQwDNsR79MSOf7osCxDdZGS/JC77iFxBp656FA7eD55oKjAMItuuGM9l4RYwZ2fv5JGUvWuWyMxMhGX3esFkNO11VwKrb8dtVfFLH3G7zGaMuKQMKvzejyh5Tk2ZmJE4IdpcMDDsrv9j8wzFcIwy6lttHO9Kb5wAhFKoEh1Eg7R160HfyrVrAdyzxY302WdZtojdqJc9nujFDSZxCo16uh/26sVuGxz+pTsHK6yR9WxeCdli9AxzldvXOWwhTWnnAdn/Pb7N2yvK1YtpfrW2igz5sD4C6JbMB8agt+JGtRsy2b622+igizxMDhgcn0m8WiOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AILZHYnDRap1QlBVOCcw6u3XoWsy+6XgVuiV9lyYLEg=;
 b=rVAXS3gCeIMYAHUpMy/1G6t2fRemZX209Ke1CdCM5fa7sJ2CGioJLRSZKFc2AspAZBUfwbCoJHtADFBXZtHZMXAx+eZOOKPrfcbN0S3fctVZlqU6S1w7gGWadA2+7Dcq5Zvgjar7gYUtfZxCCsq8L+nMX3oTojyILHRzpQZeSNU=
Received: from BN9PR03CA0047.namprd03.prod.outlook.com (2603:10b6:408:fb::22)
 by PH7PR12MB6833.namprd12.prod.outlook.com (2603:10b6:510:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:28:35 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::7b) by BN9PR03CA0047.outlook.office365.com
 (2603:10b6:408:fb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:28:35 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 00/25] ASoC: amd: Add support for ACP7.0 & ACP7.1 platforms
Date: Fri, 7 Feb 2025 11:57:54 +0530
Message-ID: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|PH7PR12MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: dad95438-33bc-4d08-d467-08dd4740a678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MpkWGoEtRxWJtECSlzTPTMOHrWkUxKzN8sEWAoO6KPLOsvYmYXgXini3lR4f?=
 =?us-ascii?Q?xcyad/Mz1+pj3baiI8fS79jVCIxLa+Uq86aBy8P2tUl2fadnmH5ev4FBA2Mb?=
 =?us-ascii?Q?cQtdOzkmYqo+5ClYvrJA+Ud3KrzlCvSRybgfk0VSq5c8lcRvi9hN+uc2szpj?=
 =?us-ascii?Q?Pci+JYAf5e/O4D+exlo+QQsn2Z6KwpC/9LfyLoI6kt6272J2QDO/Dv1zL9K4?=
 =?us-ascii?Q?lcmNvnStWtxcyDYChz3d1pKjn7J8gaU2SaUdSE44jP3DzS/Wju1sI9xkDZHc?=
 =?us-ascii?Q?NWdTwu+ZawmRZYKFXGhdhkQVfCc3g4wYoLWMOKmwn89K57oPNjavSsosOJLP?=
 =?us-ascii?Q?71ZI1Ra2BlDw8Qvr/Y/IEzvkwVJe1tyxzpwztb52YqfvdEzAOm4O93qvGS0b?=
 =?us-ascii?Q?MmoRw8Qbh3/ARGQJPgGnfjjIsHVQ46FChCURDBmGeFRuwID5C5MuG9+7/998?=
 =?us-ascii?Q?xYE2i4Ibm6qyCBMEtSi6EaqYTwydmDXOdg7eyiC2Lu2VlHJlEfbXIrh+tWIe?=
 =?us-ascii?Q?AsmWaUO1nGDOKcr+r+9sT4YAygSKgo0Y4enGFbNilpq9lGrGLqWc3gnU6891?=
 =?us-ascii?Q?OYCVKnclijHgSVUU5gvGrizpWwAMXu+dbv61zpYWZ6PtMKY/zIRSweIqKK5a?=
 =?us-ascii?Q?lKMf8vCKBBrdXnNypOwi8JZEo74m0Xo4rgYJTsc3gGKS28bxdAfzZJEpF3QK?=
 =?us-ascii?Q?eioywRFPTaU96ow6SWWWbIOAkcqQuC1P+U4H7RtPiPAkTe4fuJZvpQXAfk6N?=
 =?us-ascii?Q?wUKYdjdTwFk47QS8iPFY7rM9vljiMb3AmFQErV9dQpuk9y1lHQ+z//KCqTZ0?=
 =?us-ascii?Q?OebxSSZio9EbDnBMAuQbmQrz2OYNaEb2BqSiI6uPhEYRLHmGw5252lCangnl?=
 =?us-ascii?Q?ut3KVr4ZRleXH2az+OO2rDoTvjoQY5s+btils4AsY6rnf1CrCIZGfYFiEVeo?=
 =?us-ascii?Q?hc5CTLuyH/rucXSx0yVobAmHAFEB9XTHmqC3gA8hVQzNwhefDsio+YY2JWg/?=
 =?us-ascii?Q?D7zMJchfYWMs7PQKAETOSaeEN8/LsbOIt02KwqxJQMIPo+l6aNCtmSK499Sx?=
 =?us-ascii?Q?GKVbYhGb2peDeo8jZjprRej1q2ATAkXJP5P8h72mfAVKukK2elffTeCqw9F6?=
 =?us-ascii?Q?iBX69Duy3q8+tbv8vulwKPT+JeTSJiw+XaRl7NB1+ybrf3+uv1xEVbx8z66t?=
 =?us-ascii?Q?PN8NRXua5o6pyDPzr/7eR3ntZ+9mwFDspZ2J6lQObu/DqCZuzjcDWFTKVDEO?=
 =?us-ascii?Q?q7QizVRiYflMJv78Tvttk2b5zxhCNpSh0us53CiqnX4/qrW4EITm5aFrrwZo?=
 =?us-ascii?Q?LDhUW0Jc+hy1jMbKAwjTmPkUmz1fiAlqwHEeMBLvBjt1rJNW/z/dmUZScPdb?=
 =?us-ascii?Q?KrcExSJcwnJFazjYsFDhco6Sjp850MoscjyUFFjQXyqlLE72yfRxYMel4Osl?=
 =?us-ascii?Q?EgOzYSqZ+vSkwzlxVOP00MuuBS7682yHfrurRGtojYta9hHFW+CXw52Cin/V?=
 =?us-ascii?Q?HqQCKjCdRqBtlOk=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:28:35.2269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dad95438-33bc-4d08-d467-08dd4740a678
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6833
Message-ID-Hash: BUHKEVGCDGABU7GJ7KOMIOSSYKOA46TT
X-Message-ID-Hash: BUHKEVGCDGABU7GJ7KOMIOSSYKOA46TT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUHKEVGCDGABU7GJ7KOMIOSSYKOA46TT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series includes the below changes
	- Refactor existing ACP6.3 platform ACP PCI driver, SoundWire
	  DMA driver code.
	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
	SoundWire IO and ACP PDM controller combination.
	- Add SoundWire generic machine driver changes for legacy stack
	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.

Changes since v2:
	- As per Mark's comment, to avoid code duplication drop separate
	  folder(acp70) for ACP7.0 & ACP7.1 platforms and refactor
	  existing ACP6.3 platform ACP PCI driver, SoundWire DMA driver
	  code and add support for ACP7.0 & ACP7.1 platforms.
	- Add ACP PCI driver hw_ops for ACP6.3, ACP7.0 & ACP7.1 platforms.
	- Implement platform specific code in Soundwire DMA driver by
	  adding acp pci revision id checks for ACP6.3/ACP7.0/ACP7.1
	  platforms.
	- Refactor existing ACP PCI driver Interrupt handler code.
	- Add new Soundwire machine for RT1320 Speaker + RT722 multi
	  function codec combination.
	- Add machine driver quirks for Dell SKU's.

Changes since v1:
	- Change the code sequence for handling SoundWire wake interrupts.
	- Add new patch to restore host wake interrupt mask
	- Add new patch to enable ACP PME during ACP init sequence.
	- Change ACP PCI driver PM ops code sequence.

Vijendar Mukunda (25):
  ASoC: amd: ps: rename structure names, variable and other macros
  ASoC: amd: ps: use macro for ACP6.3 pci revision id
  ASoC: amd: ps: add acp pci driver hw_ops for acp6.3 platform
  ASoC: amd: ps: add callback functions for acp pci driver pm ops
  ASoC: amd: ps: add callback to read acp pin configuration
  ASoC: amd: ps: add soundwire dma irq thread callback
  ASoC: amd: ps: refactor soundwire dma interrupt handling
  ASoC: amd: ps: store acp revision id in SoundWire dma driver private
    data
  ASoC: amd: ps: refactor soundwire dma driver code
  ASoC: amd: ps: refactor soundwire dma interrupts enable/disable
    sequence
  ASoC: amd: ps: rename acp_restore_sdw_dma_config() function
  ASoC: amd: ps: add pci driver hw_ops for ACP7.0 & ACP7.1 variants
  ASoC: amd: ps: add pm ops related hw_ops for ACP7.0 & ACP7.1 platforms
  ASoC: amd: ps: add ACP7.0 & ACP7.1 specific soundwire dma driver
    changes
  ASoC: amd: ps: implement function to restore dma config for ACP7.0
    platform
  ASoC: amd: ps: add soundwire dma interrupts handling for ACP7.0
    platform
  ASoC: amd: ps: add soundwire wake interrupt handling
  ASoC: amd: ps: update module description
  ASoC: amd: ps: update file description and copyright year
  ASoC: amd: update Pink Sardine platform Kconfig description
  ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1
    platforms
  ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
  ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
  ASoC: amd: acp: amd-acp70-acpi-match: Add RT1320 & RT722 combination
    soundwire machine
  ASoC: amd: amd_sdw: Add quirks for Dell SKU's

 sound/soc/amd/Kconfig                    |  10 +-
 sound/soc/amd/acp/Kconfig                |   1 +
 sound/soc/amd/acp/Makefile               |   2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c  |  45 +++
 sound/soc/amd/acp/acp-sdw-mach-common.c  |  34 ++
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 160 ++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h   |  12 +
 sound/soc/amd/mach-config.h              |   1 +
 sound/soc/amd/ps/Makefile                |   2 +-
 sound/soc/amd/ps/acp63.h                 | 246 ++++++++++--
 sound/soc/amd/ps/pci-ps.c                | 422 +++++++++-----------
 sound/soc/amd/ps/ps-common.c             | 475 +++++++++++++++++++++++
 sound/soc/amd/ps/ps-pdm-dma.c            |   6 +-
 sound/soc/amd/ps/ps-sdw-dma.c            | 375 ++++++++++++++----
 14 files changed, 1440 insertions(+), 351 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-acp70-acpi-match.c
 create mode 100644 sound/soc/amd/ps/ps-common.c

-- 
2.34.1

