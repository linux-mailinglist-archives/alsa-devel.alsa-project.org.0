Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB104A2BB82
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:33:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1E360220;
	Fri,  7 Feb 2025 07:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1E360220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910034;
	bh=MQy2VKLy6wu/xwz4rVEJ2LEqtZSitcmj95KMGq6McZk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dYdm5I6VwOYq5WpOUdTKO/s1expGN9Vveczl95Mxyb7PRwMhYw7vY/Mlu3SeMLBmS
	 ezyEm4s1kHGvMbHhwf8WwaEffqZvxUTNjPBvi3O656/YpINaZZDfrhR1vRtsDKYRNc
	 3mPxZVNPfHa8J/EaLDtC8DX7bQ/Ijj/JC/hpgMZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C640F80612; Fri,  7 Feb 2025 07:30:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C4AF80616;
	Fri,  7 Feb 2025 07:30:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F7EFF8060B; Fri,  7 Feb 2025 07:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05DD3F805C9
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05DD3F805C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2jgnpVn9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOiJHxCnwtUnM0z4YIAQyThsE5pfYSCunatBFqe8UujERY1hxfRZJI2xzSYZqllLwpP2CeCcJSfEFN2FnUNDq10k6D6PgtuIr9MC6sMZDTELCuAqh0I/MMO0cw2XNfSJkr9Clk6MtRjiWEvEFzIYOltUYGeDP5/Uzysr7zusg/1gm9iaZYMGT4iFD/+D5m8OkqQmlfaKpKP5kLCCzuO8NGRf7czxEQHThA1ovcnWue373b0b02SSJlKdkaZRejmktO7ZF+0FEibJ/GsXwMnHpgBItmc891/y1IeZgV/QqfXx2S9kjqBJlTRWc5B5dFOtzOvpcUOy9LVUXgD15KIJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL43eT2kVs1W+G8LqvwX2g8BeHWsLwNjPxp3+mIGYHw=;
 b=Se5mkB3GCbtBpaDaLzvYHEelPTPBbLdl+AVP6bgaGSgmHvy900XFuAp5c49gfOSm3eyjOclkcIGTt2K3UCEU2/d5u7jtAqk7bSAPjpgCQ6yj2e2nrw10KhDSGd7zY+uDtzlyOwMliB4sNlRzauNykYyLtqWgjFuDm058ov2wLf6ZNpR28YS9odXQkQIFgAdthJLPZF8ZuoDZA+7ti7WLmKr/jcnC8wQtAp6X5c/+Vyqdx8kpupvj7Yxvvv8GRqp1Oiv0zCkO4aEt/otINokLBOUodxwNEXho6iwHTNw32Tl6c9UtE7GYK3zY1jc/74GQNGOZP4WN27TPZjXpX7/oVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL43eT2kVs1W+G8LqvwX2g8BeHWsLwNjPxp3+mIGYHw=;
 b=2jgnpVn969z8/nGlxhffHZ4IIlpNhmvftmNPPNHB/8Di6xuChsR/klnIIX3pJA1BywRLhWtMiI7Hbi8MhjXZNCGywoPLN40Iqurm2VK1XHQpo8nDGWVhAQigNlG3B1wA2q4ns7JdNEme8HYL5TSi8/9thkxObNfvMbyywAMrIdY=
Received: from PH8PR07CA0045.namprd07.prod.outlook.com (2603:10b6:510:2cf::14)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:30:05 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:2cf:cafe::35) by PH8PR07CA0045.outlook.office365.com
 (2603:10b6:510:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 06:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:04 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 15/25] ASoC: amd: ps: implement function to restore dma
 config for ACP7.0 platform
