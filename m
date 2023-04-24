Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD86EC3AF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA4BEAA;
	Mon, 24 Apr 2023 04:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA4BEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303952;
	bh=SXjJjElwzg3jRLdkNOevBK3f3rHsMuqgQXgfXyQhd58=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YNWvyv86cmtoIJt9nLGZb2/B8+V4QRBgJmIvHbIzRx7FNiewSHC4nsxm6kpaXJd1c
	 eK/EuZVubxnKb/Ex8TwypK/N2HbaYmbeVr/iNcCpwoXGy7fzeWGzls/lUSkmPvd7bC
	 jsjOUzd586GIMym3gT2oxuMnjct4Bil28enegFq8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54811F80558;
	Mon, 24 Apr 2023 04:37:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6286AF80578; Mon, 24 Apr 2023 04:37:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4BE4F800AC
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4BE4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nlreagQJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkIR/X8qUWZ60hmBupcpPUOl6l5k5UOfyXgftwEl9s3XJbZ9B4l3sKHG/nqLfjcgsE4olBoFsSGSUyJ7hYijBEIi1X/1jMTA72s+5aWpgCQYh3XUhagoOSjPWJ4FVYzUsMku2Sy9zI4F5htmyfuZ6YootAzl84GEvf0jNIpZZ6WlkyaN/pZEZWDwMSAgWpxumTbvW4Dsm7hUzxMOtfhH34iOon0hLqUB96VugX86Gr2FM5CBQn2DyZEIcLnsZBmRMkmScFh7U2bhOfAd6p1lfmxEoXI4VfLU/k68XnG7So6L77vMhLS4jmVCXhW8oKxqIuxk6caow5YH7LzJJHfkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD8tmtQbf7+Qhe0OrY/P8Xoy8+nvxwkj7ybhU/6O1EY=;
 b=Sbb/oy3QI0d+eBVtw21CU3epA9MZHSB8/kSWo1Rwb0xbfdZFJCU/xVIkUCyRwz0XAwLP9uKaBZmjEuNvPUa9rQKpqp+QD1c0eTxwdDBUuc98ti+3dELOkI1i1smTw/SnXjyE+wjRqVsD26cnGA0XK5g7dZIYkrApr3zLcB2a/VAG80VumxGqcee6JDsUVohDVo4ip0PoPwgqeMNfjBPOI+NSTXL/O9CQ7DpAdBQg8rBw+ZStYauxOIzJZzZEXVXhXpiQ+wSNDpc5sEybvq6y24a1IBlmUwpw/NSxYs+KwDSnnVSKIo2C4fe1jwqXll3r/FrZB+CNrz9opKTKKMh9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD8tmtQbf7+Qhe0OrY/P8Xoy8+nvxwkj7ybhU/6O1EY=;
 b=nlreagQJvNiR8BGFdmCQSk9Xbiq9HfoGJrNYpKnBDn0khuDOrvtLXeiE6RCa5R0sKJI/Y5QDOTQ3BoQW+Ho91Jdrzq0yVHXE0Ov1un9vZy16WjI9B4ynknf6PwSVhI+ZstfjLBH9imlFe0YOiSDTEZINehZioTjFl0Rf8xpdORk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:37:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:37:06 +0000
