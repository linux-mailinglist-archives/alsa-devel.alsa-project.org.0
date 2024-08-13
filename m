Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C657895035C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 13:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17393233C;
	Tue, 13 Aug 2024 13:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17393233C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723547541;
	bh=PyHrZB+V/FHmfYh7HFuLD1yqLQ3Ayvtxsf7nrLCWSeU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dajyth/4JQJjA19OGky79ORij1VrPBlz7w21TRyE4LdVWRmsneYaeoAaHHCVUOjdR
	 FidG3YvfJgxmHlHZwzMgfL+5AWyTxoxAxI4+H/D8Jl1egmxRQMXfETYLqGcbqY6+Aw
	 MlNb9oDLAIEkS/vThT+SCXEH7OG3UssY5k+2LFak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05292F800B0; Tue, 13 Aug 2024 13:11:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DF7F805AC;
	Tue, 13 Aug 2024 13:11:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F368EF8047C; Tue, 13 Aug 2024 13:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 069F4F80301;
	Tue, 13 Aug 2024 13:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 069F4F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wqwlzUDV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puHwspUEb0ReWiCavw2KepnUj6GNEjL5KSECdEQKnakd/Ft0eCGV0LGyoszTU7W7YPN/U/Ge72IEhUTWbTWyyavosfFgIjf0LcSPkeO0fy8hE3RUrWJL94+Rj5Hb5H08uzW8hv8ubj+Jq3/M6QXg1yP8qzqtvG8IqJu2RBk7Is/xeBOVRdTWe8nMftwxuQByRJDfSdZCyJSHCozzMx3hYGonRNig/ghpMg5Tqb9VeYNWl52xYoCyq3CQG7PzXegr9sr2m8KCNny/3CgNLuzAFICW6+dE7EfrhtKYtzeBMEIWSdbsS7JgfPq/RJRROwQ666FZGMCif3C84gOTJ8it/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIcVRvOVovYyl5V42xHAtl29LXrGMQIXlbiSRkohtac=;
 b=Hb/LcIWfy/rXCm1mgRLjGHil8QfMTGfxCkC5590QuTAcG18kp5kfA7/dJDxLykAUnEHeJsrqPvr4wZ/+XHhl7k/cL5hxoaSFB3ncbEAFTxCARQEsRoNvewQQeS+6XoZefdldDWfsMcgZ1YaOeM4ueNGV7uBau4MflZFJkqHHdhUZbYa52S5uQfKaIyfEVGOeo9pc79bG9x2m8l+XFX9to4ydaF92bgatWrUAhWn3goXzxPQTYV52uho2Cuv8rtHn/iANoPp59ZMxwRHyw/a0aSktXxBF80W4QUzkOhIjTf100/dyt5m8ph2W33rGf3HYX/7Lyl4Fq//zFthR/H727Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIcVRvOVovYyl5V42xHAtl29LXrGMQIXlbiSRkohtac=;
 b=wqwlzUDVtydpOkTVz7Mnzu7vb3lKaggDwAhnzq8MZMg3OpS6UV1XmnuzYNm6BP045oK/RVBtEjlOBxO7Egca4wiN+lG0pOiAoin0tXuYpHejASNAmhYVGWtxqjJkrCQI93yM2uwGdQ73NJxEOo6qyAwEd7R8waK1KrDZJ3cy/mM=
Received: from SJ0PR13CA0213.namprd13.prod.outlook.com (2603:10b6:a03:2c1::8)
 by SA1PR12MB6872.namprd12.prod.outlook.com (2603:10b6:806:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Tue, 13 Aug
 2024 11:00:27 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::d4) by SJ0PR13CA0213.outlook.office365.com
 (2603:10b6:a03:2c1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 11:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 13 Aug 2024 11:00:27 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 06:00:21 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>,
	<pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<cristian.ciocaltea@collabora.com>, <Markus.Elfring@web.de>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 2/2] ASoC: SOF: amd: Fix for incorrect acp error register
 offsets
