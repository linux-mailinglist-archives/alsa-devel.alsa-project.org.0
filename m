Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306F969C0C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B688814E0;
	Tue,  3 Sep 2024 13:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B688814E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363491;
	bh=sucrGEUl1BiAnZb085qAlT0S+J4ipUYrtJEatGEi2is=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BgvezOjz7oouZgESaiGAAr23YHtEq1+frtqnRIb4vnk5yOPp35IRaTjMAQwjRqikB
	 3XGYsNr96e8rRNPpvi/C9BaCfam2/eocgwceLYW7I+TBLcZAZw7Xf0scWrVlCAnhpa
	 oWhVnqttwLFSe1kPPl+mmXUMI6IoqUGUd85OcHK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85D28F80638; Tue,  3 Sep 2024 13:36:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0510CF8063B;
	Tue,  3 Sep 2024 13:36:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 614C2F805AD; Tue,  3 Sep 2024 13:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB7C7F805AB
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB7C7F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S748OFxE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzYfwSyYRlF1vC7TGoqK14mQZQ3IoWUSQqu/Sn8pL7RsgGlSOv/et+UySq3xp+yBISo2Y/72L59rtDJ5Ua2EVmSj/g9pOei03Eh+4wAC75XoJIE799lnCKdJfr8mNSW5LxKSUkLK151sHwgAN1EIXb0MZNl1Y2TVNO0h7vq7iQxSCodaXvzmIJH7QGpY3bePdEvr1X0gEfdG3doz9gbOVuL7xUpnbpuaKr73MNRInXZvNCcqzm0eGkLkqI0tDKblLRZduhGsuJj96XX6x4WAiTfibcPRK9iOIwF0DvOYk+llanskkaGDOU/wymWgkz99ZYtz9hpsLjdNYXQBxRPe/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYw6sufEDxN/fNfdWXIXqI0THcGf4mG/ednPRcU5XY4=;
 b=BpQ5NoiR7vESPFCAazQ4kFvaMCoQa/SV58nt8O8q4K4zDCY1SacoYuNWtekheJPr22Omz8esOeNUnMvIo89LMJfhTekWJHthh9/zdsw0QY6MmjQgWFJmlxp7SOSzJqyg5xchNq8YWGiXwXioyX/7zu18xLBetsLrt8yscBHKaYaUmFPp1nZL1uYsxojxKhR7hNK/XUk6w9DoUIXTiR/BU48FMJ8hh42MvGmS6aEoi1Kn3augr3c/O/Yhymn4T0ovcmM2OszaPwHI8KVeuJhxRb6+iUn+KUmhhg16lKoptbOBFlfgvmqBkgudJG2s648oZbaXlGAKCavqOkAJZw32yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYw6sufEDxN/fNfdWXIXqI0THcGf4mG/ednPRcU5XY4=;
 b=S748OFxE9kGu9BsQVpN3Z+gj1U2VPrq76BVOhLO6shKAL7X/y9RfSBJvevYgPNiGG3MLdQ+q81dHTfj5wX69svoRe7hVre4k3+RItJnSwvBxM6Sj+1P86y++EsDmtpC9lGkuLgZ4T81Bav5crV+TADpp8rOYUoN6pRdI0Y7DKlc=
