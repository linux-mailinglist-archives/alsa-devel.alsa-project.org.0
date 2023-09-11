Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 828AC79B165
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7BF6A4C;
	Tue, 12 Sep 2023 01:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7BF6A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476521;
	bh=6mTawd148wL+MZUUzaNQA9Q2KErOZsFaPWotmwOfbg8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ubiyugOi6vrNX2JTRvoYYlQyG6ZGFkQAAJf9EeRQaC8x/vTdJDxblmOwEneC36PY8
	 9qlNKMB+NRdpUy0nXVcNIhxdvNXdIMym/a3q4lApK4LO3omGBz9xcQiQirpacuqFda
	 UIecN9rwAqIt4cq86Vk47CgiTL1TOQmixDV1ZRD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A176F805BA; Tue, 12 Sep 2023 01:51:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F903F8047D;
	Tue, 12 Sep 2023 01:51:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFF4CF80677; Tue, 12 Sep 2023 01:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BEB9F80580
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BEB9F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=f5nnMEKy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1auif1ljX07BJrpcMEn4G87JJ954ODS9AojHOe56lZeu6M1QIIPs1eWr/huUimfw/su6MeO5TEbWdC3Hh05YGniJQOqzCHvtFLKgDF2cHo8jHaMOK3UrII4d1fKl1LXt7Ny4FWBi9mYDEqQmqhTTkaSmOcWggTdvBNnxPpQ6ZGIYn7FGiHZ18DGWG6snPKKLckJJhsCQreNSeL2y/fau8gpmX88iuKQd+oRz1ImJqLqGOUpprPQqchEYx6QiXd83F9hMB+YokqEwjcLFvzYKpHiKg7/Gj6EiGxEY8jiahqgQEa6JazWqLatBA5U263+NpSO7HnbPALvRc1pHpwfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WVGUxs3LvrOyxHrXlbWo2JmEIU01yWTmbpuhuB75z4=;
 b=OpUQQ3r3LzldtQLAZlj5cYB4wsFkbrI50/bywp5nMphfpGtMntsIbqZFmpOyz8MNC0j/idE0YU4LwVj1eNbEnq8Gm763yWVlCdcHt2meSNgJvOrqkwOKxOUryRDyVTiOtZtr64iPjVF01oDKBgVaYHT8mi5l/RsQrVHXvYak1mdTu97HZow0bJ1cIDQTMJss2/S/c0nZYNNfYCXoeaSgCkb2T7njgOsb5sAR9RRc4i2XFsZauPz2NlBjNnDu07FpLc8Afmb/O/MBrirG4YK1TtJJB4XfXK/5frGkjMUY44/L0lwACex80jJhH229avuBZ3A8AAej5PMNByj3ooUNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WVGUxs3LvrOyxHrXlbWo2JmEIU01yWTmbpuhuB75z4=;
 b=f5nnMEKytFztpUDTeC2zUNkZH43hLAn2ZsTAnXtWQ/LeBxaawk8OSiE1vo9XeLJaSRizLBT3YFypoHxVIV1bjwoUluc6h3o+gQ2bsKq0HUwsWIAj/+sHkGzii9OHZLPv5Rvjcb81dbfjs+hWoNubrtZ0GG+Ka2WPuxltoM8kcP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:46 +0000
Message-ID: <87fs3kqnhi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Andreas_F=C3=A4rber=22?= <afaerber@suse.de>, Alper
 Nebi Yasak <alpernebiyasak@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-actions@lists.infradead.org
