Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF88A91F3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:17:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7100114E4;
	Thu, 18 Apr 2024 06:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7100114E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413868;
	bh=4kcRlB0ad+8GlJ9lXEqOg3HLbo27rTG+03l1oS7xqBI=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RcRy6j6CkSISZRHRpUoIlmoKVvx6M27zk2V9Qd2vidn4RzpLSQS9tuuERgSaSJgBn
	 FW6dydD6kgOLqWb9iZyZR5qDDKyTaMwd8WIvqA5mqQrz52xYGJMrq3hYK/xokbyoNA
	 BC749AZscX46lVoYSro5Pz8gdIOsMeRMs8QFzpVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3CEF806CA; Thu, 18 Apr 2024 06:15:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09705F8070E;
	Thu, 18 Apr 2024 06:15:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80C22F80633; Thu, 18 Apr 2024 06:14:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4FA2F805A1
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4FA2F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gjY5vom7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3Yw8QOTuJhgLQcADfvgLwBZmzTObZ2Kmpks+dSk+IzSIr+oPYYK6mCUOAdfxpfrWjUzt+PDMePBrxhoS7ewDgR9lGzpgKKavIX14youXqVOt+o3EjvKoadl9QlrQG2TTPtD8ALJyNqE5336BcwN4nXYBBMBzrvQjfHTBR6MLNQwR4ZEX0Do/T03W7iT05fHz8vssC3KFB0onAoC9oBchmoeWr4TfjgG+tXa3ufwz6Ed8Nd3rNTH0CpANKytmKxZL2Z0Fmg791v8na+w/v957rYBvj9Q7hpmWu+34a+d9XEejcAxyw7m5wwIuW1NRuCfDaaxL3T3k4VZN+9EDjCemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87OewweWG4kuUvrao/JJUSGiBcnfqiwsYcF5frUzWW8=;
 b=e6MRA+o7TvisO479ALzECU/kPgg4r4+fecfUJZwl/0MIHsHfVhhVDkqhhBY5kOQownB0tCP5tGoGD+70+WYk8kKGIOMX8m/dSgtd8lWL5vq48fPnyZfbthd9FpJlQhBPLyBm3fljp5GJC7afDyURMldG3ZleyRXiw7gGTpwkXxQn59+099IK/KrufGIQPw3sk2/jCmT9dSuB2VaqfW/CNy4EdQFn8yCJ3aeUDO6OOE03G5P16xcJUNa5LHgNcwziHpBbuYyAPbksuObIn05i0R75RoJCrxU0bOtd29s577RQSUO2h6zCqLqIzE20cEu/p/5RmA4GJffEsxDjnFUIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87OewweWG4kuUvrao/JJUSGiBcnfqiwsYcF5frUzWW8=;
 b=gjY5vom738PsIhnrCjjT4EhIaSqRrOSYdwwaTuVQMKfKV9yajvRVidtYQdZXRrhx/mEaSMMzee5BBw+yNEhlAV8/vhnvQcVOyplPMCkeqw3Pv+OpyDCvdObtbMmfd7FvFt8UrtxwDocE7gpumuAgp7YZEm1Eqb9RC9COQkV0y6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:14:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:14:30 +0000
