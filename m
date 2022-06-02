Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2156153C164
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 01:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4961735;
	Fri,  3 Jun 2022 01:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4961735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654214320;
	bh=LQjTxRSYJN0KbO85Wti7+gkN+BsI/bx2DzYEZLDj77o=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oFkA8sgCxPrT3p2NggOcxQSIhVcD+y8XB+q9+R/kl03FKzqIrczmkdSVoqja6FbwP
	 Oeb38r5CerVk76YympbXatxVE+CyDTvmPWnNmut5DUPirbmlz502g0Iv9rw1Q2W5NT
	 oGTupygNQxjKgBwoW8EFmWMKm8P2EHoL82ItY1oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 162A6F8025E;
	Fri,  3 Jun 2022 01:57:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DCD4F80236; Fri,  3 Jun 2022 01:57:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA244F80149
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 01:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA244F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="D47007R5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMtdgYwj+hRwb9TX6Uf/KYFOZ1WmmHGZgworkRpRdmNY1pLVyLmlVjPkYz1q9c8oIVlQ00sNrs6dr0MM0/WEyP0vRhPpas2pR637VspQsf8uDD99cy/lpAoFQVReCijkZQqhhXfR5wF6J32fbN63KDNSSOFTZR2NPKtn0LteV2X+U6RSgI8DrQ1okiqAda8TjR4b9tQU7ufmJtedt9iF6rkHOogMwcxhdkA06xFNxuen+l09kzbGdwQaOWbcQF731SNOBeOrjkDNlQrVbM/NENYtyvxnWgSS3KrXxowUg/uVLM6u36N30lPQt1HQI2Bvsp2+qvBXhBROZGJdqMUv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwZ48CuO6vDNLWcP64CPcRMQq6Lb6lqNbjO7BCXSpfg=;
 b=lGEy9tJmo7EU4y1KB/gL+fN9PhgrHh4XMx4PXArSfp7IerkxUo91ZVvVdGXMwKIJLQsk54kc3kkAu+C1fUoL/x3pvfhZsbb6VBpUw/KWCv6quNXg3EfeX8GzMjzIcQIpfiIQaOvRVTdfwU1vRk8t5IT7piAR8JbRfOJRJy+XpNJgID7Zc8y9mGb0GD6HA3pO3VWaGUZkRyrAWAmbg6qa+hfsKGOLrVcJ3rgnH6FkhA66E6pEENJGmeP9/U4pDMviR2VlTaUw+E6KSYurqNSaMJrys+qbneR5YdZLXWpgkFvCZTrH6qIBj8FJrUWzhMS+N0Z8eFmVXm2HrO3qkshUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwZ48CuO6vDNLWcP64CPcRMQq6Lb6lqNbjO7BCXSpfg=;
 b=D47007R5/RcNg3bzoa3CUrLO6Sf+Mt36Tl5MVrInlFtovI9OYj4LZZDGvIhHG0hFDyYefTLhKey/Q5G0WhunaQmbr2W9kM+/DAHpWbjuQgEtXwm1tm9ds4cp5NZiF/wxJAToUNPO7sGEYpeSMa6YiL1VOIsNNlDERa0w0ZLBhCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB1931.jpnprd01.prod.outlook.com (2603:1096:404:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Thu, 2 Jun
 2022 23:57:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.012; Thu, 2 Jun 2022
 23:57:28 +0000
Message-ID: <87pmjq4o0o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: About Cleanup ASoC
In-Reply-To: <ddad78a2-685a-b0f1-ec7f-ba1c9647c243@intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
 <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
 <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
 <ddad78a2-685a-b0f1-ec7f-ba1c9647c243@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jun 2022 23:57:28 +0000
X-ClientProxiedBy: TYAPR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17aeb073-0ccf-4fe3-176a-08da44f3a625
X-MS-TrafficTypeDiagnostic: TY2PR01MB1931:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB19318B65C6BAFF0F69D3F73BD4DE9@TY2PR01MB1931.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HatIoVNIJoCFKEJ6fsxZnetHjNKtKGvhfP5s0yf7FXVWXVHsvUXGkV417OjUg3edUynkJtnfrIkcAkhXLiqqg4kzAAvB1BMMnGZhp3O/xi8ovjpLVfaydM17pNVR2xJz76POXuCWo8Ash5vPKm2HWGOaqBqKtt+gTj3AEJskHskaMXfEO6unxlk0CO6JVqQUMUc2fV10RP7YCkk9m0/3ysB2XfVy1G5y6CVaOJ0fFqO4EeBYMEtNbkUHoTc05+A8u6XB+YlTN7sDd7rp0vGiKs/O7avsOxKI0BK8+aK1J+xSzWPf4cJcKhMVw4Wd9F1ytZC5F3dv1GoqbWwtetdR4mWTvbfMZCfwYd6BqoCrW0/9iA2xrxoUIEm44sAQBr8YlAnRFx2fOspqWEMvAmqanKC8cYg2ZCYAs4Gkdk2zRdkYd+ZbJexwyVDif/xyxJGis2xQJBzDsKEPvqxvhMJO9NvcP6bVd1VjQ0gUTac8pLJzVZ6I9sZp0FMYIuh21K6h66nLLqRwX9Vu/ep/IN39OZhPV3k81xGH/Z0JYgHHtoW72VG29y+1bca01I9j9ctaoZQWPD/WKx7LKKpj0cE7B2+J+tFE0/76aH6OdFWMSDXj7UDWasRtwdxrE2Bdz3K2PaKULlEcwbX22UwZheXBBDZZbZF3FXuK6b6FC7eA3Pg3hTWvFylMIuXiTWoM/ObFB8LC4yVF5rrsNgW4KW1NXbsC54VQGWwW+ZuNktyv95QzeodBKawdcMPgFC6k92wFe3k5iThjcIIdu2vYRHqRi3STIxC3H+HLQj9CILrmyhyMtmAJgH4owUIKWIKJYc6Z+kylj/zBGmyM3/HV4pvugQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7116003)(8676002)(6916009)(36756003)(186003)(66476007)(38350700002)(26005)(2616005)(38100700002)(316002)(54906003)(4326008)(6512007)(52116002)(66556008)(66946007)(6506007)(2906002)(86362001)(5660300002)(3480700007)(508600001)(6486002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+5N0W/dZm8DJFtZTg59xykNSYWUZJvFZj3oxRYi+xosG/GAEPF0xGNY8gze1?=
 =?us-ascii?Q?gN2sTnRSaaQnygWrYqspDbXTwMalnYGgl7MWLT6+em8z0SksNSnU04sHcS9K?=
 =?us-ascii?Q?pUkQt2NF3orFOjpRumUk1n5iZbfN2ZDsQBVpTAzF7YxJ67GtL732uyZJv5hm?=
 =?us-ascii?Q?QBd+2wX5dzWAIB0vyknpK4BjjC2y0O55LDTiUfmUkmt6mS1jxmOZRNmPBlzc?=
 =?us-ascii?Q?WopYRP6CUyExqZ69v4O6An1oYp/drehz7sUeqy+o4Vqtq/JMl8kaO43205jw?=
 =?us-ascii?Q?FYr5NrnsoEOYRya4W9ugmdDRQMDjtWpu7Pl/XQspnqIVSkQlMZ84WsOpbaG9?=
 =?us-ascii?Q?qzXQopkH3qpM0OBVB8KtmixTe8uXRcRJonkPqclS18kPtns4d6k7KoAHkzY4?=
 =?us-ascii?Q?AlLltwIoMifHl/JaZPtEAFwQCsG3VrTjy1rkKqEPFTVyWxp6JSW9pSknBWqw?=
 =?us-ascii?Q?KF6oqUcl7a8/WFkG2AfI0vNaMn48XpLpvzKNj8SjbO3/NihcsKE1Utyt3e1K?=
 =?us-ascii?Q?Dm8832SOGmhdmapMKYbkuqZv+FC251m1T/dT5PAtGpcW0Nryb/MK78KJgOVM?=
 =?us-ascii?Q?0m0v4Jam+50bczsyBScF/b+j4nlmXIT57SP73AmFpuNb8O2XtrEamCzk5VWG?=
 =?us-ascii?Q?qyjn8nG2vlQThRqmU2XPmMqymvNAdp7Eo4lJfOk45F1MDAyigY9pg9Nyb/DR?=
 =?us-ascii?Q?KPplzAEiSiLcVciL4CpaB3Oo8EYJPu6RZL+MwXM44ITtzub7GSbaqt6t2YRE?=
 =?us-ascii?Q?85yJdhAH5Bd2y1sEzrzaVPspr+XhqNP3pkbnszr905Fup/uwLMcMP0nTgZ2P?=
 =?us-ascii?Q?/FrdAYBe4jVd0DLQABv+tMpmuNchlwfc66YCYcC2KXbPOvrbGpPFjuloELtu?=
 =?us-ascii?Q?YQkx20DP+1AwWD6u0gFkRsM3Zg3/L44W+e7cD+s1oPT3WVzAD2J8AJoRrWLE?=
 =?us-ascii?Q?cEj7Q6lpF+dlRsozDvQ0V0uMA36UZaYQ0eE2ydkXbrOnKMGjvIWcDDPEf7XS?=
 =?us-ascii?Q?3tzNufTJVatMbQhMmvdZqN5RSDNDmXf+OkC4wURf/I5nWR6oeCyAmm40aa8d?=
 =?us-ascii?Q?270wq966eb+J6SJgAIhNMWuib6MqIn9M/Ii1g36oCYFismRERouPVHuirBsM?=
 =?us-ascii?Q?oaSBr7vWrhasrFKpTY+gGMeqafPkHbJSixAvA5ewjtv7LMv4b+ZfNLWda1L8?=
 =?us-ascii?Q?UEmQGGVcMsIFfZhg2XsXhwphtyc/1WXSuc+HGs4YgKX1XSVWO7EoLfrcwE7D?=
 =?us-ascii?Q?RoFW9W7zOUVq1NPAqTpwNv1pcQ1b0X753cxaNs196fueDfCPGfwppMDBPiSI?=
 =?us-ascii?Q?NYg7FosTtmueUgOSqYa9ZQsYXnSUjgn0J1EW/P9b3QStr0Mw5VnToELGUfkh?=
 =?us-ascii?Q?mfazkYE6/LPrtye15IHVgI9Eezk/Gwf2BEU8QTuWDiHvmFoPK9kriCXwxZZ7?=
 =?us-ascii?Q?J6RcCuP7TcXj1yygxFzGSq/eQ4jEdN9dQ2nTMMMDFfW+sGucFtwqDp2NDabt?=
 =?us-ascii?Q?1XmEpPq3bwkJxAw7JUmdraccNESzH61tK5n2IUSa+5keVuCMGiKhXYmnvjwQ?=
 =?us-ascii?Q?x1rkipnTpCMzCc9wJ/IpYWyOyn4f114FQvjUbP+5hmkPEAf3/YqGjMssebVT?=
 =?us-ascii?Q?BIXHC6iMUfzCsZdGuV2CH4mmp6shFvN1LKjrjhiLl1jupv5auErGRLglr9wA?=
 =?us-ascii?Q?kz+EXKm0Sm9Oggkol7dT1bxJmuaMpcgvPChQH5InzPIupDTozJEo82YkVTRB?=
 =?us-ascii?Q?UvM+AzupA2bfCgv2fNuLQNxNgfAXjcWwK3RH55zGzJcZs39flWQ9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17aeb073-0ccf-4fe3-176a-08da44f3a625
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 23:57:28.5129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +X8hyraZhyCDU2pYcNzY4ggk2spkrnLI63V9xa/eBC+DvnTlxbpVs9PTLRGOjKjtWK2ApXoQtd7phQTSpHk3ziO3qk+cOR/uLqYR74hMUXFRJqbrnt0CWJuiwP0CEU7t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1931
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Cezary

Thank you for your feedback

> > 	+-- DeviceA --+       +-- DeviceB -+
> > 	|+-----------+|       |+----------+|
> > 	||ComponentA1||       ||ComponentB||
> > 	||         [DAI] <-> [DAI]        ||  Card-1
> > 	|+-----------+|       |+----------+|
> > 	|             |       +------------+
> > 	|             |
> > 	|             |       +-- DeviceC -+
> > 	|+-----------+|       |+----------+|
> > 	||ComponentA2||       ||ComponentC||
> > 	||         [DAI] <-> [DAI]        ||  Card-2
> > 	|+-----------+|       |+----------+|
> > 	+-------------+       +------------+
> > 
> > If [DeviceA] could separate feature into [ComponentA1] and [ComponentA2],
> > it can use multi Cards on current ASoC, but it is not a generic solution,
> > as Pierre-Louis explained. I can agree about it if my understanding was
> > correct. At least my Sound can't use this style.
> 
> Hello Kuninori,
> 
> Could you explain what you meant by "my Sound"? Perhaps you could also 
> share location of problematic bits in your driver (file path + code 
> lines)? I'd like to take a look - if possible, that is - to better 
> understand your issue.

Thanks.
"my Sound" mean "my sound driver".
The Device image is like this

	+-- DeviceA --+
	|+-----------+|
	||Component  ||
	||         [DAI]
	||         [DAI]
	...
	||         [DAI]
	||         [DAI]
	|+-----------+|
	+-------------+

It calls devm_snd_soc_register_component() here.
Number of DAIs = rsnd_rdai_nr(priv) is based on the SoC (= DT settings),
but these are same DAI.
	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1923>

The DAIs are setuped here.
	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1350>

Component driver is here
	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1810>

DAI ops is here
	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1067>

Please let me know if something was not understandable.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
