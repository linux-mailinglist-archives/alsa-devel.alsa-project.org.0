Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D920774EE5
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BEEEE8F;
	Wed,  9 Aug 2023 01:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BEEEE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535761;
	bh=IDkJ3BBlg2dVBe74tVaTcM1cVJA6Wb9n+XM2hfp2zTY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h7lk8jiKACfNFigPeZ4JX3PVOBrcqpeIGU4g+yjDByreaptV0eeSR3XW+5Cau9GyW
	 ZnNxipEqJsTgrr0SWopk5rOWkjntzHo4W/pe2ojt63N5whmuIZ5lud89BzLh9jE9AH
	 LsQADhtxwNj/aToyk9Nx/gsiapnsbQ9+s6NSWPMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39FABF8067A; Wed,  9 Aug 2023 00:57:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9E1F80674;
	Wed,  9 Aug 2023 00:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D52FFF805C9; Wed,  9 Aug 2023 00:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58E65F805AB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58E65F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nNBDp98o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJdtJHNGFq/pXTjG9ThiFD/C/PLHW4rVYlhIzj6sxPIXjvXZUM6QeJ2TRD/wS8Vj2xScoBzIp3pfcDYRSdTDcY/kEOKFFEixzaOv/nsMyNzVa/BH+kFjsfMUr3bsn/8k4IZWqXkRq+USmiB2MF8EtXDgol+TO9jZiZP70caAqx9AD46jEnfqf+o1vPqdSfalNEX9R4iNnJobDPxBVBCRnIrAx5dRvZbOBmqKH4jFbKBfx745I32YZSBHMbzSAgPCWZBsb0nvBdpD1flqd7fbupxWiXRCgekBbDrqaMf8jtB2LF8HEsCeGwPiQfkD/088ORjP+GaH496B8Fp3ryvKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weJoLN/sYOivloAe/dO5yQ2N8Te9dxGvAib49+3Y2JQ=;
 b=jb60Z5xQCFR4nfZwnax1sI0+2cfs9KNH7uBm7F7x3LXL3jmGM61GY2gLBH1vyULDuLJIjJVTNNTF8MZVFZFaKq6TwhOH8o4AdDBztJnYnTO+htgVFiF6/yitBAxGj2i1aQtqXzpRMM42ON9z+fecO20MNlEY9mLUGbMS64DsP/DmDS4vQlz6aa1BncaD+H2ApF/c8jK0zD/psyk5oH/z5h/uxB0UnpGeQ2QNw2QVjTTsfUzRjLr2dHMatCGKhJHgnfFi2qzCw1fB9hQb/SAiTTKtm+nuPA+7ZJH+VKfX9fAPTSsFqH7Q4GCmFtJ4Tmiuppt+fT0qXytbf8FD1wn4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weJoLN/sYOivloAe/dO5yQ2N8Te9dxGvAib49+3Y2JQ=;
 b=nNBDp98oILG6uv2Vq7lAlctQWnBfQaxivje4jv0KCBL/gHo597XqYK4v9DamUlmoGh3mB0TcXvOHwq9XTON3Nkw6JuVM74y5d4c/Dvl0KQ8RluyKSWMIXnQVHRvj9IijUwGQLw4d7JXEEnOCRW32XaiXOdnHqFqm0o1rahVMZzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:24 +0000
