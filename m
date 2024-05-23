Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645758CCA9B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 04:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69CFF205;
	Thu, 23 May 2024 04:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69CFF205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716430367;
	bh=V1o+XrLcoZf+PIyAn7ncyH6DgNhodCLW4tpujr/kUCI=;
	h=To:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IVEnR1BxwOdxhPhgz3E3lI2kA8KAjYQcxmlBMxMiCvVabcf66EWcQbdPml+qWEufF
	 wvbRYnhLE0GJCUXGGavI3e7SeZYV1pRTB4bAgzz+ahPSd8woB2jWyKSHIFbQX55fWl
	 ta+eMVE7boro2IYy2JW68w7ZIIeg8saPykuCOb0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9261F805AD; Thu, 23 May 2024 04:12:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 680BBF805AB;
	Thu, 23 May 2024 04:12:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5296EF8026A; Thu, 23 May 2024 04:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2955F80051
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 04:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2955F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LiejmYv6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvXj7o0KA3RFo5+xIYLR0x96YF7heAu5SlTBnt7LzI7NiIoioCQ0C0K2FdTEDC6QxxfC+/0wUB2ETL+AeO0cyg+jsI3NOpUOsko+AJBLp5gj3aRZ2/4PT5cFS4fxWsfmbawhjS94rKCCioeMPbJu3Kc6fjqocB3YhZbxu+ZPs/u3L+XCFq6pTN42wNxnC+UMtsEljyc/p3Z9tGPTigbP6NKvmr4AAXsF//jS/ufWbBZea7rFO0aM8bvSForrKToVXVg53fseczPL40evOqhl3Wjgb2mnrJkLZo0G7+HC1QDnuluI4+3pedSPdwUYE7Djw1IOkcgUX4D+VsJM/mgqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+WL5xDzUEdWYaTRbmw1jn8h7aza4LRN4xJm2YGKkAg=;
 b=ZuLsyzi+iAzEv9uyZcvHQpS7THK628p2RFci3JIgNPlg1u3E9/rmj/v5OfDFZsx+P8uuRpvOwpQu8H/42ucEN77MwFhYtiVUuJ2de7vrySLKBgvfPvehyyPoVpHpJq/xYv42tyGC15RwI77OmJ1FWTlc1mOE0pKYaMXKCwhOivIuPsbL5zngzFMNt6dPtJNLGeSR866tT+Yj7w7f7So3A9rnPn0QLBRlLylkijhl/iWJbgwzMmUGN+DiT84BFhRfRkgh9yJICcWwYa5DO9SncwSCSvRLAvxqZu3wgUq+TWx8Z/rp/FK8L9M5sWKRParhT4FUvQ66w3TXsmtTW0zdVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+WL5xDzUEdWYaTRbmw1jn8h7aza4LRN4xJm2YGKkAg=;
 b=LiejmYv6xuZymyronkCk021M/mBU/U+QOYLVQUghuh7uCR+d0AG71Vg7SUARfN6iaQ78W9X8EMD90lgkmdLcouyREPjXrKQhUd8x0CZks+tdUZ03MFtIVYg7gANkne3lsR0v8cZv44jZQfDyuzpUC9ITN6vX9ZA5UANQ/KV7VWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7104.jpnprd01.prod.outlook.com
 (2603:1096:400:dd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 02:11:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 02:11:56 +0000
Message-ID: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>, Jonathan
 Corbet <corbet@lwn.net>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 0/3] ASoC: grace time for DPCM cleanup
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 May 2024 02:11:55 +0000
X-ClientProxiedBy: TYAPR01CA0233.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: a2013de1-29fd-4ee2-92f5-08dc7acdb887
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|1800799015|376005|52116005|7416005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/kLqdeu2UmN7PH4A6gj33+ItldAYeUxSCP5of+5BwivOz+0Le9GT/205dH8g?=
 =?us-ascii?Q?SFm3pAOwKLeGPmyv93jaCUCF4+ex5Zj2rPAata0L1VyTA2SGAuJ9UGkMPtWb?=
 =?us-ascii?Q?0JjUfJDWrdQfa9+11QwORo50B22T6iZIDkAUw79Z/sxnQpdbDS+or1dnrTTy?=
 =?us-ascii?Q?YlnBN5/b3vpXuNMNzp7trWiTUR2nTcT06upMYqqEIJJR1eeoWEmgsPx/GpGk?=
 =?us-ascii?Q?5LDP5duUIg/dVVG1Bco6amdIen3/36UVI/PhyNPd1OIK6+Aodg+PVcEhDcvw?=
 =?us-ascii?Q?qwLozECk0kfvt8jnbWoaOvZj97TnKdwBL3ugHz5yNKkiG5Igxt4J3ZKnGdUP?=
 =?us-ascii?Q?3bNoWlZeKRZqny8bEV1FCCaosgwYz4i9QifFDuQp77tgl/ECq+kms5Khv9go?=
 =?us-ascii?Q?Nu9gaDTc/GB8zOChgqDFgicSKc4dyFBGJp84ijZXtfOHC71pmGLMyrf4hKox?=
 =?us-ascii?Q?dKJ4Jq8oBti0+JkidHdGoJmoW3uFSpQHqh7hy96lgEEYP5G6hPj/PS1Z0kwS?=
 =?us-ascii?Q?qVF0aXZSlEMDd2tzVOzLQq8c9U7/ofbW19aIKbrps0rD15wnZoy7oB0ujAfs?=
 =?us-ascii?Q?JiBgjPAusm8hVihPqGmvtFI7ZvR6rFmcjR1A/XUw95eIma+1OwvirWxoTwsi?=
 =?us-ascii?Q?JUIwCibbm0ve4eHCwtJfeilrd/u8cjG7rtfBexIkbaYN+J94PBzrEMQjhrIk?=
 =?us-ascii?Q?BEP03Z1bTHlMLyMDcEWbxFz/FQ5xkW9i/POgV/R/ruJLuZFVLYU9U2vq3hbF?=
 =?us-ascii?Q?0Qe0gwAQMSDAtzk3Yh5I8/WOlw71K5lsZ2hohQytmjIwka1BJIOEXC6ipxE7?=
 =?us-ascii?Q?cI9yPaW2QiK/FCxtAutrVdTmepJe1q58K5EHgRcX/S1wwmXPTjW2xz74RbOt?=
 =?us-ascii?Q?2rJUE0Qdln8H3etrAcFx9Cmr9V1YPP5W7r0LQD1CLa0dAF6zb/sZ8+YymvOi?=
 =?us-ascii?Q?kFweNo2AtESzYqmG/dJc/cmVJi5Qx7yGH1ukfkUyVVw5ziWsidjgOw3abGhe?=
 =?us-ascii?Q?pV9qsNSCqBgLOIz7uZRsti8qFvJNk0xTLil0KFaZ3eYavjwvTSL0J4P609KI?=
 =?us-ascii?Q?Zio/c510R0pn1Y8XOT3atp4IRJ6NgQQjFOC2D/pZ7mRZgSmlWRTVAtqNSZ7+?=
 =?us-ascii?Q?KUQ3txg1H1KtkvEE3sI0zGmkOFCo05/1/vIWeXPkGk7/3eBarNEHJc4nkZj1?=
 =?us-ascii?Q?kbx1AihqIUFWlGLYfWw0GHB0kp5bjVh4yXzSOPvAsWtDvEAoBA5tvyEsvpS0?=
 =?us-ascii?Q?b6Ga+zC82B3NMlshyQGE6JQjZ3GkXRA1PzjjDHI3D/mTD9utBXL4IdKQHpg8?=
 =?us-ascii?Q?kY3J4kwvYCfeAI5dyfctUKkx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(52116005)(7416005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/F0gSZCg+E69rImJSux8VzGVXwvWgBdBON8il9ns8angJoBOFdnI8rZW/CzK?=
 =?us-ascii?Q?xi33K8KY+7uWYucMxERe9FDsK+4JTDIdqbiRgB9jJmola0JF6V9gPLk1E6f/?=
 =?us-ascii?Q?3ZWMiSRnqXgojEB1Te71qBxQN8Q63eF4G7gSXigLkPkCGwVrmFXEtsGnKB6K?=
 =?us-ascii?Q?QRrqLzAK/5d81Psvj5jxgTEIUvOdZvESfc4IgC4QZFF8Et6e34YLKPHH+K+8?=
 =?us-ascii?Q?7+gV92mEoipuVFkSM0aGiWc20SFkcBom1SmUPnKRkJ14G/YsUDghtG5N3+mM?=
 =?us-ascii?Q?Ip+rX5IsKWxUKqazfDHLpsS1QTbnWiYb1yO7BhaPEzzVhTik0QMMboCSYCQ1?=
 =?us-ascii?Q?K7SnAbGMnmgUtO9z8gsK1soVZEnVZCMSscJ29wtPZJG/qmDP2z3+1Ayjkglk?=
 =?us-ascii?Q?vurW9J21TZeOxxqvJudZrxSO2/Z3hL4To8xBiYS22EtPyxPxM+N6leTKnO4c?=
 =?us-ascii?Q?PBNddo6qmvu+8HIUOUMGE36CuWYDH/TYn6lrMNaFAyU4Dm9ZauXFmvnZBCfl?=
 =?us-ascii?Q?9do/zLaY/hFSSd1ytdq++mThbz9YVENSnOMmBkGwKductN3S+iPLFduPu6Xt?=
 =?us-ascii?Q?zGbdRrzbb69bJacba7fEFxA0+d/FEEpTRzjNaxvPF9IK35Hf+BH6PzWbe4xn?=
 =?us-ascii?Q?dejwjXrsw3wlQk02XC7fTkuf9Dax0ZzB5LeKokI74bwVUisiaQ0j2khHkOLT?=
 =?us-ascii?Q?TdEm53k0xGLnCzyXQ9MJPy/g8KhWgBDPq54dkqsLNmVsseqhzDJFmYgumSEp?=
 =?us-ascii?Q?MsKG6lwuOrtJoICZZrfhTtGEOHFN82hJin6Lie8HxMBzhFwE25VMjxxQsJGE?=
 =?us-ascii?Q?X/YJ90linP895OnGIzMUBVSC4Rs43MQanwzVX4XfHWXxE7yHuKjhcpPxMd8V?=
 =?us-ascii?Q?LqgjgrqXIIEmA5cy5+/bxKlEDWr5Sew0Du42LAUemhqkmlPF5rpg85r6p0G1?=
 =?us-ascii?Q?Bwhoi7MbpxhvjpsQviwC13tJuz7mT+0d1eRwnm8RqgJBn3xtCsK1VyqGdFuN?=
 =?us-ascii?Q?NfhJAD01R5ql2eP8iW2SkW7wUUHAQf3H8JVtfPtNkphT7LijD/QvPIiatHxq?=
 =?us-ascii?Q?GetsMYc2KeCJdq8Ym/czvXbztRVCO7hXXO12ECjTQvX2eeq8cCIUoA1T4vMZ?=
 =?us-ascii?Q?FW72BATIYSC0bj9rSqy7ALL7gazJwGh4qLcuEbC2vKoiJPY6cuqVgHKOlal0?=
 =?us-ascii?Q?UZE2ARmEJnSeI18/oUXymOvCpdmNTtOmqYhmjgISuEw1XeF7f5iLgX/07JDh?=
 =?us-ascii?Q?KVShW2hxVks0FKBM2bNOhXTyOCbgrmw39Ckvq+jnIjq4Cye0Ta9I3J3tGboU?=
 =?us-ascii?Q?qvWKTtNBXTL0U5kwYOw5frbLkd8GORUAKBM41QLgFCt8cHKlvRLSE7HfQqnr?=
 =?us-ascii?Q?0/F+dS6kfHSGIePjv7qsHxVWZtSMq2cRGhksAf3bqjkdrkDeigALvDqUInoP?=
 =?us-ascii?Q?0MlKsoKvmIAvgEAAzuTOKbwXQn4ThD5G+5GS7DAJHVvd8+8ZsC+HMQZ5yUpU?=
 =?us-ascii?Q?/x/tA5XVy6Pcyb+w03XpyZbxXMaviRw86DKMvcVt2EntyOMjqsJw6HkoZk7M?=
 =?us-ascii?Q?zBE+BiAfTb9u4rQYoBAy/0yqk0OTcErYImdzaOB0/cSoHDMhrNRTCvTTxJwW?=
 =?us-ascii?Q?Rxw8uGZjullS+yU1C4rxG+U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2013de1-29fd-4ee2-92f5-08dc7acdb887
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:11:56.7702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JAmiEKbw/AnJ12vUzyVyP90V0qEvhJ/dIGBCncgglX/8fpI13NjK9u0lggsM+vh++RCBxrnsPpZ7Mops+7HXp0Kn89LfM4WgRWC1C4al82ORCt6kKEYFhl2mK0fRK5l4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7104
Message-ID-Hash: MLUPJL2OBQIF6UW2H3C6RTFJUMNFADXY
X-Message-ID-Hash: MLUPJL2OBQIF6UW2H3C6RTFJUMNFADXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLUPJL2OBQIF6UW2H3C6RTFJUMNFADXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

This is v4 of DPCM cleanup

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be
error, but maybe v6.11 or v6.12 ?
Please check each driver by that time.

Previous patch-set try to check both CPU and Codec in DPCM, but we noticed
that there are some special DAI which we can't handle today [2]. So I will
escape it in this patch-set.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
[2] https://lore.kernel.org/all/3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com/

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87msole5wc.wl-kuninori.morimoto.gx@renesas.com

v3 -> v4
	- don't check Codec on DPCM
	- include Jerome's dpcm_xxx update patch

v2 -> v3
	- tidyup typo (reuqsts -> requests)
	- add Tested-by on git-log

v1 -> v2
	- tidyup Codec check warning output condition



Jerome Brunet (1):
  ASoC: amlogic: do not use dpcm_playback/capture flags

Kuninori Morimoto (2):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
  ASoC: remove snd_soc_dai_link_set_capabilities()

 include/sound/soc-dai.h               |  1 -
 include/sound/soc.h                   |  1 +
 sound/soc/fsl/imx-card.c              |  3 --
 sound/soc/generic/audio-graph-card.c  |  2 -
 sound/soc/generic/audio-graph-card2.c |  2 -
 sound/soc/generic/simple-card.c       |  2 -
 sound/soc/meson/axg-card.c            | 11 +++--
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/meson/meson-card-utils.c    |  4 +-
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ----------------
 sound/soc/soc-pcm.c                   | 65 +++++++++++++++------------
 12 files changed, 45 insertions(+), 86 deletions(-)

-- 
2.25.1

