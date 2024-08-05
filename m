Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF3947268
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A558E4A5A;
	Mon,  5 Aug 2024 02:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A558E4A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818569;
	bh=AsAITu36a9j4qRtm2uIF9gaX/wMbq5Jd/KowHXXbM50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kZRfaHoIDD/P6cjrh9RZdgLi2esr4o9oj0mBxXiRbGb5LC0T2E+ngiwd5C9k8fJpH
	 W3EJkiunldP9pU3Lfue1ME0daA8HlarNebsB+W3siMAMfnlORS4gTOqPN5kn2aNtD2
	 i7LB2xJx458s1bHf4oPH2ybeGDODfYRrlsWf8Nwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84130F896E0; Mon,  5 Aug 2024 02:39:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5EF7F80C73;
	Mon,  5 Aug 2024 02:39:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D0E6F802DB; Mon,  5 Aug 2024 02:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01F47F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01F47F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OA1R26YR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvse9mceJq2aJaoM2nAByBBOsXnyF3tJC5LMtZwAvW2J82iVGMVOewV/zXTLHhNlUhc8W5vq81qLZCb1RSxpA0tbvVHhgUGhCn9droWcQz3o9118U5EiRFHDrY38PrlVVIe80NXrOPIi4auo55UrRz9nNNpGYeYnxP+jsR6KXgRO42hr2wReiDo3ztNcg+Yo/vUV0T5xIbBL7+wRnHKJdDcS3JIUOSVkfpSr5ZGsvwFGDiwTwunfAXOJfkQyXHnpfgbA7ZbT/QYmh3IrDQRM7CvxpyBUVFs/dzwxHr7i6j6I4nVEyntheTKuStDZUUwPY8FrpiHPyugqdHiGrc5DHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jx7po4Al7XoKH8XSQtSVL52Z577aksXu8OfoXidgsc=;
 b=cpluQDyGQssZFE6lwLUNEvXGbS82s79URFzGDCHfQHcsSEFibDl6uEI8PaHtoPZ27RW/bRSLn0TTZAQBWvVvrDL1sP/avAXBw4xjXGdgXaHxLZEQy+j8SVuXDZRKCiYziAd6uZ4EWLoUKpcMELr6BT3nXEOHURNjyi8EgGyLEQMGhgl2qUI6cnxavAG3iQcT6Fw54TLFSJY3FhzM2wylfhRxNp97iPdrtIQbn7IxpQsFFj7snpB7/XXva0+XxHA1lJRIZjtUJKq2Roj+pEZhItA0FVv9rhwwjZgySSAlBzFNUZYVTI84VfOH/LdspH3ZQYiMaVhuj74Gq8ENzsaQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jx7po4Al7XoKH8XSQtSVL52Z577aksXu8OfoXidgsc=;
 b=OA1R26YR1yZvlchhTaHjUICzswzpO2OzfvcV/d1CCemiMgE1fPPmC4JSOlrSGuMVm5YYClhxwxoeo5+n0kYrsddxgk3WQCvNgLn9qHzlusHVwCFgF3aryr7ELJZsskK9CAAzDkNNkT5RNIAGHs0UaGMFzhgl6/Ee5vV8O2modI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:46 +0000
