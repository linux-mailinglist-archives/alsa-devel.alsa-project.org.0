Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFFC8AC382
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 06:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA041B60;
	Mon, 22 Apr 2024 06:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA041B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713761378;
	bh=wolXeDVRKYpkDOLT5JJN/GFgfq9G9Z+tfNGxxxh9d5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFJell+62yr8XDja+n21YoMYfTTbzRNQgQYZcImyyHV3cI51aRCaj9JUCJea2zaOo
	 2AnFPeFQWBAx9GfPxrn7JEAgrfGDANPO1Ah+EGoPuyWkxZLmniPqK4a8hs8fjcJPxP
	 aWd0UZ45FBj9vWjoKEjcD2ZL2KG5Vd96AwkvMz1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F3C2F805AB; Mon, 22 Apr 2024 06:49:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFCB8F805A0;
	Mon, 22 Apr 2024 06:49:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E5CF802E8; Mon, 22 Apr 2024 06:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06929F800B5
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 06:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06929F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g73cpo7V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oa04uAVvQCNGN0VHu15NWEXajwpB05SlYji+r90CpNhTquYIsHjakDDMp9xBcHIY6UYBacO5tO8xPnSZ29pA+B7wQXhppl2noM79M3/QdpAvXGWFDUK2tLjyeJqk4GQEDBnZ16N7zztbLT5+LVi5ayIMva/rivkGhqmPYd2zFJTN0CtASy0gFRbuj8RF39EuMo1axaUdE5BarhW20LP8f8LbwvCVYcXuW427XGS9eUjRqEw+nA6+XfeuHoGRKnEy47/+j9koY/MH+Hy7AEZppCW6Jz7mXYYi6ZIG3Yl0G1AILQhxFeYdPYEJIpIPBowi1LmDoVumBQztERum4Vc7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHdQ6ZKD/xCzkHUorqBI286uHZmkMWBUhmBQeo+OGZw=;
 b=fw//3Qsmk77NLJ7/+SETYBTa7UGjaqZkJqfVfO2FgVifMcykWvUCJgIf8xzAKu/TsDzVSbIaSsHgrPJ9qXSnvB/WNZH+e7U0PkiMonc+/SF+DChOY/sB9mk4QB099yY5KtajsFcwdeEiQA+QGvbI2Fw/j2C6BcxQkysA4G/FYF53DBcQ2Hh/geqZY9JcvsGUfMDEqPtstvV2PhMFnEL/b9aCDDT2vX/zEbld+XASl80TmKOOXbHqZgEeuNppPJF7AEAg0zff8rnYc3JSkbzv5WQpE4ei3hdAPpkGjlPIcl5gOeN1k4+YaLXf1fnz+Lj+k8qXe9miKrX0X8Pi9Rf/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHdQ6ZKD/xCzkHUorqBI286uHZmkMWBUhmBQeo+OGZw=;
 b=g73cpo7VV45l1Qkn6umxOsdwRp18kftwdVc5/AHye5JaX0iG8WkFDQvnm2o/en2Ix0y2617bJGDKf5UqIvFC0W0RmnNvZmR569kGZYU3UVhyqZVOIbVXzc5JJeAB5qjHpMyzOj6unnsye1r81t+tmLEplRGzhA1ZGG5FYlqTj/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11218.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 04:46:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 04:46:25 +0000
Message-ID: <87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
In-Reply-To: <92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
	<87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
	<a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
	<87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
	<92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Apr 2024 04:46:24 +0000
