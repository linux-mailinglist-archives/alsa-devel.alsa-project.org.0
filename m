Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C2674D7B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 07:43:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D8DA2D9F;
	Fri, 20 Jan 2023 07:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D8DA2D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674196979;
	bh=snKpmqQRtnx9/e/Jv5yGep4qqexTloH+i8PRm9+tjIM=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CGQRKoOJTvTEQXK5b0nc2SEvqCcyh8nqy+j3LS7UpeLdQbVzU+ay6pOVFYTtDz99L
	 z9eXF2Kl3THkCMFdHS41ZVdvyQ20pOddj1gQQtE45JqhCr2Ze7q7z/gsM4RiLP8Ybp
	 Kmm3UY+7Wv3O2971nZyYppmrXnByJMijTlFxdZs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BD2F80482;
	Fri, 20 Jan 2023 07:42:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B1BF8026D; Fri, 20 Jan 2023 07:42:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE79F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:41:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE79F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QlfN77sL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNoPMwj6sSN85014RK7M0RNWD+i+T+tJMi3J1/J/6tXB5R4llYmV8BTQCIR4isK3POvZffu89VUNOexCsecB/ySBYaGRQtFIsWlvT6h6CSZUvi6M74881XqdC2PTbEIK0nfwh3QKX6QkW/g6gk9RVjxW8vlcGWmJ3S3zlOBfiXVXwnWsc/OmjXE63jrzq3E98dITkL+rep4bRy9/imgNJB9+PsTn0Nji49QWjgSrqfSL+owgrqaLdHKqzqwTqCk9WchgYsAaRwk7dY37S9GwCthwReenwbzr20OKv6EyEUrf900BLUby6sbTz3EtWBI6cMevCiXscQOHXLK4ZbX7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk3ywfCXBT2A9JOLH0pSejwElRPa7tU3KHqf1vNrrio=;
 b=WRrFMP/eI+HgjsN/lJoneVT1sbykSJVPpbVkllsKsstihWizPnq3OJj0RdkM8LBgLDwE14urq59/L+ZIV8x/8FlPylNHDYhaLdr0gArQEj5JD2U2I7tG8e6+2C5F3MrAuk1YQDZki9SZGFt5+yH5iqkRNCVEQql6lCPp/yYWMkQe+rjf/2mYmCnqGLhDbYfWRZdtwLUAnEG9XKTfoTqRM5+bgQjdkZwLwThddB/uGBak7iY7fL1iNXL8Gj8m75X+Mfefxk4ltsvuRRei3+UfmIeXWH+9gMuxHzUwfdjwwLYgfYDWrEvQ6pDabvJnDBTeR1ZxsAUBoLHgv+RnomKxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk3ywfCXBT2A9JOLH0pSejwElRPa7tU3KHqf1vNrrio=;
 b=QlfN77sL/NVBGSyZAQdWAJg0d29auk68jcM6hOyqdvSEUWporS/cMV/Sepzevd3KvgZRsbGVy9bpa6K0+4uA8h2YhIjO+grkFqKHOKtgOVI8T+bbp36YgS3oeZwyv0vmWIcaSfXDyxWHw+ZtqjCceT0b+WzsXAHUHbBgudVAkTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5763.jpnprd01.prod.outlook.com (2603:1096:604:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 06:41:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:41:45 +0000
Message-ID: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/25] ASoC: use helper function and cleanup
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:41:45 +0000
X-ClientProxiedBy: TYWPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 183d6496-1f02-4e40-c41a-08dafab16620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8E0Er0uLZdL4PueoJx0QPzCzYrIdl6LsbFJatmDxbs2Ft5WrBq7DTLnVNMI0w5d9RyjNeERTMnBQQQgNalb21NITaGF4a5nosg3sCu/tkciS3bnPNlLVHSdsfKX05ZiLibWDR45mDStjiu84tKKN/3GUJHQrvtT+nHJ2jRRsx8yYE062hQzx/dgL03KKM56N/nrblEE3v3FEIFZuQBNm4eTQ7WJYK9WUsssycnwc+O0dQ1p58DIJ4jSB/9R8HaXvgj2fBc+kYlh4Hk4L/8OzQzeVrdRlM64WVGtl1yOEO+OSvhxb5CEDSpyW3iDy4RVetZt84Cf7zhdExJdx7QWEDpDWJcBeVgKyhY1hZ6koH0IefycZJdsw67FkcihK3XFAiVQSr+TCNT+aYZoFTayGyVjrExArc1XUgngqHs/xf/GP08sNItebjuOiLaJLZx8sLQLWBZAD2zke8Qf5I/HMU/ux12eFroq863pylb6FvJ/8wKYuZVhCnpsTVIrg/5wjK2ZuITxhyd9JHBYGH5+4jpietASNE30Q1zZ+gPHgLYTUiBzg/JfZgo+Na9wbNsVtW+1t934wDS8H1jC+TLgtDSJOSmdWid7lgsED20kOwDhRP66I22poBD9GM8iR7xplGocFnOHYxZSob5g7M/tcTPMUZBRK9hZA4jRkB//1pBoR5fWh184IaiR3+bgfFeAWtx/BbXqqGfOxpDJ3Ej+0QKDk9Xu4O2GL76l1uHgGTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199015)(38350700002)(38100700002)(2906002)(5660300002)(8936002)(41300700001)(86362001)(2616005)(66556008)(66946007)(8676002)(478600001)(6486002)(66476007)(6916009)(4326008)(52116002)(83380400001)(6506007)(6512007)(186003)(26005)(36756003)(316002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOuTTYhOK4b9UBnsKT4ZI3LJRXkrNhyIeH/9gAymBffMw4GxS4TQcdFNT5iB?=
 =?us-ascii?Q?TSpvgC2R+8Ns5uIkn9/mk6B3Ws4NurRyxi+/kMzv/mB0pa3XI3mQoUQmcKpV?=
 =?us-ascii?Q?MNbMqFCdxu4lkghSh5hQzCwLHWkaysmeVP1x1iSvm4YA0xMuVARKjgHswWRk?=
 =?us-ascii?Q?LXSoxcoIPGnirCEddAtWntH44bvKtr2OouvHgwuqQFhp6srAOg81IAm+XZ69?=
 =?us-ascii?Q?G8Hw+VJaqnqu336DoHWcPfrsiW9l0Nv7STslSyM3aJuWSZvkR/ZBZ9u7eCdb?=
 =?us-ascii?Q?IOtP0nBk6GRsGGKNp5weLCoo+/JkKLTxDOCfWiqHIEB943qX/fPa1zQi78cn?=
 =?us-ascii?Q?y2JUnbRGBoE36Zkbl9plDjU28CoCJ0/wJQ6Q1w4Yw4gmZRV/FYD4L9Q4o8lN?=
 =?us-ascii?Q?D4kPpa+mi/TerjZfPJbRiO5lLE8LHK8mOnIzfiq1EgQ1sS+qDedIbAo6IicR?=
 =?us-ascii?Q?2ep3Kg5ANEZnimETqGYSQL667cj1/MFCkzPJE7UxiefE9JNMpib2YbdpG6Qq?=
 =?us-ascii?Q?mimSXw6QFZ8d/ptOrvS/dmrQodt+m/1kktAxLnBr39GM1wxBeRA+Tgyy4A7J?=
 =?us-ascii?Q?FkZ/mkYH/9pDKwdI9/kwng8PwTecQCqAoFwHWjWtG/fcfgf6O7RuirCPmEKe?=
 =?us-ascii?Q?co8Yh5YgMHB+SQSNJxYni3b2MMWQ3umdLxFmp1+G/evLe/4Ez2gJ0JQ7z8Vc?=
 =?us-ascii?Q?CKYIQsiE11sWX+7z/o5ex4uz8oz06GA8LuJa7u3qskTqkuGocEwCpSlqrbqI?=
 =?us-ascii?Q?oi7LNt1zHLp8F+VbhfFC8KNtvQ/xhM47wbv7NbCmLG7R5iO6MdS5CVXKeFa0?=
 =?us-ascii?Q?ewWXSOTk4Jw+ul3jmKzTMQS/sMn8pgZrLSr8V7CFGfbe3N+BD8SPG3+FHgWV?=
 =?us-ascii?Q?LikKFRp5PbkKcTdL3TA3Cjwe8uWjRppUagINqfXYr7XbL3MG8DcyD6ZA1KB2?=
 =?us-ascii?Q?Hi7mfdsDqVcrn9oMGF13SzhHEOxTl/fl90sY05AjeL2dZTwW63HEwh9Zc9Ji?=
 =?us-ascii?Q?v4Ab2fXeOlAUpEXYtgDqmwncQagFUvRZ6AphkTIKIWiOv4TxS2cw4EneK6dD?=
 =?us-ascii?Q?lCUDb6VKvCUe8mpDtU43NKgBPOxUyqpd0ByAwGZybWTn+PxtMFvse3YFsYwY?=
 =?us-ascii?Q?tR+h2FnUsIFBATXzTbrfbs0nx340XJNa8fZyYvqVZj8BX9q1dDoWxVho8R9H?=
 =?us-ascii?Q?4/hkcg2VPCSGgJuKJYFAIwragB5X0XjqDCz/5iM134fuSUp6P8U6K7LVgieg?=
 =?us-ascii?Q?/tzUw6AD9Z4RM49w7W5g2golv8WQPyLW4HJbbThvjGKLYfq2dGG6iV4x5d9J?=
 =?us-ascii?Q?Xffi7KYXR6p25oRruDpVIOGtNoMlTIrqkGEI/tM4+SrKlsPcojwvlqtts0As?=
 =?us-ascii?Q?SKAm64ybhn3Lg164tp/uJULXXr2fhtpQdB/sh9jWF5USZlYHeRxfdRIAuyJg?=
 =?us-ascii?Q?Sr7Cm/ZhNttk0sp2AxHSTewjVIHCVGcg0vK8S5oCPRl60sYicH5zfaXw0TQY?=
 =?us-ascii?Q?NeaVFQlQDEBgqijb1/HALOhrcgsH2Hvz4aqHcOBrd4EqfmaJSCCUby2sjC32?=
 =?us-ascii?Q?fexFhoi9n37WIAhYJVMiUwPD/NHCj/+sw3VgL0GHaKfk2rTNYWTPd+RVFM58?=
 =?us-ascii?Q?0CMuwoqus0TD5xKzv7sRyBs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183d6496-1f02-4e40-c41a-08dafab16620
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:41:45.7018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsMfyICIhg4/HcxAqq+AfC3FHW41tQ/h+Gj8/QhTtxEGjufuVTQmC8sKcTdcltTOOxau047v4p9tWgyHXde+HPnn20+fefUgs6+z/VJRpYio0/udTLEk8wi1eQXcYd/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5763
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

