Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E72896089
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 02:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF1D2C50;
	Wed,  3 Apr 2024 02:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF1D2C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712103214;
	bh=+7F4MPgnzyOr73TlH842PXLuboT3aQVoN1QWWtSJ8Pc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KkaP7aN8ItPQXbP7IARCgBXagufexbNJX6LPYyfIXWkEEsq9VK11vi46uxMsuPiqO
	 wPQd0osHq0/PGEz/AFvfm3svuQDqUd54ZIPMSI2ZkPPSAav2e5D20TIBHbUcYm3e3b
	 3Mm77hMk5ukFrcIazMwD5cNqCDHyFPwD3+3RA1YA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED32EF80588; Wed,  3 Apr 2024 02:13:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DCEEF805A0;
	Wed,  3 Apr 2024 02:13:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CD35F8020D; Wed,  3 Apr 2024 02:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D749F8015B
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 02:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D749F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gW2LZZv6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I33tKgn6KlsbrCghjRsctxCaR6dPXyP4u3LE7eCurWPsBt7FKFu3WXDB2x9CDw+lIiZhAl6qDJUapgOJMzoY8Mn4duifMahK9nXlfDHs19X9pmdRfPCDtUxuIPK/PawrFxayifAhcC1pe5IybiPAwUXEDPctca1Z38dmwHKzObwG/3VX0QBzX11GApjdMT1QAlNWXWP3LNvQmFbE0qAUcstHet0SJQM8l+DmhVr7dDUAgl65OR9dgub0jdI4y+r2VBGz1Vlwf0OUXdoNGTl/7UuVyP9PJ/2Ki5kN+Ez8k4CnM5rgyh3OgYaZDDAlLzPRERVuckyddmkM/d6ViOmZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NIVQRI1xIgq4T0h5OlX0HZg5clVpqjQn03KmIEyib8=;
 b=RpmHoUsGBdXzWXPAPCRX9+iaO0fNVku78OYySgTxuuIGQybXxvP0OE9bWS3+UQ91VEuIhW3A8MpW++LK06Uk17gJIoSqOFQuNu6uFMpX9+N5eFAqYYjn4+3ytZLsNIPLLvQ1k78YTBo4dz9djEZ1cMFYR8l7bz34egrONk2bnPOIPXolRU1ffTXsNBg2UKVVP2915B2q/avodcMx6dQ2Rrwsmt6vufpblNq4DOmrOLko25bZFmbq2VxN7We5iFUt2nNRMfj6nbIMjjPmfQT6pWzKP8DUOvBqfd04C7eiWVQyI1dxhvc7a/nomh96mckCCTeNHzoerYE1LbdFAfOFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NIVQRI1xIgq4T0h5OlX0HZg5clVpqjQn03KmIEyib8=;
 b=gW2LZZv6ZIa8nukMW6BfTIhVdZXeqhu3Uq0vRV7VJmXgyqw1UPFJAyl7BAFoGY/tFywIp+Elx4uSE/X7i9j6kQXJhdh3XM+e5OvXNfhmDjJu1Nh+HRAYsp8HSmoFBmqFJlniHsqnnM6FhGNmMF6ega7QMdaqrGm33DZlGTaZolc=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7089.jpnprd01.prod.outlook.com
 (2603:1096:400:c0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 00:12:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 3 Apr 2024
 00:12:39 +0000
Message-ID: <87plv7nw21.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 06/16] ASoC: Intel: Replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <25c75790-3866-4e48-bf66-b5406df6e707@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
	<25c75790-3866-4e48-bf66-b5406df6e707@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Apr 2024 00:12:38 +0000
