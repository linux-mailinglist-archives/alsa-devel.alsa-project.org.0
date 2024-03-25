Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F999888D56
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E31211C;
	Mon, 25 Mar 2024 05:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E31211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341942;
	bh=DPuUeCd7Dpr/sJnSgppSnAxf+rBYlwNnr98fPzNYNbI=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TBPd5+m0ZOpPPx737IDFAKymPTbinHt+UtG4FQc1x4IpuCvc02+HoAJU2G43ZhyW0
	 CbeHuJET8sCRAKd3kzf7oohVjVxKExKaGt8HbmmGC6Nxfiz9KDcJV9Ag4OtuAxj3Ta
	 0Birl1xTc7G07Ivyz0stemdCzVJC520fUDgvusg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BFEDF806CC; Mon, 25 Mar 2024 05:43:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 610E1F806C7;
	Mon, 25 Mar 2024 05:43:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF7A9F802DB; Mon, 25 Mar 2024 05:37:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 18DDCF8015B
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18DDCF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iTvGYzVe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfMzxY7ebRhDvSuCCbiwYAIA3JAuzg+e0sB/qyr2ZrfjTwXuYoKvrREIryUANd1qSfzXIyT2qeCwqO1GSLr80kI/Cv6K/tK/IA+olI1vbZpeaWiS3Hh0OyAyCcS7sA8sOErhVvoxCbQL8At+eXgWIj/SEQi3Ig2mItoCS4oxk4ZQ/s3LDle4umWr3VOLo6j7meuhz6R1amnWuyirfgAe1pj4l8ympjVEAgNPdkoMwWPNqR5xJzK6Xs3yAn049nKHz+AEP2yPn6v2+56luk0UDuH6dYIvGetDqplIgHllDlLd5HS1yUCLvh7EQjXiyh8UBBCUSAAiMR6OoTWc/bh3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRJXtGB5f81kKSYvRKorDfNJVsGy+dRrmsrbI77stwM=;
 b=hOnSEJusWPV44utBUJN1gpyrtJqpywGxqrkv1JRG4c5nR8yqydkm2+KhfHl9wsAbWDkTyo63fe/AamBVhcsGSY6BMaSipqKrx/8AD47OiBshrJLnDQqMyBx5rKFPV5nnkax3yiX1UnmUwsJmhWGwNmTLi+UH887+p4jP7dOv4ZK03DOlFRhdigp/gtncvQqUpQ4mYtvyo9t3kIIX+LczcXFI/2grh8QE7uPu9O9Dl2jORQ48/ly9O57D9qCaR5MDnHo0Eog6qLf+VD+jIsHAa3LEEpwW3yHIpF4XNDh2zTadin8mjySAyGiZXfckCGm9iiWpXwOhNUQQ98Iaq73/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRJXtGB5f81kKSYvRKorDfNJVsGy+dRrmsrbI77stwM=;
 b=iTvGYzVeVD0QuYgcqMmHiN7K/FrYzEEwxodHF/Xa26dGVrAn5wkfeGKdW56MAaHL4HD0TxwRGl21itruhMZPNyQ/HpEPBGJfxdV/Sg6Yyqn5/zUgbjFzXOp4Nu2vt55BgAZUSMA/WNYAy4Kcum25BA602T/+hzz+kSfYYPxkhAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9512.jpnprd01.prod.outlook.com
 (2603:1096:604:1cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:37:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:37:10 +0000
Message-ID: <87a5mn53m1.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/15] ASoC: soc-core.c: replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Mar 2024 04:37:10 +0000
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: ee36fa4a-5c74-4efc-66e3-08dc4c853c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WkQdv0cmqKAxY/b0Vj4LI/bQco0gcj0bM/l3oD/lEcC1g+ormZwn2djYYa4eUxTBlzHnNq6JBhE3K/bDw7OFFIzPyJ497ys4AFgxL1p6oisEIDmw4pNU+jjI3n8w4YCKU7Cu2HCFKNxye6ykmbz3BDdS7y22JJs0fvKwi9ZePREB7b7na9nVyHUKgt1nXR+8QaIUCnMWWfU7BeJ+ZFlzsvGfJ4XWu1bcift0+JylplspnZDy+Mfe0giJXXg9ujpl6osmf8jZCkqUhxWnA4LRtRVDSbVEyu3JGME1u0iV7dG9x2X+bwturJXxjOqvVO96yXe6ViY+LmlrbB8IgPVJHYG+TFBd96wPkhGsRqTneT3V4CLHSfyGsVJpzGLWWU6pER7u6ewCQ1w6H/6tYkb7dj5qNclU0UNQM8r/XKnZBoAPttYUyeLAQUJPD0ztRjsjnGysEpBg3tKa5CoyRXvA+3uNtg5u1K8rUWA7TJ3x5pTajorhAua++OJyj/7AxAPwyJUurNCuVWd5Mgl95PZB84ikqoLQHJDVApoRJFhNwGGSUXoxadFrOgltMxisaCEsOMa0BAo2n6WWGc8NTjt8fvs+ZQ2cn/0YF1gfeANc42NCS0kD8hP3fP1nV6nruIcORqmP6BPoefmbG6lHnBH4gYhv0oa+mFn8xZMiBD4RLZOtcrD98gbb/WtJcU35OxWFMC0lkzPNc/sQ3K1OGQyS2wtk1Ip/hhyAJctmj/X1kP0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?8ozDHpS31hUoXhlvHbBC3/9LrQKnAupav5YfUgQwat8l9fDK+xQi16v3B5?=
 =?iso-8859-2?Q?kj2z2AY+k/R8uph0C/JPn48zVyhEItj+GyOsmIbGDsvRcKxVM8/5j5ZNGD?=
 =?iso-8859-2?Q?KdH5GSjXnxM8qsWI5RfOdjcFBe3lXS+W8cGgnv6G6BC1XCkrZ8ZVlUfCqI?=
 =?iso-8859-2?Q?f+527m2u397Rrvd1UAsy1FKxTtTqCR4OJOHbACu0omYhwLjnft0gxzpvTT?=
 =?iso-8859-2?Q?5pVKlQFs2pMnibmP8Zc1oTQWn0hqi8IdewEhsaV9RP8jLa66rAA0rYVxE8?=
 =?iso-8859-2?Q?BcI//ras9/MIiuh4MxzODN0bZXa+XiBg/LTM5HzpIi+A2ZQrfBIUmjZp9+?=
 =?iso-8859-2?Q?7w589RkhPC/WbhhL2ySsi3V7Na8/hfrQBuk5Of+qy3KUMkaIm+OAajKDq9?=
 =?iso-8859-2?Q?T6QInaJI6JElmrakwY2utP+vU0c14VcCTYpOaoNMwo25e57loFXqtw2it9?=
 =?iso-8859-2?Q?LoyL0XDGtA8hwQC/g0DizWM7Q8ysezwbov3dydRAIuZuYKIv4XXt5JklwI?=
 =?iso-8859-2?Q?ziXnbbOxdMaz/SbqfCD54l/+YXg9C7hVj1TBcnaufZCTbMNE6rnCcUlc1v?=
 =?iso-8859-2?Q?462YD4g7NPFY5E4nUKXI2Ljx/D+KTxbnyCbgx0FLnKLK9zbg9v3V0GC23U?=
 =?iso-8859-2?Q?mRs5vihGnDJBe0fXyjItavhk98cgonI4Pwr46yjvCVyUIacuSnow+APlcc?=
 =?iso-8859-2?Q?6Xc7C0IYfGbHBL+8RKDgGJTLYkFNZbDk5wNqBr/71NchvazI+hK1tYsvoq?=
 =?iso-8859-2?Q?B6eN4P6qPOhkbeYDnp3EevnlqfxG4qJ4ITamrbZ9h1JtwtKGscDJSrLJz5?=
 =?iso-8859-2?Q?yM21fuFBCfsAmjpidXMtu7lYCvB0oiDh/s2/ph3fTB1d6wKC0bX9DJ0WR/?=
 =?iso-8859-2?Q?DAWA7X38NrGfivgpH9txyhauxDQ87BIm7Ncce7z3o/ciLJRupOjXXbvVEF?=
 =?iso-8859-2?Q?3wNQQAM/RNsNJ4RIBaG3Ol0Km0vtmaR+9TiizVcEwEu0HgOiWVmPUsh3qK?=
 =?iso-8859-2?Q?EC6GDpJl6k0NUceEN4PY/3K9RXLdWBzAN8+0R3wgc7EAexiZ87hb1SEkRC?=
 =?iso-8859-2?Q?lpSKVZYQcdK4zXj55AqjA9rKUF7Su3xR5gzh3hijAWwkegmlX4ODYEXnx2?=
 =?iso-8859-2?Q?himBukXOy9r0JILN98vskjba5rPm9pi3NWxNpVK5JiuO0+/GQ4drhbLzwk?=
 =?iso-8859-2?Q?zlc8m6sLnERuTQ7nnkLUdVYmLkCLgnnW9zMq3vNss8LBuJlzuBSdj8WZfc?=
 =?iso-8859-2?Q?fULpPlUZSWut6JffsbUgpbB/DLFzFRiPHkHvVOdWWf05SdQWQmmfS/CS7q?=
 =?iso-8859-2?Q?u3wwNARF/20rSJXvX8KRD/Z4C4Gwq2xXuQvPYnuE5aIVTrmouek0SMZ7pj?=
 =?iso-8859-2?Q?NDiBUWQanOirDpweQpnEIeqN3tBZokWVFyORTxpM7z8bDdQOJDcACxY2GF?=
 =?iso-8859-2?Q?Em8W7PQOIlhSEIW+0jA5N8sYFlfjvo2Mqh+LwZI6hbVQeCIWcIhU8gtvUn?=
 =?iso-8859-2?Q?YAzxgiG6YHec5+VhCVZOeZE9JFBUYcGP+oPtOn/ok22SDY6GG4VhSAjOmi?=
 =?iso-8859-2?Q?tKT3m3a4fJe1gM1+no3ARNLKLBrNFAzjR11MiKtoTCOrFGTsosVApXVQjQ?=
 =?iso-8859-2?Q?DC3fSsU9K7b5lvGRQiW5HPMQVo+32V2aGioOI6J6t0hsyDht5j/rO62C6w?=
 =?iso-8859-2?Q?pSQIp4Ei1x6vyZmRURo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee36fa4a-5c74-4efc-66e3-08dc4c853c5a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:37:10.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wLVMJJkzbtWDooup/o4KXmTftXywYvl7zyWG03IXftDWgm1+5sN/sqtnOlBFzKQ/qxqJEV9zAnFlLaJn0XFjnzj6nvdMW/HlV5WkTUdUiVn5ezzdh1MQTgxJ/VEb7VqB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9512
Message-ID-Hash: V5362HMQB57AU32YR773SA265B4N4DT4
X-Message-ID-Hash: V5362HMQB57AU32YR773SA265B4N4DT4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5362HMQB57AU32YR773SA265B4N4DT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2ec13d1634b6..20a3b9f127e1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2000,25 +2000,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *=
card)
 				dai_link->platforms->name =3D component->name;
=20
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm =3D 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_pl=
ayback=3D1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_ca=
pture=3D1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback =3D !dai_link->capture_only;
-					dai_link->dpcm_capture =3D !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm =3D 1;
=20
 			/*
 			 * override any BE fixups
--=20
2.25.1

