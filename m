Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B062A5A307
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:35:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F4A60752;
	Mon, 10 Mar 2025 19:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F4A60752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631699;
	bh=z5QuQ6gQVzbrh5qA1hEAnbs6+7uxG4P1vh76Qk8YUJI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E1W5NREdwgIegYqUunJpmfpGScJbq3Xtw3DukEGip2IWjrbjD538JddSWryiT7C2c
	 cvnrW55B5PF5O3b4KwB+mzDYa+94vNIISik4rADZFisCu+a8BZM9wy1vKJXwaOEg1r
	 78c+ahT1PZylKdvcdROYvaTLySGyw40VNcMLEhcQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24739F805CA; Mon, 10 Mar 2025 19:33:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E98F80691;
	Mon, 10 Mar 2025 19:33:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DA34F805CB; Mon, 10 Mar 2025 19:33:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 385D9F805C7
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:33:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 385D9F805C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Kjo+TXPQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udY/OsaRBm4Z7TQsvmUORYcpQPVcRtbQKzbzAjybdKRgv+XM320gbYl28fg6gLAAuZydmWGSrpBSaFcT5bWvSYtKU5AEzrrr4nenaXwJXsIkl1R53ttgV2UZTDaAZN84H51RVGLVS7CnkF8JY5dCHHFiE0gukYrKIeEg3voiIpuTx8DfhJa8aYsP8eQyDoSs/8rHDPqHIowEVjhzn6XItpCgBRcwM6ggW1c8mPAu43HflwihY5wNnnRk7ojUX/MywHU2lTkR59cs2RvI7ANK+FFbmikfmH0KJ9K0ImxRqisNT9Lq7jtKVsB2c7Q6Kr3UhbuvTTuR7usRN9SaEuYHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiCA9M4JQX45ur/8CN7TfwjiPloLxC8ygG9TnQS8hfY=;
 b=Spm6zJ/vws73kuDjBzDqiUSZ82leSHurYJ32Jpk7GCBI10vm7ZO4NE+jNXNXXBEM5GfPP1okObMIsuGm4Xu3kPWLdUUVF5OWLveE2QkjRE5eMWYrBxi1KN+TUMLb3+ZS2QVYG4CbmqDJcHRb1ySyxNMbdUFEIvFV+OVbg8w4qHPVdFoGcqXJv7MM5fzVHA29bBEoD48eJYGTnVdOBzZw+71fVn2RnUGjr6LzDZsvdqGK8Y3+9g17w18OxpP+ZttS1L1pXOFns4g1xsbfaxPIgw/iMeZBSFwC7vNAY2EUR/h8/G8bV3uQxGtQst2rdvu5CoHD4ENsHeQXlqShuaJk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiCA9M4JQX45ur/8CN7TfwjiPloLxC8ygG9TnQS8hfY=;
 b=Kjo+TXPQehT2fKz25MHp5iSZatODe1A9P6NQuM4XyBNzGuxAxbbVfwIK01/Z/lS88yDQ08eDz/+jELAQgWcLO4Kdfk60jf3zg5aw+jbXO4ldI1USlKy/47AhY5iSZvrHrOvsLxavMXLRtEqR3MCZ5s5IsB+ZH0uqFhBqXzI7zUU=
Received: from BN0PR04CA0138.namprd04.prod.outlook.com (2603:10b6:408:ed::23)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:33:06 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::59) by BN0PR04CA0138.outlook.office365.com
 (2603:10b6:408:ed::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Mon,
 10 Mar 2025 18:33:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:33:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:04 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:32:59 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Ranjani
 Sridharan" <ranjani.sridharan@linux.intel.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Murad Masimov <m.masimov@maxima.ru>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 07/14] ASoC: amd: acp: Remove redundant acp_dev_data
 structure
Date: Tue, 11 Mar 2025 00:01:54 +0530
Message-ID: <20250310183201.11979-8-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cfefe5-763d-497d-65a5-08dd6001ff9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tBivVHTcusVgc8LA61365/JxU1+dMPOzkXGyh+DcsMiaGgDJtkLDMqp6RFOm?=
 =?us-ascii?Q?6Vj2N4FjlGd3mQvQmsxwrO3N8JaJn73oBNayB0I3kcOSYGiLr342P/H64YSq?=
 =?us-ascii?Q?gzi/5fERc5S0lNpcMwkU/HUNMLr8K+djqFkP5GzndxdF+VJh+6n4IiXX0Hyk?=
 =?us-ascii?Q?JLfPTcMKmyIGNEG1mIpAne5PuhF6W8qVgS10jQP8QwIzB2swKUuQv4QByZlT?=
 =?us-ascii?Q?cgzalVixfMEPViYYETi35H5zr3x5OsAFGewc5uQtbnbrAOhrNigqFRs18/c4?=
 =?us-ascii?Q?G+yvGFYDw/0APgRyXF/0XHHZFiSw7H+3j5jJlx3wG5tN+V63Cv64wrKIm/9i?=
 =?us-ascii?Q?BKNn0qQF+i3sofNua5PX7ROayc3+3C+GC6ya+CWJ3v6id/pjZV5wKQE6P+HP?=
 =?us-ascii?Q?Zmy6e1fcINcZKSUBMUPGfRPMaEXXw+5sOA0LvocEUsizkQ3QToBeK/zSrHhh?=
 =?us-ascii?Q?sh1JCzZCEj1uLxZP3YLCakT8fPH+MP4BZOw6Njjzw7r04Yj1N1oqW79W6iHb?=
 =?us-ascii?Q?NVMKOO+eCnyUN4ikCA1Sl2fDA7c6UH69BIjBtr2GVQnXzeJ8D1VRPdsNSb1x?=
 =?us-ascii?Q?q63LxpAgQxb4Z8gQIBTHeLqcWtjFKiJcM670wxSaSsQeC+ap1p1kAm+8LFQ+?=
 =?us-ascii?Q?WAsAI8NBo5ik/6gABByCna/wWAKrBuuOGpbyNFCFcl+aeHzxI/zY0QcLhGxO?=
 =?us-ascii?Q?FQNHZM+nSuT6FeOdvucq6+pWPmQLhi7gmMfxDERPJ405i7k5VFIWN4ES5SDe?=
 =?us-ascii?Q?edgN7d8Kx3gVouOp7xlu9SmxHosw3WcnT2V59MTaGEKljfqRh7f0HE6jJ1C/?=
 =?us-ascii?Q?GceRVDVNwb7OdKIH4ONflbvMUWbqg7xV8TqApA3tSdt//x01igdQyerV9lto?=
 =?us-ascii?Q?gnaciAkqyS9IkXZpeZ6gE3mPck0F5CacCY3W+t2ZZZD0fjXU91SkCjerzjZQ?=
 =?us-ascii?Q?7if6dpTmilk5tbxvOhiSJqil21rcIFCdv/rMHxsO5bsXqxLINcBtUSiUJjbq?=
 =?us-ascii?Q?pLB0OSVIeczC3wE7ulwvLkxRJiD/ZF0s76BVBmTcjT4ehRIkteDd+SZuySv+?=
 =?us-ascii?Q?cI0RUNMOBeM33pIzOouRoD518uGeqQnRrMoxkQYYQl+v2J+diLOjFoIzuL2G?=
 =?us-ascii?Q?YRV04h9o/7Ad7xgbY0N8u5PX1Rb0l5jBwG03HkmCIoMpTNNDg9d7PjiM6T2W?=
 =?us-ascii?Q?clXcEWWopUXIp6ZmuIi6miuuXxm73hWYbubSsqZ8bDuN0sNBHtF5E1/+o8oF?=
 =?us-ascii?Q?XJCHZ4duyy+XYS5b34VCEvcHL3EwRwErKqz4Z/mku58Gi/ICUHIjJ+1zcwqg?=
 =?us-ascii?Q?Uy42FWCbSTBhNuclAzL+bgAb3FznrKDuFsB4GHIg/ci6PHq2EgkonMFT32O6?=
 =?us-ascii?Q?/Qc02I399U9Jie/t8EwJCk521CjLfNmiTZV5CdHt/cdnm66o+YJtVR/PobwK?=
 =?us-ascii?Q?pGU0MMO9IFJb2/2i6y01wTfbsYdlD3+1Scivfy/P+BZeAL8cqIFvzLaovcgB?=
 =?us-ascii?Q?Q80HmzIfx+S7I3M=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:33:05.5501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 47cfefe5-763d-497d-65a5-08dd6001ff9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
Message-ID-Hash: ZPSZMR6KJSPC7UGB2ALHTX5JQJ5DR22F
X-Message-ID-Hash: ZPSZMR6KJSPC7UGB2ALHTX5JQJ5DR22F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPSZMR6KJSPC7UGB2ALHTX5JQJ5DR22F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move acp_dev_data structure members to acp_chip_info structure
to avoid using common members in each structure and remove redundant
acp_dev_data structure.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c           | 181 +++++++++++++-------------
 sound/soc/amd/acp/acp-legacy-common.c | 107 ++++++++-------
 sound/soc/amd/acp/acp-pdm.c           |  41 +++---
 sound/soc/amd/acp/acp-platform.c      |  70 +++++-----
 sound/soc/amd/acp/acp-rembrandt.c     |  53 ++------
 sound/soc/amd/acp/acp-renoir.c        |  50 ++-----
 sound/soc/amd/acp/acp63.c             |  58 +++------
 sound/soc/amd/acp/acp70.c             |  50 ++-----
 sound/soc/amd/acp/amd.h               |  86 +++++-------
 9 files changed, 276 insertions(+), 420 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 2f458c76f9fc..a38409dd1d34 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -31,14 +31,10 @@
 #define	ACP63_LRCLK_DIV_FIELD		GENMASK(12, 2)
 #define	ACP63_BCLK_DIV_FIELD		GENMASK(23, 13)
 
-static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
+static inline void acp_set_i2s_clk(struct acp_chip_info *chip, int dai_id)
 {
 	u32 i2s_clk_reg, val;
-	struct acp_chip_info *chip;
-	struct device *dev;
 
-	dev = adata->dev;
-	chip = dev_get_platdata(dev);
 	switch (dai_id) {
 	case I2S_SP_INSTANCE:
 		i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
@@ -55,36 +51,37 @@ static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
 	}
 
 	val  = I2S_MASTER_MODE_ENABLE;
-	if (adata->tdm_mode)
+	if (chip->tdm_mode)
 		val |= BIT(1);
 
 	switch (chip->acp_rev) {
 	case ACP63_PCI_ID:
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
-		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
-		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
+		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, chip->lrclk_div);
+		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, chip->bclk_div);
 		break;
 	default:
-		val |= FIELD_PREP(LRCLK_DIV_FIELD, adata->lrclk_div);
-		val |= FIELD_PREP(BCLK_DIV_FIELD, adata->bclk_div);
+		val |= FIELD_PREP(LRCLK_DIV_FIELD, chip->lrclk_div);
+		val |= FIELD_PREP(BCLK_DIV_FIELD, chip->bclk_div);
 	}
