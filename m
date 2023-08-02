Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F776C1D5
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BBEE14E;
	Wed,  2 Aug 2023 03:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BBEE14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938189;
	bh=znRZ70XZ3uTi5nWOAuR3lDzx7+UVot55o79pDh3qtgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sBPEnDKgqrCCRxZTALbW9aQhP0DnxKR9OziXcMZ2Z/CC2lZ8ojtBHLfMj6+wpzNPS
	 s2S1vzauZNxs8OCCxGxTrgnzMguThrqWsZxN4iyWKAtH7v2oz8uX19C2yKxXVO4fTS
	 Lm9bqo6TkUlJiEyp3hdThN+N2pMxUcbRK/Dsv9Rs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04D13F805C2; Wed,  2 Aug 2023 02:58:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B08E6F805F2;
	Wed,  2 Aug 2023 02:58:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6220BF80676; Wed,  2 Aug 2023 02:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFF48F80674
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF48F80674
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YOrKu9qs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXkcusBzt795E5Afw+ABMHJUIYUUvhcHqX9vQol6a2/ex0pvE5R34n8Pogq+islzhSktxpWH0AaGErSw7kWVvtIhFA3too/je7Or9+t9ktI1JRD7/KwCj/FhgBrqlXJSzFYOM5ic+DQmfGr+i2FXG19dAg7YWaassz3QF1j8OHnlbnmj7ks407Sz19CbPZ0LXJaq9F5dosrJG7Xr5OsiwEkawfdEwytCN6ETb0aVk/WpjPh1y0u2wqlZAqzG9ls85fuIpSed1ZNJxOu+7wIp8re3U6qI+vGyGAZtqQdbyfVMr+rIqn1Zdy7asFTXmnhTYVPlQatE1+4EPiYs9eO8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l9+3PYE10Zu8KbbJceCAoaK4osex9ObXRpCr0zVUo4=;
 b=HKCgMULS+3WHHaeEG0d0YAQUxAl+Bl8pQWqrbZ6nLl/SM4V0exDqhSsCnAHusYqsX/2Fd7f91osL6h0RkVWyRrVzUpx86p9tzjw2jEPFSarxmX5fB2KxcAXO9qJb9M3vZUTKcWn4kxq+X5rpnsKv//utAShJln2a1FCutyBmxSOzkNd6L1uiDT81b5/KaC8xhFeFnr0pcQVHmwevI9LKUtD2MHiCv2+gvY/1GbcraSFBs7fE2NUa/10u5cZlVvO6eTv5sc0T7UVyN9u2LrDbsTfWbe2qXZHOwEj0c/MeIMbbpkOfOLJIlrGVhV14WMSdwC0evANiw4znYXHUvY6rQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l9+3PYE10Zu8KbbJceCAoaK4osex9ObXRpCr0zVUo4=;
 b=YOrKu9qsvMa3//oiV/T8GUiQKNzxFQI8wzOrQUu60S8ngFiC+jO18uTRDQA1pzXEcAC5vvXYpzXAaNRyM9xBIqLA4b1vrF1HK/3PofJmF6uKolg+8YIDMvudsYuqvYeFWlUrCWYiDK5/NQKf34TgI2QTa5vVctylJiO9fWVVidU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:58:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:58:06 +0000