Message-ID: <87wmov71eh.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 14/23] ASoC: ti: Replace playback/capture_only to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:14:30 +0000
X-ClientProxiedBy: TYCPR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:405:3::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b0e4a8-e18f-4a64-8041-08dc5f5e0bb8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qJ6DMRmw0qmFzQ/UEFI9qmlcHehJhbP7QMEk9tGq8AOGXxgZcGuRIkraSZUIEHRAsIBtg6gJY3AcPbdFRholeNTH5HMNBZ9NIMmmtmAKL6jenrAoH7TBCB8shibTMlv7iWJhpLhs8FE5YdrQFTcVmy19ZtXbMhSH1OqdXzQ3tlMGd7auvMoRsolc+AyuIe0siFRoDDX3logRGTcE9GebZEaLjoQjlKFlKs3jmu3D0+SN5hGkmeyGcBk6OgR503sIHT0bFOs5NMKsYpkp5LETYwXs72m45vgJ0WYxIJye/s7QR3Ip3bDmj0BpXJqoFbkXuem6t0dUEIsLRtabY7sDxATlzsCPO0ocZru+Qbsv+SRj6c6CRBWUNSKAqxjb3zQabxIxHXZIX5BHxzedpjM1OODD+n5Tynybo90pRNHK3Gf1SYaIH72xmKxzciMb2nMwYeAGFkj6ToY0MvpvKzeShh+cl82PnjZDquz9PQQjzpDxAx1ZKd1pspOpSwRaYb176AJ8/eSsWcM1GEawzBs4KQjBcCVqc3xpa0/B8VLxHgqtINGdhMON4NygGiP7W8eDp8XqC/mtljxNQO7q2zAzD7dBPYFcEDJitAgmQvRcpuN+SH3aSK4JoMoihkEi6Wk6oxVjhBtTs+quAuMSdDG0IH91sfS36ogeEh+3wHHOsvLHDRoLaM9Jv6dhU6tRLLWTdcwwda2et9Pj21JCN0iatCNzPWDcXPx9h+Kth26houo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jtUNeI8LQlpXXLF450gQFYzbQOXZ/IU7YB9zER614TP3O7acZAmNVUHr9pJg?=
 =?us-ascii?Q?Y+1IWUu5TI9Oz86tdVvMniv2kRDYUOf3hTKlkKEtozub9VXxydtDb284pqDJ?=
 =?us-ascii?Q?na3NuraTqzY/rK5m1CXyJPkDNTtlDAEmQxP1XhZHdXG4AL+F+k5GZUzJaLJ2?=
 =?us-ascii?Q?kRmOamhTzx4QuXmOHGJYKlyAR9pcR2HyCAP6W6ChybdWrTsUhwoYz4Bk3caD?=
 =?us-ascii?Q?kg8W7+PeAUbTGDsYt3YDdXTiY9+VmScWLzup3M5BbiAzMrXqLxZ1tPhj3Y4S?=
 =?us-ascii?Q?XsxSDviSZVDRGgyvOkqh2ZTXGFg47uvvCERcY4GMcqQtyIhWmS6e1CYoCEzC?=
 =?us-ascii?Q?cncyFV157/hYwHYTL//iDyaKW8LclacUi2VMsQBCkQPrW9FdBTlIwPwgqoTv?=
 =?us-ascii?Q?ww1RhAXwlVXe6xmRE2Fok8pYyIY4ZKrC7z+kzIbn8JiDKQN0CNce9SnMKAgN?=
 =?us-ascii?Q?k7uQiLwwhY2YsQf/nV7YWkYUrdu7fUc9+16fAy7czYkqF0mv03YFE/a28Mo3?=
 =?us-ascii?Q?WbfV9XHzegsj2pjQ5yc6ag7kSozqiVpQLho8oEj7R5lNEttpP7L+vCPrwj1K?=
 =?us-ascii?Q?WQlMyx9vGh9yktSr6V1yqfF0ZXomdRpIDPHjgw0M6aQQxfwdLEX7JIjhuGNq?=
 =?us-ascii?Q?pW4gXROTbCEjW5ih/rCzQKgNX1FcWBdjAjsF3UhIBa0BLKaIjRl06M57MFN5?=
 =?us-ascii?Q?McS+G6SC4T51UO9+Z+GecBBU94VcGOvBb9J/AbC/batZ5KivLVT0UpTlmrji?=
 =?us-ascii?Q?uX74VKEgUArWsHS83mQNeE3A3n0/4DUO9FgJn41o1+Yi4AHkFAZYMTcuKOWN?=
 =?us-ascii?Q?r8VX8zEqKlx1SOJn5L618P5/JBKGuKNvFXHLeX3gvXrjYwBcJms84Sy+aVag?=
 =?us-ascii?Q?Bx8XRVza3Q2yoAnVrLy+yLtO4P0z2ws4OkIVDbv29xkh4BrfHn+YIEaVY8lb?=
 =?us-ascii?Q?p3fR5nAYsaUi+lTAXbJqUr05CF+j+AXO8zioYacG5pc0sS+qNRPcDW7MhPzl?=
 =?us-ascii?Q?LzJNHQM9MveEZuH6kMAA+hkn2Ha6oPUXD2ySwqhiZGL81T0vizBRDsXZCCLR?=
 =?us-ascii?Q?+75nveWzXOerM51JvfWIm1UEw5iyg9sJeKvLnolwvowN/wq8zx17XBKNGoon?=
 =?us-ascii?Q?WuQjIaQ9x8Zq580sVUVXdwdgd33UgbFqzNzS4Kg+MWSgtzdPGqASwGQ0DlZz?=
 =?us-ascii?Q?5S+/QMbbgcPBO9FzCfIv0gH/1//8v6pJLk7x/kp1MoZ3Xarx1w0Ln8op8Wnq?=
 =?us-ascii?Q?r9DWhVSzi7pY4PwW+94GdnXq++MKhw0PBivhQx3IDD47uE6pdLeHXQHYhXWz?=
 =?us-ascii?Q?qDdqGe1gBjwdnlbHrJ4nmUzkJoouIvd4PMWUvuUUx19lOn6PuLyGrGK/90TW?=
 =?us-ascii?Q?Rkui42g7XWFm1cre/mpD95Gm+VsXWgQtXUG7z+m34uYqcYjefeOGQb64ZFx7?=
 =?us-ascii?Q?AtoSihOBknDOkSvb6ahtv9PoCx5lyzwhyY1E5jRQPSgzySN5oCDojRXYUZXE?=
 =?us-ascii?Q?GBQSPbsqUVnjBvSBF1ICrFQvQ759rjmQWdUT9qlF4oSS59HyHIQ+oeoOQmJ2?=
 =?us-ascii?Q?bt0MBuu43w3YHED3dQgR8IktWOvWwICNYOCg6VqnRWiYHSLmm/rhKdXguJ5l?=
 =?us-ascii?Q?VyD2kPgmR8GtQlTzlNJ+D+Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70b0e4a8-e18f-4a64-8041-08dc5f5e0bb8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:14:30.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KV+eeUg7ATq97Vk4WHbxzaOvqWnsyonutQWmwEBJAXvjC4hTfkJ/213tItz6sQpG7/XhX0mP91y8hhxdU5LrrfCj/HnuAni9xbNCjtPNEWr3cSBdkjTZOg+VbnXFDKYd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: QI5P5BFAF4JAZZ56E34ZB36RPKAUEUUB
