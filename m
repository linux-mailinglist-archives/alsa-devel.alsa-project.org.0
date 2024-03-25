Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7D888D5B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:46:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDBB19E7;
	Mon, 25 Mar 2024 05:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDBB19E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341960;
	bh=YgTWv1vhfUdk2t+lbs/HS8Ry7stgMNoX6aOctFEpjRk=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iUX1L4TY9iB5UhLj3CjpGEI7rNTjlI4CN1f/j+NcyVz8KDMUubrPnJp3RbUql6ID3
	 rJ2DTaMvO2OvNhjcFaEicdiHIMYlfysJTGgcg5PBf0s3QF18UG0U5WcyxOUxSjmrbQ
	 faGns/VlNwQzhnuaiDD0jyHgzf1iflF4JdU5oI40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF545F80727; Mon, 25 Mar 2024 05:43:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E09FF806F0;
	Mon, 25 Mar 2024 05:43:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECB7CF8025F; Mon, 25 Mar 2024 05:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FC45F801EB
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FC45F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ijjNNvgJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0X7PUZxYZWiHEh0nTrusStXCMX2Vt8Jv4pDPq/8EXLyWwIRZTn9Y2gt9bPxTOZI0uqqPd6P7rhauIHu0UcIV8rT2TMjWCTYAgPcTnEGl0av9DlkKyZfR+g5yAorTql970xo7FY7G1/WRMIi2jd23fsLZFsDCa1fKp5NrQqJhanydig3rMUITczaav4tpCYo8CUCtl3gjwy6zTiOe58M80G9cTuCGd3nJT2+XirB4omfOt5cv2uPkJwmug0qm0xO3eVuOMwZnzLIbRJhFVt4xX5oL2jRoSDXUoN98Of6TABLowgjutc3i9T7QboQYAQOwPIT7ZwmTiH4F8lpVBxChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqhqoTJF+tm8QauwvluMseFaT1V2WJovxDaDwefjuKM=;
 b=D8InueaadLc2YSQ5UWW9o/84bE+sLDoAfO558htsjwvItvjVMp+xTmIeAQSMMogu6/1NDl2w/3w3xZA17mwUQxW6A1VKnpPw0dKCPFA+rD0rZ9hgNTC5Q8EH7n0ah1pU9vYzoQx/HAW322u6b6f3KA3ZG1sT/Q3QA+K5Cq16jAxOig3ynnXzgEespCNeL3XQVFmOdPeqF1a/kk5P0w+AC2KWR0KskXZx0rzahYivP2DzsEDi0F0+l8orfum1yGgJqd/XBYHzviXD48FDpb2YmFkTKZIomEIMxeyvGNvqRhd0y5pGU1KH3lHF8dHk1RlR9jRY267kx2XGPO8CVIhhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqhqoTJF+tm8QauwvluMseFaT1V2WJovxDaDwefjuKM=;
 b=ijjNNvgJ9g+x9o/E8mqCTG58MU5ZdyK/heqr/c8xgIBX11odYZd95oa0LSWddCfl65tyVtqWn4c+qxbevFWHXTl/xdicAdpgQDnC2Qb4jOe5eHGLFvV80n2ScGXOmUkk+EvWGYQa/Xn0Pib7KPr73S4hpwSZ2mNks5pnmoG9SAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9512.jpnprd01.prod.outlook.com
 (2603:1096:604:1cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:37:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:37:25 +0000
Message-ID: <877chr53lp.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/15] ASoC: soc-compress.c: replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Mar 2024 04:37:22 +0000
X-ClientProxiedBy: TYCP286CA0250.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 300176f3-b0db-4779-3972-08dc4c8543f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OPTnwteUuR96Ga5YtVAYPInSH7Z0IJz/2MOAOpVXbmNEp19e+QVwfjgTmMG49fZWiont/GomAZ5EO7tIRxySv022OtO3XqE7+MlooxGvelzAMXGqqYJ8RYaFGgo0FcN+U585oVwzHfuLUsYwT0dfu5xMGWEESUJlsF2AXgZue3zZ0/j2+nQLc36uijNrfWt2g3aHHYKjqjSj3oKFSppqlk+u1mMEzG9duvH/ZgNF0xsKM/EHYAE9XvFZfvYbnzykVoonTHK//bjVChy6I5jrYgV/YQx2s0UcUV8aHw4iwY4/Z2ZfQ9C7jIY0ck1FICPjKLD8In0pflzrr4caCjgvur1xtRzGJrZ6pyd/A9EioYKahh2vHK+gtDtRF1iUe+zeQvrfLMAVk1//xLKRaXodprOkCJ2IUdN/3o40IJdxoa5p9Vic4OrFpU4wv9qzz7ZKQc7DO1a1JRg125Oirhl/Nk8QAVTqBgNKOiW1Flf8ewGxSVgMcII6PWATdryVyutq1WNlzloJDgrHDiBd3pNo+nMK2874ltFxRoCa5Ur5n54Oo8MMZAUinDkCl6HU4nhev88vhOfQd9kdrcSTU1VZ/sJPpj3LvavpvJ1iZaEmsGzPg+3Zl5TDzwWnvaMBOyPMW8vpzD0TzAN8waaSRJfeAp/+Mq/jvjivREcn+/E6sDnBn5RSGh/csFNnYsJiikzHx6Vtr9+IkBZlw2nSfn3v9LHueTa4gmL9SCy2Kpng91E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?MaXZyzbNPaU9U0qXeC9f9bKQkdEvRltWMDiztwZXr8u5DgdKC3W6TBMA1H?=
 =?iso-8859-2?Q?/P8Mokwy6Hy54EWXF5kHPAarMCEj2Qx+UPoYrxi4r6uIvJ4DjReh0KGbNX?=
 =?iso-8859-2?Q?3kEZ4w81PAB7IA1RhSBgTL4R8xLL06XTSFiUt6dzzjyLEs4pLkMO1QW/BG?=
 =?iso-8859-2?Q?kZ1rJacERP8GhRDc+fyD5oUq+27GfTAnLPktUV8R/D0A4BuJ+wPI0ho/Em?=
 =?iso-8859-2?Q?rK/PFRW35c/uuXUGPyjD2W50jzrUy5lhZVLqVBLf27EBLYA+0S0PYt24Qw?=
 =?iso-8859-2?Q?pLv5xeIwrYBF3JASfLGTmoAsbNVC1tjliWOj+iFWnl6Ied/xlp6+iYbjto?=
 =?iso-8859-2?Q?23Kq2G68nKRSJH9dnxaq8KOPYzjAcOSwQXRSSgXUtN2xFX8CF0hqiFbz3G?=
 =?iso-8859-2?Q?caTykAxb3/QbLESVmFHzfROssmUor4GTgKIslU01rqRHcbQQADYsbGDgik?=
 =?iso-8859-2?Q?BpasHwokjPUrg33xiQczoNmW/olxiBa/twUfrpna6et8WxjTyxJ3jDv/D+?=
 =?iso-8859-2?Q?vwodByaI14f1EE2OH7lIEjwemBsSD6anKji24fP2lBL2S6Tl8M8Pjx2fEp?=
 =?iso-8859-2?Q?d2+FtQKqMHYWLB4UfkHNWu8gmtfqATaXwDyhBP9fKvzgKsKAlPrJwREl/P?=
 =?iso-8859-2?Q?gR4s2OnBFOorwQYxagSYjHWj7yyTEhU9sMeexn43UzVG32AXxtOJtSrBhN?=
 =?iso-8859-2?Q?hOvnFkU2kj74v+YRpBqvIa0nTnOFjDKl6YG7BqcKZxafPujhZJ37yOfV2o?=
 =?iso-8859-2?Q?moRY+tn/zFH+Fa3QlX/zHAIKjXf31mpGOzmq+PgyAg5R/EY6RzaPBdU6WB?=
 =?iso-8859-2?Q?ikzlKXkvlYqZmKRV5YgXy5ZDMYM5WV+zpvJ9rUa/QTtv6dA4nkeaVnrFpU?=
 =?iso-8859-2?Q?XoM3i+SBIw/Y6H+KJvMH4NUi9vyIWQNOh4sz1UiGk6BVvPjXUECGnmsK8p?=
 =?iso-8859-2?Q?hcNJGUhNRHCKUvhXsT8HpLOQQJmmvkm/Sek/olEqnu2wmURa+TiBJS5PGJ?=
 =?iso-8859-2?Q?Bmy2Vp3GNrlU7wAiN98RjoA98376XcojKi5343EjP5gdQ7vhQZMhw6lV+H?=
 =?iso-8859-2?Q?+GxHx4jza5ODoWtB96xLMgpfIOX44hv2vkQlv4ZFaslymGmE99gto1DxGK?=
 =?iso-8859-2?Q?7rafrR02Cpbv/akeJpcoKibWTQPAVlhJWQbOap8InX6187MncCvjb45lQx?=
 =?iso-8859-2?Q?KXKjD69V+MFuN3vWKKgmgsS9fIAllvwdTLv9NVDEgCDv3JWs2bkvqW7H97?=
 =?iso-8859-2?Q?xHiFux1ltSD8lbR9hSB7chPL7daR0w6kpuTi3BfYi9yb95WHfuPPmR/KBY?=
 =?iso-8859-2?Q?Z40HiZBZr0Rqz0YoKWBRP342fdPoZenYGTe3v++Ihcy077uOcw8C46EVd8?=
 =?iso-8859-2?Q?hdrSv+QXp1FdaFCM8v3E0O7+vnsIjX9Gd8lYit0iTXAq4psHbEUkEwargR?=
 =?iso-8859-2?Q?rR4Q0s0dlmS8EfPzz1UXgtJ6vmPb7RxTbxKjxseF06hQhsysjNtF96Riqa?=
 =?iso-8859-2?Q?XwJ4f+qkEASsJwst8RGDEinGY9zuO3uP69IfWj/UGsoaXWqLdBs1Xm0x/s?=
 =?iso-8859-2?Q?IXOIPOHYqG/AHPrmKJt+/T+bhSVw+HIDMG0+FZUHDzaIYLJGulBVlaPREn?=
 =?iso-8859-2?Q?06lZCp7gfWqkqPUxV9hFkVb+QEZTlG5Ycqhoqf5Wn5pezvHKoF+MRFshJz?=
 =?iso-8859-2?Q?y0qFcVx49558RwbWfx4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 300176f3-b0db-4779-3972-08dc4c8543f9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:37:23.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ruCK4JHHMX82dRTo47l4ddcj0W6liJs0XTvPxEC6AjYsFs6KgFUAMzqeFOUY4/3dfi0bWQwXT9DITTFpfAVt5PzEKtRRZn4DGeBftNWUzh9/Rt+R0x1mfHeTEXV/9XSf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9512
Message-ID-Hash: NSVV2OYS5CVVNI2NTDEB7UCUKACGWIUT
X-Message-ID-Hash: NSVV2OYS5CVVNI2NTDEB7UCUKACGWIUT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSVV2OYS5CVVNI2NTDEB7UCUKACGWIUT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-compress.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e692aa3b8b22..b861c2bc62e4 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -606,12 +606,14 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *=
rtd, int num)
 		return -ENOMEM;
=20
 	if (rtd->dai_link->dynamic) {
+		int playback =3D !rtd->dai_link->capture_only;
+		int capture  =3D !rtd->dai_link->playback_only;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
=20
 		ret =3D snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -624,9 +626,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rt=
d, int num)
=20
 		rtd->pcm =3D be_pcm;
 		rtd->fe_compr =3D 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data =3D =
rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data =3D r=
td;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
--=20
2.25.1

