Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BBE7AE607
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0272EB2;
	Tue, 26 Sep 2023 08:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0272EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710119;
	bh=W4uKr/oH2f7WMhwQAT3AefHoCCgGfdp0EqXdaDrnpFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hvWqjk3WNhWm6Ur3PMaPKSTZyHsGkeDCDqFq0Zj5zO5+NNPdkeXyhX4sCRZC74JQH
	 dOsTfBTc6SmPDcmxGhgrdzt2TJY4LcqS31jjM0/r72FsicleizU2PlNwxnfdrtzZf3
	 w+oL/VzJm4/HKPYj8bgtblw178JCOprsWHzVf8Do=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6276DF80751; Tue, 26 Sep 2023 08:26:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23055F8074D;
	Tue, 26 Sep 2023 08:26:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25F54F80751; Tue, 26 Sep 2023 08:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77242F8074D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77242F8074D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UNnTi+rH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkvwgIaDzSCybhouiT/THTLqC/QW/AZIdcYByaIwrqCazQS+OHfxH/xM6chWcWcgjxm2ltffJ+Avku/KWXrT9Kp99VHbyMHISAS9UD+nh9OaM+bSeqM8qS1s5PDygahQLXJSCa6gx82ANU+FO+aBPc7ni9HEb5eDdxw1oiCwq2N0uvSMp/Y+VnsqiGO4ljrW1gbYjsEFtTtQRK3n1GEqsIo3hUkleGqYqcn+CvONkyhN4bF1RJuoOz6uMQC9O/H1vPxXOew0YVrlv/5vFsRhFA/OA4kVAt/rDNh1XMH6lG+XY0umtSG2CR+4Bh/fYtp5/hPT+iDe6Yr1JohBZnThcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KL1Jz2c16Y/SQCY9ScUByCGM3Sq/wO582edYyukzNY=;
 b=YTbGTyGOlam0sWyq4wURKg/baVmZqH7E60GrMMT578t7SxNv/6R59Xp56dHNMbOWqfBjGl1HurQ/tPx6OFW6+17t5MkjDzQvv/Qzd34LV+FvJjoOrY6bkGQ5gdYr9TZ7bva8KI+sdoQyasZ9V0tRd1aHNSiraWrjL+svD/30Uag5HMjuLXyOxQ6xYIXPBR285lrEkdztg3Y+7PqhbQ4zIKWgjbElHPWdOa0Ol2tZp7ab5UsTxjCgsQ9dHpHgmhN1L3z7M4E+lczERASfv+PiOP6JVi5tY89RHU2DGRCvHQPf/tYgCJoGoSeKZqNQn0QOvuujsqYnl4c+qMMfsouIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KL1Jz2c16Y/SQCY9ScUByCGM3Sq/wO582edYyukzNY=;
 b=UNnTi+rH4CTPHSHMgwxLSp/2Cf60fL5gOZNGJ4nSNvGsYzgkbX7ZNuv3s+e6JOgBROlHElq0tgxu3smfyTXb885az5IYz1C8E+5SndDSwI3i3xjNmrvvwlteCWDfHREacu/OXlzQsAqS2AGKgYpNtiPBDn4ni6gXBGYmOSEWGWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:42 +0000