-	writel(val, adata->acp_base + i2s_clk_reg);
+	writel(val, chip->base + i2s_clk_reg);
 }
 
 static int acp_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 			   unsigned int fmt)
 {
-	struct acp_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = cpu_dai->component->dev;
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	int mode;
 
 	mode = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 	switch (mode) {
 	case SND_SOC_DAIFMT_I2S:
-		adata->tdm_mode = TDM_DISABLE;
+		chip->tdm_mode = TDM_DISABLE;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-		adata->tdm_mode = TDM_ENABLE;
+		chip->tdm_mode = TDM_ENABLE;
 		break;
 	default:
 		return -EINVAL;
@@ -96,7 +93,6 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 				int slots, int slot_width)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = snd_soc_dai_get_drvdata(dai);
 	struct acp_chip_info *chip;
 	struct acp_stream *stream;
 	int slot_len, no_of_slots;
@@ -157,35 +153,35 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 
 	slots = no_of_slots;
 
-	spin_lock_irq(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
+	spin_lock_irq(&chip->acp_lock);
+	list_for_each_entry(stream, &chip->stream_list, list) {
 		switch (chip->acp_rev) {
 		case ACP_RN_PCI_ID:
 		case ACP_RMB_PCI_ID:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
-				adata->tdm_tx_fmt[stream->dai_id - 1] =
+				chip->tdm_tx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
 			else if (rx_mask && stream->dir == SNDRV_PCM_STREAM_CAPTURE)
-				adata->tdm_rx_fmt[stream->dai_id - 1] =
+				chip->tdm_rx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
 			break;
 		case ACP63_PCI_ID:
 		case ACP70_PCI_ID:
 		case ACP71_PCI_ID:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
-				adata->tdm_tx_fmt[stream->dai_id - 1] =
+				chip->tdm_tx_fmt[stream->dai_id - 1] =
 						FRM_LEN | (slots << 13) | (slot_len << 18);
 			else if (rx_mask && stream->dir == SNDRV_PCM_STREAM_CAPTURE)
-				adata->tdm_rx_fmt[stream->dai_id - 1] =
+				chip->tdm_rx_fmt[stream->dai_id - 1] =
 						FRM_LEN | (slots << 13) | (slot_len << 18);
 			break;
 		default:
 			dev_err(dev, "Unknown chip revision %d\n", chip->acp_rev);
-			spin_unlock_irq(&adata->acp_lock);
+			spin_unlock_irq(&chip->acp_lock);
 			return -EINVAL;
 		}
 	}
-	spin_unlock_irq(&adata->acp_lock);
+	spin_unlock_irq(&chip->acp_lock);
 	return 0;
 }
 
@@ -193,15 +189,15 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 			    struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata;
+	struct acp_chip_info *chip;
 	struct acp_resource *rsrc;
 	u32 val;
 	u32 xfer_resolution;
 	u32 reg_val, fmt_reg, tdm_fmt;
 	u32 lrclk_div_val, bclk_div_val;
 
-	adata = snd_soc_dai_get_drvdata(dai);
-	rsrc = adata->rsrc;
+	chip = dev_get_platdata(dev);
+	rsrc = chip->rsrc;
 
 	/* These values are as per Hardware Spec */
 	switch (params_format(params)) {
@@ -240,7 +236,7 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 			dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
 			return -EINVAL;
 		}
-		adata->xfer_tx_resolution[dai->driver->id - 1] = xfer_resolution;
+		chip->xfer_tx_resolution[dai->driver->id - 1] = xfer_resolution;
 	} else {
 		switch (dai->driver->id) {
 		case I2S_BT_INSTANCE:
@@ -259,22 +255,22 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 			dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
 			return -EINVAL;
 		}
-		adata->xfer_rx_resolution[dai->driver->id - 1] = xfer_resolution;
+		chip->xfer_rx_resolution[dai->driver->id - 1] = xfer_resolution;
 	}
 
-	val = readl(adata->acp_base + reg_val);
+	val = readl(chip->base + reg_val);
 	val &= ~ACP3x_ITER_IRER_SAMP_LEN_MASK;
 	val = val | (xfer_resolution  << 3);
-	writel(val, adata->acp_base + reg_val);
+	writel(val, chip->base + reg_val);
 
-	if (adata->tdm_mode) {
-		val = readl(adata->acp_base + reg_val);
-		writel(val | BIT(1), adata->acp_base + reg_val);
+	if (chip->tdm_mode) {
+		val = readl(chip->base + reg_val);
+		writel(val | BIT(1), chip->base + reg_val);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			tdm_fmt = adata->tdm_tx_fmt[dai->driver->id - 1];
+			tdm_fmt = chip->tdm_tx_fmt[dai->driver->id - 1];
 		else
-			tdm_fmt = adata->tdm_rx_fmt[dai->driver->id - 1];
-		writel(tdm_fmt, adata->acp_base + fmt_reg);
+			tdm_fmt = chip->tdm_rx_fmt[dai->driver->id - 1];
+		writel(tdm_fmt, chip->base + fmt_reg);
 	}
 
 	if (rsrc->soc_mclk) {
@@ -377,8 +373,8 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 		default:
 			break;
 		}
-		adata->lrclk_div = lrclk_div_val;
-		adata->bclk_div = bclk_div_val;
+		chip->lrclk_div = lrclk_div_val;
+		chip->bclk_div = bclk_div_val;
 	}
 	return 0;
 }
