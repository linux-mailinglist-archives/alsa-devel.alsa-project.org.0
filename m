Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E46EC3B7
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3CEEA0;
	Mon, 24 Apr 2023 04:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3CEEA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303995;
	bh=Rg4IMg9HSQc2Sr58+u9l3fWjEPnlBoiFdfeVUui35Ws=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NuQ6jeiGFs5vfqUNsw7f/O72Xx1YFcmz1lPPxIbwEyyNmHT1m9eQ17aWXvdB191yb
	 n9QscLK25m25cvc1MZmLGiIab297t0MXbvyRjbg42Ji8Yxnd5S5NNyH5bhtYlbC5Xc
	 f9mABj0x7z2EJNZG5ned/lRG6Mvq+EMXHaceY3Fo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50596F80548;
	Mon, 24 Apr 2023 04:37:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58F95F8058C; Mon, 24 Apr 2023 04:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A664F80587
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A664F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Tx+X8EMZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T07MfkCYgDiipOJQR7LZlOb57lToDBzMDpLyKFjrGlG8xWRWOGx3V5kXAWQzHf3fR1uQjH8bgbbKiraQY2MKURhUBBNHvr0Y0JK9KYJ2CsXAHTvUrJslYPd9Al7l95LNWDIXdTardZxY9NCKNJ806f3Pi77q2DlNnEYlVQ4VRMIM7o/ZZWWKeU/GgCKLg7wMf2ry8F7uWw+MPQoDSqB8MMv0icm9Elxk3wcWl7Pk+ln3OJMeXZfw3wAu+R13KjP4SfpjLdFn4LnB99yHp041/0LXCgrwgN3LwD4CctqSj/KaqNCQDsYk1iCHHbxXhJ4uLWsl5yh51PZSR0+siLRFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGdsGLXilvyRuqIfhQ5sQ2F04f/JwMzcCnoqTqDCXB4=;
 b=RqaeFVXAdtxVHC4ErtRdBaKQ2H7rQjYiNcFh/UfpidDVeUf3Jn+uGoNb9cNGgK68mA3LUWUqUmTBxaQawHoU51VP6fW4WSPuc5kP1+O0/FDhYC1mY/HOfO9ZfwO/I+9lTuA2BqAH6xbkEinL07r6usUre8DUB93IZ/u5KWmT5+s9jSbtDvagrm1fk2DDr/f0yhBwEy2xYfmqXwPapfrS2d2NdQYYk0FX7gAEZeWIzRBaXbCfoyxqpJqEecKCh+GVEYoTJds3KUJydBbRqXyhQb1lrLfbh6KAEWcoaojc+FP48JNLFnZuIkpeIKmcuZHjiR+xotA8+FwyYosa19kqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGdsGLXilvyRuqIfhQ5sQ2F04f/JwMzcCnoqTqDCXB4=;
 b=Tx+X8EMZVxT8pSN1oEqP6aEeSKjsx8Lna1V2dQgWN0KCYBtrGyRAvcBeGkH3FxEqHMsHoaXnvvLtxQyI8djcmYqT82Ne4nvWieM3vWYhTVERcTP6RVhOqy+8ubtEYiwiazBuFCH+XwLjv2KlemBmlp0Qk8eQajdjAErfCyAobNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:37:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:37:25 +0000
