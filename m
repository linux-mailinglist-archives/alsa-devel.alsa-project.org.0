Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB65B17CE9
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 08:28:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF7560251;
	Fri,  1 Aug 2025 08:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF7560251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754029715;
	bh=Pkwes/jJywoRGI21WdFBj86JSlR6xG/shWa+CxzPpOU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cOvB6k0GQ1ixachrgntrjviPjukOzbckXPUGNFsKGPyQfGcJ6gRpx8jPreCdevYvz
	 WuE6APSKCqnSQHfNIk6WhDq9selHABSNmUKjIsVRL7EgQ382S5Cufz9zqt26Jtckk+
	 mQfN+7FuWx2lBbjQl6wlrB7hD+w5VUBroG/3hPbs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAE12F805CB; Fri,  1 Aug 2025 08:28:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BBACF805BA;
	Fri,  1 Aug 2025 08:28:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB348F8052D; Fri,  1 Aug 2025 08:22:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76CE4F80254;
	Fri,  1 Aug 2025 08:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76CE4F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vNMJI3Ea
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNOMk06/LZgJ+tWwK5wvBQBAKtRBAzfcAmMd8Q4tn9gcByAOBIdBTvQ3evlWFBsLRi2ku7TDdVZet7YpbDGDH1SXI6jCjQBNEfbApYBGtsnA7VynPtgraG8i5SDpcZJx0WrF3q+dHrGNYz+XHHIPjLtP8FWQkd5l+k8gtNJjXDSXOyZzygGCo/PoWr8zjrlhMg8ffPQcyO8Aw++A6XKegdHqGyBLNkKISBkw086f8qpd2WxtK3eOBdKlReHI/3lCuA+3skKxwVqB4qEdzmfNVMUR3d41qcC9oPAA+gUFofP3vUqkN8lowfCPGCl3HcGaGxeCOvJvLJrYpbjmzc6MPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeA+8olHfZHW5nohwvojYnC+bMrmQntnuDxtjXBnY4Y=;
 b=YOWdJFGx4vKea9CAXd6VqeiUd5eNoxy2byXIM74Us4ByB5258D40Hsqps0GygJUudoyaBYDMffGCUtblrtlICSs9pGfOniZI0as5UABSSvRqKgWHuBpqAK4CsUqycMw7AnaS6mjqBRQUWkoQSfO8aurSnuRuNmHh2Pc6ZVakdrr/igtsJzFgdo3AEj0kvP51ImL7rX1d3x76suRMXfzi92tGXsZ8vDCkx4cgFmg/rEIl+q3TPYpFrquMegYzIXNtV2XWDF9Gwt1gPrAPbDs4fw62HymC+k1B36lR/ruShtKuau6ktz8JL5uFJc4mLRp1SVlrP1isZBnVj93L6LJWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeA+8olHfZHW5nohwvojYnC+bMrmQntnuDxtjXBnY4Y=;
 b=vNMJI3EaJ7Nr61WT6mLU222kLkFXunIBwHH/BeprnQyhgRfXEBIrqSu+aol0sy4VRxZ22bSNgm1u0qtZAZ36TMvDki0hs9RE74kObWyLGUcRVZkcXwjxB6jrCec5ntViIhjtkF3gkcIrDuJ1fx368HFcRLivJNe3K8bVI9/CzmU=
Received: from IA4P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::17)
 by CH3PR12MB7737.namprd12.prod.outlook.com (2603:10b6:610:14d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 06:22:20 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::4c) by IA4P220CA0012.outlook.office365.com
 (2603:10b6:208:558::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.17 via Frontend Transport; Fri,
 1 Aug 2025 06:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 06:22:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:19 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 01:22:14 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Peter Zijlstra <peterz@infradead.org>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] ASoC: SOF: amd: Add sof audio support for acp7.2 platform