@@ -387,8 +383,8 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 {
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_resource *rsrc = chip->rsrc;
 	u32 val, period_bytes, reg_val, ier_val, water_val, buf_size, buf_reg;
 
 	period_bytes = frames_to_bytes(substream->runtime, substream->runtime->period_size);
@@ -398,20 +394,20 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		stream->bytescount = acp_get_byte_count(adata, stream->dai_id, substream->stream);
+		stream->bytescount = acp_get_byte_count(chip, stream->dai_id, substream->stream);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			switch (dai->driver->id) {
 			case I2S_BT_INSTANCE:
-				water_val = ACP_BT_TX_INTR_WATERMARK_SIZE(adata);
+				water_val = ACP_BT_TX_INTR_WATERMARK_SIZE(chip);
 				reg_val = ACP_BTTDM_ITER;
 				ier_val = ACP_BTTDM_IER;
-				buf_reg = ACP_BT_TX_RINGBUFSIZE(adata);
+				buf_reg = ACP_BT_TX_RINGBUFSIZE(chip);
 				break;
 			case I2S_SP_INSTANCE:
-				water_val = ACP_I2S_TX_INTR_WATERMARK_SIZE(adata);
+				water_val = ACP_I2S_TX_INTR_WATERMARK_SIZE(chip);
 				reg_val = ACP_I2STDM_ITER;
 				ier_val = ACP_I2STDM_IER;
-				buf_reg = ACP_I2S_TX_RINGBUFSIZE(adata);
+				buf_reg = ACP_I2S_TX_RINGBUFSIZE(chip);
 				break;
 			case I2S_HS_INSTANCE:
 				water_val = ACP_HS_TX_INTR_WATERMARK_SIZE;
@@ -426,16 +422,16 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 		} else {
 			switch (dai->driver->id) {
 			case I2S_BT_INSTANCE:
-				water_val = ACP_BT_RX_INTR_WATERMARK_SIZE(adata);
+				water_val = ACP_BT_RX_INTR_WATERMARK_SIZE(chip);
 				reg_val = ACP_BTTDM_IRER;
 				ier_val = ACP_BTTDM_IER;
-				buf_reg = ACP_BT_RX_RINGBUFSIZE(adata);
+				buf_reg = ACP_BT_RX_RINGBUFSIZE(chip);
 				break;
 			case I2S_SP_INSTANCE:
-				water_val = ACP_I2S_RX_INTR_WATERMARK_SIZE(adata);
+				water_val = ACP_I2S_RX_INTR_WATERMARK_SIZE(chip);
 				reg_val = ACP_I2STDM_IRER;
 				ier_val = ACP_I2STDM_IER;
-				buf_reg = ACP_I2S_RX_RINGBUFSIZE(adata);
+				buf_reg = ACP_I2S_RX_RINGBUFSIZE(chip);
 				break;
 			case I2S_HS_INSTANCE:
 				water_val = ACP_HS_RX_INTR_WATERMARK_SIZE;
@@ -449,14 +445,14 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 			}
 		}
 
-		writel(period_bytes, adata->acp_base + water_val);
-		writel(buf_size, adata->acp_base + buf_reg);
+		writel(period_bytes, chip->base + water_val);
+		writel(buf_size, chip->base + buf_reg);
 		if (rsrc->soc_mclk)
-			acp_set_i2s_clk(adata, dai->driver->id);
-		val = readl(adata->acp_base + reg_val);
+			acp_set_i2s_clk(chip, dai->driver->id);
+		val = readl(chip->base + reg_val);
 		val = val | BIT(0);
-		writel(val, adata->acp_base + reg_val);
-		writel(1, adata->acp_base + ier_val);
+		writel(val, chip->base + reg_val);
+		writel(1, chip->base + ier_val);
 		return 0;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -493,19 +489,19 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 				return -EINVAL;
 			}
 		}
-		val = readl(adata->acp_base + reg_val);
+		val = readl(chip->base + reg_val);
 		val = val & ~BIT(0);
-		writel(val, adata->acp_base + reg_val);
-
-		if (!(readl(adata->acp_base + ACP_BTTDM_ITER) & BIT(0)) &&
-		    !(readl(adata->acp_base + ACP_BTTDM_IRER) & BIT(0)))
-			writel(0, adata->acp_base + ACP_BTTDM_IER);
-		if (!(readl(adata->acp_base + ACP_I2STDM_ITER) & BIT(0)) &&
-		    !(readl(adata->acp_base + ACP_I2STDM_IRER) & BIT(0)))
-			writel(0, adata->acp_base + ACP_I2STDM_IER);
-		if (!(readl(adata->acp_base + ACP_HSTDM_ITER) & BIT(0)) &&
-		    !(readl(adata->acp_base + ACP_HSTDM_IRER) & BIT(0)))
-			writel(0, adata->acp_base + ACP_HSTDM_IER);
+		writel(val, chip->base + reg_val);
+
+		if (!(readl(chip->base + ACP_BTTDM_ITER) & BIT(0)) &&
+		    !(readl(chip->base + ACP_BTTDM_IRER) & BIT(0)))
+			writel(0, chip->base + ACP_BTTDM_IER);
+		if (!(readl(chip->base + ACP_I2STDM_ITER) & BIT(0)) &&
+		    !(readl(chip->base + ACP_I2STDM_IRER) & BIT(0)))
+			writel(0, chip->base + ACP_I2STDM_IER);
+		if (!(readl(chip->base + ACP_HSTDM_ITER) & BIT(0)) &&
+		    !(readl(chip->base + ACP_HSTDM_IRER) & BIT(0)))
+			writel(0, chip->base + ACP_HSTDM_IER);
 		return 0;
 	default:
 		return -EINVAL;
@@ -517,9 +513,8 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
-	struct acp_chip_info *chip;
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_resource *rsrc = chip->rsrc;
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 reg_dma_size = 0, reg_fifo_size = 0, reg_fifo_addr = 0;
 	u32 phy_addr = 0, acp_fifo_addr = 0, ext_int_ctrl;
@@ -529,56 +524,56 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_I2S_TX_DMA_SIZE(adata);
+			reg_dma_size = ACP_I2S_TX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						SP_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR(adata);
-			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(adata);
+			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR(chip);
+			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(chip);
 
 			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_I2S_TX_RINGBUFADDR(chip));
 		} else {
-			reg_dma_size = ACP_I2S_RX_DMA_SIZE(adata);
+			reg_dma_size = ACP_I2S_RX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						SP_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(adata);
-			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(adata);
+			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(chip);
+			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(chip);
 
 			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_I2S_RX_RINGBUFADDR(chip));
 		}
 		break;
 	case I2S_BT_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_BT_TX_DMA_SIZE(adata);
+			reg_dma_size = ACP_BT_TX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						BT_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_TX_FIFOADDR(adata);
-			reg_fifo_size = ACP_BT_TX_FIFOSIZE(adata);
+			reg_fifo_addr = ACP_BT_TX_FIFOADDR(chip);
+			reg_fifo_size = ACP_BT_TX_FIFOSIZE(chip);
 
 			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_BT_TX_RINGBUFADDR(chip));
 		} else {
-			reg_dma_size = ACP_BT_RX_DMA_SIZE(adata);
+			reg_dma_size = ACP_BT_RX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						BT_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_RX_FIFOADDR(adata);
-			reg_fifo_size = ACP_BT_RX_FIFOSIZE(adata);
+			reg_fifo_addr = ACP_BT_RX_FIFOADDR(chip);
+			reg_fifo_size = ACP_BT_RX_FIFOSIZE(chip);
 
 			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_BT_RX_RINGBUFADDR(chip));
 		}
 		break;
 	case I2S_HS_INSTANCE:
@@ -593,7 +588,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_HS_TX_RINGBUFADDR);
+			writel(phy_addr, chip->base + ACP_HS_TX_RINGBUFADDR);
 		} else {
 			reg_dma_size = ACP_HS_RX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
@@ -605,7 +600,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_HS_RX_RINGBUFADDR);
+			writel(phy_addr, chip->base + ACP_HS_RX_RINGBUFADDR);
 		}
 		break;
 	default:
@@ -613,9 +608,9 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 		return -EINVAL;
 	}
 
-	writel(DMA_SIZE, adata->acp_base + reg_dma_size);
-	writel(acp_fifo_addr, adata->acp_base + reg_fifo_addr);
-	writel(FIFO_SIZE, adata->acp_base + reg_fifo_size);
+	writel(DMA_SIZE, chip->base + reg_dma_size);
+	writel(acp_fifo_addr, chip->base + reg_fifo_addr);
+	writel(FIFO_SIZE, chip->base + reg_fifo_size);
 
 	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_int_ctrl |= BIT(I2S_RX_THRESHOLD(rsrc->offset)) |
@@ -634,8 +629,8 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 {
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_resource *rsrc = chip->rsrc;
 	unsigned int dir = substream->stream;
 	unsigned int irq_bit = 0;
 
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 13fddce8df56..988b7a17b2f4 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -38,26 +38,25 @@ EXPORT_SYMBOL_NS_GPL(acp_common_hw_ops, "SND_SOC_ACP_COMMON");
 irqreturn_t acp_irq_handler(int irq, void *data)
 {
 	struct acp_chip_info *chip = data;
-	struct acp_dev_data *adata = chip->adata;
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_resource *rsrc = chip->rsrc;
 	struct acp_stream *stream;
 	u16 i2s_flag = 0;
 	u32 ext_intr_stat, ext_intr_stat1;
 
-	if (adata->rsrc->no_of_ctrls == 2)
+	if (rsrc->no_of_ctrls == 2)
 		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(chip, (rsrc->irqp_used - 1)));
 
 	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
 
-	spin_lock(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
+	spin_lock(&chip->acp_lock);
+	list_for_each_entry(stream, &chip->stream_list, list) {
 		if (ext_intr_stat & stream->irq_bit) {
 			writel(stream->irq_bit,
 			       ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
 			snd_pcm_period_elapsed(stream->substream);
 			i2s_flag = 1;
 		}
-		if (adata->rsrc->no_of_ctrls == 2) {
+		if (chip->rsrc->no_of_ctrls == 2) {
 			if (ext_intr_stat1 & stream->irq_bit) {
 				writel(stream->irq_bit, ACP_EXTERNAL_INTR_STAT(chip,
 				       (rsrc->irqp_used - 1)));
@@ -66,7 +65,7 @@ irqreturn_t acp_irq_handler(int irq, void *data)
 			}
 		}
 	}
-	spin_unlock(&adata->acp_lock);
+	spin_unlock(&chip->acp_lock);
 	if (i2s_flag)
 		return IRQ_HANDLED;
 
@@ -106,7 +105,7 @@ static void set_acp_pdm_ring_buffer(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct acp_stream *stream = runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 
 	u32 physical_addr, pdm_size, period_bytes;
 
@@ -115,43 +114,40 @@ static void set_acp_pdm_ring_buffer(struct snd_pcm_substream *substream,
 	physical_addr = stream->reg_offset + MEM_WINDOW_START;
 
 	/* Init ACP PDM Ring buffer */
-	writel(physical_addr, adata->acp_base + ACP_WOV_RX_RINGBUFADDR);
-	writel(pdm_size, adata->acp_base + ACP_WOV_RX_RINGBUFSIZE);
-	writel(period_bytes, adata->acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
-	writel(0x01, adata->acp_base + ACPAXI2AXI_ATU_CTRL);
+	writel(physical_addr, chip->base + ACP_WOV_RX_RINGBUFADDR);
+	writel(pdm_size, chip->base + ACP_WOV_RX_RINGBUFSIZE);
+	writel(period_bytes, chip->base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
+	writel(0x01, chip->base + ACPAXI2AXI_ATU_CTRL);
 }
 
 static void set_acp_pdm_clk(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	unsigned int pdm_ctrl;
 
 	/* Enable default ACP PDM clk */
-	writel(PDM_CLK_FREQ_MASK, adata->acp_base + ACP_WOV_CLK_CTRL);
-	pdm_ctrl = readl(adata->acp_base + ACP_WOV_MISC_CTRL);
+	writel(PDM_CLK_FREQ_MASK, chip->base + ACP_WOV_CLK_CTRL);
+	pdm_ctrl = readl(chip->base + ACP_WOV_MISC_CTRL);
 	pdm_ctrl |= PDM_MISC_CTRL_MASK;
-	writel(pdm_ctrl, adata->acp_base + ACP_WOV_MISC_CTRL);
+	writel(pdm_ctrl, chip->base + ACP_WOV_MISC_CTRL);
 	set_acp_pdm_ring_buffer(substream, dai);
 }
 
 void restore_acp_pdm_params(struct snd_pcm_substream *substream,
-			    struct acp_dev_data *adata)
+			    struct acp_chip_info *chip)
 {
 	struct snd_soc_dai *dai;
-	struct device *dev;
-	struct acp_chip_info *chip;
 	struct snd_soc_pcm_runtime *soc_runtime;
 	u32 ext_int_ctrl;
 
 	soc_runtime = snd_soc_substream_to_rtd(substream);
 	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
-	dev = dai->component->dev;
-	chip = dev_get_platdata(dev);
+
 	/* Programming channel mask and sampling rate */
-	writel(adata->ch_mask, adata->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
-	writel(PDM_DEC_64, adata->acp_base + ACP_WOV_PDM_DECIMATION_FACTOR);
+	writel(chip->ch_mask, chip->base + ACP_WOV_PDM_NO_OF_CHANNELS);
+	writel(PDM_DEC_64, chip->base + ACP_WOV_PDM_DECIMATION_FACTOR);
 
 	/* Enabling ACP Pdm interuppts */
 	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, 0));
@@ -165,9 +161,8 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
-	struct acp_resource *rsrc = adata->rsrc;
 	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_resource *rsrc = chip->rsrc;
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 reg_dma_size, reg_fifo_size, reg_fifo_addr;
 	u32 phy_addr, acp_fifo_addr, ext_int_ctrl;
@@ -176,40 +171,40 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_I2S_TX_DMA_SIZE(adata);
+			reg_dma_size = ACP_I2S_TX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					SP_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_I2S_TX_FIFOADDR(adata);
-			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(adata);
+			reg_fifo_addr = ACP_I2S_TX_FIFOADDR(chip);
+			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(chip);
 			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_I2S_TX_RINGBUFADDR(chip));
 		} else {
-			reg_dma_size = ACP_I2S_RX_DMA_SIZE(adata);
+			reg_dma_size = ACP_I2S_RX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					SP_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(adata);
-			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(adata);
+			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(chip);
+			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(chip);
 			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_I2S_RX_RINGBUFADDR(chip));
 		}
 		break;
 	case I2S_BT_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_BT_TX_DMA_SIZE(adata);
+			reg_dma_size = ACP_BT_TX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					BT_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_TX_FIFOADDR(adata);
-			reg_fifo_size = ACP_BT_TX_FIFOSIZE(adata);
+			reg_fifo_addr = ACP_BT_TX_FIFOADDR(chip);
+			reg_fifo_size = ACP_BT_TX_FIFOSIZE(chip);
 			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_BT_TX_RINGBUFADDR(chip));
 		} else {
-			reg_dma_size = ACP_BT_RX_DMA_SIZE(adata);
+			reg_dma_size = ACP_BT_RX_DMA_SIZE(chip);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					BT_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_RX_FIFOADDR(adata);
-			reg_fifo_size = ACP_BT_RX_FIFOSIZE(adata);
+			reg_fifo_addr = ACP_BT_RX_FIFOADDR(chip);
+			reg_fifo_size = ACP_BT_RX_FIFOSIZE(chip);
 			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR(adata));
+			writel(phy_addr, chip->base + ACP_BT_RX_RINGBUFADDR(chip));
 		}
 		break;
 	case I2S_HS_INSTANCE:
@@ -220,7 +215,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
 			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
 			phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_HS_TX_RINGBUFADDR);
+			writel(phy_addr, chip->base + ACP_HS_TX_RINGBUFADDR);
 		} else {
 			reg_dma_size = ACP_HS_RX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
@@ -228,7 +223,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
 			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
 			phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_HS_RX_RINGBUFADDR);
