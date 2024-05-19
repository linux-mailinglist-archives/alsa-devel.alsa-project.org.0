Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442078C9D33
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E081E8E;
	Mon, 20 May 2024 14:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E081E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208079;
	bh=w3PjM87QYxBLdWmHMEs0xthJosfYjVwCQrtDyD/ISWE=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O94zCw1kcaFteRS8oBVJvRPWT3K4w8p1tzTmxxM6XRp1fW79uFxNNhbqURZ8fyyZb
	 NhIWnu+/QQ5o3epEWmfkhpkvWz1sv6wwvIiujc93KekpfnKFVyc8VMhio7hO3ObDEs
	 1TD/dodnoeGoYB9mv+JVEekb8SLnXjDuxsFu8Mks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14D5CF80613; Mon, 20 May 2024 14:26:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9015F80609;
	Mon, 20 May 2024 14:26:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6D62F8042F; Mon, 20 May 2024 14:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBAA7F8055C
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBAA7F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XbSQfTji
Received: from OSZPR01MB8402.jpnprd01.prod.outlook.com (2603:1096:604:16d::11)
 by TY1PR01MB10723.jpnprd01.prod.outlook.com (2603:1096:400:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 10:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4l66C/Nzw6qSPMSR+P04Gmi6DwkrfdzOvHlqJYx+G7KYDgpAfLGOoXY4fHtxrE2edOdpQPAgXavpNnpMf5yjgwwdDa4WEvotK6dlk54eHn6v3IfZbOHBQ1PoafHDgJq6Dxqih0tU0QUNMnd9BICbt7OiACJUrRlgkq3nR7sCPF8BchdH5dZ/ohQfQgGi7Bnl17UDa/rP2APcCjsLNG9kqiMBSgHdYt3daXI5p/kVVD+fOxOqo2WHL/4G7fxp0LaT5mlbRu8s6HZYiV5M78ffOH4LtjM8vm1J1DNKsTjtrx3gNlNDmZid4L/2fKvOE5sY3VbCckgC916LEkg4OdnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF0lM71Uy40jGAMwgXns49tnQLw7R2shzhvEn6m+Uxg=;
 b=LrxazK0nw4PJyuz71qjc1RDGbl41SdUUlMLDdBtsogpyyldXVhoBjNxHBXEefYCb6QpMzo0iOQEUt3GNYOTZiuxmxg3YJKQldiyn3oXzutuPlYxe9eFmp7trFmyw244RUH9Hph8sR5FOIpbu9iDyobx3vDxX4dr8so8zkdic7+dYVfpgYPMTON87eRGAWjxK9iRJfznNuB2baFbdyxfe9M3jluE0Orot99yWqwbby2wimjBOMY73B9PK8wfUgThKXYs0eTTxOlolzy449Dq+0dVL0prtth61yYY50Wijed4JN4Mwx2twoqstkaBvf+rau4BbgNHd3pLzP8cGvhWIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF0lM71Uy40jGAMwgXns49tnQLw7R2shzhvEn6m+Uxg=;
 b=XbSQfTjipQwkhfyCEPQixifkW0VrwVZntn+Dg914ygO0xlujyPEU71RH7zR5gzege3fHt6qyxMn56jw3k/UuXkRKjvwJJ0RXpdW1N8prREuc5G2sNYzLzOchvNNCYnJitJ5OZaddkW2MbYODlKItpLGcOUhs5hi0rMh8a25JAlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8402.jpnprd01.prod.outlook.com
 (2603:1096:604:16d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Sun, 19 May
 2024 23:30:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.030; Sun, 19 May 2024
 23:30:44 +0000
Message-ID: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
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
Subject: [PATCH v3 0/3] ASoC: grace time for DPCM cleanup
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 19 May 2024 23:30:44 +0000
X-ClientProxiedBy: TYCP301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
	TYCPR01MB10914:EE_|OSZPR01MB8402:EE_|TY1PR01MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: b5eb1818-9508-4c9a-70c5-08dc785bb45e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230031|366007|376005|7416005|52116005|1800799015|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?9csmJxtz8IxAGuw7kNo+kNZf3AxYto9fFPtmKu0DVDwPANdrjiL52qUAjQR2?=
 =?us-ascii?Q?Css6oh9YhdlsW7CNcsyzhzQr/DDtyDZ4RaVkyXrIoeZde/z5Z2qUZ5f4ED2u?=
 =?us-ascii?Q?xtmEuFhN7OxoLG0ckl7fzEjiIFlX0GqCgRX4e4lrG7EEAYE6/E5G5CmlUFFv?=
 =?us-ascii?Q?Ivu7xc/jh+f+r1A/9TkEXrJJQlGBjH9t/PsM8gfKhC4otID/MytWShdt/53q?=
 =?us-ascii?Q?w0ayduKX2w9J1lyqsjwbqS6nypNI6ddFpivg0k5igUYzoz3RFVghKsrvXe7m?=
 =?us-ascii?Q?Q/6K6fxx7pi/qwj5ntjh9h7G1Cdqf3gK00sp+0VcznQopjN8OXOuciKt1VpK?=
 =?us-ascii?Q?KUlfswHay3VOXg1ttQm2NZ2Pvl8bAtT0zy5H0XEzSarYE5xhsYV9JnW20Rp1?=
 =?us-ascii?Q?mhYKY9KbrHj5ysHkLlupxXJI/e3Ltw+I2he3G1DyNwOOBDvJb/lS2cQqL1sm?=
 =?us-ascii?Q?QWPeobwbLIlajisJV5bXwlkEpwBGEjeSiJFmQwKpu34mQSO+nYdVRJe+zX5R?=
 =?us-ascii?Q?bTC2kTVd1K261CWUzeLFkMRs/i/zGxWNkcOV/g2FbA1pPO3pzj0/OOZne/YX?=
 =?us-ascii?Q?vVWQmoBtYjlsp4yj0cZ+8jeNhMDY/5VijAbYHNoWMvBi1vISjJ5r0mfEbXLa?=
 =?us-ascii?Q?AaKUdBkoAismkFE4FfMTMUWaUxnXdbFEMJEtp1ZzzQcy7sIM3TCPSgIT/6Y3?=
 =?us-ascii?Q?Kb4llwYYl71CJ0BWj07CNXbO7wbGD9aJBsOKPyAccOjExeYAN5/72sUM9bCS?=
 =?us-ascii?Q?H2YZUPKaAgxyxq+uF0S0yhtoFx1GTP2sKkx9hLsuxfsRXuo/UJQmozY24rsJ?=
 =?us-ascii?Q?qm9AZLEM461gxiuN8zQR44Gg1yj8CaBUnBjHdp1ll0paT4HeCW65iPixd9Zs?=
 =?us-ascii?Q?hlPUJC+OpZhXwYwR5R3v2XRyxVe8JJ2xgb9/d+9RrI/MtmnWHGT8mczFBk+H?=
 =?us-ascii?Q?e2Jm1puIzPgjZfGIf/Q+TAFBtopt92hB3o3ChPW2QHmMHntacyTSjszC6vOg?=
 =?us-ascii?Q?3+WYHKg+aeu8EBeRe1P6XIvbBFw9S2yrnqT39Uejn8qTWy8h0ehHPFs9iHw4?=
 =?us-ascii?Q?kdCVYhkl36wkLgl8N6xjEin3zhjQB1ISklV4nlLU11LFb1hnTH+vCaW9pWMg?=
 =?us-ascii?Q?U/mjELimyS/ABkvgIHH00+NF/YFRzpE2tQRJ66c2H0L4KJOw9+q/g5sPvFUs?=
 =?us-ascii?Q?4raXXrn2X2Srt8EuKOoaI9CFrd9k3zr77XeIw8hixp82BNe7TNKxh3BUcTVr?=
 =?us-ascii?Q?Z6YTNkjJcgKoB3Zw6Wwb8/nbV1AsSbdWUkyg/zJMf4gMqcW+KbtfLWoRZk9U?=
 =?us-ascii?Q?6alhM7JER2Y23GyWnF2o7kA6?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?DEP7VNFqnSk3nkFBQ2pIXZx1DQBcOjeWLX7Xwt6H7OxVfcw5pXOlyysHWAnE?=
 =?us-ascii?Q?bhw/1o0p/cRdBfN+tuUyVv0EUMHUb4pv2LXH8GL5Uqsgv4iGuZqyiAjhkKKn?=
 =?us-ascii?Q?CNPqO24XURFmMjUXgLtxb+FyyTF3hEpbsu4qOR07A0YdfBE5o9EFDiC1SmiN?=
 =?us-ascii?Q?/7EE2t0Dcav6mWRbdxGmV2yVJa52JjjcgcKD8NwNBeaPefZrCw1R0dnm8Gqd?=
 =?us-ascii?Q?DSxLsv61O8v3A4xwBCSuQhxy00YFrOK0BDZAH5uladMYPWA3pTyMbSuWwnas?=
 =?us-ascii?Q?gdKdTqcQdlh/Kr3kh2A3+tRWu7jzwCGzXcBDmDSVeV6DaPD7QyCy5srWsFCj?=
 =?us-ascii?Q?j3K9HXfY3zXAzT3R95mobqr1ALJlO8BCSUmubBzYGIFwP2RmKZ+EJl+MeLHR?=
 =?us-ascii?Q?80L3COWqzWWNi3msy2fEHnbCz6vtYCc7Yc146rfp7KVLwUFjwfbiQ9eHm/9h?=
 =?us-ascii?Q?Hp3rtvCBgclK3hemr/4GXErllRRbZu4zskyrp7/eBm3zzIQplUshUTJlfrHk?=
 =?us-ascii?Q?7tHotDOD9sQ67c5M8ie9dKAd1SNObdhWqBw0STXPXoHM246Gf43Cd+mJHTLV?=
 =?us-ascii?Q?kalv08IHFXwejhx7zp/3B88MEKvZzgm8IIpzKVAjKrPn7I0J2Rbc6D7DnMS9?=
 =?us-ascii?Q?rNGBgeNVwucsBS/AL+0gZS8gyj/+9tx0H7/AmZtzVrsRHM1jZgeKeOpYhyci?=
 =?us-ascii?Q?y6r+UmERHxXmGLGo5K2oGTyFZQS/IxdqCp3R4PIQzz3C7j0UwR/NAZtKS7rI?=
 =?us-ascii?Q?ma5MLMKU1/davt6LbWQPfUMTAwltqIyLWMSuWtiSppWDq+DSfakR0CDUEuD6?=
 =?us-ascii?Q?w/Kq6lrvRPydtrZ+ar3jPY/LMIzjElQ86rPljIxRlQ8D3RyLKJNWIZ5gIoOL?=
 =?us-ascii?Q?hvcwnT1XbnNYZzq1pgdcdAaa9Co6HAwY7w5tHqyIpydHbqLoE6eon4gfj7DN?=
 =?us-ascii?Q?jmr20xZphrwyc07d2qsHZymYLhFLbYnhZeYxzbRR5w66LQv8gsot0aMguUiC?=
 =?us-ascii?Q?nt19KfgjtCZvOK1ypX6J6VLfTfj9ezX9HpIKA+OT1tWbf0rIj6VivObIeseU?=
 =?us-ascii?Q?6LAmkO2OgV94IwjuwJOOLUx7VVNE+paKqN6gIRY0Ru1GSSQJ+CzQHCFgD7DP?=
 =?us-ascii?Q?0E9b2YCu/bj4ZPLxLg1AqFo+7znav58Kiu6iirPivGpzVwDchCfWnIDGs6l7?=
 =?us-ascii?Q?Xkf8G5AdEHHYcoEUNoCQIeSPlx7OBv5XoLsw5X731rnk8ymix8zxV7vCwWzS?=
 =?us-ascii?Q?y2rNbJ8Vebd1fr7jfiUe7QI3oO9G3YUWgZv7LVWXPzlcr+ffEC8V9/F+M6wi?=
 =?us-ascii?Q?+JKOVpB9VLUzzow5tFkRVZoYy7m4ae8NwvLImbJd1mW5Sdm6FaI0FEUKfpvd?=
 =?us-ascii?Q?lIwldku37eDOPIyznNhT2+eyPHs5Xrtk+MLGkhGxWhs71nfUeueT9HNEFqPT?=
 =?us-ascii?Q?ooxUCK9X8zwHhow8Ad3cRhNiBbzOUtaSzZI8+9gANLAxf9TdVtDCvqACK8pP?=
 =?us-ascii?Q?YJnEXmZAPq+f3b4bGsTiJAdJGODAsbrXY4NlRJFwrToO17orgkr6BLWBpReA?=
 =?us-ascii?Q?TTN5yXChZMIC9gTSxmxLKpIQbxGFBn+tHgzMYq0LCFoFaclf+2pFkq1tePcl?=
 =?us-ascii?Q?W2wby8l6OGCwOdaZqY4Dsek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5eb1818-9508-4c9a-70c5-08dc785bb45e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 23:30:44.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YUfJGWEtVKwOXGJB+DTw5SR4EDJdrKalXggAjX8Zi5f5Jfd/KrJyT6VCmcFh2wqp4GkguLMTEVGgk6dnIpyK+9PGJojHhj+4wzzxEOeLwqQLOJjYnD5O0qBhtNaUeiGE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8402
X-OriginatorOrg: renesas.com
Message-ID-Hash: SOWVNSS2P5TXPD4MRVV4QPQ7DIYXA7TT
X-Message-ID-Hash: SOWVNSS2P5TXPD4MRVV4QPQ7DIYXA7TT
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


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

This is v3 of DPCM cleanup

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

And because of its history, DPCM has been checking CPU side only. But it should
check Codec side too same as non-DPCM. Some device/driver has been bypassed
this check. It should be error. [2/3] patch indicates warning in such case.

Because dpcm_xxx flag is no longer used by [1/3] patch, 
snd_soc_dai_link_set_capabilities() is no longer needed. [3/3] patch remove it.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be error,
but maybe v6.11 or v6.12 ?
Please check each driver by that time.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com

v2 -> v3
	- tidyup typo (reuqsts -> requests)
	- add Tested-by on git-log

v1 -> v2
	- tidyup Codec check warning output condition

Kuninori Morimoto (3):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
  ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
  ASoC: remove snd_soc_dai_link_set_capabilities()

 include/sound/soc-dai.h               |   1 -
 include/sound/soc.h                   |   1 +
 sound/soc/fsl/imx-card.c              |   3 -
 sound/soc/generic/audio-graph-card.c  |   2 -
 sound/soc/generic/audio-graph-card2.c |   2 -
 sound/soc/generic/simple-card.c       |   2 -
 sound/soc/meson/axg-card.c            |   1 -
 sound/soc/meson/gx-card.c             |   1 -
 sound/soc/qcom/common.c               |   1 -
 sound/soc/soc-dai.c                   |  38 ---------
 sound/soc/soc-pcm.c                   | 110 +++++++++++++++++++-------
 11 files changed, 81 insertions(+), 81 deletions(-)

-- 
2.25.1