Date: Tue, 13 Aug 2024 16:29:44 +0530
Message-ID: <20240813105944.3126903-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
References: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|SA1PR12MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc5192f-5001-4837-3e63-08dcbb8723c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v1sdiEPjkH05iY4XafrvghvzoKwnoqZ30Cb4mVKjlH8bp0Z8GMk34ROFwpuO?=
 =?us-ascii?Q?HYiAXqhK78HNb23QlTT5MwlIxyCxJljlUhYB+Np+OHIFRVDi6P/8xOioAmi7?=
 =?us-ascii?Q?2WKea4f29VMKWjBbcxUePuecuDcsnwVto6Z7JQn4KPH8kRlyS4dhd6rLgVFk?=
 =?us-ascii?Q?QzumOQ2swVTQxvA3+TFs1IlDN4mNaVFTaH9ZSKDFhh+M4cUosKbkU4oU0hRj?=
 =?us-ascii?Q?hKRDKcUVJWdRlTvokwOVUxubDJ4agSPl2J+v3S0Bft8EK+NK9hCPtvxC/nTs?=
 =?us-ascii?Q?Rs80qitnZb5ZuarRUXyPB2xjBQXy0UxCsVw3TJQuAVRdL24dxd9kXTR5QSSx?=
 =?us-ascii?Q?Tp5K2S/2zNIu0Z/Hth3E6XoxJnujukjWW9noVAeutz8ouTjm15riwhk8T/AF?=
 =?us-ascii?Q?r/IiZvCdGUXRyPfDcyv/8r40ec6iOG3mrNNXhGqBvAqvmYd+e8WX9AHyqm4i?=
 =?us-ascii?Q?Mc+4JvUPsORMiX1TlXG0q28eq0J9TrK6eRXNYXcHTZOUNREQqNQOJHQB/MQA?=
 =?us-ascii?Q?OQFAagAx5hCp30ZxXvGlg8V+jeVZZJnBbyg9QVVmI/jfVVkQs/64eGy2/3k8?=
 =?us-ascii?Q?vvZtnMNfcFFO0CiGng8cMLBwncN8r7QIhjW/NPEsbkFymawa8AqOXmrlqKbr?=
 =?us-ascii?Q?8abb24oVE9AEg6nhLm/QPuJzrG7sl/4On9dxlGbsxXaPWTd3pNsXMnO9exKr?=
 =?us-ascii?Q?HkrJzzo63uDcxi5SrQeoAJ9H0mcDcWFvjujH5W/M0PXgDpLP9jHxRBatFyqa?=
 =?us-ascii?Q?0EWE/26nCYPY1Q4eG/cxDWHA3EdZQwWi7sO5RHB05EmdpNzMM4YhFf9z9B5O?=
 =?us-ascii?Q?dgO57pdwSgU/6kfzjf+YAI2+dOcDqrHHx9TSdMOyHtuxM+1oPUubd8hwO+Tm?=
 =?us-ascii?Q?IuBpSApa6xu320EaLEin5dBwy8RYLeWh0i39e0ltoKcI9f9gotMDyUMl8wx+?=
 =?us-ascii?Q?00ppDXeQFph43UTw/pWugd7zhufVVz0o+QRZiKdHFgDWLapoHOekw4257777?=
 =?us-ascii?Q?DBASesOOtb+amwDj6KyYdv2wY4vctvjOf2hzJAgrsuWO3VaiYOvFJj+YWg6Q?=
 =?us-ascii?Q?Fbu6RbMR+17u2dlnDdYEX0H3kOcQ1ePiMcBVJNcWUj057wlXrJQ/LW2dbp79?=
 =?us-ascii?Q?9ymyobsnb8m836ZH2//NT+orfB3GWM23mjbyNQi2LA4s7sfemjMCVZNpdb2A?=
 =?us-ascii?Q?EJubTLporuN3kE8Z1JQXxO24W5d1Z8tz629kQgYxPoZHO3G8TPGwrv5PZqsN?=
 =?us-ascii?Q?ticNF95t7kirtsBfg5dtOM2D84rZMff3Gul9/X1/BnrMhdwSV2/s/5BgDG11?=
 =?us-ascii?Q?jSKap86YwdsOQYgkcQCYteDuhdmjtqq/2BVPE3zic5Ysl1+QnXvXyXxZyAn0?=
 =?us-ascii?Q?G7+2pbEGDnOJpXxNhHeLtSm/FFhBJChB83Z7xdE0FHiPVHPNGgfPz8J0JQ6H?=
 =?us-ascii?Q?mpIehjohwJGZD4PVA92SIzFvfZSE7k4/?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 11:00:27.3051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebc5192f-5001-4837-3e63-08dcbb8723c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6872
Message-ID-Hash: Y4P3QUZO6B3ZJFFG45VHAOPBX6NXKQ2T
X-Message-ID-Hash: Y4P3QUZO6B3ZJFFG45VHAOPBX6NXKQ2T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4P3QUZO6B3ZJFFG45VHAOPBX6NXKQ2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Addition of 'dsp_intr_base' to ACP error register offsets points to
wrong register offsets in irq handler. Correct the acp error register
offsets. ACP error status register offset and acp error reason register
offset got changed from ACP6.0 onwards. Add 'acp_error_stat' and
'acp_sw0_i2s_err_reason' as descriptor fields in sof_amd_acp_desc
structure and update the values based on the ACP variant.
>From Rembrandt platform onwards, errors related to SW1 Soundwire manager
instance/I2S controller connected on P1 power tile is reported with
ACP_SW1_I2S_ERROR_REASON register. Add conditional check for the same.

