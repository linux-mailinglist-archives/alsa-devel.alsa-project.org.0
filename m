Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13317A2BB76
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:32:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E1360211;
	Fri,  7 Feb 2025 07:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E1360211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909949;
	bh=rAaBrQiaI9YIVDkfqOYJLhaWj9RG+DU8DhhzcumiehE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fu27kL38rIkBECJXAjFXT4b2UbhcsX9Htm9O7Q2FxtWCr79A1QISI0vqFtU8PVr0b
	 jDYhkgN0YJbPwbmiLFNHuzq7NVZaWji19n3XddolUArSn4HCz0p0C7TSypqDVMFdk+
	 yCL5gAX2Pi7oCep7++sWIUiJt5ph3oB+5vymy2cw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B1FAF80759; Fri,  7 Feb 2025 07:29:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D435F8077B;
	Fri,  7 Feb 2025 07:29:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA0B5F806AC; Fri,  7 Feb 2025 07:29:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::606])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59023F806AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59023F806AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ecXR/Wos
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyDZ8sk47+K0aPJv3ayGxiXZlPsOPyiZgGn/DWnlbIOdhy0BtKk3PG0d13S6sl4BerGp0/ObFpgvBr0i9cAuFFxI9noKQd6gAlyTHWk9wVIVa1g3GaQDeDnw+/9CJ3BN4O1/4Rvx54whYyX/F7QBIZDinU2iSByOw/ygjAG3wrhNFJSMPXLjmMlwI2oBKImt44JOVd+TiRolh/JsyHpF6vtd6Dke4jgbb8IFrAqvwzau3KkglGgjzERCT7bUbRL3AENzdGoiV8EjshbkSzWnOOIKOBvTLh7vqCZyuoJ0RDz0MG7SKkDZ1e6rxyyQh84Xpk7248kHrTiJFGcGwmzjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfrTt0w9sITtXnJTEVMDBXbMt4BUTU4UtoIWFurEk4I=;
 b=wuWemh8PGxh/OckL48Py4IMKleEUD9i/waLsx7Q9ncQ8cMq+nIXMVMmt0xPLQI4qJ/xSoCt8o4S8zrAhKM9rBveXfM7mvEy8mFSE/Lj0zfavxJTh8YPuqVd0igZICrEWX2DlQUz8WaXmM1WenO2JJSAK5t61r84iBYiiWck43s45NX76LGf3FHL1I1HQ73ZXIXs3dkGXPjWWemGAZfRQZt3xRHaKix3GxsJS8uToMbLP9Y+1dIibet0H2ciJ/LFYypIHIVPTr/cTx/r6zLvj3lOdfbWYPsvW9IpdGj3JsT0CEZM8AiZ1pf9PbhplGAWXOXxYSSRmsOmQS6+iUiFXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfrTt0w9sITtXnJTEVMDBXbMt4BUTU4UtoIWFurEk4I=;
 b=ecXR/WosOuJ9STkhVe/ypsRPd7kE8N8s7peC6j4Ztv/ddxVdujuloFXQT3twGh0M2BvDEB4uPGt/R3HuObzDcK6Oo0pMVEoAxr0Eq1BrB5JdNJ/d0eG/umHg12xm9LoduMpDjU0fJGZWoJ8sar4HnWojI1d7jHh9ahDBxmJMSaY=
Received: from BN9PR03CA0137.namprd03.prod.outlook.com (2603:10b6:408:fe::22)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.12; Fri, 7 Feb 2025 06:29:11 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::19) by BN9PR03CA0137.outlook.office365.com
 (2603:10b6:408:fe::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 06:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:29:11 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:06 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 09/25] ASoC: amd: ps: refactor soundwire dma driver code
