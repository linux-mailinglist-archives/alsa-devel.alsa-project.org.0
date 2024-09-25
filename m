Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA69869D4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBB3F84A;
	Thu, 26 Sep 2024 01:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBB3F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307738;
	bh=gb8047m6aUcDhBvJPYS6TSjIVhl4bb/0b9SN+1QCZQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZARWVj2uDlLfedUq52ahSS0zif3Q7ey40TXI0TQXopSk4iEU0gzsww6T1pXXnhmhU
	 1c/POJrqc7cuCJpFKcdbh9u3oS2VJQz5LFtYJhtTAixOvMAu60IW1vjX0BeneUikqh
	 RrHOUsNj2yQ4UfmOCZqh8Wb8vIE5rZFB9UvyOs8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41F07F80642; Thu, 26 Sep 2024 01:40:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05365F80642;
	Thu, 26 Sep 2024 01:40:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896C1F80656; Thu, 26 Sep 2024 01:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FBF7F804FC
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FBF7F804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YOjP6+g6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtsyArgRPepwmAkvbKLeD5K56dQcJpLintrzN1N5dcX9G62nEM66YDYW9/RsRJ+ajWZelNBq5yRzavmiyD4gII60RG9NwFZyyTiRMbzi1LqrrNt4UkQg3CQxCWrBdWWytwUjLDua2Rkz1QZqsPIgNWtOXrKK/OT0Oeiz2w0uYvxm/J74Op6tei7nI5AjafGYQLVdTQ6cL3puLUCduJgZsSVKBiny0Ka5FBSzE6qlFNVzB9xYVuZuDzinuYPtwbcM2xW2Xv5TjjB/vmCuWlQA2b4zRkwKRczyTfSzRuQNBjAh4hjkhb94ugvm8BGW2Aqc4crLTNSuJAjo4bx86UENpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=j+6ePy7e8HVN1qWmaPB1GxUh0PqfcKOR4JXx6HbvkkkVigd4GmphWjv3fVVn+dKE6ENNaTN9cTybNmzjLFv8LPQcZbL/zaHvZcTmAivLtNM/8hzbxFLK3dysI6vvytS9Aha5E7876yrosxqzm4i5rodOPpezpWUXs0jYcKHvBhZkESALkeEoP1GMAYKzYvl+gxQQfQY+zS7Ms4qkQlXJLoUwyI57BBFTytEqoqilO7ZbwA9R8OGY6h0gcspjFTuxxItWuITI8CAMUmmGIAmxecRjZTk98hdn4OB/p3sSUjKJR6PMI7mJGmBkpFa3tLI3NgLPy1JdHY4yOpxQYp4goA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=YOjP6+g6GT6zeu/g7FgV/lPIuKaQFO474gJQdNpuiAOCjao/LbHRjnYkLebfnLZWih4UNKkjtp3cwLTbJ65CCQdp08CpalVFhV1Gs4ElxV/dRqprQ0bBWG6gznurK3Vazqdh7mm5K/tS0qEt8ff6BGCuBwLZoQSFTcsGu/6n66U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5759.jpnprd01.prod.outlook.com
 (2603:1096:400:41::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 23:40:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:40:20 +0000
Message-ID: <87a5fv9uaj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/13] ASoC: doc: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:40:20 +0000
X-ClientProxiedBy: TY2PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:404:a::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d1be95-f850-4394-a8ca-08dcddbb6b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VT42xYixZdILca+x2QHeb0HpC27YbfwBea6rStjzGjZbp1jQOcAkPELj5VK5?=
 =?us-ascii?Q?78oeh2uE6nG8K3nbD0yTp7GyYHludCYu4ag9/oKaQBE3zfUBszealiCQkM/u?=
 =?us-ascii?Q?JkbaHyhMI4YvT8ECEVNnBci6Ig0W+HqOBG0eXA/QFj5CRVTSH9hoGNN7pcDU?=
 =?us-ascii?Q?L2aPebWtphKLXeqZ2cKSM8f7RdYhjjBezhvR2z+hN3Q7tS/UXJwBBZFR6YgX?=
 =?us-ascii?Q?QEpr0RjrnLos5mLKtcohBgky6pp4MNk3xp3XUJ+jJD3w6kO1zUTB5hXcKrH7?=
 =?us-ascii?Q?5A52F5JdLACqknBrBAcgM9CkxQUzsqzRoluJ06LxbLxEbSINpr+49jLY24Co?=
 =?us-ascii?Q?s8EkjkRgS/7AqbNWzecAZS5fUwatfhDS0X5ghxxIlfMTlu3+S2Xnu8sKhGap?=
 =?us-ascii?Q?Jm0eXB9HWX6D5GaElW0r7Q1AuduBKuvtf0ia7FIswp35tVNI0maPlCRrCbOF?=
 =?us-ascii?Q?MkTnRPhpi26ijKl4i/COX+ZTaI/tvfFDbYQIJP4k1v5H35I/lBNPXei9UqtU?=
 =?us-ascii?Q?w4RM1ByIQASw+TZ9JsWl7n6/Cr8AQOG65FhZsES/+6aoEJGO0IXIN9OMf6OM?=
 =?us-ascii?Q?/2+OixU/SG/QExG23oURD8epD4+3w3gNsdBXoe44DeV62L++fabKHLRTf19L?=
 =?us-ascii?Q?dHF53KbIqYr0g5T4/6mzbtQ3IhXUrDZIrbGBlm0dqrIW/IHXEVTTRGHPbF1M?=
 =?us-ascii?Q?lg8Eg9IMKwOd8JQO7FduCiUkDN5J/GFYgTR5w5mq1W1yx0GxUVdo8eA/C62V?=
 =?us-ascii?Q?AFIruF83pCERfSBF3yAk9QtIB6FOetkuG6mc35b4mcsRFhVtAF8FeCtY1yWZ?=
 =?us-ascii?Q?AJZXdJB1e0okG1aZeFslyjykVvRKmPnzGinwxYJuELbsBkBi4joEXWLBMDK5?=
 =?us-ascii?Q?ajPr963PFMZApjxORjgDBdLyBrYHXsjf0HTa3oNi4oJCqkmsdBZlGatUQ5CQ?=
 =?us-ascii?Q?zaT86rwI72qBSNm8WPgZRNoxHvHFpuQDQJni7+el4SEcrvT3EX3dXtDN0/gQ?=
 =?us-ascii?Q?ORyWwDNDkHe0TeVr3BqSfhWDH5v4m+B0sFjMU54ZOTALVqK8EM/jS/LTvYnc?=
 =?us-ascii?Q?8EzIz51jnliRBKJy7cXRg7i5+aq++vjlRUJq11V93qA1PFFKNTGxlY/iqRUo?=
 =?us-ascii?Q?5cPpnWh7ammQcSBtixMNYHKCnXdfAACsyq7DkEDyPsIPm2O6/jHWTDle7chx?=
 =?us-ascii?Q?x/mzX72nrwUTSWxZANr8RLzzwH4LtIhwvYWSQQjoF9G1gj5B6WSCeIH4y6D0?=
 =?us-ascii?Q?CHxVw5FhlBzWDmsEIflPJ8pfk6Z1JARvfc5Q6cYZqF9z+kcAsoNWlmlG7BDh?=
 =?us-ascii?Q?NTIzG48Y1bnWxY5SkJDR75+yrJuwWMuic6vILZ1Exefokg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y3axYIo6es4IkUBnhgRbdLxdwzQC6A1BmaeTPF6vMFJ8TMhkCCaoa5vAT/M9?=
 =?us-ascii?Q?RsmuhVwqVJ+VCVSqrg8m4R0S6411ADJsXt0LonyCQ20YE362WaoZHAiKAsik?=
 =?us-ascii?Q?5ahlfTyUVM6dtIHh3OTDFYN+bLyRCFpJ+pml90eUTRkcWta4CFRDORWfKVcl?=
 =?us-ascii?Q?Hb513ZXs1tLKyaFEo8zZaEmRYrfBP/rIbfr5YGNlsf9JK+/d/HgdhBOmDfeh?=
 =?us-ascii?Q?GgNqtFU1mmIm7/YWCXHDZyM2Dn9BusKCXuJBEne5gnjELL7tzLIT9BVCrbKq?=
 =?us-ascii?Q?h6BK/Rczm8CpEO8dnRYmqDMAoELRK6OoILwYj07a3PPRLlANCeLszc6k1sEp?=
 =?us-ascii?Q?AKVYuCL/P3f4xoOF0pFvpTmTNlOtyMN1yYlXsa83EUMp9B0yTRi2ODPxU2iY?=
 =?us-ascii?Q?G9KjXn8r8aLJ0VZPgyuajIjlC0InuxF/ERo1EUzziagRtX2eHoKBjn2uTgWi?=
 =?us-ascii?Q?tv3OjMZPAf+4hyUEQbHl9+SqLJV7bjY5TPVa/vY5ZaUdCPmxvAF5YFr1FAH0?=
 =?us-ascii?Q?s8mSmHNxYNjmo6xV7ENUT5cSUHrDxz5k26U4KeklEdlSKqXxbDWm+SvaTqjM?=
 =?us-ascii?Q?Pj8XhFSStIP9JXO/3BraepVMEc/gflfQ6131B8vdiZC1LJwk/3C4NLJggv5J?=
 =?us-ascii?Q?kuMvpJhvHfnpnJEyvO4K7GfWw/Q9dwK7w2uxOU4SNyM58bKjzU8chxVtJFl1?=
 =?us-ascii?Q?QEKb86/lqgxAWpyYeG01BrECt+XwUuiOAbqKJ0T3HLkb7OIPZ2/a8F6Ilgvy?=
 =?us-ascii?Q?VeU7EPMI4240FYWAzaZeC72OFHLrgIy5Orod0NwNbDSX4jeVIkGWyZfQKwzp?=
 =?us-ascii?Q?nOtQWre1TsScmkQoKlw78L3EmUc9OrdMF2dTFeJOfo/Jt3bK264in2ex3tso?=
 =?us-ascii?Q?JkoHvVYKbYjEe/nDchGwEuBRj4vR4Jz+nSxU/yWMc1soKIK2SkF5aIKOL7Eo?=
 =?us-ascii?Q?SxrEQqSPfzpnPjRG+5i1D79recMqyXWiKW/Cn+DR3/mWkj22onrcyOVgdNHm?=
 =?us-ascii?Q?VxVbb7C5J6u4o6pIrazXbHWiYMMwmCLucjeYYUO474N/FZgfTStAacitLbxN?=
 =?us-ascii?Q?zhdc84GnVCaIFY/X44eRRQMLOZCiCy3dU5wqm/90YO2DSjGAtV5RrkM7j749?=
 =?us-ascii?Q?p0ti2l9TLRXb+geX3cQO7Y6ndxx4cDkuxyPVPnp9FTwVGz7jSoM7KQsfKR82?=
 =?us-ascii?Q?YWS1uyfXyCSAC38rVKPvb3U37uL+fvtLrBUbMNivj2ZK4tbvSqOfca4Efdyk?=
 =?us-ascii?Q?OvuptzShI1jQYahNYBVaJ3SSmi4xlMB5VSR7aYjRsoNaNheSVCq89+Flyws0?=
 =?us-ascii?Q?zqJerOuiMQbxCnd3OH961Xyksv/qMOaDC4RERhp6ht5tjzGdN1G3ove3yKEC?=
 =?us-ascii?Q?2umr8xqTNXfU/X2VnRCOMbfh+VrhgQPGHnZKBStrrBahi6KZjuA62wpTxhMg?=
 =?us-ascii?Q?XF33GtvZ6VO0mIunBx6PXuFhuiv/3pJz8hp9RuD1o2LETBogcKd591PtzCBh?=
 =?us-ascii?Q?PbksT5Js3orR39j4KlPux7DXw7uajkPZrh+04IKSn1TdV+NzZQ/PH+TIgWHD?=
 =?us-ascii?Q?4SN3ztv/VFhte5yxxgSxz9odyMCKfipA+nPbPWuSusjPZNsU3BRX1ZAIw+nm?=
 =?us-ascii?Q?2I0UWerNvW5gIvhMRDymOQs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30d1be95-f850-4394-a8ca-08dcddbb6b08
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:40:20.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a73z3at2KrDaMC1gJXifzk/rP01PZdyNPVedohcgAEiEEGeWECwcrLJuNMFbmYYtNXt2FxDjwFfArSg0+RRTW1WpcgmC9OoraiMlYFGs6wIv3fr+arDSlaofiE7SUBXM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5759
Message-ID-Hash: IYLH4P7XHXZAI5FXI3TRKJHPN7TVY7ZP
X-Message-ID-Hash: IYLH4P7XHXZAI5FXI3TRKJHPN7TVY7ZP
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYLH4P7XHXZAI5FXI3TRKJHPN7TVY7ZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 2d7ad1d915043..02419a6f82132 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -157,15 +157,13 @@ FE DAI links are defined as follows :-
 		.codec_dai_name = "snd-soc-dummy-dai",
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
 	},
 	.....< other FE and BE DAI links here >
   };
 
 This FE DAI link is pretty similar to a regular DAI link except that we also
-set the DAI link to a DPCM FE with the ``dynamic = 1``. The supported FE stream
-directions should also be set with the ``dpcm_playback`` and ``dpcm_capture``
-flags. There is also an option to specify the ordering of the trigger call for
+set the DAI link to a DPCM FE with the ``dynamic = 1``.
+There is also an option to specify the ordering of the trigger call for
 each FE. This allows the ASoC core to trigger the DSP before or after the other
 components (as some DSPs have strong requirements for the ordering DAI/DSP
 start and stop sequences).
@@ -189,15 +187,12 @@ The BE DAIs are configured as follows :-
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
 		.ops = &haswell_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 	},
 	.....< other BE DAI links here >
   };
 
 This BE DAI link connects DAI0 to the codec (in this case RT5460 AIF1). It sets
-the ``no_pcm`` flag to mark it has a BE and sets flags for supported stream
-directions using ``dpcm_playback`` and ``dpcm_capture`` above.
+the ``no_pcm`` flag to mark it has a BE.
 
 The BE has also flags set for ignoring suspend and PM down time. This allows
 the BE to work in a hostless mode where the host CPU is not transferring data
-- 
2.43.0