Fixes: 96eb81851012 ("ASoC: SOF: amd: add interrupt handling for SoundWire manager devices")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
changes since v1:
        - Rephrase commit description

 sound/soc/sof/amd/acp-dsp-offset.h |  6 ++++--
 sound/soc/sof/amd/acp.c            | 11 +++++++----
 sound/soc/sof/amd/acp.h            |  2 ++
 sound/soc/sof/amd/pci-acp63.c      |  2 ++
 sound/soc/sof/amd/pci-rmb.c        |  2 ++
 sound/soc/sof/amd/pci-rn.c         |  2 ++
 6 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 59afbe2e0f42..072b703f9b3f 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -76,13 +76,15 @@
 #define DSP_SW_INTR_CNTL_OFFSET			0x0
 #define DSP_SW_INTR_STAT_OFFSET			0x4
 #define DSP_SW_INTR_TRIG_OFFSET			0x8
-#define ACP_ERROR_STATUS			0x18C4
+#define ACP3X_ERROR_STATUS			0x18C4
+#define ACP6X_ERROR_STATUS			0x1A4C
 #define ACP3X_AXI2DAGB_SEM_0			0x1880
 #define ACP5X_AXI2DAGB_SEM_0			0x1884
 #define ACP6X_AXI2DAGB_SEM_0			0x1874
 
 /* ACP common registers to report errors related to I2S & SoundWire interfaces */
-#define ACP_SW0_I2S_ERROR_REASON		0x18B4
+#define ACP3X_SW_I2S_ERROR_REASON		0x18C8
+#define ACP6X_SW0_I2S_ERROR_REASON		0x18B4
 #define ACP_SW1_I2S_ERROR_REASON		0x1A50
 
 /* Registers from ACP_SHA block */
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index b8d4f986f89d..35e56d22930f 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -92,6 +92,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 			      unsigned int idx, unsigned int dscr_count)
 {
 	struct snd_sof_dev *sdev = adata->dev;
+	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int val, status;
 	int ret;
 
@@ -102,7 +103,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 					    val & (1 << ch), ACP_REG_POLL_INTERVAL,
 					    ACP_REG_POLL_TIMEOUT_US);
 	if (ret < 0) {
-		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_ERROR_STATUS);
+		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->acp_error_stat);
 		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DMA_ERR_STS_0 + ch * sizeof(u32));
 
 		dev_err(sdev->dev, "ACP_DMA_ERR_STS :0x%x ACP_ERROR_STATUS :0x%x\n", val, status);
@@ -402,9 +403,11 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 
 	if (val & ACP_ERROR_IRQ_MASK) {
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW0_I2S_ERROR_REASON, 0);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW1_I2S_ERROR_REASON, 0);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_ERROR_STATUS, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
+		/* ACP_SW1_I2S_ERROR_REASON is newly added register from rmb platform onwards */
+		if (desc->rev >= 6)
+			snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
 		irq_flag = 1;
 	}
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index ec9170b3f068..f6f0fcfeb691 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -203,6 +203,8 @@ struct sof_amd_acp_desc {
 	u32 probe_reg_offset;
 	u32 reg_start_addr;
 	u32 reg_end_addr;
+	u32 acp_error_stat;
+	u32 acp_sw0_i2s_err_reason;
 	u32 sdw_max_link_count;
 	u64 sdw_acpi_dev_addr;
 };
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index 54d42f83ce9e..e90658ba2bd7 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -35,6 +35,8 @@ static const struct sof_amd_acp_desc acp63_chip_info = {
 	.ext_intr_cntl = ACP6X_EXTERNAL_INTR_CNTL,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.ext_intr_stat1	= ACP6X_EXT_INTR_STAT1,
+	.acp_error_stat = ACP6X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP6X_SW0_I2S_ERROR_REASON,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 4bc30951f8b0..a366f904e6f3 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -33,6 +33,8 @@ static const struct sof_amd_acp_desc rembrandt_chip_info = {
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
+	.acp_error_stat = ACP6X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP6X_SW0_I2S_ERROR_REASON,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
 	.fusion_dsp_offset = ACP6X_DSP_FUSION_RUNSTALL,
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index e08875bdfa8b..2b7c53470ce8 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -33,6 +33,8 @@ static const struct sof_amd_acp_desc renoir_chip_info = {
 	.pgfsm_base	= ACP3X_PGFSM_BASE,
 	.ext_intr_stat	= ACP3X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP3X_DSP_SW_INTR_BASE,
+	.acp_error_stat = ACP3X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP3X_SW_I2S_ERROR_REASON,
 	.sram_pte_offset = ACP3X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP3X_AXI2DAGB_SEM_0,
 	.acp_clkmux_sel	= ACP3X_CLKMUX_SEL,
-- 
2.34.1

