Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F395C502
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 07:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB07986F;
	Fri, 23 Aug 2024 07:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB07986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724392160;
	bh=WEaDXHftBt4sm6RBlPAoff3uOV1LE6Q4wmgy90y2hTk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GAIc7snIXmkzKam825iTBNFaX0Zk4SPe9xVKotpAdirwvv53CVzaZfm/v6lOyB3+g
	 5isSfIci4JmSFvQzI8mU3CEBMMexCrDnveiqcAETBO8FaHrm8zM5hR4IVNU47Hu1/U
	 gbUGgr4X54NaFjxjfKcPEysIbLJ/YeB3XXN/INBQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32FEAF805F0; Fri, 23 Aug 2024 07:48:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 406D3F805FD;
	Fri, 23 Aug 2024 07:48:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A716F80494; Fri, 23 Aug 2024 07:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 152C4F8049C
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 07:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 152C4F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3+XFJbpg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJFoQWWLdkxnwzhGADl5SHFZ0ANvhT/RHudsuMV8kgG2sfUd4BlZAUkZd2148pRlEb+nkE5fqMZn+DDNtvN3eLqXVoa/axWTvdXYU0mL/R60zXdOtiRmfmi9t1kWg243Iwg4LOimxmwR5WAu2elSpZK5aHjMr9xWI69D4NQgBHpL3woXSC7JLnXa2QSLVlejZgb0LGirQJFHEJ6qJhuOab0TkBYI/dSR5850qUDepaPpfUoZPIR4IkhBFPRbJq0dwvR71jtRWT81xCtEXhcCIiyz/wuY1vClBUVx5x5Dn1chlOnGqUiMuj4cRSt4lZAvWfOMCUFGgXFJubA+4IE5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUa7z1jgHiHN26iUpg5YVrEphLcl1ccNFJtwm4zja3o=;
 b=b8EjH679iDUd4FXZ/t6V/DQQxNi1vkoYiMQjAQtZjn4PFkUu7PL2wZSsyGGxCBNkjyGdQsf1F17lmAVNJhuOpr6BH7gMTmEo8XP3KPnKAUOlkv4uqLwEL9HltiytlJ1jPEj0jVkdR1Yn2UBt3fmQV8lekmgn38GRPbJdO1zRwrMGhqRW1ld84qaHpeBe2KPbrVY/nQCzGefK1u/2G5SWevlTiTSTjuJE9vjJvhVTyofgxSu2auwlt4ZWHyj3SCRIHD2+l3GosfUIVIeDnji8J9XKMvJ6dq+gGo7neftdmuB8yD5OHcXZ1Evj1DgVYE5RhS6N6MDVJ6i9gLBOvSyXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUa7z1jgHiHN26iUpg5YVrEphLcl1ccNFJtwm4zja3o=;
 b=3+XFJbpgtvwprGqB0Nv78VcjuYk/uUcy8fZJ9OcIs9OykjTF8PPW0kNNm+tUCv14JCI5kzNEaGC3U2/LGWsjX6SPJMt9ouiK+yFvfKjUkJL39ojVBxdJ4vFNseB+QtmtrE10u89xlEC31rZhFD0E6masp8FVyMhiqugLeZpmcS0=
Received: from SN1PR12CA0072.namprd12.prod.outlook.com (2603:10b6:802:20::43)
 by DM4PR12MB7599.namprd12.prod.outlook.com (2603:10b6:8:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.29; Fri, 23 Aug
 2024 05:38:06 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::3a) by SN1PR12CA0072.outlook.office365.com
 (2603:10b6:802:20::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Fri, 23 Aug 2024 05:38:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 05:38:06 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 00:38:00 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <cristian.ciocaltea@collabora.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/2] ASoC: SOF: amd: add support for acp7.0 based platform