Date: Fri, 7 Feb 2025 11:58:03 +0530
Message-ID: <20250207062819.1527184-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb03179-5dba-4b07-e68a-08dd4740bbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pyzziuoPgaqLaVpnnqxK4jg9ifAwiUsiILDqpCILknIKVPHJh/YGagReGSiR?=
 =?us-ascii?Q?qipa4TO0yAxc9597RTiOoasvhF9+TTzzneKNQ/J0zqdPmkCgPUcLrgyfZ7pF?=
 =?us-ascii?Q?8tWDyE15E0xqadQ9XovPOzyNZ6j9T2720bcbz9H6Yf96Ko0SMdj+nekvHSza?=
 =?us-ascii?Q?vsJaxlI74uxl5nmW2LdCtvIPg7EMuXM1tBwNo9eh6aEi5FtJk/f/h34eryRN?=
 =?us-ascii?Q?Qe/fRydy6JtS5XdPDUPDNwkq0ympOvxz/JBR9H3w1tXFBTD5gecteuvvfCWy?=
 =?us-ascii?Q?jxNhgvAWHzapDwiphY8pnhqOJhouZrO4RnZpkiPwb8jh50ej+X69KEUyLMe7?=
 =?us-ascii?Q?6gFbKycHu1PrTT3Sa55xaZHk9QmSnxqi/cAh/hDaub6sx9XWvp0gHseyBa4u?=
 =?us-ascii?Q?Z01qhTdIWOKZ+EJpQWCmh9ussrW/M67ympXQvA3xB8JPIinAMc4ZJxhMT7Ih?=
 =?us-ascii?Q?AqZeVTHB0WQpjK8KVwOIaH/7k3L6wILsJyeXb48bw+Z7bGpDZTxgj0YCCJSH?=
 =?us-ascii?Q?ejkN8CGIXzuvE9NnQa1QgYNkYAfK+x+8hEND/WGCDfBsFhYkfaMk4o32ePSi?=
 =?us-ascii?Q?T5iz6qwaeg59pL6E9FJ6mMOGkR/ZGk8y8N+BGEuN8ztGIEybwLa4NIj+V0M2?=
 =?us-ascii?Q?vveTF3I3r1e6x/ZAVgHznLI94fD+HUG4pLDvfX0DN1k5lS/qBKAFZVCpAzdt?=
 =?us-ascii?Q?sxjjFHRVsE9PfPO8w+Au8yel+828l0Xan4fJhN/y03xy7CueN0jW8l5lnkEm?=
 =?us-ascii?Q?RECjs8ZB2/FqhRYFSxfte50LDNRBQo0UGG6L8/SNVgFzk7R3V1YnWWQUIrOs?=
 =?us-ascii?Q?8AuDqM8TPQyglYIk3DsepKB/s/P/ThR50hBkv/VDtvusYntgkysUVdoMewDy?=
 =?us-ascii?Q?+TDsUgVpmEDMt1Tl4EhLbMbMCAsB2VWWptSvoGUchrkLKEmv7pWdDudnw1rg?=
 =?us-ascii?Q?p/T4iMSDKPuvWeBFW24uAUGoH0k8n+mP6AexcEThDiDKar+verthPfKy6PFc?=
 =?us-ascii?Q?bqcD7uYXFpxjNQqPZYFe89nmL9+8NkwE94rW/KcFtuaeRJm2YBzeTaCrVFFy?=
 =?us-ascii?Q?/QqsCRsk6VGYAPkAKMW9RCNFmgOB1sPlBtkjIDXN40WbwPnwtYpE+IBgoiV5?=
 =?us-ascii?Q?X+Mj+hy/5UC8Ai8URR8BmbFihAQma1M1FDgY3tMOSEPiwFUE9ppyCzs4rtGm?=
 =?us-ascii?Q?nNc69F2pzJMxkTNjKe2UzIdEDDKkhoSKntDGVBEpjuYuT+lH1BXrYskmn2GM?=
 =?us-ascii?Q?Pf527qIiLsz+hD6g9i8Og93IKmu7KmSjcetg2vux+SHhSPq1z/oFvK+osacc?=
 =?us-ascii?Q?2/wTdCR93SedXvTpHurHisI+XSWkJ5cxuq7v2ouucLRs3h04ORG7nKqbYAgQ?=
 =?us-ascii?Q?df+xYOeEzuTbR5wbDVsdoH0X284BEm8hXJ4CYY6gI8Oxo+QzTLi95bdM3dNp?=
 =?us-ascii?Q?DeL/+uroAo1zbhWV00DiQEhwJGCLpCc+fx9gBf4BVZsi470vu/xqLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:11.0821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ffb03179-5dba-4b07-e68a-08dd4740bbd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012
