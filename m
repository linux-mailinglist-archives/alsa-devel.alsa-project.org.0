Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DFF94C437
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:21:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEB884D;
	Thu,  8 Aug 2024 20:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEB884D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723141319;
	bh=mTm3MAKgh+w308d/h61q/miRKwKQ6+/Z5FzsQKtxiJU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rIp9x1ECPGNuDSwYKL6/h/oOp4f6XEWWHWyLkFJkb/YPBFdj3hxHv+k92WQQbt8H+
	 9bcmZURDDY7yBvNmPzSrrhif1Kp8ir9urCMT2TUCHjRty1yFc2d0P/MI5zsIMCbXp9
	 RDrYRr6RlkXoQhiLtEdrLm8eZXVyrentvslHgvb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DF06F80616; Thu,  8 Aug 2024 20:21:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37385F80617;
	Thu,  8 Aug 2024 20:21:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DD9EF8047C; Thu,  8 Aug 2024 18:58:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7090FF800B0;
	Thu,  8 Aug 2024 18:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7090FF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aQxuDfSn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngx7bmzxc0vrjUbneOQscD8eTGVbF9h21D2CPpzMK2mtme09sxS2phar2IDGgz8Xjqwg7xS/W3udEwSY14w0CuFvUgb1M+3/k5f8Lw4j4R7Tv8oVEDtEDos/TVvhb7NKLuJE93UkXYBFQzy6kn4DoOXh6S6zs5YTqyrEHODPzv4RVwYyuIDQ8q77ljAqITU9TPh9vI19TmhENuGuaaAYC+1zrO8DeYfSbnFJ7qstTNsOyRtYy/sS8y5SfutlJB3+LfdglPstrypuYp9RSm7BZw4LJfToW4JsY1Im1DUDnKXw8rmBFjO0CB9QzEiZcvNtYoDYT84bwwiClLtE3cRgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcmZuvb5AQbGbL7i/i+v7liw89Xk0n11G1csEO6y+kk=;
 b=xAH9ttzd0zdLL0GISLywrF/TjtXfII3i5UW0E96k+FGFjIE4bnLmyM7+293exggmbrxKW2ZgNuxrh8KWJdrEyCxqZtFkQHE3+F3sx63/G2r/v16s5vMEMg07doio5hr7VCVH+5iLkUFolMq/RaQpKbp8aU+14X3XpqWgnhzEkAMIBiRDKq3rcMvl9IswwEXSw3ePvfPOLO/GcIb9QL06iOEcBUmP20FaTE173LE95twbnw/OzPwz7aytiVeWj23xw/8tMsQGxvDZ6m5szD8nN9J7c/NnsiXgrs8quDhTzMg7cyj/mh/S3lXz9pMEcrp83lifYwt28VALgjw+0PVTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcmZuvb5AQbGbL7i/i+v7liw89Xk0n11G1csEO6y+kk=;
 b=aQxuDfSnDLA8R8Skya95TglH2JI7VCz3QRXXKp9GGaFaiFr2s8UdkwsB5Ignv33RJDUIsAKAcRDUoj7OogBGw/5uGPDQyF02lxDRpdv31f9p/YRvzqNkLi1zNPtyDxWu9O5DLCFdVyrpbdlaRvHV29xKCLLwRZ8pP0POZvXeKHI=
Received: from CH0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:610:e7::12)
 by DM4PR12MB7646.namprd12.prod.outlook.com (2603:10b6:8:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Thu, 8 Aug
 2024 16:58:38 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::e0) by CH0PR03CA0217.outlook.office365.com
 (2603:10b6:610:e7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30 via Frontend
 Transport; Thu, 8 Aug 2024 16:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 16:58:38 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:58:32 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<pierre-louis.bossart@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<lgirdwood@gmail.com>, <kai.vehmanen@linux.intel.com>,
	<daniel.baluta@nxp.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<cristian.ciocaltea@collabora.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND 5/8] ASoC: SOF: amd: update conditional check for cache
 register update