Date: Fri, 23 Aug 2024 11:07:39 +0530
Message-ID: <20240823053739.465187-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823053739.465187-1-Vijendar.Mukunda@amd.com>
References: <20240823053739.465187-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DM4PR12MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: d053897a-c272-465e-6542-08dcc335c3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XkrTYV6rz3BsQ819vAUF9CpvH+m4U9P1SRkTsU8C/5MbP0KZ3yM5Vj8TS8wu?=
 =?us-ascii?Q?98kNSE8+q8ZEhvowrMXSIepMZvoEJTjQu6nq9thoRm09ujd93PTq/RT1tMjs?=
 =?us-ascii?Q?LcdKOlX0ZANzzN9EFmRRDM1Zyf7aIP8H6DS/E/T5jEKwaYWmzUQQGZ26WHBA?=
 =?us-ascii?Q?8zFenrLwX4RUSQP4Xm4GBF3ZDAnSwWjRx1+x7mTUir4mRSTu/Se9aUQ1++BY?=
 =?us-ascii?Q?PmgouCP/jXyWxGoFAaLkw3Q9MREZ5DZKvLGDgrRQxuxySDn9ewZocTHWeAXN?=
 =?us-ascii?Q?R/Fu2kd8UYtMuSEnHUzHbikdQrOz5C9BmPRKP22S2m3MspjS98a4F/yaHB7+?=
 =?us-ascii?Q?BI1HpgGqbrJ5R0dR7TUNnAPjlEtIeYs6E0n0kEV5JsxbTkW0o6TMMV69ll7X?=
 =?us-ascii?Q?RGN2d4dtxqu0GT+6YtVWBZmZJ45Fu3dAcUAhCf/JRyhgTwa7uGemcosfOy1q?=
 =?us-ascii?Q?btLpG5IArIR+h0MAw6+K2hnN4uT6oOilSkRhCxbTz3eieFWC4lT52MjWs66b?=
 =?us-ascii?Q?H4c7MLmymozmCADZmj9nSzZOgw4GnTqg9QTyueTZ1jbCTC0l3i0xvZ+i4Cs7?=
 =?us-ascii?Q?txlFMFhvDTKaN0Qkgk9vXQ+tnuR8UK1ut1L8Ct3tjD7oeWNRXLHrz8zRGtDy?=
 =?us-ascii?Q?2ys3KfqOnIQMTYD5a9vpxFmYB/4cFkKNPkcI+f26ZTOwc/Y3X6svI3Rcjt4B?=
 =?us-ascii?Q?Qx9GSWQjQoemFB/D2DuMa12qLONhfhY3xMsCDkMKq2/QFroneF9CmLZGrr7u?=
 =?us-ascii?Q?pDfXS4e2Jx7UCtv1xB8Z7/FWkj5MkHghcFaBUdQZpzKZyaALB0Cum6guHJod?=
 =?us-ascii?Q?TTHG3Q3cuPV7MM3mNLbo+5Cg2e6NOLYZeXZ4IeKxnWY6pufdn0QMu0wH1F8R?=
 =?us-ascii?Q?c5Cii1G6/KoxpAJNHCqR5n80hE1VSZUkhRjHxOlYL9kRAUZ6AReKTToTJno0?=
 =?us-ascii?Q?ZSxxxplUIc+ezUdyPN1aWElyEfZ5Wb9098PJl8kqTnl3TdP20QeHd61Lo/9n?=
 =?us-ascii?Q?UgiNik8if2JmwJ9HLQSBHwmUazvMbrf0hT/kCI2ZzHiwWS+GLSrzzrjoof38?=
 =?us-ascii?Q?2waBNFN6NSV3dAEttM7r9vITqEKGXtbYZ2ToLlkrpb68IRHGt/aGKC/izmpD?=
 =?us-ascii?Q?mdMn14rTMb5p3ilEzIR2bCzSPte6/dNuBNlTcd1tiUsRvFZqGLxNRE9stFKO?=
 =?us-ascii?Q?o8hmZbpShZZdwuJwp87aQd+sU/qHCHlVootADz4vluJ1kX/ZADx92n/V83Ak?=
 =?us-ascii?Q?s7+nchAkQ7t8sgVC/YBuVnac8Ojr0UOh2CAAuE8mH9ujLqyb5Lr5OFj8C3Yg?=
 =?us-ascii?Q?7R+VNF3FFAS6dCX7/GnuB2xxZASnlcaUT6zHipvXxNKUuqU7so9r0j7pcmsH?=
 =?us-ascii?Q?XxmWGm0jNIwKA7EkLQzKPE4/IzmXvOM7N4H4FIxcvbTJ7N+aFVJNVi490nEe?=
 =?us-ascii?Q?D2dJUx/MV48j3M8axRk3bWYD+upERKTg?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 05:38:06.3679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d053897a-c272-465e-6542-08dcc335c3c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7599
