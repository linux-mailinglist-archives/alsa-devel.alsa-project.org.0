Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424382921C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 02:29:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDE7A15FA;
	Wed, 10 Jan 2024 02:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDE7A15FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704850170;
	bh=c5dxV3vUbnBCGU/UszbcUfP9BbkfXCjv7cfBWRuKtP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QrwD0AqXiZD2roCKd4h+mTdG/PhfnGmiXsMkEkewUaE3gjVNE0BZ3js7+ndXGvxPT
	 F/Tr926auDpPl2xCdfXfjuQd7ExzVkOrSxW+X6b8fc0aUBHqAKUz6gwk0hOc1UN+VV
	 8/t3EDN+csNieIgMVvwzQBPCrqE1XYxqEfmM0v84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7244EF805FF; Wed, 10 Jan 2024 02:28:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A78CDF805F9;
	Wed, 10 Jan 2024 02:28:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B0DF805E1; Wed, 10 Jan 2024 02:28:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BEAFF80246
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 02:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BEAFF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Nh/TqgYx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFKepGgk7sdwvU3UMM+Rh1dH8xzx2EjSqL8cuj1MXiceLhrVABkDLXma61lf++VmcVW5Quojd+4NchjOrZZB4ibHrUOnL07DhutmqOFyvWh5fEq1lCAVDWCd6mdmXQuu4tgkzYjVCECiaFv7Xg7oXEmorbL421KX0w6ehrPeAO/JjN7ZcQv5UAMzV9FCq2art9VIf3lq1OS5Fvv4W+hW1t+1aa/dQ5+r2GxWR7DYepLe2XN2M0gx/8T/mc+AGC01T07xcJQuIKAPnDXIVXZDw1BssrlRuoLk9cqgTHxAuJM0I5YHk9ekfdYFL6LHhXyBi07/0HC3fl/2LN2ahfwHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMKNKb7/eRewHqh1kCTHijK0/oa5FaqBS/vkXFg+1cU=;
 b=AS6KEyv9nsJbn4Q8sU/RI73vLKWVx3HD9ZrMN+8yeq449+i2EmtDOfQN8tXKYC+EN8hSm1z/JZk+uF9AMtGx+MZjFUpS9bs0nhuykOu1GX3EdzunNwDscLC5gwgLtP6FeK9iGXO7WZe4Sk7TG9fSP3ItUez6SKxtsZBovYkyozjPOXC6S1l1vedzILexolxUqWrIozt47bc6T1n6y8FHBsoAsUWzYPdYajj8BJQl/jDccTJBtbxbP8Yhn5JpOZnfbN5LCnyblyTIlwtdYvw+wM0FZj7dWS+A5VJpisFZqRsTe8sezdtz+1IqCr1Q18wJISUh9e3WmusNklaPpb9fHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMKNKb7/eRewHqh1kCTHijK0/oa5FaqBS/vkXFg+1cU=;
 b=Nh/TqgYxQRUdfH2sfx8ikJZW64G7pSNaKlVVJ3caPIeTYGNSOkUt+pOy6RoO+QB4OI6SjcriDCSSi6nQfvTqNgrcQEHSB87Kh60N1AbDA0fEZqEO1yQyooCgY7WifL9U8miKfbeFIKke9oFDBQd+ykQHOx4YmU9+4RZWnssTRSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:28:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:28:11 +0000
