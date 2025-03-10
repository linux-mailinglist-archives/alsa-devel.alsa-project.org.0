Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D3A5919F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:48:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E6D60711;
	Mon, 10 Mar 2025 11:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E6D60711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603680;
	bh=+T6DtZkjUW4qNBwq1g4AiEPue11WTiHkF6Cve0VnH6Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f6PMBQuQWCo/iQCf7MBWXW2ozsCC8ZmpGXHi6NB+kgTKFhBnV2dXTZ8NvhlpNHYN/
	 kBWnUE4PlrqUjV1xdVoJ1TFy8ahtDKYbsslhB5oag68dt+UePUeT8lrQBjueND7GsH
	 L3EU0B2tx+gabAOgv14XBtSt+lNADU+4YfnJilDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4133F80529; Mon, 10 Mar 2025 11:46:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D82F80623;
	Mon, 10 Mar 2025 11:46:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 536ADF8061F; Mon, 10 Mar 2025 11:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::625])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 453A5F80616
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 453A5F80616
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CPdWmlMi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIfajJXukeoMoSCZkAkU/+PImW5nVqB9WxWedEw7tUcRsz+GE9x3OXRp1TvZeX963BqkfBY91oQX/mIGjfOC8AM3+6CR2CttHeI8aZoqvjImelS6hmijz4qEMIolHYjUXHg15JPcUpzt9zS7iXgqX9mBsYSWD+TEbJ22ibf3HRGIvozZauGRaUkiIj36qXCQzICZFFxGzKuk3q3IDPVXPs7Y4Sw68lExFGU1rjCMBtvhYnTpf7pxsnbAw3gUCNmUaDQVy2zbJ6RpgZB+EaO32jVB+x7EI2X9QwxReBeFHc3f665mbDdnL9p9mdWn9LlAQaHLgIRcel6jypYkTgJmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zONjeaqdSa0fKgWDuyGZeV0JRjTjjEG3D+lHXK1Uo0=;
 b=V5TeZ8taSLUgjLXHoc7awXyZx20GkiZ2MUY127GDVojVb1uZ2QegGBBEe1vSLs9voKcoNyD11BXOFzShrvDTn582tgru8dj3kR6bdYYZTvqTZPQ2QLlNZujjdIn3ISphqLCWdLO6Spg1kQ/+E9Wb3XVFqW6RNj2B1oqYyByUJdWShHGAPJWwL9TSGid1r807RZDPpBgReLY0OQM2c+vKDAB8WbChdpujigxJqusLWc/Y4QCtRONVE4MbFRm/VPOpdPCPn/zHyPA5Jxm/FYaIdW5m9OL+h2wJGgl2NNf8s9wvAgsYvkFSuni45FrDKWxLT4gMlAtDRd9/hHMQ5HjMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zONjeaqdSa0fKgWDuyGZeV0JRjTjjEG3D+lHXK1Uo0=;
 b=CPdWmlMi66KN41QQHShsS4UdqqdcUYj+1DCsMRRWrzR/8YwyGSFA17chD7fLqMDhQ0Kz+QyrV9oP/6HSI90zykjaHO/GmW6zi+K83BxLUpH0iXNWCaMDSh1TDaFKXdo8exigZfvwvMiTJwXLLkN68VZfK+S7Y9lYqawQgxMUVy4=
Received: from SJ0PR13CA0112.namprd13.prod.outlook.com (2603:10b6:a03:2c5::27)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:46:30 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::f8) by SJ0PR13CA0112.outlook.office365.com
 (2603:10b6:a03:2c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.16 via Frontend Transport; Mon,
 10 Mar 2025 10:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:46:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:46:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:46:28 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:46:25 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH
	<gregkh@linuxfoundation.org>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 04/14] ASoC: amd: acp: Refactor acp platform device creation
