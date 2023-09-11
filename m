Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DC79B2A0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 425A2ED4;
	Tue, 12 Sep 2023 01:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 425A2ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476739;
	bh=tnpT/IZH/Ok7pZ9BvfleC1kJCFvrpBQ/ZA2eNDKiE2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZrThdSYS7hzRdG2VUfP1KeaoqAuZ7Zxd8So+UZHAHwZy0SKpIZRoQMfVjl7D0UPs1
	 1n3/PSYda0WSIreThO7UeDgj0vLBy99Ob2DegyWZEmTt6iG2aXskLGobbDfiGSP0fP
	 QqkWOLZWP59xl8oS9mOPhK+N+JDqdqnQ4Oc7lH58=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DEDFF80632; Tue, 12 Sep 2023 01:52:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C858EF805E9;
	Tue, 12 Sep 2023 01:52:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73776F805CB; Tue, 12 Sep 2023 01:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72EBDF805E9
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72EBDF805E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=E+MC3R2R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1C4IE1vpY1yOOO4y7WoEsuuPmAsFRVngsTB9OX5RjjSOkvluyL4UmSmCfdlTfv7EwjlUNTMHJMaBi/J700+TAB44mzyEKpKOL05Td3rvU3Ia3KflSMkY/HTEypli6MPMSEHTzndKKUvnX5PcOsAeVmaoZkGXZuUWpyqDYZlurmfAs+mHvAXDyzPDcDyMjFHj/w7FMt108YH8pTvv3Di0mfYcxcZbGXIsS7hd8ibybtiBs4KxSYiAW04aYymL79RX+gtolZj82cKI7WFiSwlMBKzKgyVVfeKSzbdVr4Ok826lcGsIH3J1mnsn4hNJi3PFj6snB9hnsl+bZ6H4S9d1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2796x5QOoBlMgwA+IuQCvVThTJT+wuDUntIloEwzVq8=;
 b=Ta/LmgQHiN06xGRjXJLaa6Jss+MGUyJkk0JBwvFNKj6jAxeijGOqgfkf7U2yC5BCjaPloKLrz9x71MlMdce6bqPMPzsekUcqIjXb9Os2PsBnGXQlAe2dXcly1vws1HR+FMt11N0Wy/y9hxJDWaEc0zMeEnBnnMpZcOzenDu6JXp8E1ZHPDnnZqhXAljaEUbco/aaH94dICLhALU/VLVTvQSz69RECWdBluyifGcZEu8uHg0n9b5UGaVZ7aSlJErOX6zHX4cHVnDpf+H59JGhPFWYEg07ZEeYrv9oRJgpDly0ezaTC3uscyJ6v0L4jqAmB8dtPH6nOzXIMgbg0UOkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2796x5QOoBlMgwA+IuQCvVThTJT+wuDUntIloEwzVq8=;
 b=E+MC3R2RojrewheWu3P+tnLDV/L8tMGupIwP5pSMErs3yII2Yy4d69DfQd1pxBFrda9rY9z1GbPD1Wdd296e8+axg1qb/6rzYBSCRAZBifP/ay19C8FTod+xZ2lCGorVUUzblA2KR3oAQkqCTqGx/v0NFonR1htH7tCB8fpfJLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:52 +0000
