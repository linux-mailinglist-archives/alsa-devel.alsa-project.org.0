Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2B9AD948
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E08FAB65;
	Thu, 24 Oct 2024 03:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E08FAB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733403;
	bh=L/Ifk+4rDHrAjBuSdnTX+AwcKJay0F9vI64u1oiqIRA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i+MNW96TgibXiUm0I3d/rw+rX1mHsIJ7+skhrw73ovGOBTl3X6cXbm27Qjj1fXS3I
	 r0f3z4Dj7/SFJxtBs2156S0mpufjrSN2ZtfEAPQGVsToi7eAiei/GeMJI58McML6di
	 ECkqrXl+x27zavuBkqw3HIvoco7u9MKIwZnWKY5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1BC8F805AC; Thu, 24 Oct 2024 03:29:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E754F8057A;
	Thu, 24 Oct 2024 03:29:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A4AFF8023A; Thu, 24 Oct 2024 03:29:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 399F2F80154
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399F2F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fDgi6C30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCSHfYF7FwM2hVOaJRyUGa0G6Wy3FEB9grw0JPwZBCuWiSP9EoeTubFe+AWClsEjEm9xw8dVCZddVdKqt72Y05auiafBdIBQHujLnobB0J6VvkFVTweOUPIxRFzA/zxGZvIuwFjdWAXx5iSwtsHFhsvJXo769qiuU565INqlampetQqh3MrZhtatRoFR4UlXTshMCl6ByuZmQ/pVZ0Ir4MgjjmKyS8YK/zKmLp737fYGq/qe76KcKWQcCOhAFhWZM7/+eOcx0+wOxRH/jcp+7/2nIPceJEBxkkTM1w3cNM34/A1TWIhbIm303rStn+90YEzNTgTOSxHLYh4BcKiG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxdb/PisWW6W+5EcyBGHBgXtLISL/Q0j3ey79Fhf5fY=;
 b=f8A1DDzrEODZZNS1h9PIcbEkpnEl8rL1XZOm2uPQdkBw/5fR3nFpdmFv0s36uu5M/8e5ANMQq2iecRyXvQMRmhbLYlEi94+ko71qhX95FkuzeiD5wi13/CTvXrQ+uMrHE+KqVKhGvgEJpKYEPXL/aNutRCmW9IG3ARTRipJb3eeOyXI/GjkR/khN51EnXRUl5FKwacX36jb2TQMYtyPi97T39RzwGoMysJez7aFujDVGekP2Wm+aa2d3DcejuEtY9y00Thx2aoQhp1MPbV/7HQTRwAJXCG3z45RFE1OJr0TLbYoVECZ64A0G+y15B2kRnxiBnXg8iFeU7uxiXt1Ptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxdb/PisWW6W+5EcyBGHBgXtLISL/Q0j3ey79Fhf5fY=;
 b=fDgi6C304v08LXOTDK4TNxvXe7HQWEv1VCdKk1KkUiHky0Ty3JqYB9iKEyW6jf+DkGzOTPe+2PHNPym7erHcbFAp3VdiBVgyvIpt0diK2Emq0BEEMrdN7NtORNUgsRpcPWLs+ri+HFjvHaiprO9wvevvycdIYyndxxX6bJnBdZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:21 +0000