X-ClientProxiedBy: TYCP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11218:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b0ad8e-ae7e-4cdf-eabe-08dc62872a4b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OnR8myiWi4Mw95F0ETq6/oorWj+RNDAisJgViS8JdDwtEDnowcl51aKX1pvc?=
 =?us-ascii?Q?ocHaDswG+YLXgXkoJAXXJW8qa4qGvwYXourF8y3xMOkhyOSJt0vKSvm35Gy3?=
 =?us-ascii?Q?snyL17SxNX+HpjXHBzQP3jhWdREskKVuvBy0OKXcnL3lIMRnoSs4fdh0ZGfv?=
 =?us-ascii?Q?dFYIjzkYuFYt8kVd0srprPaCTT177Zfuqy5TVuJECGzx/oVAxLtihe4k0NDG?=
 =?us-ascii?Q?uJn0o0lICFxpy0rV8ztchk4DTkQzRx9PY7p9qO8d+15o7Is/ch6Nh4hMufm6?=
 =?us-ascii?Q?vGNna1PvzhcOWJqCUP67snclKPFJ5Bi5dDN/lID77wtyrvyPJGK6ZMlp7SNY?=
 =?us-ascii?Q?ZuOXr1NOFk7oPZhvQ2y65JhHMG4/IRqL1KxyKErDNnPDT0x3mE4gWgt/31tp?=
 =?us-ascii?Q?B6Ix9Y8IbJtkFLDWGzK5ZQUiMixttkWZMkegk+ICQ0wqqI7cmcMBVJAJZt75?=
 =?us-ascii?Q?C5fCdR3p0yOOPyushOfg3mWhIB/Y0fYwl9HrUZaxukF8zryiVfpzFENfQEH3?=
 =?us-ascii?Q?T9sTwq5rilKkMb7K+NFdc96VZ8u1AmD56WpoPTSoQU91N7Ru5qpk7/UKiYKp?=
 =?us-ascii?Q?V/MqbclLc7Iz7W7OKGtWb3lmasrLswujw+JAj7OzZF+nnsh86PGdsL5YWBeO?=
 =?us-ascii?Q?82FxcVYxxHw5AANHTdcjuWYZNUH9wf2LpJc+9n1wLpMDFEEfbY9NNiN1sp+E?=
 =?us-ascii?Q?ggiqv0LRwnDIY1JiiiRzow1ci7h5Zf59A0mrTIPkqVdegGodMtqcRf9lB2cD?=
 =?us-ascii?Q?w5liQw40K1nti5k63MYScktQTb9REFs6otauCb0c/c9YLM5Tcrc9rZ06Ia2s?=
 =?us-ascii?Q?mAu3LOEIucOBM/wzS3/H+IL653XpP/8RBcUmNGN6uQ9I8BXDqnal0eY/3N6E?=
 =?us-ascii?Q?iPQljorWU2tgIXr+zkQ8h/O5itNAFyjrJw+rdGFtMxpBWe5w0rJz3bhI4+yv?=
 =?us-ascii?Q?K5muM3hpFb9+RL6fCAVSmBccw14q5G9r0h528lE6nnkXO9BjmAB3rIYkKvwY?=
 =?us-ascii?Q?Rg9LL6pVyNAV4WaXcHUCRcMJqm9q6uY5c+sBstj9w+T63E595yPJsDp/j1ns?=
 =?us-ascii?Q?aODP7GEZZ6EVxxU0xD7k1CCQRfTVTwcYFIjRdj2KfeOGugKW0s/N+1uJXVPW?=
 =?us-ascii?Q?7MvWYDvogD1+cliW7SpX5v+mLNkTI6q2j/tV/+8jhKMhUuGkv0Qr4Q9EqP2l?=
 =?us-ascii?Q?Qkf+K098wLcLUm3NhLlrtcPgfIo+g15lcS+pnlCEuSTplV38LN18CME67UjP?=
 =?us-ascii?Q?cIom5NKctZSn3MgxV/5MyTahwpDGIEplCbdps8R6tBCxlHzc15i9Z/2m+fy2?=
 =?us-ascii?Q?0LSFLyaNVJrK5B3uYNW7vqBq40xoyv0tbqa9YLDomAi3Dg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(7416005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OPobY2+fWJJyNlSN3ynzDcFTEmanXhbzKRpv0nX8MpOtodRnVyW0TMd23sPz?=
 =?us-ascii?Q?ABGmW5+kMICtS5I/iATj+Gj7qxhRu0xCsZxzS+l12aEuHrgi5fAMcHWNa41o?=
 =?us-ascii?Q?4gZatIi7S9nSFIGotR27jZg23e0nKE9bHvawTe6dwBH1nXwJeK51jhwMNCH/?=
 =?us-ascii?Q?qjC9ZaVA9w/jxc0iOWTI3BQQjpAaswpXZEG9fyMfdELeKNFt0mUweS3j9e97?=
 =?us-ascii?Q?FE7QXa/ZpMPImAbgVDXTdEGtaPOH0UZU7eZpImqt3MFniOFaF2D8hutqr7b+?=
 =?us-ascii?Q?3dZLsexjwQPpSKQ4Tb0n6KbwuOkhoap+ckOxgjdfpxGmF9PFEPfDff1scm6r?=
 =?us-ascii?Q?P8e9+spgVc9lCrIlTVujMsi/P+7F9ItE1D7/g+Z40NigeIXLzPlgnUqQGqFx?=
 =?us-ascii?Q?Ok/YpPbTOGASgyc7fS70vYd1nAERLvJEc+EteTrgNcpMoTzBReDNJ5v5Vr9L?=
 =?us-ascii?Q?KwPMR1galEIrGVxzwNC8HB3CHZsseot+WghSJUHnB59SIs80t/LgAhdBcFsm?=
 =?us-ascii?Q?vUCAR3COEREPcfK/Ty4MIRqGEvnI9ZtRCwO4PlftlC7TrKCqaRhFqxfVFWOS?=
 =?us-ascii?Q?HHDoEJFH3Yx73SFoDymCB8YSdvi5UNNMzAY9YCfUVI/yKNRYg0Kd7RdaNKKn?=
 =?us-ascii?Q?KmXtW7rWxXjmgCv2Sdo//8HSvqWy+Zuv+YBzmvf7bA07oVJo9Nnpx2KUtU69?=
 =?us-ascii?Q?K0cAKDugJyZTeWouL9Y0kywc7eFKqh4Xh4XtBclg2IXuWL6sKUaODCQuWKGx?=
 =?us-ascii?Q?nBQjPcsgVQBXB361YSPbIy7VGTCxZspDVv2y/SYSXROqk0ij23JNS2wkdU3Q?=
 =?us-ascii?Q?wUDDUauX/zWInDpGHAUbS+Br4LiWIOyDl06lV1sG/PcdyP0xVEFGDv3ZpRou?=
 =?us-ascii?Q?Lg0UwuH2vslA+OcsVHbkntaEP8DtNv2k3aDH/7B3AWvcBddgc69KS+ssHlTG?=
 =?us-ascii?Q?88CWlXEmAMzH6m+sraVTd6FVVc//CYy8pTCM7IiVwwjJhGRttgmlEuwfdta5?=
 =?us-ascii?Q?2a0S+3IjIyvS0Iv0pyuvQERiAhp8iviqMfFcGeaX25MM3m0uIavdeonPHX5J?=
 =?us-ascii?Q?NSy5oAaC2u11T8lVI7wc4HaAefld+0dQbOvRdoZuJl0ON8KeVcLFm6EJ5MS2?=
 =?us-ascii?Q?/ZdAgrpiQGWpKhyxQEvPdgeZ9HhJW+BVUyv5uCkccY/Vu0j2P6MylSWWaYpe?=
 =?us-ascii?Q?m/gAkEMke1G0XahJNQUmrw/lhIxqudqBRA7VTiejv48TCQcV2DHGghrXMbr4?=
 =?us-ascii?Q?QUQvfeKwQvgW9N9zKQvjgMT7DbRiK/iCz/FOyUoje/wWjdxVugZSc4ZXx9ad?=
 =?us-ascii?Q?pW0r1JK7+59gNioWfx8cCIXkxji/Vw+dyFS9oBtU9BNYGyXQ+AykKNIaKfHy?=
 =?us-ascii?Q?6vyJRBok9pPqurmDiBgboOoccsjY+Sa7hllC7sZ2or1naOP/XwdLDF23usqG?=
 =?us-ascii?Q?mnW4cDI+0/BkXKOgLSHOIoWXa4NA6nrDzyGmxHfAxm91edTXAv89oHEU2iZ4?=
 =?us-ascii?Q?DtZ7rrWdfuFYtJCjthg8MBZi3Fx+47RjhZw6N5dCdfAGjkwvs7YaWZKisJh4?=
 =?us-ascii?Q?Jg+la31PQVauxRUimF0dhcevVX8p8maGk17DIy7AiiSqmQHQL+emeNoJPtlK?=
 =?us-ascii?Q?DS+FLSnewNcnbwIhGXSw+iY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e2b0ad8e-ae7e-4cdf-eabe-08dc62872a4b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 04:46:25.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cuT062DbiZfNuRUqEFZoG5bDCxlxl7DbWqaClAZkWsV45EZeq/YMIq2zam9oxSEuz9VYLvT89hyVrsI95oaMo7OooreaAdaEfd5whCmCYJQBFoNfAooG5lslmLtOktDQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11218
Message-ID-Hash: TZYVPGA2RMYPQXFEEDATEQNMA43WENO6
X-Message-ID-Hash: TZYVPGA2RMYPQXFEEDATEQNMA43WENO6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZYVPGA2RMYPQXFEEDATEQNMA43WENO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis
Cc Mark

> Your explanation seems to contradict the sentence above "This
> availability check should be available not only for DPCM, but for all
> connections."
>
> Can we actually do this 'availability check' for non-DPCM connections.
>
> > How about this ?
> > 
> > 	If either playback or capture assertion flag was presented,
> > 	not presented direction will be disabled by ASoC even if
> > 	it was available.
> 
> Did you mean
> 
> "
> The playback (resp. capture) direction will be disabled by ASoC if the
> playback_assertion (resp. capture) flag is false - even if this
> direction was available at the DAI level
> "
> > (0, 0) : Both are not must item. available direction is used as-is.
> >          But it will be error if nothing was available.
> 
> That new wording makes me even more confused. What does 'available'
> refer to and at which level is this?
>
> This seems also to contradict the definitions above, "available
> direction is used as-is" is not aligned with "not presented direction
> will be disabled by ASoC even if it was available".

It is complicated by the attempt to merge dpcm_xxx and xxx_only flags.
And I noticed that my one of other attemption was not indicated.

Let's cleanup what does this patch-set want to do

I still wondering why dpcm_xxx flag itself is needed.

(A) Before, it checks channels_min for DPCM, same as current non-DPCM.
This is very clear for me. Let's name this as "validation check"

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		if (cpu_dai->driver->playback.channels_min)
			playback = 1;
		if (cpu_dai->driver->capture.channels_min)
			capture = 1;

(B) commit 1e9de42f4324b91ce2e9da0939cab8fc6ae93893
("Explicitly set BE DAI link supported stream directions") force use to
dpcm_xxx flag

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		playback = rtd->dai_link->dpcm_playback;
		capture = rtd->dai_link->dpcm_capture;

(C) 9b5db059366ae2087e07892b5fc108f81f4ec189
("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
checks channels_min (= validation check) again

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
		...
		playback = rtd->dai_link->dpcm_playback &&
			snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
		capture = rtd->dai_link->dpcm_capture &&
			snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);

(D) b73287f0b0745961b14e5ebcce92cc8ed24d4d52
("ASoC: soc-pcm: dpcm: fix playback/capture checks") expanded it to
multi connection.

So, I would say nothing has changed, but become more complicated.
Or if (B) added dpcm_xxx as "option flag", it was understandable for me.
like this

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		playback = (cpu_dai->driver->playback.channels_min > 0) ||
			   rtd->dai_link->dpcm_playback;
		capture  = (cpu_dai->driver->capture.channels_min  > 0) ||
			   rtd->dai_link->dpcm_capture;

So my opinion is this dpcm_xxx is unnecessary flag that only complicate
matters. I guess almost all Card don't need this flag, this means
"validation check" only is veryenough, same as current non-DPCM.

But because of these history, dpcm_xxx flag have been used as
"passage permit" or "gate way". It doesn't try to "validation check" if
dpcm_xxx flag was not set. This is the reason why I try to merge
dpcm_xxx and xxx_only flag. These are doing the same things with
dirrerent flags, IMO.

OTOH, some Card want to detect error if expected direction
(playback/capture) was not valid. I guess this is your commitment (?).

So, let's keep xxx_only flag as-is, and use dpcm_xxx as "available_check".
I'm not sure what is the good naming, but for example
"playback_available_check" flag means "owner is expecting playback is
valid/available, and want to receive error if not".

I'm not sure how many owner want this flag, thus I think "option flag"
is very enough (= not mandatory, as I mentioned in the patch-set).

If we makes these checks generalize,
For DPCM, (for example new DPCM) it can remove/ignore "available_check"
flag if it don't need, same as current non-DPCM.
And for non-DPCM, it can use "available_check" if needed,
same as current DPCM.

What do you think ? what is your opinion ?

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
