Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C1A2BB89
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:34:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A65CA6027F;
	Fri,  7 Feb 2025 07:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A65CA6027F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910071;
	bh=gSIprwLO2wUy1bIHR1CagLVdFXpqFZ1T1M7xpLKNyQo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QETd1Aln10r+gT62Hw6wDW4znGwnuvKPeY+EEt1MTUk5tkNBJ23Q6jZZ8oqUucMJ3
	 keJZWiU4qm+70EeKRGZvTmttmAyTijD6T8qDcr9wZ7+nlZ99/Ypl01C9SpB+5ARNn7
	 f8rmFszmmAChX9gznrWn8LJk3z8Kr3aI8V3v+JDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B91DF80CB4; Fri,  7 Feb 2025 07:30:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25D7FF80C90;
	Fri,  7 Feb 2025 07:30:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78678F80C8E; Fri,  7 Feb 2025 07:30:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BA59F8013D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA59F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lW5AYofc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdaKHbKLnyfDalRlAJMHW2qHA790IJo4++Wpva+KB7gWy7vSBVzj6Ia3uKGwxSBhLqAoTfM05orIJxJeorL4Nn/pJqXoWi/+6hPswwmVfCEnG7g3SXbbOYKWxmQZYO57WOBOpfW666GcNTbI1Qrx5Yh43qCCILK6SefMWqG5ovSwRRSa5wQMDsc2cHIHQ7qAPvYXSlxs+Qn7iLMfoDuhhkr2+akVXK6tW9Fnw2XZu23ZsvXKpphjFDJUdiPzGHUdDMcS4RCoWFXs9tiz/QGoIVENkPoO44dgbI+etucYj27074d7PXFs/CnNpxAJ+lqk8nuu04UyUH1mJWdfIbdNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ustehHD68yjWuZ7lmdul4IgTlbsyGXVt42F04adY5c4=;
 b=lMEZEn1DhQ1mIoEymTod1pnq3IpEHV3IphiH2gdACvur8mpfc3lHm0b1N3a/yS7H6HT3c3PbQ3iMiZ/Yj3po/Xob/PBCNDZi5GTCql6l/Ch5eFgCYDxI8g13i3ibAmSiyPiQWuOZcCrG1/7UCLeI1YppZlQjVws/cexcuT091JB9+ZgjufuQvEdLZr4+Gh3i0sB9xhPF6mfkAS/Z6C+hG3yWEqeDw/l2q1Vh6Vfvxi3/ltQBogqiuJji99fmnyggLW/JLPj57ypD5zLGZ7iElMg/kbtdFDZc141PCSEDUmnaJYphiJo7VV6vpSQlHOVL/JQapLczXE9cxKdhYQXlag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ustehHD68yjWuZ7lmdul4IgTlbsyGXVt42F04adY5c4=;
 b=lW5AYofca9E/0nA42pwnVbkNziA8XiMcwG0oFQGXS3WF7znbeQOW4iWaiKTM15aL/lN75OGjxHkm0YYwbG1hPqRqqPkJDO5uaKwD3WquuvxSahaSVMqO5f06nYJT2rhB9+lhGspRk2/U/DgnpKHnx4hWPwmMFEQ8PAGI+ez6pQw=
Received: from BYAPR07CA0078.namprd07.prod.outlook.com (2603:10b6:a03:12b::19)
 by CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:30:15 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::5d) by BYAPR07CA0078.outlook.office365.com
 (2603:10b6:a03:12b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Fri,
 7 Feb 2025 06:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:30:15 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:07 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 17/25] ASoC: amd: ps: add soundwire wake interrupt handling
