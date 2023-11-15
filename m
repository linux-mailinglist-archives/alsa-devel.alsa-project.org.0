Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71E7E9C39
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 13:35:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BDC282A;
	Mon, 13 Nov 2023 13:34:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BDC282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699878915;
	bh=S8FROjV+qGmS5HDqUIhTuLPvK40BG6qVYS2T3ZnveS0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T5blszcluttssHHPMhpVVIomEa7VVhU3EfS9SMuL3/VRfdJC824q0kEvO54GSMfAx
	 mwZhWZik2HYquyKVyCza1aNFsORyxJo3R6jm00PObyztoVOCP7L0mERwSyTUIgYUFx
	 xRWugJslJR0Zp7b6yE5LBVpif6O0jl2Ou+/sy4ZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF10AF80549; Mon, 13 Nov 2023 13:34:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A39FF8016E;
	Mon, 13 Nov 2023 13:34:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E1B5F8022B; Mon, 13 Nov 2023 13:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4908F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 13:34:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4908F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1CbxlZn8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOCNnfJT3wwXeJ5jTTXqcOnqN8+qwzWtwv9Uhqq4Uh+2wOXeK47PRc2Bn/+ALu4EsHyanItOT+D+jUCclMBgN0PBbFCe/dc0us6FeLxxRKVlkxwK70eNPOlRI3gXH8w/Y/6q8kW9eBDq9OgemJQKl86eniY7Z4zL8xGGBuogeSS9KwFs1t+WWKTgxstGIsiN01lI9+AcjkUrXDBhusvIuzIUCXtfzYkHiV2MOo/zzj+p/EGkEFNC7iRdJCra1+VYZIFZ4ANIpjAq5b9941Vj/xeD3yJn0jfcnlB5AmtLNd4GEDuBl0BtPQjzZ/QpAcFDCOZi/V9e1HJuFPncU6Flcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5hRIGqPdqlVKEOaQgoebe4Lrt6607jyIbcOqCqoZ2w=;
 b=OUZkdho+dKJ2xQJR4UNasonc68q+YWGxgwpHsec6dQ/bCh8twmUKqhk2L8/r6dwK1OVWT6B1oYV70iQs/V3LFJPoRwz1WKNpV0Kn1NClSwFqzCSwSlAVTtJWBeSVpWCwa5l6l5KrO/hLNdGowcUhZYFk8v1nSO3/IRuqiQfe1p0y+ebPp3JlOcr/b7X8ekHMU/gbsrC1QcEznNI3XZuZr54oyQufIBPjgggKiF7Aw8lj9UY3b7nhIEUSitdS4k5JEJMJIp1O4kPWT8pPU0om6o/WBmVhCNVKUJXCqW4BkuclxmGg+HKIb+Di99+VMFaY+qBf59dc1b0ZnkJNyZ5/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5hRIGqPdqlVKEOaQgoebe4Lrt6607jyIbcOqCqoZ2w=;
 b=1CbxlZn8tIcyQBxOC4hct5oHIeWIdVpcm+BXwxaAbuP0c53cXW+ZMuRJwX8RdLqYHl7qx0eIPwQ/Vxi36M8heMsD0VEqo2alNIUhO6YxJqyonSxPhxWjJxoC75uU2olUVt3t7zS7uYinRPONVWr+3IuTIQlg1RzkrPkA+Hm6hKw=
Received: from PH8PR05CA0006.namprd05.prod.outlook.com (2603:10b6:510:2cc::6)
 by BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 12:33:56 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::a6) by PH8PR05CA0006.outlook.office365.com
 (2603:10b6:510:2cc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17 via Frontend
 Transport; Mon, 13 Nov 2023 12:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 12:33:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 06:33:55 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 06:33:55 -0600
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 06:33:51 -0600
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<richgong@amd.com>, <posteuca@mutex.one>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann
	<arnd@arndb.de>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, open
 list <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/2] ASoC: amd: acp: add Kconfig options for acp7.0 based
 platform driver
