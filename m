Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB1A16A61
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:08:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 179796028D;
	Mon, 20 Jan 2025 11:07:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 179796028D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367688;
	bh=DYGEVkSN9u7dm04G37kUeh4tY9MArp1JjCXoRDfJ0fE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CUIk4SJTGTxiCdd5J1EkyXbsMK4R/kmeaXOASP1u5Y5KL9wWhoAFSOZZAMb9TKeNs
	 zFgxotEun5VFWc28Vwf2g8XoYO7QWkbgYi3mLWWKD9YOejibEHQ3x4YJZlv9yzk8XM
	 Hz0ragRdJIwLuu48DVObZrgLbiWWSyXY9B+974cM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4829BF8064C; Mon, 20 Jan 2025 11:06:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAEE0F80649;
	Mon, 20 Jan 2025 11:06:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C19F805E3; Mon, 20 Jan 2025 11:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD8E2F805BE
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD8E2F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GTIIVN75
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWLQfaZlgcXJhuE3BmskfMyPhNUiV+RlIzkqLIYstYHwujV0BL1efwSMVD/8t2YKfx19X0oagYbAd+KhMnDSijoKDL+xqhGCE7HtYSrWCkcN2a13/ehKjkNPm8UyQ+iwmRU9o9DzMDh080tKNgtnuYqwGOl84S7a88VGO4GrGeqy0Wcu276NmXEZz8O2P8udI0pZWZ5lsDgwOEtZ+kNesfT80D51JbKr0mIB+3xlh43rksRraaER26T59OUWE39HouLLSDFMyF+Steqd8T0WGLkdDPHGFZVkhvWko4YF3kiHkUqQgtccoewog2Itq3Ev5GfedkaH0vgf1ewheSL8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bqs8fEL8CLx238hQgTGPuNC4fH36n7lpumWBynkZZCI=;
 b=fhpyl1XjweLkmAS/y7Z9cUWbmcbEFPbhnukHe1QjMU2uuvW7xs6Bjf96OhnH+pRYVi7bq+BWXcFIj1klmmaxcxsWK+5tcKNxLWz+X+oGx9mU9dFd/aB0x1jCZS6D21MB4LL/OIocrm7rbkh3qWfnBEiIZaq1PYimAxzbiKpq04c+wQSNST8VEEmrDEKi/ei8AeJorg4Ms1vzCRBlqRlJR9kTsFZxHNdyFmCzjtG1S/xVutKQDBK6qlj7zhTfWK3GLiVOLLJu9fH43oEEIjm/mX1refFA1HBX1xMIOvVo8pD4GbYqJ3UG6ljmoXgsVSxLG7jWMPmwvMPwDTSFVIZYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqs8fEL8CLx238hQgTGPuNC4fH36n7lpumWBynkZZCI=;
 b=GTIIVN75lrxVlMxEI6znWQuf+9q+eUCmKliD9iI7y4LoI9umxCul420pfMTljvX399yr3KMaW/KA4olcCKaIe+t2XnEYmdl2o7MveM5CIma76ozqD95BHljv2zA/1CI74SmBO+f1xBrlZWeTfuFpXj3WETVUQCxSPlpV/L0+4oo=
Received: from CH2PR08CA0019.namprd08.prod.outlook.com (2603:10b6:610:5a::29)
 by DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:48 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::56) by CH2PR08CA0019.outlook.office365.com
 (2603:10b6:610:5a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:48 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 18/23] ASoC: amd: acp70: enable soundwire host wake irq
 mask