Message-ID-Hash: LT6PQNEKSIXM6TLA26Q6RAMWDYGAGGQS
X-Message-ID-Hash: LT6PQNEKSIXM6TLA26Q6RAMWDYGAGGQS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LT6PQNEKSIXM6TLA26Q6RAMWDYGAGGQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SOF support for ACP7.0 version based platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/Kconfig          |  10 ++
 sound/soc/sof/amd/Makefile         |   4 +-
 sound/soc/sof/amd/acp-dsp-offset.h |  24 ++++-
 sound/soc/sof/amd/acp.c            |  65 ++++++++++---
 sound/soc/sof/amd/acp.h            |   9 ++
 sound/soc/sof/amd/acp70.c          | 142 +++++++++++++++++++++++++++++
 sound/soc/sof/amd/pci-acp70.c      | 112 +++++++++++++++++++++++
 7 files changed, 352 insertions(+), 14 deletions(-)
 create mode 100644 sound/soc/sof/amd/acp70.c
 create mode 100644 sound/soc/sof/amd/pci-acp70.c

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 848c031ed5fb..f4cafe801017 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -88,4 +88,14 @@ config SND_SOC_SOF_AMD_ACP63
 	  AMD ACP6.3 version based platforms.
 	  Say Y if you want to enable SOF on ACP6.3 based platform.
 	  If unsure select "N".
+
+config SND_SOC_SOF_AMD_ACP70
+	tristate "SOF support for ACP7.0 platform"
+	depends on SND_SOC_SOF_PCI
+	select SND_SOC_SOF_AMD_COMMON
+	help
+	  Select this option for SOF support on
+	  AMD ACP7.0 version based platforms.
+	  Say Y if you want to enable SOF on ACP7.0 based platform.
+
 endif
diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index 63fe0d55fd0e..6ae39fd5a836 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -2,7 +2,7 @@
 # This file is provided under a dual BSD/GPLv2 license. When using or
 # redistributing this file, you may do so under either license.
 #
-# Copyright(c) 2021, 2023 Advanced Micro Devices, Inc. All rights reserved.
+# Copyright(c) 2021, 2023, 2024 Advanced Micro Devices, Inc. All rights reserved.
 
 snd-sof-amd-acp-y := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o acp-trace.o acp-common.o
 snd-sof-amd-acp-$(CONFIG_SND_SOC_SOF_ACP_PROBES) += acp-probes.o
@@ -10,9 +10,11 @@ snd-sof-amd-renoir-y := pci-rn.o renoir.o
 snd-sof-amd-rembrandt-y := pci-rmb.o rembrandt.o
 snd-sof-amd-vangogh-y := pci-vangogh.o vangogh.o
 snd-sof-amd-acp63-y := pci-acp63.o acp63.o
+snd-sof-amd-acp70-y := pci-acp70.o acp70.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
 obj-$(CONFIG_SND_SOC_SOF_AMD_RENOIR) += snd-sof-amd-renoir.o
 obj-$(CONFIG_SND_SOC_SOF_AMD_REMBRANDT) += snd-sof-amd-rembrandt.o
 obj-$(CONFIG_SND_SOC_SOF_AMD_VANGOGH) += snd-sof-amd-vangogh.o
 obj-$(CONFIG_SND_SOC_SOF_AMD_ACP63) += snd-sof-amd-acp63.o
+obj-$(CONFIG_SND_SOC_SOF_AMD_ACP70) += snd-sof-amd-acp70.o
diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 072b703f9b3f..ecdcae07ace7 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license. When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2021, 2023 Advanced Micro Devices, Inc. All rights reserved.
+ * Copyright(c) 2021, 2023, 2024 Advanced Micro Devices, Inc. All rights reserved.
  *
  * Author: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
  */
@@ -23,6 +23,17 @@
 #define ACP_DMA_CH_STS				0xE8
 #define ACP_DMA_CH_GROUP			0xEC
 #define ACP_DMA_CH_RST_STS			0xF0
