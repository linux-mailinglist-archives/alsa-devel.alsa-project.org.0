Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA69AD937
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D511D9F6;
	Thu, 24 Oct 2024 03:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D511D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733345;
	bh=CSWyKEfMPHxf6jeE0QXZd74wD2muKt+WvILdodY/GzM=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NDLCrQ1ZCbewolj5OZyhaw1iHrtPeHhYr9x0Xz+f4oyfMms4P12ODf5CiAOeRgNTs
	 84KzYA0xSke7ggSAITDG+/zVsdvvAmeVPbXF8ByCNUeBnR2S+7G++/JpeVz6gaXlo5
	 g33lBKkg4WmRPxmIgItv2z64eoCX9lEEzNYn+1OQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A8D4F805AA; Thu, 24 Oct 2024 03:28:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1093EF800ED;
	Thu, 24 Oct 2024 03:28:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21D4FF8016C; Thu, 24 Oct 2024 03:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFF46F800ED
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF46F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NnhTcWNa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBPwM6SkudokMIrhzY2qomcwPuxZLUmIQ4JrLOntzDOnZ/udXkhvmg93hrRPbtgKbVWJNIi2G+5UfNMKDq8ScWCupvRbDiLDVqR3U1bI9DnK8GWWZ/HlXJGwkML1XGDNTIPQTKdiuV/cFaRMPBuoEtMOpDgeXETYdie/gC0kWQQVIb5d2oLAyQIMShS0FYnEYvif7f304878InRc4I42GW3AQKqqN5k6CJbi354cuMpCAkNlxjSHFzBFLk8IVy2skVsqc4BCXyrZ6gVVDBvAEUuv4a+KoRmcD1hByI3kV46lj/ed1Za3CV8VO8tIfh0aQygGWgpMKjcSdhU67ALdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPDsVQP0V8w5ZLQG2WMlAvLFktQWKpybL83ZVlQ96Hk=;
 b=XEZRgYJBx2wcEJaORsJ/MY9rtsM1lJ5b3HUpaeEKU9JexyeiG0eEBLUnNhu5lH8DSTZY37oCRQlAXu+fd1VKvx8LdB3q5UpbjY1NPiVWEHViCmzccxQyzQfDu+C3raBPq4Spu746yWEiB63CE7ESD81JkT1kgTUXdY2dJCeHTUoBUX7rCkMMZkbjav7LYt0q+ytXJSZnBjdrgXiLG/BpFz/c+KzKsCK0GTzJE9ENRj0xbke4Rj5AR+VfEW3ly4QNM/eQqj9ac8xP6bTwF86xuMssUS9wOsNifgK8x1oh5T3/TG6s3zVap1E78AMG7IKTnuaf8U/5d0l+urgdTI4DMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPDsVQP0V8w5ZLQG2WMlAvLFktQWKpybL83ZVlQ96Hk=;
 b=NnhTcWNaOLyy0tOkfU6WOqeTawt+QUyij+aF7GtfRI76r1cK5QFnpDajCfluwWEykmD7wrksNFvaN/W9WLajzQxe+Kq+zQ8pqthblNHQPOFva5ASHxau3aOGYv5V8GLF+uMN/bJs8zWnf7eih09Q6oVzytPM15x7IOGxL4fByFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10892.jpnprd01.prod.outlook.com
 (2603:1096:400:29a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 01:28:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:28:10 +0000
Message-ID: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 0/8] ASoC: cleasnup rtd and its ID
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:28:10 +0000
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3c3cff-d2a4-4106-bb0b-08dcf3cb1f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8U22NNYBYj6Z7c6dpfmmjbQnXhOf4fcccAQc4zDH2iOYyL6iBvV8OAzeRM74?=
 =?us-ascii?Q?tcyNRA9/pkPdqifGJNkjgYW6ztUUxe5suPi6Pzs3cKzVfnKq1tOLuyU7pyZu?=
 =?us-ascii?Q?eyAih98mH5vrOXzss835S4I5c2F+c4TRT/jRPytd9ubE0mmjIP92vF/KbOvX?=
 =?us-ascii?Q?vINUBZdD6mOYr4gmeiVF7VSZ7T9B68vPy7/F3D0+uVi8+cizBZsCcjolc00U?=
 =?us-ascii?Q?txhkQQIorF2L7cISiRtTEqWZGXujB7w7k0ENH4ae9Ddb93r5sOoBHsgD9ppv?=
 =?us-ascii?Q?pW7tfHktp6xy++0gX+9G3ookU2UmDL4s4YUbziWceVd4/a4u6+sYhNriF48d?=
 =?us-ascii?Q?HJQhyt0kJhWC15+lFmPw+l8XSRWhV1IfjpI2lGJNVghqyb3+NiuhckqCeIBS?=
 =?us-ascii?Q?WdPpe6ofqwmJFfc73sLShJP6yCW3thV7EGjawwVSUDFdN4acb8BYKo4/OCof?=
 =?us-ascii?Q?RbwFgcEpzihfI6Divdmbw0CyUt1Z24b1HxdjpA+kfRQVF/Zrl4dLqok/koSR?=
 =?us-ascii?Q?j++eTOAJmJ79adOID2SyHFLXl2QF1MqmJGtkXsSeoLqPCsfkW5CJdxPVkzOc?=
 =?us-ascii?Q?ozGkWLFX4vk/6ZI8hFPac3aKCecN7y7PK2AoelPH1FGSC5pc1OwB61sb1KsT?=
 =?us-ascii?Q?OSHU3zZbvLMnZ4Ka1fhJM5/1eO9RUUKevpV6JFNgimCSm91Pc7TqsS6XHDqU?=
 =?us-ascii?Q?XjdDujK1V5+pV6qotbYwyKyGMfZA2dDiY0X2idirfKZWKayLNdaV2jY+6j1l?=
 =?us-ascii?Q?Ji3e+PYhLTr47+bDI5s1q1qYqWTO51CrVx13wiNka0QWVnrVpEQnNxwKam7F?=
 =?us-ascii?Q?NJJo054o6HQYg2zlv0/Y8XUKNmPv9h7Cq8Shp1/GOQbA5zkYS230GcP02xrp?=
 =?us-ascii?Q?sSuisntLIIJygqdjccTkmihKH2RLfb8tiRb3CyhZSGP0OHdG5aXP6/IryYyQ?=
 =?us-ascii?Q?gSBh0z3h37JojA/aVWMsc+KySQd0zyW7NDWF/wZQvsytA7yG9grLzO6BIRip?=
 =?us-ascii?Q?k0Nzo8ZBwr5MoHWFrUQYh2hc7KdffTrKJzsdfVKZFNRGN75S/G97pyddWgiM?=
 =?us-ascii?Q?u1v4xL0eMHQgMHE3dHu6voEqQWLtgaVR+s9QC3lx3N+nmfwrADW+t/TDXsnZ?=
 =?us-ascii?Q?EnMhs3voetv2qMoR495DQtEJCdUYRMV38onuueVMwM/oMlD+RudkzEjxc9ce?=
 =?us-ascii?Q?DJJyk/2rt9q/z3drBic+haSeFJG1oyGp5MiM4BXuNOMecDUf/ptgJ0zVl6mK?=
 =?us-ascii?Q?RWTDAMKnlAr5cbS29TsUy340YSO3crOZ5iK9EV92Pr8Ostw6i5/UreWdd64U?=
 =?us-ascii?Q?fb6pJ2J62m7qWS5v9C3sO34gN5W36TlkP1qxBSed6n7Qj1pSyAP0jBKyuqfD?=
 =?us-ascii?Q?anE2Yw8rFwjIw9eevk/+rFhlSER4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZJtJl3jl8568zXr7PB5klDzJwThfVb5PxYngNjsh0EfFTgJJXR79X5j7M/lr?=
 =?us-ascii?Q?LdmITdT76BAUk16jYb7Vos2PXUc3pYp89z7/KWRDyto4lx/z0NR4Cj7ni5TD?=
 =?us-ascii?Q?MIzOEScJphQFlnP830ZG4/RN1Q+y7KfgCwuyCIYvbMB7T1WT6KsDDcslY8SU?=
 =?us-ascii?Q?0v/DfRU2q2onN5dkXzM2c73wHLxBFJ1V0a7wbf9WT3JouxEOKOsL7mzK6M/R?=
 =?us-ascii?Q?J1zr78W6j0Rpr6QVj+I3PJ5dZjtEczwYleJ5ZwpDXHdSydozRRbTAfi3iiOC?=
 =?us-ascii?Q?DesXXrRAkwtP12R9MmPL02s/xZtFPBgIq1gM4jLYN7bIWTLU2WvriwzKi6/N?=
 =?us-ascii?Q?eBUrC8y3yjMArbtqBbpfKELnMjdnGil48SZ0wX7R1+g/hr6PUjFgaHF9Z7aF?=
 =?us-ascii?Q?ed8SlhJGxO3SIc5QvkQDYsia+MvHctzHtfnYngFgSojAi364lfzAnlv2e6NV?=
 =?us-ascii?Q?/xTQxsXfdS8w4k+T8nrRbEGSoAUxJRMJy+f5RM3fL5C2CEsZVIxv/FqeXNLs?=
 =?us-ascii?Q?OLJit18pYn6D3blntS80bEQkdHaw5C47j1GEHzEgfnHmkFf13aRmN/dXyX5b?=
 =?us-ascii?Q?blOMuIPef0JEaxH1cdxCjsYdUiLzn4Gb2NXSTAGXDiyp4g1qsp2eJX5pa81r?=
 =?us-ascii?Q?9BMmbRNqTnsM6upQT9LS0IrGHiQxRadkJTJUJ6z+v9lD8ejWXagMmVy0X/0o?=
 =?us-ascii?Q?nzIIyOHxc03zznTKCOJdvTdKGHRu9nzivOE2WlBzi2f6J1dBYA61tabgqOwo?=
 =?us-ascii?Q?csT78pT1TT10ckR8NzIioEyjtjJhYLBHKOZ/IbDfgrZrAso1xNiGNcdgWWEu?=
 =?us-ascii?Q?6SLeLacdxchtTE0HaE5g87ZQ8ATVgbI/qJOhSCVkJxupbNVqlPBxjfkl3cY/?=
 =?us-ascii?Q?CzmpN2w5fykKWRsQj8OGTR69pLRSicWqyapMvomOgbNOSE3kACzWZ9bRWiZV?=
 =?us-ascii?Q?Cnvqi0VXPdsB1sP8uw9+qBvFJedIs32bW6Rd7OEQHqZLZMjOOagO1/sP0SPW?=
 =?us-ascii?Q?yElmblwfcasEAKIRmjRNLD+c3o0Myuj8Z86tETVQGxjor+XdJcGjVmUWLDVT?=
 =?us-ascii?Q?/gWYleRQagY9FaPHwgkNrQ3NeuPmmJF4A3HBKflbSNnga5CJcndWIU/Nq/Ul?=
 =?us-ascii?Q?KPaysFVzXl4kQWPu4MWR+7qXCM7JvpTKiXVg5465dVGwForFxjRU/9RQfac8?=
 =?us-ascii?Q?u1lYIGI1sp7edMJFnUfTnauhXP5ea3t20a0hKoq5KKHdSZmTqQosxPFPseC7?=
 =?us-ascii?Q?yBlQgR13ObdUy2Z3ixhUFFmU6AYb19SonTNmr8aJPy/4cXTeK0x3pX4gMHOf?=
 =?us-ascii?Q?asGp2orpv24DnYLdavQQHAN0ATjML+VNDL10XPKLdHgfirX9gjSIU8r+bB77?=
 =?us-ascii?Q?69yJgeMbRl6R8hA0wl2HM3zm2iEFcSnTXMgYP6ollukVsq4IJp/ryszLKCWh?=
 =?us-ascii?Q?aJJzx4x6SE0g/31mUWkdW8irFjaLlPPsQnQAn76YujTd/dC/+nVlq/2NXbv6?=
 =?us-ascii?Q?km9dmaTvh94epWy+KmJG1RA0PfPD9JyceprBLB3vvozhw++CwiqkyK40mb8j?=
 =?us-ascii?Q?6wZM4/Q8mvWFn9gPP+f1Somzcr0RXJR6Tf2Ua1EKJqdRRtx2mlqTP/z0lzWh?=
 =?us-ascii?Q?aCjepwYXZ0qidRUzT36UlPM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea3c3cff-d2a4-4106-bb0b-08dcf3cb1f0a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:28:10.6372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qAPFmHKOFOe/mIJqfPlfI+gr32l4o2bw8gR5BlS9IKGCYJrcMe2Mrvotz/h4PDJtkrgHo2oFwC9Wo0nB+vLTPS+7TSbhowoWrYrDyY/hqlJEqktnVJYhcdTXmU0nR4nt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10892
