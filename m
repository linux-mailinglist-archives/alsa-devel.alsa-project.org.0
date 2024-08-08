Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0F94C43C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 682A0E7D;
	Thu,  8 Aug 2024 20:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 682A0E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723141364;
	bh=utFnCjXXq3dUZomEwbJIe/F8SDIZtbTlgz1KvAdmlz4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iD/gvI/prO7fFctxGsNUB070dmvv4Fn9EC+TyNUNlJzk1ZtrKOP4nVhqfQobeFw73
	 4dfBvMarhOvOj2Lh7oZNbzxpexo+KTVTuWINSmUACfFMHx6JrSzjSSLYxM5r+E3Jp6
	 blAsY71d2QwQZHmbd/RUrf0im2aG/2WEiH8bCmeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 090B0F80682; Thu,  8 Aug 2024 20:21:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F86FF80697;
	Thu,  8 Aug 2024 20:21:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A301F8047C; Thu,  8 Aug 2024 18:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5345DF80236;
	Thu,  8 Aug 2024 18:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5345DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vIITaTUn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6tXx96CyhuBYqmLl+s52gg0X6CwY8V4I2u2qVDloJXAah6mA89byAKTNfkgYuJEt3BqHGXtfq7xCncT5JVgWZIzYqQ5UmYW5edjGvRurcRZdx50TCTswYNa1U5Yq83yqn8nUxNiO9oG4EbXE5YQXnMwvtWIZWMggy32xJfEN5BGXP81G+coqhgl4y0rcz3gWpMIv4kSPFRKPue5tjXrh+83loUceLW84LzrWDHvR2SRhVAkGzVALkTOTy6gVhibd69KI/I+XOXyrV5RXTrujuIy9aemz/1IPEcW7z7j8F97D3KL4mzP9TCW5f2HBqs1LWuc6mX1kPMcRcFFUT3EnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoOn35PB7tB6CN6MRHOsqsIBZ7eeJhHJe6rpmwRrJWE=;
 b=E27ie9trFtTtIrPb0640SUyPWtG5iDxDEQWnK7vcqZ7af4iLspprqx7szGvNAmv9K8XwBob90ZIwWur3ISxwXBnOVENsTpw9ghXxqzt2BbX17Qa1b4e0PZgQAQgoK0tCNOfg3MEjWoGy4KXRVjf2iIxPtxxXB2s0y2jjyLRN1buqVLYJDUC4sdUpVswwj07F4bVLQot6rW3D0Uq+pbTRCtrmZJgkkZD964Pvj2b8m9OJlWJyWl321QWLRKZ//mphGYIFIzt88JTK4ZzUM+cOPRUj4p4KcCoyqMmQieVxwjlTFVwnWsqDU7oIVRWgxWsn7tL84jB023L7hgRMT9mQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoOn35PB7tB6CN6MRHOsqsIBZ7eeJhHJe6rpmwRrJWE=;
 b=vIITaTUn7pkslR6wJE/ZhXeXUjDRfwoFSZ0GqGO/twnf5QFXEiXmrU9ZNcplXb0Z4ROYULce1HRbyVfg3pk/1pbLNItxYkxIbR8YXlAvHzZdZ1K0qMdf75MSrTJWi7sLbf7p8VKG+R3fH3qk7jyO97CzUL2iMpbmb/cq3MyLgEY=
