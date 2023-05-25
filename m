Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A37104EB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:57:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E44E1E4;
	Thu, 25 May 2023 06:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E44E1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990637;
	bh=dxY2dGUnmwwf35tGSflezXl+4oQNt/yyf+9p4biIDpg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qrs46qfuvvDv2Doui2aHtzULHh9UKCD/jd60aJtwMQMjsP6lt9DiU4ziDrEjdexN3
	 yw2xrL33KORR7Tw8Ckmgtlow+DWJHUuyplbmuSu17KC7ZMAYEDRyEIdmY9IU1PJkty
	 EWGQmM6FmAYFKEkji4xXUDSD1ufthRt0Egu7lNpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1E5CF8058C; Thu, 25 May 2023 03:17:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE1AF8058C;
	Thu, 25 May 2023 03:17:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3360F8059F; Thu, 25 May 2023 03:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B7ADF8055C
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B7ADF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aierEe8M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaxS6IlukxIHJfwEhAjKlYsysUHcvgIB6LOeXA7Jump89hsfLfdnEb4+j6XYQRuNxOU7Gx35DEt68BqNWMdJDEApGnUOslBq/zJ1JvJIqY+pEQ7tZe2lALmjGkQ8eb59Dm1vkOqWG2LtSiyWexO61uv7ECwu0xfDyKWG56V9snjXm1h1mBcb2752KG2GushLy/Nq9JjOn7/HoUOD89uRgV2JNqmAUgtUaB4QOXsrE7NGJanCIJjDItZfpxT2FW+ZBdTHAPSv+DpLj3mOcxiAKW8avJf3Eqj3thyHce8ra5pTghG5buDPSrl1GhgqeF2puJ7Rs8+N6ZrUWMA2BpupHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tD1hCO8jjMxdI9qnVytok+vS/72UiLw1V86/q11hjHk=;
 b=lPnGuP/MXgcbbArPkF6EnpXD5yfmT4KXm89DQo/qM+/lorDxfdzWnONZjqy0aYWmZL1FY7yMBMiP6cyLBGw0HnyF4yBWVSfNJEkmh1oG8zBVr9kMw/Hqh7WqB/6HPkfb6sI/0wBswtlyuwu3I8gkIFewqfgrVLcXYLtWjpO6b9K+RhrF+U2lcc1Hy7wg0akhljDwRkxAL/u/W+ao2F2oLdAeaEyja6mFtxJPvSpucBP0j7UT3U3eB04w/s2zoKEG6RBCIrGjIfolmrengHn5UuAxohlYBpIwOCsCd2oWnRe+/oj6dcaSggUWfS4IjIVRh8+rpSAtwqrYvI6dnTeO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD1hCO8jjMxdI9qnVytok+vS/72UiLw1V86/q11hjHk=;
 b=aierEe8MbvonYhQeLn6Ig1Csy00nRBb7C/PPQ77zrKBrz5XWwBYhk8rC2q7GldcwZg9I8J/3T6kamrUsHGrcanH1FQquiqy9n4EqkQP5NWq5Hd89kPFzkxh7+efmKvf0I+O3qRaX4yurP6ldfjB2rLItNFAiCN5ZLcoiiZp+Fo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:16:57 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:16:57 +0000
