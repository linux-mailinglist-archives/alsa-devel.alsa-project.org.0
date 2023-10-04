Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F497B79B9
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 10:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A1A857;
	Wed,  4 Oct 2023 10:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A1A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696407001;
	bh=xYoLB+YutO9Vxcob6nrPi8LlIX11Rx9HHXQ5g9dSyQA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TTEdaopXGz38WG9fk+w140gGWhV3CF/SeeolX7S8qIvVWp4f23nGHo55S+4d+C61p
	 1OTjD9oIiYRjHlLIYiqx2sRIqhQJ/JJG/XQ/H1cfA4YcMJTuOGHyghYncaoqEaB5Vs
	 SZd/3M0qWCEGi6gUhSXg/kI82kR3tpzxjJbVGtR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88D02F8055A; Wed,  4 Oct 2023 10:08:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A06AF8055B;
	Wed,  4 Oct 2023 10:08:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D79C9F8047D; Wed,  4 Oct 2023 10:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCE26F800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 10:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE26F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KEGwcuYY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoObnVSP6KvqqyRUzk3UGx05dkdefe+jQJpzV8pyN8Js/GzkX9vSEevDqlfPWtYN5HL5yCttYp2Ln9edCECLemxHbjJ06rEszoKuNfQAF5lDu+RZ7a/5XLuUiWLInr+0qaL/wSOm2rEjJbhFNgdppzw+O0nd29XS18SOxbFXupASrxaAy91H61Na6UeuO5uVrJWRhrGl9D4og2vn5nazEPnpZ45jOihUoTHJs2j243JOtMh8wpi8bUlNWxVhwgDXe8TLqSkBDEPpHhF6g17/Uig5zNpDuhW76RMK6mTjcBbJYCZ1/JFeQ175wdjhgEWD9h4oUMdRRMd8UQ8RxyWo/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V67v6A0PVUZdKmk3jdF02XhzE70u4q7SzVSEnuhVTYs=;
 b=lv6IFqozjkSwICl8j+8rEK8wRDDCXGmNLhwD+yZ7WQFVSa4tZOnX0mKhqR5Wm971QMP/SkTm2petDAl++T74ykh8Y2/F0STWoAvxKR35wCfND9jZmvN7B0+4dCJfNbS0ov3UxFpbzSOYzbnxyBmcI/kgxSuy6UWdMfA8BYLXq5ICsYkj/mO9xzBcRU33pqHFYfifUmy3Pfic+0G5S1e5pyIVj1itVTA0A4Pl1Wk0RiKzBiAjnyU0Z5fwA5Qz1GM4CqMyagGwJtAv857FyAbxb/6JXuZSBCvtsm42PzL+YxY8YKWcRPD66denb2qQ/EGhSiMa3fQ5Eokep3NuszIMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V67v6A0PVUZdKmk3jdF02XhzE70u4q7SzVSEnuhVTYs=;
 b=KEGwcuYYjpNE+pSQBckzgwnREe5HwGgCN+Pzm9sVyZbIfMQBYEzSx2jH1SsGDGiTQs/oT+v36MCh94hfZJ1BZeYlZ4IekopSVKnHP0qLhdopSqOnQnOmqIpQwKP5pHFrP1tgg+yfI0/awpuFvHF4Cg3QI8Pwgx22XvKKAZWJJHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11572.jpnprd01.prod.outlook.com (2603:1096:400:371::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 08:07:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 08:07:42 +0000
Message-ID: <87h6n6g69d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: soc-pcm.c: fixup validation check of multi
 CPU/Codec on soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
References: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Oct 2023 08:07:42 +0000
X-ClientProxiedBy: TYCPR01CA0090.jpnprd01.prod.outlook.com
 (2603:1096:405:3::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11572:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f310842-34fe-4ff1-4833-08dbc4b0fc03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yVMnadMUMOwaJHb4xPWcVOR5jx8+z7rFdhPgigcIKPFnsNKPGWvnM/BXhekEyOcu+rQl7DHC0pG49Ks7mCjXuSQa08YWv6bAXSVrFv977m/dYWeBa7lK1b/Q/TBfGdqUwzIV44+TrmVRRv/o2O9nyyROckmsDcNkU5KLPGQrCBSPtGNMbSdGwAZufpkGmRnm3uWG7e4hBY0DuO4rQYJqau8gzD0hQrJv79p3wrZHS3mCt4JQE1Q3XHuB+JthU3eGZq3cD3QgEqnS5yTBUNScIX8TCkZaDNgpiLhnGb2MQq+TYMGEgOtgFbbY/90GAhu9M+iz4er0XDDOq+WC/VtkEBLkdN+LUbiKqNo6a/3LDMTemKUZ0D4a60goPZLCaI4NPPh0kil76wHXsPoEZlcshAWNDRVXSwArZDXEj3YMwVYZdSmwatErutnv/9xpAjPoDoQmxDoof7OhQRI4fe7riMcVZ8zuhWZnkavvb1aNm4e7PRy2oV+5Px9vYlw1SqAQrgB6sWhlRtj9sEhhIijC2Rrot3rTuxn7YArODYCEQsid07nlzt124K7YdshqCSUH9CU2eJ/Urk9KX8kNEIUfDvTGvMM52LP0dKNLpYsn+AM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(83380400001)(8936002)(8676002)(4326008)(966005)(52116002)(66946007)(66476007)(54906003)(6916009)(41300700001)(316002)(478600001)(6486002)(2616005)(6512007)(2906002)(66556008)(5660300002)(6506007)(36756003)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XojZILLRoQ6XejF7BL3uDloan3aU4XlD/wAgmTRVv5WsWL7Ikd8wzmFIqkIp?=
 =?us-ascii?Q?yQeipl92+za77IEwcqcaEZaXnKzzix4UsaBCy27Tt3ZRO2khvF4WgYaIyISU?=
 =?us-ascii?Q?po91ueMDpRii//O1y7nfqYoCp9l3UhLlxnu0Lyc+LN8tEg/dUWjopEkxFyx7?=
 =?us-ascii?Q?tXgMSPoSv+vCiBifIME3nNzi2f/WK6Ivk5WM1urXkN/RIFsFOMPWl+P1ycWu?=
 =?us-ascii?Q?JCSX+kIRbnFx39Fe6Kwwv94KxEy7LIC9uZCMG2KF81ACfcqVN8oU9po2yQJe?=
 =?us-ascii?Q?cuY42LZy2pNrRqrfnBfOVpiWPEVaX42MdiMYFMB4GGpEc5ikifbQCnUfDoaK?=
 =?us-ascii?Q?5CPjwoaBlM2i00uvHoObqELB2aXGp8pyVfnbnquXczwLvbRYfJsiIwDFaT48?=
 =?us-ascii?Q?ItJRNUm9gvu44mAuKWXmlqN3atR4gaiw/XojEUZtENRRzCQlEhCc0ft4EORl?=
 =?us-ascii?Q?i4Ntb4JKG0dobS3WksA8wxqaacIr6OHLzdmbVpdT59B9SR029U9KjBt0oBp+?=
 =?us-ascii?Q?E4oPrs+VoQ9yYiNSJ1ANTPdoNlWA8CTs2XvnEOOUyAa1WCyylFkIvl2yGVAh?=
 =?us-ascii?Q?eGC9GA7X+QOwKwO2xmXwDIGD2IV2E4u32pBKdtDvXhNHHYH2IzxxzZVbvT9r?=
 =?us-ascii?Q?gR6+X5PylG2WqO+hw+9YyqfXSergMNPnq0l0h+d5PV8XiLbUdDo0QuSGdTj2?=
 =?us-ascii?Q?rDWZVZsLY/fLQo7u241McwJXZ/sWdoDcCpyfBU27In2W7c/nNOIHehsyGdxv?=
 =?us-ascii?Q?C5ucCSmbYcQURgiSs9h1MvFcxuTC7l9z23d8tvFwcT/6E12JO44KpbbDwx9e?=
 =?us-ascii?Q?GguNAf+OdT7GKvFWbK16aUsxfrnsjAq8DagfbysvJrN9YG+0Z2nrsLVlcggb?=
 =?us-ascii?Q?yt66pv02DISuMDRGpQswWSOntP84LrBV3MkaBrybjjSRGVYmJtkgIB9+3vyE?=
 =?us-ascii?Q?O4GxRXSDzrr8FRgqbkuhHeSUDsHSlMS+nV9iituyJQzAatR0tHkXCV7X696N?=
 =?us-ascii?Q?k+mi2gMTEuAZVQE0fuZtZR4UQUo0TG3Wdz0QHC2pGU61TkTq+7CJxT63KTKX?=
 =?us-ascii?Q?nY2JbCyY4TixfJk7EYHWrazl7REHfIohmdbeTIKCM7atCV0zIRKre5hUbUXS?=
 =?us-ascii?Q?CLDIxuTISmHTnPCvIPCD6XS7smWpI+Ioc1dRHee8Z70tPSnTFq+p6itwUrg6?=
 =?us-ascii?Q?Q/65i0B+zCt44ped4TC399fCjL+9+6OMRG+1fdw7R6f9KH6mAQRwej5OIcGz?=
 =?us-ascii?Q?hG5t/HvmX3T8UszVxZ08SP+QsTyWN9YbHUomPk2+BuPGcIwqcxBnjGMWBYu3?=
 =?us-ascii?Q?dXVQ0hdLJTBO/AC5bhR+D1Fex57TX4UnymJsjTEVMMnuxrWFLjU3l5T8mlD4?=
 =?us-ascii?Q?SQU900BcQZT36aju55rgUWaInluUVGt4nmdLV8fen/dBRCBtOEON+Sb66M9b?=
 =?us-ascii?Q?gwhCeVJ9TwYEefJm6Zny/kRYYHPg1jmW3AhJSILQ67lEhdbAXYNbmsPStum7?=
 =?us-ascii?Q?kQ6faIdgSeg9xrWUI/BdVcOyV+5mzlV7GElVBkCFbMzobOkC86lH1p5pN5AJ?=
 =?us-ascii?Q?DozeixTkvAAq55BAuOm5tnzIj0/xYR15U8ABQVc3WOY7Adm+NO+juD8Q0btN?=
 =?us-ascii?Q?AUe59UScAC9m9neXcNyQrrM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f310842-34fe-4ff1-4833-08dbc4b0fc03
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 08:07:42.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sQnukYMGTh104Y9WcMToljzJqqu5aqf6eeJ3Fmc0Rhcx+RDUbpL7T2AVI+mz6p05In63hR/B0Mm/4Qd14zIIezhaiZe5dp4gg/4/VucOq+0L5MVlPjshJ3gfc/Mx6NHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11572
Message-ID-Hash: XJRYPV7LOFNI5JZQAK56AQ5GYKEN6JK6
X-Message-ID-Hash: XJRYPV7LOFNI5JZQAK56AQ5GYKEN6JK6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJRYPV7LOFNI5JZQAK56AQ5GYKEN6JK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc_get_playback_capture() are checking validation of CPU/Codec
like below

	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
(X)				...
 v		} else {
 ^			...
 |			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |				...
 |				if (snd_soc_dai_stream_valid(codec_dai, ...) &&
 |				    snd_soc_dai_stream_valid(cpu_dai,   ...))
(Y)(a)					has_playback = 1;
 |				if (snd_soc_dai_stream_valid(codec_dai, ...) &&
 |				    snd_soc_dai_stream_valid(cpu_dai,   ..))
 | (b)					has_capture = 1;
 |			}
 v		}
		...
	}

