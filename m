Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA03774EEE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BECE8DF5;
	Wed,  9 Aug 2023 01:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BECE8DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535867;
	bh=Qkh1c8453OM+KXw+Q/vDMo3LEPOqPHH0DJLUa5H1ah8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E5m7gH4eDjyGrQS8d5BZuvDSZmfkGOdkPXGNP5nYi3v/rOMjcuVg9IBvlRtqVSs5c
	 WvPzA4jISlOgU8MkB61Q/fYXFj6aRVBRmh6Z/By9TUVP8lagSEIuGCp0gYwB2KfNH5
	 h33Nu3r07BpNhoJFVot9sEPcqQ3Unubj+eWuewmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86B09F80697; Wed,  9 Aug 2023 00:58:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E39A4F805C8;
	Wed,  9 Aug 2023 00:58:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC30DF805E9; Wed,  9 Aug 2023 00:58:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1966DF800F4
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1966DF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p4r1bVF0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJyWyCvWoYWwdwSAir+aAaBcwcis+E3nTkpENnxOdPIOEOust2BYs0GCnwkAjQ4CztcUZlO26UgFFJZB1OCbcuTSBtfXKrZVYRyVqKvBLJQ7yuC9ziwMotG/SdY/wmMti6WN70S8kR8YpwT5wQ6nwO/M26xBdH5lXJZ3SUzmxUgCC/3oeUP7CIUFe1d9DDk0carXBAKpBKr+fTVh/6q5ozMefUbpBf8An8JRFNEfA9xeSYE0f7JXwdxD+6AY/S8in7GkwEg0x08FqgsRSHLNFFjwM1jPK9cPb0ayBwwySqQTLiGTSPRHWMFUFwVqd3X8x9Wj25s5OmLJ/CdDlaI8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKxmwBZcYUaB85lNjGOBG6/oIi9lvoKXQ6kVHZp5g+M=;
 b=Aw5YZXN5nJDi/LJ5JH5OOJ7p2KaOP9eJzHE1dpzCCG1At0dt8H7yP3XQ6r7q8DW++RCYAOQleiicTNcSkl4FGidpU+JVABp+6irGwIv21Wgzyz9TpyiNBO5kl4DYzes7tW6Z+6PSBLdQ8OBgGUOZfUcDPDO3mnk/6ZGB3BNWexeTOoVTrVc1vqpbtQR2a3RwIjcPbpa57f3I74DHwqP38KxXoQImgWGtecu+mTx7+FXyFAWNB1TVeDuRUudWUvx9xhGAQpHGontVwuZ1HTfcZrWW5IaTsRTIQx19RXRaKlPFXCZjhflRAEmi7Jfa7UsFWPI4adMK6K0H3pgDyJJR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKxmwBZcYUaB85lNjGOBG6/oIi9lvoKXQ6kVHZp5g+M=;
 b=p4r1bVF0pkE8FM0EKuPzOsFccQUUdLV+koqe3AdMtA5PejrCN2NujE1rkBiKYkrQoPkC14qEBQZDNw9aoy3LpxG+VTjkpWLTZpWUDmlRF0/WKZEK6rBcFAWv/cmk3bF50gBelcF5Nl2MsUpIUsQ6G2PufD/Ic2oTYrzL1ylNlEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:13 +0000
