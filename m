Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A425C9F744D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:53:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 230CA60261;
	Thu, 19 Dec 2024 06:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 230CA60261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587623;
	bh=61vLK/Lfbnuo0apna6hf5huq1f9vNvNfWkOnCfLep8I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W1x/lF0p287s7I8gaK5o7k0614k0bwsRKSmxfkB0PjFC2o5SI4ixabcGUvdYQ1fH8
	 A/ejgH9c8vsDg+VQk2q1ZKjzY55xUMMNFIVL+F9sMEeronUEcPoidbDhQTlPF9Ibqi
	 /fTYQ/i29uVfIBDFthjOW9Fk2NILmpKk0e0L5p5Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C46FF806C4; Thu, 19 Dec 2024 06:51:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AFEEF806C5;
	Thu, 19 Dec 2024 06:51:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E717F80636; Thu, 19 Dec 2024 06:51:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5DA4F8069D
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5DA4F8069D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vnKXZFHj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auXi4OMMZlvUWXo5E6suiu2fn2F2cAliYz0H5H9FCC+paSO7MCTE0VvlF/ztd9bfWUnncJBSTxAM7tvEJ+kxZs9AZEStbuG3XgDQyuZOc/6wWK4G28ynwE9Vd9HxxJrb2WGrKuhunt6fF/Rkdy/4XKDv+TxaNnZBrniQTvv/2wh0zvZ0UI9v3jarUnRagbmNqgplZz0iNcO1Dl+69i7n7V2WjGUBtU5l7e9cZ4yGPowVz9cxzAF84psNdZutqBjdb/Cm2vFHvIdSQ+jR+km3hHEYWB4tIiJlcGnh6w2zZcYqJDOdxX7dQkeBE1SXZqAa7Gv2TvZVqjsqI5M8b1wSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I/noJPxLUYHqZ/gxxeYaLw3vbYs4PWX8xD6KqYdxSA=;
 b=C6awTweHfzjhLrkGr3BHOF3o+Gl4igTL5L1fJm+f181mwCuYnpyVP4/48lEKwxVjpCUPHCxdi9G5SaFoB8OMERqEodskFCQ6VkfEf34K0q922Xf3m+WITZuGkv3Ftx47qZJ0v0cF7BOqXST9EX1USAAOZHEEEFMyEvcqdzNZscSm+zXiBzkNJOIxBYCRvefmH9XbRMXcxBSnzvJOk0SkFmT2kaJXXBSLRRGUXfPQRgI4zFSYwCsEdcWBeWBCCayY+l3zvnuCsFzb/uBBZqNpcncIl6Lf0E3hMm+24PLFb/W2FQEsZs+aAnx1TG/RymYiwKUdEM909W8qAnZbDGKLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I/noJPxLUYHqZ/gxxeYaLw3vbYs4PWX8xD6KqYdxSA=;
 b=vnKXZFHjANMzU5tKyPWYM6hZNmq0+NDPNn8iaMFXFyzJJP5huq7ps1X/6JKADzHN0F+uJSTUoV5eGvhQKX7cplhLZ7upfUR4U6qRb2B7yu4c3paN7My3zs434zJR8C4gtHkSa776bV9RYR9UHUYN8NWirxJmdd6/JGQ1yncsIvo=
Received: from CH5PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:1f1::26)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 05:51:30 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::ac) by CH5PR03CA0008.outlook.office365.com
 (2603:10b6:610:1f1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 05:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:29 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:26 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 12/21] ASoC: amd: acp70: add acp ip interrupt handler
