Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A5678DF0
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:08:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F8A283E;
	Tue, 24 Jan 2023 03:07:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F8A283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526109;
	bh=6J1brBCKy9dNVQAf6zL/b5bDw9jWI2HR7TWUFLRoReE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ke7ZcY3+XL2fnTvlwGRPC2cxg0ayhgHX+EoDIpYC9CIjxNHdxk9JgF+srH24Y82r0
	 posaNZDZLilhbf1zr2+vESEU1yqfXXE4WmH8g0QwY1cuBHRkunn+n6o/fFcHNVWCeg
	 hiiAN9MibQ57hvPkzkyURt8nAe3HCXL36z2aBIt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E194F801D5;
	Tue, 24 Jan 2023 03:07:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A77CF8027D; Tue, 24 Jan 2023 03:07:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=no autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EE90F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EE90F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YrC2d5KU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx5fku9cbly/u7ly3XJvUvO1tER4i5xBeT/EWKMXmW5ihLsh9GpurSJKsdvrRCsCA1unNdnGPCHaQbX1xoDCQ2DtqFH7dy5O2Lwkxz4dRRP4YgQBIVi84EyW6Y/gR4L0ezJ09Wq7jmkGjNFuRL6ShEj7YNPw1FXti98MbkIV0ZOeF+Wi9ZvWG1PLho6hbcTcpuc5nQzgZg/EbDKrMJH3eldd+cCx1kaa115J4FcYzJwqttdSN8PFn8qbb4DcQcO7JsIuMmW1K9MlTaPRew1XKcZ/r7fiICtg61xHOn42FYKzT5bvlJvrJUeXWmNR/uoVnRxDtHhC3xjY2XYJ7yepTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sURIcjO+j0SpzjzF+1b+C2la/pYw6v/VKfXTUNwwAVk=;
 b=K/mIBW5HL9EgunihKwE6pg5IC22bKPluoqcCOqcZOyB4VNXbVL/yvu9LjCN2W/x+08cMH+4lkmaKFrExHCMBQGiKw5gmLe6Szqt9mDM4U543cfEJox8fLTkl01RjKynTeoIcM4DqBZqRby2mDZPSCxG+B/ReKelvQ9t58mPF0ujwRM+rd8MwYlwyneBqPalZAQ1gKXydbIaIBF70o5bMgOcfqEngXiO0+yd0+gYpZHZXQMLNmxu2gTM5TLXzR2zxzvNXOWmiK9i+ZZW11T2rzP0Cc/j1K/UW+7LX1gZ8zurIi6mTYWYfCjfCwA7IQDnT/5zWNho4Shshfg0GVIiZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sURIcjO+j0SpzjzF+1b+C2la/pYw6v/VKfXTUNwwAVk=;
 b=YrC2d5KUrRjZTmovr8/YS8bv+dbsqmP5hX9eieE9s9UDQyMnA9bU0T6QxDHFoMUiu4LVmLKwXPCWeZRItRwINiNq4/OYUIJ7GYpOdIbjwLyrlZ1HdiREaQbJCC1SNaFPPwV5rRQL3+2FqzCkwL47Hu8+3OXehlm0FolJJ19ZcKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7701.jpnprd01.prod.outlook.com (2603:1096:400:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:07:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:07:19 +0000
Message-ID: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 00/25] ASoC: use helper function and cleanup
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:07:19 +0000
X-ClientProxiedBy: TYAPR01CA0233.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: cbffab1b-e229-4826-2f49-08dafdafb939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jdGzFIetoGlhSkHKDB9KzhLo5t3EpwwWPKdMOOW/7k1NMb2RVJDfmhgas/JzPXeAnN8gnAHt/VkE0iAt7gdj4fCs1VAUGDJGwsXfipRbYGqeNFLYGmFRgkW/FkzukV1aQyADhGvVDqAu2X3ihg+Wpgbe56ELwqfv4J1bEkuWJxV3zA0vspi3rggfHnit0lh6LWv5CQ0/rtV/u23llb4Dcg5kw7pyYP7APxCrXdFz0TwbkE+BO4vVdRXa1JKsRWmnP+lK1pjf52tPrngBdNlKcNEOjgB0tzIHtlLQ58OwFXr9CHAvH1HY+sCg3MIakIZh27VoMxQaJfZtcBueh4WCcXFkBixmcW98ZaecV5cd9Zcyp49FTiHr6+GG0rEX0Iym2O1hSdkAghpZr11yY8WKOO+IFP9yZvsULZqaimYkOd8HgC/4MkqT3UbWGJkD/LO6w7oakB8Tvr9xyZ8OX1Y6f482bNeVMdb5L5cH3tITeMZQ7yrqWO9Iv+lfNzqDlZtPRnzlC52Q+nE3n7yc+D8EbAgaLwNTv5LVLfpuY5c/z19ctbUZFNOFWoZSbmQ9n6qByeyHBwbEGOB91MxiK4gNhI/yZbo4Wr42Nqe9FTBMoN+J3Rv/dJo1tAXVefBnSFAsjSyoOvIzQjsrYsSLJ4021+VAqUqo7DFqSgtidxBgkKegI106Gkq3gf4rQsA0l7ksiC+B9G4cqLq32h+VLyDODmHkbjDVCMFueWIDBWpU2YabBS+WKfL9le/+p6yvNI7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(8936002)(6916009)(8676002)(4326008)(66556008)(66476007)(66946007)(36756003)(83380400001)(6486002)(966005)(478600001)(6506007)(6512007)(26005)(186003)(52116002)(2616005)(86362001)(316002)(5660300002)(2906002)(38100700002)(38350700002)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qqlqkidFlMMRl2xffp7wkBjoGRqpZwQPG49eN5IzdpuJr7kqdgTVwrTPAONp?=
 =?us-ascii?Q?AVkEK6G0/jWHwNUgwUYi+rTibukBOvmmeT0wa2HnWm6nkF5hBUVGufTdJ3Vo?=
 =?us-ascii?Q?LtkrjpQy/hh8ufjZEL8eYSLY7wQJGKBpLkNT2UOKxZTkPhhSr/FruOY7ZIp3?=
 =?us-ascii?Q?jyyCs8932wus5gNrFghmoY4sPoFlQKa6ruDEcFm93YEel4OJj9zJGwzJBWP9?=
 =?us-ascii?Q?wigh8fB2qa7HoUiYz7deltAaXToHUJak8nSlJPrd2S7j/3+VTah1ccN/yFS5?=
 =?us-ascii?Q?KxDiw5YQYc1M9toC4UNkdMnCesGKyAw5FU/6OJqiF30s0axo9IHp8hULxMtf?=
 =?us-ascii?Q?XTNDLGf15RBz+hSC6f5VewjCq7BSr9a9429G/cRGdJD8fcpkrccFuDfUdYJu?=
 =?us-ascii?Q?v9KXhhOtsl+/ivRqgvECqsArchkfZ/lfAYFTwBdIPYaUxySxlBcP7++DrnJF?=
 =?us-ascii?Q?IBMqRd/KEIuZS4DgEc80c5gTBbeC3VxIz+EfEe7sNJHOEqXxNAdLSVxCs7ao?=
 =?us-ascii?Q?DWNk+30HL4w1nCc+sCQOpSedsGkM7vxdos4REYIEVPcr3373sk/5b+ROeypC?=
 =?us-ascii?Q?PXnibSOt3HDqM0TU2A5t3oE8Al207qhz8tr45DShmGZTOLQU+3+lLTsk8Btk?=
 =?us-ascii?Q?cYdmR1wiNG3GrJn+xvY6ioc5Tt94vDyRQ8oAMDZyTg3a0YnfrB7fVNnqXyQA?=
 =?us-ascii?Q?ZLhFQXHjuy84Ibk64IDaysiMLN/CmBUMNJ7/Op4kB6bdoe6Br5xCb397w0SU?=
 =?us-ascii?Q?1SadkdLYhqQMom7uAJLSUUr3aaXZyLYpSknBtdvoDCRKnSk+orfbDj8EGHfz?=
 =?us-ascii?Q?3tMRsjRlReTfvDfqHbRZ3iG537cncJZvOB9Be0hPnjP5MOu3apQyqY8BxRa9?=
 =?us-ascii?Q?cFUT27p84Bfg59LfHkp93pBiTPuGg8NmVkBCiPBvW642Z6kBQJP+bOxb/YA2?=
 =?us-ascii?Q?ycJaduEUaNKmjANwO9y1ciJmeh45ikPHoQtDnckkZc1ahFsykAtw4q0NuVo1?=
 =?us-ascii?Q?asf0/5Pohh+JCtd8orcysJ3dqOKNE72mBbilS32sVDDmUonmL87whlC/Q4ij?=
 =?us-ascii?Q?2qPXne2Zf/AGCeRoKlkoO/xIOqMXdDwr48+qpTliPVq7xR3yee8WfrNVN9ic?=
 =?us-ascii?Q?gwcQtUauCrowRoWUsLQJUfQODTQMw3IBHWUjEVvmgsPrCDUylEYQwl+theSF?=
 =?us-ascii?Q?1Ijo1mdWeeVL1KHFtS16/C3e5bJgn05CM/DBjoxgJIbpW004jg2E/s2nyP8L?=
 =?us-ascii?Q?02aLidNNbXkB26tfVHCpvhJn5SJ78E8GuPawV24H7Bq1uMPXcWsUqZYdNfqD?=
 =?us-ascii?Q?QeLs8j7De+DMMIaKmv0Jm0GhMIi+QlRxvSlqnN2ig5Ktuj0yxoZI+4zQGF+B?=
 =?us-ascii?Q?N0I6Rrv6ygbbOjR84i97Mkn+yshQzbGv23RBLsxiyHnRGlFGvLCsW6xPGB8Q?=
 =?us-ascii?Q?0MysSUW3R4B/XKD17Lvr2xJsirByzIaOyp9v7dQaSjreiMNbW215zDuDaAAa?=
 =?us-ascii?Q?Yjp0YpnTfWaOkFwVC89IwVpPQJZSLMPI99fnQ1nYHXrQOP/X63YSBd3hznxl?=
 =?us-ascii?Q?984Q8CwCrgan3hWeGmVrlyPYdAOVVTTf5DnjO3B7hb8AEcz3gZ1UgUpeiANU?=
 =?us-ascii?Q?a420eZ78hcxYS8A4fP/u+7A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbffab1b-e229-4826-2f49-08dafdafb939
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:07:19.7014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aurdZ+d3VYPZqDOukhlpMirQa3yGgQh33v8vOAJ8EUoygwDCWBPImI+XH0tdR+1KDXzrprqWw33TUyERf/ljERher86i8qVAZ4nBvjux9wOgEgKny8Sp+x4zF2Qn3ZmT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7701
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark

