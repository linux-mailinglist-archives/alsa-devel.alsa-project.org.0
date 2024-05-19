Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EAC8C9D39
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98F33E0D;
	Mon, 20 May 2024 14:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98F33E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208118;
	bh=HkaBqKoPlMRX/KjF6QtW/3H8GT5Ld2DmN4kB0Jo97PI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OLVy9/VPu5rskvY/1brAVDYPDbLsRFcQMOjr6ReWMIR/t9wBkyLd3CfJ0mppFfISW
	 Pba0/bOS/tV7IyZ53FfDyesSEP7Dks8tA5N030OTdMxJdhfGBCyRGeptwlvAVcpTsQ
	 dIuA7ax3uy4UmlzJ+n7yGRamPS8Xm7GQymZYEwUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04529F8065D; Mon, 20 May 2024 14:26:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 641D5F8065E;
	Mon, 20 May 2024 14:26:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41F27F8020D; Mon, 20 May 2024 14:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9231AF8028B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9231AF8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KtmzNmH8
Received: from OSZPR01MB8402.jpnprd01.prod.outlook.com (2603:1096:604:16d::11)
 by TY1PR01MB10723.jpnprd01.prod.outlook.com (2603:1096:400:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 10:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvRrep/r7ARwxc0KrTRUlPZeZ3FtL9ZmmooaTxd2VDceZy1bX+ivARhA1lps32+zLN4CqrVB/rV94v/ISMG+DZzbBY35FTjvRDhv22IHVNK6ni6a4gv+g5LnnvFHrxp7lDrdfcIONXHzSkI+uFX5SiVE/pZ6bfiHcrgdccrch4pvkfmQx3xWE+OUzt2wNr42Nm3Xd/NFOm1YIDK/YyffQSWE9oMzoSHgvqmTVlov9wWFLga57+VSfb38L52UzauQV1U9m4Bcag1FkgZizHsC8gaqLe/dADlNWrWVLWZg2FTrB1qF8lV9pbEYMLJwLy8+8kRUyVB6WjKHo1n0m50RgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7AgUIykPXjg0Q73SRI/y2w7LZjgJYCPqa0werj05l0=;
 b=Z7eO1rZ30Fr/CMRUwDaeAmvRxUv3obRh0NnGsAKClXkUXPy75OXlYnoF3buNJrk3uT7uibjdYEt/CiWGhD+HeOQDDUxp1Xp+C9EnwIF3lP5b46L0GyfvtRwdZJIGFYknlCqVjip91zitlYheXZNCY/Y3Mz5wRuZt/3dJhH5v2OQNm99cTv70HnVRgjZmcJ/mH3NaDjrKeQc1BhzOX1dGjOUoOruRA1Ad40IXP1BNfT+3cSJvNlOr1eYvAxh86EI9AO+Q2GzSBNlY9bwcIIjJ7pi9+jfYEnK8aNItGWBK7/GeOYs3WUQRWxeuOVulMZQ0bfrQ9ZYIp5boNTSqSBFa5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7AgUIykPXjg0Q73SRI/y2w7LZjgJYCPqa0werj05l0=;
 b=KtmzNmH81Sz18by9xIwIbNjr86Sog7+eNs0At12UNIKTK5gmNNye7dZSIZnsCHQDpiCpBouLWY9dILTOj3AAceaCaukploMkB9pHNA+aWb1mktb9CUi0oDJpcKomrVJwqJrj+dDo4+Jbhx7k78i5ndOy7Cqll6bQLQVrX8X2Rro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8402.jpnprd01.prod.outlook.com
 (2603:1096:604:16d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Sun, 19 May
 2024 23:31:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.030; Sun, 19 May 2024
 23:31:15 +0000
Message-ID: <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
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
In-Reply-To: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 19 May 2024 23:31:14 +0000
X-ClientProxiedBy: TY2PR0101CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
	TYCPR01MB10914:EE_|OSZPR01MB8402:EE_|TY1PR01MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: 41227fe9-917a-48cc-ed88-08dc785bc6b3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230031|366007|376005|7416005|52116005|1800799015|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?/pC4efv+SHQHvV0+PQe0A1foqeZ+NxNXLCmmOKiiwDSKNEt8S415vHloJ6Y3?=
 =?us-ascii?Q?6MCgUl2yofBQWfQPxEXi1i7OaSwCxIvjrFbrCYOfXUgUiRynmzortFkpe4Kb?=
 =?us-ascii?Q?D9cPT8Q7zrZvh+G96TpTfqU+6xGzILwOvYkeXy0ifdYDHtWi+s8UHdRKjfm6?=
 =?us-ascii?Q?J7HxQ+Gxr+EW6PWgMdShnfLskd6cY03iEYsdAZg55roQcJp91WgEbNMM6e1W?=
 =?us-ascii?Q?ljfIJJBgd8mWPnZEvJtG/vZQZ0ELb9wyMkLqxE0uOsCE5kZsy4vERMOpflBc?=
 =?us-ascii?Q?xOGTwONaIxxMil+OsOXW1VgV6t5ytuOCISBDkWPIrcSzdhurtOQaQRGlVXV1?=
 =?us-ascii?Q?uIx5f8OJkx8/x76FEytMlRumTEAsTqQ8In8JL4Nh4CJoL3W7WQz2nY5NF779?=
 =?us-ascii?Q?eXlXgl0lNSTce+nHQ/IEIWYthhokyi+k0lG1F1pJZ5Skeb6PNNm7XYmQHvRI?=
 =?us-ascii?Q?2qjEw8G+1Q+zGRQE/wCB+r4+d2XJnHTEW6k9qDUnKxP3G7WIKSvXLmSmkP/T?=
 =?us-ascii?Q?0Xe4qELgc1OFYDwcyEBR3mvR7t/g8LP4A5hH2y+rDndrNsg/Ymy+QVnHI988?=
 =?us-ascii?Q?OIfUtsga7siAKRiA4CQ40J50cgCRD33yJ0cTHMFBq0TarfWSlll29BNXvmyF?=
 =?us-ascii?Q?6vEhO9TA/oRlIuCld19pLkYReUOrm/I7KzKPcXl/xm/1TtzCzxcrfjbGC4EL?=
 =?us-ascii?Q?nYUx5JtfKRo1gy2nRRZlEvCaewTTx9IjbF2dWmEvBK1og30PmYioZxPtC7h/?=
 =?us-ascii?Q?30+NtC2PX+sL9S7f5zTFoqbFTk6NBmvEmTqZZ+3HZnRjgBESSn6wXbn5Vmxw?=
 =?us-ascii?Q?ga3D4Wdiyxx/G7+fEWfnl3/zQPznUaRB8LvPy8+DDMrTC8Vvu6XWwGoevIpf?=
 =?us-ascii?Q?WwE6OzuydZoBiMrUyIvOeL1jOMqab+VhbF6Uuftl143nlGkdd4vrEBoxk+Dr?=
 =?us-ascii?Q?6cPKEay6cxoaP42Wj+QF1+YEyuvm/m25TMshdaVcEwj6Ved7gOAzaK4+4U+P?=
 =?us-ascii?Q?GA6qAcL7UXsOytXZ87rZbeCtldsQPXHTavDpktdx3bQ5Y1of8lHzdyL72rp2?=
 =?us-ascii?Q?ERpzEfeGw6NZ2X0j1Ld4glm5+kJxUm0MoA5UpViXrK86wlydDoBC/JckzmWA?=
 =?us-ascii?Q?LaHugPaDzG4CiWT5qNw3cUNM7Qd/qAa82QL8f7weE6WxvQuF/K854i5qOy6I?=
 =?us-ascii?Q?iYiL9EN7mhnPT/oCCuQrh1+P2PMDTl5F/zA8Q5FgQpNGPN7WAR2ACGdID5ZM?=
 =?us-ascii?Q?s4wYef4qik6MYxAxIhjFJzrNxYoK5HD7xcOKaa4mIYNWo3W4Mx3ov2SsiVJj?=
 =?us-ascii?Q?1y3a27RFiIElyCuLSyowS7t6Dv0nzhGLhY56TmG/uH6cJA=3D=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?uQ/BjpEmLF12i62/LpN6CyC8YV58Dx+/hEP0i/EPbifMEXbz2tVJK1eNYdOM?=
 =?us-ascii?Q?0mX9jKZ882rCJpvtFNdo/Ub16cCxmz/+xk8Kqp0PJ6p3bJ0IbGK6QbvNQc8l?=
 =?us-ascii?Q?N3Tp+ejOjyY0D12DeNFSFz2368nDMgODl3Qx+s1BUwkhz9dJujhi+27ijxQg?=
 =?us-ascii?Q?6aeF/+xCvEQeS8vJbfP0PGwUJ3nSKTGOYTQx9nGRyXz1Wx8TVtLDfoR2zPJT?=
 =?us-ascii?Q?mhO2weeiLM2VT2y0NaQ/c2xWu3m6RW/2sLmA+RXotJFdsYn2QHFTQVUMxRKM?=
 =?us-ascii?Q?IbcFinjGwGKqiawwqRyS0bke3FklKOYyxiragU8QW0eXlWeMuXMNoLLiATVX?=
 =?us-ascii?Q?WD8qIxUUm2Cr6Qv9VkudThU5i90IbAixKFo+ygkN2+AVNfV1JxEEwNIAXEgD?=
 =?us-ascii?Q?XLZKWBKKzBuq7yxpSEWTgEQIO55aDE8a2NzD2MGQha5diZNdP20JkGPENNZK?=
 =?us-ascii?Q?orzDEGvUNQlmudQdDaJg4Q47yUwhRshLXptuGeDR2cN+t+rhiDYYRO35SI1z?=
 =?us-ascii?Q?G2nIHA2bK1tO0sKQEzecT+TUSAetDhDc70Z7s4HEAcpqp5QCmntZ25K2NB5s?=
 =?us-ascii?Q?IATJ1GHG2fhU/TdKBSMoLCQjjLDkVoJMj9g7509D01m0jd9cO/LPNoJ9f1Nc?=
 =?us-ascii?Q?qD/Ad+vXW6RGmKuG8rKOn5FMtPPw3pqP3rdmlo3Rrskogd3BfnAvZIixEAGX?=
 =?us-ascii?Q?AAdx1W0K2gLNnz0r23xpj0XzQ6DH6B3I5C2SxyvI67VoHsucY3CIOAzkTCtF?=
 =?us-ascii?Q?INdsI2qdFhQwGH/kUGicxnw1HGgSyUlTQshH4BEKyzHzfVpQ5qbjdLAwB+Dw?=
 =?us-ascii?Q?M55IaLOwfFZ37pv2pEK245oAmUdyxVuATqAKXlaWE16mzXaUsRRf6uWIgGom?=
 =?us-ascii?Q?ryjHJrOLWi5mQWjpPNDJNdIsFI16MnmUsUGagF0gcy7Esw3Yn3qKgBrMeo/G?=
 =?us-ascii?Q?+z2QhKYjvsSunlZWniPLsNeS9wb0hFGiXeL42p+SiCgJN8umXW9NNz/Llzju?=
 =?us-ascii?Q?9GlgwLtSB/TR7MOzo4wYYGn4q3iDyx5oSrZkl7APWgfBrB3T34qrDpWE3IL1?=
 =?us-ascii?Q?vkITy6oDMiJ2b/frOdDc8FbEdPcoYIyCNuSz3vbNUd7n1dY0MWDkAtIfBJPH?=
 =?us-ascii?Q?Q+xi2c1t6yzRuTpJqtumKIRE+JHUD37qA6tRtDt7QyfKA5Wighr2PqmTnB3c?=
 =?us-ascii?Q?BgpXlFGuqdEJhoSGGQO/1wVPxZcWX7u8+R6EYvu4aCySq210LB3kxadNjYJc?=
 =?us-ascii?Q?Czw9mEAmqyDYzTUsNVt/ZS9P+KhoBnkEL1tukNQ3Wz5AzCAPgesTPFLGLBiY?=
 =?us-ascii?Q?6HUQaL8DmBtSOZJnisiag9rYJeZniIwp6w4FxW2cYGoRrs+u+vlHH+ocRFVG?=
 =?us-ascii?Q?p28OOL2KOhEROlVvPVA6A7hCzJEdcGJwqvC4Cu8eFkiOSCrM8ETdCihnmkb4?=
 =?us-ascii?Q?fZ9mcIAVYArTP2qumDAwWuXitSBJsmYywYWrjMtDUZYOhtBSpL/vEJ7AypNy?=
 =?us-ascii?Q?ysrNWo/bSqSVcf+rhQJ7KRgJNF5gwbvxxRRvDt5DyKSEiLZWIIZ+aCkUVs7K?=
 =?us-ascii?Q?lBreqN4kykWYqNwkm7PSEFz1/n3Z8CEKR73gzpAPlqGeqFB/GwaYxuqqMuK5?=
 =?us-ascii?Q?UUnto97+mIa1LpB/REEeTcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41227fe9-917a-48cc-ed88-08dc785bc6b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 23:31:15.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 k21CUA2r8xfJSN406WmPi8PH8MszoV0WCemwQ48GanFLfWkOiiT5tY1LFjqX6MYhBra1MX7Tz4Xm5gj9HV5ntW5FZQG1JkJbFXaT4IrF8zlod79qrBt4jfF6t1deM+GK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8402
X-OriginatorOrg: renesas.com
Message-ID-Hash: B7FYWABEW4SCP3IZKKMJISJMN4333DTI
X-Message-ID-Hash: B7FYWABEW4SCP3IZKKMJISJMN4333DTI
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current DCPM is checking CPU side availability only, but it should also
check Codec availability. But because of long DPCM operation history,
it is possible that the some Codec driver check have been bypassed.

It should be error, but let's add grace time to update driver.

This patch indicates warning in above case. Each applicable driver need
to update during this grace time.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-pcm.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c4d80cad59829..71db7379e08aa 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2795,6 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_link_ch_map *ch_maps;
 	int has_playback = 0;
 	int has_capture  = 0;
@@ -2806,15 +2807,25 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	if (dai_link->dynamic || dai_link->no_pcm) {
+		int has_playback_both = 0;
+		int has_capture_both = 0;
 
 		for_each_rtd_ch_maps(rtd, i, ch_maps) {
 			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
 				has_playback = 1;
 
 			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
 				has_capture = 1;
+
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
+				has_playback_both = 1;
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
+				has_capture_both = 1;
 		}
 
 		/*
@@ -2850,9 +2861,39 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_playback = 0;
 			}
 		}
-	} else {
-		struct snd_soc_dai *codec_dai;
 
+		/*
+		 * REMOVE ME
+		 *
+		 * Current DPCM is checking CPU side only, but both CPU and Codec should be
+		 * checked. Indicate warning if there was CPU / Codec mismatch.
+		 * To keep compatibility, warning only for now.
+		 */
+		if ((dai_link->dpcm_playback || dai_link->playback_only) &&
+		    !has_playback_both)
+			dev_warn(rtd->card->dev,
+				 "System requests playback, but not available (%s)."
+				 " Please update Codec driver\n",
+				 dai_link->stream_name);
+		if ((dai_link->dpcm_capture || dai_link->capture_only) &&
+		     !has_capture_both)
+			dev_warn(rtd->card->dev,
+				 "System requests capture, but not available (%s)."
+				 " Please update Codec driver\n",
+				 dai_link->stream_name);
+
+		/*
+		 * REMOVE ME
+		 *
+		 * In case of there was no dpcm_xxx flag, and CPU / Codec mismatch,
+		 * follow new style
+		 */
+		if (!dai_link->dpcm_playback && has_playback)
+			has_playback = has_playback_both;
+		if (!dai_link->dpcm_capture && has_capture)
+			has_capture = has_capture_both;
+
+	} else {
 		/* Adapt stream for codec2codec links */
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
-- 
2.25.1