Date: Mon, 10 Mar 2025 16:15:51 +0530
Message-ID: <20250310104601.7325-5-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af95371-d95e-490f-86de-08dd5fc0d113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VnLi9DL7QY7nwF1xFGf58i+j2PPjadRhlXfKFMcad97gwCyio4oZj+4w1H7m?=
 =?us-ascii?Q?yZRSZfTPeJydIbDkoFJgxIVDZ/u8fEFE+VC1TNlfxl55qIXymrvQPFXs/zE+?=
 =?us-ascii?Q?tMqj3ntI50Mohyu6b9rvLsiYRBusUergFNY/Lh/YoEKGudhqgb7Qpw4nvIQI?=
 =?us-ascii?Q?N9iAFWrI6MRGsI1D0fBqkMPOACfLzirthlVKkDk4KkglyGohYNc1q+yJ+6ot?=
 =?us-ascii?Q?su3LwNnUschTsG3rxhpJOEQv3Bxum3JFWgZ+lo7F+ZkMTlhj1yKdMe3xTsXI?=
 =?us-ascii?Q?pdps7aAvWLG7kyDxUd+2dPY+cZvtGMMMrwbw/caVwvekgcTPC5gwy5kJFBVE?=
 =?us-ascii?Q?8JCRZUrWI1zViu2fPx0TpL0XDUnNPRvYYIhYDcdHsIXXHUOtv+Inru8GOTF3?=
 =?us-ascii?Q?cqXiKivQMtb51jCzlWnfi2U6e1A+n6kdHKF3ssi5W1d2KJAvYuBuyIYt3MAy?=
 =?us-ascii?Q?mkgC8NLnz6MA6HimuFDYPBEDulZiH3iPcsPwyxPW1hqXHnL9ybwkuJMYDAa5?=
 =?us-ascii?Q?GgkdCde568e/zxkXAfHG//QmACqzfJR3vL0Extd1TkW0dwqO6ABQimhy4TTW?=
 =?us-ascii?Q?/pfh4O5WcZNhV2d3f+YCNZOID34f+uHZpcGsjNumZMuXXqqFIaLAvbxuqhWk?=
 =?us-ascii?Q?ThjtYbSP+hwnMQ3h4P9qLL4QKMFZuo3a8xNKbtlj8NLorH/et5SCfETSZRC+?=
 =?us-ascii?Q?/CBSAQgzRgOYwt0+0fxvixzZUlP8ClQWklVkraqAJOrtq87WZHotZ/v4ljPV?=
 =?us-ascii?Q?PMGIkFYE+Nsuom459j6q75Df9y0/wck1Y1YJWfqlafyKN3AWb8TnjyDvbiFa?=
 =?us-ascii?Q?4jRK66IdbH5c9qypsF9PPZA/QqQg5CNwkz/I2gpYCBCpV3aAVXMFb5F+yKfu?=
 =?us-ascii?Q?q/CRC+zgFsiuuSNTmy7/QQ8ld/rOmUgY1E+iEizRIQU62iQyMLIZ13zXcuCc?=
 =?us-ascii?Q?LudCUqhIqj2z3OaXhSP7fEDvMpL9UO+1c/s/PD3+8XjGtUKZHZC/I897/DAo?=
 =?us-ascii?Q?gyjraoNt5wCLdRz/hrzqFVs6gwHPp7rSVq5a0cP/9nf/5DYDBT6sidt+gY8h?=
 =?us-ascii?Q?qU523a+PIC51YlEXHZcl54UUQS5nkD3R65akZmPBQuQ88MsvWI7G+I5DpUpG?=
 =?us-ascii?Q?mE//E89p4/pKCPBAMa+LcoMEr3HSLoUjAFJ5oWF5wWqW12wvb0NPBPqC20k6?=
 =?us-ascii?Q?oTve+/14Oz3doUZliCIuQr3Ch38qQegRx8YFMqaKufDFHHmOABhkMRwhROVW?=
 =?us-ascii?Q?QY5F0ZQ5DvcgaCHy2yXkxh2SCKgnBCxHdpPyDhmiDIlW9wQCVzWcRLYktNs7?=
 =?us-ascii?Q?ArulCrDH1DJLKJ1ZXy5nYx9UjNapTVxI8aHI8DSjaYNX6y/2tfgWxfeBZnSM?=
 =?us-ascii?Q?VYyzUQxRsj8Ier6Va7LK24NjVMMzFV5PbI/cYMsaK1wSa7w+wj0McRoMIYC/?=
 =?us-ascii?Q?b7DqlHM1Gp6utuOSBH152bXqJeUGF8crLrDfmfO2mfzsgvbfIxFh/rsvoDQH?=
 =?us-ascii?Q?jNUtDdVZ8dLzywc=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:46:30.0992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2af95371-d95e-490f-86de-08dd5fc0d113
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045
Message-ID-Hash: 3XBDTNG24BUC3BGO63IA4VJXL2D5SJBO
X-Message-ID-Hash: 3XBDTNG24BUC3BGO63IA4VJXL2D5SJBO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XBDTNG24BUC3BGO63IA4VJXL2D5SJBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor acp platform device creation logic and remove unused
acp resource (acp_res) structure.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 119 ++++++++++++++++++------------------
 sound/soc/amd/acp/amd.h     |   4 ++
 2 files changed, 62 insertions(+), 61 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 95dbc9b01a70..9030db1c1780 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -26,27 +26,56 @@
 #define ACP3x_REG_START	0x1240000
 #define ACP3x_REG_END	0x125C000
 
