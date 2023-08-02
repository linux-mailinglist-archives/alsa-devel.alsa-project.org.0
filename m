Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2ED76C1D6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695F9E0E;
	Wed,  2 Aug 2023 03:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695F9E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938196;
	bh=6LHkVWGNhpPwwUvmXV8FLhiUyfKYAyD/HfNLHe7xpe0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u2pig4mhtxRmFu3dmYJvSXM7MSlM431Hz8wJEKY8Et1nOmisHr+5TsHSwF8+8YkUL
	 w6bfEvpXuoXVdd3WAJnSXrt2qzCHXFwxOXk1CyfzJtjQhe6YCBi4kZnOIgJZMAFv1d
	 XmmYfT2sg84wWm1kBWuu43BsbLiwfPgeitvk8a2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEA29F805F6; Wed,  2 Aug 2023 02:58:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 452AAF805B1;
	Wed,  2 Aug 2023 02:58:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B418DF805C4; Wed,  2 Aug 2023 02:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F29BF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F29BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=f38kP297
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9ZXNTSfYy5QFAFCx38n7tJDhMIF5FNZVozpkHpEPPOGt+CknscR2N9RjGP98igl5r0+OU5EcoaOFnzZAUbBWXCMBw0ZpGf0rPzBG9chhhrtchuHVig0ssSydc+03f5lk/T61yUJxSOFj3FkS3f3fsl95qvPfMl1SVjjJJ8A8lehQp90EbQ4ti5z4IndNefoVnqCUzjIAm67hyaNi4Dtr9F8xtMOYu5Za7D7VbqtXWY1HfX0SLUZ4XyFAZWwMxHSfxzEcZra+xcg6Ghp3TL3jC79Mz/loQyBv5seMT1Al2MLzHNhrg3xbfDgBnsDla4hb9XOjiltixtE+lV8ct5JyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ourL6CKPDMckNpOgMqEQnh8ucAuH8U5TdKTxvHSHRI=;
 b=XpGqjOOyeLKgEKVhCa69UOWxDGM6nD2AHT+CAwNvBNlzV+7ZyC19JMgS8aNAunPcC8KGQ5FQWX26dsj5nIr6sTr751dU/vjmKj+T9DdanOzqcZ6/Vinzl4VdZ0LvpGfogGTVx+odCCATZHiV+CLVydCYZqRC7fSCeOMaqR+SWo0z0weGRNr7f/slWyLdmy1App+e3H3SyV+2vV+v2Eb/hWbkQvtkSeCg8oznORJXgZcZlKR3OhNO6kziPD4w011mlbOLvqJSJ/wVWUlmY6s1kNHE6HKNBltoXOMj3aAxn+NHfMrYk7z8b6JDao9haQPiSM/lBx9jCaWv+SvICr4ouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ourL6CKPDMckNpOgMqEQnh8ucAuH8U5TdKTxvHSHRI=;
 b=f38kP297lf2+/1rWM0rntG5aGrXVig64Pxx5ZdX1/8Q9XLJArMvMMVkb64kgUZbYt/VovBlosJd87lG11zRdSqlPQs0jdR3UJArPayduLXJxkMdJVWHsU5Cf7gXLCGkKCX8p9a1JO5epeWmaBINTwklXrQ25kqKwmP/xbKQ8rkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:58:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:58:23 +0000
