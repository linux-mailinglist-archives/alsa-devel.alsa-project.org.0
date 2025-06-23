Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26EAE38DE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jun 2025 10:47:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45AB7601F1;
	Mon, 23 Jun 2025 10:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45AB7601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750668457;
	bh=nwQ+8lg584dvEjnTwdFm94m9UhO8Lynx8LU7MG3Hvw0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gbEdY4gifM3ndDbzTFoun/4qUsKO0hNzd62ZTbQQKPEMLJwa22NfFhNSCMys+oyjd
	 BDTfSkpUIYyxVgVc0ckEeKCXtSQo8qMCPaloeoTMPot0TO/4OWRDS7bA5uwdy9qUTD
	 IS4uZZ9wHWyOO5h84j+rWSd2B4CEQ7q5dCHqmvQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D448F805C9; Mon, 23 Jun 2025 10:47:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F686F80087;
	Mon, 23 Jun 2025 10:47:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0109FF80424; Mon, 23 Jun 2025 10:47:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D54EAF80087
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 10:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D54EAF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RYTdsSNJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxwJgkQP5hFj8KCD8rwZBhajV+0w1oUwFwbIsCbWIoxtGONbhvXtmM5oFl0ERs9a8w31raXFMTxoBPxRM5OPR38zF/8941ocirmFVbtME6U0GoWl3AQ9IzwF5umk8D9ksFIOPi3zF+LU2Fz6iTZLdJ6ZbLxuU1sXlp4hVUJuPhUIu7Zt68nXaWuDFzVlpplCCLXE+KxeRrcgAD+ZiSB5rYj9nznISSKqszv5XkImHiMbxUy7t/tmSjkt1Jbl06RNkDUTZpU99UExF96oTdYw7AXE29inB0dJiEz4cFWTKFguFD0RW6ylXwmmUKD6WztQDfvDcQyb5qX2mb/gomNRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AvGfLf8CHjCBpZVckIRUqBy6B7hYMTL3tIV3NCGpRY=;
 b=aJe3qj1EQP6o09SCBskuUpYBoY4MtZRLRgigx5P+3b20Qdwm6pTmbhqovc5JNG3rYuwI5opgy3oRq9gcWyPW24HUytSGExdvfpf6FcR2VxM37Nad6CcAOJu/cQnWThA9b3Z+8QCvYJlmBR3WSMifaE/hGae3U5BLVT5SGt/8PgHCnv9nh808/bru+jpGEblQzdz6j+7sWaefOV7IvbC8lT0qXt8OIWHCFOFHWoHG909AJl/VZrG03t3So3+YzRaxDuwZvqkvk4wIh2+VXSTq2UcT45bQAe223n3zCrbKndmLXlmTWBQPEn4Bl5lTNdwVyYgwz3prV7lhHm/9HMl0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AvGfLf8CHjCBpZVckIRUqBy6B7hYMTL3tIV3NCGpRY=;
 b=RYTdsSNJTqFsCxP1DJDJzGIDIujGg7cns53jEzLbRNgShuJHsY7QiFfSt7Ia063LJpJ10yx1G/clOnQIUGs3uyE/pETT5lBA0TzEd39cmC0QdKU9lU+sduCtwweWqV0yqlJLi/Qkw+rL+w6V+/Cl2gl2uIIV7Hq+LV+f/ZGQM2Q=
Received: from BN9PR03CA0954.namprd03.prod.outlook.com (2603:10b6:408:108::29)
 by SJ5PPF7B9E98CB6.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 08:46:50 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::96) by BN9PR03CA0954.outlook.office365.com
 (2603:10b6:408:108::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Mon,
 23 Jun 2025 08:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 08:46:50 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 03:46:46 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2] ASoC: amd: ps: fix for soundwire failures during
 hibernation exit sequence
