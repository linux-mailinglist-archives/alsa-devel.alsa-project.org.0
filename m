Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F47AE5AD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C2C84B;
	Tue, 26 Sep 2023 08:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C2C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709274;
	bh=xbZOm6gKPqVlAn9Hs8vgpKaHkLrieEcvRhI2Glk0si0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fv2sUyEoVuVXcjacCFdwgkcRxiR5qdDPHkxYzrUHBJql2vh7axQJ+a63C3ieWWyPW
	 t1pK/E/IA3VBXu+9+zf53QekxxGEbTHmuFmB3sNUDE8GkiPT3ulpEU/6GbETSMz9q3
	 ljJTsqmGFJ05qPNPeT2Fo/IZsQb3gfIpl9Sm2pjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A5FF8001D; Tue, 26 Sep 2023 08:20:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 918F7F80166;
	Tue, 26 Sep 2023 08:20:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE415F801D5; Tue, 26 Sep 2023 08:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33637F80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33637F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hu/xKU08
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+uG2MejmsRORBizT62UXy6p4fUSccAIL8gRxIDFFDzNGqQRhV+raHWbLperJfZscgdxZhnLg9z8gtsqLsbwzSiKbiJQv87FVIPKXCFb43OiarEM0A7z4CwPY4V5RL04wiSau19Tyuf4jdWKXKWWJZfdlNXvkf1tT0k3y63H7eZGv1/cyqMaKD/CzgEwfXpA+HUBchx5rlhbrX55zEY4045fVee+X8yrjEVz2u+2Gfxs6IFpPlP0qysP7efA8e04toD48CsM+4AcsPC83yV0lAAYAVWPXwq0+QJXi2S8NP/KArqh8sX2Vxo344ZjzjAfYWmSnCKW731yaGrLDaZKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyM+n00yZU4abyeAvGLn9uFrhW+IrOZkn4uGlaJHGr0=;
 b=BtGY8xhKCtTOuiQGQMvU4WrON81x7n7rEg7Gvq6NoTzaSzcJxEU1jxAf/C3sIim5GEEMtmaXBF3IPZu0dCMlIh/aDq8ZmR4jwPqg6fpoSRNfg6XPaTmnp/TSj5z4pi/bJPzIyL0VHhJXnKeKjY2VtkPOQNetOF7fj4KGOt2owCfjICyHIkNPozgjuJuiAi0rUMksIPUAd8SmQIzm6slQk3qqv5BfyA0kdO9UhHI0QSFEZOvcNRjANLmBhlneQVTJy9Sukn3hY24LoshKf92y2A/wF1S6HON8a2VjAKkXbI0RTUsMrqtsfgUh1yyJGAopb1Xen94KiIJP15OQD7HWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyM+n00yZU4abyeAvGLn9uFrhW+IrOZkn4uGlaJHGr0=;
 b=hu/xKU08GMABKXYAyp/ZugG12d4vjvnOGRGZltwg6hmOJdmW+ecsmfxY1hIaGaLpS56DgjiUFGl0WhdEAv8dzDVrLk/pAIbBlYYcaazbYcwWOOte9lJG2d8OlinjmbNNuhc6W/4Z/sg8XEukZ9HtnH9+fMoh55z4nI1e433ZsBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11898.jpnprd01.prod.outlook.com (2603:1096:400:3e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:20:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:20:09 +0000
Message-ID: <87cyy5ihgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/54] ASoC: soc.h: convert asoc_xxx() to snd_soc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:20:08 +0000
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11898:EE_
X-MS-Office365-Filtering-Correlation-Id: 226dbe76-0b63-44c5-c054-08dbbe58a209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KuCicLjWWOaFnbhPgJflXZbesVQQ7Sf6AwPL66y4fBpT+2FLhMjmELNZ6UXtI1wVERvrGTqDSvXbFlpfZZYBw3ipt+G+pimvUrdjq4A9teCdnSCjs3Z4unp2P8FU/SmZ78y+nNI0f7BfmnoEQNK5vCTscybkYXUsQbqOPvZTt74O6CzqXOINxyWxwt1puFuF8UXUSS1bmhNRlgQaBg3gTe4P45ouX6cY0Znh8EgW2t17YCcc713kVlhU4aF/V7Zr+HpmMBeQ58faKEcaB/KlbZouGVRS4gjrwnKDasbd0+u8lgsB/XWFx8gx8bhX9ObxRO8jVUwQO58BGmN7HpDocf7uZJc4+UqJ7RXg+bhm3HjDyACVhbkhH9PpCFInCOW4Xz0K7snYChj4p87rjUJNKFdBWWCupjrep3hmGm2BItZRw4cLPjkhxJR/SzCZOKuLp0SrF8iQYW7Z1xBuGkWeP7hGvTO8dQyMJguLysETLYzNc3t86FDkgVQsHlw6pQFL/V2uzOCIMHCDEX+1Ei9raIk+VMtP2N9tDkcmOYEBNXlYKizsdYfrrOhqA4OP/K6/EIKPTiKLE8dvMvhVKq0H3tYgLc+2VtOyMDgIH0efn2eszm2UvFOHif35XxJoyJHq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(5660300002)(83380400001)(2906002)(316002)(41300700001)(8936002)(8676002)(36756003)(4326008)(2616005)(66476007)(66556008)(66946007)(6486002)(110136005)(966005)(52116002)(6512007)(6506007)(86362001)(26005)(38100700002)(38350700002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NAQpnwUkZqGwT2n3aJxiOxZFN/WB4pwXSf4haGGnmkmq3fxhNMpsG9l/GdWp?=
 =?us-ascii?Q?CcNCegVjH7z5Hczjl2iQiVLl1P/HiU9PdPfT2O3tvWSSvyqqwKqtON0xSiR9?=
 =?us-ascii?Q?I+QSSxVknuBByD+LxsSLfhMYTd5iBEexqm+8QI8a5rQsmr+qRUDZWMjYRG+T?=
 =?us-ascii?Q?6bCcoqZvVyCRnAgjIzO5qoz0GzIkdJZslKHIETw/AJHD6hSyTYyRQhzcAa2/?=
 =?us-ascii?Q?iOz4THVaQtg5wteBjQmCRclbl8ZQLEyOQ+wsy6t2kXGha92ydHfUuIQKlZHS?=
 =?us-ascii?Q?2mRLBWUIGOuC2iO4QCV75fO8hXJerydpI44vTnwCQjcUiVezz1T+GA7eJnT9?=
 =?us-ascii?Q?fj+9li7jWEtBuGUY4MLiCZDm8zYjT9SicOmGn6OHODFWsC1I8z7rjT5+aMFi?=
 =?us-ascii?Q?vpU7O78WXCWDqlQIvZPwB5hwHTBu0hF6zLWdk+rnMBzK+WhjbaXpG2445Szc?=
 =?us-ascii?Q?NwhRJ9EyTfX3FKi6lBQ6kNqdJANHQvcDUxXNaqLVt/Oz0/6ffPuBdbgO6c7V?=
 =?us-ascii?Q?afT+Y9P0fjFQG5YB0hsW+bmAfJWjJ2JkN6LrrFPALOLjo1wbIQrPo9egTyRH?=
 =?us-ascii?Q?oVznL1FfG0cY8q5vMwm1TJFSmlEPJUGOg/oEi2bMd5vQIoVRZ16dNvMqEdtB?=
 =?us-ascii?Q?I74KzfCcFAlJPi58+kJgd2BYkDgXJcaoyz4UklGw683BDqYBUVVYNmoJNNiM?=
 =?us-ascii?Q?c+XVbDt2xkFp2icHsM9cbAqbOSc66RwuqL43b2PijR1uNQHCwjPWbN0lAhbH?=
 =?us-ascii?Q?rcOE9mm39o/AAojhB/i6hug+iFPROXDeNPpSOH4CShvI3Ler2sDHYDAroATT?=
 =?us-ascii?Q?/3640LXlnHoMG5rzZJndPHbWKxvjOUsRRWfDKOD1sLZf66daLhMaxGqwTSN7?=
 =?us-ascii?Q?ByEimgqrfkp4uwle7KrQWANi/9aUJGXZbZs1JHZw7BW7PUqQmkiXLog0lkkK?=
 =?us-ascii?Q?rXNUOmplMRT/5ZFNf3p1+DBSXCUjFQzG1PVbXt1a2OKxgfSkecrIWMfjbXeD?=
 =?us-ascii?Q?avgIG4iBfmwUiVK5fDRYJFUKsByZVQWzQINNh2kjdg/zydBv2nMv186cN5v2?=
 =?us-ascii?Q?xxHqs2Mx/XC8FI3BoP9/qitAYNHPx4AGAugnueKoowSmbEzMxEziY0a28GyK?=
 =?us-ascii?Q?jJYea47hGUMVH93aPAKBhyb1xm3jrTZ31J6mQcOjKvMmMZ7KoPG+jlVMbgUO?=
 =?us-ascii?Q?sE31RWUrDdIpsia+RNe2dAwZwGd/mWiJpd6Ncrx2Nz1tNSSgJ3mtpS98L7r9?=
 =?us-ascii?Q?7Ixo/qG783FkdF/YnhQR8moKlyqFx1wUX7n7yhRz8nE/DW4dy48KOMYaqp9Z?=
 =?us-ascii?Q?iuv0jPei8QD1ckcI8CqXVm/XmzbLDDBOhuXZek0qbPIsFB5loCVGgmQKqPlp?=
 =?us-ascii?Q?3NTwyTaWZtOINV7B0jjzwpFV+NT7lPTK4oI++w8ihJ9AA+L308cGTLfTVZL7?=
 =?us-ascii?Q?ehcObjyofF22xjvwwbwMkDh6IuqQfDvPYeHASbeJWhp8gxQmRTNnpiIH0Mi9?=
 =?us-ascii?Q?PSba6eJA3OoRU08vvmZFAJTASm165Z/sA++nMZ+Cj+OmruEZgkbZ1rS6x39W?=
 =?us-ascii?Q?nrqurcMlqBtdbVG3PqTQXSZH+UQFKvrZ+PVzLn/pDYKZyFruIn2e+6ezWHYd?=
 =?us-ascii?Q?o61RRSxHK8vK6D2OTooQlck=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 226dbe76-0b63-44c5-c054-08dbbe58a209
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:20:08.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QdADtRZ5i+PwFzveu08MLQbTh7VJTjbDUOZI6aKvLGGAT4XGfuj6+sAzYbXzSHoR5SDVl4SH7nCzN/anC2z2xF1RgXkwXTTp0ZFdRLyq8S/M68GCR+v4EcCVHLy3/nGm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11898
Message-ID-Hash: O5I76HXIDKHOSLV2O35IVRURKLGRJ6MX
X-Message-ID-Hash: O5I76HXIDKHOSLV2O35IVRURKLGRJ6MX
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5I76HXIDKHOSLV2O35IVRURKLGRJ6MX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is using 2 type of prefix (asoc_xxx() vs snd_soc_xxx()), but there
is no particular reason about that [1].
To reduce confusing, standarding these to snd_soc_xxx() is sensible.

This patch adds asoc_xxx() macro to keep compatible for a while.
It will be removed if all drivers were switched to new style.

Link: https://lore.kernel.org/r/87h6td3hus.wl-kuninori.morimoto.gx@renesas.com [1]
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-card.h |  4 ++--
 include/sound/soc.h      | 42 ++++++++++++++++++++++++++--------------
 sound/soc/soc-utils.c    |  4 ++--
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index e8ff2e089cd0..ecc02e955279 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -115,8 +115,8 @@ struct snd_soc_dai *snd_soc_card_get_codec_dai(struct snd_soc_card *card,
 	struct snd_soc_pcm_runtime *rtd;
 
 	for_each_card_rtds(card, rtd) {
-		if (!strcmp(asoc_rtd_to_codec(rtd, 0)->name, dai_name))
-			return asoc_rtd_to_codec(rtd, 0);
+		if (!strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, dai_name))
+			return snd_soc_rtd_to_codec(rtd, 0);
 	}
 
 	return NULL;
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 81ed08c5c67d..45e005abe03b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -775,37 +775,42 @@ struct snd_soc_dai_link {
 #endif
 };
 
+/* REMOVE ME */
+#define asoc_link_to_cpu	snd_soc_link_to_cpu
+#define asoc_link_to_codec	snd_soc_link_to_codec
+#define asoc_link_to_platform	snd_soc_link_to_platform
+
 static inline struct snd_soc_dai_link_component*
-asoc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
+snd_soc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
 	return &(link)->cpus[n];
 }
 
 static inline struct snd_soc_dai_link_component*
