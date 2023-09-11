Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C479B162
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:54:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDBD6E86;
	Tue, 12 Sep 2023 01:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDBD6E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476463;
	bh=ydh1+3ao2kkL1UtOtFrz+qbz9f3ps96UiQ/cI/e8Jz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dS3E8Z1OF68EnTlpttodTHPLbcQ35b9cgh9AwA57wOik1onp+j4t5tIXJMLy0nAw5
	 11sm3XBTXxIuJ0jsAJaHCfHkXmmgCeKFfqANuTPo82LEIyEXEgv77vmVYPh30W8qbH
	 g+qRoaYE3ry2Rj2bLbkHjoBIVF6he5/cOAnH+ayI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28B63F8064F; Tue, 12 Sep 2023 01:50:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0483BF805E7;
	Tue, 12 Sep 2023 01:50:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F8FF805AF; Tue, 12 Sep 2023 01:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD3CBF805AF
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3CBF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ijZpYPyI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEGxdBsvfkG6HbvCIcueAxajZF9QyGWIeuPV2SCyhJ0nquWYFU8BciHsEcOIs0r2nBFVdKIvTNqq9+XxHiMzBU0qdvZfzO/wXupqIWrKzpcRdcEAr7ABAzs+deQUn7p1Up+4U7rmtYRI+WlGW8lFyYvpUZHSNOCKd44Am12VFYqsVWTlwHTnLIsy2+Xft6V87cCd9ahd9/2qGOhrPFu0zZPt6RZ5npSaM3uaPMNx5JSXKPtelYSpm2ecdHCGD8DHgBRbHfeMGcA8jyl3CL7HQtUUDt3CTKD3UyvG9W9kj28C0DBe+SmLNxejzYV2nyMeCdmbicSAaglBBw7l7IVERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mfM+nGFC4Fad/L4fA24xtoIioB0Aca81vTukQBhO34=;
 b=Jdz/G7dCkXgw7j90VF3seY2JA5rLrwuXuQO1OBa63v5sRbDG5cRwFIu3ix4RmYnqf92D49ZQmgEfvYKthO0o62uRhI8JSLj4mXYHcH87QxRgepbMf/hXOnJ444vwoSOcWaVr5I3lCrph8rMve5w2Q7MpABuvHy053PCFPByzSN3Kd5ZNB66Hu3qfl6p1sdwEKqEA9iGyD9oVcoq5ZruDO87Jawsf2cLQzMe9fOY9CK3q8UBpzNYcHAHJ8ush6nXejxj3CyGDE08H2X8PQyoGzSFwDF0+TmLCNQDtGTxqkt8G/dKwTyst2DXCU267wlnTjm1xDuRO8o6xUPTkauJJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mfM+nGFC4Fad/L4fA24xtoIioB0Aca81vTukQBhO34=;
 b=ijZpYPyIeJHMyWiS+3NHXKrNlme2JJe9dDg+BgFM10eXTMIgakSXFATBiuebBjfysCV08nSg0nM9XuYeN7MaH5m2WvKE6DZKD2rIXbwhw5ompyyxKQi88zRyephx1VaezcgjERlvdXC7I6+kq+171e8QnVqscQoqZ07aS4wYeag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:35 +0000
