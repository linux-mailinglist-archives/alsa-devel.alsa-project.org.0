Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C5678E1B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:17:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A802E8D;
	Tue, 24 Jan 2023 03:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A802E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526622;
	bh=NgI+iqiNiU+Ubc6bXhDmiBoCwFO9hDTzrUjWABDyKAU=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ml9aHPAvXStPqG6bWBOk3ThVdcjcTZr3uvzuA3FqumQ3QDVdzgYSG6l/zG1O/CBRS
	 aoFQ8APEP2f4V7k+w93ssyCdwImgviOWRSpXuxBwBW6nhYdfGSor1Dxis9eVDg86II
	 MQrwy5Qt6veXmlXnIw6pMnzScy1MhVq57a3sKX8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A65F804D2;
	Tue, 24 Jan 2023 03:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72FA8F803DC; Tue, 24 Jan 2023 03:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62E22F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E22F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=T2hjwQEH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGE40ZLFL5kRhCIWLQ4xVUqMhjjWDhRCFxM0JIpZgaDOJkXPFb/vWXLN6T5Sxol5lLvLj1Xn0qrooKbWLVbrc5teweCIaY4jiAjW5Wc+VxRBICCvkbZ+Zenc8FmnjfLIVjQsseeBs5wvY71OdgJZvb+bLpZuoc3IInWH9Vg2RVDPal6EAOP29+whAgnDo+MzYK/GYrVPYhchvx+SYdxYzbKCFqKrOGxY4/a+zobb8jAqRCnbsouWRRdoIVLijH/Fc6TRgSG0kmLXcaRCerhGtqhXIGBgw8Urk3MDi7Mc+tDUIZItSb7GcyWpJ0MHuz+OHEZDvNhFtWWWtu3zfLX+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h52yfGmX289l85qsipnJHVZlnNYu7OlW2JlZeBfgM6M=;
 b=mzmiIaettevyH2iMk4Yx/Hv2myDnHKvGejlr31SaJe6A3pn23rs8ZxogEj21VS4z+BW7NhfnXlDK+DgbQvmr+N/dzWYI7Z3J+b2XcFlMPoM2OLBitKB2Ls6KzWln4DPCBVMLlKlCxa2Ju0IuFpXIE++B5yeYm/ytisVzoUhAsTXBZfL4EXL/8YTMiRwgG4c/Ues99F80lpc0m5ub4IHPNVOYXpiP/inD/MopTZqbSFGvkqbsksRhBmz3LAVUI3zyjRqCq+azMr6tPKcLQghQDJC0z7/E2NbwdyhL28/eNqNxpZnwzdhF6lIgG/DidDiwiylMCwGEvNqrpjUqukgiCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h52yfGmX289l85qsipnJHVZlnNYu7OlW2JlZeBfgM6M=;
 b=T2hjwQEH20/Lrc2/yg1EaTZ0mv3muRkllZYKJpoDfCNs5YqKdB9MT3ppNLxSesSVv87yDy3WbojnNeu57BZg+VSCEmVvyC6BAH4xM0RgDU/bWavdNABotFmQU9Yu0PsxdYGiji0NWjMV3bKP3LhhSjJOGUmfLC0wuYHSgL5Vv8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8812.jpnprd01.prod.outlook.com (2603:1096:604:17d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:15:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:15:38 +0000
Message-ID: <875ycwu186.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 20/25] ASoC: soc-core.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:15:38 +0000
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a8f81d-862e-4f57-7bdd-08dafdb0e274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lE828BK/T4pToYwJEotKwxwMD0etdmlZipjbR9AOuxRwXxfaFol1MfalEKpS54zAKKqpQtm2CZRHhqKx2c3ziig70868LJJZsHxwBW4m98btX1ziiUIC0HVM/56Bs0iJ5+pmMvcwcLIXmHNUAz+XufI8VhZ8STIdibcgw8oNbaBEStJDxbnEaX6L5MVJqGrApL5X1kyH5/UVEsO+nPRRdudn75JYG2SFcHX4d6riYWahfIFDkEpWISblejfDbLipAe1/YK/b2So3eL3wIdGJXkq96C5srzkNg0sb+nwZbHOsmVk4eKOhAam6E4rkqm54Or4VjG89E2J/NyhbiYO+MK2kAKPWzd9TC19hC7X58bpvHSLunGpq6Qd1ufDvkF2/e9uu/cPLGE9QEs8yEeWOmdUapymAB0EmGDlQzjAKLWvqoq6BfL4Bk9FKf0FJHVDOgAfJ9SxqHcO43/iyRhdiZcFQJTDjjAWtJIM4F1rTqs2nvElsoNbZ/7th70+pQnMO8uRouk6pdUhS760b6YwxjW5Bwl2QONZl4s0JtXXx3BMuBRHJ/MpMUpHmZYuEH7Dt7uonVi7SA0Z3b+iDC6GaNCkwwICe6yI/23rl90Ib12iXYVEeLIt2FDefgpf3GDyEKYS+7lI6wGBdzZhn//ZUMaAq+fWCPm7rxutvkxcDwluP4PLxb+5kMqiGiLSANqbeG2IGC2W1ZJOI3xVlC+PlDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(38350700002)(38100700002)(83380400001)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(26005)(6512007)(6916009)(6506007)(8676002)(186003)(66556008)(66476007)(316002)(2616005)(66946007)(478600001)(52116002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GItCdOXYy9/zXMeN/3ghFsqjtV7mtz/1wV0l4TZ2VCmQ+3WjTdHYEp5iCxkC?=
 =?us-ascii?Q?LqW3i7wzWhG1GV4oYeu/cyfrtiLUjh7KvTBS3IWZefiQKxXteLDRIDNarPDm?=
 =?us-ascii?Q?3Kqzhx5q9hm8oowf2VY7K4MKl/HLvVoOotUo5M2d+nEwe7REc5/m9HRfka2q?=
 =?us-ascii?Q?qLm31HaRmeW5uh/4yprFq76EW1xwfZkyF0jvkyfmzsmtP9n3npMU+tqos5bH?=
 =?us-ascii?Q?HrVhRwM6HC80qwCCgBHtqpoez6R4C/78QHpW6o+wDqNsVjzRiNCLnLtsDDHg?=
 =?us-ascii?Q?KAfZf7/UJo5HAtfdTS++XyxUDCeC2jfg4f0zsWAkjr9NQjgXf4kEzC/bNeQL?=
 =?us-ascii?Q?LiDjO8yrzCQ629pSS5/0vVCfMsz+QKMl5xmQbgdpb3zb7U/LsxLaXzS7lQRA?=
 =?us-ascii?Q?NXCt7SOYpscW0NfnKn+oQCPEB+VksJvZgnU+7Q6nEOx264kpJpglaPMAHDPh?=
 =?us-ascii?Q?6fZC5+jaTtRfg/qs3kUiLhXlnI4KGiVBtI2l5IhqYDfjU04R90QBms9vBe59?=
 =?us-ascii?Q?scehwoTKbWcJYgFeI8qXjCUKWHsVpkdGe2kNJFWY5cCwYITz8Ajy1yZlnTNa?=
 =?us-ascii?Q?1j65NkoJIO1EgurXuzOaGZMOU+9+usfVeyLI4T0iu49ZCpy4yzp9ogmvyGak?=
 =?us-ascii?Q?JDBJ3M7n3dczgzq8rhIBA92AyzdlEM1tF9abDXmfzfcZ70dIPMr+YU8i5na9?=
 =?us-ascii?Q?WElTybD4QsPD3UiseAVJoqckSUVWFtm6UuIqGA+AS8MId4iDAmpUQmUs8JRz?=
 =?us-ascii?Q?VCyFtKACr0TvrsZ1v6elIMDu9pDW+Vudzu58gJ0YtVgf5BPsxnleLOHc1tqI?=
 =?us-ascii?Q?bNcRfJdP7JJ7Xa+bh6QmXvi/r6EcGuGAjgkigIfF++SQ1FDNTtteJGlBZeed?=
 =?us-ascii?Q?6TFTd50xdXnQ6kGvZnNuZTn210iwhSpNukqa+MSXmHU5i1lxvU+22Svb/y/M?=
 =?us-ascii?Q?jwtX5OFD4TTHLky2Sg0rFulzKJmIRxiL9pqQCf8EDHA8tBYegkO+qNofTWIR?=
 =?us-ascii?Q?uuKk26KPvVa+DzqNkgmnO+Oykjove2sw3ZWi9ZcFDoM6WjdHaQCpU7Sbcq68?=
 =?us-ascii?Q?pl+xS2xqAP464rctO+nCmUzVyLDriwhSgOtfpEHLFGwiihB2Z+d40k07k41R?=
 =?us-ascii?Q?aZcJUpWSO8K5LBmq2rZkWgBfDLuJK1HHT3IZB1PF02pyJMM8Zb6zAC68whCx?=
 =?us-ascii?Q?QKmM96g4KF3xIP5Y+t2fjKYGTtcvA+iwmIg9//lHUaKGswNy+4EKJNAZI4u/?=
 =?us-ascii?Q?YgbhhqP1bzu6aBpxBeb7hJwvXydX5EAMW9qdCxAhGeaT/nxfWEzGyywcuX9g?=
 =?us-ascii?Q?J4wYWJCt/OqSQmfGY2nZQJW7lvEw+GAZ3RCmFtwlTM0TNvZv8r7ZeFDdO8u2?=
 =?us-ascii?Q?xr3BKL2YCYguSfD6Exk/6olEjkPQO+5ij/IRuhgbDHlWKIejDshveZjYI8aB?=
 =?us-ascii?Q?OhaFNrEuvTx8mKIi8d4yyhw1KJ1ugSa443wac3/jnul3AD0Fkvr5U8ZTrywT?=
 =?us-ascii?Q?ct3JbxZG9MxmG399Tw6vbBvD0xvgF8dMWPAq7zzONbtFZlofddwKrLW5cQiD?=
 =?us-ascii?Q?5ous2Adi5XiPI/0c6NUO8NlOERJED5eV+YyL8fBhU+ySh5hMO6kXIWmEgotV?=
 =?us-ascii?Q?BTtGgFlsO1jgOE1Wm1rdBus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a8f81d-862e-4f57-7bdd-08dafdb0e274
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:15:38.2796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zgwpj9/eXVs14JH/Y+i6XtE2LAXlW0hnsym8t/MTeXmWpPtfvQUaVd/3dMZpPRqRQpUsE4BEvFBjyC8MrQk4Bwy//yCHT8eWpRQXdVTWfH0yR4z+yPaUBdqzIziJXAl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8812
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e613698824fd..71b022f7edfd 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -553,7 +553,7 @@ int snd_soc_suspend(struct device *dev)
 	int i;
 
 	/* If the card is not initialized yet there is nothing to do */
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/*
@@ -695,7 +695,7 @@ int snd_soc_resume(struct device *dev)
 	struct snd_soc_component *component;
 
 	/* If the card is not initialized yet there is nothing to do */
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/* activate pins from sleep state */
@@ -1915,7 +1915,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 {
-	if (card->instantiated) {
+	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
 		snd_soc_flush_all_delayed_work(card);
 
@@ -2126,7 +2126,7 @@ int snd_soc_poweroff(struct device *dev)
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	struct snd_soc_component *component;
 
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/*
-- 
2.25.1

