Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0BA2BBF3
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 08:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE846028C;
	Fri,  7 Feb 2025 08:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE846028C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738911640;
	bh=rpY0UQG0zI9sTtJedIm/Rm0zDwGSVLpnVaGyZCZLBW4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G8TvUJjRmvybryf++LSQYjgJPLgTl5rSPSLInNePSjY0J3+LXQcqGUTli5VS3H5Ie
	 9tucv3cuAXjFBmLH91detcthYc4x8wrcHMxaWhiIB/dNy+mESDmfUh0lHd1yTMgGyH
	 ev/TGAYn/7YG7vGwcKWT2dGyhbkyFG1XfFqnZjVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62433F80639; Fri,  7 Feb 2025 07:59:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05621F80623;
	Fri,  7 Feb 2025 07:59:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBFA6F805EF; Fri,  7 Feb 2025 07:59:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::61c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01A26F805CA
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:59:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A26F805CA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=x4ien3CN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUGDKpzJlszVs5yWSazii/g2f8+xn5D8W/jhGhSIPvr/zx4J0KeCgF6Krj2KHo1/cc+WeIDJxx1FVIVdwGK/gPhqGgmIeutKOefyWLaeEumIXIpWt1J32n2j7a5s2GlB2PUV0oSWEAbcUV75F1+iRHpaik81Xw7BN7xyi/wFR4p6ynh2pwew6Typ5Zm3rr7VFGtlrIVLXzonr7nx40oh0SgqeOZFGn+y7FiMBwsVF1FmFdxkKJ7ECOiotFAkjpo7d2wIqbAL8BnI3roI0J5HO1ti9fHNrqHJ9muLpWlyKNvJBJ7q4kIxDoslW61/3ACMltkqC3IPyZVCzwkdeOdWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYkKr7Jpj/LcVoCazCtSSUxDXwImCccMDO0KKt5kxQo=;
 b=xu3NyX1EDHgzM2VpLt8TByMavPkey3IUofDY5rv+Hgi88jn1Y9oD/fV5bYC67ekmZGPpYMDAgdnn5J93N+Ot6OLlo7NwRRM7OD320iKmwVRn7gOzgIbNQlGsZgUAfhiVsnhFGSIock3FELsPRBHQoCJIC/ZR4fGl229z9xPwlMfxwI+D72Tx5LQQnV9aFGNy+98MNs2TJvAw4g+AnzDdWaqrL6fjZeqLF4sCyrOqPPXfwCvIovzWTCPe43Xldyvkm+18IU1GY/dmlCvLiMLswwhitdE0k2EHto+i4Om3QO+UzQruSUiToS5reqCrpnNeyVOlx7zw1fuEAj4rD3eh8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYkKr7Jpj/LcVoCazCtSSUxDXwImCccMDO0KKt5kxQo=;
 b=x4ien3CNce3MmHHnC3w9ldrCfVdQc5leO1wqiY+OkW94bvPCCwVFj6uS5waB1WGROMtx3rQxwJqAVhiCn7aym8EemwgoJ9FBPUYFYw8vxrVf+wY2EFI8Fj26YxFxJsNZIoZad0j63ybdplEtfH82DOTJ2lNUS9+TCfEoJipA/5Y=
Received: from SJ0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:a03:333::20)
 by IA1PR12MB8239.namprd12.prod.outlook.com (2603:10b6:208:3f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:59:11 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::c8) by SJ0PR03CA0105.outlook.office365.com
 (2603:10b6:a03:333::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 06:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:59:10 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:59:05 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 3/6] soundwire: amd: add support for ACP7.0 & ACP7.1
 platforms