+#define ACP70_DMA_CNTL_0			0x00
+#define ACP70_DMA_DSCR_STRT_IDX_0		0x28
+#define ACP70_DMA_DSCR_CNT_0			0x50
+#define ACP70_DMA_PRIO_0			0x78
+#define ACP70_DMA_CUR_DSCR_0			0xA0
+#define ACP70_DMA_ERR_STS_0			0xF0
+#define ACP70_DMA_DESC_BASE_ADDR		0x118
+#define ACP70_DMA_DESC_MAX_NUM_DSCR		0x11C
+#define ACP70_DMA_CH_STS			0x120
+#define ACP70_DMA_CH_GROUP			0x124
+#define ACP70_DMA_CH_RST_STS			0x128
 
 /* Registers from ACP_DSP_0 block */
 #define ACP_DSP0_RUNSTALL			0x414
@@ -56,11 +67,13 @@
 #define ACP3X_PGFSM_BASE			0x141C
 #define ACP5X_PGFSM_BASE			0x1424
 #define ACP6X_PGFSM_BASE                        0x1024
+#define ACP70_PGFSM_BASE                        ACP6X_PGFSM_BASE
 #define PGFSM_CONTROL_OFFSET			0x0
 #define PGFSM_STATUS_OFFSET			0x4
 #define ACP3X_CLKMUX_SEL			0x1424
 #define ACP5X_CLKMUX_SEL			0x142C
 #define ACP6X_CLKMUX_SEL			0x102C
+#define ACP70_CLKMUX_SEL			ACP6X_CLKMUX_SEL
 
 /* Registers from ACP_INTR block */
 #define ACP3X_EXT_INTR_STAT			0x1808
@@ -69,22 +82,30 @@
 #define ACP6X_EXTERNAL_INTR_CNTL		0x1A04
 #define ACP6X_EXT_INTR_STAT                     0x1A0C
 #define ACP6X_EXT_INTR_STAT1			0x1A10
+#define ACP70_EXTERNAL_INTR_ENB			ACP6X_EXTERNAL_INTR_ENB
+#define ACP70_EXTERNAL_INTR_CNTL		ACP6X_EXTERNAL_INTR_CNTL
+#define ACP70_EXT_INTR_STAT			ACP6X_EXT_INTR_STAT
+#define ACP70_EXT_INTR_STAT1			ACP6X_EXT_INTR_STAT1
 
 #define ACP3X_DSP_SW_INTR_BASE			0x1814
 #define ACP5X_DSP_SW_INTR_BASE			0x1814
 #define ACP6X_DSP_SW_INTR_BASE                  0x1808
+#define ACP70_DSP_SW_INTR_BASE			ACP6X_DSP_SW_INTR_BASE
 #define DSP_SW_INTR_CNTL_OFFSET			0x0
 #define DSP_SW_INTR_STAT_OFFSET			0x4
 #define DSP_SW_INTR_TRIG_OFFSET			0x8
 #define ACP3X_ERROR_STATUS			0x18C4
 #define ACP6X_ERROR_STATUS			0x1A4C
+#define ACP70_ERROR_STATUS			ACP6X_ERROR_STATUS
 #define ACP3X_AXI2DAGB_SEM_0			0x1880
 #define ACP5X_AXI2DAGB_SEM_0			0x1884
 #define ACP6X_AXI2DAGB_SEM_0			0x1874
+#define ACP70_AXI2DAGB_SEM_0			ACP6X_AXI2DAGB_SEM_0
 
 /* ACP common registers to report errors related to I2S & SoundWire interfaces */
 #define ACP3X_SW_I2S_ERROR_REASON		0x18C8
 #define ACP6X_SW0_I2S_ERROR_REASON		0x18B4
+#define ACP7X_SW0_I2S_ERROR_REASON		ACP6X_SW0_I2S_ERROR_REASON
 #define ACP_SW1_I2S_ERROR_REASON		0x1A50
 
 /* Registers from ACP_SHA block */
@@ -101,6 +122,7 @@
 
 #define ACP_SCRATCH_REG_0			0x10000
 #define ACP6X_DSP_FUSION_RUNSTALL		0x0644