Message-ID: <87y1hcp8v8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jason Montleon <jmontleo@redhat.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 38/54] ASoC: codec: rt5677: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:52 +0000
X-ClientProxiedBy: TY2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:404:42::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0fcc7c-dc78-413f-11f4-08dbb321eeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	drEVcUYq8bHKoxX9HHe3B3MO+8r5FCDR7NYiqmsAHlcWP8AnAASmCKpNIbaiaa+d8+J7Xd7rTZvXyRBd+kvfRQu0Kzh1bUDfRGdIneh47tlYQFV7CJcuUoCd5kXSKJI+2d1XGycI4Cbp4UtWTby/FFONh3ZlOgy0i4Wyfy8O7zBUSG520Xijuv/6xbrFoZNeTnhgiE5y5nuD5XxuA8syj8Np4UnI1t4pXpPYEZLXtRfdF8L//W1u+2AYy36zjgQfRaqCM9CYFKoa5icBirJQQOwSop3ji+1k8wEqW+IHAQxSRvcDhnNkmHs6qkbjaaP6odZKqaXGPU94e13rBWXhkbKVhNsNPObt/bV589Cax8NFD5LqpfL/RLyk5saIY3i65AzkkoElQ5GUkmYPR/LtRkclacCTQyunpT57V+KARI3Cm4ldruuOWAu5KFaiNYI75+buDk/SFkwq/kw3/Q3m1iqgMIpugyX/fqzggCPhXYD6JE08eozUm+XlG6KOi7jbGxk0iI3Nhmx9iK9X/wVbtqoPfEdYbrujQ8EZ4IZ5ggFhRAbZ1eZsQIckts6Wyag1/y0FPOc4a7eC3H9sxisdFGUVEtiKhe3zKDxeMpGPsC7DIbmcrbGtnFvYvQ7GHWxcvxZEYM20vCE1iKaK1DbgcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/sMW/bj4twGd/UguL1+45JXJH+P5U8Q4VajZMV07vay90DxkYD8OzFfavpqR?=
 =?us-ascii?Q?O1piCP7JasCZsAjbGEm0aWpmgeRsQxSPAkZ3dIzleuEDftfPE0XKB32ijysT?=
 =?us-ascii?Q?Bffv3nvpW4VUHZHDf5QNVINrJC4VQY8WRsn505GZK5pnsZJY50GLdayswCyH?=
 =?us-ascii?Q?MZEuxeqbXxsev6xkW4Yz8UuR8OiRNK05QhjqdJ+y+GrYa/TKDkynyr5M2TUZ?=
 =?us-ascii?Q?6eJmIpCGlif5WthuyY1dCA+9gruPE8LB/Xqgi87ZXJSqwcG/k0l15KOqusJN?=
 =?us-ascii?Q?5kuKrQ63+g92xA7y91x0RgdlF5vI7nM71sw48bNZKGvtWxmfLkUistOfULQu?=
 =?us-ascii?Q?05lZJxLPipU6oWqWW5AsTN/mxeaNkLgYTtFKe+96rT68SCSm1RkIKwv6oocJ?=
 =?us-ascii?Q?JFRUbrvfgSXP+TnAc1FDv1EdtRFjbqrE4bzQ0bIxKCrdsda8xdjQ7/UZnHgb?=
 =?us-ascii?Q?BGNeVemCgywEJNYRpiNVstUlLmeB6aHnkzOIRhPoF6clSbBKuC2fSrwk//4B?=
 =?us-ascii?Q?9Ch+rxQXpSD/T8dldy1WHMVAWnMJ9lH7myjcCiIU9/0q34rjIRFLHy/AdhiA?=
 =?us-ascii?Q?LoP3nIbRac8Wr5anlR35IiASvLav/87vX8vCtLW0/E7sXCg+zsIUOI4L/Atm?=
 =?us-ascii?Q?6kmEQu+47KC85aPpZE3OBDwBjOXKDWSDGWHpiFsNcTMcypmmp15Rgugq+l5i?=
 =?us-ascii?Q?n0k+UK7zjOLoZ0ua6TLSkA56tLgu/ZXGmWDM/Vd4ZwC5ZaLlLi05NkALO146?=
 =?us-ascii?Q?WjLf1kSueu/OBeup+aHWYbFYMzV5XX4I6CZ3OcEChNIu5miDHmSXKUP8ZEVI?=
 =?us-ascii?Q?sTkmqUaxYHhFWN8x3/PjxQHUcHMB4XVXLjLXzbInGZeQCqF/FXQErdstbrh+?=
 =?us-ascii?Q?Um5UX/k4G3hA4sjH1fURTO3ryVycO8PtRuB0hNR3JVY3Bo8hnMmU2VvrRvEj?=
 =?us-ascii?Q?4mJTfRzKYDI6/nYH8qaZf2SvTuFwpwSVMAw+i7JDpxBypha11tgWiSgqP3ez?=
 =?us-ascii?Q?phaG2XPgUvbRgwCxhgUKTrj2WfhH79ck3W2MUJ4ohd6mljVYQLIOVHmrV1mC?=
 =?us-ascii?Q?34JvnguYPrgK83u6HVlGxeLAN4/jo8bbpa0FHSWxhWllARlqW0oZVwnURIC8?=
 =?us-ascii?Q?BmGZ+XeATXp9SqisqTaoCDvwJ6vG59Jwr7foqGJDHSE+9t3I38Q4MEzxFQOu?=
 =?us-ascii?Q?OrYc+XXZXIY5Zln6Ce1fAvhXEudjhHHE6hTuLwmCpGpFq/FeTfmK3T7h+n2a?=
 =?us-ascii?Q?2O3RWOQjmnCIFM/puQmhaV3l7kE3N1s7d1km9jfCA12xZExhEQJrUvckRsoZ?=
 =?us-ascii?Q?TKlKfZOQFT+Boj+GFsUbNOWqeVsXZdAzXEErKBO4WiHkHXsqSId7jOiSNN3j?=
 =?us-ascii?Q?LizrwLzvHvN4M7sZ+HgnLx0ygkLM2mbWjo87uq5Mdemv/jSeaD8vE8uC3hqo?=
 =?us-ascii?Q?32mbF5yA/lSUa/6q5bHCB2jeMERLtFs20Kv6Ddos7lrK5ubC2WfPcQM8kp9C?=
 =?us-ascii?Q?oSKXaCGYCQGBQrsOvzS/m/oCcfkCIYFCS09Odsc9ILEalYGZ9XL5qmYJw3CJ?=
 =?us-ascii?Q?C/GJ+54kH/U0zyGXG5TItxTgGHnp2OqxFFT0QcDusKYmQvZIqZwE77Bb5m6l?=
 =?us-ascii?Q?7LqhtTnD0BONAc/SX+qle7o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e0fcc7c-dc78-413f-11f4-08dbb321eeb7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:52.4267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S53lYMJbYKGhnfsADycsMMJpga3+KtnpC0oj0+EQ1Ttqf3YfkMZpAgqBuIskUfhnfweII/e73frz2wPiES9KdyYxKCz4OEKNDE8uuI2Sab21OUwMHWiGMrZR+kBcpPvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: AF4TSADWRTS64J3WSJ3U7KZ74W2UNVBF
X-Message-ID-Hash: AF4TSADWRTS64J3WSJ3U7KZ74W2UNVBF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AF4TSADWRTS64J3WSJ3U7KZ74W2UNVBF/>
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
 sound/soc/codecs/rt5677-spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index d25703dd74996..d91a2184f67c0 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -112,7 +112,7 @@ static int rt5677_spi_pcm_close(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *codec_component =
 			snd_soc_rtdcom_lookup(rtd, "rt5677");
 	struct rt5677_priv *rt5677 =
@@ -158,7 +158,7 @@ static int rt5677_spi_prepare(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *rt5677_component =
 			snd_soc_rtdcom_lookup(rtd, "rt5677");
 	struct rt5677_priv *rt5677 =
-- 
2.25.1