Subject: [PATCH 26/54] ASoC: samsung: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:45 +0000
X-ClientProxiedBy: TYCPR01CA0077.jpnprd01.prod.outlook.com
 (2603:1096:405:3::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 190af920-9961-4073-8fae-08dbb321c71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WHEBxMTxSQkyrU5K36b50NKWUSSpIyXSOUc18I4X28P6r+t5V1c4YeEJ9MjkVGlV+AhIkRnDrzi48IZNXWivR9KxOisvT7HKyKa7ihcCBwlCiBdWpwE6IjXbIOSx2reE4pIHOJWhidlobVmg+Z+ZSRcPZKY2wzGhHZzni7fHXgbFb2yU2iGCp03d3CFLJbgqkfLRkYds+q6lqi2upb1BeibFu7G/vSgmTqTucBy9YewuJUe2qvpvBDbF4Cfcwd9zJAr8LID80MFoZRkiyduUgsxTlkwmza2m1DFdxpwK3kYx88iEQg2POIsg+QesN/8FJIiTa+TrgcpwU7o6tmUKAfGJb1ZCnb2xLQ+85RpkZZGLjxl63f1G4G7F69pjwNeRu5ioZFa8fzwHO+FTERxMr0ccDeIyUrsclYIajBJhNrwE/cSF86YvsGiB7gpY2OGYI3dkAT4UWdcYCteD/0ZRZHxyxNh3WpVZPI+mN0QzoEgsnzyZP5GFd7NAOm7WbuuBFQBc6p3Slux1WA/QcDc0uMG7SQAOVpA/32Spsa8jWLd0v2kb5jm5w/vyRD9E0NLn31Ed/aBPus7lpFZg7nWGks1PRvNyfyFnkQmG8DeWk6SKjWTR4+6Gd3tTxue1pHw0bU/J21F0CK4XKM287GlB3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(30864003)(2616005)(26005)(2906002)(7416002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F0BquBKsKMhTjRRCUBfcs3LYVatOrfbL0pwvcQnQR+fCDuhVMTqBeluzlVEl?=
 =?us-ascii?Q?JvkZ9US7a9MbRyXyJMpQK00moMkNX6U/gUB4tMVOQhhoIzCv5JtD8y4BQIlj?=
 =?us-ascii?Q?2Ko1Miw5mLYNEXzgQAHfuiEANxRM8qU2mhMNFNgqSSorRphJ16bgab0oO9DY?=
 =?us-ascii?Q?eHBKOsfFJT8zdmkXo78+8IDszVpCY45XUtiAXl9kWR2cYFKSrb5FOOiiH/k+?=
 =?us-ascii?Q?xH83gjNywO4rpEB9SicC4dQj7SibAdfKmhvHi27hg8KdSYa3Td5S1Wpf1LyS?=
 =?us-ascii?Q?KOHdFv80X/W46FJBiqNyh/qM79QXsudQ+7qqv0eESbvU5vDXqadMp604SDHu?=
 =?us-ascii?Q?Em46+07uDTjHs5++8g8y+9HIMGM99JLvFqG5bB0y9nkxQi6L391WFq5p9jj7?=
 =?us-ascii?Q?Vfm5Bo8aW7mPSTVqf9I3wgzI8zWRi7D/Tm67vxEQOSj7StvvLRspn9f7UvQj?=
 =?us-ascii?Q?6HHj2vNHAvwNxQJE+D1iYkAKVW1tFi45hJPeAA9hpZyGA3K3+rzYOCLfrtdo?=
 =?us-ascii?Q?ohcFy+GgpsLQvsCQwcuX8DQg9D1KB6KafAjA6yzuuJAg+nssSDlFQtnCQCO4?=
 =?us-ascii?Q?6BzVs5ReKuqQTScqiNoiMjHLE4K9DQrEeGcsuxZZ0lsYEf8resGERtAB8JUm?=
 =?us-ascii?Q?uomtDZIKx5NsB6/IYZtlA5fC5a5XVjp8MF972VVYCz8cP/UmaR2PPPF15l4A?=
 =?us-ascii?Q?1bLkAZFpBxLHQo/v18lvEOYAWYrEBuexs3RLUvsGwvfvC/NY3FkIDQhGqATo?=
 =?us-ascii?Q?76RPahY6nX0i/3DMHr1noVJuKojl4aANHksaX5Hy+fnn3IHbZLLmzIs/T9n4?=
 =?us-ascii?Q?Q/v27AKNlpHTOtMMjvYh3x2+CFTDY7zm1uk1SnSDykx82tVruBS8ve/ddzMZ?=
 =?us-ascii?Q?jZ9Qt/pG1r+vVaSFg+n5C05CNrfpYaW8X4BDXHNzGLNRAwex6CHC0sFYeWZ3?=
 =?us-ascii?Q?u06C8z/RZxmzVAAVAsGlw+YVeSufvn1FgKRCgUEaz7JDDe/jp5l3JRdRlpvp?=
 =?us-ascii?Q?1BwK5q810VgN//AhAsQ/3I63sCYrXTunUnpe/S4TdNbDZZPT5DCpTs+U8Q/9?=
 =?us-ascii?Q?tyHXnQt42WCrcUc13qbD/XSfAdpEteLRCdcrl8RLlLpFPxFbaazgFcxXWrj6?=
 =?us-ascii?Q?uY8il92effcQGv1pTKYGH+JPFNqK5j///XtGTGgJfaC4eLxwbuMuKoT7G+e6?=
 =?us-ascii?Q?V8XUa4iG4zB7/79+yR2cvlD3kU7NWWTK/qz6kAwKYYJZ+W4oUWudU5uYyxES?=
 =?us-ascii?Q?OFCeBftqvYvO5xxQ0yKNc0e7BMlOwvsXfcJ/mBbfCPx9jmJNuWfngR3lR5n6?=
 =?us-ascii?Q?otHbpqMs4NzqIPSM8BrePvNNb6Ew5pxHx4CsX8lugH4jLJrUk9vkn60Y5DvE?=
 =?us-ascii?Q?uWX/udB3Q69zFs+dRFd0pqCH+uRtgIVnjbov9xzwVAQ9ZrQe9xfzsOQEhqRu?=
 =?us-ascii?Q?vEgG/5WItCMKuRnmrKqElMhAQCTXzD4bdHJuq8Vr3/gqe3qfe5n8Bs5XBDH3?=
 =?us-ascii?Q?LlZrrgujP/6r32prOsDOdgIfZZ8ib5QfV72eL/vCxTCWnCPoHX+5acW32RLU?=
 =?us-ascii?Q?4HLYDEvzY2kR9X1vueneLwLuEF1mdfy9hpEE8mhKl6YmmEDJm0y0YIbeUq83?=
 =?us-ascii?Q?bWaAtMA1GBFe8E674fMQBaI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 190af920-9961-4073-8fae-08dbb321c71a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:46.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6D2/PKRyUj5l2k9AeHGL0xELUcB3qfEoYLkrCosBZmXKmdyxUDHV5G8ukCC4PHU8ArNYRM/yseaIR2ejc0bgj1t36vByynGVlk5JHdhXP7Opb6cDguhw6VPxVzaAV8H7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: GF57FUDMTSHXGJWNOWSQRG7D46WMMGBR
X-Message-ID-Hash: GF57FUDMTSHXGJWNOWSQRG7D46WMMGBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GF57FUDMTSHXGJWNOWSQRG7D46WMMGBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/aries_wm8994.c   | 12 ++++++------
 sound/soc/samsung/arndale.c        | 10 +++++-----
 sound/soc/samsung/bells.c          | 16 ++++++++--------
 sound/soc/samsung/i2s.c            | 12 ++++++------
 sound/soc/samsung/littlemill.c     | 16 ++++++++--------
 sound/soc/samsung/lowland.c        |  4 ++--
 sound/soc/samsung/midas_wm1811.c   | 10 +++++-----
 sound/soc/samsung/odroid.c         |  8 ++++----
 sound/soc/samsung/pcm.c            |  8 ++++----
 sound/soc/samsung/smdk_spdif.c     |  4 ++--
 sound/soc/samsung/smdk_wm8994.c    |  4 ++--
 sound/soc/samsung/smdk_wm8994pcm.c |  6 +++---
 sound/soc/samsung/snow.c           |  4 ++--
 sound/soc/samsung/spdif.c          | 14 +++++++-------
 sound/soc/samsung/speyside.c       |  8 ++++----
 sound/soc/samsung/tm2_wm5110.c     | 24 ++++++++++++------------
 sound/soc/samsung/tobermory.c      |  8 ++++----
 17 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index dd3cd2c9644a0..fa7dd04fe94e2 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -166,7 +166,7 @@ static int aries_spk_cfg(struct snd_soc_dapm_widget *w,
 	int ret = 0;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/**
 	 * We have an odd setup - the SPKMODE pin is pulled up so
@@ -259,8 +259,8 @@ static const struct snd_soc_dapm_widget aries_dapm_widgets[] = {
 static int aries_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int ret;
 
@@ -287,8 +287,8 @@ static int aries_hw_params(struct snd_pcm_substream *substream,
 
 static int aries_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* Switch sysclk to MCLK1 */
@@ -316,7 +316,7 @@ static const struct snd_soc_ops aries_ops = {
 
 static int aries_baseband_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int ret;
 
diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index fdff83e72d29a..80a57bff1d029 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -20,9 +20,9 @@
 static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int rfs, ret;
 	unsigned long rclk;
 
@@ -55,8 +55,8 @@ static const struct snd_soc_ops arndale_rt5631_ops = {
 static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rfs, rclk;
 
 	/* Ensure AIF1CLK is >= 3 MHz for optimal performance */
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 70b63d4faa993..365b1aca4855c 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -60,7 +60,7 @@ static int bells_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
 	if (dapm->dev != codec_dai->dev)
@@ -106,7 +106,7 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
 	if (dapm->dev != codec_dai->dev)
@@ -152,11 +152,11 @@ static int bells_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_AP_DSP]);
-	wm0010 = asoc_rtd_to_codec(rtd, 0)->component;
+	wm0010 = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_component_set_sysclk(component, ARIZONA_CLK_SYSCLK,
 				       ARIZONA_CLK_SRC_FLL1,
@@ -195,7 +195,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 	}
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_CP]);
-	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
 	if (ret != 0) {
@@ -207,8 +207,8 @@ static int bells_late_probe(struct snd_soc_card *card)
 		return 0;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_SUB]);
