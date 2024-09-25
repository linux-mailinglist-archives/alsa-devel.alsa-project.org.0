Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B55D59869B0
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0A2850;
	Thu, 26 Sep 2024 01:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0A2850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307603;
	bh=KwbRFUYELC4Pf9m8x216R55WQ/yk0VdTLaKEmkeV+QE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G34PWUF2iq5qqct5rRuSxdo1d597QRWXvGHgYbutH68xeAQMwQ27r0u4gTHxDfuf7
	 GrE+TOieiuGZaVyrl8mdoRrL8/VkTo+8QyCseBk4ONOq7tdSRYe/Jd63oPkE6ZGY3y
	 iNRslHYKq3ceIAsO05QaDBQhbXvVgVWIR56VUygc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E988DF80518; Thu, 26 Sep 2024 01:38:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D353F80508;
	Thu, 26 Sep 2024 01:38:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19682F805A8; Thu, 26 Sep 2024 01:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAFE1F805AB
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFE1F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=licUs3SB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYsZ3uU526N94691sC7y8pGsrUAZqcXxrrC4nEWCSmveCbYynPWTKH5WXoK8aiASX/ONrxsxmFbf9EFZa+EUHAvhBITEMr/bzyOYM8or/sRNQANxWRrrXQGXFExm2QQzylXkCnLjwKa/OchYxqfIIRDiP0pVABDmCatCMaz1Nlp3Dr9bSj6sMdACz7l7fTuYISp01iAz1jrZxqbC9krGiljHqpF7d2qgDiQ0TdYDV2OVmLb4rjqXRwIloREGx5IsEFk5WLfL3PRjsWyD0k5UfogJT/xSSwqzzBXXoLu7nXj2hMPeepim0O9oswzVq+ppWGDu1EZj4Mwu+7nH3J5yBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CXx41MjWsgOAv+6Mo9TpisGQAqREkYWXI6nCgFBTBQ=;
 b=dcR55WFMgAFl8uIoN2AMBeoGazke1vqMIhIz7yGUchBraVSn194OKkUW2xbp/+HwPbUv9zxX77GNe4Vu5NWM7dLjh7lY6/r0G//r+THEPTmXkceBAdMkDcf/uw3GH7t74lSKZ5jTtJgYca2Fj0jtBN07RDId+vmM8FbjD9C4lShIFwXQvsOOFmHMC8RalZ2FJCFrRocTRCsYIeJJK7HOCeXz8RRwT/x9ouSwpomC+qjy57WwzJeMfvH4XtcJXMwTGDWZ9/YZA637fEt5ga/c80J5hTfu5REuNX+5C+H63W4gdCY7iHoSGHuikf8eSmFQYwnSx09BBFeQsniphKurgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CXx41MjWsgOAv+6Mo9TpisGQAqREkYWXI6nCgFBTBQ=;
 b=licUs3SBgl95zl9sGb+hA5yDeQcIudd7ptRZEZI+rvixOemxmHv+hFF+7hrSjgvcF1+EKQB9mAi7MTF52mq/NDWO2UEgot9dFlWhEAM3lSKWs72kBJxMA98j7IyTIVA5SJ+VBiJM0zZSBJshs1FkeCClqqrMSakEg8sJ6MZEtdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:38:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:38:03 +0000