Date: Thu, 19 Dec 2024 11:18:48 +0530
Message-ID: <20241219054857.2070420-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: dd352223-24a3-470f-c377-08dd1ff12f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WuqSQe9FmBbHA04Ro5Tt6DY8Om1EWXu25IrWu8X8qSo2mJFWUb6XAretAS3B?=
 =?us-ascii?Q?wi/O2NTDDuCtXS2kb87vN4U9t+srV1NUsinHtw/GL4qRlTQyVals0Oabirb9?=
 =?us-ascii?Q?dPOZrQEI0aGnWzOZs79iothRzMi55w4ExXFReDpuRrCHQQ14PYmVp/gKrxzD?=
 =?us-ascii?Q?Ub9EG3DNF8aOeDd1IHaJH3KgZXuboihHJRbR+5qrw2SSDPh+8qFHe6W2/R3N?=
 =?us-ascii?Q?A7GhLm+ROxnDrBiYKUuwHTEyp3OFuGsfY5sLCXNlAl1Zsdp4KXAQhmO2/A1+?=
 =?us-ascii?Q?yUPgSahV8i9z30jWIh9HMR7SU+LLaLn38i2zfnUe3k3iKENTAsPpZn8tMmJe?=
 =?us-ascii?Q?2gkV457+62v1F7X4OFTv38G1l4I2d9Lq/7A0/GSL+S6+3qRqAYe/va37Ta06?=
 =?us-ascii?Q?pv+060QMfOcuO0IbuqJuvYSsAFyVnEUGTaiAOl2/Z1dHy5NxJaVjtYDsgLyn?=
 =?us-ascii?Q?N7g7Mm6NusgD6iOjmLpA2fQuogVeETG864n1V0yKHZIaoraM3k2jof8vSBBZ?=
 =?us-ascii?Q?SfnQ/TyuJ54jim9hV7oiLJyOzu09QTXmdmsOZ3dwiFin38Vkw6d0ZfT9qaj/?=
 =?us-ascii?Q?3vPdOulW4OGtIkPeTQ2pAbhSpafldNyx5MgcTkf7gZE0ZHYtkXCVGzmFFI6s?=
 =?us-ascii?Q?UbegcwMjJ66cTtwZ+6gG0LClFNQbTVbFLZNnxXhSU7Fb/wnGAPUw3fYe8JBW?=
 =?us-ascii?Q?yCC/drZ7Fqck6RJYIIxNqg/FJO97fDaIrLSrhcRPZDX1v/lNFs0ccnRUk8J9?=
 =?us-ascii?Q?CIucIeAc8vhJjlwrQPItdUUV8FhlHVPQY5VSgg3QlnN0iM57c0FYLzwmQE/O?=
 =?us-ascii?Q?Mjt4CqYaRja53gyUf5XOh3sY7OReOSAvxlmi0Q2+44HhFHr+kiw451z/rRS0?=
 =?us-ascii?Q?hsKbnJNDBtPvmiriZrIedSHKihQm5G4nkAp1CnUQDqjkQaOsLca5jJxuSnOY?=
 =?us-ascii?Q?9w7kGDsX7qMTrRdg97cEPyEt5HwvxRJkb7JnBCcwjAt1SkiEci0H7G3uwuFQ?=
 =?us-ascii?Q?niRTtglxRkEzZHwKp+yeoAfwVxSK3lpYyCFVamJfuOyeH/G28zVjS2Pfea61?=
 =?us-ascii?Q?j1okXcIfESRvqCuCnrynpQSkohkb/g9JdFQjye8bTjeEjW9eK4fOKO41vNhJ?=
 =?us-ascii?Q?J/bE/kJLrsQuYvgNd3e5VhPzhqy7RzrrasowqDxdlvGTBgoAeFTKP6xLlCJn?=
 =?us-ascii?Q?cO0J9at2h3eH676LVC0ih9jOkm3Cnb949/5JkDdVAe1w3KUT/vc9KVIGWYK8?=
 =?us-ascii?Q?12ISs9R8xCTd657YCT35hv0wYnKIocAgwIgqQ0WVbDFIoG8gRzY20zi31gMQ?=
 =?us-ascii?Q?rtV4Q9/R2A0OHpdyCislbm51BGv+G1dtF8MixeAl40fEDk9M4ZqDVavImAGm?=
 =?us-ascii?Q?DAKOpDoU/w7hJyKjrxYMRI3x156D+OT0Yily2cmXV2LDFS/Rr6yS++vsZH3N?=
 =?us-ascii?Q?/mbnGx4O+z5sGcirknv+N5dCvlsRO23sibPKbS+7S76XH04EQYzgBSwEGByJ?=
 =?us-ascii?Q?esyokxdHyh3ZJOM=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:29.7335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd352223-24a3-470f-c377-08dd1ff12f56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298
