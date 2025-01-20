Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E1A16A59
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:07:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55A1460273;
	Mon, 20 Jan 2025 11:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55A1460273
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367636;
	bh=WwekW25sM31HWqRtWcjTLS6n/Ap8nkhiErzQ/Hlq37Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mpIFVYjHZvdJHCEz+Ge7I1IzMCfH+FsWRe7/mdBU1uU8T2WIwRwfitA2BDzfkgVmW
	 9Dt47YsqhX2F06MuF6i67GR0Kv4ATsLmlWXLdEkl617cbO9g+C/NcoHuhhnWfzvRU7
	 8hNQF7xNcl+LtAms0/geME4FEW7ISkaX4yxAoMwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E484F805E2; Mon, 20 Jan 2025 11:05:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57CA9F805E2;
	Mon, 20 Jan 2025 11:05:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC807F8051E; Mon, 20 Jan 2025 11:02:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::600])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAEFDF8065C
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAEFDF8065C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Xd3WpdqO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDbsGSNxVtHFMFhmpxxQRkMRZ6/x7GYFZ8fZ6s2BZxJHBOM5KZw+xfECEMYng1DnGcqv/DQ0LKIsK69WLsPMtaxOb7tQImgyLwiJ1Zxh1qkps7ThQ9mwqMnIp09CE2pSXbFYeGF3CXWplX4ejWWNkcrm2nN9YYMRRQ6V88sP0H9nX8reAMPXu64RP0t+mkDixmcaaP/tsOOh2Pb07xrPv+euKgrIQXe7fqeJVkl2nOT1oH4q9CeVbPWvCr1kVGdm2+AMetm0OYNGIK7qB4toiEgCAVVqgPHn9Oxt4348QnpG2rmLT1tvhBRXBIEqAw2JAt1wz9Gw1Kf/sdOYZixCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJQi71sXiDZNgwfIvXoSLGbmEiJoWJQjzWCC2CVlwxw=;
 b=P7k1/Y/vBih/cGNZP6lIN9FOgLPRT2plk9gHtZptIgW3ww4zxgEzMlNN89DOXtC4h+lLrkJ+AyOw1UI5g16OUm3N5nlELsqPHaDYI/DiB298Tw9C13NS4YKGZaptO9exv1AvqAy04KoO2ymPn685/GgoEkUqfO/DSTN2eD15bLwIzsyrNJUrV+dE789rWo39ZdQ1RWf1BU7DFyrUNKxHHsXTkLX9yfN7CY0P4qSeX2MFQQha+UV5tfir/ZuQDZ18re+y0PQ3dkvEvPX4HLOUmZs3DROz8h5KeXzJRDQ1xpLwHWD3ANVVF6UazvfnGuh4WpTZYDT6BcnpO2mekvLEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJQi71sXiDZNgwfIvXoSLGbmEiJoWJQjzWCC2CVlwxw=;
 b=Xd3WpdqOfkygrDDZF4bpaa+e665UXdoH0GSlTvoaVNNSL1SRw5Snmt6pJ7+svAgmW+0niZjnRZKcz+io/ekwdW3JfU+DDpB9j5q0XzC7vaiMMLvo34nlLdEpcIJZQJUS7WLK3q7SxIHwcFxCx3DvoLkM4DHhWObwgDOJDyIfmI8=
Received: from CH0PR03CA0246.namprd03.prod.outlook.com (2603:10b6:610:e5::11)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:31 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::20) by CH0PR03CA0246.outlook.office365.com
 (2603:10b6:610:e5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:30 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:27 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 13/23] ASoC: amd: acp70: add acp pdm driver pm ops
