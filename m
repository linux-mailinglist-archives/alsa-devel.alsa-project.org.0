Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5D7C9CF1
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 03:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 550F4E73;
	Mon, 16 Oct 2023 03:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 550F4E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697420408;
	bh=Wx4jcGMtPMzzFRvK9ibgwQXr3O3yEnRG1ZtKxyYVDKA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BnK29pD8nlmXzzPrY6gudVJH+EagUp/bZWdBrkkHhtF/MDeZnna7OQF/uaLR97MTX
	 Av5c2/ITU923QAbPine+wY4J3iZA5yAHlgstDIkac+A6Cgc7JIAblWBqdL+JE+jqgM
	 dM5m/sJJZ5EolpIdE7w822qyuPQSgv1QxsMxOx1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C0BF805AF; Mon, 16 Oct 2023 03:38:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BC5F805AF;
	Mon, 16 Oct 2023 03:38:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44DD3F805B4; Mon, 16 Oct 2023 03:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F477F80564
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 03:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F477F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NeUaJgFy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4ZRKbFnNjMs7XvA5ENUSgqN6avtVg8iEY1hFgfRjVGZmRft894BLR5qtEoq/gg9a7Z5zAGz3hN8R9tZGZNRuZ6DaljdY+IgvgMYecIP69EvXsi/OE4QNB/2BNkddVMy3QTERMJrJiEL8I63TwD5bzc+tjXvNtmG3fTZC7QZgJiuY9Kwai8JR9t1kdSZWPatX3PmSkb+t9ghB7zQ8JiOQunwwQfb42elBbNaTy2kqYNRaq82Ggs+BQhpibRpHS18fXgc121LEsc5PL2r0uhXOwRI22Ny2RS17ZJXgBnX0+qGLoWCNXPrL/m25AR3Bn3rKEsVGkyNtzkhCJvXIZU+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT512XT52jyir/q0l5HhNTVHyna6Pz+ZH9H/R2a2fIw=;
 b=AoTHq+cxd4t3ZeXXRqIe9eGCxDOrf/NvMhGoW7Hollm30f+WB6wRGKv/OlL8f1pfoAWWCIsb93PhMxaH6cX3DeD8h0TME5K8m2qOpfWz+v39SrZFfv73H1tfniTdmVQMlFDDQOh8QLTKJmQ9NGLQAKTxat3tGZRR3mA7Y9nC8zOCZT/x7UW2J8oUmIV+2x85oxTwOUq3233z5dHQ8KAvv/ks/vQlMraepbf4ol+ePdTguX+DvSnI0rhbkOH7M5zcIi4lTrJIFO4aQBKT/MfqO0kyEvyQ/sndcnemKyVkK8o/+Ith3uiPfiP5BNcJEFbTP8DZ9caRYoNjrbOgv2oy3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT512XT52jyir/q0l5HhNTVHyna6Pz+ZH9H/R2a2fIw=;
 b=NeUaJgFyTS1vfbrSww2HeAMyJuS3OaR0lc21cbl5nuqwCb630d1ZpX8ppXMdHmpwR6ow35j+7pGpFbxA+cOe7eic69MwBCjCiwooMXcgFHr3CQUp9gslADQbLdQWBxw7mRoxiGjxKH+fugU8AwKt6+00yTnZdCUVo4HpwIeXFfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5656.jpnprd01.prod.outlook.com (2603:1096:604:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 01:37:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 01:37:53 +0000
Message-ID: <87v8b7wdn3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 3/4] ASoC: audio-graph-card2-custom-sample: add CPU/Codec =
 N:M sample
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Oct 2023 01:37:53 +0000
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc49c8e-eefa-4fc0-b80b-08dbcde883df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	meHZvToCK/RJmyp3bIbeoeIivsU3jggTkicEMitfAw8GB/FQE/cyyGLQEKP6r2x05znI6CY9H33xe6AI568D+hFI/RDnvY+PUhqC8b5ICh1utMyqn8bU4ZX4Wh49WYfaRinN2l7WvbV4+eGPDPQjYAk0zebmo99PQuEOnWBo5ZYZjjHmOvUs61MGkBy1Eeskz2y84ZseUYMnDi08y8v+akKcbN59PF1YObto7KbNawdRRr3oHOUIii7P/drIuaP1lgGOvcgiOU5ORr0K2af5ZuosHDfQcC7jtZCM2FRVXM8lDiphWinMLxvA9mYAGEs3N9XUSE396/vXmx0GDVrI/vX7hf3Oo1mGUkcn7SmxPOWMb2Wvi29Lc3NTNcgoDnyxHMQR4nPvewB0dUQCC7UYIFACoAzLwGvbSkyQC3et5h1eJHGyGxZ3bpgdnh0CSUOkOLvXZU4KKPk2DQRWfzR0ukHmqWsHHdZAXxmkBGToZ9BidysWu9pW8kHEVIMYyYhnjSEQu/+1oHhE44KWolosUoYWrbfPOnWfuIDYA1XYjSYCoz0iV8Hygs1c1jcZRwwfkFsef8xG3I3fW0pF0EuoTpE6VHxsbk1mGQ6cEdBH3nx+UjIUj4jkNCAXLIXM564lqBywGR8hGy260aRsdvlFTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(110136005)(316002)(66946007)(66556008)(66476007)(26005)(83380400001)(36756003)(38350700005)(52116002)(38100700002)(6512007)(2616005)(86362001)(6486002)(478600001)(2013699003)(6506007)(41300700001)(5660300002)(7416002)(2906002)(4326008)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gdVDQ18F7ODZEuPr+l/Au6g4f3+kWYdAvK3+KBq4rou6YIeWcXChOKIpHNS2?=
 =?us-ascii?Q?OyU2dsXJL7wm20i0gF8S+N9Pw5PVm8+A0AR4KuMEVKEZf5Q1mZIL03Vv789D?=
 =?us-ascii?Q?TaJSzSryHSBFjqwJG10owY7EOubX/LMKBvhX/qEHPT69moavYu6eQUiNzh90?=
 =?us-ascii?Q?dmKvXhIg9KC6ZVcwNER8tjDXExl2DAHRSJ3lQrWDLzIJ/QunNHuwQ2evl6fq?=
 =?us-ascii?Q?Gv4rp0VE5WcJDlPH/M4h7fIfrvs7dUUIRYTUXVjhOmfJyApwJy6r5x/imnwl?=
 =?us-ascii?Q?8ywNGpYxeTAa66O6RTXVovMa4NspKZTPbnDi/5hxkBg+eQCLRxxP3Vz9xU22?=
 =?us-ascii?Q?wPOUnfQEIxX8BTROY9qnTui1VuDQ/y9vU62hSyZAn5OhceLoyRyQ5H2RykGI?=
 =?us-ascii?Q?6V8PPaPx4pV3fLvK2yEzorqlAtiUzBQxcUcRvbEzcINSiYPJc76B4DwFbh8C?=
 =?us-ascii?Q?KjLV9sliNN7nh5gwxIde29WG05cl4gYhCAR/RAyOaKtSQPLkRrt6+yBbdtzo?=
 =?us-ascii?Q?eH7DBSDqB1vnzv3DIcZ7P/wFaw3loA5YBYeoagP1ses8RuBsPbanY9owm256?=
 =?us-ascii?Q?AGdTQc54QqQDKS654EfC4Vry24KrRWwJF2SkwC0eL85gKIFBX9zX/wgouz20?=
 =?us-ascii?Q?TRkpbQV1bxcWC6Cb6leOx4sK9EnCxhwuVB/a7LaKb6quDnnQ9Nr51pmXEe7U?=
 =?us-ascii?Q?NDGYassQmYsPc24hMK7qllbVBAF64Xvy+EXGKtJw8L1kMQVCOr960tq4aaXQ?=
 =?us-ascii?Q?8e2l0wBA5QJ7qras0sfBxjrz7Snbd27XZCa9U8LVG8y4bCuvoGH6QIcXuzqA?=
 =?us-ascii?Q?jGmwsAYZO7kykI23O9ZMH8d23wnAMZngeZ0XWv1H7LWJnOCgRCJSFPmX6uix?=
 =?us-ascii?Q?S54OcrlhB+upr6nUJ92LeWug4igrrUIGARuAbr2xntWGZT0f9KnDTtoUFOQe?=
 =?us-ascii?Q?UDv5qaIpVu4oX4LQ3YLgwAJ6VfAJEwTVzQkvtZWSz/tNnwF9AoYxga3m8TGN?=
 =?us-ascii?Q?cY9AiPXMZpuEtIO4P6lhg7BqwM1RwWxcp/+Dlp4hHTPBbhtC0Zle31GbspFN?=
 =?us-ascii?Q?7QiPg5ptcIbl8+ytZN2nmZZB7mLPsHuoNzB4eCCTAAZ0gM+TZ6YnvOlzYfJY?=
 =?us-ascii?Q?rbfnDpYggQaPQmpwsiGbv77unNDW7rbSnWTtx5TBMn5Zs35itOovKGprgwY2?=
 =?us-ascii?Q?bPKzAmb4hzrcvVj/LzBnSv+0nqdrQHNdv6EUJkXLSgWgAvMT/ptjoxxAEruH?=
 =?us-ascii?Q?99Gs6sshCC5bXp8ZfQ23SCWgGpBqlzQwvKcTTUNWe4EyMMq2aGiOOICfpvpH?=
 =?us-ascii?Q?i5QiMyh8656Bj61+0opyeIiI+5czNrWljQzxKzooRapZGDzdKcZss2zl/et6?=
 =?us-ascii?Q?9m6iPwK4fTJlEyTPOLbxpMMeWocNxfgQIpPotFeztEV/TVjk4V1Idmz7xMEx?=
 =?us-ascii?Q?Ny7Pz/Xa00usaL8TrpSI+hpgePhI19Y0ohlE2ksuagFVUTSBVvvgoWwaFhDu?=
 =?us-ascii?Q?82tZNr7YIX6SlTKNvy9zbb4WqNAtbveJF5iY1g/JP5wKUBM8PuOzWO4lHtmi?=
 =?us-ascii?Q?2FmRT61/CjY/+3ekNPOEKXKAz5e71cT4JKBLAmN7Mz2ZU3eJifnuyJ1K3hUF?=
 =?us-ascii?Q?y3FeKBGdH9E+58HxaxQkO7M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bdc49c8e-eefa-4fc0-b80b-08dbcde883df
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 01:37:53.3305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p60n+iAe/X8wf9mNAJGJv0Xq4s8ysfi3ZLFfM0BkHdqtnE0w+GDRiJsSObF+ifJJNo2NBM8iNzLY0wD1rbOCEqjv9cB1li4G3hI5wuRqif361e7GkwNVEX9kP9NAmsMj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5656
Message-ID-Hash: 7WSHZOYMFKHA4DZUZBIQ3STSLYHA2VIG
X-Message-ID-Hash: 7WSHZOYMFKHA4DZUZBIQ3STSLYHA2VIG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WSHZOYMFKHA4DZUZBIQ3STSLYHA2VIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU/Codec = N:M connection.
This patch adds its sample settings.

