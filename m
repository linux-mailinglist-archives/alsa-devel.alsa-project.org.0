Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EC949F1C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016651926;
	Wed,  7 Aug 2024 07:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016651926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008252;
	bh=utFnCjXXq3dUZomEwbJIe/F8SDIZtbTlgz1KvAdmlz4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NHRGrA7e5GAgn5WHlw4y0KNzqahr/7h6RpFN8rgptVB3L60i4CwPSPUv1DMiMGwmb
	 8SOKvKdNvytdJ0ZIUBc7/HlIG1ducaCXcKX3HiNSutSuJ9dJhH5SW2nI3UxtbWOBXp
	 KKYAj0RJsQsMSqAicpRdMDgKWIJjVevkWSOxNUlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 420ACF8069D; Wed,  7 Aug 2024 07:22:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC4F2F806A7;
	Wed,  7 Aug 2024 07:22:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3031FF800B0; Wed,  7 Aug 2024 07:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE731F800B0;
	Wed,  7 Aug 2024 07:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE731F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qhkW4dFJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHbxmjk1Es2zhalCFntx11oLPCDOThArEE9/EHNvv4emkWKwPSL9QUBH5HQECcpvE/O7YRYDbMhVIFR2wDTghfk6GZ1QVrMhEBjrFCdhqJHojbKNJ7m2NYHcDfgEimCId9kv+2O5M8IXl364TK+hQOAIDUU5Rtwk6pdgZYEUrn8MZzLbFWiSMzAb7C9sWfoIOH9WEqQEyqzj+XIyUuWjhbWvRONVzIVHpNYDtL++cNiLRlE2D8wrhowSDKoFTbUflEKdq0+y7c52trhG0bFeGFVERtzd6YQCSSD8J6A+Q7WIv4FWuOxPaJrFWaFQLrAcGx7zYrIlSQBPC7wruvUjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoOn35PB7tB6CN6MRHOsqsIBZ7eeJhHJe6rpmwRrJWE=;
 b=romCbfaOOsaeEy5bJj1U9JusLkH0WcHRtFTYHWKL1iQOrM3xrP2rNdn4rUg4Qf5JNEBXn7wdq+mYtTy9wySeou+h2iSeTmtyEFWdPSttXEUD1eXiT3dys0XHXrFUNScKS6Ce2yk6/iPPCKTjr3ZxpQMBnJjrdq1j4aOFSkqnF1svgr6N3aOGMLvFE04mxuvdB87M6rNMRB7Xu9JheXP6FaQgRNBaoEEIHjjVRCIwEPMWMv2jbozGHYi6uCB92+gGNPS+OVgSqKzn0WUW7BD9GA0g/iI7KS9rD15qU6+cwnC2nJn1BPF/aFa3HfzQPY0dqxnAwPOwgXOKLBJwJ/NMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoOn35PB7tB6CN6MRHOsqsIBZ7eeJhHJe6rpmwRrJWE=;
 b=qhkW4dFJP8FU/kkKSvY3k9l0pG3kJCBBz1q70BY3xxL8udby0dRLd1fW2WfkFUvdcZ3xuM5NNygwmdp+rQw1c9qUxQ42Jw4oVJnce1JkjGUbczn+fV0o2oujeoqHNn8C7AX3xVb9/p8MEkLGaVBoFl4z6lVMunaQSK1YxhnnFnI=
Received: from BY5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:1d0::13)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 05:14:02 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::77) by BY5PR04CA0003.outlook.office365.com
 (2603:10b6:a03:1d0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Wed, 7 Aug 2024 05:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:14:01 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:13:54 -0500
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
	<cristian.ciocaltea@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, "moderated list:SOUND - SOUND
 OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/8] ASoC: SOF: amd: Fix for incorrect acp error satus
 register offset
