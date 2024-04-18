Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CB78A91CF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:13:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2E4AE64;
	Thu, 18 Apr 2024 06:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2E4AE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413616;
	bh=8jL8LB86T7eGJ3Ate7/tzUbSCGIzS+L7OFFIkIXc//k=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Olru+gWNEtArJSMNFEfd6QEw50F+GBGasPrdSL07Q6GQkUNZYp+YFVX+S3q3M0yK4
	 aXeztD2hYZnGnyPL+X3VyBWp2IEVK8SArWcpOVtPPXfGVsKzKjuno6NxgRSJsqiwkO
	 xdexqGyZGD7sokNwcCxE1oKOV/RvrITSmNnYtM7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE98AF805CB; Thu, 18 Apr 2024 06:12:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58364F805CA;
	Thu, 18 Apr 2024 06:12:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C1C7F8025A; Thu, 18 Apr 2024 06:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A0A7F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0A7F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PCjRuzRT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQ5oHstxBsuyFSpD1XehuKio5vuERWXN1jBbsxMEPYv/R6zMpePegdPDJ6pVUEx4wzl7iIgObeHPG1iZu99bYep/qVPrCoFQiuGTmOzE2FqrNdyz78YIMWP58iCNq0cW6zJZXTDOOjCOAwiZ+N8rry7ADdo7DbWpZKwmtsD9eMH8ORB1IHhEjoVl81r/nUzc0vj/TnFW2k7qaTgjPCDgnbTPAM7vjWyO/up65dU3in0eOCqHcDlIjXXgoZ0dlCLOr9F2PfL3eQp5djcjezKFh3uXxk1+wve5/WhABu8d6hKSwxHvmPfDv+Od7tS4zPnVYuCpjtnT5K/bbdjtK5PSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2Ycdojn/t+pCLYQ2A05TL2e33ISobYZ9pUaIxMnqmQ=;
 b=CsdGJZMJUQUxozPLg+Rj5l1MU85OMeufOv2DpeaBj64A9JnO6iAZv5Q9KTh0firdxltVN8XNkC69CbTsssA8L9+uxDUrL1hnZXEJtD0J6OyO/Z6oW8WefprzTGbZHl3IS7fSfhDlr7sj+oO6//V5GsiDHP7WljHqup7uDFTfoRg69GPRQJQaoEamXJx/l+fm+NYq5VD3PIfERKj8RgXIH1ldgWf2mEiNQn5FdyHDkLj9xXR4k5q16fYqblwpovC2eq2snrCEJJMfKa92Ou/i8VYx/xTdMbXc7cTyzm5bpuSt2GZ6qweQpSOxGiGVOiZqmxzTwi364Q8pHidtrWX+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2Ycdojn/t+pCLYQ2A05TL2e33ISobYZ9pUaIxMnqmQ=;
 b=PCjRuzRTo0aG+zqTqLk8/lSKNQXDcDnjEdRbD0Rr+37DuD5EbYRFFTmUiS0wTUxDx8JN06yZvqaiPqvRmgInQZURjkoJllcvmkycz+y7AhQvww4zrapT072NwAPrzpi84mkmaM8EEaVDoXNFb7TQLg8PqAoG1GYiwzZBIkBk95I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:12:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:12:10 +0000
