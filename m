Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64146A2BB93
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:35:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A4060293;
	Fri,  7 Feb 2025 07:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A4060293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910136;
	bh=eKz94r03Bj3HUXDITDlMe71sedbSRkGB3BEuW/CGXH8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OdqfCswnOtSD1TFgddYCmic6oF0WimwdZqjrN3nO5uauZI0jogp8+8PAglQBxudsX
	 rxT9VE4hH2dPP8cVSBCCEx7iMr69kAE3YxBSyYIn4vq5uzszldF/sdPk4/ycH6/jPI
	 PWkgwYxuIdNJhkS3BUfNdMZqMqnfft9OQYkikluc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7331DF8970F; Fri,  7 Feb 2025 07:30:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D60AF8970C;
	Fri,  7 Feb 2025 07:30:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46B6CF80633; Fri,  7 Feb 2025 07:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6533EF8961D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6533EF8961D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=J1mVSdFO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcuXSO3uSWeG9+eCu4EAl9+3+xTVgTcdmO4oO2wjDF7TwhJFnf+/JdqqRArZ2pTtbLb3SVxXX/ewz0AqFVL0RcEMnPMml6wzkdSBpVlzuPUG8NyjY6DaEtd4EiheSOZGIPy/I3A6LXzP2W0InfwPuKWGKpLnuFwYZ3ZLiTmCbiWiOP1q8sSkiQgUSA/y4iFeOFuWa3s7zey3mHDOyWZ9D/ekrecmiGpoi9m37jzkwPQHISlwouXAx+9u5yMa713PXFm8f/HCxl1nI8A6XetDETYd4gNy1mhReRtL+dV0017o4dC5zH/cU++w9getrL2kHBUuJRn4Wfm+Bjvvw2qnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFtXbMu6V/L/QfGLSV6sdrizMEVOab+bPR3qdxribpk=;
 b=aVYJj89EdSpbwfT6095v8DiCfMNUB9HSRcg72lG/M/utL8ZvC9NZm7gEeguMFmo0/EyAzZi+aYksfm4TBSF8P+OeLIYcFnQYoxsKkw+OMWJ6OQ/osHtvrbbrQDS79Gf5suVMc6XiVniuWxSPL8SDcsjkn+irKj0avgkfjwBeKLHURZkKf+4b8HIq8dy4kboZA4Ah9AYEb6Qs4YbqRZgcaqfBs5z1EsFBAaSSLwtPWgUCDjgcN7w9/DMCjLA2p31Z3Q2jITX+6D265xIsHRX3ceTKm/9Sk/VUi2qTjYDEbXxOiCVfaMrSPC8lqOiRETKnNeYunGhtl+iXktK+MDOprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFtXbMu6V/L/QfGLSV6sdrizMEVOab+bPR3qdxribpk=;
 b=J1mVSdFONqvhm/reMi6z+szkIhmo9AahLDaObRpvqBy8fdngVmRtpeiXXCrTja7BpdiB1mKLmOEY5ecl0cMD7QAr9exqWmfoE9nF9xL40EYrQm09vN/J0Zzj9fRPa/n9a82aOdywSxb3cwN+SUxlJ8FJEQ8Q8QhA/ArkzrMwtzQ=
Received: from PH8PR07CA0008.namprd07.prod.outlook.com (2603:10b6:510:2cd::16)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 06:30:28 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:2cd:cafe::d3) by PH8PR07CA0008.outlook.office365.com
 (2603:10b6:510:2cd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:30:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:27 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:23 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 21/25] ASoC: amd: acp: add machine driver changes for
 ACP7.0 and ACP7.1 platforms
