Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161FA20483
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2025 07:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90DF5601BF;
	Tue, 28 Jan 2025 07:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90DF5601BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738046294;
	bh=rcZBN7AJvKf2uG4NttdYAadR5da15Euj4ZqZtloJJl0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qHNW6xJiQ7934lU43OKbM7Ub3crXaubQhydru4ESWOwcP0BAXVGplE5wpY9BwnmlN
	 /+9LjptGxpNQq7zo1pAWDiHSXrSW0VJG+3fede6fEVJJD5/sa+iw8RF8sJFRnP7aJX
	 f52v3R2/PRbU5pgKe99UrY2NPkvtJJ6CggTgleOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C251CF80246; Tue, 28 Jan 2025 07:37:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A94A0F80631;
	Tue, 28 Jan 2025 07:37:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BEEAF80611; Tue, 28 Jan 2025 07:37:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 906A0F805FF
	for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2025 07:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 906A0F805FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wVIosA/O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nooWtkirKUk8debiMF5R+LY+BIrNVidadT3zEvBRRpr6wktFI3VJkAtIVF/fy6vlmoaKGI1BcMDN8ydUtGcxGFJX564J/ZUdmCp7w19xroYzanoxPiwFk9i9cqNhN2lOs4+GwIJXDx1QjxTfJyKIEFbsSdO6/NmwLSMZYtC1cWTNzbz/IZWP9ICyYYdRqxbwtroeXmrLWG2D2LtaGzAMmVJVp2R7KsgI4scxBQMU7KVh65kgwfaA6eRh/K6+MdveNcScBX97EkEU3xsjfIFPX7lucSVnu5OueO3B7x0+F0xtDOuDztGIgRdKZ9vNIQIRNfw1TiaCZL7yPorjsFOuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PopQYIPErPfHw1nK/PJvWUbHyov04i7sKdIOwr1Bha8=;
 b=IQTNym7BMjhdX+NruTRihjrv1PY1nvDCQ6LnrtNn8lxj5Zp4IM7Q21g70EobVdH27NwmWh2nQ60PQVfs98Wk+TqOHogev1jlSpA3UoZ9npVR6/uDqNx26w1JjZ/meZE7YgmMEg+mB4sc+//Vzc+DooCbIDqGnDMFslJyAGYjPlrrLMk0kClGWZPoDKO4c2w0mQ100NpUdqEoWsOvOR+kBktl+4SXmKT0+RQ6fsLixioxmAa+ksZufVGWBtVqSX7L95mJEvSXusc85VsAUGKq/U/jLuED5OYOOE4quhs6dtB8dX3pT5mLuikfn9M8YAaavLiTSHbn4WFHrPgizCqaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PopQYIPErPfHw1nK/PJvWUbHyov04i7sKdIOwr1Bha8=;
 b=wVIosA/OiPuDJs2LSwkb2LLNJTuEHmt82kyhd9ToQqna8E/9Yq4nmag621onRB0Q+y3pQV7TCmypshWY+w4W/M1go0ypAR1PaNjgG8U/YgPpNRIx0DbiOnP2JGll7cxyUTud/AttNZS3eDm7RY//m04Cq9vEKXsqpXkWrecyHU8=
Received: from SJ0PR05CA0171.namprd05.prod.outlook.com (2603:10b6:a03:339::26)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 06:36:51 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::1f) by SJ0PR05CA0171.outlook.office365.com
 (2603:10b6:a03:339::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14 via Frontend Transport; Tue,
 28 Jan 2025 06:36:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 06:36:51 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 Jan 2025 00:36:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 3/6] soundwire: amd: add support for ACP7.0 & ACP7.1
 platforms
