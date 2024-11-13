Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7169C6E3D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2024 12:53:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D38A1939;
	Wed, 13 Nov 2024 12:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D38A1939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731498824;
	bh=GYFtDNGqs6HV6H7H2fvPBz1mmyMOikx1gETrcYw7CiY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RQCz5dTv58UOFXWM22LaddEn3g0r49Ec7eo6cSxr++qYR+pIV3xw410EbmxMMNOQ8
	 F2iNOFuwIYgOEMBt7ThYSUWte08dYNvkTmA/b/ELrVOA7PNg/azbVAIxWiJCapnWUx
	 mT/gL9jwhVGW0tKyzpGVKQu/PAAynDcdVPXJ1ku4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A197CF805E9; Wed, 13 Nov 2024 12:53:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8271BF805E0;
	Wed, 13 Nov 2024 12:53:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF416F8058C; Wed, 13 Nov 2024 12:52:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::614])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3863F80587
	for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2024 12:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3863F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1bwYiq0m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuV2qFnHkKrkYZKNWaJYTb9eHoLZH7niHSBXkBlbVHv7S9t4pb4rwJoN1YkhP7O3gSvkidwE7wTIiXSTwUPbrelRWISJ2h5RQjYLmvK/od3ZM9+vK9qRev7QN2TYX7HSF/eKMVycAvffMNrJXc/G20faWQeEk8E6Z53/Bnn1nK5TLtxSnvaAgYnVChXCbnbrrXg9d963Q+5Q53k6QVAdnhvsglQtqLD7D6Hndxf83WzTIU7Zxw6F+GSD1x2zPZc7kJ4CHeH/klDSUS1KYjbp1u7yVyraKt2GGtPsSHHJsg1D5yq2Mh68b5gS3NuKKGfKYDmIjyPyHW+MM99ExEHK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cRH4+LUrbB0cbs1aqxQ6NPTJTHF1oY+1b7Gj5fssjM=;
 b=GSzFSU2gJgrdyucvOBa9s/yn5LfjaLgD7c/vXvP2/XxncWRa3fhUhFGkxjvRmSQLhq7xPyfrMJemu7teDX9tDyjEdQTMmekvsuezEoqQgP7UcLGagMTtr5ZO7/jJUd10Jsfog9niNZm4sCm9ZaftX680eyH8hmccevxvOywHXmWE0ab0ZZ+SsHr1AMF8HfvOlEVRa/yOQPcp1eP67/cPC57bra2/WsSvt4UmjPyi3qkqZmLaGVcw7UkwUc712yGja/N2bSAjGfXSN5C0ybJ7RcN+fx3PHCdvF+80t6KTk5StGzatfa8KME7bo4Hl/FCLhDDII1PN6xMscxOhmBdxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cRH4+LUrbB0cbs1aqxQ6NPTJTHF1oY+1b7Gj5fssjM=;
 b=1bwYiq0mm1P1emDX5wzi5GItJJ3JqGq2YDlm/5zg7sO3jg5FFEe6Jq5nYV2MEyi68jexPjZy6WEmgJbpUlm6C81hB1kFxAH9/EjdAD+odpHKgRE8zpNjBFZ6p4g3+cwjXBKIVgf9VAKApdVL7zdoz9te33CnuGUClMDUAhKUZZk=
Received: from BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18)
 by MN6PR12MB8492.namprd12.prod.outlook.com (2603:10b6:208:472::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 11:52:46 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::bd) by BY5PR13CA0005.outlook.office365.com
 (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.15 via Frontend
 Transport; Wed, 13 Nov 2024 11:52:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 11:52:45 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 05:52:41 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/6] ASoC: amd: acp: add rt722 based soundwire machines