Message-ID: <87il8gqnht.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 24/54] ASoC: cirrus: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:34 +0000
X-ClientProxiedBy: TYCP286CA0160.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 525f92af-ff5b-425e-29f5-08dbb321c091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8LNwhtvm7N9nkWIV806+/C7mpZh1h3PtlnUI7sAxF46+MCGfbMdbrtp/2sOsZuQFKk6r4J6lXEHMUF3xBrGFzk1s/ZIhUUH7Hq0cGWAxZ+5htfN5xgMrnzymC4aW9QBMD4jCbeJGDb24/nDY5BMJBsCXlysHkXpoUvBQfRkcusky9GUfrqDDr0OQCuSlY6jfyFzrtv3eS0NTY7dBOfbAnEa0BrI1QEwUe+Yk0AokrfcpzrEK41djZeLIAenn2fojuO97eFm1UVIc/cmm2ixoDtReJXvWpQhDj4hEG8vSF+yVCSOGx8uDG+hg+eD0g7CTg76VujumnHMgvRH5pCMPqW/ZPtWxXJrKwmcSpqvNR5dxl0+r8dcF4RJev4aB1tusNqfGUWtU05cSNQyZ3uhwVoeAVS8wIHBp3b0CjleKKBhvdRNb/tNFjgpcIATmZK3C4THCgptcxAsIqiO7bE+hP2k5oI4QKGPPaPLxMXoLkRoScr6c4ZY21Zo/crZ2i/TEU3jatN6YnAgPKak6lAbhu6kP/+H2kI3VfZc0Ys+aPPHksyGWcMyBy4Up4oirzevMvw2NYl4HKrTpbJvy4/2atTcwPUQBXlSymu37a6wqERMrlUyKI+f2mffow03NdV1blFiEgGV/1WKHUtuE7FM6rg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4uww1rZRvHVvc4vByn4StxX62UMiymeKDBkF6N1TRlmWC5w7eKD3ZtHdtxmE?=
 =?us-ascii?Q?yQ8k+JkTFzGJ7RnWtLc5ID9dnoiztNbvurT47Oj7gzSx+c5C1PLCI/O1oZ4p?=
 =?us-ascii?Q?KLVZXZJhdrdt/ZC4wQ4JE1sga0lzs8YjedVxM/vBpRV4B3PewqStDegsr8y2?=
 =?us-ascii?Q?lgZBK34Z1BYWJEXKRnbz0CyVHBzq2MRi7GB2HCAfFjvBkOirNTVRxr6rq/DM?=
 =?us-ascii?Q?Ipgf/O54YXJJMDo+FUmYSWVDY1uu0X9lAzbcCblXhSWm0vbipDrVWLvMEpyl?=
 =?us-ascii?Q?BGoQuEPg9coyf3HDzrqbLpFN4ZDfshzXk8JI1ao1JNm7s2EjqmQ+eJzLfNos?=
 =?us-ascii?Q?rk71tUWJLxVEzXuXfyUo5qObjcsnZSADW5+6zM1F8Y2ldCQUGyyUxnmA5Ryn?=
 =?us-ascii?Q?BU1X5P+wYFgrm5bwldtcyVsmDTOUEchgx/4fMqEcVKhElub8Oh/zNHClOlXI?=
 =?us-ascii?Q?heT5l7GXyvDzLQhowAuQ3SSwT6x3vmOZ7waWh2QLBCseXww5nHtRjgTVr0k0?=
 =?us-ascii?Q?D2Qg/dlFOOak0DCvzaho9z5T0+Z470z0fYat0Xs7tBon31g7TWvKmmts0WIp?=
 =?us-ascii?Q?6N0Vbnco25FO+TJ+iQudmcJSQ+iF+htJeAJllZGys5nAlsOim/oHzQbpRZsI?=
 =?us-ascii?Q?FSIrZHvDbW5l3UBxhBx/sDDDCM+HmOpIH/6SHxC7h1CDjQWbfZ+ygYwq4lYk?=
 =?us-ascii?Q?V7PnlUq/tylKOpk7hVGimIy1MkXZ6UpnXU4fh94OlDo57OOYzwiKgSyO68Wf?=
 =?us-ascii?Q?WjvMGz/FtlKDr6NDP5O6heh1LCa7lMnSFpvvKNN8aP5b+2FmklhFPCHhZ9ek?=
 =?us-ascii?Q?ORXmJABHbEI1le2d5ATwGJgOfGN8DwqY1tQ2PAfqG7t7b8O3Ac8m/+8AIqzo?=
 =?us-ascii?Q?DbKSBKCgrbFVtrjY3UEJ0UdSYIACPA2lK0ZkS9IOlSKtQbG5AG2UMMqcSuZW?=
 =?us-ascii?Q?/GLfstA4tGMYHoVh1c7Ckt4W7/1Iqv1xdy/ZVrIgWgDm3gbApCouuGp6j6LU?=
 =?us-ascii?Q?r9gfGfZGcdkysuZf5fVb+iSfU09KmYAVBWWkj0a8AYatngS8/iffp1xF/jR7?=
 =?us-ascii?Q?29J49Vvkr4CdlPy7qd5m4q4O4fBoU6+nwZY3TSozlRAOpmXCRws/YPcHP09x?=
 =?us-ascii?Q?H1vXP4If04OcNuDGi//tl40P8DpdLrZ99XabxZmjqHp5FsjQdqSMR+ssjG3Y?=
 =?us-ascii?Q?tMN8+TAE2Ey7Yu9G90yP8br4SjVdWD7YnTA49IvVSobcZjZ6XblqzCn6Pl3/?=
 =?us-ascii?Q?pmv3avLLiuQGCtk1EKQNm1jlQrC9s4Ff7OsyvxJDbOyjOsd9tmTd/pDj4iDo?=
 =?us-ascii?Q?KVGHT9uH97pjQFbnTtq6vpAgXVzPj2h0izIX9LrpaxZbEf6NF2Dy4OwPtgHB?=
 =?us-ascii?Q?bapJWAQJ39xPrkz0UCIMj4e7egcx5rl8CGeHOi5QkTwqjcawR/QP0ktHRWXe?=
 =?us-ascii?Q?ovTteFzJSrHZvBz4O3TqHojOaw9Z8/E1CbdPM9CZAGNnSqmaIiQJ4vnHD6J2?=
 =?us-ascii?Q?31+N0kTuevdvrbDd/U1Bv5wlFQIfE49pWwDARWgq3yzbhM0GOKlBQ5aGaXAQ?=
 =?us-ascii?Q?rxfp7R/Wvv15RhcyMOYuEY5VTsFgqAoaNjeZ6IcsT/swUyPZjH2tx3nut9vW?=
 =?us-ascii?Q?g1zWngi5/mRq3JUGf6/7OmQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 525f92af-ff5b-425e-29f5-08dbb321c091
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:35.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XoNOAMy/AghmY+1aIKdwsB5mXsCabspr4zqS6KRutwtb4GoA0WzV5ywGvaYR5cXsPeog50fOEaKBfGJoTtHNsPsxYGEp6ZBNWYv5m0yoF+1qEWV30etj384v4YF+wn3j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: 534OQH5RISVWHCLKNQ64PYCVFGZGXDZE
X-Message-ID-Hash: 534OQH5RISVWHCLKNQ64PYCVFGZGXDZE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/534OQH5RISVWHCLKNQ64PYCVFGZGXDZE/>
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
 sound/soc/cirrus/edb93xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index f49caab21a256..6b68172563319 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -22,9 +22,9 @@
 static int edb93xx_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int err;
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
-- 
2.25.1

