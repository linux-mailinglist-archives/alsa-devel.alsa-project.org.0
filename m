Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C068694729E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA705078;
	Mon,  5 Aug 2024 02:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA705078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819064;
	bh=bAV5BV0q06/Z0Yt8or/mXIzxAHdygLVgFo0G1yPUBoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KprPAQqw4Xv6fbXcFLpHOmXomsJ5dsOCkB5vCtuHS6yE+Ef9aBYhg4XzDhzgn9rAs
	 TfGDPD0yagc2KGwgcL3WaZmWN9vCNvt81c7X8zJI8rYKaHfDI+fDeUEvzAcj/ffM/5
	 KVfHx9QW4NqZsKibCD4KAft64nB6GBN0w8AliyKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0529F8993E; Mon,  5 Aug 2024 02:39:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2B53F808F5;
	Mon,  5 Aug 2024 02:39:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72682F802DB; Mon,  5 Aug 2024 02:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9A88F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9A88F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HiYNh3/R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgSvy/IWG2jDEec4gCf152IcftuhqFMhxS1hmDLur2sYQJz4Uhidf8aiqPOucLtXuo8HPl7A9crZmTjtJvrYABSAAR7CiPVYhzQ/lqrvFYFvipICN7dXgqRB3aREHAWtFAgIagaiFiAoWMzkPSZD0OpuYb+mk2jDosz0NOenDiTq+vx4F94xxBT6bXGG3gp7vS5c1NWgzjknWFQFBekPqnu66HX/gXmQUijg0iOkePPURZglwenM+PVNBcRdqFA68kgQ9tv5WXtauguggSAzJLQOgqKcR8MCsFF3JWKb1GwDcFAIliq6uHo54rz+8MvC8Md1qFbTuGCHqb2nGykpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW6KHFXVwx8L0pEHeBT87ZUc3ogZn+4saFVcPvn+Cmo=;
 b=u3qHh22Dqvmmk5ntOsJdFepoeIvfQzckuMOSWJpf96DFbkqTSPu+444Pcs67RZuhh3J0Q78vcz3zPU/LFKTPzaUHCFyPZwI8KOu9oqak2dDvqw2VEfX5yO3NHFgrby5jI8svRgIxZM6BGt+yjB0SVqgEk+546aQ1O9nSsdLKkBXNlwal++IbaT53o7dX1+653FEsJ0mJ9gOpuf7HfGQVAdPTjBCdj/9qUrU+nQW08XOif9WdJh1C9TBoS7dkXprKYgBqC6Uov6QhDYtL2zFSwHVsQRE8UcifEMKS8GrRQKQ/glNubqxgnF424bbtn4TZP2UQBIHpNo7dJx9xim4f4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW6KHFXVwx8L0pEHeBT87ZUc3ogZn+4saFVcPvn+Cmo=;
 b=HiYNh3/RouNdCGcHjrTEMM+a3guXaMvbWkxAXxZABKOaI4kNxWGxwvriCDRuiXf6kDyDO8BwrzOQhJ70KxhfrSZdSColTkGJqgA1jqBKZ16IziiINwVupkthHJyZP3n89N6KjNC3nxUgRCJa1AzryV4ZjRYJ6HS5VskYTONw1qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:13 +0000