Message-ID: <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/23] ASoC: soc-pcm: cleanup soc_get_playback_capture()
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:12:09 +0000
X-ClientProxiedBy: TY2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:404:a6::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebada18-eb05-4631-e9aa-08dc5f5db7f3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vu5LHD/Q3VFxzmjMmmdwmWFcl0cR8TmtwU/b+VfExP3a9MTM0bdfHL0lh6PBsZX44u9SkfoCYvWciIhDmCsnhK8ZQJHPFQ7bPtB+3T/uxBwjSJHQs/7/sG175LeTuMboZHN+JdLldzjYK8+/EhkYpNSX/rkik9Y2JhjqA4obUYpvS52+F0rfN+gsbz40Wmw+m3C24QKhdnRp2wmsa1NVOvC0dmiC5LmA7M/zf+uDzKQP6ZpBA+2vIkF5gNS49XdfAyZgBE7h+Sw1BMmzaAeiJUA3eJlDYL4s8DqRo0BKfjcG8QEE8VmGRdkYKu/AqX9ssG3T2/D0T9+7zlrZHoBxOExqS8V5uJYNXNA0ULDScbdzTG2v9acIyJf7m4BRn2q1GgJWyWU4EXlOsFCt6NXvQ0KAtc8f+rBoVkTy3q+f5uAyeZlEswfLH74iPGCUpzDzfbcE9MU8vkL789tL5MjCLd5CcKdlkcKIk5IL2xYFYWf4XR9fpN4IdNgm55KtCBfk1C0PA/sD2w5XO//ldjSa80O8+g0MvTaSZuRKRTyT1CYACIisgFQ6FyS29hw4DKt4r2aQXGExGdZavHLk/IxqGXsR111jgb2VPnCAkqcLoAuSRBJ7Q/DkEsVwjRfjg6FhVo2VMEGCEBGgttszeL5Vp6kBOOh2MZOnXrJvd0t37kw6CN22q1IJps8snqGc0gemN7dkiQBADd840jHYX3x1AT5y0Asj3ceWrSjr6KQ5O+k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r1djbpAYn7B65pg5iTsi5lLgZ+k+C084i3w+ZVge/rHXBdVVjanUGFV6LuWw?=
 =?us-ascii?Q?3WX84b8Bs78wmzuHgPXwFVaGMIFN4p74E5fpCo45te4jjyiGDOcZ5H75fU8T?=
 =?us-ascii?Q?R9Ijhom7vFwzglpvq8dlXLGJzf5odfQaUrQBU5fOg/T4KeoLGIaAkxTDAtbe?=
 =?us-ascii?Q?5aDl1iq0doZCxAdumHVtS7z2siM5A2lw+95nu37MqlYMumi3hpLU3GX7YZUK?=
 =?us-ascii?Q?3XqG4vs2ne9kh2Hx+OuHfEWhLBcWyuK78/AdrZHYoB+FKgbx9c2DcZorKA4r?=
 =?us-ascii?Q?MLZW7IJN7L7ctP7Teh1OOYPrYW5l3Vi/RzDAoPkCKF1lZMCU4kxaTg/RPSWh?=
 =?us-ascii?Q?ZkYAqy5yyXz5gpvXzCYV1Vz1xE67ZF33YnD7A+EiC2IcIgHFqWtrdSdFYX7h?=
 =?us-ascii?Q?itLCF7WgnYZuCcJovVhVbQW1JdKEoznEwz+jl/4ooCbL/dPuuJOgheyBVEzx?=
 =?us-ascii?Q?qIDZktOsu2xWebCmsGqospMQ26oaBGWvsUuDhFtyXNb18wZvAZBd1/WQniMi?=
 =?us-ascii?Q?KvsGz/8NXJRarDw1k1bfPqz9w+46PGMFHPyUZMJNk5XeKzF8ZZoqoEuiuIKH?=
 =?us-ascii?Q?DYqOpToiLsz8sNGqDCaRIqh93aGa+DELgbvdEBItTCXwj2PBIFmE0Phs1A1j?=
 =?us-ascii?Q?e927lIYdrLtOAPXy8N+VzWPhg5u2n/ICEca9CvtfAv/5RyclXTeG89mOOlHp?=
 =?us-ascii?Q?bmrW/GSgblDBeOllDtNhrwNDVNWvvF9QKdhKF/qlDVVrGlMt8lyCAOlGxnmt?=
 =?us-ascii?Q?umOSGJJ0LBJFh79el6SbgZRGEnDIHQkhbzjV+xnt+M+qDfB2hY6LEjbuUp3R?=
 =?us-ascii?Q?9rEpiqDROpcrQr/3ObV3jcY8oM7uly2jJbVu4qjvWFj/kLPzElnPluyuv6iX?=
 =?us-ascii?Q?VhEauw/046BdksJlrI7+1P0+quSmdPJty7uk2pDYTQ+rZRENYR3VLvjMBuL1?=
 =?us-ascii?Q?JDe2ARWYqNDmpw9ASmkfC8eklUzSbxsMU1T77fn2gi56iYQejGYA5DkB9KbB?=
 =?us-ascii?Q?4gcubQesLxOkgPXylp0q5HA2fp+R9DQo6kmeGERJCfcQ3i9SrwrSaereLXUV?=
 =?us-ascii?Q?0M9LioTkgwjwou9gaONzGNeYmzFDU3exSkUdDgogGAIHONfU1KrC0s85PEMU?=
 =?us-ascii?Q?uJirTDxenJK+yTxdIZd6sQVu/Gg24ZZ6Z5bhNb3ZXCORG1flxfulIrlAtbI3?=
 =?us-ascii?Q?QkqayE4WHew1Zlemlu4VMcnpjRTdcTOLlV3dt5PUSz44lVxOLgJIKhP9lHWv?=
 =?us-ascii?Q?XItWyfKzTW8plD0oB7MMgN8+ctSesFyYLiaOE349R8LjRTo3bkdCprQyZExl?=
 =?us-ascii?Q?s6wjLn7gB3GLVZlGNH7KlRMvyO4E5sk5yPtYakO0vxm2/w1WOvgo1VGGIk2V?=
 =?us-ascii?Q?B76lSszOoNp8MSONKVI/QEe1tqh9PSgc+Hz6evdKX7zsVd1SOOEvFasnMZMq?=
 =?us-ascii?Q?4YDiKiynOSAHtoYEzi2Or+WtS4qU2Ow89r/XMPeMGl6PKGGcdmG8TPhOslYY?=
 =?us-ascii?Q?4hog16VJwHCCHUN5qWGu1UQdkcMoH+xHlI2QEkWQWSspb7b3XHsfJPBDp/Nt?=
 =?us-ascii?Q?nSdI/3JOxi2U6w6vaMdI6pzfyZgd4X2pZIQJoFnx8lp/o37mx2rvsS3+YQAy?=
 =?us-ascii?Q?YYqQR4SpIzIMYSymNZXBQCw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ebada18-eb05-4631-e9aa-08dc5f5db7f3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:12:10.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 c7vv3DvVldkh+/qGU9ypvX6rsvTK/EmVEmqEtHX2CYUxq7k3ZHIPIvFEQk2acrXBzaN0KJSpIfRhX/+lvYvshACQDPBCKUJgVcQzyu2Sst9dIRfaptOk6ZekNUPSrJyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: 4LYIMUNOWZU2J5VJ7DXXCGJUBGZ3DGGH