Message-ID: <8734v6geok.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Peter Rosin <peda@axentia.se>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: atmel: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:28:11 +0000
X-ClientProxiedBy: TYAPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c94e2c4-2adb-4222-6af3-08dc117b68dc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ao5Rnq+vbrPpaTpguHuUVPAbKrgm2a3QxAOzahbQ54q0whVqSy6jHn7Md5n+5lXf0c6QDmeuhMprUv1+QXtOgHE5/0s2Ru5zzftm1HTTv9T8OuZSFWCh+8owavmXwA7cW/Qg0H++2Y2v8la0krnL9+HJWpzViesI52LxXmVoJpbU+wWN/VbBaqw09tTH8hkGFYgDLY8H2rD4asP5e//+9CE3ZaGz0UjlgSprcdSgwp9OAetszYMc68Jk5INuxeSF7xhyhCRM4O3TsfhHxJ/3ZQemXKMt/O1Jm5uZ1RBlgfZKZv/n0lJYrcLWNd8pG9pSJfTti50kdKQbK0ZRk850chPT4UxGdwJ7KWXKTcJED88LZzWf1XtE9LL6GogtpE98w3zp18bYJD5o6Uj75TQ3k/8Nt4PdOkd2R/Cd0AOAMi7fSGOOg3bOJ9d2P0YGS6TACMv07f9G/+0uwRRUPf9eqa4K7cb0Q7JWA/0db1ugzuBU+yewfc2JnjL7EaYubL6gW+P8c2wJSW5U/UCiW54SRdccUyGZMtUazD0wVJsca9ems1CzcwMzJjpIXD3lL/DX07RhC2wR0Wb9F6PkcuRmHgUcK55QpWIMlahO4tzQmHs90Ti9qCE9yLG6VGxuBqmD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(38350700005)(36756003)(86362001)(83380400001)(2616005)(26005)(66946007)(110136005)(6506007)(6512007)(478600001)(52116002)(316002)(8936002)(8676002)(6486002)(66556008)(66476007)(2906002)(41300700001)(4326008)(5660300002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C1LFpdXPfc3y6vNAOqJ7kQv1bgijUVh4TTKdrDzrV/s8MlcBIFT2j5kA6yAm?=
 =?us-ascii?Q?pQCvaZNH6yxSryBu13rEISTBgJHudc2jsovnkAldn3klilSW6teVmfmtTA3Z?=
 =?us-ascii?Q?6xSR1ZNotnlMYRkKSwrU/MEVsaW9IlGAF5U3Y4H/y6V6fkO3qka+wPMtXFbX?=
 =?us-ascii?Q?ROzIil+bW4oVbltem7SKNPzpew3hv1Xnzrtb2COLOH7MpzrKAZQaQaw/fWm6?=
 =?us-ascii?Q?bvftUpaQooUAz9wZkdU/tBu5mUCYAkA+uBoc4pxhue6AY0vb4oVNWh7klZtP?=
 =?us-ascii?Q?RzobGMxAstw8KqGNBm91M33ZfyDAV/CermUCRyAHdPuPlz+VF99AwBW09Vds?=
 =?us-ascii?Q?XL+tIcX3SNMMfG2m7EjQTr/GXjLfUTwg20VyBW+GZTrWNeOGK+VgEqut14cc?=
 =?us-ascii?Q?H21Duva4ueuXmZiH9TMoH1IGaorWzjzpOvp29zdA+VF77061HFqB0JeLl0ys?=
 =?us-ascii?Q?7LzatIbyysyujb7Q8nw9JbNw9zw6QTNec1g3RB3rKnk5LOH4MW5oCnqgoNjV?=
 =?us-ascii?Q?gwKPveAtL9Vcw+n2mXPPaPFqFEyTzleHn90YBEkHf/4rmB4WQKntk/GjzxoM?=
 =?us-ascii?Q?dcrwri5Rj/aHjL6pSz2D+Wic5fHPc+v5FYaU59uR0ELv9k8AP2jFxTqiXxdc?=
 =?us-ascii?Q?5ympCgL8D6kaQpgizk7xG/Qhc2E0qUfOD2HQsSLDulchpNJeJYf6LTFBuM9Y?=
 =?us-ascii?Q?F46porr+g2gcjLiMb+vLebqM2fN/f219BElkPVpFK7Xi6aEo6VYTqf1E4Sjx?=
 =?us-ascii?Q?RcKB2Ye/QsHlspTK0ek9rd0yPMNU86mgDhzXBkLi34lOnADdSI1OOE/qxFbu?=
 =?us-ascii?Q?0EkgJ1xPgeKUYIGpx2gV+CutB3hcShaF1tDPQvdIHqC9Zg5TUILRws9b6KIF?=
 =?us-ascii?Q?gpR1kK/Um2GpdEUt6KoCuyoU+ZVeoNRMJUTgtRdnsZihcR9p2fkwkOIzmxyW?=
 =?us-ascii?Q?h84R5JSEedePBQrHi3GS1QS4TtZ3w5a3d4mQehzpQF9WCBVs7j/f82ANGaSg?=
 =?us-ascii?Q?WcjBn4I9+FqbhYg5mx97RD/XCFEAz1sGyiBjj/4JtVK2p6/esRjJalIG4Tn7?=
 =?us-ascii?Q?xYunQaZ/2dNo27uSGPWmkpjEVhjmKahNH0KQxuJjzz6yur8qct+vNUBjN+5M?=
 =?us-ascii?Q?4z1ZbK7T0NpP3oBImhRLu6F56bXRYontJMnExZvIFfqJgJJSfkxqsXA4eHxw?=
 =?us-ascii?Q?y768IboafW7DEbimSBZkCBBo7oEHeKJ0BUnCUxUIdwnG0585oBHBqT31fE9b?=
 =?us-ascii?Q?3Izs5FxLUEA7scdrxECKyzttyu1M1bP77YojxWRhz6S9JhCAdZ15reD9RF9c?=
 =?us-ascii?Q?4vBkojuB8gzhQ8tXyoenL1BA60zyZ/SGqGxXtUcot9c7mbt4vr809/Cvv2Af?=
 =?us-ascii?Q?hprSreOH45vrkwpuJxj9WUauqcysv/iu3wojuOEudLNP6B+W/tvpZR6P7FFW?=
 =?us-ascii?Q?qbIjUaIIZALKNqWMgWzdnEli1nPiwpELtq4gqz2ipQOt4A/cifM5U1LjVt7/?=
 =?us-ascii?Q?7Gmn5ahl77sBFTqWYXvUS9gXNq0ZEk9OUC7hHX8JIEKhUHGSQUAxKDv5VwN5?=
 =?us-ascii?Q?y/4kSLfjZhPytkS7RQaHCFrfb9m68MqKd8uNBjyotDkNBZMuCO50pVUGWfqy?=
 =?us-ascii?Q?wp6Bj4qtb4GkVsrap+j3DLo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c94e2c4-2adb-4222-6af3-08dc117b68dc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:28:11.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /esQ3XBRRuT8vcCKAdHEC0u4SkKXXOhV961V+oAGiIzjx9yXzdM9zLbFqaovePD8mwoOkXeCHVoTbVlv6bI6ORrCdlSkMG8nXocQWFB7rkLblp+nyKQELPJ4yNodrd88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
