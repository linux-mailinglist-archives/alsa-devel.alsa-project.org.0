Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3502497B7D6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65282DEE;
	Wed, 18 Sep 2024 08:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65282DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640372;
	bh=9FniKUlrjazFq6pmMecSwbmKXIuy6lccmoplzJIApc0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XO6qwM+axRASc28bqSw/PwdmOu4r8p31KuISsUNLTLKsocQ1aRJ58/UmfaEcPr8Rr
	 QaWOIrAQgGqlVyuEcRQIaGzpcIyG0x28hZuXFgzNuxAPxo4tpqobReE6VAW5KsZC9H
	 k/QMlpqbtkvMGVKLfyQzVoGYqrein3YpG1h+EQZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB6FDF805C1; Wed, 18 Sep 2024 08:19:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D00F805B6;
	Wed, 18 Sep 2024 08:19:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B448F80236; Wed, 18 Sep 2024 08:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 039DCF80074
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 039DCF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b5dMQ9VO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYPk0SXgLqXyJZ43mNkMdLpy4g2L8b/mXDD+I8kdOLj0zs//vxgwvKHyQ6uksO6OXpEdOsjALW2UIZm1oQJlFM3HwlX+TWhpMyVPbf5m5x/lPqaB26DuV9L3M1myVRQsFC8JnrJO5A8/UtdQSsbxyCTDOT8p8FRj4sWjkHgwRLvKUScHQapY1ubAnD4+3BNf3msJ8J2LDxCvo7UP3rpUKInWFOpikJHbc0YIzYt/mSWGjoBMNBTgU2jFInSIFdHp9UFygeustvIx6k/2O2/iv6c2azWNEzWLZXyFi57ie87svnyv4XuQtM4VhDdXdkAgjwAF4VP8/Vfok9uvWsn3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eGIJ3IVrjjqLH0Za3OQUHa8UGopheQ4Ktf6ylu5E7Y=;
 b=WVpAY0spRw/ITmhvnECp82KTI8zuwF2zRnF29xD2Fg9N3GnRcdsikawRWKMBbbZ7Kk69Ipa6ytG4PMRQRvSn8OW0xMspYjM9ifzybGQO4NL8P9FYktJanB7V74Sp8uAY5+zTvwBntwSTz5BzjlolFiX9eYuqKbDApj8FCkWxxb3/aFHaXk9V/eXMmBJjSjgD+KGfJG/qsyZbLPlMsdiIvzQGhto2xbJ2RacnQDBSYuadJqJ1f7YziBlgQWGGF31oiB6RNZdS3q6MUWx7LL2atixyV8KvX0u1QIh4O9XOY22snt9FQ3RrGECoHxIBe6vFmsZ3qF0DuQr5lyCqcZ0ogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eGIJ3IVrjjqLH0Za3OQUHa8UGopheQ4Ktf6ylu5E7Y=;
 b=b5dMQ9VOXboq9bYTAQZCGtrnf7rHQnyDN5a2l5MMSkBsHBRHrDOekxqn5+sf6YG1gRFfEgMuDoPLuoUcTQYZSBCKxkWPRdDu0h1mbso1HcjyN7SMVLsV6WnlwpK9rMXelGKrjdxr3Wi7wEwf76pMs8Ifqcgy8gB9A/kr1Vmr+D0=
Received: from PH8PR07CA0029.namprd07.prod.outlook.com (2603:10b6:510:2cf::27)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 06:18:59 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::d8) by PH8PR07CA0029.outlook.office365.com
 (2603:10b6:510:2cf::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 06:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:18:58 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:18:02 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/8] ASoC: amd: acp: use acp_rev for platform specific
 conditional checks
