Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03572F0E9
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A42B4886;
	Wed, 14 Jun 2023 02:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A42B4886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686702091;
	bh=Kk4hZgj2JBYUPWZxUcJkqUvvPBWN3bcxwIjTTi5PXKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pm3DBEgT8H9GpAjp0OBBrHiWlEfOgKN5bb3bjEZPOAR0Qgz5lFMrWf8m4et2DQRXr
	 AupOsuKpb3njH2+2IbnbG5gGKJzfHaHQrVswgk2F2XOA9VV/3031fG6HXxA/1RKxRz
	 WMZPDJ2Bf8DVsFMMxIEXgq6Ho7C85kYz6D0a/ivU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44F63F8057E; Wed, 14 Jun 2023 02:20:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9E1F8055A;
	Wed, 14 Jun 2023 02:20:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02A70F8056F; Wed, 14 Jun 2023 02:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3843F80149
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3843F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gcdyyvyt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beKHmWAiwgvT7EyrRVsgvAY1ZR+J4vhB0KmFg2Ethg7KvAgzJJS9s5xcG01uJoFs3tMpZ4QUUbqB7Ipi89U3THbVSJM+3uWYl2WtltYhwRsSXYFe7LJX7HKXfCkxdoPs35hsuRJPnS+lC/WNn59a+7D8nQuYZgyVrDWphKyI1uK5RDmeYVuRYgloLcxByots5D+CBFW4gK2bosd6Ace2a2h0xPnNUiRMbn3A6YHCU4etfVXx+pEfAZNwsE02bFyd34H/qxD959d2r7FYPvxaE0usiCdIETXATTAW4NrWJsUWgbxtYhiNnHM/JwencD847lGa8gz63h0lX+Q5X4v28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW/EPAl/c4IJcKBS0EET6sZwcbjkC2xxga8RU+H815c=;
 b=YWXawhmI227ke0HyBU0y/1DqNOm9XgXpmpAr8V7iUpo0CtRcipBrDHc1nhdv6JiG6YP/RlVBO33w4KHYXgUjLQBFfIzRMUwm8ux4ZfqwGpo78c1UzdOuRvKEj4W9zLGSt7KFzTjCoewu1w4fix+4KemqKu0u/MF0SQC4hBd/BFtII/6dQsUXsztIU9+9BDSpLMiL9yLK85/+EmCZ7jbNK2LXuli3l0KKir3Dgezn44dF5tfRYZ3DKFUonuAF74hiq/03yxI/3tfO/O185OXYRbLa0xrD+yo6oBGZ3MxWl0zIWhOUBpd9+Y53nrATOktuUer1tZuoNtC6UGl5sFIGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mW/EPAl/c4IJcKBS0EET6sZwcbjkC2xxga8RU+H815c=;
 b=gcdyyvytYCZgUjbgl0JvgdIKoVKPHlc/FazZ9dFLjCzx9NJ1z4BuCsxPCuetxwdQVe8C/jp+P8pCrXJXszQM4HFfCXH4QL0taWOWRHSLrfgVZ2VxxAtiY59846ryINApE9VjDhxqarI2BAPwfIPfEtKbFwuAT13oB2GNxL1rTT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB11658.jpnprd01.prod.outlook.com (2603:1096:400:378::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:20:06 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:20:06 +0000
Message-ID: <87edmehp3f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: samsung: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:20:06 +0000
X-ClientProxiedBy: TYAPR01CA0223.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::19) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB11658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1607c534-0c6c-4c56-609e-08db6c6d1aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1IH2lLp5mdSo532S3oY03GhlpRw66mfP8DQfS1wvjvSaPPuMmn+7OGvRyR7y3I1zcs242eDhgszm6yKtRZtTXT1WJAVJ4UxH6KoCcbd0rMbjKjDIWSh7KzKn+elXdkMCfrTikWDs39V0btUfCaWeFl4D+LnOcAhNCF6xABB2bzSeeAaCWzGYW2D3zTO7/0nC3kiA4mwU7yZG0C+GrttHzIMisilqzNV7B8YrAnlKQhIwFaJ0ctcTPoA/h7JYli2VXn44fx5MasXmpkrIRMLg3bNq5xw4oGBpYBPRGREyeI//G8FPZ2KKY3GOjonPIUHIXACSVlPeoKKbBYKnTSOTLBt5i8DTVFCj5+lo//+vCCmgL7HBgBK+xq/2L37m+g8J8sqdiaO93pUeyDMuuf4mNxUCSwUL9wqqK2zCE94eqQhwTjHKy74bEVTWwW02SogyK5mpmGZqDvbMPmflUrjeDH2HZRNHlfTF395bW3AXGhZBtgybK1+J+fDKK5fFbNSpaag2ii+EbyENBoNc774r6k2KvUdppCd66tQjHrxb9OQErw43NlnbLqS2Cm2mHy0ZCLqBmBjOKZKF7jq0KiIYsggfSePh6pN7Tp7cTfao957iGE66VNb2UAyXz5jgB0bt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(66556008)(66946007)(8936002)(36756003)(8676002)(5660300002)(478600001)(66476007)(4326008)(110136005)(52116002)(316002)(6486002)(41300700001)(38350700002)(38100700002)(186003)(26005)(2616005)(83380400001)(86362001)(6506007)(6512007)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5oFRrrf2igNIpr/jPT5r2R4BaeyuGH1BiyOC3nt11bDUr8DDbm3d9fxCux9z?=
 =?us-ascii?Q?/XrfeppeHgT6CrcpW+R9LuHjGE9f//4ndlo5f359+SLbniHwmmXwJB19Oj3a?=
 =?us-ascii?Q?CbGpsV6s3ThJ2dFrd/b3clz1m1B6STOCP6R9NSWGmMaJZuqWxbfxzp0KYkVU?=
 =?us-ascii?Q?75gZwIZnpwi7lSfvcmCHxXEY2hXLpsXRFdV+hCZjx4qTqYcr/BdrNS6MXwzR?=
 =?us-ascii?Q?COd4J6yI9C5uOtoOGnElltltNtBjtZCM9rYRbExmkGGdi7wFkwH11qLUUFQk?=
 =?us-ascii?Q?yEeNCJpRMdwzN86mQ+PyxVaj8grQadeEurXiQ3qHZZSByDD+VUYW9PiD0BZQ?=
 =?us-ascii?Q?rX9665Gfn4QJT81+8qn65PpwPC096dOjgJMZ756FZtO3bC3A0I/QN/agyleP?=
 =?us-ascii?Q?2lR3n49HuFpwwdjs2IZzST8mQv9gel4G9J++GgzgIxJea9tCimmMvUNZXmqw?=
 =?us-ascii?Q?UMYHEj5x3vBzsnWMbuDmsrEWjM+Lu0itBjMiuFJax11X1U9Nu+WyNvWE+uXD?=
 =?us-ascii?Q?vnFrwQKphwlWI+WUOqU6Y4h7RrllkhrlwyMvW2SnQ+R/GPTJpNcBNBFYzsBh?=
 =?us-ascii?Q?in6u7vOuTjZVk1LDvcr7/nvP4sK0M7biABOI2TtwLVMA7X5zo3XG6xfrL8bI?=
 =?us-ascii?Q?u+EoxmN4dlBaoJsTmi77ivk0mkW2fmXtPERthfqH3zGAeyqHKRU+MnYYlhZy?=
 =?us-ascii?Q?1st318XsNZGn2BMII31mcRIKTT3DAmXNfkJML66eB9Rsq4fcPmvzOxlxe4kO?=
 =?us-ascii?Q?MK70iYB0q7GsRes0b2FnOpi98Ae4dJpwjQZPwhCXhs11VFafx8LAnHJnG4Nn?=
 =?us-ascii?Q?EaaWkQ6NZzcxybS55T6VyLS3qNf990oWtgrGeSOqTUhIlK9k40AT99ldrQmR?=
 =?us-ascii?Q?fF0l7lScDVnvU/zamWAKFNh+5gOvBvwM73Os1qMqpOKDABFrtzuJyMSRyhgn?=
 =?us-ascii?Q?2BPbIeHjHasR4GlWpRbnrHdo6I4Ba84KeBUVN2RSJ9le0UmaocANcsGAKHJ+?=
 =?us-ascii?Q?umjfAIQL8Di4ZzWjs9y3jcxLGXSfnwVmoEhmvGLsDBXr7xaHulDmNL9XkCRF?=
 =?us-ascii?Q?tMmw7CzedNA8z6gq1A8IqOPhBritgpTQQtPqNxIzuMtwbQRmmsxoGXGVM+1/?=
 =?us-ascii?Q?ZKAOJDt4Wa+4dDa6d71XbLpGnqg8s7TuFU0DkBIC5rSCsrsnzNlU+G4x5kBj?=
 =?us-ascii?Q?xScVj3WPd3U6AObJEB6xAbKvnsTU4d5pUGHYCQST4JoT8q/E+LtrkSY8yulL?=
 =?us-ascii?Q?Kl6/FTeypvodiCnHeubyr/2S19yoM4dY/wPvuKLGCfWokuZRGLviSEfKwTz/?=
 =?us-ascii?Q?y+ZwZJsto8rGsQUUD4nfGXot1mGDZuSuPY8Ny7etBOHT0YVJWP9vy/9FuYBP?=
 =?us-ascii?Q?bxGA5m+iZbjlbV2fHyL7QPp66fXXvukUgpeRHKbUTWHVPZkkQDu7mURZrwof?=
 =?us-ascii?Q?lO/W2ntVQmcs6xDxe1AXzsLxRB4+Lh0jSMVjgLZdiQc5QILMnYXz5eellTR+?=
 =?us-ascii?Q?7Zejg/IAd+joWBTwsqH1XiS1UkSe7540SUcOP0WJTS7GYitcW3bXfs9g34WT?=
 =?us-ascii?Q?XzHgptlwl9Us0MHBE98q2CIFs4y3plGysWXk5EMXh+8pBtT0EC5gUteux7qU?=
 =?us-ascii?Q?H6fYBxIy+u5ufCm/c18BFIQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1607c534-0c6c-4c56-609e-08db6c6d1aeb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:20:06.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TzSFynKz4AjtolL9Cq1u1z6wcOnovw6WQDX35MomxsP2nYnKRWYeoH/Fu9nIwcwoxCavDjTwPACoKTGgtDUBuVC5cKGL0RbQzmTkwtCgaz+lcLtdQXkRbpHTWR/I7ZP7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11658
Message-ID-Hash: 2HDLXNFQWS2AVIQH7FUPTDFTUZWC3267
X-Message-ID-Hash: 2HDLXNFQWS2AVIQH7FUPTDFTUZWC3267
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HDLXNFQWS2AVIQH7FUPTDFTUZWC3267/>
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

- note: need deep check

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index fd95a79cc9fa..a5442592bde4 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -205,7 +205,6 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *link, *codec_link;
 	int num_pcms, ret, i;
-	struct of_phandle_args args = {};
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -260,20 +259,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < num_pcms; i++, link += 2) {
-		ret = of_parse_phandle_with_args(cpu, "sound-dai",
-						 "#sound-dai-cells", i, &args);
-		if (ret < 0)
-			break;
-
-		if (!args.np) {
-			dev_err(dev, "sound-dai property parse error: %d\n", ret);
-			ret = -EINVAL;
-			break;
-		}
-
-		ret = snd_soc_get_dai_name(&args, &link->cpus->dai_name);
-		of_node_put(args.np);
-
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, i);
 		if (ret < 0)
 			break;
 	}
-- 
2.25.1

