Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C4774EBB
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F93846;
	Wed,  9 Aug 2023 00:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F93846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535408;
	bh=LI0bIF24+gEctrVEj8GdSI0EPBPCOsaSxOwYherdkJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=shnnYQr36baeSxrCRulhfMfo+uIGpTjAsRdxfXGNhtOST9scJg8bYF1slbAt/hH0l
	 dowHNFshBk65xT098c6jAnzVYdbhKaGtgN1xHMnR8nZJY6065z1P37bP+SX3406i0L
	 T2lvZ2cLuAyiHsuz1o8dHfaBIyVnbDzpMbnzUIuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 996E5F8057E; Wed,  9 Aug 2023 00:55:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 352A7F80579;
	Wed,  9 Aug 2023 00:55:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AE29F80563; Wed,  9 Aug 2023 00:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71E4BF801EB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E4BF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jsWIdkOj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ry/nu2vSG/xX5vAEcM47567kqnolQMkxlTJLwpUa5H1ePZlln8yxLufZ0vSbLN94WuYGF1btLGPhJnfgJPdprfn2PUh5U0wZl5OwIfGueVB/mmady7xEaWgVHIBWkGyShfgtW746s0mns6VQjVp6XEgE74gcwENRVM6Xw3XwsSB6jneq2GgSX87i2xbhy7B6W5g1VN8opvthP8M1M9MPCa0d9l2qWjpCVgHq0tvaVsjT3k6JFLCyLkI0GOJqbnapFvrY8DG5hneEkfUg3y2UeH5Cum4kwZB1eqrwo+EOHhOmn1DST7nKrDqJN5bbBe2H2xq3GoY3LJSt7fXatUUuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPeiaoIIsUlnzYISvND8Dxao19NtK6Bf90KX570XmGc=;
 b=K0lPw1H0Lp7+PBYuFIBzCvlnoYzAw4u0dMd1HAMUDFyhc8ggQm/h1i6Rx0xs00LKb9KhDXIztzZnV5BUskF2/UQuwGd/PjCu6A/ya+i4ps5UnpLd1LIbE/05VlC4XGApzZi0rwMbvaPfgwziVEygFYbSv017FvljxiG+mNckP35YcNX5Fq+guYMzZSbRLr6QGR6KofAd4EXsg99oib7FDloOAkZ6PBssUgE7U94Ur6kN/PIzUqV9uvEVoAyfyCFSKAg6qL9a5Tua5eaE8747byixAWG438djKjQnBWALh9PK9RU7f66p/6ZQppiodv5ucvx/F0NFaGYpcfMXSHVuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPeiaoIIsUlnzYISvND8Dxao19NtK6Bf90KX570XmGc=;
 b=jsWIdkOjKiGWt7pfCgJn2hLTU7uRse/vbOObIxrDzqZ1B1u0o/V76e6KHgvbAO/dLqn3kAmO1LSrv5MYNNxnPo/HnxAw0brgiJoneBONFIfXRvplIfp7U0ZfMHbqZHRqvQmWqN0TbwigK0IF0J/svC3GsX7zjuxWVvuth/dNJdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:07 +0000