+			writel(phy_addr, chip->base + ACP_HS_RX_RINGBUFADDR);
 		}
 		break;
 	default:
@@ -236,9 +231,9 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	writel(DMA_SIZE, adata->acp_base + reg_dma_size);
-	writel(acp_fifo_addr, adata->acp_base + reg_fifo_addr);
-	writel(FIFO_SIZE, adata->acp_base + reg_fifo_size);
+	writel(DMA_SIZE, chip->base + reg_dma_size);
+	writel(acp_fifo_addr, chip->base + reg_fifo_addr);
+	writel(FIFO_SIZE, chip->base + reg_fifo_size);
 
 	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_int_ctrl |= BIT(I2S_RX_THRESHOLD(rsrc->offset)) |
@@ -253,7 +248,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 }
 
 int restore_acp_i2s_params(struct snd_pcm_substream *substream,
-			   struct acp_dev_data *adata,
+			   struct acp_chip_info *chip,
 			   struct acp_stream *stream)
 {
 	struct snd_soc_dai *dai;
@@ -263,7 +258,7 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
 	soc_runtime = snd_soc_substream_to_rtd(substream);
 	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		tdm_fmt = adata->tdm_tx_fmt[stream->dai_id - 1];
+		tdm_fmt = chip->tdm_tx_fmt[stream->dai_id - 1];
 		switch (stream->dai_id) {
 		case I2S_BT_INSTANCE:
 			reg_val = ACP_BTTDM_ITER;
@@ -281,9 +276,9 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
 			pr_err("Invalid dai id %x\n", stream->dai_id);
 			return -EINVAL;
 		}
-		val = adata->xfer_tx_resolution[stream->dai_id - 1] << 3;
+		val = chip->xfer_tx_resolution[stream->dai_id - 1] << 3;
 	} else {
-		tdm_fmt = adata->tdm_rx_fmt[stream->dai_id - 1];
+		tdm_fmt = chip->tdm_rx_fmt[stream->dai_id - 1];
 		switch (stream->dai_id) {
 		case I2S_BT_INSTANCE:
 			reg_val = ACP_BTTDM_IRER;
@@ -301,13 +296,13 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
 			pr_err("Invalid dai id %x\n", stream->dai_id);
 			return -EINVAL;
 		}
-		val = adata->xfer_rx_resolution[stream->dai_id - 1] << 3;
+		val = chip->xfer_rx_resolution[stream->dai_id - 1] << 3;
 	}