Message-ID-Hash: XE2RALBFYMNDLEY6FC5UTBAE7M2GBY4L
X-Message-ID-Hash: XE2RALBFYMNDLEY6FC5UTBAE7M2GBY4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XE2RALBFYMNDLEY6FC5UTBAE7M2GBY4L/>
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
 sound/soc/atmel/atmel_wm8904.c   | 4 +---
 sound/soc/atmel/mikroe-proto.c   | 8 +-------
 sound/soc/atmel/sam9g20_wm8731.c | 5 +----
 sound/soc/atmel/tse850-pcm5142.c | 3 +--
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index b7f16ea0cdfc..d4339145e6ca 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -147,7 +147,7 @@ static int atmel_asoc_wm8904_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed\n");
 		goto err_set_audio;
@@ -162,13 +162,11 @@ static int atmel_asoc_wm8904_probe(struct platform_device *pdev)
 
 static void atmel_asoc_wm8904_remove(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct snd_soc_dai_link *dailink = &atmel_asoc_wm8904_dailink;
 	int id;
 
 	id = of_alias_get_id((struct device_node *)dailink->cpus->of_node, "ssc");
 
-	snd_soc_unregister_card(card);
 	atmel_ssc_put_audio(id);
 }
 
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
diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index d3ec9826d505..8046f7a977f6 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -171,7 +171,7 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 	of_node_put(codec_np);
 	of_node_put(cpu_np);
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,
 			      "snd_soc_register_card() failed\n");
@@ -187,9 +187,6 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 
 static void at91sam9g20ek_audio_remove(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
 	atmel_ssc_put_audio(0);
 }
 
diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 611da23325d3..f280ec597a08 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -398,7 +398,7 @@ static int tse850_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "snd_soc_register_card failed\n");
 		goto err_disable_ana;
@@ -416,7 +416,6 @@ static void tse850_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
-	snd_soc_unregister_card(card);
 	regulator_disable(tse850->ana);
 }
 
-- 
2.25.1

