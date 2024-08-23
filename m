Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739295C4FE
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 07:48:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6A9882B;
	Fri, 23 Aug 2024 07:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6A9882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724392137;
	bh=P0Bdcst8p2nw/ncrcmKltOQTPCu4aJBAPAaUoE1G/zo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qjt3GwHM8nWV/EezZB0fK86HDL9WflIaeVcRLw7BkbPM7iGAj66mDkt4dKGM62pCL
	 73SvOBlYBUR9lzOo6WkC3NR3QlGHDrpPsjm2llL7W5upya9A98k2yE/y55caqZ2jmC
	 qKeDSwTy8ZwB8BIrWiZTq1XQBVZiK0DraY26aOYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70222F8058C; Fri, 23 Aug 2024 07:48:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB6E6F805B0;
	Fri, 23 Aug 2024 07:48:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79542F80579; Fri, 23 Aug 2024 07:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A09CF80107
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 07:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A09CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kpsJdCL2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqfebEte7wXTdglBZy3lpJysKxvRD9FNUnJ/qY9L37RxxG1hURvfuM1TdYQwC0etskxtM4RUzt21tJ4mjeT0C7UdwFDlnN7c+LJoQ5ycoE5ZhXB9S++juj1IY/r/ACCOHrfiEV1ewh8BblY0F9KewZujnG2igdPWSyb6iHWeIy4/M+6ZqO/7iwQi2MKyp6DRgh4e3ezgSNugOgrI2wr56z48LR8EUQtlu6ZHJjzJFbjkqS7WrnFAHhmkh/lGtIz314NcMcI0oGhzGYym2tE2iGpZgDKhB03pq7weG8rsEB2Ibe800rEq74wlFGJgAjRs5L6V3De2b1LG/cjH4Q0cPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=978e2Me1bEWj0aLvpE+XMR6RZxVvDH4yH0+7IXF5FvA=;
 b=OmjKXpmwskTgMo/iF2l1CHu1cCAMz6dW8/F1X/eSzDJvIDBnveJCUshi9kuOY/nB+rWfjhqhMwEnq74SV3OwszB8Xa8NPbmXJpnfQm8wIoUU5BbokL/luvyon/vPy1xp2sfmbW8NnVTL3TlFRBagv2CroPAZYGBoIHI3EHYjJWvYMKtzYLigm07U14WOLqQ3u564MRp3DXlETclYjfNUhx3QPy8o+gSYE3wWuPdRHL7+2607Lo61WMGGBd4nMVi22aNu8CBnU4HJ+nzS2RHVWZhRCCM+THScStMfu3VKSW5TTELdTPzegVGygjMAuD/3KMOBkMwgASPj8SHaEuwsug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=978e2Me1bEWj0aLvpE+XMR6RZxVvDH4yH0+7IXF5FvA=;
 b=kpsJdCL2iT0gf5uq5AvqQEBOivLNZ4nfwXTjCmmhlLSUzCDHtN8tBbIuFHpnQMUZRsQ/T21WYskT0jnnYzOwk4Wes5qhQLB80gzed4z1wKSPZ0GC+qcHltiZE9TzoDm3fNIWaKiH9TQcplG8qQGoo4FLwTR6n220Qi8+HcTYmzA=
