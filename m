Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 800959472A4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A72139ED;
	Mon,  5 Aug 2024 02:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A72139ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819128;
	bh=nsEKi7KDRRpua5sTetmxxdDql0FNa8KTpJPJz/m7DLo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I3dMXOsk/g/PJD2YERFIbluR8s94qn+iEW0j+T6akfJMPtHp0DLuCu5q5eBLheAnM
	 xbgCoqR17Yl5sH3/5nNLP2ZHkkVDKZGprkzTFe4D7fLuJgjifuSlZiLX7cPS+KxNNO
	 RMXQepsI8CuFUUKXSLg3Ri/B6axiVP/g3C97rjT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4602AF89AA9; Mon,  5 Aug 2024 02:40:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A22AFF89A05;
	Mon,  5 Aug 2024 02:40:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CE9FF896DA; Mon,  5 Aug 2024 02:39:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFBD9F80772
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFBD9F80772
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CcGnlDfg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNqOKONDz+eIxdTxg8bRAt/cN+ab0AbL6w8i7dxgxc6m84WkKyPRIJonFmvPBfDpRtsmKr08P7P9RWS+6NSNjwOz9kSyDAaj0R26kuYl0YGO52p84n63iwLl5lIAfW4uGxIcdaW+HahnXWzBLwuzzhEBTzkp9AF6Ztj/iGytSoZodd4rV9m0KHNowr2R5l9gDWMCNatz0jboOOq0w5Baxcn7snG9wkPCxVDS3h9cXZmNp73TfQGL+Szc6Gz4I56Q9Vn6x2Hqe4zXCwMaa4wtDt2zvZbpN1Ef0a1Vy0fqcLNp/3odv/Zi0AEJI/42Fx4yVvZhOuFibpF6lUApevLN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqUXevHHAlixeXM/1OxjdcwV14TUzsjb7SmcQR/fae8=;
 b=xuaTiV+GdEoj7O2hokpN46MknC4HKYYpksjEF/D3shBIKuPnf5BuMhJvilawLlSQ6lrBtHaVwlT/T4JDLuFqbOswoUxxrnD6zTTQQ6XuDEKhaWij/AI5SCRePjsd8itwwKGj5iCOf2x+t45lAk0UIgVup0k+jkx5F9WvsLb0mlrAhq7+L5TZFJHi3Zsrk2Fptis6Qj8uaTLXuqiO3Gfe4RzeWUudIdD9y5bv7uuwmn2S8FGwbr/Se65ZD2KjJR1avae34I2h6ub7PeX60jf7iRPwfXiV00j1M5gUpoHbPRWMzKVTDPbLMcFCL4ukCS2410+w5LHo0ncWLIA5rf7zAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqUXevHHAlixeXM/1OxjdcwV14TUzsjb7SmcQR/fae8=;
 b=CcGnlDfgW8a43Z2z8rqmuazEs3TNSOKOEi2nzddho8JM29NhZ+a5RDyNOin2juEGGCas5k41pL2gRc6V5JIlsyhrL4U477VfUhTR6R7D0wKd+ax8YpR6I+oTH5gvGv+OWAfQRullW5d4GLp8DmPyRK30QgmyYC2rMunRc6BaHzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:54 +0000