Date: Mon, 20 Jan 2025 15:31:20 +0530
Message-ID: <20250120100130.3710412-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 04081284-cfdc-4240-99c6-08dd39398dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P0UcPCkZV3F0tWTeBidSuZmrRFxhy0+j5Wz8sQ1m2SH7S43Ul7FxRu4s4n0n?=
 =?us-ascii?Q?8yWpt/3aaQC6k3rmopNAkCXaQN68hwtV6Th4+l3+SxV+DMvnnzwUgM8FeBnv?=
 =?us-ascii?Q?T+kqyCWzY7hH5Q/RcIVoj9LMbXc1T3yGxUcO88Srtxo1l/gu8yhLNSNvFYig?=
 =?us-ascii?Q?U/D1/AIikkS58pHt+y9u6wl7obzXuWqnayeTnykkfq455MggwMCi2Iu8cArN?=
 =?us-ascii?Q?jRPArdFK647v5yB26MXqQUn81ErV3WRMyyU7P6NXVUjYwpi0U1Vr3pzDrt/S?=
 =?us-ascii?Q?pAr5eoiyV9Sd/VwNgDhtUxqi5NshrCpwBDMGjjiMr3D+8W7D2WNiimc0e/Ns?=
 =?us-ascii?Q?6YLGRU75lmZA8LjGclY+8HeBkdglZnJk9EaIwI69rLGrVveCSZ1KPwN4Q/SU?=
 =?us-ascii?Q?VHE43MGsGiOaUJSqWtJ3eZMhlpNXsmYS74/y9MKFOHvio3zSHTwyDsbfgUtC?=
 =?us-ascii?Q?nUPcyI3UCUXPCtfjXSCvogUDPxnyPmnLxMbUHU8nkETvB8O1kLhbp895qPcW?=
 =?us-ascii?Q?LnlZYHK6NMsr6iVb6JuIHLuEYxEuePkUEMDl10utVVPQCewLZbbxmjN0xvru?=
 =?us-ascii?Q?o0vDVhTNhwyOP28Ux6+IefhSKP/ma4v9seAdQOo4MiCszPTYXqPJV0RYhRbf?=
 =?us-ascii?Q?8BYQoH+u/sMVYLec9LGJibYvvHa2hhERyzrlJgOl16FJfEeNrn8G/CUMtvY7?=
 =?us-ascii?Q?GM1a6gJAZPAzy+x82lBEgsgyoiBbQrvz3mzmdd3jCi7qUaTfFgi3g+XIeOAa?=
 =?us-ascii?Q?kEoQiPS37ds4jNdbjpJOiHyeKMnXztwVSjuKoyeGyIWJeIN7ZK4uda4lVaIB?=
 =?us-ascii?Q?+g2awbT859yTMQX6LwGBErfAMjWFa2ViRsbuBAC8cggw3WndsGGkCq7U0U7p?=
 =?us-ascii?Q?KZXUsc/QlP7tzo2ivRWiOPHhqNxGsdxWrK+7smduOessburjrgR/mCUKJ0/x?=
 =?us-ascii?Q?RHIW3DVB6Uul9P8SNDFBiVH0ePPCmTasgXk5IaJg7cSLL8fKXwWvaStiaOjD?=
 =?us-ascii?Q?bx3N2RdQ60lQOXbaHuRLA8F0PUBMHlLRevmSZKqt16SlwPhV/Dc8nx7b3ZvP?=
 =?us-ascii?Q?dtlR9vSaHnohAf9/TM2VYO/tb3gyYLk8MyK/5LwnrKPK9vnEFsW+q8dU9UF3?=
 =?us-ascii?Q?i5GSyI5+NnslEmL7apDaDszuoGZGtL50tXZKv1iJ09ZegCPb/it635XTXgdF?=
 =?us-ascii?Q?0+REdSn6yQ+UIy1+0/uJ9Lypfzt0yhsggY4A3HKPCYR3XvR1WGxn7QrfetB3?=
 =?us-ascii?Q?5xeY0GiXOK9t5Ce9gNw636AAhQAM604umJk5DeZdDwrvWs9X85BmA3i7apRj?=
 =?us-ascii?Q?lAojhdPkm+28ZCpvcghKrCNZbozqbpPmlrIz0Nuq3SOh1yFrRAcl0bjgkDqD?=
 =?us-ascii?Q?KqkWN65VjAv+k9ec0b1/a/mKnUGiPlXhsrAkyNOA2pP1WZsS1fK1l9kXEa3J?=
 =?us-ascii?Q?BKeW4mZgt7JQWfcdZTeiTPz5oEukpTG+gINIdZE3jUGxpGmbzj/eOvMeFnMW?=
 =?us-ascii?Q?vVKZe+mIWj/NMSE=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:30.8449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 04081284-cfdc-4240-99c6-08dd39398dab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377
