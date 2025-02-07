Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A364A2BB8F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:35:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F72560289;
	Fri,  7 Feb 2025 07:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F72560289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910101;
	bh=/J0SciXYSk5Fz5CkhnF9pUTHtJIBJ9PPfSHjGlFrTAg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bhE5ZZtrs4N5IpwqmMxO+5Sq9FLzsRrYiAhJXuDzTGMRuPOGdGPTUUX13jjUbFmI7
	 L2SfoBE3q4hLi+AHXj1iKzVYNkstS/3N3sI/DFuGsGMlzb5uU/MXeeRN6NwhdsLeBd
	 oAqwvUfTlAmXmtFU0FTHKJPo5zGNt/ZPolyp2MyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62C40F89633; Fri,  7 Feb 2025 07:30:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34523F89671;
	Fri,  7 Feb 2025 07:30:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 482DBF80636; Fri,  7 Feb 2025 07:30:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DC80F80C70
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DC80F80C70
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xHYkLEY6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEoXOx53ca9F6wgoxHwdD3HzauuUnFVsPnXqH8qBHoG8gcepORa882kpJ/G8iTeZcsWZApjAgTQgzzyIdn5uEgHFPnw4AVRhvPk25bMF04bFpfJ37H9WZaHJTufGn5F3myS7H11k7WIOMCxPCCriznWMIEoCxE8FvAsYqeLY1OUWshVjpIZ46XpFKYZb4tcBdW7ML0WJ1ScTn7M8gh8BAabEybMY4gKEuDDoIxwcmvkhfH9hyHGGNXPXvcYSo3yZzmGlR6leO2bS3YtRjqucffWH5dfexMUlYEkorxDC3SOOuiU2sraxnNE5k9kzbniMgei6XmaeYaT2PccDX69I5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeB0GOlfYLOKWVgbkcnQaheZSSzn52yBob3fgyODEoM=;
 b=rb8uVSQQAcl+ggEfozXvZgdtG/Ho6hINLd2bArhcgD/NVuEVUdK8aL9w4N0MBbisyX3p8ldkucq/R19rlynvhWBWFoxtCY9PDeEgVW78r7JJ2rlOjFABPTOreAqKZwI76GRHq5ZiEY2Vvae9sFL2hwIqFlrhnD82VEsLRTzqx9UnUwT2GOKcMF9Kn71p5QOT3PGs2pmO3yNtwNtgOmZH2iXGQsMgQ9FLV+erNDSXGfaIiLw8xCuHff6GwvH4jplrSJ7iNOMhHVlXwtvZlnsljTksm0/LGptwgqCp5xVjHHk4vlW6xWhW5UBlyJ6OV6UmX5m/JbdRd4RcTBGeaLDnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeB0GOlfYLOKWVgbkcnQaheZSSzn52yBob3fgyODEoM=;
 b=xHYkLEY6kGAAtqU9tNtWdeveU3qIr4+hKXAbbcWj1HasC645fONoXSW6S+oSEXw6etcSSe9KeY0i5ngq52/Au4tw2l+1xMQMYgHyhKVMsH6yXIVHt59Om2NZqK0yVIkvGFQAXupoGXv/K8xE3NkRfFT2h6Jmiz/pXsdl8QBWYK0=
Received: from BYAPR08CA0061.namprd08.prod.outlook.com (2603:10b6:a03:117::38)
 by CH3PR12MB8933.namprd12.prod.outlook.com (2603:10b6:610:17a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:30:20 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:117:cafe::d9) by BYAPR08CA0061.outlook.office365.com
 (2603:10b6:a03:117::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 06:30:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:19 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:15 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 19/25] ASoC: amd: ps: update file description and copyright
 year
