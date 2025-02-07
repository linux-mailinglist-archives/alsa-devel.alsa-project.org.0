Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDDA2BB72
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D970B60224;
	Fri,  7 Feb 2025 07:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D970B60224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909930;
	bh=rY4A/84orgBjBkrqR8C6sz2WtwUPdbPpTnQ9iB6zZks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jdwQAIKF01kL+8CVfwZPDFM0xU8a9evKf1O1ZTmll53wy5zmJJu1rvu5hL2PmQEVl
	 QEoshE3eQ2CECSc6vi18sfN7Qgfv6kG6ctsbubT06k2tXWia+N/I7ZMgd4MaG65gvv
	 IeiybGr6CpdBiMV9MFl0cL4nodJDV/jf5CXmijAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D26D7F80730; Fri,  7 Feb 2025 07:29:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D97DF8071C;
	Fri,  7 Feb 2025 07:29:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30255F806B4; Fri,  7 Feb 2025 07:29:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A30E3F806A6
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A30E3F806A6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FUdImphQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyyepGFimPWObSKn2R5TQfVcCX9Dak2lTIMlST7CeBp1E9h3t0t3CnYx7mEiiTtWxekM8XsV+Tetn1k2wUK0PH5x2YDYOCdSOJRL7UjISVyfXd61THoGsy7RavlZQtqIfJxGGfpyG7KoEomY27QOYGngHAUHYlPWdJBG1QuXn0VOvd4gsC25+oxI8GPMFf6DaQOfrL6u8bhyxetWBtBS1qCewgb1UnHI/k5LlK1imhI7pRcvsDNjYaPg5MCgAsd7kWbVsA/MBxWZG5gs4WHBWZjRFRmAbEBEDBQSXwS9OKuVlzQO/UyFMGfNvR/j57LJT3pvMnXhba82G9fA/8K/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoREM7Lw+Quo47aw0Ekp4pGJWW3N2hlbQ+19QYT7KtY=;
 b=hqdf+qVTZ4j8vnbPp+CFRtIq7QHm4F84sefMBmIP9zS1AFH/RrFVB0h/k0r7iz7OEm701SLxbob5haaEwO/yhP+mP8XDmTa3/qZMeV0NLeBxVr3T3UrtItZWGP8bovqhol/gnr9CliICjN1c40vU3GRRUrRHa2yBYrdN/wk+6lFYDXIVKhm+1YbDdqAeuvFwKQC8Z/390IonDaUEPc24IrxhizOLPEQ3XS+XRhRybWhgZ7PkCFJ4nCdgG01v/I0v/YrnNPGCKtYFfGL31fMTpRl8iINqe1vWRpn0XcHTh0603/1AymprvpWnGnWOsVvEqQW01uWSc+5EDRjWLjE3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoREM7Lw+Quo47aw0Ekp4pGJWW3N2hlbQ+19QYT7KtY=;
 b=FUdImphQCb+F/CAVkD61wvwHawNpkFpdgah8zgajnTbgXVI9JqyTGsW95XLNTHu6fXGEjSJ+n4sWIAA+Z4WfO0C+n1RTFlkthhc9Qh1I9qCvdtUloLq6QlmJ3BzTXlk7wdXVOTY9FbM0eMhVzuu+shLuTVCojOyw2czJT7JVHPs=
Received: from BYAPR06CA0058.namprd06.prod.outlook.com (2603:10b6:a03:14b::35)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:29:17 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:14b:cafe::8c) by BYAPR06CA0058.outlook.office365.com
 (2603:10b6:a03:14b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:29:16 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:10 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 10/25] ASoC: amd: ps: refactor soundwire dma interrupts
 enable/disable sequence