Message-ID: <87v8dys1jl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Uwe" <u.kleine-koenig@pengutronix.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 35/38] ASoC: codecs/cs47lxx: merge DAI call back functions
 into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:58:23 +0000
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad49a36-3587-4448-b3f0-08db92f3924e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o+u7wTgyWQJ7t3rPs3/obZMIzr/aDgMWfNfJLMGfNHHSKTEgfQkxclqQlewiJ0aj1Oi+PsjDqP6e7FyOU0a5ngOMo9SR1cWN0tNSTw9DB+mbro/I/xJccujosjsNGz7yVBRNmCB+pSQ14269Jyi+gbWMLG/s7eEV/DxqAwRmjTQYM1+hfwkAQIvjddpVDvtEpzD/+jEN0WY7NnqYhcqyez61aBvZJF1qi4da952aZ2MDJKypiOFvU157QIiGwUjItHwM+dL5fSymS+PHxedkOILiFTOT3T4tKuZzibJd98n11dDJtHPJIGeIQg51g9XPe/vlcK3ZOk4MjH4rIjDUPUD6LMypphORfwfq5x04PPQD8WQGUBCcOt8DkYP6do3p0+VrGJWurH/w+c9+m7qgRwsSBsjzIYnD+iD6Lm1BKkA58+ejk//tuvD+9PjmWjM53C64wVaXSzL2ylGH9APC+t4FztKBlC6RznsuMeDN2pBtmIInfRxBK8eJ24kqucJ2THYqRWIOzo8HfY75l3MgohH2DJhiS29um7xNOhj1p8vFuwFPcxdz5rkkiG/i7YUYJbXxghYCPFEpqnrtj2lFPCoW1eD3yOTg9AtGmwAtR3bEDy8w514F1OBUK5O5/d2G
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(7416002)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o4SMYZQxhOtbxeY4hLnxMBIep4fFBBL7YDZLqxXixpgur1ylABh2RcRXVulY?=
 =?us-ascii?Q?vGdwU9/mvb+logKbecvm2fi+Guvd7JAsH2nB7Du3mv/VW20SmBtM6rWR2lA2?=
 =?us-ascii?Q?IRJOTeBUDBRMXYoc/RtjKO2bwbsBIGtsYMLIOgXwzcAK0D/zdfbsA6xJbkK3?=
 =?us-ascii?Q?lCybOT7ZJJ7Ia9sOU9sIujaWgY8joqe8m21RKwqA63v0D+tw/aN87T4Gwg7a?=
 =?us-ascii?Q?VZ6akc6f6Px/gmIFRnlm6J3QljnTlU3bZGw1T+2KH2aSE8v+RDYBwujfNenN?=
 =?us-ascii?Q?ZxnC740zkFTTZoXLkI5awm5LlOE5sR+qzCYxw036qLyhfMoVn59iCsZcZk0M?=
 =?us-ascii?Q?smdmcmnYBO2bohtO5D5lNZNH8sY36J4D8cSH1Mt2pPAYkK3FqbsgndsW6Y22?=
 =?us-ascii?Q?/Rm6W3bLm97924l2WoQK92xULgubB2Aj1huEjQJIeJryNcgFGIlG11tGWtfd?=
 =?us-ascii?Q?5L/wLnwzFOfIWK9sLKceh5by+97CefcDXxmn4X4US46QZpEEm0fdRhV6DFcU?=
 =?us-ascii?Q?YhkZ9WLAPBntz2vF1FH/dJqHA1qTUoYxw1uW0lpu67RJ0InOPU9Wjp2Kzzb8?=
 =?us-ascii?Q?nfCjYyUvVu9iPXWak/cYkH36QlbIZxlLYwSvmrvYpVBtNzfpEG6fu66pdOJN?=
 =?us-ascii?Q?IpyGR9cmhrnPQ7sRF+peolPbMKOxrwP9ASJEC1gYizvenzg/nBmRWiRkqolw?=
 =?us-ascii?Q?90CBL6hcHwhxEJRRRez1PcqHnE2HffdUkwUNbgQEK9iPvSyjZuFmcGsb6fsu?=
 =?us-ascii?Q?qDqj4420toZFJVrlMztspxGh7Vsutsh635HswRQDi/6X7aGtz125+aSulE6t?=
 =?us-ascii?Q?L9WkFgX6tjV/LMZ1wxobmj8K6rkXdHIrU6Lt3beP/8COqfWolTPeKQudcpTj?=
 =?us-ascii?Q?+prCTconbV/cLWMdJLKYRjtrSjqVO5Cf1K0X5y7/5FlqJgkNHsSvglWDFlq8?=
 =?us-ascii?Q?1vemq2BxCtuTz2xdUSSS37B938JvyfGgb89dudYWKjCypLfan/Yog6S3yZVm?=
 =?us-ascii?Q?XV5W6LDM3LmWyq+YvSCLgDkEE+P0mJeIS8Wh1+N7BI8SMELAJKr0Qstxm2Tq?=
 =?us-ascii?Q?HFy7UK68fFoqRIt11x/QWMErzjmHy0RpSCu2Cvxd0X/AuLKNmxlroNfpesk9?=
 =?us-ascii?Q?HHOR3Tv9VLnJ81BMpINO+JHARytY9ifEcksjFSdg7jAbwJm+qOxmPC7Hcdes?=
 =?us-ascii?Q?cVfpFNOzYZdsdsU1LuaQTq08L1BBW23HmxImFkdwihsIVC02DoQhqdLYsv5l?=
 =?us-ascii?Q?YZ5qzi++C8kK3Hz5fyF49aQ6jsKGZ6Wi/7tXrHToMHWeSYUXzwGfQKwZAU2a?=
 =?us-ascii?Q?lGkC+kJnRirVxoZT2Foy7RxX2/HM4tg3oMS+xuRl2rABUH+N/xIFEtmhzDyW?=
 =?us-ascii?Q?FTMox+ZOFsaGP1QkXcc6EJ/3D4lfxX2/L95vX3Zax0cZy3gy0t89QxOmvn7Z?=
 =?us-ascii?Q?2fCX6JR9gwt3OQ026Q2xtG+raHXo1cmekRcOZjwY5RU+sfdfIQMUQ84e3Q8N?=
 =?us-ascii?Q?T+Dqi3AjwwQz8QtMpxrQBA2KsSpxL08pAMuDa0uE2MAzUM+QbP3BrhLVwgYr?=
 =?us-ascii?Q?da9oagfHNU0pQahRG8JY/S0G6Y/4Fy3LQDPukvA9bjRfsc6dEaW5m6NGunxM?=
 =?us-ascii?Q?E+ytH307NJdhYHER18r57eQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ad49a36-3587-4448-b3f0-08db92f3924e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:58:23.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hQlQHamijOu5c+tRhpQLjumVce7n9/eGFw6ode1OHHflseHlLnHKtmChb2KJXl68ui+KsBTAr8l5q4cEYWOAO+DsoIMJbtRhuZDmzzRlhgDrJPs/TPllRLvfgm7Fos1Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: UPK3NXA5Q3FIE777Q45XSYM3O7S3ZXHM
