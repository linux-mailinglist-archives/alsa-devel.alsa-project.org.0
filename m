Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3058CA4E6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 01:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDD7B6A;
	Tue, 21 May 2024 01:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDD7B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716246820;
	bh=/Q+M/cawPpEvjT3bComrned0Zgm/Rk62QYMu0jqRW+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dneXtWpt/SHUHdT4hYptwANZHjASGgjjfGQRdXnZmX1inbD3KQMH2y4OknFCZ1EdZ
	 LG6EjVd+ClVQ6SUv6qXJaGbNnF1dWiR8G4yPr3jPoL5Moi+Kgx1EmmQMzhCxcgECsR
	 HTKzcfjW0OrxPKfqj1DAjpNgOIymErhVFL3+NTkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A5A5F8028B; Tue, 21 May 2024 01:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69FD5F80580;
	Tue, 21 May 2024 01:13:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A15CF8026A; Tue, 21 May 2024 01:13:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E4643F801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 01:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4643F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bYU2f9+Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffeqBgnmPnxP2dSfHwiPMzMhJ1txmdqhNqioiEGGE22E7Zi/9c/1MjnJWp4uwVKmbUnuL41ntxuchiS6Xd5YOzrDSdrex+K7mOlJhQPd9IOFxOLT0Ex3sAjoqHX3h4pCz7G5Vy1UClOoXEIc85uRRLqMsJXz7ok6+IDUNcj/Hus6fKI1ixc9IUv50N9V2BxxQ87Z1U4wXsrsmbOeDaOUcek4AhQ5i1x98o+yIOxSyOQAWqzrwRxdKbck95DlU6ezo6BvIktNp6zxSsc6geujiQtNFAWcan9G6XSGCFjjuk+0TEPXOlQpWfAIdBJIS8DCCe1Rfc5pWhuQJFE59wZ/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1z7Q4LBDNqJyY6ln+Gjv0z2lZp2G6mv5hiuk69LLhk=;
 b=WXEIil+bX2ZngVg0wvlGVpq4jM7eZ0Oh13tOa0/97PqadDeSWaPHLPtcsJuDHk0aujY6GiBr50TWu9g6aiPcGnjmnNL++oDYcWSrnhltCNNQUiTzhv61XJfS0mwchjy0q7klcf8aCAwgMRA55VlL3gi+TQbo5Wd1jaEJt2rNfg7NoxZLiF1LgAchULArktG0/dIPt/8IczSuObH3VfvagN2oZtw7nT9Nsi2C2TUK6IQb4tuA8pYBR5s4pr3Z3WwuzE8kQGDLeGXgncrmsmptBP/s6MFHlFI3+NfMia+cSPBsV9R5djOy/M6Nd6JzizVGLw8v+jinMtaHUz73PKNmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1z7Q4LBDNqJyY6ln+Gjv0z2lZp2G6mv5hiuk69LLhk=;
 b=bYU2f9+ZKcsUlb4WE6qgvrpQjl9lojMgernfLxpFJIZkQL7Vx3klaURXXj6heIhbP73vNKsyrJVMENvQOKscJCyYVvcl7eSRfWEBnqXTEyD4Ur/23bagxcy/A95eNhbkkjOOq5NhwQC/texnUkm4i7a01//uSgEtkLoPl/48Pr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11730.jpnprd01.prod.outlook.com
 (2603:1096:604:248::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 23:12:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.035; Mon, 20 May 2024
 23:12:39 +0000
Message-ID: <87zfskcc2h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
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
	Maso Huang <maso.huang@mediatek.com>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ASoC: grace time for DPCM cleanup
In-Reply-To: <c2ba9a4a-0e01-43f5-8490-10aea6de72c5@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
	<c2ba9a4a-0e01-43f5-8490-10aea6de72c5@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 20 May 2024 23:12:38 +0000
X-ClientProxiedBy: TY2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:404:e2::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11730:EE_
X-MS-Office365-Filtering-Correlation-Id: ac18822c-1d02-480d-f7d3-08dc792257f6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|376005|7416005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kaItACl6ZaUDoA57NeULr39pArrInXtyu94R8KMh1N0XT05WivXZ7hVwSWl3?=
 =?us-ascii?Q?dI1MZABup3XNcvKGXrKXXui+4cb39FQdaZXjEIjwS3RwDm58+rXtNDYRQ/vz?=
 =?us-ascii?Q?qjMtxsbkZ6qkm2FkqUVjvLKbuBaoydvcje8MYM9cPod/hQbkTFGx/WaPZxP6?=
 =?us-ascii?Q?bkg566xwp5AG1EWUPo81agzmccv6Gj6UI8iC1m/2hK/GxZrS9r+VGNvNCbHm?=
 =?us-ascii?Q?RUKZwHukX4bLatoVZoYCM/jR/nph80/1z0/3eHrVNqfDzD5ClcBF/AUm1GPW?=
 =?us-ascii?Q?MAhpzX+rHulPe5wlS6IEqdKfxEu2kl3KXud7GhryKClta9l9I8VrXwBOiQW7?=
 =?us-ascii?Q?Is+V4plfxrgUtVsZTLlZrZxkiBXEnolxZqpWutLQKk1Zb8EVONwoyRsUqTEn?=
 =?us-ascii?Q?R6iwwnsVLMgGg4B3HOk964l6JcJSdzS9zSwONNtjNR3op4JnhBFv4roI7v+c?=
 =?us-ascii?Q?umHh6pSBrUOn/mPusjpepzP528t9aR1nDGP4Yv5yQRBpPWuRan0Wh6yx1d0V?=
 =?us-ascii?Q?VusO/TQ27XqJCznLpXL1C9qcjh5d6LjHhFpVy9bLxkgZjZ/r7hegMV3yMU/q?=
 =?us-ascii?Q?xpfvtVQppu9rWv1sdeUGL9ArtNNpNt6BIHtnmDEVAlma+dkn7d2ua/TvfWKO?=
 =?us-ascii?Q?rZ8L/yPyq0a9RmPXQcjQQzUmq3U+u57DPOYiy70xwDmmTYQpqt4vTs6qXem4?=
 =?us-ascii?Q?plUhxQiVAVsz21ibvp18xAAGaeumo00hjjAHqGhkcBvywMXvElLEb48IUYBx?=
 =?us-ascii?Q?0k3IBMpZoeY1oRAYsnEaCEl5b1JkaRW0O8LTJ+MNNI5Hpyf+5ideeDklYQML?=
 =?us-ascii?Q?/wVuBIBs/EZtBcXLdZhd54pGlPf+mbgiXyr7OSSS+857blnNb8kvCrB4UWrH?=
 =?us-ascii?Q?z+Pq4ll8Jq+i0n+NhEzXMuHOAsu+R/GWzQwTjWI+57sAyOqEQnrqya3bJVe4?=
 =?us-ascii?Q?M6aVOsxCnvI9ecbRXwDVGEWBS/YMY5AC7yr055rDDge9xItKl9doZuvsXZRQ?=
 =?us-ascii?Q?PFv8/74eq0oY8SbVRnPG+K7dUNI7pankqrtd9y4bwz2Wn4j9DbBRtPEitXzQ?=
 =?us-ascii?Q?PtHVO/cEoiYbo3ZYARPJQl7464c1cXfZFeqP/vqH6iwUTybrK0bVzJOgaZGA?=
 =?us-ascii?Q?gVE+/THdeaOLwGcKddUAoZPWDPg9iNBvr3HNn62ww43wUTrxqQCc4YK2tOEe?=
 =?us-ascii?Q?0krfvAomjp6Ff++tXufxEhnU2SzVBOoum9Y07xALwpOPZD90mksPzyvZLdsc?=
 =?us-ascii?Q?kYSSkcAzoPiOAiGEptTqS3F8noeX2TDRWTeK5NJO0WNRHjvAs40b44+BXd++?=
 =?us-ascii?Q?3eOJTAttZW3H2jFkJx2ERP3N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(7416005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PLUN8Ogk2Ia+l23MfF0ZetTJhF0sRjDseL0m/aX8XSNLy4nwY2ftC/UImtzG?=
 =?us-ascii?Q?eFqM1cXV9rPGlHvdSh2QkDGdQEKNB1XGJYWbwHL9MdEEbs77p+O1JJa3X+As?=
 =?us-ascii?Q?kNOA7AFl3C9N3qAqcu30zSUIeb3b4wfmCmQPYa2jRFeaYS7KTLCPpq75zz/T?=
 =?us-ascii?Q?rljS/iO4YyJB+9z8DIfkRH7LWcgWeYiNDM4H9UxTqaykve4XalqjHs9rbamb?=
 =?us-ascii?Q?cguF+BNyRuCJzdi8rHzFhrrLd4tA/+Y6m620N9XcXjdaU+mQGWVtjM0JjHMk?=
 =?us-ascii?Q?v2ms4nGFCb2I+HXQiGfSoB/WmF81zpH8QA9Zn9RpWsCTmDbf3Qsl6tJC5E2e?=
 =?us-ascii?Q?6KMf4OxYVylRcIUWeyTAbNiRoRKYvO40n0myXP+8K4/QaalO2rYUXMlfVq1E?=
 =?us-ascii?Q?jHzBfltGJXGxFx8HDWsQYQEgX9EzzjPn39X1nZ88UW+u8X2t3mSbWa49yu5s?=
 =?us-ascii?Q?Dtwf5Gl1oe9eUIza5exyAQgdp+33n3+u3J559waU6N7N3+m9+L1W0rU+hCLP?=
 =?us-ascii?Q?6/jjS6BeEAVUqML8nNRC0zyT2kN4vBqfIOY2BqZ7T0hpN3EE5i5mP+5cV39d?=
 =?us-ascii?Q?Jf1bcwTPaoancVh2xqqm6EYfY2lIMpWwEn6Ln3p5w2Mg6vPMxCcAi7757egt?=
 =?us-ascii?Q?VCRCLYEIYBodegqoWUTHzeJr91XOwT4ssME0odgSOL6KS7djKusISkIgx4lG?=
 =?us-ascii?Q?KjKpzFdCa3Da0R7llNWDepwiIJlIVfzbVCQMf+nPH2XRNm5ur7UEPc+fl2g6?=
 =?us-ascii?Q?DnsvzfqH7iMbh8EY6g7bmRsEtQ2gnKVdGuVB5CXj2PEN0k2dyLM9Zd6hmeMV?=
 =?us-ascii?Q?bSwModb/idhek9pqsCNiuVpjKiVemTfC3T5nV9BD2OtIKbyTY8jfSf2VCL+L?=
 =?us-ascii?Q?vYLKsJVEwvQ6jcZmMy0iCFJpTfueIBkLPUWpgtj41sIL7KzB3Cr1Q+eFPQvi?=
 =?us-ascii?Q?TmZMCXlNc3fRO3JW6Uo6helw+k1vVk6Qu87umacHS5vIq5hI9W21NNzJTJ64?=
 =?us-ascii?Q?9cG4a0ays2DxeewzJzyuTMzQxensRas66Jf++zMItemwxKwUPvuBlY+d4USq?=
 =?us-ascii?Q?IfeN4sqcQVjlDKyXdUmN88wjmjZa/xr8duUQDf/DAi/9OVkT9PTqaL8wwBIg?=
 =?us-ascii?Q?vGw+fgnn1n9kv17neCqicW6/wza6RgP6tybGkob1m1bGwMaaWSWfB6k5H2gO?=
 =?us-ascii?Q?d0tnt7XMKJhd44vU6qNTFFSD5Ps33dqQRyRAy5mk1dkeDACmitxc074ZMOYd?=
 =?us-ascii?Q?TIzfKpLuOxix7T3Hp0JsQqczcXJWefCfw5oXdOINtxrt4v6FbdGn5o+2YFx3?=
 =?us-ascii?Q?mrBe4wfssppmuV+2WnoMFdUJ1kSx8Gi7NuWQrKOviJZRQ2bMHP3FbbH0gPwz?=
 =?us-ascii?Q?2FMM/e2KSTKoVFmK6WaVfrKuxgGwz+zPJRsYCR4N+xdEmWtVNxLAUqQP89c9?=
 =?us-ascii?Q?20vmrhTRlx63SlPtewaNTmmwIHo8XRS/rMH8+++BvsfsMX1+JaAJVClU2fQ2?=
 =?us-ascii?Q?1XwLBJo3hyA8BcZXHXszOyCLsJpnXiAJdC9nQHmrCtc60AM8kEMArhyIlpHl?=
 =?us-ascii?Q?Zjy4HjaO79vgHBwxgh1us2FPZb6ZbQnmJinenOvRwRkmNwdWrzsVt11jdfRa?=
 =?us-ascii?Q?TJTZwh1G+V66irnm50ktM1k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac18822c-1d02-480d-f7d3-08dc792257f6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 23:12:39.2360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U6/ST8WGaqzbhC/7fXkmgoOg/VfSBg4igfk/vMt3bQsGaEJggZN98+ADal35ev+65hh1IoHrQkY+cq4Oid08uzv5zHP8aocLbe1Riu/+r2y2jibKacrsg1o0QRIBS85f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11730
Message-ID-Hash: 2FGMTVHDU6DVHNMTME4DPNZ3RBFVXLA6
X-Message-ID-Hash: 2FGMTVHDU6DVHNMTME4DPNZ3RBFVXLA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FGMTVHDU6DVHNMTME4DPNZ3RBFVXLA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > v2 -> v3
> > 	- tidyup typo (reuqsts -> requests)
> > 	- add Tested-by on git-log
> 
> I was kind of expecting Jerome's patch to get integrated into the
> series?

Ah, OK
Will do in v4

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