Message-ID: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22N=C3=ADcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, "chunxu.li" <chunxu.li@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
 Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>, Wang Yufen
 <wangyufen@huawei.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:16:56 +0000
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 891f18dd-4ef2-49fc-2af0-08db5cbdbba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c7jZ+mAFSJbovymIIgu8XjFKNlPUU+TOTvLKiR9x0UHCz3z0AkMGd0aqjIQle+Nt7f6gjud8cgPDI5aF978PC28NZtfqoUV+994g5KfyUyCay8ldkBQA+nvOh3nqlnX2gWZSRiHAttgxdP3JIbJdwR2/l/f7M6dTcQGZyovAA7J9TmcwbkMNNx3qGd/2yRHdF3bjWuAc6svSUfxN05lh7E8oc5wp1t9pUUxn5e+NJfE74bT5sDzjyAKlJqipVp72nXBPzIjOvzxg4++W58D/jpq6ivaDFPW2UCOHrFKIGAqyNkJRQB4NvV3m6RJU7M3SnG30m6j/W5bAUfjfH2eRq04DNJbsIOD5pml4TrywGMAPTB1pSvLZj4Vv/qwlSs++qs3QFIsHpwC/hInX6xyQXy1jaK4mQ4EWZRPxjcs68Z7GHFDA+VN8q0LogId4A7WmwT0Il0MuzowzR/9V6e5es8xA2sZxmUUw3ixQS1rWhmi1Jw47wAP4e+NiaqBdlGRMD5bFGJjlvS+DUKdzJM3VYG1WGwPaEo5fZpGJuqACCs2sNpYICYi83h+PtJ3JScF7Tz2Eh1Jb3hvqfNQ8vb+dDrlUBWuNX50PhE+Nxu7k0TQTBVVOl4yGwTGUBg7kZh1WEQV2O2UVpi0+CjonzT691eU3IjmBV/jE7wkWGPwpF7A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(966005)(54906003)(6486002)(110136005)(2616005)(6512007)(19627235002)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(7416002)(5660300002)(36756003)(7406005)(38350700002)(921005)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dipk3hf7hNQU5SYEaT25wjZy9bgbghcUeHcoNQl0zJpSEHUZIvWNr1jT00VL?=
 =?us-ascii?Q?vVYhzXrz+zY9jtvTtRub/JRKMMHV+16csCd7FTTAxe/j+GfJt1qGmC4YK6Or?=
 =?us-ascii?Q?OgS1mq5O/n7cijVtSadxsRPELtRk+6NKv6OFQ2oTU3TQfgSBq3aT/wGR7RGf?=
 =?us-ascii?Q?7WLYBBb91ysmjBzGKUcLZkfL/Ov9/MO5gK280v+cDUtkk1xjZ0wLGq2jANxf?=
 =?us-ascii?Q?Pxo3zt3e4aKNoBPLVAPUi+uDjk1Lg1nOA4mlAHG1es6A0P3BnOjDcxWOa4MD?=
 =?us-ascii?Q?iw6yMN/Nhuqda2oDWRj+6tTRUxLeUY7B9i+rY8MtyXX/Li8nXGYZCJUtc8sp?=
 =?us-ascii?Q?62kkaoHfg4bRTEfTifWB2P5swiSGKSfs10f/anQy/HK32/fg6B+Cq6Wnhowb?=
 =?us-ascii?Q?YrKV4zUaKmg2J71QMyd0TPDomrnwHx3JrNumOFiDOKLPppb7z0DKTbLFNidZ?=
 =?us-ascii?Q?MxCaL/BpZ1hGEaE4Gkgd4uNjOvXbZKT0KLT9wRSE9jgTy5EdWKpYzdTqP2kQ?=
 =?us-ascii?Q?xs8hfUmy75vtSUGYHz/OQxUlIbpyfh0H1mFN+2T7bJyNJTI5Mc5Ktlgmpu1y?=
 =?us-ascii?Q?pEBgximbJwuWWbvFl35mXQLT2TWqpSV0HMJpMdorXzgFG94zCHl73fV2j9nq?=
 =?us-ascii?Q?AGl0tWR1fQhX+VYhS837JySf/BMzTW9h/ArRCCyni6ySkKVGTgggw50KV9ic?=
 =?us-ascii?Q?XYTPE08oc9FEIgCyZVVocgELozM63R676AJI7c0VVsC/Lv39Y5gxg8rVmANY?=
 =?us-ascii?Q?61XPHT9dOJafZL+k5FyMegXN1s4rSZM1W/sk7s2G44XIJ/gM4gZ/wmG/SdEv?=
 =?us-ascii?Q?SpECX+wXDC65GCu9ZlTKHyCmZdufKjTUyYc+c1m+exqUgYlU8TENU3+ezeep?=
 =?us-ascii?Q?70EG2s3aMnaTmLbXiZsLfFhfrrGYlx872Jx1CEoNDtxcmK5LPcEi+eUySPOt?=
 =?us-ascii?Q?VRUWGW2F47yFp2SFjyvo9eeq4UFnZgnpTc6BJOause9jZQM//X3IhPZAGWhr?=
 =?us-ascii?Q?vE2T92hHgSZCoyNLe+n95OEEDUdie/hcsyU8WNJH274YRkceMeCEgifG0Ypf?=
 =?us-ascii?Q?Snfpw/e0/lHsEptwtt8Wppo18o1I1M3hlkwTUnklEE71FRO1bMqTSaOLEd22?=
 =?us-ascii?Q?jYfJstj5AbTuWOduPPhWFKwPbVmHUHxDt2oPvsFikA3VfCtltHQhbjf2BcYo?=
 =?us-ascii?Q?xrg5/gmSZkrP+icVjQEwjfgetGr0MQEuUkWtnmo0W3XPT55sQX/z2627oodb?=
 =?us-ascii?Q?Ujw/S2O5/hf7Wzq2VcGFnsKsGDyo4TX75u2YCfdej2mR8jxb00e1nFJfqmUl?=
 =?us-ascii?Q?vucTt3fB594pzBnslG1dpWK5Z+lCeMluUmNjJXrp2TrG/J3WP1vNBJ5K3Eqj?=
 =?us-ascii?Q?IYvqTWLqIg0MV3BtF8mqMg6hxphj8QbiDNn/X2T1MTVLwi3rQA3FDsrLkM3u?=
 =?us-ascii?Q?XY3tdOYP0twFU43fgZKBvgo9C1YWLAm5eMwSUiCzk6BVR+gke97Yoapdj25N?=
 =?us-ascii?Q?Pa3vxwKAIxyhi5ocDkQKJqjjBcsJNcHf8FC1LO/o0iS5UQgHsW47uElJlHtG?=
 =?us-ascii?Q?OqIgV0+UsJIQTef1omzT/aiAfjrkv297FO9u2KKk3Yr8mfvmPq2RVBdb+X3H?=
 =?us-ascii?Q?ZqSLhKPZJHsrlJFWXu41sCA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 891f18dd-4ef2-49fc-2af0-08db5cbdbba6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:16:57.1266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 w4d7wn+6zG3HXraBdg5BoNsVC/JutTwHzaNjysL+RvkWm63Rf4Qqo9WuVevfXe1ZRc/2kIrFIJ7X/kdoLYKz+PTS0R20/9WRtuCZdq9imfIWiujnjCmQE7BiEHI3gUrl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: NKAJ6J4BXDGHJKCMH2LQ76IHHU3JSFS6