These are v2 patch-set to use helper function on ASoC.

I'm posting about DT schema fixup, but it seems take longer time.
This patch-set is 100% independent from it, so I will post it.

struct snd_soc_dai need to have info for playback/capture,
but it is using "playback/capture_xxx" or "tx/tx_xxx" or array.
This kind of random definition is very difficult to read.

This patch-set add helper functions and each driver use it.
And cleanup the definition.

v1 -> v2
	- added Reviewed-by on each patches if it got
	- fixup soc-dai.c helper bug

Link: https://lore.kernel.org/r/87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (25):
  ASoC: soc-dai.h: add missing snd_soc_dai_set_widget()
  ASoC: soc-dai.h: add snd_soc_dai_dma_data_set/get() for low level
  ASoC: soc-dai.h: add snd_soc_dai_tdm_mask_set/get() helper
  ASoC: soc-dai.h: add snd_soc_dai_get/set_widget_playback/capture() helper
  ASoC: soc.h: add snd_soc_card_is_instantiated() helper
  ASoC: hdmi-codec: use helper function
  ASoC: hda: use helper function
  ASoC: max: use helper function
  ASoC: rt: use helper function
  ASoC: cirrus: use helper function
  ASoC: spear: use helper function
  ASoC: sdw-mockup: use helper function
  ASoC: intel: use helper function
  ASoC: mediatek: use helper function
  ASoC: meson: use helper function
  ASoC: rockchip: use helper function
  ASoC: sof: use helper function
  ASoC: tegra: use helper function
  ASoC: ti: use helper function
  ASoC: soc-core.c: use helper function
  ASoC: soc-dapm.c: use helper function
  ASoC: soc-dai.c: use helper function
  ASoC: soc-pcm.c: use helper function
  ASoC: soc-topology.c: use helper function
  ASoC: soc-dai.h: cleanup Playback/Capture data for snd_soc_dai

 include/sound/soc-dai.h                       |  90 ++++++++-------
 include/sound/soc.h                           |   6 +
 sound/soc/cirrus/ep93xx-ac97.c                |   4 +-
 sound/soc/cirrus/ep93xx-i2s.c                 |   4 +-
 sound/soc/codecs/hda.c                        |   7 +-
 sound/soc/codecs/hdmi-codec.c                 |  11 +-
 sound/soc/codecs/max98373-sdw.c               |   5 +-
 sound/soc/codecs/rt1308-sdw.c                 |   5 +-
 sound/soc/codecs/rt1316-sdw.c                 |   5 +-
 sound/soc/codecs/rt1318-sdw.c                 |   5 +-
 sound/soc/codecs/rt5645.c                     |   2 +-
 sound/soc/codecs/rt5665.c                     |   4 +-
 sound/soc/codecs/rt5668.c                     |   4 +-
 sound/soc/codecs/rt5682-sdw.c                 |   5 +-
 sound/soc/codecs/rt5682.c                     |   4 +-
 sound/soc/codecs/rt5682s.c                    |   4 +-
 sound/soc/codecs/rt700.c                      |   7 +-
 sound/soc/codecs/rt711-sdca.c                 |   7 +-
 sound/soc/codecs/rt711.c                      |   7 +-
 sound/soc/codecs/rt715-sdca.c                 |   5 +-
 sound/soc/codecs/rt715.c                      |   5 +-
 sound/soc/codecs/sdw-mockup.c                 |   5 +-
 sound/soc/intel/atom/sst-atom-controls.c      |   9 +-
 sound/soc/intel/avs/boards/nau8825.c          |   5 +-
 sound/soc/intel/avs/pcm.c                     |  15 +--
 sound/soc/intel/skylake/skl-topology.c        |  19 +---
 .../soc/mediatek/common/mtk-dsp-sof-common.c  |  18 ++-
 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c    |   8 +-
 sound/soc/mediatek/mt8183/mt8183-dai-pcm.c    |   7 +-
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c    |   7 +-
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c    |   8 +-
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c    |   7 +-
 sound/soc/meson/aiu-fifo-i2s.c                |   4 +-
 sound/soc/meson/aiu-fifo-spdif.c              |   2 +-
 sound/soc/meson/aiu-fifo.c                    |  21 ++--
 sound/soc/meson/axg-tdm-interface.c           |  34 +++---
 sound/soc/meson/axg-tdmin.c                   |   2 +-
 sound/soc/meson/axg-tdmout.c                  |   2 +-
 sound/soc/meson/meson-codec-glue.c            |   8 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c         |   4 +-
 sound/soc/rockchip/rockchip_pdm.c             |   2 +-
 sound/soc/rockchip/rockchip_spdif.c           |   2 +-
 sound/soc/soc-core.c                          |   8 +-
 sound/soc/soc-dai.c                           |  13 ++-
 sound/soc/soc-dapm.c                          |  26 ++---
 sound/soc/soc-pcm.c                           |  12 +-
 sound/soc/soc-topology.c                      |   4 +-
 sound/soc/sof/topology.c                      | 104 +++++++-----------
 sound/soc/spear/spdif_out.c                   |   3 +-
 sound/soc/tegra/tegra20_ac97.c                |   4 +-
 sound/soc/tegra/tegra20_i2s.c                 |   4 +-
 sound/soc/tegra/tegra20_spdif.c               |   3 +-
 sound/soc/tegra/tegra210_admaif.c             |   4 +-
 sound/soc/tegra/tegra30_i2s.c                 |   4 +-
 sound/soc/ti/davinci-i2s.c                    |   5 +-
 sound/soc/ti/davinci-mcasp.c                  |   5 +-
 sound/soc/ti/davinci-vcif.c                   |   5 +-
 57 files changed, 274 insertions(+), 315 deletions(-)

-- 
2.25.1

