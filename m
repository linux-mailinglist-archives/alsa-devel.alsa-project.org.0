Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB87774EDA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8AA8E7B;
	Wed,  9 Aug 2023 00:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8AA8E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535645;
	bh=Tz8lcZB61HEWPkdNCIX2Ci2g1rUIySuO5e+w+e4/F5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IICSRNxkAREFECpKVwRCybxtzJ4DojEaBzZ8kgYHaWrjKNGSir1cfLrj4fVKnZUOw
	 n3GRf7uNz4eVgwT5G1QxIDm3+mfDCpa/8DK/DKe7Rg3Gjk0eU1TNDO5/pCS3SaLQUO
	 oOkEVqLox/np4/c/elehauov/LYRJjT5fPiM1E6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DD0BF805A8; Wed,  9 Aug 2023 00:56:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78AB7F805A8;
	Wed,  9 Aug 2023 00:56:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30A1DF8057C; Wed,  9 Aug 2023 00:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78F9CF805A8
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F9CF805A8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hZMR8WNg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qolp2TEBib4fTmdtWs687YYVVu/A/VNC6avXbI0Q2Z/SLxLNwnxD3ld3IWfPKwqVSEH+VA129V3r+c+DlwiH2nvDL6XhLYFdZFZCZdbtF5zzd7rxabqmNcoeUZAVEZGMVyuesLv9/eRFKOy+0M02NT+UI3++n57JI++gi6mQUKn9ZyMz8HNkFqz3MYawTj7hJ3yD1oCWi2b2Ea4MzuPGLj81GWdnQyo+HKFNF9wajW3i3pWrDV0KkzEoWAaRqku05cVHIP9rolvvIcIngh+/1JXf0TgoJcUr6JWql0KuAKonzaeug7i2QCB8Nrquj/W663dfaOJTJxXrAzXQ090zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALiXSJGhdHcMcBAx30zvJZXIBrbk9xfyo9TteHMtghA=;
 b=mK+uDnnXfCFdyrHcL98erZ5Tagx4WJuLtE+rGmKiqg8fTo3Y2YHdPY5e00KezlBmd2fELwROjTJCwmbUYipTP7Qne9zcQET6tfqlVBI3PRplogMLv72KcZlpC6DfnLurfcz/qxnaUm1jbOQlu6dKcvZ0mCteg94R+8q1lzLq0sE4ooFfDNrDQr4edrx7NY8PKE2Uw/Nxi17YH+qQeKN3X8y04piY17Jbh2uFx5w+iYaGELGXMxTquk405CU9zKjo8BRZtGul8pnBpa2YAXoENQezNfY08qF4kGldt7hQOB9k84pTQn3l6KU3jAaffIS5tm/+TeiKdAtmzwnypr6pkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALiXSJGhdHcMcBAx30zvJZXIBrbk9xfyo9TteHMtghA=;
 b=hZMR8WNgqUXjYIUPjrayMVKhidr4Qfl5SBul9NYI6uzQF87K9fjmfaJLTICirlm5onmSP3VhlVGC/9U/zrNfo9SChXejquA8rbbdVJYAD+Qn2JDn/RcAMuN9MELD8H38yNRSqjYczEigDIAFGMbjAMltJUyoRsZYkd+XAc2cHos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:41 +0000
