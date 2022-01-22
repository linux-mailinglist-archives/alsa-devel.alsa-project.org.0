Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A572D496C3A
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jan 2022 12:36:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974F72859;
	Sat, 22 Jan 2022 12:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974F72859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642851370;
	bh=SnqzJVHt67UF7BhlMuv0EhFk/Fjpq0nX7qCnglV2TGc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hacx9Y2EkPhbiinazJKwY3PtRQSobpFoZFB4zm32kj12a0Adg2ee9bLZvJR+pp+Hd
	 QXiTJejcD6znqbhOG7z0gJRKBh1sXfrg00PsgN0OG0Nb4aj7EpESjYH+zKlaUBl7g3
	 695dPCRN+LEpexRCPmwbHVm4jpQJG4y9IyhWx57k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6C6F8007E;
	Sat, 22 Jan 2022 12:35:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F284AF800A7; Sat, 22 Jan 2022 12:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D2AEF800A7
 for <alsa-devel@alsa-project.org>; Sat, 22 Jan 2022 12:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D2AEF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Ip0sgx59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INOIiyBa6mgKigCLAB7ebZlrxPa4Wj3NOOt0WmgwF6Q914ua9zr+/yLrSh7aO1snaHfEEGT3MlQaMZI4AvqlU4nVGt+tE7gH6OZ3oIlpf6QZZ7/FFerE4Do5CAtnzQrUgiwEuwcErFt+NXd8epLZJyI0tIDPcikXNqpaGDv6RUj8zB2IDe5GdRdr58dDPy2LOPj3deto6R7vBNPW0Hzuxd+a0LizneGWGLcSygPTVESRpXS50TV7mZRKa94vSAdZlbnpRWfDkeNjow2Q8qdtJI34sAu5KHJ3lCQt8BeVDgF/KRq5GoViJOmATeTTkTp1L4mWS8hy5etlBjf+TW4tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmMKQrvpvU9dIdqyz1EEFwb9M/GYOYkRyP8qd8LyWM0=;
 b=VK+TyuWLh8VePYizSQa2IESYX6w6vnIr8hGCZ+KIRqTNs/st9b1oyn60KMuRxwvZjgdxflfOjvMG+RSt1dbaC6im7pgTsoSr6yTZ3ZoaKB7OiPV121Pj52ZWiHz+BR7y00N3SM4zxF6dCfCUd2YQ1mX1wy5VCRgD9HGtBv8lp9L2RYE+D/LYjiQl8lAQN52poCVGhPRXKzrpVWfU/kHzJqISlsC8a1CSWzmYRp1rvFbowY6S8IzQPQan8b2LdqjnmxMclMvdMVptGr7+ad/HBoUiL3Q6R9u92lDyq2Nl9Hb80kKiXdAT0JMIn7kQxqlrExnxUyGs+Tf3eF0336hDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmMKQrvpvU9dIdqyz1EEFwb9M/GYOYkRyP8qd8LyWM0=;
 b=Ip0sgx59u9cN5w4XNEwMcMuEJFbn0956JFUlE99gY8BaKRPBh8pbl/+N+Dz6QROpI2rZxsZtzsKpmDUKR7pnzWp/QjEtIadMGtfiXdYSUiTIDYjFE31gDngM1TaUIFLueyOHWmyDwobJnttkP/wwFbqUl5pmJRlKH6xNuuHa+gI=