Date: Tue, 28 Jan 2025 12:06:21 +0530
Message-ID: <20250128063624.1922470-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
References: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f101e5-c7f7-463f-2fe5-08dd3f662604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oFTja0a0l3fgWgyP9IUZKaDd74pUv1tHn6MNq9cxcUi4b7u4KbYwX+l1Gi/B?=
 =?us-ascii?Q?dNcHc03wx6tIu8CQL1t24R8hF9OaP8gHXbsfobeE0PQuigfaQAR/PGlGKpnS?=
 =?us-ascii?Q?y6zdD/847xoMLA1fnxfLTmH3vXQSVsm+oZik2SXJ15XmnHzFfg0HhtW3bkkQ?=
 =?us-ascii?Q?x3ZyQe8nYEIxWpuFPXqEYQUSsZ/ZccIYOv/EUg6mx4QS0HCCUs6593351zxu?=
 =?us-ascii?Q?OFILKqBAMnmS/Ceuf7UU4FHXCicCkQiUh1KCUSzH3Hcu2KZ6rDgKT83g21Wd?=
 =?us-ascii?Q?0SqKGvf/pDZ3JlGRCUyKcikwqUhDE10elrko/sO8XZsz+PmG+PaNAuW7jRs6?=
 =?us-ascii?Q?zjqIiazKGDUbtuwYQkmR5JGoI3Mslfxw3ljLt7Q969LUAcw58qCMowvGT7LW?=
 =?us-ascii?Q?l7GGi8dnoHk6KDs4OFJIvCSXxmkvi6rCn5ZisCuhlEKryhlisilOC5KHHKzT?=
 =?us-ascii?Q?oG6KnQ9zMtdN9TeKv6vSrWO8Mg7WcGMIiuuDauiDxYZNfwEwzlqqLIg8EeUM?=
 =?us-ascii?Q?lt9uVCp5VS7KeenwER0lPIHh5+xTs2G/vpz+uM6046EdwzaGlsugGWUfH4kn?=
 =?us-ascii?Q?pCfdIIG151XhiN5+QqhB3M9GfzCqMal2jvBW4Wqc28vFTkyqkZYAK92iR4W+?=
 =?us-ascii?Q?kCqRHVuInJkUOLyFtp8huQrOv5xbkiZnJuKAuzWWm6l+SOfZIgul0Sc31HSe?=
 =?us-ascii?Q?vttbtm5gXfinQ2X7hT26hP4fZeMGBBouEWxZY2wvyZaulgfUufCyrc8tOfP7?=
 =?us-ascii?Q?saoNWZOyPgaurhWFjNf7kRj/njZ7M1qQaCk/tGxnbQeg90sqmh+clXuvr2N5?=
 =?us-ascii?Q?8PlSL/dgeQGaT7rbwVRejWk4MoP+pD1ciS9sZGjxruzrY047vDwPWjCsOpNu?=
 =?us-ascii?Q?YrB/JgSPL2YAZFPCvFKPJdlHXjHGuh4bi7n0Wvvzjua/A+2HboMOIgI5dlIT?=
 =?us-ascii?Q?UTChjvqYKSoyYfj7eUXamVi14yuI9qfQ8c4yVs9GyBLS51qkTSVmGKwZCK2a?=
 =?us-ascii?Q?19vVPApC5W8nerPHmIOCK9X51xOVlYft8nZo14lzMtcIo/DcnF7t/lqt2WEM?=
 =?us-ascii?Q?o35/dn/UgSx0im+iKe8rhrQMRYePTZjjlpj14ukPcOBsf4wZO/MUlgkgPJZ7?=
 =?us-ascii?Q?eHnTH4gJs8AANLlu7XxSKWFxBbORVPK8uJkx97iO3xtHCS+POGyp9DuDwEgi?=
 =?us-ascii?Q?8b1AStzqv7MpCP/fB+wxF7RAWwBN6G7BqJcEO8gw2Z58Vh3wJ4EqphTNwHwF?=
 =?us-ascii?Q?PXCcDv80cLZ3bpvXNGR0ImQCJuNbPKK6TnOoICtUkbxL2jlloORk4wSisVwj?=
 =?us-ascii?Q?K7qLo8cRC416Evwik6uj9wJ5nI6r16WTtiBm1VvKK5W9e39GkB3d40TDc0ld?=
 =?us-ascii?Q?dLwUnCMMIjadlBSlN37Llr89RijOY3iHZ63LCzFft5I7js6soOPW6xyaSvU0?=
 =?us-ascii?Q?akhHNZ8LlUQoSQDdedo1FWC802f+8v+E4R/OP/wSf9VPGrc6CM0eiXMlbBUt?=
 =?us-ascii?Q?H0ENOPf+2OMHURA=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:36:51.1938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 90f101e5-c7f7-463f-2fe5-08dd3f662604
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097
Message-ID-Hash: OLIYW4BQLTMW2LTMFCNCJDFFDMW25BXW
X-Message-ID-Hash: OLIYW4BQLTMW2LTMFCNCJDFFDMW25BXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLIYW4BQLTMW2LTMFCNCJDFFDMW25BXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire support for ACP7.0 and ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 22 ++++++++++++++++++++++
 drivers/soundwire/amd_manager.h   | 18 ++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |  2 ++
 3 files changed, 42 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 60be5805715e..216f495d238d 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -446,6 +446,10 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		frame_fmt_reg = acp70_sdw_dp_reg[p_params->num].frame_fmt_reg;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -494,6 +498,14 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		frame_fmt_reg = acp70_sdw_dp_reg[params->port_num].frame_fmt_reg;
