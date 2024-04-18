Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DA8A91FE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:20:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0826E162E;
	Thu, 18 Apr 2024 06:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0826E162E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713414032;
	bh=k7OiPFjG7V/BcxirPcWqjmKQWYNjUCs7F6nQqjmhX/c=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RVo94pgBE0clxdeSnKxN9PYl7xKouyNhRa4KLwJufItcb8kN/Qg+iuJZEFYxP5Txu
	 fZGz1BvxQfAJ0extica8nxOsbcKt7JsfcQB+vcrCZApqx2d5pWl6gXY/moWMbxLhjJ
	 Wk7W7C5oq+ydnjYb/FHt7/MPxSSHSzAEIm5tLOBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD897F80C92; Thu, 18 Apr 2024 06:16:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EFE9F80CB6;
	Thu, 18 Apr 2024 06:16:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF734F805A8; Thu, 18 Apr 2024 06:15:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F144F80588
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F144F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FT9cKdTY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJbZ7EJKwpAxUgqyM1jn6X19MJES/2ILk5Ce+NPQfUsY65fH47XOPmYj/83U6dzxLaxPHIinEzXDik12OyZYL4xjKq3ivsHlhugaYbd6il81+hcJTPAvnA1uJ8ACWZJsUumVzhXuIgZmnB+amWpztnoGDl6I6q++6Sm5COCWmVZQEVWaOOrrEeh3BCzSarq4BvbeJ+lGge/I35VyAsxU9fUKexm7SsB5b3CeF2pcm5NH0JjfVJF5Ji5q+j7ZbEgYUzuK4U7bEL5Rs3a8HZTFAnToEE3PuZLNX2FXEfUw1gY9T76zFHS1zkp3WRnj/wW1m9i3J68z7JyfoRjCUs/TLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhfezkhwUSc8SvnqDMfq4EE0KM1x01wW7uBPfsaZAHs=;
 b=kigagTun8NJhNIX8Fnc/K/6u+so5xsGUlX29i6r2RwqPj63UTL+Rw33ngxKwEDZ0AAMKbBZihoC2Mz7+9xnu5qoRpk2ZptXhYAsBC/6ActUks8adRdw72b9eOeWi3kJQyrow+a4Bidh7PXt0ZAMeBR4LcC0TOOEhEK0LxZjuJtrnzGGObUEw1n8pF/3bIY8KvBEwUwG6/gVnQAaCRhrFjh4HZNAGfBXlt0/buFVnNpmvZaaW5XxAP05i/fY+VdPLp5CYHc+3aRfmAdMuYfTS8GMl6tpQFWjy7eZetIr1hC4+0AtGaZqo27gjK/NQpkOHVcG87hM6zEnIdrciq37jjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhfezkhwUSc8SvnqDMfq4EE0KM1x01wW7uBPfsaZAHs=;
 b=FT9cKdTYC3ERsQXbpbaSopA+4yVqRiboIrVnF2iGLPnWeyBmAeVi0UxQkXaHfqsbhXTwTtbB3L2PrIOeKkYije5Jqhb2Umgv3O/NCHoyzCSIOXw3chkaK3JuqC8kTzeA9e58hRPRndS3Ial2G1wsCcal8c3UkQO9MD0On5haU9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5379.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:15:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:15:48 +0000
