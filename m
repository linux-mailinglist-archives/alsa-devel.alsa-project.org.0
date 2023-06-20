Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1517736174
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AAA483A;
	Tue, 20 Jun 2023 04:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AAA483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227450;
	bh=jvgDBg5Pz6mFt6Aw8JP5kZwoH3rR8CB/o6/SJ09UzVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O2aScuG8u8A7h9McejaWaCzD3zvjfflVvoroLgvzRzYne5qESG/xKCVBsRI/HpG0c
	 j0sfduc22SXp6+l2uXXIEi8HEU3yvhg396RSJGD4KfeB495XY8q7+OWRHAo0hfXcEO
	 DhhnE8RrTRL45CKdHlIHT37xQrNlRz6J9koyBKd8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9E75F805D4; Tue, 20 Jun 2023 04:14:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80A82F805D2;
	Tue, 20 Jun 2023 04:14:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86102F805C2; Tue, 20 Jun 2023 04:14:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6789EF805BB
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6789EF805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N9HlhLON
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5+ZiUy6Q/lX4+WS/Q1sZzh6l7AUCRw32mI2cqWI+wuUXZss3qRQZ06LxSoNl6LT6dw44fnodcz2cGRvwZ4prWSq6asxNVExhjyynu5Cq6OwIwxrixY0CryakJDk9LrvjRewDGj/dZMvEZ1AgSHBOHPqA18ExJNX8zQcscF+t/wZcXZBO45DHIf1ZljXf1kKJrYUG+zB3L8nmVgGTfiPFsssk/08Q3WYF2tgodjnOOWLJo/uhwavaprN/rLZclv/OlaUgIigAflXl0VORdEllG2JyKBMVdKLCaTqagA1k62LruZA0I1R1vNiVpvK+ehjhcUgagrJG/Ou8RftLHztVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bphrVSZ4WxVc0rmyDdaUG1FiCqsqCI9ix2XH/iQOpsE=;
 b=f1DVYQI0+sQbXcBO5qVIXaoybXE8bygJAswOICw/EtGBakfaHQTAHMww5J7gtLOaGFJLRT096/WnrPAyN8YPbFcMmbBFocp/9EFYWPxf9hTeYyJ9MQ89wqzURuoAbhtAhV6mRUHMOnkoGTKKKRRhCQJxpkO87+SK7fBFSPHdNGulgthHBp2iujOstdKfGdxBgkkmuXMzvGliAj+FghMQ9Z0vOYSlYhbv2LC1VxB/zP5PSsRP3L8eLc5AEVQR051jS+uYsgUwmzD3XM9JFhEemck9U4OdhG4c6wTyTskUHi2VeQtFIPUn4xdcuH4LBS3azHhKOwzT0xPFh7XaNj+96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bphrVSZ4WxVc0rmyDdaUG1FiCqsqCI9ix2XH/iQOpsE=;
 b=N9HlhLONmldRdXBULW/WijTs4/5yKo91udnRqgtYVcK/4h2looknJhwcEh1yHGe5UHdGjYdMcFDJWuRScZldqeTHhqLen4l+pLZDsCzTvMd1d+4o6i8j2iWQ6DVI1ViFg9qdhKURVrp03LJlxvNP6bfeF241vUrfWZZ2snZjfCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10965.jpnprd01.prod.outlook.com (2603:1096:400:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:41 +0000
Message-ID: <87ilbidgmn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Yingkun Meng <mengyingkun@loongson.cn>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v3 7/9] ASoC: loongson: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:40 +0000
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10965:EE_
X-MS-Office365-Filtering-Correlation-Id: e822abd4-1056-4248-5277-08db71341b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s9y7qF6YU2rWDz0CrPbv9grOe2Kc1FBg3AlTf3CAK/DCTX3vbJvBrbjGEHiwISknVuEVO1PVjj9kK7D+mKuQ8IzZxzgUviqyY0+F6EV0Tp5v0mZam81SNuUdhuN6jYxnTbGM9JqYG398XYCeSPrjUHWTADSLmZQOGuItz4AASUhQXVBR3D0UaMVFisw0Qo5m0EHv/iDR1UsQGiT4UfsfNH27+ugB0u96MqEBHa5TkFbxKDblOWcLXokq53aFwqvP31DXtDZSN3mtcVFXWUJPaAbQ6t7aiAC2rM7aQRKE8QjOjVZAtVCVg6HyXqB1ha6bH41N2Xbuj0PWmOKfVXOf7Ai26p4A//1WKilYhaRB7XtE9ZoeR1W+irDWrAi52Fv/tk/yHFY3/Zx4SxC9IeSLB3dDUBC/PesYU+1jOCUSzqXYk+b6XuKhovuEUxSeQ9zR5isihYQUyOWY9w1RBhI/+FSVRCcJK+yjI7Nbui0KcT2D74A9JvsZaw84H2cmjet/ZipfDbc8jG/uuSJUba0lKwCskcjN8k/X9KU/DHPiKmv4ef/tcU92X+n/Uu88/FgA/txeRRaF5J/scSJhoqdQl/z+9U9uFcmNf5u/7F5iQq4Q8JpJT2z55729V01z/ToD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(83380400001)(2906002)(66946007)(66476007)(2616005)(86362001)(41300700001)(5660300002)(66556008)(316002)(4326008)(6512007)(6506007)(26005)(186003)(52116002)(8676002)(8936002)(36756003)(478600001)(6486002)(38350700002)(110136005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DlQEfgfve+/aTOUJknk2TN7UWoAqXnd9ybYZUkZwHNmMFQ/WEeYJwLdV7oLP?=
 =?us-ascii?Q?AGS54x2QInXKzi+/OJYW3BEfspYcVT/rTSW0uZEQyaZxnQfVJ3wGqpG8gEsH?=
 =?us-ascii?Q?+LpR4k1Wd4JnIbGMaGwP7WGRVLBAFwj3PHrD0HWDTX/+mnxglPjLqa1s80VS?=
 =?us-ascii?Q?7/aN5fyRwoLSXdLCrlSeVHS4HpzJJV8t4VyOnB6kAvaRON24ZIFJLqzLhI+I?=
 =?us-ascii?Q?arhSCdCj5LNSp8dUDtq2yomfy10awc0/dbuZn65dOfZ9ikfKTOtmZsXIMRMp?=
 =?us-ascii?Q?exBaPDhUdwnArNeX9QAwAWIVJHRzPI7NA3nvWnvP7cZYgf4JamMhyccNu/tp?=
 =?us-ascii?Q?Ql8hAkv4H8+N4MKdV0kJJS+1bHz0Z61CI0i7i0QDLfgheXyquqjxzL5BnSYl?=
 =?us-ascii?Q?qB4Ja1G/7o/YVaHYMNzEn9keA4H/igTOv4lzq+sr5qAuIhzRvUsHOnfsA+Px?=
 =?us-ascii?Q?Wz+swwMuLTwrFQk7IfR/A6LhcrAJs21Ix4HgNP0crj/i2oSt1Pzd3O16Z6vq?=
 =?us-ascii?Q?M+3/q5fWrI+6LBxBlhv2OY8Hi05NoTXP16hFmyEb/CZI+JPNrihxWYYQMbvV?=
 =?us-ascii?Q?Dxug28JxPCowt4ZsNGYs/JohbpKutfsl1PpvtfY8LqJjMZ86KEUoeDyp98Fv?=
 =?us-ascii?Q?WC12K4hhAZRTgV+M68ieEDHINfraiV75gTsda3E52vUjAp1rHCpUjjhK2oi3?=
 =?us-ascii?Q?Q0ph1ryTEuC+hHwHHvlN5b4S0VDKo1tmuNdKf4HlLzA7LyLZewbw0C7Gqg7g?=
 =?us-ascii?Q?HAWiMHJEruHXPUkBvbg7+F24Hv7NF/9JJOPlFKCtohRsJS672xd26TmfmNiL?=
 =?us-ascii?Q?6IDo98VUjV6L28SHRP/9O0IY9h8XzyvjOePSCJ5MkjYUor9qQSt2L/HWhElB?=
 =?us-ascii?Q?CR8QnH9553CGA7GpXk8nNcc6pFWs5rW+H/VNlZoHKAEfTjMSNLFISEKB1yKj?=
 =?us-ascii?Q?/fNcb0zMG+8ZNVDWcW5OTJN6WeL2sEghvTLfZGzvnqD9V4qDzF85i28T3cFC?=
 =?us-ascii?Q?Q29nRTksOuOgYeVvOwujuvKvYiNSIqxDOvhMVNE08y3Tv5JpzZ4K7ygUZGLf?=
 =?us-ascii?Q?RyjqPT52qFnvxa3VIJMMAGIVbPxNuKYC21gKz3NOXqJrXIjWLsoUURWkkcjT?=
 =?us-ascii?Q?XsZaOlFZeuQEyW4kV7Xq7xf+/+l6K0GZnokbuhNrQhL/jsO8tUeQKchq+RHf?=
 =?us-ascii?Q?SC0EfJqp4zWWa4F4ykCfVDoXvbSFS8IGZgfNDO6/lNHUEhdrRUy5pL4ZOGkb?=
 =?us-ascii?Q?CxQBSOV118SjfMbqwcTbL/zs+lS/tPLeZJZz98ek6OetvAYN26myLcILt+r2?=
 =?us-ascii?Q?HnSp7mJ/Iixrvv3cHQNdePY4O4uwe5j+IEhEX8EoLRmSzgIgsZs8Knh6Ey81?=
 =?us-ascii?Q?s44EM13mFhemTqU/FvX8/oXaHGtFLHcltjiUMihaXtlF8p2Ds3LFxb6vFqDF?=
 =?us-ascii?Q?rxDrZ1BV+1zESEdX9iY/YuRqBChZ0YYCqwG0fao41lLEbTFL3/Bheoqo+w7v?=
 =?us-ascii?Q?kWtzr+GvZ0nus3XurBIiE8AYWmD72buOVF/ZwAMxwgN2RN2IXq6EsBHpHP08?=
 =?us-ascii?Q?kiHS/6R0lQtJLe0o3fu6JS3j8igm4bzDx9mtD8f3Vw/rDyItlNBr9LkDF7gX?=
 =?us-ascii?Q?hXd1sFdVfHA8doaIiE9pEzM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e822abd4-1056-4248-5277-08db71341b1f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:41.1109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4zC1crX5qqwlrFOuPLDFxBK/a9Is6Y0nCOtfWpoI2szd1D3VtFqT3FBZlWDNCuKMLZEUc4DIXYTdgSHJZTh1EIYYdjz/Alvh5HmedHLV4iVRYDgN5PNcmD5QmVNoSWO7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10965
