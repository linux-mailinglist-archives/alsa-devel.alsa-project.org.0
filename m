Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CE949F16
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D416314DF;
	Wed,  7 Aug 2024 07:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D416314DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008198;
	bh=Yyh6nCD6uVaoGEFI0zqZzXeuR2btH2C6BgofcihcDmI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c+HQaXkcFjCHnVdS6+YSY+VwauK2fu2Nrqc7R6cZt6p1uXqHdNfpC9StL3XJhGN1l
	 3ex4XtpmTcsDxDW4jp7qY6epcevNFzmBE/zwdwqkinqubO+e1SnwlX6YhVs8Uhdcva
	 QMYvQUQhpnhwIDDPXs3wLa7+NOqLklEMwuG3wIAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C11CAF805F8; Wed,  7 Aug 2024 07:22:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74361F805F1;
	Wed,  7 Aug 2024 07:22:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D24AF80448; Wed,  7 Aug 2024 07:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FCE1F8023A;
	Wed,  7 Aug 2024 07:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FCE1F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xCZmnvOH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7LzSit+S0IUjokL9Qd2SoRNqLVfowB1eE6aV2WFCsYTM6UIUaH3V+GrmQ6Y73s3Q5fSW7dfi5VTJ0f5vHMrhgQt8uW0MEDXSnpFQAkgRmJ6OnxvNvh1XIaoCUqeGiRcjT7UsTnEunJtH7dNQQWmNW3Rjdso1Aujyrmt1/javMrJeDYUNxQM7AItXSIwaxOj3B4K0UugHgKOH+xsgNx2KihvQSWrviXzBCi0GJ4wgPTyBbfvmBoa2jKkOrcbNvYh+m7Y7vABlpKLWpZ8lcBO1tESOgNIo85gJBNgCzOLOZ4HUl/EjChQMN4WQ0lj+O0B6dTIrXF9XMuWXJvX3FQ17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+POgkQwJwZYUqG1jCGpOn1i7TKe6P4D3ciPqtPdWC8=;
 b=eLeI7CeGZsCV9h+vYa5+tsYX1lvRBlqvwoLBUGis85iK9Pjc/EsWAmwR11fAFppMedj2g1fX/IUfQSiE4BNZv/VE2yCWQRQjgibFvo+W/WN/TOEdtQa+fQl0BFgNCzPTxjawTrolGGs7fq2NWE8RPQvyNEnNkpXKyDyK0rhW4cddObN6fKSlZroMaqZjfv0jMI1MUmgQQeBQNtEiMi/Lv9dU3ZE7U4Ixr6qsJ3ysomiVgsyqIMKCNsa3QhVfKuvOy1D39zRjyw3WdtPL44fhKSPia4eEJ6yiyqDqB3vo1YRKE9Cwcw+99betJWQXGl1IPR4G94MhLkCiCISoVaAQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+POgkQwJwZYUqG1jCGpOn1i7TKe6P4D3ciPqtPdWC8=;
 b=xCZmnvOH1yHtpp5osck2Xq1UbSua8ygQ5aKpsTrqlGKho7+G03ysq/6+c4NSkeWQf7rBo/Uz4KOh9iI4dOu0zkEQ8Xj5Gnh0vdkhOQtH7c8FSy/PgB06UwSN5TF74vzeNLj6oK3H4NoqwfsHBGvD8P8okUrEJqeVR6+gancBkrU=