+#define ACP70_DSP_FUSION_RUNSTALL		ACP6X_DSP_FUSION_RUNSTALL
 
 /* Cache window registers */
 #define ACP_DSP0_CACHE_OFFSET0			0x0420
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index e4d46fdda88b..d579c3849392 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -64,13 +64,24 @@ static void init_dma_descriptor(struct acp_dev_data *adata)
 {
 	struct snd_sof_dev *sdev = adata->dev;
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
+	struct acp_dev_data *acp_data = sdev->pdata->hw_pdata;
 	unsigned int addr;
+	unsigned int acp_dma_desc_base_addr, acp_dma_desc_max_num_dscr;
 
 	addr = desc->sram_pte_offset + sdev->debug_box.offset +
 	       offsetof(struct scratch_reg_conf, dma_desc);
 
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DESC_BASE_ADDR, addr);
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DESC_MAX_NUM_DSCR, ACP_MAX_DESC_CNT);
+	switch (acp_data->pci_rev) {
+	case ACP70_PCI_ID:
+		acp_dma_desc_base_addr = ACP70_DMA_DESC_BASE_ADDR;
+		acp_dma_desc_max_num_dscr = ACP70_DMA_DESC_MAX_NUM_DSCR;
+		break;
+	default:
+		acp_dma_desc_base_addr = ACP_DMA_DESC_BASE_ADDR;
+		acp_dma_desc_max_num_dscr = ACP_DMA_DESC_MAX_NUM_DSCR;
+	}
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, acp_dma_desc_base_addr, addr);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, acp_dma_desc_max_num_dscr, ACP_MAX_DESC_CNT);
 }
 
 static void configure_dma_descriptor(struct acp_dev_data *adata, unsigned short idx,
@@ -92,29 +103,51 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 			      unsigned int idx, unsigned int dscr_count)
 {
 	struct snd_sof_dev *sdev = adata->dev;
+	struct acp_dev_data *acp_data = sdev->pdata->hw_pdata;
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int val, status;
+	unsigned int acp_dma_cntl_0, acp_dma_ch_rst_sts, acp_dma_dscr_err_sts_0;
+	unsigned int acp_dma_dscr_cnt_0, acp_dma_prio_0, acp_dma_dscr_strt_idx_0;
 	int ret;
 
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_CNTL_0 + ch * sizeof(u32),
+	switch (acp_data->pci_rev) {
+	case ACP70_PCI_ID:
+		acp_dma_cntl_0 = ACP70_DMA_CNTL_0;
+		acp_dma_ch_rst_sts = ACP70_DMA_CH_RST_STS;
+		acp_dma_dscr_err_sts_0 = ACP70_DMA_ERR_STS_0;
+		acp_dma_dscr_cnt_0 = ACP70_DMA_DSCR_CNT_0;
+		acp_dma_prio_0 = ACP70_DMA_PRIO_0;
+		acp_dma_dscr_strt_idx_0 = ACP70_DMA_DSCR_STRT_IDX_0;
+		break;
+	default:
+		acp_dma_cntl_0 = ACP_DMA_CNTL_0;
+		acp_dma_ch_rst_sts = ACP_DMA_CH_RST_STS;
+		acp_dma_dscr_err_sts_0 = ACP_DMA_ERR_STS_0;
+		acp_dma_dscr_cnt_0 = ACP_DMA_DSCR_CNT_0;
+		acp_dma_prio_0 = ACP_DMA_PRIO_0;
+		acp_dma_dscr_strt_idx_0 = ACP_DMA_DSCR_STRT_IDX_0;
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, acp_dma_cntl_0 + ch * sizeof(u32),
 			  ACP_DMA_CH_RST | ACP_DMA_CH_GRACEFUL_RST_EN);
 
-	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_DMA_CH_RST_STS, val,
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, acp_dma_ch_rst_sts, val,
 					    val & (1 << ch), ACP_REG_POLL_INTERVAL,
 					    ACP_REG_POLL_TIMEOUT_US);
 	if (ret < 0) {
 		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->acp_error_stat);
