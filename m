Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5701674DA1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7C42DDF;
	Fri, 20 Jan 2023 08:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7C42DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198223;
	bh=V47DMhzujlD8lkKMRQFgJDAX8SedZE0oNyS/uYLwwl4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gRQyEDKwWeiX+vAqlSqnbDs73b8LzJir87H3J/97keowvgZeZjFeYTgRhbhgEimxV
	 FxlVQOC7JChYaQU8qWSjcSYyeaxSwhVEg9CwB/q4VU68kRGzxdIXxhEng5bon2MOdO
	 l6OMftyzKyRyt14ZPKOt/CHR2Jxh/YghV8wkCPvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A09FEF80542;
	Fri, 20 Jan 2023 08:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29380F8053D; Fri, 20 Jan 2023 08:02:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B0DFF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0DFF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iiKTBXrh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig5J0g16Q+hFhSzYJyBw7gTFMkI6umm2pLxJEHe7Oq4W2srCXwTb5xvlQZZf2tqFH7rsogxJLRH3QX19MA5VyWo/x5QRjrylMgyS/N3WiAXA9xEtJnq0lLO2GlvtuXU3D6LEu++seVu6X5zQAe/Bso3aMMfHui/IKlc8wk3YMTHzIbEtuTbYJeQb0w6ycyABZ2j4I4BqaIn9TCcTkx9UtR5aQrPtMYkwh4SMgq3wqeF/YuSJxMy9s3UqHGI5YqJiRlZ745y+1FgxxkiO3Yrk6qptowK/w/NP8nKaoKRnWV8qsLD/NZKG5zo/k8diSKBcz3xKUgu+QT5LqXXafU1D9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbUf7FIXhuxp5YkwEzio47MaaB++EAepzwExKVfidvM=;
 b=lj6eWweBB9T0smVhqZlY9+/lKnAukRDCRXssFTHOaLEfhZ8eDVJ7wxikWJTRhdtn5yXsl34mkfGiCYL5I7OK5ZUcXSMLOr5GuEkc1dXVDmd3XAtYnepOY9xV2Abf78GFdtm8VWroJb/gLs9p1gQtSVgFsxFPlPxS1PsNrWUeXQ/h18AwUPWXv0o8BCTBIsGWm68sRI+l54/JOVdu/hX/9bsOBoRyyCaUkB0QFV0g3fjjIgrIwH3kUSk0BKAfDCLEJyT3eVWkCG9P9K76WhSyclqnUL3WL6tQwum5HGsGFBL8BPEAhI6M6q48h5g3X6nCO0BaI8cJB2oswKs35tLbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbUf7FIXhuxp5YkwEzio47MaaB++EAepzwExKVfidvM=;
 b=iiKTBXrh0cd6ZrRz0w+2zs5VdAafKXl+MXuNDMbV5LV//cmBcpoS+5WARSvemhznBzeDnPkuVtqx2azszGFhJmwcqsiYYMgC8fQzZWQ5z6iwUoMqI4vvXkrImYsiuQwmqyfrj5Ar8ddDalVNjSgJJlw3+XOXx7ra6H2c/tPLIEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:06 +0000
Message-ID: <874jsllmdu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/25] ASoC: soc-dai.h: add
 snd_soc_dai_get/set_widget_playback/capture() helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:06 +0000