Message-ID: <87ikwf24d9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 015/113] ALSA: pci: ac97: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:46 +0000
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf6de3-f7ae-4601-407f-08dcb4e68c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fsTR7riolp4ubIu7+JheVHTTe3e3evjDOvl1ShyUh0hOBvRuz2AMKUkgmXSp?=
 =?us-ascii?Q?ACCHMnMyTwT1YGh6TMx/Lw+pZ4Pv77yrTXUMcuOux4ojq+mlvabtfQuoqZTL?=
 =?us-ascii?Q?woNniHuxpXTrD4fdR6WvwbMfr/W4/NZrdYOIUvl0Rgu73KvZwIHBK+jE6SjC?=
 =?us-ascii?Q?dII89cFEqVwU6r5iE+FtP0U5ZXACBfZpWo5fmw5jOMf3Wla/7XfHDSlBCH4q?=
 =?us-ascii?Q?I2sJrKnJ6IT0NSetB4QmlgrJG3jfr1/q9HfHy4bbx4aw+MUuknf1jsgNwobr?=
 =?us-ascii?Q?aQKtCzxz/ulM5Y9Q5gRGKutxPzwsVJKb38hcVuVvapb0jBIQWO5I6TUEJDdv?=
 =?us-ascii?Q?qZ3gl/iMtjbNftTQx/Iz6m2Y9Ykfrik3cXRoJV3656WftBdN9eP4R9plpD/g?=
 =?us-ascii?Q?Fn8i0JhNdNKo2oOqe22sjW5nB4OGeYO7/XBFkM5sUUTOZzZMB8BLaDKekv8T?=
 =?us-ascii?Q?m+ct8foMe2SNOKp4rZpYPeFA1H5Dor/3LWsgmlOlIGsh6b9XEf47Hzv9d0OV?=
 =?us-ascii?Q?gxw9gxpb8I92b8mH3mNFqH1VrM+kVyqpxSPkOW3RVq6gLEs2IljGyhqm79O0?=
 =?us-ascii?Q?WApQ0ypy6HupMEEIr+HS9wo5999uv/AoCEBY0q093E8V7eN6ZZBcWQqOuXn+?=
 =?us-ascii?Q?8w7wyCU/Nls0xpxDwpBueD3dqXbz9HUnbpQn7i3tT8jwdfrrFmhCmJMKhbLf?=
 =?us-ascii?Q?rGCJiZf1Jt5oTrzUJMLiTz+RqGARuZJ5LAQy5XdTTyB7wxRpu8gEfpolr6MS?=
 =?us-ascii?Q?WitHTODuZ0OxqBTyODnjFz8pTrKXWFICaroHzVt7nmaus3ouKh1Ds90SxAkF?=
 =?us-ascii?Q?iJkw9yd0ayc+sLr/HGwOHZreVPwOu99M1BKdfx3wfhMW2jVch5+n8fQ5s/Yi?=
 =?us-ascii?Q?7iDQMDadWOPK4oKauf/pNClyjJs3F9Zy76tkJSIcjijPEK0nAALRfKDL6HS+?=
 =?us-ascii?Q?TbvkF+uHQbH7fPwqzzI9lm0d/HOfwCb2lyllqUCvTQjESkniCJ7fISZqdap2?=
 =?us-ascii?Q?vZKQlB/5qohHV2X0fKk+yDn1VkkhIVAixCz4TpQ0ioX0ndMTxMLxYBQAa5dJ?=
 =?us-ascii?Q?K9LVU90utwQ48HLfHvmcbuFHyy1yJgXEOnfr8U8CErZ7UnhAtSx5R5IY8H1+?=
 =?us-ascii?Q?zUWMeY638T0YNKreKqvKSADWgO4ziVvf+8ufnCF9kadFksh09WdVIRlF+khN?=
 =?us-ascii?Q?y3hwUJ46OC6TmewyVBLvSukxzKBeSLdSgEB/rjFnNYYtpXzB7Jp10Aozbfdi?=
 =?us-ascii?Q?tkoX8g1wywPhsoe1tgJz5pvbTcrThCS0FrNGFEJeYqOyeO3tNZ7h0a1RyJiy?=
 =?us-ascii?Q?A23UJ6wNDFit887ZtMxKMJlu/F9xgfBdQfALzLc1ZY+YsLSMHQRpujuj0Bec?=
 =?us-ascii?Q?/A7n5WrlqATOB6WD++Ol+z89/xkIy+P/IKjSFOenZzAaKW8Aiw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h2xv8pWEGpLySnCKkuCCVM1eg+Tvk9d1Fa4l/sooT0RcvqFknz9f8DpoIM4u?=
 =?us-ascii?Q?0sumG35r4Z04Ur8sQRstj21/eaMfFo8K+CknXv6zaGmopmEe2icbJdUTBbsX?=
 =?us-ascii?Q?H60IUoErO0msNVlYUv+ANVg6yNHcbnYXHOH267OrPp8p5jd1O3e4B/KOfJ6H?=
 =?us-ascii?Q?cWERVwbXnG9n6uyA//dJpUQ2TCfo0cssvZItJOltjgF9bEbR4qr0qulw9U3t?=
 =?us-ascii?Q?BzSOfv4qYXijgmSdp1RKPEliGlOSwuQthVywQRa1I7PN6/hGO9JjG0TUzL0L?=
 =?us-ascii?Q?cPmxW2nV60WcWWuajWVnx0ifKtME6bwE30kiWyn2z77Q/D2pwfkXtesdF9xc?=
 =?us-ascii?Q?WSowp4KLk3XuAmyYGQ0oROsms7seGH2b2CICVHRw+hN2H5s7sdvbEp0P9S9T?=
 =?us-ascii?Q?OdBSKg0kT8JXJvqE495nkEB0vuec0rm81yNAxMcwNfu7FSonXX/+EVhSAlry?=
 =?us-ascii?Q?tn4+6RrpeCHzYnKgYSF6R8ptWDYrMgc18EztlysZNr9vNqO8EFx0+usiOrtF?=
 =?us-ascii?Q?tjcNWQl8gZ0yx6lSZgB6qBmgzvbmQnWfnjorcsQd+tZ/yE9rAF9fH0ThjxWJ?=
 =?us-ascii?Q?7qUUOBPkC9mS+80N990dibZoGsZWyzajqjQylU6JnKUYqJbFfAFmi+Y0AlMP?=
 =?us-ascii?Q?9MmmGM7DKMPsDFXyK1aEDJV4Ajss5B39NAw12b/XmtKcOaqg6PXI1zDTb3Aj?=
 =?us-ascii?Q?AnAs5+m8MaMNjFOvmqvXTmed+rYPj+3wVwRUQUeIpZT0KNV2ScMv/cQELoHG?=
 =?us-ascii?Q?6lnIquW0r9odOc31/BNb3yGkH7vXzwXXLmh/ZxonOCfkrcx9R6EkoTHUsCWQ?=
 =?us-ascii?Q?3Rcg7RozCPIkSINJwir+S2oBSI3RlgdeCjBg95qLhTfGJhUYqPLkmaecd+ex?=
 =?us-ascii?Q?611b+slbONyKqOXcgKgUM+hoN6EFDmXQH3/hRf1O9ZM5g+5WwatqHB5D0IFm?=
 =?us-ascii?Q?/YB91X+FZvDfZaHqah/pq34YsuoffkUyAUfo24I4j+tEVHSZ1UajHLrEYyVi?=
 =?us-ascii?Q?FzayFFEAh5gUBJjfXE/0h9CwsDkCvXh71/RCw5PhnSkFm+fi4UIy0287vnsW?=
 =?us-ascii?Q?Od1E0irx4asL2KLqWZe2jG07XT0SB3AEg1eQU/0QTlZs3bPCNY3qRbaqVyA0?=
 =?us-ascii?Q?7e+oisNHGzQAclgJ3Yni9kriHLLFqgyE0V7N1SxtYbS0+BBJD3rwdWrXL+Ed?=
 =?us-ascii?Q?bsIDMLuLEpSZCztyuTB9JHijqUvQw38b95LicChn9m54r1hzxKZkOd16TFZs?=
 =?us-ascii?Q?ZGwJLfxYD/GO2sHlGLRf2EWLwJeVwx/uJ30MInWSopxf5t3jcugVTf8Xe11M?=
 =?us-ascii?Q?fS5bdxM3U9hLvdeiruqeQvtSFji2D/NUbRQ1AKVcztjx2c+T8IWHc44CG2py?=
 =?us-ascii?Q?iQlE67GBSoM98Fy+AHtSo8dT4wt95sEphGrm/26BuMKlG6f7a/y1AUv6ciqh?=
 =?us-ascii?Q?QYDH8AkYVTwtSiq2Hu0LIJOdduUoz8UEjpqbsrD/ErPdYLmkyHC2WEAZEYyw?=
 =?us-ascii?Q?BgFFcyqzyOMRjbnbG56250H+Nub3LVwfSyz6tJxmrvUUFfDAcaJc1KyPYb5b?=
 =?us-ascii?Q?w3vTtXmVVmnY0bBlfo2cZ7HlsWeszgMmatDk7KCn9OMBE+hEe+07EEY/hY/F?=
 =?us-ascii?Q?aDfs/LlBsFOc0pizPpPCOk4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79bf6de3-f7ae-4601-407f-08dcb4e68c16
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:46.6667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kldClfVf6+jdW9T3xrB4sQtaMKJfcyrMc8fwqFhy/Q+CZ+V4w6RYDK+jG+yhoGRATOm/KiMRjjLSpEYtNN4tYfmSkC/WyJBX5NPAIzPIBm28LaPGTdVD2OOZOaAupmHa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: JFFDJWJ445Q5GQARKDN46J6RE3OD76M4
X-Message-ID-Hash: JFFDJWJ445Q5GQARKDN46J6RE3OD76M4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFFDJWJ445Q5GQARKDN46J6RE3OD76M4/>
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
 sound/pci/ac97/ac97_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ac97/ac97_pcm.c b/sound/pci/ac97/ac97_pcm.c
index 5fee8e89790fb..0d29676a8ecfa 100644
--- a/sound/pci/ac97/ac97_pcm.c
+++ b/sound/pci/ac97/ac97_pcm.c
@@ -150,7 +150,7 @@ static unsigned char get_slot_reg(struct ac97_pcm *pcm, unsigned short cidx,
 		return 0xff;
 	if (pcm->spdif)
 		return AC97_SPDIF; /* pseudo register */
-	if (pcm->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(pcm->stream))
 		return rate_reg_tables[dbl][pcm->r[dbl].rate_table[cidx]][slot - 3];
 	else
 		return rate_cregs[slot - 3];
@@ -512,7 +512,7 @@ int snd_ac97_pcm_assign(struct snd_ac97_bus *bus,
 			rpcm->rates &= rates;
 		}
 		/* for double rate, we check the first codec only */
-		if (pcm->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		if (snd_pcm_is_playback(pcm->stream) &&
 		    bus->codec[0] && (bus->codec[0]->flags & AC97_DOUBLE_RATE) &&
 		    rate_table[pcm->stream][0] == 0) {
 			tmp = (1<<AC97_SLOT_PCM_LEFT) | (1<<AC97_SLOT_PCM_RIGHT) |
-- 
2.43.0