Received: from SJ0PR03CA0345.namprd03.prod.outlook.com (2603:10b6:a03:39c::20)
 by PH7PR12MB6537.namprd12.prod.outlook.com (2603:10b6:510:1f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 11:36:31 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::8d) by SJ0PR03CA0345.outlook.office365.com
 (2603:10b6:a03:39c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:36:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:36:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:36:29 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:36:20 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Syed Saba Kareem" <Syed.SabaKareem@amd.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 10/12] ASoC: amd: acp: Add pte configuration for ACP7.0
 platform
Date: Tue, 3 Sep 2024 17:04:25 +0530
Message-ID: <20240903113427.182997-11-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|PH7PR12MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: f18af8cf-0d3b-476c-87a1-08dccc0ca7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9H89o3TcHgVUvKx8Xb0g2EF+Ugh8SNFZJdnvt2US4klAAhzsbY3TbwvGso+7?=
 =?us-ascii?Q?EIA6sNaLtFrW4TAHAXUNYaZKIJOz50XOIMEumRxQsCW/QHE309pNIbAQxRof?=
 =?us-ascii?Q?ytphRZEKHIarwW4r1BTGLpgGyESt2IMmbBh1WcO19IaRtPDpKPNWjFY3/+Fz?=
 =?us-ascii?Q?HK8+Rm2J8MS4HlU0UKm1WzqgOszQ40jZHqB/ZNcIoY2Gs/V7j0hUFOViggNf?=
 =?us-ascii?Q?5hNd8eT3PgXAgkVlBpzWHCHUQbpzQXBFQhJ2DFqlQWpF33w2NFXTmCjM1aHN?=
 =?us-ascii?Q?Q6zIHg66u7Ozv1v7e8S/8MTTCnAUjOEqpG2jOp4uGsdVgaU0w5CO+VNjJpsb?=
 =?us-ascii?Q?pRRwwGsBTH8j1tXqJfBBWeKq3zJxeFljTX/cEpdV7L3AOT4FWfi1o7f8MqFD?=
 =?us-ascii?Q?M7W5Rw4ap8dI10BGO8JmOBov8Xy2/xES1YiOy5Hc/D7dTqItRJA2JG8VwrjL?=
 =?us-ascii?Q?iqkZvGegv+jM3zkRdcDlxPoJdcpOAyUe/prtVm076dNDv/8inlUsbqyC8AP2?=
 =?us-ascii?Q?b/6PX9d0Alfi9jiX2Pj61dQCuXVL22pKtdlRz7nQHqASjhnLQ8kUx3vGCT9W?=
 =?us-ascii?Q?1vakvAeFm13oJ3TP1LL+1/Mn663+OIDd06n1wB9TzaS3e7BJeomB1UHdqe/5?=
 =?us-ascii?Q?NvFk5PMQIILYdBf8Uf0jfUYIYBDXf2QGrFobVQGC7kKb2EtWDax6PEyXBQBf?=
 =?us-ascii?Q?Em9YXZByNn95dfv7ZWDlhGS1EFeYJPNtnjmdIElLfGXSM93k90rZsC8WELZo?=
 =?us-ascii?Q?JKFpF4+dM/oLiqxjXVdvt8WN+SqgMRivdPJse8W2GcR04VREFFTPE4eRQ1U/?=
 =?us-ascii?Q?WhiEjoiDDoTpv2yLnSYPm9I4rmFj0UJysfumhWfe5R/zl1Hna1JElhwd/9Hs?=
 =?us-ascii?Q?ViaBuIUyT/V4kqCG59NOldNDoNk7ZJIcsnGnYR6tNoCIZ/IzQIChWfSqZUkz?=
 =?us-ascii?Q?qYYsZ6zntMhkUzuA/W72ILLe8WT+QGNs00+acBihlEaDBPN4t9HNaaRp++r2?=
 =?us-ascii?Q?LAf2/UmJq0+/9yCUdWFJZj88Yvrw4yBuMfKAsAYIsQ0ht07pPqEck7aD6/lQ?=
 =?us-ascii?Q?QWcBJBgGBQgRhkmrZxQu/2jHa8zJtmDniDhzoxsmf+UcYdha+bgOWZ2ma+Hy?=
 =?us-ascii?Q?X8Hq4JwD275vmvD4cI30lf4sB8V8fPwwawxwvFo82IIwF4Y0Fk8VpRaoSiyV?=
 =?us-ascii?Q?ZaGOklwYC4m9HokeZa5LXo4QEtG0FaQRTttvvuMIAczj3pBLWzkkwpx1spkb?=
 =?us-ascii?Q?Lqc8/GCs7XCkS6rVME5eMnsgXxO2TNol+oK9mqb8xl6LVkEQTj/5Dvhyen61?=
 =?us-ascii?Q?I8kt5H4e2sZ2SZ8FC0OsxlhIWDczPPpFsC8LQEujmYtc2Go+anDByc4x27S/?=
 =?us-ascii?Q?WG0iiOTtKAvem57Dn1hYW1sXPA69N8YzZNFhhLnHMogye1/v1k1wdL2A/RDl?=
 =?us-ascii?Q?1hQRBT+v5F3XWWfY3PTNBs2k53fzYOhF?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:36:30.5365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f18af8cf-0d3b-476c-87a1-08dccc0ca7ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6537
Message-ID-Hash: P4HZU4NWBMBQWIQAPWV24KMKC2HZB3ZB
X-Message-ID-Hash: P4HZU4NWBMBQWIQAPWV24KMKC2HZB3ZB
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4HZU4NWBMBQWIQAPWV24KMKC2HZB3ZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add page table entry configurations to support higher sample rate
streams with multiple channels for ACP7.0 platforms.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c          | 33 +++++++++++++----
 sound/soc/amd/acp/acp-pdm.c          |  7 +++-
 sound/soc/amd/acp/acp-platform.c     | 53 +++++++++++++++++++++++-----
 sound/soc/amd/acp/acp70.c            |  4 +--
 sound/soc/amd/acp/amd.h              |  8 +++++
 sound/soc/amd/acp/chip_offset_byte.h |  7 ++++
 6 files changed, 94 insertions(+), 18 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 2a23c52eb512..74f2ad62e596 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -514,12 +514,14 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 {
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip;
 	struct acp_resource *rsrc = adata->rsrc;
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 reg_dma_size = 0, reg_fifo_size = 0, reg_fifo_addr = 0;
 	u32 phy_addr = 0, acp_fifo_addr = 0, ext_int_ctrl;
 	unsigned int dir = substream->stream;
 
+	chip = dev_get_platdata(dev);
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -529,7 +531,10 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR(adata);
 			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(adata);
 
-			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_DEV)
+				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR(adata));
 		} else {
 			reg_dma_size = ACP_I2S_RX_DMA_SIZE(adata);
@@ -537,7 +542,11 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 						SP_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(adata);
 			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(adata);
-			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
+
+			if (chip->acp_rev >= ACP70_DEV)
+				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR(adata));
 		}
 		break;
