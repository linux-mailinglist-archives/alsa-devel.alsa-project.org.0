Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8B9592A2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBAE1826;
	Wed, 21 Aug 2024 04:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBAE1826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724206476;
	bh=421EwowFWCESv7SeL/veGmYK5+K6Q3kb6NTFpXPf9pQ=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z1RpCpj4pVdz6XiK22spVWm6sd/hSiI0JEq5zNJcY6kh5VGYE1Snzfl4+FLMEzvxR
	 4D6FXZxKR9NHyljI/ujZwhvy/HHlbdwgcp9R7vQWwHqmgvnCuo+viQAfjEuZwqCwCf
	 4jO4rf48wRT6thHjf/3EvgBKLDn/Ylgrupq5esZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98380F805C2; Wed, 21 Aug 2024 04:14:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF380F805C9;
	Wed, 21 Aug 2024 04:14:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FD1FF805A1; Wed, 21 Aug 2024 04:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C771F80494
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C771F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YUNMbWIo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiZujAjBVQqEfHZVnWpPQ9djSyYzQ3ifE+ZKMuNaNDgW45tmposeNME2K/9T7U8ezOorHPaH/zZ3efvHmnXo/7gA0fSjVB7M4mu8cCAzJH6iQaxxQZcE363gswBVbyj77GN5jnKwbBrk++YV2drdsdImBx3yX9qTHFP8FGbr0ucm/J07lPccqyVf0CoW5KCx0YGN7ptdfQ60MjLvSc6eTPXv40k6iJnv/S+Tt+f6Y4lADIpW8cRtBiq0Nxjc/9lETkE87KhMnveXPJDDhJ+9bwddqZb6BGz0eG4fd5mNGXGLT1691vwiJsHz2BkFkFoawiJZV5weETTPRVhJrE/CTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8WCPmBGkF9yuYE69O7efUftlIN6rr/4FN4tu1IBsWU=;
 b=HRzJxqyCFA4MgSQUuC+qoVrMn9kpVSkE/qDArBjpbH+RcxPwLaysfvi6TjFL6LJgiH837fXAzVQnXqgO5oOmClyuDR3hYqqCguiStQnVWKIy99zDqUHayQnQ7frPAiHw3yxq+oHZDLuV2tsyFR7tcrP6ReHYjhFly5NmWBIJxuOMP/vAcAnUtvEDM547hzuUwiowDDpCgr73FRvNUt2tRH9i6LZppS/kx96hAtJWEav8p9JWKNys7iwffLcDZ6G6YuJ0/ymjKnQdwSUA5MfGa+CPLT4/X58bMaqiyWPttJpGC4RRLY/NNfEaUBwx1OY4VBNDWmxjdycZR2PKCQA45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8WCPmBGkF9yuYE69O7efUftlIN6rr/4FN4tu1IBsWU=;
 b=YUNMbWIoOsrZVxTSQJ61E0Oigoo7y3ZFS4PzPiBQuQtphwm2UL9t0D3ai/TyVIh7FAXnTV9VYnL1b/Nl5M9QjUNiFKGyiSIp3oxYYtZaYAmzoPfqqhH63eoT1I7yu1BAynnO4e6CiIyEoksG4Cdo9/yBZHS15Lq2u/kyjlWILOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11873.jpnprd01.prod.outlook.com
 (2603:1096:400:404::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 02:13:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:13:57 +0000
Message-ID: <87seuyaahn.wl-kuninori.morimoto.gx@renesas.com>
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 1/4] ASoC: soc-pcm: Indicate warning if
 dpcm_playback/capture were used for availability limition
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:13:56 +0000
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11873:EE_
X-MS-Office365-Filtering-Correlation-Id: ce083682-d9a0-4d77-b43d-08dcc186e997
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MbOmgBwDUg8H5yKY0GyLM0tzOjD/EpAt8xoablYPSXokyIyLRGXi40kihjo1?=
 =?us-ascii?Q?qeZpcBHqXioD7td198b5rJ03qZj9LsjFI6BGNgtX3cgy4JpJIu+OJa8eJ9wt?=
 =?us-ascii?Q?3IrlIbfiCxOGh69YuS5OiqBkm0nFgaVCFmB0yeH3LvRddOJwYYkAp8/+UeSR?=
 =?us-ascii?Q?LstElepJgVf6k42AFyTrporCrIRxRJ7w2JyHeromJHWwMQwJjAvtS70ELV9N?=
 =?us-ascii?Q?5Ha4DDqxY0iH1xPbvmx5i/uJBUQ5zdH324YDGE55VsezlWYI8VFA7pPfrqHD?=
 =?us-ascii?Q?fHzkxz3VtMjXr0BKmsnbhAp6zwNrQmo4bS5SSu5eVJClkwYKkAbT8xs+j7pc?=
 =?us-ascii?Q?lMPBh+j8c6GHufMQN4HKbJafbGgM/5LzkY62mAjJNTp+d4MvGk+MIyDJ2mjE?=
 =?us-ascii?Q?Ie+78HqLCgbv9FipXLZBIEHvSJYyfzj7+kiKeW6l5OUijgEgFFUiVKwjpYBn?=
 =?us-ascii?Q?MBGcZHigEXrtr+Gmw2+vSJkNI+6dp6EfnnJsrFCsabcjZwQyHgKdC09U5CcD?=
 =?us-ascii?Q?mMKi3YWQZTOcoSVOV4Yzqy5Cgvv6JrqwRGQjPJX28c2bJ9QsAUnLVtrUTH1a?=
 =?us-ascii?Q?9av4nX+3FAMsCY/Wod7+9pRY7YbqHT9MT0FHHd9dDz/C6acnjR99WgWdcqrl?=
 =?us-ascii?Q?LBKhw3HrRHYAyoD4JBFo2HmvYyC5/U+ETTHbwRE+v0zafoKwL1zjzKKrCDo3?=
 =?us-ascii?Q?9b5tcoa7wIZFDaWGfG4SovyHpMWcc4APHzV5QQFxAmMm+EV2umuhzXRACilO?=
 =?us-ascii?Q?EGKz32TOMk8+Not6iRf+zU7Gol3uGxJGAxDklELHYrz/x+yBP4bRftTyZ9vA?=
 =?us-ascii?Q?5UwMqDHnH1hYNvJl7tPCl7CV62QXYvPA5rEJHXLxsj2BkPSrr1sYVjAT+CDB?=
 =?us-ascii?Q?Gr9sdIcDklOs/JuA23YEGVyZ7HvbkiD1vU/Edm4U9L1NrNoIi8VHQwey14xA?=
 =?us-ascii?Q?geX+39M9vEfILU9WBz5ee/1Ac2lTYpig5aWGZZd2mZy24vRmHyJzqJDxQidl?=
 =?us-ascii?Q?db98YP8W7aM4WYiu1PUYKnIPTkhlXQsDvMrB7+pbGM02ks9n9MT23n042FNU?=
 =?us-ascii?Q?atMJBxwRWoNW6pb5hB5eNYJSMa5yqF6tBbDOI3WoT48p+DZ0WT9qO2iBiFaa?=
 =?us-ascii?Q?2Tl1QHho82dFLjKyJbHom3t0b1cGmja8/3eJVZvWJCergQkSmLjRSQg2sq+Q?=
 =?us-ascii?Q?n37VCOcBkuTZ53k/8Z8Op+Vkx+DA9r1evGyPMDicO08piBOWKz8AtCUNmBfy?=
 =?us-ascii?Q?F1wQ57Md1b1MH6sOy42o5URht8jZOVeb8jPr2FjqbMqf9iPGQ3CddeEpscDF?=
 =?us-ascii?Q?vmWSWZNt93PSX+mfhMATJNKnr+H+i5TNM5W3ZqXuxDpYhiDtgsyHASHHv5Gn?=
 =?us-ascii?Q?DSdpy0N0SuyrloabmXFPLTo2otzcXRdrkF14y076haC4AkozEmJB91tViSJd?=
 =?us-ascii?Q?zDeG52belFA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hb16sh5tG7yG594OCm5IygtOMgYlrjBKJXbI6kX5dy4UJMMTT3LfG8NDLSBB?=
 =?us-ascii?Q?3yPIYICVUU38MEI+cLNQfEhKIGMMJPb8N+g4ch5BzitAE9V+7e05TQ7BTCaq?=
 =?us-ascii?Q?mnQt3J3QwG8/PqG8SKazJ8t7fAOmJx8G+N/RXZSDrsuAELtjxwSlFJKBfcle?=
 =?us-ascii?Q?reWEHHezo/sy8Yu+Kv5bqwNuTE3znjmgpT2btyMsD3lFIOexV8IY1Gg25GDb?=
 =?us-ascii?Q?6SEsAtmIOZ/x9LXiigHTy4NqFGL7h8rH5DPENWfsqNdfcvtD1485aGlbaB03?=
 =?us-ascii?Q?ffixw+oqdQ6Urj94E4YWZYfFEFoV9cmwxSvutKJQR5iQMyMX6USjJTx0Xkx1?=
 =?us-ascii?Q?7WKKOyf8NAWFKEj0Q06WAr40UMC+LFlnZgWtxb5JWsH15prDBlrdkwjcAb4n?=
 =?us-ascii?Q?BoUA2y+/TOdtaxe7YruT/lYHk7SC7NEBhd8kcgrQ2zWe2Z2fJxmtjvlv2QdW?=
 =?us-ascii?Q?ciBOjtU9AQ8AFSr53YBl41wEzN/8P6ChEHWTaLSRAYny7kVndkQAG19Q228X?=
 =?us-ascii?Q?ERAYlROa9EOfWnmLo3UI26nSRI+T2nrFr2J5TKLCJ7eCzUDVVWueAAe7ycHm?=
 =?us-ascii?Q?xogqeR2jQQffxTqUIeZMHQ0dfhG4hbjiIfRTLUcwgp7NrXgFbwoj13bafWAy?=
 =?us-ascii?Q?OzCRAEzRHmfni8IHIoaWhcHo91mx4lqsM9QQMzgyE2+bfn5pEN21Arzi7HRQ?=
 =?us-ascii?Q?x6Hpp5iZgtUbUtSbDsn24TfDJjw14RAXTPX3BvPaU1hMqyYjuptcSPFmKlfd?=
 =?us-ascii?Q?KOgECS8GmRYzQsJjrG53Nb8J3J6LVb50deDgJ4sRdFrT4Cypi4W/uqIpms9Y?=
 =?us-ascii?Q?+xbWtpRKjrOB4lLKYkKw1ZRcsrE95Nl/aDtACtE5qlqYM52EEqUkOHra8Dem?=
 =?us-ascii?Q?wof9ZeR0Vf9vOzqeAdyI2gEm3r4YeY1+UgtQAacguvgN1T5u7OcN6lpc9fqw?=
 =?us-ascii?Q?cu/2WjHPVOhffFs/WabLG6ExemZ6xGywevHk7Bcu4rnEgoV7jT4iKpJmaomB?=
 =?us-ascii?Q?+xKvTwUSltU1oOyk4UvnmWIvlddnKW3GALX3S1lmrBDE9sXNwNXDIY5pWFDw?=
 =?us-ascii?Q?iYM9zd24ngdHj0k5KgKGq6CX7UMM3RAIFg+5KurEbpf5Kl41uMxtCmYjV4E8?=
 =?us-ascii?Q?np91rLX7m9329+r4mu2Q3FjecwkjHSQtrKsMBO8o0AJ19nnaJXoOXFmUwIjq?=
 =?us-ascii?Q?iXzQnOBSmyzPbSq++PPTMY0zWRjMw8Bw2fScMScp1Sbs0wjIH33cgH5/zHXW?=
 =?us-ascii?Q?AKIxLShkrGK3iiWMcCaU2ZrEpuWUomxbRraLG61NSPICtGoaJMrYhnvxduid?=
 =?us-ascii?Q?onujNiQr/rCI1O3WcY/Otg+jM0jp+q5SSnBAg+zKmKnAfnS6feBYA1AxO73+?=
 =?us-ascii?Q?M40kCwXqYwKdewUKo65y2oDZgqCk7hcEdcLsfQsA8oewMzc+a/qryd5FkCeF?=
 =?us-ascii?Q?7eRKvH9zsC2wlcbNk0+jK0V7uHgPqgK+c9qUtSVen18Ufqrb33iJ0Vxd/T4F?=
 =?us-ascii?Q?fySo9yCCky415CajPhb4EO+8R0GO/mocHZCuECjoLzcL4+QYSrKoJaSDW0pe?=
 =?us-ascii?Q?wwi/JZONSW6ZXNafN29ikZ+lXh+W80Xa/LRuOi2Lb2kgG9Ttd34cBzuXLlvm?=
 =?us-ascii?Q?T3oGaSlI6K2GdNN1HjOhb08=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce083682-d9a0-4d77-b43d-08dcc186e997
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:13:56.9676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oB44KLqjXWuCQdyXo4BUPZ5ptaPJGl2TdD6eJfWHYnop0b+REPqQ4AxJpq8UgcZlCBDyH69hZCqVEzF2j2GFHOVPYpoodf9qpLoBkqUcovLcoP3GTbWU1cCNbIGzUuRk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11873
Message-ID-Hash: 7WTGV5TLXOPG6FTK36OUGYU2NNTDKEDU
X-Message-ID-Hash: 7WTGV5TLXOPG6FTK36OUGYU2NNTDKEDU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WTGV5TLXOPG6FTK36OUGYU2NNTDKEDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have been wondering why DPCM needs special flag (= dpcm_playback/capture)
to use it. Below is the history why it was added to ASoC.

