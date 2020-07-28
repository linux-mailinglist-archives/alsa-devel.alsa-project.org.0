Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3906230EDF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCD616DD;
	Tue, 28 Jul 2020 18:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCD616DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595952509;
	bh=rA3Bzxer0lVR73NrgUjMWUxrv7U9bxXd7mAd26yx7fU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JeFM5GDemmdvYyR+Swoux6rt7flKRPXhZaM1Klgitth6KRs+0lhe91OHodaa4+3FD
	 xoWC0qFvVVJFcWjaPFDe4m12N3WflouKG/GBQb5iCLj/2VjcoT+WdKzNgZItIjaUiB
	 IfPAfF+jGpqBxDKHDARQLv35xMF0R7524udMyKmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D46F800AD;
	Tue, 28 Jul 2020 18:06:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E9CF8021E; Tue, 28 Jul 2020 18:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam04on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4c::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7D3AF8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7D3AF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Gs12OxdJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1X7j1DHFm0PcaXCE+5f84DcAxEO1U+/H/K5zQdDLwj6p3ubKzMP3YRf5FuXcguWREL/QO0pETSm63ZwAn0qyQDhOFqXzZXQX4b9W0Ntq2ukoEPCqspVho9qIsRyEN1kTdiLSR+8Tqa7RcGznU7zidQu1RHT2zaG5ZrWTI9vd1EC/bogMqyuv+9HWJiexsgTIIIIdCfrR1EEZtXd6RYo4jJqplT6W8q2+99D27/WRkyn/Jj3kb8OAVqrDcTd9VZ0OiCFZ6zRamJ/LRldxc8sFhRlggJbU68VEjbqHdXJs15+g8xuYixQSsOacFNExOzOxqbhl+2NRAxcPRaAffDNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+Bq6dBJaEwdEvTToJIyqtBNqxHpOJm5uLebIh7lLYw=;
 b=FSVDVEjC359EaVtflMv07FFNhrdNcD7AnPllXtrpV5bdsByDlGntbE2y1F/yX3D9BtnszOJ5XBfynJlCNhBvN4KWxYjtW+aHpjY1jx4Fp52KSCcXlELY/WBP0Lgce6k6achAhk6OzoWnBgYHlu7sGMzqqMkaJU5jR9nRWJdcVgHNzenlPFVsHmlOOOyxqJnoJzH3gPvA+dEC+OiNXYihwPQnybfe7uY+zcXpz82yOxC3zX+DvVYfqsutiStHsReBIQ5uRSmQSoyJxDR3rTHO1qUwE3F3O9PJ7i9ZJS8NIo2w4E4GHosCi7pOuDduQXSyQBncD6rqfQhQeI5rEXpniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+Bq6dBJaEwdEvTToJIyqtBNqxHpOJm5uLebIh7lLYw=;
 b=Gs12OxdJsm6rVa4odil7V3/i0z4W9cd5yojSiQyA8o4V1jr9z4/zTtEe28QemXO6/2Fpg9mI2SmB5mBog/iZhKLLJD7xt3PiY12AX+LtSa5DAkzsaMzmHkbGsElEDPUT1Ey+Gu8pURsF719dOMLPWaW+F9PPFgNp9JyLEJRfvr4=
Received: from BN6PR13CA0014.namprd13.prod.outlook.com (2603:10b6:404:10a::24)
 by CY4PR12MB1318.namprd12.prod.outlook.com (2603:10b6:903:38::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 16:06:29 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::6a) by BN6PR13CA0014.outlook.office365.com
 (2603:10b6:404:10a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Tue, 28 Jul 2020 16:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 16:06:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 28 Jul
 2020 11:06:28 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 28 Jul
 2020 11:06:28 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 28 Jul 2020 11:06:24 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH v2 1/5] ASoC: amd: Renaming snd-soc-card structure and fields