Message-ID: <87pm3x9m62.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 30/39] ASoC: uniphier: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:13 +0000
X-ClientProxiedBy: TYBP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1849bc-bb11-430f-72d9-08db9862f205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5iYOQrnD+0RhnXKFBIdfedxAWzJVj1FqqIi/KfUAdRqcuICbfCpSWCzFvT4h2DQSpbCX333GjVvvhF0Km9K5oNSlI/FyWvkcOJVz7V3UYLFn3yhuKkKEt5rr+XbopKib3pJCcFFVkVMGjqi4FuS8rEozH3eHRALPR6JspSDtZRScWUedkBoqzAZ9Nhebk4TRz8k1G/XnLPWNfxMnXJH03QwkENBXkV8s/NWmY/mtehMd+/GvBYvmAjFi9ZhvgT+iPTFzjK4YSeBKu4omTOlzy75orheJXb8avySNTFlSn9jaEQL1K9T9xeXbyB31hygU504XBhtK68PnVpTldUN5ax+VZMw7G5vCKFh701HzA8TIG6CoYrYgtStBbFsh0chg4e/cKqiNN3NOMc/hO9WOR5slK8h/9+VueB+GtjjrONmsv80mB1cHNkxy5Ef5F9toPjQK7wyKQFLc1k9migInF+WoTW264uphNVgRCKJjk+bjMziZ0jj1O5/Ljha13Oge7iaRo7THz38X9Bfh6U/Un+qW3sxu6D+etFt/p2oef0JUePzkGiQR+x2tj7LYgZFRPEPP0QLq+FBIAKJQ10R8bic5XDwRCzniJrc+LIWakq7glMAiwG/0oEbCPcuuxk1n
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(30864003)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m6xOS+GvjMFSUCC7ApYfeelkCV/mR4xUTkXwSGHKPwdKrn8VydIxaKAbunK4?=
 =?us-ascii?Q?1GQ+B3xkt9zXByQQjs1/a9Bpe4VnGruvZamaBhUAFkYxNC9mo0Mk/BqC+bQy?=
 =?us-ascii?Q?lQrxWYr0mUDAG81kZQeqEdPDyXwhhzPSMFzdWAJGTo/PNgoq1wD/n1O4yaFT?=
 =?us-ascii?Q?/6EV4RMmn+9MyWtZpqyOXvDtKFBCfrg04zdrqthQYZ6ktiTQfvTT+k/J0UoR?=
 =?us-ascii?Q?UzEwndpfe3lmRAMdv3XymQEecY0epTgn8wm9d0wRZx2VOa0sB+DDuKb+ZrPq?=
 =?us-ascii?Q?D2HxFBs+FsSQYhIxSj+0rt+U5NRbxqiEfMY/ZgiQTd7cLDk9qeyEe5S7AeEW?=
 =?us-ascii?Q?/BvfrzAtsKDY/3OjIMSCUz9dD7qDKKhvG14udX8gWyLjfVyEVrp+0ZAax4M/?=
 =?us-ascii?Q?chbxvBs7PY0Rzw7vsO9y4J36trl+uMVtfQfCjxigq8YQwCYrqa2hx9AIh1Zm?=
 =?us-ascii?Q?jng1aa9TReVN0nNlCzKCmYE5DwC6KWhMR53D6KvjwC2qKnGBtA8Mfm8TFhoy?=
 =?us-ascii?Q?c9M7+RH0I3kpn9JdOUWihWga0vopOgj1RwziPNAjQdYn0zSakD6wg/EMkaB+?=
 =?us-ascii?Q?hji+H6KtBdCt0zVWKee5hvhe0Bzl+Vq7EU+bXL+YfQl8QI4n0VXjCJ7bCNPj?=
 =?us-ascii?Q?RsmziHPo+3CwKSu/gO9IAMcbil0n1be03PQ57yCRuvN/fQMibK6jTK7S2lg3?=
 =?us-ascii?Q?GHISJiYHdmFuW2a8XuYkjc9wNC6DheWpZ4C2XTL4zSA8FJk8F0/hGAtTlbkO?=
 =?us-ascii?Q?Crc59cVe6d0lJhASrva+5YeoRfg6yqzxpZ8paDEmo93lfxom1fdvyK03uulc?=
 =?us-ascii?Q?7oQAn28m9D4soF9wDi0lHAhjbeXbLkFOKhLpTED5dNptHGHgephaN7Tp6Xvd?=
 =?us-ascii?Q?fkWeNcFLq0u1t41YfC2fC+7toNhrfDbjWE6f6tha+etPCaehTEcCtMEfTmhz?=
 =?us-ascii?Q?lrxSqW98095mSPViqyvleQNvSGn62bDAkP/bM3jV5eMymdySwDLdRtc5in2f?=
 =?us-ascii?Q?b8VxMyQGsh1YVnq+0grZeEEAy9tg1ogXucoz7sjwKl8IXmE4W6+U+69HlmKP?=
 =?us-ascii?Q?S2IyQyaEr9pIacWD9z1ooW2CKoojE7gO2W3fvg/ws+7efliIQ48yRFvGo6z2?=
 =?us-ascii?Q?kCAoT1f5f5Tg6U1zZ57VOnvDpJj0vQt8sJiWIzSH7DQ8e32kvj5nq2cL4Xlo?=
 =?us-ascii?Q?DIXuxHnDSc6E8K/xCaSXOCLA+Aeq5zY1nFmUVmcRIMzTEFGa8phAXxQo2KWs?=
 =?us-ascii?Q?B1NATJRjMRPL+cxbID6YcCc86mfLHAr6T4GPM+czYtAHwsyxdV1mEvsioArv?=
 =?us-ascii?Q?ErEMydBH0XXTlosbV0ENKkbpErwUCxri6LuxPH0m4E5mkBiT6gYP5RZi4pJk?=
 =?us-ascii?Q?8aWZzLnpLxxEPUfIE1qZuk3n3HfM8EtXnGN+B8iPN55JT22QINiTih1QgSgi?=
 =?us-ascii?Q?k+CTYUrce5pwrORt6K6zUzhOqyk4v78Ebp11Vl46w0FDJZ6O0go7x+lPJcok?=
 =?us-ascii?Q?fRG0nWa5zuC4twbN13s8jVXil5ulBoQcDcHRscN8U7qKPdbqqhArrUGSBBR4?=
 =?us-ascii?Q?YoRpoRpc1qjlLJGYst0X5kbk75C4UUk6snztYGI+FBmIdDkE/5/7QlfSdxMY?=
 =?us-ascii?Q?lmzxT6NHdNAdBka36JhlkWg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c1849bc-bb11-430f-72d9-08db9862f205
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:13.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V0GflEW7wUQLkEIxJY0Yx+Ag7P0cyGMuDbncZE7rYlLlwxcwYFbi/yk6AWVLEgjfujCFI0yYYbAkzaG0cF8el9ilY3ARzL+KbaCAHpKXSbeBZBjkRu61XXb6smGvUvGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: FPH6S5PO37TWJMOSIAPC36W44ZXVM4HI
X-Message-ID-Hash: FPH6S5PO37TWJMOSIAPC36W44ZXVM4HI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPH6S5PO37TWJMOSIAPC36W44ZXVM4HI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/uniphier/aio-cpu.c  | 161 ++++++++++++++++++++++++++++------
 sound/soc/uniphier/aio-ld11.c |  62 ++-----------
 sound/soc/uniphier/aio-pxs2.c |  55 ++----------
 sound/soc/uniphier/aio.h      |  10 ++-
 4 files changed, 156 insertions(+), 132 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 4e8d5f7532ba..7c5188477b7c 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -355,30 +355,7 @@ static int uniphier_aio_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-const struct snd_soc_dai_ops uniphier_aio_i2s_ops = {
-	.set_sysclk  = uniphier_aio_set_sysclk,
-	.set_pll     = uniphier_aio_set_pll,
-	.set_fmt     = uniphier_aio_set_fmt,
-	.startup     = uniphier_aio_startup,
-	.shutdown    = uniphier_aio_shutdown,
-	.hw_params   = uniphier_aio_hw_params,
-	.hw_free     = uniphier_aio_hw_free,
-	.prepare     = uniphier_aio_prepare,
-};
-EXPORT_SYMBOL_GPL(uniphier_aio_i2s_ops);
-
-const struct snd_soc_dai_ops uniphier_aio_spdif_ops = {
-	.set_sysclk  = uniphier_aio_set_sysclk,
-	.set_pll     = uniphier_aio_set_pll,
-	.startup     = uniphier_aio_startup,
-	.shutdown    = uniphier_aio_shutdown,
-	.hw_params   = uniphier_aio_hw_params,
-	.hw_free     = uniphier_aio_hw_free,
-	.prepare     = uniphier_aio_prepare,
-};
-EXPORT_SYMBOL_GPL(uniphier_aio_spdif_ops);
-
-int uniphier_aio_dai_probe(struct snd_soc_dai *dai)
+static int uniphier_aio_dai_probe(struct snd_soc_dai *dai)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
 	int i;