X-Message-ID-Hash: 4LYIMUNOWZU2J5VJ7DXXCGJUBGZ3DGGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LYIMUNOWZU2J5VJ7DXXCGJUBGZ3DGGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc_get_playback_capture() (A) is checking playback/capture
availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
 |			...
 |(a)			if (dai_link->dpcm_playback) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
(X)			}
 |(b)			if (dai_link->dpcm_capture) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
 v			}
		} else {
 ^ ^			/* Adapt stream for codec2codec links */
 |(Z)			int cpu_capture = ...
 | v			int cpu_playback = ...
(Y)
 | ^			for_each_rtd_ch_maps(rtd, i, ch_maps) {
 |(*)				...
 v v			}
		}
		...
	}

(*) part is checking each DAI's availability.

(X) part is for DPCM, and it checks playback/capture availability
if dai_link has dpcm_playback/capture flag (a)(b).
This availability check should be available not only for DPCM, but for
all connections. But it is not mandatory option. Let's name it as
assertion.

In case of having assertion flag, non specific side will be disabled.
For example if it has playback_assertion but not have capture_assertion,
capture will be force disabled.

	dpcm_playback -> playabck_assertion = 1

	dpcm_capture  -> capture_assertion  = 1

	playback_only -> playback_assertion = 1
	                 capture_assertion  = 0

	capture_only  -> playback_assertion = 0
	                 capture_assertion  = 1

By expanding this assertion to all connections, we can use same code
for all connections, this means code can be more cleanup.

Here, current CPU / Codec validation check relationship is like this

	DPCM
		[CPU/xxxx]-[yyyy/Codec]
		^^^^        ^^^^
	non DPCM
		[CPU/Codec]
		^^^^^^^^^^^

DPCM     part (X) is checking only CPU       DAI, and
non DPCM part (Y) is checking both CPU/Codec DAI

Current validation check on DPCM ignores Codec DAI, but there is no
reason to do it.  We should check both CPU/Codec in all connection.
This patch expands validation check to all cases.

	[CPU/xxxx]-[yyyy/Codec]
	                 *****

