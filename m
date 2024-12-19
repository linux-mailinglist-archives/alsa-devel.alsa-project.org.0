Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1779F744E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:54:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0018660284;
	Thu, 19 Dec 2024 06:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0018660284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587641;
	bh=WwekW25sM31HWqRtWcjTLS6n/Ap8nkhiErzQ/Hlq37Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TAopNX8ykVB6We5JHsUpAbW7y8tNMjgvolijLDXSIJXoyL67GdWjEnMeQY7B7A7l4
	 uycfmFq/HDOXkqrqiMnL3uMhE82CbXpYAlxps6E6sUm5v1x3ZJPdqJQgDtBR3gjyum
	 KSeKWPuQhoDsVyzt91k1h4MVLHowIujNzz0ofyuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 781EBF806F9; Thu, 19 Dec 2024 06:51:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7F8F806F8;
	Thu, 19 Dec 2024 06:51:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C129F80636; Thu, 19 Dec 2024 06:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46053F805FA
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46053F805FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XAnPcTh6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMgD+odk6hMdkwwdvssBuszOL68PVvvZW/n93pz/Clft/GthoD9tBOEzcnpv0NGedEdyfjOexRdBkRZyOJN6CbdTSJtRYbP81XfhVn64eexADvtx5QFNrnTfZrkxP9EH5ElMozuSPyEvP2kEL8J04omdNtJJftBmYcoRZn23UEHRc6m/qHH2Nr7hgtLQsw6Gs9Bp7Ah3wp5p7QSU03hzXkYmTZQZbrvPJqV1svNn+b4qhKRWvg+JVk6z92L3bQVdTisq2faPBoZJt1L3qiwSq0bMTj/d9e0z8kYsH+5MxXcMH701+JsrhK3aB6KfVR0xMklV9laC1HNyNsxO/7ctgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJQi71sXiDZNgwfIvXoSLGbmEiJoWJQjzWCC2CVlwxw=;
 b=YACvnVnD+oZbvS3Qa2GmU2QDZa3rACKit78pcukZENufZn5/yk4j/uK+0r9GoTDfbGTz6+pVBbHbtACRJCE7SElQwYewhUzmpIA37Sn7VuFLYD1vrUTKDE+osyLDulx5SRU5afjo74rg3hKA9YhpZPPRlq7tkZYRZ8i16uW+eBlbAJg/1c3SzAy3p1yuqqS/wf7o/0mIpMNJALRUFAePr2+rJpEHYRsq9i4VggJ6oJgHurOUbM4sLXRJamKhTBkgMenrMavWwVIvv1SZnxisX5VboCCdvcp77+BYwEYXaUAkSkgAbizbQiErdB3kVJDfnOFe+YCrmqkOjhKWzXMVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJQi71sXiDZNgwfIvXoSLGbmEiJoWJQjzWCC2CVlwxw=;
 b=XAnPcTh6GNzbZuMKvM+muM6LGGNqjULBi+zg2JcA0sOBsFYdPmgfHuErtYJSoDIt9bSt/rbJJOavI5ALRWvQsUTJL5gJ4J1vex9cK9uw2rsqWAtWxcypGjyZq3rrOy7zP08xgNn2IocqVvVr7Si3pmF1ogyhyDPML8Oo9TNZEVY=
Received: from CH2PR15CA0027.namprd15.prod.outlook.com (2603:10b6:610:51::37)
 by DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:51:33 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::e3) by CH2PR15CA0027.outlook.office365.com
 (2603:10b6:610:51::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 05:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:33 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:29 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 13/21] ASoC: amd: acp70: add acp pdm driver pm ops
