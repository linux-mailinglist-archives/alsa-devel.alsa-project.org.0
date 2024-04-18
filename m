Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7508A91F9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F30214E4;
	Thu, 18 Apr 2024 06:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F30214E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413963;
	bh=qcYzY4a9tVbIqSyKQZYyzVKaRVSXtC1XTW0nqd/xf1o=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PI/KaJgJI7Ml7BeO537WLGBaV0bKqgiLAmCdeuCbGzRmYrP1ej35ldYS83z2xTxS4
	 YyCLwHt82wwZ6Pb+j4cne0kevR1KB2inwgsdleEwn1YPsJ7i8Sl8TRfWiy/VEQined
	 poOMQsljK40r59tvMcsqH2uN5r5HFH85gyyGlqDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E72F80615; Thu, 18 Apr 2024 06:15:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3982BF808C5;
	Thu, 18 Apr 2024 06:15:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C584F807FC; Thu, 18 Apr 2024 06:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AED2F80717
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AED2F80717
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pZLjyj6v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgKqXSbkSZfXMLMOr3rXRkphIIBvik+eCgtud8bpKXEdasGLJf8jnA8L16yMJQiMd6DOwhyHYUxLvCilSbzxu46Fx1MpzyxionXZlJxpdJYFCT+Y88tYsiLvRI1DlRnCyUq3qp+CWaHZeFZU4wzQrQZPNVfJiQ63j3/SxYG7SNUmrGhiYUjCb7Sw0EYDbfA6/hhWFuOy3inYdqukpdcXGkrLrqLyH/duGoAMh5VsqkPNNfADAGCHc/4blxfKcLoVJK+OPzwfMiV0AyAWS6HA2a8mhz9CUS8usp+h67Zx/Nk8d9PaY/cigsIHo6hSJbE1Ed0osXB82tnGY9wWOe7GJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9PKZ2elLyKF2hu4yo1yAX3p/asCfWw4MF6E6/ASqEA=;
 b=aaJSmpKJaQ8NRij4nngdLG5qG4kEd8dnUEzLZSuPxibm9QBKoyzFqEh/hxonwpnlq6ul4Q7cF7pxaFBjlG/0+exdeuS8cl/F3ygxBQwLGG6lpuVh/L4+Oyit4N9GHlpHieazygVSUTRNssdng3sczP6mYvcmnKOvVmZqmbuCKtASpwZvxWTtLScluanu2fs63jc+eyo0hTtez9C9CoFvVbtl5i4VU+rGqI39LxpUYlpk9BT7sX7jI4AD4S99Hq1syf3v7EUGL1hcVEJUTnhkh5WMXefbzYCkS7r1Xf0DIKXNc3Z2Nxk5RWyMzuzvmhiLQCxHn5XN0YDC99WDQNgFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9PKZ2elLyKF2hu4yo1yAX3p/asCfWw4MF6E6/ASqEA=;
 b=pZLjyj6vavVRRf6sYYq0KaykTVmQU2wCy1qQDoE0Ma7ycxR3SPuhLMSQ8lgY+7/m2NvEwCg8uTlu3b56x7EN/Bkf2P+Thr4Buwf+udZ9SxbjPvjpz8yveRbtQOTtVHVuyiOM3F8pue3hkUNEUrS8sh6ALSWbHLmVvTTyiC9U1SY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:15:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:15:13 +0000