Message-ID: <87wmyes1k2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Amadeusz" <amadeuszx.slawinski@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 34/38] ASoC: soc-topology: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:58:05 +0000
X-ClientProxiedBy: TYAPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9664bbb8-2724-4d2a-f4b2-08db92f38812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hD6M4O6K+T3cIfACX9ixzcVnUCdrc57PW2+Gyvr86oycflyuA8ECU96RkyKA4mB+ZuGELyda7TpYNm2B3PMsBKAiLz3QnMeSNmZk59/YTSLcu04rxBRQgRQPV1fLrWOyJhIvWvEBtoSaG3SDUdudewrn4ppWPeRRXVcSePIIbdABjqoiZTxant5w014+XLbVp0HTYPLbkxjvkzaZaI2di/IoHIKz2Zu4yqE8mEInZnbdPBml7AvLIJevRq/pjcJGgB2qe1oOVglXJd8Pc281wf3KLhykZ+UaFlroMBwlo4qFScjNHHXDMP3u9MNE+sPzp8nNgC+OZMVUWe3HlwsH6KnAEzOS4okzkwghhGKPLwdNSScPSbLx1wCLuDrJegrzyDsHxqr2rUWp6JERHP7X53MN7zmAQMOC2vPDWOID0HLw/4SNr42TTKWDIPrY6k4GYo0vqDhD7G6YPSoeOdjbU4f1HvumeZlXi4TR44hlelef0JAhtDMyAWtEqPaAkMAD+bhC+WfFRw1smX2cUk4EylAufuP730+sQSLLRu2sUPCOunziPOxNX8w18IXYIAzK+U38PNrtoRG2W9doa46/q2/IscqPu1mCu779twmWSgw1odVnwE+ZFPAuwrJk97C0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(4744005)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KELi5geRIbgCm7AyhaWD9ZZUlynmo8hwhNhLnm5D2UW7VRqA64SlZrtjxqQt?=
 =?us-ascii?Q?C1CzxjI+LHeJ9+HR41e9TCX4ynaS3knLkKQFTo79KS6z6+0qtWGkcIB0+E6w?=
 =?us-ascii?Q?6eUAj2IwYx7zW0m6OheneINo8z2TzuAUrlroCqiwdsHgj7npaFr0NfEDqI/A?=
 =?us-ascii?Q?8Tq6NM9dmYz1VvBSvM9hlyoCSt8Pv1uaIsd2RruEgGwXsYts+7GN7cFNlo5l?=
 =?us-ascii?Q?VM6W6Y+bxXj8C7qz7r/nVQ8SkKtWuPKrQGjvswENwDQ4D2RR2BbhIZr4l6YG?=
 =?us-ascii?Q?E19HaXIyPKAJJYEWd70ro9lq9YJ2q2usQAQfItKdLoytILfo/7JwrR62dwl3?=
 =?us-ascii?Q?Nas52DOQI1HKlbGtks05gnO194JmxzwPW3dTnu6Y/WSqtP/JoGzDj2qpb4Ab?=
 =?us-ascii?Q?OIthPEerv1yngA/NLAZj8I0tz0T7sxzPirtBC85iisyPcr0jcxqJTd7yQZIi?=
 =?us-ascii?Q?HZPKcZ1yheBtyG/G63bEEyOojhYc1A6J8KZwZ9lcyFu8jCVPlLHjidCrAVMw?=
 =?us-ascii?Q?v16pDLIVE2ZG0sk1VMibc8yT0Ubi4Fe5yhZARYaTtdcFGz0HuVvdCvey49ns?=
 =?us-ascii?Q?7By+KhInNTxpftFnyuaUhEg3qNnbpDvs6k8anVfAHgYaDFObzaAGgECzeLBF?=
 =?us-ascii?Q?FaKZLrytY58gBHOQCm4jn3KJCndxfR940ywhbCSrz25ZBR9yPtwIHqaTRUzw?=
 =?us-ascii?Q?Wc/1MP9GB7kAmzGkLJfsXo8jH6l37Z8mq+qepDl3ggJ/nDs48IKH+T+88IEJ?=
 =?us-ascii?Q?bE5nPfhKA2DApdApNGc2D9HI9J3700XqIBQ3CG1O7YgxEZ9jA/qUKu5LGZsh?=
 =?us-ascii?Q?LQjBecWv62RH5RXPXn3eLM5XUrwwJ6eW77BC5eC6pOwFNRFcSb5ud/SUGQig?=
 =?us-ascii?Q?mB7r6p8i12eK4nWZl4zZ6K63rVRRd6AVVSUhR7SJhEt5uzHh6CDrdUS1NdAR?=
 =?us-ascii?Q?O4FkmkZF69qT2RcXFzywhS1SHcFuV/hM0k9+Nof3Il+6RN5U08Ic1N88kREO?=
 =?us-ascii?Q?4jxNvUDmA+48+BZfS1FlpURpcfgA1c6MLD3ON04Q7M9LJIv0hNlRP44w5Tea?=
 =?us-ascii?Q?65eUR9l7/YneuZ9wJ09DFiABObxHYihP9JSI+/EYdN/oSgK91nqDQitN/lam?=
 =?us-ascii?Q?eyryjZFlGFr5IKlen4vghN7RxSyBDVsVwI2mju38T82xzQzkWbhkI4SdmjDs?=
 =?us-ascii?Q?z3NAA6RUAbPPGu9QKZ9t4Gk8rTaurRoiMg4ghBLSE0FD9cakP4MtPtLazpCD?=
 =?us-ascii?Q?74REVuOiMTJAsN1RqoUiN0/B/FDSLXzgv742nc+4K5zOODKCxYvDQsEFICiZ?=
 =?us-ascii?Q?MFqTvi08rY/KthGVQtnCJHTQ5t1lc/1bYXjar9gtTh1HAMOUUEAw+APfCHTd?=
 =?us-ascii?Q?WecXCibXTDb42Q5GaFaDDsu2cruuVb0smJ5nWCrIPo/CY+Eltah3e2Q+1ZKI?=
 =?us-ascii?Q?dHmHQXhkDLiaiteeCWyG2Y3XyFH879KzrvEDkR/ZPOiJa7Ye3Q8hKfUr3XcN?=
 =?us-ascii?Q?hrGQaxPIQZHB67Vv9ALZ37RA8FO9H9wybDpIRsXyk97zpPvSL5iDj8C8E6UJ?=
 =?us-ascii?Q?CyEWkkXV7UG1hosOUnIkO7BGlDFXGYR1H2Hb05w7BLcsi//sqocOffQ8tsal?=
 =?us-ascii?Q?Y/jRh1u18eRW2LLSeF0tBUg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9664bbb8-2724-4d2a-f4b2-08db92f38812
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:58:06.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cMn85h17Goj4RNGXDK283bcczng0GYpVn8SA0X3sAWNzYB7aHd/mW+86V5u6mSzwMjII94QoB6fIvHKNOqoxIDqKWHKdquNXG4xAqbqMbNB3ek7TPxXEjqW6q4Fhrq8/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: BDSZC2DY7HOVZG52XMZJPON2X2IDJUF3
X-Message-ID-Hash: BDSZC2DY7HOVZG52XMZJPON2X2IDJUF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDSZC2DY7HOVZG52XMZJPON2X2IDJUF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index ad08d4f75a7b..e783055b6c3a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1560,6 +1560,10 @@ static void set_dai_flags(struct snd_soc_dai_driver *dai_drv,
 			1 : 0;
 }
 
+static const struct snd_soc_dai_ops tplg_dai_ops = {
+	.compress_new	= snd_soc_new_compress,
+};
+
 static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	struct snd_soc_tplg_pcm *pcm)
 {
@@ -1601,7 +1605,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	}
 
 	if (pcm->compress)
-		dai_drv->compress_new = snd_soc_new_compress;
+		dai_drv->ops = &tplg_dai_ops;
 
 	/* pass control to component driver for optional further init */
 	ret = soc_tplg_dai_load(tplg, dai_drv, pcm, NULL);
-- 
2.25.1