Message-ID: <87edilfo0u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 50/54] ASoC: soc-topology: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:41 +0000
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bd7d10-a781-4aaa-dc79-08dbbe598c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	svSQz59w4pDPPgh8OaXPYWj9XC74EAQxgxedE1G/qnY+cQka5btMZaZHdPk4Gqo09TSHH2wHbhY4U0R6zpw61xKXVvt3B2sW63jBcZxB48IC5gn5uftG+kh6rLmspNUjNkE9nzaiok77mDxgzmOZKzMz19QI5885KpHe9lwMQc/l9d+LktC/89Pbriww1A+vGOxnmwYscc4tgMfWnJNp6+bqbBTlFuo0dRBp17zY78pcYx+mETBS41/rdQo4q+4zYb2SdJfCnb94NOotDzmw/xSnxfYvlf5+Ya7AOXYAP8cbBeTLgRwa/f2JIk/X20gQefAkVy7KhE4qanwuu75dMXBha+Q7/j7Hp9hpBwkVnFkzJcf4pqbMJRioBqhvZz9fdK2VZLaNXyTZPiN6auGKNKL1tWNPhYNDiKPtzAWVw0vR+GDH7EorC4nYHDzCasu83jr5BU61Zrg6bp3p1GAyYPY7wLmytkXgAYnaI48Lg/rDDnMW2I7U3n0dXsPN801XaahmcuuIs+JQjD1eL2tiO0iiOVKWLHCNgmaOXagOihB6tCANI//qg/Bn1P1gkkXLLqICiwC1WHq6XOFJ06zW7SusMZw+AbNjxEwCJcYuSKb/HI7+ns+qEradc9jqd7qGlAN6/hDiCCbj4Wz10Dx4nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E8Ucj2bG9iIApvNnmCuyPR6g2xViYxOtLZh2uxJkOGDSTpxRToRUgCMwd9Fj?=
 =?us-ascii?Q?LJmFUk2akDbHQHmU9rAv0yL7iZmXfoM5P4Lgsrv0CG24wJ8esVNacc2h5xFU?=
 =?us-ascii?Q?EHjVGf9IrJW/+m1ZpDQySCXMfYsczh28EnZXXRVMeT70fPR0NKmNWrcAtfyX?=
 =?us-ascii?Q?rPkQHy3T1Hx8p/kb69cSlCBXnR6TPmpUYO5y/oow21jHA2KIFnSgkXgyqJ10?=
 =?us-ascii?Q?Q/JrpV8zd0bTN0xZW5jF5t3/TTVSJbTxU3J1AWc+QFZ/38JJBM9lr4+Jxa5i?=
 =?us-ascii?Q?HDgO4eXx3a69NtVxuybndjo7DtOgvH7Py0aPVJ+VnmFGW7y876en4/M784nT?=
 =?us-ascii?Q?3cyp20cFop6aL+PrbnrYAczjSoriFAHFBHPpXG1+YoSdiMJI0Ct6u363Q0IF?=
 =?us-ascii?Q?Tl+vzMBJDZB+VmT11+BtsxBWDyGOFxWBrWw4sIBd8wdT9vzAupkqbFBol4ar?=
 =?us-ascii?Q?/QLSfzpqBkYDSDzvvg39iWaSiGIx84bYqXr+LTPILZPV45OeKBcnmi/vFSJJ?=
 =?us-ascii?Q?uaMiGfXKrdzNDIRDSpbl/kzUrNXB8FH6FeLMNIAyp1uQYchRvvXtRTQyUN/l?=
 =?us-ascii?Q?WQyCH/jIBqD/lDMz6hZp8PNGoMq+tGD224Cof7xEGzNMvTKAxBaIkyoDXH4C?=
 =?us-ascii?Q?zd+ofLO0d1l6PYKO08XiynS6azhzPQuONUGU//4q4lPRDqYUWFBCNrwI9+9H?=
 =?us-ascii?Q?iWZai9d971JfKnIz1+oMQYG/NeChFaVAAuaQn54y4J4dd6cMvdfzj7TTEGGl?=
 =?us-ascii?Q?eqk6+GV+bCXiXU4KGZ0c0g64FWng1J+XukXYrZNTfnYjorfbpYXJwU8FoVT8?=
 =?us-ascii?Q?hc/TwG4yMTyxB1UgszbjbjP1ole/J5MaPEohEhbdDZV9w1EtIUUOBHLi/9DU?=
 =?us-ascii?Q?3Vsih8+tmVRh2VlH6u3Vu/ZxvIb+5OS0xYldNj9TMs31yYCbZPe4NTYgwCHz?=
 =?us-ascii?Q?ExeAqdfMuvtBJi48C6hkZagSYE3RPaSGDTFD8pBvVwFhRGfPcffn+qu7s4cw?=
 =?us-ascii?Q?cD4Muk9H7yipzKuinEOmouLQG3w81W8qZ28efjnqllovqYC6RMVWAaD9QDsY?=
 =?us-ascii?Q?vWBEyhTa2sNMXiCp6tYlpB8fsBfXCKwp9/cJWEcgk/PDNeRZVMSUxOb/vgnN?=
 =?us-ascii?Q?WAP48fmpSK24FuR/16/u8J4vKZznDG3RQm30Unooq6/CIUNlyPAOJZnR3W4t?=
 =?us-ascii?Q?y1G0Ktjhku1+IUGHzzuZR81OK7bK/RMEJqqVTqdUxSpQaH5NqoYcvXXYAxXG?=
 =?us-ascii?Q?/HVRsC/4ODPvcp5Iy+rFAe5pb+JQFRdgUOXj1wRHfG+Vt8QrJCSE29nj+TVK?=
 =?us-ascii?Q?Hp0KkNTDoDxqMM21TpITRyduLvegNTeCBBeC91w5MHj9dtqlsuwVLIXR0sGM?=
 =?us-ascii?Q?F3TIxxDKzbv/Vxf+t111n61iq5nmPYUIJ9M7uEkbE7zuQJs2ZehQ2f1Ov78x?=
 =?us-ascii?Q?CN5euyz4FOXEvDrlL20JMdClUIfLPt2Ur+oSNvdtL9duP0Sjwr4qliv29f4U?=
 =?us-ascii?Q?94te0iv99ofuW2FwMckl97joqKIWxvxNp5svaCFAS0EKcQRP/HenzRDedHo7?=
 =?us-ascii?Q?MIyyqr2lyqghJI8brcZxfCQr5UGCilQZFSgE6ikyA9m5U25d2DN4zKWM26JQ?=
 =?us-ascii?Q?0p6jXmtkzjaG7VfyMrXeEuw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32bd7d10-a781-4aaa-dc79-08dbbe598c42
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:42.0229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7pj2nEDPTAwAs4On/4r8jzT4K4D65/Kk/zwwhF5eDArTM0BqaRqKk/p4hKPnSNMiX/IGba0h1CXdInoF6Lej0glYYzvdLnWqY1lHroWM1Nb6Ke0rGNhGE06I/CaWjJ38
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: YT3H2W7GHESYOXGEVEBGHFNS553LLPEE
X-Message-ID-Hash: YT3H2W7GHESYOXGEVEBGHFNS553LLPEE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YT3H2W7GHESYOXGEVEBGHFNS553LLPEE/>
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
 sound/soc/soc-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 2362c282ec8b..ba4890991f0d 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1706,14 +1706,14 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/*
 	 * Many topology are assuming link has Codec / Platform, and
 	 * these might be overwritten at soc_tplg_dai_link_load().
-	 * Don't use &asoc_dummy_dlc here.
+	 * Don't use &snd_soc_dummy_dlc here.
 	 */
-	link->codecs		= &dlc[1];	/* Don't use &asoc_dummy_dlc here */
+	link->codecs		= &dlc[1];	/* Don't use &snd_soc_dummy_dlc here */
 	link->codecs->name	= "snd-soc-dummy";
 	link->codecs->dai_name	= "snd-soc-dummy-dai";
 	link->num_codecs	= 1;
 
-	link->platforms		= &dlc[2];	/* Don't use &asoc_dummy_dlc here */
+	link->platforms		= &dlc[2];	/* Don't use &snd_soc_dummy_dlc here */
 	link->platforms->name	= "snd-soc-dummy";
 	link->num_platforms	= 1;
 
-- 
2.25.1

