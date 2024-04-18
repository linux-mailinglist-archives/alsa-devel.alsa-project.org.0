Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 143948A91CB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:13:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42DC09F6;
	Thu, 18 Apr 2024 06:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42DC09F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413594;
	bh=UBght8bpJ++Ea5k1ZzUWaNlBjjCZcFb2RfPDE9IUXCY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AQWH1pUxCs2s3cVO771jN47OZV3Z/nyeWS2nGH8GjHweI+P92Pxlh6KMa3sg+6nXN
	 RpeN9/Ii+gaCjxlCaZeVMXlydaCyfBZSd4ZB5sxUi8iiY+BzJIC2iEEFt3YQvXKtS/
	 Sms6tp9NFTbZo1j/sSmaFp7rlZyLA8NiFl3EClDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C781F805BA; Thu, 18 Apr 2024 06:12:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70DF0F80571;
	Thu, 18 Apr 2024 06:12:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EC2BF8025A; Thu, 18 Apr 2024 06:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0666F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0666F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Kg7uS2GN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1l2McHcn7ZGDCJh5N0e5cztJqT6YXrXo7l1xg1z0A8Cj6QiAgVr6BHxsAsz3+qKHgLWPFqiruLrd/1uaqzPmpvqMsVjQMcgp2og2J4wcfUGCIrTMbpis/h5wR2fG4pQj+H05x9QlWAG+IxrIBkbhc3Gv8QRILr5zSIMlyU/qZlkallyTKdboT4N7ffZ97vx3ZmTEkYb0XWpIL+PJoy8Vs3Rt9khRnf66nFrrH8mipZASQ+Zbax5h9PPa1xGsERb2hwnrGDq1ji0LiauSsoAvqagVsd2RZZHXBJf3seRIn0264zR89Hm6wPb8jWG95RB/H59Vp/BOp6MEAvpBgzZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bBN895/hUfq7cTbVS0IR4Y8A7BolwuL5sh79h4s84A=;
 b=SpWQE+h03r7V/Y+exf+MJSwgDDSHkM9lCptWOUONES02B1H/AW+wc5mSE9HUdl2NVNsRY/7IEDYU96w3oTJRPvKqS1ArEWudbsaD4dwXgZNW/VCjgPa4yy0i4THYyDsTXxaB8bZ7S0MCdmtPBsJlzLrmhw8ghnVMuMxx2fjlQS1I9VM2IxSqCsDcogNto96HEuE3b1nv1q7fmx1gRTBc3b3WIpLOEP2/aXSRIs7oiai+W2/eIrJTtWSw0+a7kwW2TgcvKy7R2JkssIuanNLFeOg7DHrlZEEcx7fXMQ5JChDYD22im7O/g8WQ3CDkWxZpnNmhLtGWLhlPOn0t6fcuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bBN895/hUfq7cTbVS0IR4Y8A7BolwuL5sh79h4s84A=;
 b=Kg7uS2GNgidMCsA44YYekbxXos6yOXGIWaQj4OZuytdYgdpoZYc/LHyXcWmczTLNIl9X/LI4URz57SO6NjZF/7f/cg82cy3jg0H7dKkZtgqxdj88whO+MyAD8A2lwRGNMB8XW6H9/gSOOG0pvDwQY0b+tvwFMP1K2UavPj9HowQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:11:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:11:34 +0000