Message-ID: <878ralb0t3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi
 Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 17/39] ASoC: au1x: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:41 +0000
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 91be8a8a-bfbf-4d4e-1449-08db9862badc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3DxCWyCdVG3nWVSP5L2ROpjoZE6OmSykKPxPUjdZYbJyPkP5txncgZPRhe4JbKM9nroMbOJZz+bMlNHeDKcd1QnQdGNunxRgilc6fEfk5LAuMRkSMhNijjBEVkGNgFiJzGpK2nxMlJ/Ky3O6R8g3v6LP+2y9QXsTgLhzWePZeFO8RHe18tKPVFnwHqbb4mJTAjkupiZqEiy28//H0z7D4dgYXCLYc2iTkKSCJYcfk9DkxzQrPu1jW90CElopgEwzScrEOLYqrB7j0qX0kc7ev6r+eJk1mz+eddGOidOzUlWhSZEzNz/+UX4ILer9m81CGzxN58Y7RH0wB5KxPeB3v4VIu6ZAJGzfIDRrpR6KWcxPyOoqr7abi5dugStXW7L7RMmgTr1ydzsksZFDxMu2nQHFnUSvIh4uBCMJzKmdts8r1zwt+AhE1S26hGJD3wdaHewA2ma/KmcDtSOSEllVq0tPBZSQVX6ZsVL5Ys6g5cFAE2z0C/TPLQhfX64wI2tDoZZPYEgX02QF3L5SmIy85GeF0G8rkILFwwIxg6EjZXNCw3KfhqrDjmTdv7R51d84t+uBVtx0a/AB34Yv6P2K+mMqjP78RBralypSF9V46iy6YqF8sTOTW/oSr7CqQ+6fmrri51AHaxXxLzwCGSLAkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008)(32563001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MZAoqr9cpzWh9X+M3EvZZLjq5yWxloKJDvIq0BWz2jd7Nnj+eNhgKxpoeV43?=
 =?us-ascii?Q?6cRfn00t+Jq0RScYs+7AyAsv14OEgO2yqkCnc5QdIXRRIy+9Ew+HEzCg2Eyp?=
 =?us-ascii?Q?XeQsO35v9LR5RCv5s6/BDVKFrFQVn4kTdhZyzrqkH6OYOIJFWT4Lrm1sL8+4?=
 =?us-ascii?Q?ULBvVhfeRDC6b7cZ6kh3zoQH3/v2MSP1Qc6t7VbPVEv8sFyW/EjQLt2w73sW?=
 =?us-ascii?Q?ngHenTLGhRTqJFbe3pdFj/ccqsYyqM45fS1lLYd/oPhx6iqcCPC4MastBjln?=
 =?us-ascii?Q?Q8kDbsA+uYI6W8io4A6wAiKIK3O+sio5NrNJjc1zQwETLKXEEQcf6agbTfKN?=
 =?us-ascii?Q?pY3HPTvoag1BXhil/wHqLjO5+FvrCmNg/lu/NL97h0MuZp5t01NB5/2Gx95h?=
 =?us-ascii?Q?9Liw3+8S7eOW3S1RkHhEFG4G7hTJ2v30lCze94vAyhsxyXvJbNmPHlyrOu1P?=
 =?us-ascii?Q?eVRc+QNXJU64JEqi3t56xVzVh3XFBUMRawqt1zDh4W6GzswYLSZi9Deo1Wsn?=
 =?us-ascii?Q?8yAOd+OKcayzsYIPWApQ6b8Rak0YtAw9MIHU1tlePB8Fk1bYiQ1nbMZdlvux?=
 =?us-ascii?Q?qSxNC2Pm57X5zStP40O1IKRE12HCVuicuw0Jdh45teT9JAqUIWYYVrCJ1tas?=
 =?us-ascii?Q?oJ/BruQman85+UCRCr1s9urhVmUYgt6Rr2jTiFNFKC9gsA0+11PP1FISmjy8?=
 =?us-ascii?Q?DKB8wusvSkSqv3y8RCQBZb01chdB77txac3Hkuaj2Z+6HRLr91pQuJsNRXYU?=
 =?us-ascii?Q?qYGoUBDFlf8I7hYvwqGSZLLbFzBanIXDOu/B4vMP+EkQBkB+EEkawFFeQ2tZ?=
 =?us-ascii?Q?INO7OOuTQFErKXkrPOuO+gnB4fCzxZ6BqQHn3TbQh1MOQytCu+tV64KseY8N?=
 =?us-ascii?Q?5iBjznQcRiI2XuByAkfh5BLtOhWtJEbYpVGeQekoHYqPKd5TWNAw62+JX3iu?=
 =?us-ascii?Q?oVa0PzVBRChyztw+0tiyMoFtWbZvkUO4wuzAxtbH9tlNmCxaMN9DRZkvxF/4?=
 =?us-ascii?Q?mzAddE0Virx9trX0HWHIuwvKMbqnZihkJI+5iJMlvx3WdWXzvWMZBTBSxnlE?=
 =?us-ascii?Q?XMfpwDmbGkTb/x6yJDZJEaZfyywmGD1vtEJqO4AiPpmR6MZDG9lNgC2RCzck?=
 =?us-ascii?Q?0sfMGXbb1BSMkU2k7s2pJf3SqYWAXdTAC/JpJNG64lgyQH9dO8x//emW0tjj?=
 =?us-ascii?Q?EVB44pdJCtx6kGOj0fyegoX8AJ8FM1aQ2sCE3OAfKno4fx+VLhVNGxQeD7Nv?=
 =?us-ascii?Q?j2uB1umqmq83u1lCnvrrheTI6ohyNjF7SSxIYZ7UOZ9s16yNuhslC6nXYAZq?=
 =?us-ascii?Q?oeeWySwrD1ZS9dY7vep26RJza6n2I14um+JafQNibLXl3ox10GhU9KQUPc/K?=
 =?us-ascii?Q?cjsyKotEqEFfTnIYTM5UrkW0igvw8lMPo7imc7A1NFVWa/8Ol4JzUuTwrVbp?=
 =?us-ascii?Q?I9B5ABWJ/HJP8D7608myeRleKKqrD1l/SZrGbumE5dZExHJxbLWCc44gJca4?=
 =?us-ascii?Q?gRkk5J7fSQek9aGFMw4j913YkAArWG+kgjpIvQOsJ2/jWwG4q6umtma1zAQ0?=
 =?us-ascii?Q?YpJgSJBWEMt/1+R/VZHU+IJjlKTE0G8c/i3oaFU7EZNDANYwMDjRu6iuAVbX?=
 =?us-ascii?Q?ujVQu2LKdlwKpUg7eqye7Bg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91be8a8a-bfbf-4d4e-1449-08db9862badc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:41.3259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rbEWgMyjdPO8BlONvpc29vjuvk3DrvDJSR6Zu2yaqJJnLlySIhFs6MJOpuiz0wOlZfuLpVofqtm5/v6lS7uCMPs0VPhMVSrRp479lonPX1Y/PAVH0VlzJ+8qhU7Ugwna
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: KEUUJY2BCUTF7E4BVS4YV7O6Q2KWPPHA
X-Message-ID-Hash: KEUUJY2BCUTF7E4BVS4YV7O6Q2KWPPHA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEUUJY2BCUTF7E4BVS4YV7O6Q2KWPPHA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/ac97c.c    | 10 +++++-----
 sound/soc/au1x/psc-ac97.c |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index a11d6841afc2..b0e1a1253e10 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -195,18 +195,18 @@ static int alchemy_ac97c_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops alchemy_ac97c_ops = {
-	.startup		= alchemy_ac97c_startup,
-};
-
 static int au1xac97c_dai_probe(struct snd_soc_dai *dai)
 {
 	return ac97c_workdata ? 0 : -ENODEV;
 }
 
+static const struct snd_soc_dai_ops alchemy_ac97c_ops = {
+	.probe			= au1xac97c_dai_probe,
+	.startup		= alchemy_ac97c_startup,
+};
+
 static struct snd_soc_dai_driver au1xac97c_dai_driver = {
 	.name			= "alchemy-ac97c",
-	.probe			= au1xac97c_dai_probe,
 	.playback = {
 		.rates		= AC97_RATES,
 		.formats	= AC97_FMTS,
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 9fd91aea7d1a..5d50ebc2bdd5 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -333,13 +333,13 @@ static int au1xpsc_ac97_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops au1xpsc_ac97_dai_ops = {
+	.probe		= au1xpsc_ac97_probe,
 	.startup	= au1xpsc_ac97_startup,
 	.trigger	= au1xpsc_ac97_trigger,
 	.hw_params	= au1xpsc_ac97_hw_params,
 };
 
 static const struct snd_soc_dai_driver au1xpsc_ac97_dai_template = {
-	.probe			= au1xpsc_ac97_probe,
 	.playback = {
 		.rates		= AC97_RATES,
 		.formats	= AC97_FMTS,
-- 
2.25.1