Date: Mon, 13 Nov 2023 18:03:42 +0530
Message-ID: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|BN9PR12MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: 450c71fd-5d67-4519-49ae-08dbe444cd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	08VlRfZJVz4V3iqCtZSd6r9I0EinJt5LoOkIRI6lAzX2Tm4Byt0CtyxRrxkSIp03q4s1FxxSqJof/lj6i7cDUKlhMBCmTyv/zIGNE4VG4f281V5DEnyMLLhGqMzhNK6GgWVrZroPrLcMKAi+NuMXXqG+dqo2Iz0+G2x2jwzhNiWoN5InUULUS4YYLubnKV9bbNJxhHzEyR+HEeYvYxaY0r6hhiWixZxwpfYP5GZw004qeETHAbj3zuN+shV8RYw685es2mddH0jwxdwnI8oqVzHJH+DyIVYIPPbVOYo+5Fe+zU7e/wxFQA01H8a6V6zt+GRSgQNyRqx5ODmbCUrPvmOt2QZVuBfZjVRz9GxcluJyq2udOg8c5hhycOxZbQHodMWvQgYoNB99B0SMyJ9xy7wfVh/Onr2vgEuMK/2176PwB7PePfI4x3p7z4Uk+xKVT0xHIgGhRVUMrQp5kgGkJnYOZ9rlqpXiYtLbyuRQeVUL1CXaJsEflJDEpXLDZ1eKvfsEyAlJxrgcuZDppGMoJeaSu8SaqjB3Fm5yXahYnBfS2XG0wd43OUSDEsdsfum3O3Wj5ZWrqUgD4GhXBNAXWQa719oRP71TuB/HpUCBEpTjzoENusPvroa+UVMTd9IrPsEw7JPrMFBjWPLZ7T3GxGnHneStGa3Wb6xE5GW4ul6pfbuv5MenSVwPHvVVmTc/p6xkZBmtSbuFMkKlDfiyeqFRpHUe2z5ZIHpxGahHqK00kLwyEBOWgExXeOs4pGTtFFtS8CjJvZFh8f3Tp6zrvQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(1800799009)(82310400011)(186009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(81166007)(36756003)(36860700001)(356005)(426003)(336012)(83380400001)(41300700001)(40460700003)(47076005)(86362001)(8676002)(8936002)(4326008)(1076003)(40480700001)(110136005)(2616005)(5660300002)(7696005)(6666004)(316002)(82740400003)(26005)(2906002)(70206006)(54906003)(478600001)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 12:33:55.9929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 450c71fd-5d67-4519-49ae-08dbe444cd8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5356
Message-ID-Hash: RTF6GO2BB3B5WOY3XMSQPPCDE6OA2SMY
X-Message-ID-Hash: RTF6GO2BB3B5WOY3XMSQPPCDE6OA2SMY
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTF6GO2BB3B5WOY3XMSQPPCDE6OA2SMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP7.0 based platform legacy drivers can be built by selecting
necessary kernel config option. This patch enables build support
of the same.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
changes since v1:
     - added missing commit message.

 sound/soc/amd/acp/Kconfig  | 12 ++++++++++++
 sound/soc/amd/acp/Makefile |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 5fb322212938..c8ac0027f741 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -73,6 +73,18 @@ config SND_AMD_ASOC_ACP63
 	  Say Y if you want to enable AUDIO on ACP6.3
 	  If unsure select "N".
 
+config SND_AMD_ASOC_ACP70
+	tristate "AMD ACP ASOC Acp7.0 Support"
+	depends on X86 && PCI
+	depends on ACPI
+	select SND_SOC_AMD_ACP_PCM
+	select SND_SOC_AMD_ACP_I2S
+	select SND_SOC_AMD_ACP_PDM
+	help
+	This option enables Acp7.0 PDM support on AMD platform.
+	Say Y if you want to enable AUDIO on ACP7.0
+          If unsure select "N".
+
 config SND_SOC_AMD_MACH_COMMON
 	tristate
 	depends on X86 && PCI && I2C
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index dd85700f1c5f..ff5f7893b81e 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -15,6 +15,7 @@ snd-acp-pci-objs     := acp-pci.o
 snd-acp-renoir-objs     := acp-renoir.o
 snd-acp-rembrandt-objs  := acp-rembrandt.o
 snd-acp63-objs := acp63.o
+snd-acp70-objs := acp70.o
 
 #machine specific driver
 snd-acp-mach-objs     := acp-mach-common.o
@@ -30,6 +31,7 @@ obj-$(CONFIG_SND_SOC_AMD_ACP_PCI) += snd-acp-pci.o
 obj-$(CONFIG_SND_AMD_ASOC_RENOIR) += snd-acp-renoir.o
 obj-$(CONFIG_SND_AMD_ASOC_REMBRANDT) += snd-acp-rembrandt.o
 obj-$(CONFIG_SND_AMD_ASOC_ACP63) += snd-acp63.o
+obj-$(CONFIG_SND_AMD_ASOC_ACP70) += snd-acp70.o
 
 obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
 obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
-- 
2.25.1