-	writel(val, adata->acp_base + reg_val);
-	if (adata->tdm_mode == TDM_ENABLE) {
-		writel(tdm_fmt, adata->acp_base + fmt_reg);
-		val = readl(adata->acp_base + reg_val);
-		writel(val | 0x2, adata->acp_base + reg_val);
+	writel(val, chip->base + reg_val);
+	if (chip->tdm_mode == TDM_ENABLE) {
+		writel(tdm_fmt, chip->base + fmt_reg);
+		val = readl(chip->base + reg_val);
+		writel(val | 0x2, chip->base + reg_val);
 	}
 	return set_acp_i2s_dma_fifo(substream, dai);
 }
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index 9a820ef3bf46..1bfc34c2aa53 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -30,17 +30,16 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 {
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
 	struct acp_chip_info *chip;
 	u32 physical_addr, size_dmic, period_bytes;
 	unsigned int dmic_ctrl;
 
 	chip = dev_get_platdata(dev);
 	/* Enable default DMIC clk */
-	writel(PDM_CLK_FREQ_MASK, adata->acp_base + ACP_WOV_CLK_CTRL);
-	dmic_ctrl = readl(adata->acp_base + ACP_WOV_MISC_CTRL);
+	writel(PDM_CLK_FREQ_MASK, chip->base + ACP_WOV_CLK_CTRL);
+	dmic_ctrl = readl(chip->base + ACP_WOV_MISC_CTRL);
 	dmic_ctrl |= PDM_MISC_CTRL_MASK;
-	writel(dmic_ctrl, adata->acp_base + ACP_WOV_MISC_CTRL);
+	writel(dmic_ctrl, chip->base + ACP_WOV_MISC_CTRL);
 
 	period_bytes = frames_to_bytes(substream->runtime,
 			substream->runtime->period_size);
@@ -53,10 +52,10 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 		physical_addr = stream->reg_offset + MEM_WINDOW_START;
 
 	/* Init DMIC Ring buffer */
-	writel(physical_addr, adata->acp_base + ACP_WOV_RX_RINGBUFADDR);
-	writel(size_dmic, adata->acp_base + ACP_WOV_RX_RINGBUFSIZE);
-	writel(period_bytes, adata->acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
-	writel(0x01, adata->acp_base + ACPAXI2AXI_ATU_CTRL);
+	writel(physical_addr, chip->base + ACP_WOV_RX_RINGBUFADDR);
+	writel(size_dmic, chip->base + ACP_WOV_RX_RINGBUFSIZE);
+	writel(period_bytes, chip->base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
+	writel(0x01, chip->base + ACPAXI2AXI_ATU_CTRL);
 
 	return 0;
 }
@@ -65,7 +64,7 @@ static int acp_dmic_dai_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	unsigned int dma_enable;
 	int ret = 0;
 
@@ -73,27 +72,27 @@ static int acp_dmic_dai_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		dma_enable = readl(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		dma_enable = readl(chip->base + ACP_WOV_PDM_DMA_ENABLE);
 		if (!(dma_enable & DMA_EN_MASK)) {
-			writel(PDM_ENABLE, adata->acp_base + ACP_WOV_PDM_ENABLE);
-			writel(PDM_ENABLE, adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
+			writel(PDM_ENABLE, chip->base + ACP_WOV_PDM_ENABLE);
+			writel(PDM_ENABLE, chip->base + ACP_WOV_PDM_DMA_ENABLE);
 		}
 
-		ret = readl_poll_timeout_atomic(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE,
+		ret = readl_poll_timeout_atomic(chip->base + ACP_WOV_PDM_DMA_ENABLE,
 						dma_enable, (dma_enable & DMA_EN_MASK),
 						DELAY_US, PDM_TIMEOUT);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		dma_enable = readl(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		dma_enable = readl(chip->base + ACP_WOV_PDM_DMA_ENABLE);
 		if ((dma_enable & DMA_EN_MASK)) {
-			writel(PDM_DISABLE, adata->acp_base + ACP_WOV_PDM_ENABLE);
-			writel(PDM_DISABLE, adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
+			writel(PDM_DISABLE, chip->base + ACP_WOV_PDM_ENABLE);
+			writel(PDM_DISABLE, chip->base + ACP_WOV_PDM_DMA_ENABLE);
 
 		}
 
-		ret = readl_poll_timeout_atomic(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE,
+		ret = readl_poll_timeout_atomic(chip->base + ACP_WOV_PDM_DMA_ENABLE,
 						dma_enable, !(dma_enable & DMA_EN_MASK),
 						DELAY_US, PDM_TIMEOUT);
 		break;
@@ -109,7 +108,7 @@ static int acp_dmic_hwparams(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *hwparams, struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	unsigned int channels, ch_mask;
 
 	channels = params_channels(hwparams);
@@ -128,14 +127,14 @@ static int acp_dmic_hwparams(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	adata->ch_mask = ch_mask;
+	chip->ch_mask = ch_mask;
 	if (params_format(hwparams) != SNDRV_PCM_FORMAT_S32_LE) {
 		dev_err(dai->dev, "Invalid format:%d\n", params_format(hwparams));
 		return -EINVAL;
 	}
 
-	writel(ch_mask, adata->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
-	writel(PDM_DEC_64, adata->acp_base + ACP_WOV_PDM_DECIMATION_FACTOR);
+	writel(ch_mask, chip->base + ACP_WOV_PDM_NO_OF_CHANNELS);
+	writel(PDM_DEC_64, chip->base + ACP_WOV_PDM_DECIMATION_FACTOR);
 
 	return 0;
 }
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 9b181fb5861c..8d61e1991e4f 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -107,37 +107,37 @@ static const struct snd_pcm_hardware acp6x_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
-void config_pte_for_stream(struct acp_dev_data *adata, struct acp_stream *stream)
+void config_pte_for_stream(struct acp_chip_info *chip, struct acp_stream *stream)
 {
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_resource *rsrc = chip->rsrc;
 	u32 reg_val;
 
 	reg_val = rsrc->sram_pte_offset;
 	stream->reg_offset = 0x02000000;
 
-	writel((reg_val + GRP1_OFFSET) | BIT(31), adata->acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
-	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+	writel((reg_val + GRP1_OFFSET) | BIT(31), chip->base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+	writel(PAGE_SIZE_4K_ENABLE,  chip->base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
 
-	writel((reg_val + GRP2_OFFSET) | BIT(31), adata->acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_2);
-	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2);
+	writel((reg_val + GRP2_OFFSET) | BIT(31), chip->base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_2);
+	writel(PAGE_SIZE_4K_ENABLE,  chip->base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2);
 
-	writel(reg_val | BIT(31), adata->acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_5);
-	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5);
+	writel(reg_val | BIT(31), chip->base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_5);
+	writel(PAGE_SIZE_4K_ENABLE,  chip->base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5);
 
-	writel(0x01, adata->acp_base + ACPAXI2AXI_ATU_CTRL);
+	writel(0x01, chip->base + ACPAXI2AXI_ATU_CTRL);
 }
 EXPORT_SYMBOL_NS_GPL(config_pte_for_stream, "SND_SOC_ACP_COMMON");
 
-void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int size)
+void config_acp_dma(struct acp_chip_info *chip, struct acp_stream *stream, int size)
 {
 	struct snd_pcm_substream *substream = stream->substream;
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_resource *rsrc = chip->rsrc;
 	dma_addr_t addr = substream->dma_buffer.addr;
 	int num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
 	u32 low, high, val;
 	u16 page_idx;
 
-	switch (adata->acp_rev) {
+	switch (chip->acp_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
 		switch (stream->dai_id) {
@@ -163,7 +163,7 @@ void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int s
 			val = 0x6000;
 			break;
 		default:
-			dev_err(adata->dev, "Invalid dai id %x\n", stream->dai_id);
+			dev_err(chip->dev, "Invalid dai id %x\n", stream->dai_id);
 			return;
 		}
 		break;
@@ -176,9 +176,9 @@ void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int s
 		/* Load the low address of page int ACP SRAM through SRBM */
 		low = lower_32_bits(addr);
 		high = upper_32_bits(addr);
-		writel(low, adata->acp_base + rsrc->scratch_reg_offset + val);
+		writel(low, chip->base + rsrc->scratch_reg_offset + val);
 		high |= BIT(31);
-		writel(high, adata->acp_base + rsrc->scratch_reg_offset + val + 4);
+		writel(high, chip->base + rsrc->scratch_reg_offset + val + 4);
 
 		/* Move to next physically contiguous page */
 		val += 8;
@@ -191,7 +191,6 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct device *dev = component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
 	struct acp_chip_info *chip;
 	struct acp_stream *stream;
 	int ret;
@@ -201,7 +200,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 		return -ENOMEM;
 
 	stream->substream = substream;
-	chip = dev_get_platdata(dev);
+	chip = dev_get_drvdata(dev->parent);
 	switch (chip->acp_rev) {
 	case ACP63_PCI_ID:
 	case ACP70_PCI_ID:
@@ -243,9 +242,9 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 
 	writel(1, ACP_EXTERNAL_INTR_ENB(chip));
 
-	spin_lock_irq(&adata->acp_lock);
-	list_add_tail(&stream->list, &adata->stream_list);
-	spin_unlock_irq(&adata->acp_lock);
+	spin_lock_irq(&chip->acp_lock);
+	list_add_tail(&stream->list, &chip->stream_list);
+	spin_unlock_irq(&chip->acp_lock);
 
 	return ret;
 }
@@ -254,13 +253,14 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct acp_dev_data *adata = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_stream *stream = substream->runtime->private_data;
 	u64 size = params_buffer_bytes(params);
 
 	/* Configure ACP DMA block with params */
-	config_pte_for_stream(adata, stream);
-	config_acp_dma(adata, stream, size);
+	config_pte_for_stream(chip, stream);
+	config_acp_dma(chip, stream, size);
 
 	return 0;
 }
@@ -269,7 +269,7 @@ static snd_pcm_uframes_t acp_dma_pointer(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream)
 {
 	struct device *dev = component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 pos, buffersize;
 	u64 bytescount;
@@ -277,7 +277,7 @@ static snd_pcm_uframes_t acp_dma_pointer(struct snd_soc_component *component,
 	buffersize = frames_to_bytes(substream->runtime,
 				     substream->runtime->buffer_size);
 
-	bytescount = acp_get_byte_count(adata, stream->dai_id, substream->stream);
+	bytescount = acp_get_byte_count(chip, stream->dai_id, substream->stream);
 
 	if (bytescount > stream->bytescount)
 		bytescount -= stream->bytescount;
@@ -301,13 +301,13 @@ static int acp_dma_close(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
 	struct device *dev = component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_stream *stream = substream->runtime->private_data;
 
 	/* Remove entry from list */
-	spin_lock_irq(&adata->acp_lock);
+	spin_lock_irq(&chip->acp_lock);
 	list_del(&stream->list);
-	spin_unlock_irq(&adata->acp_lock);
+	spin_unlock_irq(&chip->acp_lock);
 	kfree(stream);
 
 	return 0;
@@ -325,7 +325,6 @@ static const struct snd_soc_component_driver acp_pcm_component = {
 
 int acp_platform_register(struct device *dev)
 {
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
 	struct acp_chip_info *chip;
 	struct snd_soc_dai_driver;
 	unsigned int status;
@@ -336,17 +335,16 @@ int acp_platform_register(struct device *dev)
 		return -ENODEV;
 	}
 
-	chip->adata = adata;
 	status = devm_snd_soc_register_component(dev, &acp_pcm_component,
-						 adata->dai_driver,
-						 adata->num_dai);
+						 chip->dai_driver,
+						 chip->num_dai);
 	if (status) {
 		dev_err(dev, "Fail to register acp i2s component\n");
 		return status;
 	}
 
-	INIT_LIST_HEAD(&adata->stream_list);
-	spin_lock_init(&adata->acp_lock);
+	INIT_LIST_HEAD(&chip->stream_list);
+	spin_lock_init(&chip->acp_lock);
 
 	return 0;
 }
@@ -354,10 +352,6 @@ EXPORT_SYMBOL_NS_GPL(acp_platform_register, "SND_SOC_ACP_COMMON");
 
 int acp_platform_unregister(struct device *dev)
 {
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
-
-	if (adata->mach_dev)
-		platform_device_unregister(adata->mach_dev);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_platform_unregister, "SND_SOC_ACP_COMMON");
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 13633b3f3730..dfb18d5cdc7a 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -157,8 +157,6 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct acp_chip_info *chip;
-	struct acp_dev_data *adata;
-	struct resource *res;
 	u32 ret;
 
 	chip = dev_get_platdata(&pdev->dev);
@@ -172,37 +170,10 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
-	if (!adata)
-		return -ENOMEM;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "acp_mem");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
-		return -ENODEV;
-	}
-
-	adata->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!adata->acp_base)
-		return -ENOMEM;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "acp_dai_irq");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
-		return -ENODEV;
-	}
-
+	chip->dev = dev;
 	chip->rsrc = &rsrc;
-	adata->i2s_irq = res->start;
-	adata->dev = dev;
-	adata->dai_driver = acp_rmb_dai;
-	adata->num_dai = ARRAY_SIZE(acp_rmb_dai);
-	adata->rsrc = &rsrc;
-	adata->acp_rev = chip->acp_rev;
-	adata->flag = chip->flag;
-	adata->is_i2s_config = chip->is_i2s_config;
-
-	dev_set_drvdata(dev, adata);
+	chip->dai_driver = acp_rmb_dai;
+	chip->num_dai = ARRAY_SIZE(acp_rmb_dai);
 
 	if (chip->is_i2s_config && rsrc.soc_mclk) {
 		ret = acp6x_master_clock_generate(dev);
@@ -239,30 +210,30 @@ static void rembrandt_audio_remove(struct platform_device *pdev)
 
 static int __maybe_unused rmb_pcm_resume(struct device *dev)
 {
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	if (adata->is_i2s_config && adata->rsrc->soc_mclk)
+	if (chip->is_i2s_config && chip->rsrc->soc_mclk)
 		acp6x_master_clock_generate(dev);
 
-	spin_lock(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
+	spin_lock(&chip->acp_lock);
+	list_for_each_entry(stream, &chip->stream_list, list) {
 		substream = stream->substream;
 		if (substream && substream->runtime) {
 			buf_in_frames = (substream->runtime->buffer_size);
 			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
-			config_pte_for_stream(adata, stream);
-			config_acp_dma(adata, stream, buf_size);
+			config_pte_for_stream(chip, stream);
+			config_acp_dma(chip, stream, buf_size);
 			if (stream->dai_id)
-				restore_acp_i2s_params(substream, adata, stream);
+				restore_acp_i2s_params(substream, chip, stream);
 			else
-				restore_acp_pdm_params(substream, adata);
+				restore_acp_pdm_params(substream, chip);
 		}
 	}
-	spin_unlock(&adata->acp_lock);
+	spin_unlock(&chip->acp_lock);
 	return 0;
 }
 
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 94ecb17684b7..2037af67509a 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -108,8 +108,6 @@ static int renoir_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct acp_chip_info *chip;
-	struct acp_dev_data *adata;
-	struct resource *res;
 	int ret;
 
 	chip = dev_get_platdata(&pdev->dev);
@@ -123,39 +121,17 @@ static int renoir_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
-	if (!adata)
-		return -ENOMEM;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "acp_mem");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
-		return -ENODEV;
-	}
-
-	adata->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!adata->acp_base)
-		return -ENOMEM;
-
-	ret = platform_get_irq_byname(pdev, "acp_dai_irq");
-	if (ret < 0)
-		return ret;
-	adata->i2s_irq = ret;
-
+	chip->dev = dev;
 	chip->rsrc = &rsrc;
-	adata->dev = dev;
-	adata->dai_driver = acp_renoir_dai;
-	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
-	adata->rsrc = &rsrc;
-	adata->acp_rev = chip->acp_rev;
-	adata->flag = chip->flag;
-
-	dev_set_drvdata(dev, adata);
+	chip->dai_driver = acp_renoir_dai;
+	chip->num_dai = ARRAY_SIZE(acp_renoir_dai);
+
 	ret = acp_hw_en_interrupts(chip);
 	if (ret) {
 		dev_err(dev, "ACP en-interrupts failed\n");
 		return ret;
 	}
+
 	acp_platform_register(dev);
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
@@ -181,27 +157,27 @@ static void renoir_audio_remove(struct platform_device *pdev)
 
 static int __maybe_unused rn_pcm_resume(struct device *dev)
 {
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	spin_lock(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
+	spin_lock(&chip->acp_lock);
+	list_for_each_entry(stream, &chip->stream_list, list) {
 		substream = stream->substream;
 		if (substream && substream->runtime) {
 			buf_in_frames = (substream->runtime->buffer_size);
 			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
-			config_pte_for_stream(adata, stream);
-			config_acp_dma(adata, stream, buf_size);
+			config_pte_for_stream(chip, stream);
+			config_acp_dma(chip, stream, buf_size);
 			if (stream->dai_id)
-				restore_acp_i2s_params(substream, adata, stream);
+				restore_acp_i2s_params(substream, chip, stream);
 			else
-				restore_acp_pdm_params(substream, adata);
+				restore_acp_pdm_params(substream, chip);
 		}
 	}
-	spin_unlock(&adata->acp_lock);
+	spin_unlock(&chip->acp_lock);
 	return 0;
 }
 
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index e38ad9f7fb48..49786e1a214f 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -153,7 +153,7 @@ static struct snd_soc_dai_driver acp63_dai[] = {
 },
 };
 
-static int acp63_i2s_master_clock_generate(struct acp_dev_data *adata)
+static int acp63_i2s_master_clock_generate(struct acp_chip_info *chip)
 {
 	int rc;
 	u32 data;
@@ -208,8 +208,6 @@ static int acp63_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct acp_chip_info *chip;
-	struct acp_dev_data *adata;
-	struct resource *res;
 	int ret;
 
 	chip = dev_get_platdata(&pdev->dev);
@@ -223,39 +221,13 @@ static int acp63_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
-	if (!adata)
-		return -ENOMEM;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "acp_mem");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
-		return -ENODEV;
-	}
-
-	adata->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!adata->acp_base)
-		return -ENOMEM;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "acp_dai_irq");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
-		return -ENODEV;
-	}
-
+	chip->dev = dev;
 	chip->rsrc = &rsrc;
-	adata->i2s_irq = res->start;
-	adata->dev = dev;
-	adata->dai_driver = acp63_dai;
-	adata->num_dai = ARRAY_SIZE(acp63_dai);
-	adata->rsrc = &rsrc;
-	adata->acp_rev = chip->acp_rev;
-	adata->flag = chip->flag;
-	adata->is_i2s_config = chip->is_i2s_config;
-	dev_set_drvdata(dev, adata);
+	chip->dai_driver = acp63_dai;
+	chip->num_dai = ARRAY_SIZE(acp63_dai);
 
 	if (chip->is_i2s_config && rsrc.soc_mclk) {
-		ret = acp63_i2s_master_clock_generate(adata);
+		ret = acp63_i2s_master_clock_generate(chip);
 		if (ret)
 			return ret;
 	}
@@ -289,30 +261,30 @@ static void acp63_audio_remove(struct platform_device *pdev)
 
 static int __maybe_unused acp63_pcm_resume(struct device *dev)
 {
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	if (adata->is_i2s_config && adata->rsrc->soc_mclk)
-		acp63_i2s_master_clock_generate(adata);
+	if (chip->is_i2s_config && chip->rsrc->soc_mclk)
+		acp63_i2s_master_clock_generate(chip);
 
-	spin_lock(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
+	spin_lock(&chip->acp_lock);
+	list_for_each_entry(stream, &chip->stream_list, list) {
 		substream = stream->substream;
 		if (substream && substream->runtime) {
 			buf_in_frames = (substream->runtime->buffer_size);
 			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
-			config_pte_for_stream(adata, stream);
-			config_acp_dma(adata, stream, buf_size);
+			config_pte_for_stream(chip, stream);
+			config_acp_dma(chip, stream, buf_size);
 			if (stream->dai_id)
-				restore_acp_i2s_params(substream, adata, stream);
+				restore_acp_i2s_params(substream, chip, stream);
 			else
-				restore_acp_pdm_params(substream, adata);
+				restore_acp_pdm_params(substream, chip);
 		}
 	}
-	spin_unlock(&adata->acp_lock);
+	spin_unlock(&chip->acp_lock);
 	return 0;
 }
 
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index be4302a5a584..c1b546df5e67 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -135,8 +135,6 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct acp_chip_info *chip;
-	struct acp_dev_data *adata;
-	struct resource *res;
 	int ret;
 
 	chip = dev_get_platdata(&pdev->dev);
@@ -154,36 +152,10 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
-	if (!adata)
-		return -ENOMEM;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "acp_mem");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
-		return -ENODEV;
-	}
-
-	adata->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!adata->acp_base)
-		return -ENOMEM;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "acp_dai_irq");
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
-		return -ENODEV;
-	}
-
+	chip->dev = dev;
 	chip->rsrc = &rsrc;
