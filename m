Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34FB76A4D1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 01:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090B383A;
	Tue,  1 Aug 2023 01:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090B383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690845970;
	bh=s7J77WKVfXpZe6ia16sxmkkcKr7kew/4h7LOKRsaeOo=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Mkuv72LmEHnCjja6M6YqdQnF7Sdlo7E4HXUxtwMF3Whc0S84krvACSvYky92XbAWZ
	 dgn+xI00tHPcSxpKMz0/J/29/Ffqu9SBWe05/Kx4VgVYdA+T7IGyXDNSpyJUwlpR0W
	 DrNImTHHjN9oFW4O8OaDhvvcvoc+TaEqJB3v7j3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2374F8055C; Tue,  1 Aug 2023 01:24:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D5FFF8055C;
	Tue,  1 Aug 2023 01:24:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE820F80563; Tue,  1 Aug 2023 01:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A39A4F80549
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 01:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A39A4F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jhzRBcU0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrZtEsE/Fj6/tUIy4F61qZyVsmW2l8uDhAKHfWFHAMt9Bbe/RydUrbE4v1WJJW7NqjqvcC47MRdpuEnvJLKzg7HUiHk/vJrZ80CYnCajjplAClyP4lGPsyY1AIZZlDgQ+luXqEXLF0ZRQ5nLB11PwCiO5MYbtwJlfLVs4IhwbaPwJHP7fi/iooENlxc0j/JystzJCwlCVtNdkU+eD/ZNn3WDvCTm6RqBu8E6bpByFp9TpA6HsHVfBYTM8CzEgCSiSJqbOcFrYp1h4EFzLzhXFoPWqk4UYXpd7OEaSbAmDuvrZ/sJiH6TyMznhwqfoEdys6rS3SRlHN0T74aJXD4weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OF8F6UjxRNjnLq+3va65iWorj/7TORGgnRiUCmHjuU=;
 b=K/XMDwB5YjzS+HyUvl+IsYvaH+B85njBX+LWug1FQ7MSUbsbdjeKsGjNjbr29nwC7X7pljeABS75fjptJsjXncF/lx6wzOZqbZyFH8RDGCqoqJl2PSp5Ayot++4CZbBaa+2VPvjfWytvP8eDMiG1z3tG9aBD5Z/RFsf0rOFL64oHoKWEo40ls98qOB0Zuah7GJLDXwHmHycKTm7r0jMohxEqjYs5AySeg6yWLWBJ/yVapzW0Nyc9KD0WALi826ka5BhcN2r9MxOKSaTVuqzIMyeNm3c+5JX5w64fGJdipuC/tJadwm9M/kDedlzV25apedzHrNYcETEeKdhEShznMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OF8F6UjxRNjnLq+3va65iWorj/7TORGgnRiUCmHjuU=;
 b=jhzRBcU0T6Txsnl5Pw3AapC6sCqCwscO38yQaPf3XSiNJZBaUdLPJdwy3Qpp35cInwggbYgYOp3emGu6oYHqBOXQ22kwlYPqpA19kn91MsJdyjn99Uyow2sD2NjLuCJ/w76C4CZhnm8PscSej2Fsj5bfK/MUu7dacm3rytztDsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9967.jpnprd01.prod.outlook.com (2603:1096:400:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 23:24:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:24:36 +0000
Message-ID: <87sf93psuk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core.c: use devm_snd_soc_register_dai()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Jul 2023 23:24:36 +0000
X-ClientProxiedBy: TY2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:404:e2::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae22b28-a5be-4e5e-d7f0-08db921d4ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	opYujOkOj+wStWVs4rCmRJ8/4YfA1X1rQv1zy1tDuTIxItNbDK/+YdBXLzsOHy5VbdJZJ9Eh46lW+S1+vfcjVAVzpYEZiJMxTJ4fUcEBEjBObqiL4IHUBk854qF17bIMhJGJe1AYq3pgOODC0sHPrIyAKSfdksCjSzGBeEEEc+Y55zJg5cQ3G0URaztnLnIn5SeMFSLZ0Sj3Jw+klGxY6Ve5PnaqVWsO/o+pD12zT87z7eCFLSOA1+oXNr5RstyHW/SF1dGWPkBWhrCNpWKkhJFq85sbyFT7tmHor51c9pupIiWex874LW7MGuzZfMY0rGAfU/PTXNDRcVDIATok6YlxmSGca41qnnCsgF7n26N3v+MbBq/r7C3t9fjtgACfFA0vvW1ZVjE0nNOpXNqMAxlIPkGWq7MYAimnSZexMwCIWQjsZ/iYa8XXyWiUrehfSBWkw1waO6Cs0WhOb7aJJgpYVl4RUpEfJN1hrEG5OIQXOTvlpcGRKVTQCC45Z9GMS7NT/MPhMqa6KvBL+meR2Z83/qoqgYLYLh7xvkVb0Cg94fw541ODVUDr0w6FKxgYKvvUIIOD7aa7+bG3tUFoB0u5wMeuYyCJtoUksW1QEQpBjn9eHhTWItLkNAVlBMGO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(5660300002)(66946007)(66476007)(66556008)(2906002)(4326008)(6916009)(316002)(41300700001)(2616005)(478600001)(52116002)(6486002)(8936002)(26005)(8676002)(6506007)(186003)(83380400001)(38100700002)(38350700002)(6512007)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w2TPJtbEJLNihIcOV89Q5NPk9hQaJpeZjQ1lJmDD7TAPHOffHiEefPOV/Y1H?=
 =?us-ascii?Q?Wxv7Ekc6WIO2OX13pxhJvLks47zL/Y/+UXrtqUKpgBt/fxIObY2d5TsY+fGJ?=
 =?us-ascii?Q?4yk9KohBlrVC1xPjHFbKsDZ85P75zmlIhqsM/XA47q6ah/tTUdOMeiDj2Ywo?=
 =?us-ascii?Q?MCn+K8RQ0GKXo+gaAvfwp6oRG61VtCZgetlYPgitK64T/T4Eda6KOC93R7OG?=
 =?us-ascii?Q?Zv5AiNYD4iUgItp/OP8iCrNK1bnnU/s/1pTViVBLphmnShqZtqIjhIwcozVX?=
 =?us-ascii?Q?b8csQvF67OCrHC42gq0dCmNIMrYTkLW4haT7zWPsHwoNaNtn9aFLCtpgzvWO?=
 =?us-ascii?Q?zY1uTiVrqGdhRTIbMJTwj4fvVNOb6sG6CM0zX6ULT1yFHpeXZCo3d/Gs5X84?=
 =?us-ascii?Q?ZwiZmwiQYVIKVY27WcRMw0L2FNjLtXLYuiwoqdI9Vc1N0JKn2FfnNNFOac3z?=
 =?us-ascii?Q?UsX5pSYELUhwh/7HajGg1MwJbLBN0FicecA1A4ypbB5xa3HOe8VbLYp3C+HX?=
 =?us-ascii?Q?AWz7KlpmyhSFT4i5pipS7tbBvTazgAWkgpUOpAsteH4Dy2dWH2pEMUTu+y5k?=
 =?us-ascii?Q?Fk4zpYncS81S3Lo0PoYEEhjAwhorTw8Ko9zpQoHxWxEJrrhKmcH53jYenAbQ?=
 =?us-ascii?Q?dfqmalnhZnEARoFN+kRKvsV5gMrZh9TBLAfOyEF4yMLwx//umzHoKorwUhAg?=
 =?us-ascii?Q?uRUfOy8xDS62PsTlJnq8w7AjVEfxGwSLzXBqZFyy0wnYAtiYlzdPVWZ6D32Q?=
 =?us-ascii?Q?2quYkRlT7fyOhPYblW0JqwzXbSkcanI9VOWGHdsvPK8ucPimjbOKfj/v+Foz?=
 =?us-ascii?Q?xGkrrnFmdqFJU9EQ0GH+udXb+rbj6jkZyTGZtEeMk6tasFDPd3SV1ngrJL20?=
 =?us-ascii?Q?IvoMmas9X9bXOKfurOnUP2/G20xQVNAFZB+bWjHsJv/2GocU6OUIQ8BF9RKk?=
 =?us-ascii?Q?VWVT7Zo1zkw0Nay5zRot1jAIx1FHD9DXfPMFzm35RVOKywfGPnIOUB9NZKrY?=
 =?us-ascii?Q?lkHVxMp7eQIyDLLO9V1sn+CDKtIkK8nbMzFl21UxaOTNLH9vSYNzJ9xKvJNl?=
 =?us-ascii?Q?/gf4m4cUYN7jUoBAYZVkNNviFtY1yunazkZkbXPEv1S8j1LpWlJ1haS+yPRz?=
 =?us-ascii?Q?8G53EPhvwGXsbZ7sI3QkA5PQA/W0M6VHJOl70tk9EUKNRTnQZPZJKHsjYZyu?=
 =?us-ascii?Q?htIsDf4fXhfdKAsRn9Pax8pOTfxFwXEkU9jP3kABsfSE5vZnsimC790RlKMw?=
 =?us-ascii?Q?aOX3gyw3vFFnKHw8DZ5Jt5pf2GucbpB+I6C1JszsiKGozgwVsMcrqmuPuWYs?=
 =?us-ascii?Q?y5DCNEagLiiGMNbopLoeHWtgwfsZIQ5lWVbUwHIIIUAHMsKv6KtJeHD2Ubvw?=
 =?us-ascii?Q?bY7yVDiJ9CwlIjGaqC/QYqPQKojl+LwwK2hIKV+CW6g9GlWuzNnKSQsPsBum?=
 =?us-ascii?Q?b1T1tnwVpI2WxVgg3VeriUoXyYN4XbDuSkXRtdIbf0DI+I+eoUyzbk2W54dh?=
 =?us-ascii?Q?AOPIK7kbczslM1BnJ4fKEDfPDvZ+dk5s5wYGCGUQ709EdcWA41Aw3/Lcrjuv?=
 =?us-ascii?Q?qZdl8csINI8Pc22Pkhbhiwb5Oix0ZpsXl+QN7mRA/J4yj6jGYCiK7bnB68Kj?=
 =?us-ascii?Q?SE5otq4UKpiLSZvuYdt271c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ae22b28-a5be-4e5e-d7f0-08db921d4ddc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:24:36.2413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3FTAK9G9N7EXfHshBX+CHUF0spmspv9Kfh69t7b112J0wMDKy9bxJL01kbFjAopeduS6Q3TbQiPw3gjhZqwY54tUDvBzdWmPiJQP965t7DFzH7xCk7tNc3yn0VyzXhkw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9967
Message-ID-Hash: RVB7L4XPYNI34364TGKIP4JG5TT7W42D
X-Message-ID-Hash: RVB7L4XPYNI34364TGKIP4JG5TT7W42D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVB7L4XPYNI34364TGKIP4JG5TT7W42D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is still using snd_soc_{un}register_dai() manually.
Let's use devm_snd_soc_register_dai().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 42 ++++++++++--------------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a5b96c17633a..7284363b9088 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2552,48 +2552,28 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 EXPORT_SYMBOL_GPL(snd_soc_register_dai);
 
 /**
- * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
- *
- * @component: The component for which the DAIs should be unregistered
- */
-static void snd_soc_unregister_dais(struct snd_soc_component *component)
-{
-	struct snd_soc_dai *dai, *_dai;
-
-	for_each_component_dais_safe(component, dai, _dai)
-		snd_soc_unregister_dai(dai);
-}
-
-/**
- * snd_soc_register_dais - Register a DAI with the ASoC core
+ * devm_snd_soc_register_dais - Register a DAI with the ASoC core
  *
  * @component: The component the DAIs are registered for
  * @dai_drv: DAI driver to use for the DAIs
  * @count: Number of DAIs
  */
-static int snd_soc_register_dais(struct snd_soc_component *component,
-				 struct snd_soc_dai_driver *dai_drv,
-				 size_t count)
+static int devm_snd_soc_register_dais(struct snd_soc_component *component,
+				      struct snd_soc_dai_driver *dai_drv,
+				      size_t count)
 {
 	struct snd_soc_dai *dai;
 	unsigned int i;
-	int ret;
 
 	for (i = 0; i < count; i++) {
-		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
-					   component->driver->legacy_dai_naming);
-		if (dai == NULL) {
-			ret = -ENOMEM;
-			goto err;
-		}
+		dai = devm_snd_soc_register_dai(component->dev,
+						component, dai_drv + i, count == 1 &&
+						component->driver->legacy_dai_naming);
+		if (!dai)
+			return -ENOMEM;
 	}
 
 	return 0;
-
-err:
-	snd_soc_unregister_dais(component);
-
-	return ret;
 }
 
 #define ENDIANNESS_MAP(name) \
@@ -2644,8 +2624,6 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
 
-	snd_soc_unregister_dais(component);
-
 	if (card)
 		snd_soc_unbind_card(card, false);
 
@@ -2696,7 +2674,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
 		}
 	}
 
-	ret = snd_soc_register_dais(component, dai_drv, num_dai);
+	ret = devm_snd_soc_register_dais(component, dai_drv, num_dai);
 	if (ret < 0) {
 		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
 			ret);
-- 
2.25.1