Date: Mon, 23 Jun 2025 14:14:55 +0530
Message-ID: <20250623084630.3100279-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|SJ5PPF7B9E98CB6:EE_
X-MS-Office365-Filtering-Correlation-Id: f59ded55-4963-49ca-0b53-08ddb2327efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TBBWBkksgzjVgKfaY9/21R+RUdl0xBnWBdZHbZfsodrf8LP64J/pt1Rjtwjh?=
 =?us-ascii?Q?VKJFQosp1ocT7EwGtticx5iyxRMHCbUykxrqmchRn/4aYBdxBkpDGoV9W2fq?=
 =?us-ascii?Q?ZYV7IMTHRMJp3IncYycRKbcSYLT0Kzbq8CvKTlskBcGOdFJbSY04mOXNmyy8?=
 =?us-ascii?Q?aP017z5xrAg8Atv2EajfhACbQs7DMv/Q1cGwOfBgt49q2y6zwkIzj63Z0gey?=
 =?us-ascii?Q?kj4dqyvICqKh8qh6jY2sUDm9RUXr7ep0NNGB/13NLaslyK7ePOZvpOy9+pTG?=
 =?us-ascii?Q?38ErbZg4Ew/18hr297F6GfmPwovvsucpT40O0g3VnlV4qWlRQ5mJ2NR8Rost?=
 =?us-ascii?Q?5BRO6dscIMMAgF+J4rS72EcvVajTin0BCi3MWz2s26TkH5rz+WZKttESWtZW?=
 =?us-ascii?Q?L4KnEGDrApDkk5QxmhBo82OJcykk7uwKwmZOZw+nI7mv9HLXbkX9Ty4Bz1XJ?=
 =?us-ascii?Q?wjaThk/EAfg7aeOIJJREPaZKqVQ823UBhpVnB6FerIPQHU2N3gpPUCmjC6Dc?=
 =?us-ascii?Q?4+mF20Gvjp4OtgCqxhscQ+zaM6Pm4LEelLVaUOkHtxUqeQyGI5NlEn+dZEXk?=
 =?us-ascii?Q?ui0aRprROvnqAnNGEjymYSx0OFTN1/u7k+S7upAtXHIZIHZWYpfXBXsd5wqI?=
 =?us-ascii?Q?NPp8MSzhaEln8WATgqvelIsoj86AEMrhmueQDBLmpDJU0VTNz4akMJIRj1oK?=
 =?us-ascii?Q?apKDkvLETG9tLVgvQ1PH3SF71Ed/DbxDSe0K96vsYXnYPjmZeB7saMI2IPUT?=
 =?us-ascii?Q?YMzdZDVE89PTZ9EWnUY595XJxg9OvJWYH/c6i4L8iGy4cRxL1hQXDDaN3L6E?=
 =?us-ascii?Q?CdPN+hoRE51YtHOLrzV8lq7cV9MorfPDAiW0wl98//VBYOvHWDL9TNcQIBur?=
 =?us-ascii?Q?D7F5utMnz6fH4DUeyP/5+RkFYFyEhQC3h3hnr1gpU+xdKhpgQ1JVbk9NZN4u?=
 =?us-ascii?Q?LABNwckvCUX9gssL87vqjONZpzMmqyot0r5FzNXQX71jSRftGPmmyas3dN0h?=
 =?us-ascii?Q?ohU0KK5+8GnFxSqnKCh1uWVF6KVRWs0aeD1qAWnDOrTigAvOV5vfgBr9b6tS?=
 =?us-ascii?Q?1EZfW9hC+x2YGVNIPbz9dE5NMIFby1oyUSV4cWQIcZrNUAtLlKIzcpM39ZHL?=
 =?us-ascii?Q?h16zc8GHf783XoZ4So/R0vu1kii0Pci7bu9UDkbuUeLiQEGqwel42R/P29mm?=
 =?us-ascii?Q?5NzCg1GDdEenLExmtimt7jKMeCS4LWQYwlZ2JdqxjxUcLbp+c89OxT35UqB0?=
 =?us-ascii?Q?cxvX6IeCFtBLLVJQNhu9vXwhd3j7bnXtLPIkv3kFehOB51VW6c4tTueOsGm/?=
 =?us-ascii?Q?wfzYlBAI/rKtehwhP/TH08PjtDhjgbI22me0mAa7VIV60D94jgAzyA012hA/?=
 =?us-ascii?Q?ckfJbnO8Pr5tmJh0C9yEBVIFb5vZc2g2tx4jXum8LIB/C5q/bfolMtjoOoLZ?=
 =?us-ascii?Q?/FqWeJa3PNW+Svj2kNm5fcPUISEHj6pD8K/+oN2h5EovJQnUp1VJXR+nAhIL?=
 =?us-ascii?Q?pexGmOcZXDfXq98I90AAAVcct/at9AiDhqRZ?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:46:50.4458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f59ded55-4963-49ca-0b53-08ddb2327efa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7B9E98CB6