X-ClientProxiedBy: TY2PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:404:a::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7089:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	boXigEhJGXkps6AxbhgFq3lPdET6dERW/iFW8bQRHHnxdMorzWhyUt4Ma2SJBR6o2VUGoeaRKfChUXHT0V+fNo3RSdHBJE+JEdP3qr/ZQPQfIcNzT6D0F5AQVvD5oB0q1tIQK0oxIxuYgoqTnIFw8kR4bmBYqqEVgXhY6cssqWpsVEQDHgVML2FX9krTVhTmnXBuUlBqhcGOaRbaZoeIhYtt6wciGRbfF+Zma/uPYrNGm0uUzW9N5cmt0z1Zn79D4Pxc2PXoqdO+Yq1Atkynu8+fLUUhVRHO5cviCYdoNf1dMsI0yQVvPYIKeT0F1J96P+yAw0Kw2kf9M4RUh7EdQ8QCNTUAoO/fyPmke+v8EGyxoOZLQo0E7Oa8+Hj/1cBWm0EPJGMI3XUHGJn2dSCarb+iWYEOngGVO3x1FODrSCWG9WY+NgeTJEpF5/SloMu/CaapKU3NW2n5WIYE4CwimKF5yzuzYumkt2vPfbp6c24TUBy9gHj2T1O2Hv3HrRwoYv7T144JYpeC7k8n/zVu9F2S9HZ+qQ2+QMkC3wA+5O9wnxX7ZvLI6rFuJU8cRLOlLEsZdiB6waspMkfrKuXsmOdtyp8MzHa+k14vq3qvMu/BBS4eRCd8wJpnoVSF+qOB+igxWjkviL6624qUk0uY8qq7XrqNWDp3lS6e2lbPkFG0ORMhsND8ezDi9mzgniHE5DZDx58dzeRMJkm4qZEPkWZjdYwNcQ8usRqMiokuz5k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7A5Spy9TUnScyIXEvHqIucGLKhmmAgBzCMa+N2jYaVbqM1TJi3AoGNl3UyYk?=
 =?us-ascii?Q?g2sWd/R580itqDmKbi0pkHVPnfr8q8M8IJwYpBDoa7Lp37pd7IYbRjJgsNDI?=
 =?us-ascii?Q?u7xImWZjSqdHMaL3OMVjsoDKhh66spBLngB4DUQStS0oCFGKeXsZ47+ZU9Fb?=
 =?us-ascii?Q?DG+JCANGt8vvTGEGfASCBCf5JN/3PQmiyKG2XZedz3u1ojbRnbCFehV2sL3u?=
 =?us-ascii?Q?Se47LrXGE3cn7qgas7eWJGvscQ/a33RIbDh2KTUzX73ByaSk+k18Zsxe8Ldx?=
 =?us-ascii?Q?JktTjJ1plhzuCaBsDJwYtvN4NMhfQw6Q+ImYWwCXDMxMVKNyxjy84qQs0/Pc?=
 =?us-ascii?Q?eD5pQnJrpPWTbpAXxE+yGqxS8dNBBG6JQ3Qac9tpREZ66IuCXONJ7Io2dong?=
 =?us-ascii?Q?LYmkMRzrLPK+7QrQjPjvc+g0mRz2Sgg9KJ6QOdEUBynxgNzhzaMri3kP9QgC?=
 =?us-ascii?Q?iUfP7WgxNBGKJaxljO9e7ObSKe/55WviLQy2KQtz4gVx+HoDApvnDJAW5kzR?=
 =?us-ascii?Q?gcUpE+qX0W6JiDlBvf8Oo2vdMrTC/xdgXHmz3FyavlSKyTqLd6JPj5lk5vU5?=
 =?us-ascii?Q?pd65EWEdwLZOf8NvyhBJFp1PmbYzqFL0DoyTltr3m7IUa+VZiyoWwU/InS36?=
 =?us-ascii?Q?5tS1/S6A79+dEAMaZ3z6KQ9vLcgmc2SkkkLIeBABDnFYGkrFhXIR+KoNd1QW?=
 =?us-ascii?Q?m8PVBmYxYCgPYgERL1cpv+pgQodsFHz9FZF1ZU54B43WyAFcX9cHAUJ/5Zu1?=
 =?us-ascii?Q?sZev9dJQNYYvMi23jvukKjD5CduKGUkmxZRAymzgSlK97A2FRFmuOpfq6F9p?=
 =?us-ascii?Q?riE51ja74i9CtGcwmUzWCkZv7M0toS2Cp+0YcCMyM/awsjrGYa/mYXQUWAKL?=
 =?us-ascii?Q?rFlWZixaPPRNGdnsAny/QeftdT0/M7dgNWZ9rraeuShcsb3uougQbzbkMalu?=
 =?us-ascii?Q?tOX6sGTf2EycA5fE3Y0ZLUQTfaWyA6dEcC6FmvHE0GrpMIxvHibHPSY9p5qz?=
 =?us-ascii?Q?5JZgw+eOG4jwpHF9Tmi3nDHNLMawbHUKlEZ9iTobdTzpr8ldZ1ZcmwFzxNj9?=
 =?us-ascii?Q?J+0Gp+u2kTmYhbtW/Wqw5nP2QHcRjHS+qmCV0CU1RikEbA936ioIfTeoi3Wf?=
 =?us-ascii?Q?pgzQ0378N17qonlwhSdPCx62R5PwZadvKTN3Juc815s/5zOU86ORXrf12mgD?=
 =?us-ascii?Q?raUMfqsXJFFrCQZhjAoVvoQon5vv/X3NyecbmpEV5QuTTQmAJiazM8KIsFI0?=
 =?us-ascii?Q?WteY81NPJtqbUpYHE4vXNSrj1PZY90OsqKsz4d0yCPoCvtXCdZbW+ohflAEf?=
 =?us-ascii?Q?Pok36n1ZlZUfmgefWFRBqXL3nYPqp5V5eAKWLkcjNRmcOE92ZCj6BAWHMkM2?=
 =?us-ascii?Q?1DvdMYipceG1eL7YjBTe24z/7uAZ1IbbH5vP8dWMZVZ5lRw7CKalrTE9UqXO?=
 =?us-ascii?Q?rxfN/kvK3nzMdH1W2Zai8PMZvR6JzNkIKBNMO6S617pz0S3wb1yYKciB4mrq?=
 =?us-ascii?Q?N+ryI9slqgLgR9PwRPrVir56eli+8SlU5h+36dq/JjRfBfWke1Qke2SL6mYt?=
 =?us-ascii?Q?WoYSWROuBKR2tVNrgfRwbAKQE5hWInn7NjAQi4e3Sa1y46d9PjuI72uiWf73?=
 =?us-ascii?Q?BR5Y1rcviT/p/ITm1w5793g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58b0e386-1c58-469d-d6bd-08dc5372c5bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 00:12:39.0239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fw/SsloT1GXYFp/hEUAIMV2aqzeDqZ4Q8oI43z2sWeiCBC0/vBUKKOLkMjpIaVo7QmXikSVknm4IE//rdStkKBplnMJwSgtjxd6OALfgXpbavDT3uxtxgvYRjp2AI4aD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7089
