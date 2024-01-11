Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0882A569
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 01:53:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20355E69;
	Thu, 11 Jan 2024 01:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20355E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704934392;
	bh=wgEmDmBQBur3e3n7WNwd/J/j4a5M08OXV5HTY8nyx44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Speo1Tl2+YWg7Ap1fjES36LA6LgQS77DKt1gMokGJO6/UakuRME+KYvaIlxDDJaw8
	 ScrhsbYbw1hhgdZJ8wOjxuu6OqKrsYZCkouNDsM4Oy2FhYUu5279Q/VOljA8invmoS
	 zok4TY8Hr0pqXWHp3zHC28MMdFLiDmZerPTvVwz4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF8DF8060F; Thu, 11 Jan 2024 01:51:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BDDEF805FD;
	Thu, 11 Jan 2024 01:51:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2AD1F80254; Thu, 11 Jan 2024 01:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4AA9F8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 01:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AA9F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LrSpKMpn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXFZd0ygJ7rPr0sjMHCkSYNgtFkLpahztl5ap17CUXMD41l64P/3PGPZq/6O/y9zGsbl96xCnXJI3/dfPQYFMl8Iqvt88VK5gd49p7CoP0twxbk7yGoliOQbu3eQXA7yyYgf2WquGTb0HZ2hu+AW8issQbSKc0iLFoRRUUpObdQQbezZwnMath9WUxQ8abEJCsNOqCjR4wfsY3ha61LN19xwLZv/tQbqlXvuvO5jh6b+fNtBi7NM+Q2I5DlK9+pD6P69eQTv6p7YVRdFGsx+FaSbbSKwc/51SvY6e2BFsmNsKSTb4A1XYs1A0xQhzhTuhSsWmtox7oJdd6466ul8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA5ulsqctQGkmlkhXE46nl+yvAM2t7d4kqamtwDaAhk=;
 b=k3q70nLa6pnNRuH6khF3nIkR7O8P9uQKBDsOJjt7OYzygZ9qptaMOnSlmhJnz0oz9TIxaO3ho8eH9ovlEWD9FdK/LZwLeImQHdRR3zH74xWRvSHpGgvowOI62IZg8Xe/Rimq39AEvtOib5/2g3J0sAGgyt+c14o8AJV3q2AD+cDADSixloy6YIv1u7OlzW0UN0iKSmChZw7EjwQP+zXctYt6hKUYq5V1t0gJ+Hzz5zZ/Sou0GY0orsovYbbBx8+85oj9zGNZNcEbCIyGCXTJdadFdCZYs8JJV6mwnYz//sRvxW4swwjKqrs+16yC0/iZjgteSB1MuvapxZmpbhFQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA5ulsqctQGkmlkhXE46nl+yvAM2t7d4kqamtwDaAhk=;
 b=LrSpKMpnoIgZ/boBSmGzBjhN/qyNvGTXjhKfUBEmdh/Ox2vspXjXiy+iYalI7zllxC/3lPqM9QvTKLz2+GahpIF7YOH4WkMqOG6BlGV1t+W5xfgiOjSXQYXkYE+Jo/0rDOpb7qy3QByAjNKccohqSFMnI6n7qVlWXjmVyW0uxfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10908.jpnprd01.prod.outlook.com
 (2603:1096:400:393::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 00:50:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 00:50:44 +0000
Message-ID: <87wmsgwv4r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: atmel: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
References: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 00:50:44 +0000
X-ClientProxiedBy: TYAPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10908:EE_
X-MS-Office365-Filtering-Correlation-Id: c29cf8e5-d1d2-4fc0-d078-08dc123f57d6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iWUgzuM/RTD8sOnF/2yQgj1go5+jqXRFeaiXnpUxAC75hpT8JcOXj4uhh0ayTKjk8ndZ9b9NzDCLgfgLMP5W72Eozau7CY/Z2l61gEzNhm1f3sKXKMgtK3bWy60IyVQO5J8StrGpyAOq1ukw8tlGrat1PuLy/OrSq8oSon1Y/wPd/1OY0GSXnvmYmh/Lig/xkoREDqkFOfN7Bw0H0mvAiHbVt00C4XliGnb8kV8LHNMLVBoWK+OlaGuLFalZu9ctoybuLaRzcNGfHZgmjHXhcvC7GFmV2Ehb02Xsxnrq+oMo9Ys+2bjSFldp0UAT+Xk2v7yOnjnVq61b3hgG90KCixxKKcgBaHJwzkZGL9NJCgemBswaRLGcOmsGcKU5mRHP9m2m7mAw4Yrv4otxst1w1iTe/RNAQ+flHROBBYIFJkmopSAwAjerM4fEzR+ilf48Jr0tUzVfeG2P+02h9BvJCErv3re5z49OV+8bAzSd70SbGSzGGjOZ2NyjY0ukg+WKiiEWyDTHIW3rdaWAN0gVqBePve/rAkc3gnynYbqGZAK2iA7cGdQ4G1IoDcty77yptUQ8fTU9DK+GgOMGogloDMe8FGudPlJEX+jtXNgHhbzxgHhWtxJBh3Si22He1oon
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2616005)(83380400001)(26005)(6512007)(6506007)(52116002)(478600001)(38100700002)(4326008)(2906002)(86362001)(316002)(5660300002)(110136005)(41300700001)(8936002)(6486002)(8676002)(7416002)(66946007)(66556008)(66476007)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C3Mq3tjcAiOZns9PPeOs/He3BNC0na7oHVsSpGH645DLr3mv6RgfwzkNNHCA?=
 =?us-ascii?Q?N/jOeihYrqpYfGlGAaX56DSfXaHSrTbEsYyMplpscCoTUV+F/z9nugK2iZ6r?=
 =?us-ascii?Q?Ycy7kYAmde0iHEYZXR0O3LXakuhghaTOEDXHWqBrsQ6iUVxJu+wlEd6eouSZ?=
 =?us-ascii?Q?uvlaaQ8SJu27Kyr6NUniX+oLhNp8J0sT8pLgKUsodykQ3siCNqrZya+qjSq+?=
 =?us-ascii?Q?BMgq4wd+5CLqdFQWfLLSQ2VO5yx4d7XlgKnq5KaycACWELji4z3Z1Wyu063z?=
 =?us-ascii?Q?aPUyYkE2tLouJHDtjk0WHBdg6L2QEwSqR1P8jf8rUWWL/fPHZeRnk4qQbMNT?=
 =?us-ascii?Q?HDB8W0furSt8WWYbxVw4atZR1GlFtvDi5V1GvnhcgEbCVQaM0MVaEJkWGuyE?=
 =?us-ascii?Q?mjhnurBk4ULyHTMS91qAo+e2WQArOHzyOEBDY/jM81oO8ukb5vpTm0SIzW2y?=
 =?us-ascii?Q?/4VmHMpflqcmXqEwhL0cHi4o3So/i5+VbgK/SUFyXQxkyGmc6ADt7a9h/iVQ?=
 =?us-ascii?Q?iE9R0dWL4vdSstIqC1mjPIJopOCMqsDcC63Lj5P3NkYECcylSiNjTVPPPr9I?=
 =?us-ascii?Q?yieqxKFd7Y3uhfLKujCzi9vghzuFMzwmg4rI82qAYqtMdGhJ0o0nISYLu83Y?=
 =?us-ascii?Q?e+V8t1eXjLlByg8Nbghqy8KTiYnx35SIvjsl19NwknPMUoT7NRLCdsexWJJA?=
 =?us-ascii?Q?bkIc9ymNAsacmV0iBXibWyR+LbJEzOJ8vx79ny6UyF2pWUkQ7nED9mJwvzAt?=
 =?us-ascii?Q?VsaKLvpYBNWyJwP9esaLoWf5KgI1SJETu+RBuhGRrBIsN2BuSwhjpFs8nPvJ?=
 =?us-ascii?Q?QSZQ9jeg8bTIRoLldiy+uk6gACSaEWqoVdKwiYhSOL/hsJATE6KPWMGu2uLF?=
 =?us-ascii?Q?qCLz8EVKKcrsjxvAORyQ1YtkKV5gg3kB5YfPeTvQdGEAQhEddkPFGkC/kgi4?=
 =?us-ascii?Q?1ltTAxGygo0arzxyN/yKgRrYXysgMtuPYekQElXLEadKeRquZR6tYZHUzlYn?=
 =?us-ascii?Q?g96C2gnUrKgNllndkBdwGwDUBNqlAu5MZbidr4ioKT8y4Lf02qfxteeIy88e?=
 =?us-ascii?Q?K8lZ7tLeCpgehNONbdPT+IzI5cYou2hxf6jyovp6jXlOxtol4JTBFAAT7L2l?=
 =?us-ascii?Q?Cr2yim9xh9G+nz/D0x74tWgG5p799FAaQV8lraJFO+zT/zF5DEhkkYrUufry?=
 =?us-ascii?Q?zalHoM7YgtgZ5zqWqVz9qr2IVlUkLIhpN6ZMNH8GqLvQKn8cSKY2rca4k2WC?=
 =?us-ascii?Q?6r3g0OifRLsit64orB8Wf1nGk6TMdIB5rS1TtjucPpRkoxoOn5uhBbe0KuFW?=
 =?us-ascii?Q?o0tl4CNOPr8dmu/frow5lGqmfQQjm/i6CWLpTITcL8JWTUEAWHRpPBmtDheT?=
 =?us-ascii?Q?l/e3qhPPvS6chusf1f1YWw2uCE+fl9FmnX+VTGmGE/gL7rMph52be3Tgfp6G?=
 =?us-ascii?Q?1iWWu1sV9gObm/qgiUJAX2NfeyoI7+8+a2SI8y7e4v3ZiFcQcIBe7K3en12v?=
 =?us-ascii?Q?jTew7UdDSXHKU1px6rAKJYoZr7c4iTv3Sx9EpVdXdaZtzvSLvfVyRttZPKb3?=
 =?us-ascii?Q?jpp6xvKkR8cCJn24cjh3Zjot5yliaB65INb7GdQVGbMb5z6SUY41MN5mvMqq?=
 =?us-ascii?Q?MJyvePnLlfLFDrcc0dRYVP8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c29cf8e5-d1d2-4fc0-d078-08dc123f57d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 00:50:44.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iQTesFAte9Kus1LA5lw18AuYQrDU3R4r52i07f4Dny9XSuRfdvkLT0tI67rDXRgdffdYe/pjEwg8LDjgpC7ngocbaomSaWb9WOCkLQ/MZOBS8+bFFJsVvG5bQjmr5Kgp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10908