Date: Fri, 7 Feb 2025 11:58:09 +0530
Message-ID: <20250207062819.1527184-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 1171b7a5-243a-4318-4c13-08dd4740dbca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tXFF1/bynf/LzYPl9BcyFK+1Dz/dFO4VXLQNibN/t9EcXeqiDr6YwRksSCnX?=
 =?us-ascii?Q?hLAy/ZhA1AxRElfWESVGtdRghislMgI6rcmwSyZBPj9dKOGr2AkKR/JCkgFJ?=
 =?us-ascii?Q?IkG3/9I8IAsLKKHgx82SHsq2HdPTM38ww4pB1DYnPYx2WVIATKVqflSxIudQ?=
 =?us-ascii?Q?n3ZbW59WbcQFHGDzZveKmL5Mhj68YL18wHKVnuvfYMmdfb7JUGBdgK5v+S01?=
 =?us-ascii?Q?8aHB45e9jnehfngXI940XV5H6CttvWOTKlChGS1OxJ89oG+N7u7Wo2oOpJ9u?=
 =?us-ascii?Q?9dEFBR/TONkH9fEJdKubW4fv5BajM1cNOvl4TDbIWg6pUeQOLk/YkC5P9hUe?=
 =?us-ascii?Q?b2ANPee4ChvNYoIg/8phd3G+5vzrT3GTLZZPDxI5bKuxmLOqlNuGwU5rscWZ?=
 =?us-ascii?Q?zYyXw2wRiHJm++Fso97oHkq0djnYODs51FJ1/5sb2olQK8R+XKEMFvWKko0h?=
 =?us-ascii?Q?NBDISa2oIIQJGjb7a88y/7SFfbamkQYWAx9f5W/2BS1kZcGILz65/0hkIHYX?=
 =?us-ascii?Q?ZJeBjNCZzBrRgA2OW3DT2t7aObcC0PMonoDPtx/LeNi5pOC5BJCfLgZ/fJZg?=
 =?us-ascii?Q?yzj4IsdP1TIX36GZPOE/r/KZUe8+Vsz0sFzceYqNSLX1dAckT2Gxm2Z0RGsM?=
 =?us-ascii?Q?J14bjAQ5XDmcdUxjEsW5WsUJ1TLkbi1kT6u5pW1qRBsWl765JlHVxLXwrvbl?=
 =?us-ascii?Q?+CJh9zJ6ei2uxB+j3JORdW+LpMGfKf7IcJReW3eN5aosAFE1jBdd3NiLWDBa?=
 =?us-ascii?Q?wpnzhe/w5hXvtfDQlGG1z4uSDFf4rTWVQjxa5wrYFyiBeiny8KyHI45ZkDDG?=
 =?us-ascii?Q?dbT1Lfa0hI7RGsj9e8WYWxSqVLXpluWug8CggT025aNYni54KbwW9lI2teGl?=
 =?us-ascii?Q?zv7ysVTjjrUTQxfkKFKdFgix8p/Z03aO0x0mamQXaCX95SExvJ45PMqBWqkz?=
 =?us-ascii?Q?L/lpZTcehR89UQDRQgusaQYC2q70AXESUH3yJOdaS+A94dVr67qZlaYNvB8q?=
 =?us-ascii?Q?Z7EhNCK6NAq6SjyINURTSSKHuHD6R8wGmFoEqDHVRRtJUacJ2cfG21E2s4ct?=
 =?us-ascii?Q?ag+Fw2j8GJ+0XLNNu490P3xBtD3PuvhzK9LacdeLG9bmErZVFOxvNrlE6kiJ?=
 =?us-ascii?Q?E3OlntahNtUjmEubv3W8NqlXkgy5BwXnUqSUPNlsv+7VVIcdmR/O/iMht5la?=
 =?us-ascii?Q?HY1Wjd6CD91BUcG82uOYSAS+ASFrwz3OMHYe9nnq6DnE/vzCNgPmjJDF3xMI?=
 =?us-ascii?Q?2//GfR+txYebTJqdzJjpKuYSA2DnYp6XH/ru1xUKv1uTyTbn4q1ItMgZ0ymp?=
 =?us-ascii?Q?b4p0aJilq3tLbR5VazdBu5Zc6ig0/J7KL14E7g645kqytSBfnqrFxWE3dOxA?=
 =?us-ascii?Q?Vosc9cdsDUhoyXl6XsFYhR9UbLFWPoFSM9agJCGdOzWEsi9NYzVWrSp2joRu?=
 =?us-ascii?Q?N9pzHeVtMM5YzMsn0Gl9QRADXiv1Ut5vWdJk/dpdVt2N1Cif79VtPGB2gp9L?=
 =?us-ascii?Q?HH3mhGLD+VjEmFg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:04.5706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1171b7a5-243a-4318-4c13-08dd4740dbca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999
