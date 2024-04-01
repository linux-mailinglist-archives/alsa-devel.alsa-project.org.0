Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54188936A0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE93227C;
	Mon,  1 Apr 2024 02:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE93227C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931677;
	bh=Kb5pkeF0CI90BJ3b9+wMhtCx9lVGmjA8mRx8dL0Qs1A=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bMXv06sj0natu92iz0sBSQbTq5Vq+u7qN0ed3SilwZweLYTBrSDZBj2K67Y1zXTB9
	 ZhiLXuEvLokzrK1ubVkzxYetmVqqdVMvNd+zPH1aVJOeqHCCaa/VCn+KQqa3T2V4nX
	 4uDuEZ9kEZhfaVawab5x7T46PZDyHoYk+mQI1gYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24463F806E0; Mon,  1 Apr 2024 02:32:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E91F7F806D9;
	Mon,  1 Apr 2024 02:32:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8B95F805E2; Mon,  1 Apr 2024 02:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94B94F8068A
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B94F8068A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QVIpcJaZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJNVybP2cDX3YBlUmKZF+R+5dh95eUpzEY6tERz8zIBF+sTiQDKefOCsKQzj4SVnehrkzWST0Z7jsICt8Av4DbMljC0yVGd1s66CeQSZtsoHTm9YkHVtUgxedFrglV7CLhEEXjnpnABhs0ijflhUEcK7MOYIJOs3TGPTfT/Nh5cdpRd1t+nYUqs0lnFrDFxjgmnJ1lplRYW9sjLj2GKHuG+9gKYgk/2iss8hi09oc3WDa+8LdiWg0mI2tFwybs3rS0xcXUEgO6xzOv/lx6PHO12MGixuYtxOfp84upHz1uLCagGjke9M/yroLX59nyqg8Aa/aXW9F2RNIWdUn+YFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWDP8ULsMstlI4nvjVF/H42MXLyyhvNUt0zZ7n9Qjkw=;
 b=dBV13JtsdyaN4JXTzGur319L3JDUCeqgrDdBoaEgQtBYsBr+UnLzUre99iqcwrzubsX4Q8ifSKBA0NPsnfIVu4FL6I/XFrM+4fmsqV/S5WGcNIeIOrBCVIS366/jQ6RFU611cZRKUkRhXduqb6BNS3gv6RPz2UiwuyCYj0M2y5kL9SH+bhSTs5C/suRNhTeXkuQwXsut7TaaiZVFK5v6VQ/ELtOhf0YsJmRI/PxcAsKJozA2wVPPfS/GvaYTXfPjQNDUqQpE7ajHyZAheFw70+jZ0C443n+1326WyETOkPhiKaALXYSUtD9bVXeyNlL5MUg/LZQF5PY/bqtcaUJL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWDP8ULsMstlI4nvjVF/H42MXLyyhvNUt0zZ7n9Qjkw=;
 b=QVIpcJaZlqQERh7BlHJAPfVfvZZilAtXkBVQyEJ75VkvS5B+7QTWkYPgGuZ2K3Ty0MwBfrtM5VoAQsk9/gXV5ewo7W871D9NP8eAdd4Q4alq9YTVmFaHEuw06yCVSq/obR9SiJYf2GxbDsJ+VOdIdtrt4ab3yW8r4lQ7fWnvCVM=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:32:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:32:04 +0000
