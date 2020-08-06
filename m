Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B8723D93A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 12:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76AD1675;
	Thu,  6 Aug 2020 12:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76AD1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596709349;
	bh=gbRXDJElZZBqAwDqQ2RCDiEc7IUh/rjVOdxT9bUAUxg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o6XzLuySXKQFd7jCWvoOWFMzT2H6GvTvpr5Z6cNRIgz5TQ/0wUXOEqcWF3HO3FRB2
	 bU1NuUJmUQu4QfBVb3HwNUpR2OWtAn2+ws+6BVbr4AdIURAHROzJw0INLoU7l8G+zg
	 O91cblnUlUzV0Kv8Rrq7kgaupQiUTwmAm3PX4beY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA156F80159;
	Thu,  6 Aug 2020 12:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64E2AF80159; Thu,  6 Aug 2020 12:20:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E02F800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 12:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E02F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Zxy6kdsh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTae+7Sj+AGN2g7GR/qRZcWL54z1zSWWhgrNawmOJQvR9eZldE3Dxvji9fUC5hmX4nPxVjFUrDVqbQKv6HJ8IVPdjWLrtvwgxkdI6k5CaEZ/8ohrFHx/p1sE+TBkjUVKnyo/9/zm/YJg+bJTC0lQxtBPfD2BPFUoEgOPYwZaIhyKBFHN9MWKNgXGfzOgHhJCl7RjVjpGCgmSrFVoqFr5hWlSYMph6E9wCU5Zv5KBCOG4UPRWnqImYc8XqoxZoNcrlv71gk7fuuYYIxTf4xxvMzVgLyIPscDsZXdFtuF9FDx9Urza2dq3hnY7TIhgpn95R+Eu01nNfF7ZaLsvKLHrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VyfaXDNa7Hma5eJuOzSgefADULYJJJwfduBrclNEME=;
 b=nUOfpRpKRsqIW5BgvYIxqjsae0pCJ6/ilhVVus2p2gA/MD3xvQxXS906Nvcx5J9OzZHngaWT5zyOGZBNh/F0FYc3ipcDDPNnZXcXE7pcuCAYoDLrklGiCXh+expPUVnJ+bclMApLzFoaVivV6l39oVX4mkYXDIMUHvFtP8UV/9ojm0511gzxXl23i8b8Xuv9nrWgG7Q5H50AoKhcZcQXZSdclG5TNRvC3Ume3mgF7xYLX1A5x6EQ1brMEzSEGIbAhXPAYnkgXrDtThi42DlQ8z/863fC+jqQgmIxikQZFR31npZWs82Bd7hGl3CQonvj0GFqxyosn4MBPTOqLax2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VyfaXDNa7Hma5eJuOzSgefADULYJJJwfduBrclNEME=;
 b=Zxy6kdshfws6qOdKz0Y+bOyd/1GYy9A7hyIY6FxIANP2060GM/McppGaJGlGEe/+YpE20cmvRm6lYcOIlPhjOal4fXMpnGf2YusY/+5ZgAmXGOE1McT0JhvffLWBSlWJjiP1VGGIrdMMQdiO1OSP4wGFAi6KtmcKc0OjPP+pDyA=
Received: from BN6PR13CA0061.namprd13.prod.outlook.com (2603:10b6:404:11::23)
 by BN6PR1201MB2499.namprd12.prod.outlook.com (2603:10b6:404:b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Thu, 6 Aug
 2020 10:20:20 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::90) by BN6PR13CA0061.outlook.office365.com
 (2603:10b6:404:11::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.13 via Frontend
 Transport; Thu, 6 Aug 2020 10:20:20 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3261.16 via Frontend Transport; Thu, 6 Aug 2020 10:20:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Aug 2020
 05:20:20 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Aug 2020
 05:20:20 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 6 Aug 2020 05:20:13 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name
Date: Thu, 6 Aug 2020 15:44:12 +0530
Message-ID: <20200806101451.7918-1-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 807df74e-d080-4a60-8765-08d839f252c5
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2499:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2499B00BD57B72053857CA97E7480@BN6PR1201MB2499.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNEE8EYIWloaO8Xb37+TP9MAuhKuO/ACUM1ZCpPa9WJpyEmv5ijgCq3DuSq/96OouIIdZR84TrXc/JD5pFp6Kn3fRPK3yom/H+lEeTBWs4W1O/68BJ93kuOstfCv750u0Ie+ace9+JqbJiZdHDCPxflRuJoFfnG81TOEUc/mSxSKqSjOJojjWa6P+E8YJKIvhOzmfe4mu0sXZdRA+mkE8DZiQJ8s+a1dQa52a8sraLt8U+009bdUVwuCvaMbhyAt5XMlUm2cmXbNwyOUZ1jm25yuOfdXocGNfr8oHKDfTntxtYNkvmtzEwICeRkOi3+b6HylRJSoo7fpTQOSAcQCgss5UAYBkHSJxn941P0UHC6W3VmkmscxUx0y/0jykNiH0K31+07Pu3w8lsYF+yR4r24JSHHMcTKDnb3TIUPmdIM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(82310400002)(356005)(47076004)(186003)(7696005)(81166007)(336012)(26005)(2906002)(86362001)(478600001)(83380400001)(82740400003)(109986005)(426003)(54906003)(1076003)(316002)(8936002)(5660300002)(70206006)(70586007)(4744005)(4326008)(8676002)(2616005)(36756003)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 10:20:20.6031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 807df74e-d080-4a60-8765-08d839f252c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2499
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam
 Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
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

Replacing string compare with codec_dai->name instead of comparing with
codec_dai->component->name in hw_params.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 55815fdaa1aa..406526e79af3 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -138,7 +138,7 @@ static int acp3x_1015_hw_params(struct snd_pcm_substream *substream,
 	srate = params_rate(params);
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		if (strcmp(codec_dai->component->name, "rt1015-aif"))
+		if (strcmp(codec_dai->name, "rt1015-aif"))
 			continue;
 		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
 		if (ret < 0)
-- 
2.17.1