Message-ID: <87a5hrztuq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 046/113] ASoC: amd: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:54 +0000
X-ClientProxiedBy: TYAPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 270868b1-cf64-4947-47c5-08dcb4e6fbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n/W1zy4lqG3EH0JOeQ7anYvaJFOAh2pRv4z3lfzSM4IvL9U1MoOQJH88Mn62?=
 =?us-ascii?Q?CQyiBv7V82KvP/vdPtw0TPXnnHxQaNbMAw66DM4mE37ODXyAVDSGbJbBYXG8?=
 =?us-ascii?Q?8JNFAJ6zN0BgR2EpogvFYSXh7F5ZWAmeH99cdunpBjR5UX9YJQcwGIjt/NPo?=
 =?us-ascii?Q?cLRf60dWnKLdy0xEwkt49Fq0W/33UH4F9oNSHSAU3rTWQ1tVs3dJleVWOuNu?=
 =?us-ascii?Q?yhoQkWS1uZ9qLAuChSMCZzYT5MaBIa6yAW3b6BtsWbAcgpeCLmGSDun8xo2l?=
 =?us-ascii?Q?NZbxRWKsSoWLp5ZTOfUWn9sn4WraoGIlzX21qUA8XRdoq7MlvJc57W1khQXC?=
 =?us-ascii?Q?8FjHURh4CYjg8+COHtUA7gTEtGOiadkRMe0l9Yigx7HYzsp7G2OId4tVGcGv?=
 =?us-ascii?Q?HAde+mzVhta88ANdxQrcXFjNA1b+KYoaETD3PFKcqe8XVuJTSp+vwyOR05dP?=
 =?us-ascii?Q?7A2uyltnlX8SR8VemiEDjbMUwh2O65Q2m4d+V92JdicGZnw0CWdZbMUf9ynQ?=
 =?us-ascii?Q?DmZFq/oW9WOMOzjzQOxo/yoiwupRuFF6eBtX1kJzenQkNJtC14MQieF3uRaS?=
 =?us-ascii?Q?HqLARbVO9aAggsafvV8+KSasbKtdJTOLi7EBfhAme7L7pKN+SS4k0WLW06mP?=
 =?us-ascii?Q?ktOxkDU+szlqnv9rAscFUpzMz1oIE/wTTF1fhaqEYqGYYz+aQ4jl5B4Ur26o?=
 =?us-ascii?Q?bt/bYzjOMOLSeMGRjj3NnQsfh9X2x4vzfscFelrsuyh+2T2LQpLNLXZx6yU4?=
 =?us-ascii?Q?DgbPNLcUrBurk2AX3CpwYXIGDHcLgbb7KjXAgGCAmFpNXsQpyUdRacYijSA4?=
 =?us-ascii?Q?oLA4i8TG7W/3zFEcsuSJB+ZVM0r+0wpfPhbtQ8dpq6EMZA1IQ6nxExmnlwyo?=
 =?us-ascii?Q?RYP3iRqgzjWHIToZT5/aH5eLXySin1At4SKpiU4Mrq9Wu6VG7ws+1Y1UM/md?=
 =?us-ascii?Q?nRl8Lh6ol9Xv2hHUPS2sMN5vyVHj63k1YD5FQeeyPlUe4LEHMuPpCrsiQP4a?=
 =?us-ascii?Q?YzDDgxgEAHqZ4Cfytg8Y1lWVcU8TLjgCQNnSOOiR46H3CjC45hiy2IefQDHL?=
 =?us-ascii?Q?AJPTfHjz3yN/4tAJJOIJUQvxx99EsxxofODYedgFSo9RnIUKSjaxWdxz+J0e?=
 =?us-ascii?Q?OuAmyKJNCdKIVtykuf/vL8lNdIeoCtoSAnUyw9N+eJZmrK2tTkjskVbtE6E6?=
 =?us-ascii?Q?GXYjC5IowhPLsbsJOnLKEQdd5wrIJcgv7uDKhyOZWWsXSp4h6i34jHAULMR0?=
 =?us-ascii?Q?fYBjRdplZrCQr8/orkKipkdq5d2atksgQ+mUqvqJwoGd98UC7HTViJ9zHFYW?=
 =?us-ascii?Q?IADepWAGJJuVekZ0PZRi5F+kQPiZo7d2BHDEyxrL1klqQbSvfrm7VF92hRG7?=
 =?us-ascii?Q?sNf0jIAgUnchayhFUEJVFP92WA1t19UH6indqkYexUx9a3QhvA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WIyvfWxZEO1j2tmBbUxUvYusFvPedCwAh6kmYaZqoIpcrF29waX3tew5PKIN?=
 =?us-ascii?Q?ocwWIOXJh+k535Ck6Bc+PIh8TXKuCwVHDkjpBDTJmL05jsX0CS8ikVAi8Ujd?=
 =?us-ascii?Q?7esWUInUSUD6WgpMcNOleiz0oOxseD5o2q8ID5jjjRCrt0JtS4eHvsrRTBU1?=
 =?us-ascii?Q?//drKMCHPMkVUnnlTM9Hbs7gBMFbeh55NIg2TMMIxqjlnBgsaPk3F3Wjs6p5?=
 =?us-ascii?Q?OX1YbI40N/VF7xR5ATSCtvTGwt7bOxSJFAbsDl8Tb3Lc63XYLZMTYoz+ABsO?=
 =?us-ascii?Q?5RRCJ/vcVew9tahJLULRf0Mm3gojgShoRQeZog7Aemy9cdW99NdHQDGxtqXM?=
 =?us-ascii?Q?hy3v2CfFhfz8Dpa+whBA6fFwn32/52qHH3JFHz5YK8xqBx9GUBOKP1zJg/cW?=
 =?us-ascii?Q?zddrfF2C2KhnNvPXDux6jzLfnKvDrn87PicbXos7N7cUNza1lW1ZGvxPEaIo?=
 =?us-ascii?Q?28IC17/9m14OJnhPqtoSW+Q2us+PDb26uFY/he7A/y/oZJJnajCmbhHg2lrN?=
 =?us-ascii?Q?PpmD3Onqf831ehBbWAvGwoTUJ5WtmYE+p6+DcZFZ+7ywIBwl/gmUbktiMT8s?=
 =?us-ascii?Q?GpHduRYeRfxRbycdE/QDrF8u5GnLQZe8gadJsyYi8Zbl6Dm09liVZEqMS7L0?=
 =?us-ascii?Q?1PrW51sKYwnmpl5kwdIeuaUoyMcjn/AkrAGb83M37F2G/fIvw4lGlG2G5Qec?=
 =?us-ascii?Q?puohSGGalcUYfPosSVSFyCxx1tFvqFFP6cGa8N0L/5e7lOm2Z2kmXQYyouE6?=
 =?us-ascii?Q?TZXWeYnJbJQpyC86TMB0sugJmYXTAg89cywfzrP1CZuhxBQ6HmK5HybrBf78?=
 =?us-ascii?Q?y6FpZsUBvspp3t3C3tzubDevOokGc6aNvKP7JJ71QT1f0mRGf1XggAT8wr3B?=
 =?us-ascii?Q?GUTNSVI3GN6A9tu/MwbLDwRbcWcbJ46xpXNpkIIxreep2FO/EhI6I7JNGLSu?=
 =?us-ascii?Q?oe1TKDS+tz2VvEPY7F+I3HSrZYuL4C/W4nQY16XRw0mD2udhq7z5SR6QzKHk?=
 =?us-ascii?Q?O/Y3N7EErawJ9iEmFFtPpRXs6OoHfJNSL3JHE669DiZcZhxQOS2I8mSYiftX?=
 =?us-ascii?Q?ePakEbvlkBIaJzUQzHU6W9AQ4+JMLhfexSL0FXybA/l3+YKlGxAU04iS/4XX?=
 =?us-ascii?Q?hq9DR5QNb1Spn7KXcAShpHLATX91w7WYg2XAWMxMz+4og0eIoxKLmyFLwvHg?=
 =?us-ascii?Q?r3qCP+rDJLCAX33qz427YX4tLCZ9+7TBIPVZWhUKL2kU3HTonK4UKJn2hznf?=
 =?us-ascii?Q?IObj/TMmnk5xRzTHxHbZaEAJyvnqF4WSHPxg5fqcR9FzyaQWsSIsLp4E5oG0?=
 =?us-ascii?Q?X5Z0Xn7apaxLL4gZU9jNg5mYncaxo+XW6VnB/GFKNm/Jd98kQgcBOyEvH14e?=
 =?us-ascii?Q?tDo228cKkBQ8VLGXzI/1y4vXVYnqKOi4w1nAfzYxjz5Z7F6pq4JUzgfNqeVY?=
 =?us-ascii?Q?FAvWpWtdLV03WObImqyjyv7xfvsercEV+drfuSwITXB1zB/A0tGMj79uj4XG?=
 =?us-ascii?Q?50XB9ILBgnBkyeS5IkwfeAa0wMow6ke9/SMFPmbJMB9cfF5YM+T+q+H+hDvX?=
 =?us-ascii?Q?rYlWctNwHQe6TCWXX+qy9VqHtR2IMLiIXmrUrxITrfjkrOqltQC7lkkxJq6J?=
 =?us-ascii?Q?e6/+2p3g7hc1psQ0YVI+bcg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 270868b1-cf64-4947-47c5-08dcb4e6fbeb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:54.2734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 h49qLPR68J/jkTVoj2D31zW1ib40A1oCNVjDRe3Sp9CD8LhG9O2LFDrBu32RIxteVE21TjU2KQ77rQIlC+ATq1zpk/JjA0tdKEhBqzowRzFLUJNkhKHPvgaaCNrk9VXH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: NT6USDEIMOHNMWEWLMYW2C5KGFKJVZI4
