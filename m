Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11039678DFC
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:09:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681E3E8C;
	Tue, 24 Jan 2023 03:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681E3E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526181;
	bh=CyzRx2bD1So0VkJzfv7bi9HUGyT90m5ggpvn/z95xGg=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iB2WMKEzLL+t0OEJhgva5xl/JyMWwlQp0OQpBet2tFcv+EJ+4kWEndNZEKOZ8VbOU
	 Y30dMh4sNQiAPR2bgdv+MvrWV8YciLLzkan45gBof3/hquYOTHQTuhhSZWuRNV3qUN
	 uy3uolvaeic30ohQKiaTDv4ck1+YCrdAXTglqHkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F18ACF80557;
	Tue, 24 Jan 2023 03:08:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D0DCF80557; Tue, 24 Jan 2023 03:08:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65E12F803DC
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65E12F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PuIfesBe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxD7Jog0drflgEqWh+GyRwuHN8mjOFBUeCCOvWIomCqNGNv8QnnEepmIgxUwKmYyMtVQfvtsWM+a2gIyuioo6Zm0TpZjzjNSb/ZhQlG2MJP8tMr2Mwj5wAGW5tI85GWkRpyaKW3TCTuZ6OJyZ23d9WzTkIFSjk9h8dqHuj90IYoOFJe3tlKKwzpIsfsOq7m3ij6PMt5ULuq6vK1+txWKrP3a47q9VmxhHcWkU3YpJuSrBXIVr9jGPgSk3iS9k7luWoLMA554IA0RA4gZTgaP0S4hZVnD3fZ2zxVHMVlaZqjbj0ZV7y/tbqKyoP5xgSqrFc7YOWeh90p6xIBeZ3uVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCBBiVpXXVVV/WdixsKJwRGj8NlkbWf+jRkxdl8LC/Y=;
 b=eCItAGEjaRtDdx2uspUTv+0cpAHAh6DCT6GqJ2/w8xQnaed5VwzL+35PjSbmGuzoqCWLGB/DaujfwtYgmEXIJaNK9MmLFExdxcyzo89sD+NZ0CvL3uQmtHVvCt759SJe4YCYDib1XJk8+pGqpbJSPQct8aSoFidMiPQzZFN3xP0bPUSjz3qJSsRW8m9SZdEbe7F9trRdbWun03BsXkMmiV9mtfL5zkMZoJ3Nly+S2OXEjI3hW2iPP5VVr3UcE5vwMdB5oKDC5kCP4bR7k2nRPEOL+gMEBqOCmQOZs1hpWmuC9IoEXoyIi50iNgGde/Dfpjk2UxZyRxHFJqRQKSRDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCBBiVpXXVVV/WdixsKJwRGj8NlkbWf+jRkxdl8LC/Y=;
 b=PuIfesBenIKXczxP3lNyvPpNmtoUq9yRKbTMUkhqOlEDs3Vmn6mRqMojrJhJZWKuGPJu3k3+8QL0hE4Iu578JXUcvXtSQcSWo1PlqVJY1cN+HuldpDpI1zmbDDjIPEmS3C55mMAqEB0OkMwuM9J8qBVTBKEHXzFI5ZCzdpTbvOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7701.jpnprd01.prod.outlook.com (2603:1096:400:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:07:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:07:54 +0000
Message-ID: <87v8kwu1l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/25] ASoC: soc-dai.h: add snd_soc_dai_dma_data_set/get()
 for low level
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:07:53 +0000
X-ClientProxiedBy: TYCPR01CA0144.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 968bb0b7-77a4-4298-64b5-08dafdafcdc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQz7WwjWIv/Hd9jtbNo714Dj2fwOkfsiUlXVMcLbIqoiSvsFiNCugPRppIgJuotSEAik8JHfKP6QjA3UJVNEEi/k5lwxRDHLXQYqf9m3C4WAevfRdgrFc+dB65yhJaEgLmX+I1r41+GXy37WozeXg5zCwq6tmbabxxC1wLuL5r471m/2CmPgCUjbJ/MJzXk6kiH8pB/wXyX86ZqE5mbiX0Ea3M6PJmQXX+Xw+kZzFXjRKxe7IchAbY3aiH3C8ADGRU1ZOqpYBnimSw6NgsOOaAmXSIwJzkGw9NHVodyuadIywOaO3L/LJy7ZiqiNsp1bQhM6mizzzSNtIOecqbxYURuq48DpoVwe4T7/xa6O0FMFV5mdGibC6TYgcBOuqLU5YbQPw7tPPWaYvF+hOJz7ghVXzno4+vAWb2wiUtIGWojjEiTbNmTbA+0eHqwH/l+PUIDuj9i5D5tuQBIGRi5mzi8VmssoBSR5+ZOgJfvwAfy3zfcrRgreXPB69hxhMK37YsySxonCeBLzXUYG1WiJzIsykFQVMp89uned7EsvZbi/enrryfkRwiPU27jDR40IAEl49RRdPWbkXddfws0uHsU6LBKqXK9gZz9cjPO0yPdiW5mXIlR5QcM0mS0QpSzETV95zlCJ8vHUAv0b3s5A0CVvAMy3ltRStxbIs+TQ270fenP3BeLkaj3LmFirxABiLwJI8sIN+IjeZTJtDjqScw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(8936002)(6916009)(8676002)(4326008)(66556008)(66476007)(66946007)(36756003)(83380400001)(6486002)(478600001)(6506007)(6512007)(26005)(186003)(52116002)(2616005)(86362001)(316002)(5660300002)(2906002)(38100700002)(38350700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U9G92UYwumfs8C6Tn92jPbhaMD/hYv2ubLXCLJt051G+po5W38oE9qEtSX87?=
 =?us-ascii?Q?vTm7Sl5xf8qzIoJRXnbDQfRe72+0CcVSrk70RVUrLnAuyl0PXEZ0jj8E1iIN?=
 =?us-ascii?Q?XTPw4ldogmyCN10byg5J0mUoC3Xg/juhbdfcINdZ+J5rh6LQmrWqIjHvc75q?=
 =?us-ascii?Q?B6xk0qjD5W5nSlxfeQrg1C2bKB2j2HaYoo8RZdLjk3nrwg4M1Q9PoH5a53Wc?=
 =?us-ascii?Q?dI6IXxtGRrEFRMDG+ofSY06pUNdsSiWYbMrAsVy1MNNdyZ7svTSDG5WjkTrq?=
 =?us-ascii?Q?kHhojfRzEr1XaoEhZggdPX9CqGHs6Y4wVSz2AjME2+mQH0qe2K04hmH9dLzx?=
 =?us-ascii?Q?VMV6G61eTfbgWKOFlyvmMe9Cdul69q2duUV2eYS0ALe7Uvsg9PMQPSocGf2h?=
 =?us-ascii?Q?d31sqBEkPws2FGgFe407wG3pC+75Ft8F14TMc688y8NON8WtxOfo0r4L6Sh/?=
 =?us-ascii?Q?gYy3i5uOIehGd9hY0bmbEQ+XK2tGmQdjndlLZWycbi7HNfjeoI8w0I3tV8dk?=
 =?us-ascii?Q?sRO+en+OEJh+hCEdf4E/uDpD+Ak+XuEiNBTQluI78N9wI5ICvOQWKeoyrBC5?=
 =?us-ascii?Q?uR71646jAMGimkS0rZ5CfteELYtNa9KRMp/TmZnYo/J4mUZKo8/DmYUqiJ73?=
 =?us-ascii?Q?g//jRgtTrF3W4EaUE1qlmoGjG5HvlylliIhDDJO1kZCpR0dTQ0zgSYKOrLvX?=
 =?us-ascii?Q?u0+9bWtiz9cCSWp5c57KZ5Max0MIR06C35HWn/YKLdf6fjtWfIkGc+GmgdEY?=
 =?us-ascii?Q?+7rI+do5VKOf7/gstMANveB0u1lpt9kOUi4tI1LfbmLDB7eW0ty3co3xVoTt?=
 =?us-ascii?Q?5DdPmxkT8xDmHXD4Gv5NjKGbnK/xkFy1tk05GmYTsDheYAEOMI3mgg+XVdui?=
 =?us-ascii?Q?XgL9LySvOLbwvSrI8WfvkaWXW32TW6MDjcH1X2fyP7/VDh6RK3mthGzXPVIX?=
 =?us-ascii?Q?16ep3uTqPs8cF10qv37HWLhLGWr7IiWh+0awhY9RNEdeWL89IFb1SCPDP6Tt?=
 =?us-ascii?Q?uCvNBAgoIRc1Cdosr4RrPjZzKFequcCbyOZlHQocFrHHv2hIk9/IZ9nQ7wNm?=
 =?us-ascii?Q?3p+79F6Io055ktZCqd+Bc5RazVebNcqf3PgWSHtq3g/+eLGHtEOk7VpR1p6v?=
 =?us-ascii?Q?Uj9hDQSo2C6QEelhvFG2Ah3Yqyg/vOg5d3NLdc2bs4MBmx+g3pI4v6VgGuzj?=
 =?us-ascii?Q?X/5uOhTKHu69KnmYZlgx4kp36lbW+ANethbgbTKvDbuz0zTQ/QZJtC7SySGt?=
 =?us-ascii?Q?904IDqbqRjMkQBV2lklR/OJ81j7YsetbOJYq6AxwtWvmucBE92MzScyT+niJ?=
 =?us-ascii?Q?BhAIh57/JuGDPqbiO2QTwwrnff1JfVfi6cKGZN14JFaUorVhPTYTcgKx8/hV?=
 =?us-ascii?Q?d8XN8LRs4WnA9i/fLUoZkv6BM+E63vPScjAfjL9g5QbFw1bq4RGmaBQgDNZj?=
 =?us-ascii?Q?HS15ZvtRuwm5hjMZ6BeXiR3s5MxbcER/4Dqrdp9/lAP3SvCP7V3oiQ9KPreC?=
 =?us-ascii?Q?j9EG4jtfQLbGZb5x2GvRcLtydgG4ktNihM5gPtE/ZCF1b2TXFSsz7YyJXhlR?=
 =?us-ascii?Q?60g3lto52QJQWIGPS4F/rKANfT9xIFKaBsYYcaY7xrJmFPaRv0bm8C449GBl?=
 =?us-ascii?Q?f31lKTTyNZlW35TyIwJ6Oik=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968bb0b7-77a4-4298-64b5-08dafdafcdc4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:07:54.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YnE/P9U+uA1PLZpqfVFZlIlCYEZZmaumoTZ7/l8sA5gRCF8EiPr5hlV5XIe5FBIiat4XKJvgXq/NFJBDGEBa8eEoQYXc/e1bSmbMt6UJ2G5HBQrW7mJNQhyffnKK7A/
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has snd_soc_dai_set/get_dma_data() which is assuming
struct snd_pcm_substream to get Playback/Capture direction.

But, many drivers want to use it not through snd_pcm_substream.
This patch adds more low level snd_soc_dai_dma_data_set/get() for it,
and previous functions will be macro for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea704d92deaa..f27b33dd97bd 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -493,18 +493,21 @@ void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_
 		dai->capture_widget  = widget;
 }
 
-static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
-					     const struct snd_pcm_substream *ss)
+#define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_dma_data_get_capture(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+#define snd_soc_dai_get_dma_data(dai, ss)	snd_soc_dai_dma_data_get(dai, ss->stream)
+static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int stream)
 {
-	return (ss->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		dai->playback_dma_data : dai->capture_dma_data;
 }
 
-static inline void snd_soc_dai_set_dma_data(struct snd_soc_dai *dai,
-					    const struct snd_pcm_substream *ss,
-					    void *data)
+#define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
+#define snd_soc_dai_dma_data_set_capture(dai,  data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
+#define snd_soc_dai_set_dma_data(dai, ss, data)		snd_soc_dai_dma_data_set(dai, ss->stream, data)
+static inline void snd_soc_dai_dma_data_set(struct snd_soc_dai *dai, int stream, void *data)
 {
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 		dai->playback_dma_data = data;
 	else
 		dai->capture_dma_data = data;
-- 
2.25.1