Message-ID: <87y12eb85r.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 2/8] ASoC: fsl: switch to use rtd->id from rtd->num
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:29:20 +0000
X-ClientProxiedBy: TY2PR0101CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: c96e5d44-010a-4469-2521-08dcf3cb491a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d+6HXpEw25TlSDo0wd86qfloCNOqL4TZ0wfBdp3nDt6TbFwYEX9/gZUmScWY?=
 =?us-ascii?Q?g3vj9HDooOhHGTzCs11+Bg5GvjGdhJjQxfnbiCU2p5HbgzdNkKSJHbRWrgqx?=
 =?us-ascii?Q?XgOUB1ySmkwwWaeQofDcjlDmEA56Tl0GcHqft/QvhGPNIO3NyS+QFjV4/oyP?=
 =?us-ascii?Q?hvCHLpsO9TuG9X6WiWy8p6rOGPpjh4eujpWhhBi9+MG9IoTEsF2uoTfe5KSY?=
 =?us-ascii?Q?HwklKQiTIQo50EYn5MwhyD1qNZ5wsZCu0/HOYMZ9/LxO7i5nz8RKy3R28dR0?=
 =?us-ascii?Q?GtXL/svFWP2vuy8k/3GMbRfdGIjZuzCEl4YEGysqWDIYLOXuU0eKEqXpwI27?=
 =?us-ascii?Q?hVPHnGNghHWyvg4/Wyhh64DWGl8DmYpe4+qoFS9cu9JaHw26U4XN7VDUBNWN?=
 =?us-ascii?Q?DzW7dc56zPT9IRVblbBXCLvUIpfUMhHNw9XOC654MjP6Y+kPQO8EhHbq//CU?=
 =?us-ascii?Q?3VfQtUfKnFpOpS95iscUZO7zuIH1AeCMZ6b7t5hLyHRnRgaapPNx+52ZXQsN?=
 =?us-ascii?Q?VAD0HrtWNfqKT18BJeTTHomAuCwBJU+Z+MBxMCG1NfUPa8n/nFo9vkG6QhIC?=
 =?us-ascii?Q?WEH2mC3lfh6SksV4ca/7vE4tTPPKcm8gp3qt9JuYwmHcr4fsq7tcpfpNVXi9?=
 =?us-ascii?Q?kAMOL/eqssK15ccJiMLnT6pXhSGKTTQZonglolRHJL5aFKV7aRtq742bYlzS?=
 =?us-ascii?Q?cYi9wn8REkrFevcHHRJFiXJwF5vhwq5Wpsfdg7d+t1uXm9BC6SNx+xVPrvaX?=
 =?us-ascii?Q?o8xYUN/+nOuYv4tmx2n5ue2IgirpLXW7BWFdZpfOWWO4dErtdhrGkt1XO9ms?=
 =?us-ascii?Q?pKvNHZgLJ7ztouMRs/Pa5MadHXV8/k+B/wwYFmsMyqef+MSoaZfk0VHvhII2?=
 =?us-ascii?Q?nPKCDjHuzJZL6W3pWjR0Xj43vF5hiWq/T0If18P9NRTWSULyiUw7m+rAKyRZ?=
 =?us-ascii?Q?dBAeCdSW5j3uxkg58cTk0aU66yTDNhL7LEmjdrcaVgKy79D91DD5KQY3FeQ2?=
 =?us-ascii?Q?PvUsytFU3oOeCFYvpUdmYmqXTBvEAYI2qNk2IGJAN7zX+nAN9r0vSp1iW7re?=
 =?us-ascii?Q?lSzEgwm4VpILljqTIgl10d+lZiMYkfZeH7+Rp9WSj2pe9J6ZVDcD9ocgbUVB?=
 =?us-ascii?Q?vErqzVW56/7qIEY9h3JxyXSj4u+HJBUhL+8oGPQOQLcrXvtjjaw9WUGks94f?=
 =?us-ascii?Q?YgWDQ5L4lmygkSSc5fDZA91tp1LrJZsC9Q1UXL9UaDT3Kfgn3avqQLoY55Pb?=
 =?us-ascii?Q?UQODjRnBlhHZLx54+a+i6Tuhjk+EuhP4wO1GNEhXE6GC3QeokHRhPatK+JFN?=
 =?us-ascii?Q?drlV2q8mtHDlR0gfzifhRQ9s99j+JIaDnJn+cI3H3AuAddrxcV+YwwQl6nk4?=
 =?us-ascii?Q?J7bb75jq0WDP/APISC3VgrKgcCKP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ms5a+3uu2t5OFqqE3pvset8b6HEvjDYhpJPWb3MGTtckC/BfAwYU8zWwh9uQ?=
 =?us-ascii?Q?25Kf1sR+OXcBHF9BHd46wZpqwmEOJyopcii8RmMaX1gROA7Rim9mr+lSiYAk?=
 =?us-ascii?Q?zPySDIp0VjpraxjIoXsp9Ha6HVwLnsp0V2HSRfEUVIcLhRzUN+6WYZliYxYi?=
 =?us-ascii?Q?30Esku+LO+v/I6rqwe7H3/bNgWGLHlKHQKPnZoR3weosz18aB4xsKp7OF4P0?=
 =?us-ascii?Q?Ft2iC+2W/N20ZZQ958Z+Q5+BUnnzkdu/DXV1ZcnVa2pBK6dLw2wTlQ3hJlHm?=
 =?us-ascii?Q?tODrCFcnUHG65A2tnB2Gv0zb04r8DKVADQo2L4yDAhCN0qQENmWKeDjX6+Dz?=
 =?us-ascii?Q?+YbRhYhavGZA06A800ttd4PPuYSTBJ2/GhV1Z/uDRRj92yPI84sSMVM4rdGZ?=
 =?us-ascii?Q?eE2GwBLWqGjGDwqeahMCbS2X1QSwnPbGO7DbHSHoiiN5iGaw8SX4ydulfeSK?=
 =?us-ascii?Q?CkQ/LHDwGXdH4TfApKfpfb6kqvSAayXdAEoOvptST60GoBmXhWHRKKK4wDPB?=
 =?us-ascii?Q?ptzoGws185dkNXGkkUX1ns/mS/Se2e0BGQUw0lRZHuT9x73lPJrg+FjOW496?=
 =?us-ascii?Q?kNaj0DFjGFA6tzAMEzk1kuo2s5+dhlrUAj5GtZKXzx1d6JiSdqa0kfbS4K3K?=
 =?us-ascii?Q?cFHsmsowMisRzfdVSl84LtDkiN+smuAFItIzQB43cEIX2Qr8YcnsFwQl0nOh?=
 =?us-ascii?Q?cDWz2ixxIKZ15MuF22/Dcb9J0j626EsPVFRejf3vM4ZHQPVcW3SuOodeh5/g?=
 =?us-ascii?Q?mFI90v4rIVTKs5mF39p0QD9ZQ1mNMT3dhX6j7KeCIujwltwKEtU2l+b58jFg?=
 =?us-ascii?Q?nrpZ/uNlPrgu4cFesSDjUxwsCyxnHUmLTiovQtUtU6vsImhIWkYGdomu+Kdk?=
 =?us-ascii?Q?7/2x+983coY0mfJm2L7shESTZWbYun7GowrD8vffcQoxxZI910Tt5467/PzN?=
 =?us-ascii?Q?vgXquqxjRpCzIWtkE/aIKEhcpjABJ8HgunDrdDsXeuZrz10Kk3xPknqvK3tB?=
 =?us-ascii?Q?wNh2CT5qUnIIBdUjkA6LTi+enVkjJKDKi9ALN83d8i9e0NqkrFnz8lQqVDFD?=
 =?us-ascii?Q?xmCJTTTuhISLnnZ5jUkJOsUIZvp+NYFWs42bkcVx7o5gd5wkumJID8vjz8ZB?=
 =?us-ascii?Q?6evTjDywJjo9m3ZYN+YvgvJSyZqd9499s6kOmyjjNK4jpz1lw5v5RRAMmLuR?=
 =?us-ascii?Q?3XxMpg/vK5igElb72Ti0P4rIQ6WVDZt13JoM28JYgKKtFpDixlgl5Q+OfBuX?=
 =?us-ascii?Q?vRXzPQM7solS2g63tfgKcqw4wRBM+vDD0mYosUOJPKDr3CvRNoHP+sTFuV3V?=
 =?us-ascii?Q?/27mf/Cp1EMJIQk1kzftkkkbRSUXNk62H8GozEHy4FqMLK3UadgFlzKaYHvX?=
 =?us-ascii?Q?jiEjy2iizdK59/5BkpzMcOVDrIdetG1U5E2LH3gINPul0PM0IZbPhLURrnzA?=
 =?us-ascii?Q?uuVzaqq4IeWpbqtzWSfLTlJgitEIYTAWPDLhsjnSYVeaw7HHlKhil9SyoHrl?=
 =?us-ascii?Q?ZB2vH09py5KUyt66zmGbx1TksuR/Lowx+j+19qQXFXVnS6gZ+lZEibLzQrX3?=
 =?us-ascii?Q?fVC0JDXXy+c2bFr0Z7zMO3a7bZlJxPg+W2yS7VrKdFZVXab4qH/v5Umw+RjF?=
 =?us-ascii?Q?l26mrpACX6WuH6IwggRKt4Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c96e5d44-010a-4469-2521-08dcf3cb491a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:21.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RbyGMHXfNtbnGpOqhj+F1EQQ5sqyUgoOECuxNKoH3AlgOwwFZvHUHYRDOBa6NxY2QqT5R84bYdGhCFheZB8hEzAurpZOg9q+7v4uodsHYKRl1/AUOkDrg03FNuUC3pLq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Message-ID-Hash: M7MG3R5RTFCKFAXHREJDPL5SSDP5FZJ4