+		sample_int_reg = acp70_sdw_dp_reg[params->port_num].sample_int_reg;
+		hctrl_dp0_reg = acp70_sdw_dp_reg[params->port_num].hctrl_dp0_reg;
+		offset_reg = acp70_sdw_dp_reg[params->port_num].offset_reg;
+		lane_ctrl_ch_en_reg = acp70_sdw_dp_reg[params->port_num].lane_ctrl_ch_en_reg;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -549,6 +561,10 @@ static int amd_sdw_port_enable(struct sdw_bus *bus,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		lane_ctrl_ch_en_reg = acp70_sdw_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -895,6 +911,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+
 		amd_sdw_set_frameshape(amd_manager);
 	}
 	/* Enable runtime PM */
@@ -966,6 +983,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
+		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index cc2170e4521e..30244a31c21c 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -159,8 +159,11 @@
 #define AMD_ACP63_SDW0_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW1_MAX_TX_PORTS		1
 #define AMD_ACP63_SDW1_MAX_RX_PORTS		1
+#define AMD_ACP70_SDW_MAX_TX_PORTS		3
+#define AMD_ACP70_SDW_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW0_MAX_DAI		6
 #define AMD_ACP63_SDW1_MAX_DAI		2
+#define AMD_ACP70_SDW_MAX_DAI		6
 #define AMD_SDW_SLAVE_0_ATTACHED	5
 #define AMD_SDW_SSP_COUNTER_VAL		3
 
@@ -244,6 +247,21 @@ static struct sdw_manager_dp_reg acp63_sdw1_dp_reg[AMD_ACP63_SDW1_MAX_DAI] =  {
 	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0}
 };
 
+static struct sdw_manager_dp_reg acp70_sdw_dp_reg[AMD_ACP70_SDW_MAX_DAI] =  {
+	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
+	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_TX_FRAME_FORMAT, ACP_SW_AUDIO2_TX_SAMPLEINTERVAL, ACP_SW_AUDIO2_TX_HCTRL,
+	 ACP_SW_AUDIO2_TX_OFFSET, ACP_SW_AUDIO2_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO0_RX_FRAME_FORMAT, ACP_SW_AUDIO0_RX_SAMPLEINTERVAL, ACP_SW_AUDIO0_RX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_RX_OFFSET_DP0, ACP_SW_AUDIO0_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
+	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_RX_FRAME_FORMAT, ACP_SW_AUDIO2_RX_SAMPLEINTERVAL, ACP_SW_AUDIO2_RX_HCTRL,
+	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
+};
+
 static u32 sdw_manager_reg_mask_array[AMD_SDW_MAX_MANAGER_COUNT] =  {
 		AMD_SDW0_EXT_INTR_MASK,
 		AMD_SDW1_EXT_INTR_MASK
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 799f8578137b..6b839987f14c 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -28,6 +28,8 @@
 #define ACP_SDW1	1
 #define AMD_SDW_MAX_MANAGER_COUNT	2
 #define ACP63_PCI_REV_ID		0x63
+#define ACP70_PCI_REV_ID		0x70
+#define ACP71_PCI_REV_ID		0x71
 
 struct acp_sdw_pdata {
 	u16 instance;
-- 
2.34.1