Received: from BN9PR03CA0785.namprd03.prod.outlook.com (2603:10b6:408:13f::10)
 by PH7PR12MB9152.namprd12.prod.outlook.com (2603:10b6:510:2ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Thu, 8 Aug
 2024 16:58:17 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::69) by BN9PR03CA0785.outlook.office365.com
 (2603:10b6:408:13f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30 via Frontend
 Transport; Thu, 8 Aug 2024 16:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 16:58:16 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:58:11 -0500
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
Subject: [PATCH RESEND 1/8] ASoC: SOF: amd: Fix for incorrect acp error satus
 register offset
Date: Thu, 8 Aug 2024 22:27:46 +0530
Message-ID: <20240808165753.3414464-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|PH7PR12MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: ded6d7e5-df66-4eb6-8a56-08dcb7cb4c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eeZwwl1ruc87VGeBeJ1+Enx6SiCsQHdtncuzwoXp528RjIXvstndNLYBLS9E?=
 =?us-ascii?Q?zXXm+rGwmPfw6tt5WCVNPnNo3FwIo33JFCbT2PQFI8vygxxeFeZYfWEhIwyf?=
 =?us-ascii?Q?nj/yBvIusPsbCamR6d+HtozgZopios+pgDPOtCFcqTbWQBgsYsE3McsIAYOn?=
 =?us-ascii?Q?d71t+Z4W1v8hOmSjjVCx4I7w1I9ak6tHpYfExnJEtHvl940P6DuGFtPz6XTC?=
 =?us-ascii?Q?Dgokw8jmmunQUlGuO0lTE/9cwLHdsOWYvSVTfVWo04zmnmJi+NMneL23NAQI?=
 =?us-ascii?Q?C0NJ65B0bjjxpiF4vmNtRJyGzMdH8TCzsN0ANE/M2EAxNZRzMvG5eoJZ1eIo?=
 =?us-ascii?Q?kapyQDdoujNyqFAc3uc5c9d2EnDBCHSSRlKzoD3HciRu8T+Ue7ml7aKiBjfT?=
 =?us-ascii?Q?7tJk42ovxQYbMVg8qEP5ZnK+5Dfy8RZyi+YpBtWP6/Kt+l4449p5dbKwEGf8?=
 =?us-ascii?Q?ezd8z3cH5ASbNUxmSKc/9eOP0GHI9gXlXVlwnT0z0PymFMa7ab1oWerwkykv?=
 =?us-ascii?Q?ovNu5dh+SFN571ghrja6OU+OrLaMLhnIUQN8wTZvoJinsk76v5EBLSenD7dK?=
 =?us-ascii?Q?E3UnLraO/Eo86Z0B+qqytswjOkuR8fk3vlgSaFA4eBpuQ/0zgRxrq4ILFWXI?=
 =?us-ascii?Q?iOfn6UcqO9GlGkzkM2E72eChT7P2anR//zOJckfJ2p4x91Vg7foWiYc0t8i6?=
 =?us-ascii?Q?I9gznUJ8hSZWSWbNJNGafEurc3HCLmgbOzWSRXdztXFfY4jg24atIRB7UCfn?=
 =?us-ascii?Q?S/I1J7vRCDfyG9QdsaqJ6sF+/UJyyai9yY+ADHwwyMLoLse8jBC6vswT/6AM?=
 =?us-ascii?Q?O7YE0IEn7D6Qvdv90+WYabRoGjahAKp2leW2qKen/kkKlvZP5iZyR0KXnJ6/?=
 =?us-ascii?Q?P8ko+D3VGr+iA0QIbbEzUWisR6rWbugpY9GA1NDgC79+YRTXmkgLqBzu+pfd?=
 =?us-ascii?Q?1pv1RxD31EdKz8AOurmq2AOGQ6rtskawQezn/jh9EHW7/FQ95bCxubX1k5PK?=
 =?us-ascii?Q?tLAgr+mle9a1IXXToHbg9dtngrlOsYK9J7lX6woeOrjc/rVSmD9jYkDaqKhw?=
 =?us-ascii?Q?Se4YsKV+KWYT/E/IgbvbIuse5jITSwAWTh8yFWGL0LLFpvGVoHO1cCFHj3Zi?=
 =?us-ascii?Q?FiooqsGjUrV7ZvNVVDWoNtcHz3idpgfGCqodJTShT3CLUC3LogvvPDvfTU4E?=
 =?us-ascii?Q?71K1vg4Xx4rWU3oCKPciDH3J/2bisWU6WOyKBcEuqnay5N8sJD0trROuFhZ6?=
 =?us-ascii?Q?ipok5J3SDEZjSIgH9ZUmzVFADejfCSAmAOouVJVxTh9kw2hoyOu2eBW5k5uG?=
 =?us-ascii?Q?meO5w2Rl6Iozv+UhRCdI8tQOeZ7XzUJYBbvMX3pv8mqXm6Lh9zIA5jqOnOu7?=
 =?us-ascii?Q?CCeadPDY+DjOegS7kOGyZPfso73fWsZOk3COkPQcDnxLK9PGQ1BTxbBOH3NO?=
 =?us-ascii?Q?23Ol1vgyZbl6Kte0Wz+mErcSMgZ1QOEy?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:58:16.6978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ded6d7e5-df66-4eb6-8a56-08dcb7cb4c63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9152
Message-ID-Hash: C2INAJCSTSZHS2G34CMZAYVH5ELCVJFL
X-Message-ID-Hash: C2INAJCSTSZHS2G34CMZAYVH5ELCVJFL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2INAJCSTSZHS2G34CMZAYVH5ELCVJFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding 'dsp_intr_base' to ACP error status register offset in irq handler
points to wrong register offset. ACP error status register offset got
changed from ACP 6.0 onwards. Add 'acp_error_stat' descriptor field and
update the value based on the ACP variant.

Fixes: 0e44572a28a4 ("ASoC: SOF: amd: Add helper callbacks for ACP's DMA configuration")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h | 3 ++-
 sound/soc/sof/amd/acp.c            | 5 +++--
 sound/soc/sof/amd/acp.h            | 1 +
 sound/soc/sof/amd/pci-acp63.c      | 1 +
 sound/soc/sof/amd/pci-rmb.c        | 1 +
 sound/soc/sof/amd/pci-rn.c         | 1 +
 6 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 59afbe2e0f42..66968efda869 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -76,7 +76,8 @@
 #define DSP_SW_INTR_CNTL_OFFSET			0x0
 #define DSP_SW_INTR_STAT_OFFSET			0x4
 #define DSP_SW_INTR_TRIG_OFFSET			0x8
-#define ACP_ERROR_STATUS			0x18C4
+#define ACP3X_ERROR_STATUS			0x18C4
+#define ACP6X_ERROR_STATUS			0x1A4C
 #define ACP3X_AXI2DAGB_SEM_0			0x1880
 #define ACP5X_AXI2DAGB_SEM_0			0x1884
 #define ACP6X_AXI2DAGB_SEM_0			0x1874
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 7b122656efd1..d0b7d1c54248 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -92,6 +92,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 			      unsigned int idx, unsigned int dscr_count)
 {
 	struct snd_sof_dev *sdev = adata->dev;
+	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int val, status;
 	int ret;
 
@@ -102,7 +103,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 					    val & (1 << ch), ACP_REG_POLL_INTERVAL,
 					    ACP_REG_POLL_TIMEOUT_US);
 	if (ret < 0) {
-		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_ERROR_STATUS);
+		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->acp_error_stat);
 		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DMA_ERR_STS_0 + ch * sizeof(u32));
 
 		dev_err(sdev->dev, "ACP_DMA_ERR_STS :0x%x ACP_ERROR_STATUS :0x%x\n", val, status);