Received: from DM5PR07CA0104.namprd07.prod.outlook.com (2603:10b6:4:ae::33) by
 BYAPR12MB3271.namprd12.prod.outlook.com (2603:10b6:a03:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Sat, 22 Jan
 2022 11:34:47 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::e1) by DM5PR07CA0104.outlook.office365.com
 (2603:10b6:4:ae::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Sat, 22 Jan 2022 11:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:34:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 22 Jan
 2022 05:34:46 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18
 via Frontend Transport; Sat, 22 Jan 2022 05:34:37 -0600
From: V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: sof-mach: Add support for RT5682S and RT1019 card
Date: Sun, 23 Jan 2022 01:16:59 +0530
Message-ID: <20220122194707.2661026-1-vsujithkumar.reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b1a630-2525-40eb-216d-08d9dd9b3199
X-MS-TrafficTypeDiagnostic: BYAPR12MB3271:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB32714DCC0BBA1EB1FE2DB157925C9@BYAPR12MB3271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tWbeZqgw73jL0iVmiHWIA5RRVil2aTEWcUUq5TrysoKKMj9bgWGMc1JNiQ6M1u6R1j6M7t0PCPIH9RnJ8WDankuu6mR4QQTh53Cx3D0pZ2pATAq7hKRkAuj4rBlVoVqm+H1V0cQ3T3mgoakG9IY7gdEDtZMf7r5EnVvvaOiS7LgoDYQLgIYWtADAgK24LXXpXuGTVymGcGoZ8Arsl+g+homPdFoHxlTvUbZUmqAsrVygs6wrG4joqu+63KGYlS+y1QRKeC2YmoEbH7iSi7JFtuh4pVLnKsNeTGtIipo/fFtAoyF//LPnJNuytgYjaSiA2OBLO/MQSmSwnCN5AUNDS9CStDwoAvHxtUSi0tTxU+CQ2z3p2X3gss7D/BKpKJkUrquxrc/ck1c3sqjuWZ2lD61E1ttuXiYFBIA5cuwqNmJUn5gEAn13CJbsV1w7Q6KbDrtCNJygUbmXxSzXN989YYSUN6XWCQ0QEIIMoqd6UE2IsEVCT2RLN9X1/tV3M272r58tW0/kKZ+BqarI4M1fjXRPcRafckOVjxrhiZGzt8YSCZn2+S+e4vZhC9Py9HNwXC+ZPQQDimD8LKX/WnGDsYfe3ois2OaO/DhIaKWK1Liq1Bq0dt8AmnoVzo9bsyFuZGOL9YDiVNqnPX6MxLuKVvRB4nDN6pO2YmJqRynooVINfAl3z+oRTNy5UnJ7P39SZA4+0ao5T4XELGTlKpr00vgYj1lVmtlXmxaz63tdTyoB5k1VsQ1yPVpbfVMN5TOJQTNSyxOU0Wqfw39dwbWeDtVSKcCS+VfYurhJinUDO6U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700004)(426003)(54906003)(336012)(82310400004)(36860700001)(110136005)(2616005)(7696005)(36756003)(316002)(4326008)(508600001)(40460700003)(8936002)(26005)(8676002)(6666004)(86362001)(47076005)(5660300002)(81166007)(2906002)(70586007)(70206006)(1076003)(356005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:34:47.0643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b1a630-2525-40eb-216d-08d9dd9b3199
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3271
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar
 Reddy <vsujithkumar.reddy@amd.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

We have new platform with rt5682s as a primary codec and rt1019 as an
amp codec. Add machine struct to register sof audio based sound card
on such Chrome machine.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
---
 sound/soc/amd/acp-config.c       |  9 +++++++++
 sound/soc/amd/acp/acp-sof-mach.c | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index c9e1c08364f3..5cbc82eca4c9 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -110,6 +110,15 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
 		.fw_filename = "sof-rn.ri",
 		.sof_tplg_filename = "sof-rn-rt5682-max98360.tplg",
 	},
+	{
+		.id = "RTL5682",
+		.drv_name = "rt5682s-rt1019",
+		.pdata = (void *)&acp_quirk_data,
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+		.fw_filename = "sof-rn.ri",
+		.sof_tplg_filename = "sof-rn-rt5682-rt1019.tplg",
+	},
 	{
 		.id = "AMDI1019",
 		.drv_name = "renoir-dsp",
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 07de46142655..c1d9650fc222 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -40,6 +40,15 @@ static struct acp_card_drvdata sof_rt5682_max_data = {
 	.gpio_spkr_en = EN_SPKR_GPIO_NK,
 };
 
+static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
+	.hs_cpu_id = I2S_SP,
+	.amp_cpu_id = I2S_SP,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = RT5682S,
+	.amp_codec_id = RT1019,
+	.dmic_codec_id = DMIC,
+};
+
 static struct acp_card_drvdata sof_rt5682s_max_data = {
 	.hs_cpu_id = I2S_SP,
 	.amp_cpu_id = I2S_SP,
@@ -126,6 +135,10 @@ static const struct platform_device_id board_ids[] = {
 		.name = "rt5682s-max",
 		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data
 	},
+	{
+		.name = "rt5682s-rt1019",
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data
+	},
 	{ }
 };
 static struct platform_driver acp_asoc_audio = {
@@ -143,4 +156,5 @@ MODULE_DESCRIPTION("ACP chrome SOF audio support");
 MODULE_ALIAS("platform:rt5682-rt1019");
 MODULE_ALIAS("platform:rt5682-max");
 MODULE_ALIAS("platform:rt5682s-max");
+MODULE_ALIAS("platform:rt5682s-rt1019");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