Message-ID: <87jzkv71ce.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 23/23] ASoC: doc: Replace dpcm_playback/capture to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:15:46 +0000
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2624d6-82dd-495a-cae5-08dc5f5e39bd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M5FXIJ8a4cbqab+To9fVn1/frLxhfx7kYm0pSfuU361Lvz4bzdfakmWoO2aYwXl3pyDazo7RjAoy6m/hH4ut4Yr/iFEgGsf8Vb/KSDuCYK4dvtuJ0eGC+ZxHCOGnBMvyWWViyQ4SPU8Towp6jrDzRu1FyuMgSq7ck0Tujp37JP/byA2uGsO3lGeDBJl304BbTVAmVcqX9tf2jtt/C8z25+2wXHpf3z0yJm6TdT/BXbc0ez7d6JGpjNaTNL6sDmw8/WI2Gu9YqrmZz3cf3tCl081OeJoOmGo5ZQ5SefFAOrTwWyWRKfnyfIJs7ILJdz6OU8efugjEqqS2WmIaQk7EPY1Lanxc13VSO35Y49JquSaId9pnyf2d8QzY88h7t9SbrjUBWmpRCVzN1pf/wf78zm0NgZ+sXC5igJ+oqLu+3qcKoRVbnPcvcZhIvK5D6FdQzpEhQ09AmoAbWrlubldy6MLmoPm9/EiSDjmeBdTuTsJKmU+FWjHIl+PKg99+aLkzWSu2ONAtiOmIrbmzjzoOPI5PuPzeDAhbMZF0rmDBEq41mYMIS4EEzjW9z+TdgL96upw5RS0oaoMYXCs6KQVGGZASQLcQNEWZO0ZaJnkyM8es+lY6D7pxgkU8BewFKs+eSbJJITjxp9vM3upMrgYdHowSgUP8miqejnGQ3C5JIhfWjbL3GTxG7Zmqn2IDJuumr6YLval7gWpqPqFwX/WWgg4BH4S9BmmlwruJGA1OSYk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(7416005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zON1069OhMqADYe5DCVCqEb8J8gIpV1Q4gxEZslRJOdf79/xXBebZ4mep5Gl?=
 =?us-ascii?Q?RjlyMejvKjoD27+e2JF4GTEWGD1+f4XYCBZH6KeiehZbOWkeaQN4bbBBlRsK?=
 =?us-ascii?Q?Z7WsO6r7W0BWpZe59QgOEylPYhkFWCJlquypZAnY1SSd5qYQ66/X+s8Q+6u+?=
 =?us-ascii?Q?N1tI97VhAQgLe5+XWmVJj9qEV+/D7g7cnJnmLDc7dK9sq4kNS4RqJCJbD2vO?=
 =?us-ascii?Q?VotFiaozaAUXhEyC1FWHyaF3iU/IcCU8S0Xpu+P1g3NQMd+mLxcSSRL1166a?=
 =?us-ascii?Q?NJB6SIKTXNHUsS7gpS4pcwSQqIHMieSuDjLDcJU+4NSPG3a0WZ0LsGajKC8T?=
 =?us-ascii?Q?5x6zfCTuB86JNvk11a4HAVBCtlfkw56wssARXsGkrB1W6uXEaY0xpQltSbU0?=
 =?us-ascii?Q?10D+NPyow81I6MTY/0NiHCuuROZ+kGoVm876GvJzjpYzwLNwXdVzbShfQx16?=
 =?us-ascii?Q?fYBQjfpmykCfkWhx8xNaWOu8m4qe8Fc4GbOA2O13+uhlmn85ZqVCCffUQ85N?=
 =?us-ascii?Q?HVLrpOJRbS5PXuNabd8F1Z3N4r7eUVWIHJtKLGsex5VH8EktXWkzlZ3B79N1?=
 =?us-ascii?Q?JHt5aKWOHwCa9hAZeOQtBqWG3h9IhKXMA1QOzT4NbjCzAEbSDTq02k1byAKv?=
 =?us-ascii?Q?dfTsUdOeixb16iVvcHaYmF0657fPAcyQb5+VKwrMU3hvXi6rhQvPu7ygQxTv?=
 =?us-ascii?Q?MRpHHyg1hJAuKzw6mudD9LAkmSsWJnx8BhsoZ2i5eNX5bSY5MFQTROuNlExr?=
 =?us-ascii?Q?cmHeI4El1hnaQ0S9Dhm2p+9uszWaPUCz3cq1B9NHmT1NMbfY7XCrt/Y6vvLy?=
 =?us-ascii?Q?lF5Skjlt8XNUyVOenE4zVob+nRYOaX/X67GixA4a91zdlETaK6j20u9Sd12d?=
 =?us-ascii?Q?uJLyaiyAC44K0hCoXT6KL7wxMvYllLOnMTDXiq1Tl79zdSvKMECZbvHOexvy?=
 =?us-ascii?Q?HWMHl5ntokReysOfsIXP2HUCkLA4rkn6i0ArgZBWYmdBpII7wr+l6u6g319s?=
 =?us-ascii?Q?FPE7S0bO+nTySzPCFvKaWMMliWFC73goKYy+aqgbEI0mn1ln/mMdmIVvApxO?=
 =?us-ascii?Q?asDjxvuOMdUcwI5bEgvBOxIMTvxlY96FIXLEUKT4/2twNBPQv3vmLMq68Ef5?=
 =?us-ascii?Q?Bvw3oAYPGdEIs0DLM/tyYoKmnur/od+OsLQdF5pbFGOXiS9ydC5+0dSZdjqZ?=
 =?us-ascii?Q?CCueeeAP2KzxgbRV74O347Gva5bV6oRSOsOTs3m/K1Y/Zj40ptmCJL0ZxRsQ?=
 =?us-ascii?Q?17RToPt/i0yQNXv9lORO2sZd7by91RLC/7xASqliIdLBAjr1DHXWgnolk8NI?=
 =?us-ascii?Q?J5s6vq9bJw849QChHfdqGgyCmg1OWD5Kn44bM0P+B1ehFvdWYpVeRc+dyM7q?=
 =?us-ascii?Q?/DauJs97I5Hqr/BFWCBcdBGGh3xuClJ/fzwjvrF8kg+AuCkf7p3/23nkU1b0?=
 =?us-ascii?Q?j6VqTI3Bf6W6OD44fvAb116/fYxKz3cscfbkXgcUnNJDN0Opz6Zt7gf8cb7W?=
 =?us-ascii?Q?EpaVucLqqQDWOV6zdg7otZZ2+PnvEwGe546dnYMc2QlfXI89gunri9ZMH+cy?=
 =?us-ascii?Q?gnd1P/DV0ox+ir979nebX6eu8PMAI0/9dfMXVIQC/uWZ6aKxTohh+nDVZbzZ?=
 =?us-ascii?Q?dSjue8leN1q78HVuSzk+psQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb2624d6-82dd-495a-cae5-08dc5f5e39bd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:15:48.1149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pVdUJ9RvfKn5N1Ct+TS7qfzlovMSU6guP4edDTt3eICetBZMBlfg9BwO3GkJsFNxYrWWZDPWAUa2cuxROkZ+11aJjJjCNIO60oGgug06vj3uaveYkHeONiiP5wr3XQFs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5379
Message-ID-Hash: BLJTIBDUBRPCSN2GA2TCUGTX4OCFCI5W
X-Message-ID-Hash: BLJTIBDUBRPCSN2GA2TCUGTX4OCFCI5W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLJTIBDUBRPCSN2GA2TCUGTX4OCFCI5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

.dpcm_playback/capture flags are converted to playback/capture_assertion
flag. Let's follow it on Documentation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 2d7ad1d91504..bf9b454e6654 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -157,14 +157,14 @@ FE DAI links are defined as follows :-
 		.codec_dai_name = "snd-soc-dummy-dai",
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 	},
 	.....< other FE and BE DAI links here >
   };
 
 This FE DAI link is pretty similar to a regular DAI link except that we also
 set the DAI link to a DPCM FE with the ``dynamic = 1``. The supported FE stream
-directions should also be set with the ``dpcm_playback`` and ``dpcm_capture``
+directions can set with the ``playback_assertion`` and ``capture_assertion``
 flags. There is also an option to specify the ordering of the trigger call for
 each FE. This allows the ASoC core to trigger the DSP before or after the other
 components (as some DSPs have strong requirements for the ordering DAI/DSP
@@ -189,15 +189,15 @@ The BE DAIs are configured as follows :-
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
 		.ops = &haswell_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 	},
 	.....< other BE DAI links here >
   };
 
 This BE DAI link connects DAI0 to the codec (in this case RT5460 AIF1). It sets
 the ``no_pcm`` flag to mark it has a BE and sets flags for supported stream
-directions using ``dpcm_playback`` and ``dpcm_capture`` above.
+directions using ``playback_assertion`` and ``capture_assertion`` above.
 
 The BE has also flags set for ignoring suspend and PM down time. This allows
 the BE to work in a hostless mode where the host CPU is not transferring data
-- 
2.25.1

