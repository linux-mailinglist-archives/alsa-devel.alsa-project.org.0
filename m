Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A190A741
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A36393A;
	Mon, 17 Jun 2024 09:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A36393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609635;
	bh=KO+Ku7z+fqGnz0xVa0+jFNplbhd2hUhJQDnfmkIycdU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pvuEdZT+2zFVfQlUAGuPyF7l3ed3KfLT6ixz/qFah1NbZO8oXOKObJQuBPefG/Jdm
	 j+6vsWrjKUHLoIFOQHftqtsqjbwdm/8mhDbdG+4bJxtM/VyNlFb1GMo71C4welSBgZ
	 Fg4/rPLMHGd96Lbl7Dh7RvCdcC+uXGstCMQuEuZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08F73F805E4; Mon, 17 Jun 2024 09:33:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5293AF805D6;
	Mon, 17 Jun 2024 09:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F7B0F80266; Mon, 17 Jun 2024 09:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06D7FF801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D7FF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=s2kYjxuT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbAA+T5piRVLufybhnGrhrQbfiOa/6qIEW/xGaRpUGSVJyqjAhVV1yYygc8UAEAidqpv4cpLtTomGQFzAZbdEENQ4/aVa54gB4f4mABIyAYTSuzTZ4nH7a8GLzpuI1e+AlyjRpnmP5JxuBc9y9YwOuPj4p9DnCl2HGGD5zq1Q9PckeuwlQ2dmTthC+IBf9uJa4x1dIbMkY1SA8nfSl/JQxN8QW6icpNPC/r51VoSMg5RVqXA/2VuUe3MsdfywiJESEz/Dqt8xi0ME2eM8GP4Gn3vb0sAL9LtF2Bw870Kgyw7EXy+FL+dXP8y+1GvDPTUg5ryNEylLpmqPt2FL+9Ebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=106nTjmeJtJVVjPCXvnIRUJtPBA8E6jlrKbU1NTEuyQ=;
 b=V3HAP8jEmWaPxzmIiAclewMuhoQaAAXVwVO1Fv5PNS14WKZD3NfSNvfHNgxTLORzm+N71AV9Okaoz3CjHEwmhKrmzS3CbzKiwrrUqD7XDyKPLiHhFkDua2AQmmJUB0qSvjqsYupE1Xoh7Y/PWlf5Q+i88t2vFR/WmZLQ5eR5fFF6gIkGTJ9xZJyT7YO/K8Q3SORfMTkfLWi+bTVYwg/Y/VE7tcryIs1Y8dJSd3V9apxlHsRIUNbDvFS6CR8FlhQwBDDru1E+qW0mP4lWFu7FSMvUGhQTSDr68N08PUlf27a6YT6b4BEAY0UF7YID+pnFI9NHyNFI1Z+bHZuNAXKluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=106nTjmeJtJVVjPCXvnIRUJtPBA8E6jlrKbU1NTEuyQ=;
 b=s2kYjxuTnFmr36W9PgPjxZg7iN9sDxbdam9X8QFDb7Pdv998zfYhhBRWAZyAZHNXzfLdzy1fOtd+/R7DynPEJWLVjnCda020r/WLP+OrKDfj/BhW94b2f2USA9SOiFGWMc6ZAN3u6BtiKMYfYtSnxZhHpKlgRsUvm7AQK4FW9xM=
