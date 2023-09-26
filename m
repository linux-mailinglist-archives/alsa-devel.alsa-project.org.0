Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 522167AE5EE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37390F73;
	Tue, 26 Sep 2023 08:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37390F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709870;
	bh=yUVbFO12NiKD9xMQ9vt+M+/4HRin0LJXSZ6bFZIShLQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jHdyIg0z5Kot5GHigxSjDS/Dkx9I4L6Hjwuc+H5bNNx06f73ibDU3+/QhfF2yseVd
	 clfpXDWG9ljhvCn3FWPMK7qHOn/5rWXrfHfF3UjzCf2xHusCa47p7Qk6RF0ZekAuy8
	 rvHfkWqniMoFbm28lbYJCYGi5CKs4JZeAaNkx/a4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5FE5F8057B; Tue, 26 Sep 2023 08:24:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3878CF8057B;
	Tue, 26 Sep 2023 08:24:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6A50F805AB; Tue, 26 Sep 2023 08:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54BC0F80567
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54BC0F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MSwyrPgF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkEM10zWXuRqFVN+E9gomy7ICNkn5iv6fYSFgKFrdHsC6i9t5SyO2ZZmL+6f7Kow8wi0ILJFQqsOA/VY/HpM+q2uQ7f76QX6rYLc4o5vi34K5umcLPoGggDhOcTjXM6rxgkTkWKfp9zqyLpt4nh/yfxous27K7mfI3evo556r/pALR2NiporLoULyGQ1rXWSY/ab508rYEpirsTeOGGT+WQegD323iviKLRiDLCuTQSO6SD7WF44ewJp5J7V7kzkr40y22Pu0qP6cQbKC2uFwsa08RYmN/rKweQZ5GLxC30nlDqOO5HAJ4lppKHZxV7FFCebXGLXn3iTw+ZAYh5xqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc0hJNs+1Y0TP2Ku0YPneeIaqqyop4MMwJD23axcgEA=;
 b=Gk1jOzeAXEgZHhwzU3ZExIr1tMsdOhQA+dtjin1eJmAtTTRPjQuF/uksdjFxwxqVUaaBUt/evvolM3iyq7Tei4aG1uff2x6E/uR5kC8gDy7XFHPOW5k3vh/HNGCWuxiPt655sCFMZRyvHfE8nEDVsXVdaejwgnyDa6LhSEXGKNlNL9ODbsMAeS1C9+/TLpGq6c0OufkE3oYA1THSCCwY7g1YTKWftsZd77MaFmBQBZr+d0Y95F+7AzvbyLWJPYDH+vle02ONy+6pQhdi2UB5sLt5NITopTaKA2VQiKqJnEuY+HbUvB3fFW3cnuEqnGNtz3eJC+5ZHchjST3eszyk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc0hJNs+1Y0TP2Ku0YPneeIaqqyop4MMwJD23axcgEA=;
 b=MSwyrPgF5MadbDkLVx7ocTFRTdc4ghk7GcBfE+m4HRDWVpN65l+9nsYPyVHLJcnzkNQKCZspt5VPHt4p4YAQi/FEyh9piim7s4l1qzdlzfQuGhhKzfJjb2kITkCG0+qqdZzqNifL/MWIwbBQsgHNfb2sGoDVhdyaBKBLybHHHm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:24:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:24:35 +0000
Message-ID: <87y1gtfo4e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Cezary
 Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 36/54] ASoC: intel: avs: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:24:34 +0000
