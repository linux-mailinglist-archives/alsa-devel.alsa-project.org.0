Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F94D4583
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A73A18A2;
	Thu, 10 Mar 2022 12:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A73A18A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646911091;
	bh=9UNu6upX2cZA09mJ4R8IkHmLFLkAoKzdYG1stEZOvHg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J+YOKTnSF4ljF2uKlcWr0yr7yN+N6740wrAI5xbbhgi/M6ITOYQCzcgq7QnbQHVI7
	 iuD7Sbsnsg+zgyFYC8aH483Jt9kHNFYt7wWf+ORo4+qaVZ4I5sT9yJ2ey0INqt/OWT
	 YVzEUxfST//GkmYcpGwQCrLJHwMVCjl7cDJxl9KU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67B2CF8013C;
	Thu, 10 Mar 2022 12:17:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFAB6F80137; Thu, 10 Mar 2022 12:17:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A466F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A466F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="chZkQrQm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIzIXDUNjk/G6MO9WKl8wWgHWzPrHjsNrbDejSa+foTacJ3XtmUhVof20dkoc498rXwW2r6GihEIkfjEGbpxSVDN3oMPw8p9ZnGdHgStPBw++353VSHDuwrPxLNHOt3lT8wpV0iNeT/+Tp9VTOhB3viU7IcRMj/HM0RXuebnt9VBhPiYoUuoAKfXQXNakTWbMSFp/glHw4tE96A+dgxpjoQvr3smvoxeAy3JdY8RdfrOmHiib8vfhkrFb2CJZ1pNr+HiVG6VkQDX2zLEhZtCdifcVibZHday2LLJdJy3Sm0tq4rATcuPxoFPX00EWa2crNtEqz6GdltpBB7YHLU/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f00uFFaGyBgFwPRnoY6UZzLKwSyCST51XFaIqjzGgSo=;
 b=ZW/mPW4XO+01ZSK/9qzVXosSXh0uFxIlXWbCz4q+BgPiLUNhYvFvSo6eiTvrJCOpY3MSJukGVxPjrdRaAwYTX9Xob+XH9aqEj2itd+HF0FK/lUqYZxGnLZL/c8IJ3SovnoD9M8hULa3TArxIvy8rNCplE8IU12xKr+fdNiJaMT14xwCOnm+zEBTmod3aPn47aaDc6RG+8/fwJmwAYGDRZmQrQCKsgpEMJVGMn6m0kuUIqUwiHbvoVqYl1EK9eeOWF50c34QTC05w1TbUW881q+/XwamfbLCm2dzts4CWONBFdAN2uCBj3yVSodsSYs/vw9WxQWuCmk/6/t7sPk9z1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gerhold.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f00uFFaGyBgFwPRnoY6UZzLKwSyCST51XFaIqjzGgSo=;
 b=chZkQrQmYSMybcvGkHBRW+2PaGqqEwaH8oMBAO1kFKrUAK9fK4XxfG6GFsjiyamNEWuuQj++tXYf4UbAZ8fHKwLvDdbjd9yV/uAnQNPG//btT9HIQa5W/ro8Gq9eecxklqYEUJYkar1vvIng/8Rw24gw7DDxTm75mlsEokvXPy+gUet9HN74iuOmX/2ejrfR1uT6HPcasgC9edz3JYqRtU+B012Vgt28GYKprDuMYojqsk378aqn00ahHUYQM8k/bAvZ+XpwiC9/RRRC06QqAfGFoc04CmNzLx5tg6tH79HyZlrHXpg5mV3beJFg/524H5JcyhC6bM2B4PF9IGJ4vA==
