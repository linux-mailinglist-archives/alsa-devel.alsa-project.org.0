Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24AA16A70
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:08:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A57316022A;
	Mon, 20 Jan 2025 11:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A57316022A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367727;
	bh=lVgX+fLvSP85L2Rofn2ihdqZpltVmekJ++lM5pRSmPw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a4OoJWK1Gjcs3tRmcgkyPTYGled09IzObM36KleNwIKU1uvlwTM1sTgahUHpAh+qK
	 Zp9NITQw538tM6E7SRPqaNiJ5SNTC80kHialTo5iAAuSXnZTgDGQV0tV6BQ5pNca2I
	 l6UYybZHBl0VGdqBk4NXUDonXj8FF7gtd9ryadis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F4FDF8069C; Mon, 20 Jan 2025 11:07:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC33F8069A;
	Mon, 20 Jan 2025 11:07:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A1BF805E3; Mon, 20 Jan 2025 11:03:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A83DEF805BD
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83DEF805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TvYUFISM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+7r3vZP8i9inaIM27XRmllVMvJEVqxo07CVGFQ/8qquqdEFc459KoBEOJS5zhEYxEPKPaYrqO/Fm4QbMuwY68kBOjOBF+/ehuIwERAFzv6r1GyC2dBhbb3lKzuZ5vrPASaD5HbyRK6MI1gYiul2qCEwOKichsqfAmWVlwGz9wncxEOgeXUY9atiweH5MFgodAkZBlHXq6Z/+fQbHu6L3x7yAK9zjvBofoLdWmBGHttX5Ecj+TvRgNRxoSgs4RfzfHANKbE3fCOHSvUv/RhT1ryAqqeD4eNO6m+4zvHhTiHVtalwhxRK+vXV2UoDINq0XcnawO0j6o4OdiMSyx7+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z49mm4VSqdNYZlWWFiAkMujUb4pyfyf+byOBPncwc4s=;
 b=wTHFfJMj40Z+3vh8rvNplHBzCM7WDLy179dQ7ensa99zMxCBb6QQNfyaBBN7k12KQrcUdh359D26pEULdyWqy3yVZX6XmgzCUHDO2+BjIF2XEGnHHbC6UGfyGWwG4XTXPO51uwWDx2j5oQaSYRAoYdGOHmnDWUG1sMAOTmF9Bg2iOCw3a+xrKb/j+fvFv3rCxYSJkD3rNei7lBVXUakJuTH2jqUG5esdfjmoXWuVB7QGGHSTbs/1MR7nKTgHwgKAJ77Fh6lPIK1bX2+dVBsH7320MhRTsg49wb/JL3DuGkur2JhZLKIMZbSk65+MRioCQhg/AsNIMZGIA/db4aNOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z49mm4VSqdNYZlWWFiAkMujUb4pyfyf+byOBPncwc4s=;
 b=TvYUFISMV/tvwpOIE/6lZjhPJk5fd+co3i6d6+7j7OVBsnIw+I+LzMcIMupY91U6/+uFTysfHGspbTF+cIyjMVbFCXtBYYxJgKJluh20+hV5edM0ZBTPxaXDOgB1+Cql874c1l8sB86hG+wTGDDuGmbU4WKPQzch5ggWQcEzqnk=
Received: from CH0P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::33)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Mon, 20 Jan
 2025 10:02:58 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::f6) by CH0P223CA0015.outlook.office365.com
 (2603:10b6:610:116::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:58 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:54 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 21/23] ASoC: amd: acp: add machine driver changes for
 ACP7.0 and ACP7.1 platforms