But One note here is that it has many type of samples, it reached to
maximum of sound minor number. Therefore, new sample is disabled so far.
If you want to try it, you need to disable some other one instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
 1 file changed, 121 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 8acaa2ddb335..14d638de120a 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -58,12 +58,32 @@ / {
 	 *			| |-> codec13
 	 *			+-+
 	 *
-	 * [Multi-CPU/Codec]
+	 * [Multi-CPU/Codec-0]
 	 *		+-+		+-+
 	 *	cpu1 <--| |<-@--------->| |-> codec1
 	 *	cpu2 <--| |		| |-> codec2
 	 *		+-+		+-+
 	 *
+	 * [Multi-CPU/Codec-1]
+	 * About ch-map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu8 <--| |<-@--------->| |-> codec14		[0]codec14 <---> [0]cpu8
+	 *	cpu9 <--| |		| |-> codec15		[1]codec15 <-+-> [1]cpu9
+	 *		+-+		| |-> codec16		[2]codec16 <-/
+	 *				+-+			(*) ch-map = [0, 1, 1]
+	 *
+	 * [Multi-CPU/Codec-2]
+	 * About ch-map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu10 <-| |<-@--------->| |-> codec17		[1]cpu11 <---> [0]codec17
+	 *	cpu11 <-| |		| |-> codec18		[0]cpu10 <-+-> [1]codec18
+	 *	cpu12 <-| |		+-+			[2]cpu12 <-/
+	 *		+-+					(*) ch-map = [1, 0, 1]
+	 *
 	 * [DPCM]
 	 *
 	 *	CPU3/CPU4 are converting rate to 44100
@@ -144,15 +164,38 @@ audio-graph-card2-custom-sample {
 			 */
 			 &cpu0
 
-			/* [Semi-Multi] */
+			/*
+			 * [Semi-Multi]
+			 * cpu7/codec12/codec13
+			 */
 			&sm0
 
 			/*
-			 * [Multi-CPU/Codec]: cpu side only
+			 * [Multi-CPU/Codec-0]: cpu side only
 			 * cpu1/cpu2/codec1/codec2
 			 */
 			 &mcpu0
 
+			/*
+			 * [Multi-CPU/Codec-1]: cpu side only
+			 * cpu8/cpu9/codec14/codec15/codec16
+			 *
+			 * Because it will reach to the maximum of sound minor number,
+			 * disable it so far.
+			 * If you want to try it, please disable some other one instead.
+			 */
+			//&mcpu1
+
+			/*
+			 * [Multi-CPU/Codec-2]: cpu side only
+			 * cpu10/cpu11/cpu12/codec17/codec18
+			 *
+			 * Because it will reach to the maximum of sound minor number,
+			 * disable it so far.
+			 * If you want to try it, please disable some other one instead.
+			 */
+			//&mcpu2
+
 			/*
 			 * [DPCM]: both FE / BE
 			 * cpu3/cpu4/codec3
@@ -182,24 +225,24 @@ multi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			/* [Multi-CPU-0] */
 			ports@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [Multi-CPU] */
-			mcpu0:	port@0 { reg = <0>; mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-				port@1 { reg = <1>; mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
-				port@2 { reg = <2>; mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
+			mcpu0:	port@0 { reg = <0>; mcpu00_ep: endpoint { remote-endpoint = <&mcodec00_ep>; }; };
+				port@1 { reg = <1>; mcpu01_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
+				port@2 { reg = <2>; mcpu02_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
 			};
 
-			/* [Multi-Codec] */
+			/* [Multi-Codec-0] */
 			ports@1 {
 				reg = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
-				port@1 { reg = <1>; mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-				port@2 { reg = <2>; mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+				port@0 { reg = <0>; mcodec00_ep: endpoint { remote-endpoint = <&mcpu00_ep>;  }; };
+				port@1 { reg = <1>; mcodec01_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
+				port@2 { reg = <2>; mcodec02_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
 			};
 
 			/* [DPCM-Multi]::BE */
@@ -241,6 +284,50 @@ ports@5 {
 				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; }; };
 				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; }; };
 			};
+
+			/* [Multi-CPU-1] */
+			ports@6 {
+				reg = <6>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu1:	port@0 { reg = <0>; mcpu10_ep: endpoint { remote-endpoint = <&mcodec10_ep>; }; };
+				port@1 { reg = <1>; mcpu11_ep: endpoint { remote-endpoint = <&cpu8_ep>;    }; };
+				port@2 { reg = <2>; mcpu12_ep: endpoint { remote-endpoint = <&cpu9_ep>;    }; };
+			};
+
+			/* [Multi-Codec-1] */
+			ports@7 {
+				reg = <7>;
+				ch-maps = <0 1 1>; /* see [Multi-CPU/Codec-1] */
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec10_ep: endpoint { remote-endpoint = <&mcpu10_ep>;  }; };
+				port@1 { reg = <1>; mcodec11_ep: endpoint { remote-endpoint = <&codec14_ep>; }; };
+				port@2 { reg = <2>; mcodec12_ep: endpoint { remote-endpoint = <&codec15_ep>; }; };
+				port@3 { reg = <3>; mcodec13_ep: endpoint { remote-endpoint = <&codec16_ep>; }; };
+			};
+
+			/* [Multi-CPU-2] */
+			ports@8 {
+				reg = <8>;
+				ch-maps = <1 0 1>; /* see [Multi-CPU/Codec-2] */
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu2:	port@0 { reg = <0>; mcpu20_ep: endpoint { remote-endpoint = <&mcodec20_ep>; }; };
+				port@1 { reg = <1>; mcpu21_ep: endpoint { remote-endpoint = <&cpu10_ep>;    }; };
+				port@2 { reg = <2>; mcpu22_ep: endpoint { remote-endpoint = <&cpu11_ep>;    }; };
+				port@3 { reg = <3>; mcpu23_ep: endpoint { remote-endpoint = <&cpu12_ep>;    }; };
+			};
+
+			/* [Multi-Codec-2] */
+			ports@9 {
+				reg = <9>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec20_ep: endpoint { remote-endpoint = <&mcpu20_ep>;  }; };
+				port@1 { reg = <1>; mcodec21_ep: endpoint { remote-endpoint = <&codec17_ep>; }; };
+				port@2 { reg = <2>; mcodec22_ep: endpoint { remote-endpoint = <&codec18_ep>; }; };
+			};
 		};
 
 		dpcm {
@@ -323,9 +410,9 @@ ports {
 			/* [Normal] */
 			cpu0: port@0 { reg = <0>; cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
 
-			/* [Multi-CPU] */
-			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu1_ep>; }; };
-			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
+			/* [Multi-CPU-0] */
+			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu01_ep>; }; };
+			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu02_ep>; }; };
 
 			/* [DPCM]::FE */
 			      port@3 { reg = <3>; cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
@@ -337,6 +424,15 @@ ports {
 
 			/* [Semi-Multi] */
 			sm0:  port@7 { reg = <7>; cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
+
+			/* [Multi-CPU-1] */
+			      port@8 { reg = <8>; cpu8_ep: endpoint { remote-endpoint = <&mcpu11_ep>; }; };
+			      port@9 { reg = <9>; cpu9_ep: endpoint { remote-endpoint = <&mcpu12_ep>; }; };
+
+			/* [Multi-CPU-2] */
+			      port@a { reg = <10>; cpu10_ep: endpoint { remote-endpoint = <&mcpu21_ep>; }; };
+			      port@b { reg = <11>; cpu11_ep: endpoint { remote-endpoint = <&mcpu22_ep>; }; };
+			      port@c { reg = <12>; cpu12_ep: endpoint { remote-endpoint = <&mcpu23_ep>; }; };
 		};
 	};
 
@@ -363,9 +459,9 @@ ports {
 			/* [Normal] */
 			port@0  { reg = <0>; codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
 
-			/* [Multi-Codec] */
-			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec1_ep>; }; };
-			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
+			/* [Multi-Codec-0] */
+			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec01_ep>; }; };
+			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec02_ep>; }; };
 
 			/* [DPCM]::BE */
 			port@3  {
@@ -395,6 +491,14 @@ port@3  {
 			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
 			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
 
+			/* [Multi-Codec-1] */
+			port@e  { reg = <14>; codec14_ep:  endpoint { remote-endpoint = <&mcodec11_ep>; }; };
+			port@f  { reg = <15>; codec15_ep:  endpoint { remote-endpoint = <&mcodec12_ep>; }; };
+			port@10 { reg = <16>; codec16_ep:  endpoint { remote-endpoint = <&mcodec13_ep>; }; };
+
+			/* [Multi-Codec-2] */
+			port@11 { reg = <17>; codec17_ep:  endpoint { remote-endpoint = <&mcodec21_ep>; }; };
+			port@12 { reg = <18>; codec18_ep:  endpoint { remote-endpoint = <&mcodec22_ep>; }; };
 		};
 	};
 };
-- 
2.25.1