-		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DMA_ERR_STS_0 + ch * sizeof(u32));
+		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, acp_dma_dscr_err_sts_0 +
+				       ch * sizeof(u32));
 
 		dev_err(sdev->dev, "ACP_DMA_ERR_STS :0x%x ACP_ERROR_STATUS :0x%x\n", val, status);
 		return ret;
 	}
 
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, (ACP_DMA_CNTL_0 + ch * sizeof(u32)), 0);
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DSCR_CNT_0 + ch * sizeof(u32), dscr_count);
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DSCR_STRT_IDX_0 + ch * sizeof(u32), idx);
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_PRIO_0 + ch * sizeof(u32), 0);
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_CNTL_0 + ch * sizeof(u32), ACP_DMA_CH_RUN);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, (acp_dma_cntl_0 + ch * sizeof(u32)), 0);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, acp_dma_dscr_cnt_0 + ch * sizeof(u32), dscr_count);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, acp_dma_dscr_strt_idx_0 + ch * sizeof(u32), idx);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, acp_dma_prio_0 + ch * sizeof(u32), 0);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, acp_dma_cntl_0 + ch * sizeof(u32), ACP_DMA_CH_RUN);
 
 	return ret;
 }
@@ -453,6 +486,10 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 		acp_pgfsm_status_mask = ACP6X_PGFSM_STATUS_MASK;
 		acp_pgfsm_cntl_mask = ACP6X_PGFSM_CNTL_POWER_ON_MASK;
 		break;
+	case ACP70_PCI_ID:
+		acp_pgfsm_status_mask = ACP70_PGFSM_STATUS_MASK;
+		acp_pgfsm_cntl_mask = ACP70_PGFSM_CNTL_POWER_ON_MASK;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -561,8 +598,11 @@ static bool check_acp_sdw_enable_status(struct snd_sof_dev *sdev)
 
 int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
+	struct acp_dev_data *acp_data;
 	int ret;
+	bool enable = false;
 