Received: from DS7PR06CA0034.namprd06.prod.outlook.com (2603:10b6:8:54::18) by
 SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:29:34 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::8b) by DS7PR06CA0034.outlook.office365.com
 (2603:10b6:8:54::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 07:29:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:29:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:29:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:29:32 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:29:28 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Dan Carpenter <dan.carpenter@linaro.org>,
	Yang Li <yang.lee@linux.alibaba.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Marian Postevca <posteuca@mutex.one>, "V Sujith
 Kumar Reddy" <vsujithkumar.reddy@amd.com>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 5/8] ASoC: amd: acp: remove unused variables from acp_resource
 structure
Date: Mon, 17 Jun 2024 12:58:38 +0530
Message-ID: <20240617072844.871468-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
References: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: b7661d68-20d3-424e-1862-08dc8e9f3c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|7416011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hCaoJtV+pRZUZDpz33UnnrQgtZSzJbcGT72saT01z3v6S98JJwcJNVgbnbhU?=
 =?us-ascii?Q?oBASZpZcSiIN9p1J+u2FMvhYShgEXK2t0G/otf2AR+idg0vd+nnJUpD+pLfD?=
 =?us-ascii?Q?n4eXW4s/6A9roQvpfnvX9+vCbN06XmEUilfGrVtvTPPsv37gwEQ4bh8bk/ij?=
 =?us-ascii?Q?XSg5AbQ1+DIoBgw+XYa1LnToIPrMNFKOl02cM1IY6R8lC1M5CAL+e53V1Gge?=
 =?us-ascii?Q?hBKX6CpNJ1xoRVXjaBHKLgXo68q0ayy9HK4HDD5YiMr3BF7kxRBLyodPwSwS?=
 =?us-ascii?Q?Jusyi/iavOn+MtUMaRew2tuqmSPGSeaBidwyToFAhLQWF7BT7wwdVFV8/fB4?=
 =?us-ascii?Q?sGoTNaexccZx0q6jTkrQZukDRujaV7Vq6cC+LPRqQtk3lJYcDzhgAHIlDX6B?=
 =?us-ascii?Q?47aSxRE2pzwv6KTKRHk4EMi9bLptBQloQlREY8AGdhzTEpG21vmXrKwm/Xqq?=
 =?us-ascii?Q?avLvGxXgLsJijRfbDfYB+2JEJA2quuevCQyDCtIIUwxWgJbxP1O4xezvw3y7?=
 =?us-ascii?Q?wzGuFAzAl04xsXFhunYlNewuYPQKZiG1smcCs1Z9jwP96eOyytL0wX5ZqfcM?=
 =?us-ascii?Q?TYvpYCwR96sRzMhGDb87XhbeQVGMm785F44YSvEuWUKzmT/q3UHxRVTHkKZa?=
 =?us-ascii?Q?jD+n40AYduLXhVnGrq8B3E/fBK9z3+9w42/s1fBOBHaRlnFGS3EnRCfveUKb?=
 =?us-ascii?Q?VRbwSHh4xAtVTT7BNn9dLzOAtdZpsFuaALOxD953y1Zf4NM5qx7tFA6betFz?=
 =?us-ascii?Q?HAKzXTtxA9Guyp0NmQ/gZNvM2ucsAWN3QleRyGeg5aqFw9JCDW3INUqIfoKc?=
 =?us-ascii?Q?v/EkHX+80P+dqFvHsb2ZAaQo0o+MSGp8DqtqRODdSDUMUXugrBPq70yJaAUU?=
 =?us-ascii?Q?hf16PIYcsT8D5WIjSUz3V23lDMFfjceFM4kw31qhoWE2rrisQes0pjAOkbfC?=
 =?us-ascii?Q?d5xcOhqhnuo8jwqTRiJt3pmDYxKY1w5CFiCojuOSks8/BRneAQcyr22/JHIz?=
 =?us-ascii?Q?kn2oXAYYzG+m5yJ0OuTl1Za5dovY4ZyJQmY1hcTCbVDDiliuT5tDxQFwhA3G?=
 =?us-ascii?Q?Sl3Ph9++IuKVCj3eXygleYrbGiizNaru5A8616P94QdAtawRTtyAbzxIiAeZ?=
 =?us-ascii?Q?EYz5RixW0NPjCvqpslz+YX8rT0SSksumYslFLpbLPTKvTNkTAx+ylPsNWcpH?=
 =?us-ascii?Q?nolG/pfKe8u+FuFklCalrDCR00L+Z2l3cj7QGSEiM1UoYqY+W8xOXAEF+hB8?=
 =?us-ascii?Q?Fgb9PNSmQSQ3Ap/vCoZ6W7Iynyb9d4G7oeMBZhrw8vPZMEazTGjWCqozXnX/?=
 =?us-ascii?Q?XyvtUjq6zl6HG7c+SsPrsvHDqP2+CSiZyx7hxlXKTThyA6VuEXSdODh65oIe?=
 =?us-ascii?Q?5BLbvUCYkSoF1/HS8MYaurfS8ge6r8SMO0xFHosd4iQLhW9EsA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(7416011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:29:33.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b7661d68-20d3-424e-1862-08dc8e9f3c32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
Message-ID-Hash: 7EMRSBUMJK4BS5Q7CP3QIH76YVHPDQWK
X-Message-ID-Hash: 7EMRSBUMJK4BS5Q7CP3QIH76YVHPDQWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EMRSBUMJK4BS5Q7CP3QIH76YVHPDQWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused variables i2s_pin_cfg_offset and i2s_mode from acp_resource
structure entries.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-rembrandt.c | 2 --
 sound/soc/amd/acp/acp-renoir.c    | 2 --
 sound/soc/amd/acp/acp63.c         | 2 --
 sound/soc/amd/acp/acp70.c         | 2 --
 sound/soc/amd/acp/amd.h           | 2 --
 5 files changed, 10 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 158f819f8da4..953a793de9a3 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -39,8 +39,6 @@ static struct acp_resource rsrc = {
 	.irqp_used = 1,
 	.soc_mclk = true,
 	.irq_reg_offset = 0x1a00,
-	.i2s_pin_cfg_offset = 0x1440,
-	.i2s_mode = 0x0a,
 	.scratch_reg_offset = 0x12800,
 	.sram_pte_offset = 0x03802800,
 };
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index b0e181c9a733..db835ed7c208 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -32,8 +32,6 @@ static struct acp_resource rsrc = {
 	.no_of_ctrls = 1,
 	.irqp_used = 0,
 	.irq_reg_offset = 0x1800,
-	.i2s_pin_cfg_offset = 0x1400,
-	.i2s_mode = 0x04,
 	.scratch_reg_offset = 0x12800,
 	.sram_pte_offset = 0x02052800,
 };
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 4d342441a650..f223311b6740 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -55,8 +55,6 @@ static struct acp_resource rsrc = {
 	.irqp_used = 1,
 	.soc_mclk = true,
 	.irq_reg_offset = 0x1a00,
-	.i2s_pin_cfg_offset = 0x1440,
-	.i2s_mode = 0x0a,
 	.scratch_reg_offset = 0x12800,
 	.sram_pte_offset = 0x03802800,
 };
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 0d7cdd4017e5..a2cbdcca4313 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -31,8 +31,6 @@ static struct acp_resource rsrc = {
 	.irqp_used = 1,
 	.soc_mclk = true,
 	.irq_reg_offset = 0x1a00,
-	.i2s_pin_cfg_offset = 0x1440,
-	.i2s_mode = 0x0a,
 	.scratch_reg_offset = 0x12800,
 	.sram_pte_offset = 0x03802800,
 };
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index d75b4eb34de8..cbf9ca26f3ee 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -162,8 +162,6 @@ struct acp_resource {
 	int irqp_used;
 	bool soc_mclk;
 	u32 irq_reg_offset;
-	u32 i2s_pin_cfg_offset;
-	int i2s_mode;
 	u64 scratch_reg_offset;
 	u64 sram_pte_offset;
 };
-- 
2.34.1