X-Message-ID-Hash: NKAJ6J4BXDGHJKCMH2LQ76IHHU3JSFS6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKAJ6J4BXDGHJKCMH2LQ76IHHU3JSFS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is v2 patch-set of dpcm_playback/capture flag cleanup.

Current ASoC DPCM need dpcm_playback/capture flags to use it.
But we are using playback/capture_only flag on Normal/Codec2Codec case.
I think these are duplicated, we can share same flags for all cases.

On v1 patch-set, we noticed that some DPCM BE Codec valid check
breaks compatibility.

	static int soc_get_playback_capture(...)
	{
		...
(A)		if (dai_link->dynamic || dai_link->no_pcm) {
			...
			if (dai_link->dpcm_playback) {
				...
(B)				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
(C)					if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
						has_playback = 1;
						break;
				}
			}
		...
	}

(A) is for DPCM case, and "dai_link->no_pcm" means BE,
(B)/(C) means CPU validation check.
In many case, DPCM is like this.

	FE (dynamic)		BE (no_pcm)
	[CPU/dummy-Codec] - [dummy-CPU/Codec]

DPCM FE (dynamic) Codec no check is no problem, because it is dummy DAI.
DPCM BE (no_pcm)  Codec no check is not good,
but checking it might breaks compatibility, because some Codec doesn't have
necessary settings (= channels_min). Solving this issue seems not easy,
because it is using very complex setting timing.

v2 ignores DPCM BE Codec check, same as before, but added comment for it.
I hope we can valid check for all cases in some day.

v1 -> v2
	- Add Reviewed-by
	- Separate Intel patch
	- tidyup playback/capture_only flags conversion

Link: https://lore.kernel.org/r/87353uqjiu.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com