Message-ID: <87y1il9m7f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 24/39] ASoC: jz4740: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:24 +0000
X-ClientProxiedBy: TYAPR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3a2742-2f54-4dd0-ebaa-08db9862d4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	64+SRcx2wa/Wo5KJCn4W/2Nr8MBjszyXGhpPSZoGX31uNta9wFeCxM2mIa/KMA37Gm0aZ0U6FhbioZKjFvfGLvDk88UnVdFVF4N1eTGysCqY6Jg8MtWCPDJ8RYNYEDqd4xoOgzMVef0Im6pystwXvm+C2cvDTSbeshYK2l7Jwb1yNb3qADGThPVb2giIBr79cgvQFMVAro+ObqLuhWtAnZhWqFxevWjYbXN8vbaByl1rZSdLiPxln1KPKUD5vG6Zh/gftKSQ+qgyf0MLfFMH/OJRcBO//FWsQysO9YnAZZMkVitCyz5FJBvvBZQwRmkGeMg5b/gGC5JcVbozrRRNdyfvpvef+x2yyzUHku8BWZfU1r7mblJApbRXWKA/epc4mZsJ6PFio2V75QYLqDfCHNtRkyDSWQL5g1fFe887Mtcm4On41NKiN8dXIRMubzhSh5LACtsVuE3YzVi9GtBgTSkoxjeBkeLeyVs22QqpL4pmSawMm9HlqPp2oG4deBMsbWMMIJCKGnBzLpiFzNBNCQqbP0a+eGxrrHBuJt6Z8xB3RrtYeOhFSagoC8Yehdt/hhIAwtjenQFboUsMIHQbYPESARvmnUhfimuHwk6s0QHSkvbqtUZZAT191UmdgYVx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8gC9tFYmzDl1gOKKvAoM8dS6Cmpu+MrLRUkjkoZkY/Pwtdmmab45DY4zR4An?=
 =?us-ascii?Q?S1wbpm0FkbSBtvUjdG0Gtp1p8d1+892iQayXx4J4SaLpapFuWXz1W0+IvTNb?=
 =?us-ascii?Q?x437BBoDT818Rgpl7o5+vQCy9rSFudhuXulK0h1XXLLf4J0uAdd+md0BpzqX?=
 =?us-ascii?Q?L12ozImi0JqKh1Rp068FbSl+NWWBlN2hHon9GNh8W20TCiqcbHn3LWSKg6YF?=
 =?us-ascii?Q?LLJ0FM+I2PGDyeSz8t0RY6HC4aToYS4tJCRJHY2DH4hA0oldaj9SoIh8NYYr?=
 =?us-ascii?Q?l8NJpft6IEFPrTSabGI8PVrA9wvzeikZgXPDHzrJQi/4A18DUGPpxJSypA5g?=
 =?us-ascii?Q?1FrHDOvRSkPdnmrDxOac38bK07oLpEtYJ8/wqL6gDPMQpmsiCgsKCLhBBy7Z?=
 =?us-ascii?Q?QgOETY9p6sHHsZfw5f7T63XNCsB/ajA+gHa3zR5QB9IU1jVodFgYa6wINEi6?=
 =?us-ascii?Q?FDeSU8TCOiE+TZ5nez3mX+QZ7B56XhoqoV5XYCBY4h2PW2wJOxDvr06ofD/5?=
 =?us-ascii?Q?F4JE6BQim+88sRbGfefUqKsyczwAa/XqOYofWayVbNrMHa1eCqsI5EWmLJ+U?=
 =?us-ascii?Q?HhoNpieyOcgsBkFHvJRwZu10Y+7T83QMQaXxB4hyeQ8TqbtnAQ2tlov3sF6c?=
 =?us-ascii?Q?uFKEryPxzxhBwTEQH9Nwfj9DG+AfsU31uZZiB+Fw2Bu6SN59z/CclbR37mtu?=
 =?us-ascii?Q?djs72tNkxrX82ctqumF4/On7cFGg5Bn/VUPpIACRENf/n8H6f0beI+ZYiT6C?=
 =?us-ascii?Q?RtDL2F3T0qhRqme/J8domjhZLKQscISyP6FtvS0vdpw6+0UcEfyxnokZYT9P?=
 =?us-ascii?Q?3gq0dIQJmp3mN/53d8TPxCHcEek0mnoh1P1rnGSmd5loUY/3ilrgJnDgIRSK?=
 =?us-ascii?Q?xmL6YrOcYQ0b/SGbfF/PlVV4GQPh3IgVHt5rnmab3HDvzmRdX5IkRSYf8M1k?=
 =?us-ascii?Q?eYx6Sb3wKv5+Fcnbt191CQf7dp/QZfMG6VkE5kkEsQGKEf8z8ssFy3dKt35u?=
 =?us-ascii?Q?PZi9wQrgDBJ60uMAdPkY9xjoTi6tDHE4Nu/HMCD00rV7/TnurrDFibE7h5x6?=
 =?us-ascii?Q?BCfktw6PnN8dlCtAa/xr3VOZ0UiIJHJcr5jW7WkKERiEQRuhWpa0CjAgJ15Z?=
 =?us-ascii?Q?EI9bT/41CWBvKT7zplq7vn+N9aFRCmIjuGqatQA0CLn0WZSGBfyv8mwQm2v8?=
 =?us-ascii?Q?RP8xs9zhY3LGxFtsiIGcN+RCTs2L0WFUFIVcI4PkCEwycO1fvGtJVizs8Eyp?=
 =?us-ascii?Q?dzygPlN5lD4pfSs8GAVGwDRARBRYQfP7d2Y9ybyTFq+sV0goHriLIj0OKtfB?=
 =?us-ascii?Q?B5J+PL/fEgTZIOgsoZI6ai3BoqbMMdvJ03JQvUyN669XrsD2LUQKCjss+sZd?=
 =?us-ascii?Q?4y1dNxgEzlyjbsUTNPebEVMYZqvXi5xKLz2IoZ/WeR8NHwXpiCeGAhtzbVPL?=
 =?us-ascii?Q?mbHUSk4mOG22wcskeDcqKOGsRQ6PQxd+ATGykIz2ywBCkibnk4agX0HWQNJZ?=
 =?us-ascii?Q?FYSeknOwv75rmh5FFAhkfv8D3M0sd3NPn0uyT//VRLJwwmVStqszpT0lkhcF?=
 =?us-ascii?Q?qxCiNCF1ycS1il7afJgsdLqbwLc0aw3SVo29YR091jkhhoNhcAV9P22y1KFn?=
 =?us-ascii?Q?bBTpDk/irMgCby3TGwED1M0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a3a2742-2f54-4dd0-ebaa-08db9862d4be
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:24.7197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HYMRuea75hirt9qV7gERvJjIQcou4k5ROemztCk4rm4fsAIdpKkgFuc9+vce3yg3JHVZZUZ+bi/qjc+2FZlVIe68rlvlGpJ+T4ZqCn+0zLcV8seY96QMennkEPSQAAkg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: N7YTGPHHZW3RH3QEUE5ZG2NEASNWOP5A
X-Message-ID-Hash: N7YTGPHHZW3RH3QEUE5ZG2NEASNWOP5A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7YTGPHHZW3RH3QEUE5ZG2NEASNWOP5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 578af21769c9..517619531615 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -328,6 +328,7 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
+	.probe = jz4740_i2s_dai_probe,
 	.startup = jz4740_i2s_startup,
 	.shutdown = jz4740_i2s_shutdown,
 	.trigger = jz4740_i2s_trigger,
@@ -341,7 +342,6 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 			 SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver jz4740_i2s_dai = {
-	.probe = jz4740_i2s_dai_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
@@ -384,7 +384,6 @@ static const struct i2s_soc_info x1000_i2s_soc_info = {
 };
 
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
-	.probe = jz4740_i2s_dai_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-- 
2.25.1

