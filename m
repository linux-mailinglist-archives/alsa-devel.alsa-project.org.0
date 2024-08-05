Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158129472D4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21EF4DD9;
	Mon,  5 Aug 2024 03:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21EF4DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819779;
	bh=6rdcYnuY0bGVLBKs+kUhLnWK/315W4nTizK0dpx1Sic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PM4yNKuaCA4LkmQEq/mfl+GyPo8zGZJxP25/1iANBBWO8bb9TA2RBxG71bSC39Dod
	 MMESACID/9nagrNRLRv1KjfQPBtV8nPiHu4x6UuszWcmYH8XLgI+7s12N17hIvLvcI
	 3U17LwvepAC2MizK1xAEvaN3AGxqpmUiZm0aACcM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5639F89DBF; Mon,  5 Aug 2024 02:43:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 783C3F89DCC;
	Mon,  5 Aug 2024 02:43:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ADEEF89D88; Mon,  5 Aug 2024 02:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB886F80C87
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB886F80C87
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bW+iltDs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0Xsa/NqZnbCXj47F480udIpS39wD81GYuV4cPNACfbkR2egjfivVTKalepW3tUcmVxwPjy1wPfy0wMLK94o90zexFx/vqM65Yf99uo+PfSRFqQv3LfKmHSal5TQ730TX9cAMfU6hLJx8M5fuAXG4Nx/67hLaWbcAlHzg96t+SFe8AkaTYT+PJyytQZRvpW4KbG8/2anRUwuIydcOkeuJYkwm9u3cTdI1fMN2x2jPgaAo4FVkkqwzS1so1x4bW02KjLKVkF2pkge0bYhY5AsSd1Zp1eUZW8gR7E0fsdjIZAfMCaRhBsCOmOLdHJ+ik2RsN0wdOxs9DLxVYhqrZfl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDJXe/9zg8fO4KEhqRvLKCtYhFFcnAsHTPvjuYoZwIg=;
 b=YT0fZwpA0gvZ48l9ibpAF/iu1JICNllwO3ZMUK6F0Bq/B+lAN/WkRDIoNEiDsrg8hPQMb+lUCSOpVc16I1h6WUmvCqGrnpe2S+L5UzL4IogZVYYJMnkL09nzs5TQlhhO9TzOJe6B5yizhc7UYYi6uaE7M4K98yVzK/AvtGpDJawvGdwSuEygIQREZBLWGCRrVyLI0HaYduUcVJxmKUX6Lui4PSEvKidBJrYsdUvLfyMJaBkA4mqks33R6hqtF3vKmVvvwPSDfRa7QTt5uedbswgSCd3UBzhDOoesbpuZaIBPw2sAI5cD9mK0/+p6qIicwyzPYIVX8l08Qs6W2U1aGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDJXe/9zg8fO4KEhqRvLKCtYhFFcnAsHTPvjuYoZwIg=;
 b=bW+iltDsYPMSQ64dRFC8wKVr6HJ7QX5+/DHUmAe9NqUWMHxGU1j7viNtB0pzEdamErCKY6c3ELCoCw5ydXkj8uR/xZuFBJkrcoSvnevLgQDuwPmdLyHFN33fTXh9PAdrD0rzi485QfJFh8+7tPdA3E5iMro9NHNvOG0yUEfY1f4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:42:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:46 +0000
