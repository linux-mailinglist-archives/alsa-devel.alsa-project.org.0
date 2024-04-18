Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859538A91DA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F63FDFA;
	Thu, 18 Apr 2024 06:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F63FDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413701;
	bh=YVxxdhcsHQXh5VL017QkFral1s7wACj+4XyqcnB9fW0=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=F2fJ6z5g0Ywcs9mgytH/L+QvnXekExUnqeEiTKzNv5Ud7okGFsm6cRm47Coquhr6l
	 1q8tktroXanzbSoxezXon/WBJQrBsArw+xpZj2biTML87hwVTTNt+kySfyrUyXqam/
	 SyFsfxboMNxnMaPIjLMLLdn24YInd7bVFx8ZUpY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDA71F805DA; Thu, 18 Apr 2024 06:14:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D17D3F805BD;
	Thu, 18 Apr 2024 06:14:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED44F80589; Thu, 18 Apr 2024 06:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0017BF805BF
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0017BF805BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YejqV/Ys
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d842Szy3u143wZd/ckgDiwnr7f4IM+/fhM/nSvndHnH+nJ/S4t4vpr9jAYvaXJqS39WcDv5YEDvKJAqTqPwsP2HrRoMmHxCeIkoNhDLFH231J3b3ZaUaeQciv12k3iGjDXdpzT4mEE2r1aFJ/EhqTfGdeMfN2G9amtLTEXk5xqyVCpI1wVBzfSYTp4IR8AtRBLyvlVdv1cHyJQsVyaETi6Aimc0ZgFhR9MgETMdP/eQo0uTkJxu7J7PHn3+SG0MXH6EdH2WBcDYP9s3GC4oA+oz5a8AHZztWHanm0nfZOCHtTYnosNLJFZojvfv+fYmm9Feqm1SblH5OHdO42gYE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBlL+5+aQgORxspXuZ3PMztQjyniD7+zmAzY/t9sA8M=;
 b=ikK22jzXoeQb39WGRvPwxHuClYbDX39Sw8RkgKBU+vM7TXG9BV3IiTrDNWnz3h/AhgyhK91j+7cBvosUT+QTmo3convZAubYOBUwQ9gPWR5B5qG4VsHpMPCyjlEYZVhUsk9EqOAOSSfIRv0KK9vlKv/8bNtYTxdjZRcmzlHE5vx59atrUDZ1FF7bQ3ruNfhQoqfosGC6QRRjRsoGRHQ/uR/Mbe1yj57wlFHJvoJuDh+GX9PkENRQ+HVjfMVdvLvfhpoUOy7Mox1PMfDe7njhA4dJWp0kXJQsxRJctcTb3P4T2z2gCIFPvLuQs0RgPCt0M3gyvRUfU0QtrsZt7czZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBlL+5+aQgORxspXuZ3PMztQjyniD7+zmAzY/t9sA8M=;
 b=YejqV/YsHGjOhE6FQp6BKjvrb0X+aNyBKQB1n04tSwffmgKlZrA0iTwJv6vljwEDVQzBaSKqaiY5kArmLzHW++Hn8cWU8dw9rOrcf5Bsr1JsAhUINQcZnHE2xqC3LCuimd2aOS189HHchci+GOqQJDmFp16ChR258b9uWuuXBGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:12:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:12:44 +0000
