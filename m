Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2696821B7
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 02:59:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F03836;
	Tue, 31 Jan 2023 02:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F03836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130384;
	bh=kXCjhb8hz7FKPX+btq+m4/L1XH5MPhqxHY1Coj3JsmI=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bi5RdKLRzMttYcc7YfakF1mDrc6tDhPmRlua4O1i+QdU0cXotDSsQ3tiFxxS3j9hl
	 UEjcJZZPD/hFE1OYnzJVRoRJsySU5prRk+btd73qTRCtXlnW1BNh0XjW7xwbxMDN2h
	 sY2wX5q4qD9T3g3YPQYem1o7iSX0zXdwXyiOfh28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD778F8007C;
	Tue, 31 Jan 2023 02:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FB0BF8032B; Tue, 31 Jan 2023 02:58:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::725])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DD7FF8007C
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD7FF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=b6WcpoQg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTrRD9lAvmrSILsjV/S64kz7wAIavClFK47j0CrBbLObyvCu6xZe0aiFlEFH2s8h1O+EMVRbrAxWdDvmW94mLcyx5IpcBx+PU/tG+aaWVj5IMtAod8pprmRpLVbroyIR56AkMevoY4AKdbTcIVQvqOmWDZty8WLXO+iRyiaR9qq8mjZeS6gCOjXP4MHyPv021Tvw/+F/vTfc+/dFb+dhXQP4n93cVFZpJZQ4bMW3dmNkekouHWjkqEC/jy4W8LgCIEzuwaYAZgaypu6nRKDE69AolgD9UjQKkxtM6yuc1NPYSn9ZwAvjhtAHAVCkjMBFS2zy83x7qz1xqrC3WxYjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWWjsVI7KUtbqhvibgD2IMaFUztDHmS3aQJXzlTR4zM=;
 b=hiVVnxKBl6w3+Z1X6jVa7sbo0jPQ6ZYPWlII1brSuHixdejbIhlRbvzNdokShE0Vbx9tJgCkgG8zeKiLnhMSKcyc3KEq/+V9XbNxBuSsz+fIngymK6Vkq95nK5f9uG8zej80MQaGTKvvolHYJIazZKyrVlJlkeQMh2+XZ8f4cVmJJhtphoFa6G47FGO6c6btM2jWPoFS/nguEFifHne8G6itCZjuylBzQ/EceMjeodPR52e4fojw8Uu5XdYY2OzLxEuY237llEllnrvI0TcUMKzVvXkFY6MAEeAzrsbH4NXXrtaBUuo/cCfHuFaLvv9IP5/2+Fma6536VsL/gwQbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWWjsVI7KUtbqhvibgD2IMaFUztDHmS3aQJXzlTR4zM=;
 b=b6WcpoQg+itKNN9jGC+UncQooc9Ht550FS/fKPaGuTLmPvc6nNDCLBY6Iok2nSzS9BMiBmomFGXzurtZTAktdir1CM5KV1FDOXKYk3u3p7+UEVtMW9d52S8zwNy6yYez6bT12aqact9iLxmWCQFtExcJ8ILgjNhrzL5ypLzCkbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9980.jpnprd01.prod.outlook.com (2603:1096:400:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 01:58:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:58:28 +0000
Message-ID: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 00/25] ASoC: use helper function and cleanup
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:58:27 +0000
X-ClientProxiedBy: TY2PR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:f6::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c1783b-c6b5-4420-923b-08db032ea552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40XwLjAEhdrLV1eKI0nLifVMYKeC+sC4PpEMhzNc/F3q+OTUszzZv1xTyjNF4Q59LUiXTWM3Zybg041cz4Cpaz6sPmONW1dOxZDPr5Ao3Pv8JqHZjwrtXQRR45i4Tfbonguc82BOMMANduJvZd3QQz1nb0BQlyJhq+2PHTRYc96gQlP3t1+5wPk88iaT5bHND7tyr23RRka068elIq/6yb5xWV13RnxMp+Gb2CNdrfw418DI1I7jcwzF8Owbr8Ew1vRT54aOdNWtmU7509ynxcDQKeW2k3ZlWGZs7ceQcu7PzkxqUE2PkaWJZjZyyLuLvDtCgwGgHywGKghEb+Zw7trb1uimSGLWMikmkdynf/Gu8FQUeeNvQgfsn38S01hqBshqEMt6+BM9LkTZemzbijvrDeMYZLeHGNCh/KVW5Q4RTtg7I/eihjYWf6s4rcPU9sZQCO6BKZeGRGWE381SHQ0kv4fS+oq1fihdjHQfeUMOQUYU/kwNRDG8eWLVLfC21ilLGyMgzqjNXD7MQmY2JxY26QOTGh9XXaTjtEBd7EDiZLxdCaGzUmRWJKi5/5t61h6o82o0T0bLyerLnDMfNKuB3NK0p/qbwvh2Lmcub7lYnTFFZPYwZSz1fZfi7+VCihco/AWblhRHLhAZqinEavePUjvHlnMoXZ/pSiDCICr2QLhgYIv/zP860Z7N+e6kf8WruWqngspt8bO+p63ZsyLdWskrLOC/VTGFlPdJXZwroLywiPpEP2R0GKCs5mmeYM8LH0Oa27VQIkS1DGYkNXMAPCt9ikjTmiEPWfib780=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66476007)(8676002)(66946007)(66556008)(4326008)(41300700001)(6916009)(8936002)(316002)(2906002)(5660300002)(6486002)(478600001)(52116002)(966005)(186003)(6506007)(26005)(6512007)(2616005)(83380400001)(36756003)(38100700002)(38350700002)(86362001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NI6CUbAjhoxIX4ZZnEhvEUJox4mU188Q2tM7iDBkRtOuN/VIoKSl+TzlFkPU?=
 =?us-ascii?Q?aVzuZG8u5O9fxWfH8YglHdoQ0Ws1JedbDPiBvsbFwLhi0SPLSB2h1QuqsVnp?=
 =?us-ascii?Q?FiI6Hm/3tI6iWOlCUtlFT6UqCfl+Tq+1dT9DJRQ61dNW2yD9rylqISWZONQ2?=
 =?us-ascii?Q?PG/xpfLT2UudZLKRpT3lP8TxzZXGxAW/FRgdTVnfz/QKjXI4oPFyGd6plvFs?=
 =?us-ascii?Q?eBOEmoT2mMWXIoX8pqN6QKIq4+tF0opt02Xzu+cWp2j3keS1KYDs9/Fclbjn?=
 =?us-ascii?Q?xqc4//jkZXZ9+hVwzKMc9DFt9cibu/v9lwMSpv6G2afNhDNMxZIvFlCX+u5i?=
 =?us-ascii?Q?eVn7Bvvo3XncgYPfovZVfeymaUdDtLuG6RZwIrc/rib7bJ4CvSu728F113ZE?=
 =?us-ascii?Q?46zK+lWf54vtcVi2OF7qOF05pem0McbzuEHXeYZ1q/xp5XfXTUOFjKHhJZZt?=
 =?us-ascii?Q?zF/B/mlgE70NPNzKlA3KNmIKxmR/k8C7k3y/aq47osen8w4HEXHyOooC9Vp+?=
 =?us-ascii?Q?SREg88ldI/aBK1uBQ161FXsdQU5qyvR+MT2u9qB9Uvqckt8pFSKuWsZ1IW9g?=
 =?us-ascii?Q?9jIbJch2zoQq1z09Ah8zkHEg+mlMrBg1UHyZ+D83BOOT/zIaTReazSzp3DIN?=
 =?us-ascii?Q?VSMwg1GqrZp3McSqqSgxvFW9p7H5YqAm3Gyt970fhja2Pgi95dWEL35UCrkP?=
 =?us-ascii?Q?Jz7YbAjGGL3job9RAj6DhZtSmwutccTFeHfA5yyGeGX+nuOKNlV0X/G9CyA9?=
 =?us-ascii?Q?bFA9Z+K4GuZy7PEVMGc3SaF/n7M22Pl7yIFYxWj9njYHk4k9zzn6ZY0dd0lY?=
 =?us-ascii?Q?GSi5BIRTLb3Gb8Lc+P29CfHjbNjsQCq/VDERAJa9jHmtCWdhftajYGs+/Sh4?=
 =?us-ascii?Q?1OSEcMPhp2pTpPHeFeGvkaUnr/m59bR7sDO8QsO6WELMFdHkcg0vIgQZ6FGS?=
 =?us-ascii?Q?5caL+oPQCePr+usWmQxLMemhXdrRSlhzt+o9HBcl4Y51y55ryoRcVR7Ey+Sk?=
 =?us-ascii?Q?Fwl5b/NNTULYquogF7qmPl59yUepsbFjaGKJErJAo//23URX5PUohyxAur+D?=
 =?us-ascii?Q?MHAbZy88UiqyRfqGdZxZ43TcVx2kXWnxQlCcvzhOVCVpCCC8NKVguhD8G9UL?=
 =?us-ascii?Q?TTt5E2DBSJNGf6Ta2HT5JbCv604sG8NlNeiLEQI0+t5bo/xcbC4e5/u69rcG?=
 =?us-ascii?Q?Hs/PkLrPycJBzDi1s2lSgThfKo6dkl54a5lT++0pwvZPb7LQCrUdSMQlWmOf?=
 =?us-ascii?Q?NuvwqFRn/Zw8/0etjg0StpAr8FiRJ/qyQ/JXYFBp0ab8OOl7iJ8biN6IY/8N?=
 =?us-ascii?Q?HzMo72KjYqrFPXBOMyNzz4wbl2BzdqVqizK2WIBKdOthXj0ZqkHGtzB2NwAO?=
 =?us-ascii?Q?4gEEMlwE57QmnhrFv77qFwPwUZzqOkLzQ3v+Uu9T6fj3JFmspdaX8eBU9M+G?=
 =?us-ascii?Q?Eh23qSxw/0Q3jlw5kHWxpgZy4w2kQIQL+Y7KhJr79pOxZMECG7v++Mm8moYl?=
 =?us-ascii?Q?qXbBilNCozvU9zOFsXf8B03wp7U6lRqtBVRTDHdvHQwgV55DlrxkTIVpnGhZ?=
 =?us-ascii?Q?9Oz5a9bQ4NEmhKIuvpd6xCJg6jrzzmbuJiZDgwk8F56R0HM/9RllBNQFdgj7?=
 =?us-ascii?Q?PIftWxa7Wb2JzvNttA72HuI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c1783b-c6b5-4420-923b-08db032ea552
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:58:28.1494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6nzrVthCGUENhDqLTiWEBdIYLI3Sb/FQa9MiijX5llpcHTZB8S1xyjknrxFLtFQna/P1CYduIy4qMTnYq0XcIearJsq1nv/uQ1DnMt9fy9ehm7J9qMr9k3MBxk8s8fn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9980
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

These are v3 patch-set to use helper function on ASoC.

struct snd_soc_dai need to have info for playback/capture,
but it is using "playback/capture_xxx" or "tx/tx_xxx" or array.
This kind of random definition is very difficult to read.

This patch-set add helper functions and each driver use it.
And cleanup the definition.

v2 -> v3
	- fixup mediatek compile error
	- fixup rt compile error

v1 -> v2
	- added Reviewed-by on each patches if it got
	- fixup soc-dai.c helper bug

Link: https://lore.kernel.org/r/87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com
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
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c    |   3 +-
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
 58 files changed, 276 insertions(+), 316 deletions(-)

-- 
2.25.1