Date: Fri, 7 Feb 2025 11:58:13 +0530
Message-ID: <20250207062819.1527184-20-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|CH3PR12MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e38f7e2-03e6-469d-f985-08dd4740e4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n0NMThKvZJHNz2T7VQsRoC76EP10cSnkJ9sOkKWBi03U9r01FqTCdmvsFkOM?=
 =?us-ascii?Q?9cA/MnIh9FAiRp3MwftGwB2i0ec3Ym5cHe4QbvfKRUe8DiFBRpsa5rcKJ3ZA?=
 =?us-ascii?Q?Z7JqizVWqhzxaNk36MteP3s/mG2Z5/bq6Z9fOi9jkHX9xd7PCU1Bh12XHk+G?=
 =?us-ascii?Q?hffVMwrpl/OA9FKcWKOfGszFnRFDSfe6mbms19+MYAen8zeyRm2MjTqlpkcZ?=
 =?us-ascii?Q?vwI2B5HXe4bRnp36+zki+UcWfVXKWyXEZZtr7VUauKcKJomgDLeBBWXO7e8W?=
 =?us-ascii?Q?GHVWwh9cCcIknSt6+9VmoYKm6b48sIqt1ybJH/PCBS0KG+u9Yle9vReY602j?=
 =?us-ascii?Q?8jceDHdzVhwKWL8TMhEK/VxP62ekRM/bWTZ7eat0KEbM3UWjIcOeMJ1CR81k?=
 =?us-ascii?Q?G9PNkmFL/OAQjJoryff+DLbc/nKiPbCznItftIKxkMkU54Kjd8cBNKrvT3uA?=
 =?us-ascii?Q?B3rjbCR2eTmrfdRnx0CpruJsHYDF/NyIrnLOuPUIBUYlLX7uc+Dwab2+E7Vg?=
 =?us-ascii?Q?eiNsZF8ApEMV3z6UGcXaX5XIxVOZhwqGSC65Xr/UaHyy6hY/XUVbd/GlbFHE?=
 =?us-ascii?Q?vBDVtjAxMAQsP4amkxTgTtj75l+fW2w5HY0hg1Xog+p3XpDpggC++N9ljZ2f?=
 =?us-ascii?Q?vDapd8C/EyB7YVCLIfWaZ1uqGmJr3uSnEj5tuBfWYVyijhD6FQShddT9plxk?=
 =?us-ascii?Q?Nt6wcZ3PSM6Mp3LKd/S6ANM7aAM7uVrqHhcMTsNrCUYjU9sI+79voPpKVO3x?=
 =?us-ascii?Q?u5VmSsf303e1MPy15oNaC/D/te/IWBUu2aze4Kp89l2aQzLSJRDnUC55P7qt?=
 =?us-ascii?Q?joPfN8ljHPmBRsAt4LDhx3ZQ/LOi2guht8SCnVw2XjSRJapMVRunGRBpZnA7?=
 =?us-ascii?Q?pOSFo+TURpKARweZUFq5cTIhv0PSnx6z0PsJyRDPCCVDFdIo3OXRqlodtE6l?=
 =?us-ascii?Q?X/nXUJJkufezWE1N7ZiJ/7Y7qTO5QaCtjw01FZhPBMsJNLnkaN3vcmpOskVT?=
 =?us-ascii?Q?XYXEghWq4GMrrqzvnzTM7Pm3dCOVPCbcGWXQfZhD1X6Nq9ekLWInXIsl7Iq8?=
 =?us-ascii?Q?IzhCrp0faRAb2GbfEeZW4wdAJEV/NaQce2REfkVHljqV7yGdQ45yZS+RDLKq?=
 =?us-ascii?Q?cSfHuAiyR+2/yHnU4EQ5KnJYSxVRqH8eLrYMpi/s5BTqPX3nurKYAxTjgdSr?=
 =?us-ascii?Q?n9+XLsYNTU6A+u1s+GQJBzPkOc/d0Fxs3cfkx09N+UIkn6hBi1flyvx9ppOl?=
 =?us-ascii?Q?PU2KfILXW6fOMvSKD/QUorFXnpPQecqKXinCsGwlEo6DKG8pUwDY/lsGHWn0?=
 =?us-ascii?Q?OH2WvqfdY4m1qahZbDnslZo75/kD1hUx4Lu1SBOz48+GoOHMh532eS14tOAu?=
 =?us-ascii?Q?FVXYq+cyWM/8EdvumCXcltuRPl81uMJD9lnmEp4iy8rf+W5SdoKgQ4tekOin?=
 =?us-ascii?Q?5eLD4dz/ThdUrFSKaBGc/vwlLWCGmHTJCMQc90LhJSGYLiEG5crKn8fkjNbw?=
 =?us-ascii?Q?VC3OQotbblJv35g=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:19.7396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e38f7e2-03e6-469d-f985-08dd4740e4c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8933
Message-ID-Hash: 647W3AQDT4537WJ2SDBP3JTNJIPDBMPB
X-Message-ID-Hash: 647W3AQDT4537WJ2SDBP3JTNJIPDBMPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/647W3AQDT4537WJ2SDBP3JTNJIPDBMPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update files description for acp pci driver, SoundWire DMA driver, PDM
driver and acp header file as new support is added for ACP7.0 & ACP7.1
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h      | 4 ++--
 sound/soc/amd/ps/pci-ps.c     | 4 ++--
 sound/soc/amd/ps/ps-pdm-dma.c | 4 ++--
 sound/soc/amd/ps/ps-sdw-dma.c | 5 +++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 9940151b0675..85feae45c44c 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * AMD ALSA SoC PDM Driver
+ * AMD Common ACP header file for ACP6.3, ACP7.0 & ACP7.1 platforms
  *
- * Copyright (C) 2022, 2023 Advanced Micro Devices, Inc. All rights reserved.
+ * Copyright (C) 2022, 2023, 2025 Advanced Micro Devices, Inc. All rights reserved.
  */
 
 #include <linux/soundwire/sdw_amd.h>
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 3a6034e074f5..2cbfeb07d5c4 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * AMD Pink Sardine ACP PCI Driver
+ * AMD common ACP PCI driver for ACP6.3, ACP7.0 & ACP7.1 platforms.
  *
- * Copyright 2022 Advanced Micro Devices, Inc.
+ * Copyright 2022, 2025 Advanced Micro Devices, Inc.
  */
 
 #include <linux/pci.h>
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index e726186fe8c6..7cdeb34e8f73 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * AMD ALSA SoC Pink Sardine PDM Driver
+ * AMD ALSA SoC common PDM Driver for ACP6.3, ACP7.0 & ACP7.1 platforms.
  *
- * Copyright 2022 Advanced Micro Devices, Inc.
+ * Copyright 2022, 2025 Advanced Micro Devices, Inc.
  */
 
 #include <linux/platform_device.h>
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 2461c6421ae9..21b336109c99 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * AMD ALSA SoC Pink Sardine SoundWire DMA Driver
+ * AMD ALSA SoC common SoundWire DMA Driver for ACP6.3, ACP7.0 and ACP7.1
+ * platforms.
  *
- * Copyright 2023 Advanced Micro Devices, Inc.
+ * Copyright 2023, 2025 Advanced Micro Devices, Inc.
  */
 
 #include <linux/err.h>
-- 
2.34.1