Message-ID: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>, Jonathan
 Corbet <corbet@lwn.net>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v3 00/23] ASoC: Replace dpcm_playback/capture to
 playback/capture_assertion
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:11:33 +0000
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 568833dc-43e2-4159-1d8f-08dc5f5da24f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/leMqX/Exe8NO+UOqsSU+YD1vcO/W0z4YFLSBoUHbpWpnE3txjsrKhCjWFlDqavb5k1yR4w9T+kHfdIcO0pwnTc6SqxPtUXu88MNOjp1BzJkl5vAGiFmVxJZpZbVRBKt0PqL8vsmz6Yjs4A79mhd7poMvA/hkAq0EVI2hG/fhXPa3FYPOE0ypf+lFYCkGK2/NfcNZ6h4K6OATp7nyM7LzOtqsFRKkVMPWhx0VLs0B9EsNUJdH5PuvDjUz75/encAWW7AadltEV/vDVuPdj96HqdBXTe4JIleRQEYMoTgWb+/ZPU82G5Yj35od1Cyv7GfApcZdl+TBcdfzot6BjDfI+xiZvCVKK3a4yppowliJNLON5J4U7iY8lCHyM/9doS2yoYphc1VzrbqixSUS4hZWsbk3aKfI1WzQuWg01H6YclbuLJf42YBcQMW6GfeFDz6LmXttTzDVZSYDql/o6MB0G4G/sj5y8EFyg4cVjIglvLMjahhZNMntBGi0QpTuDpgCic+VUyF8bj3QzJ778UKTwTIMUcphveuouStUTChlHZORBPcVGZiMZyOwLYnggCGh+MUkkaMkEIr9tJCNMutFBPpHovymaNArrZhkJbDdsE/HXowV3THJFvecfxXy/rCr2dNT5e5z3w8cgrDsD9O3hExS2RKg8b3I9ZtyjUS5lWF2bX2JxYwcSe6YLSFaqp+Rz8dfJmaR9utqZsNEsDtpz9JOQnozHAfD4orWrKU4zlvF6852vfs1uyqdZtAVujm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TTR52/CMN9o1dzdDYulkGmgHry3p3n91QYCtEpYSfq6CfOark571e1NaP9DR?=
 =?us-ascii?Q?kCX6uwgWHYav5kSKo4E0eDTA2Q0JlTW9k8IrRocxkDSafsf1sdUdlDn5ESIw?=
 =?us-ascii?Q?BUZUVo1CZCCJRy3C2H/OfLOhO2cQFt7KjQiLK2OLAONXmV+4I0zcMKAlfo3u?=
 =?us-ascii?Q?Ls2fiHTzACFvz0IuCvSblLUH/DrR3CVNhj5Wi3pwRW1fGWzLmx+mwYw3Pv5p?=
 =?us-ascii?Q?23XNH2qpaIDPCbXYUYRbmW8uXKjrbxxrtKLWANEpq1jE/XydNqwznaCk21VO?=
 =?us-ascii?Q?3irKM/fT0d6g41zoUyhwOphzZPpoUW8gJi336Xy7ukhvc2dbJ1E+DMaqoVFU?=
 =?us-ascii?Q?s4IGF22jCjkrdqDk8uQ/+sY0eCC29JVbd450zMk5Nr0q5NBb/51Gjfw1PufO?=
 =?us-ascii?Q?cxzMty7blnrGXnYFxUF4TAnXSjD5A5Kw5fwQoaiiukYDMQbaRmSkntZe6gLU?=
 =?us-ascii?Q?rBX5n5Q3K8CjvxH2hHNen4C7Cv9bKWuj3A8IuipYdkXQ3+JOPsj/Gr94HevG?=
 =?us-ascii?Q?5xfWQeshJnXq8D7jzDD3UXKhfMJmCwMcMQptQKBtAeaoHd2QlhqCFTGA7+YX?=
 =?us-ascii?Q?CkogAzsKmzHGQ1Q7j0U7MM1671tRwZMpRVP0auIc7tkxqM8WznT7gM4wo1xa?=
 =?us-ascii?Q?HvriCWNaFlXTQSXD53UaMPVpXC+EfawvczAwgzADiDMg0MmKDIUIM/RiusIh?=
 =?us-ascii?Q?hNpYw3koHm5lEI0NTlOpAq0VomtbjZ7uy4yvRZiVk1taktjywo6hoRx0E5Dm?=
 =?us-ascii?Q?vISK2zupSA/fdcD8RXSvspZ3aafqpbenvDYzDuAXnrwuDI0RKNcW0b2gc9xh?=
 =?us-ascii?Q?tlhl7JiBX8qenNOEpBjOfiz88HQVY8dyUnwQaTrs6IlDYwDpfirY6m4gbnBo?=
 =?us-ascii?Q?aTnFnffn23ZmJMFcCJU4F41pqxwih1NufvmkwDCM+BKUNRkjou7EE+WQ0mkX?=
 =?us-ascii?Q?izmcFPw1vAGTQHf2RKnuQcat6k1ni7TAPb/zONytcwJzz11iuEpO/3vN3FpD?=
 =?us-ascii?Q?dXKq4q7qSzJ3G3pwVFfb7MRjGysMnSujUD+vgllKY8teA2JBfRuCNxolKPSF?=
 =?us-ascii?Q?ijbecmiu3pYvdwitVCkpSc71NnF7RSAUFpwZHU/+xeuf9iiyu1Xjmhcyt/8V?=
 =?us-ascii?Q?EctsIQ2Sh+v/t2sCdkn/vdGYsOM9ITcZe7R34ASMdL5iXe4yVpWLa6bP1OoF?=
 =?us-ascii?Q?ED/6gQVfjUXTPYs7TbX5o9czGqAILoxa2A0rF2w+J7BqGT6+GoiP6aWg6655?=
 =?us-ascii?Q?skLW1ERecr0BOKyzDJHOHHzYeFcm3E+5vyV+c/vidC5TrIrxaq5MRgZfKi+w?=
 =?us-ascii?Q?IC2Vo3aOmuDbQc3Iccgd4/rXcsTHxzxG3X3HFvpj+CoYupJljmXbXFn+obhP?=
 =?us-ascii?Q?art17U5PodsPU4iRktjkSZJpGuDyPf312yEDXuzvIDZEAWacOJS+Tp/oANF5?=
 =?us-ascii?Q?+2bR0xqxGu0JZF+Ww/uXQ4Vql/nHGJN/Z6afRpmJBdcME0UsB/adBWDbhD2r?=
 =?us-ascii?Q?FDvuKiQO/5NW+CbntSSJt5i7PRcbLpdJxQGbrrhOjgqQX0++vkTJpW/WxTlg?=
 =?us-ascii?Q?ZtRB2DF5zwljix8Od8slSUm7Bs4ZO2Lt7XqmOH+ta1m0FnjhK70SNdmjEqRs?=
 =?us-ascii?Q?0JkQL/5FtQtwKLsEUl0ziXQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 568833dc-43e2-4159-1d8f-08dc5f5da24f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:11:34.0304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kcpI/7VmtxV0ufxrBInD2EoJig0JmTtlQx18JbzSrQIyYtk4m+TwB0oYwkoTk8WPAzsP2ID4b9R/eUfVQ+oyF00xqykGiHN9DWwkeHjMRt7ewr37SUaQvPuAfinP1kc8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: UHPZKLUR4XKEY6NTVQH2PPNJND5E3LHN