Date: Fri, 7 Feb 2025 11:58:11 +0530
Message-ID: <20250207062819.1527184-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: c6065308-bada-4d34-ba90-08dd4740e210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ca28OlKRt/13oPAZpb14NQAV9CVMJso7+WKF78kiY59asc3yve0mvD1mS+jm?=
 =?us-ascii?Q?1hDt6SatHgJ1vFkac/SMbJEosSL5QpVZ2mcKOh+UuKuCzN+/DXSFWQRUSR2q?=
 =?us-ascii?Q?vVf+DtYcGPMRUD+7AYf8NfhUXPMJi0+BqEGpavjY5BR+2x+u5grhYBUPQQ57?=
 =?us-ascii?Q?+3KUGSATZls7rrZnFu0FwmBU6g/udnJJ7pAKpsWHOhpfbdf1oszc+6U0UH5g?=
 =?us-ascii?Q?yjsH0NB3WUR3ip3zvoFPosG9NGq6dEROzk4t5JjufDHGdvM9lf+kli4CH+4H?=
 =?us-ascii?Q?Iba7Q6jGbG943P5+Rs1Fws+MIcmiCHkFsesqxULb2jagoxdAuCfBX5zr7YEs?=
 =?us-ascii?Q?GW/1IeBD4CIP/4uHGWF6siCBW1bzfKwnqyptVtXtWHC9SY61uo3nrsnOE7qM?=
 =?us-ascii?Q?OWuO7IiAMpBWEWUjLD5WNq+Oqgh1sOiX8kpYVnfGmTRgEBZzUAi7gTgmYbuo?=
 =?us-ascii?Q?ANrm+FZv9BGIPBitR+6izvvF6midVHumH/ZjAACXFKhLHdNplpPhFoiI6Okm?=
 =?us-ascii?Q?oVj+XNnfiL+VYPWnc1vNFTpgmu1l5701FyibbghydVUfH4Z0temewBugQrVW?=
 =?us-ascii?Q?Au7D9hg202PSMFuGPMY42bJpxDa9qOyKbpnzzgM9A63xLc/gEv75cNj3bHyk?=
 =?us-ascii?Q?B/nYsl6m92KhLgbavUX2Gksj55twixYxm+AeSCKmNKcGA1Gx0Cs+ruUojCQI?=
 =?us-ascii?Q?N9yHIHYtRUnEuuakDNc51scbnRoXE54WRiTMoBi85yKQp4yNu3lNszwXUHOt?=
 =?us-ascii?Q?nEmo8HqAUNu3JFa9SL9I/XgIgJ9kVXELQqbY17gcYg9ZpqK6xNvkaewGKjBO?=
 =?us-ascii?Q?Ztqdrpxw3R04yeQHD4x6T3X0GMyncbyyGBOSa7WzYIUpn+E0WSU2u0DNjOVW?=
 =?us-ascii?Q?E4xk802R6bONT7q3jM/mZuJcZPGA5LyYm1PePlaLANZVBnmu4VdcEtgKU+Z9?=
 =?us-ascii?Q?inUWitxcLpAWdvZnNFtT2vQKi1wWECSEKnb8TNY3CPe85yRFEOnM4SqMqc2X?=
 =?us-ascii?Q?aLv7GxrEdPOpv4yHb+ybyBKWHO9wjW/TGA6612Bw2dVj0afbRRx/3mBRL2Cr?=
 =?us-ascii?Q?SDBWEKWQ82jusa8UbFe8MF6FxAWgx57GePlvgsnyvo2xkdmst6ildiZ0YINY?=
 =?us-ascii?Q?MC1zkHvz1HLImskuq7+6bzq5MLRv69sGfw2cwW+8pIvOMmdqze0+BoXkYa+h?=
 =?us-ascii?Q?RQmWC3CuoRz1wm7LG6tReSMq5UZu9DTLWkJzPn83F/Y12tR7q0sI2h4d84Hk?=
 =?us-ascii?Q?QeftY7msCLKnAsO8M5nhYLlQN5h2z2IVHbzI+PmUzfnsyj8I7jKHM+p2UyYC?=
 =?us-ascii?Q?o3Pb+yEs+PVvqXLeVruoWCVw0zeeBl/shONktEJeS+cjelEkAkROom0X5St0?=
 =?us-ascii?Q?iaAHq4yqw9hGtd8MAKd85xtoNjxIj7SvW6ZdPUWY4SbNMLRBX8SGP8BDCgGE?=
 =?us-ascii?Q?H54eWhQq9bHwwb/xFkbbn5S2tlcYKYll4KolbmMHQ8Zpd1CWG5ZENticRiBk?=
 =?us-ascii?Q?AAI8r8BUqyXCSc4=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:15.1142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6065308-bada-4d34-ba90-08dd4740e210
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188
Message-ID-Hash: XQ6QQSTJF6J37AFDNRMCEO5C6NYK23YY
X-Message-ID-Hash: XQ6QQSTJF6J37AFDNRMCEO5C6NYK23YY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQ6QQSTJF6J37AFDNRMCEO5C6NYK23YY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire wake interrupt handling for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h  |  8 +++++
 sound/soc/amd/ps/pci-ps.c | 62 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 48dac2a044c2..9940151b0675 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -139,6 +139,10 @@
 #define ACP70_PGFSM_STATUS_MASK			0xFF
 #define ACP70_TIMEOUT				2000
 #define ACP70_SDW_HOST_WAKE_MASK	0x0C00000