Message-ID: <87y1miypim.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/13] ASoC: intel: avs: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:37:06 +0000
X-ClientProxiedBy: TYAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:404:14::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5cc075-a844-461e-cd01-08db446ccb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y6+UVujoi9qxKvoQrl8UjrERivBgXoSFymzehhuANnYAt7oe/C8Ki2UJSn0hKyc+KumapLnjjyfRAbx9NnA48bJ0AFXtrcMw8KExXGK8zi1QgGlOeFwldnvMRkBDfpfN5FDLb+zNO9T9SPNgltwY11Mq1Efdf6mAK2of3h3KJoH7tHbC10aCRicxCLIZFz3Rcyxb4Zda13Dh5uMdMoLTOo8VAN+PJwFu7c1gAT4GOAjeTZXeILb6EWX1L8s1+xW0AlaR/TX5XljkLfcawfUrmZHLlObmV4RmoXckuTWWlXPA6e7LhfVpozxAvMnNIbxVXQn3apT783xbuTjsZ+QmBATGG2VzsZbM67MOzUW86KvqpdvVUPhLpR0F/l1MZEt3wvwjFL/tZeVsqnFuMg7S0QJMRD/KvoRBrAei35xgdxRNpruqjjGqjgvIo3ZsvHabbugIc4x9kewqK8EN3+SMnojfrDAgkeCG2mD4vlh7bGMKOoGAY8Dogmybutby2wzcMcVdT0SVshqLhFkmCENnqSOG0ppT4bOL1Xgi2sCyE9mVW8fG31MCE3wWTWQPiLunQ1NDMI58PIkRMuXdIe7z9Ra53H9E02K+6+I3FoSA0QAugNarBMjP1en/jNDA8pG+2MnTRKMjfI5e3rVAPWe7bg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(7416002)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(921005)(6512007)(26005)(186003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(83380400001)(2616005)(6506007)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3ZCqNMxQsnivPRT3X8ZmGCfXj7Bn5jpNa4mvnUlcazjDhmRmrEQlunFMs8jn?=
 =?us-ascii?Q?5juDYWptMu9vUKSNTTn7IYPlPisYH4MRbXaPiE0okMfY3kl/4Q6L9AQ1kBaw?=
 =?us-ascii?Q?GxjDuRqUdbNj5VRST0S72Zh29QAsclLcEW51I1crMz1t1gXEGuQWk3zepz72?=
 =?us-ascii?Q?RbcqlsqmIBLTy1J9mbhzS37oYTvKHodDiaf2uDk2bZgkBg5HP2/O2UN7xjcS?=
 =?us-ascii?Q?+6zMuyIfRGkrzOG+sjVv5hCmgpofqJPkbjFNQXioOMlh6QCft6Iz/mPi7kwU?=
 =?us-ascii?Q?NoJX9e0/benp5eY3dng4Cy6RmuXAMxTPa5mg4aJ008uUDPhNAF7tmjGFdj+t?=
 =?us-ascii?Q?kkTuNloMF3wu2Rp72AvNfFLZC3jznhQwbPoVh9BTbpo2OIU4jKr0egPIHIlj?=
 =?us-ascii?Q?2d5TGmrETVZqXRw8x7SeYDNJGh9SqtJZhurQw0LZkCJJbUJVsGuzR/f7yVhQ?=
 =?us-ascii?Q?qUWEJAnQls0M/0Ouwmxhv39rFHtto4UDoAPczTYBrKPMyky/P1t7pqp0YE8Z?=
 =?us-ascii?Q?nOzGKjfkQPgA2jDPkRtu9dj9TY9gdSUkcQkMCPK4RXIQgxtMR94RRXceWc3G?=
 =?us-ascii?Q?iLskZVvvswo+WZbOXvXaDtRBLljQpF/MkyfqVZ/FFnpreFD5bVgb7qDSo2gg?=
 =?us-ascii?Q?nTzqgWYxBRRQopJlTDwwfYxU2YQnrRqkH3X4u9NvAnWeTomEEHdwCFxpWcl1?=
 =?us-ascii?Q?1HBo4w9WVkKl2TuTm7p5CpypWbchnbWUjbtxJWbnBX/Ik6zvhaFSpV9fWuc9?=
 =?us-ascii?Q?IrFGhJ0uUrvvVYzaCGRP9k0AyfnkxrtrpKBeaFqbLqLp0c/zIxYeKI9moJyV?=
 =?us-ascii?Q?bcHa8cjIE042zDK3fI9Ej41kIc48ryLq+CQeJy3RPFkN0QzfdgBjIgUhBdYl?=
 =?us-ascii?Q?zvBcGU8ny+8JhML14MEnMCo3omIqxQ4WoFjgVniQvsgm4bJAuMlP0u7p0LtE?=
 =?us-ascii?Q?yt/FJ71UQW+KipWWzGBQOBjMjp+6DkZCZ86rIcPVT5sjOG+gVh1ghihL37wK?=
 =?us-ascii?Q?gCLKEQwM5yXPIag3ylS95cPfECX2P28roJf7Fsa7QwLzFVi6bAGmZr450R7S?=
 =?us-ascii?Q?aGuqBLCGk53eup39YIzliXLntr3w//R9I9IsHhq6szXf5pLqzS/iJT9uoOqr?=
 =?us-ascii?Q?njeApzClW1cRztvrbj/Y7YSHxIN8P5DOw129TC/nUPK6uZgSnyMV0ESLcA9h?=
 =?us-ascii?Q?cpRZBZjXwaA9pA1RSOPAiSAMtq9FH9Ci+FNkzfgMP06BH/TgqqL7Nclh9IqG?=
 =?us-ascii?Q?0SJzGWmvs5lyAR5AU9JpcIKVL2MfIbK/2gt4iHcOzB1lANnL7SY91UQ8Ltjf?=
 =?us-ascii?Q?Jne4esjJdGmGy4tIGqoG/GQ35F6/Ikxmn3Rc/E/TQ+ZIrm3p82VYvSqdrFAM?=
 =?us-ascii?Q?Fdz0Naf0kgoDRBXt6O0mWGZQsfrFjSuSU31obB9OwtMy08HgRm3ieqXw54Sw?=
 =?us-ascii?Q?vFltZs//hUNpNiXSmKNrBlQoQRERKUgDTfXrArnAhDh1Z+V/mp6ZvJKjMTRR?=
 =?us-ascii?Q?k8LL6O1XRkImxbB0EiqlXxFANXrfSheybv3F6Ccr4Abxbx/PAVekPahduKG6?=
 =?us-ascii?Q?LoSh9FNjjxqxHqXrr6oko1fNdLc+Uq0ryyzWsi8Kbc4VBfiz8/sVW4H4ByJw?=
 =?us-ascii?Q?CFv6knkAa715yvMdGkzJZE4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d5cc075-a844-461e-cd01-08db446ccb69
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:37:06.3719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0Isfg/IxFBlzRcVmIr8l9njuOd+OSyXsyXx17Gpz3irOAhfm/MTcmGWAQ5pOOlUTTr95WsOOlyzV6R1i2Szo3Yf2nSCZbzg2ki+8jB9C8GCAP27FwJPbN5bkDvxSEH+i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070
Message-ID-Hash: JY3GO472YETHLWPDVVVO3XIQEABDZLHZ
X-Message-ID-Hash: JY3GO472YETHLWPDVVVO3XIQEABDZLHZ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JY3GO472YETHLWPDVVVO3XIQEABDZLHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/i2s_test.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 8f0fd87bc866..bc3065c6ceda 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -28,13 +28,11 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
-	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
-	if (!dl->name || !dl->cpus || !dl->codecs)
+	if (!dl->name || !dl->cpus)
 		return -ENOMEM;
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
-	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "snd-soc-dummy");
-	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "snd-soc-dummy-dai");
+	dl->codecs = &asoc_dummy_dlc;
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
-- 
2.25.1