In many case (not all case), above [xxxx][yyyy] part are "dummy" DAI
which is always valid for both playback/capture.
But unfortunately DPCM BE Codec (**** part) had been no validation
check before, and some Codec driver doesn't have necessary settings for
it. This means all cases validation check breaks compatibility on some
vender's drivers. Thus this patch temporary uses dummy DAI at BPCM BE
Codec part, and avoid compatibility error. But it should be removed in
the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |   9 +++
 sound/soc/soc-pcm.c | 143 +++++++++++++++++++++++++-------------------
 2 files changed, 92 insertions(+), 60 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0376f7e4c15d..e604d74f6e33 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -809,6 +809,15 @@ struct snd_soc_dai_link {
 	unsigned int dpcm_capture:1;
 	unsigned int dpcm_playback:1;
 
+	/*
+	 * Capture / Playback support assertion. Having assertion flag is not mandatory.
+	 * In case of having assertion flag, non specific side will be disabled.
+	 * see details
+	 *	soc_get_playback_capture()
+	 */
+	unsigned int capture_assertion:1;
+	unsigned int playback_assertion:1;
+
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b0e1bd7f588b..412e7b7d97f5 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2794,7 +2794,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				    int *playback, int *capture)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
+	int cpu_playback;
+	int cpu_capture;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2804,77 +2809,95 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
-
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
-
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback = 1;
-					break;
-				}
-			}
-			if (!has_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
+	/*
+	 * REMOVE ME
+	 *
+	 * dpcm_playback/capture will be used as playback/capture_assertion
+	 */
+	if (dai_link->playback_only && dai_link->capture_only) {
+		dev_err(rtd->dev, "both playback_only / capture_only are set\n");
+		return -EINVAL;
+	}
+	if (dai_link->playback_only)
+		dai_link->playback_assertion = 1;
+	if (dai_link->capture_only)
+		dai_link->capture_assertion = 1;
+	if (dai_link->dpcm_playback)
+		dai_link->playback_assertion = 1;
+	if (dai_link->dpcm_capture)
+		dai_link->capture_assertion = 1;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
-					break;
-				}
-			}
+	/* Adapt stream for codec2codec links */
+	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-	} else {
-		struct snd_soc_dai_link_ch_map *ch_maps;
-		struct snd_soc_dai *codec_dai;
-
-		/* Adapt stream for codec2codec links */
-		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	/*
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_rtd_ch_maps(rtd, i, ch_maps) {
+		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 		/*
-		 * see
-		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 * FIXME
+		 *
+		 * DPCM BE Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 * It ignores BE Codec here, so far.
 		 */
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
-		}
-	}
+		if (dai_link->no_pcm)
+			codec_dai = dummy_dai;
 
-	if (dai_link->playback_only)
-		has_capture = 0;
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
+		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
+			has_playback = 1;
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
+		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
+			has_capture = 1;
+	}
 
-	if (dai_link->capture_only)
-		has_playback = 0;
+	/*
+	 * Assertion check
+	 *
+	 * playback_assertion = 0	No assertion check.
+	 * capture_assertion  = 0	ASoC will use detected playback/capture as-is.
+	 *				No playback, No capture will be error.
+	 *
+	 * playback_assertion = 1	DAI must playback available. ASoC will disable capture.
+	 * capture_assertion  = 0	In other words "playback_only"
+	 *
+	 * playback_assertion = 0	DAI must capture available. ASoC will disable playback.
+	 * capture_assertion  = 1	In other words "capture_only"
+	 *
+	 * playback_assertion = 1	DAI must both playback/capture available.
+	 * capture_assertion  = 1
+	 */
+	if (dai_link->playback_assertion) {
+		if (!has_playback) {
+			dev_err(rtd->dev, "%s playback assertion check error\n", dai_link->stream_name);
+			return -EINVAL;
+		}
+		/* makes it plyaback only */
+		if (!dai_link->capture_assertion)
+			has_capture = 0;
+	}
+	if (dai_link->capture_assertion) {
+		if (!has_capture) {
+			dev_err(rtd->dev, "%s capture assertion check error\n", dai_link->stream_name);
+			return -EINVAL;
+		}
+		/* makes it capture only */
+		if (!dai_link->playback_assertion)
+			has_playback = 0;
+	}
 
+	/*
+	 * Detect Mismatch
+	 */
 	if (!has_playback && !has_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
 			dai_link->stream_name);
-
 		return -EINVAL;
 	}
 
-- 
2.25.1