Message-ID-Hash: JS2NK2TAQJXYBKVYAMHDZA4DYIY5THHT
X-Message-ID-Hash: JS2NK2TAQJXYBKVYAMHDZA4DYIY5THHT
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JS2NK2TAQJXYBKVYAMHDZA4DYIY5THHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let's use devm_snd_soc_register_card() instead of snd_soc_register_card()
and ignore snd_soc_unregister_card()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/mikroe-proto.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index 18a8760443ae..8341a6e06493 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -140,7 +140,7 @@ static int snd_proto_probe(struct platform_device *pdev)
 
 
 	dai->dai_fmt = dai_fmt;
-	ret = snd_soc_register_card(&snd_proto);
+	ret = devm_snd_soc_register_card(&pdev->dev, &snd_proto);
 	if (ret)
 		dev_err_probe(&pdev->dev, ret,
 			"snd_soc_register_card() failed\n");
@@ -155,11 +155,6 @@ static int snd_proto_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void snd_proto_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_card(&snd_proto);
-}
-
 static const struct of_device_id snd_proto_of_match[] = {
 	{ .compatible = "mikroe,mikroe-proto", },
 	{},
@@ -172,7 +167,6 @@ static struct platform_driver snd_proto_driver = {
 		.of_match_table = snd_proto_of_match,
 	},
 	.probe	  = snd_proto_probe,
-	.remove_new	 = snd_proto_remove,
 };
 
 module_platform_driver(snd_proto_driver);
-- 
2.25.1

