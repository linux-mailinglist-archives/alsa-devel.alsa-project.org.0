Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E477D0880
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 08:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D32832;
	Fri, 20 Oct 2023 08:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D32832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697783501;
	bh=aB5NZOpgDzkFFQrYREsHk3KrbCa64lemn+lAVs6U5CE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UUNEdZbG4K7erywqBo7+2fImT9M1OVGbLLBcUtaho2OgHglckUco8sxEMiy2d6xWD
	 n/2I17meKPsc5Ro8aPczQ/fpmYDwecshk/LLxEjzMZUNvaYIA1dgvTs3+PEVQhOPi3
	 SCT2lxXlH8G1CkgpLgbKhyeJy0KGMtOqDP3Aq7xU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6BDDF80536; Fri, 20 Oct 2023 08:30:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 581C7F8024E;
	Fri, 20 Oct 2023 08:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B47F9F8027B; Fri, 20 Oct 2023 08:29:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21571F80236
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 08:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21571F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wgewHxJ8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWgQiMymGkWLJlO5epx1sdHuVcn0s2IwQyhif+9VvUfJDwyASepvmzCu2EzdbYQBvjmU+niaRpg8/HwX8OUAskJKqTUzw7uV1NBK/8sSTcxom5K89+uBIc3mm1/0xjknp1WahvzhqvuipKthQpU31sMvGqwRPSB5zHXgiOiizV9BWgOvefn4QYSq4ptAdQFUb+emyTt6xa3pCaz9psMUM2s7VvhakcLntTd0yThaoJLFCYiTFgnmL+P5QihC0lEm1R5Xf4abMyFiO2hpx2VmKC7xa7PGIdUn8op4xR2kt5ZxS7r7ClTNG/htvuaEnF0yobpVRktpu43qZhHuQMqhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcB01EX+Kne+GnrqpXoo7+eKMlQeN5wi7mDAQJKfoJg=;
 b=S/OXSlIrYvymLsUvlVrDg7aH91WoO0CZ+IJ71cn2/t68y5kPG0Eprnh3jTEG9jIPXTjJfhHUhae22135UMvEIIaXEttHv3hYm4vllNlm9w+d/fisarL24kaSOyCzlyVr+iZlGzxOoQBlITDciBkIG5B60GXR50WYEWJFYOQBmzhQrkiAwZnlcb9BWEwXskMv5uMK2juQlRggn+nknRdTE0N4NbzS/6cVeyEZC+zP0Pmw6EFC1F9IXc51E4QO7mE+/WrU63QAupsinLsyRs/RD3tCbUX2tv5+6/2IwuKHcy73PY0sh3/Mx4/Zh86ctc935IaLVc3qrY5fkg/APmZlUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcB01EX+Kne+GnrqpXoo7+eKMlQeN5wi7mDAQJKfoJg=;
 b=wgewHxJ8ZBW8T+1zVa4l+2liPqOVHk+sQagRTrmuOwuwdeFEkEJqTrMF2ArOGlOn+xuPkyeD9+XYkNGQi8XDf4lsbBxK5faspSfpGbLnHxHEletBcO1acj9oawaCOcnsT7HsGNYzk4VMaCbNdsFMbv7vq4eyhR7Jwk/9h56xYPI=
Received: from DS7PR03CA0270.namprd03.prod.outlook.com (2603:10b6:5:3b3::35)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 06:28:32 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::6f) by DS7PR03CA0270.outlook.office365.com
 (2603:10b6:5:3b3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Fri, 20 Oct 2023 06:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 06:28:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 01:28:31 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Fri, 20 Oct 2023 01:28:28 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Marian Postevca <posteuca@mutex.one>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] ASoC: amd: Add acpi machine id for acp6.3 version based
 platform
Date: Fri, 20 Oct 2023 11:58:11 +0530
Message-ID: <20231020062822.3913760-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: b42f84be-544e-45df-d596-08dbd135c7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4dX/tPwY6tjvPzUu1uFmv1OlaF79OMljws/fhFjllJWfWxWkmfnsFaM6JK7v2bFoZ0OQkoq2d2OyhCo8KSs0bXrdc0RZ40Vn7wTvqfIK+Zh44pBnoL3noDyIHGeccAOfHm3v4RnB0c7tVLfaaQzRbShRth8PcJdqTnyvGnh6ByL+Bf29tY3tnr1zoADIXTmWAyTA3gQvBSxfgqe8uY0KDNkRTQ1LV8CHBCu9OW6cCmoyJpnyhEfdVLMkG0gLM0P5G0iVZGzOuYotbnphMgJ12nCuNMRdnJwZgLAqNGN40TR9+YOv4v5HPH6urZ7qPfy0rkzUFzdoOKrvGlturvXZK7Th6RPddcIVlyr01rVp+bIM6B0hOsTeUC0FJYeRVfbfSrFrKO8f+3688u+zXulWxZxeCm9TcBwHfdX4qp32yfuPNWMLVH8s7bhpjrfOW+BncVSGADextvp4iCd1B+WMDF66o4x4uTMO3SYCjYiDZYeC6Vz33bIE1+xwX/NmTKjh1bPrfj+zSCFGegZIX2wmtreuY/t508lLuLlSSOXFrj7m49yZKWUHekl82jZDQutgpCC0q2QTxGonTWZBXE3ANd0cBy4qDoZmtO+jbt/hinmA2tsyPcVk+vKaklmBiYPziwXcQ+BH+6ihOIo7fT6FTaypJeUvbc/eAJLDiSTGtPvmiBpU++X98bc0GCR1/Nw8zYfXSnstdiP0ygFgrtmMEWYW4yDAHiER2nrMA0NPIOgXiVHRc4FGRNO3wROeUYidXCBwKpR4Ewy8xuC+Y6/Dzw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(4326008)(8936002)(40480700001)(47076005)(478600001)(36756003)(356005)(82740400003)(26005)(2616005)(1076003)(81166007)(336012)(426003)(70586007)(54906003)(5660300002)(86362001)(316002)(6666004)(6916009)(41300700001)(70206006)(7696005)(8676002)(2906002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:28:31.9688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b42f84be-544e-45df-d596-08dbd135c7ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410
Message-ID-Hash: ZV6HFKUKRJAJRYI6T5S6IKCJ6VNYRJDO
X-Message-ID-Hash: ZV6HFKUKRJAJRYI6T5S6IKCJ6VNYRJDO
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZV6HFKUKRJAJRYI6T5S6IKCJ6VNYRJDO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acpi machine id for ACP6.3 version based platform and configure
driver data to enable SOF sound card support on newer boards.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-config.c  | 12 ++++++++++++
 sound/soc/amd/mach-config.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index a58d646d28f6..20cee7104c2b 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -263,4 +263,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_rmb_sof_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[] = {
+	{
+		.id = "AMDI1019",
+		.drv_name = "acp63-dsp",
+		.pdata = &acp_quirk_data,
+		.fw_filename = "sof-acp_6_3.ri",
+		.sof_tplg_filename = "sof-acp_6_3.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sof_machines);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index d392e6d6e6e1..ce5d77639086 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -21,6 +21,7 @@
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_vangogh_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.34.1