Message-ID-Hash: PHU5P7VJNACC4V6EBDT6Y2CXEPLQXEDS
X-Message-ID-Hash: PHU5P7VJNACC4V6EBDT6Y2CXEPLQXEDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHU5P7VJNACC4V6EBDT6Y2CXEPLQXEDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark

rtd has own ID, but it is naming "num" for it. The naming is confusable.
This patch rename it to "id".
And many functions request both "rtd" and its "id" as function parameter,
but rtd itself has rtd->id. This patch cleanup it.

And, Qcom driver want to use irregular rtd ID because of its topology,
and thus, soc-core need irregular calculation. I'm not sure why only Qcom
needs such calculation, but this patch also cleanup it.
But I guess we want to cleanup is not soc-core but Qcom side (?)

Kuninori Morimoto (8):
  ASoC: rename rtd->num to rtd->id
  ASoC: fsl: switch to use rtd->id from rtd->num
  ASoC: meson: switch to use rtd->id from rtd->num
  ASoC: sh: switch to use rtd->id from rtd->num
  ASoC: generic: switch to use rtd->id from rtd->num
  ASoC: remove rtd->num
  ASoC: soc-core: do rtd->id trick at snd_soc_add_pcm_runtime()
  ASoC: cleanup function parameter for rtd and its id

 include/sound/soc-dai.h               |  5 ++-
 include/sound/soc.h                   |  8 ++---
 sound/soc/fsl/imx-card.c              |  6 ++--
 sound/soc/generic/simple-card-utils.c | 10 +++---
 sound/soc/meson/axg-card.c            |  6 ++--
 sound/soc/meson/gx-card.c             |  2 +-
 sound/soc/sh/rcar/core.c              |  2 +-
 sound/soc/soc-compress.c              |  9 +++--
 sound/soc/soc-core.c                  | 50 +++++++++++++++------------
 sound/soc/soc-dai.c                   |  4 +--
 sound/soc/soc-pcm.c                   | 16 ++++-----
 11 files changed, 60 insertions(+), 58 deletions(-)

-- 
2.43.0