X-ClientProxiedBy: TY2PR06CA0029.apcprd06.prod.outlook.com
 (2603:1096:404:2e::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd93160-2e83-4a3a-ad45-08dbbe594122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eK89vxNrpPcywWx0NthTULQ3/vxtwY1sQoM9RERlhg35m+9h5dxsgullZ3nJgtqZV0vQTplrEwz+WgK0wNhY/EO3buAL5zYksCMGmygXuRadd28IPH+WNUXZfFyiMyiquGKMXzAHuU2noW6oP8yywgg1ZbjRP21RSsCLs9PSerMcyOioJK1r/Gui6o0L4XxIPOqpegtaYEwvojdYjeIngvQpa5fACDpxuKvdNNQH9u1qs9TIAZNXt6VH54TyT9SIvg8X7Ocj4n4QCVmC8uWS7p9GO/70BuqqqZADT4qwvtOSCi8dVL+lpT8MGPwvK38rH9+bUP7MHRnyDnoNMjB1MFK8buedD9fw/pipzaVd4/ejNfrbQMNX9MH6OBHT01ycAHbMirWrQbIBHfY8rEE/Y+pvl9T9pQxeJwEvtYyhlIv+EYYvQFeP8ww1khQmxlWH5cUIDrdOCLThuyLm1WrYOuwWtASfPi7DwsoyG2khJadDNQjwgbFLxMONCZ+fo+UKkK7e5mV5s4nSFtAyfDd8lwNS0xu8d3cX6236U/dNKT2RtMAxCwXjk4ikst0Qknl3VhllLE3KdhyIehgzWyjjUQv8WbSIiNSnOfzdiHhineZVyv00lPderG95QG1TGg8qym78ZT4AOKVSayFihnRUf38/RI1IYVmtfYKgva0KBmE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(921005)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(30864003)(41300700001)(7416002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IP8YM0yKI6HzHKQax5anlt5UgmX0EsuWgCseg2gqyshjGO+6ysTd62QqiF1F?=
 =?us-ascii?Q?v099813yuFlnCr6XJzfrXR3wPpvGO5a6boU9r4owL7CQHL7ARkbtHDWJtxX1?=
 =?us-ascii?Q?foifN2f7qXZJpl93cIiF1qdHsefbRh19hd9QJQRX42qtUNYBxLBFvp2AGr2y?=
 =?us-ascii?Q?b7ooJ8LzcQaXW3wiAAQR932fMIAWzoEiqLBmLszQQ65ZXp/30+t7L1c4u0Zs?=
 =?us-ascii?Q?Z1qJ3iRhsrxH+rGKHz3nDOzS78ktMEYXcUIshiU2ruDh4vzaQxUJBBLV+V6O?=
 =?us-ascii?Q?L2h1RrQiW5Kw+xchjDKAD3aY2/jktb8Plc8GbaytvjITEayQMGUrrZMqYVFl?=
 =?us-ascii?Q?UmprHHdoDz9/Gv7DkobZVKA7P3vuGjaIEIxpMkkupqpgIgAG1U64L0DRndzj?=
 =?us-ascii?Q?lrvPybBlev0LjpABAFh+PNXcekCvAM8AUEzw4oRoOPZsH8ov7c41tVrbBrxF?=
 =?us-ascii?Q?f//se40hJOiqSfDM3hM/jusxjfflOvVwsTFa8fd1Bg4O45Tw96LtDXEIrC2a?=
 =?us-ascii?Q?19ij8t6VDDySNSCRRsNnHKdA7ARUeQVHnPvYZFvriNvf1XiSTtRdWB3wnhqP?=
 =?us-ascii?Q?6rwxgKkEopK4oNlw4Hc6tJXtloPoztk2YZU1q7BJCZMjXjpiwkzqtfsVddDG?=
 =?us-ascii?Q?KXlTpfb+ydXMPBLTFbVp6zAKSNs1+zfDyG2kDDqAyEsSg/nx2j5G7QzffwHT?=
 =?us-ascii?Q?jZUW1VBIWLNkHrkCM6kDm+OgKqM6San6U6wyrjioW5CCkTtljNvoDVYbZeT5?=
 =?us-ascii?Q?Fs8rIceh5m2mp2TcvSMaezV6ONLlkXUV5BOKJqeJNZZANOG/4wJhrs9UE/Tz?=
 =?us-ascii?Q?KFCp+kUrXjh7UB78hXe34HIfzTIvgcK9tLEWT9fKzhU3u3d6CvCOZM3crbEE?=
 =?us-ascii?Q?Wns7snKO4eqjSA0WcT2jPpu/dnQoI/d/rWC0OorQBLGK6qAOYUZ53s2JyAkg?=
 =?us-ascii?Q?8hyNxf0ktISmh2D88FWeDs+HO7AUXVqXcaRhV57UbCZwXL8MziP3YZ1Igz4I?=
 =?us-ascii?Q?Dlm0cBZQ4iNlkAMVClwRK1EWJ15zhTjlejs2+MZd7XCpXdNW5roijq0g4rVC?=
 =?us-ascii?Q?sFBIPYaPV2948OARpwjPl5KGgHoN9tsEGFBPGSBPEWu995rLBLICTHSCP0zD?=
 =?us-ascii?Q?+XwrgYkj+VnML8wOkA3nOrOSD+AjOh4Zqjiri60fUPGNN3FwqF2wovTcsu7S?=
 =?us-ascii?Q?6Glc9KTx1g1qhsVTV9ipr7sstAYtNiK0xAsbNH/Y89sl+5fiXsG2jDvFVmsb?=
 =?us-ascii?Q?Rz97E0Dqvjx3tfPMUF3IP9i0q6J5jQoB2IWkvqn2fzkYAx/kmfFJxp6eEgB6?=
 =?us-ascii?Q?l2EiagQNwy5+Rs/qktAplD551HCebAEWktqSToFfhm0rtlTuzDj7xHirzbr0?=
 =?us-ascii?Q?NpWHIu9PaRn3rPBbDDvzfE7bMAUS2k69rM5I3RVG/8hi+Ey2usAhBk+dL2hm?=
 =?us-ascii?Q?zMUeusdzNXoinhOjcVFHhlctcQaETG1E7AmQFzulJ7tJa0ulkSbpDef0VHAe?=
 =?us-ascii?Q?upSolv9IO72RZkow/att+Po9wxYdlPuiUpTeEjpE+qaNsKsrEQzrPZCcNx2v?=
 =?us-ascii?Q?khcYtvCyx2Xa3RCgxa0XWrH0PXVzZDN79zacaN4qaGMRAlhPlQr9aPBKhF9Z?=
 =?us-ascii?Q?c9+W8/t/pl3mlmLza5NNYxg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9fd93160-2e83-4a3a-ad45-08dbbe594122
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:24:35.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +TGd4Js12B4rBfikfiOsbuinp1ERbNi4t47Lbc0unShcdOTBEJGPUvLV/qzThc+vfbqxPsNSFhV2Rk4uQsjNdY1P8NsF95WEOJg5VgYCkEso1Vw0q37or56KbSIEvWP7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: LU5P4UTUUKNHFWDCLAWBZS7H66SSYK5H
X-Message-ID-Hash: LU5P4UTUUKNHFWDCLAWBZS7H66SSYK5H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LU5P4UTUUKNHFWDCLAWBZS7H66SSYK5H/>
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
 sound/soc/intel/avs/boards/da7219.c   |  4 +--
 sound/soc/intel/avs/boards/es8336.c   |  8 ++---
 sound/soc/intel/avs/boards/i2s_test.c |  2 +-
 sound/soc/intel/avs/boards/max98373.c |  2 +-
 sound/soc/intel/avs/boards/max98927.c |  2 +-
 sound/soc/intel/avs/boards/nau8825.c  |  8 ++---
 sound/soc/intel/avs/boards/rt274.c    |  4 +--
 sound/soc/intel/avs/boards/rt286.c    |  8 ++---
 sound/soc/intel/avs/boards/rt298.c    |  8 ++---
 sound/soc/intel/avs/boards/rt5663.c   |  8 ++---
 sound/soc/intel/avs/boards/rt5682.c   |  8 ++---
 sound/soc/intel/avs/boards/ssm4567.c  |  4 +--
 sound/soc/intel/avs/pcm.c             | 44 +++++++++++++--------------
 13 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 85014d98f7e8..2059d6156738 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -90,7 +90,7 @@ static const struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
@@ -140,7 +140,7 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 
 static void avs_da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 0a023f871d93..6d2a7c8e445e 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -97,7 +97,7 @@ static struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
@@ -138,7 +138,7 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 static void avs_es8336_codec_exit(struct snd_soc_pcm_runtime *runtime)
 {
 	struct avs_card_drvdata *data = snd_soc_card_get_drvdata(runtime->card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 
 	snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 	gpiod_put(data->gpiod);
@@ -147,8 +147,8 @@ static void avs_es8336_codec_exit(struct snd_soc_pcm_runtime *runtime)
 static int avs_es8336_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	int clk_freq;
 	int ret;
 
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index bc3065c6ceda..1dd0c59a8d91 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -32,7 +32,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 		return -ENOMEM;
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
-	dl->codecs = &asoc_dummy_dlc;
+	dl->codecs = &snd_soc_dummy_dlc;
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 3833251ade26..7820435e3a53 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -66,7 +66,7 @@ avs_max98373_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_par
 static int avs_max98373_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 09b231bf4e6d..ae465b231249 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -66,7 +66,7 @@ avs_max98927_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_par
 static int avs_max98927_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0;
 	int i;
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 38c5087d98e9..9f15b22a3c3f 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -106,12 +106,12 @@ static int avs_nau8825_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 }
 
 static void avs_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int
@@ -138,8 +138,8 @@ avs_nau8825_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_para
 static int avs_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtm, 0);
+	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtm, 0);
 	int ret = 0;
 
 	switch (cmd) {
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index ebfee54814ce..b376d4c2d706 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -87,7 +87,7 @@ static struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
@@ -121,7 +121,7 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 
 static void avs_rt274_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt274_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 84cf9a0c8dfe..36da0578d5b4 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -67,12 +67,12 @@ static int avs_rt286_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 }
 
 static void avs_rt286_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt286_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
@@ -98,8 +98,8 @@ static int avs_rt286_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 static int
 avs_rt286_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000, SND_SOC_CLOCK_IN);
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 3b0e2b1a3251..3cd8057f0ed6 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -78,12 +78,12 @@ static int avs_rt298_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 }
 
 static void avs_rt298_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt298_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
