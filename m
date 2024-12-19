Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B39E9F7451
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:54:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A561B60294;
	Thu, 19 Dec 2024 06:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A561B60294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587663;
	bh=2DLLAcn0QGCogNDu/mz9L1jpqhgPgtko4u2oVNEFEV4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NA8pQevontmFZunW1tZtGb5udZmywrV75hXQgv5O2AmRUkJhXbOV4HL0FJUuTNMFJ
	 ys0fypHOg77U1QA5Zw94GkSCh6GX9sqrKTlRWadV32h8rKAiN/7B8kSNNw7RVmHNWW
	 iz7nJ3KzEzOLgsqFsTGb83FsUwKz4x7F8OVHXt3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D2EF80730; Thu, 19 Dec 2024 06:51:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DEEAF80717;
	Thu, 19 Dec 2024 06:51:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58C82F806AB; Thu, 19 Dec 2024 06:51:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13640F8069D
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13640F8069D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=u2okrACR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xui+3fYZiLDAyUSZ9biMIjnrbKGIBdqwZMa+gZLRZLptA1siUm5fdHBwjUDxi1Kj9FJFp764M+sDcSpyUXgS6PsO5NwXzFj11H16uFHmHh4h9WYRWpPkz72lOgehaZED/eUYfwdESGz9yptdyiYqeS+zz7+SuTxioFxBNp3ID8Oqc8pifXjsr1H3VMMenHLZ+hX9crW596lvRC7UHvNFw5PUGXzwaRglV73veAyiqyinG3ZqyeEPQoQ3V2eZKsdi2grFGei20H9CfGMlyZZZ6J1zB4jOpFpoqVRmx4lsIV0cFXvnjhrQ9iGkenxIP7qXen9hfQKy+EXx4pHDeSLECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7/yTQeHNtmdxnm0k1s+wffRwfi9FaOQjVYSwNos5L0=;
 b=FDMTA8VLrTUnNuT/f5DuBFi5Ru5UL4oE38kt/hoC+TGPF935c4Myi1aN68Tbd72cnqivNgaDEFonR8HIyjNXyKGspTjm6jFL/G4UKGb7Oi5vLeTCcRpTxZPvwWIOU5YoCFMpdjSsZ3injIX649pl9EGC3ivODwegr4WEV7VLpq/DQ6257iIhyk5p1F8WdeTmMDRkUzUMeFU2duXUy7utERCI9PlVnhGx9A++C/lb9MLlypRTEOy98XrRGeWqWan0saAJkQTqGz6wPa0AnKJ/dOsexx7pD1J4Gfn9iyKgP6/yPpTrbSNy+YCseUQTbs94MusDwsY+pn96ZqG2mS4qgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7/yTQeHNtmdxnm0k1s+wffRwfi9FaOQjVYSwNos5L0=;
 b=u2okrACRCufER84qwkQoFD85WPJ44X1JxV+l4hzIKwdZeUIIkNy5a7FIJvxkFxzuGhTE4492pqOsPNZsIsXb/jrvFbgIQ1W+TSWDSTCbGfRNUufi6xRqqGaAHderNnKW/wAS7OUcivIzKoHBUWiJ6TowoYFjbQ3NPmRk3cpkYKA=
Received: from CH2PR15CA0012.namprd15.prod.outlook.com (2603:10b6:610:51::22)
 by DS0PR12MB7703.namprd12.prod.outlook.com (2603:10b6:8:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 05:51:36 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::5d) by CH2PR15CA0012.outlook.office365.com
 (2603:10b6:610:51::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:36 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:32 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 14/21] ASoC: amd: acp70: add pm ops support for soundwire dma
 driver