X-Message-ID-Hash: UPK3NXA5Q3FIE777Q45XSYM3O7S3ZXHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPK3NXA5Q3FIE777Q45XSYM3O7S3ZXHM/>
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
 sound/soc/codecs/cs47l15.c | 6 +++++-
 sound/soc/codecs/cs47l24.c | 8 ++++++--
 sound/soc/codecs/cs47l35.c | 8 ++++++--
 sound/soc/codecs/cs47l85.c | 8 ++++++--
 sound/soc/codecs/cs47l90.c | 8 ++++++--
 sound/soc/codecs/cs47l92.c | 6 +++++-
 6 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index a6538dab6639..1245e1a4f2a5 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1143,6 +1143,10 @@ static int cs47l15_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l15_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l15_dai[] = {
 	{
 		.name = "cs47l15-aif1",
@@ -1219,7 +1223,7 @@ static struct snd_soc_dai_driver cs47l15_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l15_dai_ops,
 	},
 	{
 		.name = "cs47l15-dsp-trace",
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index a07b621d463e..cfa1d34f6ebd 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -957,6 +957,10 @@ static int cs47l24_set_fll(struct snd_soc_component *component, int fll_id,
 #define CS47L24_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const struct snd_soc_dai_ops cs47l24_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l24_dai[] = {
 	{
 		.name = "cs47l24-aif1",
@@ -1033,7 +1037,7 @@ static struct snd_soc_dai_driver cs47l24_dai[] = {
 			.rates = CS47L24_RATES,
 			.formats = CS47L24_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l24_dai_ops,
 	},
 	{
 		.name = "cs47l24-dsp-voicectrl",
@@ -1054,7 +1058,7 @@ static struct snd_soc_dai_driver cs47l24_dai[] = {
 			.rates = CS47L24_RATES,
 			.formats = CS47L24_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l24_dai_ops,
 	},
 	{
 		.name = "cs47l24-dsp-trace",
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index c05c80c16c84..a953f2ede1ee 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1348,6 +1348,10 @@ static int cs47l35_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l35_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l35_dai[] = {
 	{
 		.name = "cs47l35-aif1",
@@ -1462,7 +1466,7 @@ static struct snd_soc_dai_driver cs47l35_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l35_dai_ops,
 	},
 	{
 		.name = "cs47l35-dsp-voicectrl",
@@ -1483,7 +1487,7 @@ static struct snd_soc_dai_driver cs47l35_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l35_dai_ops,
 	},
 	{
 		.name = "cs47l35-dsp-trace",
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index dd7997a53e70..827685481859 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2249,6 +2249,10 @@ static int cs47l85_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l85_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l85_dai[] = {
 	{
 		.name = "cs47l85-aif1",
@@ -2404,7 +2408,7 @@ static struct snd_soc_dai_driver cs47l85_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l85_dai_ops,
 	},
 	{
 		.name = "cs47l85-dsp-voicectrl",
@@ -2425,7 +2429,7 @@ static struct snd_soc_dai_driver cs47l85_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l85_dai_ops,
 	},
 	{
 		.name = "cs47l85-dsp-trace",
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index cdd5e7e20b5d..2c9a5372cf51 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2168,6 +2168,10 @@ static int cs47l90_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l90_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l90_dai[] = {
 	{
 		.name = "cs47l90-aif1",
@@ -2323,7 +2327,7 @@ static struct snd_soc_dai_driver cs47l90_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l90_dai_ops,
 	},
 	{
 		.name = "cs47l90-dsp-voicectrl",
@@ -2344,7 +2348,7 @@ static struct snd_soc_dai_driver cs47l90_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l90_dai_ops,
 	},
 	{
 		.name = "cs47l90-dsp-trace",
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index bc4d311d4778..352deeaff1ca 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1690,6 +1690,10 @@ static int cs47l92_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l92_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l92_dai[] = {
 	{
 		.name = "cs47l92-aif1",
@@ -1823,7 +1827,7 @@ static struct snd_soc_dai_driver cs47l92_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l92_dai_ops,
 	},
 	{
 		.name = "cs47l92-dsp-trace",
-- 
2.25.1