Message-ID-Hash: IAO4LYEZE5KA5R7R6H54SVUTMDLREZX7
X-Message-ID-Hash: IAO4LYEZE5KA5R7R6H54SVUTMDLREZX7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAO4LYEZE5KA5R7R6H54SVUTMDLREZX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor existing SoundWire dma driver code by adding acp_rev check for
ACP6.3 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 146 +++++++++++++++++++++-------------
 1 file changed, 89 insertions(+), 57 deletions(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index b3c716371d15..d10950e1cf73 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -167,7 +167,7 @@ static void acp63_config_dma(struct acp_sdw_dma_stream *stream, void __iomem *ac
 }
 
 static int acp63_configure_sdw_ringbuffer(void __iomem *acp_base, u32 stream_id, u32 size,
-					  u32 manager_instance)
+					  u32 manager_instance, u32 acp_rev)
 {
 	u32 reg_dma_size;
 	u32 reg_fifo_addr;
@@ -180,20 +180,26 @@ static int acp63_configure_sdw_ringbuffer(void __iomem *acp_base, u32 stream_id,
 	u32 sdw_ring_buf_size;
 	u32 sdw_mem_window_offset;
 
-	switch (manager_instance) {
-	case ACP_SDW0:
-		reg_dma_size = acp63_sdw0_dma_reg[stream_id].reg_dma_size;
-		reg_fifo_addr =	acp63_sdw0_dma_reg[stream_id].reg_fifo_addr;
-		reg_fifo_size = acp63_sdw0_dma_reg[stream_id].reg_fifo_size;
-		reg_ring_buf_size = acp63_sdw0_dma_reg[stream_id].reg_ring_buf_size;
-		reg_ring_buf_addr = acp63_sdw0_dma_reg[stream_id].reg_ring_buf_addr;
-		break;
-	case ACP_SDW1:
-		reg_dma_size = acp63_sdw1_dma_reg[stream_id].reg_dma_size;
-		reg_fifo_addr =	acp63_sdw1_dma_reg[stream_id].reg_fifo_addr;
-		reg_fifo_size = acp63_sdw1_dma_reg[stream_id].reg_fifo_size;
-		reg_ring_buf_size = acp63_sdw1_dma_reg[stream_id].reg_ring_buf_size;
-		reg_ring_buf_addr = acp63_sdw1_dma_reg[stream_id].reg_ring_buf_addr;
+	switch (acp_rev) {
+	case ACP63_PCI_REV:
+		switch (manager_instance) {
+		case ACP_SDW0:
+			reg_dma_size = acp63_sdw0_dma_reg[stream_id].reg_dma_size;
+			reg_fifo_addr =	acp63_sdw0_dma_reg[stream_id].reg_fifo_addr;
+			reg_fifo_size = acp63_sdw0_dma_reg[stream_id].reg_fifo_size;
+			reg_ring_buf_size = acp63_sdw0_dma_reg[stream_id].reg_ring_buf_size;
+			reg_ring_buf_addr = acp63_sdw0_dma_reg[stream_id].reg_ring_buf_addr;
+			break;
+		case ACP_SDW1:
+			reg_dma_size = acp63_sdw1_dma_reg[stream_id].reg_dma_size;
+			reg_fifo_addr =	acp63_sdw1_dma_reg[stream_id].reg_fifo_addr;
+			reg_fifo_size = acp63_sdw1_dma_reg[stream_id].reg_fifo_size;
+			reg_ring_buf_size = acp63_sdw1_dma_reg[stream_id].reg_ring_buf_size;
+			reg_ring_buf_addr = acp63_sdw1_dma_reg[stream_id].reg_ring_buf_addr;
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -265,21 +271,27 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 	if (!stream)
 		return -EINVAL;
 	stream_id = stream->stream_id;
-	switch (stream->instance) {
-	case ACP_SDW0:
-		sdw_data->acp63_sdw0_dma_stream[stream_id] = substream;
-		water_mark_size_reg = acp63_sdw0_dma_reg[stream_id].water_mark_size_reg;
-		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			irq_mask = BIT(ACP63_SDW0_DMA_TX_IRQ_MASK(stream_id));
-		else
-			irq_mask = BIT(ACP63_SDW0_DMA_RX_IRQ_MASK(stream_id));
-		break;
-	case ACP_SDW1:
-		sdw_data->acp63_sdw1_dma_stream[stream_id] = substream;
-		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL1;
-		water_mark_size_reg = acp63_sdw1_dma_reg[stream_id].water_mark_size_reg;
-		irq_mask = BIT(ACP63_SDW1_DMA_IRQ_MASK(stream_id));
+	switch (sdw_data->acp_rev) {
+	case ACP63_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			sdw_data->acp63_sdw0_dma_stream[stream_id] = substream;
+			water_mark_size_reg = acp63_sdw0_dma_reg[stream_id].water_mark_size_reg;
+			acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL;
+			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+				irq_mask = BIT(ACP63_SDW0_DMA_TX_IRQ_MASK(stream_id));
+			else
+				irq_mask = BIT(ACP63_SDW0_DMA_RX_IRQ_MASK(stream_id));
+			break;
+		case ACP_SDW1:
+			sdw_data->acp63_sdw1_dma_stream[stream_id] = substream;
+			acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL1;
+			water_mark_size_reg = acp63_sdw1_dma_reg[stream_id].water_mark_size_reg;
+			irq_mask = BIT(ACP63_SDW1_DMA_IRQ_MASK(stream_id));
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -290,7 +302,7 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 	stream->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
 	acp63_config_dma(stream, sdw_data->acp_base, stream_id);
 	ret = acp63_configure_sdw_ringbuffer(sdw_data->acp_base, stream_id, size,
-					     stream->instance);
+					     stream->instance, sdw_data->acp_rev);
 	if (ret) {
 		dev_err(component->dev, "Invalid DMA channel\n");
 		return -EINVAL;
@@ -302,20 +314,27 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static u64 acp63_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __iomem *acp_base)
+static u64 acp63_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __iomem *acp_base,
+				    u32 acp_rev)
 {
 	union acp_sdw_dma_count byte_count;
 	u32 pos_low_reg, pos_high_reg;
 
 	byte_count.bytescount = 0;
-	switch (stream->instance) {
-	case ACP_SDW0:
-		pos_low_reg = acp63_sdw0_dma_reg[stream->stream_id].pos_low_reg;
-		pos_high_reg = acp63_sdw0_dma_reg[stream->stream_id].pos_high_reg;
-		break;
-	case ACP_SDW1:
-		pos_low_reg = acp63_sdw1_dma_reg[stream->stream_id].pos_low_reg;
-		pos_high_reg = acp63_sdw1_dma_reg[stream->stream_id].pos_high_reg;
+	switch (acp_rev) {
+	case ACP63_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			pos_low_reg = acp63_sdw0_dma_reg[stream->stream_id].pos_low_reg;
+			pos_high_reg = acp63_sdw0_dma_reg[stream->stream_id].pos_high_reg;
+			break;
+		case ACP_SDW1:
+			pos_low_reg = acp63_sdw1_dma_reg[stream->stream_id].pos_low_reg;
+			pos_high_reg = acp63_sdw1_dma_reg[stream->stream_id].pos_high_reg;
+			break;
+		default:
+			goto POINTER_RETURN_BYTES;
+		}
 		break;
 	default:
 		goto POINTER_RETURN_BYTES;
@@ -340,7 +359,7 @@ static snd_pcm_uframes_t acp63_sdw_dma_pointer(struct snd_soc_component *comp,
 	stream = substream->runtime->private_data;
 	buffersize = frames_to_bytes(substream->runtime,
 				     substream->runtime->buffer_size);
-	bytescount = acp63_sdw_get_byte_count(stream, sdw_data->acp_base);
+	bytescount = acp63_sdw_get_byte_count(stream, sdw_data->acp_base, sdw_data->acp_rev);
 	if (bytescount > stream->bytescount)
 		bytescount -= stream->bytescount;
 	pos = do_div(bytescount, buffersize);
@@ -367,12 +386,18 @@ static int acp63_sdw_dma_close(struct snd_soc_component *component,
 	stream = substream->runtime->private_data;
 	if (!stream)
 		return -EINVAL;
-	switch (stream->instance) {
-	case ACP_SDW0:
-		sdw_data->acp63_sdw0_dma_stream[stream->stream_id] = NULL;
-		break;
-	case ACP_SDW1:
-		sdw_data->acp63_sdw1_dma_stream[stream->stream_id] = NULL;
+	switch (sdw_data->acp_rev) {
+	case ACP63_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			sdw_data->acp63_sdw0_dma_stream[stream->stream_id] = NULL;
+			break;
+		case ACP_SDW1:
+			sdw_data->acp63_sdw1_dma_stream[stream->stream_id] = NULL;
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -382,7 +407,7 @@ static int acp63_sdw_dma_close(struct snd_soc_component *component,
 }
 
 static int acp63_sdw_dma_enable(struct snd_pcm_substream *substream,
-				void __iomem *acp_base, bool sdw_dma_enable)
+				void __iomem *acp_base, u32 acp_rev, bool sdw_dma_enable)
 {
 	struct acp_sdw_dma_stream *stream;
 	u32 stream_id;
@@ -393,12 +418,18 @@ static int acp63_sdw_dma_enable(struct snd_pcm_substream *substream,
 
 	stream = substream->runtime->private_data;
 	stream_id = stream->stream_id;
-	switch (stream->instance) {
-	case ACP_SDW0:
-		sdw_dma_en_reg = acp63_sdw0_dma_enable_reg[stream_id];
-		break;
-	case ACP_SDW1:
-		sdw_dma_en_reg = acp63_sdw1_dma_enable_reg[stream_id];
+	switch (acp_rev) {
+	case ACP63_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			sdw_dma_en_reg = acp63_sdw0_dma_enable_reg[stream_id];
+			break;
+		case ACP_SDW1:
+			sdw_dma_en_reg = acp63_sdw1_dma_enable_reg[stream_id];
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -422,12 +453,12 @@ static int acp63_sdw_dma_trigger(struct snd_soc_component *comp,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		ret = acp63_sdw_dma_enable(substream, sdw_data->acp_base, true);
+		ret = acp63_sdw_dma_enable(substream, sdw_data->acp_base, sdw_data->acp_rev, true);
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		ret = acp63_sdw_dma_enable(substream, sdw_data->acp_base, false);
+		ret = acp63_sdw_dma_enable(substream, sdw_data->acp_base, sdw_data->acp_rev, false);
 		break;
 	default:
 		ret = -EINVAL;
@@ -527,7 +558,8 @@ static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
 				buf_size = frames_to_bytes(runtime, runtime->buffer_size);
 				acp63_config_dma(stream, sdw_data->acp_base, index);
 				ret = acp63_configure_sdw_ringbuffer(sdw_data->acp_base, index,
-								     buf_size, instance);
+								     buf_size, instance,
+								     ACP63_PCI_REV);
 				if (ret)
 					return ret;
 				writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
-- 
2.34.1

