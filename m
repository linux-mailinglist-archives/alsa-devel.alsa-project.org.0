Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881509AD94B
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:30:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85B9E82;
	Thu, 24 Oct 2024 03:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85B9E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733438;
	bh=4KnzZrrgyi9oDhtflcKQiC9dDTsJ7UWHBHHBswiskyE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Mceq5BbNOik+gDxyhlnjoDwW9Zk6uLbZgHKMUAGP0opefqIrNpZT5m/h+RWrftW99
	 L7kGdlxjvnfrVsvxJB5zPJoI1wQlmGmZMQoAAtPmji9APgaJImFmQe0VZ5v+AH79QN
	 D3twPmJuVKfklZpQ7W75SHumwIuEn950N0g2qQcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E777F80272; Thu, 24 Oct 2024 03:29:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84762F805F7;
	Thu, 24 Oct 2024 03:29:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA0DF805AE; Thu, 24 Oct 2024 03:29:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10202F805BA
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10202F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Xgbd/m74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHlcosEYjDwOh+IAqvQBx0zXZPcXsTWoePSu0mFTKgSbxXGKoKRmnt3yQmmS9SAuPY+8bx2zzKzgGDebpJbhT2BiU+HKZZli/EPAq9HfIKpUVD+Q0S8b6/F83kEM2QK0ZaEWgWZkIW0NO+Dmh7a+lWJbn71DnzLcVqatEN+eF4ACZJDwEn6OwdOpjO6rp+5OBF6IP7gE3hOqT6Y+jmK3y54xa50/NqDhhOZzuyX+oF0kzQ7KbagolG4x2HcQojvHSZxrzMf9Pe+v5pEuLi9ZOlZ00Aj3phpO8AmVTrAHZlDzB5kU/j/i4ESzyLMvhXpd2faYkRKIr0O2C74aFop2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6CkNWQso7kXIHad5ftA0Sjh/fPNdbw0gIRq5i0bGwQ=;
 b=zB2geOy13zVM9d8wqQJH7f8EsEMXr/gAFDJiyOG72Ov8o0VlwrsPkeE+rLDgZ8vZtBr2jFqiwad36e2HRtK1lglYWqtfdeoNckc252W3M833ep+Qxyl4EC6WVvEvrcxS9Dw5Nw37f5MY0aTI5+B344HoW85jZ6wnOxEIDLR0Qha7tt2gJZjYcZBglWOsVASZpe/t2WW0N2pqsR5iTvaQ0fFZtN+RjWkgVxgv5qGC+6VNlSvSSZSf1VfOVwgE9JnnTffNGz5mxS3CTAmicQWwV+sC/7FeBUjzgn8NdDa3fpioF2HzOhX+cWL31/aCDuVERQuf1qh/Xil+5obaSJtyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6CkNWQso7kXIHad5ftA0Sjh/fPNdbw0gIRq5i0bGwQ=;
 b=Xgbd/m74UrCHJhbi+7opUknYtGjoCz/1+Lm+i7iG7716fwu2a2dl7DsC+huFhR7ea2Lp9FKXL48dMfqkBVeP7It8CN0tq8lMjfvdEm/sRTF71ocvJstcQ1vovx4NNU4PujFAq1jQ2dqripQxjdwk9MqwVRfTIJvXdo2Se1XTsUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:27 +0000