Date: Mon, 20 Jan 2025 15:31:28 +0530
Message-ID: <20250120100130.3710412-22-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf5f3fc-8dd8-4b93-0d50-08dd39399df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UrkO8+4g/IDS0eseIf5anh8SQJoeVCxZevdssQ5M2N3RWrfV/rqlpX+cefDq?=
 =?us-ascii?Q?ytEEvt4DeVM/ctZLSFhzYZJRwwonE7aDJU+Vt+0j1R1WO10QLvGe6Sxv20pE?=
 =?us-ascii?Q?NBzUAY4vZhFILp70+TX8N3tKMdOlf/25SOLlZVZ47qpv4JOrvO7bEMYMZqRB?=
 =?us-ascii?Q?bzCQ5hd/DVJyyMeAqd63OIxQrILXh4burKixfW2s07ZOMdnf68YL0VYttLo1?=
 =?us-ascii?Q?Rlv9uqvTwlq9Fi/5Epq1jg6OkbvCpjuA1QrM5hGlZI8HZBzOV9WolgruERpK?=
 =?us-ascii?Q?czQxXzBa+9+g44EJoQVwtpV+VmB4BOV2qt2goS7s6HIUidNoLeGlxyWGv69a?=
 =?us-ascii?Q?ZX5oGZlnrkJgI1YfQomJxCvSRwPyQ9Z4yevzc4q+n9W1LWxcIt82fY3dW1f8?=
 =?us-ascii?Q?xG79qsVWpUUZ6NWs6h2o3FAJmKV5eveKPxZ9SV7VP9KIuS6A9PgzsvMkl9ko?=
 =?us-ascii?Q?Wo7eIqwuhjYVQRx5zFGlfPIje+Bmjlsh1lXGC6TH/CSems6V9kFbQt0wceUV?=
 =?us-ascii?Q?QCCgXA5gy9m9rrXPOzMBXts/mAImPP2h6t3Ms5O2DGSUhbVQOBJF6UjJ2jlG?=
 =?us-ascii?Q?SdaRml5U9gNp/yl5KVv+IKpQVcapacUqDzn3Ll2CMvK1j3wbsmZWJ4C7ILBk?=
 =?us-ascii?Q?MmbxLZHxZtFbzZAxqDPxYfZAd/6ZnPNohB8j0jQvvpKIhFHHl3/kbErVmOls?=
 =?us-ascii?Q?n70Vy/dI7qrybpBvyJGC/FXqiuV2G3/qCc1ajsuLjWqOQLZgn55xZ0rHyw8g?=
 =?us-ascii?Q?1k9dGYTh/YbYNHkCDmQLISBnpbGw+V/Y/nn4zGOQiqfn7xNLh+xbT81nF2oW?=
 =?us-ascii?Q?D9ZwYf8MeBSwTAi2xWAr0OdaA/JYMac+2WeslheYZGjT7OVwE7inuf0+VHxl?=
 =?us-ascii?Q?gLSA2VhhctYYnqxKZEoMxPns/t2Vf8daiQiYaBXBnH5s1uYefl8hVRwvbUzn?=
 =?us-ascii?Q?TgaReq+FgU6IJ6x2t+tQ3GPPGbRxcBazPnLhXxGQe2MYiKqVN+VBjdRogfr1?=
 =?us-ascii?Q?JgS0tMXOHiVTwX+4Ry2McOwSUPlOwV6jAyEuGTFzkqNfOLekekKB979U1Ikg?=
 =?us-ascii?Q?sDP/kzQC+XfTbQcc9Akr/Ayxz8MVo72eV4xz3Lo6tNZQ8PZPITq1pRobaBHE?=
 =?us-ascii?Q?nCGa1gOCRNvFUEI/vc159bbV7tI2UwZvbXhfPPMGmsTDmOwL6LSZnWx/pp9j?=
 =?us-ascii?Q?+rJPZU6iB21Njh35Sp3c3H2IWrbWO+Baf9MHS10tpPB2hp+lf9msONwZzDx3?=
 =?us-ascii?Q?dgSJf/4IBeTnzb+qAwrZeR2fU7jInuWfdu+IlHPKkVupeAJu6joAPB0LkWmX?=
 =?us-ascii?Q?8VuEwmJbdcAgbGYkkiMZlGuAovD0JiWvWXWGnv+zvw1Ylx00ZkFV5LNqHbR0?=
 =?us-ascii?Q?jKxlniILizH81K2z1TI0yuVR5zNxgTG6POTbMiaahM/Hhc/X49u+9UB8Wlgu?=
 =?us-ascii?Q?Baj5ChtWji+D33JuDU3kgcT3wXlkD1wuQ54wsLDGBNx9bZ/Csk0fc1S3fOuZ?=
 =?us-ascii?Q?QOq2C/IYLyJ+ki8=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:58.1673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cf5f3fc-8dd8-4b93-0d50-08dd39399df7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363