Message-ID-Hash: JAP5F6STWGRO52ITNYXKYR4GTCDAAIYA
X-Message-ID-Hash: JAP5F6STWGRO52ITNYXKYR4GTCDAAIYA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAP5F6STWGRO52ITNYXKYR4GTCDAAIYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp pdm driver pm ops for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70-pdm-dma.c | 57 +++++++++++++++++++++++++++++
 sound/soc/amd/acp70/acp70.h         |  3 ++
 2 files changed, 60 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70-pdm-dma.c b/sound/soc/amd/acp70/acp70-pdm-dma.c
index 197214e68489..0d24c9ed917f 100644
--- a/sound/soc/amd/acp70/acp70-pdm-dma.c
+++ b/sound/soc/amd/acp70/acp70-pdm-dma.c
@@ -13,6 +13,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
+#include <linux/pm_runtime.h>
 
 #include "acp70.h"
 
@@ -388,13 +389,69 @@ static int acp70_pdm_audio_probe(struct platform_device *pdev)
 
 		return -ENODEV;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
+static void acp70_pdm_audio_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+}
+
+static int __maybe_unused acp70_pdm_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+	struct snd_pcm_runtime *runtime;
+	struct pdm_stream_instance *rtd;
+	u32 period_bytes, buffer_len;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->capture_stream && adata->capture_stream->runtime) {
+		runtime = adata->capture_stream->runtime;
+		rtd = runtime->private_data;
+		period_bytes = frames_to_bytes(runtime, runtime->period_size);
+		buffer_len = frames_to_bytes(runtime, runtime->buffer_size);
+		acp70_config_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
+		acp70_init_pdm_ring_buffer(PDM_MEM_WINDOW_START, buffer_len,
+					   period_bytes, adata->acp70_base);
+	}
+	acp70_enable_pdm_interrupts(adata);
+	return 0;
+}
+
+static int __maybe_unused acp70_pdm_suspend(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp70_disable_pdm_interrupts(adata);
+	return 0;
+}
+
+static int __maybe_unused acp70_pdm_runtime_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp70_enable_pdm_interrupts(adata);
+	return 0;
+}
+
+static const struct dev_pm_ops acp70_pdm_pm_ops = {
+	SET_RUNTIME_PM_OPS(acp70_pdm_suspend, acp70_pdm_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(acp70_pdm_suspend, acp70_pdm_resume)
+};
+
 static struct platform_driver acp70_pdm_dma_driver = {
 	.probe = acp70_pdm_audio_probe,
+	.remove = acp70_pdm_audio_remove,
 	.driver = {
 		.name = "acp70_pdm_dma",
+		.pm = &acp70_pdm_pm_ops,
 	},
 };
 
diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index d5ab606adedc..1d8e670264fc 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -133,6 +133,9 @@
 #define SDW_MAX_BUFFER (SDW_PLAYBACK_MAX_PERIOD_SIZE * SDW_PLAYBACK_MAX_NUM_PERIODS)
 #define SDW_MIN_BUFFER SDW_MAX_BUFFER
 
+/* time in ms for runtime suspend delay */
+#define ACP_SUSPEND_DELAY_MS	2000
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
-- 
2.34.1