Message-ID: <87ttx6ypi3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/13] ASoC: simple_card_utils.c: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:37:24 +0000
X-ClientProxiedBy: TYAPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 7288933e-9a9f-4a39-1284-08db446cd67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nK65J536c+i3Y5827KXA+UUK6Knafsh2BZxjpm/8AhC6zDylYz68HblhzH35OCnOnSkexGJM95lKpSjPVXdmRFLru7LFPhNUiQV1xdtkBmgKGWEec8rwUPyemroFjDjPKQ0VxzSJG4hntlilBH3W8ZQ77qfzYGsvfOaV4K2wWAmhrRWTRsEg4rXeNJKwb7ucSuNdMicvbyv9T/JfSIBkqPCDSSsDIelLuC1Q3tDjo9IR+YOdHC1dHPvly1KBoNfCmbGKQM4hEUFjkBGXOpuYKToNoUBfSl3CkKifGrOJZ1eZrbHJquHRif0fNk2eYwM1wOWG2M1e67UpVvKw1ZPdcCLzQ7I+x91cl7BosKUTDIYQh8vObskoYCcgKJd0WKrBeYthWeNsQtQi7lMYs1XW4swogAuJ8ChnsEyfhBpvg4lw8iJDmQeXMHrNhFgbW74YWRQbGhpsQaZLt6sCz2sMz6M/U0uq47OZJXIbLuyq76ZRuVO2GOe/Q85u1oZq4z/deB5Jyy0fhpy1kCVZBPPAGa83FFcuaMtjQNoCDW86uls2h9Sc3Dix4rfSYDQRurllWBvzQxrSH+lem3VJtOBvmI1eo2KSjsQ7m4JQQppF9ZHDij1sqUxl+IsaOs+2ANeB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(83380400001)(2616005)(6506007)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FA1/sl7SMI+J87zz/OWo/moHHfBh/BB8Q8lq2v3PTki90NwYYV95HKPDDolc?=
 =?us-ascii?Q?tg/dw4V+rWL9FH55Mx1XI+gxZiaYDuoUM44ww3Jjjr1Jxl1YST5/w1kADEmp?=
 =?us-ascii?Q?hxMy6dA7tdffbbjzX8dGjpLmuHROuIouX57eneKVW6JUbhss9epmflPZiHI6?=
 =?us-ascii?Q?O47NInAT6d616Qn2mHNocRoZh+dfFri4fG2UpVfq1UgwrLKkUNEW3gaq9jMu?=
 =?us-ascii?Q?5jHOflW1wQBhZ18wWNO8JvMAD7kd4AcqN9pji2Eca8xtFDqaNqe+g+QgNEnv?=
 =?us-ascii?Q?aEg9BpEcSX2W0xTEeva59lru5I8E77docTbRpOq/zoVtxDCYmgq7xy5DOFae?=
 =?us-ascii?Q?Z3LdQWPW5f0LIcrqBGE2C89eTopBwnIrGWt8AUmgpUHm1uBvLoz2oXUGtPCm?=
 =?us-ascii?Q?gJqBqUVf1VE8Adi2FB/sN9O9mm4tA8RjM0Vp4qe/Is8DG/8BevU3tuQZ8r9J?=
 =?us-ascii?Q?9EwHwu/vCbCWJBIG9Nuon/d/Smf/6nuFgJ664PgFwI7oBOpyMX0tdDEcKv6K?=
 =?us-ascii?Q?kNplHTH6l+MBoAAr9J1dGqwDkf/G5NX6lbBjnxxTM9XglVg0fzKeg0Spy0fE?=
 =?us-ascii?Q?gzhjdnNefRqAELE66SB1BNSCONqHMuyJHYINJJBZ4CbFAuuWRn+k5LlyjkxI?=
 =?us-ascii?Q?HyUkGcmu04gEGF5vGSU80fVkv3Qkb0jFVIpu22rbcJN93shubK/mgQYqxIaA?=
 =?us-ascii?Q?8IoF+LqkhChP3PC7u/N+3tz+rgP/09cjDipjO1+nBBr5rGSTN/0AHCnNqrAE?=
 =?us-ascii?Q?MPMUBtWeeJVErY+4/MgwTqOc/PK78rJZgg83lXyzCzXO89O/WA0LoEa2clFs?=
 =?us-ascii?Q?LOJCKcf55tqe7W3t69dMUjhbDxxYe+U20G2vEflTBigd/5cnT7lonxaJ4Q4x?=
 =?us-ascii?Q?v27RUEC90xKhgEmAwQcFr6zu/O4ssxxt0zZ7PebJ6nff9xlS2iz50eT/mzRh?=
 =?us-ascii?Q?BlN0ii2a8TnEQ9PlflKyiP9sN7Z39MzjCtmuWBxcgspe7DatKJZZJxHkWUPg?=
 =?us-ascii?Q?NPHNFiUHI5B0VOyvD6cHNmzlCIBEtLT9ig1qFnYkCdF4BxT8oPm17MAj7+Qt?=
 =?us-ascii?Q?p+h/HpuabxYVaJppYMijKjw3FrylFdgih8N0qj41MSGjZn3CrwGlC7BotMKe?=
 =?us-ascii?Q?cWdAsHwvNdecwGdMghRCx/VAG1k7QwwrnPlFNkeUv0DM5o685G4f4k/oYgam?=
 =?us-ascii?Q?CUO9RhOVbhuO/f+zSCW45ADBk50A4jlHDtpOSK2n0TiiL8MwbB+xaXKBkOm/?=
 =?us-ascii?Q?jc9ZAh5bRTJHewxqpIvsI0jNa0DwFn0HLOwPnS0KeIhl/ZEiRBGFNX53JeEd?=
 =?us-ascii?Q?r7tx4q97o91zhgYq6pF7Y36z3+vcjjpowvxliljwMnIoZJ1Pj8Xb68+CT2ND?=
 =?us-ascii?Q?mo++RZpW66vOM1J9VxN7BFV22EUdqTF+yN0s36wRghRurwEFFlq2rP+onXAL?=
 =?us-ascii?Q?tLoUiSAbOLVouGhNwALByblbGLHiwPqmmvRU3VXjVM+ZyFyqxuLyg+1z8Lxe?=
 =?us-ascii?Q?Yq110c26sCcBlFjmqedRP5DWusWko6orfPo56oyRxz7deojPTI1CLh+WoTKi?=
 =?us-ascii?Q?XU3pKJ3SbWGrTDUvCV1LctiEzwfCdzWxNWDnx4K07TLdRL07hB397Tcytc6L?=
 =?us-ascii?Q?gHgVhrOG/SFNm9rsfrlnltY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7288933e-9a9f-4a39-1284-08db446cd67c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:37:24.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7xvG3JXFD87UUY3Cj4bEYzfxvdwZv0pNEfqiu+1ASkRaQmdy+dUeiPjsK6RkSpROAsUi+CRwDuvNLVklpwF3MjFHyzepRZzAeSiV4z99xpsghFbyUzNu6WPrfXUH63mE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070