Received: from SJ0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:33a::15)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 05:15:08 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::40) by SJ0PR03CA0010.outlook.office365.com
 (2603:10b6:a03:33a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28 via Frontend
 Transport; Wed, 7 Aug 2024 05:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:15:07 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:14:59 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Emil Velikov
	<emil.velikov@collabora.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE
 (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/8] ASoC: SOF: amd: modify psp send command conditional
 checks
Date: Wed, 7 Aug 2024 10:43:18 +0530
Message-ID: <20240807051341.1616925-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 8111f9eb-48d8-434d-46ee-08dcb69fe732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CR6uIB+FkIlT3Pyt2spUTXfvLKQyFFQG77kJ6OMwnAYPnbOLHWP5UHNX8+KA?=
 =?us-ascii?Q?otvGyOhCQ60HskalBPJP6tKjx4412IbLUhVT38jqw88F21lW3RS4HPzFwh2j?=
 =?us-ascii?Q?bdLjIzDuQXlFFM/QXle1DEcFvORkemKN9iKTSKUrXPBf+XbonVgla1YxxEGs?=
 =?us-ascii?Q?L5BQAxqWYpFNqJq/QznE8CYWONIl2aV70L/879EbGa/NZfV48YJV2j4Csygx?=
 =?us-ascii?Q?32uzBFBHG0fJ4iOKcDSwtYngBVQq7sjnvvADzW3TmxzvrUxb8DW76THeRHKh?=
 =?us-ascii?Q?kOkpRwd4fvPjQSUVClD+sV6bKCsP4WtsvZ9nop9JYJeWoSXPu4C8OWOH7ymX?=
 =?us-ascii?Q?g9WxgS5AuiuJzzbS7Yrq/j8sbrY0eGuNSItiJ9efreUal0F2cjj0+QEvOhNN?=
 =?us-ascii?Q?wexTVRK7CG1bDzbqgOTzShCA9v5F4GfJ7RGHrmPE43DaNjdAXF7NsNQRp81r?=
 =?us-ascii?Q?jPH1u2SQ2cKKVH4kyiN7m3f4zkCUmemO+//yi6YkZzsOSI0S3mYkv8BCkZxj?=
 =?us-ascii?Q?UKkpIah4QTfgW793xIhv7tuYbaliGXW00WNCwwLQNovKa2vSCzHnzMxz3W5L?=
 =?us-ascii?Q?aKmmYYX81xEalkNbClOMW5ZCISPwvqV5pm4b57rxVlcdks7M6saOANEPCc1y?=
 =?us-ascii?Q?iFToF0nnk2VDIkhS+94INEf9V4j/KR1FcaK3BSHlfMnRgJUTOVd7NxDUfKGo?=
 =?us-ascii?Q?EksvanVAN6WAvh6AJO2tIKAX58R7TlrD2h7XhR8NCyKRnSHp3t+LFQeMWeML?=
 =?us-ascii?Q?hTG8ZSYKOtsprPcOy3m5wIvbbrdYKISW2nHMXs2OOs+R3zZNL+sv4A2QrmD3?=
 =?us-ascii?Q?fCh+KPd5F54968VBYYlknK55d/5R13YETkivtSrbgmjzsey+hFvqP+kBSFht?=
 =?us-ascii?Q?dlhA13E3Qy3hszPxapxxCPyW2tOdx/KFXH/W+DYw90kg+j+p5ghf4gootHBl?=
 =?us-ascii?Q?0e9vGzvLZN7l/WkBlUA+vU1TUqqmeYDmS0ANidrZC8S+AzgPorDhYBSejg/0?=
 =?us-ascii?Q?C/YpLeH8glNvnRZ6npgUCeKQLU19jCx0XWXimI3Lqa4rqwnuao96XZ3bEXx8?=
 =?us-ascii?Q?iu9ZGIcsrxudIr2+QE4Q8pc0jn5c1Uxcjlf9Roz2iJjTYxMf+4QBeuwCu0CO?=
 =?us-ascii?Q?1/pRpDBoUUYoNmJM6H+Y8xKHJsNsSl3CZqTla8wHnrHkmHtalBYW5X7kr/+o?=
 =?us-ascii?Q?+hvcfZx1b6uKsmSINDhrHJGCwr0Rl4QD2b1CxTQFoH6aRxvSyjQ6zbIawDLS?=
 =?us-ascii?Q?uuR5PEOToRJ7ysWqfC9vlajkozozi9niEXdcgcg+KbghOPuypO+YNAtxU5vr?=
 =?us-ascii?Q?up3qCbvLrN4aN2lIF8xlj6BQRfbU77Gyllb+apdJguHDnieWWVWc2ng5vnK3?=
 =?us-ascii?Q?gzZlI0y6Gj4qKNSyRUlNUc8PJcV5qoylIfyHGtPJzbzTLcgiUzZD2+bnwJ9u?=
 =?us-ascii?Q?+20O9xbDWb6bo+cuCai7QLtmzFTYiA0z?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:15:07.3248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8111f9eb-48d8-434d-46ee-08dcb69fe732
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
Message-ID-Hash: 5SFO2XQFAAUPH6IV5L6HJ2SMRAWNUJ53
X-Message-ID-Hash: 5SFO2XQFAAUPH6IV5L6HJ2SMRAWNUJ53
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SFO2XQFAAUPH6IV5L6HJ2SMRAWNUJ53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modify psp send command conditional checks for Renoir and Vangogh
platforms by replacing desc->rev with acp pci revision id for that
platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index a9f32983b3af..a85f5eb54239 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -236,7 +236,6 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 			      unsigned int image_length)
 {
 	struct snd_sof_dev *sdev = adata->dev;
-	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int tx_count, fw_qualifier, val;
 	int ret;
 
@@ -265,8 +264,9 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_DESTINATION_ADDR, dest_addr);
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_MSG_LENGTH, image_length);
 
-	/* psp_send_cmd only required for vangogh platform (rev - 5) */
-	if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
+	/* psp_send_cmd only required for vangogh platform */
+	if (adata->pci_rev == ACP_VANGOGH_PCI_ID &&
+	    !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
 		/* Modify IRAM and DRAM size */
 		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
 		if (ret)
@@ -285,8 +285,8 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 		return ret;
 	}
 
-	/* psp_send_cmd only required for renoir platform (rev - 3) */
-	if (desc->rev == 3) {
+	/* psp_send_cmd only required for renoir platform*/
+	if (adata->pci_rev == ACP_RN_PCI_ID) {
 		ret = psp_send_cmd(adata, MBOX_ACP_SHA_DMA_COMMAND);
 		if (ret)
 			return ret;
-- 
2.34.1