Message-ID-Hash: DBBXXBU5VUJN53ZFMG3Q7IBOWTB5LADX
X-Message-ID-Hash: DBBXXBU5VUJN53ZFMG3Q7IBOWTB5LADX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBBXXBU5VUJN53ZFMG3Q7IBOWTB5LADX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz
Cc Pierre-Louis

Thank you for your review

> > -	dai_links->dpcm_playback = playback;
> > -	dai_links->dpcm_capture = capture;
> > +	dai_links->playback_only = !playback;
> > +	dai_links->capture_only = !capture;
> 
> Above seems weird? Should probably be:
> 
> 	dai_links->playback_only = playback && !capture;
> 	dai_links->capture_only = capture && !playback;

Ah, yes, indeed.
Thank you for pointing it. I will fix it on v3

> and while at it, I still wonder if it is best way to go about this 
> change, because it causes problems like one above due to need to do 
> boolean logic to know which direction is enabled. I would just modify 
> struct snd_soc_dai_link to have fields like:
> int playback_enabled;
> int capture_enabled;
> which would be far more understandable. And if we don't want to have two 
> variables then perhaps something like:
> #define ASOC_ENDPOINT_DISABLED BIT(0)
> #define ASOC_ENDPOINT_PLAYBACK BIT(1)
> #define ASOC_ENDPOINT_CAPTURE BIT(2)
> #define ASOC_ENDPOINT_BIDIRECTIONAL (ENDPOINT_PLAYBACK | ENDPOINT_CAPTURE)
(snip)
> I like the idea of removing the duplication of variables, but if we are 
> trying to simplify things, let's try to not complicate them at the same 
> time.

Thank you for your idea.
I agree that I don't want things be complicated.

Basically, I can agree about your idea, but there is biggest problem
to do that in reality. It is too late.
If we uses xxx_enabled flag, almost all driver need to be updated,
but it doesn't have something "from".
DPCM connection have dpcm_xxx, but other connection doesn't.
Indeed we can use xxx_only flag, but the user of it is rare case.

And if we use xxx_enabled, this means "default disabled".
The point is "Which should be default ?" disabled or enabled.
If "default is enabled", almost all driver need to nothing,
because driver is created to use it. For me, "default enabled"
and "need special flag if disabled" is very natural.

But if "default is disable", almost all driver need to set
xxx_enabled = 1, but it is very verbose for me, and it will be
more huge, complicated, and large scope of influence patch than this
patch-set.

It seems Pierre-Louis have similar opinion of you ?
So, alternative idea is have such flag in the function.

For driver side point, let's use xxx_only flag.
This means "default enabled", "need special flag if disabled".
(We want to convert xxx_only to xxx_disabled in the future ?)

Pseudo Code
	
	bool has_playback, has_capture;
	bool should_have_playback, should_have_capture;

	/* default enabled */
	should_have_playback = 1;
	should_have_capture  = 1;

	/* use spacial flag if disabled */
	if (dai_links->playback_only)
		should_have_capture = 0;

	if (dai_links->capture_only)
		should_have_playback = 0;

	/* valid check */
	for_each_xxx( ... ) {
		has_playback = xxx;
		has_capture  = xxx;
	}

	/* use spacial flag if disabled */
	if (dai_links->playback_only)
		has_capture = 0;

	if (dai_links->capture_only)
		has_playback = 0;

	/* both disabled is error */
	if (!has_playback && !has_capture) {
		dev_err(...)
		return -EINVAL;
	}

	/* detect mismatch */
	if (has_playback != should_have_playback) {
		dev_err(dev, "It should playback valid, but not")
		return -EINVAL;
	}

	if (has_capture != should_have_capture) {
		dev_err(dev, "It should capture valid, but not")
		return -EINVAL;
	}


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