Message-ID: <87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/8] ASoC: meson: switch to use rtd->id from rtd->num
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:29:27 +0000
X-ClientProxiedBy: TYCPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:405:1::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ff83b7-a897-448f-21cf-08dcf3cb4cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GZw4wy7oZEAvzyMpWxgyjG5+YdmU61E7LBTrH9Ne83GH1uqoak3bdWBeV4xU?=
 =?us-ascii?Q?feOQejD1ljOKxlUD98GAR0HxxQ28fRgizOqto55pulo4FafFSru4+WutXBpn?=
 =?us-ascii?Q?02pQCRG1U+pC5WLjgLrQY0KOeD3YKzuJRUWnIzLI1b2cb/4a87AxAPqihTGk?=
 =?us-ascii?Q?parjOBFpJ943lrYfNT1ca3F8/+K60spFWiUBlYWobmACkR5nlFDcc0Tv38um?=
 =?us-ascii?Q?xmB+0zXiLlBZK7WR+nbldbeJz2aYKTqBaj5aEzs2y/wM+WElc5UnkEcVH6g3?=
 =?us-ascii?Q?ag2Ec0SJtXthEghoFZRWZXD1fwI1LrGWd6P7uNDOQGp5dDj8mDO93wdhhYPt?=
 =?us-ascii?Q?UI4NzpN2ewGiXGW8mWgDnwYTCmjliI24+3ITAHJCh9FyxexFwlCLcVSzWJWG?=
 =?us-ascii?Q?Ydtlw/8oFS11SAkDR8m2kYq5MGIAXA9zFWYfPonRm1cXBOHqeVBSylYgtnB0?=
 =?us-ascii?Q?OU1VsD7SlRnSiJBvfpR+jM+aY6YfoUSvukDAdyIJ94ozq+beScittN7IFF14?=
 =?us-ascii?Q?nDE5gc1nQu8rsmiDz3Ghx21FD62bamcq3a9hzaTkqYUJiKkfBgPgUiHwLNBX?=
 =?us-ascii?Q?ugHJlbyDgBfD9syuGoOcHiviiafoj14BJz8HZm+ffSx8LXPITgx46JLf+a+X?=
 =?us-ascii?Q?qwGhayzSHwayNWYKkppQFTNTFYwNiVzLDqfurPAb0F5+cm0sIkMwTpG6ktaD?=
 =?us-ascii?Q?1KF8usMlE68N8R50ik4Reh+1g9T8tKva7RAp2K9cPEMvXn3WOkE1itu7Fw/n?=
 =?us-ascii?Q?exFnYKFsjwNe4SUgFrwyI67AdO99pWaUf/y3KuviggMph6Qh160SjDZ4N5r/?=
 =?us-ascii?Q?SkEzuDhHI3ttN3IjaTdwggVwuMEU+ohmdOpjpv0HVvk3KlXdUj/SRHimKi8J?=
 =?us-ascii?Q?eH45e0JD8cpUepBGsx2HXIMUwPZV7IKJO6wkLY66AOAOin1O0/vsGZ5qENwA?=
 =?us-ascii?Q?uhRshd8/w62rCXz9XDz2OvmINbL8J/Kjpf5nFiWB+wv+osecsCzIrMxQ9gd+?=
 =?us-ascii?Q?h+VzbBfyt44Nm94bUWxCdHR+yBf1J9NlqjQPDrbDMKaqaNw9wjSk6DjhI4+Y?=
 =?us-ascii?Q?PC/YcgX+ztnnw0UF3I5JVVYIBQre0AnvF7sJzevimZtiOI9PDMh2QeIUqtid?=
 =?us-ascii?Q?o+i+4V9Abiyz2P7V+BRAutZtbWBXalptH443RnuWp3E0w7xKWNB511Ixyqpf?=
 =?us-ascii?Q?Utluy6o6erTlCsMAatglGR3JuI5+ccNt3pablObrhBg6zaEWxRmIfJdcseLq?=
 =?us-ascii?Q?plaYTjDWNqsbpVQc6dX2aLjvhjgl31F/uAC+f7i9e2U0f4QEjlOn3d+4kg2F?=
 =?us-ascii?Q?z7FNaV1hlONq/Fzt/aaE4DLVtSTSb+Did8zYJxveYTToWsY4E7HwNp/PmKHW?=
 =?us-ascii?Q?8exIL4gFxOGAQCN/Um+XfHafIQtG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YFJIbYfC3/C/BNqeroVJ19NNUwIvSgD8dgLuq/zNu6e1zehz8wsrKKWVbSRT?=
 =?us-ascii?Q?TOjPirz5r3IpUsp5IBvie6SV+VnkwdXPE1Xc2aXNX3RJr3uf78aSVmKvkS/4?=
 =?us-ascii?Q?jD8vn1tD3mZ614zSDWM4UBSYOxNgrTujyCPIR3GyHyawacYrYih+Q3iNMZ08?=
 =?us-ascii?Q?EBggmPEOFAmo0+/U5EFOwji2c6L3rOR+AeCZWqor6m0rPrIzNMkzz8dG40xX?=
 =?us-ascii?Q?HI3rMZwHj9txd7v3mfd2rzhiFPgSSjS74VmIDy5WcxsAcyVn6OFCOtoxLdqG?=
 =?us-ascii?Q?o2cYnYZjEsc+YE1DN5kemT0GiM9qK25x7VDCzjSK/uj3btMTqQFy1kdoEDGW?=
 =?us-ascii?Q?Au0EeDwyNCxPWRUVfkIIn/lzWjWZJLfLL/lGGciWeVJ6KimHSaD5Vpr0WSMY?=
 =?us-ascii?Q?PMB5jPinq+MEnfh/GRLJMc5NZn7JLk+AYeGLEq/bkKZa+G/hLXvOsTmmcO/s?=
 =?us-ascii?Q?iZbo8xngRSzavNrulubFNKnGAGTiQD6MC/BG5yfnfj/+O9f7bdZxYEdkBBCN?=
 =?us-ascii?Q?gTvjH0tZvRfTduIhnplFJ+3Xzn9xs16RsfmGoNhWV2eoUhIbign1wQg0F8Kk?=
 =?us-ascii?Q?GPm8iB9sLfKzlBUFmoIFDTnqDPH7vIuwS28s7Mk9pBNJMLYSV4Wb521ZWbLv?=
 =?us-ascii?Q?naIYENY8rITP1ahHv9IKw/nYKlEGpKqLJmAMCL2YN322P9qKUP3pGcKr23oy?=
 =?us-ascii?Q?HtYRfl9xzWoVk/h4YQIy7IXpwRKtzi8mjM8iHlyzVDKAnab2X4AE5R8d4UE1?=
 =?us-ascii?Q?1TImr1OmgSB//GADtK8dskr8I4r1xUzdNCe/lTj4PFg1ZzKExu4GYar4rWOB?=
 =?us-ascii?Q?cWHW6nu7gpIBjJrYFuOdVFap2pKjZWd1Pi49pePszASM6zPnojjCZ8w0dvDL?=
 =?us-ascii?Q?OrKMpdeRmgaq0DxWm3KddVfk6UId0lFYwdGdbdcizruf8pR8o3y5REuUymr9?=
 =?us-ascii?Q?hZzs6b5q14G4ntby5T9nk9QHUiuPA3yuyNqIXCZsnyCl7GDR92fJfmTio+sl?=
 =?us-ascii?Q?+8EBmqRdVuEBAGWraTsmcf+AasYIwGeCIcqdUIJSifhxgfNC2cfTVqmOTazH?=
 =?us-ascii?Q?yjk9NZWZszaBo8WNdbtC/MphqWhgps/WtT0iKK5A89cdjHtrDzW7UWwdPNvl?=
 =?us-ascii?Q?68EAymGv7IRhbnDz7ms9NxQ9I7Wch85QS2Hq6+xiBUd9vTH+2df4Q5u70pQa?=
 =?us-ascii?Q?o50LjISYPWh2YKhtNPBlZfQXStKdt4/JqR4UmItQ74qxXW6WawGAFdnJXuaD?=
 =?us-ascii?Q?K/mG9ZuUyQbskIy/+rmqjlc+Nf1r3/PZvbUrL6h+N0GjNYbMKzg1LkTvwNdT?=
 =?us-ascii?Q?KQws3KCLHFK6zGaf9E+QSTz1mzuF6RX/fSWeVjxt1oJ4ywJEyQKZQIWr/k4i?=
 =?us-ascii?Q?yX7CrEPku2wncmYO3CBZ6EwnLQ7dhm9WaTfCnKX3CM11aWkme5O8LFJ/AZUa?=
 =?us-ascii?Q?5/35IuF3cm0CHo0o/S42vCZaG/oERQHswUU0FQgFFzWOd2kwAm1Yl694G5wV?=
 =?us-ascii?Q?/Ogsac6DfKFm8P5KJJq70/vhqC39vXyWahnONjtSzE3xHSCYEP6JP4gQvYJG?=
 =?us-ascii?Q?ljtXk5tmTNy4JmC7I+tfCehjOMKDSZ7jgRCWwmUOPTKo0tPXeCSL11FOXBqr?=
 =?us-ascii?Q?5+Y+ouB0T2K89JoS7trp6rU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41ff83b7-a897-448f-21cf-08dcf3cb4cd1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:27.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n++L8d7tl/gMzl4KnwpWzCzRLSfVtmq594oJGTY1Dr5T8av/7EyPx7VuawcyoaztSyg9/cjdnr+PTVCwsIhpJg+pvEvhrG2SxiDFi4NpP0AbXjdbnN8LoUhvZGajDaxa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Message-ID-Hash: QJUZLMGDJGDL4UEHRQNIRNFT5B2JLTAY
X-Message-ID-Hash: QJUZLMGDJGDL4UEHRQNIRNFT5B2JLTAY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJUZLMGDJGDL4UEHRQNIRNFT5B2JLTAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now rtd->num is renamed to rtd->id. Let's switch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c | 6 +++---
 sound/soc/meson/gx-card.c  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 5ebf287fe7004..a2dfccb7990f3 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -43,7 +43,7 @@ static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
-		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
+		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
 
 	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
 }
@@ -56,7 +56,7 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
-		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
+		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
@@ -86,7 +86,7 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
-		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
+		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
 	int ret;
 
 	/* The loopback rx_mask is the pad tx_mask */
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 455f6bfc9f8fa..b408cc2bbc919 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -32,7 +32,7 @@ static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct gx_dai_link_i2s_data *be =
-		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
+		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->id];
 
 	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
 }
-- 
2.43.0

