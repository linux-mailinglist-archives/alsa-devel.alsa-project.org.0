Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A74C0D43
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 08:25:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D77A81936;
	Wed, 23 Feb 2022 08:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D77A81936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645601158;
	bh=9I+tD7xrlzYhy6wI7RVOwtz1ur7X515lZHrOmuWF29I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwCDf7Abz5pt2i+ufXByLmZuJfUBsk0keA3Dft37Z4ry2/V2dGYFjBH+Bk+zDAUXG
	 emPPoSwS7CmKCGw37WCOlC3ilXuAhInVgmBPmB+2cNcIwMSEoQ5gsatmRPQNHPQ7rq
	 M2xPuhqv2yP4Yzv9+Kbz7onxF6LgPNYMcvznz2dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 871E4F8051C;
	Wed, 23 Feb 2022 08:24:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7674F8019D; Wed, 23 Feb 2022 08:24:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC430F8019D
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 08:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC430F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="qFTQpkEQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUUKxchlX+EydVOg1IsusUaav6Cfns4XWuIKa116k0wlXetjJXXUoQxatk6R+f1dFT0GO/WX0rRCYsPC0xEAdHoq4rGMUzXHwsEmVJgsAvTv6NvfCupSzMrYkAhBXOSTlxF7IrVbzilJ37k3rOnmz9JcDkf6mOvSBhK+gH27GPeoCeVVzL8QZLORpE3eJVXJMkdUv8wczcqWIFeJcDD9nnmQapIZIf9QBSBYTgcReCwF68xlgnS5C9JGc9y3wUkZ7akLFn8fYZIchO0ykTUYPV1WkyxaiOc4tjVpr4Rm/w5uuqjoxFlvZVlvRz3Vzz64erfiyFocYqD8GuRVKXIfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaONtKtKuues/80Z065JmAA3NdlvKn7/RhGsQ0u67l8=;
 b=khHXAWYDkZ0/xh39x56BzqSkR/n96mICWkoOnW/zhLInmvXS2lZpnVm7dof+b3SD7s6cNg8QjGCwSFy1tpqrSUE0By2+60CjjQvqEgC5yvfRE96aHzbM7uyUAFySXxwR8a8hCbE2/O/Ml7Ym53ne576PdDg+8pa5tqcVLjfzYCKeah6C+ZSTtpMRRdSSZfXTSlgEG5PDJ4YZ54hmbkJzL7v64pVBR+xyxUyCK0dsmdwxuezv1aVa8sCev0ibjCwNxdLTOg2ff904p+r8e9MFu7SfvHN5IT1OFyQXrM7qcs/pJC/i6whIFg5D4yWD3oqcZr2szcjsGVsoOuBHWqZt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaONtKtKuues/80Z065JmAA3NdlvKn7/RhGsQ0u67l8=;
 b=qFTQpkEQyxu4vcTIRGVZkIY0AHG4pnUqBzUGDd5z7ocTpy34T4PN5CUKM9NP55/WvuFXf5nH9AmDhjrERiegxOTISwQ9ILiqYM8Sjuh3ZE/5WrouGTWzI33j5Hny+MIfTZZNjk+00mfBPmG/aKB/0JUSckmf7Y+mk+7gET5mvV0=
Received: from DM5PR10CA0001.namprd10.prod.outlook.com (2603:10b6:4:2::11) by
 DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.21; Wed, 23 Feb 2022 07:24:24 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::2a) by DM5PR10CA0001.outlook.office365.com
 (2603:10b6:4:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Wed, 23 Feb 2022 07:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 07:24:24 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 01:24:21 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 23:24:21 -0800
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Wed, 23 Feb 2022 01:24:18 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 4/9] ASoC: amd: vg: update platform clock control sequence
Date: Wed, 23 Feb 2022 12:49:33 +0530
Message-ID: <20220223071959.13539-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cd909db-30c1-4787-7c61-08d9f69d847a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4202:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4202077C46328EF3A722CFF0973C9@DM6PR12MB4202.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z37HawR/ZWha6FgBWkOiAgaa5BweaLSuPVwP0LuEjKHIAfvd3cdOkE6TJXw/vGnnmktFpm+4ATqt4ByQAVinOM8qmQ8nBM19JBufPSS6pkPLfcVz46T83A5G2F0XDO5SI0RknIIvNJP/fnN1mKyVZ1ReNuLKkErXMkjnDp6n8LRC4cqbFqwAjc+mbH1t7wK9BYpLL4Wo7lKhPVl/xVbf0pZF8ygWdBFOpdMJdjmM/xHpL8M4vzosLH1M+SdgvsKnuiFStCF4ZcAaWWYScvBn6z8BNHKOoctamMNt9/NWXnH64htdNUA/wi5D/ye7/LR8tvozQQ0bE6DKB9+9VQ9v1xbQREh0jlR8buP4JWPeK0EoZqkoZjZ/kckyCPwch3OLb86YNj3oARWuftet59Kg5qVMy+ARTdYqHKIKV/21DvlL5/UPvavHA1T48HI6dFbwy5Re8zNEZrSolPo464/2aBCJ++0jP0Rrd+YB2x+GHm7+LxQEQN72Y0vYbuSUV4wSepbon6Gn3tg2yLzxuY2Dub7An/ZWpujjoFRkvRjW3if+bTNgt6giZ1l8DTcHoEM8Ztr4+WCFLEhN0JBet+6BAKJg8JdKTMql2XFqqpJjeebtktViFVgwuAnxZyzoNr5I654dtVt59gkZNnMkJPit3cew1wQ+wSx/9u6UQ+kGclsiTzOtad0IKpSCw8XJrLptpUt/qRqzFWJd1Swr26NlAA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(1076003)(86362001)(2616005)(336012)(26005)(426003)(47076005)(356005)(36756003)(186003)(81166007)(508600001)(54906003)(316002)(110136005)(70586007)(70206006)(4326008)(15650500001)(5660300002)(8936002)(82310400004)(2906002)(8676002)(6666004)(7696005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:24:24.1460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd909db-30c1-4787-7c61-08d9f69d847a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202
Cc: Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

Add pre power on widget event.
Based on this event update platform clock control sequence.

This will fix Codec clock and pll restoration issue during
system level resume.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 14cf325e4b23..e610616d796c 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -33,6 +33,8 @@
 #define DUAL_CHANNEL		2
 #define ACP5X_NUVOTON_CODEC_DAI	"nau8821-hifi"
 #define VG_JUPITER 1
+#define ACP5X_NUVOTON_BCLK 3072000
+#define ACP5X_NAU8821_FREQ_OUT 12288000
 
 static unsigned long acp5x_machine_id;
 static struct snd_soc_jack vg_headset;
@@ -274,6 +276,15 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			dev_err(card->dev, "set sysclk err = %d\n", ret);
 			return -EIO;
 		}
+	} else {
+		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8821_CLK_FLL_BLK, 0,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			dev_err(codec_dai->dev, "can't set BLK clock %d\n", ret);
+		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, ACP5X_NUVOTON_BCLK,
+					  ACP5X_NAU8821_FREQ_OUT);
+		if (ret < 0)
+			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
 	}
 	return ret;
 }
@@ -289,7 +300,7 @@ static const struct snd_soc_dapm_widget acp5x_8821_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
-			    platform_clock_control, SND_SOC_DAPM_POST_PMD),
+			    platform_clock_control, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route acp5x_8821_audio_route[] = {
-- 
2.17.1

