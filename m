Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D817C6249
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 03:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4F3E74;
	Thu, 12 Oct 2023 03:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4F3E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697074377;
	bh=dUWQBrVmGR+U2RQ4oauldiF2cVmHqm6rB+ZnCN/lMKo=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OeYsLCU2YCkmHl8vCqfnh4Bat3db4SZa63W0dD0hMAEmHMtCaVIE2tqiv79Zz78oQ
	 6ltHeBGftKSPQjzlRagTJ+1m3H4pqAQoUO7q6VhktaCncPjCb7GMCAMuVSFlhfVzDl
	 zw5kjTx+2cy8T/KErTPpS9TYja259QvAhAwR0JfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91483F8019B; Thu, 12 Oct 2023 03:32:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F548F8027B;
	Thu, 12 Oct 2023 03:32:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11346F802BE; Thu, 12 Oct 2023 03:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74ECDF8015B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 03:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74ECDF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BRC3Y3HT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0nPnqZGVok+21nIq0uL4MwI/5AG82UgoBL4/OTG1YkHUST50yQI0UK8RjhIeaAsQr5D/gXGa30CL19Lvo4zg82JrB5naQU6qFFaOlbOdVXwVFDGBP4fxd+bGOZc4/DQ4fg2d4xlxEeoSDNRIKxPgdWp4wEPN0b6VtrFAjl6LpB08enbB0ZlQ3iR2mN63YaOPkabJHL6Wf5u/0HpB4cI668pDneHBaIn6aFVaEfs/ypgFZfTuWabKK7ulGzaHu08JMGknAiIw470PAL+wzg8zR5OFFXG7jf8pGyhaqMBJENwFKleAirBSC7svGHnT/EkwAYxNczgU8ILiDv+yhNP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1pksAaRw5lqPTKyhHacvr+WBxDzvtr3Dbl+t7B/ga4=;
 b=KobPrCSBNlOUgqgjw9XcKzcxq8jWonjxuumoX1f7Y+gPA1usG+gAptg14yIjA8+KE64wrZmRUjNij9rMtfO3ryIFQlut4e9YVqqs2aPuFRWMLguyF+KG39WfN76m18LqzcdKBd6YwbgR29VoE7dnRe3gQuP858Q8huVXIt0ZrYKl4wHBANRfnDpUbuZx8qXdQwlMZAa4XoR2oJ6AjLe0RL0nNLuuxAVHZf3y+IfrDQ6WfX7RZE8f1qNI/x+8Vh+YudV6+1zsRoMuJZ0ZZXzEyknmSZDwrSwu+WyoKUWQpAIa6LojVTVYeAi4fxF+ooyqmZ9kRFTFLNu1/1ChQHltQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1pksAaRw5lqPTKyhHacvr+WBxDzvtr3Dbl+t7B/ga4=;
 b=BRC3Y3HT9XbyAbs+gca0RNGyyrNNSGcs5bZVue3Tvkut33L4QwR3+yOED8se4xKPsyy/y2pO9qTId1ooRsOwkN+ZGlzEdUOqyNtPkS8QDmAPcl+ZudE9VGAg41rgdGhSSMtnqGl+3Snvh62XgmieysIg23rjyuBIozAHn2MsyDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8411.jpnprd01.prod.outlook.com (2603:1096:400:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 01:31:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 01:31:43 +0000
Message-ID: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/4] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Oct 2023 01:31:42 +0000
X-ClientProxiedBy: TYCPR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:405:3::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4c0146-caf9-4df3-615e-08dbcac2fda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Shx8lxNFcYTRqLsyvmKXT5Ugov7ByrXNNkP+fA6A/5HeqqWXGr+uIpSDEaD66GsLyuCulQDWVbRGmBxsJJGLsOrHXi/MuL0bm8VhpqM4DQE1G0+VFG1fMrAqAd9axmPZJm4pzr2gBaptAqSXtp4KMo5ogPKKvSq5gY8MI2hZkZKrlwlrX2EQLCUWrDF8be5DdU9AZvK9Q+qU0U68yHX5+n/4KaPegic4Nja/PSuHqJC4erMYWY2AgtAcs64d7Evt+GzMG6dWtVC88rD61aUP8uGahwV0hnMIIWBAA+2PWSuy/zOJaA1qoIKMljbxVRboxd5aHuvg60qvttbhFDadQvXIARz36FJGm+5YMPpXArXflI4M0aIulbUy3OxAJWIAsC3W8Nha7pUAAhJ78KVcvRTq9YuhJlE5SL1g3Y2aEqMVNrtSaOSJORGU9/M4YaHpAEhKAbrbl+JMW0pdRRw7bMzUC0HihodNDZFIigLmSOuPuEFQvxTq/kNtTrTBenlTRGS0Hn0Phji/43bXw+kIZcvCZ/toGzqMBm4zbOegsWuuH+jPs70jcfnKiKaOhR6crwj+vo0tj20LoCp2pOv9R+ua0R3tifjp3tSbJQ8GCTmZXWx2/8oM3TWKGMPlVpC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(966005)(8676002)(4326008)(6486002)(6506007)(6512007)(38100700002)(26005)(8936002)(110136005)(478600001)(66476007)(66946007)(66556008)(316002)(41300700001)(2616005)(83380400001)(5660300002)(2906002)(38350700002)(86362001)(36756003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?etQqBvpqYrXPMYv86UFqFd6JSbxmSyv1wpr5Wu6evOBrEQYszGiOBfTB6peF?=
 =?us-ascii?Q?DWY9ozB5SQV5EHdJjRXdV8yHdcMKR2WZucFde6poyFV0UwVJjzcmYlJnCxAN?=
 =?us-ascii?Q?pUGSChAU+8vK8j7H1tOB+NbPj7SKSBMMufgNrEtDB5x87VRhzpwA5VOJaPKc?=
 =?us-ascii?Q?F4z2dviRwVrv1hjikjnWqS7kgMQJ4ji3MM4xmcXaQlLjZ/U24JxjbxGBefIx?=
 =?us-ascii?Q?DSTFd7IwbG39+g8Z4y/b5Jfle9/OVx6Wb4N4Ew3mLUuH+GCbI3v8wg9vj791?=
 =?us-ascii?Q?yOiIKYP3E9Ay2HyQYsO7HxMulRVXpqRXdr9XOpLLFElvyWbg+0fgLTlXcbQv?=
 =?us-ascii?Q?fGztej1Pi6PjCFGOMuf5Brlu3LdFdkxbmof8TE5VKYOORrCgOYPHSrNvySSb?=
 =?us-ascii?Q?8fvKrAKvyx8sZUO8b7lsCi2rRXQOh9h3Kdnj77q2KdVo6pemzrK/vrE+b1VD?=
 =?us-ascii?Q?Wt9v+//TFNxIzFdSckt/APDrf+DhAG8A/BoBu8tz3Cd1bWfaRG91v1iW+WJW?=
 =?us-ascii?Q?kl1NYr1ZdfKGxY3cgJLiPibtkGeCxKGcefiitLhEcgTpaJaY8+nNmdIIWrbI?=
 =?us-ascii?Q?OGG+LvJE+PlBwZ6eI0P4SISpKPazxWIfkC0gg5ZR+HcTzc0alJ/Nf8smlMdw?=
 =?us-ascii?Q?ftNKrF1hnHL7sYnMy3SLKOCFyd2YPPh2+lsgcizgAPqDKDRl4jSqv+gRz9S0?=
 =?us-ascii?Q?x7riMuccGb0s9jEL/lFt6GDuwUM8eg2o4eIxkcDkc1725DJMVuXGwIW7HdQ/?=
 =?us-ascii?Q?DvxW+/G0UzPi7stgAKSChzcQTtXMji913ujQxi3BEjSAbRD6sCpkHRP0v6Lc?=
 =?us-ascii?Q?x+HToKNaM8yfRjMq7GGgCe64iBuGTDcTdIVPbZI3a6vRRFSsrAr45SdMdb1e?=
 =?us-ascii?Q?jpviXUGh0X7RfoX+Z1QqYgdPJyFc0QQlsr25+5Xh07MxbB3t2KmD3jexfYuk?=
 =?us-ascii?Q?x7TocKpcMTt8KcbqEtZXGst39+VYbGAqQKWAjUcWBwejQbJZO+/B7geTEoZp?=
 =?us-ascii?Q?breoy5ONshNDz0e2i35oXwFp61uCzJV/HeW+ooFhp2lsmQX6kpj27ZwEXeNE?=
 =?us-ascii?Q?ygvjZntbAeuoINX+Pg9mcghMqfIT2SonoKo68LeiwK6GxoWkyfJbIXP7Ts8Z?=
 =?us-ascii?Q?+2ajpi+X1yZynIm3DLm7EmlWMg4hEw5ctrF7Rfgkma8tOiJw9uclFOMzE2KV?=
 =?us-ascii?Q?iMaRVyRouI2zTpxdn59qC8l3VlM1quvO2U5eridhO1EEMSp3D2jKWsIWjkti?=
 =?us-ascii?Q?nnIOZUkp5kKJtW3tMkcYpNDjA1yhvd/zzQj4c445AvHkFwyR7AeEf+moYhH9?=
 =?us-ascii?Q?JuHJVTsCWTykPCA0Lg5wWkfPoNJrAC8vMxg7mTt3ATNI5GH06t535iePZehP?=
 =?us-ascii?Q?eiLzTzCQB44Gnj/6NA4cKC6cfFtDkoRH998e0+pFGnk+b2xHWaQqrWeCLX6w?=
 =?us-ascii?Q?dUxNzHJ+705wnJVdbZMGTyXsJRJmhwtjC4lfKFtWwEKHREP8ddQ36gCcyPXI?=
 =?us-ascii?Q?E8/3uHmhYzw1HxDAVWHGkO8T9vKTkN5oDW4wpUazwtXZlwbjmkUNFG/v/xhX?=
 =?us-ascii?Q?3NLEOG/KDztjwKYk29pxtFVhENLdMcdmDpyhN1LX7m8Tj44kfsIXP8TxYwRy?=
 =?us-ascii?Q?7iICAnRNJEW9/PXQMaDshjI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d4c0146-caf9-4df3-615e-08dbcac2fda7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:31:43.2645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pTwKQo6tvYzrYzPx9Vds0KUfvpmBjZcuLXHPXQpDBo6y+klE0dVV3OVitfom6VTyvIDxDsk8D73eTcM0LUWHN0NthdLF0BQHZRk6ZZgb24/rvOt0BHOz7OctEgydyZ32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8411
Message-ID-Hash: VUIALHFOEX5STGD22BQYYKMF257B4AAK
X-Message-ID-Hash: VUIALHFOEX5STGD22BQYYKMF257B4AAK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUIALHFOEX5STGD22BQYYKMF257B4AAK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Bard, Pierre-Louis, DT-ML

This is v3 patch-set.

Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
ch_map idea. This patch-set expands it that all connection uses this idea,
and no longer N < M limit [1].

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]

This patch is tested on Audio-Graph-Card2 with sample dtsi,
but needs Tested-by, at least from Intel.

v2 -> v3
	- tidyup comment
	- use more clear connection image on DT
	- "ch_maps" -> "ch-maps" on DT
	- Add DT maintainer on "To:" for all patches

v1 -> v2
	- makes CPU/Codec connection relation clear on comment/sample
	- fixup type "connction" -> "connection"
	- makes error message clear


Kuninori Morimoto (4):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
  dt-bindings: audio-graph-port: add ch-maps property

 .../bindings/sound/audio-graph-port.yaml      |   2 +
 include/sound/soc.h                           |  66 ++++++++-
 .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
 sound/soc/generic/audio-graph-card2.c         |  29 ++++
 sound/soc/intel/boards/sof_sdw.c              |  14 +-
 sound/soc/soc-core.c                          |  85 +++++++++++
 sound/soc/soc-dapm.c                          |  47 +++---
 sound/soc/soc-pcm.c                           |  73 ++++-----
 8 files changed, 363 insertions(+), 91 deletions(-)

-- 
2.25.1

