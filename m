Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207136D8B94
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 02:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F5A57F1;
	Thu,  6 Apr 2023 02:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F5A57F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680740249;
	bh=M1wSwwL/WspWtOKyPWAAIoRPZ/EbNkDE3jMENU8zgxA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oLJRyEjI+/MdZaIHNZjFK/aByGdF3bSXLWw96vVh78k+MzUFmruhpKPktj5lRofa5
	 JscvzVUS107hOx490LoDcOSvnua8zAHaY+QNumWHXPHabgiQBSJ+kPZlX8VVxkGIGy
	 szUaK/Zk5VpuCfjNs11Nk5VR5Ef7LSO5FWm/pLMc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 143C6F80448;
	Thu,  6 Apr 2023 02:16:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3675CF8052D; Thu,  6 Apr 2023 02:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B04FF80448
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 02:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B04FF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BlfiESCY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8xZ0psCL4a6LYA6Gk1a2MSkRkAaOgP116y201/QJZn4xaa/r4YaYVTdPgazYM7ieVPJdJRe8FW5nCEkSzpUICWD8TB4WMlswxHU34txLF22qqs3b5+JcLa3HiuqdkWaq3GC/fZeP/Du04V7QNDGmSbskLAi3JfUgzjD0zEzpZ8mgo2kXJOiQpEegc17lwuIltDwpYEem5v5rF/oQDQEWx36a0+GOeP+CCrYHsY6e7zlsM62CJR12Eb65Av+imPwtShN2WWJoPg3vwkwPMMg051iC9nUW86iZwDwir29I81w0zehj+bRax//DKFh/wFCx7VMOaotMjuIunm/uQaLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zU1RfcUHNiFAL2zI0ffpyDPF9l0VaQEfDvob84zYKE=;
 b=HnD2XvxBkuc6xga8Twz2IV/+N/kMq/2naof9HQmVHT1WFxJ15K9gcDxIg/I6lUkNWRW+th+W2RkOjkTswEeImVDqdYq3TbFg+iythQkyBRndu7acnYAz90nYr5oTRuRGDGTyMfRlFdUIYy43+qmFQZuBwv3ASUpwNcqLLRWTttI6Jl6tMGlbwGAyqJZjsBTYV1o1eOYvJoAGC8UazeTkKLj/i7H2B7mUkQHNugefsfJyw7nVjaTcxcHeo8DcLAEPPqUxTgxbMrhUmF9T9TDBreLZStZjJ7HsOJ6ENonKAkV2TDbg4hPe9RRkWwBXdbdwcC3CTkYFP3QmeTQVZ9m2+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zU1RfcUHNiFAL2zI0ffpyDPF9l0VaQEfDvob84zYKE=;
 b=BlfiESCYJIEhSFNXUJx8nyA18cOG32Kl1K4Qon/zdfGgt52IhtgdI8+4TBuJrVwd25uuh621FCN+ntS+AZGWcnd5n0hoRSjxTS37F1SWqIHk0IdEY0IXqiauABcx6J+RNCT+pAi4qfIdsNGHho2G3h7dXnbLwz0cMEtqembiP0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10905.jpnprd01.prod.outlook.com (2603:1096:400:3b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37; Thu, 6 Apr
 2023 00:16:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 00:16:27 +0000
Message-ID: <87a5zlx3tw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
References: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: add snd_soc_card_mutex_lock/unlock()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Apr 2023 00:16:27 +0000
X-ClientProxiedBy: TYCPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10905:EE_
X-MS-Office365-Filtering-Correlation-Id: 29128d29-46c4-4c92-de08-08db36342a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GYnj9zb/LvcYnx8c6U5HCbRwzzO5TdBBM6pDXbGAN/mOQesj8B3G1RswUOkeQ8seafPKfVojeQHLemySjswE+fIMn5V3xzm4bbXg6/nFBuODxxXXRsU2i3gVatCCrxJQ292znlnTw7orJqqtMw4u0NrnzHk/92SOkaPMgksaYpOZrPfuQkdKL+cK0A1jAnyDks/QPuQ9sWRQbauq0K9Z+FVftWheu2HJwQ8hkQOfrD5j4pp2KWyQJmNlzXa2Wh8LyJaluMMIxAVIHNdgrOeoT4QdVw5k62JlVi2e/tQYsHlnf/SF78GX2378eIe8cZClKcwCGeShN5G+8mwRUZsje/inw49ujEhxzrOd3QW+OVU6nqmTUt5eYthZB+AkANwI75OQRt/+Lk7CuYGPmcNvVdX0F7OgSVcw32EXT+5h8lqvuMw4Z6ftQ4spbKrWsDjwFlq1eaOxlHLPg+KpyqsUSCy+IKv4FJf0gUlVJPPA7WMu3Gtyt5WotBG7I80rsk0Zj3YTdbz7OAdjMJ0bc8VlrcRpSHPUY/04z/qiDC5AaEbozKFlw5kXFpG5OBa/g6nBn/XUwESXQbYx275XY8fT4j6HGYLQV9YD8qNpFM1IMfIdOz6boeJpLd5jrhYDJ8p5PzpCRhxBI2lT5Q1oJnl/jQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(38350700002)(38100700002)(36756003)(5660300002)(2906002)(8936002)(66476007)(66556008)(66946007)(8676002)(4326008)(6916009)(41300700001)(86362001)(6486002)(2616005)(83380400001)(186003)(6512007)(6506007)(26005)(478600001)(316002)(52116002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8tmiP6P01dvdAqKQrxyJDJBcziZL4IznkMzTgmQWW+Q0tF77iGkqkikPxJan?=
 =?us-ascii?Q?OsvQmWw5Q8UbcfOtxSsmMa18myTWP0PRQyBRyobgOT1+AvD52hwysPo6Gtz9?=
 =?us-ascii?Q?E+wrlI8NbVE5w0678A70/JgsApLKWOhNcjKAG7Vn4wx3JQtyPXsQgv7IQr0m?=
 =?us-ascii?Q?n8Y8TMECHGAIAfUqKLsUiyQMmhTIBpp7iiZRiuXF5Biwnr71R9X9uqnkPCp5?=
 =?us-ascii?Q?td+4KriAVcj90SwaDCSJtUUEj9kYLQ9A34ir8j5zIGahwh13fDrsPXraV1xn?=
 =?us-ascii?Q?1TfTOZ7XNUGu+WyT/ilAN6mcJLxBYh63ZnHB2FFzRrMtZqX++lIFT7hG8QLx?=
 =?us-ascii?Q?Z3rz0GiA5UgUe27KwamHw0jik+s9XJoOA265u1Yc5ecIUXyVsMZGc4gZ9vnH?=
 =?us-ascii?Q?gs3NgzGLUNzJ/xbtBpfI9BVzaZgu7YeTB0nt3b8qpwSN4clnBjqgxp5e0J2a?=
 =?us-ascii?Q?dlnmzMQKKVOQpEOk3Bop9hEKYnEvq7oIIfak20ZgieVaxV5HdKW97G69R5DN?=
 =?us-ascii?Q?V/vm59YT/SXgDi3UrXZwdyE453DlS0ML4fU+IuPwSMjy6ysl793wbcfTwQ/4?=
 =?us-ascii?Q?OJZvtdqYfHc3Hnzd+6YzDxaWPUeo0LqcFSOsT4WrdQRAhZA+dqNPuc/VGHsx?=
 =?us-ascii?Q?rtEJ9Osp338eLjqUYaYWBVkU2cYs4m57veU9Enu9/Kbua8HBL2ze2UB/qOKG?=
 =?us-ascii?Q?kjd+7EA5/x+lpmlLhlAnW4pG9e92s/MQZ2KtJZh5CTiS1hnlNPEIqK4qNPU5?=
 =?us-ascii?Q?KN3ebuxsSdlipayiQkl1wzWawdoYI5NklahCR9JzoYv1ozLtEUzQ0kQJO7iV?=
 =?us-ascii?Q?C0FKiMOsXKTjdwQ84AOKIS0zKuyirJso6Zar/p0Q6hVAr9TqK3fjxcRuJHBv?=
 =?us-ascii?Q?OO/Zo1RC9mq0RDex4E9Fhg1w/s5St2EiZYO6/uCCCbvfAU07zZTffgJJORYI?=
 =?us-ascii?Q?tWUCMAYONNUHpKSkZHiiZDpsmVXGfosJGOtidckGA6QVUF8hlqKXy4z7opt1?=
 =?us-ascii?Q?MCyhyKSD1U0p/HQSD0GeU/P70x+Hp2Lavvnqi3HYM5k7SZJQ9eAc2/AOjFgp?=
 =?us-ascii?Q?C/pLS4tzX+gSneteCFdFMm+qjuXtNDf1UtwJ4wTbEfgY2Zrqlms4Mq6qDfgT?=
 =?us-ascii?Q?NT9ojLhZ4P6AxT1LyBmm5nh6HaZfuVgMRVtlE6EGt47F5em44iGV6UoAHlpW?=
 =?us-ascii?Q?0psMILBaKNTecfFOnf0/CcfVLTf/ybE+LiN2tLwJjN3cCa3kwS426u65HxLy?=
 =?us-ascii?Q?qUJnlSBhn94szJbBR9KKkVsfC1la6sVGlebcgwH74AUMxoY4nSyB5iQp7mno?=
 =?us-ascii?Q?OU55v4kKBi1LEXG/dwqKAI4l4o4Sj41yf5ZXAg41gjLT7nI3ynG8XikoDr6j?=
 =?us-ascii?Q?Dy7ZqBH5G8MWCtIgbXEDHJcL79NdK6vA9pbxB0fjiabJyDRExaNy62q7EGJF?=
 =?us-ascii?Q?qROp4VodwGY6H5oZD83xyMjh37K6P5z9ykAUfP+abVDoF2OsXq0LmjtqygDL?=
 =?us-ascii?Q?ytaSRJ5YPWliK12L5UaW53wSEcn/w+7nHjbn3Ueg0dahsDlVJZSH114s9V+G?=
 =?us-ascii?Q?CRZQw50uQPPBudIaz4x075WrExvli7sbSxaq6QD121W2m8/p7pEmYinJGji0?=
 =?us-ascii?Q?GLZdbZo/G+GmXnvK/0AB7X8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 29128d29-46c4-4c92-de08-08db36342a26
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 00:16:27.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jvhtvjOYxk/S9JgRSYWGZrmIz3he16887vzv88GIdT9EKp5rb7iYyrY8ek+R3p9ocMETPu69+CqCKSv2WBE5bGGJoatfVPJlyHV4UwJ6MIK5KN4EC8BgW/o4IQaaImdY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10905
Message-ID-Hash: U7SVTLK2CUDW72PGZ7F7XAKZ7NFCLR47
X-Message-ID-Hash: U7SVTLK2CUDW72PGZ7F7XAKZ7NFCLR47
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7SVTLK2CUDW72PGZ7F7XAKZ7NFCLR47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC need to use card->mutex with _INIT or _RUNTIME,
but there is no helper function for it.

This patch adds its helper function and use it.

Because people might misunderstand that _init() is mutex initialization,
this patch renames _INIT to _ROOT and adds new
snd_soc_card_mutex_lock_root() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-card.h | 17 ++++++++++++++++-
 sound/soc/soc-compress.c | 18 +++++++++---------
 sound/soc/soc-core.c     |  4 ++--
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 9d31a5c0db33..fc94dfb0021f 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -9,10 +9,25 @@
 #define __SOC_CARD_H
 
 enum snd_soc_card_subclass {
-	SND_SOC_CARD_CLASS_INIT		= 0,
+	SND_SOC_CARD_CLASS_ROOT		= 0,
 	SND_SOC_CARD_CLASS_RUNTIME	= 1,
 };
 
+static inline void snd_soc_card_mutex_lock_root(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_ROOT);
+}
+
+static inline void snd_soc_card_mutex_lock(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+}
+
+static inline void snd_soc_card_mutex_unlock(struct snd_soc_card *card)
+{
+	mutex_unlock(&card->mutex);
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name);
 int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type,
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 661e9d70994f..d8715db5e415 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -140,7 +140,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	ret = dpcm_path_get(fe, stream, &list);
 	if (ret < 0)
@@ -184,7 +184,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	snd_soc_runtime_activate(fe, stream);
 	snd_soc_dpcm_mutex_unlock(fe);
 
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 
 	return 0;
 
@@ -196,7 +196,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	dpcm_path_put(&list);
 be_err:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
 
@@ -207,7 +207,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 	struct snd_soc_dpcm *dpcm;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	snd_soc_dpcm_mutex_lock(fe);
 	snd_soc_runtime_deactivate(fe, stream);
@@ -237,7 +237,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	snd_soc_dai_compr_shutdown(cpu_dai, cstream, 0);
 
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return 0;
 }
 
@@ -284,7 +284,7 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 	    cmd == SND_COMPR_TRIGGER_DRAIN)
 		return snd_soc_component_compr_trigger(cstream, cmd);
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
 	if (ret < 0)
@@ -315,7 +315,7 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 
 out:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
 
@@ -373,7 +373,7 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	/*
 	 * Create an empty hw_params for the BE as the machine driver must
@@ -411,7 +411,7 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 
 out:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4594505cdae2..b48efc3a08d2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1938,7 +1938,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	int ret;
 
 	mutex_lock(&client_mutex);
-	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
+	snd_soc_card_mutex_lock_root(card);
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
@@ -2093,7 +2093,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	if (ret < 0)
 		soc_cleanup_card_resources(card);
 
-	mutex_unlock(&card->mutex);
+	snd_soc_card_mutex_unlock(card);
 	mutex_unlock(&client_mutex);
 
 	return ret;
-- 
2.25.1