Message-ID: <87mslrztw2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 037/113] ALSA: firewire: dice: use
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
Date: Mon, 5 Aug 2024 00:38:13 +0000
X-ClientProxiedBy: TYCPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:405::21)
 To TY3PR01MB10906.jpnprd01.prod.outlook.com (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: c7574b2a-e52b-412d-7830-08dcb4e6e38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5d1fGPFSU+gfVJwdLp+n5E7DRKF3FyWXg9qIh9T20CVLwcfxpNRGXEAbeD+V?=
 =?us-ascii?Q?+wsTGaVHsFc1fBhzerDjoxWH3gJ1THWk8ZMuOrQDdbfKL/EDw1793KdkEuok?=
 =?us-ascii?Q?sYIKtb7zHzcitRWvAyh+3h73gdATPPeE6qNqfqZHGiVSRn0WmdfjHCNomCf9?=
 =?us-ascii?Q?c54TE4MJlME3/yjdZbn8S+q/BipLAqeJZMnr0MGnaNl+K8+7GuN4ymKoAQEM?=
 =?us-ascii?Q?D0KpSdFBmY4z4hkrCJADAH59/xhngOrAl6FmkDyOJvJ8yhRGp1lS8diRAJwK?=
 =?us-ascii?Q?DOGSJ4POM+JxTLhiDk3uPOHmGu2qE9F93mRvD90P19tVzoVS3UxoE9WVCKcL?=
 =?us-ascii?Q?45ha/aHrkBpdm7Io44WRecjj6IzNsZ0AosV72sEUBuQsat6axr+Rk0L7ZY9L?=
 =?us-ascii?Q?ZpfFR8v5VIhAAH6A+jgMVpwQxmZ5DgTj3u8x7N89ap2wpSiFBA4dWeDQNe/g?=
 =?us-ascii?Q?1VAe1P9ntyQRpmXHp+K2zhcdJAbv48rJ6NnJu2qS8BAooFYnRPLJk/rTZhaQ?=
 =?us-ascii?Q?kdfvimfM+cEW+vDRP2g97Z58PrKj7oKTbjwx7Q7OLZ933t66i1ePYAAt+6ec?=
 =?us-ascii?Q?YmtLuqJes5oxNd9B7gb7ihGq5CU3Fo7qxjaL7lPTuSY4M/JDNcL01dib3M1h?=
 =?us-ascii?Q?COvNiBlMAoWXNM06LazqfIWiocjeLeVgSmyj+Y+2VZouuMaN2TC2N6JFYcA1?=
 =?us-ascii?Q?155tEdgOFmEVVw+5CxULlfZHGRWHRwD27IiUyMRVZCMwt95vzLf2QkCrd3ym?=
 =?us-ascii?Q?qMZicLcl3mY+I7/k81A+r15KXVgU2BkISq4UxoFqQMlhjCsJLSasrqJiI2i0?=
 =?us-ascii?Q?dsXibhK5I961oDCJMiGSqumLk8hpmTMVyGXNZzoBawFD7rUyNK6xvwqQevB2?=
 =?us-ascii?Q?WTvRf9pVTMOogL/IC6oh6PJ8lBQiMlw+7iGcaJ1oVJMYXunaXLaEtLY9LxiI?=
 =?us-ascii?Q?NtsYJM17OWo0qDDl98xUQvfBN3KKBaBU7i9q+7jTCpvSGfGY5eDLA16xjHel?=
 =?us-ascii?Q?RmtH9HBVHCRX8e++nJfowzMYety2ek3IS/OAYf9uiJWInpCj8uO1g8AEnmDG?=
 =?us-ascii?Q?k6FNADRq23Qa9qh/Sa8LjA2B9uOENrGOO5ohAHaeUFDF2q0BN/nVBJJ0+BFX?=
 =?us-ascii?Q?DK/lmQANnEjic3cl15uVG3HE1G0SYNtcaQoOvKOqv6Oa+CHvAqcWp5PUUm77?=
 =?us-ascii?Q?PcpisVS1aq+xq1LPhllgdnWOBZjl9vuWX8cZ9G/4hCQbY/TmzZxfwojTyakS?=
 =?us-ascii?Q?0oJwQcScMGzSHyBUM8seSkk746KJjqMCJY7yC2c4j/1dKVteMYObASmB5WXg?=
 =?us-ascii?Q?Z6JhJJIqe/YqqWjLzX/GA5IT34sdoptoZPWodoYEQTKVlLPBUDRnY7u0h/Vt?=
 =?us-ascii?Q?iM9Plij56/Bwn7B7JMNdZkQD7bBoSdq+y3xWNcg+oL93f6kFcA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tvNizW7iq/mOEAHkNicvxfJukZt0k6z0K+DgK/O24VbMoL7cWQ6T2IlyCBE/?=
 =?us-ascii?Q?9fRWI0d6bC63XhynrM6uCzP6Cmd1J9drlr41sT9HixykCB1/ro1Ed5KjR53y?=
 =?us-ascii?Q?DwtJpDrwxtLytOSfmuaiik/TcD02ISQC1ENk9zXacwjoXV54zZCC6VM/RLOf?=
 =?us-ascii?Q?/aVSI9rI7zoPpx+LJbnyHHUwgRtBj/4exaM4rILiJa6TaA5Mo3vRSMgA74P2?=
 =?us-ascii?Q?B2G/j33L3I+gyPkSmJeq/G45uiSDfd31CG3TiSK+jEjBQF8c83ZMWq6ipJMG?=
 =?us-ascii?Q?DxM9Ss3xv5nuQ8vgQK+gtkJ7A9xIJo4byfQvO+waVYBi5osUFByofWxXfl3h?=
 =?us-ascii?Q?tYONWfN8i9g0RE0Y98yncrv07byDxLx7ujgg7qNKy95HzLY8zhSfH3D3zIbm?=
 =?us-ascii?Q?7cYvo9goPw2UZ8rvvbXbE7nGy0J4RFe1sLF+FzMOSvNK5M/8hkN7sQnKs1kt?=
 =?us-ascii?Q?ogEq/LXyXZ5ePxEeHLqOMF+xJGhicD8ryxPUkxVR/8RR8leAqDpvFtaZ1v3w?=
 =?us-ascii?Q?YIy0EskPy1DvNFGPvLT+OqB0A3ACcs7+G+7tth3ObbKwR+wZleJhNyV9rhwO?=
 =?us-ascii?Q?4UbPkpBCmu0CChg2uoAAXYR6zoAlGp7UY9M6G+CH3VLVx/egIUx8xV3JIsDI?=
 =?us-ascii?Q?K0DmfmHQgK2MIxJNzxxqJ1iji6Zkhjrx+QRK3Ms7ltCv9Crd4d0F2fE860Tt?=
 =?us-ascii?Q?BZlqM76GUT+KNMqNVUBGC7NoybZJyaUsvXVA/m8rRFSebTjR38XNkx268/p1?=
 =?us-ascii?Q?gY1bA26dwd+u9KlvGscNhtKaKjjCqsq/rWCTozny4uqV4apUIciqTDLfAGNz?=
 =?us-ascii?Q?qmax2neEZbACqmSnDu+c0gnAj+jDJIcxmZsryQoVpeQb7+oA4aVItJ0TUZ7j?=
 =?us-ascii?Q?y/dkK4lPpYdhlvzix1/7bim/JW++R9rTWJ7p2giHVYUqlHVyZT22SD8m90ra?=
 =?us-ascii?Q?MJOrSGx8KtvI6V6wugn3x+3LEJsI4K+oHrusO+7gZoawTyQ5auKmaUvwlp7H?=
 =?us-ascii?Q?MLXVyJ5w4TsT6gDyYy8mp8EE2jG4G72BDXmwWOQt6MdwXQLz4a1D+QXdZWZx?=
 =?us-ascii?Q?mgSIcBWmTzBTtVlgBoF2hVb4Mwv86GJfSWSrTwkL2kJR1ps29UqeuhGadPLN?=
 =?us-ascii?Q?uLxu5L0JUqR41w2n8gHv3yVxI0/Kaj/p+7YfYQzW0g5Ui/g0iH9TyIqZ4XTS?=
 =?us-ascii?Q?1M5nIbcxmzbo4BTT/bNHFi6L4T0xaIk6gHVXfkW9UFN6hXMuoBVbI7pO9v+E?=
 =?us-ascii?Q?Oijq93N+33ySnrJJwgvEZIBzY0h3f6bTx0SeHrppIkcyY+FqRFLbjpRqvIQG?=
 =?us-ascii?Q?Ngihq6BOblbdht/q8+k9n2yB/jpj43r/eU5PqM8JnWqPxMKjZq1RnbrlWNcz?=
 =?us-ascii?Q?BLiYZ4NjrS4ajSuVuBqGqzpFHwAOwBWrce4/jCld4FoGt15QRKb6idEG5qBO?=
 =?us-ascii?Q?5SnsYA3XNChSULRs51Xx2tC+a248t8ZJG2ZJXuNuFF6z0XNIBtK9ntRSuTDJ?=
 =?us-ascii?Q?fLcB0+FUZaImpymZgIuISmXpEPD2XOG3/jMHBO/eLiLAGcBgznrQ492zCXt2?=
 =?us-ascii?Q?x29ztWwOuK/8oweGFclZy4AjrhWgcICg+1HI8GMFI6IaQ8TqLKI33y0DY4pl?=
 =?us-ascii?Q?G5kxFMdsuB2upy2lyimlpgw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7574b2a-e52b-412d-7830-08dcb4e6e38d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:13.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kvLNXruFDlb1pcZPOu2okS2qblOzcURHQsYrLJlzKGlE3Jk2XSNsCS5eNJckrU8Lcbj8zbDJVPFifq7yKN18K2Ow6fiW3s0NX8jOZnMJGd13da+CQxl9yWvPuaiDdx9g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: LTDR6TMS7ZUQYJXJ2W7ZKYMYG2MOSMBX
X-Message-ID-Hash: LTDR6TMS7ZUQYJXJ2W7ZKYMYG2MOSMBX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTDR6TMS7ZUQYJXJ2W7ZKYMYG2MOSMBX/>
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
 sound/firewire/dice/dice-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index d64366217d572..063e16d153fa5 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -26,7 +26,7 @@ static int dice_rate_constraint(struct snd_pcm_hw_params *params,
 	enum snd_dice_rate_mode mode;
 	unsigned int i, rate;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		pcm_channels = dice->tx_pcm_chs[index];
 	else
 		pcm_channels = dice->rx_pcm_chs[index];
@@ -64,7 +64,7 @@ static int dice_channels_constraint(struct snd_pcm_hw_params *params,
 	enum snd_dice_rate_mode mode;
 	unsigned int i, rate;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		pcm_channels = dice->tx_pcm_chs[index];
 	else
 		pcm_channels = dice->rx_pcm_chs[index];
@@ -132,7 +132,7 @@ static int init_hw_info(struct snd_dice *dice,
 	struct amdtp_stream *stream;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		hw->formats = AM824_IN_PCM_FORMAT_BITS;
 		dir = AMDTP_IN_STREAM;
 		stream = &dice->tx_stream[index];
-- 
2.43.0

