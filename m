Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF5893685
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148371919;
	Mon,  1 Apr 2024 02:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148371919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931339;
	bh=SyneEC7aVLoFnsyOBO9XPw1FmhUlQ4hbsYXFy9n5lY0=;
	h=To:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OfG+N/N0E3wmWIcZKSga0fMH5vOber4pgVWPiiPj1ZAfS+ftmsV3ee2a19dxn1Cvc
	 3lngdJAocU5i3y/SOR0lDWnmOjTityBHNfoGL26qzj33CPRPDyQpAdO+4H9dz+aI35
	 xft4bHwSecyIrZCSteMiHb8QdqWLkdACAtP5tmTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 122A5F8057B; Mon,  1 Apr 2024 02:28:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BC35F805A0;
	Mon,  1 Apr 2024 02:28:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0B50F80236; Mon,  1 Apr 2024 02:28:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F8FAF80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F8FAF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BMMwnns5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPsrivVz/GIx2q4JPMAzBkJTTl95V/TC0cNSk6+CNzCGBJiJAcYgxK4I2INpP9WQ6STZfVo3WCzSLxy5MHvyjBwoJ0ijIMfnl+HQCo55tUcO+tyXqPQ6BLmQRiPpdZEnCD60yVOKeYBdl5/jnre+slz5q7sq4M3ZhG1gX98jf3EcYjWV0f/4MWaQJyO58Iq2r+ZhuRgMys2u0K+yO73TxkH6KBD1vgRQCOqP0X762WUdjK+8AubGUg63Sisulk93Iv6tTiNEl9yxZmzfr+P1SAd64avP03wGcszkEGCPFEpqHUqWS22cc97eABiWVbVFDQGzs7b3pJwFLcR09hHryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoevXD4g7BBS/Eca9R+O8x214bgT58QaAzMPPPLQcPM=;
 b=J11pQ9YTbFS5fbiQs8/Hp9RlCkN/iEROKvpWe0UPf410f01qD7DQRKjZydTMfMBVZJqjgF4s3WLqmadhoEFwuyXzm8hwlJ6OwrfPOaj/eqi4Jl6b7WhwAdxJbrMyXmiA5+mZnXFBsRG9wbCUaURk2lx0EkzqfmQVV/g1oCAq26C9rOFBJ/lOfkxY4w1IM95jnznsENz8gKJA+YE5WSSIQvt7cs1D0xMPwMz9aH9/PO0/1jT6Cnmsy0vRv7olEUv9eECSTAz8IIBSqom9IZBZklfRHzGIP9kUIF3eu8JI8GKr/WKp+Eyw0fmKF3nDkWIrEVyW7dba5RufP/4PkTH7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoevXD4g7BBS/Eca9R+O8x214bgT58QaAzMPPPLQcPM=;
 b=BMMwnns53YcGdtZHDjOmSXCEjkoONQJwhjqbIscwHZY1Z0iSCYmpk8R/cq9TpZ0hYqagmjVYvZhqZsq+9UjbaI/RsbEXQab38m2a5LsPv2DN5LieG/e0aH2174swOusKNeQprXop12aLLTddrhm87YJKBkSOQqKDk1OKkudBUJE=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:27:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:27:58 +0000
Message-ID: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
 Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset=US-ASCII
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 00/16] ASoC: Replace dpcm_playback/capture to
 playback/capture_only