Message-ID-Hash: 5XXDZCC3ZWGZSD7YM2LNKZ4REQIOIFVJ
X-Message-ID-Hash: 5XXDZCC3ZWGZSD7YM2LNKZ4REQIOIFVJ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XXDZCC3ZWGZSD7YM2LNKZ4REQIOIFVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 1 -
 sound/soc/generic/simple-card-utils.c | 9 ++-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a3f3f3aa9e6e..0e46f985eeda 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -73,7 +73,6 @@ struct asoc_simple_priv {
 	struct snd_soc_dai_link *dai_link;
 	struct asoc_simple_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
-	struct snd_soc_dai_link_component dummy;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
 	const struct snd_soc_ops *ops;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 467edd96eae5..b5ac0f0d5e8e 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -889,11 +889,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 	dev_dbg(dev, "link %d, dais %d, ccnf %d\n",
 		li->link, dai_num, cnf_num);
 
-	/* dummy CPU/Codec */
-	priv->dummy.of_node	= NULL;
-	priv->dummy.dai_name	= "snd-soc-dummy-dai";
-	priv->dummy.name	= "snd-soc-dummy";
-
 	priv->dai_props		= dai_props;
 	priv->dai_link		= dai_link;
 	priv->dais		= dais;
@@ -919,7 +914,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 		} else {
 			/* DPCM Be's CPU = dummy */
 			dai_props[i].cpus	=
-			dai_link[i].cpus	= &priv->dummy;
+			dai_link[i].cpus	= &asoc_dummy_dlc;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= 1;
 		}
@@ -943,7 +938,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 		} else {
 			/* DPCM Fe's Codec = dummy */
 			dai_props[i].codecs	=
-			dai_link[i].codecs	= &priv->dummy;
+			dai_link[i].codecs	= &asoc_dummy_dlc;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= 1;
 		}
-- 
2.25.1