Date: Fri, 1 Aug 2025 11:51:35 +0530
Message-ID: <20250801062207.579388-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
References: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|CH3PR12MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 012e7475-0d32-4f23-ebc3-08ddd0c3c54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6AkMsn7kg919qxDESvCSiRF6skPGxAAvIlQfImqD9K5tZn8IT8JDWYUoyaNY?=
 =?us-ascii?Q?R2MtK6vbi9MhV8CKEDFs+TEnZ2AAy4/QLz4f+B5piyWV37I+2yBMvU46q336?=
 =?us-ascii?Q?g+cy8hnACvAbJXIsrtWYcS8sqYDiqCLMyTWhOFr5DPPUbT/SN+sHjrmHl8YX?=
 =?us-ascii?Q?ot451GGEbbyC4Vh2rzu707u4LR9oc/3yvEkzLxeA/VBOanmk5LDZ3ho0j2me?=
 =?us-ascii?Q?s13YLKeW56ojH5noYjeoZVHr4AvIBP8fCZmezY0My1zWdZQ7EAp9TOavWC7U?=
 =?us-ascii?Q?5RRmv4IZyQv67LszkB1OcDQDx16yVNqMd0vyDiwtdHd/4eQ53i6iQ5Llqrsm?=
 =?us-ascii?Q?qsYTmUvZ8Qauo6D/omev2WWEXRjVnibGhChm7am4+xZ0ooLNR93bfXXiThwx?=
 =?us-ascii?Q?wHUhf1dUDJuNdohUrkhvrakVM+1b/EbPjeF1ZVJ5hPZDtNI0ouvizWfwpv+Q?=
 =?us-ascii?Q?dp/Q5GQ0PCGWD8IXD0u8uAgD3Kj2cQao5mOWEbxv/2OJdfUXrZlFVn3pNCIt?=
 =?us-ascii?Q?o6ni78ETBzFesEn3YFjVwiGKYbO9lUKfsLBUldpMW+Jbo2c+d8W6xoLHxM3y?=
 =?us-ascii?Q?1s8zMZDXY02gEnpiLxx1O7UKctCvJ8i1JTOsW6Gt04kloQdfG6DHHbuFQLFz?=
 =?us-ascii?Q?x9XHPYOP2T30B4TwvgNHHPP3En2O1N/9tiinSy/A3zVAYYRKnqqJI9ZL3niR?=
 =?us-ascii?Q?kjoXwpC9L0qXNfy6tFvvlWoT+JPc+C4qyaEe5vkiVhcugq6arvls6bnPDxDr?=
 =?us-ascii?Q?66/O4K/x7NndUkNUjK9O+naGAOl1fcMInkiVB6zQLK5ZNa88L+5nM6aaQgQ0?=
 =?us-ascii?Q?JOsOoJ2vbDj8T991+MzdSMF9s0QjA3a26wFbFoCKPak8LrgJ20HEwCjf82vE?=
 =?us-ascii?Q?GpaCAIV2QJcl/BQc14ZF27RhZe2Y3BZOBe8Qzpvl4OLzdurzn6c5Zwv8OFwS?=
 =?us-ascii?Q?YZoc3ciVDlVB2az7VWwzlAlDHZl7J89Gj/xI1WGIsvJj3+LrzxLus56/mQUO?=
 =?us-ascii?Q?HLyy8oADmkZVbjqFQcdnt8CP64KZgVC1c1bg+0qqyKElZBjOe8RoupzhZr+e?=
 =?us-ascii?Q?Dac/o0P59aNk7fgQ0jrkVkdm3viQW5OHOKFni7U01ZZISYFgVCYtkQHk0g3I?=
 =?us-ascii?Q?WIa9Qkl9CM+rVJoRjP5aCVEjrMKFJCNqsyfTAcYcaxbtY/LDnupSyG2ZRl+M?=
 =?us-ascii?Q?Ec2Wg4pPJpl9sxx7vZ/574vLHq7Rspu/Ua6I1Gjg0iRnS7q1rdGFkDb8iB6W?=
 =?us-ascii?Q?ucG4qDSM/kFGplyAJiBju26grgCLouU0CIgyhoND4sVjh+PzhkAsLFLfT2si?=
 =?us-ascii?Q?kCOkDIOZZJdKm2uGeajsAdj7LLH/FSZ+7F1ZLn7EKf3+u8rFIlv04dTU1+Mw?=
 =?us-ascii?Q?cQHqbb8oEt6DhxN8NkDnfLSBE0giXeveZhAPD0uywKm+W+kh/6uHMkrSLvDc?=
 =?us-ascii?Q?CL73F1mcZ4TjexIpAQNIK9KnwQ5aqiz5uF2+hw8VcEa098/OutaBklKlubMC?=
 =?us-ascii?Q?uWAD7ZdfZho4kXGWVFKRAuoDeKMtaDitjdme?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 06:22:20.3511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 012e7475-0d32-4f23-ebc3-08ddd0c3c54e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7737
