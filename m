Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A37079E9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:52:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57AC51FA;
	Thu, 18 May 2023 07:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57AC51FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389161;
	bh=MdOPOnw42D38J3ZgxhQYYNWSZMr0gNs81G1R4ZGFdJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dsEzs/ymW2Lv6aW63Jdc7iDtAfqfb0Gpka0tz4wTSZHckswEzZdI3wWUz/onPKvLq
	 /aUclhjX4k6XMyA3RAw6pwpHFLmVv4WXAYQspK4oUu0FQFRxJJeiSCnXymA1qzrq5E
	 ZT0uUWTRG31nVZ8u2mPIYrLnkHQc8coW1h8uhpAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA9F5F805D2; Thu, 18 May 2023 07:49:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C68F805C9;
	Thu, 18 May 2023 07:49:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F774F805EC; Thu, 18 May 2023 07:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7558DF805C1
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7558DF805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KbURRZnl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0iNk2/BcvohBqzrfjODsfSCT0aZmaD++vo0JH0mAMTcTeRhUdbN++zfXuUlIxn0zBxGW2t2Tzru56tNvUYQWUi28O1as9XuTyjKAVKGiZYHtE9eHpPLMS/YcxNUPS4ocrzCutvw11to9lvBfB2wOZLPQW2d234EGEKADfjCQHqoMoyyt/W1UKIhkFyP99mPZdUfbVWRcAr8wDYADGxYVXQXeb9BJ5Ql8hnhfmX4ohPVIcQGCeIMq+Hh0/PTkcCa3Yg7SsnP5luJNsChN/+wr0mFCeyBGIHZmnUGBzstbzrP6Y1lPSADZYJUsJa9SwisCAMqh03zN+qstSpZ4s+GoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW5PZhkQGaI6WkmYemAQT2fQ7z15UhnM1G+Ig5cR128=;
 b=dEGFwlSeel4vXkHnuhmOebQFwesyhDZ12dDnT5fvDnzCMB/3VvOeCIMxUCFqGdc0zxK50MeGaxxk3nWF1AquCAJDcKse/Qjczf2vj/+U53jg0efwollPBbKKZ3SMehscDWnJoEwxNw5CPF8bQ/oAfSDNT0M/D/LZ9g+Ug3kq7G78EeYpxGiUteOWBmuBjVjoQMxPZPCZWyiOyksJ1eYHg2PNUVD7ZhyVVJ8qX3lY9//0CvELh/0JJyQulB1zybeMmepiqZ9IRgknTXd/F+0y3TxiI5gvl7+QCoIfskjPdpgh9jLGMHSpbRclNi8JdQDw5P6dTDpSrnb6IC3RtvZjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW5PZhkQGaI6WkmYemAQT2fQ7z15UhnM1G+Ig5cR128=;
 b=KbURRZnlcjumvGJBTE3lLpaVOQfGJWlaTYPhgodWr9b2RenMItYAC6RlkWyf/wNVo69Xlswd8ntvXLls0kYQeBsTPMWUxILdNwrNgpnnnSinH4o46qvAEbwnpBS05KiXdytzT+AqcBHCqNVJdZFIxp9/Vay6Urb3cRyLc8YvjW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5325.jpnprd01.prod.outlook.com (2603:1096:404:8023::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:49:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:49:33 +0000
Message-ID: <87ednep4sz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 17/20] ASoC: soc-core.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:49:32 +0000
X-ClientProxiedBy: TY2PR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:f6::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: a046d07e-f7ee-4d9d-1e1a-08db5763a7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tfrbh70oS4Rx6HOBWMtqyFP4a3qsT4gkEfgAP13Mu+k6+OdszwiuuIqm6nMZP0ri6boDoDglQoHeZomtcILMvGmK3xcrFZ5/hF4so8/j30QyYz2aN+xLYYqtspcHNBWHzQr7m87ai27uM8gOt8rw5n9ZHseVuPWI992UvXg970yWTlWwvQYuJrjTMnEYaIEij6ex6h4O3qeJcHev205SNGBG512X/uGogU4ItP56n0dHtomxBcBEH+gK8VRDclNIQZFTO/H4A1Q/237QBLNScbgJilQCmSSDqS55e1W21LHjWP7wkYPLl+60bhsXLm6j1wPgxiU93zpdujzwAbYcYilkfwHP3/T2Xcnrq1d8mUWU8SKQNuwgOqQT5bkE4FAnZnPnRotRmPpNKLWjfRiHGf8bh6Tw1uH3PV4WDVKnCo402QYlp95vEJ94j13mxLgq1JQoeH+3wBYhAYEI59c0WDDDY7aKB7grP5heEXkXce5dw1L8USmCZnbtBsYN71viISWwgBtW3J9m/KftNzlt0QiWvaz32Hiu5wFRWWCuMPP0QdxSsMV0JEXuWJ7sETNPP45C1pLD69iJ8HDY/5xYnAaFWKyl8CfQkmMbiqLQ+LSSklFY5LKcw0J0wVyqL3Fw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(36756003)(52116002)(6486002)(2616005)(110136005)(86362001)(83380400001)(6506007)(6512007)(478600001)(38350700002)(38100700002)(26005)(186003)(2906002)(8936002)(8676002)(41300700001)(316002)(4326008)(66556008)(66476007)(66946007)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hQgVB26HoH4W8a0SlzlJUVpjUk+xaxkn0Oh9OQN9MYJvq4FmXT4MnjnHliYe?=
 =?us-ascii?Q?f8aLK71bYv2PzuMWKMq2vpbTx2aPbduftwNFSfqjMLGWXjYWj4MNw5qrBBbE?=
 =?us-ascii?Q?tJaXSqYXQYiPfoKKfUnrjE54AYXI+dCQcYvPK6wRt3jlHVd68wpJpGXwI7eb?=
 =?us-ascii?Q?ibzo71QflyLIjY/Z0dNUIM4JhxftHzSM1rrdihrXYpQS1SPW6r5BFdozOCLQ?=
 =?us-ascii?Q?FHTkR2KHtUY2OpDuqS758x3pFpBv19+RzodacdBYQzeRuxO+epkFt+/T+XyH?=
 =?us-ascii?Q?lRIGz6YGrC4JZ2ekBHOvd+EEO/CtT/W5T96oXGf5g9YIqrV01CAjNyDJuZiq?=
 =?us-ascii?Q?sOzuBEbf4vZnzAqdkqjMhHmCnTKscR2yaFJeeS3NCaoDIyG3lq3A5AcNrX4g?=
 =?us-ascii?Q?TKdls2TDimmgdQN5liEIns3qnnmUnmmPvgk18c12E4G/BVm7Kvum+Io4IoKL?=
 =?us-ascii?Q?iEUgidQ8dZi3jCuS4Y6HrFvnBDUB0iuuhX1lo/1Awnd1xKdAOKu6NWToFs90?=
 =?us-ascii?Q?hwovZB7htuEdZEHzRpPnZ2Atz4pRYBWwvuLAkdZxpUt+JJBFc53FRwoBNnbb?=
 =?us-ascii?Q?jMXuwrTnpsA4pyq2YIIrv6+LnQ3K3u93GhBejShnmTH8nkiDal/hk7qWYvC4?=
 =?us-ascii?Q?7echDEg0QYGS3G8kTNggCG8ph6L9leJQqEbV2EKKgdBTPxvhulWJc9VF9TuT?=
 =?us-ascii?Q?l/CD+66dSqR83YfkIf0DIQwC1o3/Z0hQoXE44cbisvT46oVvTzoesbMg8mys?=
 =?us-ascii?Q?XMOgZLkUL0ToiLGdB+xqZoXLY5c87GOdahvT5lA9yOphYKAXsOPGN5ZjHHHp?=
 =?us-ascii?Q?DcM7TEdZvkMOQ2E7gKm/OfCN050FDXMhluvX18jvnOv20HyIxEtWaeEIfJsv?=
 =?us-ascii?Q?Zk5GSCdhcprS05HxC2hO08ILw6/LoJzhdXvHwhTwt5rpXzXZQaFuFh9r4B6D?=
 =?us-ascii?Q?vB78R6Zvzlaljdw/QlE4m2AfpfiJCQmtnJKwVq+lBp57WYvRkzl/UJjLs3Bo?=
 =?us-ascii?Q?JQN5vpipXGQTaa+WGDZkpsKyfIO4yqq6MUjx9oy6BHjmFiNxoKcJAYrvK2qj?=
 =?us-ascii?Q?Bqoe7KtqutHjzfhoUx8jT3XRKl0lpyvg3FN+rHLc/0YPWHaxbp8oHXOJOFYy?=
 =?us-ascii?Q?FJvNOku2BZHiUxprvnn3qpkvuxtsbLGr4bNXhApL1und0urOOLdT+DreHPb8?=
 =?us-ascii?Q?6yANJxWVdN7U0fyGu9ZDo+SJzCDMtsVjeXC3TPm9tA1ucD6woo3VtML61hmp?=
 =?us-ascii?Q?P8f7nZhTdxZ5UNv7R8U94h6QB37p7yvwOM5rb6rSwuOC+wcTThHHw0wkU3OU?=
 =?us-ascii?Q?EPp5XzArwItr2E66iAili/dssKSDTDuot52cF690AcJCmctWH/1X3YxyasHY?=
 =?us-ascii?Q?CDIgdj5yuUF0+5+3F5ZQ6tPvHNmaIkREOmUkOHCpihuYTBEDRtpe2RWRzupK?=
 =?us-ascii?Q?12Q1yfHtInLzSWJro6nzgTV2KTnwA1RUjZDhGQwxl/vOjt6QQko6S4EEa63b?=
 =?us-ascii?Q?kLbdmM7zbQu7rX3pgUg6sislD66QGphSdtSDRt5GDXIFGZT3D8zcX/Ok1ef9?=
 =?us-ascii?Q?85z0MMmc/+CuyvNkHWQAAuWbhyHCOxiit6n35shpF7VqcoVHi7BUQpQT7NBv?=
 =?us-ascii?Q?sYTxgTBBEsDWfqHKnreyHmg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a046d07e-f7ee-4d9d-1e1a-08db5763a7b4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:49:33.0720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2GTTmkAxgz/ZxbdpnceoY8hKl9vVUrhng+0kIldpjIuU7Qj4RFp9XxHcPr9/3yVYzKXLrGjTW/uqmrCtWNxyU5+Ury1ChfYUVtpfjuwnCRnzXc7wdRx5FlYCcZSVqF0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5325
Message-ID-Hash: NDK2WAWIUEMATGPA7KDGTOK3ATTZBISN
X-Message-ID-Hash: NDK2WAWIUEMATGPA7KDGTOK3ATTZBISN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDK2WAWIUEMATGPA7KDGTOK3ATTZBISN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b48efc3a08d2..f57911e4e4d5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1781,25 +1781,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm = 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback = !dai_link->capture_only;
-					dai_link->dpcm_capture = !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm = 1;
 
 			/*
 			 * override any BE fixups
-- 
2.25.1