(X) is for DPCM connection, (Y) is for Normal connection.
In Normal connection (Y), it is handling CPU/Codec, and it will set
has_playback/capture = 1 at (a)(b), but it means today is "at least one
of CPU/Codec pair was valid" in multi CPU/Codec case.

This is wrong, it should be handled when "all CPU/Codec are valid".
This patch fixup it.

Link: https://lore.kernel.org/r/87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c168dc553f6..a45c0cf0fa14 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2787,9 +2787,10 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		if (dai_link->dpcm_playback) {
 			stream = SNDRV_PCM_STREAM_PLAYBACK;
 
+			has_playback = (dai_link->num_cpus > 0);
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback = 1;
+				if (!snd_soc_dai_stream_valid(cpu_dai, stream)) {
+					has_playback = 0;
 					break;
 				}
 			}
@@ -2803,9 +2804,10 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		if (dai_link->dpcm_capture) {
 			stream = SNDRV_PCM_STREAM_CAPTURE;
 
+			has_capture = (dai_link->num_cpus > 0);
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
+				if (!snd_soc_dai_stream_valid(cpu_dai, stream)) {
+					has_capture = 0;
 					break;
 				}
 			}
@@ -2824,6 +2826,8 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
+		has_playback = (dai_link->num_codecs > 0);
+		has_capture  = (dai_link->num_codecs > 0);
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			if (dai_link->num_cpus == 1) {
 				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -2848,12 +2852,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				return -EINVAL;
 			}
 
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
+			if (!(snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+			      snd_soc_dai_stream_valid(cpu_dai,   cpu_playback)))
+				has_playback = 0;
+			if (!(snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+			      snd_soc_dai_stream_valid(cpu_dai,   cpu_capture)))
+				has_capture = 0;
 		}
 	}
 
-- 
2.25.1