Message-ID: <87cyqn8g1v.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/23] ASoC: soc-dai: remove
 snd_soc_dai_link_set_capabilities()
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:12:44 +0000
X-ClientProxiedBy: TYCP286CA0361.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 8343c1f4-547a-47e1-b097-08dc5f5dcc6e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fuYgztyETMSi8xfPt2uLtRU2ZQhvrXU9LX2vdGYMd9kh5g4gaoUHnFAaVoViJK5IFeeaTUDjRD91Ozu5JAkAMbpop5g3tCJGzP7zt7RUgHkB92/Pl3zAV0evZ2yy1o/8cr76ABuLszhQ7mPD6+LiULZVl5oWE4VtqZ264pIOQRzBTdwDzp7PZ8eQUXVNlgZNVO7Mq4dAQbUyTDuA781f9eDtFoXX/G/8KcOLyOY4ocDuLgUzbTJZUOaHjWA0a5bczp7FTPmUilouTOISQq4nAmObOSXZLdBhKbHMNUagRczkVylssOOY0v/xRjLcvxVsT2COXagAIY8gyHovF78uglBTcN4T+BamKz/e+FqpteYawTc6lX6wMA7W042pPovTyjl4VKL/BAcNK2448hGMHr/U5gIv2NQTS8FaBlo+zcFrsCC9Msq7acYucXWqHHodk5FeKW4QzHPUH2ahyG2cIfVmLCk7S6s0KW5I2Q054+YCY1EDS8nwQ1du9GcQ1PoGKmFyZnHg4PnanVif/ux/Z9QmzparWMhttqG067qj9dr5qCgB4s4+t7SEh0a83NCNVNHkzRdRSs9CiBceNzB5cFM78dLkTi6CiGgUux8HqFKQVlKg7bIK9iBObQ8DHysDDFg7ONbm42lVtma+sPXJNRwocGVJ1Ke/BSpY0bJQ8qsEnIzPJ0dXJI0EDkAAY1KzRcW2rpMNKQpVaGr9+yGURshRnC/tFe/Vi7l6vRqpdAk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ngl3BgskdHY5Vl+UG6d28TTr9Q4xThr2JlTVvm2wNa6ItVS0VejOG2ZZ/auj?=
 =?us-ascii?Q?7eQImZaFSPUv/zqXwn+Qqhue/0O+DBOpi9CJC6F4putIvW1LPR7t/0M/YBzc?=
 =?us-ascii?Q?Ml9lE3eCYlH9gNA1Xl+fZYZjfa+QoKlsXO1TRj2SuGOsakx/CKwBYC0hg6o+?=
 =?us-ascii?Q?31Tqg/vQvP7q0AQ5mtXutgov2SR25oQ4B0C2b7uxrPjVCC+NOmBdjevfTn32?=
 =?us-ascii?Q?t7iS++NVxEMEO/qlPGPLFvkHr+5u/HsBmWcEJjNS+Qrwb+osTVRjUlX7vkdI?=
 =?us-ascii?Q?1S9GlLoWR4beZCcbcF4xk1Ch2d56WE+t4Z6B/5i+j+vrGa/9c7MZ32iiXdBi?=
 =?us-ascii?Q?H9IUEoEEI6im5aDtYNc5t9Y85wqCsKbPkZoxGrWMJos4SD1SAdghxIUJ1ukr?=
 =?us-ascii?Q?LkZcReQSbSreNu5ITZ4beTvaGmbID293C6iQ8v+gKIf/nc3hVE0U1EW5fnXN?=
 =?us-ascii?Q?o8N6Wz7fm1Ch05CEZMjpVpyPaGxzsPV8TxquKTSEOPGwlKbSbu9orUeEJ/3T?=
 =?us-ascii?Q?mTeEyheq4vKEsymZrstvdbUgiN2uz3mfZDDJSP9A6Sysc6RtcFh4Qalgyp9r?=
 =?us-ascii?Q?B3vCI0hlCg5s6QXyJUOZ1knZ8rdW8B41gFQoDs41dWQTgrfkA0zEyJ6V6nx3?=
 =?us-ascii?Q?lttjjsj9I3iL9yEMX/9aycp7B8wmq0trFIM3vQzw0fE8zCxUnskAnNvna7NE?=
 =?us-ascii?Q?E5c67zwHc9axrVegxLl6hAmguX05yIflqiSlq7E/A/0zoLXWOQegiQ447QKT?=
 =?us-ascii?Q?X1AWKLlS/htypPfsVSj7bfA2LbHtX/Yer3krKA2BvydEv6PZzUz0qhv3t+yH?=
 =?us-ascii?Q?/PT+F2PA3WMmHvfcWm0r5USAyGx9Vco2CDj2etDq8+dzHJVA3vOG2er3Ok0k?=
 =?us-ascii?Q?1rQKJkccmEDxER0NjtRLrXoXwN+fDBydcton6m+Mm4lLwzdAK2Pab+imk4X3?=
 =?us-ascii?Q?FuB1KuPjVr+mS0PcXnMmakrTTspPzt1ddEjdCEiXsGl1iC80Mo2YTiL/oepy?=
 =?us-ascii?Q?0iBKKNhXLlUOQ9wbbu0Hg8gX7e/4dTCoGgwXMsJtEV1zFldcYR0DdsQG/o1m?=
 =?us-ascii?Q?JxaUZ+UKuoODMzURFbbyBKHxc1B0EU59rqqRaHdyOhlU0jAH8gWxGqaSSaOs?=
 =?us-ascii?Q?VnG+WrE3CJZU3M3NJQeB0bnNd2/bO4P3W1AcKWEmCzuogQkWocxSjnW2Xpnv?=
 =?us-ascii?Q?AL4GxS/bZ+cZDSuC6VllJOfZitbjrsIwIpF1l90kz0SC0ZEu4gKZQisR5V4v?=
 =?us-ascii?Q?/vHaCKvNlzc6Lx+yS2sVwrUz82cRYONv4L8V1dq9jct/zZC8tzr6vzbmf1tv?=
 =?us-ascii?Q?pRZtZE/6MmoH4hTLYnSSLhhb+mKqNklJnLf5ACIwSpXjiU0TG1Jb9KgBgiaV?=
 =?us-ascii?Q?vIL3Nnb93Z/XLcLv55NBeENek+fMO+Ti1188PnVDSf2SDcx/eFO92aNGRAWL?=
 =?us-ascii?Q?TVEEtWVMerr0EanH11vgkurznCZV/kXkmukeH6lP/3U5OoLYatrqb3HRmIgt?=
 =?us-ascii?Q?nZPSJNIGFYlw22TVxMZnbV6uczPLvIlmfre4nYTKoABJ8L/3F1wsjYhNIVS4?=
 =?us-ascii?Q?V2FvjYoKn9E30ls/nZaLsVFHTn23tDCCRRQ6VzDNf/OXfZ+UalFe+UsOHpiV?=
 =?us-ascii?Q?oqhKWyRgWWq/kC8qi1L+pII=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8343c1f4-547a-47e1-b097-08dc5f5dcc6e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:12:44.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PxPJbOwKJhg1vJS+Sp76oNV164sQpXLd7WxekRe+1MKzXKOD7jLAS7x26YLu2BvdxA55vIAcZp2oyj+uEtO7Af7CXQkaBDY1m+HAkPZmvevwaQKC5bsoVnaq8QSay13R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: YQ3VB4A7TMC5VRVUJ6TXR4R3N5HIYATO