+	acp_data = sdev->pdata->hw_pdata;
 	/* When acp_reset() function is invoked, it will apply ACP SOFT reset and
 	 * DSP reset. ACP Soft reset sequence will cause all ACP IP registers will
 	 * be reset to default values which will break the ClockStop Mode functionality.
@@ -577,8 +617,9 @@ int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 		dev_err(sdev->dev, "ACP Reset failed\n");
 		return ret;
 	}
-
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_CONTROL, 0x00);
+	if (acp_data->pci_rev == ACP70_PCI_ID)
+		enable = true;
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_CONTROL, enable);
 
 	return 0;
 }
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 11def07efc0f..800594440f73 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -29,6 +29,8 @@
 #define ACP3X_PGFSM_STATUS_MASK			0x03
 #define ACP6X_PGFSM_CNTL_POWER_ON_MASK		0x07
 #define ACP6X_PGFSM_STATUS_MASK			0x0F
+#define ACP70_PGFSM_CNTL_POWER_ON_MASK		0x1F
+#define ACP70_PGFSM_STATUS_MASK			0xFF
 
 #define ACP_POWERED_ON				0x00
 #define ACP_ASSERT_RESET			0x01
@@ -42,6 +44,7 @@
 #define ACP3X_SRAM_PTE_OFFSET			0x02050000
 #define ACP5X_SRAM_PTE_OFFSET			0x02050000
 #define ACP6X_SRAM_PTE_OFFSET			0x03800000
+#define ACP70_SRAM_PTE_OFFSET			ACP6X_SRAM_PTE_OFFSET
 #define PAGE_SIZE_4K_ENABLE			0x2
 #define ACP_PAGE_SIZE				0x1000
 #define ACP_DMA_CH_RUN				0x02
@@ -63,17 +66,20 @@
 #define ACP_DRAM_BASE_ADDRESS			0x01000000
 #define ACP_DRAM_PAGE_COUNT			128
 #define ACP_SRAM_BASE_ADDRESS			0x3806000
+#define ACP7X_SRAM_BASE_ADDRESS			0x380C000
 #define ACP_DSP_TO_HOST_IRQ			0x04
 
 #define ACP_RN_PCI_ID				0x01
 #define ACP_VANGOGH_PCI_ID			0x50
 #define ACP_RMB_PCI_ID				0x6F
 #define ACP63_PCI_ID				0x63
+#define ACP70_PCI_ID				0x70
 
 #define HOST_BRIDGE_CZN				0x1630
 #define HOST_BRIDGE_VGH				0x1645
 #define HOST_BRIDGE_RMB				0x14B5
 #define HOST_BRIDGE_ACP63			0x14E8
+#define HOST_BRIDGE_ACP70			0x1507
 #define ACP_SHA_STAT				0x8000
 #define ACP_PSP_TIMEOUT_US			1000000
 #define ACP_EXT_INTR_ERROR_STAT			0x20000000
@@ -326,6 +332,9 @@ int sof_rembrandt_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_acp63_ops;
 int sof_acp63_ops_init(struct snd_sof_dev *sdev);
 
+extern struct snd_sof_dsp_ops sof_acp70_ops;
+int sof_acp70_ops_init(struct snd_sof_dev *sdev);
+
 struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev);
 /* Machine configuration */
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/sof/amd/acp70.c b/sound/soc/sof/amd/acp70.c
new file mode 100644
index 000000000000..7d1842f42c90
--- /dev/null
+++ b/sound/soc/sof/amd/acp70.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2024 Advanced Micro Devices, Inc.
+//
+// Authors: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
+
+/*
+ * Hardware interface for Audio DSP on ACP7.0 version based platform
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+
+#include "../ops.h"
+#include "../sof-audio.h"
+#include "acp.h"
+#include "acp-dsp-offset.h"
+
+#define I2S_HS_INSTANCE		0
+#define I2S_BT_INSTANCE		1
+#define I2S_SP_INSTANCE		2
+#define PDM_DMIC_INSTANCE	3
+#define I2S_HS_VIRTUAL_INSTANCE 4
+
+static struct snd_soc_dai_driver acp70_sof_dai[] = {
+	[I2S_HS_INSTANCE] = {
+		.id = I2S_HS_INSTANCE,
+		.name = "acp-sof-hs",
+		.playback = {
+			.rates = SNDRV_PCM_RATE_8000_96000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 8,
+			.rate_min = 8000,
+			.rate_max = 96000,
+		},
+		.capture = {
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			/* Supporting only stereo for I2S HS controller capture */
+			.channels_min = 2,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 48000,
+		},
+	},
+
+	[I2S_BT_INSTANCE] = {
+		.id = I2S_BT_INSTANCE,
+		.name = "acp-sof-bt",
+		.playback = {
+			.rates = SNDRV_PCM_RATE_8000_96000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 8,
+			.rate_min = 8000,
+			.rate_max = 96000,
+		},
+		.capture = {
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			/* Supporting only stereo for I2S BT controller capture */
+			.channels_min = 2,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 48000,
+		},
+	},
+
+	[I2S_SP_INSTANCE] = {
+		.id = I2S_SP_INSTANCE,
+		.name = "acp-sof-sp",
+		.playback = {
+			.rates = SNDRV_PCM_RATE_8000_96000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 8,
+			.rate_min = 8000,
+			.rate_max = 96000,
+		},
+		.capture = {
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			/* Supporting only stereo for I2S SP controller capture */
+			.channels_min = 2,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 48000,
+		},
+	},
+
+	[PDM_DMIC_INSTANCE] = {
+		.id = PDM_DMIC_INSTANCE,
+		.name = "acp-sof-dmic",
+		.capture = {
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 4,
+			.rate_min = 8000,
+			.rate_max = 48000,
+		},
+	},
+
+	[I2S_HS_VIRTUAL_INSTANCE] = {
+		.id = I2S_HS_VIRTUAL_INSTANCE,
+		.name = "acp-sof-hs-virtual",
+		.playback = {
+			.rates = SNDRV_PCM_RATE_8000_96000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 8,
+			.rate_min = 8000,
+			.rate_max = 96000,
+		},
+	},
+};
+
+/* Phoenix ops */
+struct snd_sof_dsp_ops sof_acp70_ops;
+EXPORT_SYMBOL_NS(sof_acp70_ops, SND_SOC_SOF_AMD_COMMON);
+
+int sof_acp70_ops_init(struct snd_sof_dev *sdev)
+{
+	/* common defaults */
+	memcpy(&sof_acp70_ops, &sof_acp_common_ops, sizeof(struct snd_sof_dsp_ops));
+
+	sof_acp70_ops.drv = acp70_sof_dai;
+	sof_acp70_ops.num_drv = ARRAY_SIZE(acp70_sof_dai);
+
+	return 0;
+}
diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
new file mode 100644
index 000000000000..a5d8b6a95a22
--- /dev/null
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2024 Advanced Micro Devices, Inc. All rights reserved.
+//
+// Authors: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
+
+/*.
+ * PCI interface for ACP7.0 device
+ */
+
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <sound/sof.h>
+#include <sound/soc-acpi.h>
+
+#include "../ops.h"
+#include "../sof-pci-dev.h"
+#include "../../amd/mach-config.h"
+#include "acp.h"
+#include "acp-dsp-offset.h"
+
+#define ACP70_FUTURE_REG_ACLK_0		0x1854
+#define ACP70_REG_START			0x1240000
+#define ACP70_REG_END			0x125C000
+
+static const struct sof_amd_acp_desc acp70_chip_info = {
+	.host_bridge_id = HOST_BRIDGE_ACP70,
+	.pgfsm_base	= ACP70_PGFSM_BASE,
+	.ext_intr_enb = ACP70_EXTERNAL_INTR_ENB,
+	.ext_intr_cntl = ACP70_EXTERNAL_INTR_CNTL,
+	.ext_intr_stat	= ACP70_EXT_INTR_STAT,
+	.ext_intr_stat1	= ACP70_EXT_INTR_STAT1,
+	.dsp_intr_base	= ACP70_DSP_SW_INTR_BASE,
+	.acp_sw0_i2s_err_reason = ACP7X_SW0_I2S_ERROR_REASON,
+	.sram_pte_offset = ACP70_SRAM_PTE_OFFSET,
+	.hw_semaphore_offset = ACP70_AXI2DAGB_SEM_0,
+	.fusion_dsp_offset = ACP70_DSP_FUSION_RUNSTALL,
+	.probe_reg_offset = ACP70_FUTURE_REG_ACLK_0,
+	.reg_start_addr = ACP70_REG_START,
+	.reg_end_addr = ACP70_REG_END,
+};
+
+static const struct sof_dev_desc acp70_desc = {
+	.machines		= snd_soc_acpi_amd_acp70_sof_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.chip_info		= &acp70_chip_info,
+	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_3),
+	.ipc_default            = SOF_IPC_TYPE_3,
+	.default_fw_path	= {
+		[SOF_IPC_TYPE_3] = "amd/sof",
+	},
+	.default_tplg_path	= {
+		[SOF_IPC_TYPE_3] = "amd/sof-tplg",
+	},
+	.default_fw_filename	= {
+		[SOF_IPC_TYPE_3] = "sof-acp_7_0.ri",
+	},
+	.nocodec_tplg_filename	= "sof-acp.tplg",
+	.ops			= &sof_acp70_ops,
+	.ops_init		= sof_acp70_ops_init,
+};
+
+static int acp70_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+{
+	unsigned int flag;
+
+	if (pci->revision != ACP70_PCI_ID)
+		return -ENODEV;
+
+	flag = snd_amd_acp_find_config(pci);
+	if (flag != FLAG_AMD_SOF && flag != FLAG_AMD_SOF_ONLY_DMIC)
+		return -ENODEV;
+
+	return sof_pci_probe(pci, pci_id);
+};
+
+static void acp70_pci_remove(struct pci_dev *pci)
+{
+	sof_pci_remove(pci);
+}
+
+/* PCI IDs */
+static const struct pci_device_id acp70_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_PCI_DEV_ID),
+	.driver_data = (unsigned long)&acp70_desc},
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, acp70_pci_ids);
+
+/* pci_driver definition */
+static struct pci_driver snd_sof_pci_amd_acp70_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = acp70_pci_ids,
+	.probe = acp70_pci_probe,
+	.remove = acp70_pci_remove,
+	.driver = {
+		.pm = &sof_pci_pm,
+	},
+};
+module_pci_driver(snd_sof_pci_amd_acp70_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("ACP70 SOF Driver");
+MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
-- 
2.34.1