-static struct platform_device *pdev;
-
-static const struct resource acp_res[] = {
-	{
-		.start = 0,
-		.end = ACP3x_REG_END - ACP3x_REG_START,
-		.name = "acp_mem",
-		.flags = IORESOURCE_MEM,
-	},
-	{
-		.start = 0,
-		.end = 0,
-		.name = "acp_dai_irq",
-		.flags = IORESOURCE_IRQ,
-	},
-};
+static void acp_fill_platform_dev_info(struct platform_device_info *pdevinfo,
+				       struct device *parent,
+				       struct fwnode_handle *fw_node,
+				       char *name, unsigned int id,
+				       const struct resource *res,
+				       unsigned int num_res,
+				       const void *data,
+				       size_t size_data)
+{
+	pdevinfo->name = name;
+	pdevinfo->id = id;
+	pdevinfo->parent = parent;
+	pdevinfo->num_res = num_res;
+	pdevinfo->res = res;
+	pdevinfo->data = data;
+	pdevinfo->size_data = size_data;
+	pdevinfo->fwnode = fw_node;
+}
 
-static int create_acp_platform_devs(struct pci_dev *pci, struct acp_chip_info *chip)
+static int create_acp_platform_devs(struct pci_dev *pci, struct acp_chip_info *chip, u32 addr)
 {
+	struct platform_device_info pdevinfo;
+	struct device *parent;
 	int ret;
 
+	parent = &pci->dev;
+
+	if (chip->is_i2s_config || chip->is_pdm_dev) {
+		chip->res = devm_kzalloc(&pci->dev, sizeof(struct resource), GFP_KERNEL);
+		if (!chip->res) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		chip->res->flags = IORESOURCE_MEM;
+		chip->res->start = addr;
+		chip->res->end = addr + (ACP3x_REG_END - ACP3x_REG_START);
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+	}
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	acp_fill_platform_dev_info(&pdevinfo, parent, NULL, chip->name,
+				   0, chip->res, 1, chip, sizeof(*chip));
+
+	chip->acp_plat_dev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(chip->acp_plat_dev)) {
+		dev_err(&pci->dev,
+			"cannot register %s device\n", pdevinfo.name);
+		ret = PTR_ERR(chip->acp_plat_dev);
+		goto err;
+	}
 	if (chip->is_pdm_dev && chip->is_pdm_config) {
 		chip->dmic_codec_dev = platform_device_register_data(&pci->dev,
 								     "dmic-codec",
@@ -55,22 +84,21 @@ static int create_acp_platform_devs(struct pci_dev *pci, struct acp_chip_info *c
 		if (IS_ERR(chip->dmic_codec_dev)) {
 			dev_err(&pci->dev, "failed to create DMIC device\n");
 			ret = PTR_ERR(chip->dmic_codec_dev);
-			goto err;
+			goto unregister_acp_plat_dev;
 		}
 	}
 	return 0;
+unregister_acp_plat_dev:
+	platform_device_unregister(chip->acp_plat_dev);
 err:
 	return ret;
 }
 
 static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
-	struct platform_device_info pdevinfo;
 	struct device *dev = &pci->dev;
-	const struct resource *res_acp;
 	struct acp_chip_info *chip;
-	struct resource *res;
-	unsigned int flag, addr, num_res, i;
+	unsigned int flag, addr;
 	int ret;
 
 	flag = snd_amd_acp_find_config(pci);
@@ -94,8 +122,6 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 
 	pci_set_master(pci);
 
-	res_acp = acp_res;
-	num_res = ARRAY_SIZE(acp_res);
 	chip->acp_rev = pci->revision;
 	switch (pci->revision) {
 	case 0x01:
@@ -129,6 +155,8 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		goto release_regions;
 	}
 
+	chip->addr = addr;
+
 	chip->acp_hw_ops_init(chip);
 	ret = acp_hw_init(chip);
 	if (ret)
@@ -138,48 +166,16 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (!chip->is_pdm_dev && !chip->is_i2s_config)
 		goto skip_pdev_creation;
 
-	ret = create_acp_platform_devs(pci, chip);
+	ret = create_acp_platform_devs(pci, chip, addr);
 	if (ret < 0) {
 		dev_err(&pci->dev, "ACP platform devices creation failed\n");
 		goto de_init;
 	}
 
-	res = devm_kcalloc(&pci->dev, num_res, sizeof(struct resource), GFP_KERNEL);
-	if (!res) {
-		ret = -ENOMEM;
-		goto de_init;
-	}
-
-	for (i = 0; i < num_res; i++, res_acp++) {
-		res[i].name = res_acp->name;
-		res[i].flags = res_acp->flags;
-		res[i].start = addr + res_acp->start;
-		res[i].end = addr + res_acp->end;
-		if (res_acp->flags == IORESOURCE_IRQ) {
-			res[i].start = pci->irq;
-			res[i].end = res[i].start;
-		}
-	}
-
-	memset(&pdevinfo, 0, sizeof(pdevinfo));
-
-	pdevinfo.name = chip->name;
-	pdevinfo.id = 0;
-	pdevinfo.parent = &pci->dev;
-	pdevinfo.num_res = num_res;
-	pdevinfo.res = &res[0];
-	pdevinfo.data = chip;
-	pdevinfo.size_data = sizeof(*chip);
-
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev)) {
-		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
-		ret = PTR_ERR(pdev);
-		goto de_init;
-	}
+	chip->chip_pdev = chip->acp_plat_dev;
+	chip->dev = &chip->acp_plat_dev->dev;
 
 skip_pdev_creation:
-	chip->chip_pdev = pdev;
 	dev_set_drvdata(&pci->dev, chip);
 	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
 	pm_runtime_use_autosuspend(&pci->dev);
@@ -244,8 +240,9 @@ static void acp_pci_remove(struct pci_dev *pci)
 	pm_runtime_get_noresume(&pci->dev);
 	if (chip->dmic_codec_dev)
 		platform_device_unregister(chip->dmic_codec_dev);
-	if (pdev)
-		platform_device_unregister(pdev);
+	if (chip->acp_plat_dev)
+		platform_device_unregister(chip->acp_plat_dev);
+
 	ret = acp_hw_deinit(chip);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index d2b81a22638c..f08c4dfe6b2f 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -140,12 +140,16 @@
 
 struct acp_chip_info {
 	char *name;		/* Platform name */
+	struct resource *res;
+	struct device *dev;
 	unsigned int acp_rev;	/* ACP Revision id */
 	void __iomem *base;	/* ACP memory PCI base */
 	struct snd_acp_hw_ops *acp_hw_ops;
 	int (*acp_hw_ops_init)(struct acp_chip_info *chip);
 	struct platform_device *chip_pdev;
 	struct platform_device *dmic_codec_dev;
+	struct platform_device *acp_plat_dev;
+	u32 addr;
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
 	bool is_pdm_config;	/* flag set to true when PDM configuration is selected from BIOS */
-- 
2.39.2

