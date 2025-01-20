Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F5A16A51
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:06:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85ECB601DB;
	Mon, 20 Jan 2025 11:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85ECB601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367566;
	bh=61vLK/Lfbnuo0apna6hf5huq1f9vNvNfWkOnCfLep8I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q70mxM+C8d8958fu93ZfnrJrU7rHCJJJG5uI5ITMUGcd8x0tC+va324QR+U73hqU8
	 y913mOAbfWOMrHcCALzZ57ogD2TzDHm6y8x1bOkneP+9wJ9WZhGjMU9Syj85DmPv94
	 11Ct7nSifv3iwjuQIU/jONMqN2sJCkA2GJFFp9tE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1981CF8060A; Mon, 20 Jan 2025 11:04:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98326F805C3;
	Mon, 20 Jan 2025 11:04:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67264F805AE; Mon, 20 Jan 2025 11:02:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 930FFF80424
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 930FFF80424
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VOgPQqIb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt4a+EgF/2hUkqfIrcqzxe+ZFdCyiHsAwdyw9Ah38t0UsD0/nSQAy/kkDce61ibLvlr1aFLnAjpJmZwy5UDT9s2xVLsgtP5HNIiehqEMh9P04eBdWWmLjzBeLW8c4dj2C8Myt6aEAIhBXYpskC0sicvlhtOuLGuoREKKBii3Q7pWq4eG5etp1/vJpVT//llwSIRdmtv/Aad0+JSPalCEqPA6+X1FBgecopsM7gZg9iGtaEJVcrnvhud3LIruJ0ubPMuHwcpb2d1K8FECeZRa9BaPRmCTnNZC9bB6zsOrmwXbgBsnM24pvzBYeo2rsfrg1DCqmKnsCG5lfLOH0OxWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I/noJPxLUYHqZ/gxxeYaLw3vbYs4PWX8xD6KqYdxSA=;
 b=QohtfgEJY9ezZMhRp8Q90Qmm53MdW6HfGjOZMDh+H8xoXH3WpEIMC/gNJLDCKQjnFg4f9iitko0Pujzb46Ccy6DOMNbB8P2olbXUbarZqnZ/dnbf9uXWgLEkCZWPZcqoAvNmyM6nFymSYUIFrSEZGBGMInBys2Uaieos17vuXt3xmhUzgrxOW2skz9DvhthIvnZuTelXQDbSwtY/bmCXXb7aqJERaJxsGEJszEJPycHcLK3xhcdsgZnCrYhIAji0DDif1+LS+Y7CYboDvWX4BCXhA6Qt2SZeQ498sDhc+lHnXbgiPQEc3iH8qHUxREep3iNUyekIEypSaKXdDiWhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I/noJPxLUYHqZ/gxxeYaLw3vbYs4PWX8xD6KqYdxSA=;
 b=VOgPQqIbC6J8vmHOzok7/b9G92ZYnzUbOoXi6eaJCS291Dwbi02QueiZ2aC2EudBe+nUnqm419oTbhQPk1abF29SvqSGGVFuCRw3h9Zh9+tuC8cDmX4LMk6vVyc5d6R3kqZXuYTdGWZ92fl6JX7udS96rOlWs1niwxXVFEp1/gs=