Message-ID-Hash: IFTK2ISMW2PMNWJPP34S4VRYPNV562TT
X-Message-ID-Hash: IFTK2ISMW2PMNWJPP34S4VRYPNV562TT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFTK2ISMW2PMNWJPP34S4VRYPNV562TT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pci revision id to support sof audio for acp7.2 platfom.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/acp.c       | 8 ++++++++
 sound/soc/sof/amd/acp.h       | 1 +
 sound/soc/sof/amd/pci-acp70.c | 1 +
 3 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 7132916aa253..71a18f156de2 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -59,6 +59,7 @@ static void init_dma_descriptor(struct acp_dev_data *adata)
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		acp_dma_desc_base_addr = ACP70_DMA_DESC_BASE_ADDR;
 		acp_dma_desc_max_num_dscr = ACP70_DMA_DESC_MAX_NUM_DSCR;
 		break;
@@ -99,6 +100,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		acp_dma_cntl_0 = ACP70_DMA_CNTL_0;
 		acp_dma_ch_rst_sts = ACP70_DMA_CH_RST_STS;
 		acp_dma_dscr_err_sts_0 = ACP70_DMA_ERR_STS_0;
@@ -339,6 +341,7 @@ int acp_dma_status(struct acp_dev_data *adata, unsigned char ch)
 	switch (adata->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		acp_dma_ch_sts = ACP70_DMA_CH_STS;
 		break;
 	default:
@@ -522,6 +525,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 		switch (adata->pci_rev) {
 		case ACP70_PCI_ID:
 		case ACP71_PCI_ID:
+		case ACP72_PCI_ID:
 			wake_irq_flag = amd_sof_check_and_handle_acp70_sdw_wake_irq(sdev);
 			break;
 		}
@@ -559,6 +563,7 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 		break;
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		acp_pgfsm_status_mask = ACP70_PGFSM_STATUS_MASK;
 		acp_pgfsm_cntl_mask = ACP70_PGFSM_CNTL_POWER_ON_MASK;
 		break;
@@ -661,6 +666,7 @@ static int acp_init(struct snd_sof_dev *sdev)
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		sdw0_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP70_SW0_WAKE_EN);
 		sdw1_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP70_SW1_WAKE_EN);
 		if (sdw0_wake_en || sdw1_wake_en)
@@ -712,6 +718,7 @@ int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		enable = true;
 		break;
 	}
@@ -738,6 +745,7 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP70_PME_EN, 1);
 		break;
 	}
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index d3c5b2386cdf..2b7ea8c64106 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -75,6 +75,7 @@
 #define ACP63_PCI_ID				0x63
 #define ACP70_PCI_ID				0x70
 #define ACP71_PCI_ID				0x71
+#define ACP72_PCI_ID				0x72
 
 #define HOST_BRIDGE_CZN				0x1630
 #define HOST_BRIDGE_VGH				0x1645
diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
index 51d36d43c42b..3523c9a92a94 100644
--- a/sound/soc/sof/amd/pci-acp70.c
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -77,6 +77,7 @@ static int acp70_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_
 	switch (pci->revision) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 			break;
 	default:
 		return -ENODEV;
-- 
2.43.0