Date: Thu, 19 Dec 2024 11:18:50 +0530
Message-ID: <20241219054857.2070420-15-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS0PR12MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 39632c70-b82a-4cab-e7a6-08dd1ff1335f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y6dn67P676Lt6wEe1+eTCnFK3ypPidlWK88i3EQn3+a88vta/QIDKA5Rxy+2?=
 =?us-ascii?Q?lAcMQ7dK1ulc0T+raqlFANs4Be9Z9Hq1gvf40nTva6fN3cBJ6PZ/dEOZT6p2?=
 =?us-ascii?Q?n7MzkF/YGKga2FKiNPRcclxrkaQiQxznciBTLn4h0LGV0Rs6orNtODuTBI7j?=
 =?us-ascii?Q?B9igbcDApO4G7GiavOxwr/rkLBzbPdWj93fZ9NyrfU637s+FvvYbBLvZG3Mz?=
 =?us-ascii?Q?ohSPNIazv/cwuv3fPh6dzpJ2r3HelyBwQPfbDoCt1lA2xUpkubPMfmnwrcNu?=
 =?us-ascii?Q?5C0PM/cby09CcTlmrr3YypqxG40GiewA/vKMw3Pff9RY6yAfSBr1QCLXeh4P?=
 =?us-ascii?Q?VAdN/JzXbVD0RQC33RfipK1toL50luK5CbEEVtlWbNZ70rpBEBH/fzYH2yvR?=
 =?us-ascii?Q?l83dvLtjIh9I5zKPWQyW/Fy76iTm46tzNBkKIpW0SM/6Hz5Isgzvq/n1wCRz?=
 =?us-ascii?Q?1aisqDfvGGELU1+UL91hxzig6F4YBO55TOQBMDjuu+xeJFHtoszC9PlMoB0J?=
 =?us-ascii?Q?a1d5d6oRDw16m20YyYUC+ypz5eO4Mh0uHRaPtRi75iKJsrDIIIWIe3N+YdlD?=
 =?us-ascii?Q?PJ08i25Zoo2JHRslJBbqJrIlBdFUl09LTtCafj4v2FGGlf5QfbBvQRFuF+/T?=
 =?us-ascii?Q?NqLQ3Tt+NredvzHDP5rXebnf80nLMR9vRt/qxKYQB2+gwYMHtq/5mAAo9kB+?=
 =?us-ascii?Q?iRJIo1UCiKHwoveIJDcCHeV6e9KXiuYd50CEhFicynAYCyOHF/RkS2B7tIES?=
 =?us-ascii?Q?zYD65mVuHf3WTOtN8GQClZfe3Mn0XecEzKcplthubBH1Fl2KaJghmIvGfPqX?=
 =?us-ascii?Q?TVAo8MoXtLJyEbxYKzfmdmawzBQoq1avUCRUA2fk0BAV3ItZXpM2Z2vHk5mp?=
 =?us-ascii?Q?9U8PvO+Mw3KhU/bl7xgSPrA+usFxPCtnhRl1TOrvMCYTOFctE5r6oOxbIavg?=
 =?us-ascii?Q?E7P91u3C/lK/MY+8eHfRCsRZa62bIw8dqalg/gv+xK4C0EUmNQm+F0qttEYk?=
 =?us-ascii?Q?wnX5M0Zsbb8Lk3O1HjGEGnl4M/baKxJhyUWdMawt69oQ141eVWPZ2cAdYeaQ?=
 =?us-ascii?Q?Z5ca6b2EqS3GgpMmSCIEWoi73ZCleSCB1Pow37+MWKDpKYAneyinbBv9rQSa?=
 =?us-ascii?Q?J5RUiHbKD1hr3mj77++Qnqds+KC2zAB2ySyzWcV9lRRirLgOjdNHjz45cnH2?=
 =?us-ascii?Q?2/mYCr0Z2bLnClxVDZjyPTI07+TQna644obzJS2WG0PUU2uT+qaRYBg+5feS?=
 =?us-ascii?Q?0mcqoWLVL6DSJI0tPwmzkclm87kFsPSNLyIvY3odC+ktNlfANLZsBoS6SNd8?=
 =?us-ascii?Q?EAo9MXtX+AL5Sbay3aZVhPf1/0T9/PF+gana2MxOdgiRMCbHLOgKUQFMbJbr?=
 =?us-ascii?Q?hV3A7I7pbIQL7aupujoG6ezQJGusk4VXOX4CLylCKMiNmPsXTak5fUsoDuQk?=
 =?us-ascii?Q?S3E2/GP4tWb0kuznWnVqJ/FJ2pmAXv7LpXqRqsnAQb0BP6RX56jvSuKxukJH?=
 =?us-ascii?Q?cxQqWFh9p3RN8eQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:36.5199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39632c70-b82a-4cab-e7a6-08dd1ff1335f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7703
Message-ID-Hash: R262BX4A5P3A6E45YWJI56OSMIVY3CMK
X-Message-ID-Hash: R262BX4A5P3A6E45YWJI56OSMIVY3CMK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R262BX4A5P3A6E45YWJI56OSMIVY3CMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pm ops support for SoundWire dma driver for ACP7.0 and ACP7.1
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70-sdw-dma.c | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70-sdw-dma.c b/sound/soc/amd/acp70/acp70-sdw-dma.c
index 2c01f60cf3b9..183db176725f 100644
--- a/sound/soc/amd/acp70/acp70-sdw-dma.c
+++ b/sound/soc/amd/acp70/acp70-sdw-dma.c
@@ -13,6 +13,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
+#include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_amd.h>
 #include "acp70.h"
 
