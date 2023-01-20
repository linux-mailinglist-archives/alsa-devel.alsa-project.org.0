Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5730C677698
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 09:45:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95ADA4206;
	Mon, 23 Jan 2023 09:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95ADA4206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674463509;
	bh=V47DMhzujlD8lkKMRQFgJDAX8SedZE0oNyS/uYLwwl4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tNDg8NQiBPLl6nNA4r/MpsaYGZ6IplFMesEeK37QoIG+aN1aSBb0mF3NkemiFg+Go
	 3TKM2GXZD4TNKh438S1DdG5KlX8rCY+Vqt7xNVJfyu970vSsut7EYeqwxyfHwuiLL4
	 IzwwBI9o4Q7zlfMReuczVI2SLw/ed8iKqPlnJ/nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EEEAF80564;
	Mon, 23 Jan 2023 09:42:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06935F8026D; Fri, 20 Jan 2023 07:53:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B150F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B150F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XHk/4E/p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B49UG64rbooPI/Dn7/nULrLgWestsFA7AS6GH043g7sZJ5cf1xln6CQ4KnS/9kLTziJ9JvdzC0GgiVeft7n6qyyL926kEJ2YrqSR0ARctZqa43vuNFkDci7KCs9j5I7k8vllfgpraurPitT5HQcpmWtRLpHH+48sUfgi1mGXAhtqRfjJ9nHYRV5rgf/LMYMli4j+oWvTxyLO14oqENRiYIyFaGn4fp6ZBG5FxLQAP5QAk3T9K4MsVy/KbMce8K4+1rGuSEpbF9wM1zUMp1m0ttvB/XcB/warA6NBRiyf1pbDmM0CQDgfoJub7TEMpxB7bCuHLc9t3i49shw5xFkTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbUf7FIXhuxp5YkwEzio47MaaB++EAepzwExKVfidvM=;
 b=ch6gl3P7F9K9zoVYlGfgKYLRa4txCb7nTlMKqv6Ers4xNc9izzKC5W353d24tCnMJecoXOTOFzrwqm873073/W2Mh6z7LKQlNjl/jSitwyxeeD2EJoR2R2fCZSXkOrqK/d2A9K4m8TYvLOiYSEBYK37E/B6inH7QDEYSDXTI2c0Nt9E6l2fANKsM9zXAWwgzyAd6UJxRBC1XdObZcZBYq617dttrZQd4H16A31XAqty4QnyhtN4PGmCgYWOpFiv663JK2YyPHEA+Xsm11FGqdqzfLrRqrzcYHodl905UDVAjSYnXVkmb4uZypg0wOX8beXqwomT3d4uD6tqd7Dpz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbUf7FIXhuxp5YkwEzio47MaaB++EAepzwExKVfidvM=;
 b=XHk/4E/pqrM6GcmB88gN/eq5WV70UndBTNNuf5Fpztgh5tIZnOhQxOeN+wdncFwNX2jZiNpnwkg90x+n6L3puY9yTaZLUCEe4p92lpuBcDTK97jO4HkTNitZQ+IZgNvmyDANOQ2j5YMLGw5EzeNx81/OX21PWukTD0cyqjAJqp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9638.jpnprd01.prod.outlook.com (2603:1096:604:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 06:53:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:53:27 +0000
Message-ID: <87cz79lmsg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/25] ASoC: soc-dai.h: add
 snd_soc_dai_get/set_widget_playback/capture() helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:53:26 +0000