-asoc_link_to_codec(struct snd_soc_dai_link *link, int n) {
+snd_soc_link_to_codec(struct snd_soc_dai_link *link, int n) {
 	return &(link)->codecs[n];
 }
 
 static inline struct snd_soc_dai_link_component*
-asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
+snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 	return &(link)->platforms[n];
 }
 
 #define for_each_link_codecs(link, i, codec)				\
 	for ((i) = 0;							\
 	     ((i) < link->num_codecs) &&				\
-		     ((codec) = asoc_link_to_codec(link, i));		\
+		     ((codec) = snd_soc_link_to_codec(link, i));		\
 	     (i)++)
 
 #define for_each_link_platforms(link, i, platform)			\
 	for ((i) = 0;							\
 	     ((i) < link->num_platforms) &&				\
-		     ((platform) = asoc_link_to_platform(link, i));	\
+		     ((platform) = snd_soc_link_to_platform(link, i));	\
 	     (i)++)
 
 #define for_each_link_cpus(link, i, cpu)				\
 	for ((i) = 0;							\
 	     ((i) < link->num_cpus) &&					\
-		     ((cpu) = asoc_link_to_cpu(link, i));		\
+		     ((cpu) = snd_soc_link_to_cpu(link, i));		\
 	     (i)++)
 
 /*
@@ -891,8 +896,11 @@ asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_CODEC_CONF(_name)		{ .name = _name }
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
+/* REMOVE ME */
+#define asoc_dummy_dlc		snd_soc_dummy_dlc
+
 extern struct snd_soc_dai_link_component null_dailink_component[0];