Date: Mon, 1 Apr 2024 00:27:58 +0000
X-ClientProxiedBy: TYWP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5AUQ6+59X6cs7FkWRhQYjxf/lOAUkzjG2oPOIulA4E7MbOgrB91eEMmBmno/PkAKFyKAYtdxxbl5CU9UJaIpPX0Og+2j9MK1MFNotxII0dCgu4auwwtObxWR8P8EYZG94krYwqXks+T+AGe94/zkGoNYIyY1RW7IU+JWdD4ASsYfCheOtvF+4O8sswi1OuPRHw3wud7hAALs5fYmZR4r8RVvT1TBh1mfnXNIpwj82xgOXMxP7h+uDLBocEWA0MkTUqJl1kuVvDhJ5fhMIaf9a0oglxDLOWBztGCtWoDQeingaPMqgcb85GCcmtnFJgZzdp2O3qoxwbFzcmb+MF+nRGHoekqrNWsD6Ctr4Js6oZ2GXEd9N/UoUWEhbMIaZS5GxYeh/l/KIvx+UTIUDCBdAVoUYBKzYyJ+Auqbo9t/5MpP1dmci61KfxP639O6mbbQ0Hjqjz50HChZM17+617a24oap2NoumjNtyYa3GP10g4Z2Iq6Kovt6zw3Hx1sgNEjLRTZTLIe+BBrZi1fV4i2RD9TBZ9MprE+oTQpp0vvxQyceNie9iNg6pjoNfXI8gHb7I3eq8x3gezK9uv2efPpJ3lX7FNvyRg5rwTobbEVzy0EirGZJkFmWEd2Z/VQj9IXEYwqTnAFIiqfIxUUJcgZ25UIkrEXasL2ZdGdp113iVI9O5AK7NRK9YA9xBu4d4Xd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lGXlOYNgiCmUNK/yl1Qaqe8R32tgx4GbzceeqnAeaTd3ZdgYRhxsJI2ls7gH?=
 =?us-ascii?Q?jK/vsblYDVvQoHUKwWZ7ySEAdN4zI5Z+0FaeZXBhrbYLRFDeuEKZoiwtWSnQ?=
 =?us-ascii?Q?oejX+QJsAzBZ7ntvnr96h3s6VzN474yZ63RddJnDyV+5QSR9L50vPxaclx5K?=
 =?us-ascii?Q?CbP1LvkXdouSwJQm3g7FVM3J8w7UzBSZgywKCzgWUDL4MuLAekHJOVq/y9kK?=
 =?us-ascii?Q?muYxpCrLLLb4JULD5xwb25COoifoelcAH/o1OhkP2NTLNnx5ags0msFnCsCt?=
 =?us-ascii?Q?Pd/jn1TKYI5I5gnlvPBQ2ceRGb48iVOETb7RryVRBjfS/dP5E+Ejli9f7FRo?=
 =?us-ascii?Q?ibnbaoRZC/HLbSctwIDIy2CNczOd8eBm23LSBBC7V6whkJq87cjUL36unJ3A?=
 =?us-ascii?Q?5UUpH4IJONTFe6QGX3Z9XMsbQ3we7yvl5VvIndRxjkE/LQ20Z0vjVHYR6ggS?=
 =?us-ascii?Q?kYIXel7p4Y+QfQaNy3bFF+SKLB8qKh+ynHJlQj0KWWRbnKtyTpEoz9JWdSea?=
 =?us-ascii?Q?Jj5hqz/v/dyx3OM+iS7H17GS/TjbbThV4FjdTzNx/Vcuo1lxGA5rUHBRm3sj?=
 =?us-ascii?Q?cFYZuMI1JSJwecRzdkh3pKf3rhe/+G2wJuajMdPxoKS3AnrOG4gwOddBOHIR?=
 =?us-ascii?Q?pGU3IjWoUGwDrV5puWH2ljgdQgOUxUBZMW5Sqw87EHIO27kR9j2kANBDfr2f?=
 =?us-ascii?Q?RAlmSpMA8uLCOXxpcgzzddq62kYWb8GY7OHdEVhsgvcyDeTLgxpt9G4QQuVm?=
 =?us-ascii?Q?TR1zZEOpN3sVg+WnKe2WFb9rG+aD3/olkqOSu2VH5RUWVC3a9TxgXOCTKn0k?=
 =?us-ascii?Q?BmwK3hfb10xKh7S+MMNc3hAcKvexySJ7gVV7fXQNspHJRy4hMQEoAXPQOZ91?=
 =?us-ascii?Q?tHX+zUBvNyUAyww0/hWcku920rEwj2MRgFhdvx0dvnbXGJUMYi0F5hEcyoXI?=
 =?us-ascii?Q?+xMUkuDIIfGdF3/aeYcr9N17SpCqhz98ZfIDw2ZRM11RsmDJB8dTDQ13XP6b?=
 =?us-ascii?Q?UqNO1/BUJ29NBW+cJb0J3/Umg5RJQwbFBzY68LgS1DJrLTeNehII3+ffuHqi?=
 =?us-ascii?Q?8zm+ahDm3A2LwhcS6DQ5Jan1Q/WbokNukUsmkuRkzOEhgvUGPCj3bcwxkWKv?=
 =?us-ascii?Q?YeEMsRN8D2g4Rtiwl8cXT3vH55wgOq2oRnW8Pq86ZnhWfNlVhqyLG2MjpLr5?=
 =?us-ascii?Q?95RWiEVLeyNtT9UNUpBWZhFIMiBfeQzBhtB9IjlAZcm3yDiULKW5GVq7Li3Z?=
 =?us-ascii?Q?aCQNDKMxko0M65tUsr32bCsGNXXNAdH6/2V7OJ0xBMP/ZpbppD9jC/jhnZ+X?=
 =?us-ascii?Q?fUCV0Nj8IjxnWMFr5iQZeNE58bXgUIchtODj06GEaNcMlGJBZ7Q33p0kwqwR?=
 =?us-ascii?Q?sZP3fij3V5CpGHbx9WW0fbBaqV2X1Xaa17P/v3g6S0BU02pDqpKKLjgItIZc?=
 =?us-ascii?Q?cr1fDox3TQeAzTF1nkGzEhRnhJPaiU3kV8H+Hv3JBHUShcXsxYIcEOJnvmEQ?=
 =?us-ascii?Q?dGrHQ/owSEjglHMR5EdgnAmwyG4HfMhllD3cYVmGyJ+dQvpXg0BIbfFYbi2l?=
 =?us-ascii?Q?Wa3BfiQRM8I8IOEDny5EzH8jcCPMc8afFDGvq/LqKVYc2xc2W6V4EaT9bkpV?=
 =?us-ascii?Q?l8kvq24KsTiVNALqXXlSYYc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 94b97e20-fb49-4ea3-f591-08dc51e294ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:27:58.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XJOUhT4YHqNPTcfBVY9qDRoPcr2hMKsw6lumRCnpB5Ju2Tg+piusVoqVF/XUrZxI1yHXFn1Ej7vuS75dmHaAYfOCC946Y1RmSgJuo0o4NEFydKveYFNNDxCQve71WGIw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