@@ -404,7 +405,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW0_I2S_ERROR_REASON, 0);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW1_I2S_ERROR_REASON, 0);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_ERROR_STATUS, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
 		irq_flag = 1;
 	}
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index ec9170b3f068..6ac853ff6093 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -203,6 +203,7 @@ struct sof_amd_acp_desc {
 	u32 probe_reg_offset;
 	u32 reg_start_addr;
 	u32 reg_end_addr;
+	u32 acp_error_stat;
 	u32 sdw_max_link_count;
 	u64 sdw_acpi_dev_addr;
 };
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index 54d42f83ce9e..c3da70549995 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -35,6 +35,7 @@ static const struct sof_amd_acp_desc acp63_chip_info = {
 	.ext_intr_cntl = ACP6X_EXTERNAL_INTR_CNTL,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.ext_intr_stat1	= ACP6X_EXT_INTR_STAT1,
+	.acp_error_stat = ACP6X_ERROR_STATUS,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 4bc30951f8b0..194b7ff37e9e 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -33,6 +33,7 @@ static const struct sof_amd_acp_desc rembrandt_chip_info = {
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
+	.acp_error_stat = ACP6X_ERROR_STATUS,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
 	.fusion_dsp_offset = ACP6X_DSP_FUSION_RUNSTALL,
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index e08875bdfa8b..bff2d979ea6a 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -33,6 +33,7 @@ static const struct sof_amd_acp_desc renoir_chip_info = {
 	.pgfsm_base	= ACP3X_PGFSM_BASE,
 	.ext_intr_stat	= ACP3X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP3X_DSP_SW_INTR_BASE,
+	.acp_error_stat = ACP3X_ERROR_STATUS,
 	.sram_pte_offset = ACP3X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP3X_AXI2DAGB_SEM_0,
 	.acp_clkmux_sel	= ACP3X_CLKMUX_SEL,
-- 
2.34.1

