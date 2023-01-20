Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DE674D87
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 07:58:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4143A2DD9;
	Fri, 20 Jan 2023 07:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4143A2DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674197883;
	bh=snKpmqQRtnx9/e/Jv5yGep4qqexTloH+i8PRm9+tjIM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RUA2aXp2/6MBxNK5DWVHo3l3Xj1fzgeWxRHhBtGqQw6zyqsM+dq2tv9Q87ZAXt5SM
	 77YoRuKj6HYPvTUdxY8fO2Wrj6RGthBWo2osrz8neIUaiy6y7Gk49svOi1BrDrVY6L
	 XuWBh8Qscck70X7MmqY8WDzujeGbfWq2/BfjCfo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A89B9F8053C;
	Fri, 20 Jan 2023 07:56:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A435F80524; Fri, 20 Jan 2023 07:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B19F80482
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B19F80482
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YUMzqi1u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jO5nbVaYLHgPMFLXQUcpDnwdS9P1l3N7ta5Dt14K74RIlb0JX9O6WSOlIIU7X93etdKu9WUZ2Bpu0yhquvxHtXsl2GzdQEaMgjZU2b8wRpNmg+XDqTIfjXo4Co5dPt5IGKECnS3rt9sxwlBBjui97oi99x2Wgp85b21Kk+YH1SNBxRJh6fnAuepKEglo0wiSovHayGFvAjFOW7ef4odmm9ioUaZnWl95NxaYWvMePpo5Qkl7vfZR2lyNWlqAz+f2HsPeZZ14/QjdqIYqfqNzI9FmHYqN/4PhQD+GgOyynbAUN7xXhOhvKXLGJt6R/c79QNYFcYvGEKqSwnpqVrteHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk3ywfCXBT2A9JOLH0pSejwElRPa7tU3KHqf1vNrrio=;
 b=Zovv201VkX/5HFOTdDVrTXEgFZb8LMdQN6YuDtPlji6CQrFOFdy7ttx/cO9PmoS2LK+5iPQ57B13LA3+L+rCaPHMCpNx1TIl/JmNfV0MhjoYZG6fx5O1jE9hxdvV9iS/PU22YF8/JMz8js4WKr1N6fCSuGT3SExrsMBJHIJ1S4KfTGbTCgtiL/7ugHUKweCmxCJUw7vR/NgoypucEa1NxdgQoM65xuwt10RK1PzYn/w2hM6cDIkGmUKBLfh5K2FsAGGtG4PXjAA5QLWNCzwtQopRZ5CfPn1SZk9RFYmvZVTJw49NycqtnpSStoJFdaHsiLxRW2e0d247H7uwWYyhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk3ywfCXBT2A9JOLH0pSejwElRPa7tU3KHqf1vNrrio=;
 b=YUMzqi1uqqK/nWbdxHZtKysb0pvrrGgFekOnXKlWNb5vWWFIcEFWmWOb7x7YRA3fLR0CpodiAMA7tkZY0PcMgOaWqwI3oz3FMO/QPk25d+E1DAIwN+Kt4EzdK+RjyMk18wBXzTLyp47loAVS91ldFrtte1wB61KTfqviLo7Kke0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9301.jpnprd01.prod.outlook.com (2603:1096:604:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 06:56:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:56:49 +0000
Message-ID: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/25] ASoC: use helper function and cleanup
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:56:48 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: fcddaa68-53d0-4008-c33c-08dafab38084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QclUWJlykZ7XJq2my3grusn7lSzKyU+e+wkScnXRnA42tPGzIWrqfbJPGQ0/W2lS3BfwNUomCdcyKR858n9e2lQJYyOYD5dVQTdDLkQO2wYzy7/dBbHNqGVx/O2qwRAxwWaGfSheapSelRgdO4LY1zcglEFy2420u7dUiTfB9V7kcMt2jLwILGB83xJKG1EvOdq6VHk1H46gsTrfPkrhJeKlWyXYs/cNap9bkAhKoLdEc6QUQ7SRO/7crjHDep7LFxreUV2/DJCqWzJf6P1JInBO9MY9GOrE+1XHHxfZzPTufdR0o6+jUpNIdmr6uR1af/wJMwWRvyff/7tRtEqty1UX/G/grFbVg1BziYERHXm52sARL5F89S9TRDeemnnDfpgXHyQcjMvkqrBvmRBFChJBCHRPslhy6vN4iSnRNNBSu76J1NMCBX42d//Fk33+NIcJK+di5JqpWN355Q1mdD/QmDQ2gNXRCT8NbAs4/x5vDTQ7DpsqswHdovDAzZDVw7KgLY/hbqji/MW+A2lTRD9Ni2ZPIPAmJ8FTHuxWDITa8GiS/DvWXqw17YgDgQOtbj4hYMvd3unNntZzCYKN2ZLZC90BwrxkikdQycezu+eCc0cDJ9xqz2iqOdarkT7KgSrc+n99YaBU+AcU3VMG2k6Zap8reDTcJADFn2+VN4krDvLSwiEGktHE32C16/2xdagidp/1JMrVQoMblg7EUExkVkg0j7LXBMz18ytx3VU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(6506007)(478600001)(6486002)(52116002)(4326008)(66556008)(66476007)(8676002)(66946007)(316002)(186003)(26005)(6512007)(5660300002)(8936002)(2616005)(36756003)(41300700001)(6916009)(83380400001)(2906002)(86362001)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cw+GY0BnvK1onNvGX/HSS8fVX986zDUk5lj8e2UmLbgn+9qvJCCcNy0gBTtR?=
 =?us-ascii?Q?4izykUqDOvnZwUcOMmgYdRwehRbz4VpqvRwEARoDjFObxlQUDTVDil3Roiqu?=
 =?us-ascii?Q?7nMMeCId1785jrigJ4L72FQHCaB30CYzi9sG3ipA7s35rDaBxAd/duOVWwNr?=
 =?us-ascii?Q?uNicqJj6YUQrdWP5e9uIy4RRSxKU1rghy31qm6LoXM0+PT0By1FtdxHrK8Uj?=
 =?us-ascii?Q?6LbGgf/P68CaIB+3J2ebHBiHeOpLDxEd8HPIHy3nz53kkyqLTev8RMHxXA90?=
 =?us-ascii?Q?90IA26N6FfAK9RQd+srud2xWs4uj6ykeatgJI70kDmEcbGT2oVf6IV47YYax?=
 =?us-ascii?Q?JkMcGktG4l0n53lUkmuqGERzcEOZkema5la9P2t+QeW13otJo8EZ1VjbngH2?=
 =?us-ascii?Q?9GsA92sKjY5h0a7Lok0dWlQNkglSk/uSmY2tJlY/OdLkFQdz9fZdzg9dE3ts?=
 =?us-ascii?Q?A8VBnK8/XAshxwVqRyUuk3xrQrx/RIBFjjgjZcbGaz2QdhvdSJOScyz98A3K?=
 =?us-ascii?Q?63/DQsnLnxCQj8KWAsGiUWMkmsQgoYQN/N5B9qwEmH/J2ytETEQ/QP2yZ7ob?=
 =?us-ascii?Q?B78IaRf2QPgnFW3l+tf+LlcNmnY5fo3p0Zlmh7PitCdmWFLX9/irVwFyZXmT?=
 =?us-ascii?Q?763+vGz5MrCDi2vLRFr3vc79tTZq+H0LO2kgWGESQRNcQZjMpUYXYKL6b1E8?=
 =?us-ascii?Q?9YWOpjOPv1jpRz5plCrnShdelLY6EQmZ0MGkqopJIRUutrGBi11stVIA28dN?=
 =?us-ascii?Q?YwfzSfo2g5i3bpVuCnY4A99gybYZptOHuJnvkv7+E/XwDoQlj+dPeUU4ohMb?=
 =?us-ascii?Q?C9SUxBcP19k4wzHaPZ3Y+MD214qOb62QxzCntfaMlPHYvWmzXcMcZfUXmvuh?=
 =?us-ascii?Q?iEAHPVjn5vff79b5rD8Y2dFajzFBbscqmkv5KkrbIoJLG2bNSjqdTMPKV60V?=
 =?us-ascii?Q?8HkDM2wGG0uG2+YrmIZtQ2XkNygcsI6br66sii68brdjfVfd5JcNg6LThG9d?=
 =?us-ascii?Q?2e1Ga14Hl4eV2uzFiv54oLUDYgu5umCCwQoHr/lU0GEHXxNo+d1pMe3lO3hf?=
 =?us-ascii?Q?bR2y6Al0wAOmTDOfuxNEfo+CvV9WT9d1FlGQ7DMHDwKtx7CDijan84ysJ359?=
 =?us-ascii?Q?mICBEJplP+ygXPHiZRiJPMBZ7EmcQKzfivgOaFqHA6essaiK3he88GI0cfjM?=
 =?us-ascii?Q?dBUy9PBFxvnnJFq/FEX/7ZLiqcuxuMs/PqPvhXYd979IZTRjB8fWtDGQfXaV?=
 =?us-ascii?Q?GLKmcMojpMlbyqLDBqsW2k6QjR9evtQsTC17/qJh9hgNyaXKL/GXR6AU7lSz?=
 =?us-ascii?Q?fA3SRUHVHymDjg6aW+N7+e7axpFgA5YjkDcKqUP8kb187NB3SP8C4/jnc3B7?=
 =?us-ascii?Q?5f+lbBP9HheKVx5Wj8yFbpBsVS+I1PziwXhv858OBAffUQ8201u2ZNeEd27H?=
 =?us-ascii?Q?E8JfT6ThnKLaNEA4UX2r+TPoVUyAY8rIhDaNljuu4QycIWTccSTcsLq+ItL7?=
 =?us-ascii?Q?PdyijnQJTcjUg9YNMjy359TY7zTYt1pK1J9WEFXmTYeo74dtyM8cNYzXezwj?=
 =?us-ascii?Q?93ag4U+qtoPX2YnVn4BeqGIbANPbODwIxxWFgHfPEf1JiJw/3THIlzTXaEOT?=
 =?us-ascii?Q?2679L0PSV8ekYZqaA+Kzkfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcddaa68-53d0-4008-c33c-08dafab38084
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:56:48.9558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3qS2UedryWm9UFO0MeJctGRJcg8JD8/bYxbbTlh/USqA65XmSK9jsrMkif6B+IPK0CxAuiXSkzWpAdQE8W6Hf6XE3MIZEXcdqOpe3mBKTysnD0BtbkNn9JuOKwzG0dR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9301
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

I'm posting about DT schema fixup, but it seems take longer time.
This patch-set is 100% independent from it, so I will post it.

struct snd_soc_dai need to have info for playback/capture,
but it is using "playback/capture_xxx" or "tx/tx_xxx" or array.
This kind of random definition is very difficult to read.

This patch-set add helper functions and each driver use it.
And cleanup the definition.

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

