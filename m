Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E1680A3C
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 10:58:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81E48AE8;
	Mon, 30 Jan 2023 10:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81E48AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675072697;
	bh=HUnb8VP7OqOClwIukcQZjurS25TGzQTDrFiRBdMrvmE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HDk3GjJkIyg6hqWQnoqeYZvuGcXtCmC4q+4HMM10R+uPZZbChA2ub2znYvu21Yf/h
	 vc/EbB/+VMnjeAdr62GL8kThIdNmgK0EtV+7NcztsTrbrs9aDttnN8cE8S1FE2x1dP
	 4dAWGU90DdJUBYuYI5ghL6ZKNlGHivTMQi49B4MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6869F80423;
	Mon, 30 Jan 2023 10:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2201AF8032B; Mon, 30 Jan 2023 10:57:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09A36F800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 10:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09A36F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=U1QBiLN2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z56afOxAUnWYqZC/n/+iHr2Q2LjK4uoWoFHgubiQp72v4Pd38yW/GKzVy4+LkP+A/KWuzeXalr73C6WQs7T1SS3kqYfapgNTEB82InAjWuNLy1HyrOsyJh2VYeYYmkFGa/mZitAUPm9Mo5eW0rDfSuznikIFvKTIrBUQUzlzMTc88dmYPn+tMJ11ZPsV+M3fotc7ZhIHuyjJG0Bxj9z7JNQs4f6y4clN62opIbn8RDAuJn4Ou7d9zrM4WD7yeIBp0x2qke2BJ2Mub0L/jl4kd/jwp4B+UCDn4HGr0MBK1Wz9RGWC9sKQgdweT2zCBan+plPKDY67jGy6vgXQJaht7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+pL1nNYGGJKahWDFh/xZfCitzypFi1nPtU5wLnrpAs=;
 b=b9+xFXK3U8AtWYUdFJUeYNqqCphQJom5z/832TkYlLnGGhVtsey/Y77Pc9QlkXnFlfaFk18CekSn257YqBLWnE4W3HYgyybwlqqKTrWDPKmR+GjLAufY9aJRKixBuvqQ8YZZF+n3SCF8kOPftGKqchzeE6pdhpem748ZCdWxijPVd4BFL5p01GPoDxIfiv3ItwrUPyehu8uavoRmCfMzPgOdveSUe1ZRxYb7dO5PInS9c+ZpAEAuOOjehSQzmYf6d2IIQ4EDI3cbyEUHVZHG5mt7RHCw4qYhmFZ2kk5HFYZ4PIibWnD1d0bRg+3+9JdWx/MdTw0Z/g4m8EApjdt7UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+pL1nNYGGJKahWDFh/xZfCitzypFi1nPtU5wLnrpAs=;
 b=U1QBiLN2gLYiPI7yrpzsv8uBG5sLeTuKsB+b1AIpAR97TjdklGNiWH8ImRgxqd+6Tlfq7xJEfC+cn8TnZ2HHmkn3BjWUGHj+yBf9zKFKtyuN5HRU6zsBKjh/1uUCNFyFCk/aoqZfY8srtpi15pX69D8e/+wT7/fx1PCxlk6bi1U=
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:57:09 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::40) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 09:57:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Mon, 30 Jan 2023 09:57:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 03:57:08 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 30 Jan 2023 03:56:58 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: acp: Refactor bit width calculation
Date: Mon, 30 Jan 2023 15:31:00 +0530
Message-ID: <20230130100104.4076640-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|CH2PR12MB4312:EE_
X-MS-Office365-Filtering-Correlation-Id: d831585c-7c07-48ab-2c8d-08db02a859d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/fYJYxX+/Cw2H3hJfwxsMBWtdsDWMH1B4/L5Ndi4qc4X8c3CzZN2XSCfPDQfX0+N495pZLiaEydmNJaEpqJB2siqTmTJ7EnvNfrpMy5abHSufs4yWoc33r3EDA0cF0PlE29ktpZ2It88HiAimLaevXYAK5+bWNxz8EH4K1pSs0Vk1wcEg5R1au4U4pdQAVk5uuN+a813XxMI3laQtVt9kA/UKcONGapr0Qh2lUg31JbfxR3zWl55jCk2gNVwqd3OHfWlQbpPowsiznNgvvppYsur+kUDILg8IjrOzgmP94GEsoyv/UFQ64V0VV586dak9bbmOUvIjuAIEznRUeosHMNB95M7Sm+fbo7BGsGBRewIzWUvu89bbFDG5lWvXlZ7Bf5BE0J+POiJhmA+EcR/6vs1tETFCPenUBPCvO1/4Dc6USzU95Y2rW0pemCsSzOgfRbuN/6I5DrYe9kDcSbdiTs2BrGIQ1Nr6Q1odf49uw0VS+rfY5S5ADP89hy8nAoTlJgi4HeEnjK42m34COWpaa9TbOe/p7qMIAoAtUcXL9I8+gjQDII9uW+jtMoLxBpkV050dfU14f6WE9SDDqfpfVm3md4ikNhY1AvM5XBBdZ72Tmv6+3hrOilm1zxl7cLDok/J0peuHSEXvqgQHa8X+Dw9ZLv8zraWiA/UoE8+20ULBKY+RIHfXVwyvYIDJUGX0blaYBH57ymoJtxwrg6XdbD4WI9PdbxPaR12BKvz6E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(8936002)(70206006)(70586007)(316002)(8676002)(4326008)(5660300002)(54906003)(110136005)(1076003)(2906002)(41300700001)(7696005)(478600001)(6666004)(186003)(2616005)(26005)(36756003)(336012)(40460700003)(426003)(47076005)(356005)(81166007)(83380400001)(36860700001)(82310400005)(86362001)(40480700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:57:08.6817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d831585c-7c07-48ab-2c8d-08db02a859d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com, Ajit
 Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Refactor bit width calculation using params_physical_width()
instead hard-code values.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index b83ae946b3e4..b4dcce4fbae9 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -186,7 +186,7 @@ static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
 
 	srate = params_rate(params);
 	ch = params_channels(params);
-	format = 8 * params_format(params);
+	format = params_physical_width(params);
 
 	if (drvdata->tdm_mode)
 		fmt = SND_SOC_DAIFMT_DSP_A;
@@ -330,7 +330,7 @@ static int acp_card_rt5682s_hw_params(struct snd_pcm_substream *substream,
 
 	srate = params_rate(params);
 	ch = params_channels(params);
-	format = 8 * params_format(params);
+	format = params_physical_width(params);
 
 	if (drvdata->tdm_mode)
 		fmt = SND_SOC_DAIFMT_DSP_A;
@@ -475,7 +475,7 @@ static int acp_card_rt1019_hw_params(struct snd_pcm_substream *substream,
 
 	srate = params_rate(params);
 	ch = params_channels(params);
-	format = 8 * params_format(params);
+	format = params_physical_width(params);
 
 	if (drvdata->amp_codec_id != RT1019)
 		return -EINVAL;
@@ -616,7 +616,7 @@ static int acp_card_maxim_hw_params(struct snd_pcm_substream *substream,
 
 	srate = params_rate(params);
 	ch = params_channels(params);
-	format = 8 * params_format(params);
+	format = params_physical_width(params);
 
 	if (drvdata->tdm_mode)
 		fmt = SND_SOC_DAIFMT_DSP_A;
-- 
2.25.1