Date: Thu, 19 Dec 2024 11:18:49 +0530
Message-ID: <20241219054857.2070420-14-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS0PR12MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd298ba-ef32-4534-c3c7-08dd1ff13155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O7KmXvVEqyR56puyU1BXtCGPGA1i2qZoT9qVn62SXb6MtzGxJPBu2YUtQ09U?=
 =?us-ascii?Q?wBlFzsnw/5muzAVdEz9NPObwm+aToHQSJ6jHg4HzUSPEE+AMDTB722YdRSh7?=
 =?us-ascii?Q?vbhS3EHD4X1GE1bzLjZVOxJpKxw7wzvYDk87iMQwe9Eb1mkOHPBrASU7zrbh?=
 =?us-ascii?Q?X+0zX8MBEV0Kn3OcZoU350QnEWXpbL5BY8O/z1OoZuLLQ8ef48zFl3p6zJkw?=
 =?us-ascii?Q?vJuykI0b7Arqd17XCDzpwqTXFMCI/mSo22MrnALmx5Bnxw7SwYpoQOi1OtSk?=
 =?us-ascii?Q?qJfuWeWVCu5funnWLqv+RHHoa0AawNQSuH833cSyDjZmq2WJ9YbeIoe7fyID?=
 =?us-ascii?Q?uukkGtsY6Z/AkxRAClKxvelX9FKcIdp91e2DrhaTBfsr0KRnto3vw3FzCpYq?=
 =?us-ascii?Q?b5XEvCXQMdONOSCF2dT8HiQBxJGfYdUMcLAnoQOpE16kK6scwfc84Db+hUeF?=
 =?us-ascii?Q?ZD8kICo7xtzh6N3ooLHtdd/s5mb93H/Hc4a1hk9mK0SJWmHPerUqr51+J2BL?=
 =?us-ascii?Q?aGtWM+49NjUQk42oG+3zAVHKYCMb3WMWbljrTacXi8oc9sSf9JdyyayxCYIH?=
 =?us-ascii?Q?MZN/QQJpIKRyT7Sxx/6zRiJELBSfLzlLyqT7ceQfXlJd1FxXcAverE4dUbaz?=
 =?us-ascii?Q?/zMG6S0MLj+vuraW3hExhlczd9hbofW31y3HckbL1zpIGNZBSwrVlXlAjOcr?=
 =?us-ascii?Q?aVzAid5GD8vNILHlk3xUsL0svjpyDMIhR/mxuR9UXDGT5egLj7NtPRLwHuk+?=
 =?us-ascii?Q?BoUzpa48sIYU7E2mwx5YGCa8qBL+uJGMfXf8Qzyd4xvAMvHXoMJB5KK8gpB3?=
 =?us-ascii?Q?41Gfdvu8N72KQquGtum/HynCbL0wWGCxJdpisO8pCh1Hm7QCoS//9LFjJQZy?=
 =?us-ascii?Q?4yAovOuTCJR2gReXKKz0Wb9fd1nna1nd1Fn3TQWuhDJ2QO/Hi1EfmX+TEgqr?=
 =?us-ascii?Q?vBd9orFfCI2C3hDmlM+b8sGK6kJMBZAXM6MBhHBRdlvf80uCEr44J0xgl/Pa?=
 =?us-ascii?Q?rwn6NWBh/T07UBjj7ar4e9uGgZmIbKYUm2fY1ZcpwRpftsJaecw+YhKB878g?=
 =?us-ascii?Q?QlVEgmdsOaqunrPwCu+epx4wW2vMgUDr5LVYbKBkcS7C73Tn48c6qXz7ENBh?=
 =?us-ascii?Q?1sz6SrlRNP5dVGtb+t3S/E4uXxak2RZyOQziM3qfE8nGXMBMHJT7kryIdlt8?=
 =?us-ascii?Q?QL86N5CmnbSRcB2j+T+pHJ1np+1kU/Kdd30ofY3nRQdZDBejwcC4QbJrHLmP?=
 =?us-ascii?Q?yZiclhYrufntcRkF3CJ424mRxTEf8lbYLe4SrdZ1n2AGNWvFI/28YAUzJXYm?=
 =?us-ascii?Q?Fp5enF5ZTmeyT5RKT/asNZXoNn4BGY45wKDItZmppMnNUpENunpZeOei+swh?=
 =?us-ascii?Q?vlUmjdlNynd4p8P8+8nPYNMfxM5XHV20AqpnL+i/ATGVaEVK0/zXtiSJYlGF?=
 =?us-ascii?Q?c3xe1K9iKYqJVM4jrqiuPEmgTZoC0mY/HbMHQkqyNDu6eSz4YgRwvr3oahG/?=
 =?us-ascii?Q?ytPdWuFfyI2npYg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:33.0980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fd298ba-ef32-4534-c3c7-08dd1ff13155
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630
Message-ID-Hash: VJK23S667X4FV76D4IRWVKFKAPNM4EB4
X-Message-ID-Hash: VJK23S667X4FV76D4IRWVKFKAPNM4EB4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJK23S667X4FV76D4IRWVKFKAPNM4EB4/>
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