Date: Mon, 20 Jan 2025 15:31:25 +0530
Message-ID: <20250120100130.3710412-19-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a70f556-ef49-454b-7177-08dd393997f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y+vRNenpPQO4VNwtH2OzSMSiqMptIvoZZjUZh2Yu4e+EovdXDrRLaI8yDqdp?=
 =?us-ascii?Q?vVosd4MbsmwB8satwU3Y5GotttWLlZbDDPT2OTCU6qGMqWwMgE3/wQSIRdVR?=
 =?us-ascii?Q?E+C7pQWlnNgIM4mh7HwohaN9Xl668k7V+iMrj39Ugiau4BDL4O5RLaVcjjLe?=
 =?us-ascii?Q?a+9oUcu0MZi0vlZPv7q2jrRNOouarOIOolS173NKlYhnpgeps9g1h8sdtBpw?=
 =?us-ascii?Q?H6TcOCvbIcaCuL6HWNXgJLv5X/6oAknF+aQlpP3TXycYB6aH2+Vjd8JT4jJs?=
 =?us-ascii?Q?uhvX5FyN8CDeUSuwpvdS75uX6LF/ckvfNda296TflPebTROGrjPHkqfhWlw+?=
 =?us-ascii?Q?SSf9VmG2luzDGH/8MIX1/QLxm/QGrHoHttymmhJSiU54zxFd4BxGnkrl3Afl?=
 =?us-ascii?Q?kxt4iL5/VE7KWMoc3VuMwMjcjFKhO/TAtRcnJszJZahavuXC+2R2VuB3WT0q?=
 =?us-ascii?Q?PCczyNqK7P+KXUHXB1DqPukMjOZc3qa9aUI769uV3hrGmzrB0r42omQd0T3n?=
 =?us-ascii?Q?GziVtfr4gf5+w11aIiuzi34zoS8sqZN6oTz7/Gm26LKvWmNsSl1yfOA/VrqD?=
 =?us-ascii?Q?ZsX2CsJf2AOP2+P3AZgQ99u+AbalRl0UmeW+WOcmPnZ2Qoe6SvK6zjrzsG8K?=
 =?us-ascii?Q?dYjoNRcAAU4687gTndgA4OBADFXL+yF6EaRbOIgok5U87z9PPhoosK3sCEBh?=
 =?us-ascii?Q?KbXNZc/zAwT/2A1ASRhgyOASpCdyMJLnOA6sO3dWYovM/q3HlOrdo9F5I54P?=
 =?us-ascii?Q?bzVY+Ab8dLM2YtJkCWeuNk5zYwpIzpLWafMJMReqnnsm4PaSeAtcNpREOGxk?=
 =?us-ascii?Q?du2VZc1ivqM4p0EtgL55TnNimsyEwICdbz37/2bUgAa2Z390I0mecFkSdTkP?=
 =?us-ascii?Q?GAwubQjObyP6u2dNBAW5lQ0aoZgUaljta3NucPyIZFy1joIeGSVwbY9VYFzu?=
 =?us-ascii?Q?zkvfHtAa9OQIJbGDSVqOfzRt8ImqCzVUAkSPU44uSe/HvTBDCyQQKVu89Uup?=
 =?us-ascii?Q?KchHK3+8eOa/irGyEIVx2kx41KCb+GaDsUIqmCJSuRtoeszkNHwogOGf8Plf?=
 =?us-ascii?Q?ZEBWBWU1SBevAYlZ0WhSBVimFzUxQiPcWOhbANhCEzuD2FAgH9/SD/tEyBpk?=
 =?us-ascii?Q?GCJvtyMV6GAnNmY6Z7x9mjbBqC/9vpo4kiT/dS35SqvyTQziLcm1AXsF1NNW?=
 =?us-ascii?Q?XGRL5UVDLnjeK0R42s8Kc5Y6ksWUFbF6/txIx4mpL9IRm9QaitBoBQLU+agX?=
 =?us-ascii?Q?0ARScAk1Tq++F2IRjMvZdYLoYDfAHnUxSt/kar42jK6BHHA555yGJLE7z/si?=
 =?us-ascii?Q?Gh5F8Os3Px6bhf97Wu1Pg5KnuxW+ezuNDjTtUb4I20gr6zcZr9VZHZs2Bh/m?=
 =?us-ascii?Q?7595JKbT8x5g/X3rduWPndQPSn9Z08YO8azRsSUwqQn/KGwy+uDWRUgEiYi+?=
 =?us-ascii?Q?462LeSnTrMJiuoO+Eh+JnHUO0aPuZd9wVorQ8OjaLhD7wkLa+P6tOysccwTP?=
 =?us-ascii?Q?DZl9wRReTcYmVdk=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:48.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a70f556-ef49-454b-7177-08dd393997f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229
Message-ID-Hash: N2DA3ULWJSRYS52Z6Z5YWQBDIOQO6R7G
X-Message-ID-Hash: N2DA3ULWJSRYS52Z6Z5YWQBDIOQO6R7G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2DA3ULWJSRYS52Z6Z5YWQBDIOQO6R7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When ACP enters D0 state, after executing acp soft reset sequence,
all acp registers will be set to default values.
To handle ACP D0 & SoundWire D3 scenario wake events, Soundwire
host wake interrupt mask should be reprogrammed.

Enable SoundWire host wake irq mask during acp init sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  1 +
 sound/soc/amd/acp70/pci-acp70.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index ab4d6a5c1cd2..232210df6f10 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -139,6 +139,7 @@
 
 /* time in ms for runtime suspend delay */
 #define ACP_SUSPEND_DELAY_MS	2000
+#define ACP_SDW_HOST_WAKE_MASK 0x0C00000
 
 enum acp_config {
 	ACP_CONFIG_0 = 0,
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index ff03fd493e98..79b0ab96217b 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -52,10 +52,25 @@ static int acp70_reset(void __iomem *acp_base)
 	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP_TIMEOUT);
 }
 
+static void acp70_enable_sdw_host_wake_interrupts(void __iomem *acp_base)
+{
+	u32 ext_intr_cntl1;
+
+	ext_intr_cntl1 = readl(acp_base + ACP_EXTERNAL_INTR_CNTL1);
+	ext_intr_cntl1 |= ACP_SDW_HOST_WAKE_MASK;
+	writel(ext_intr_cntl1, acp_base + ACP_EXTERNAL_INTR_CNTL1);
+}
+
 static void acp70_enable_interrupts(void __iomem *acp_base)
 {
+	u32 sdw0_wake_en, sdw1_wake_en;
+
 	writel(1, acp_base + ACP_EXTERNAL_INTR_ENB);
 	writel(ACP_ERROR_IRQ, acp_base + ACP_EXTERNAL_INTR_CNTL);
+	sdw0_wake_en = readl(acp_base + ACP_SW0_WAKE_EN);
+	sdw1_wake_en = readl(acp_base + ACP_SW1_WAKE_EN);
+	if (sdw0_wake_en || sdw1_wake_en)
+		acp70_enable_sdw_host_wake_interrupts(acp_base);
 }
 
 static void acp70_disable_interrupts(void __iomem *acp_base)
-- 
2.34.1

