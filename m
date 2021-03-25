Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88945348792
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 04:38:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23EF4167C;
	Thu, 25 Mar 2021 04:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23EF4167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616643537;
	bh=b+oZHLzB0Fj5zF6s/SIQcyszgVNelhdRAueclegtJh0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7T2KZFiohgY7IGfqNkD70eO5+bT0cNCIomqpPxI0nYhPcdoEJVoAY9Sx8jiZ9SD+
	 c1fvpk6yIdML33Zrgu4anWPmawftNw1JvUhVyROzH1G2urpD6IGErBBTcKpfhFYUr6
	 9/QBUB3bh/iJFf2Z9GiXkeY3EGQypMqwcxqluJmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1081AF80279;
	Thu, 25 Mar 2021 04:37:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1166CF80268; Thu, 25 Mar 2021 04:37:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CBFFF800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 04:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBFFF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="F07wYJzK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRsuUG/yYmM7N7dlO+xZU09PP2wzH4S3NXNEIJhmzYmjWTO4/Aryz5mxYveIZTDPBGBF6CUMvEmEQSXE+GudoVSvM7/NCaNRsgInXhiAkssDalYCXGSKoHKlV5QOvmBJrEVPoWR6EJ4tYaD7ACV/ck1fv6ZnpPrj4Bwfj25R1FiXNTDV/1v0tRJC6AVn56EnbhL1VxSqz/qgARlk7sGUgiZEuMNm/DWLuSdnRbVsQKjyLhYNoEbc1Gm8VRK0YA+dZiEW2BTgmzENsGo7netil8aVEsvGSHJGxZVXS356yahcS9MZayRIshzisZnUUn0u3IuHjkoNXm1CYw9a1ZHrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3vv0O8XxBApWRhjYEe41jRjY+ih20wKd7MLzaVEtVo=;
 b=KGPaE5I1qmTmJOal0i/xYP+LSM4UVpJ16iB9eEXLBXbsk9B+nEx7RkNrKvfuTwEuKVZFZFfaywfgXDtj0w0THWWvjmBtroKH0GllboHBsnCiP0WpZ1Ebi/IL+52n6/r5itTjk/sYFvcE85eRJiRJv/G02zsFfhwu5s6qdLP1OV2AzQ6NkyrEnB4beRvvo4XJ4yf9EUlQk15sgJHEI3xTVRpRk5tAVp3IoIyibULJSkPYZhy6fIYSFQ0pQt8TU9fPYNcPD0ALJNt6y5XaMd+dauX17sCdezcOFMH/ACoZGR+QvRLUyB3azvz3HH9ySALv12BVkagGtFOlaG4/pjMvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3vv0O8XxBApWRhjYEe41jRjY+ih20wKd7MLzaVEtVo=;
 b=F07wYJzKPuMmC8Gl1jR3Q5LxevqAgNzlxQJSZpNBYxQH1hw4u6Hg8wm/FrnuV+EZjkOKwMgiCxQVHu4ExBAKpRoexKCeIXOdp9S1duLNDkVsq5GDu0gU77R6/KzSxQwt+9UvAN2nNDk35zmKFNFlnxfD4/MMeDqY9iiu9jMbciA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3382.namprd11.prod.outlook.com (2603:10b6:a03:7f::15)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 03:36:37 +0000