Message-ID: <87le1bx0jd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 088/113] ASoC: codecs: sma1303: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:46 +0000
X-ClientProxiedBy: TY2PR0101CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e4c84b-efe9-40a0-6c23-08dcb4e7868e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KM/cAQF9ECnOwr9LmvmqKZxzu4UHCnXZwrzi3+XQ8RGZJjYiLXTjjTDDEYpN?=
 =?us-ascii?Q?MrQMc1zrl45+STeT0E8ubl+vR3JTWyxU0ZMFm8AZgqxrJga72zT7r5mlPrKu?=
 =?us-ascii?Q?plO76+HtmCax49qhfhi57B1EmRFJc62/5RQKykCukkiGHvEBkVOK4k6+NGjy?=
 =?us-ascii?Q?1LRJFai93hZLWgCdIjv88Fm/uP32NNrhjLtI9Q6pEkeWVywG5OXJuEZyG2bh?=
 =?us-ascii?Q?hSRHswWgSCpNd9xFLvt0zXPxPXI34pqoN5awlFyOG9l5op9FmIOXau0d/w5L?=
 =?us-ascii?Q?qoLJAeqk7URTHIPC2z+yZdd9Ab+dxJJvEtJZSiUlQY+W3MjYSS90sFVcfxTd?=
 =?us-ascii?Q?bUy4jxn0O4uCpzorp4DzdXzsA2IU2aers5fbWR1piTWAZkgMhc9UNYPApgpA?=
 =?us-ascii?Q?rgVnRW+I5Av290gtjsI9wEfhkaaP7G8fnNKUAB1Jr1qpFhajS/HkQKvVmBnK?=
 =?us-ascii?Q?GRRrbsXw4Os+rbfReHfBgRkr5mJeUXUjCTyEgmzqt0uaDS4dbzzCvSjZDj0D?=
 =?us-ascii?Q?aFkiF3Xqf8wu+uxle9+u+l9mbuzvNZYKrojEjzCXzlvWcrH2YDkA9+TiOA/3?=
 =?us-ascii?Q?2MKUqVQiOSwcSajxauW1l1jp1g5Jyo3FVeF/VHIshzpewjICmA9xVmwqDEFj?=
 =?us-ascii?Q?zM9pNFWIIlZPJQ+YsKMzTSnMaai8f+ceqVEuhSzKwaiPFlpzPK4BiCEPWE99?=
 =?us-ascii?Q?GYr0EnfqKEQFoWTeCGY+YvMYl2ZBX0WR3z/FEIRq8M/tMHLQk9uyg3/EI+Dn?=
 =?us-ascii?Q?KutEaWtb1kpetvyNYH60wVtIevnu3WFm2QYRylaIQ92AwCUmi2SPfV2KErg/?=
 =?us-ascii?Q?ulC5cB798lT6BbXF4EoEgEfJuEVQX5PbpSXV4vbvwD0F52Nd0n4vFePdLj6f?=
 =?us-ascii?Q?7Ul8jBG92fRsNsMN3x1HuFMmTQvGj9bY0HL2mb56GGsNBE1RiQ3kJVoXV5qi?=
 =?us-ascii?Q?bPRRjTFl0fsE3V2KcftSl2A4XFey7Nwq7pxWVuDKOjkqWd8ugbtXr9SxbwK5?=
 =?us-ascii?Q?m0sLTqx1lBYEId9jszWtyI49HvA9q5gaMRZfoQQLxmbEZPg9w1P1EfoZpR2+?=
 =?us-ascii?Q?vHRfPVmIWdS1bZgBUTguHP6gRJRA2/FkUeghgoRSbgbZbyki3dPXzXZxpcd3?=
 =?us-ascii?Q?kqdVhBfDJ5dM2DwazC2BDGxLthIqqOu8rQy/GC6iTJY64bCNfsTitTGv7M9M?=
 =?us-ascii?Q?N1fiVX/YIP+WkQwQ1eaTHwZ23URtHELPP1/IHIqRUXMyEKaw72X858QCzq5D?=
 =?us-ascii?Q?dIi8qCqWi6Ckcy3xqCeWwrhN5g5orQlmo6S7ORHGIyBLjChIz43TNqxF8pfZ?=
 =?us-ascii?Q?ug1m4V1dJKvRRnNykJg96cghpd4dSrKATrlyyOSw2rrLK66QYG+1X7e+qhiO?=
 =?us-ascii?Q?8zyL9S+j3BhSLzI6LzDL8Fk5rtYOh5ORfGzTznEo/iJZFZg+YQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A851NFGDAfnBApOtv5npuKOxEG3yvf9HyNyGX/nllglS78OXaDIpwfq72iwE?=
 =?us-ascii?Q?lDMLuIqfyADshy8mzncd2Gj7JYErCMDodNx+Eib4lrSOlxLJnRnveU+LgWvM?=
 =?us-ascii?Q?krEYaX67uBjGZIeFpQdW2dVivj3cHFvaEBWLZ9Bf5fQdt2Yx1vW9LSK1mvlV?=
 =?us-ascii?Q?B7FUcYH37SG3iTLDX3a7Kcvf22wulk2I/3behEG8KXEae3nr/jlw7zuY0dV8?=
 =?us-ascii?Q?z7z/MmXQvGB9CmuHv+5PS5JGHolo43OPqMPt6CwnGwmtvc2bi49FqZcS6EV1?=
 =?us-ascii?Q?ORHkw3JdHLMwKpzWJ2eKYPS6kBHm/urcdC3e7ZAGWSaf4gTQ24/XkE54ifgE?=
 =?us-ascii?Q?B9gnU9LeTdc/iD7KEFI0GONvj77EzONKCRipP3wiEZn2nhnUhEI9EMcXngwj?=
 =?us-ascii?Q?BxrOvYBsYJwdFoL+EmWzTEncb6XyVTAIuU6+545lTUFYDme+wUNHBZxaPPiL?=
 =?us-ascii?Q?7uigyIBswnT13R01Pnb9XWC2OERGqbgE0XaXMJUeGZGjh0HQ9umFvZdUqow9?=
 =?us-ascii?Q?9VnldAiSNCQ3ZtsQeHdJn41yAHeYlfmZhttCJOdoHegTcvIuEfrdKJrAp+jI?=
 =?us-ascii?Q?VavLnLiEsN47/txiYL528bUNMwfrzbmepfk0Uni0K1dMldyJ0k9V4e6qyt0A?=
 =?us-ascii?Q?sTbjUCfdvxuv/Gx/R593+DKlqIXILpRGTNuy1KVFBDVGRKVSuvnlbqu9N1Om?=
 =?us-ascii?Q?VnWsK12/7bOQ/Etf9qJZWhvU2MIo0lBjNgeY03AxL18VueYeZw9X1WGta397?=
 =?us-ascii?Q?Jzb/d+ScAhAlC8JoEbQQa73Ui+gZ8OiIE0QyP1DOu2gQhKwTapwR6MOYswc7?=
 =?us-ascii?Q?C6iLGARDF3+jvtIWxSwn88dnKsPPtTSJROQ0XWbUCNHoDonj5kstRQcN+fe/?=
 =?us-ascii?Q?PTk+rqN3SayGT/7lJVtHIIT9WFaqwitDgn+Pqqn9jdpEPRgni0uX6p+Cg3Ii?=
 =?us-ascii?Q?EcFyGY1+3eaY0sSm1MmscM6s1rwPJNeh7UH6W3n0eRruC8EB7VJCRoZxCpm8?=
 =?us-ascii?Q?USPE9hXFz4mhTEz40fcrYVUc+GjjuitPG772nCzOrLOkeBt+jcYdlx+Rkurw?=
 =?us-ascii?Q?ufgB0vFCogNp0128N5NA3U2SwKxvTIGl3DskptcKTHsh64U9lqpCw+EooxmL?=
 =?us-ascii?Q?/TE6EsvHnycRfxTPiIiP1OcggsUkfS2UUMHnGUWeuB7lHrGHJB8BPBF1omAR?=
 =?us-ascii?Q?/vBxaDfZ4Hcp4CfL1Es2Wdht1Y+ldva9BoYw1OiJqpZBOXqV/+/4T1bstJTy?=
 =?us-ascii?Q?M/35b66b4O2K9bl3mOojldzAW7mXkD5hP3MXC1kAZSceDXNkNz2+YKgc2Unp?=
 =?us-ascii?Q?zu7E6Jxb1DRZyrHhLTXDkYoCAiO3QpH+/ARAIrpxowtv3v7DUWulRlw1YIuQ?=
 =?us-ascii?Q?z2VTySABd1psyPE+23GddFr/QFSWGhkjYrLMFlyM9Uf6AiehbWeAn2emKFWq?=
 =?us-ascii?Q?Z8921bCQOsBvfgJDyw0/L8q4XyCbNNpU8IWVj60ElJ8oARCdamJXXrJLGpeK?=
 =?us-ascii?Q?DcRNxkrT6xFbCbd6tsikN7W6DSpey999xL/g4p44hprqJPufTft+OjgNVVVz?=
 =?us-ascii?Q?1tQS9omRr6ValRXoLrNxPL4x68STXx7A4hcrUe/P3+2sUiMmykHjZ3yJyoNX?=
 =?us-ascii?Q?K7ix98AxpUQ6mTWZR4rFaeM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5e4c84b-efe9-40a0-6c23-08dcb4e7868e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:46.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BFcv+yfizsqPvtE87+6oGSIQcsIB/W/pkgl9FmHu+efAvb1RcgzY2rMZW5aiEhuHnChJPongAuHizjMe4uvGJcUhPL3/nyi1jNIIZffc25x36B1x5Zl+nv2UAwcBunSm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: JEH6QEVSZJ3PMOKBBYUX3ATBFATRMXAX
X-Message-ID-Hash: JEH6QEVSZJ3PMOKBBYUX3ATBFATRMXAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEH6QEVSZJ3PMOKBBYUX3ATBFATRMXAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sma1303.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 980c48cbc3482..4da80cbab7946 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -997,7 +997,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			__func__, params_rate(params), params_width(params),
 			params_channels(params));
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
 			if (sma1303->last_bclk != bclk) {
 				sma1303_setup_pll(component, bclk);
@@ -1195,7 +1195,7 @@ static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(stream))
 		return ret;
 
 	if (mute) {
-- 
2.43.0