@@ -549,7 +558,10 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_BT_TX_FIFOADDR(adata);
 			reg_fifo_size = ACP_BT_TX_FIFOSIZE(adata);
 
-			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_DEV)
+				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR(adata));
 		} else {
 			reg_dma_size = ACP_BT_RX_DMA_SIZE(adata);
@@ -558,7 +570,10 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_BT_RX_FIFOADDR(adata);
 			reg_fifo_size = ACP_BT_RX_FIFOSIZE(adata);
 
-			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_DEV)
+				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR(adata));
 		}
 		break;
@@ -570,7 +585,10 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
 			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
 
-			phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_DEV)
+				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, adata->acp_base + ACP_HS_TX_RINGBUFADDR);
 		} else {
 			reg_dma_size = ACP_HS_RX_DMA_SIZE;
@@ -579,7 +597,10 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
 			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
 
-			phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_DEV)
+				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, adata->acp_base + ACP_HS_RX_RINGBUFADDR);
 		}
 		break;
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index bb79269c2fc1..22dd8988d005 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -31,9 +31,11 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip;
 	u32 physical_addr, size_dmic, period_bytes;
 	unsigned int dmic_ctrl;
 
+	chip = dev_get_platdata(dev);
 	/* Enable default DMIC clk */
 	writel(PDM_CLK_FREQ_MASK, adata->acp_base + ACP_WOV_CLK_CTRL);
 	dmic_ctrl = readl(adata->acp_base + ACP_WOV_MISC_CTRL);
@@ -45,7 +47,10 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 	size_dmic = frames_to_bytes(substream->runtime,
 			substream->runtime->buffer_size);
 
-	physical_addr = stream->reg_offset + MEM_WINDOW_START;
+	if (chip->acp_rev >= ACP70_DEV)
+		physical_addr = ACP7x_DMIC_MEM_WINDOW_START;
+	else
+		physical_addr = stream->reg_offset + MEM_WINDOW_START;
 
 	/* Init DMIC Ring buffer */
 	writel(physical_addr, adata->acp_base + ACP_WOV_RX_RINGBUFADDR);
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 55573bdd5ef4..6ef9baeed74a 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -177,17 +177,20 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
 void config_pte_for_stream(struct acp_dev_data *adata, struct acp_stream *stream)
 {
 	struct acp_resource *rsrc = adata->rsrc;
-	u32 pte_reg, pte_size, reg_val;
+	u32 reg_val;
 
-	/* Use ATU base Group5 */
-	pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_5;
-	pte_size =  ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5;
+	reg_val = rsrc->sram_pte_offset;
 	stream->reg_offset = 0x02000000;
 
-	/* Group Enable */
-	reg_val = rsrc->sram_pte_offset;
-	writel(reg_val | BIT(31), adata->acp_base + pte_reg);
-	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + pte_size);
+	writel((reg_val + GRP1_OFFSET) | BIT(31), adata->acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+
+	writel((reg_val + GRP2_OFFSET) | BIT(31), adata->acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_2);
+	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2);
+
+	writel(reg_val | BIT(31), adata->acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_5);
+	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5);
+
 	writel(0x01, adata->acp_base + ACPAXI2AXI_ATU_CTRL);
 }
 EXPORT_SYMBOL_NS_GPL(config_pte_for_stream, SND_SOC_ACP_COMMON);