-extern struct snd_soc_dai_link_component asoc_dummy_dlc;
+extern struct snd_soc_dai_link_component snd_soc_dummy_dlc;
 
 
 struct snd_soc_codec_conf {
@@ -1110,8 +1118,8 @@ struct snd_soc_pcm_runtime {
 	 * dais = cpu_dai + codec_dai
 	 * see
 	 *	soc_new_pcm_runtime()
-	 *	asoc_rtd_to_cpu()
-	 *	asoc_rtd_to_codec()
+	 *	snd_soc_rtd_to_cpu()
+	 *	snd_soc_rtd_to_codec()
 	 */
 	struct snd_soc_dai **dais;
 
@@ -1137,10 +1145,16 @@ struct snd_soc_pcm_runtime {
 	int num_components;
 	struct snd_soc_component *components[]; /* CPU/Codec/Platform */
 };
+
+/* REMOVE ME */
+#define asoc_rtd_to_cpu		snd_soc_rtd_to_cpu
+#define asoc_rtd_to_codec	snd_soc_rtd_to_codec
+#define asoc_substream_to_rtd	snd_soc_substream_to_rtd
+
 /* see soc_new_pcm_runtime()  */
-#define asoc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
-#define asoc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
-#define asoc_substream_to_rtd(substream) \
+#define snd_soc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
+#define snd_soc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
+#define snd_soc_substream_to_rtd(substream) \
 	(struct snd_soc_pcm_runtime *)snd_pcm_substream_chip(substream)
 
 #define for_each_rtd_components(rtd, i, component)			\
@@ -1149,11 +1163,11 @@ struct snd_soc_pcm_runtime {
 	     (i)++)
 #define for_each_rtd_cpu_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->dai_link->num_cpus) && ((dai) = asoc_rtd_to_cpu(rtd, i)); \
+	     ((i) < rtd->dai_link->num_cpus) && ((dai) = snd_soc_rtd_to_cpu(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_codec_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->dai_link->num_codecs) && ((dai) = asoc_rtd_to_codec(rtd, i)); \
+	     ((i) < rtd->dai_link->num_codecs) && ((dai) = snd_soc_rtd_to_codec(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_dais(rtd, i, dai)					\
 	for ((i) = 0;							\
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 9c746e4edef7..941ba0639a4e 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -225,12 +225,12 @@ int snd_soc_component_is_dummy(struct snd_soc_component *component)
 		(component->driver == &dummy_codec));
 }
 
-struct snd_soc_dai_link_component asoc_dummy_dlc = {
+struct snd_soc_dai_link_component snd_soc_dummy_dlc = {
 	.of_node	= NULL,
 	.dai_name	= "snd-soc-dummy-dai",
 	.name		= "snd-soc-dummy",
 };
-EXPORT_SYMBOL_GPL(asoc_dummy_dlc);
+EXPORT_SYMBOL_GPL(snd_soc_dummy_dlc);
 
 static int snd_soc_dummy_probe(struct platform_device *pdev)
 {
-- 
2.25.1

