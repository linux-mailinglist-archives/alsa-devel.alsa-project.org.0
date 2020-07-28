Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B3230EEA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C865C16F3;
	Tue, 28 Jul 2020 18:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C865C16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595952612;
	bh=LBiyfcXEIxECOMwxAeZi5ogxxrXvwdnfybTDtRAlWHg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4qddZa8S0q7oTRvkNUsGeg+hYtURrMpU8ciO1ZeX5GrvYNQ7bkjtV6i99JiMV6IB
	 YTbhO+0qsJwrWyx/rYT+qQtV12p1MJvypLuTggcgJgFZK1x1iy1srYT0zyxrGS8M1Z
	 XV5r8pbBqp5BTqMj7fz/r2pKHklTDLM5DAF7T0U0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02D91F80254;
	Tue, 28 Jul 2020 18:07:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E98F802DC; Tue, 28 Jul 2020 18:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F0D8F802D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0D8F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="XaEKRuRU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+ggUp3nQDWx5ejosCMEz43sYxpaPjUnmlJ0lYysNecPxAMuaGD6ZFQPcjVTb9PvJnSI1iiCwE+feOIMqOy2D9wLufSsz+sg2NRXukgQvaGLgjI78rqgsNA+udsI1enAbbqKTFKoH+Jm5P0MAH0NOIg7If4EPwODvu/Yr2zjcO1LO8C54Sg/lPOWwJuq6kSeFDJ2bsY7iAtCHhsqzf9ESxWaBbnWsV9EgBf81169o2a42k5OfNFapDPaklriPHNybfzMXnGAPw10612hldMQMs4Igyua5vULTGvnUa8gYRwx3di2PndbHXWOiW5x67lLNnst4F/KGDKyqleu13mDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNpz+z3esX/SgjiE1EFqtHCjhQAq/ZVf8laIuRzdBs0=;
 b=O++mVuZDaXTeTCBqH2+Al38xfvKxC5FDvM2J4D1c0WvxWpxVWBAsTiqdh32jQu/M3eCW2mWV0bM5sXPyW1e2MICk9iwqiNbFNn4mP9d08fK2hod1BvKtRSStN4AvGcctclUTg/0XJF12BjR/evHxRYCXFNzkkAizCpkuhSZvOHMebWsJfNk7wno+uUjhDMmw9FBakCi4OsAPDGw+99d8msGhFugr8i7a00PkzxIoEwCnEiCdx318oAkxogriF07lot5/IxOqUgpdxnzBGR4lHT2WWycebYkahthGH+AFH6LFigM5rtGSH55Gdg4pVJzoEDcpVXb8ffPSNSKLSizu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNpz+z3esX/SgjiE1EFqtHCjhQAq/ZVf8laIuRzdBs0=;
 b=XaEKRuRUTju41jcku1iBZgjL7lJ7zDLYWqXqO46twjGJwrCtfCW1t+rjYbX678s9YOQfFKXUX3N5Zjd8i8feCOSG55ZTIIsL/qPu6vopakpJa4UFdcnWhiJikqeISw1PNVj6OLMhydtpUQT/AKr9LWWQNCNr9g4a9kydTK93S4k=
Received: from CO2PR18CA0062.namprd18.prod.outlook.com (2603:10b6:104:2::30)
 by DM6PR12MB3658.namprd12.prod.outlook.com (2603:10b6:5:1c8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 16:07:24 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::ec) by CO2PR18CA0062.outlook.office365.com
 (2603:10b6:104:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 16:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 16:07:24 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 28 Jul
 2020 11:06:56 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 28 Jul 2020 11:06:52 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH v2 5/5] ASoC: amd: Added hw_params support for ALC1015
Date: Tue, 28 Jul 2020 21:32:55 +0530
Message-ID: <20200728160255.31020-6-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728160255.31020-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200728160255.31020-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 455012e3-defe-4900-660c-08d833105107
X-MS-TrafficTypeDiagnostic: DM6PR12MB3658:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3658D8D0722939C189233F38E7730@DM6PR12MB3658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewi8U+P7GD+YnprYU3X2r1YdX0vir/qOCO4Vjq/tMNoG2k/QYP5url3MEJpLFPeUITEey8mL4yvsx6bHMnc3HLQ2vy70E3+J5SoW8/jPiK6sdsUR2K+NO913NOPiLZa7v5cqQ4U4tt2yXYHqeZXMma1OhJOHobdFXpV6ozydqWFiifRS/gQP7n2zOSGAFS3V0edfHNIK+HYV1LZQO4LCcWcrCokb00Ob08duPycwBWl8SA2wwLmos2LpwsylJcvWFVj1eh9juSibtFe0zcIw/bGvC/1USqPlivS0+fTaR3EMzHKZoRpfCxJruhnJooJie0c2PsUKXtWYcR3qTRQKu8sJknNgTdpNrj0XFe3Sq1hNsU4WhHXyfy6ilq3VoQGmsvlkCheGe/p0AttC6wzexbDe2mupIptwG0kDcDzWcfk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(1076003)(356005)(2906002)(82310400002)(8936002)(109986005)(7696005)(81166007)(26005)(82740400003)(5660300002)(186003)(36756003)(4326008)(336012)(8676002)(83380400001)(70586007)(478600001)(86362001)(47076004)(54906003)(426003)(2616005)(316002)(70206006)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 16:07:24.3238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 455012e3-defe-4900-660c-08d833105107
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3658
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

Adding rt1015 hw_params which set Bit-clock ratio,
PLL and appropriate sys clk specific with RTK1015.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index e0c767716b9a..55815fdaa1aa 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -127,6 +127,34 @@ static int rt5682_clk_enable(struct snd_pcm_substream *substream)
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
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (strcmp(codec_dai->component->name, "rt1015-aif"))
+			continue;
+		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+		if (ret < 0)
+			return ret;
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
+						64 * srate, 256 * srate);
+		if (ret < 0)
+			return ret;
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+					256 * srate, SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			return ret;
+	}
+	return ret;
+}
+
 static void rt5682_clk_disable(void)
 {
 	clk_disable_unprepare(rt5682_dai_wclk);
@@ -232,6 +260,7 @@ static const struct snd_soc_ops acp3x_5682_ops = {
 static const struct snd_soc_ops acp3x_max_play_ops = {
 	.startup = acp3x_max_startup,
 	.shutdown = rt5682_shutdown,
+	.hw_params = acp3x_1015_hw_params,
 };
 
 static const struct snd_soc_ops acp3x_ec_cap0_ops = {
-- 
2.17.1