-	aif3_dai = asoc_rtd_to_cpu(rtd, 0);
-	wm9081_dai = asoc_rtd_to_codec(rtd, 0);
+	aif3_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	wm9081_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif3_dai, ARIZONA_CLK_SYSCLK, 0, 0);
 	if (ret != 0) {
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 3af48c9b5ab7b..0d61055ddc590 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -939,8 +939,8 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 {
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	switch (cmd) {
@@ -1580,8 +1580,8 @@ static void samsung_i2s_remove(struct platform_device *pdev)
 static void fsd_i2s_fixup_early(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	struct i2s_dai *other = get_other_dai(i2s);
 
 	if (!is_opened(other)) {
@@ -1593,9 +1593,9 @@ static void fsd_i2s_fixup_early(struct snd_pcm_substream *substream,
 static void fsd_i2s_fixup_late(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
-	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	struct i2s_dai *other = get_other_dai(i2s);
 
 	if (!is_opened(other))
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index fafadcef234e4..c5260e101c2a1 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -23,7 +23,7 @@ static int littlemill_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -70,7 +70,7 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -104,8 +104,8 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 static int littlemill_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	sample_rate = params_rate(params);
@@ -182,7 +182,7 @@ static int bbclk_ev(struct snd_soc_dapm_widget *w,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -278,11 +278,11 @@ static int littlemill_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
 				     32768, SND_SOC_CLOCK_IN);
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index a79df871ea135..702cb4cc1ce9f 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -36,7 +36,7 @@ static struct snd_soc_jack_pin lowland_headset_pins[] = {
 
 static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_component_set_sysclk(component, WM5100_CLK_SYSCLK,
@@ -70,7 +70,7 @@ static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
 
 static int lowland_wm9081_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_dapm_nc_pin(&rtd->card->dapm, "LINEOUT");
 
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 2ec7e16ddfa21..bc4214530e950 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -53,8 +53,8 @@ static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	if (!rate)
@@ -105,7 +105,7 @@ static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
@@ -284,7 +284,7 @@ static int midas_set_bias_level(struct snd_soc_card *card,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
 						  &card->dai_link[0]);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -305,7 +305,7 @@ static int midas_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
 							&card->dai_link[0]);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
 
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index c93cb5a864269..c59273e2da2af 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -35,7 +35,7 @@ static int odroid_card_fe_startup(struct snd_pcm_substream *substream)
 static int odroid_card_fe_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned long flags;
 	int ret = 0;
@@ -56,7 +56,7 @@ static const struct snd_soc_ops odroid_card_fe_ops = {
 static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int pll_freq, rclk_freq, rfs;
 	unsigned long flags;
@@ -98,7 +98,7 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	if (rtd->dai_link->num_codecs > 1) {
-		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 1);
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 1);
 
 		ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk_freq,
 					     SND_SOC_CLOCK_IN);
@@ -115,7 +115,7 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 
 static int odroid_card_be_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned long flags;
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index d2cdc5c8e05bd..573b2dee7f07c 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -216,8 +216,8 @@ static void s3c_pcm_snd_rxctrl(struct s3c_pcm_info *pcm, int on)
 static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
@@ -260,8 +260,8 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *socdai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = pcm->regs;
 	struct clk *clk;
 	int sclk_div, sync_div;
diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 6f3eeb7bc834b..2474eb619882b 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -100,8 +100,8 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 static int smdk_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned long pll_out, rclk_rate;
 	int ret, ratio;
 
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 821ad1eb1b79f..13fb1bd7f4c9b 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -44,8 +44,8 @@ static struct smdk_wm8994_data smdk_board_data = {
 static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int ret;
 
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index d77dc54cae9c8..5802f92ab8ba6 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -43,9 +43,9 @@
 static int smdk_wm8994_pcm_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned long mclk_freq;
 	int rfs, ret;
 
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 334080e631af0..7de6acb95701e 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -30,7 +30,7 @@ static int snow_card_hw_params(struct snd_pcm_substream *substream,
 	static const unsigned int pll_rate[] = {
 		73728000U, 67737602U, 49152000U, 45158401U, 32768001U
 	};
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snow_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	int bfs, psr, rfs, bitwidth;
 	unsigned long int rclk;
@@ -109,7 +109,7 @@ static int snow_late_probe(struct snd_soc_card *card)
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
 	/* In the multi-codec case codec_dais 0 is MAX98095 and 1 is HDMI. */
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* Set the MCLK rate for the codec */
 	return snd_soc_dai_set_sysclk(codec_dai, 0,
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 28dc1bbfc8e77..f44e3180e8d3d 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -141,8 +141,8 @@ static int spdif_set_sysclk(struct snd_soc_dai *cpu_dai,
 static int spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
@@ -177,8 +177,8 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *socdai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = spdif->regs;
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 con, clkcon, cstas;
@@ -194,7 +194,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_soc_dai_set_dma_data(asoc_rtd_to_cpu(rtd, 0), substream, dma_data);
+	snd_soc_dai_set_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream, dma_data);
 
 	spin_lock_irqsave(&spdif->lock, flags);
 
@@ -279,8 +279,8 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 static void spdif_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = spdif->regs;
 	u32 con, clkcon;
 
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 22e2ad63d64da..43519572dc698 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -25,7 +25,7 @@ static int speyside_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -61,7 +61,7 @@ static int speyside_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -131,7 +131,7 @@ static void speyside_set_polarity(struct snd_soc_component *component,
 
 static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(dai, 0, MCLK_AUDIO_RATE, 0);
@@ -143,7 +143,7 @@ static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
 
 static int speyside_wm8996_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 5ebf17f3de1e1..2417b91a328f0 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -92,8 +92,8 @@ static int tm2_stop_sysclk(struct snd_soc_card *card)
 static int tm2_aif1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 
 	switch (params_rate(params)) {
@@ -133,8 +133,8 @@ static const struct snd_soc_ops tm2_aif1_ops = {
 static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	unsigned int asyncclk_rate;
 	int ret;
 
@@ -187,8 +187,8 @@ static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
 
 static int tm2_aif2_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	/* disable FLL2 */
@@ -208,8 +208,8 @@ static const struct snd_soc_ops tm2_aif2_ops = {
 static int tm2_hdmi_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int bfs;
 	int bitwidth, ret;
 
@@ -284,7 +284,7 @@ static int tm2_set_bias_level(struct snd_soc_card *card,
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
-	if (dapm->dev != asoc_rtd_to_codec(rtd, 0)->dev)
+	if (dapm->dev != snd_soc_rtd_to_codec(rtd, 0)->dev)
 		return 0;
 
 	switch (level) {
@@ -315,8 +315,8 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF1]);
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
-	priv->component = asoc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
+	priv->component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, ARIZONA_CLK_SYSCLK, 0, 0);
 	if (ret < 0) {
@@ -325,7 +325,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	}
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF2]);
-	aif2_dai = asoc_rtd_to_codec(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
 	if (ret < 0) {
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 9287a1d0eef10..2bdd81bf821a5 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -23,7 +23,7 @@ static int tobermory_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -66,7 +66,7 @@ static int tobermory_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -181,8 +181,8 @@ static int tobermory_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, WM8962_SYSCLK_MCLK,
 				     32768, SND_SOC_CLOCK_IN);
-- 
2.25.1