X-ClientProxiedBy: TYAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:404:14::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e63fa0b-d5c5-4166-64c4-08dafab43dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GEdHIGTqJ35XFpDNCiOVMR4yUB0C+yYnkyV9UdYcSKdHW9Dby6xaE7KM6LG7b5++gzsFzYLnRQAOJeflAGynS7eaOSUNcgZOD10sCsXaZQmaImceTGXgNWy9/4/EWoA0haDMWcgD6jKhnrux95fS+VneeZuAtGhPJVj5QryxactoFwqMOk9miyzDLpockMpelliNh5JQXh8YW9l5JnrQtedG//q7N6g/OQ2MNWQZjaFOHZoG2R+dLvGSeckzwTt+pha+d9hTlQdNoSGY9MTerQ18FTIUENzKWi3WTE6o5SluoY1DENeKwXvt9IDlADEJdOBHYkmW0D3F3y1xT5AiEfUYSTU4uUuXq/CAGOlTJ7Pq3t1R8R1KcfM610KN/n2XDABnLIWhcqyLCLzrn8RPvvDn/ARhFle5KjoCjFnptEBG9QGqR6hKroSq+8MIrLaLJtLflXrIoDmh8OgDIH+Uk3OugJhkiV8bjlh2thOpdzaB+jdbXT4obk4sOyceFpouqzDFoM6YXk9EQAkirqIir3Nmdw8EJ5squ9jR5pr4DeOoF3CuTvN2bWsPGTnjKKB1JsXhRQBVRJinclcVxOdJcJHtz755lu14chx1bGkcGjHZuC2ek3bz/73ssiFWu1NVZemW8mRTLt1Kyr7H50ARrqhTbq0UdFXMvp+moUlaXCoq9JByxJMhT/IvMkbThqaGC3ZudMv1ZrsVMZfeBFlzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?no5v69BvGF4ahcPE/Di/R3kbptP/B1rQSQanMUYMcCn3ADUDfkltMYOhdtlZ?=
 =?us-ascii?Q?nKKD7TBiZ2bBtQdTUYHGTZE8aog4arY3/7WKxWhmtTyHovYiqSq+TkgBs12t?=
 =?us-ascii?Q?gI88cZWR+EJc/Tg7QK/1jn/5buJtSweYxv9AmFusFQzqgysRMChGo6IARWli?=
 =?us-ascii?Q?WE4X+A6vj+Um0WzzQOgWyVjQmoQK6kA77AmupU9KXox1nIgHVy7HmDLZWgV3?=
 =?us-ascii?Q?75aDaCNpCmlhkaYPiLZgFvIeK/VQf6ab6m4Zr3Tgkkja78SIRjGwsyc1/mUm?=
 =?us-ascii?Q?BIZdx2Exzv5qb9h3XU6k4JqM5Q4r155IW8WKdiUKPmw75tqbqurI15byJutw?=
 =?us-ascii?Q?b3VQFiG9PCbg4aHKCf2xBhQjlcrNpDF1FsQqVvvi7eVX7QqXoQQq7pjB0Hn6?=
 =?us-ascii?Q?StgkilSX3c2fbwo9Ppv5pkaIJ39Woh6pM1Naaoacp9VpfiJVjo+NCOBzwrn7?=
 =?us-ascii?Q?nLIb4hS4viKCsSjH5XaUxfLhO4GxidBVRtQAc2LGr193NQvdPTMqqKuFl22Q?=
 =?us-ascii?Q?+1RKSxYQP6KjNzquu+0eHeeFIKxke9sGUNZQJP1YF1UaAexrZCXkB7GtlzbP?=
 =?us-ascii?Q?favnSNCVGE5U9heSJy8PNCD2Bv/YTp8BNZf6RITZTCK5lbaUMDCfFxNIqVUe?=
 =?us-ascii?Q?s9RSK+GRRSFXSX7bDx3WLbx2S3XNqRopFBlFG6dgv1yJXPgqwp+Vu2xkJWG7?=
 =?us-ascii?Q?InyP6WIpGCe/XxpheDCYnCJ32WHxf/JtP1B7D231wxZWAPLlogFANThAH/3u?=
 =?us-ascii?Q?GWXUbKBa8bYnPpi/RBSK2I9ApW0Brpg/zOJYHUbkrNN3ZzbOROetgqERZB7G?=
 =?us-ascii?Q?FIG9ITnqbWmnhAvMA4YTvpJxBJXbwWNt1sYyDzqHDqhsg1qjnfdoDGbXNI39?=
 =?us-ascii?Q?zjOOkajD/vOOY6qHe5R4m7L/W1dX7U+VHJUHSHWZfvQLOGWdkHtForyCR5aO?=
 =?us-ascii?Q?f8KY9739uBHDzOOH5nmwH+KhldEBYzOWYCMrwqXp2VoV/V9UvmiX26sNlRpb?=
 =?us-ascii?Q?4draWQ7Q8ToJo1FuAcjto9VZ9clN9gwUw7WacaRCRa3a5GASReKeUiSTfQvN?=
 =?us-ascii?Q?Hh23V38MfuotZytSqsWa/8KwpjBx++cKekrrzRwtSl98SoR0aLfXtQgqeGrv?=
 =?us-ascii?Q?xYbi1eWcZJd2Tly61RDJ1eHLKJcQ5f2bY3QT++LjBMFT4jAcrxCLPLK2oZgw?=
 =?us-ascii?Q?JPYs9WSidiTyNBg97F9L6bEndlma2aaWk4ZNKTGPY/4dbBQxpMFIo+lZCFhc?=
 =?us-ascii?Q?35vghnD12X7nWqRA8JqrysdbiRpKuqHzjyBjQOdW6I8WUhkIwAEnk2Vp4mDS?=
 =?us-ascii?Q?sI0MJb6XM6UrOgyHKGcsqK/wHGG5RW9ZhnQ6qHOYoAk6yo0WadYwNIsQJQiQ?=
 =?us-ascii?Q?bolDl7uCPx/uQQQsf5rJpnpBweE2haXYwvMogh29PKy/EflDsDg230sEcsvd?=
 =?us-ascii?Q?MkCEy8a6Hummgyz8mOgV0j8CZw61vIHX2ZU8UXR9yEe7KSPkVwJO59vPR+83?=
 =?us-ascii?Q?IbdAiTY+7VsjICUymVmARJ96umLY6R2cspnMuK5n0+mDvW1XwFqE2kOPOb1y?=
 =?us-ascii?Q?4mQlMON5BcILhzfuO+2DEcwGOLPE9FIRUlcaOvn9XfhrLfFdO7Z0NfHzR1r5?=
 =?us-ascii?Q?WaiYcJDmhKQmwTUbolF6Uh0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e63fa0b-d5c5-4166-64c4-08dafab43dee
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:06.7374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msqLA6Rp0IpvBslckZUW2lF8oKZNyMdVlzi9wpJl3tZDCa/iX0fNKAMgghXphJEoAXSLg2zu7gNcTqJw60qSYkV8uo5o8kaixGOYsRVJp7QovnZJihgvsTTqnyLaDQ2A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_dai_get_widget() requests SNDRV_PCM_STREAM_PLAYBACK/CAPTURE.
This patch adds helper for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 9b18e230e5b3..197dc1629708 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -477,6 +477,8 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 		&dai->driver->playback : &dai->driver->capture;
 }
 
+#define snd_soc_dai_get_widget_playback(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_get_widget_capture(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_CAPTURE)
 static inline
 struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
@@ -484,6 +486,8 @@ struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int
 		dai->playback_widget : dai->capture_widget;
 }
 
+#define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
+#define snd_soc_dai_set_widget_capture(dai,  widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
 static inline
 void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
 {
-- 
2.25.1