Message-ID: <87plor9ugy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/13] ASoC: amd: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:36:30 +0000
X-ClientProxiedBy: TYCP286CA0346.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c1ea82-aa16-4480-308d-08dcddbae1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nhBmL7LkVog5dTuoA7FDEIJeLLl0wg64WbJHbpYjKq+N1edPwm+ITkpLf6E4?=
 =?us-ascii?Q?UKxdnxS7Cc0tNnIiaG3BysMw3otRpMrPx6exawDYBpsNBLOF75Qubc2J8AN0?=
 =?us-ascii?Q?iV++i3T4Ink5iRKfmsVJ4P2Rx51Q7qrWDNKJq0+ynYM6VT6cFdJ4ySppQ6RA?=
 =?us-ascii?Q?mHCLWXsHUCwltLRVRHm2B9Uk9ZZAbSrytNvhU4VpQ/m0dUq1c5Ddg5wfQpAu?=
 =?us-ascii?Q?nvIiXt+nJfuxPUMDiAeY/7GaFRYkFVGuKoVT6o/jU77nICJDQNekHAQ/5p/B?=
 =?us-ascii?Q?cZ6/HdvDdssO2pbEnt0GuqKha/H1EVkTRjKdXhVz7+P1e1iklL55WvBuabGh?=
 =?us-ascii?Q?QUaeFjOdhOK7WzPN2zNVdZNzwMbiydgzcc89ZwAgW+mJk0e8o8RdDx5da5id?=
 =?us-ascii?Q?FCO22x19CRj3WYw11rn+gaYRcB32/8nHypC2r1hY3aITB36TJkxYWNBg97D5?=
 =?us-ascii?Q?O1mtxuQPFfnggDZFAHunRMSQNb2fMJGT27KO8bKXo0GGP4OQKB9Igp7riNm9?=
 =?us-ascii?Q?ZDJKAVQAVlqoSgk+KtE6zyOwezIZV0oS33pyxYWZWtowByZrxbV5XXIlfY/d?=
 =?us-ascii?Q?Bm3C+FLNpSI3mI0sW6BT9CUzoI6ogoT+rth9UxAMFuJfE3wvLSFlGXjdhhQ3?=
 =?us-ascii?Q?mFK4qeR6xJ2RoBdqeZhVcsqLyHOPaXiKjugE4Dg8iQWzQIneoi8kGfJ5vHj1?=
 =?us-ascii?Q?688iaII4wJOMtD6I2A8Ejkgo1EQbioHGnGuGTCf3ddMWZXNWVUj9iFC3lJwF?=
 =?us-ascii?Q?gIm8sbNxD4nuC5IbUVr1NMoaZqPMddZ6lW1kMHP5l5AcnptItgMroRP/aUvq?=
 =?us-ascii?Q?u7/9D8MbE7xhYI6of/kFDcNldwPsTXwk+cb+eLaXDYb7p1mCXhXYnJyfHHbs?=
 =?us-ascii?Q?wCQerH8az3I+aEBl83cqT7mQAXrPRMzvCw5T2dtoak6KmuAZHPAVrpOiZXUr?=
 =?us-ascii?Q?O2haSwj3RFaIvfx/MG+Am8HAw48OuLU7DeuFBfpocM7EUYl5xXp2V0zwASCx?=
 =?us-ascii?Q?roj/t1HWxyNyrfVItskGjjY6CEuLLDXT6itlS5X/GZ9gj2LdI9/L8CKaY9xw?=
 =?us-ascii?Q?f/CWBx1vNzi1JrhOmCVKi85uu2fT9nykcPXZgRqKNGh9WgVF1eXHfpgDT+QY?=
 =?us-ascii?Q?vBUhCvzccZ8dQ1StukfLnskTAH03oGbCUILWCsR7Xt2a0Yd1vcYMG4YSd2ks?=
 =?us-ascii?Q?Y0JYX/zIJuzD2E7GHx/nrwWxRXbxa10qKKvh6xSSYJ33PfUsnQFfEZ+oYFMg?=
 =?us-ascii?Q?vIhl37FnIvvo9mGp/j6Dgt/0dOLTMQ6aLeSxgKDTqAcSiyUl6URn8GIhz/QK?=
 =?us-ascii?Q?uPhIVwFaoO6vrFVaVfQLYdhgOHbphiCQyJz6F44EhHGduA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yjNJqypX0AxFLAYyUzQf3L3OUSF/h5kyUIVNYD8qu+Sz7ayKIiM4cQpXFbqi?=
 =?us-ascii?Q?I2RozLXdfhAcHGMxyeZBkghrWRrbO/hZITQHfJBFQeiq4jdvGB/ThxRX8h4X?=
 =?us-ascii?Q?nCIlte1r2R4vaZD9kE1+khpkDXrrGsABjKILR/L2HMkXmrxywmUAigtnkOGY?=
 =?us-ascii?Q?p3oZJejYnGG6HFuzBMawQcKNCI2TJfkAbWJInMwcaY0H/Y4z9vi/VEx1v3Cw?=
 =?us-ascii?Q?Fmhc0Y4vGakJIPvTWbD78N0M6cHxWttPV7n4v7jBUKpgZhu0toDs+Eg9Lh7p?=
 =?us-ascii?Q?XhNoWXJ+ifbY//6tJRX6n5/cEO4B3Hq+6a66Gt9xoj/oeuv5rljA8JTajfdy?=
 =?us-ascii?Q?8GMSWgWn2KtjNTeOfBcOc3jMiRopjd41Czq6m9PHeqGH3u4aI/QXXLRT/M8G?=
 =?us-ascii?Q?EUkGlPPPsy1lL/JPTNkyuPeFuTrzITXhHqq3ghdS8fy7cE/xyBOjfRRyds0O?=
 =?us-ascii?Q?QCAEEZ/HbQmSvBB5CCyKco8+s5jY3gOFZxqdxT85zBfJnd04m8Mifr/AupTL?=
 =?us-ascii?Q?SqlOaw9i1zhhAsEMyUj0Zch0bddAPH/AcK1P+oIExW8CGzavaMOj8SxugSun?=
 =?us-ascii?Q?PcOu2OBkcfMnarAciui97ULsiNMGMXA4GOxKCb5m+6dgilmcHgoAijFmSnfw?=
 =?us-ascii?Q?Fr3SghM8kZoX9uq0GdbzYraWQE7UT27Ch6RfTNWeTr5UB2vlgEEABX5rRg4x?=
 =?us-ascii?Q?xLBzEZ3JACT6bSyzyMGswRC3rMVRPw8LIcPkZe3MJtimqnu8tNosRMlycUUG?=
 =?us-ascii?Q?dqXyel8vuzfUZDae7850kBd07VD5WOZD41tkAM7ONwtsOTy0G0hnSspx0SnK?=
 =?us-ascii?Q?XFAk0Pz/L/ssVZF42tLIEYkG72lg+i8kUgaNe8LLe/EF8ieIiIjxgtNTcihf?=
 =?us-ascii?Q?ntMQmkCsOHefGpmE+N1kV1W/5kqjYy519yc+eMp63RNcZQbpHGtFR8ugy8DD?=
 =?us-ascii?Q?Ki+vZEHnyWjdT/wd0Fo1WuNCnhjMHIIidwyXONyjRPdFksLPUTqSNASoO2XT?=
 =?us-ascii?Q?QJS+IV3nlliOAO2h+7yurjlE+VDEUQsroLtntiHMC5eC4N/LO3ctqJqmSTWk?=
 =?us-ascii?Q?Ndy6D25WEaPXMQJviJJ8hvnu7CVa4Wr3s5QfKQQy5ioe3Q9Q/VB9OxcDdvGk?=
 =?us-ascii?Q?3NZFsOoG52SsngoysLXrccZJ5v6kCixjXrMGDtEqUeS/Q4VBAkqmgUxoCDGE?=
 =?us-ascii?Q?w0DUIq7e+bS5ocV1dWTIkZgNTa3c2ZJHN24FQlPs1dLO5Z8gpSYJoF2xAsKl?=
 =?us-ascii?Q?aKRjKR5CAHRYBaUn0CAeg/QF+k22EENx9NCyerzgW3Mmh+dX/4RFJvgOxqvK?=
 =?us-ascii?Q?AJzpzcz/9qINs2pN4D5n6bf2hgrJxT8ThOks6gyQMI8m5T+lmdghgVx1skEV?=
 =?us-ascii?Q?V6GhLzrxq7VKlzo5Y84m2UGD6hlo7Z5OBf20o3T2vlP5RxkF7GLKIordQTXM?=
 =?us-ascii?Q?iE3hXhd8JbxPtw+qJfMvTuWmDHepCm2cLBvE4E/Xej+OaQei038MyODHjNoJ?=
 =?us-ascii?Q?EKk8S1186EvDrkix1qTFCIMRnMHKBgdBwxLYqogyREVi0XRevgxKuxim1GnN?=
 =?us-ascii?Q?+UQMRyYE/JoLP1NlS9MJXuDx5+0630ND1ifZ3hUuIqQQLlFni2eA3X4JYHR1?=
 =?us-ascii?Q?ZEoExjLHR3Ks4+1/prY+F5Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9c1ea82-aa16-4480-308d-08dcddbae1d4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:36:30.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mpajQXnE4KqLNgihAl03sQl9s7F2iRhCtjttThNuxkazFV8z+drTao8EhOglz9ScGEG27XgFgrQmQE82JEZqB48+zjkuBVzLsgYWrb6WpBv7lcqySZYSgQeY3JiVhyFV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: BWWRAOM5SOBSJILBKKMRPOUROVVEZ77L
X-Message-ID-Hash: BWWRAOM5SOBSJILBKKMRPOUROVVEZ77L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWWRAOM5SOBSJILBKKMRPOUROVVEZ77L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 24 +++++++-----------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  6 ------
 5 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 77cf72082e73d..02b04f355ca66 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -573,7 +573,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -584,7 +584,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -608,7 +608,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -618,7 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -629,7 +629,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 3756b8bef17bc..0193b3eae7a66 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index e9ff4815c12c8..aa38104b27042 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1407,8 +1407,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1444,8 +1442,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1480,7 +1476,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1512,7 +1508,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1527,7 +1523,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
-			links[i].dpcm_capture = 1;
+			links[i].playback_only = 0;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
@@ -1553,8 +1549,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_bt);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->bt_codec_id) {
@@ -1574,7 +1568,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1613,8 +1607,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1657,8 +1649,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1686,7 +1676,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1724,7 +1714,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1774,7 +1764,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 357dfd016bafd..4ca1978020a96 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -317,8 +317,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -327,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -339,7 +337,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7878e061ecb98..2ca904db82abe 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -276,8 +276,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -288,7 +286,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
@@ -375,8 +372,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -387,7 +382,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
-- 
2.43.0

