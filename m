Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167D22F375
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 17:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF1A1696;
	Mon, 27 Jul 2020 17:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF1A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595862414;
	bh=0JaIN/TliAfg4SEK+w/JhQt6QF8uQ7OY9xt+d7UFQcQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Blmkl/WOuuwOfITSTSzJ8ojg5rBR4be5fbcrtUIy0AYaw3fF9PrLTzlOgfOMMUjAU
	 3riqxhSEwYf0XsGdMjCCEqifD/TfmC/2XJsSD+775as3r513URjAjDilnUhCVuE6P9
	 mcQfEUPCen2coU3jm1yKyF+iKWdRJK/bAQpqkROA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F6EDF802DF;
	Mon, 27 Jul 2020 17:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A16F802E9; Mon, 27 Jul 2020 17:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BD0AF802DF
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 17:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BD0AF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="FyG759FY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuLZwE9P6nTSgHoDNzzf550qLKw6bV1l1NC5bwa5mCFnTjXUmnUw4PCwo69TlArh/YwcNpwBFFu5O3whU1wF13b5U/FM1LYi9pZp8RzZCYJgNRSbNP84goV/NYr/P1b0pYQ9+46ZLmV/fFYdvbM91odyfUA7v5KaePvf3W3E+xcQfQJFm97pYQY+9zLQd08D/6MOpPumVm2ULaBsmcU3NPYuwA9owQK/2NEwbY9tMzvTqMJm9zGTMEMXDuDTr25tQJmBxoXgAdxG0c8jo3CPuiKAPVFzOraFmCT6qZlN2ZYLT/UelbGBoKSVbLvvC7r9Ujsce5vl91rEpocnwxekkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z69W1HJHA42WkakLTg/SvY0csaoMM4X2Wb6rlGNQdk=;
 b=njtxD06unOS+0WnIle7gKzBhTXuvW4NdwGeMrvfS9IBVfPMP7ZcORjthLaRXIEwrorohHnyxuJNvb6wqLfJQclnaTspc4fqq4DDAhmwNGhVyRIwvHJeBDfU3syiCI5t+MMLgn2CGrSzYnINFgIqN35cNtFKDBSAT9S+WD9fyFu7Es8sls3NE3NGEzkyxljQLVO5GHEnpvb/EbpHQ2V9w/UHlsSmE65Nw6mSZiAUsnptlXKse/dJAbDTa8T3vFbny0YUfF3bn6JqyBa73uwTNvo1jchgt1NG8JKKPY0gk4Vx2l7DN7T3LJiA43DnfUZOWnzR9PK+Rdj3RgtuALbPORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z69W1HJHA42WkakLTg/SvY0csaoMM4X2Wb6rlGNQdk=;
 b=FyG759FYmjGEXhVszf2ALr4qP/dQYg6Zl+ZoebucvVFdgWMena6fN+T0BD4gAxCDXP080FROMQP3xoAg1kaPvTkjoqmIivoKoo2GfDs2L5jxBFW3Su+H7zH08Mib+HW4dRoCAcGSCNuI6j0+tUaDLAv662+0JxE0mUUTIz8beL0=
Received: from DM3PR12CA0104.namprd12.prod.outlook.com (2603:10b6:0:55::24) by
 DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22; Mon, 27 Jul 2020 15:02:23 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::7c) by DM3PR12CA0104.outlook.office365.com
 (2603:10b6:0:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Mon, 27 Jul 2020 15:02:23 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 15:02:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:02:22 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:02:22 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 27 Jul 2020 10:02:18 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH 6/6] ASoC: amd: Added hw_params support for ALC1015
Date: Mon, 27 Jul 2020 20:28:31 +0530
Message-ID: <20200727145840.25142-6-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95f03d3a-0976-4a52-0704-08d8323e112e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1753:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1753CB3403F580FE5D38E277E7720@DM5PR12MB1753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIRskGAFzvjk/kXP85hgc/ZoNwI/oTx7MrkYCy3hCq2n9rjbRP4D/gN729zf+pGxqA9oHpLyLpf6uCpGzitcGGlyugTdVJvHY25ZXAKPVDkpgr5pumKwCrYPa3exXtcLAxFsxQsfK4s+ceGH5+XnlOKbfFVtU6s7/8kfoAdNklLDUIBp6/EHYEYRoFLx848XU/VDcMOszc9RiCYpQ7hPg7CrRR89GOvE68b0FDCTOSV2ohQJCsRXIvaJIN1rFCqJTbW7s32rNZ9/UJ93d+NZH5UJf26ZDKE/rFy9XDPI3Y3UOqe52qaeHuci2+dr/3HrmMk99DEHVn2pZ75tIAHh5sRm1w2guYw0n1k/6ItvCDTGPZfD+0tBCcEXnmS3XGvdfkvLjChnH69/Q1Z+aZVvsJEP7SANDsn6BLfmsCODczE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966005)(82740400003)(4326008)(316002)(47076004)(478600001)(81166007)(109986005)(2906002)(8936002)(54906003)(2616005)(426003)(8676002)(83380400001)(70586007)(70206006)(6666004)(5660300002)(26005)(186003)(1076003)(7696005)(82310400002)(36756003)(356005)(336012)(86362001)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 15:02:22.9685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f03d3a-0976-4a52-0704-08d8323e112e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1753
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

Adding rt1015 hw_params which set Bit-clock ratio PLL and appropriate
sys clk specific with RTK1015.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 607205cb3a98..bf635ae928ae 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -126,6 +126,44 @@ static int rt5682_clk_enable(struct snd_pcm_substream *substream)
 	return ret;
 }
 
+static int acp3x_1015_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	int srate, i, ret;
+
+	ret = 0;
+	srate = params_rate(params);
+
+	for (i = 0; i < rtd->num_codecs; i++) {
+		if (strcmp(rtd->codec_dais[i]->name, "rt1015-aif"))
+			continue;
+		codec_dai = rtd->codec_dais[i];
+
+		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+		if (ret < 0) {
+			dev_err(codec_dai->dev,
+				"codec_dai bclk ratio not set\n");
+			return ret;
+		}
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
+						64 * srate, 256 * srate);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "codec_dai PLL not set\n");
+			return ret;
+		}
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+					256 * srate, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(codec_dai->dev,
+					"codec_dai sys clock not set\n");
+			return ret;
+		}
+	}
+	return ret;
+}
+
 static void rt5682_clk_disable(void)
 {
 	clk_disable_unprepare(rt5682_dai_wclk);
@@ -231,6 +269,7 @@ static const struct snd_soc_ops acp3x_5682_ops = {
 static const struct snd_soc_ops acp3x_max_play_ops = {
 	.startup = acp3x_max_startup,
 	.shutdown = rt5682_shutdown,
+	.hw_params = acp3x_1015_hw_params,
 };
 
 static const struct snd_soc_ops acp3x_ec_cap0_ops = {
-- 
2.17.1