X-Message-ID-Hash: UHPZKLUR4XKEY6NTVQH2PPNJND5E3LHN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHPZKLUR4XKEY6NTVQH2PPNJND5E3LHN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is v3 patch-set

When we use DPCM, we need to set dpcm_playback/capture flag.
If these flag are set, soc_get_playback_capture() will check its
availability, but non DPCM doesn't need such special flags.

OTOH, it cares playback/capture_only flag. It is needed.

This patch adds new assertion flag, and convert current dpcm_playback
dpcm_capture flag and playback/capture_only flag to it.

v2 -> v3
	- re-order patches
	- add new playback/capture_assertion flag
	  and covert both dpcm_xxx and xxx_only flag into it

v1 -> v2
	- based on latest ASoC branch
	- keep comment on Intel
	- tidyup patch title
	- tidyup DPCM BE warning output condition
	- Add new patch for Document

Link: https://lore.kernel.org/r/87o7b353of.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (23):
  ASoC: soc-pcm: cleanup soc_get_playback_capture()
  ASoC: soc-pcm: indicate warning if DPCM BE Codec has no settings
  ASoC: soc-dai: remove snd_soc_dai_link_set_capabilities()
  ASoC: amd: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: fsl: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: sof: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: meson: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: Intel: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: mediatek: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: soc-core: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: soc-topology: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: soc-compress: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: Intel: avs: boards: Replace dpcm_playback/capture to playback/capture_assertion
  ASoC: ti: Replace playback/capture_only to playback/capture_assertion
  ASoC: amd: Replace playback/capture_only to playback/capture_assertion
  ASoC: fsl: Replace playback/capture_only to playback/capture_assertion
  ASoC: mxs: Replace playback/capture_only to playback/capture_assertion
  ASoC: atmel: Replace playback/capture_only to playback/capture_assertion
  ASoC: Intel: Replace playback/capture_only to playback/capture_assertion
  ASoC: samsung: Replace playback/capture_only to playback/capture_assertion
  ASoC: generic: Replace playback/capture_only to playback/capture_assertion
  ASoC: soc-pcm: remove dpcm_playback/capture and playback/capture_only
  ASoC: doc: Replace dpcm_playback/capture to playback/capture_assertion

 Documentation/sound/soc/dpcm.rst              |  10 +-
 include/sound/simple_card_utils.h             |   2 +-
 include/sound/soc-dai.h                       |   1 -
 include/sound/soc.h                           |  15 +-
 sound/soc/amd/acp-da7219-max98357a.c          |  20 +--
 sound/soc/amd/acp-es8336.c                    |   4 +-
 sound/soc/amd/acp/acp-mach-common.c           |  34 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |   8 +-
 sound/soc/amd/ps/ps-mach.c                    |   2 +-
 sound/soc/amd/renoir/acp3x-rn.c               |   2 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  14 +-
 sound/soc/amd/yc/acp6x-mach.c                 |   2 +-
 sound/soc/atmel/sam9g20_wm8731.c              |   2 +-
 sound/soc/fsl/fsl-asoc-card.c                 |  20 +--
 sound/soc/fsl/imx-audmix.c                    |   8 +-
 sound/soc/fsl/imx-card.c                      |   7 +-
 sound/soc/fsl/imx-hdmi.c                      |  12 +-
 sound/soc/fsl/imx-rpmsg.c                     |  10 +-
 sound/soc/fsl/imx-spdif.c                     |  10 +-
 sound/soc/generic/audio-graph-card.c          |   2 -
 sound/soc/generic/audio-graph-card2.c         |  10 +-
 sound/soc/generic/simple-card-utils.c         |   6 +-
 sound/soc/generic/simple-card.c               |   2 -
 sound/soc/intel/avs/boards/da7219.c           |   4 +-
 sound/soc/intel/avs/boards/dmic.c             |   4 +-
 sound/soc/intel/avs/boards/es8336.c           |   4 +-
 sound/soc/intel/avs/boards/hdaudio.c          |   8 +-
 sound/soc/intel/avs/boards/i2s_test.c         |   4 +-
 sound/soc/intel/avs/boards/max98357a.c        |   2 +-
 sound/soc/intel/avs/boards/max98373.c         |   4 +-
 sound/soc/intel/avs/boards/max98927.c         |   4 +-
 sound/soc/intel/avs/boards/nau8825.c          |   4 +-
 sound/soc/intel/avs/boards/rt274.c            |   4 +-
 sound/soc/intel/avs/boards/rt286.c            |   4 +-
 sound/soc/intel/avs/boards/rt298.c            |   4 +-
 sound/soc/intel/avs/boards/rt5514.c           |   2 +-
 sound/soc/intel/avs/boards/rt5663.c           |   4 +-
 sound/soc/intel/avs/boards/rt5682.c           |   4 +-
 sound/soc/intel/avs/boards/ssm4567.c          |   4 +-
 sound/soc/intel/boards/bdw-rt5650.c           |   8 +-
 sound/soc/intel/boards/bdw-rt5677.c           |  10 +-
 sound/soc/intel/boards/bdw_rt286.c            |  14 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  34 ++---
 sound/soc/intel/boards/bxt_rt298.c            |  28 ++--
 sound/soc/intel/boards/bytcht_cx2072x.c       |  10 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  10 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  10 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  10 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  10 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  10 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  10 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  10 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  10 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  10 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  10 +-
 sound/soc/intel/boards/ehl_rt5660.c           |  16 +--
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  32 ++---
 sound/soc/intel/boards/hsw_rt5640.c           |  14 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  28 ++--
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  60 ++++----
 sound/soc/intel/boards/kbl_rt5660.c           |  20 +--
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  48 +++----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  26 ++--
 sound/soc/intel/boards/skl_hda_dsp_common.c   |  18 +--
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  28 ++--
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  30 ++--
 sound/soc/intel/boards/skl_rt286.c            |  28 ++--
 sound/soc/intel/boards/sof_board_helpers.c    |  18 +--
 sound/soc/intel/boards/sof_es8336.c           |  10 +-
 sound/soc/intel/boards/sof_pcm512x.c          |   8 +-
 sound/soc/intel/boards/sof_sdw.c              |   4 +-
 sound/soc/intel/boards/sof_wm8804.c           |   4 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  30 ++--
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |   8 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     |  34 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |   8 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |   8 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |   8 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  12 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  12 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  40 +++---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  40 +++---
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     | 108 +++++++--------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  60 ++++----
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  86 ++++++------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  62 ++++-----
 sound/soc/meson/axg-card.c                    |   9 +-
 sound/soc/meson/gx-card.c                     |   1 -
 sound/soc/meson/meson-card-utils.c            |   4 +-
 sound/soc/mxs/mxs-sgtl5000.c                  |   4 +-
 sound/soc/qcom/common.c                       |   1 -
 sound/soc/samsung/odroid.c                    |  12 +-
 sound/soc/soc-compress.c                      |   8 +-
 sound/soc/soc-core.c                          |  15 +-
 sound/soc/soc-dai.c                           |  38 -----
 sound/soc/soc-pcm.c                           | 130 ++++++++++--------
 sound/soc/soc-topology-test.c                 |   4 +-
 sound/soc/soc-topology.c                      |   4 +-
 sound/soc/sof/nocodec.c                       |   4 +-
 sound/soc/ti/j721e-evm.c                      |   8 +-
 100 files changed, 789 insertions(+), 832 deletions(-)

-- 
2.25.1
