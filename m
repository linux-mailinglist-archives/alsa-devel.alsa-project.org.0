Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3AA16A9A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:15:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4489160258;
	Mon, 20 Jan 2025 11:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4489160258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737368150;
	bh=k9Oz06RhQF42q/XAvlMAQM+ouIyukbClTMhuTOPhkbs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V4qwWtJWWqvKrAinBKWhOwkukUzhSv2ZQosOa5FX7et0QR92jAuseNchFaVxCHtMF
	 X0Sl93TTx19wa62xf0m7SFm0+LZB8eesvMwLyxPuwDqOyCFjP+43hWwLVajEG3Bxxc
	 9Zasx8Zmd2T0svUcKv3/RLKd3oubz7P9V4DwDtnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCA82F80619; Mon, 20 Jan 2025 11:14:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA9AFF80618;
	Mon, 20 Jan 2025 11:14:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6694F8051E; Mon, 20 Jan 2025 11:14:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::628])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 471AFF80482
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471AFF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ClJNkxZ6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQuw4JjlaUwDfHVPG6zijzoE0Tx8hgryO8Wo5EZ9ZifyD/gQ288N2V1+zjjlrZ9ngsksphI2NeCFklvm+HcvDqsPdJgU7CmWbOpRbFwyEQxKwkyy5MAui6py3+UeFh3hUO+7orX5Wwi4cNIUOoF9jFa+YVvBfJzr+MYi6zJGp9Y5frAt3uabNht7hIzKnTs+NtvRqM0tvZtxWKHS4Mv7sR75nQEi2XR+XuTPxtRRbZnepAHH9QKVe+JmU5DRsVMH3g2mKJBZpXMiHyh+zaX2FI3xtiW/CuSEuH5UM7QT4aSPxPXkwtV+rU/GEGvaRpFtasnVMG4r5474njGUQT4avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3WxOOMvL4pQK+BApD8q9r4vu1VBRD3F/XVuLfuP1pA=;
 b=HGfskfWFEZGOH7clLvY0pJCLuzOSi5L6N+DXbKwnWP1HgUDg4OCGQxLRrOLiKBMNZc7E79T04ud+98xvEKJZen39v5RDXSrAWxaxIW1o2XQMMcoWb+K9wJL6p2dKr7TQq1wySv11NHUMOQU5zhg46P3f80RRg3NKMDjhL+HO1DkPthxEmfpIcQgs32ZA2AUaDHWPJU8dk5GnPQ8BPG5K7MX017a+C0h52mFaGUzX3qspxZh13wPRA+rk+xUxmT0Z/SmCVdkn2p0YtNUqYpB9C8wzGRx+eN40lB1N/0yLFwyPLoG+btmepuqMkuvX4e0eBQ6Svv953+lJu+fnHPNnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3WxOOMvL4pQK+BApD8q9r4vu1VBRD3F/XVuLfuP1pA=;
 b=ClJNkxZ6Rbcx9Yv7uHiXK4YRfocgFU7QNADLiQVhGyFQm7lPyzMr/rbwoI87OTaYwayEm8lme0nYhsaG5/izjiNxwmwJIN15+4iG7m/LNl6WdEzxo4xQMwRaKFS/MKSeq/G6I1XAHpcQ3v5nmQCeOEwybolFtjAyLSVcItkHea0=
Received: from MN2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:208:134::35)
 by CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:13:58 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:134:cafe::69) by MN2PR16CA0022.outlook.office365.com
 (2603:10b6:208:134::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Mon,
 20 Jan 2025 10:13:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:13:57 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:13:54 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 4/7] soundwire: amd: add support for ACP7.0 & ACP7.1
 platforms