Message-ID-Hash: TUGFLO7CAIMCDM5DVD4IHWT2PA2T5YKC
X-Message-ID-Hash: TUGFLO7CAIMCDM5DVD4IHWT2PA2T5YKC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUGFLO7CAIMCDM5DVD4IHWT2PA2T5YKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is v2 patch-set

When we use DPCM, we need to set dpcm_playback/capture flag.
If these flag are set, soc_get_playback_capture() will check its
availability, but non DPCM doesn't need such special flags.

OTOH, it cares playback/capture_only flag. It is needed.

This patch remove DPCM special flag, and replace it playback/capture_only
flag if needed.

v1 -> v2
	- based on latest ASoC branch
	- keep comment on Intel
	- tidyup patch title
	- tidyup DPCM BE warning output condition
	- Add new patch for Document

Link: https://lore.kernel.org/r/87o7b353of.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (16):
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
  ASoC: amd: Replace dpcm_playback/capture to playback/capture_only
  ASoC: fsl: Replace dpcm_playback/capture to playback/capture_only
  ASoC: sof: Replace dpcm_playback/capture to playback/capture_only
  ASoC: meson: Replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel: Replace dpcm_playback/capture to playback/capture_only
  ASoC: samsung: Replace dpcm_playback/capture to playback/capture_only
  ASoC: mediatek: Replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-core: Replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-topology: Replace dpcm_playback/capture to
    playback/capture_only
  ASoC: soc-compress: Replace dpcm_playback/capture to
    playback/capture_only
  ASoC: Intel: avs: boards: Replace dpcm_playback/capture to
    playback/capture_only
  ASoC: remove snd_soc_dai_link_set_capabilities()
  ASoC: soc-pcm: remove dpcm_playback/capture
  ASoC: soc-pcm: indicate warning if DPCM BE Codec has no settings
  ASoC: doc: remove .dpcm_playback/capture flags

 Documentation/sound/soc/dpcm.rst              | 14 ++-
 include/sound/soc-dai.h                       |  1 -
 include/sound/soc.h                           |  4 -
 sound/soc/amd/acp-da7219-max98357a.c          | 20 ++---
 sound/soc/amd/acp-es8336.c                    |  2 -
 sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
 sound/soc/fsl/fsl-asoc-card.c                 | 16 ++--
 sound/soc/fsl/imx-audmix.c                    |  6 +-
 sound/soc/fsl/imx-card.c                      |  7 +-
 sound/soc/generic/audio-graph-card.c          |  2 -
 sound/soc/generic/audio-graph-card2.c         |  2 -
 sound/soc/generic/simple-card.c               |  2 -
 sound/soc/intel/avs/boards/da7219.c           |  2 -
 sound/soc/intel/avs/boards/dmic.c             |  4 +-
 sound/soc/intel/avs/boards/es8336.c           |  2 -
 sound/soc/intel/avs/boards/hdaudio.c          |  4 -
 sound/soc/intel/avs/boards/i2s_test.c         |  2 -
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98373.c         |  2 -
 sound/soc/intel/avs/boards/max98927.c         |  2 -
 sound/soc/intel/avs/boards/nau8825.c          |  2 -
 sound/soc/intel/avs/boards/rt274.c            |  2 -
 sound/soc/intel/avs/boards/rt286.c            |  2 -
 sound/soc/intel/avs/boards/rt298.c            |  2 -
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/rt5663.c           |  2 -
 sound/soc/intel/avs/boards/rt5682.c           |  2 -
 sound/soc/intel/avs/boards/ssm4567.c          |  2 -
 sound/soc/intel/boards/bdw-rt5650.c           |  4 -
 sound/soc/intel/boards/bdw-rt5677.c           |  4 -
 sound/soc/intel/boards/bdw_rt286.c            | 10 +--
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++---
 sound/soc/intel/boards/bxt_rt298.c            | 26 +++---
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 15 ++--
 sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++----
 sound/soc/intel/boards/hsw_rt5640.c           | 10 +--
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++---
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++-------
 sound/soc/intel/boards/kbl_rt5660.c           | 18 ++--
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++-----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++---
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++-
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++---
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 +++---
 sound/soc/intel/boards/skl_rt286.c            | 26 +++---
 sound/soc/intel/boards/sof_board_helpers.c    | 13 +--
 sound/soc/intel/boards/sof_es8336.c           |  8 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  8 +-
 sound/soc/intel/boards/sof_sdw.c              |  4 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 ++---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++-----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++-----
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 86 +++++++-----------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 86 +++++++-----------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++-------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 +++++++------
 sound/soc/meson/axg-card.c                    |  9 +-
 sound/soc/meson/gx-card.c                     |  1 -
 sound/soc/meson/meson-card-utils.c            |  4 +-
 sound/soc/qcom/common.c                       |  1 -
 sound/soc/samsung/odroid.c                    | 11 ++-
 sound/soc/soc-compress.c                      | 10 ++-
 sound/soc/soc-core.c                          | 20 +----
 sound/soc/soc-dai.c                           | 38 --------
 sound/soc/soc-pcm.c                           | 87 ++++++++-----------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  4 -
 91 files changed, 502 insertions(+), 863 deletions(-)

-- 
2.25.1