X-Message-ID-Hash: NT6USDEIMOHNMWEWLMYW2C5KGFKJVZI4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NT6USDEIMOHNMWEWLMYW2C5KGFKJVZI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-pcm-dma.c           | 24 ++++++++++++------------
 sound/soc/amd/acp/acp-i2s.c           | 24 ++++++++++++------------
 sound/soc/amd/acp/acp-legacy-common.c |  8 ++++----
 sound/soc/amd/acp/acp-platform.c      |  2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c  |  4 ++--
 sound/soc/amd/acp/amd.h               |  2 +-
 sound/soc/amd/ps/ps-pdm-dma.c         |  4 ++--
 sound/soc/amd/ps/ps-sdw-dma.c         |  4 ++--
 sound/soc/amd/raven/acp3x-i2s.c       |  8 ++++----
 sound/soc/amd/raven/acp3x-pcm-dma.c   | 10 +++++-----
 sound/soc/amd/raven/acp3x.h           |  2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c  |  4 ++--
 sound/soc/amd/vangogh/acp5x-i2s.c     |  8 ++++----
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 10 +++++-----
 sound/soc/amd/vangogh/acp5x.h         |  2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c      |  4 ++--
 16 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index b857e2676fe8c..39d2b1538b27b 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -210,7 +210,7 @@ static void set_acp_sysmem_dma_descriptors(void __iomem *acp_mmio,
 
 	for (i = 0; i < NUM_DSCRS_PER_CHANNEL; i++) {
 		dmadscr[i].xfer_val = 0;
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			dma_dscr_idx = dma_dscr_idx + i;
 			dmadscr[i].dest = sram_bank + (i * (size / 2));
 			dmadscr[i].src = ACP_INTERNAL_APERTURE_WINDOW_0_ADDRESS
@@ -268,7 +268,7 @@ static void set_acp_to_i2s_dma_descriptors(void __iomem *acp_mmio, u32 size,
 
 	for (i = 0; i < NUM_DSCRS_PER_CHANNEL; i++) {
 		dmadscr[i].xfer_val = 0;
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			dma_dscr_idx = dma_dscr_idx + i;
 			dmadscr[i].src = sram_bank  + (i * (size / 2));
 			/* dmadscr[i].dest is unused by hardware. */
@@ -336,7 +336,7 @@ static void config_acp_dma(void __iomem *acp_mmio,
 	acp_pte_config(acp_mmio, rtd->dma_addr, rtd->num_of_pages,
 		       rtd->pte_offset);
 
-	if (rtd->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(rtd->direction)) {
 		ch_acp_sysmem = rtd->ch1;
 		ch_acp_i2s = rtd->ch2;
 	} else {
@@ -779,7 +779,7 @@ static int acp_dma_open(struct snd_soc_component *component,
 	if (!adata)
 		return -ENOMEM;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (intr_data->asic_type) {
 		case CHIP_STONEY:
 			runtime->hw = acp_st_pcm_hardware_playback;
@@ -819,7 +819,7 @@ static int acp_dma_open(struct snd_soc_component *component,
 	    !intr_data->play_i2s_micsp_stream)
 		acp_reg_write(1, adata->acp_mmio, mmACP_EXTERNAL_INTR_ENB);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/*
 		 * For Stoney, Memory gating is disabled,i.e SRAM Banks
 		 * won't be turned off. The default state for SRAM banks is ON.
@@ -861,7 +861,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 
 	if (pinfo) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			rtd->i2s_instance = pinfo->play_i2s_instance;
 		} else {
 			rtd->i2s_instance = pinfo->cap_i2s_instance;
@@ -871,7 +871,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 	if (adata->asic_type == CHIP_STONEY) {
 		val = acp_reg_read(adata->acp_mmio,
 				   mmACP_I2S_16BIT_RESOLUTION_EN);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			switch (rtd->i2s_instance) {
 			case I2S_BT_INSTANCE:
 				val |= ACP_I2S_BT_16BIT_RESOLUTION_EN;
@@ -898,7 +898,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 			      mmACP_I2S_16BIT_RESOLUTION_EN);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			rtd->pte_offset = ACP_ST_BT_PLAYBACK_PTE_OFFSET;
@@ -1043,7 +1043,7 @@ static snd_pcm_uframes_t acp_dma_pointer(struct snd_soc_component *component,
 	if (!rtd)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		period_bytes = frames_to_bytes(runtime, runtime->period_size);
 		bytescount = acp_get_byte_count(rtd);
 		if (bytescount >= rtd->bytescount)
@@ -1092,7 +1092,7 @@ static int acp_dma_prepare(struct snd_soc_component *component,
 	if (!rtd)
 		return -EINVAL;
 
-	if (rtd->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(rtd->direction)) {
 		ch_acp_sysmem = rtd->ch1;
 		ch_acp_i2s = rtd->ch2;
 	} else {
@@ -1125,7 +1125,7 @@ static int acp_dma_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		rtd->bytescount = acp_get_byte_count(rtd);
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (snd_pcm_is_capture(substream)) {
 			if (rtd->capture_channel == CAP_CHANNEL0) {
 				acp_dma_cap_channel_disable(rtd->acp_mmio,
 							    CAP_CHANNEL1);
@@ -1190,7 +1190,7 @@ static int acp_dma_close(struct snd_soc_component *component,
 	struct audio_substream_data *rtd = runtime->private_data;
 	struct audio_drv_data *adata = dev_get_drvdata(component->dev);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			adata->play_i2sbt_stream = NULL;
diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 97258b4cf89b0..eafa6262e6feb 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -132,10 +132,10 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 
 	spin_lock_irq(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
-		if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
+		if (tx_mask && snd_pcm_is_playback(stream->dir))
 			adata->tdm_tx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
-		else if (rx_mask && stream->dir == SNDRV_PCM_STREAM_CAPTURE)
+		else if (rx_mask && snd_pcm_is_capture(stream->dir))
 			adata->tdm_rx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
 	}
@@ -176,7 +176,7 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (dai->driver->id) {
 		case I2S_BT_INSTANCE:
 			reg_val = ACP_BTTDM_ITER;
@@ -224,7 +224,7 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 	if (adata->tdm_mode) {
 		val = readl(adata->acp_base + reg_val);
 		writel(val | BIT(1), adata->acp_base + reg_val);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			tdm_fmt = adata->tdm_tx_fmt[dai->driver->id - 1];
 		else
 			tdm_fmt = adata->tdm_rx_fmt[dai->driver->id - 1];
@@ -318,7 +318,7 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		stream->bytescount = acp_get_byte_count(adata, stream->dai_id, substream->stream);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			switch (dai->driver->id) {
 			case I2S_BT_INSTANCE:
 				water_val = ACP_BT_TX_INTR_WATERMARK_SIZE;
@@ -379,7 +379,7 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			switch (dai->driver->id) {
 			case I2S_BT_INSTANCE:
 				reg_val = ACP_BTTDM_ITER;
@@ -444,7 +444,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						SP_PB_FIFO_ADDR_OFFSET;
@@ -464,7 +464,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 		}
 		break;
 	case I2S_BT_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			reg_dma_size = ACP_BT_TX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						BT_PB_FIFO_ADDR_OFFSET;
@@ -485,7 +485,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 		}
 		break;
 	case I2S_HS_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			reg_dma_size = ACP_HS_TX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
 				HS_PB_FIFO_ADDR_OFFSET;
@@ -538,7 +538,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			irq_bit = BIT(I2S_TX_THRESHOLD(rsrc->offset));
 			stream->pte_offset = ACP_SRAM_SP_PB_PTE_OFFSET;
 			stream->fifo_offset = SP_PB_FIFO_ADDR_OFFSET;
@@ -549,7 +549,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 		}
 		break;
 	case I2S_BT_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			irq_bit = BIT(BT_TX_THRESHOLD(rsrc->offset));
 			stream->pte_offset = ACP_SRAM_BT_PB_PTE_OFFSET;
 			stream->fifo_offset = BT_PB_FIFO_ADDR_OFFSET;
@@ -560,7 +560,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 		}
 		break;
 	case I2S_HS_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			irq_bit = BIT(HS_TX_THRESHOLD(rsrc->offset));
 			stream->pte_offset = ACP_SRAM_HS_PB_PTE_OFFSET;
 			stream->fifo_offset = HS_PB_FIFO_ADDR_OFFSET;
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 4422cec81e3c4..35cd4b2b86cf2 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -112,7 +112,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					SP_PB_FIFO_ADDR_OFFSET;
@@ -131,7 +131,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 		}
 		break;
 	case I2S_BT_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			reg_dma_size = ACP_BT_TX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					BT_PB_FIFO_ADDR_OFFSET;
@@ -150,7 +150,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 		}
 		break;
 	case I2S_HS_INSTANCE:
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(dir)) {
 			reg_dma_size = ACP_HS_TX_DMA_SIZE;
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					HS_PB_FIFO_ADDR_OFFSET;
@@ -199,7 +199,7 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
 
 	soc_runtime = snd_soc_substream_to_rtd(substream);
 	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		tdm_fmt = adata->tdm_tx_fmt[stream->dai_id - 1];
 		switch (stream->dai_id) {
 		case I2S_BT_INSTANCE:
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 4f409cd09c11c..d4b7355a1d989 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -192,7 +192,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 
 	stream->substream = substream;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		runtime->hw = acp_pcm_hardware_playback;
 	else
 		runtime->hw = acp_pcm_hardware_capture;
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 3419675e45a98..85f9fcbfe822b 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -450,8 +450,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			cpus[k].dai_name = cpu_name;
 		}
 
-		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
-		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
+		playback = snd_pcm_is_playback(stream);
+		capture  = snd_pcm_is_capture(stream);
 		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name,
 				       playback, capture,
 				       cpus, cpu_dai_num,
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 87a4813783f91..90b0716e5f2f5 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -253,7 +253,7 @@ static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int
 {
 	u64 byte_count = 0, low = 0, high = 0;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		switch (dai_id) {
 		case I2S_BT_INSTANCE:
 			high = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 7bbacbab10950..256271a270286 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -193,7 +193,7 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 	if (!pdm_data)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		runtime->hw = acp63_pdm_hardware_capture;
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
@@ -206,7 +206,7 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	acp63_enable_pdm_interrupts(adata);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		adata->capture_stream = substream;
 
 	pdm_data->acp63_base = adata->acp63_base;
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 2f630753278dc..0f253912f032e 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -228,7 +228,7 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	if (!stream)
 		return -ENOMEM;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		runtime->hw = acp63_sdw_hardware_playback;
 	else
 		runtime->hw = acp63_sdw_hardware_capture;
@@ -270,7 +270,7 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 		sdw_data->sdw0_dma_stream[stream_id] = substream;
 		water_mark_size_reg = sdw0_dma_ring_buf_reg[stream_id].water_mark_size_reg;
 		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			irq_mask = BIT(SDW0_DMA_TX_IRQ_MASK(stream_id));
 		else
 			irq_mask = BIT(SDW0_DMA_RX_IRQ_MASK(stream_id));
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index e7f2a05e802cf..8debcd2487fe6 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -86,7 +86,7 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	adata = snd_soc_dai_get_drvdata(dai);
 	pinfo = snd_soc_card_get_drvdata(card);
 	if (pinfo) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			rtd->i2s_instance = pinfo->play_i2s_instance;
 		else
 			rtd->i2s_instance = pinfo->cap_i2s_instance;
@@ -110,7 +110,7 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_val = mmACP_BTTDM_ITER;
@@ -163,7 +163,7 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		rtd->bytescount = acp_get_byte_count(rtd,
 						substream->stream);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			switch (rtd->i2s_instance) {
 			case I2S_BT_INSTANCE:
 				water_val =
@@ -209,7 +209,7 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			switch (rtd->i2s_instance) {
 			case I2S_BT_INSTANCE:
 				reg_val = mmACP_BTTDM_ITER;
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 3a50558f67516..0a6d63db2e52f 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -113,7 +113,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 
 	addr = rtd->dma_addr;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			val = ACP_SRAM_BT_PB_PTE_OFFSET;
@@ -152,7 +152,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 		addr += PAGE_SIZE;
 	}
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_dma_size = mmACP_BT_TX_DMA_SIZE;
@@ -222,7 +222,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 	if (!i2s_data)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		runtime->hw = acp3x_pcm_hardware_playback;
 	else
 		runtime->hw = acp3x_pcm_hardware_capture;
@@ -261,7 +261,7 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 
 	if (pinfo) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			rtd->i2s_instance = pinfo->play_i2s_instance;
 			switch (rtd->i2s_instance) {
 			case I2S_BT_INSTANCE:
@@ -334,7 +334,7 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 	if (!ins)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (ins->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			adata->play_stream = NULL;
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 7702f628ecd68..2200c4f5ebfdd 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -126,7 +126,7 @@ static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
 {
 	u64 byte_count;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			byte_count = rv_readl(rtd->acp3x_base +
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index c3b47e9bd2392..0bcd20ec70a6e 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -215,7 +215,7 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 	if (!pdm_data)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		runtime->hw = acp_pdm_hardware_capture;
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
@@ -228,7 +228,7 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	enable_pdm_interrupts(adata->acp_base);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		adata->capture_stream = substream;
 
 	pdm_data->acp_base = adata->acp_base;
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 7dbe33f4b8678..9e05816d4f5c1 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -101,7 +101,7 @@ static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
 	adata = snd_soc_dai_get_drvdata(dai);
 	pinfo = snd_soc_card_get_drvdata(card);
 	if (pinfo) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			rtd->i2s_instance = pinfo->play_i2s_instance;
 		else
 			rtd->i2s_instance = pinfo->cap_i2s_instance;
@@ -125,7 +125,7 @@ static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (rtd->i2s_instance) {
 		case I2S_HS_INSTANCE:
 			reg_val = ACP_HSTDM_ITER;
@@ -249,7 +249,7 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		rtd->bytescount = acp_get_byte_count(rtd,
 						     substream->stream);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			switch (rtd->i2s_instance) {
 			case I2S_HS_INSTANCE:
 				water_val =
@@ -297,7 +297,7 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			switch (rtd->i2s_instance) {
 			case I2S_HS_INSTANCE:
 				reg_val = ACP_HSTDM_ITER;
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 491b16e52a72a..73b4d879bbfcc 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -108,7 +108,7 @@ static void config_acp5x_dma(struct i2s_stream_instance *rtd, int direction)
 	dma_addr_t addr;
 
 	addr = rtd->dma_addr;
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		switch (rtd->i2s_instance) {
 		case I2S_HS_INSTANCE:
 			val = ACP_SRAM_HS_PB_PTE_OFFSET;
@@ -146,7 +146,7 @@ static void config_acp5x_dma(struct i2s_stream_instance *rtd, int direction)
 		addr += PAGE_SIZE;
 	}
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		switch (rtd->i2s_instance) {
 		case I2S_HS_INSTANCE:
 			reg_dma_size = ACP_HS_TX_DMA_SIZE;
@@ -217,7 +217,7 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	if (!i2s_data)
 		return -ENOMEM;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		runtime->hw = acp5x_pcm_hardware_playback;
 	else
 		runtime->hw = acp5x_pcm_hardware_capture;
@@ -255,7 +255,7 @@ static int acp5x_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 
 	if (pinfo) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			rtd->i2s_instance = pinfo->play_i2s_instance;
 			switch (rtd->i2s_instance) {
 			case I2S_HS_INSTANCE:
@@ -328,7 +328,7 @@ static int acp5x_dma_close(struct snd_soc_component *component,
 	ins = substream->runtime->private_data;
 	if (!ins)
 		return -EINVAL;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (ins->i2s_instance) {
 		case I2S_HS_INSTANCE:
 			adata->play_stream = NULL;
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index ac1936a8c43ff..0d08e734f0db6 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -154,7 +154,7 @@ static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
 {
 	union acp_dma_count byte_count;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		switch (rtd->i2s_instance) {
 		case I2S_HS_INSTANCE:
 			byte_count.bcount.high =
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 72c4591e451bd..74ecea36e3dd5 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -191,7 +191,7 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 	if (!pdm_data)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		runtime->hw = acp6x_pdm_hardware_capture;
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
@@ -204,7 +204,7 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	acp6x_enable_pdm_interrupts(adata->acp6x_base);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		adata->capture_stream = substream;
 
 	pdm_data->acp6x_base = adata->acp6x_base;
-- 
2.43.0