Received: from CH0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:610:b1::29)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 10:02:27 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::15) by CH0PR13CA0024.outlook.office365.com
 (2603:10b6:610:b1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.7 via Frontend Transport; Mon,
 20 Jan 2025 10:02:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:27 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:23 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Date: Mon, 20 Jan 2025 15:31:19 +0530
Message-ID: <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SN7PR12MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a82f8dc-6a2a-4e8a-55a3-08dd39398b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2kBpZBRyZByO8yX3Nf0SpCOE8CdB0pUIAfgIDm4Aab8WQIPj9vFGaQctxZdC?=
 =?us-ascii?Q?UwHkAky+2MVIxEYD6akeiI2TuKaZ8hQl2OtqNZ8BXoB5Fq+kAqQLcxxjIK61?=
 =?us-ascii?Q?qwnf/XdZnpuN25NX6gAJsXCagGgtRuTRFqTP6MD5WAfHnolGC0sHpJwhuxCK?=
 =?us-ascii?Q?Z8EnSzGl6EP1Rpcuapk8Mh/Bi0CvfC6oSHKmr2u76EkWKWj7Zoes3kpiCJtq?=
 =?us-ascii?Q?SMIuksCA1m+drdOj490h3KS+Gxdrz+fGT4WkMKjdovceIgxpHg3AlQUXnERI?=
 =?us-ascii?Q?UCE4zrmCrhTvrjPjhUzkatfgg0GFYYWiFiQ67+7WD2Y0sofQiHi7i2sVtmzK?=
 =?us-ascii?Q?OfpL2qkRv6cUF9KgIALfLFja95f4eC8kEcMOVMmAJeIyl+RVEKBT7dlDoCKD?=
 =?us-ascii?Q?mxbgYavegA5zlm4JxaeIzH467xSG6mCMBPmI8pY0g5tDG8zIzQSgKu0yFUye?=
 =?us-ascii?Q?BQcCpY2N/uThJHsb8rG9Np6wjYioC7t/E2aoKwsQ2nLTY70o4OQT88Zh6uiO?=
 =?us-ascii?Q?LUExmkMBJtP2cMyrU/SJ5+uKBFlsSGly4Ppf/it01DQVZkF3UZH0aTlOreCf?=
 =?us-ascii?Q?Ck7eg1QQUB5iEY8HnzlkOdUIgmlu68ICMqDmCmsiXsI+okOvLihnLpmxGp62?=
 =?us-ascii?Q?mk/i5HtNgBvcP1aE7fQIJuLV+Id4N5jDXXXk1VeO7x2r3+u+OLHRr+rMLSLp?=
 =?us-ascii?Q?3+KnA9gT2GPkKLH6R1FNNKyCP2+7+4zjYjr2Tzm8rTC7lKBGMFc4UrcgjLDI?=
 =?us-ascii?Q?0MH9QUdjRINoycXb89dvjN4XO2KKPGSBpTKyhUw5SKYF6toXfubQHbPZlPlL?=
 =?us-ascii?Q?iJ6LY0Rkt9bYfft7ngohCylzNaBUw4QvTWsy2oN8XaxEoDQY7XvEJBrIOnhX?=
 =?us-ascii?Q?+WLOYfxZNazddOUy30OfDhs3hnZOPruYpvNTeDBDDW9kIBVpqG9RgST+0Shx?=
 =?us-ascii?Q?lr0M0znVo9BAATg1TF4WIUmHr3XYxlvS58DQpI7FugSKS6uCQwBDLUQyH4zP?=
 =?us-ascii?Q?hZBNyvOKT73lrDReV4iqH4UmrLrtr/nU74o5idSwHr3BWWPyRxLrf2HNDLZO?=
 =?us-ascii?Q?BYLIVVa0SbPL96X5KC54vJXUeDqaD488FTTOaLRA7GMh6E+Zw4SdHLD688dc?=
 =?us-ascii?Q?AbDdzzMY5yglLR6Zk33yBfdbBhJeNIrwJpaXqHakPfzCUS1/1dasviPXhiUI?=
 =?us-ascii?Q?NNUseJEyeFYxLkfX8KBQqPg/51sgtLskfvlqI78uWsK/wOO/O3AHCsGQn4kf?=
 =?us-ascii?Q?ymObvcVk7x+F6MMYJxfb47JhaQUS8s9C9e4aoQIqluVAOQZgJYRq3lAfSuAc?=
 =?us-ascii?Q?0csDa1K2zbIhYjk9FHCJtO1jDmnuE5VUhMsw/b5PrM6M47S71jWR3rX2i0Bq?=
 =?us-ascii?Q?guNnDvxmyC4m9KFoeUdxfOiLYvXvLa4NSnbZZMgn6Jb0nnSlnh13fUTd0OYB?=
 =?us-ascii?Q?dPhIorcsNOF9sziZP/uCwZG7eybY1agaROze6Fzfpxz3QIzKRAKpgsjHeW+Y?=
 =?us-ascii?Q?/hA0TB21J6FSAKY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:27.3214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a82f8dc-6a2a-4e8a-55a3-08dd39398b94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130
Message-ID-Hash: TU2HRONDNEEIJYOPGACBRNI5TLKGK7KP
X-Message-ID-Hash: TU2HRONDNEEIJYOPGACBRNI5TLKGK7KP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TU2HRONDNEEIJYOPGACBRNI5TLKGK7KP/>
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