@@ -109,8 +109,8 @@ static int avs_rt298_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 static int
 avs_rt298_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int clk_freq;
 	int ret;
 
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 770b36d05bf4..2e84bd629766 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -79,14 +79,14 @@ static int avs_rt5663_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, jack, NULL);
 
 	return 0;
 }
 
 static void avs_rt5663_codec_exit(struct snd_soc_pcm_runtime *runtime)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(runtime, 0)->component, NULL, NULL);
 }
 
 static int
@@ -113,8 +113,8 @@ avs_rt5663_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_param
 static int avs_rt5663_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index b93468ae0977..f1c46c6abd9d 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -92,7 +92,7 @@ static struct snd_soc_jack_pin card_jack_pins[] = {
 
 static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
@@ -137,14 +137,14 @@ static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 
 static void avs_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+	snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int
 avs_rt5682_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	int pll_source, freq_in, freq_out;
 	int ret;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 7324869d6132..27eca051122d 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -50,12 +50,12 @@ static int avs_ssm4567_codec_init(struct snd_soc_pcm_runtime *runtime)
 	int ret;
 
 	/* Slot 1 for left */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(runtime, 0), 0x01, 0x01, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(runtime, 0), 0x01, 0x01, 2, 48);
 	if (ret < 0)
 		return ret;
 
 	/* Slot 2 for right */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(runtime, 1), 0x02, 0x02, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(runtime, 1), 0x02, 0x02, 2, 48);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8565a530706d..3f1f98e1a31a 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -58,7 +58,7 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe,
 			   const struct snd_soc_dai_ops *ops)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
