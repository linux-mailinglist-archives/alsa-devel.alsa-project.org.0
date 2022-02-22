Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE54BF1F3
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 07:14:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734121746;
	Tue, 22 Feb 2022 07:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734121746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645510484;
	bh=sIFuaD0MMcHHakIpU7+qe131ZsIhPVtTg02H1DySL2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fO4F9u/bkZ4t/qEdmTPR5pH4JcdtwxcaejmD1l3NK19Vh9THisdn1iZxPqQhouoy2
	 mQ4V63BdcE5VJjX59FlXUDC2hpQXJaBU0j8srfHlKVzzU6oOuJUlkbv7nZkxVgLQTv
	 N8XtTpGkpF1fBN5wQoooUuHWpLVvJCQ2f43GQl5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 724ABF80515;
	Tue, 22 Feb 2022 07:13:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF0C8F80511; Tue, 22 Feb 2022 07:13:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54333F804FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 07:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54333F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="MjyZNW7R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8aLc3I1TgUFG33OA3uQZ4HyflI+UjB01ASq7SICMWMZe24N7qqx8v4w39EflNnAkHvH52wT4g5R80eTyjKxYV5t8HFrn+UsN55NcINaWyRNnaV54zF6d6CyVEwD1R5ICSRFpJzivj3D/k9qroTlwqkZzyJZq4OUoWpWXZ9MyFi7pU17ijEfOQKb/HNl/c0cKqWvIAkvHDfbQA/kx00tknK6Y6+DyVIJRutNHmCbsbvW5FwCi/yyMSbFQQZIlmbXlORaitD2Gi69UcKPAalo6aXeAkPMqVQrmPdV22IR5qTf2o2WavwXJR1pK8V9NzDBd+ZkSNu5qwcGqVRPOoOx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0e5Yf/l7KLhk03Q8tqx3awfxFgaYY9GQxqf0QmqNpU=;
 b=eGk9ik8j9HFUZs524dGfRyo5xFrExDsTjaLznqqsdsflA7jjd2x1L54+wpRiGPzcHgEdNxmLJAVj0NpG+bC57Jl7bU/U7hvYqPLaEQ22mUn+o2O/YuOpquImfQ7Mur/j95xmnx/2o13mknx2+ts7OYHtEVGinKXM/9oR0wh+O4ZWUpaYueAXZceepSDZvQxiIKLoHLCY6zE3undhgpQmqLP2K/eekZPj/JhrfKEHRBCWe9aKk832+gwHRwNwasG848BjlnWS/BqD70caRxQUtPQRT9DKdiub9b9kUt4oo8qSOap1f8gOo0zj7m7t8Y60OD5Wm0tZMxKP4xlfut+XrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0e5Yf/l7KLhk03Q8tqx3awfxFgaYY9GQxqf0QmqNpU=;
 b=MjyZNW7R9SqytB91ZHwZNZOp0xkdR0FZ7KAD2l8DjQZt4GftZ+Ttb7YcPcfDk7rUgDQH01C3sRHVlKD5FN2i+TerUGNb6v0YuUyoJINpd7wMJQ3HZ20LBTYV9teheGIof1YdN/8E4d2BhpXzsnZkEkVCcOGKuIGPzFJ+OUDYANA=
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by DM4PR12MB5056.namprd12.prod.outlook.com (2603:10b6:5:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 06:13:07 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::9) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Tue, 22 Feb 2022 06:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 06:13:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 00:13:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 00:13:02 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Feb 2022 00:12:59 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/3] ASoC: amd: acp: Change card name for Guybrush Machine
Date: Tue, 22 Feb 2022 11:41:26 +0530
Message-ID: <20220222061128.719400-2-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
References: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eabe6d7-46b9-45e2-5697-08d9f5ca64a7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5056:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5056253182A56FEB6D4AFEDE823B9@DM4PR12MB5056.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDmgGE5G4LJiEjfi9cHnj0QPDpcN7R6Qa3BgVxOwAbbSV5eibOuw2FI6FyCaEr1yiwcgu3i9GsDSlSAka2JGQJN9IZ2jlaK8Wl9wcCJ2GiCZw1jKC+A9PIivB2hi8wRRR8CkqSygYBjYrOFWYSM+5eE+xd3KmBdt7mytntirnd2cDBzIKksiDrmttq2CeGw0hxhGeTXKYiqBQfegKSO7aSFflYuZU95Z3MNV73LLlgV0cHXZ8av30IFCENFJLScSpOQCyLm+UP2dLy7/b2xn/E+f37q5YPycmr0/DxkApGcyvcSyLcAHnC0SHFar3DJjsoLKpvPcHXt+ct4brXb7J6TLW8P/8Q74lDa2rV52tyyyuK+tpZKuET0XO5tq6Iw7CnrsQ8zp9lf2rZQ2S657ZUZNFcCDdBOEBIVIVPpcMBbf2lQOzJHc7jyd9gZhWgA7tYbYMCpXTAO0ctVaXlEBqsL/IWc2FRVUJl1x6dT/8lFF/qRv3LOUnuNhmNdEdHVsyvngW/NFystj6jws4vKjCH7N1OZZGcaPT4IZ5YLtPj4L6g+CDfnGc4BIeS1AkX5ZWeNmwLJkBqvIITOcq4xqXUh+7FtzJONyoLXtw9w5xgqP4/P7UsF+mSu4zFzEP2nbR6RbzGab1XDUeXqL/MO89cWmV1b3wzP7ns7xNbY5T66MG5bGsiYKoUv54itM7ozbtiLvkA6g5CqQ/0BaG+1gxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(26005)(2616005)(70586007)(70206006)(36860700001)(1076003)(7696005)(6666004)(86362001)(54906003)(110136005)(316002)(82310400004)(508600001)(8676002)(356005)(81166007)(336012)(426003)(83380400001)(4326008)(47076005)(5660300002)(8936002)(2906002)(40460700003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 06:13:06.8648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eabe6d7-46b9-45e2-5697-08d9f5ca64a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5056
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, V sujith
 kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Change sound card name for guybrush machine with rt5682 as primary
codec and rt1019 amp to align with names given in UCM config.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c | 4 ++--
 sound/soc/amd/acp/acp-renoir.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 91140d15691b..50a5aa4d6da9 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -96,7 +96,7 @@ static int acp_asoc_probe(struct platform_device *pdev)
 
 static const struct platform_device_id board_ids[] = {
 	{
-		.name = "rn_rt5682_rt1019",
+		.name = "acp3xalc56821019",
 		.driver_data = (kernel_ulong_t)&rt5682_rt1019_data,
 	},
 	{ }
@@ -113,5 +113,5 @@ module_platform_driver(acp_asoc_audio);
 
 MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
 MODULE_DESCRIPTION("ACP chrome audio support");
-MODULE_ALIAS("platform:rn_rt5682_rt1019");
+MODULE_ALIAS("platform:acp3xalc56821019");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index d06ad5ce7fec..b8dc25a1d31d 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -47,7 +47,7 @@ static struct snd_soc_acpi_codecs amp_rt1019 = {
 static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
 	{
 		.id = "10EC5682",
-		.drv_name = "rn_rt5682_rt1019",
+		.drv_name = "acp3xalc56821019",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &amp_rt1019,
 	},
-- 
2.25.1