Date: Fri, 7 Feb 2025 11:58:15 +0530
Message-ID: <20250207062819.1527184-22-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SN7PR12MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 9083441b-01c3-4f45-d72f-08dd4740e995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NRejEVcS4aYcp3rCPv6Q3NVDtktjm4kAzkb9Y0ukW+6LkUTBVfSxoRQgR5TC?=
 =?us-ascii?Q?uf3OrWUBCunEdoFRNk+fY6wvy5vUoDH/csX8lzM4FR3QXc3/Lk3SyCygj7Cn?=
 =?us-ascii?Q?MbknTRYelGtsJKfQPyPG+QYm4/WF5ZT05SfmTOLwvMJmS/W1L/+GHmTcBoCN?=
 =?us-ascii?Q?MSWZb7W3zre+cEa/SW0Av7OnAKUuGp4g817nBxsmNbPlOP0djbkvjvWvitN1?=
 =?us-ascii?Q?HlZsCxjT7CHeGojR7VK1RSV/HOtPR1jDAUxsy7zZJqCLoO3vnTZ09KDVBDyu?=
 =?us-ascii?Q?tpT8yAT0MawoVfdeI7gFqf+HhluxeggVa8TrXwM813I81eQqI42xMOxXA38O?=
 =?us-ascii?Q?S9ru4iRtZfWs0DKaHrzEbKiP25A1MtQpuRl0P/M0fn0y9RN1XpZMufgKTshj?=
 =?us-ascii?Q?WE3Wuc8EKxR16MYHxSzzz5DMqBPcEi8KYEF/AFosA4IAp07cqPYABUuPa1ny?=
 =?us-ascii?Q?pKd/UM28kFAnfW6/DKNgRpd9APVx/kNqIWAdRWl9ujmOMKJyDLT1YMC1+vs5?=
 =?us-ascii?Q?ZoFQ9yBFr6XHhvN5TDmVMOZadPXGpqavpgjj1+UV4J2Jm0IlnMRIqiPNMGcy?=
 =?us-ascii?Q?QNsIo4l0asM4KRNkCXcgtNWaI6Pok0wsMu8C6Czr+DEzJpooyPo0g4IyGCxe?=
 =?us-ascii?Q?eEsQ595qR2CD5swHSo66TIFUzsM/dG8xlnQKtuT8L3IbwlPeya4Pup2Um7oC?=
 =?us-ascii?Q?vP+vH5fyk9kr6QvLb7nY/LH+vErk+77daISYpIeJ3HcxfyNYmLBISvjRMscF?=
 =?us-ascii?Q?NfUMuelIyTjcXJVqgZhSFI0BNnc6eklTtx7xSWQoX863+w1DN2Stc2veI7NT?=
 =?us-ascii?Q?GKxC/dY+fhg0q+WCIt2RaePWOVcqSPXEWo6MwCUCh9Py3CSa8CFF2kpaX7rL?=
 =?us-ascii?Q?5LzombZpYNFwIt8SUj6pg01hDkN6uIvq5XNuZMu5GxORlPM9H0HGevVaNbxu?=
 =?us-ascii?Q?FLSpojzDuc2NEvRe+GapPrwvmLJNOVty3ATzFsZA94HKrIcRwJESKPGvm81i?=
 =?us-ascii?Q?q/Z9kQrkJqMxG9p1cej0zokbJYxaneN2u3EpCkvrgXDwxwv0mBuAgEDIXykw?=
 =?us-ascii?Q?cBG9Gp1qlWjTWZOtww/wWRsf7rjRet4/+1EZcCnkna2eSoaYq0nH+qRVQWnI?=
 =?us-ascii?Q?ryjemyQR8u370Y+ASKwr+CcMbXbwQC3tDo8j6WHTzRMZLEj42uH/Y5LEwXaL?=
 =?us-ascii?Q?hWOsF7tPcoEo9Zox/sAZfcjvLcvo+QBN9FdIjhpB2ZR1ojzfM/JzHVRr1IE3?=
 =?us-ascii?Q?U8JtPCII8Tp2x/O/et7xqUhTUWLl2MB7PE1FAeZuUCNNPjZsKdZA80tJC8aH?=
 =?us-ascii?Q?ogjTuy3ryPqtZmluOoE4LzNsTbPRBoDvCwVIyJrN1Cqbsnd4peoiO6z0G1ve?=
 =?us-ascii?Q?rC9/OXHg7QHngQ3pCSoluMEWrBOcxV/GH7DY/4zs0BlIgCIuZBSRS0qIMInX?=
 =?us-ascii?Q?PDOyoYqMDdBCarSh6npZsz3rEQClBJyi2pDy9jRbg/3q0UWu82fukeSo0Obu?=
 =?us-ascii?Q?7IY8L8mnXGG9qLA=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:27.7306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9083441b-01c3-4f45-d72f-08dd4740e995
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297
Message-ID-Hash: JJ7JB26FBK4FJEKUCNWNUSHTLC5USXFI
X-Message-ID-Hash: JJ7JB26FBK4FJEKUCNWNUSHTLC5USXFI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJ7JB26FBK4FJEKUCNWNUSHTLC5USXFI/>
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
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 11 ++++++++
 sound/soc/amd/acp/acp-sdw-mach-common.c | 34 +++++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  | 11 ++++++++
 3 files changed, 56 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 9280cd30d19c..00aeea70f04e 100644
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
@@ -221,6 +228,8 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 
 	switch (amd_ctx->acp_rev) {
 	case ACP63_PCI_REV:
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
 		sdw_platform_component->name = "amd_ps_sdw_dma.0";
 		break;
 	default:
@@ -266,6 +275,8 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 
 	switch (amd_ctx->acp_rev) {
 	case ACP63_PCI_REV:
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
 		pdm_cpu->name = "acp_ps_pdm_dma.0";
 		pdm_platform->name = "acp_ps_pdm_dma.0";
 		break;
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