Message-ID-Hash: JCKOYTSWNVRENOYF3Q7QEIC7VL7LCSRG
X-Message-ID-Hash: JCKOYTSWNVRENOYF3Q7QEIC7VL7LCSRG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCKOYTSWNVRENOYF3Q7QEIC7VL7LCSRG/>
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
 sound/soc/loongson/loongson_card.c | 34 ++++++++++--------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 94f02b787c98..9ded16329747 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -114,11 +114,9 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 
 static int loongson_card_parse_of(struct loongson_card_data *data)
 {
-	const char *cpu_dai_name, *codec_dai_name;
 	struct device_node *cpu, *codec;
 	struct snd_soc_card *card = &data->snd_card;
 	struct device *dev = card->dev;
-	struct of_phandle_args args;
 	int ret, i;
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
@@ -133,30 +131,20 @@ static int loongson_card_parse_of(struct loongson_card_data *data)
 		goto err;
 	}
 
-	ret = of_parse_phandle_with_args(cpu, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
-	if (ret) {
-		dev_err(dev, "codec node missing #sound-dai-cells\n");
-		goto err;
-	}
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].cpus->of_node = args.np;
+	for (i = 0; i < card->num_links; i++) {
+		ret = snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
+		if (ret < 0) {
+			dev_err(dev, "getting cpu dlc error (%d)\n", ret);
+			goto err;
+		}
 
-	ret = of_parse_phandle_with_args(codec, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
-	if (ret) {
-		dev_err(dev, "codec node missing #sound-dai-cells\n");
-		goto err;
+		ret = snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0);
+		if (ret < 0) {
+			dev_err(dev, "getting codec dlc error (%d)\n", ret);
+			goto err;
+		}
 	}
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].codecs->of_node = args.np;
 
-	snd_soc_of_get_dai_name(cpu, &cpu_dai_name, 0);
-	snd_soc_of_get_dai_name(codec, &codec_dai_name, 0);
-	for (i = 0; i < card->num_links; i++) {
-		loongson_dai_links[i].cpus->dai_name = cpu_dai_name;
-		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
-	}
 	of_node_put(cpu);
 	of_node_put(codec);
 
-- 
2.25.1