Received: from BYAPR11MB3382.namprd11.prod.outlook.com
 ([fe80::cce5:1aa1:302f:a956]) by BYAPR11MB3382.namprd11.prod.outlook.com
 ([fe80::cce5:1aa1:302f:a956%5]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 03:36:36 +0000
From: Ryan Lee <ryans.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@linux.intel.com,
 ryans.lee@maximintegrated.com, guennadi.liakhovetski@linux.intel.com,
 vkoul@kernel.org, yong.zhi@intel.com, judyhsiao@google.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC:codec:max98373: Added 30ms turn on/off time delay
Date: Wed, 24 Mar 2021 20:35:54 -0700
Message-Id: <20210325033555.29377-2-ryans.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
References: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
Content-Type: text/plain
X-Originating-IP: [73.189.52.211]
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To BYAPR11MB3382.namprd11.prod.outlook.com
 (2603:10b6:a03:7f::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (73.189.52.211) by
 BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Thu, 25 Mar 2021 03:36:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b80dd6a-5444-4e40-b702-08d8ef3f3141
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4798:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR11MB4798BFF36FB33581F89EAA1EE7629@SJ0PR11MB4798.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nAUD56j47zI5tmRpmKhj2W5fvQcvUMjicP8gGx2PIPtOlBKeUBfomDbI7AXQF2Ns67Kusgk0VYglYWkcGuBeMSniLUgyXRvvzRsnWLJWkKTUgTeQ5qofLpq8hO0o73VJZqQt0FVhn/JoRkj1hU9yyAPbf/sTlWH9DqQ2MMHWVZkrbQot2woBElxADp9YheWap4V26s7/7EmPAHkmGAK2Tr1kqwea5w7wHj12+s1Vlr/LqC3Ot1f5IYdxfm45vcLkV/LZ/OmAlAN7a43heZXDJwpgrmi89OO4tBT1Uf2IViqpybkRQwZKZ/hzTw1EU5HikIYPl9F5ql0Uheoi7URsn4/OKZ08A4DesoArmTw7fjxCkI4LdEt7PoEUCABJPwS28taBTn9PemlNwTVBWGJy8bBeYGtVQE85Rm3nkAaffdVKMCcTbdcauwF3cxFaKlDkaJxbSEGjDIz/enPiKzgQ7oknd8SQjPK9OwQnN/Yzr4uSJIxjsCqOVT6FimqWjEtOODX+PQHyJD3Lgm4nNWE5r7WFrbbu50wKCNBIKeFR6PFQuy9CaRolABlKieeUJYfI7jSJnrKgjoYRo7pgJnoSrR0L6rMyHBLZoJfFA+mvnmxOCFtAi1yOtvjo6Reux3f9kg4NmwSxqRh/XokgTi1CMvLv6LaXJZ48KUfWIhzxIGB/BrQvUIfGdYGpTbZ/M1Q8gwnsdCNS1EIbyvZydcl48g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(921005)(478600001)(52116002)(6486002)(4326008)(6666004)(7416002)(186003)(69590400012)(26005)(2906002)(6506007)(16526019)(6512007)(316002)(4744005)(8676002)(2616005)(83380400001)(66476007)(1076003)(36756003)(66556008)(5660300002)(66946007)(86362001)(38100700001)(956004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?N1QcTYMOe1iMMTxBqpMo3MNZWWLQ+J2k13SteSu+ZMmEv6U9c/WrgVOU6cQc?=
 =?us-ascii?Q?FOxcGY++p1dOdw+HlEh1ntNcj2CTrPAmH33owmgquy/GSAbICRBGsWve11O7?=
 =?us-ascii?Q?IFoK5Mg0bz3/zvFYsAn+PdZkDSQgdI7F5fHNHO8AIOg5pzylqRAnsSXTsoiW?=
 =?us-ascii?Q?c4blpR7Jar/ttC+jyq44kBwP/wnoYRlK4qTdJWspSd94VMEcB4+fRHnEygTf?=
 =?us-ascii?Q?P9gf+13x5j+Gu9sje1ioFhLfGpraYXaGr5nq6x6yXYvV2/MfWXLVgFx/OO/p?=
 =?us-ascii?Q?CO4uwaUzYD/a54BQ3r/3tTdDVqD4Q8zz3kpO869awC2ykT910LN3pugVQ2Ch?=
 =?us-ascii?Q?KQXHxi+LD37NbBpJGsi2dYgP+wq2F8ZYhpg0+SJ+6/svAinrsIZgev/rG+7U?=
 =?us-ascii?Q?Aj8v9xr0rtIhzKU0mu2W2VMrTyVXNSJaTDAkjx6qucGCEtB/XwAUhH0umNFh?=
 =?us-ascii?Q?ioiV/UUG+wDM/BV4Cushi78GjqKOERsMQPokDGtahXdWXkw0H6SiOcjf0tFP?=
 =?us-ascii?Q?EpJHvxRgcrF9Vwv3N/25arlyNJuVilsSLO5fyguMydM0Y4XEjTD/iQkLXgg1?=
 =?us-ascii?Q?imLYptIjTJ5QizSijFpzuM7CSDZ052ErLfBjGu/RPlgZVipKb6Rz5P4TzrKh?=
 =?us-ascii?Q?2xhYXkoz54zVAA8URBJsOts+2nsLsBRCKDv0rxvpstZ4Sjq3pyofS6jomU+i?=
 =?us-ascii?Q?Hx9PG6RvS49V2MYzKXPpsv9+I/j0o17pkGwFaYuIFdv4g5tUiukP3CoZp9V5?=
 =?us-ascii?Q?+xtxYjV33Es93ia2nY9G6SB5ecLbnMUAsMJwJHwJ50QhCLUKj3HuPh1vFDUO?=
 =?us-ascii?Q?Mu5CJE+/BHd4bdmDUNsv/TAocKSCq/xWFcGXfJvlu/RSQc2PfCF1esDLGFCB?=
 =?us-ascii?Q?f9hrFXa4RV14RMEzVlbUYKm96A0VI3MWe/MethtqoxljgQ4ZNF8LV4yPL9Io?=
 =?us-ascii?Q?vmCjVFWp3zaiFK0Ap5Jw4RMQeDqpH3A4CRLHLnj5Jx2Env5eIiNyxEqHU0PM?=
 =?us-ascii?Q?Yy/z6HVQfEgMo7H/h7yoHjg60vcpNjVe8Z+U8xmsSQb/bNDTiY+4vOLpCO7Z?=
 =?us-ascii?Q?UXSyJbjBqBDlYjfdwbrbVABidotRW1cN5ob5OjbDw9uFl/JbEn8J1vcNsR4s?=
 =?us-ascii?Q?2dUBYhAWFCQ/otoYhtmFXK0ZYKpeylaz/bnPUyEATdaO1Dp3yI4hqovHhSwg?=
 =?us-ascii?Q?iAI9a93rSNtchwX8js6s8odG+bBCCOo18IvdVOM7ZsgwZ2EnkTZb+LEXeK5W?=
 =?us-ascii?Q?MTTmdumLkLK0Kjy1tl3Y6a6ns6vL8nHriUVDAdjaZE/Q4tAy+Ka08xZp3aTc?=
 =?us-ascii?Q?aavhLekyPnQoonXmBdYH9JlG?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b80dd6a-5444-4e40-b702-08d8ef3f3141
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 03:36:36.7110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpFaBGdWiou/ltCmEqQGVLcUK3kyV4Xoldu3r5m/3XagZRZ0b40/jscg/n4zedmusqFXCH96RdxuxfIDcrT33OjDbqL/y4/6+VFhpio9iQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
Cc: ryan.lee.maxim@gmail.com
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

Amp requires 10 ~ 30ms for the power ON and OFF.
Added 30ms delay for stability.

Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
---
 sound/soc/codecs/max98373.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 746c829312b8..1346a98ce8a1 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -28,11 +28,13 @@ static int max98373_dac_event(struct snd_soc_dapm_widget *w,
 		regmap_update_bits(max98373->regmap,
 			MAX98373_R20FF_GLOBAL_SHDN,
 			MAX98373_GLOBAL_EN_MASK, 1);
+		usleep_range(30000, 31000);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		regmap_update_bits(max98373->regmap,
 			MAX98373_R20FF_GLOBAL_SHDN,
 			MAX98373_GLOBAL_EN_MASK, 0);
+		usleep_range(30000, 31000);
 		max98373->tdm_mode = false;
 		break;
 	default:
-- 
2.17.1

