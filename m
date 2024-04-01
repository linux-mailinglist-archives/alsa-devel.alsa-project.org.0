Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F4185893690
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122C21945;
	Mon,  1 Apr 2024 02:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122C21945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931512;
	bh=ASZnSOt29Y1boiQPxQpHAIi1vK7Wyzv8SuixBTYKQds=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Dtrf4Q+o0dTZMXCWSJwFu4tL4PI4U21tAxG5p4h+LC/ZCLtNTaE3NmRktmBMWVhew
	 goS3YakhY2JS0uBvh6LyNc9G5FR5/zpE6vWJLqXlUaaWgaRc/1+0ipUsJb7HVZI2C2
	 kNbYBOFrngG8siz0pqfbtzX/bhaPaCIc+T+YCCmo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A931F805D2; Mon,  1 Apr 2024 02:31:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 126F4F805D2;
	Mon,  1 Apr 2024 02:31:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A7B4F805B1; Mon,  1 Apr 2024 02:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18949F80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18949F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lu9RhVyw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4yRttYiqkNZIprXNikTMHMXh+/sct03zasQfvMKXS1OpRGqxgnlDekfpEUTaTI5oi7d4l4ou/TuRD0q0D5V1NEDyYi6UhugT76tQb6Pp2vWJgSdJF+TZcri6ZdXR0G/7doUe4X75ergINlYpGhiN8QhWrI/jhM2IZ3QmUgIG2S699SNWj1AjFE8hq4rFNsMHS4VsEzj9S6AAYcP+7eeVegPa/qOoozodJ95oEUdumbxztPZjopHNTpiayKLRB8WqWd3EWdOKBsJOt4YPcmrDPbxcplH1W7KTSCKb+JAXU3TJiJSp8w6xaaIIHeGcro3iFXSEUFWZ7zta3iqoYxW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5cHDXW03ymXrOJ/Kwy5X34iabH9NN7FjU2xvOXQyO4=;
 b=mELPRkOgQRSOcXwrtvTnRnaELLM5T4pZ7fViVNPaeL7hmrFID42Qa1L6BbISbdRzPXG4M3j1M072+ouNYsnCcC2WYI6AvJRqkQ4wGCGEckHXq7nYYdjnhrxqMHIcnDOPp83p/jKQ5xbT9H6mQBsEyTQH9rRKIOydicaHChDkobFRvWi8o+KqOhF3zfPTTVjrwZpaVH6rlGFwr+R4EEfjpBaYiemGyfoGA6xS5NXvqCH128gnVlAkgT1muHOp1+lwNfKI+aEYJcyuqTpD9QY1LAEU3NnbYaUJBdmagfvygH4NbaUTMKtdoWFRADfRrC9TIHezvVG6NljfWjLYjrdJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5cHDXW03ymXrOJ/Kwy5X34iabH9NN7FjU2xvOXQyO4=;
 b=lu9RhVywz+LI7XSFzzAdsZLerNQZs1L2/SliIPhZRlgfpwvGzQH37myAMM2XouUjgfncYzHMpl34VkLoRTHc0+WT+3PPIi0m1JNyb8YvoYl5/VjlaFuWUNR41xTlw5O6PUdyeQe4Jl4gcLPv6PwVb23rJFtwYXHWDhSUKVldfCU=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:30:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:30:56 +0000