Date: Thu, 8 Aug 2024 22:27:50 +0530
Message-ID: <20240808165753.3414464-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
References: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DM4PR12MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd32f19-0fff-4401-fd21-08dcb7cb594f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RNqv/x7X0sgj2RZEQarXK3q/Pi7q1vKrwH308yMZwwHKqAIER26wOZWAnctB?=
 =?us-ascii?Q?sKMfx4VLgaPfXbHyiRUs3pmGrEOAiNlywbZLJeBo4EWLys//gPgkwZPCmz4b?=
 =?us-ascii?Q?2/BbRByFDWgaTVdeir2mrpFzhkfw1hufjoA9MTdG53P49vsCQmTzfYSGBhtt?=
 =?us-ascii?Q?7eHiRomwBn78I04dhOxL89vxAfUs5eikJYIdKYwCyrm+sC7cEwGRejMI/Go5?=
 =?us-ascii?Q?kbIqBjkisBS/DpXI8qzj7ZWdDbfXbYHOELa4tYVoYt0hjUuwDh92wHR+PkbA?=
 =?us-ascii?Q?wOmiM5BG4dpK2whLltfboq/XsgoIBOMYLFjbkavobC1s/fyunEUxsj3nwHF5?=
 =?us-ascii?Q?BRf32GICSU4YhDDAWsp6F8zlo43uFc5hEgP6/hn2avMS8YfOwJhvyxD/d8jk?=
 =?us-ascii?Q?cGhHGdONgHZpMtVXBtNIrxsbM4rMU/GETTMLrPRGAvKsRkjLopMeEtNCY1Zr?=
 =?us-ascii?Q?Gs5lXIWcIUaYzitl5znxrU6FIBo2yzoW1N/sxsl/E6I46eheHnFW6EC2jXdz?=
 =?us-ascii?Q?G9gYlzV4XJue88fUMmq5Zt9irZj3uaJ9Zy8/MU1Yq6hURbrqJ7eEKceahRdQ?=
 =?us-ascii?Q?sZhQ86aQ+Es14oLD7CQDf4oWlGlutNK58RqJAjJgTuvydNlRHWjtS2DzHNlW?=
 =?us-ascii?Q?XBeBzCIzqU5mpUrm2h3Ix7KE5OkJC0M8/Ut5pe/xjGJMUBzmnGy/X3RVqCyK?=
 =?us-ascii?Q?tkuk3cA5BtDZohCE56ORrXceB+5hlRds3po8H9lC/USDbzCYCwySGQKVkQ7n?=
 =?us-ascii?Q?LzV/5L/suqFbVv1qsQACzxOWoai1zR0JdETsSP1GuNR/DHETIq4tEROkz7Sp?=
 =?us-ascii?Q?jBAJPAtWUumEKCCZ6P4HBfMhN3CoK57q1dFZT7DCvkOP8Kw0xNDK+9jOzv97?=
 =?us-ascii?Q?KtRRBdcz53wFf4ttpfyA+wOpvQXGgHwWskzm7KT7O61PkoisgJR0Z8tatFi7?=
 =?us-ascii?Q?giYGVr+Zy4Viuozhm8CBvY9oKjlvbBN8uXyefow2YU6A8YpAPQ0AtyAeSoFL?=
 =?us-ascii?Q?e+UqJXOoFBPqqNaXr7cpsqaAugypsddb9ngzV1ZTIjqqFlIz7pc3B1l31/89?=
 =?us-ascii?Q?dnSn1qXw/TtcDjoPvPx89F3R5dhSqOUT9oHROU7UjFrCwnl7aXzezqrIPgG1?=
 =?us-ascii?Q?NOfWCY4K6tdMZI9pGff3vodWtFwzQMxYmsWSGwLUglxZFmKuB6uBqy9ieY3l?=
 =?us-ascii?Q?e+LCzGqRKUrCVh9nOY7ySJxb7GACJ5CX2WSbpHYEwc7I0VUbYyCNla8t6wL7?=
 =?us-ascii?Q?Q2pJORtC3taDCUktvbUvizbnRRAgi6g4Xe7ulFwmBG+ErTARzMC3xnRbf3B9?=
 =?us-ascii?Q?nhV49L+qtXoGQtDWiJjJe1rU+UFYcIwHhF8PcaJ/hhyDtiecgkK5rkdZE0Gl?=
 =?us-ascii?Q?zBNEnK/gJ4zBKFWRD29eymf1JhioFg1vc24Oh/jwX9Pws94i4N/8Crfuf+Bc?=
 =?us-ascii?Q?aZr0zEFwfxe+oiQh6V/LY6ETVpmgPi05?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:58:38.3488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8bd32f19-0fff-4401-fd21-08dcb7cb594f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7646
Message-ID-Hash: QPFJZJEM6P4A6MQVJ3GLN3HU4LYILPT7
X-Message-ID-Hash: QPFJZJEM6P4A6MQVJ3GLN3HU4LYILPT7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPFJZJEM6P4A6MQVJ3GLN3HU4LYILPT7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of desc->rev, use acp pci revision id(pci_rev) for cache register
conditional check.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index 2d5e58846499..19f10dd77e4b 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -219,7 +219,7 @@ int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 			dev_err(sdev->dev, "acp dma transfer status: %d\n", ret);
 	}
 
-	if (desc->rev > 3) {
+	if (adata->pci_rev > ACP_RN_PCI_ID) {
 		/* Cache Window enable */
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DSP0_CACHE_OFFSET0, desc->sram_pte_offset);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DSP0_CACHE_SIZE0, SRAM1_SIZE | BIT(31));
-- 
2.34.1