@@ -127,7 +127,7 @@ static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *fe, *be;
 	struct snd_soc_dpcm *dpcm;
 
-	be = asoc_substream_to_rtd(substream);
+	be = snd_soc_substream_to_rtd(substream);
 	for_each_dpcm_fe(be, substream->stream, dpcm) {
 		fe = dpcm->fe;
 		fe_hw_params = &fe->dpcm[substream->stream].hw_params;
@@ -167,7 +167,7 @@ static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct
 
 static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
@@ -216,7 +216,7 @@ static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct
 static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	int ret = 0;
 
@@ -303,7 +303,7 @@ static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct hda_codec *codec;
@@ -320,7 +320,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	data->path = NULL;
 
 	/* clear link <-> stream mapping */
-	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	link = snd_hdac_ext_bus_get_hlink_by_addr(&codec->bus->core, codec->core.addr);
 	if (!link)
 		return -EINVAL;
@@ -333,7 +333,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 
 static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct hdac_ext_stream *link_stream = runtime->private_data;
 	struct hdac_ext_link *link;
@@ -345,7 +345,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	if (link_stream->link_prepared)
 		return 0;
 
-	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	bus = &codec->bus->core;
 	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
 						 runtime->sample_bits, 0);
@@ -372,7 +372,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
 	int ret = 0;