Message-ID: <87wmphudog.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 02/16] ASoC: amd: Replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:30:55 +0000
X-ClientProxiedBy: TY2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:404:a6::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RAyyT9/rgGfT0KSK4UQDNSMNbuHJ1dEh/hq/28aAmLQ9UNQTjpXv/HuqXeEMSDQ86LgWCUkJ6afSU+eJ1SeI7aA91MUN54184E9RyndFPgAe7P32iSZkD3SNzl/hN+3ivh9V3IOac4iLiNgVaO2uLM+BlaGTun1GhBQLthz0+FkM7rbtnimpseyulJrJtdy5r1rXnUX3SkK/bpsTVLA7AGbEUms7aIEQnGNrXogsZBw1yagqrhugy2+J3Mg/fTe460CD5Weki6vzsXmybQY9TAxElv4VapG8VCceHKsX/hsMgv+vNgwykQzQyVbDPFCbVtJ/1w3jIm5i7IafSaylpOZNhxrxUUEoK3ClVH+qVq8wNZahyTtc2d9+c4mv1IIYBlx2I0Ty+cp4rgQqQpAtimIw0/ST3+JJ+pqemg91UoO+xre/ddKN5oWH44bwxzddju10405p3CjCeL46HGiTmBVHgQYxziuT2agUhvgCgiABv4NwhCrGGDsLvBB46vmq8MC+uc+QGEZkma61g0sbiMvHorsev5OKg3ylyOrRVAdm+3ebZszjIb4XOQSYt9uUgJX0HJu6cT76Niczaej0Qe4kZ4Q/Ck6q2J+x0zIVwxM2SJyPCd6PttQl5HnyhTsoeM39ItJpHDc7NkbgErQ4CjAC6B/F63GWJQ8seSa0u4bftD0P2f1Hn2m3UfPdYqyadhpeKR3TqoZAC9ZFg3BW8DhzkQkWJR+Vyx2lMQqmAiI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IKKpP7ez3SsBN2yKdlNZTuREYjv49FqpsY3wiGBdYu+/CCjDyb0vTKUySaZX?=
 =?us-ascii?Q?Z1+YNtnN3ujs81fAOat/dBGVD+WzmFJvw3YU/+yOu0TdilKU8yvBx8z/Lp+k?=
 =?us-ascii?Q?S5r0enA4T50wZP06Y4FjkRkotv9Q6FnAisRyhczH3A5kvNg0KA0Vud3gezwx?=
 =?us-ascii?Q?oFqktr2DTavMjjANZFx1brd4uhhYDeHC1Guq2O4NsGXa3LedBh0ja4/iu3C4?=
 =?us-ascii?Q?t49xcwqzsQuKaKtnjEtflofBNJPyIlnnPvXArLm2YLkeG4F52Sv4egJtF/v7?=
 =?us-ascii?Q?sAPolafzApdne1Ynl75T6j3q407sjPgVKamYO7zOjYOQzyV0nQjJKQVkkB6P?=
 =?us-ascii?Q?IZiDAcCEHw+QTtY5yCnTP73UygblWv5xWM0NHNLn20TV8CWKpRehTNTZ7R+F?=
 =?us-ascii?Q?G5aCcEU+M//0ig7HSjd5aIfUTbSASWNFhguhhg/bTSZ59oEAGLS2alxJGG4W?=
 =?us-ascii?Q?CgHPLEW60JwSPHekv5btpLc5RA2AfrJmeyuOineR9JqlyfbRQCj+bFg0EjmX?=
 =?us-ascii?Q?QdGJLCD9CtDx53ZGtFTu3zGtFLg4oUNvmJ04/OZ71yLHJa3d5+jsImbzZhnQ?=
 =?us-ascii?Q?tReP8EVDcc/TRgtPpiy8gjRnzrbbVV370n8tLLnHQWE8ThHe0YI8XE7X1nu1?=
 =?us-ascii?Q?HDa4au9o80TvrMLFzHFX4Q04wNx4QcsAN3eBcEw0vQDUlpeMDoMMtMxDl+8a?=
 =?us-ascii?Q?LjuyoxCPGwqBtTJsO4dfkUaC5HNC1oSxnfoHoUcouA7A21wRmHaeL7k2IL9B?=
 =?us-ascii?Q?p+Z/QV+cL4Jem/INJHgX9GtIuTtxycEAkU0ObxIFuP7ok4fCFNbrX0yc0gSJ?=
 =?us-ascii?Q?TSoElobxvPuLrPi5/cGsRGgR2/j5+1sux8qEBGF29fuzfpmWat0uIPZXXMmb?=
 =?us-ascii?Q?ov8p9AoeZVm4qDazxKb+dNLE+09DBAVAi3VPP+poUqNJt/YLUJxyFk2I/uYm?=
 =?us-ascii?Q?OR9hNrbK1l6HbkmCRFUP85SKWqzOn/NOkOFqh+BtYMDO2pTTRFYtRFrV1oby?=
 =?us-ascii?Q?Go/J1UCmmIrYo6sBnX7JwcyGdZkyKvEGq4OZLXRbyxUv+IK5CUo2cjbdz26j?=
 =?us-ascii?Q?VhFeZ8cij74Od4renO4/HlXKmR93qjGeY7y6qQ9aGkj8N6jTsiN9NsWWj3QR?=
 =?us-ascii?Q?t24co+q7mJl/6IzeXeC1rmXTTgCU0jwWj3oEdWTLC9py0Y7qZJCe+r72nAdx?=
 =?us-ascii?Q?6VF4QMb/Ph9Gr6IlJXqdyUcLxWwAewFWrQCOADPC/49gde2LzySRbhgOqSGF?=
 =?us-ascii?Q?W+vp0/ywQfHmmltPJT5YBQtGdQTM1oxzCJ0UOrvUYygQ1kDCSVMeQiNsPYK3?=
 =?us-ascii?Q?NrSMY9li+hHSuF1Wn3kZV853U80z8jFkpyl6MGe4vOZ/41a8O+iSt5zh+Q+j?=
 =?us-ascii?Q?yCgtP47Ogfhl/4kcNVVQyT+xTRoYdDYv3WG0H845wWWVRTxpqySmS9NIpgET?=
 =?us-ascii?Q?AQ4u+4y00ilF6SoA3xMNyTIxdQfZ2/ZeHQlma/OM4b8P3KSy+ln5+foVqTkl?=
 =?us-ascii?Q?hxDJwu53t21AlMeQsIAwmtJpGwjxhLMFe1Vl2akY0SQ5WyHANEE4+vFw0pfF?=
 =?us-ascii?Q?eiI7o9dfTZrctFMP+U7neHmDy7ER+UrLGxd1YdEidOmuIIQe+7WIofzBxUBP?=
 =?us-ascii?Q?8N/FevSMFS67+rd+c3N1Bhk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 470458bf-a8c3-488d-6971-08dc51e2fedf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:30:56.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HFyRKSynn0jzjsvUk50ybRu+0rSVDkeUKxoNQmGCLXzRXsSnXNp/pXK6Lu0uNlY0jgq6wZ7hDSceyX2bSjlS/Lqi3U1HAqXwmhpWsRKtrDqRsKYVNpWa5jlRNbNUA3nN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