Date: Wed, 18 Sep 2024 11:45:34 +0530
Message-ID: <20240918061540.685579-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
References: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f363442-800d-48a0-9988-08dcd7a9c7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rNJpwRa1Q2E2t7B/v2kdUuXA9mlP3QG1PgJ3z7GYxLsGhb0nZsJaUV3/NzjX?=
 =?us-ascii?Q?iHlFsH5gYNsowoZ+w2bH4o56NY/dLDBCmnCl6LwRSD7ASK2H8YYbsLqXx2m6?=
 =?us-ascii?Q?OOhLRYjJ//QOBxEjhuHrmX7YVlMiVJcD2i47L/uzlldWJf7n0KnmDRTR6yew?=
 =?us-ascii?Q?/HzpZjv+EQx5ypNXTsELgiXEFF+qBlCU76QcD1rJvWN4GdykNnwZn9sOwROw?=
 =?us-ascii?Q?5hgmHYCWIarUvwj+52lA/R3aUorBWRbiujU1sLqwqYVNyfSN0wkESTw+JMT2?=
 =?us-ascii?Q?R2Acrs6UrppOlODDrRf/BKA3TXpXlXxVKwfFrfnR5aCvfAwwpd91KlVwK0gI?=
 =?us-ascii?Q?HNi73yRyhaLWZKh0JFg7EqdTqyHVJaQMnLuXD+XYC/Gx5VvOY/UZDKZZuZAE?=
 =?us-ascii?Q?J+LY0SsKiMNauE9VdV5E3HO6MJ2bknMp8oC5gzzThXBY3kr0h7k9Rgl7pA87?=
 =?us-ascii?Q?g8mmUADBSrBLM/TYXWrDNb3QJ56Y6/E3pWYVbix0nYhriWaq0DTqrEnKcSze?=
 =?us-ascii?Q?UKUxBUrFleJwIW5iXF2JR/c38yWlRS7LJxT4iZs/5Y5rLe1Pl+F9K46zUuWR?=
 =?us-ascii?Q?BuNxDYQz5cThq8pyC85fi2Bj4Z822xU76LLZAblQF6pZ0vUXwyWN+5p4X0z0?=
 =?us-ascii?Q?N01ep82w/7FrCFN6Ebi7+aWwm/0OvnV7UqDfTW50xyLfhWnLkshQM5jsvMNF?=
 =?us-ascii?Q?/j288dJ0k8VuEbU59QA7TOcZmxiZIK+MVf5xtLr1KmBfB1nvkD+rjrz3Rjx4?=
 =?us-ascii?Q?MJivqyWfFxRJovvwsuLo7YRlZL+CikyNUNl19Pw+tAsmMobtcsfw5KeVhxYe?=
 =?us-ascii?Q?ZBM5Ih+VdG2Ipj2viLyFpmptXLCSDuivC2qGt7Qsqh4Z+IZU+BkS045Bzcqf?=
 =?us-ascii?Q?p+GAeVEWGbvGbt9kdXNqTItQ3s10TXw8B6E+ZeGucnvhUgNDroqMH/p4aM5q?=
 =?us-ascii?Q?Vkcutu9Y8Saw43nUx2tyJYsV/Js6W7mtcim6wppg3xakW3ISrPkQRdKuNChm?=
 =?us-ascii?Q?+XrNRYpmJIqhobFflM2Dylj5zdU4XGEYSi4gt4+THtXzvJI38HdA+pwucO0h?=
 =?us-ascii?Q?vkuyZBrrzfWQJaXx+E4amHE3t7nA/FeTcLZpIhOILVouk9N+dFSNmm70xEMU?=
 =?us-ascii?Q?MpmigluPwheXvZXRTZHKgNt1ioo3CyhL5k+eT8heU7HoO7kR87ObGNPXnxoV?=
 =?us-ascii?Q?+VX7Hmrr9nmie6X3Ud1dZXgGmrAjs/ts6VasEeO64uCToTTCvayM321BfdCs?=
 =?us-ascii?Q?wfD00v/mphW5d+O2jMmORrzCfI0ng9G0AJ4w8ffm9RSO2NUeQM75IKPotlRb?=
 =?us-ascii?Q?xZHuZGt9VIN6SL7bcf41m+1hnega90CsqsNpDMfo6okCAXF3mzZKbn1TzBjz?=
 =?us-ascii?Q?TQV4HDQpxY6VU4cfnMpFTF+daf9/9lwp00e76LBZAn/fR5IQUj8WJ6DdLlOy?=
 =?us-ascii?Q?J/7gva+ynq84F16njyPJjZKxLUoIxojl?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:18:58.3848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f363442-800d-48a0-9988-08dcd7a9c7ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979
Message-ID-Hash: BU4AWOZSCYX5VLPGO7NR3JCHT4L6UUTN
X-Message-ID-Hash: BU4AWOZSCYX5VLPGO7NR3JCHT4L6UUTN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BU4AWOZSCYX5VLPGO7NR3JCHT4L6UUTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'acp_rev' as a member in machine driver private data structure to
store acp pci revision id. Replace platform specific conditional checks
by using 'acp_rev' variable.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c |  2 ++
 sound/soc/amd/acp/acp-mach-common.c | 24 ++++++++++++------------
 sound/soc/amd/acp/acp-mach.h        |  3 +++
 sound/soc/amd/acp/acp-sof-mach.c    |  2 ++
 sound/soc/amd/acp/acp_common.h      | 19 +++++++++++++++++++
 5 files changed, 38 insertions(+), 12 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp_common.h

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index d104f7e8fdcd..2a59f7916e15 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -126,6 +126,7 @@ static int acp_asoc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = NULL;
 	struct device *dev = &pdev->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
 	const struct dmi_system_id *dmi_id;
 	struct acp_card_drvdata *acp_card_drvdata;
 	int ret;
