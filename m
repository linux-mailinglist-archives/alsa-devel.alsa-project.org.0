Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E33A590E0C6
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 02:22:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28AC6E64;
	Wed, 19 Jun 2024 02:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28AC6E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718756536;
	bh=WpIJ6ZhUxErQb6XvZacBe1atFhcwAn+DXnHQaipq3mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SwuzYZM1vKQKIZ/ZojUjStTcxywvmdXW0xPJo04OA7N2Cg2c3AS/abrxbNjMWu43y
	 yzFKbnzqW088pzAVhcl/GME45OqaURYT5WGqT3qMCtSvoMlc6HDbiABjgSVLn8g7kv
	 qYmT0ZYtwQLF8oG7drENIVWuTjLHaDFEibnqa3nw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AC4AF805E2; Wed, 19 Jun 2024 02:21:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B46EF805BF;
	Wed, 19 Jun 2024 02:21:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAE3FF8023A; Wed, 19 Jun 2024 02:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AAABF80578
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 02:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AAABF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oj6OspYO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiPwKvKV8UUuHIOY9GaqG+rq2x53IZshu3wE5hw/cmgkfhxRIyuXXAb0XqpeDOHgDNZhdvIpMl4TX62MCFb8yWOYcCvzVGek+TliSzjeSotTOTEvU3ENgXtENCq090cj0PJpePbkRPWs9Df6eQvqGWua4tiPJADF7D8l5Ejo3kM4tuY/7gc+4YlDZ9GRFn0M74+VBxrW8ojBulY1vR/oFo48L/BGjkAnKEsPVaLrCYubs/eDlv6L48LfM41KayZP8Jjl52jtpkXHUzpK0R1eZYxvQgsQDphoZTPF7ApDbVg9yhCbve+dXfeJjxySrOiZafgzVFW7oqJ68cL0wpESPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaFNNbDVUkeUlT59hSm5rDwQtL6OcQB+NfUInbzjlSg=;
 b=Fhidx0tRcAS47hUYFU0Rk1ODu60Wgslp7rM1LvCUEDcyhsGacWfrcsVk8QlKim8KJsrJl1jHdhDnrtUJcweATluid/nxFTma2FA0z6wdD1FHo5+E5ClU8I4Ma79AqwvA7iq37Uuj+Ahwb6Ah1FoogUjKu4fux5RajChr3AEg5H7UJGPoEo8XLrW2m/6j8byrsNEe3OFUU1DvJXEQ9SZg/MdCUEpHFQs5a1vlidvS3bUAXUrekWXW7FsrdF+2JRxK2exS1hqdXACpoYI8dS5lRYWbJPA8JgbLQMdFTDXDT8SF5LTOMdsiJ0aY/NpIuGY7MjUmuU8QdRvkMMtNedpaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaFNNbDVUkeUlT59hSm5rDwQtL6OcQB+NfUInbzjlSg=;
 b=oj6OspYOM5y9d7yGhywmCEzdCn3r9hCbH8LZUr46Ip7GnmIHcNQpj1aOEBHr1it2oqMWWtEt5Y70mR9bOfPwcqtmiDXRpsi2b7lt8GjGSHFI0DPvdSEEfvNXRftbP8ddw1ZAqXLYVpmCXHZ1SzTb0s6lKdPG8L++yvczfybS1oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11717.jpnprd01.prod.outlook.com
 (2603:1096:400:37d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 00:19:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 00:19:45 +0000
Message-ID: <87o77xwzq7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 2/4] ASoC: remove snd_soc_dai_link_set_capabilities()
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 00:19:45 +0000
X-ClientProxiedBy: TY2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:404:a6::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11717:EE_
X-MS-Office365-Filtering-Correlation-Id: 8652a5dd-f7f7-418e-063c-08dc8ff585d7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dADJWioGNHdvK18jMvFxu4Ce1Q1Tl+gX14qRGMDgoSU3VDOA/zMrdqTcz4g1?=
 =?us-ascii?Q?BG7PO81Q/dAvwizt4K8gOggKQF53fjcaOiZ29WrbOVW1uNuyqWY089hV9hNC?=
 =?us-ascii?Q?aSXafJgDLOmxD+LoxMX3QQr3cbbrs9N22AaoElygA8+HnXKbmJOJkROWAdJc?=
 =?us-ascii?Q?nOwsGvQhkzkDYOG/6QicJX1h984Fx3Nu6YHyosCNvzNxZ4w8lLSVC1FIVyJK?=
 =?us-ascii?Q?zR0AIcrzEzdWFqmHlDUaYq2H2PzCHzDGXbg19JIjLVisiZv2Dtko8Ld267A0?=
 =?us-ascii?Q?W0UyvsqhdvJEF+0EPxCiX+SZ+cvVQGjBIXmKRPsw9jtp3Q1SRBGEUgQZKY7I?=
 =?us-ascii?Q?2AaUKNrVuM2zaSSaZlGgo1pQkMN1z12MsG/mqcJHjGcJoeH342KZMgr1LZ4b?=
 =?us-ascii?Q?0iakhHkF4PD5TneNJ9QZTFz2vfD1e9EspH3K+l9RTB3DZuDhLlPS3V35Hyba?=
 =?us-ascii?Q?L7T9zcrSUM6U/Kj18bmuZTb3REWd/H0oW4x8fRYCb2j27ALxQAYHaVhvH7os?=
 =?us-ascii?Q?zuyipPAvKVvO1AAgYdaNLfaLY7Hg7msSF2oD/PEm61Smto8IoNAHWA6JF0iA?=
 =?us-ascii?Q?WuUjqBYIQJOx3lSQboJ3YM1KYF84+7ywiZiFaHEuPHn23wNfMvIBHpJOGnLC?=
 =?us-ascii?Q?e0tlQE/nTRMPYyMt6mW9O3GPBZAEMMQnaP/VwWRic08jFwaI5SVDWD97wT0+?=
 =?us-ascii?Q?M6zAVvTrqdxLhsE72HaJ7Ed3Hj0r6eghSayVxVeSmkjaEAUbgSIqmN2m0JF3?=
 =?us-ascii?Q?lIvDr5rTDakP6ZZH4NrYlvRtF4nevBz5MShx6VCOhVunoO/PNwydk6k5Buda?=
 =?us-ascii?Q?e+43Ib0003XN3Oyg0n3kOZGoUAUQUXHiF0M8znCLayBRbd7v6Rq6gEkpcGKC?=
 =?us-ascii?Q?YcJ+Yv4jm+PRvQJs9ZmNxJ64I18I3MOY+8M6sB8xSMwvkvpdQ92JOvrLL8qe?=
 =?us-ascii?Q?XbgzsPJtm7JUvqfkbqUNSg6Ky1piZPJHz5kZewBf+FaPbeBk4ZDYMGFNgS3R?=
 =?us-ascii?Q?yq82+xIhx7iFWJQIjgfXOpQIpOHGnzrZDvMi/sPpUfS60sygM7cxHr8zFIfL?=
 =?us-ascii?Q?dOPkr8vNMxTCke1J6P60xNLeMHvAJzTQx5hxaxfHlKW98SMZxpFP2311Czh0?=
 =?us-ascii?Q?TrlrbY0qHvdVXF0M+CqJUCrtVegVBdQ936JUKFhwwN1P7vUTjxQTLwYEJeYY?=
 =?us-ascii?Q?Loij8tW7WpC/Dl7PsdEtNItEh4anG7drc0dLKZieKO+G4fAGb5paQeNtE7va?=
 =?us-ascii?Q?MTVf8e0RgKODcijR2UTSviof7KXwsRgAWyXMvfPZb2ZCo1eYhPXCMJK7AtM4?=
 =?us-ascii?Q?mzjMsKogEEjNg0qF1CA72l5wUkIa6VM1eAgdnDzkG4rq6aQZ9j+nPtqx79My?=
 =?us-ascii?Q?O6t2ssqJBSMZkKXKvk3sBR1E7dS0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s4yWRmqHLV+ZxJyA1kbOnUTdRucNlTeBEnH7co+GClA9V88DAZRTEY9+WIia?=
 =?us-ascii?Q?bLqlB6L/RZ78GErBPSBLW9PO0ODYI9zu400niVT+Z2kzqX/zlDvqxKpHAGiK?=
 =?us-ascii?Q?vd9qVvo8DD7rbRsivFfAlDxjjh4nqR09hxX/jGAF3oAAdbWfKrifEmKjA2Mf?=
 =?us-ascii?Q?O34nMi67wOna6g18Zwi0tfQUmMvs23Em2yfXkL4xUPqG80RC66+8h/YWfe8b?=
 =?us-ascii?Q?vsnGxvEqzYdhRnlnH5qGkVfVzEjCofyUP6bvMxCU/+yqaP5KSJWdH0nOPX6d?=
 =?us-ascii?Q?qVm67jvK3+59Gi+RHy6ufryiLoVD7xtbJzddEhZT15rEcQI5pZDbHHVi9iiU?=
 =?us-ascii?Q?8HxtkX5u4Bfh9gCBF7+tkdRoJcYGhYt+xPF3dR47qGlvhTTIhSD0px9jG22M?=
 =?us-ascii?Q?JZ20iWjtO1okk/z8Io4a0Q4l09XhKQ7T9q2MHLXST9oLF0aoHjGPsdp4DNKE?=
 =?us-ascii?Q?7zlJ6Lfv4WJ9HdYOc8VFp9vH2NowhZ95eLAup82LanEcyrkK1/e1h01X2D78?=
 =?us-ascii?Q?DDGTvQ55xxcmjc3m8F0KQxFNsrXy1+KY22wNlIrl5BQJ7EzXwv+kn17dZOTu?=
 =?us-ascii?Q?Sgak0uU3xxfNptxr57K9IKfWYLxM8ZXYy6u5R0cCaXZImx/C+mWwUZAFOPh6?=
 =?us-ascii?Q?R7Fa2alB5dS9HxTmwyOiJOaB+wyA16JrgEVPh/JmNHP1Dz6QpcmB3FjsF+aI?=
 =?us-ascii?Q?dwiiGiW1121kAjQtYR5sBjRwYt2+Ug3av+ObbTmd0XEA1bifnOjsMLS3IFPA?=
 =?us-ascii?Q?CDCBp8vmrTwlU7XvH38MiQ+E1swi+AQcEuoSGieI2PFNWVgyuE5npFV4YKtR?=
 =?us-ascii?Q?+k95ZVW7IEbM/XeT0MIO3xlTZh2McfVrZRuWuGWl94bGFMZoTSehZYVVKw6x?=
 =?us-ascii?Q?XJn9ObptRcw3yKBHeCsuKCkeyZH9ko++ZXlxgzDtLKJmugigeQyKrLEIjjPZ?=
 =?us-ascii?Q?w0y0y2Fg3M7PvNkM3Kefp4MIrdHEjyzPdHqJD96e+KXCtBBAdmxFT+OjGrxd?=
 =?us-ascii?Q?5aaZO8jRb2bpcCPYm6OnCEyo5vUUUjffBb/b7bsVKw1TiLh/wQhR3pHaxoQk?=
 =?us-ascii?Q?mpt/MmK13811gVXHfe/bGH13eAD/CVM40kl59oBkmAzTN+FOMyVYHOGu1kaH?=
 =?us-ascii?Q?0fUjbAJFj8jeFCRazPUmMA8RuWZHj7QKvI5lJtaRzcw70hVy3Ul+w1GIPUnz?=
 =?us-ascii?Q?4VXQjfZdPCVlzBJKrvFADQz7I4A9oed+ZBKB8dgrVvkESEa5lKejTg/Mtv4R?=
 =?us-ascii?Q?FH7If+/lR708qNsGLxZspxSTYXObRvL9T0A1WqqBySiTAIWF5KBb+kTtSw2q?=
 =?us-ascii?Q?osVhDD2B6AJBDuYUichtzHaeIfTv66C8Fo29R2P8NEArApYBS0F/snKHt0AG?=
 =?us-ascii?Q?jqkYcOD1wtnkYvVcrEXKDA2STre7EGSpFG93w+JcVv+/Vzt1AHO3E3KAKDRG?=
 =?us-ascii?Q?LlQYqBonEAGEtT4FL8rwgvUo2pjgv9EYaJME+1048lzeoXPnqgukeVOEPX87?=
 =?us-ascii?Q?HSDLz2nB9cZOSC+Fs1saOWD8J6uM15Rd3KLeTl5IoPifA1L9FmX+s4Y6jBR8?=
 =?us-ascii?Q?y+pUUmnlFIBMqJh8faR0FpFLKv7SQZheqD7HWVgbUlACV+7km88/F2Gs1v+N?=
 =?us-ascii?Q?c/+n4XHPltX3rY4gLkLBfPI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8652a5dd-f7f7-418e-063c-08dc8ff585d7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:19:45.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8zz7zhIWeb7yHv1Ok0j7tkJWC3wnKEvFZ2RuGQ8g1kI0DEhPinEw+H+BA3PlEe79Qw3i1NYqgpP/1d2TqaAIsR1ZI+3KCim9NITa0LsjibpWndLxC1elvpJQRC6NBXPm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11717
Message-ID-Hash: YW34OUFTVF32EYB7NPUZ3ONJH7C5OG6K
X-Message-ID-Hash: YW34OUFTVF32EYB7NPUZ3ONJH7C5OG6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW34OUFTVF32EYB7NPUZ3ONJH7C5OG6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed.

We need to use xxx_only flags instead if needed, but
snd_soc_dai_link_set_capabilities() user adds dpcm_xxx if playback/capture
were available. Thus converting dpcm_xxx to xxx_only is not needed.
Just remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
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
index 279223c4ef5e..34594590db76 100644
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
index 0e18ccabe28c..98b37dd2b901 100644
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
index 7b981aa8690a..2495b0ca3d2c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -265,8 +265,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index be5a4ebfddd4..fdae0891675f 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -953,8 +953,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, lnk, cpu_port, codec_port, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 2de5e6efe947..0eefb348ecd3 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -280,8 +280,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, np, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 8c5605c1e34e..09aa36e94c85 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -339,7 +339,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
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
index 3d02aa3844f2..11cbcb588336 100644
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
index 03afd5efb24c..54348a055566 100644
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
2.43.0