-	adata->i2s_irq = res->start;
-	adata->dev = dev;
-	adata->dai_driver = acp70_dai;
-	adata->num_dai = ARRAY_SIZE(acp70_dai);
-	adata->rsrc = &rsrc;
-	adata->acp_rev = chip->acp_rev;
-	adata->flag = chip->flag;
-
-	dev_set_drvdata(dev, adata);
+	chip->dai_driver = acp70_dai;
+	chip->num_dai = ARRAY_SIZE(acp70_dai);
 
 	/* Set clk7 DFS clock divider register value to get mclk as 196.608MHz*/
 	ret = amd_smn_write(0, CLK7_CLK0_DFS_CNTL_N1, CLK0_DIVIDER);
@@ -221,27 +193,27 @@ static void acp_acp70_audio_remove(struct platform_device *pdev)
 
 static int __maybe_unused acp70_pcm_resume(struct device *dev)
 {
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
 	u64 buf_size;
 
-	spin_lock(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
+	spin_lock(&chip->acp_lock);
+	list_for_each_entry(stream, &chip->stream_list, list) {
 		substream = stream->substream;
 		if (substream && substream->runtime) {
 			buf_in_frames = (substream->runtime->buffer_size);
 			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
-			config_pte_for_stream(adata, stream);
-			config_acp_dma(adata, stream, buf_size);
+			config_pte_for_stream(chip, stream);
+			config_acp_dma(chip, stream, buf_size);
 			if (stream->dai_id)
-				restore_acp_i2s_params(substream, adata, stream);
+				restore_acp_i2s_params(substream, chip, stream);
 			else
-				restore_acp_pdm_params(substream, adata);
+				restore_acp_pdm_params(substream, chip);
 		}
 	}
-	spin_unlock(&adata->acp_lock);
+	spin_unlock(&chip->acp_lock);
 	return 0;
 }
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 4beaa9cae352..084d9db1b65c 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -142,22 +142,34 @@ struct acp_chip_info {
 	char *name;		/* Platform name */
 	struct resource *res;
 	struct device *dev;
+	struct snd_soc_dai_driver *dai_driver;
+
 	unsigned int acp_rev;	/* ACP Revision id */
 	void __iomem *base;	/* ACP memory PCI base */
 	struct snd_acp_hw_ops *acp_hw_ops;
 	int (*acp_hw_ops_init)(struct acp_chip_info *chip);
 	struct platform_device *chip_pdev;
 	struct acp_resource *rsrc; /* Platform specific resources*/
+	struct list_head stream_list;
+	spinlock_t acp_lock; /* Used to protect stream_list */
 	struct platform_device *dmic_codec_dev;
 	struct platform_device *acp_plat_dev;
 	struct platform_device *mach_dev;
 	struct snd_soc_acpi_mach *machines;
-	struct acp_dev_data *adata;
+	int num_dai;
 	u32 addr;
+	u32 bclk_div;
+	u32 lrclk_div;
+	u32 ch_mask;
+	u32 tdm_tx_fmt[3];
+	u32 tdm_rx_fmt[3];
+	u32 xfer_tx_resolution[3];
+	u32 xfer_rx_resolution[3];
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
 	bool is_pdm_config;	/* flag set to true when PDM configuration is selected from BIOS */
 	bool is_i2s_config;	/* flag set to true when I2S configuration is selected from BIOS */
+	bool tdm_mode;
 };
 
 struct acp_stream {
@@ -183,36 +195,6 @@ struct acp_resource {
 	u64 sram_pte_offset;
 };
 
-struct acp_dev_data {
-	char *name;
-	struct device *dev;
-	void __iomem *acp_base;
-	unsigned int i2s_irq;
-	unsigned int acp_rev;	/* ACP Revision id */
-
-	bool tdm_mode;
-	bool is_i2s_config;
-	/* SOC specific dais */
-	struct snd_soc_dai_driver *dai_driver;
-	int num_dai;
-
-	struct list_head stream_list;
-	spinlock_t acp_lock;
-
-	struct platform_device *mach_dev;
-
-	u32 bclk_div;
-	u32 lrclk_div;
-
-	struct acp_resource *rsrc;
-	u32 ch_mask;
-	u32 tdm_tx_fmt[3];
-	u32 tdm_rx_fmt[3];
-	u32 xfer_tx_resolution[3];
-	u32 xfer_rx_resolution[3];
-	unsigned int flag;
-};
-
 /**
  * struct snd_acp_hw_ops - ACP PCI driver platform specific ops
  * @acp_init: ACP initialization
@@ -357,13 +339,13 @@ extern int acp70_hw_ops_init(struct acp_chip_info *chip);
 /* Machine configuration */
 int snd_amd_acp_find_config(struct pci_dev *pci);
 
-void config_pte_for_stream(struct acp_dev_data *adata, struct acp_stream *stream);
-void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int size);
+void config_pte_for_stream(struct acp_chip_info *chip, struct acp_stream *stream);
+void config_acp_dma(struct acp_chip_info *chip, struct acp_stream *stream, int size);
 void restore_acp_pdm_params(struct snd_pcm_substream *substream,
-			    struct acp_dev_data *adata);
+			    struct acp_chip_info *chip);
 
 int restore_acp_i2s_params(struct snd_pcm_substream *substream,
-			   struct acp_dev_data *adata, struct acp_stream *stream);
+			   struct acp_chip_info *chip, struct acp_stream *stream);
 
 void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip);
 