Message-ID-Hash: VAVY5VR7GZLG7D6UEHZGDVAFFWBCLBRX
X-Message-ID-Hash: VAVY5VR7GZLG7D6UEHZGDVAFFWBCLBRX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAVY5VR7GZLG7D6UEHZGDVAFFWBCLBRX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During the hibernate entry sequence, ACP registers will be reset to
default values and acp ip will be completely powered off including acp
SoundWire pads. During resume sequence, if acp SoundWire pad keeper enable
register is not restored along with pad pulldown control register value,
then SoundWire manager links won't be powered on correctly results in
peripheral register access failures and completely audio function is
broken.

Add code to store the acp SoundWire pad keeper enable register and acp pad
pulldown ctrl register values before entering into suspend state and
restore the register values during resume sequence based on condition check
for acp SoundWire pad keeper enable register for ACP6.3, ACP7.0 & ACP7.1
platforms.

Fixes: 491628388005 ("ASoC: amd: ps: add callback functions for acp pci driver pm ops")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---

Changes since v1: removed extra macro ACP_SW_PAD_KEEPER_EN and used
existing macro ACP_SW0_PAD_KEEPER_EN in the code.

 sound/soc/amd/ps/acp63.h     |  4 ++++
 sound/soc/amd/ps/ps-common.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 85feae45c44c..d7c994e26e4d 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -334,6 +334,8 @@ struct acp_hw_ops {
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev: ACP PCI revision id
+ * @acp_sw_pad_keeper_en: store acp SoundWire pad keeper enable register value
+ * @acp_pad_pulldown_ctrl: store acp pad pulldown control register value
  * @acp63_sdw0-dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
  * manager-SW0 instance
  * @acp63_sdw_dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
@@ -367,6 +369,8 @@ struct acp63_dev_data {
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
+	u32 acp_sw_pad_keeper_en;
+	u32 acp_pad_pulldown_ctrl;
 	u16 acp63_sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
 	u16 acp63_sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 	u16 acp70_sdw0_dma_intr_stat[ACP70_SDW0_DMA_MAX_STREAMS];
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index 1c89fb5fe1da..7b4966b75dc6 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -160,6 +160,8 @@ static int __maybe_unused snd_acp63_suspend(struct device *dev)
 
 	adata = dev_get_drvdata(dev);
 	if (adata->is_sdw_dev) {
+		adata->acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+		adata->acp_pad_pulldown_ctrl = readl(adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
 		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
 		if (adata->sdw_en_stat) {
 			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
@@ -197,6 +199,7 @@ static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
 static int __maybe_unused snd_acp63_resume(struct device *dev)
 {
 	struct acp63_dev_data *adata;
+	u32 acp_sw_pad_keeper_en;
 	int ret;
 
 	adata = dev_get_drvdata(dev);
@@ -209,6 +212,12 @@ static int __maybe_unused snd_acp63_resume(struct device *dev)
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
 
+	acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+	dev_dbg(dev, "ACP_SW0_PAD_KEEPER_EN:0x%x\n", acp_sw_pad_keeper_en);
+	if (!acp_sw_pad_keeper_en) {
+		writel(adata->acp_sw_pad_keeper_en, adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+		writel(adata->acp_pad_pulldown_ctrl, adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
+	}
 	return ret;
 }
 
@@ -408,6 +417,8 @@ static int __maybe_unused snd_acp70_suspend(struct device *dev)
 
 	adata = dev_get_drvdata(dev);
 	if (adata->is_sdw_dev) {
+		adata->acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+		adata->acp_pad_pulldown_ctrl = readl(adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
 		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
 		if (adata->sdw_en_stat) {
 			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
@@ -445,6 +456,7 @@ static int __maybe_unused snd_acp70_runtime_resume(struct device *dev)
 static int __maybe_unused snd_acp70_resume(struct device *dev)
 {
 	struct acp63_dev_data *adata;
+	u32 acp_sw_pad_keeper_en;
 	int ret;
 
 	adata = dev_get_drvdata(dev);
@@ -459,6 +471,12 @@ static int __maybe_unused snd_acp70_resume(struct device *dev)
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
 
+	acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+	dev_dbg(dev, "ACP_SW0_PAD_KEEPER_EN:0x%x\n", acp_sw_pad_keeper_en);
+	if (!acp_sw_pad_keeper_en) {
+		writel(adata->acp_sw_pad_keeper_en, adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+		writel(adata->acp_pad_pulldown_ctrl, adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
+	}
 	return ret;
 }
 
-- 
2.45.2

