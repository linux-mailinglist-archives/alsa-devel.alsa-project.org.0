Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F84E33C44D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:34:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74417189F;
	Mon, 15 Mar 2021 18:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74417189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615829644;
	bh=pHbsVA9BjN//w1mLrXtOg/ib/bdWbmCE8eIVIac9sAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2S5HD4+DPSoTDVd6sT0B1l84v32+2eIU0Okj+gOovIv7iHyOwgPOK+ryPpMCcq9w
	 EO0jOjZ/RcF2hfmgyqJEKFtwCV/CAO9kgfZc74xpvIdK9yQI607BgZWhG/07LyC0QW
	 lwLjebcGWWUs7gESBLIDmjeCvpPkNP8a13C89OiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2359F801F7;
	Mon, 15 Mar 2021 18:32:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8470F8010E; Mon, 15 Mar 2021 18:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22B64F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 18:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22B64F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="rkqQi/iA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtzDGzHu0QHmehjpZMVvfPKLSDIZfwSmqmQNzznSwufiP7MJ/bmQDjuFMilrKH7zEJpdW89eLfeIV1I8UxEoLseX+yyP0v/ynHVMs3zJKoaBqI0qvW7qalw/hVf0qprr8Y/eWH/vGX0OndY+aqtzvaESFftl/9UOaVJ2P2L2a97NZbRxHSvJ0iiHXQ7Iiai0VVC0V37FmxOO8rSPvUWY4T4LU/IvGP//GNZHKiN2JNXtLDuOgAnAfMXyFeBB2NyHAiUt2QmEdsfFI/zxbQZidcTZc0gDLXxm4w/2KqUKZ8W7jJZtMJ9WMSimEBqdzuhcEiwHXHFsuX6FeHbVHVJNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX3dcbBVRuDXDPsNrRgNLR40x0mRj8Ps8kCN/DWFSYE=;
 b=oa41KmBaEndl2lGDOGwFutj2+t+JDl05IZJ29in87kTEuhjJSt4ExCCK582g+kMRgIkioRJmzjCKZb4Qtvz+/0VfYMGaPfYBaYlfI64DKDFhyzimV4Ht6ekVy4DPNmnosGfvnCD0V6/ZlArLnOeW+C25jritT+951S2kgM2fuwktPGvgRxANk/TnvybhUlob1Qpe/2ys0I3yqHQ3gVAT0pv3CXo/lG0zGBxvtLizEv6buS6e+xeDvVIwlRAItYllfgDuynQnfCkFgEmbv3WW1kU1wpjbsXqWngr9fh/KU4SWLr3pD+q8bI7mEI8lhcM13vcTJFsioboLM4gGajdt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX3dcbBVRuDXDPsNrRgNLR40x0mRj8Ps8kCN/DWFSYE=;
 b=rkqQi/iA4/hc5Y+5Ab7qI9sD7rBeIu6AtECltBvUUyfFuuNnnkMBjiyci2hsWOxz85XzmuYp+P0GkIXpAWS+hqiqpw5olmoVCKjuANIDcbZzNBj89Wn9N8QE67gKxBUVshNa1c8Q3Fi1cqQ7d9fIVhZAXTtXRxX9+I+etHwR2abWIenrWKo5MBvHBp7OZwPEWMyH4lAe/USZu8fwbD9/TMe0AmBjZeRLwmHMuKDeKlCZjkjJ2PeKCJWgmAG6DgZCDqbw85cSto8NObbGanE1z442nipiommlB2iOiZg/oM8OxpdA2Kf6/hKdVgzVe22BNMISh1dt0LBDAibZdnQRKw==
Received: from MWHPR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:301:4a::27) by BY5PR12MB4035.namprd12.prod.outlook.com
 (2603:10b6:a03:206::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 17:32:17 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4a:cafe::66) by MWHPR1201CA0017.outlook.office365.com
 (2603:10b6:301:4a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 17:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 17:32:16 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:32:16 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Mar 2021 17:32:12 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5659: Update MCLK rate in set_sysclk()
Date: Mon, 15 Mar 2021 23:01:32 +0530
Message-ID: <1615829492-8972-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
References: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a037048d-9276-4198-c566-08d8e7d84764
X-MS-TrafficTypeDiagnostic: BY5PR12MB4035:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4035D5EB452606DD5B6FC84BA76C9@BY5PR12MB4035.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RHLJeQ8cvB8NcwzLVdwSf5iVm4xxJZIcSI2BMqAdyMgOf5yAl38wvDned3BSv/3urlT10X1h+3YRa1Rvdkux4s3bRPGJ8jT8CmTtd34aAILFQT+JZI0YWIzclKDzZAQclAnLfPiVYShgwUzNvz0gkFs2J4e05JZKljmwNH/ABaMacZIRpoJv1igxht1lM63exfEg4ijiynIZxIXS2XGwkrlEpiGSV5jP4hqAFtlkBYgyQVqMhvEvUI20ak4ZYvtg/bkbjwZE8ASZR0XqaYFpwxerHtFjMaFXaV9AoqEwY9Fk7Ph9EQA4PCRFwFxQjIMCcoKKdRZB+AcWWawMGby1/tniwl04iLyNnvMuUojCKVWuVtzkPqdbn7okpxmxFY0a5pSPmwzvEKGP5caGnAEq2e1/0qv9bD9GXloOTP4rUVDBHNjnxS2xUskosmcap9Wf7mwZmGp2fQp4zsjRwElw572yWa9I3LF5FAPEC3Jhviht563ZgVlza38GCXeGeQ7AHauTOIDXCk8ZEK2WflS19Si5G/nn9Gz1QsPdc4Kr3LWMWjC8tG6Gk5cSgEKpnsqvh9VyYQtYzNLhhHJqC2sl+OJ58hbZtQwxxDOZE+51eLM4a1+fCYkq50fP7IyJC5U+tLHTy+KZCCOpOn1sXmTMcTrQLZy97CwcajAydfBT9UG3NfVmDkPpjQc8z50PsEQ
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(356005)(2906002)(7636003)(82740400003)(8936002)(36860700001)(83380400001)(82310400003)(316002)(107886003)(26005)(47076005)(6666004)(7696005)(2616005)(110136005)(4326008)(186003)(36756003)(478600001)(336012)(70586007)(70206006)(5660300002)(86362001)(54906003)(8676002)(34020700004)(426003)(36906005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 17:32:16.8574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a037048d-9276-4198-c566-08d8e7d84764
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 michael@walle.cc, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

Simple-card/audio-graph-card drivers do not handle MCLK clock when it
is specified in the codec device node. The expectation here is that,
the codec should actually own up the MCLK clock and do necessary setup
in the driver.

Suggested-by: Mark Brown <broonie@kernel.org>
Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/rt5659.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index b787515..0af9601 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3430,12 +3430,17 @@ static int rt5659_set_component_sysclk(struct snd_soc_component *component, int
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
 	unsigned int reg_val = 0;
+	int ret;
 
 	if (freq == rt5659->sysclk && clk_id == rt5659->sysclk_src)
 		return 0;
 
 	switch (clk_id) {
 	case RT5659_SCLK_S_MCLK:
+		ret = clk_set_rate(rt5659->mclk, freq);
+		if (ret)
+			return ret;
+
 		reg_val |= RT5659_SCLK_SRC_MCLK;
 		break;
 	case RT5659_SCLK_S_PLL1:
-- 
2.7.4