(A) In beginning, there was no dpcm_xxx flag on ASoC.
    It checks channels_min for DPCM, same as current non-DPCM.
    Let's name it as "validation check" here.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		if (cpu_dai->driver->playback.channels_min)
			playback = 1;
		if (cpu_dai->driver->capture.channels_min)
			capture = 1;

(B) commit 1e9de42f4324 ("ASoC: dpcm: Explicitly set BE DAI link supported
    stream directions") force to use dpcm_xxx flag on DPCM. According to
    this commit log, this is because "Some BE dummy DAI doesn't set
    channels_min for playback/capture". But we don't know which DAI is it,
    and not know why it can't/don't have channels_min. Let's name it as
    "no_chan_DAI" here. According to the code and git-log, it is used as
    DCPM-BE and is CPU DAI. I think the correct solution was set
    channels_min on "no_chan_DAI" side, not update ASoC framework side. But
    everything is under smoke today.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		playback = rtd->dai_link->dpcm_playback;
		capture  = rtd->dai_link->dpcm_capture;

(C) commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow playback/capture
    if supported") checks channels_min (= validation check) again. Because
    DPCM availability was handled by dpcm_xxx flag at that time, but some
    Sound Card set it even though it wasn't available. Clearly there's
    a contradiction here. I think correct solution was update Sound Card
    side instead of ASoC framework. Sound Card side will be updated to
    handle this issue later (commit 25612477d20b ("ASoC: soc-dai: set
    dai_link dpcm_ flags with a helper"))

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		...
		playback = rtd->dai_link->dpcm_playback &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);
		capture = rtd->dai_link->dpcm_capture &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);

This (C) patch should have broken "no_chan_DAI" which doesn't have
channels_min, but there was no such report during this 4 years.
Possibilities case are as follows
	- No one is using "no_chan_DAI"
	- "no_chan_DAI" is no longer exist : was removed ?
	- "no_chan_DAI" is no longer exist : has channels_min ?

Because of these history, this dpcm_xxx is unneeded flag today. But because
we have been used it for 10 years since (B), it may have been used
differently. For example some DAI available both playback/capture, but it
set dpcm_playback flag only, in this case dpcm_xxx flag is used as
availability limitation. We can use playback_only flag instead in this
case, but it is very difficult to find such DAI today.

Let's add grace time to remove dpcm_playback/capture flag.

This patch don't use dpcm_xxx flag anymore, and indicates warning to use
xxx_only flag if both playback/capture were available but using only
one of dpcm_xxx flag, and not using xxx_only flag.

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 65 ++++++++++++++++++++++++++-------------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e844f6afc5b5..81ef380b2e06 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,6 +815,7 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
+	/* REMOVE ME */
 	/* DPCM capture and Playback support */
 	unsigned int dpcm_capture:1;
 	unsigned int dpcm_playback:1;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index f79abcf36105..f4a012e633b3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2745,6 +2745,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2755,43 +2756,51 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
 
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
 
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
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
+				has_playback = 1;
+
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
+				has_capture = 1;
 		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
-					break;
-				}
+		/*
+		 * REMOVE ME
+		 *
+		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
+		 * as availability limitation
+		 */
+		if (has_playback && has_capture) {
+			if ( dai_link->dpcm_playback &&
+			    !dai_link->dpcm_capture  &&
+			    !dai_link->playback_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using playback_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_capture = 0;
 			}
 
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
+			if (!dai_link->dpcm_playback &&
+			     dai_link->dpcm_capture  &&
+			    !dai_link->capture_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using capture_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_playback = 0;
 			}
 		}
 	} else {
-		struct snd_soc_dai_link_ch_map *ch_maps;
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-- 
2.43.0