Message-ID-Hash: GHJA22VE3FORNERWD3VHKIS3VH73U3T2
X-Message-ID-Hash: GHJA22VE3FORNERWD3VHKIS3VH73U3T2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHJA22VE3FORNERWD3VHKIS3VH73U3T2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Implement function to restore the dma configuration during system level
resume for ACP7.0 & ACP7.1 platforms. Add a conditional check to invoke
restore dma configuration function based on acp pci revision id.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h      |  2 ++
 sound/soc/amd/ps/ps-sdw-dma.c | 46 ++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 4d197bb8271a..0aef3a852ff1 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -142,6 +142,8 @@
 
 #define ACP70_SDW0_DMA_MAX_STREAMS	6
 #define ACP70_SDW1_DMA_MAX_STREAMS	ACP70_SDW0_DMA_MAX_STREAMS
+#define ACP70_SDW_DMA_IRQ_MASK		0x1F800000
+#define ACP70_P1_SDW_DMA_IRQ_MASK	0x1F8
 
 #define ACP70_P1_AUDIO0_TX_THRESHOLD      0x8
 #define ACP70_P1_AUDIO1_TX_THRESHOLD      0x6
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 2966244eb25e..557d312a23b2 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -725,12 +725,56 @@ static int acp63_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
 	return 0;
 }
 
+static int acp70_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
+{
+	struct acp_sdw_dma_stream *stream;
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_runtime *runtime;
+	u32 period_bytes, buf_size, water_mark_size_reg;
+	u32 stream_count, irq_mask, irq_mask1;
+	int index, instance, ret;
+
+	irq_mask = ACP70_SDW_DMA_IRQ_MASK;
+	irq_mask1 = ACP70_P1_SDW_DMA_IRQ_MASK;
+	stream_count = ACP70_SDW0_DMA_MAX_STREAMS;
+	for (instance = 0; instance < AMD_SDW_MAX_MANAGERS; instance++) {
+		for (index = 0; index < stream_count; index++) {
+			if (instance == ACP_SDW0) {
+				substream = sdw_data->acp70_sdw0_dma_stream[index];
+				water_mark_size_reg = acp70_sdw0_dma_reg[index].water_mark_size_reg;
+			} else {
+				substream = sdw_data->acp70_sdw1_dma_stream[index];
+				water_mark_size_reg = acp70_sdw1_dma_reg[index].water_mark_size_reg;
+			}
+
+			if (substream && substream->runtime) {
+				runtime = substream->runtime;
+				stream = runtime->private_data;
+				period_bytes = frames_to_bytes(runtime, runtime->period_size);
+				buf_size = frames_to_bytes(runtime, runtime->buffer_size);
+				acp63_config_dma(stream, sdw_data->acp_base, index);
+				ret = acp63_configure_sdw_ringbuffer(sdw_data->acp_base, index,
+								     buf_size, instance,
+								     sdw_data->acp_rev);
+				if (ret)
+					return ret;
+				writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
+			}
+		}
+	}
+	acp63_enable_disable_sdw_dma_interrupts(sdw_data->acp_base, irq_mask, irq_mask1, true);
+	return 0;
+}
+
 static int __maybe_unused acp63_sdw_pcm_resume(struct device *dev)
 {
 	struct sdw_dma_dev_data *sdw_data;
 
 	sdw_data = dev_get_drvdata(dev);
-	return acp63_restore_sdw_dma_config(sdw_data);
+	if (sdw_data->acp_rev == ACP63_PCI_REV)
+		return acp63_restore_sdw_dma_config(sdw_data);
+	else
+		return acp70_restore_sdw_dma_config(sdw_data);
 }
 
 static const struct dev_pm_ops acp63_pm_ops = {
-- 
2.34.1