Received: from MW4PR04CA0066.namprd04.prod.outlook.com (2603:10b6:303:6b::11)
 by DM8PR12MB5496.namprd12.prod.outlook.com (2603:10b6:8:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 11:16:48 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::29) by MW4PR04CA0066.outlook.office365.com
 (2603:10b6:303:6b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Thu, 10 Mar 2022 11:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5038.14 via Frontend Transport; Thu, 10 Mar 2022 11:16:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Mar 2022 11:16:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 10 Mar
 2022 03:16:45 -0800
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Thu, 10 Mar 2022 03:16:42 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: simple-card-utils: Don't reset clock of active DAI
Date: Thu, 10 Mar 2022 16:46:39 +0530
Message-ID: <1646910999-2501-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 143e8f9c-1a8c-42c3-37ac-08da028777e5
X-MS-TrafficTypeDiagnostic: DM8PR12MB5496:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB54969606A3CD7DC0DF84AC9DA70B9@DM8PR12MB5496.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CgxajDV6C4JD6Va2E7Mr5E22KQMITSqwLqTLGhF2G6nJ9ZSbyzmNhVObBDOqg9wlShb+GUAeEP8iBi/xnnt82OIHF2Vshkh82V1dffJx4r6zo4IAClqOoCHRFJijY6kKdE2SGrRX1QEyID8mKFqPUcIdYqWO4Zu3C14ypNCCrrtjL/3XjXamd7w8eTmr6NgEegdaB9p2Z1wLr5Yfsr+nR7s/zhRew/uxfZIa9hoPpblOf91Cjy0Go5nj3qKCm0ky9FRthFhwpMFWITnQWfhSptn0KHmGTMGgtQw2yXK86UFXgRtHq2SnrToTv7qD/DW3+jQdKUyZpGthQcK9GQvcyq9NpZz2NhjXB6yUnHbwKXTEN+A2NnSz3T4igY2CwyMcFNfX/133yeNGehwunVsJtcyVWr6KJ/f1zmJFLfXYDGnOoGxcFqbVPVXOk2f9nOTeUxfLSkvrnKpcRANa4riPK/tcS2g0jq7Kx9CrQUfKJpqaxDBi0EbEZKtE8Tff2AoNgfKxrdifgTgLhqgfCFMaUwytNUh/sBxm7a/Z6MySF4YwIq9LGd4ZbPEEoAN8uBsUgqHj5ENLwuM0XH/E1Gji/o2ol5V4LwzeoQxxF1YK8/if9Zp0awfVRqF8pFjEXSSYxNVJjTyfmDHScbilFlrCKDBNSG9asuneaS3ud+O5WKXx6HUmIpB36SvN8m9iILuFLpF1eZq0W+SM95TY9jjnwg==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(2906002)(356005)(47076005)(81166007)(5660300002)(82310400004)(26005)(336012)(426003)(186003)(2616005)(8936002)(6666004)(40460700003)(7696005)(83380400001)(86362001)(107886003)(110136005)(8676002)(70586007)(36756003)(316002)(70206006)(4326008)(54906003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:16:48.0447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e8f9c-1a8c-42c3-37ac-08da028777e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5496
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 stephan@gerhold.net, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, robert.hancock@calian.com
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

Playback or capture errors are seen when clock is reset during an active
stage of DAI. Presently this scenario happens when DAI has both playback
and capture sessions running and one of these finishes first which will
be followed by clock rate reset. The remaining active session will be
affected in such case.

Address this problem by allowing clock rate reset to happen only when
the DAI is no more active.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card-utils.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a4babfb..6a5faaf 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -272,15 +272,19 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 	int i;
 
 	for_each_prop_dai_cpu(props, i, dai) {
-		if (props->mclk_fs && !dai->clk_fixed)
-			snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, i),
+		struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, i);
+
+		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
+			snd_soc_dai_set_sysclk(cpu_dai,
 					       0, 0, SND_SOC_CLOCK_IN);
 
 		asoc_simple_clk_disable(dai);
 	}
 	for_each_prop_dai_codec(props, i, dai) {
-		if (props->mclk_fs && !dai->clk_fixed)
-			snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, i),
+		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, i);
+
+		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(codec_dai))
+			snd_soc_dai_set_sysclk(codec_dai,
 					       0, 0, SND_SOC_CLOCK_IN);
 
 		asoc_simple_clk_disable(dai);
-- 
2.7.4

