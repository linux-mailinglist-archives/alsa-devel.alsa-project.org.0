Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9486D8AD2
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 00:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0644D1E7;
	Thu,  6 Apr 2023 00:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0644D1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680735548;
	bh=IS4N/kY9x0EV6vbakrW1OoOGSFPd7fk10y8qIcRN5CI=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hR+kybieDUlPkOCpahpAnPDT9001d6qUGTHATltsNZTOU9sWdXwa8j9tvypBen18q
	 pPFKm57REfNhXfCCK8Qw0cscHQu7YA6BVbqBCttrYVm8FolqNco/hZyZ5u+HojFZNn
	 ZmX6hfZPu0uyUwrdY+dc8c8b/klIN5s5DudySnAk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EF93F80171;
	Thu,  6 Apr 2023 00:58:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC483F80246; Thu,  6 Apr 2023 00:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 317D6F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 00:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 317D6F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BUnlLuQp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6LeAPhvdOjFlEIEAMuvnABknw6u1+aG6wt1Uq71rXDMSFNktuH20pc6h9ku3GTwZ1q+GH/Qqw602Glx6Ce2f+5ZogQOUJWzr9qZj7xMPGNp9Z2xpWP1r2SXBt46dGa9UeRugbEbspP/H12kTNI8SA5KrrqO9CXqqagrPpi6ClTbJtP5xwuOWWUwpo7WSEP0TviAAEpaul/3KgU1BeEf0JgDoLTBAq9Y7t48XLWdPn7bBhJ2aoJr+PDzs0tehoDhmj9LdgC2mvNyDy0b+nK5bEKP3+jII3s7YFk0uyC99UdwZC38OgWmeICYoZyRsDDhzcPn6LKwaRV1v5OjF8uyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx8etX0vJu4mDvZ23yWXUoRd08Mk0UYwMH/BpH/fFvU=;
 b=Cytx2rR8it7yiKXsy2B6qgj8hN3i2LScKnysNI0+8FAoYJ2NmuJujQQW02lhe+RHLtNB52FQAf5RKGdeoI6ymX/JB+fpyjChb+TBKUtTrMQLtt/pKpC/W9I8vINmNBqB/CMusStirMd54OhE0iCjM3FdlEDipsWA9bGgAC4Kwq5oNoR+n4pduc6N4l7X8raouEgS+nsAVr99tjiDAcZah0DHYQOgPPJcfrlQM7AYeOfOoXYck+0soJjVqr+pKV71zkGrNgE3wgHrbQkyKY9eozykRooErikKfZDkibDWlTb/SjQtCYAw971F1Kg9I3+Kb6LRE0wobZKhQsGm+gzQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx8etX0vJu4mDvZ23yWXUoRd08Mk0UYwMH/BpH/fFvU=;
 b=BUnlLuQpWAl+IaJRrqUFGvIVhgTk0Yo3VkUXCRu5wG5j2bNTY3wmaNd+qGDAe9J86JNT0CkaNfHADLlxCpKe05NAyBSsI33X7APze0I1VMR2vNGOtywOZw1HJv4gPctpHmSkiYAzek9u6tgicBaLJ9+OQmZ12QxfAGtY3z7S8dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5706.jpnprd01.prod.outlook.com (2603:1096:404:805a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 22:57:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 22:57:56 +0000
Message-ID: <877cuqvswc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Apr 2023 22:57:55 +0000
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 994e327e-b72e-4ce5-999d-08db362931c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V+8toJ5utjc1ZVSiBIdJrGaQ6Kqmrw4WMEQTa26qxZFw7R4wSeaYPPJ4s/Bn6fz9abWxYFJyci6hoUKJEVg4pGyrQGzIFlQNSAuIaL8IM0EyjsRYXTi6r3LlkITWNkw7d01NOya9+OA6GjEiv+GWuuSMgEJeJqeZIxOxLr0ROBPnDUMTZKabGcnzSdJOKKd2QZZw20aayXux86GHXVrxtgrz1H0qFcKdb3/NB0Z/IE9/f2Wc9YnUhen/xUUDoKYN/fQ74XNYZI0sPTINUgv0/IqKFeDhK8POctPM0+JfTHVZyEEfQKStPK2zHv4lVSjKHwU/dDgNBqCJrbF77C4odYEQjL/hxsKNDwZe97h6UBft+J4IencO5XV8X/ka9Z9wfpoEdi/ieUczsxLBlUdQzJsyOXRcFtcz6pWu3IUsYA2PBeln8WmSukW9vvmpreoNgDXCa9mA/6gB3l+RH16fi6Yf3t5SO50HwY6Hvd7aUPq1naqv2Bbq0WXIIdNVjv4hESP5pNnpgJejGuW2Wiq07YrHlmQzBFhSwMfphM2AE5AqTQP8rudgrsRVGERhfY0ljUD6lqq01N3SpgjEpq8OJ/gaKETaxeJ0FB8bBT9I4XQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(6486002)(83380400001)(6916009)(5660300002)(8676002)(38100700002)(66476007)(66946007)(38350700002)(2906002)(66556008)(54906003)(41300700001)(19627235002)(8936002)(4326008)(2616005)(316002)(86362001)(478600001)(6512007)(6506007)(26005)(36756003)(966005)(186003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cedc/98GsibZB293Jtj8CqVYDHupbTxDul1mt/z+lDxfBJ9PqJnPX6y2AhED?=
 =?us-ascii?Q?BBFcfMeO6SGaBdL0WB5H+qTb9dWX/5iJOCu0yc+aWGGAxjp2zvbWvfs9Qoo1?=
 =?us-ascii?Q?Tcw73votdS8fJgbb4X1ddyvMQk/vtMpnzq5IXY1ZW226lv5ypc3SOeOTBMbl?=
 =?us-ascii?Q?kcfbhKWKiwC2JQCMyTh43cdlHK1TwLeE9Tyr3lUje95+/YgGuV8mM5nrC5Ek?=
 =?us-ascii?Q?O/1oI3sJsYjvUYb4NJ8Ic51M7gOxQC2Bm994FuH3hSXL21pT68/240FftwFB?=
 =?us-ascii?Q?MbT16Nrv8JpHSgnJeTj6xib+cMls8Xa/5Bmn0hbQjjbhFYSZ3C/F3kDcmeTx?=
 =?us-ascii?Q?jjMJGkIFhpbKN4pFuXRxv2lSj/3+mTBei3EeDs0BUmVhWEc0gtd007RbtPYZ?=
 =?us-ascii?Q?W1E5d/VzNbD3FOa/l34vmcstmTrgVe8HIsfmhkiGgBwlfpH5TgfmD+N0mYJP?=
 =?us-ascii?Q?TcCk4ldiiYhZ+E4EUIQGZ6c4lI+prVYIAkIQppqlwB/7o5qd+ohZeySORPrZ?=
 =?us-ascii?Q?4znMOsgQV0rPdPpoLKrDBRibm97TSHQburxfdxtGDHF3V66F5JB/N+Svvqtb?=
 =?us-ascii?Q?tV+pG1J3SwCXc2wKyvUb/QBqbK7XbUKzC8MycqNNDxr2Lmp5MsHo9UqQKJmT?=
 =?us-ascii?Q?ErcYRu4tpV6+aF+4LNzXZe5ixpsZtB/TnnSSlCTt8jHfrklb6Wggjge8tUaP?=
 =?us-ascii?Q?9M6Pk9UqgXuEvJLoQGFBg/ha+YngNHnvVdNPvdnZGYUJNxyqdLlHe7d1422L?=
 =?us-ascii?Q?LdCJ5AmDwTCpx8vioDP1aGRXyvWjh0ZtzNjnAbfKB49ClHpJgLcdY8n9uZ8h?=
 =?us-ascii?Q?dghi+5OJ1pwJ1k1z9j1+en7/rNlwHBVzrix8UlZripSLfr7aJx4GfrZOHr2o?=
 =?us-ascii?Q?2YcZC9dMgGwgzXoHDMr3YkmACjdXzQR+m4224F407djmFZJofQQBn52uf1BQ?=
 =?us-ascii?Q?9gJxo1ZO4Rydo04FgTaXUOn3rzgG6qtFOZSCbADUhvA723Txrlkar9EzPK2q?=
 =?us-ascii?Q?bllPrGNxqtdXJfnZlrT60wZ8cRJBLcIrwb+Vjk1qTWZ7pmFmqz0vPL309bB1?=
 =?us-ascii?Q?5nZyL+Nq4vBJR8MbSAe5uHpjjZxcIoovpeRi2ROBftGKVoMdisXK4AsouTZ9?=
 =?us-ascii?Q?N/Ps/SwjiOx4GiS7bP/m4C1NYGWf1oP56b2YhqEq2FNgCHkCtKqdPheETrro?=
 =?us-ascii?Q?mghoV8qS3MqLijlSSkeAmZcKW01zR4WwUKA5YYtCjxmBatOZGpHmZ70oF0Wt?=
 =?us-ascii?Q?swqUL22Dynr+0M9/wdYwythRS6mYjlih/SltndLwW4ve4Xlvb+xucZZtX3vN?=
 =?us-ascii?Q?IpWpgQkcX2LOpML0uwWCWpAF0s2irYthXz7YQZfqhYfBAVPGkVj5kszg8xLv?=
 =?us-ascii?Q?Aq731ekoXAPLsNhlKb0+hGYKOuaPsbesUCPz7xdvAB4FUqXfOXRYVnkS/Zqv?=
 =?us-ascii?Q?1x/33MI0t1uVNCv3Gm/sD8Eb/c9JGHbCgWQL4Uzg4ZbRfdQh5L+jJnT5pgIU?=
 =?us-ascii?Q?f9L+F0pjlOkpQEQiYd2z5S4I5zdWSrSOoraONKLFcmbte+rHhkt6D3lDpKWS?=
 =?us-ascii?Q?gba6Fr5ShaRW+6bSEAYhCXvtmoSnluQ/bF+CRUIZJsHo6HenKDL3FRG5PY4R?=
 =?us-ascii?Q?pthXkgibdSRRPlGW+Aa8ZnA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 994e327e-b72e-4ce5-999d-08db362931c5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 22:57:56.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mkQKXe6JLuPRZcWf7Ru2P68TN1QyPU2PhdvRXUyEEsFuxpnsc4xmJHPMkBuB+J6L4n7RSQ8g4PBr82LxMoBtoopmJ4LIZC8iQbAbKLTAj0FA1nrtBZLG3Q1a9MP9+5n5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5706
Message-ID-Hash: ZQ3M42ZUKZF7AYTLWZD3SCTRMWMJOY7I
X-Message-ID-Hash: ZQ3M42ZUKZF7AYTLWZD3SCTRMWMJOY7I
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 =?ISO-8859-1?Q?=22P=E9ter_Uj?= =?ISO-8859-1?Q?falusi=22?=
 <peter.ujfalusi@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQ3M42ZUKZF7AYTLWZD3SCTRMWMJOY7I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dapm_connect_dai_pair() handles
"Normal/Codec2Codec" x "CPU/Codec" x "Playback/Capture".

(A) is "Codec2Codec" case of "CPU"   widget x "Playback/Capture",
(B) is "Normal"      case of "CPU"   widget x "Playback/Capture",
(C) is each          case of "Codec" widget.

(X) is handling "Playback" case DAI connecting,
(Y) is handling "Capture"  case DAI connecting.

	static void dapm_connect_dai_pair(...)
	{
		...

(A)		if (dai_link->params) {
			playback_cpu	= ...
			capture_cpu	= ...
(B)		} else {
			playback_cpu	= ...
			capture_cpu	= ...
		}

 ^		/* connect BE DAI playback if widgets are valid */
 |		stream = SNDRV_PCM_STREAM_PLAYBACK;
 | (C)		codec = codec_dai->playback_widget;
 |
 |		if (playback_cpu && codec) {
(X)			if (dai_link->params && !rtd->c2c_widget[stream]) {
 |				...
 |			}
 |
 | (z)			dapm_connect_dai_routes(...);
 v		}

	capture:
 ^		/* connect BE DAI capture if widgets are valid */
 |		stream = SNDRV_PCM_STREAM_CAPTURE;
 | (C)		codec = codec_dai->capture_widget;
 |
 |		if (codec && capture_cpu) {
(Y)			if (dai_link->params && !rtd->c2c_widget[stream]) {
 |				...
 |			}
 |
 | (z)			dapm_connect_dai_routes(...);
 v		}
	}

(X) part and (Y) part are almost same.
Main purpose of these parts (and this function) is calling
dapm_connect_dai_routes() (= z) on each cases.
The difference is "parameter"
(= Normal/Codec2Codec x CPU/Codec x Playback/Capture).

This patch cleanup these, but nothing changed for meaning.

Link: https://lore.kernel.org/r/87ilen6ni4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- based on C2C update
	- use get_stream_cpu()

 sound/soc/soc-dapm.c | 93 +++++++++++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 36 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e7a0c28e0cb1..36e6f261bcf7 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4325,60 +4325,81 @@ static void dapm_connect_dai_routes(struct snd_soc_dapm_context *dapm,
 	snd_soc_dapm_add_path(dapm, src, sink, NULL, NULL);
 }
 
+static int get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream)
+{
+	/*
+	 * [Normal]
+	 *
+	 * Playback
+	 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
+	 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
+	 *
+	 * Playback
+	 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
+	 *	Codec: SNDRV_PCM_STREAM_CAPTURE
+	 */
+	if (!dai_link->c2c_params)
+		return stream;
+
+	/*
+	 * [Codec2Codec]
+	 *
+	 * Playback
+	 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
+	 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
+	 *
+	 * Capture
+	 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
+	 *	Codec: SNDRV_PCM_STREAM_CAPTURE
+	 */
+	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		return SNDRV_PCM_STREAM_PLAYBACK;
+
+	return SNDRV_PCM_STREAM_CAPTURE;
+}
+
 static void dapm_connect_dai_pair(struct snd_soc_card *card,
 				  struct snd_soc_pcm_runtime *rtd,
 				  struct snd_soc_dai *codec_dai,
 				  struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dapm_widget *dai, *codec, *playback_cpu, *capture_cpu;
-	struct snd_pcm_substream *substream;
-	struct snd_pcm_str *streams = rtd->pcm->streams;
+	struct snd_soc_dapm_widget *codec, *cpu;
+	struct snd_soc_dai *src_dai[]		= { cpu_dai,	codec_dai };
+	struct snd_soc_dai *sink_dai[]		= { codec_dai,	cpu_dai };
+	struct snd_soc_dapm_widget **src[]	= { &cpu,	&codec };
+	struct snd_soc_dapm_widget **sink[]	= { &codec,	&cpu };
+	char *widget_name[]			= { "playback",	"capture" };
 	int stream;
 
-	if (dai_link->c2c_params) {
-		playback_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
-		capture_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
-	} else {
-		playback_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
-		capture_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
-	}
+	for_each_pcm_streams(stream) {
+		int stream_cpu, stream_codec;
 
-	/* connect BE DAI playback if widgets are valid */
-	stream = SNDRV_PCM_STREAM_PLAYBACK;
-	codec = snd_soc_dai_get_widget(codec_dai, stream);
+		stream_cpu	= get_stream_cpu(dai_link, stream);
+		stream_codec	= stream;
 
-	if (playback_cpu && codec) {
-		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
-			substream = streams[stream].substream;
-			dai = snd_soc_dapm_new_dai(card, substream, "playback");
-			if (IS_ERR(dai))
-				goto capture;
-			rtd->c2c_widget[stream] = dai;
-		}
+		/* connect BE DAI playback if widgets are valid */
+		cpu	= snd_soc_dai_get_widget(cpu_dai,	stream_cpu);
+		codec	= snd_soc_dai_get_widget(codec_dai,	stream_codec);
 
-		dapm_connect_dai_routes(&card->dapm, cpu_dai, playback_cpu,
-					rtd->c2c_widget[stream],
-					codec_dai, codec);
-	}
-
-capture:
-	/* connect BE DAI capture if widgets are valid */
-	stream = SNDRV_PCM_STREAM_CAPTURE;
-	codec = snd_soc_dai_get_widget(codec_dai, stream);
+		if (!cpu || !codec)
+			continue;
 
-	if (codec && capture_cpu) {
+		/* special handling for [Codec2Codec] */
 		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
-			substream = streams[stream].substream;
-			dai = snd_soc_dapm_new_dai(card, substream, "capture");
+			struct snd_pcm_substream *substream = rtd->pcm->streams[stream].substream;
+			struct snd_soc_dapm_widget *dai = snd_soc_dapm_new_dai(card, substream,
+									       widget_name[stream]);
+
 			if (IS_ERR(dai))
-				return;
+				continue;
+
 			rtd->c2c_widget[stream] = dai;
 		}
 
-		dapm_connect_dai_routes(&card->dapm, codec_dai, codec,
+		dapm_connect_dai_routes(&card->dapm, src_dai[stream], *src[stream],
 					rtd->c2c_widget[stream],
-					cpu_dai, capture_cpu);
+					sink_dai[stream], *sink[stream]);
 	}
 }
 
-- 
2.25.1