Date: Mon, 20 Jan 2025 15:43:26 +0530
Message-ID: <20250120101329.3713017-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
References: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 046c90ff-30a5-4641-b2c1-08dd393b272f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?secUlAD+6hmBhDno4SXUiifj9+MaAid7voJXABG26I3XaFIyAZ4NVjBSoeRm?=
 =?us-ascii?Q?0QgaRyb2lbnGYzZm78W9bzW3b/Oc1r2Q9+BGlXFFk1JnwlJkUIESl93N7EDn?=
 =?us-ascii?Q?+u3bk4OPfkjyRpSxLIWxv3rNLnd7Zxbc0A4CExZg2LdEoR15S7AYsGpycIJz?=
 =?us-ascii?Q?fINxqy3/w1nz3Vz16N71iWGdSo4bmI/Bcgsqgx1oQk3GWUMgMomWj5l+VtuZ?=
 =?us-ascii?Q?7mYMKblNwMRHvgqIAscBpdsWjMTDqeak0wCblJGj8QDBAc2Ua/fdpVEmhgJ0?=
 =?us-ascii?Q?XpllWtsODgF/HRF33F9wKmJqVrPE2Mslrd607Xya5wgPvzQjHJbVAId4GjjI?=
 =?us-ascii?Q?S+oMXor2lTmUYRAFUwQ8ORornM8Xzb9UhEJ2Ld20B2ia2hL6g/Wlc1CT0AcP?=
 =?us-ascii?Q?K8MrSRg8dTGX0mMIyplm4rrXHrzGRk8EOLzgAORhNFeFSPdifB64KElwptjP?=
 =?us-ascii?Q?SzJQ6JU8ZISYa5lBIFuAJIoca666VJWQdo03/ynVbgty0vTxcn+02c/ARmF3?=
 =?us-ascii?Q?GDnIx4nXykiw+uZglizrHsZfuPsA14VHFOgtlmlpHmeFX9pCD8XnLlqZnx3k?=
 =?us-ascii?Q?Zhk1x9Tmf2dnUOrl+kNSP51zwyJ6HP3bhKbSNWlClian/L1efl+dYwmW7ibm?=
 =?us-ascii?Q?ReuAlvP0iM3GLF+x5kBAK3HhSAWMvhTnRjt83LmLNWFmWe31ZzGLKP2LTHPZ?=
 =?us-ascii?Q?PScIDvSoID4uQ0ijiCcdQM9SqJOk/qfGS7I8iFm9w2HmFuRg5AFs1J3qmxdi?=
 =?us-ascii?Q?X9pSNrh6DxaD7/8XP1T3FWlm0lazniE68KQrEd6WLLVOHsBfRs0Hxuk/GDbY?=
 =?us-ascii?Q?O/z97yW9mdmUy6Fg9G1NVu9/g1nNzRlrCoIc7nEBviiAxEu2H/oLaeEv1JLO?=
 =?us-ascii?Q?E9ziG3H4FuHW3Zxv9D0poCUKH8mBY2A9Sp2btZ7sNnZhrgWid5wB26eyWKCO?=
 =?us-ascii?Q?abwByKwF7q57vgXPTMk+XoL6AFiXBsm5omSouGmBtT2eiXtbGf/xhA2qNwTP?=
 =?us-ascii?Q?469vXUxyoz3bSTA64yzmmBEZugi3EZ0nsf1AmtRLyBiG6q13F7ViIFxhMH6C?=
 =?us-ascii?Q?a+qIkEpiG4dz9JPozVaucIjKywl2lYU7TJTr5RrGGNLbf6f/m0ZGtKJ3OLsm?=
 =?us-ascii?Q?L1qxKF+/h91Bsmtbsv2HOySSvtWfgXtQIT2ev02AkZ5T24SHlNfG0O17d7nT?=
 =?us-ascii?Q?WQxHhXh2Zty9W7dn34I6txyYFJV6U2gepnH+p+f9zmvAKrCQ0JGFmnHvYH/D?=
 =?us-ascii?Q?ju/yZ8pgSMNI7gM8rItZQgoHBzgkcNVn3DHn41dyKKQvojl1d9/I537XtXvx?=
 =?us-ascii?Q?sxuhKwIgfbnoVZQhEM4NV7Pm9hbwLP1L5ZHFq0Ws0+o+q4V+3FnPTvrgkWfU?=
 =?us-ascii?Q?7EJrfitruJYiMzyW1rLGQVa4S/RKkzOzmTbmiwynm457WJhc6KLF3cpWY1Hs?=
 =?us-ascii?Q?+PwjJzx/Y627d3jWxt82ap1GpQ1uWGgvNm7tAat/q7GuxvPVAuIl5gH2PcF6?=
 =?us-ascii?Q?8Ya6n2VdeU6LJnI=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:13:57.8988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 046c90ff-30a5-4641-b2c1-08dd393b272f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147
Message-ID-Hash: QC3OLKTDYM4VMCH7BMGT6RQXE6UWFEOL
X-Message-ID-Hash: QC3OLKTDYM4VMCH7BMGT6RQXE6UWFEOL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QC3OLKTDYM4VMCH7BMGT6RQXE6UWFEOL/>
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
index 6831b3729db5..d611498d5488 100644
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
@@ -898,6 +914,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+
 		amd_sdw_set_frameshape(amd_manager);
 	}
 	/* Enable runtime PM */
@@ -969,6 +986,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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