Kuninori Morimoto (21):
  ASoC: soc-pcm.c: indicate error if stream has no playback no capture
  ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
  ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
  ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()
  ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part1
  ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part2
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
  ASoC: amd: replace dpcm_playback/capture to playback/capture_only
  ASoC: fsl: replace dpcm_playback/capture to playback/capture_only
  ASoC: sof: replace dpcm_playback/capture to playback/capture_only
  ASoC: meson: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel: replace dpcm_playback/capture to playback/capture_only
  ASoC: samsung: replace dpcm_playback/capture to playback/capture_only
  ASoC: mediatek: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-dai.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel/avs: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-core.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-topology.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-compress.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-pcm.c: remove dpcm_playback/capture

 include/sound/soc.h                           |   4 -
 sound/soc/amd/acp-da7219-max98357a.c          |  20 +--
 sound/soc/amd/acp-es8336.c                    |   2 -
 sound/soc/amd/acp/acp-mach-common.c           |  20 +--
 sound/soc/amd/acp3x-rt5682-max9836.c          |   6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |   3 -
 sound/soc/fsl/fsl-asoc-card.c                 |  16 +--
 sound/soc/fsl/imx-audmix.c                    |   6 +-
 sound/soc/fsl/imx-card.c                      |   4 +-
 sound/soc/intel/avs/boards/da7219.c           |   2 -
 sound/soc/intel/avs/boards/dmic.c             |   4 +-
 sound/soc/intel/avs/boards/hdaudio.c          |   4 -
 sound/soc/intel/avs/boards/i2s_test.c         |   2 -
 sound/soc/intel/avs/boards/max98357a.c        |   2 +-
 sound/soc/intel/avs/boards/max98373.c         |   2 -
 sound/soc/intel/avs/boards/max98927.c         |   2 -
 sound/soc/intel/avs/boards/nau8825.c          |   2 -
 sound/soc/intel/avs/boards/rt274.c            |   2 -
 sound/soc/intel/avs/boards/rt286.c            |   2 -
 sound/soc/intel/avs/boards/rt298.c            |   2 -
 sound/soc/intel/avs/boards/rt5682.c           |   2 -
 sound/soc/intel/avs/boards/ssm4567.c          |   2 -
 sound/soc/intel/boards/bdw-rt5650.c           |   4 -
 sound/soc/intel/boards/bdw-rt5677.c           |   4 -
 sound/soc/intel/boards/bdw_rt286.c            |  10 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  32 +++--
 sound/soc/intel/boards/bxt_rt298.c            |  26 ++--
 sound/soc/intel/boards/bytcht_cx2072x.c       |   6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |   6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |   6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |   6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |   6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |   6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |   6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |   6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |   6 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |  14 +--
 sound/soc/intel/boards/ehl_rt5660.c           |  14 +--
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  30 +++--
 sound/soc/intel/boards/hsw_rt5640.c           |  10 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  26 ++--
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  54 ++++-----
 sound/soc/intel/boards/kbl_rt5660.c           |  18 ++-
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  44 +++----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  22 ++--
 sound/soc/intel/boards/skl_hda_dsp_common.c   |  14 +--
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  26 ++--
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  26 ++--
 sound/soc/intel/boards/skl_rt286.c            |  26 ++--
 sound/soc/intel/boards/sof_cs42l42.c          |  12 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  |  16 +--
 sound/soc/intel/boards/sof_es8336.c           |   8 +-
 sound/soc/intel/boards/sof_nau8825.c          |  12 +-
 sound/soc/intel/boards/sof_pcm512x.c          |   8 +-
 sound/soc/intel/boards/sof_rt5682.c           |  12 +-
 sound/soc/intel/boards/sof_sdw.c              |   4 +-
 sound/soc/intel/boards/sof_ssp_amp.c          |  11 +-
 sound/soc/intel/boards/sof_wm8804.c           |   2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  20 +--
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |   6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     |  24 ++--
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |   6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |   6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  10 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  34 +++---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  34 +++---
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  86 +++++--------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  86 +++++--------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  48 ++++----
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  78 ++++++------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  60 +++++----
 sound/soc/meson/axg-card.c                    |   8 +-
 sound/soc/meson/meson-card-utils.c            |   4 +-
 sound/soc/samsung/odroid.c                    |  10 +-
 sound/soc/soc-compress.c                      |  11 +-
 sound/soc/soc-core.c                          |  20 +--
 sound/soc/soc-dai.c                           |   6 +-
 sound/soc/soc-pcm.c                           | 114 +++++++-----------
 sound/soc/soc-topology-test.c                 |   2 -
 sound/soc/soc-topology.c                      |   4 +-
 sound/soc/sof/nocodec.c                       |   4 -
 84 files changed, 511 insertions(+), 842 deletions(-)

-- 
2.25.1

