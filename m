Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F00894BAA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1F1238E;
	Tue,  2 Apr 2024 08:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1F1238E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040251;
	bh=5mzDg1MpR5+D7I5ujfZQSOElERi3JYLG5yKE9re0hyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fMOm/VK0QT7owIN8L8tIeXfmm24M7y7B7m/SqCY8OG67i0eSpzPnJm3+KwUU7SZCW
	 ZvDOV/6evdRN5ICnagQKwSdrgmh3pjckyPhUfbVod78GDhDbl3kDoov4CbEXmY7QFI
	 F47e7l2F1AW5xOHnKI6MC+vjv5M8vDaC7cwQCHt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A53AF80587; Tue,  2 Apr 2024 08:43:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D05A6F805A1;
	Tue,  2 Apr 2024 08:43:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1C49F8020D; Tue,  2 Apr 2024 08:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53DF8F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53DF8F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=C0iR27NE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYMelNczKGGtqHaWBQoIJ8AaWxKRpVIptpcC5WAzwhXgG25deGnYVdvhzWR7tGIy+X23r12d4r5DOeLa+wwFs4BszA97a9MibZAaz3bFH3vNBYyhRsSblgREXokFDNf/0KHvOHKQg9Thp2lI+hHNGvRKEg6lNszLGqJ2DuArgERRz9pwPYwZC97rxEJczLXGaoCGR8P07CT7qQhZOWSx+KmKxY3KwPevUR5/evGqTnoINNqSEDeA4xTl9CCmsmMX/M2dFAZdmwiPzsLM2bcM9b8LWFReOqt1kTcndoEC2M0+Bxphm1H+CfJv8RDcn8RaxRbjhP9mvsTyM1s79t5kTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1htx8VIPkbMIrMXe6sdnAxfXp+H7wTWuHPuyQ1WDErk=;
 b=LPxiP+0n8DRnt0convau4WQWiLJ4ZCumHsXEpeuFX7lGyeiX2TKD28vNgcZKGG49qZXukJ8AsAY+J9VbN2UMj0c3foBoJHJ4sACl1P073wPOrX4rTuViuf+gjx8gaLvZt1mu4WsVZ/+kTGai975Uw4X57bmBW15/3xoEeleHuGmPsf9EmPjpXzvM9oOxFKeY3FQ1iiRUusyWsrSNB4ZvvNB5BG6Qnw7Ub1nXEHakgKqOVq/xd6XDbyWJWM7xHefDn24McYF+M3SWen1f16KYIRgjP2nJRS+e0yuUlOGJaGJiVCMInxeAX2cbOwWz89UAH3436z9h8Y3RzYb4aHOaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1htx8VIPkbMIrMXe6sdnAxfXp+H7wTWuHPuyQ1WDErk=;
 b=C0iR27NEZ4vuFxGsFbPNKdkJzF4b2YFCaxnApmUY79cBonUf8qqpiWmJ3X+I56RMMwCLjm5nKUFaP4V4moz1oTIpseW1QlUJBn2jlP0UDLY035UzP9qqWn2W52ivxF8c35WXNgp35KSGOUwJxRaiSSKufdkrfHUuqUlqgzEkVwU=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7724.jpnprd01.prod.outlook.com
 (2603:1096:604:1b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Tue, 2 Apr
 2024 06:43:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 06:43:17 +0000
Message-ID: <87ttkk9se3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
In-Reply-To: <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
	<b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
	<87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 06:43:16 +0000
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7724:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xMpHpYCJQFX0LsnbN7NGE+iNJ976p0lquWNsFyFooFVRVUlRjAVZ1FCfx0RKst7H9HJ+WmL9XsuUTpLeBRCcLxkfoOsbJwJ4rOHceOGOJdCRTaRwjg1qNc/c07yr62z2g3iXc2bFGQbKXbLahxgwoKK2YIudcG30fRwKED9omPvw55NI9B5VbgEJK3tLGdyATZROPfKyk1j7saX02SgV3GfERtj56eonYb9yNLGClsagUfnMKdI9UzR71Ndp12sW1EeWfHpJ2L2wCVqsRMiiLx+bWbKA4+JdBk9ms0fW9pCh+99V+WboAsPEGIKFD3AXCGAjIIs/GPtlIKoUDkXQm2oYoxkjSRvipQ5cJkLP564vp/BGMXNeHIAc3srM9/4+SxEO6r7m7ZkmA5MOXD5uR+PfEOrC+ggJG+ih7lDWX37imF4x+Oc3V1eTp7lTw0VMOkJ1I9V6P/VuQiqNKHe1vezxMMC0XIchL2AEFvz2k4oRko+XG5OqufE7Kj91Ed0P/J3fNjI+xwGqCAuCr+GsFqHGEPf5YCcPgsaBQV710nCldwKbDEhFNCubXuS1040/aOy4/o0Vy6HPLay1oIXy/p70EzqLK+0s0QT1kpSOeaf9TkA+PG42pRcMnrkKU3+LWYUoeltV8kLPTV7LQwuDluzEkadMbbbuCj82H1u1X6xAMKRHiR/0bxLmIB4qXeLgL6NU0unkvwgSKU4HmiCj5Lg29mCkfzYPZK+Wqe1fz3k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fx8ZXlOMGxiX5mTweTg3Ww54bM0opm51B2OwfplMD8V8rIBotnSmYehTLqgy?=
 =?us-ascii?Q?eouEgvzmBPvknluKDNmTtZpf1E6a4Nt/K06ekS8SPL4QvOB3kZaWxqG4H4uO?=
 =?us-ascii?Q?lEUHzhNvsibxMPmq/362jbYQejyMeMZNXewfennq5NV0iKmh3+5C3mn+bx7t?=
 =?us-ascii?Q?ZkZtzVY4cgqZtTs/ZimkZLYZdYbHZM1NUdIFRrfxOaqAVOqDTqVAsmLPwwy8?=
 =?us-ascii?Q?1Jbi6vlFwCCSHkVz7ip2ywmCYDCuQ/Z7AgLYIyjP4duHe9xdQa3CskFbrCK3?=
 =?us-ascii?Q?nKTRrir9eY+2GzelEcf8blgEy/zMRV4veyZ8IBKaWoYDEUt7aLb7/cIALMsO?=
 =?us-ascii?Q?DPyiQEKlbFRBVKHdIseYyRQK9aOlDtqoIyofnZtu4GWh5FsS7aATYTOVKqbv?=
 =?us-ascii?Q?P6lJK3C5lD5qudDGrZvvdx8uM4012wRGu35NIc9fw2VT243wV5nY1B5MgDQW?=
 =?us-ascii?Q?WQZDdKzg8J3EJ2xEm1FSWLx8keibLaIg7KNLRjryWUZImo6k4we2yFP6pkHP?=
 =?us-ascii?Q?B4k7GFpFsgjOBzkscaebDNz8j2v8qLrDYcanrAnIb69THF3HgkHrlWBRNVDS?=
 =?us-ascii?Q?GMAdmQDuEZrYUR0ez60rLDiGZPbf3gI6r5KB9PbHDRywsVEY6nWCUFlOzUfS?=
 =?us-ascii?Q?96DOwpBWfwV3O2odqIUALAymFQl5rrKK6kkQvlroOoEkN8XVXDVB6K8t4SjV?=
 =?us-ascii?Q?WedVjcZj9elMjlmljJcsJlpY+BD6yUs0MOgp5HNyyKtDDYQyhisYQoBT7ata?=
 =?us-ascii?Q?mSKLBnZDI2r9C2zoiAUgqI/zO1454COWWyRZtV2osoJYKyXc+AezMDiNimC2?=
 =?us-ascii?Q?8DZ6bm0S3LMx5tNpEMMtL+kkQucENrkm4MbEX/ZFV9qLgQqXTyXDYpURbxox?=
 =?us-ascii?Q?K008wL/zXpXQlsYe/cAVkOQk32mFTMaxm4LFTdYJ2DVKg9nqDVYzOmAREqzo?=
 =?us-ascii?Q?eJ5ZlVODpRLt+nnU9RrjeRFNDS0y/GeQA5bxFg0SvUeskv5FMr7C33cH2V4i?=
 =?us-ascii?Q?FI4k80/1HE1pm3Lj0S1lGrBzKoxZSQa26KOrUxSYxqNUkaxmckg8xEIDdYB4?=
 =?us-ascii?Q?/sSRIKGDsufZTYcQ1VUDeceLemSIcnYOIGVcJ9jwClhfNnCohjhAI0MuVIne?=
 =?us-ascii?Q?F5zq1oAwCIHjOeGhUX4gOvhUrM1ik1oxALS6CU6A/2fammKE0oXqIeNVtTIX?=
 =?us-ascii?Q?+zk0PdN44ukeh3bXLYNJsHp3FizVszEpxxgrg1TRnpvb9EPhfyOhykLKVlGV?=
 =?us-ascii?Q?jJEQNEdxMCJDAKay5T+tfhObK3xDiYfDlcSnoP+wtBz2Xfe3ETNZ4FM9Jfz7?=
 =?us-ascii?Q?7QX9GGXiHyp6mV+zpZRupY1T7n5oNqXDPrfKPjD79ftJ3OtMNPGcCPc3KWUN?=
 =?us-ascii?Q?nhJ++XRrjh8fvCuO6tVoxMm+CV4ALvQR2yJejnLUl51QJ9J7TDQSqa9SvM02?=
 =?us-ascii?Q?LyAHI4gR29u0eM1GYR4GTG59KftarH6aJ+DLW2GqZ5G6OzudOc0uyXhlrPEb?=
 =?us-ascii?Q?Wj/5iTSr77sW06lYRCdMImuNAqlcOcU95o5+vMptD5qIIEzfgs6+IFMgs/rd?=
 =?us-ascii?Q?FFfK23Lt/1+pVIwKCNRXWLjIb5fcFFj47KtB7H4qTgQ7rTHeZ5FnCpp0ykco?=
 =?us-ascii?Q?5fe0ty9cxQ/gBtyR1nj4kbg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b32eb9ff-a4ed-4d08-9932-08dc52e02d99
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 06:43:17.2680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fQwSl7voZbltFFOEnkoSiFAqf/lZzwkPaMP9e/N+/vfBUpNr+llUHezh31LNx0M4zCZpKAfiPMkfM3r1l7jSi0ycIXo/l0LCgzLu72yMJYXY1eAXiobmSSNG10i6uJER
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7724
Message-ID-Hash: DQOH6KKSJTLQMR2YV3SWDHRJNGGVJDRS
X-Message-ID-Hash: DQOH6KKSJTLQMR2YV3SWDHRJNGGVJDRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQOH6KKSJTLQMR2YV3SWDHRJNGGVJDRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis, again

> > The problem I have is with the following code (not shown with diff)
> > 
> > 	if (dai_link->playback_only)
> > 		has_capture = 0;
> > 
> > 	if (dai_link->capture_only)
> > 		has_playback = 0;
> > 
> > So with this grand unification, all the loops above may make a decision
> > that could be overridden by these two branches.
> > 
> > This was not the case before for DPCM, all the 'has_capture' and
> > 'has_playback' variables were used as a verification of the dai_link
> > settings with an error thrown e.g. if the dpcm_playback was set without
> > any DAIs supporting playback.

Hmm... above 2 branches are used for DPCM too before.

> > Now the dailink settings are used unconditionally. There is one warning
> > added if there are no settings for a dailink, but we've lost the
> > detection of a mismatch between dailink and the set of cpu/codec dais
> > that are part of this dailink.

Does this mean, for example you want to have warning/error by dpcm_playback
flag if you are thinking it can use playback , but FE or BE playback was
not valid ?

If so, yes indeed this patch removes such flags.
But I wonder why you want to get it in case of DPCM only ?
I can understand if all case want to have it.

Then, I think we can check _only for this purpose too ?

(A)	if dai_link has playback_only        -> it should have has_playback
(B)	if dai_link has capture_only         -> it should have has_capture
(C)	if dai_link don't have both xxx_only -> it should have both has_xxx

I think we already have (A)(B) check. We want to add (C) check ?

If my understanding was correct, the things dpcm_xxx flag can do is also
can do by xxx_only flag. But dpcm_xxx flag is used only DPCM, but xxx_only
flag is used on all cases.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