@@ -395,48 +377,48 @@ static inline int acp_hw_dis_interrupts(struct acp_chip_info *chip)
 	return -EOPNOTSUPP;
 }
 
-static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int direction)
+static inline u64 acp_get_byte_count(struct acp_chip_info *chip, int dai_id, int direction)
 {
 	u64 byte_count = 0, low = 0, high = 0;
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		switch (dai_id) {
 		case I2S_BT_INSTANCE:
-			high = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_HIGH(adata));
-			low = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_LOW(adata));
+			high = readl(chip->base + ACP_BT_TX_LINEARPOSITIONCNTR_HIGH(chip));
+			low = readl(chip->base + ACP_BT_TX_LINEARPOSITIONCNTR_LOW(chip));
 			break;
 		case I2S_SP_INSTANCE:
-			high = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH(adata));
-			low = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_LOW(adata));
+			high = readl(chip->base + ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH(chip));
+			low = readl(chip->base + ACP_I2S_TX_LINEARPOSITIONCNTR_LOW(chip));
 			break;
 		case I2S_HS_INSTANCE:
-			high = readl(adata->acp_base + ACP_HS_TX_LINEARPOSITIONCNTR_HIGH);
-			low = readl(adata->acp_base + ACP_HS_TX_LINEARPOSITIONCNTR_LOW);
+			high = readl(chip->base + ACP_HS_TX_LINEARPOSITIONCNTR_HIGH);
+			low = readl(chip->base + ACP_HS_TX_LINEARPOSITIONCNTR_LOW);
 			break;
 		default:
-			dev_err(adata->dev, "Invalid dai id %x\n", dai_id);
+			dev_err(chip->dev, "Invalid dai id %x\n", dai_id);
 			goto POINTER_RETURN_BYTES;
 		}
 	} else {
 		switch (dai_id) {
 		case I2S_BT_INSTANCE:
-			high = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_HIGH(adata));
-			low = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_LOW(adata));
+			high = readl(chip->base + ACP_BT_RX_LINEARPOSITIONCNTR_HIGH(chip));
+			low = readl(chip->base + ACP_BT_RX_LINEARPOSITIONCNTR_LOW(chip));
 			break;
 		case I2S_SP_INSTANCE:
-			high = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH(adata));
-			low = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_LOW(adata));
+			high = readl(chip->base + ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH(chip));
+			low = readl(chip->base + ACP_I2S_RX_LINEARPOSITIONCNTR_LOW(chip));
 			break;
 		case I2S_HS_INSTANCE:
-			high = readl(adata->acp_base + ACP_HS_RX_LINEARPOSITIONCNTR_HIGH);
-			low = readl(adata->acp_base + ACP_HS_RX_LINEARPOSITIONCNTR_LOW);
+			high = readl(chip->base + ACP_HS_RX_LINEARPOSITIONCNTR_HIGH);
+			low = readl(chip->base + ACP_HS_RX_LINEARPOSITIONCNTR_LOW);
 			break;
 		case DMIC_INSTANCE:
-			high = readl(adata->acp_base + ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH);
-			low = readl(adata->acp_base + ACP_WOV_RX_LINEARPOSITIONCNTR_LOW);
+			high = readl(chip->base + ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH);
+			low = readl(chip->base + ACP_WOV_RX_LINEARPOSITIONCNTR_LOW);
 			break;
 		default:
-			dev_err(adata->dev, "Invalid dai id %x\n", dai_id);
+			dev_err(chip->dev, "Invalid dai id %x\n", dai_id);
 			goto POINTER_RETURN_BYTES;
 		}
 	}
-- 
2.39.2