+#define ACP70_SDW0_HOST_WAKE_STAT	BIT(24)
+#define ACP70_SDW1_HOST_WAKE_STAT	BIT(25)
+#define ACP70_SDW0_PME_STAT		BIT(26)
+#define ACP70_SDW1_PME_STAT		BIT(27)
 
 #define ACP70_SDW0_DMA_MAX_STREAMS	6
 #define ACP70_SDW1_DMA_MAX_STREAMS	ACP70_SDW0_DMA_MAX_STREAMS
@@ -325,6 +329,8 @@ struct acp_hw_ops {
  * @is_pdm_config: flat set to true when PDM configuration is selected from BIOS
  * @is_sdw_config: flag set to true when SDW configuration is selected from BIOS
  * @sdw_en_stat: flag set to true when any one of the SoundWire manager instance is enabled
+ * @acp70_sdw0_wake_event: flag set to true when wake irq asserted for SW0 instance
+ * @acp70_sdw1_wake_event: flag set to true when wake irq asserted for SW1 instance
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev: ACP PCI revision id
@@ -356,6 +362,8 @@ struct acp63_dev_data {
 	bool is_pdm_config;
 	bool is_sdw_config;
 	bool sdw_en_stat;
+	bool acp70_sdw0_wake_event;
+	bool acp70_sdw1_wake_event;
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index a9e140ca1296..6a725cf36345 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -21,6 +21,65 @@
 
 #include "acp63.h"
 
+static void handle_acp70_sdw_wake_event(struct acp63_dev_data *adata)
+{
+	struct amd_sdw_manager *amd_manager;
+
+	if (adata->acp70_sdw0_wake_event) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+		adata->acp70_sdw0_wake_event = 0;
+	}
+
+	if (adata->acp70_sdw1_wake_event) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+		adata->acp70_sdw1_wake_event = 0;
+	}
+}
+
+static short int check_and_handle_acp70_sdw_wake_irq(struct acp63_dev_data *adata)
+{
+	u32 ext_intr_stat1;
+	int irq_flag = 0;
+	bool sdw_wake_irq = false;
+
+	ext_intr_stat1 = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+	if (ext_intr_stat1 & ACP70_SDW0_HOST_WAKE_STAT) {
+		writel(ACP70_SDW0_HOST_WAKE_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->acp70_sdw0_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP70_SDW1_HOST_WAKE_STAT) {
+		writel(ACP70_SDW1_HOST_WAKE_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->acp70_sdw1_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP70_SDW0_PME_STAT) {
+		writel(0, adata->acp63_base + ACP_SW0_WAKE_EN);
+		writel(ACP70_SDW0_PME_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->acp70_sdw0_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP70_SDW1_PME_STAT) {
+		writel(0, adata->acp63_base + ACP_SW1_WAKE_EN);
+		writel(ACP70_SDW1_PME_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->acp70_sdw1_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (sdw_wake_irq) {
+		handle_acp70_sdw_wake_event(adata);
+		irq_flag = 1;
+	}
+	return irq_flag;
+}
+
 static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32 ext_intr_stat,
 					      u32 ext_intr_stat1)
 {
@@ -163,6 +222,9 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 		irq_flag = 1;
 	}
 
+	if (adata->acp_rev >= ACP70_PCI_REV)
+		irq_flag = check_and_handle_acp70_sdw_wake_irq(adata);
+
 	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
 		ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
 		writel(BIT(PDM_DMA_STAT), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
-- 
2.34.1