Message-ID-Hash: 6OYAXQM35HH6WO6JEYRXGXOYXXNTL7WX
X-Message-ID-Hash: 6OYAXQM35HH6WO6JEYRXGXOYXXNTL7WX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OYAXQM35HH6WO6JEYRXGXOYXXNTL7WX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add interrupt handler for handling, below listed interrupts for ACP IP.
- SoundWire dma driver interrupts
- ACP PDM dma driver interrupts
- SoundWire manager related interrupts
- ACP error interrupts.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |   4 +
 sound/soc/amd/acp70/pci-acp70.c | 161 +++++++++++++++++++++++++++++++-
 2 files changed, 164 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index a96b021e64da..d5ab606adedc 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -238,6 +238,8 @@ struct sdw_dma_dev_data {
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev : ACP PCI revision id
+ * @sdw0-dma_intr_stat: DMA interrupt status array for SoundWire manager-SW0 instance
+ * @sdw_dma_intr_stat: DMA interrupt status array for SoundWire manager-SW1 instance
  * @is_sdw_dev: flag set to true when any SoundWire manager instances are available
  * @is_pdm_dev: flag set to true when ACP PDM controller exists
  * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
@@ -257,6 +259,8 @@ struct acp70_dev_data {
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
+	u16 sdw0_dma_intr_stat[ACP70_SDW0_DMA_MAX_STREAMS];
+	u16 sdw1_dma_intr_stat[ACP70_SDW1_DMA_MAX_STREAMS];
 	bool is_sdw_dev;
 	bool is_pdm_dev;
 	bool is_pdm_config;
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index a6812fa269b1..e732a680c092 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -8,11 +8,13 @@
 #include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <sound/pcm_params.h>
 #include "../mach-config.h"
 
 #include "acp70.h"
@@ -96,6 +98,155 @@ static int acp70_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+static irqreturn_t acp70_irq_thread(int irq, void *context)
+{
+	struct sdw_dma_dev_data *sdw_dma_data;
+	struct acp70_dev_data *adata = context;
+	u32 stream_index;
+
+	sdw_dma_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
+
+	for (stream_index = 0; stream_index < ACP70_SDW0_DMA_MAX_STREAMS; stream_index++) {
+		if (adata->sdw0_dma_intr_stat[stream_index]) {
+			if (sdw_dma_data->sdw0_dma_stream[stream_index])
+				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
+			adata->sdw0_dma_intr_stat[stream_index] = 0;
+		}
+	}
+	for (stream_index = 0; stream_index < ACP70_SDW1_DMA_MAX_STREAMS; stream_index++) {
+		if (adata->sdw1_dma_intr_stat[stream_index]) {
+			if (sdw_dma_data->sdw1_dma_stream[stream_index])
+				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
+			adata->sdw1_dma_intr_stat[stream_index] = 0;
+		}
+	}
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
+{
+	struct acp70_dev_data *adata;
+	struct pdm_dev_data *ps_pdm_data;
+	struct amd_sdw_manager *amd_manager;
+	u32 ext_intr_stat, ext_intr_stat1;
+	u32 stream_id = 0;
+	u16 irq_flag = 0;
+	u16 sdw_dma_irq_flag = 0;
+	u16 index;
+
+	adata = dev_id;
+	if (!adata)
+		return IRQ_NONE;
+	/* ACP interrupts will be cleared by reading particular bit and writing
+	 * same value to the status register. writing zero's doesn't have any
+	 * effect.
+	 * Bit by bit checking of IRQ field is implemented.
+	 */
+	ext_intr_stat = readl(adata->acp70_base + ACP_EXTERNAL_INTR_STAT);
+	if (ext_intr_stat & ACP_SDW0_STAT) {
+		writel(ACP_SDW0_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT);
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+		if (amd_manager)
+			schedule_work(&amd_manager->amd_sdw_irq_thread);
+		irq_flag = 1;
+	}
+
+	ext_intr_stat1 = readl(adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+	if (ext_intr_stat1 & ACP_SDW1_STAT) {
+		writel(ACP_SDW1_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+		if (amd_manager)
+			schedule_work(&amd_manager->amd_sdw_irq_thread);
+		irq_flag = 1;
+	}
+
+	if (ext_intr_stat & ACP_ERROR_IRQ) {
+		writel(ACP_ERROR_IRQ, adata->acp70_base + ACP_EXTERNAL_INTR_STAT);
+		writel(0, adata->acp70_base + ACP_SW0_I2S_ERROR_REASON);
+		writel(0, adata->acp70_base + ACP_SW1_I2S_ERROR_REASON);
+		writel(0, adata->acp70_base + ACP_ERROR_STATUS);
+		irq_flag = 1;
+	}
+
+	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
+		ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
+		writel(BIT(PDM_DMA_STAT), adata->acp70_base + ACP_EXTERNAL_INTR_STAT);
+		if (ps_pdm_data->capture_stream)
+			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
+		irq_flag = 1;
+	}
+
+	if (ext_intr_stat & ACP_SDW_DMA_IRQ_MASK) {
+		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
+			if (ext_intr_stat & BIT(index)) {
+				writel(BIT(index), adata->acp70_base + ACP_EXTERNAL_INTR_STAT);
+				switch (index) {
+				case ACP_AUDIO0_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO0_TX;
+					break;
+				case ACP_AUDIO1_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO1_TX;
+					break;
+				case ACP_AUDIO2_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO2_TX;
+					break;
+				case ACP_AUDIO0_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO0_RX;
+					break;
+				case ACP_AUDIO1_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO1_RX;
+					break;
+				case ACP_AUDIO2_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO2_RX;
+					break;
+				}
+
+				adata->sdw0_dma_intr_stat[stream_id] = 1;
+				sdw_dma_irq_flag = 1;
+			}
+		}
+	}
+
+	if (ext_intr_stat1 & ACP_P1_SDW_DMA_IRQ_MASK) {
+		for (index = ACP_P1_AUDIO2_RX_THRESHOLD; index <= ACP_P1_AUDIO0_TX_THRESHOLD; index++) {
+			if (ext_intr_stat1 & BIT(index)) {
+				writel(BIT(index), adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+				switch (index) {
+				case ACP_P1_AUDIO0_TX_THRESHOLD:
+					stream_id = ACP_SDW1_AUDIO0_TX;
+					break;
+				case ACP_P1_AUDIO1_TX_THRESHOLD:
+					stream_id = ACP_SDW1_AUDIO1_TX;
+					break;
+				case ACP_P1_AUDIO2_TX_THRESHOLD:
+					stream_id = ACP_SDW1_AUDIO2_TX;
+					break;
+				case ACP_P1_AUDIO0_RX_THRESHOLD:
+					stream_id = ACP_SDW1_AUDIO0_RX;
+					break;
+				case ACP_P1_AUDIO1_RX_THRESHOLD:
+					stream_id = ACP_SDW1_AUDIO1_RX;
+					break;
+				case ACP_P1_AUDIO2_RX_THRESHOLD:
+					stream_id = ACP_SDW1_AUDIO2_RX;
+					break;
+				}
+
+				adata->sdw1_dma_intr_stat[stream_id] = 1;
+				sdw_dma_irq_flag = 1;
+			}
+		}
+	}
+
+	if (sdw_dma_irq_flag)
+		return IRQ_WAKE_THREAD;
+
+	if (irq_flag)
+		return IRQ_HANDLED;
+	else
+		return IRQ_NONE;
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_AMD_SOUNDWIRE)
 static int acp_scan_sdw_devices(struct device *dev, u64 addr)
 {
@@ -333,8 +484,11 @@ static int snd_acp70_probe(struct pci_dev *pci,
 {
 	struct acp70_dev_data *adata;
 	u32 addr, flag;
+	u32 irqflags;
 	int ret;
 
+	irqflags = IRQF_SHARED;
+
 	/* Return if acp config flag is defined */
 	flag = snd_amd_acp_find_config(pci);
 	if (flag)
@@ -382,7 +536,12 @@ static int snd_acp70_probe(struct pci_dev *pci,
 	ret = acp70_init(adata->acp70_base, &pci->dev);
 	if (ret)
 		goto release_regions;
-
+	ret = devm_request_threaded_irq(&pci->dev, pci->irq, acp70_irq_handler,
+					acp70_irq_thread, irqflags, "ACP_PCI_IRQ", adata);
+	if (ret) {
+		dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
+		goto de_init;
+	}
 	ret = get_acp70_device_config(pci, adata);
 	/* ACP PCI driver probe should be continued even PDM or SoundWire Devices are not found */
 	if (ret) {
-- 
2.34.1