Message-ID-Hash: BXPO4B24DJ5WCQRQFSD6QTWF4CFV6RA6
X-Message-ID-Hash: BXPO4B24DJ5WCQRQFSD6QTWF4CFV6RA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXPO4B24DJ5WCQRQFSD6QTWF4CFV6RA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire generic machine driver changes for legacy stack(No DSP) for
ACP7.0 and ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 16 ++++++++++++
 sound/soc/amd/acp/acp-sdw-mach-common.c | 34 +++++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  | 11 ++++++++
 3 files changed, 61 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 9280cd30d19c..e27093d80cc6 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -122,6 +122,13 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			if (ret)
 				return ret;
 			break;
+		case ACP70_PCI_REV:
+		case ACP71_PCI_REV:
+			ret = get_acp70_cpu_pin_id(ffs(soc_end->link_mask - 1),
+						   *be_id, &cpu_pin_id, dev);
+			if (ret)
+				return ret;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -223,6 +230,10 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 	case ACP63_PCI_REV:
 		sdw_platform_component->name = "amd_ps_sdw_dma.0";
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		sdw_platform_component->name = "amd_acp70_sdw_dma.0";
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -269,6 +280,11 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 		pdm_cpu->name = "acp_ps_pdm_dma.0";
 		pdm_platform->name = "acp_ps_pdm_dma.0";
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		pdm_cpu->name = "acp70_pdm_dma.0";
+		pdm_platform->name = "acp70_pdm_dma.0";
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/sound/soc/amd/acp/acp-sdw-mach-common.c b/sound/soc/amd/acp/acp-sdw-mach-common.c
index 6f5c39ed1a18..e5f394dc2f4c 100644
--- a/sound/soc/amd/acp/acp-sdw-mach-common.c
+++ b/sound/soc/amd/acp/acp-sdw-mach-common.c
@@ -59,6 +59,40 @@ int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct dev
 }
 EXPORT_SYMBOL_NS_GPL(get_acp63_cpu_pin_id, "SND_SOC_AMD_SDW_MACH");
 
+int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev)
+{
+	switch (sdw_link_id) {
+	case AMD_SDW0:
+	case AMD_SDW1:
+		switch (be_id) {
+		case SOC_SDW_JACK_OUT_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO0_TX;
+			break;
+		case SOC_SDW_JACK_IN_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO0_RX;
+			break;
+		case SOC_SDW_AMP_OUT_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO1_TX;
+			break;
+		case SOC_SDW_AMP_IN_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO1_RX;
+			break;
+		case SOC_SDW_DMIC_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO2_RX;
+			break;
+		default:
+			dev_err(dev, "Invalid be id:%d\n", be_id);
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	dev_dbg(dev, "sdw_link_id:%d, be_id:%d, cpu_pin_id:%d\n", sdw_link_id, be_id, *cpu_pin_id);
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(get_acp70_cpu_pin_id, "SND_SOC_AMD_SDW_MACH");
+
 MODULE_DESCRIPTION("AMD SoundWire Common Machine driver");
 MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index b7bae107c13e..9bedccfe25a9 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -19,6 +19,8 @@
 
 #define AMD_SDW_MAX_GROUPS		9
 #define ACP63_PCI_REV			0x63
+#define ACP70_PCI_REV			0x70
+#define ACP71_PCI_REV			0x71
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
 #define ASOC_SDW_ACP_DMIC		BIT(5)
@@ -38,11 +40,20 @@
 
 #define ACP_DMIC_BE_ID		4
 
+#define ACP70_SW_AUDIO0_TX	0
+#define ACP70_SW_AUDIO1_TX	1
+#define ACP70_SW_AUDIO2_TX	2
+
+#define ACP70_SW_AUDIO0_RX	3
+#define ACP70_SW_AUDIO1_RX	4
+#define ACP70_SW_AUDIO2_RX	5
+
 struct amd_mc_ctx {
 	unsigned int acp_rev;
 	unsigned int max_sdw_links;
 };
 
 int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
+int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
 
 #endif
-- 
2.34.1