@@ -201,7 +204,39 @@ void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int s
 	u32 low, high, val;
 	u16 page_idx;
 
-	val = stream->pte_offset;
+	switch (adata->platform) {
+	case ACP70:
+		switch (stream->dai_id) {
+		case I2S_SP_INSTANCE:
+			if (stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
+				val = 0x0;
+			else
+				val = 0x1000;
+			break;
+		case I2S_BT_INSTANCE:
+			if (stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
+				val = 0x2000;
+			else
+				val = 0x3000;
+			break;
+		case I2S_HS_INSTANCE:
+			if (stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
+				val = 0x4000;
+			else
+				val = 0x5000;
+			break;
+		case DMIC_INSTANCE:
+			val = 0x6000;
+			break;
+		default:
+			dev_err(adata->dev, "Invalid dai id %x\n", stream->dai_id);
+			break;
+		}
+		break;
+	default:
+		val = stream->pte_offset;
+		break;
+	}
 
 	for (page_idx = 0; page_idx < num_pages; page_idx++) {
 		/* Load the low address of page int ACP SRAM through SRBM */
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index a662c7db7506..3b3bd15964fc 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -34,8 +34,8 @@ static struct acp_resource rsrc = {
 	.irqp_used = 1,
 	.soc_mclk = true,
 	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x03802800,
+	.scratch_reg_offset = 0x10000,
+	.sram_pte_offset = 0x03800000,
 };
 
 static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 9fb4e234d518..854269fea875 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -62,6 +62,14 @@
 #define I2S_HS_TX_MEM_WINDOW_START      0x40A0000
 #define I2S_HS_RX_MEM_WINDOW_START      0x40C0000
 
+#define ACP7x_I2S_SP_TX_MEM_WINDOW_START	0x4000000
+#define ACP7x_I2S_SP_RX_MEM_WINDOW_START	0x4200000
+#define ACP7x_I2S_BT_TX_MEM_WINDOW_START	0x4400000
+#define ACP7x_I2S_BT_RX_MEM_WINDOW_START	0x4600000
+#define ACP7x_I2S_HS_TX_MEM_WINDOW_START	0x4800000
+#define ACP7x_I2S_HS_RX_MEM_WINDOW_START	0x4A00000
+#define ACP7x_DMIC_MEM_WINDOW_START			0x4C00000
+
 #define SP_PB_FIFO_ADDR_OFFSET		0x500
 #define SP_CAPT_FIFO_ADDR_OFFSET	0x700
 #define BT_PB_FIFO_ADDR_OFFSET		0x900
diff --git a/sound/soc/amd/acp/chip_offset_byte.h b/sound/soc/amd/acp/chip_offset_byte.h
index 97b8b49f1e64..117ea63e85c6 100644
--- a/sound/soc/amd/acp/chip_offset_byte.h
+++ b/sound/soc/amd/acp/chip_offset_byte.h
@@ -12,9 +12,16 @@
 #define _ACP_IP_OFFSET_HEADER
 
 #define ACPAXI2AXI_ATU_CTRL                           0xC40
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1                0xC00
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_1                0xC04
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2                0xC08
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_2                0xC0C
 #define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5                0xC20
 #define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5                0xC24
 
+#define GRP1_OFFSET	0x0
+#define GRP2_OFFSET	0x4000
+
 #define ACP_PGFSM_CONTROL			0x141C
 #define ACP_PGFSM_STATUS                        0x1420
 #define ACP_SOFT_RESET                          0x1000
-- 
2.39.2