@@ -403,9 +380,8 @@ int uniphier_aio_dai_probe(struct snd_soc_dai *dai)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(uniphier_aio_dai_probe);
 
-int uniphier_aio_dai_remove(struct snd_soc_dai *dai)
+static int uniphier_aio_dai_remove(struct snd_soc_dai *dai)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
 
@@ -413,7 +389,138 @@ int uniphier_aio_dai_remove(struct snd_soc_dai *dai)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(uniphier_aio_dai_remove);
+
+static int uniphier_aio_ld11_probe(struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = uniphier_aio_dai_probe(dai);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int uniphier_aio_pxs2_probe(struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = uniphier_aio_dai_probe(dai);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops = {
+	.probe		= uniphier_aio_ld11_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.set_fmt	= uniphier_aio_set_fmt,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_i2s_ld11_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops = {
+	.probe		= uniphier_aio_ld11_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_ld11_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops2 = {
+	.probe		= uniphier_aio_ld11_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+	.compress_new	= snd_soc_new_compress,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_ld11_ops2);
+
+const struct snd_soc_dai_ops uniphier_aio_i2s_pxs2_ops = {
+	.probe		= uniphier_aio_pxs2_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.set_fmt	= uniphier_aio_set_fmt,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_i2s_pxs2_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops = {
+	.probe		= uniphier_aio_pxs2_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_pxs2_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops2 = {
+	.probe		= uniphier_aio_pxs2_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+	.compress_new	= snd_soc_new_compress,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_pxs2_ops2);
 
 static void uniphier_aio_dai_suspend(struct snd_soc_dai *dai)
 {
diff --git a/sound/soc/uniphier/aio-ld11.c b/sound/soc/uniphier/aio-ld11.c
index 7b3cf5d751f6..15dbded63804 100644
--- a/sound/soc/uniphier/aio-ld11.c
+++ b/sound/soc/uniphier/aio-ld11.c
@@ -188,36 +188,9 @@ static const struct uniphier_aio_pll uniphier_aio_pll_ld11[] = {
 	[AUD_PLL_HSC0] = { .enable = true, },
 };
 
-static int uniphier_aio_ld11_probe(struct snd_soc_dai *dai)
-{
-	int ret;
-
-	ret = uniphier_aio_dai_probe(dai);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 	{
 		.name    = AUD_GNAME_HDMI,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -234,12 +207,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_PCMIN2,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.capture = {
 			.stream_name = AUD_NAME_PCMIN2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -247,12 +218,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_GNAME_LINE,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -267,12 +236,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_HPCMOUT1,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HPCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -280,12 +247,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 8,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_PCMOUT3,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT3,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -293,12 +258,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECOUT1,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HIECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -306,12 +269,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_EPCMOUT2,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_EPCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -321,12 +282,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_EPCMOUT3,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_EPCMOUT3,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -336,19 +295,16 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECCOMPOUT1,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
-		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_HIECCOMPOUT1,
 			.channels_min = 1,
 			.channels_max = 1,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_ld11_ops2,
 	},
 };
 
diff --git a/sound/soc/uniphier/aio-pxs2.c b/sound/soc/uniphier/aio-pxs2.c
index 899904f7ffd6..305cb2a1253d 100644
--- a/sound/soc/uniphier/aio-pxs2.c
+++ b/sound/soc/uniphier/aio-pxs2.c
@@ -141,36 +141,9 @@ static const struct uniphier_aio_pll uniphier_aio_pll_pxs2[] = {
 	[AUD_PLL_HSC0] = { .enable = true, },
 };
 
-static int uniphier_aio_pxs2_probe(struct snd_soc_dai *dai)
-{
-	int ret;
-
-	ret = uniphier_aio_dai_probe(dai);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 	{
 		.name    = AUD_GNAME_HDMI,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HPCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -178,12 +151,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_pxs2_ops,
 	},
 	{
 		.name    = AUD_GNAME_LINE,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -198,12 +169,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_pxs2_ops,
 	},
 	{
 		.name    = AUD_GNAME_AUX,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -218,12 +187,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_pxs2_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HIECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -231,12 +198,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops,
 	},
 	{
 		.name    = AUD_NAME_IECOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_IECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -244,31 +209,25 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECCOMPOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
-		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_HIECCOMPOUT1,
 			.channels_min = 1,
 			.channels_max = 1,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops2,
 	},
 	{
 		.name    = AUD_NAME_IECCOMPOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
-		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_IECCOMPOUT1,
 			.channels_min = 1,
 			.channels_max = 1,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops2,
 	},
 };
 
diff --git a/sound/soc/uniphier/aio.h b/sound/soc/uniphier/aio.h
index 0b03571aa9f0..09ccb47337fd 100644
--- a/sound/soc/uniphier/aio.h
+++ b/sound/soc/uniphier/aio.h
@@ -306,12 +306,14 @@ static inline struct uniphier_aio *uniphier_priv(struct snd_soc_dai *dai)
 int uniphier_aiodma_soc_register_platform(struct platform_device *pdev);
 extern const struct snd_compress_ops uniphier_aio_compress_ops;
 
-int uniphier_aio_dai_probe(struct snd_soc_dai *dai);
-int uniphier_aio_dai_remove(struct snd_soc_dai *dai);
 int uniphier_aio_probe(struct platform_device *pdev);
 int uniphier_aio_remove(struct platform_device *pdev);
-extern const struct snd_soc_dai_ops uniphier_aio_i2s_ops;
-extern const struct snd_soc_dai_ops uniphier_aio_spdif_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_i2s_pxs2_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops2;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops2;
 
 u64 aio_rb_cnt(struct uniphier_aio_sub *sub);
 u64 aio_rbt_cnt_to_end(struct uniphier_aio_sub *sub);
-- 
2.25.1