X-Message-ID-Hash: QI5P5BFAF4JAZZ56E34ZB36RPKAUEUUB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QI5P5BFAF4JAZZ56E34ZB36RPKAUEUUB/>
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
 sound/soc/ti/j721e-evm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index d9d1e021f5b2..a58c7d64c28e 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -670,7 +670,7 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv, int *link_idx,
 	priv->dai_links[*link_idx].platforms->of_node = dai_node;
 	priv->dai_links[*link_idx].codecs->of_node = codec_node;
 	priv->dai_links[*link_idx].codecs->dai_name = "pcm3168a-dac";
-	priv->dai_links[*link_idx].playback_only = 1;
+	priv->dai_links[*link_idx].playback_assertion = 1;
 	priv->dai_links[*link_idx].id = J721E_AUDIO_DOMAIN_CPB;
 	priv->dai_links[*link_idx].dai_fmt = J721E_DAI_FMT;
 	priv->dai_links[*link_idx].init = j721e_audio_init;
@@ -690,7 +690,7 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv, int *link_idx,
 	priv->dai_links[*link_idx].platforms->of_node = dai_node;
 	priv->dai_links[*link_idx].codecs->of_node = codec_node;
 	priv->dai_links[*link_idx].codecs->dai_name = "pcm3168a-adc";
-	priv->dai_links[*link_idx].capture_only = 1;
+	priv->dai_links[*link_idx].capture_assertion = 1;
 	priv->dai_links[*link_idx].id = J721E_AUDIO_DOMAIN_CPB;
 	priv->dai_links[*link_idx].dai_fmt = J721E_DAI_FMT;
 	priv->dai_links[*link_idx].init = j721e_audio_init;
@@ -787,7 +787,7 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
 	priv->dai_links[*link_idx].codecs[0].dai_name = "pcm3168a-dac";
 	priv->dai_links[*link_idx].codecs[1].of_node = codecb_node;
 	priv->dai_links[*link_idx].codecs[1].dai_name = "pcm3168a-dac";
-	priv->dai_links[*link_idx].playback_only = 1;
+	priv->dai_links[*link_idx].playback_assertion = 1;
 	priv->dai_links[*link_idx].id = J721E_AUDIO_DOMAIN_IVI;
 	priv->dai_links[*link_idx].dai_fmt = J721E_DAI_FMT;
 	priv->dai_links[*link_idx].init = j721e_audio_init_ivi;
@@ -809,7 +809,7 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
 	priv->dai_links[*link_idx].codecs[0].dai_name = "pcm3168a-adc";
 	priv->dai_links[*link_idx].codecs[1].of_node = codecb_node;
 	priv->dai_links[*link_idx].codecs[1].dai_name = "pcm3168a-adc";
-	priv->dai_links[*link_idx].capture_only = 1;
+	priv->dai_links[*link_idx].capture_assertion = 1;
 	priv->dai_links[*link_idx].id = J721E_AUDIO_DOMAIN_IVI;
 	priv->dai_links[*link_idx].dai_fmt = J721E_DAI_FMT;
 	priv->dai_links[*link_idx].init = j721e_audio_init;
-- 
2.25.1