Received: from SN1PR12CA0076.namprd12.prod.outlook.com (2603:10b6:802:20::47)
 by IA1PR12MB8465.namprd12.prod.outlook.com (2603:10b6:208:457::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 05:38:01 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::78) by SN1PR12CA0076.outlook.office365.com
 (2603:10b6:802:20::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 05:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 05:38:01 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 00:37:56 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <cristian.ciocaltea@collabora.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: amd: Add acpi machine id for acp7.0 version based
 platform
Date: Fri, 23 Aug 2024 11:07:38 +0530
Message-ID: <20240823053739.465187-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823053739.465187-1-Vijendar.Mukunda@amd.com>
References: <20240823053739.465187-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|IA1PR12MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c2b256-e178-418a-ec64-08dcc335c09c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c0DYTjI3o//wB8tQHUyNTnA13WcJNggNYD5XhNPPV/yhVVY9d2+XnsMfU2c0?=
 =?us-ascii?Q?k3pSzH1GgIeL6pWCDbtWUPBJUi8XDaQH9wIGEQ3h+VG/bEn9SX9NC1jfGX+g?=
 =?us-ascii?Q?qsWE2X5ujgiIVjkEkGJg6EttDJxs/XDfJxo7s5ZDCg7sHL1Brku4bU3yWtIJ?=
 =?us-ascii?Q?abgng2OeOubjIxlELhnjm3PFtxXHLRIgx2f+JYSH44T5NBYTgMDZZm/C2WJi?=
 =?us-ascii?Q?9kEzEx8caVVW2cOZCy2KhjwWWCz6D+ZFmnkjmKd+vD7TG4OVlj+3RvhWGWF/?=
 =?us-ascii?Q?nc0OnMpmWHktTHS+oE9ywCKA6+zt5HF2rL3p5sL4JCXc3YGxd2WDJXjEF3CQ?=
 =?us-ascii?Q?/M9Iyo+7L4dG1w1CZJjOqfWl9xT96BAiFlnJ8LLgJwpU1D3PdGJ/DF5+QBYE?=
 =?us-ascii?Q?JvBLzfrPwEkUwxhTjBk3DwQfXD78z2dZo6T6ArTKIwIUzIZlqbPlYAZd4NZd?=
 =?us-ascii?Q?bH6NXt0TMt7EyTnfazIf1lwRBWsOpmydPTlI8jym1TdovL91hgav3YSqNvgc?=
 =?us-ascii?Q?uyEbkTgFPXTBDi4w0tGQLJwiyhkdbBBHZFf+/RcHaMuofn9/+DzrWiFtHu6U?=
 =?us-ascii?Q?W10k4i95wWfTAcCzFXx3r9RgTy4ndFZC0jps1WTwpF7oT3EIYO4bFfXkImyW?=
 =?us-ascii?Q?1SLCNT8KhTp5b5050sPuYdMBJDOaDtF3hieWpxVrWmLnNwVi66ezct5GKzoK?=
 =?us-ascii?Q?uteUF7V/xJoKS2E/CMNMnEfLxWfFqVAbHKgW1RQ3JrJTZHjCbHk0WGPK4nNP?=
 =?us-ascii?Q?sCCyXKdUFX/in/nsd8Cx7rXLdeyMkjsFLlflkkgn70NPtf9IKpIR0pjfvZRJ?=
 =?us-ascii?Q?j6z7PVKEshd1msSo9taq2TDZDPfj1/cfmLTIdQ65MkneXnr34rpbMug+cbU2?=
 =?us-ascii?Q?OVziVs85PTuA6ffv1JTuy7c19dDqWtymkZTDDv+nRZasRKSFMIhsSc3YT7yw?=
 =?us-ascii?Q?sNBpdNDdeEQCocMu5cX7DUC3CVMsZ3hiHDlOvQ23FV9WjDKAO7BDvVb1SsgY?=
 =?us-ascii?Q?lRKDTrFYWO+FLAdb+WFXQokmwAqqQGG8OhDwK7PgZYIfA/B41eKyEc5Cglrq?=
 =?us-ascii?Q?pF1POf3xNa/Pb16DvrfPzWzH6iSJ4/hXyt2PFHdM7u0GS3/+2qg5tNd54s4K?=
 =?us-ascii?Q?jem5bVAzCuyZI0s3okd7d4c4f+F95CP6ogs4n26CR+5/vkwftzw8F93c/S1T?=
 =?us-ascii?Q?8+kcmetsb8VqldKjgZhKCzfVZgOI/2ayr5a/zzjYYcKqMp0MW+A4SBi9WgZu?=
 =?us-ascii?Q?kiAkvuAKmeYr5a5tXw4RItM9oRdzS1tWO6a0CMW05DNactZz1glQ1I5mZZQU?=
 =?us-ascii?Q?K9UQ7yg3ReAguKJpcvQ/RXWySLZ+36lAkuMOJVP/c4xWTHPy5/EbnMlrfIx/?=
 =?us-ascii?Q?nApOLLoTZKGz2tRC/rHhRd9UTfM0+3tdQQMTBwPSGX9kLoiU2DQZdJBIja85?=
 =?us-ascii?Q?Hi63NdA45injmDaWCgKtevHtBEzlJRIF?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 05:38:01.1022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 38c2b256-e178-418a-ec64-08dcc335c09c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8465
Message-ID-Hash: 6ANI3GTQWHZPE2HBLW4BRRF2XZ7DNBAB
X-Message-ID-Hash: 6ANI3GTQWHZPE2HBLW4BRRF2XZ7DNBAB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ANI3GTQWHZPE2HBLW4BRRF2XZ7DNBAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acpi machine id for ACP7.0 version based platform and configure
driver data to enable SOF sound card support on newer boards.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/acp-config.c  | 12 ++++++++++++
 sound/soc/amd/mach-config.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 42c2322cd11b..365209ea53f3 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -321,5 +321,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sof_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[] = {
+	{
+		.id = "AMDI1010",
+		.drv_name = "acp70-dsp",
+		.pdata = &acp_quirk_data,
+		.fw_filename = "sof-acp_7_0.ri",
+		.sof_tplg_filename = "sof-acp_7_0.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_machines);
+
 MODULE_DESCRIPTION("AMD ACP Machine Configuration Module");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 32aa8a6931f4..1a967da35a0f 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -24,6 +24,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_vangogh_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.34.1