Message-ID: <87sf8tb0vp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi
 Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/39] ASoC: adi: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:06 +0000
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: c784a06d-d2ea-4973-7fb2-08db986282ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PRq2k/ShDcdDE2Npyi5WAnehb4n+kQ44ECBoXTOo/zvJzsBBR3I43Ftr/1i/jMlQteMLzC/xWtuBNodB58MNM69XwGxVX90L69kDkJYf4WzZwPIvleMinz5dQdM762UuhLeNnmhG0Bfuhnhs2LSaJ/w6kYmMMhzjbpF65AuXWD7K6XzoUC6rhenxLzFjDr7XlrLDcj9hZtK4wyWqwN7tNBQia9NdEHDQnS28uUTAhhmifkFb9kDERMT1j8X0UgQQJ2Xx53YkzFgdFnoGiDpMiMW0hihLS01sHwZ7y2Tl1mKBDj1pwrU13W/evk3lLWrFwHuUxaS4510q1Bxth/XEWaYC7UoSpgBygiVACffZsAt8otz0iZsC41PBYmG5FNVoXWReJTsW5p9/0MXcDDYQ2VDMKDKM8IuGagrWWdPNA5YCZOqTYyDx5Iw7mplVVQ6yldZkxlbYrkP0GQKJYOYO67yv/rdVV3tOdjqnZvUQk9ScqIl2LQ5Ytl/stCTfla3g89QckMOHI+Rnd7/d4LAVJTPbLCYSMDiTogGmuHSSsRIxLOPuuN4qal9KVTqgPRaU0kdxXkhlGkzfRePE6GYT803bGompNNOhdzlPvq6XUjdAfrWfLnbVL7y+/MvZNHpu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(4744005)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ytoFRUXGuYOD0igW3Hw7dWEIydSMuew7nF03Y8OoVAu/3uQyOQBCxXVREvry?=
 =?us-ascii?Q?/0ctQz9RMju0KwBgyCp69GQ4//GnG0LfUaAYlRURaAIa0Prhv4myWI4UBRXz?=
 =?us-ascii?Q?5loDUbfVsIn8OBJQmbOtzgrwfVHgcItHHM9ADEcnQ/QYPlm8xT/WCPJIYuV9?=
 =?us-ascii?Q?VYvqk/YZOpnXDHIhl9xB8ni6hjvtOzv99nAKs+giuIH0M9FZmfNnKOFxm2ud?=
 =?us-ascii?Q?v9IFgf0nRnsVWJo0o6aREDvMg6dkVu1Usun52T/YzpyU0xEvJSrgi1F1xYkb?=
 =?us-ascii?Q?imfIM4s1sm4SvQEd8DZn9NcjvkTzBBQARqG4fNBzmTUKVl6Q3rLzosY0acml?=
 =?us-ascii?Q?kx057pSXM5uMUdGu+9GIm2DAs/bChRXMCbtm5rMd//axpOueXKs8BHqrZq6+?=
 =?us-ascii?Q?jHmJ3nzFISI8tbJwG2ffWoMlwAekzGgGSYWd0hhG2aeWzWWmwhLHlmnV54VN?=
 =?us-ascii?Q?4al4sCucXKviAyqNuXiznZZMNyxwc8LLgSRsgxjcIfbKyPqSzHNPOVcWiT7S?=
 =?us-ascii?Q?9Mkt+6BgP8E811omz1g4YfQFNo6Wd6lVlVHPvVwNUGnilKfqGgKtT7GOPbMD?=
 =?us-ascii?Q?ZTDKbsQ0HP5DjM7juzT+ZVAnYFVM6+o6kKWzWwBZMmTBzepbnI8CrSCAnCdl?=
 =?us-ascii?Q?QYZA4Vxh3qy47NIoVyPWu2GNKWqiLOx7L5QkrSIRU/VgREmay9qfxjB5a1mG?=
 =?us-ascii?Q?2KZYfbzGwZMS/LWc2Qa4E8z6FZGvwKJo/udAsLvSr1WRF+lNO3B2laA4qrvK?=
 =?us-ascii?Q?vbEuE16zKi6EvjCfG2DCve5yk3aloZfVKAoJNCk2lBx1DEWk1IQYhvv6OYPs?=
 =?us-ascii?Q?s3wkC4Yg0kPYr6xf1FJedhqKYeQ3U57XDCZv/5pFYtkQh7/y6L6lL/XI2603?=
 =?us-ascii?Q?mx+/2ZugUNqbATe4JuoHs0a8Br1iS4Enxzjo2mx3Ysc6TU9TKP98sKKUvrq1?=
 =?us-ascii?Q?dHZdmmX/ywddSnS1pwJjb3vCjckgEKtudeDk1tS1rLyG1Jry52l5UKuFYDWW?=
 =?us-ascii?Q?Dovl6EnzaVAProoFnwvyQRzK85AwWAgRJMQLZTWvThyXD//0SSDTwf4PxSem?=
 =?us-ascii?Q?lAkKqELnLsOmpAxW1J02CAMKNEbC5z3Lnba/sru8UNwWWTelHVNAYOqMSQ9j?=
 =?us-ascii?Q?hfZfpvWOMSUZ51K1yXXQIGWnIHsImmcXngd7DRGDtdzEJ0vniJ5CouAH/CHp?=
 =?us-ascii?Q?IVIU4c94RTRCyDSZwZAEtqZLOiJ9w3vY4ya3iXmHVj1682mByEWBrD26t6bw?=
 =?us-ascii?Q?HpY9CCc6iHVVHBeoTmktjrKiya+UePHNY/I0tNYVbWAlp4C7MEPMukgItflE?=
 =?us-ascii?Q?1lupHnyn4IbT3KzF+EBysKsIf+VhRBcAwthHsDHdPvM4tEEG7ttgk9tSSlzS?=
 =?us-ascii?Q?ruc2RnprU5MYYwRLuE2POEUQ9/I5haDMJic1ONkGYENgTmirAqfx0IlgguX0?=
 =?us-ascii?Q?lk2U7l31Czc3DAZIZqoscrzkQwxkLgRY4zBI4RPcNbWczDNeh9rDPKue/LET?=
 =?us-ascii?Q?A7CSV9iw9fRQr/zKQ/hszkjvcBr3QG7Pf4ZwPFdSOK1ErIs9CdaivqVLWVUV?=
 =?us-ascii?Q?grXgsnf4VzC9b/Rd/i892BY9yYW2GjuJOmZpyR05ZFNzFN2Sebo7h9UuIr3E?=
 =?us-ascii?Q?xPac3gSmPJkTsPXI0sIkmKA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c784a06d-d2ea-4973-7fb2-08db986282ac
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:07.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D2GZ4jO3CWeRN9J/xeNI2SioeWyAHvgWwBba0H1ITA+FVKQeFJbsyDjgrvifrLs9tupIBgZq1hSe67PmXxoQd0tvQbRjz39WzyB39yENZxadweZCTnjeaW5nX//XV5dz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: LV5RTIVU5Z5YLAWQ44WI2IIGCH4QRJVI
X-Message-ID-Hash: LV5RTIVU5Z5YLAWQ44WI2IIGCH4QRJVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LV5RTIVU5Z5YLAWQ44WI2IIGCH4QRJVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/adi/axi-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index d5b6f5187f8e..7b2563075743 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -147,6 +147,7 @@ static int axi_i2s_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops axi_i2s_dai_ops = {
+	.probe = axi_i2s_dai_probe,
 	.startup = axi_i2s_startup,
 	.shutdown = axi_i2s_shutdown,
 	.trigger = axi_i2s_trigger,
@@ -154,7 +155,6 @@ static const struct snd_soc_dai_ops axi_i2s_dai_ops = {
 };
 
 static struct snd_soc_dai_driver axi_i2s_dai = {
-	.probe = axi_i2s_dai_probe,
 	.ops = &axi_i2s_dai_ops,
 	.symmetric_rate = 1,
 };
-- 
2.25.1

