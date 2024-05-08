Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A908BF328
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 02:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754CF11C;
	Wed,  8 May 2024 02:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754CF11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715126846;
	bh=0pA0hIfpNj2OLxiuzEe/yGattvXRsVwppyRarA6zJ7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZjKN2GwygzYCTz92OCb+Ak0IETLNWi8oD8o68r/5trTIs3+J5gFo/w9TGKW+eJoyb
	 IKklHBo+G4J0CCnnlQW8GnZYMnREjpI+ge8IJjgWtGPzAUKSUWZNHaME3Ygs7oC684
	 aIvPb67YO3Vz2F8g0LHNVWkxftCnTNY+QkFmqrv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07E26F8058C; Wed,  8 May 2024 02:06:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2E1FF805A0;
	Wed,  8 May 2024 02:06:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80B80F80423; Wed,  8 May 2024 02:06:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BA9CF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 02:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA9CF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OO2SwnNY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAF6GI3MO9PTMfjrF/w1ek/2+puUarKYQEaIwFKCCOqa9OTxFPU/ZK4A2P7V+nE40f2HodOLeep+XSs46N22GQ/hry9Xtv3uq3iL1oDplGvYhX0NCOt/ZHZa9sbXv+86HRJ59a4+LfxtCRSNfQSGbOi5+Y4CIP6PSO/pgtIbI4cgoIpuF9V3ZE/9gnrRjBaxn84zJFCpWY2n9BAQTfy2xSvHze2yefGq+TqldSSHv2p/5FtHaMkFnwyqCkO1hHlR0GWaJkoj57nqe85JPEBEn9nD0wG9UlGZj0aWVfs6eovjfnvY9ayh6+ANJ10MCXj+cWyAD+v7Kvr2g9AP/O563Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq+b7IGlgaq0uM44Sl82gWTr0/T7TshnQ5huvYAJpMk=;
 b=fRrMgUt2iiTKgY1upaFMfhxTw3S+PWI8kzBHYnhOLWXLf71iFgtIK/N+vMrssiGNazw/1KJ3GhyElKRoagKwANQV1PINGqxQAUfgrrXgScRlBlUmVM82B36FzqXVYxdvjoMSq6GMDhZLJ9WZ4FG8OSY7DU+srJresZTZ1dm5Z720j7EO+7YAeKo9hCeCB+thN8BfOkcMP0WoY3FJoc/OgVLRH6qGDzygTrXUPDypDCzETvChiHR4bIdD/Xu9VsFmFfZtwbwk4ScvU+CJKYcHcWxI0Xa+vv9pXU0Te1yS3kyB3+hJ+vCefrc9XLShGK7lEEKZnbKjAeQ2KiFNRM7JxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sq+b7IGlgaq0uM44Sl82gWTr0/T7TshnQ5huvYAJpMk=;
 b=OO2SwnNY/YKk3CtkwWm6ZRlyiNG+1dNwkiJ22NkCe1O5aIFGaYDs/nel7JK/ND2k3+fUjqkyKCtC+rzwFKRWdz6cw24GcL8Nrhj7goLoAV0nb8mWkMFiMMe1xeAcrSm1S7BcddTk9bvXMSH00pRcduBt2P4qWzUTcArtUCxYwGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10222.jpnprd01.prod.outlook.com
 (2603:1096:400:1d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 00:06:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 00:06:22 +0000
Message-ID: <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
	Jiawei Wang <me@jwang.link>,	Jonathan  Corbet <corbet@lwn.net>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Kevin Hilman
 <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,	Matthias
 Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
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
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
In-Reply-To: <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
	<1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 May 2024 00:06:22 +0000
X-ClientProxiedBy: TYCPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10222:EE_
X-MS-Office365-Filtering-Correlation-Id: 054190b8-f7f3-4e0d-9f42-08dc6ef2b1e1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|376005|7416005|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3mihJCaOL0KqC6e8igc/VH7UwVNayXjvoyMnxOKQwBYV6vwYWZby0qRXOhqL?=
 =?us-ascii?Q?hUHf7e3+ljjv9DQ5w8tCtsIkk0ZpYsMCSoTmuZ7bmPgzPYHdEFSCRTnFVykR?=
 =?us-ascii?Q?RZqkha3IU5MgfPAPq+brx2b/uN0CwhOnKpNdJsajtubHTtPsIzNAw1suxiZc?=
 =?us-ascii?Q?Kt1BBS3LZLOh+/O3YNc+BDq8HZuspH4eK3HDQTZ6nDwNt4zVybDBHyktlE7n?=
 =?us-ascii?Q?SwpfSGRApxFYMzq2k/jf+xTy0JpL3TU0kfE4MGvjaEBt7V6rbUYhF6R2hK6e?=
 =?us-ascii?Q?PYOn1O7CJPBYoeN/UtUYmrCHcg8tMT9g5y/BxSAtcwSJA9CdC66ZZy++7eeD?=
 =?us-ascii?Q?4bRLpFe4VSNUtZGIt22D/RI75fgWLkXE/fKDlAR4+jYGMB+yl1ZqjXtel2/w?=
 =?us-ascii?Q?qSwZ5BbxUfJZFmh8RL7FGvnFe7n9fT6+8rm0IToyK4dG6vnlhNbuxRZNzVzw?=
 =?us-ascii?Q?DotH1LEfMoEU/XJHqUo8iVpeS/+GkeSDCTcTei9P6oc3t91b3QxemvoiH4pI?=
 =?us-ascii?Q?plbBHDOO4lb/qiJ5DPKrmKdIa1DYMPfPgFpcuMW/O+DYfkgH/s5RbG1AFSWB?=
 =?us-ascii?Q?5h7hbKkmzwwv6XmDIZyMgtN55NigvPVINStH6o9EJpLQtgkg9GtOHIvkOgg8?=
 =?us-ascii?Q?rAC2ud6I/zXqB06S+l6UUNwL3cfKWfmzbPQyd/CqJIh15K4s5XVeuIJzZU4b?=
 =?us-ascii?Q?TrHAGS4s9LGt5wZOxCEDJDRFcvmnMa5ZifBFUuzn6AnWqKY5rKQu8Fd4rGJp?=
 =?us-ascii?Q?7w3iwmAzSlST2uWhGSKS9tIESTvloPqrSNi12Hi/ojFjIIAUImSPKNcQ70pd?=
 =?us-ascii?Q?lsmR6kgAKoOM+CRCetPSlWIqyhCazevRW52GRipmq4bBBxb6pGsAXZnxIREV?=
 =?us-ascii?Q?ALoecK4ZTbsM7j4ti0f51kLpO6aT0WNx6q7B1CcUzVi9CpV4bLMkmYDFw5am?=
 =?us-ascii?Q?qYuDu3FYai5qJ2FHHMsE5zWI2RC0JWz9y2Yk8XQB2r7mbe+mpGGhaE9LCDRe?=
 =?us-ascii?Q?q/jp90hiHQijGLKGxx1D1j4kDHcDQE/Bna0TLh7kN+0ozOe91h1r8epRp7Bb?=
 =?us-ascii?Q?iOuxCK0neEbnXnTretjqzpWdR/ov4V4lB8ViI6rN12Y9VFpkYVc/UrQ2iG0W?=
 =?us-ascii?Q?fCH++DQ3m0xRGQi1hrX2zi2j2P11YiVBbHsKAjNyeumJJ4x2ke6/4k5CORCR?=
 =?us-ascii?Q?rY99GOkU4MawYiD0y9emrkkowOxDfyJoUyuFT3L4ZKj9TRRbsiRN/6hZw7rI?=
 =?us-ascii?Q?vYBXLGsnrkNCGUWaOkT3IgSlMsu2nWYzQsistNCvAI6xL/5Q9RYgFivIsj5+?=
 =?us-ascii?Q?xOJZxmkrrgUfBwFNVkg1HGqQAZ9dz6qvTgPXra3j+YzVKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m7YXcjUJnpvLn0YNPXzMAnnOyzzU6HiJE0AkFjK8yD3wON4YZlMNX0ZxsbG/?=
 =?us-ascii?Q?+6T5yQNDoF8/98Wvdg/c4zCwaxnq6kEL2Nvvwd3TIbRRvso+OINyGk7YLiyF?=
 =?us-ascii?Q?BN2QkFV/YWskqP8Aa/KyQSt/vSBglEkWzMJZUzIusXTxTWmp/+7ec+KFwHX7?=
 =?us-ascii?Q?uVIovUNWET7ymE/sPkt7WSKbpzB0uzto4nUOCRbOnfHDIS4kMN/bwiTkWmb9?=
 =?us-ascii?Q?d+wTVCjrFdBJHpsZQFowiod59xru5wSvzxW3vl8ULF/SGHpu/GK0o9XyzA2j?=
 =?us-ascii?Q?VKQ9iS6kSqPG3cp5JJEW7GU/rI/o0jgqBG01+LqR7BtzJiOUO4wqaZA/VpjG?=
 =?us-ascii?Q?KlTM/W666Q6FoX8PeBjvlOr6OuCzG9DcPxIYkmdBbXwaXxNMDgES7M5VLzwT?=
 =?us-ascii?Q?ZeqCPHyNoDNsD4WIOu+S/PMDJLDKq4gZ4O6tlMs0zIBlXSEcRyAyLc0btD9W?=
 =?us-ascii?Q?wfAdfsTfG+3BiW5RxnhhvBiii7ZqvLBQf4N1XhOaaJG/WgyqSOnyVmfZrwEO?=
 =?us-ascii?Q?t50QiPrDVv/qjFkpPfeohW7HvEHTMgbty/w5ZAfczEOA1oVxJxuxNffrglVW?=
 =?us-ascii?Q?RIV4tMRhxETDh+3kS9u2t3BvmVDE3S78QYm97yYLY7r5vzHAYB3nlnii9dR/?=
 =?us-ascii?Q?qd3VCWfxHO1vi5FLDgM+bTJBlLdrugWybV61cE7mpdOFuoRP2dXt22Zk070x?=
 =?us-ascii?Q?BMCBKjbMFqBQFBcm17g69aR6wdkmRgUzXqjUF129Tx48kqmXI3F+SDDf5UIV?=
 =?us-ascii?Q?beSTxpkx4gLR7pC5nIxLdH/MzWBaqx81TzYmSkCxYcn1pxBzF0S4AIzlGY8b?=
 =?us-ascii?Q?5V5XzUhkjWLTwr1kFz32Z67ukSfXzTOCZotLFteUr8tJaO7fs+zAbU1dBLcy?=
 =?us-ascii?Q?lu8qhTUAGuJgJRwpjRQIK61V5VzOkVejcT3NCvjJy8lz++YJFulL5ykN2zc3?=
 =?us-ascii?Q?zAZTO7DIN5TtX+0Byxsh67zX0lSMST6NN88PWR35FDCYDbECdqS11LU6QPCx?=
 =?us-ascii?Q?Ae0OgqmSbDBIwoZfsY9rVt9ceLc9fQvJmDjmu7p3PevihNQ8acyE5XBVquvq?=
 =?us-ascii?Q?xKK18OTYNh2xLe56+lkIFeIvDF8eeJCdjCTZ1S8yi7N96tlfKBpha2L5XuWY?=
 =?us-ascii?Q?SBqOeZo85kDfIk/rhL2k23JsFc7mGm8dhMxkqNKWEgrJgnHSt5W2VrGUsEvm?=
 =?us-ascii?Q?+N8AnT/MMl0e93RN68YScz9bfWP7l9YAfu4K4YeA5VLJixbfgwjs6zLaKVSk?=
 =?us-ascii?Q?1DSEvE24XGZJX95oA0aF6gJ5IpQlq7dBRARcQ7KISwtB/CzGcDCTeEitMFeg?=
 =?us-ascii?Q?lS6PE4a6TIXReeYkOsxp0jYqkv7Rghniyp+JfqDrp4KXAD71/XqNySF51PJI?=
 =?us-ascii?Q?TPfACZR3UBh8YEJY1jut3QysbGdZ1Y6Lk8xTP3wrBeKg3KBILAs4xob5Qznw?=
 =?us-ascii?Q?ZjOaXTmQcz23v7U3T8NrnjHwTkzYIGp8io3BLpEIUMPsl74hVI+r+9bQI2WN?=
 =?us-ascii?Q?jrxQxaiJEc4a2u8OkwVhF/u62uIFQXIfuE8ZRdmpcgGnq30ahpOXnZFwoSis?=
 =?us-ascii?Q?aOFyBrwysJ2dtaUldmjoniCaSemhjwMiwo+ZBiyMJ3Oa9qLwu4j3qnTmGceV?=
 =?us-ascii?Q?Fr8cXaCYV9YoQcl90phDVZc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 054190b8-f7f3-4e0d-9f42-08dc6ef2b1e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 00:06:22.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kdjhd0a4DHCjQnbE2CCH0hKLupUctMwVIqC3PIe2JEvXqmakQhgtOFNWUbrJIbRGneYygC+IvDQQ9WPR7k2EqLu0k3sS+PTsVXPwqwjIC3salweEtVABwaop/n1cbVWU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10222
Message-ID-Hash: ZLYCLSAOUHXHWTKRQPMGOQCFKLHVMN5T
X-Message-ID-Hash: ZLYCLSAOUHXHWTKRQPMGOQCFKLHVMN5T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLYCLSAOUHXHWTKRQPMGOQCFKLHVMN5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome

Thank you for testing

> I have tested this series on an Amlogic device (vim3l)
> This brings warnings for cases which are perfectly fine.
> 
> For example, one of the DPCM backends is the TDM interface. This
> interface is capable of both playback and capture. It can be associated
> with any i2s/TDM codec.
> 
> The codec may do playback and capture too, but it
> may also do a single direction. Then usual example is the hdmi codec
> which does playback only.
> 
> In this case I get:
>  axg-sound-card sound: CPU capture is available but Codec capture is not (be.dai-link-6) Please update Codec driver
> 
> I don't think this is right.

Hmm..., I'm confusing
Does it mean you want to use "playback only" on it ?
If so, did you get below warning too ?
	 "both playback/capture are available, but not using playback_only flag (%s)\n",

If not, can you please fill below ?

Card
	dpcm_playback = (0 or 1)
	dpcm_capture  = (0 or 1)
	playback_only = (0 or 1)
	capture_only  = (0 or 1)
BE.CPU
	playback = (available, not available)
	capture  = (available, not available)
BE.Codec
	playback = (available, not available)
	capture  = (available, not available)
Expect
	playback = (available, not available)
	capture  = (available, not available)

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