Date: Tue, 28 Jul 2020 21:32:51 +0530
Message-ID: <20200728160255.31020-2-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728160255.31020-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200728160255.31020-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 921352b3-f828-4713-9f68-08d833102fd7
X-MS-TrafficTypeDiagnostic: CY4PR12MB1318:
X-Microsoft-Antispam-PRVS: <CY4PR12MB13183912AB4FE895D3C14230E7730@CY4PR12MB1318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQyCVcV0gMP2xW/JKWDecm0b7E7QQ/XxZjzEUDpTZZKBdrzzCNLwYXpv1as85MaORyfB7stNTkYpxdjenUK+/q+3v+InjM0140ILcyEO/ous1zIOtr57P8enyK9ix7isiFAorN5Eo4L8IfINFg+kuifu7gRhYgJ2mX8hoyy7oE+dr1QY9C1hdJnlq3gUb9hjFGO/rB9ndFIG9SJdTEqCDLws+pdB7bV6gh+N3BpYeHMv9TDGtzPStcxtObTrH36Q7Z6NuVz4Gu3kziowNZAD6rLZxSV+2N4afvcGzL1dHOCRSBnRkI1Vmb+9Lej14uIdCK7YXxJUupUs4X6mT78x8BCOoq+yM0zOatAk8On9s0GuhQYVZEwPk94wpI7rRCvC5418DOx/vqedonfks7VEJ4ehtvb73fCRnKCmESGgLYw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966005)(4326008)(426003)(86362001)(70206006)(26005)(70586007)(7696005)(8676002)(2906002)(186003)(109986005)(478600001)(8936002)(2616005)(82740400003)(81166007)(356005)(316002)(36756003)(47076004)(336012)(1076003)(5660300002)(83380400001)(6666004)(82310400002)(54906003)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 16:06:28.7618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921352b3-f828-4713-9f68-08d833102fd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1318
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Alexander.Deucher@amd.com,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

As in future our machine driver supports multiple codecs
So changing naming convention of snd_soc_card struct and its fields.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 6009e444b858..8b5af064864f 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -290,7 +290,7 @@ static const struct snd_kcontrol_new acp3x_dmic_mux_control =
 	SOC_DAPM_ENUM_EXT("DMIC Select Mux", acp3x_dmic_enum,
 			  dmic_get, dmic_set);
 
-static const struct snd_soc_dapm_widget acp3x_widgets[] = {
+static const struct snd_soc_dapm_widget acp3x_5682_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_SPK("Spk", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -298,7 +298,7 @@ static const struct snd_soc_dapm_widget acp3x_widgets[] = {
 			 &acp3x_dmic_mux_control),
 };
 
-static const struct snd_soc_dapm_route acp3x_audio_route[] = {
+static const struct snd_soc_dapm_route acp3x_5682_audio_route[] = {
 	{"Headphone Jack", NULL, "HPOL"},
 	{"Headphone Jack", NULL, "HPOR"},
 	{"IN1P", NULL, "Headset Mic"},
@@ -307,23 +307,23 @@ static const struct snd_soc_dapm_route acp3x_audio_route[] = {
 	{"Dmic Mux", "Rear Mic", "DMIC"},
 };
 
-static const struct snd_kcontrol_new acp3x_mc_controls[] = {
+static const struct snd_kcontrol_new acp3x_5682_mc_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Spk"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
-static struct snd_soc_card acp3x_card = {
+static struct snd_soc_card acp3x_5682 = {
 	.name = "acp3xalc5682m98357",
 	.owner = THIS_MODULE,
 	.dai_link = acp3x_dai_5682_98357,
 	.num_links = ARRAY_SIZE(acp3x_dai_5682_98357),
-	.dapm_widgets = acp3x_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(acp3x_widgets),
-	.dapm_routes = acp3x_audio_route,
-	.num_dapm_routes = ARRAY_SIZE(acp3x_audio_route),
-	.controls = acp3x_mc_controls,
-	.num_controls = ARRAY_SIZE(acp3x_mc_controls),
+	.dapm_widgets = acp3x_5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp3x_5682_widgets),
+	.dapm_routes = acp3x_5682_audio_route,
+	.num_dapm_routes = ARRAY_SIZE(acp3x_5682_audio_route),
+	.controls = acp3x_5682_mc_controls,
+	.num_controls = ARRAY_SIZE(acp3x_5682_mc_controls),
 };
 
 static int acp3x_probe(struct platform_device *pdev)
@@ -336,8 +336,8 @@ static int acp3x_probe(struct platform_device *pdev)
 	if (!machine)
 		return -ENOMEM;
 
-	card = &acp3x_card;
-	acp3x_card.dev = &pdev->dev;
+	card = &acp3x_5682;
+	acp3x_5682.dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
@@ -348,11 +348,11 @@ static int acp3x_probe(struct platform_device *pdev)
 		return PTR_ERR(dmic_sel);
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, &acp3x_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &acp3x_5682);
 	if (ret) {
 		dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
-				acp3x_card.name, ret);
+				acp3x_5682.name, ret);
 		return ret;
 	}
 	return 0;
-- 
2.17.1