@@ -128,6 +129,29 @@ static const struct snd_pcm_hardware acp70_sdw_hardware_capture = {
 	.periods_max = SDW_CAPTURE_MAX_NUM_PERIODS,
 };
 
+static void acp70_enable_disable_sdw_dma_interrupts(void __iomem *acp_base, bool enable)
+{
+	u32 ext_intr_cntl, ext_intr_cntl1;
+	u32 irq_mask = ACP_SDW_DMA_IRQ_MASK;
+	u32 irq_mask1 = ACP_P1_SDW_DMA_IRQ_MASK;
+
+	if (enable) {
+		ext_intr_cntl = readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl |= irq_mask;
+		writel(ext_intr_cntl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl1 = readl(acp_base + ACP_EXTERNAL_INTR_CNTL1);
+		ext_intr_cntl1 |= irq_mask1;
+		writel(ext_intr_cntl1, acp_base + ACP_EXTERNAL_INTR_CNTL1);
+	} else {
+		ext_intr_cntl = readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl &= ~irq_mask;
+		writel(ext_intr_cntl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl1 = readl(acp_base + ACP_EXTERNAL_INTR_CNTL1);
+		ext_intr_cntl1 &= ~irq_mask1;
+		writel(ext_intr_cntl1, acp_base + ACP_EXTERNAL_INTR_CNTL1);
+	}
+}
+
 static void acp70_config_dma(struct acp_sdw_dma_stream *stream, void __iomem *acp_base,
 			     u32 stream_id)
 {
@@ -476,13 +500,81 @@ static int acp70_sdw_platform_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
 		return status;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
+static void acp70_sdw_platform_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+}
+
+static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
+{
+	struct acp_sdw_dma_stream *stream;
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_runtime *runtime;
+	u32 period_bytes, buf_size, water_mark_size_reg;
+	u32 stream_count;
+	int index, instance, ret;
+
+	for (instance = 0; instance < AMD_SDW_MAX_MANAGERS; instance++) {
+		if (instance == ACP_SDW0)
+			stream_count = ACP70_SDW0_DMA_MAX_STREAMS;
+		else
+			stream_count = ACP70_SDW1_DMA_MAX_STREAMS;
+
+		for (index = 0; index < stream_count; index++) {
+			if (instance == ACP_SDW0) {
+				substream = sdw_data->sdw0_dma_stream[index];
+				water_mark_size_reg =
+						sdw0_dma_ring_buf_reg[index].water_mark_size_reg;
+			} else {
+				substream = sdw_data->sdw1_dma_stream[index];
+				water_mark_size_reg =
+						sdw1_dma_ring_buf_reg[index].water_mark_size_reg;
+			}
+
+			if (substream && substream->runtime) {
+				runtime = substream->runtime;
+				stream = runtime->private_data;
+				period_bytes = frames_to_bytes(runtime, runtime->period_size);
+				buf_size = frames_to_bytes(runtime, runtime->buffer_size);
+				acp70_config_dma(stream, sdw_data->acp_base, index);
+				ret = acp70_configure_sdw_ringbuffer(sdw_data->acp_base, index,
+								     buf_size, instance);
+				if (ret)
+					return ret;
+				writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
+			}
+		}
+	}
+	acp70_enable_disable_sdw_dma_interrupts(sdw_data->acp_base, true);
+	return 0;
+}
+
+static int __maybe_unused acp70_sdw_pcm_resume(struct device *dev)
+{
+	struct sdw_dma_dev_data *sdw_data;
+
+	sdw_data = dev_get_drvdata(dev);
+	return acp_restore_sdw_dma_config(sdw_data);
+}
+
+static const struct dev_pm_ops acp70_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, acp70_sdw_pcm_resume)
+};
+
 static struct platform_driver acp70_sdw_dma_driver = {
 	.probe = acp70_sdw_platform_probe,
+	.remove = acp70_sdw_platform_remove,
 	.driver = {
 		.name = "amd_acp70_sdw_dma",
+		.pm = &acp70_pm_ops,
 	},
 };
 
-- 
2.34.1