Message-ID-Hash: CJKV5RLZNMBIIGPZ5GYF3EPGX4KL2AQ4
X-Message-ID-Hash: CJKV5RLZNMBIIGPZ5GYF3EPGX4KL2AQ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJKV5RLZNMBIIGPZ5GYF3EPGX4KL2AQ4/>
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
---
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 24 +++++++-----------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  6 ------
 5 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 84f3d65ba52e..d68d84d4964f 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -573,7 +573,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -584,7 +584,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -608,7 +608,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -618,7 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -629,7 +629,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index e079b3218c6f..785d34127a03 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 665a6ea0a2a8..0a672188521c 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1407,8 +1407,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1444,8 +1442,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1480,7 +1476,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1512,7 +1508,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1527,7 +1523,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
-			links[i].dpcm_capture = 1;
+			links[i].capture_only = 1;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
@@ -1553,8 +1549,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_bt);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->bt_codec_id) {
@@ -1574,7 +1568,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1613,8 +1607,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1657,8 +1649,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1686,7 +1676,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1724,7 +1714,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1774,7 +1764,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index d6cdb6d9fdd6..f2652831c8c4 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -317,8 +317,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -327,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -339,7 +337,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7878e061ecb9..2ca904db82ab 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -276,8 +276,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -288,7 +286,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
@@ -375,8 +372,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -387,7 +382,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
-- 
2.25.1

