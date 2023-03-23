Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D790A6C736C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 23:55:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC20ED8;
	Thu, 23 Mar 2023 23:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC20ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679612119;
	bh=pO/6cBYZgqojIbmU2hkTdoDX/SKG5ncLl0fBjpX1mZo=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lSXq6E7o9WyRszhZvpViYQbB3iLI7m91wKTe94HMu6G/kNWssbGT7k0fJsouE4uIJ
	 Ww0K1a3Bfe1LZh1VNtuAprnUO3xpvcht4lJd3DryNUyHgxX29EtxVr+s1oKkPAcXVN
	 IwBtkFfbBHFHTQwRNeLEM3q+dlbNLlPQseWlDgBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEC8F80529;
	Thu, 23 Mar 2023 23:53:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A4EAF8051B; Thu, 23 Mar 2023 23:53:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BC34F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 23:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BC34F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Djmxk7WC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OssDZaAvih57I+6Z4ceiIonvTcwTr3KhOf4Rm53m1uSV5RVUmPieBUAm4dDg1Ft7GegwZpA7Cm7V96Jl6Bzzsm63FkGmRpzp6CRjslXVO9Qq9wRbjsF6wSrsOcc6D1YOYKoMZq94ZC1GqUMi485dx6T5cUYokSI2zBKoPAg5g+X5k1EybMJudvawWso9hJg3mhAAkRQY3qzPxRTClhHtJMSitBzMVxW3n2uTnhINn/KQs2y5DEZ8PLLoz7VoTER8S7LXe0+7FQfC1BRrMBBkDJHLGxk6JHq4Byy0FansBRD+XycmbGWCNdSObAvBAPLdlkZfD8M+KMwEeDr8d10EQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34Q4mTxYnEK08iPwXjrHE3/A0ctxS7McbSWDe5iSSH4=;
 b=RxqStfY4FixAUYXdaAoB4CoJFKYOwaD4I71Lue47+CXuPelF2GAVxxEuPET964tVsEAqIDbIAyEwJl23ix9B8emVztf7wWWd6l98a7wKEujZ3L80Ks3fuo/cCoZyFizQctOmoodr8RJrdeFB2chz8IIgrbBIzBkrgFf9gHxwAWQqdyT0EuptBoF/fRgu1K6OW18dWRHQV2vy95nDEepkW7WWO9ytYLer0eAJVm7VgIKGhOXnMcsjEliYbHLgL+1n1P1q83CiMirk08vThMoUuP7oYstr5mnyTy2f8Kj9C9L3H70Zrw1sKrIzhVLgzRVHKLfEDroK5z/eeCPZbqpgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34Q4mTxYnEK08iPwXjrHE3/A0ctxS7McbSWDe5iSSH4=;
 b=Djmxk7WCAp0NJvu4vWYebDOqD4sTDH3u1chvQhcZbap6hwIb60+nBB7FPFUJvkBtDatJSoLwQdo6evnj938lR97D03MeIMkIeh/tHlcDbQbqlAOXrq7FX60Gu86ULYjji9rh5v3Kf/b+wewiq4ekdPxujAf4898pwArJTiELCW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12022.jpnprd01.prod.outlook.com (2603:1096:400:37b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 22:53:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 22:53:35 +0000
Message-ID: <87mt43jd00.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] ASoC: atmel: remove unnecessary dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Mar 2023 22:53:35 +0000
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12022:EE_
X-MS-Office365-Filtering-Correlation-Id: 405bb1db-982e-4fcd-1560-08db2bf16f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TltAHNksdVI/Zc6DWRok1Y7eYGzEU4Z1hC01WX27LyHiJMrTwRbRIskAYrJY6O1m9wMUg+iv5LqqprqK9f0ZRajl9bNM3b9fT9bsMovXhVNgFxx3iZa4gEKqaPIXomIA63Jgxmkj65Jols2NkEKJO16cYmQyCFcKZgpsEBY3CPQNxILBVYxr6qi6pLYDQRCy0XTieV5j6fCk9/FUkb8F4kopAC+OiTFHJx4Dmmgv7F3JGP4JTb/buAytM6IaQPtkRSzicniIx9xZWRO258UubMwUS9I2JnBeusg63PjvMUqk4aDOAnwYJtc2Nwizrwtsbea+WrbPIXbnZQGi7gySl+5OJC4VL4tBUtKZACc4SKtf3wiwC9//l6Hm6q1ks2Y0q4Gdi8hX8ew07TR8NPxJMReRWjlhBosaCZ6If1cooomsEuTrTBXz2vekyUxmXyRg3ogYVvEGt5fq2EkPTuJ8QkXcd4bWl4kL1QFqe1MMOeLRUYNMD/dmxAv5Ilc1nxjnstMyD0b+IUnSGcPb9qENtRDTHyGRsQv6UAGQFzaTWQZvP6fBQqWkJYA4apxoHhoj1wzdLh5iHYvEkDgWaLvYwcbOx3XBcHy9hZtdWNDE4dPEArt/6/dGZkD/nxdIq2O6yK8opmwsD102Vij0IyWKcAVE12xLN1P3qtVOQcjPpA9oAKH5HO0AiF0jTVSVWPh7PfSVKL5f30DfwKIIO6EUkA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(316002)(478600001)(41300700001)(2906002)(8936002)(5660300002)(36756003)(38350700002)(66946007)(6916009)(4326008)(66556008)(66476007)(8676002)(38100700002)(6512007)(6506007)(26005)(86362001)(2616005)(6486002)(186003)(52116002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xbno1qCQ2ZV2Vbm93jrPR/muzuEOGjtjmQQy7CJL4X7XouM/0b8lzcmK9V/Y?=
 =?us-ascii?Q?TJjxuLbzGUybhijjtsYiWdw7xPRtAlTzpsw0OOLhbaUoBKwrGxj4VJmCKybS?=
 =?us-ascii?Q?jnXIU8teS5kMYkwSWP4CDenq9xbJNBT9nrl4u/CRl98mO85xrjUb6xSwhFWn?=
 =?us-ascii?Q?k2yd+NYcvSFqF7LrS3GV2+qNQNJfcmeW43GN+EtibM30ecmOufd27+9taQdJ?=
 =?us-ascii?Q?DcT7WduOpEvdVx49f9VG+3sDD1dUee3rMFEqvomaB9K19ghooFu2qNwts8p8?=
 =?us-ascii?Q?RSjTxSZ0TyB78s23xS5gU77b9pc7vbz2Nwngt8AomBVDxTcT58Jth13HbrH8?=
 =?us-ascii?Q?Wq97KiyaS0b/xK3rHiNfl2fb6IQ4Pp1huVele6/Mk37aANz8Xccdbd+kBLm6?=
 =?us-ascii?Q?ZMwHAT0K1MiFRrxUOFNeZbXbYGQAF/dITwOi6i1gQs1Gret0qk6guLMS7KlG?=
 =?us-ascii?Q?ZFIkZQ2enI8rMAlehzXzfX83QmevIXCkMyJ+0lUi8HBGFiC3GFAOrbFfSec5?=
 =?us-ascii?Q?ZbG2RZ3097nICCdOSSJ97Dt3z5Yt1ADz7mLDyukZgXJi/wtZF6O0XA0lrIve?=
 =?us-ascii?Q?GaVNcGjWqy+2ZSDOckiVMlWOB9YvarD5z1JVQ5yCXbN/TNYIuC8jAcQ/67PP?=
 =?us-ascii?Q?4Yd6qBxplT4VsClILg1KGaDylKdzo+TiIqbwDZ+Nqp+mfumn27HDDYYhqHA/?=
 =?us-ascii?Q?rc1LpjHZNp+awS/GsyW3aLS2dvPOz2k6tgoZm3Y9MsLzBke5kcRbXV21tuYo?=
 =?us-ascii?Q?xHfTC7y5geuWwRuQ4eT/2zBQ5F3ihVkrKq/guW1q8kq+pRdQprAfDTPRQx1V?=
 =?us-ascii?Q?iPwo9t8oF5k9ucI+Jrqea9JEaq3iVHnscwi1k0glX1NdPNC8uKlZ605JA0k7?=
 =?us-ascii?Q?UjMKUhRUhHjHCkLR+0HDTJd9X9lSmlI9eFMfChj1a2PHBBPo8ZRwlPaJsh41?=
 =?us-ascii?Q?WababReQGCF5hm71YNnDtI3615b7PLIUMDCRxk0PxTvoECrNwwchmVKOHCCe?=
 =?us-ascii?Q?gSRr4KXPyu4/DM/fX7hdmauAyKNcLkFpiKBkd+bqwxA+cOlQm7c3JvTe1iH8?=
 =?us-ascii?Q?ZFFYW5E7anvyAcuUiRuCTpGH9O3HA9v+x9ZJvDfEWCK5wwrgRCYYoU57LLCj?=
 =?us-ascii?Q?COARZ0tALmuVliahM78KF95Vn6D6rMDHHX4r6qI4wGEt47SJ0y/UtAuZ3Pi7?=
 =?us-ascii?Q?YDWsKCozEGF/L687qtCfMxdreqCNjcaDoC0lm4WTyfzsrhe3MsryoFnQ1uoB?=
 =?us-ascii?Q?aOJ+YBa6ZazICBWkbLY5fVgHXiGirdJkNIyYrySdhd51s9LIexCvmDXXBr1I?=
 =?us-ascii?Q?nzP7J4uFueow4s+hfENjiQ9nnmS6bJIm8Kx8bu5hcUtDRhCzI95bKITBsEVV?=
 =?us-ascii?Q?dhuKVwGtVcgS+ALsMSm3gkIqVG48PHPKqjcpGqkAbOPKZxa/wvI0mFb/lmQt?=
 =?us-ascii?Q?qnWyoPyJaNFQwMK9REgWXLyfGjZcDxJIYRJ0UVhVE9ZjE55s743N1JmHhyMh?=
 =?us-ascii?Q?h3bJjYUx3PM0cu9WQQkel+Jes1UmZKy+xFq2GkGJFX9PnIBh144ct1bVYiUe?=
 =?us-ascii?Q?s3bSSRd+VWA2J/k5WP8jksIYRvCUVcVyANBXvY0YDTyaXdkJ7tCbSwdNfzFT?=
 =?us-ascii?Q?gRN/myiEtB5Ep+erh102TlY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 405bb1db-982e-4fcd-1560-08db2bf16f51
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 22:53:35.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bhC3PMt1yZtNa0dy46fpV45vdUVF8NjfQfAYO0TY13IkAdfSOAdjiwEb12zqSOHYsSOsUxgb9BtjSnGeTC31whqtpQxfWUY8Or2tsFLws4KLFdWMVRncPuN2tVzYoynt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12022
Message-ID-Hash: 7WKG6GOBOHYNQZL7ZLUDMP2A4AWTBVZU
X-Message-ID-Hash: 7WKG6GOBOHYNQZL7ZLUDMP2A4AWTBVZU
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WKG6GOBOHYNQZL7ZLUDMP2A4AWTBVZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 sound/soc/atmel/atmel-classd.c | 5 +----
 sound/soc/atmel/atmel-pdmic.c  | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 9883e6867fd1..007ab746973d 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -473,24 +473,21 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
 	dai_link->cpus		= &comp[0];
 	dai_link->codecs	= &comp[1];
-	dai_link->platforms	= &comp[2];
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
-	dai_link->num_platforms	= 1;
 
 	dai_link->name			= "CLASSD";
 	dai_link->stream_name		= "CLASSD PCM";
 	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
 	dai_link->codecs->name		= "snd-soc-dummy";
-	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 12cd40b15644..00c7b3a34ef5 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -496,24 +496,21 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
 	dai_link->cpus		= &comp[0];
 	dai_link->codecs	= &comp[1];
-	dai_link->platforms	= &comp[2];
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
-	dai_link->num_platforms	= 1;
 
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
 	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
 	dai_link->codecs->name		= "snd-soc-dummy";
-	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
-- 
2.25.1