Date: Wed, 13 Nov 2024 17:22:18 +0530
Message-ID: <20241113115223.3274868-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
References: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|MN6PR12MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 632addcb-5ed1-417f-5c17-08dd03d9b05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yuYcDKyN4ug/PdptctuEbjyAEDFCWZSKau0JJQ/ICTFjqXl1DjmIPVnioR4o?=
 =?us-ascii?Q?GPjFRwKsOFJ6tplx0sKy2+OtMbB/DqUpHuLEhNFSP0Akm+vDlStGnMKBEbYG?=
 =?us-ascii?Q?x8Lo7WVM2lpdPjvhm6kq1JSyVo5yiDFQx3mKrUjPEpooMiMsqMRwL5n0ya1X?=
 =?us-ascii?Q?qbrVue4JrVdUkXiXIdPj6bqsW5V/x6Rtfu4kc22XgBkRjk2VMKW3WSxi3vyT?=
 =?us-ascii?Q?rQh6iVaNc0dle8tqgn0RJUhS09go+KGNpFPaR7omvT5qKeJy0cthi1zud2Sa?=
 =?us-ascii?Q?MNroVVkJqELdQIEpFuxOcfsBwRIXj6QMfuBlxBctaUNyYHvBggN4IC/71r4+?=
 =?us-ascii?Q?nVr++BxZoJa9TfWAYPmJ8BLu8rOjcBxTOW3n1ybLtin+XsGQVEfyGa76TQ1v?=
 =?us-ascii?Q?q/Tal01KzSz8f37vCZqb5noapmWy9usKMiDfmAXp/Mm1dtuYXn5NDeELjTcf?=
 =?us-ascii?Q?J37zAu95rPrUsKRv2DIErn6fR4c5iZ1dadlKf5j5+NRiUHV+d+c0SqorDZMa?=
 =?us-ascii?Q?PdtjK/QQPOmpktOh1BLiCYj8JHWlrLJwN0Cnur0vigss0nHwoQsEKSz4VtH8?=
 =?us-ascii?Q?3MqVmErt/l3PB5kDbNF975HQWKCsXpLVFvCFsZdFQl4gn2V4NZjK7HLY8Q5V?=
 =?us-ascii?Q?NO/L6U0kFW42yqf1eFZCA3z1ZF/OIA1EtEEhNnHN2ElF1xcTwXYSCB8VGjfE?=
 =?us-ascii?Q?BR+wTqMSbECtNzlung5Fc2w5ezgFvFdd+XtLdYjL/oj6MvS34NQTDU3BSk8F?=
 =?us-ascii?Q?An4C8noQHb+NnGkocIUyBPkt+X3Mm9zK9MstpGgfP7f/6AKV5fcqX816STxr?=
 =?us-ascii?Q?Sq7K1iUXcqwnKSkE4UBgbXHl/XWSoIM4YAXPIxeInIYbhXHvIGVBoC4RG+yR?=
 =?us-ascii?Q?meYsp8niG2m2lfIp+NXvoiRzxnhGeNOJ67gCnLW/oodH6YkjsTAZ3Gf3xn7w?=
 =?us-ascii?Q?1zTTLjHIsvPF6tyJa7h3+fFkGon3gRNrXZyu82K4jmLkHMy7IcCje64NVmQv?=
 =?us-ascii?Q?WwqqE5la7+gUuZbRlmFNSlwAqgeZ15LCKuI8lnw2luVyauxa1AiAhhmjqDer?=
 =?us-ascii?Q?X5AkImG+HNvPnHpBhMWYLpo8hyWQROvs4I9PWX9VEnOZuQIoGxXVWDmqML1b?=
 =?us-ascii?Q?0xkXh3A++7dxt4RbmStaGyFos4Iv3qkVMmaz3xuO/xOs2YRvcca0dvKKSmIG?=
 =?us-ascii?Q?hgh8W3iB37T67M+uOHeWqlG5a/NOLBEcL5QaxdbM+HS8/BPPIqorVDb110Km?=
 =?us-ascii?Q?utOMQO0BAMlOEUGpcCmPqFOE7yOvv9nakwJXs/l3es+xjJ0SsbVF4LJXN2hW?=
 =?us-ascii?Q?w1JzDFXWdjM2/6+f2JMZ9e3oDp/nGuIZgeq+1NJPbW2LqiyWHj3yKeumvNbs?=
 =?us-ascii?Q?HaMcXJvUOxmOmoMVVZQXRP4gFEX1Gf9OgkdNmG3Tksy15bMhxA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 11:52:45.6258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 632addcb-5ed1-417f-5c17-08dd03d9b05a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8492
Message-ID-Hash: OGEPIAXHJHYC5NB5KTIC4RKY7QNGWINZ
X-Message-ID-Hash: OGEPIAXHJHYC5NB5KTIC4RKY7QNGWINZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGEPIAXHJHYC5NB5KTIC4RKY7QNGWINZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add RT722 based soundwire machines for legacy(NO DSP) stack
for acp 6.3 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/amd-acp63-acpi-match.c | 49 ++++++++++++++++++++++++
 sound/soc/amd/mach-config.h              |  1 +
 2 files changed, 50 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp63-acpi-match.c b/sound/soc/amd/acp/amd-acp63-acpi-match.c
index be9367913073..5e506c9e3da6 100644
--- a/sound/soc/amd/acp/amd-acp63-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp63-acpi-match.c
@@ -73,6 +73,45 @@ static const struct snd_soc_acpi_link_adr acp63_4_in_1_sdca[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[] = {
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -85,6 +124,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sof_sdw_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = acp63_rt722_only,
+		.drv_name = "amd_sdw",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sdw_machines);
+
 MODULE_DESCRIPTION("AMD ACP6.3 tables and support for ACPI enumeration");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 1a967da35a0f..a86c76f781f9 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -23,6 +23,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_vangogh_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
 
-- 
2.34.1