@@ -173,6 +174,7 @@ static int acp_asoc_probe(struct platform_device *pdev)
 	if (!strcmp(pdev->name, "acp-pdm-mach"))
 		acp_card_drvdata->platform =  *((int *)dev->platform_data);
 
+	acp_card_drvdata->acp_rev = mach->mach_params.subsystem_rev;
 	dmi_id = dmi_first_match(acp_quirk_table);
 	if (dmi_id && dmi_id->driver_data)
 		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index d4c7a7b79177..2394aa061265 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1471,7 +1471,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 	if (drv_data->amp_cpu_id == I2S_SP) {
 		links[i].name = "acp-amp-codec";
 		links[i].id = AMP_BE_ID;
-		if (drv_data->platform == RENOIR) {
+		if (drv_data->acp_rev == ACP_RN_PCI_ID) {
 			links[i].cpus = sof_sp;
 			links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		} else {
@@ -1647,12 +1647,12 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].id = HEADSET_BE_ID;
 		links[i].cpus = i2s_hs;
 		links[i].num_cpus = ARRAY_SIZE(i2s_hs);
-		switch (drv_data->platform) {
-		case REMBRANDT:
+		switch (drv_data->acp_rev) {
+		case ACP_RMB_PCI_ID:
 			links[i].platforms = platform_rmb_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_rmb_component);
 			break;
-		case ACP63:
+		case ACP63_PCI_ID:
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
 			break;
@@ -1719,12 +1719,12 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].id = AMP_BE_ID;
 		links[i].cpus = i2s_hs;
 		links[i].num_cpus = ARRAY_SIZE(i2s_hs);
-		switch (drv_data->platform) {
-		case REMBRANDT:
+		switch (drv_data->acp_rev) {
+		case ACP_RMB_PCI_ID:
 			links[i].platforms = platform_rmb_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_rmb_component);
 			break;
-		case ACP63:
+		case ACP63_PCI_ID:
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
 			break;
@@ -1770,17 +1770,17 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].cpus = pdm_dmic;
 		links[i].num_cpus = ARRAY_SIZE(pdm_dmic);
-		switch (drv_data->platform) {
-		case REMBRANDT:
+		switch (drv_data->acp_rev) {
+		case ACP_RMB_PCI_ID:
 			links[i].platforms = platform_rmb_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_rmb_component);
 			break;
-		case ACP63:
+		case ACP63_PCI_ID:
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
 			break;
-		case ACP70:
-		case ACP71:
+		case ACP70_PCI_ID:
+		case ACP71_PCI_ID:
 			links[i].platforms = platform_acp70_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp70_component);
 			break;
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 93d9e3886b7e..2b6b8b3e1b94 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -18,6 +18,8 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 
+#include "acp_common.h"
+
 #define TDM_CHANNELS	8
 
 #define ACP_OPS(priv, cb)	((priv)->ops.cb)
@@ -78,6 +80,7 @@ struct acp_card_drvdata {
 	unsigned int dmic_codec_id;
 	unsigned int dai_fmt;
 	unsigned int platform;
+	unsigned int acp_rev;
 	struct clk *wclk;
 	struct clk *bclk;
 	struct acp_mach_ops ops;
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index f36750167fa2..49aadbadb7e1 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -94,6 +94,7 @@ static int acp_sof_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = NULL;
 	struct device *dev = &pdev->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
 	const struct dmi_system_id *dmi_id;
 	struct acp_card_drvdata *acp_card_drvdata;
 	int ret;
@@ -116,6 +117,7 @@ static int acp_sof_probe(struct platform_device *pdev)
 	if (dmi_id && dmi_id->driver_data)
 		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
 
+	acp_card_drvdata->acp_rev = mach->mach_params.subsystem_rev;
 	ret = acp_sofdsp_dai_links_create(card);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to create DAI links\n");
diff --git a/sound/soc/amd/acp/acp_common.h b/sound/soc/amd/acp/acp_common.h
new file mode 100644
index 000000000000..f1ae88013f62
--- /dev/null
+++ b/sound/soc/amd/acp/acp_common.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2024 Advanced Micro Devices, Inc. All rights reserved
+ */
+
+/*
+ * acp_common.h - acp common header file
+ */
+
+#ifndef __ACP_COMMON_H
+#define __ACP_COMMON_H
+
+#define ACP_RN_PCI_ID		0x01
+#define ACP_VANGOGH_PCI_ID	0x50
+#define ACP_RMB_PCI_ID		0x6F
+#define ACP63_PCI_ID		0x63
+#define ACP70_PCI_ID		0x70
+#define ACP71_PCI_ID		0x71
+
+#endif
-- 
2.34.1