Date: Fri, 7 Feb 2025 11:58:04 +0530
Message-ID: <20250207062819.1527184-11-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: d553cb14-63b4-4cba-d36b-08dd4740bf47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hFvtd0Vex2i1J6cnGwGoRuUW5sO7uYFuxl2OKDzNRxnuPxSSrTW4W76MHLQO?=
 =?us-ascii?Q?yC6Ig0RaaMDBwz4TDnZC4lz/JRR07+LCcj0+rnFjdJY8SRzah/70bS7swYCP?=
 =?us-ascii?Q?Mnxa5aICd2Bm1zFKKzCEzE5B8WzZkU7BjIg8aFxPh+ottH8ExqL3Tp1qKB0t?=
 =?us-ascii?Q?x0lFx1zoC8yix8MaK5iS5fjEMg+BVGLAHqiaYjOWygJQRk7y+fKhZnurV4db?=
 =?us-ascii?Q?LgK4ItB093y93WJY0ro6U24XSWXEzxNhxYq1E8n3C+WirYEbUd0seuXb+DSW?=
 =?us-ascii?Q?80mRQPjxEQR0ASZ3tZ6t2z7pnJr4lSjreHvI2ZR0Zod6GcugB9mCHuxx5qi4?=
 =?us-ascii?Q?3PFFHGZYTB3z9DNkxPFfyUBFfk4gX/esELhqsiRpc/k59As98tdewSuxGmPF?=
 =?us-ascii?Q?Jp5FJLrxCVHOsd/8XytkEk5si1pRtY80GWu9pnwAlb7S0b3C5sT+C3mCyXgU?=
 =?us-ascii?Q?L3ia/dEsi6HaSfno4EToJ5ruXZcIlTQXHOB5tnHz1o6g9UWCcESDT8s1yz6N?=
 =?us-ascii?Q?WSziWEWnVqGHJAjCtdMYMOXEdjzXuZiP5EaDQKeL/H2TENyLlQC2sAldQ0FA?=
 =?us-ascii?Q?BEdZT8Ke0tDaa6+GZG2h6hJ+MWaPuiAshjOu6Bz+OEwK0EDU+PC8ozvKfw22?=
 =?us-ascii?Q?FfEZsfwR/3IByFUaEUPgvhZ67QK63iB2zZV1xhe1WW4C/lnjHfjnL8KPSz3l?=
 =?us-ascii?Q?ARbxfNqjvGQAGwHgbnb+jy/P5tNE7TeLIKxGlbrQAOjmlfySReL4Sluh3qp2?=
 =?us-ascii?Q?9Rda+bd3ViU2sS6R0IOWdXMX7xE81ScNOs0JlolslR2toxjLLYBXruo9NwTw?=
 =?us-ascii?Q?FTi6DOWdrXpIqpVvYew5ZYq8Ur0TvJWwAV0K5I5gGhCwobr19Gnlb5VFb3+7?=
 =?us-ascii?Q?akhHQZ7SHs+hgIaiOpXiRCz3BMq5vMnEUBdUDs5bZTqdkvz08zpQmyeQ0wbw?=
 =?us-ascii?Q?12iDdDCKbjKH5b9ueFtC1hkjYeCKE+iZH8wlE7I2aQFdOwvmTQbV/o4n9Gu8?=
 =?us-ascii?Q?yKSUJcvCXoJuJHzhQu5q2LS6bIpAIX2bSCQAakBzcDy2zmLVuJZnzSf19RBx?=
 =?us-ascii?Q?CZei98FnwdtPcYJORo5Ec6wUwR4BV88BIs1ueQzkeHeaq0nrcrWitvdl+pqn?=
 =?us-ascii?Q?se+nArcmBLOSuuqrLh3DeuQraJySbjIlxuv2utzcJaEM132mpQ9Ry/L5cs/B?=
 =?us-ascii?Q?pQtpjZpq8VxM+P5UUANXZBl+m1S8UM8OLJ6zuOpzf+OgvN5Kd8njUNctfUgP?=
 =?us-ascii?Q?FE68PLXC3jHnHrXqWGlQx8xRmet+PkMcIfrkwxT8CqZGku1vsCmTGUf6XZRy?=
 =?us-ascii?Q?Pljrlz6zIn/MONOlmnP+xgAAE+rBvFAQfy0lcEtS3QAGV8IkzAhkDBC59ZJJ?=
 =?us-ascii?Q?TACauqADd6SgDbDzJiRqwX+5tmmziBoidZYrAoNvSXAQK0f1eOpWiGyZlNvq?=
 =?us-ascii?Q?WzBZXrYYD9rdUDCVedkIUQyZ+F3kyWknJKEXwjM6QttIEh3vECI1g5CJi3Oi?=
 =?us-ascii?Q?NMRqCFkGskogXtg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:16.7549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d553cb14-63b4-4cba-d36b-08dd4740bf47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
Message-ID-Hash: IH3KWZLHQA2WL7VFVFQXVIPA76NZ32PP
X-Message-ID-Hash: IH3KWZLHQA2WL7VFVFQXVIPA76NZ32PP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IH3KWZLHQA2WL7VFVFQXVIPA76NZ32PP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor SoundWire dma interrupts enable/disable sequence by passing
interrupt mask values as an arguments. This will allow to use same function
for enabling/disabling SoundWire dma interrupts for different platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index d10950e1cf73..674203a20338 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -114,11 +114,10 @@ static const struct snd_pcm_hardware acp63_sdw_hardware_capture = {
 	.periods_max = SDW_CAPTURE_MAX_NUM_PERIODS,
 };
 
-static void acp63_enable_disable_sdw_dma_interrupts(void __iomem *acp_base, bool enable)
+static void acp63_enable_disable_sdw_dma_interrupts(void __iomem *acp_base, u32 irq_mask,
+						    u32 irq_mask1, bool enable)
 {
 	u32 ext_intr_cntl, ext_intr_cntl1;
-	u32 irq_mask = ACP63_SDW_DMA_IRQ_MASK;
-	u32 irq_mask1 = ACP63_P1_SDW_DMA_IRQ_MASK;
 
 	if (enable) {
 		ext_intr_cntl = readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
@@ -533,9 +532,11 @@ static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_runtime *runtime;
 	u32 period_bytes, buf_size, water_mark_size_reg;
-	u32 stream_count;
+	u32 stream_count, irq_mask, irq_mask1;
 	int index, instance, ret;
 
+	irq_mask = ACP63_SDW_DMA_IRQ_MASK;
+	irq_mask1 = ACP63_P1_SDW_DMA_IRQ_MASK;
 	for (instance = 0; instance < AMD_SDW_MAX_MANAGERS; instance++) {
 		if (instance == ACP_SDW0)
 			stream_count = ACP63_SDW0_DMA_MAX_STREAMS;
@@ -566,7 +567,7 @@ static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
 			}
 		}
 	}
-	acp63_enable_disable_sdw_dma_interrupts(sdw_data->acp_base, true);
+	acp63_enable_disable_sdw_dma_interrupts(sdw_data->acp_base, irq_mask, irq_mask1, true);
 	return 0;
 }
 
-- 
2.34.1

