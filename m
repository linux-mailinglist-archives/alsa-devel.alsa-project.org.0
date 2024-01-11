Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF182A568
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 01:52:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BCCC14DD;
	Thu, 11 Jan 2024 01:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BCCC14DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704934367;
	bh=JNIEVYkWk7XNDFXjZpkNV/TgMOO7fa8FE/tgU4Bxdi0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LOvg5awEVqRHeDurbJ7ADN2G7EY8Mh4LfbTBnoHfw1CVghFgoYcXGhSPAr2XbWnSA
	 nvJ4qQEd7liIJfjFIuQzMbBQGXV6WIRzNYG/O3iMPTUfUyDRKuPcZR2v72auAQu9I9
	 WmvtT6Cg3NGz0qkIIe2dO3XYpfQOf3bKwItOysgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66AAAF805D8; Thu, 11 Jan 2024 01:51:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B955CF805E5;
	Thu, 11 Jan 2024 01:51:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33C70F80254; Thu, 11 Jan 2024 01:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD0D7F8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 01:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD0D7F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P8kGXMuT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJO+jkQ505b4cfrUI3UTclWTwfo6WJIpPM7y1uMvE1EG5NcNKI0o/xQtr60wmztQyyqvfeUMfsfrOrFgp0XQ+eCAEhDvWIWKJTagNKNOB0e0ymQ6ZokbTdtiyvjrmPpv/0OUoWYLpEmranqTK8W55d7A3XlMOg2muVIZSjCXNEZhrim6xPluI9fMXi0S/CLTH3GqlNOOjAGnZimiTgrk1EvhE4rz1beBliFOnoC+b8Uf8lmna9Er4EJMM+RrTC0tyi+LDgHF80lSPWF3JGWr/tE9nu0eC+zfyQXygh3T1HvXVwQG1QXMjjV8t+v/Vo/j5Xc2k4RL1UW34+Cxqc5odA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0UeY+Oi4ZyBu6l2iuEKhrUdrEznluqBJHCB6W3sYng=;
 b=KAQtH+wXkKS+5lRBNWXYrd7NGz/NdUgtuMgfz39eaZezwAWKwFFW5pJ2jMCvjVFMQAnbk+I8rKS/n0AJ8p21zmG7s6NFwey+Mr71W1xvzEn+RWgOE8zb/iEDOn9Kgy5+hYoG1yvxl5OjShg/5dd9J3WPfKwSEhKJKRbZs6tL93wLj7/CtX/HvA8j38uVyommf7IExJbVkVYMkkWTJH+BpaQLdRnljp1aFHkdScoUReX1izC4+y6dJxfpJ/KYpdDBdHtJ5NxEQ9HdOar6gV7Mv+BFYKJu+VqvR2If3UyH7DxXwsk4ik+3VkdLtHpMcKHFh1xMVzD/DtgGwBBUpozwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0UeY+Oi4ZyBu6l2iuEKhrUdrEznluqBJHCB6W3sYng=;
 b=P8kGXMuT2PDbf/ZJf7BtROTfVMJPYscxrOUkbaFMEkZIEv0KbrieYRxxN26Vi6TuaBjxEr1cjNiVuU/Gz/41A56BpG2Phq/upQ7p4lN4c4hACybaIeqxGLC8dYfxhjXdnqGgZY7c24g8QDaAvaiRw4dKRadby35HcC5W8Aza+7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10908.jpnprd01.prod.outlook.com
 (2603:1096:400:393::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 00:50:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 00:50:34 +0000
Message-ID: <87y1cwwv51.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v2 2/3] ASoC: fsl: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
References: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 00:50:34 +0000
X-ClientProxiedBy: TYAPR01CA0226.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10908:EE_
X-MS-Office365-Filtering-Correlation-Id: 40556163-9884-43c3-a4e2-08dc123f5204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7b8meLReFrx83hL8rRuyZjHiuhTZ0e8WDXySgzKeg7JvZzWaYngxecVhwMpMdLX0ZT8ZP7u93/GgOBAA+iJVZnbC+PlNsnS1Z41Mc8G3NdZdc2jvUTZZ6dcgvlBxG3SjpI3YMMah9NR+BSR2zrsOoMgoQAeLsGUFPX1w59xkwHGu8hZCwN+YUazqm4NQTvQYdhGkJLDGANqlYesvgSyszl0dPhDVl9mlAMKKk7dJVAeFMTd/Uuwi5axAB57n/umG764G+VZ7GFwIxJJnQZJkJ+QElk4+WHWtkTcDakYMWQ+JEBIvFFfZpVweSSq5WMb1S1c+hR8uXbAqQkrm6z3Rf+vYCZtKTMOJQQTWa/NyoAKnaWSF+yEaM0Cd5TDKF2iXRbYVvYI4Q8rUelBanfWGZd/L2cK2OV9gP/f69y6YYnHwzRYzZ5CtCy3YYD8GTeNe9Bb0XHa83ysaDyXkg3/miF5Hvg+8hH4AhpMw0b12rxKs4HccPtojbGHGLSkllw/6zQOZ93Pg4zVkKOChsTMcBWq9nGOvck9kZMCWpzVHYrMJK+HA6CrHFiQah2q150xM5/CiKczOvlKq1L8B7oNxm519CcmD9hw5iFAUGNNIKYAvToi2Xq6Zz9AAi6nwmwm9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2616005)(83380400001)(26005)(6512007)(6506007)(52116002)(478600001)(38100700002)(4326008)(2906002)(86362001)(316002)(5660300002)(110136005)(41300700001)(8936002)(6486002)(8676002)(66946007)(66556008)(66476007)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?buISTY2FBeSiF+JwQqDe6YAXYRMglNXgzRJ/CNMOwd8CJBcQTPLHxRMdky4C?=
 =?us-ascii?Q?vXx/ZHxdHTQd39bOOOObRI5LBIBzGqaPbSdTsasASUhdoLIDNaWbMPIMXUXw?=
 =?us-ascii?Q?zUn/1pYtqFGOyMqdQaashjZNfyZ89r4MWpUFMKIYZW9MXBNGwqUYnBNr7A1T?=
 =?us-ascii?Q?zUQnlE1QU9MHLtipRh2DnN6YzjCthWFoqjnbGFaik5ZRMsmc7OCPqDonMa+U?=
 =?us-ascii?Q?E2+b5dhMWNBmqLjxUMq1y89cDXTz8amv9b2Xi2w5mtwj1ZuPcTZKOFYC5Oyd?=
 =?us-ascii?Q?t1Mq51TKGaNFU05Fal2G/u5zRKL5p0OfT2drHqbwFaWZMQXhwfJb2LOxlKTX?=
 =?us-ascii?Q?FXtbHajoNitN9CJ077iSJIzp7gQ3ULKz/eP+VWMqYjrPTYLspjkNzMWtBs2N?=
 =?us-ascii?Q?r4SgHrPKczlzITgwYNaHuE0930swLrbLwN7gu2DfOsVrl5Pgu2Vr9/z39Hje?=
 =?us-ascii?Q?9itbBYRThRFFRAUeoJa3BrKcI4qDkjDDr8pJIavVLrrCb7ntr7aIf0OKzc96?=
 =?us-ascii?Q?8go52J008WT8m89btk2MGRRWRcEF9zOArpNscbPTZeAKdTN5+zMIcPeDzeE/?=
 =?us-ascii?Q?rGd49BH93Fdgc1OsYA/y0PV8r1phD3aENzO4wg5xRbrxWDLTYuT6GLPdgDwS?=
 =?us-ascii?Q?9DeREZQD6rI4WOsIHqpvr/MKprPTCkmiXS2kdgrll2bbZW+0B7yrKqXrnW3S?=
 =?us-ascii?Q?s7LLxbvICL8v+VQkCA7MfVD6RbU9D00J0ZR0IggA+PSdhyKhlUZ3GVYBjMbR?=
 =?us-ascii?Q?MiMiXr1CNcOrSepmiWJ/6rbfLEfhiyLXXMnxsFrPBAcwk/O92mWWhYQ1q/wk?=
 =?us-ascii?Q?ui4SdYAyzY+/0t3UfOiYQi3O7o/2mvmGSoveg9i6VBdNx5hlw9HYSjm7aIzN?=
 =?us-ascii?Q?tfkQx6jOAUrx3VRp2+Ylk/iooFyMwCdOMGd0hADFIdoBY/rnBk7CcOblDDqt?=
 =?us-ascii?Q?c9S/xVK3Cc9dgMqaO7RFgbM+Jpxdma+15eXp9OzjCz19fTaMadLCXLKG+OVC?=
 =?us-ascii?Q?I/hJJbIjz5gtz4BctKrfoGCEyN9xnH3L5O/n6YzhjFABs63FMNlmeuwl+8DB?=
 =?us-ascii?Q?LlaMmzS/qw8AjWvdmcSDHkqqL+g0Xm0eqwCVEMivHGNZth3J7hMUQLZub4yW?=
 =?us-ascii?Q?E+OBoHmB9pUU5hndtqk51NNdKmxY6gVFM/n9inA8LNuy9vJBNYtMg1jD2yJq?=
 =?us-ascii?Q?cq5VBiwB8IdIgj50TmByYBi1DSFlXTUEyqFff+nfizAmhKcPLKymZ5x1rkp2?=
 =?us-ascii?Q?HXYXXsRrYW49mMo4RqQdbfoHrsQh8Qt5ci/X4xeuALsUt00Zc8EnahoBUpNb?=
 =?us-ascii?Q?KzM+QWJcd5qkL/Ywai8zdwPAY3B/tVD/TgoDAE/6ZopF2x3RtmSIopLeyc1M?=
 =?us-ascii?Q?uofSozGnvOndHkjmcGP/SB60hNdXh+2xy8tz5a4JbDIFjFDGMUOdaTt2H0D3?=
 =?us-ascii?Q?cY5EcKYQkPr0CP0dsdCfiy+A+M9+LysfEROkGXMF1R2jHLpw5bbmQaEBtDmY?=
 =?us-ascii?Q?xAZP5hVYBbJjC02L3d9vLammd453DZKFpMpzAHH/fsETCk2Ju+Sq0KRT5RRg?=
 =?us-ascii?Q?xtu4xCdSyYf/6CGokKtW6jK63YfJ1y+8dc7GAYRQ6fh0HL26VV6mNnGrEWdG?=
 =?us-ascii?Q?hc1R6EW/GZtiGioG7S1VR28=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 40556163-9884-43c3-a4e2-08dc123f5204
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 00:50:34.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 54LCI4DVQDWenBw9we/fGl47alrXMDd3uTdttva8EjbdAQrZT2kBHrKZqJWiA8GVd5THqZO6MuTBBUddb/F/JpK8QRcFfIA/qa43R4iAQsLDFXpNK6vvZ54XKizaoOaL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10908
Message-ID-Hash: YEW2VSGZPXOPWLO56KHCEFFMSNZNCSOC
X-Message-ID-Hash: YEW2VSGZPXOPWLO56KHCEFFMSNZNCSOC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YEW2VSGZPXOPWLO56KHCEFFMSNZNCSOC/>
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
 sound/soc/fsl/eukrea-tlv320.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 63f1f05da947..6be074ea0b3f 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -196,7 +196,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = snd_soc_register_card(&eukrea_tlv320);
+	ret = devm_snd_soc_register_card(&pdev->dev, &eukrea_tlv320);
 err:
 	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
@@ -205,11 +205,6 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void eukrea_tlv320_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_card(&eukrea_tlv320);
-}
-
 static const struct of_device_id imx_tlv320_dt_ids[] = {
 	{ .compatible = "eukrea,asoc-tlv320"},
 	{ /* sentinel */ }
@@ -222,7 +217,6 @@ static struct platform_driver eukrea_tlv320_driver = {
 		.of_match_table = imx_tlv320_dt_ids,
 	},
 	.probe = eukrea_tlv320_probe,
-	.remove_new = eukrea_tlv320_remove,
 };
 
 module_platform_driver(eukrea_tlv320_driver);
-- 
2.25.1