X-Message-ID-Hash: YQ3VB4A7TMC5VRVUJ6TXR4R3N5HIYATO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQ3VB4A7TMC5VRVUJ6TXR4R3N5HIYATO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_link_set_capabilities() checks all CPU/Codec DAI (Y)(Z)
for Playback/Capture (X) and checks its validation (A), and setup
dpcm_playback/capture flags (a).

	void snd_soc_dai_link_set_capabilities(...)
	{
		...
(X)		for_each_pcm_streams(direction) {
			...
(Y)			for_each_link_cpus(dai_link, i, cpu) {
				...
(A)				if (... snd_soc_dai_stream_valid(...)) {
					...
				}
			}
(Z)			for_each_link_codecs(dai_link, i, codec) {
				...
(A)				if (... snd_soc_dai_stream_valid(...)) {
					...
				}
			}
			...
		}

(a)		dai_link->dpcm_playback = supported[...];
(a)		dai_link->dpcm_capture  = supported[...];
	}

This validation check will be automatically done on new
soc_get_playback_capture(). snd_soc_dai_link_set_capabilities() is no
longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h               |  1 -
 sound/soc/fsl/imx-card.c              |  3 ---
 sound/soc/generic/audio-graph-card.c  |  2 --
 sound/soc/generic/audio-graph-card2.c |  2 --
 sound/soc/generic/simple-card.c       |  2 --
 sound/soc/meson/axg-card.c            |  1 -
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ---------------------------
 9 files changed, 51 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index adcd8719d343..69ba1a628eab 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -219,7 +219,6 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
 bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
 static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index cb8723965f2f..9c7e24cebd7b 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -650,9 +650,6 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
-		if (link->no_pcm || link->dynamic)
-			snd_soc_dai_link_set_capabilities(link);
-
 		/* Get dai fmt */
 		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd..714ce1f4a061 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -246,8 +246,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 62606e20be9a..0d2ac4c9ba3d 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -925,8 +925,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, rport, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9c79ff6a568f..5e66812ffadf 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -276,8 +276,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 3180aa4d3a15..48f14c28f79d 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -338,7 +338,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 			ret = axg_card_parse_tdm(card, np, index);
 	}
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index f1539e542638..7edca3e49c8f 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -107,7 +107,6 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		/* Check if the cpu is the i2s encoder and parse i2s data */
 		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 747041fa7866..24862002e82b 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -145,7 +145,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		if (platform || !codec) {
 			/* DPCM */
-			snd_soc_dai_link_set_capabilities(link);
 			link->ignore_suspend = 1;
 			link->nonatomic = 1;
 		}
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index fefe394dce72..f8e46bec6f80 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -479,44 +479,6 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
-/*
- * snd_soc_dai_link_set_capabilities() - set dai_link properties based on its DAIs
- */
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
-{
-	bool supported[SNDRV_PCM_STREAM_LAST + 1];
-	int direction;
-
-	for_each_pcm_streams(direction) {
-		struct snd_soc_dai_link_component *cpu;
-		struct snd_soc_dai_link_component *codec;
-		struct snd_soc_dai *dai;
-		bool supported_cpu = false;
-		bool supported_codec = false;
-		int i;
-
-		for_each_link_cpus(dai_link, i, cpu) {
-			dai = snd_soc_find_dai_with_mutex(cpu);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_cpu = true;
-				break;
-			}
-		}
-		for_each_link_codecs(dai_link, i, codec) {
-			dai = snd_soc_find_dai_with_mutex(codec);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_codec = true;
-				break;
-			}
-		}
-		supported[direction] = supported_cpu && supported_codec;
-	}
-
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
-
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
-- 
2.25.1