Message-ID: <87plun71db.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 19/23] ASoC: Intel: Replace playback/capture_only to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:15:12 +0000
X-ClientProxiedBy: TYAPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 37115666-726a-40e7-6404-08dc5f5e251a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x+x1hBdcFrruJt/iTqCvinFEJ6zFYbCY1/vrW9hNXKcCH59ieVnqUo7NA6hh5e4rgQeES1du8haZCd2umRl+Urk3/Dsw73EeDJYP9LglaBCrA4cSwAjtA2O9t7ddCTZx+zdl/HsMo9KFyH/eKvfIJTiiNpDqPcYPvKcm/N+tvfNMRjy3MbsH9lRLIZ8Z4SzSbha0vF4vaBiXeo91GiNW3Zw/G7HH3GczQH1eoFlNJDYancmuMNy8ldGhuNSKlvbD0sulfllg5Ni2DkI6lmI+6GXubhKBgXOEp3RsoTMaF7DB+t1YGFlZ2eDRb9LlQbml4PKLUfeaZJi4ooKUaLDMH9wx58BM0LdsCSXzchC012qJ80O96b4cqC4MHvln/+C02Tvn2IU5Bw8NyyjbDCmC8QcabxV77cmsf3oTsJU+02gQC8BFIrolowjxWGk0iWiDOSFcqGJ4zOd0g61Pe7GbXyULEAgzBLmmY4MYZPCMobrw13q4Wzkxi262cwzKMDRm3id0Ohi1MvGkaaX/tY9zMvqRffRh7E0oOd6+fSC7O0Sy++KPMtEYavwqSKqd9baqFa5V4UDfXaiROH/X1Xws44A6mKdwHxsEPpPNLNsj/n3KLJCchEUFM59n657Fwg51U1AHPXyV7rN/gwvXsEw8WXxUAWEyIqA7uPCVU2ylIxjmIeqIvqGSRWLJo0Mk39vXIncvc/WEqkvNc/p3eL8FzomBkplU2vXLZSkLiEkJFzg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wb41igkdHRjeViaki8VGTjh1beBJOPouuWEZZALxJfFZjGGxB8jMPszOmVSU?=
 =?us-ascii?Q?IqDMkCfc03hZSTlg+O1uI7MiVhHl55/BkI4LynZgpqlAgyXcB4dLbcvlM1Wb?=
 =?us-ascii?Q?Fhn5EuQn9dFmn5e3kgzoHF5kE4RMQxmrgSznXhXbkWjPyjabYefmMpTRXJh5?=
 =?us-ascii?Q?/SZGSTkeYgjCpm7fPosbax6C21INvHaVr5Rpn9ttw8sQla4ta/zyab2kt47d?=
 =?us-ascii?Q?ERCPsOoCa1lXto4oHk7e4uD0uLU8OA/OU3qpFitKtBeAwKP/ACdnJslm/kRm?=
 =?us-ascii?Q?5QoGfYFSNdlHTp2es8vidse/c7SLcs3Yy3kIndyjOhxTx4NvGWtR5rk10U6G?=
 =?us-ascii?Q?yrSQOztYDlPtiQKTmV56uLFs1y1PEfVhrc9F67l1FulVzoCjHllE/BwtChcZ?=
 =?us-ascii?Q?u30bejb2D4YDD2TY8R0fAeXcg9skwRFZUsTB6lhEmp1AH/qD5Yc1MKaJ1/7n?=
 =?us-ascii?Q?K8evaaQykDaOYHAzZYq0dghgI1HuLW4qlyVXsQ80+YwDoLydRKzkOn1Y4kRD?=
 =?us-ascii?Q?jNvatyOe+otXLUXW+WZ7HkbLoxOWY1d4qg9NsOo1vZpCXBqx1P6IbDCF49gF?=
 =?us-ascii?Q?PisAnpbKQLNfliADDcuKbVquMXQ3ilY24D30/kme0HzI0vdprL62/jP+YAcU?=
 =?us-ascii?Q?gU96Zg+UmG6D3xx81TlA92G+LLuwXiXLrcsVLqzQcMSLjS1RHAuCfE1FOOOE?=
 =?us-ascii?Q?l6u2xgGtYYUiQf9erQ16gcJhALuMbP/VEOFUEZi6ylzePyMrs8B2mCPxzOAr?=
 =?us-ascii?Q?NFKGw46ZBOKPgHO9kSmWrM6HI8S5YDjHV2r2kT1keE7C8d6aS0JvGrZVAiRG?=
 =?us-ascii?Q?qWip4bR/R5HC7vmJCNHsugkAqdakqG/Qm2XiaAhMjzDF9N4mQgwajnQ4r+Qn?=
 =?us-ascii?Q?AAYDSQqqrcHKH/9WmZg6YgDyCojoEvzbJkhukNNuvublTIr7rjgKoSPbKYsL?=
 =?us-ascii?Q?n8dv103xo3lYo80qjop/y8qBCZ32GHcM9jLeY6+dFllKLnn/7LwS5fc1fcwP?=
 =?us-ascii?Q?0HfEFF/uxEXTnnYX4hirrByCG8KuVgmaUXvLBT72L11r9wD2/ttjA3YExrI3?=
 =?us-ascii?Q?P7OgTynN0Ha7GE6boF9hA3U5PraYXe/1EicKl4iq9HH6BdLado3VGYi0ImRo?=
 =?us-ascii?Q?6NOYwwuJDoIXFSDY6rtHXXOL5Ew3yNPRr07y1J4DrJFPKCofTBUgcu6H0HT9?=
 =?us-ascii?Q?CY1lOKWLTouvixmMRC0XuMaWANeqrqxlMd/H+Rul4Iut0koKopbYd8Uo8Lf+?=
 =?us-ascii?Q?ON8JVa75sv77w2crFjFejwMlERfPk3m0RwUNenhsyoHfe1jbsciysRBbX+6K?=
 =?us-ascii?Q?GIxPmK9Et7ZsnyXK4Ps2vvKGhWpzaRBAjQRQ6f2GD/iJdIZ/1CTBLThBdXY3?=
 =?us-ascii?Q?88PcFxrJb2lCgT624h+rwvoG1Ck8kz70G9tjWQGammbZjKF6nCe/d77K0dtY?=
 =?us-ascii?Q?iAqBjA50Tq/CMUSSTSfcvtwebKMYB9A0A/QwJOg7qgALIpq03VxjAsS8/DKq?=
 =?us-ascii?Q?QVEAELqwE9raYzn6kbuC3LJDECLsAb9+Fz4tpd+lFpY4pl2ZSxbQ5LajNCmT?=
 =?us-ascii?Q?W5Y1jRV7xVg3pfB8PN/aFaeeu/yvHxfYPcEQ7mZIPL3Ko6YRxA1L1368RXoR?=
 =?us-ascii?Q?jG4EjrLimMWEdMpRvuAbRmw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37115666-726a-40e7-6404-08dc5f5e251a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:15:13.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Mv5fDwlMyL3qiX1dYvjpr+Yzjw8QGCl9Q6oumYwAH+Pna4j45KibKK6z8CQSs9DQ93xAhP0KYwE9OCzTDUM/cHsdGejWcsumgMmcQOTfmn5z1zlvs6kVlJU4TcQFN6nT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: PUGLNZAXPNEAUSWBPU7T7IZHMBD2G54B
X-Message-ID-Hash: PUGLNZAXPNEAUSWBPU7T7IZHMBD2G54B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUGLNZAXPNEAUSWBPU7T7IZHMBD2G54B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts xxx_only flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 54e3c5d3c251..9170b1d509e2 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -339,7 +339,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 	{
 		.name = "Codec DSP",
 		.stream_name = "Wake on Voice",
-		.capture_only = 1,
+		.capture_assertion = 1,
 		.ops = &bdw_rt5677_dsp_ops,
 		SND_SOC_DAILINK_REG(dsp),
 	},
-- 
2.25.1

