Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023C72F0EA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5B2836;
	Wed, 14 Jun 2023 02:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5B2836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686702107;
	bh=XK0ti3Ek5Ev6dC94EQFoYuIiwkiHzvg+4xJFrWOlkp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sji6+dD/mAcUrI3l+7LbCzfuqNwP/UDPSh8ZHTr3Cm8+aBf2QVlOKULU62oLPIZEF
	 F1h4mGfVTILofECv8wOD7VC2T8JL6tp+w1cg0V24dfMtMPcAPPYkh8CHBuYKy6K3hD
	 4iH0sXzdfuauzNtMEshL5XQaZ408jhhcqH2FGdkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0A5FF8059F; Wed, 14 Jun 2023 02:20:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A945F80580;
	Wed, 14 Jun 2023 02:20:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65D75F8055A; Wed, 14 Jun 2023 02:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B8BEF80149
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B8BEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=R1Fy5Okl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+voAX8pqJBiNs+tzlmPLkl9BEPLk7zpsnDmQmZyBIAddn0MRt15nYDY0zv2d8qmjk/PQfbf6E4tCUd7aUYOYlbycXjXBHOwBR8+9vA/9XLOa6VZ4/T3d766y3bzmjOV1B9oUl9oJVXnM+15RQKVAEtuMUnUUdV9ukR3Eddgq+2vUOu7lVw1u/wOC0Lh2UOEzv/AB56n5q4ZTwiz+Q9O2oB9bOn+Z/OIMTBU/5MN5JZcoK/s6PMnIeScyUNpdEWVCZ+zpkiAzVLMbRYbYg6A+EXFVQnVQqUuxQlC663ns/vGG7KHaBGZS2GnkI8Eyjv1cssa8dn7zzdkN3Gen4GrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn5pqB2VD84GHdbCVnkJVfXyoIxigbqfHBdEUUFGO4Q=;
 b=PW40YiBMNDj3XQreR0t6UDmbm0c2otJMEcYCkVJGXHLpF/GxCIGsUDXE8i3WjzAjLnx57f8Me1KEm0jSQo261DFH3N1DUfuN/f4wGautmfD+Y+Uw6OLDZN+0jSg/jLHuClF1/GXfpVJUPzl0W+GuNaw8vUkXFYWY64HaqZEK30pGfh+JULXTI6BHnH0kNyb+/iw5LX79GcFkyfl5U+KbsSPpOetvnq+pxksNrkfryCedJCgfSPwiRdSG16qylRAUOVc6v80H939bs5f3XF6yQ/+UCuzkMQMp8OAx+y0XOeq8tNtmOcOnmALEBeulInAZjErufXjmkflYhofiuuxlmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn5pqB2VD84GHdbCVnkJVfXyoIxigbqfHBdEUUFGO4Q=;
 b=R1Fy5OklXMXCbLhPBqQHbWqfOZ8B6zoNgNGvtWeVdrMEy2Sy2hRdOWfcRnhzcZXVZVyQk78ttTRwGOS/DwiNPzIB3ff80SDqZkyyoYUN5aZKewvMKgAFXTysYBIc359YnR0ycIF7GE6oqQgJyQATirkCDSALAEUrnrt8vK12Fws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS7PR01MB11570.jpnprd01.prod.outlook.com (2603:1096:604:241::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Wed, 14 Jun
 2023 00:20:13 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:20:12 +0000
Message-ID: <87cz1yhp37.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ASoC: soc-core.c: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:20:12 +0000
X-ClientProxiedBy: TYCPR01CA0022.jpnprd01.prod.outlook.com (2603:1096:405::34)
 To TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS7PR01MB11570:EE_
X-MS-Office365-Filtering-Correlation-Id: 88893e6c-e208-4ed9-56f2-08db6c6d1e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P9P69a9ds+mXimcXd54pqjGurof0mYma7yQo7lqJWV4PS2wBs7ED8OwlGFnjo6RsxsTRs1nCIh3D7L8I1IhtMIL+B0MZ+41ajoEXgAWbjt8f1tn2InN6jtp7Kh7W2cjXSmqUELYWNwuQgI562T6UYZU6PLuDA8XouTFTUYeR/o2ytaWpFHE2SxuuAbv4uvYvdv//77ttko5mB7HveqMCRvKGjKsBJTd7uUOWed5ao98SPPc+0kUBJP74qFVUG4uZ1/74fCbwgvGhVA3P8766I/fYFXkY1QqRCwmDyD2zlj3P7OR6DxJgWvEWOLCw4Takv6La6w6HQtW6+4djms6nKohmqgcK2xC5zX6DIX0Zkkd2w/iapFK45EQTszLje6k/PZxSnpcDxnQWmkQv+HA5EglLJytUvLEXr2l/W1gU8sbCDmD67IqOKxczel8WunTXqtv+AjnO5p8KfYtPNSCZ5ieYn3u6exm9ZYlQNFUqLBaN4dhTv17nUaT10zLbOi97bepSRjOcluwarZMgsME8IUMDW02kJPOdyrJ/gYcFRw55bFg0V67RooXDyp/p8HANQzxNDGKk0lR39PdP7bqs07TyLOpwMGfv/N3eRgoYZ4R+fqeIgr09gCrMRCpXpKTF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(2616005)(110136005)(6486002)(66946007)(478600001)(5660300002)(41300700001)(8676002)(8936002)(4326008)(66476007)(316002)(38100700002)(38350700002)(66556008)(83380400001)(186003)(52116002)(26005)(6506007)(6512007)(86362001)(2906002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TdvIup1fRvY+VGEGb/pPojN5glJACI9EVMQ7qaNhdkVc6cTS5l6dAj8qULV5?=
 =?us-ascii?Q?TVn/lHaLIz4IowXMFG/BoyUJEBjMcioKkbps0dBMJzuhmIEpMpL/YDbsf8w0?=
 =?us-ascii?Q?Ake3YVdMSHdlHYyeF/bkPvmiagbN3OrPeO1zLb5HEgTYzniR7CdL9hKJxxmI?=
 =?us-ascii?Q?hjWJOX+84zZaRc0CBhsaXm6ItUDSqZq/Om5vp48e4erHml4wRM46oFsu3u2M?=
 =?us-ascii?Q?pg4ziGI9gE8bqR0cymoaLjFu5Eqrs5ZX5hYwijA67KtvU8FcyxQ0jfDgQQvR?=
 =?us-ascii?Q?R1NMil96R9bZ7HFupzzB/lWeX6MIyTf6xcxp99A9wsTtacjiWJEPXP0zLsWU?=
 =?us-ascii?Q?sf+sIo8w/ACqXx8iwxPpxj02tPwtKA3VwHVSfeF0Qxv7m0m8qb0BoXqzpy1C?=
 =?us-ascii?Q?QZJ4OLD/vc8M+cS/V2q2T0uFeO1xfNn2oP7PEkuUbBK90hoJNh4I2PcJBrh6?=
 =?us-ascii?Q?sumB0EJS7YR39BcLj4ElEpW82CKTs8tCyT6RF6IjJgyncBf6u06S0ozgBdem?=
 =?us-ascii?Q?0IzV+dvwJ9ls5n2TJ9VrqJUYSIJ6cNrP1k+JpAe3tXLfNXJUF+y6AMF5vuc/?=
 =?us-ascii?Q?3+VxniPE9ZKe8aT4fAFq6TYlyxZx29BPT3oxaM0rwuGmJKxJC3LwZNBxL98a?=
 =?us-ascii?Q?GUInWUONW2f6icFHS1yemvHEOV3mA93HL/lyA7EPBFT3EPkmxkpnsQ655iXP?=
 =?us-ascii?Q?a1crvsKdo1jGMSMIdazs6lP8kwomdt8G7zJUSIZzaG6xIDOQy2HHUhw6euET?=
 =?us-ascii?Q?Gcu8+hIXPJCoPKpzrJPzOA4KGpuLV5YNfGaUDsrTsHJHzpGHV5MDSVTcJrCY?=
 =?us-ascii?Q?3Y6LyrKMAwRzpw6op3UjVaIaBr1jGMWsiDkO1nrTbPR4jtTRaeAzsxG3ZFU6?=
 =?us-ascii?Q?smD1euxKd9eRTIzx/T2MTB7GJVyigShamjl+7qfXFs3tSXqHOVrvOwbqvePU?=
 =?us-ascii?Q?SEIsbRhOJpvNovGu9CTdsCe43HuqcKcb7owmR7IZw0q4vwhJMgvNG6hXCXst?=
 =?us-ascii?Q?BXsQa3o0n1ZllClXW3ESa0RCwfoQxsX4su97sPSkAt3hor2zf7voRllcRRPL?=
 =?us-ascii?Q?MF/qw2MqUvn0C3K9qR+egTNCV62g9SIxWXb6UdQQeirodNv0G7SO6kqqoMvu?=
 =?us-ascii?Q?oCA4ToiEKSd7i91zuKviIJwd7PMP+Vm1rbNXPoZZNvjolyQu+3ZWOhJMBCmx?=
 =?us-ascii?Q?TkAJgPs56LchrZJ0xb5CHPYrryJJdPPVsdJgV3TCK0vwMU72ZT98plCfRRhg?=
 =?us-ascii?Q?FZn0hobADVQGHGUxb2I5wrODV7PLuKtu4Ne44vCitCZj65nHeYIkzey9Z9d1?=
 =?us-ascii?Q?e6wSLFJZitoHJbeWgR0CSk/I8BytxebcOLJK0tuGsUO4FeirKMi1GS9VI/14?=
 =?us-ascii?Q?baH/R+YsdVpowsJhG+Tc+5A5o+1Uf5XZ+dCKy8EgTXv0+HaCkR8mfYIBEclv?=
 =?us-ascii?Q?ZXFCZ/1m6xG2UPCwchk3v3Mc4iA+Gb33AWnw+3KQZPEL4gkg/2i7DelgXPdb?=
 =?us-ascii?Q?d+O8b56gTKlLHMlFMvLSazNRjmMAKND7lSZdfmyBJia7nip1G3UusPfUW0QB?=
 =?us-ascii?Q?jy1Ygcb5gs605jWtxD5N8pW5D2/DBavbAIscg6aEG56PYce2kashcy2KEMYd?=
 =?us-ascii?Q?52KcgrWjAIbG5BYqenq2gDE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88893e6c-e208-4ed9-56f2-08db6c6d1e9b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:20:12.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vlm8CF9ne8Vi9c45bp3TV/zBGJX/xiBSVYYabIJhfdVKJ4tgYIeTqn+iLWzDoywXhUGvSi2LGsnwS5bbHKrVnjIIt3AzSbn2gSyin8L6W7mkTmfc4rZvtQqoo9dC3bPg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11570
Message-ID-Hash: 4T4PWNSBWE2QZF5WULXTATNVVTBWRFST
X-Message-ID-Hash: 4T4PWNSBWE2QZF5WULXTATNVVTBWRFST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4T4PWNSBWE2QZF5WULXTATNVVTBWRFST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7b13b1b232ef..f06a20773a34 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3402,26 +3402,6 @@ static int __snd_soc_of_get_dai_link_component_alloc(
 	return 0;
 }
 
-static int __snd_soc_of_get_dai_link_component_parse(
-	struct device_node *of_node,
-	struct snd_soc_dai_link_component *component, int index)
-{
-	struct of_phandle_args args;
-	int ret;
-
-	ret = of_parse_phandle_with_args(of_node, "sound-dai", "#sound-dai-cells",
-					 index, &args);
-	if (ret)
-		return ret;
-
-	ret = snd_soc_get_dai_name(&args, &component->dai_name);
-	if (ret < 0)
-		return ret;
-
-	component->of_node = args.np;
-	return 0;
-}
-
 /*
  * snd_soc_of_put_dai_link_codecs - Dereference device nodes in the codecs array
  * @dai_link: DAI link
@@ -3466,7 +3446,7 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 
 	/* Parse the list */
 	for_each_link_codecs(dai_link, index, component) {
-		ret = __snd_soc_of_get_dai_link_component_parse(of_node, component, index);
+		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
 		if (ret)
 			goto err;
 	}
@@ -3521,7 +3501,7 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 
 	/* Parse the list */
 	for_each_link_cpus(dai_link, index, component) {
-		ret = __snd_soc_of_get_dai_link_component_parse(of_node, component, index);
+		ret = snd_soc_of_get_dlc(of_node, NULL, component, index);
 		if (ret)
 			goto err;
 	}
-- 
2.25.1