Message-ID: <87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/16] ASoC: remove snd_soc_dai_link_set_capabilities()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:32:04 +0000
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m82uwQXCQm4q2U+V/TyBSfvmeeCHIvgVmXMTuRSsyI1Fdvbe1VSPCLsCU2JXKJIJbaAXacnaK8OI/I+rDI0V88mST1JRTjBxxG94G2rmtYkJJFid3Gid3kJ8cPwZLKH+CgXP5dQejHK5BzO3X8vDav9qIuHy5tYU/NCcY9QtkjybmGrXNQ0cfwmNvVI6pg6zP8+emY8WunUp4jSe0XF8Oa1D229CvHIoWgNRWXUMDcqKJM11NEDR+0aH/KKxybAJWcGGBuPJRFYyIe6rznkQpEAt4P2ysZA93MCPAobzA9weSeoL40UvG77wqhWTHhr7ID+wddjkCvx2M9pWiOo/t7MztdsW3M1KHqi5I2n/+fiz+sVzisgFjnB1bmeZtoNOr3W6XjZ48W5alkpRn/NjtY6692kzAS2erYvjX+5lE7EDEGCsGhsX6Tnn5Kq95C4ViuaW82/+JkDrkDUwFiYH2KSF8Vb5APMcGltnYeDxO/srDDa8aGM2SAJ2CLnGvEsX9s+OnAGZHs3kC6dwZICxoe0ct7BnLy4xbktYsmQcutNTUQ1nh4+vqlyvvpwcOLx98GYk/u9BJYrwX3SvX5Ze2s5h4oY6w/W/iXnxjDMY/TdwK0cg8Y90n9/oBnFVtwuhZevrxcHT1EeoUMVrI4rlvAtKSoNfQpPWfFc+KcYB/JJAWo2db7P4rXRn6safPVYrHc9xupXX4DJ/NyFOL767A5O8/M0k4eLv+yy+2RsKiK0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DgpxVLsB5w3fKz409vcOcuhwFcwM/Xh1B09NXv/bK8VvQTO/ibVvqrXao7lV?=
 =?us-ascii?Q?m4frdTPnEACx2T73iLrDTp0s5L9wk/Z3phGvwhA8x8QAtWqw10nvFAqAPGtO?=
 =?us-ascii?Q?qc1y7iNaVfCinyiWp9keMCtCOA/WfGlFW46kzoohL14rkhc55ORhqH3trOy7?=
 =?us-ascii?Q?bRbmae7LXttJBEwOpss75wJOBjITDFsglKIxPAeGW5NZ+CaE3NgVlSht8At6?=
 =?us-ascii?Q?Dy0lc5Cd73XgqpLccReJbWaWDJ9ku6jT77Lq6cuwKKGu41x6WhhdvupMbvZa?=
 =?us-ascii?Q?G199G/+htaqUmoE6oAUD9WVWLRfJZUhL6UEzFqykXKetpuPbUe1IVlfyskng?=
 =?us-ascii?Q?MtZ1ujYT5itbnkTt43X19fBw5cKbH3wXJjCNesljbQSrzUuAMgIf5ZHifnbU?=
 =?us-ascii?Q?rbGSYKyviKMCiXYuRFsq+u1aRudCrB48YgdQN8O2MXWBHNvxw/uv3onJfJlr?=
 =?us-ascii?Q?qWe8/bLJP4AwXK490pbjajpCTCkEnhSHYgkLsj1/c+UiOPW3QfCR4mwXXkhl?=
 =?us-ascii?Q?syuvs8E2nXEermEBvBT4cDFtZE1AtM7d6yd+S78bXyn2DBa/bBqnLOMeeTvG?=
 =?us-ascii?Q?Wja5SbqjWYywjmu8Gbu/p5D6DOV/8DBp4xW0eTZSivZDysTt3Co4mJ1med1g?=
 =?us-ascii?Q?VEPXVwR7DiJ8wZ9onUyZrr909M/TF3ef+BQ7ZP6h/a7x2wOy1orP69bmVY06?=
 =?us-ascii?Q?bk6mVQcY8z3OyH9tqhXtpCBchnnBCGZwIxZsDFYewAT8iySN1JWATtkxc7AA?=
 =?us-ascii?Q?08+A+pDK0dioGMPwxTQ/cwpF/o729rBr7swh2I0MK0Du/aLGF32n1QUlwNxn?=
 =?us-ascii?Q?PYlSUA+1G7t1wpRHUEjP8vNjQm3aVb1a7FymCS88Dx2w8Gay/DOsKdoJiiyT?=
 =?us-ascii?Q?7kIm7OGheUSoWjTRxliuTVllq01kqRZYkYDQQ9akH2zrLe/Aq0AQy1XtaVpK?=
 =?us-ascii?Q?3A9lwlchepPRlDF0mH/tEp2qkSODfJVlFwY740/XHiGO4S/czcxV44J9Iphg?=
 =?us-ascii?Q?U+igxD6hc1KtNmFGp+tc0c/BX86psLrnKmmWTXkyRAQ/iJayN450j/TO7p1P?=
 =?us-ascii?Q?ftEgrohfve89ExoeXKeEo18kTJK8lXhwvlvc5GPhxusReo4Q52gmEJ9gYhvP?=
 =?us-ascii?Q?IUwy9JR23Vf/9fFneUeBuOQRyyZgFQw9reU0KGAHyJykhsOziQwPVKXIQ6ns?=
 =?us-ascii?Q?0WRBji/R/pGJ0SSBRvgxwrfoIG2oJk790Q5RRV8QDym5EoNJbOjAIoA70YQc?=
 =?us-ascii?Q?Aj1nxmwc2Hn2bOjGfH4goPmNywtaA0GhgSdviPhogVoTRQWBb2tCIHW6OGuz?=
 =?us-ascii?Q?Wg8IRXdUZB5D6Emt0RvFD1ouggci8a/Yh9mISceO41SFhrv5xqHSLHJEvjPL?=
 =?us-ascii?Q?rANjkkV/UgfqaTnQ+zUxQJaBWDHrsuwH2nw3zyQBPfiyS25SGmAfFPmsrvLJ?=
 =?us-ascii?Q?ikJtIXI2dlQM325KcVwgjI+DM1FgVvPHUVAdBsWHkK+1K2+W1nqBMTtPn7JJ?=
 =?us-ascii?Q?zJPxsv8SV3HcVyYb3RXyUwf4s6C/E9nLJ4jUfJJYsuYLqk9KtIYoDe0XKJMp?=
 =?us-ascii?Q?OG6srbNMjJFusZs6r6Ev0+miBZxn7sHKxwywj1ZQbMe+T8j8fLXII1SEU4tn?=
 =?us-ascii?Q?Arvz5QbuDisP4qKC6wvfQ6I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e216f594-ea90-469f-29a8-08dc51e327bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:32:04.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TbPvJwGfChn0AjafyQX8IgWxALz+IWHThfgnWBicTDRtuDIkXCxXCiy9rebXiZiUN+czNXSPR2ebCtq4f8yetTNT7OqHPhD8EDUhWAgXB2tfLPB8QX7uHs3U3RXtPZ4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964
Message-ID-Hash: XCP4QDNOPEB7OCW5LLCSK3BHYRYPCEFI
X-Message-ID-Hash: XCP4QDNOPEB7OCW5LLCSK3BHYRYPCEFI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCP4QDNOPEB7OCW5LLCSK3BHYRYPCEFI/>
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
index 5b7bdc5d6784..72e90e56d59a 100644
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
index 21bf1453af43..0ff7dcabd314 100644
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