X-Message-ID-Hash: M7MG3R5RTFCKFAXHREJDPL5SSDP5FZJ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7MG3R5RTFCKFAXHREJDPL5SSDP5FZJ4/>
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
 sound/soc/fsl/imx-card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 0f11f20dc51a4..95a57fda02503 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -275,7 +275,7 @@ static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_card_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct imx_card_plat_data *plat_data = data->plat_data;
-	struct dai_link_data *link_data = &data->link_data[rtd->num];
+	struct dai_link_data *link_data = &data->link_data[rtd->id];
 	unsigned int width = slots * slot_width;
 	unsigned int rate = params_rate(params);
 	int i;
@@ -313,7 +313,7 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
-	struct dai_link_data *link_data = &data->link_data[rtd->num];
+	struct dai_link_data *link_data = &data->link_data[rtd->id];
 	struct imx_card_plat_data *plat_data = data->plat_data;
 	struct device *dev = card->dev;
 	struct snd_soc_dai *codec_dai;
@@ -435,7 +435,7 @@ static int imx_aif_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
-	struct dai_link_data *link_data = &data->link_data[rtd->num];
+	struct dai_link_data *link_data = &data->link_data[rtd->id];
 	static struct snd_pcm_hw_constraint_list constraint_rates;
 	static struct snd_pcm_hw_constraint_list constraint_channels;
 	int ret = 0;
-- 
2.43.0