Date: Wed, 7 Aug 2024 10:43:13 +0530
Message-ID: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|LV2PR12MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ae472b-2dcf-4be8-abfc-08dcb69fbfbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FNhd1ZfIPGc68HYFXSmV/F+H3H2jjNuepiKU/Bwh18HJnviFD6sMzZ5kuiiK?=
 =?us-ascii?Q?CknJg57e+CbfmpYS+Pa3s0J81ZIm0O3FOhYBF7rjb2KJJxqmOvP3q4lF3PaJ?=
 =?us-ascii?Q?zuXrALJ+Tsv7Ra/XPmEPwQiNgpbtbfKCITbx84hWmACJJua9zcH/3XUVAQhh?=
 =?us-ascii?Q?i2WxB432cY9Mriww082luUcZUD1lw3mVnCRmEfktKpoLeHvrZdlmX5J0Uj6w?=
 =?us-ascii?Q?wI0FlFM8fydnfiPmVgKCnANKuidyELbvsUrCAHgwV/jqiZT48YABWXx3IzSC?=
 =?us-ascii?Q?nYUeSaGVSJEjEKGs2D8otMiZmLpjJQ2gtIwI6MC+g0emmKY9OmIGpQfy5+CE?=
 =?us-ascii?Q?p0fhYUWF2uS4UQry9W7vBPxbgvayYeapCOqn5bP6aRAfmC2Pyqs80ad0wMhC?=
 =?us-ascii?Q?wt276unZWphI7l8Q5n/8+a5BCfc+Sc4DaxzVzLeLs1Tj5Uqo3fTWCMXqztgG?=
 =?us-ascii?Q?0bCVlIjblzz41VFaabntbPWtJkTj5de18/UvyS2bXxIhDSnDQRJE731ek/cy?=
 =?us-ascii?Q?TmEriLTxOowkzhDxPlM7zPZYxQsQq8zlfuUmGR5s9R+mG4x2utJ1PucrHK1b?=
 =?us-ascii?Q?a8LOnxjNDaF11+90WE+7OsT2ELHcWyAGM1mvQwsxruG4lS35ng5qLPHGy9+3?=
 =?us-ascii?Q?VNJ4ETXn/mcZg1jZv0FwQgTBUDxLYTMPEH2ZV9zqk+QTk4sYXbMQH0JSXVe0?=
 =?us-ascii?Q?K0nELwyyK7Oio71CEqoxm1Gr/Eu7NoTPOI5EG4ZmWAIefeIHDqlrmV9oth05?=
 =?us-ascii?Q?M8KbSGwZjT+woG0YGWoOrMJl4ErrFKvXy6ppgaR6ydhiZsh4jO2/US/JIT2D?=
 =?us-ascii?Q?KRmjryU0MBuXuRTaVYORwBoKccbLRuC0F4GvgRIf/0/NuGTl6bU2CXF3J3tp?=
 =?us-ascii?Q?spfGqcJUTveIYtwkjDj15Vw1H0Dp6qnMUCBbe71D/PC+zLCtM5I8Br6HQiVw?=
 =?us-ascii?Q?Vwoj0NeYyW79Ra7F6wjMXFHwcokSpGFq+1BGlZdZrvulA+PQVb5mDF4AiDYD?=
 =?us-ascii?Q?Z/svLcMRBAkTA24h+y2PSdleRQBM4epOZNSrhxlErX2tz+8SEvRvk2H1VWd3?=
 =?us-ascii?Q?HCBj+6wMyaIT8oQPi6wtvXaxQmYbAwY6KnSaDwcRJo71WdEmNPCQWGooOTvh?=
 =?us-ascii?Q?FcVuNbAjHH2gCDaBar9yBPMINMUKuk/1AbWO3o+HC2aJ7bvf/Ts6dSR9qcaf?=
 =?us-ascii?Q?n16rg657kOtQtp/xr5tBgTieqGiTTl0quSmE/6OrQwLxhjpEcSPh7ba5gTPJ?=
 =?us-ascii?Q?PSEn4XadrdRw4OEZ+WgJgwtE9eUAo6GTC2SpiK9H1f8voC4Yn+la2TkW3U3D?=
 =?us-ascii?Q?c2xnkri7qtw9VtED5gq2wMNtOny1+/QAjpJ0ydyNEVcMTvv4vv7Q4EpoQANS?=
 =?us-ascii?Q?u6ut2QYIfH4Rzmzcsl1sVfj/CnaB7buuhCf1Ljrt+D3TkGbPUQh++Oz1naiq?=
 =?us-ascii?Q?8B5YLOFcqgU1fCrmrCGFg2h7pkvagsRx?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:14:01.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54ae472b-2dcf-4be8-abfc-08dcb69fbfbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800
Message-ID-Hash: QAN3TGBGJ4CD3YAX5ZUY3WOFD63P7PX4
X-Message-ID-Hash: QAN3TGBGJ4CD3YAX5ZUY3WOFD63P7PX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAN3TGBGJ4CD3YAX5ZUY3WOFD63P7PX4/>
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