@@ -500,7 +500,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
@@ -534,7 +534,7 @@ static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
 	hdac_stream(host_stream)->period_bytes = 0;
 	hdac_stream(host_stream)->format_val = 0;
 
-	fe = asoc_substream_to_rtd(substream);
+	fe = snd_soc_substream_to_rtd(substream);
 	for_each_dpcm_be(fe, substream->stream, dpcm) {
 		be = dpcm->be;
 		be_hw_params = &be->dpcm[substream->stream].hw_params;
@@ -639,7 +639,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 
 static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
@@ -869,7 +869,7 @@ static int avs_dai_resume_hw_params(struct snd_soc_dai *dai, struct avs_dma_data
 	int ret;
 
 	substream = data->substream;
-	rtd = asoc_substream_to_rtd(substream);
+	rtd = snd_soc_substream_to_rtd(substream);
 
 	ret = dai->driver->ops->hw_params(substream, &rtd->dpcm[substream->stream].hw_params, dai);
 	if (ret)
@@ -964,7 +964,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 	for_each_component_dais(component, dai) {
 		data = snd_soc_dai_dma_data_get_playback(dai);
 		if (data) {
-			rtd = asoc_substream_to_rtd(data->substream);
+			rtd = snd_soc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
 				if (ret < 0) {
@@ -977,7 +977,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 
 		data = snd_soc_dai_dma_data_get_capture(dai);
 		if (data) {
-			rtd = asoc_substream_to_rtd(data->substream);
+			rtd = snd_soc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
 				if (ret < 0) {
@@ -1081,7 +1081,7 @@ static const struct snd_pcm_hardware avs_pcm_hardware = {
 static int avs_component_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* only FE DAI links are handled here */
 	if (rtd->dai_link->no_pcm)
@@ -1099,12 +1099,12 @@ static unsigned int avs_hda_stream_dpib_read(struct hdac_ext_stream *stream)
 static snd_pcm_uframes_t
 avs_component_pointer(struct snd_soc_component *component, struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	unsigned int pos;
 
-	data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!data->host_stream)
 		return 0;
 
@@ -1129,7 +1129,7 @@ static int avs_component_mmap(struct snd_soc_component *component,
 static int avs_component_construct(struct snd_soc_component *component,
 				   struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
 
 	if (dai->driver->playback.channels_min)
@@ -1430,7 +1430,7 @@ static void avs_component_hda_remove(struct snd_soc_component *component)
 static int avs_component_hda_open(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct hda_codec *codec;
 
@@ -1464,7 +1464,7 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 		return snd_soc_set_runtime_hwparams(substream, &hwparams);
 	}
 
-	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
 					     HDAC_EXT_STREAM_TYPE_LINK);
 	if (!link_stream)
@@ -1477,7 +1477,7 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 static int avs_component_hda_close(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 
 	/* only BE DAI links are handled here */
-- 
2.25.1