X-ClientProxiedBy: TYCP286CA0119.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c85342-a7fe-4f87-5b36-08dafab3088f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foh7nbkVZa9B/f6SbnbrB0Ro28X3EmAFYw2Sl/2wIUyXsTUtKi5g1fD40t+xWTafEHZLf3kGPYhAjpp107IY58jgUP/brLdWi+ASqmJCIi7bpMpcqSi8eAtYh0poo0MFnC5qO5JX+4+bYpafa4GBhKg+TkOhCQUGEV4aflXua5Q2lAzAyQawCQgZcHUDX8koU8fouQH7hut14ed3Onkx1fDwPx+zxOY4iZfaiCTADWe+2cy/oHWTeQL6/meAQHZd5vMZguB9y3KcA/ufYsyoxHr2bnNhr8dvhZ00zi1GUuXEKNzba8e/qUjxQPsDbmgkGWMEmpNYd/8e619AAHt4wyruROM5oJJeuVNmjg8P64YdA+I2hovsjZf7HIBK4Evg74pZCX1/oU6fEHfMM8qIjVhg+Nl6oRRaaPXFJ9wSQbTa6KP94T0zjkeJtaFJfiuGMx3Z153d2HEoEf8/INOnCBPprNb5R5M+hf+h3uIsAeRTVAz7uh43Bzc/piH35073c3VZiPH7V7f2X7KXf1F7TrYevXTyUUZQ/0q0MYVhZ5lpCjbQk1HhZPDVWJqe16ZTI8c+LDiLk6rVNUx32mpb6Tp7ho0dHeNc3fslqUzcN8w7aOgB4S3QuFwwiX4P2dATMjjMEeGZ9E6rW10a5BPRw7AH8jMDJpCkgqt4ZQNL/yThtT03I1wvrdHl3v5Ej+VNxmMvKUPacb6ZiZOIbNK5Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(2906002)(7416002)(7406005)(5660300002)(8936002)(66946007)(316002)(83380400001)(86362001)(66556008)(54906003)(41300700001)(36756003)(4326008)(66476007)(6916009)(8676002)(52116002)(2616005)(6486002)(6506007)(186003)(6512007)(26005)(38350700002)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9LIdY5EBFugzi7pttTcNVRH4TtxschBb/kA0PvubqLl8PA8q00WqHc/QpMhx?=
 =?us-ascii?Q?a4YJvNWugN21rJ0nc7etPERqwlrRZWgV/s4kMU9NFuI4ysV6q6VeFO3XQWty?=
 =?us-ascii?Q?1GSKybhUJSlvn3GJf0gl1tnB7gvucZzfdD8UX2fLrLQA9YnLl0axzUwwx2H0?=
 =?us-ascii?Q?M1qaOFlHCuzJVKmXGydFGxlsFOMpA/bR5MRYgvdY2KcGWRWhXgtOw//FDPDj?=
 =?us-ascii?Q?JPFUq+2ZcojIbkQTFo2ozrCPcTsCfCPS5zP5tIkad876H8Bg7EOoOzi23CRp?=
 =?us-ascii?Q?f2ljCak+JMNgd4EthIPcS681mHZDDO5aRQ799Uu+ZeZ2xL6WHCtvHaZcKzp+?=
 =?us-ascii?Q?QnNO/KKYAuW4IXt6qGEsFm/0ht49pIWVnbsBZpob4FCrObFkXdQv0i6QcEUU?=
 =?us-ascii?Q?n6Q/YPaIrHbbVi5ucghbBd8If/zzdGaTmT3isOwOywggjPVdRIQWi+HJVPIO?=
 =?us-ascii?Q?iYhNM8ggFC/6I6GxaoP3NDGAB9ncxxxdj5nV1fYcsO7/budrRyQo9rmJ6rzA?=
 =?us-ascii?Q?oLEWsu8ef+eyIxetd5wmMEas0XRFq0aHJ+6OVH8u1pOBvPtRdmkckRYX0BWA?=
 =?us-ascii?Q?YXuUbMf8mhUYpmsgCZkqs2TfP67sABllI3DnRL3G9bckqDGRAN4SsUT6DSEZ?=
 =?us-ascii?Q?H/+5AH+Lm65ZExQfuDNT0sMuEpB0sFZjSuxvIxkVRhl/MOe+sqa0xW+Wrp0U?=
 =?us-ascii?Q?OxEBnV7ZFyBDrtCsC2l5fIasoDVs5MQgQJjcrTZDUCkBiQ0RjVhm9i/E40Fm?=
 =?us-ascii?Q?6KnRHFb8reYdB826ITCIa8gwYR9Fi6LxQdudT3iNxBMfKk/fhSENQRb/TzK+?=
 =?us-ascii?Q?nHUiJiq24S0sQBIOCfDPlJEj9I78bv9G/+jGyeNla4vga9O3jKGr8tnR/Qjj?=
 =?us-ascii?Q?97WRoEPx0x7Ya5xCUoCLTvUXSZ5Sl2AuaYxyDcR+TKdrMRYb5AfycA0SeqX0?=
 =?us-ascii?Q?qXbwG3Gr0hXRS4wnH+GW25cpMijkgaLD4rlHMgFm7VQ0eg5xaK05S2VrDiV7?=
 =?us-ascii?Q?ff4gkgZMDfXvRbcB3Y8ZUPIHiMNHBDg4v98gTlSG56CriuhglISUZfQu3mU8?=
 =?us-ascii?Q?MkL+s81A2w+vQFBEiyZxTyv4QpFP1d45JpNyr3G9v8ogr9tmr6Cqd/EFmmXk?=
 =?us-ascii?Q?j9DVM51MZucEm15eJ413ROi2llRgPnNNiitpEbg1vV3Ybau0nA3ZxqftFK/W?=
 =?us-ascii?Q?gmRxMYwCDAxdoFVZIqhSBa40XYBSkCaYtuQaFbyRAJunuadfvXNZj3JBO+pX?=
 =?us-ascii?Q?pIVFPeD/LTguC4c/MrPM3X7KctDJhoK2vRAkBTADlb0aVtU9jf8XAFaX5nE2?=
 =?us-ascii?Q?8pEuF650mVQyQnWzOEbxxNQjP4oJDjwPjBp/kdj22k1U7guJuemU7VaYmcR2?=
 =?us-ascii?Q?eo0Sbs+uo3JTECgsAU6YhFaxpNwraHE8/1PQKQ6Gm9BXha9U5b0jlYwwwDeY?=
 =?us-ascii?Q?nU51jIqt31r6d0zSMnIg8xSBQ6QQVThwGFpHQ9g78L3k0ieXueqfibHwtvqj?=
 =?us-ascii?Q?qbmnJ6asSRug4NoOUNXwMYRkR+Q8kricMEHNpc3XyRYlPWBcY/ij2kIyKADz?=
 =?us-ascii?Q?QLXPc50h/H9cxwx7MbTm7EeTM1eQMfjMxpbVHv5/b1wfyAk0T8tzzXHatHhV?=
 =?us-ascii?Q?5e4yDs/I/SHEXMLhDsKVeQE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c85342-a7fe-4f87-5b36-08dafab3088f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:53:27.8080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9KoSN7szGcKe6fUi21D9/9z8k1uOb5S2DhE2Gldn7vm9igIkSYQM0SGzz/txVJjilbHSR5Ckhfp+V6jIUizhdQBjjScGdYmKig4wm7Vh8EEF4wPwlwBmAriK4u3JP6+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9638
X-Mailman-Approved-At: Mon, 23 Jan 2023 09:42:43 +0100
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Chunxu Li <chunxu.li@mediatek.com>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Dmitry Osipenko <digetx@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski?= =?ISO-8859-2?Q?=22?=
 <amadeuszx.slawinski@linux.intel.com>
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