Date: Fri, 7 Feb 2025 12:28:38 +0530
Message-ID: <20250207065841.4718-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
References: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|IA1PR12MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: c42e96af-b66d-4aec-a940-08dd4744ec59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1SR9644R3sXBxEGAvXR/7IiBKq45apTyuNU0q+Yg8lJQotgTfZoKmWvD/1j5?=
 =?us-ascii?Q?DN211ANVoKMR0Snv6OLVyij4Ad0mQBVNWp5BnXhX0fh8UGh/Q0xLiZUJDEXu?=
 =?us-ascii?Q?q5rVyx/PoVS3y1Q7eSCP8F6jVbB9mlCWUmRwiNqUdsxJr3lTRx+nB4OAGM8c?=
 =?us-ascii?Q?4SWA0qMuZsQ1mVDw/p+YtMfNSybOt1iABdz9bdzVmoi0nvurlugdFpuWWHGk?=
 =?us-ascii?Q?IXMpGq72e4AirDm+QEJr4YZvfG3gS0GSHLx5MzMwQ+d0cBp/kG+1eHx1b1Bu?=
 =?us-ascii?Q?fnsB5ZCchOu8MkN9m/GZTXc4uhhlJFPNeG6VdNeiH12q/HdGRwQ/RUbxiJWa?=
 =?us-ascii?Q?A2QKig7vDM48AeTqzQZ8CIr7SN9OdRO5/x55g5yRVnxyiu3hDdKiuBb5SHaA?=
 =?us-ascii?Q?4IfEHpxyjD0isgeEIhQwvoWjsRdiPTLR/BDKJnznNtwqY2V6Q5dhtE8+UWTo?=
 =?us-ascii?Q?ZKDbZRMLCcYZgdViiwARPcNMo0bkWh0QN7sYFD4GpKn3dfocL2gRBrL0TJMy?=
 =?us-ascii?Q?lI8C4iUzrkWBTEdp85pKOADi9hWN4TNqRti7Ew37tx79g5quhwlI58Qd432C?=
 =?us-ascii?Q?ftNWNcCaZsgKlQGGKQtpYAG/5E1YDC7I03J8QDMVSSxZR+HFuaAeqGtJ5kJx?=
 =?us-ascii?Q?25ME6n25a1PKHREoTCa4YDawyPLJXEAVUhouWiFvzWNihfTA2Y8KF3TSO3ig?=
 =?us-ascii?Q?98JQSJYKt31NFvuBZ9YG2xLw+eIwjtRafCo/Mq48gzn+zqPyZgegVZTGL4uH?=
 =?us-ascii?Q?ooptzMKRKFY5lXLK2Mtq0hme6n12VGv8eq13VQKF9hy8FfPS2Rtj9pyHkJQv?=
 =?us-ascii?Q?fzFMNrhfKT567us5Qs0pDPKFJS49YueA7OeBCwDYbgdu90PHE60jce8qK+Bu?=
 =?us-ascii?Q?QZf3iCRDw7kqFsh13XwK94ScUfik2fl7TP3yLGBii06u23KiDISr3yS/T10G?=
 =?us-ascii?Q?uMSpMsHTPs6sy4JVsG4kjN2ThT9h912CL2gPYAcij2jjtnT57mEKYRXteOSr?=
 =?us-ascii?Q?jqjCTCd4PwAVdpY7Ky0XXSqUUgp1mDNFW+hUqv119hh9dJKlUf05Q9EUazYr?=
 =?us-ascii?Q?5Ygbchx5gRuMf+S9hFZE9mGvUks8ygkknA5VpkdodWMidBqzebmxTzeIFgw+?=
 =?us-ascii?Q?1nzr0mKMJFoC/eFVyX6/2XNLpW5BhOwJPWYjkpPXfZgvc9/faR3n9gOzi7uK?=
 =?us-ascii?Q?XLChp3gB32d+1WRnoE477L0qKDhb5XpaS3eVzRL49fLJspuHgsmYZ4N44dSO?=
 =?us-ascii?Q?nwY0nFs+x+wjWMoNkhfGBmaW3JS3CQ/7x7+xTU1PAdIljH5VqRhKJaLwEJtJ?=
 =?us-ascii?Q?pfXfTf58VOGCqAUPJFy5jD/a8WGQie2mwjZK6RyrTSVg2uVmkr+HOPWvLC+A?=
 =?us-ascii?Q?BUU12m6nM7oYy1TXXqIi25cfGQ43Xvzm0vW1TrTH9N53MmhQ6Liimuh+YZ2y?=
 =?us-ascii?Q?L0tjXx7HuxVrfYfXNykqD/Om/LNtIH/po5BI///5QbpnoQG99SdtUYC9WA9U?=
 =?us-ascii?Q?j3iYd8OIwS8AvK4=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:59:10.4031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c42e96af-b66d-4aec-a940-08dd4744ec59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8239
Message-ID-Hash: SGQ5KRJVRQ5IN24WFMGFPLD3QJVOXAI2
X-Message-ID-Hash: SGQ5KRJVRQ5IN24WFMGFPLD3QJVOXAI2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGQ5KRJVRQ5IN24WFMGFPLD3QJVOXAI2/>
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
 drivers/soundwire/amd_manager.c   | 21 +++++++++++++++++++++
 drivers/soundwire/amd_manager.h   | 18 ++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |  2 ++
 3 files changed, 41 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 60be5805715e..a1ea7b95b4ce 100644
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
@@ -966,6 +982,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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

