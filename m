Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4A947298
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 050F54F9B;
	Mon,  5 Aug 2024 02:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 050F54F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818988;
	bh=lHHTxCnS9bTf3K9AdSEqvIbgw20Dgp3DPBVMxGIxFUk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ynwz67I4QiRdLLCr9aTBG8KQOYNBoSG0eLqKjn/amECC4oIlDhxXjQEt52QNTFj/p
	 mYZHvdnzm0kuuVtOmVnxwmx33ffeP1/JdE5AditLTgpL7KEEEoXUNJ0757D9nrkEgN
	 ZmSe0tx+z0pSyFdTkbIXqau5HJJJzHwFpNCB75Eg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D0E9F89913; Mon,  5 Aug 2024 02:39:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 334E6F899F6;
	Mon,  5 Aug 2024 02:39:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FF93F898BD; Mon,  5 Aug 2024 02:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F7F3F80707
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F7F3F80707
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RNYyF1xn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEBsiIY8FpZvv+1Ff4KuE5JI07HOSc6isb8PRMaLbv0zax6uNHnAS3L/lQCTnIx69dq814QvWN8TO8igcA2dhSsZYs6RnAfK0pqoanRw1DW8SPv2rDX4ubqLL/LP9mi6RWcqAmmyTcvLPoMiS7dgMpYBAhhTh4Ne+UFYPUZbi0vK4QfoKsweZeDWqNP2iWiZ+hYj3q0Att0BmyRWZmsIYfjMhwpuGFNiw+cZnmzV7BLv40GsKYXvaG82E2ujw968LWdCWov/NcpGQVn6GQcImjqdt8DPid5ScSbig0KP+rW2R3IqhNryci+O+07hUAjSA5iDQty6ZtomUqMTWRWVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Lej+1Z+Zoj2ID9gW3Ofwd6ys/YEwEu+ljlQzCJ4DCE=;
 b=mguBjebz9thcw0kBq7LVCfktASvHJtJ117+e2xlWSe4V+EhJ318qe5z1nxxRBvAB02ieiDy5tIoz9MFEpWTAP0foKeH7n+HyNuZJbOAM7icKhXlppmgy3fcQPRzlIRt6s0Ps0ve21w3BgaE+tuRwD8avTm9nTfjgHCmutUI18463vlBTYXIeCq4K+q6QfPWtEGLHiN8JXWZzDfI2mhLL2Be735HT6NUmiS8yTNO971zQq4ICVM7+FaVAjLFAbJdaYG/DJvwHQM22hlUO7f7ZexOqGjP56JvKHy0XxTXY/9bmzgmsr02FKy/ZQqNPSOUlYZ3ok49IjXy6Bnv9XgIQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lej+1Z+Zoj2ID9gW3Ofwd6ys/YEwEu+ljlQzCJ4DCE=;
 b=RNYyF1xnypzj1ZT+dRHNy3JzxKTaxUjKO2VxfO/7vAEw0QbvOIXvibZ1RXqCOBCqpmeNKbEO9SRRXq3sJVNaLp8Wy9J9ZBoc+KCqmHZzl6+qz2rX4KGPhaHeppGfJZ0Z5vrp4UNarVq0KTf+lxxGdja54kaOsDe43M4LF05WHdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:58 +0000
Message-ID: <878qxbztul.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 047/113] ASoC: bcm: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:58 +0000
X-ClientProxiedBy: TYAPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 755d8321-a599-4951-b0ae-08dcb4e6feaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GAJoteSyhccrmv6uT7XyKNDl4s9jW8oUG1G2oElq3FzJy9C1ADhMOLkTRYJb?=
 =?us-ascii?Q?BsygR3y0X/XZZpq75jc1UTefOUhKMYRDOC1GYA3hIIQvbBUrRFW9c6jgiGhS?=
 =?us-ascii?Q?v69Tc4k2UpiFS6m3lPCS8ML2L6hk2bp7/17teg3cPqbc5UTmNezjYVbnSRKh?=
 =?us-ascii?Q?UjamyTne2y1L6BnNkLTxNT+PODA/sKKXZJRxt82THZG/b1ImfseB+nQbA0ms?=
 =?us-ascii?Q?bwkVXtDkx/pToXqCWVPYJHN56L5+acACtQL87l5K8raqDESrU7kCVTU/kq67?=
 =?us-ascii?Q?gWx6rfUJDCzSnPaMQYZxKI+aPZAxu4XXSaWSipPZUTm17sAEYvDIfThQGq8J?=
 =?us-ascii?Q?/ly8+LFDKOzWKoJn38IK7YMty15UgFENsWtZSM85I6QDvnyOPFQGY66nvmf1?=
 =?us-ascii?Q?DnsKX9tzMiD+1i7SIephGVPEw8HHI4iqBgVSU955UIF2tRwdgdsPulemKXfN?=
 =?us-ascii?Q?nBcfKrNtD7MWWN2d/M5NvNTl5G8gwuMSRuPCxE68i6Ll2GM6pLgxS1maidoo?=
 =?us-ascii?Q?XqCkn8lNYcAeIx9d5DDl/QfbGEN3ISnJ3lmXxc5acdDIlzsn95tnV4EvfADO?=
 =?us-ascii?Q?Aja0hYnS4pzeSe6ge6ezVQhL0JV6L+cUe0Npfi1dggepSj8Ft01tTKwBzY38?=
 =?us-ascii?Q?t06XsDXTBC1CPu8eJ6BDF0PyWzlDGPi1Nar7AyFqeCZLOiVcmlms3kZTG0WC?=
 =?us-ascii?Q?SXFwHy4MilO1g6cdwHLCRpA5SO4XYu72MNHQHb//FnDtMwTunUgA2/UrHlpj?=
 =?us-ascii?Q?TKIF4I9tCboStnQdiRN8ZrJlQtyEVPwk0bhlJS6nLemBG+e5pLcT9sQc+RQD?=
 =?us-ascii?Q?GpVMMTCfuXLAdumcW2qYIWX4bXkdF5S0/S75YshUSiVpuBUcayH5zMA7lsgn?=
 =?us-ascii?Q?HYbAeeifsoYUfsYLQCClAyGAD31nZXybpCOH+n6Y0LJBnYud+jwJ6unxS9aJ?=
 =?us-ascii?Q?7CJ+lhxQd7R6e1TseDhF/wTThjr5eZU+vtJRAuVMH0yMNLSFvMNZFqVRAW51?=
 =?us-ascii?Q?D9UQue8Mf5YFPLek05ODjYpb5gSqCye/LiIKnJY45W25qowSLQYSN2Pw94ex?=
 =?us-ascii?Q?ulxmi0+Cp/IsaOQ7ZchyAK5DtqYoSpQAzvZD1vuyVfHceQ0J6K0wq5bGZvjq?=
 =?us-ascii?Q?fxS1fkSrLqMgUKLiJkAlAO46rBTf3LupZIachX90PXpAz26IqcL12P7WU+xO?=
 =?us-ascii?Q?kHs9RtNJfavBaIXVhw0TrXaEjPZ7oNWNr+4wUzTi/lEe2DZqe9KRLt7r+f5u?=
 =?us-ascii?Q?W5CTBQNJkcerAe5hArOkkD3DqJTLadbYx64npq0VuGaRdFAk/gd+n8UUKG6j?=
 =?us-ascii?Q?E8w+GsTrk6ZDaeHZhYfWH4LzKwZNbldNnUI+jwCin7QzA+QBEGL2H0oHtg0P?=
 =?us-ascii?Q?s/ErB8fC0Gq3TAYMODTyYIl/W4RchSMtjouXJc1c07Udpxxlag=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w0BP9eG5++J/Qew6uUJMVTJ67e1a7L6OuBnNy3U9DTrG5nUUdOQQvCgMdSy8?=
 =?us-ascii?Q?lymNBgl4ki9b2E8JQ9DLHVK67xHgUxPPh0FCBA+5QbGOVgMomx2eDuS5w8Jp?=
 =?us-ascii?Q?YXbaGLXsGzcQWkoP93CMxs6s18d+aOV7MrKaDzi8WPA5+UxcgRqLzPftZlVa?=
 =?us-ascii?Q?n9mIFNP6xc8mR2YM4ItO/Vv1bkOEFRJDfTGUCkkl7/tnDaiW2ETSaraHUIdG?=
 =?us-ascii?Q?mMGb2JIsKRff9CJzXwOvuNqNlSY+npJ+VTIXWySonCgwQ7FYBQuCtYhdumHH?=
 =?us-ascii?Q?ZR8sM1Kz2Xo9y8hDWv2Rf01sangJbqmYepRQpFyorTFgAE2+emlARnkDNMpj?=
 =?us-ascii?Q?DanJRR0geRkb4xqdVB/xfDFoxVSwtgy2MDNARGvu71wb0Nd6UTmDiEw8NlYM?=
 =?us-ascii?Q?xIAu6PyFHcQM0r6Z9TZUkM4VcBcblybNZCdbOLXJltFeTx4+oi+wytVbaKaL?=
 =?us-ascii?Q?850P2ggqCB3AkgfjAW5ODDLwxP2AEji8x5tsiUghrcyQwIz/br2LRr7sFguq?=
 =?us-ascii?Q?29XNZcNer+BQlgc4+IzQqpxrfLGvmmU2SXgYtvkNnYkkQjPpf1IeItJ+vKgc?=
 =?us-ascii?Q?GWuLVYnSPmr58bk/0TFzX+oEwi0/IyDhlhv+IGml1JPNWkFj1S1+9DKZikLQ?=
 =?us-ascii?Q?1dAyxHkbdSszUJg41eIQNJntWX4t8Nn6zMf2+5OgbOFZXy1dotovrqkF93dj?=
 =?us-ascii?Q?PIgzsLJwfSGMcUIOc23FwtKLbN74bfiMXfltkSTgzcYe8jR3tpWxzSOtRtz+?=
 =?us-ascii?Q?u3XGatV1woU1i9zXrT5THW2fpv8m95S8csNAOyfL8RCcrBD+C8R+7E6XATcd?=
 =?us-ascii?Q?4gkH4QUVqBY7/ATUMrVXV6stIMQsupLfdlLwEaPZKvFaNX86rTNa+kQ9DlPi?=
 =?us-ascii?Q?HWKVJbLSZlUZOZIcdmaDVDqtt9sQJwJMSd7O2DyN/cEs3a2Pv0DBENEuJBOH?=
 =?us-ascii?Q?Hkmcg40Wwh/G3iITS6zklhiOubwgH5tsk1RJepSK+03huUhoTOOvd5njI2LN?=
 =?us-ascii?Q?ZqSsjvDPzHGBYNOPNqs0ZU0gKWA3i3uVfRDc8DgqbUNeffgHk7WwLjZj14+1?=
 =?us-ascii?Q?lKRr12J3hG19DePVrQVr9ez0Bq+qLfd0efxsjV4Aq023HD1M2imXcITS2g/z?=
 =?us-ascii?Q?xo2xQG8dlsQJYqSC0e7W+mOpQh38/Dm08hMjf/bVDTIQ7Ie9215EEz32pqqO?=
 =?us-ascii?Q?plJHi0hSWnuMs3sf3sDAYtoZLCeb5KVsyYjnW0qbkTx3rDKoNRiAloxsb/Za?=
 =?us-ascii?Q?3/pEi8xSyPonks/lIUIuC1ZzKIJTWeCaBpJfyWdV4EwJ3ASNqGbhjsCVLvbe?=
 =?us-ascii?Q?UeF7Ie20XnNpoC+clqfMHjtN4+1KpvNPH4/x8crpHw04q1lQR9H92qRwU4V2?=
 =?us-ascii?Q?Hia00sxYbWJwRo2qn3TwruaTKP29sLpuVI3ZgnBnrBR24WGWy5B9SP1LnkOA?=
 =?us-ascii?Q?hTHPvcnJVkcf0BLvqC3hkT3XeSPEnSem6MKQgJ7z0h9S7e5YGS7FJn7MMiP2?=
 =?us-ascii?Q?70EcaRC34wpmhQNnfwPIj/EZ11dc1B8MeuNJJFpDitHMkN76oMG9aenb2RqM?=
 =?us-ascii?Q?USxTRoBrj1W83thDy2adJnCwDaqUiMDGsmjhalsGxi5N/UdBNKxcO+9KYDsI?=
 =?us-ascii?Q?ErJO1hCQJxddHf2vGIlJCMo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 755d8321-a599-4951-b0ae-08dcb4e6feaa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:58.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1ndOELl2kE5t7VMfbBdr9Admgk6FWLk/iJ3PveDpHsYfVcxip89S1KI3blWYZVG6FGOQk/six5u+aLT7Ibg0ovCwKO6zsxDCIOnifKTSeb8RcgyER64CHfBQ8EB2EF0h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: OOGVEFMANJSTY4M633KODMTWNCAVQS7I
X-Message-ID-Hash: OOGVEFMANJSTY4M633KODMTWNCAVQS7I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOGVEFMANJSTY4M633KODMTWNCAVQS7I/>
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
 sound/soc/bcm/bcm2835-i2s.c          |  8 ++++----
 sound/soc/bcm/bcm63xx-i2s-whistler.c |  4 ++--
 sound/soc/bcm/bcm63xx-pcm-whistler.c |  4 ++--
 sound/soc/bcm/cygnus-pcm.c           | 18 +++++++++---------
 sound/soc/bcm/cygnus-ssp.c           | 12 ++++++------
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 9bda6499e66e1..54fcf85a1158c 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -628,10 +628,10 @@ static int bcm2835_i2s_prepare(struct snd_pcm_substream *substream,
 	 */
 	regmap_read(dev->i2s_regmap, BCM2835_I2S_CS_A_REG, &cs_reg);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK
+	if (snd_pcm_is_playback(substream)
 			&& !(cs_reg & BCM2835_I2S_TXE))
 		bcm2835_i2s_clear_fifos(dev, true, false);
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE
+	else if (snd_pcm_is_capture(substream)
 			&& (cs_reg & BCM2835_I2S_RXD))
 		bcm2835_i2s_clear_fifos(dev, false, true);
 
@@ -644,7 +644,7 @@ static void bcm2835_i2s_stop(struct bcm2835_i2s_dev *dev,
 {
 	uint32_t mask;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		mask = BCM2835_I2S_RXON;
 	else
 		mask = BCM2835_I2S_TXON;
@@ -669,7 +669,7 @@ static int bcm2835_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		bcm2835_i2s_start_clock(dev);
 
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			mask = BCM2835_I2S_RXON;
 		else
 			mask = BCM2835_I2S_TXON;
diff --git a/sound/soc/bcm/bcm63xx-i2s-whistler.c b/sound/soc/bcm/bcm63xx-i2s-whistler.c
index c64609718738b..0980e35d12830 100644
--- a/sound/soc/bcm/bcm63xx-i2s-whistler.c
+++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c
@@ -93,7 +93,7 @@ static int bcm63xx_i2s_startup(struct snd_pcm_substream *substream,
 	struct bcm_i2s_priv *i2s_priv = snd_soc_dai_get_drvdata(dai);
 	struct regmap *regmap_i2s = i2s_priv->regmap_i2s;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(regmap_i2s, I2S_TX_CFG,
 				   I2S_TX_OUT_R | I2S_TX_DATA_ALIGNMENT |
 				   I2S_TX_DATA_ENABLE | I2S_TX_CLOCK_ENABLE,
@@ -146,7 +146,7 @@ static void bcm63xx_i2s_shutdown(struct snd_pcm_substream *substream,
 	struct bcm_i2s_priv *i2s_priv = snd_soc_dai_get_drvdata(dai);
 	struct regmap *regmap_i2s = i2s_priv->regmap_i2s;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(regmap_i2s, I2S_TX_CFG,
 				   I2S_TX_OUT_R | I2S_TX_DATA_ALIGNMENT |
 				   I2S_TX_DATA_ENABLE | I2S_TX_CLOCK_ENABLE, 0);
diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index 018f2372e892c..e8542b2009f63 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -81,7 +81,7 @@ static int bcm63xx_pcm_trigger(struct snd_soc_component *component,
 	i2s_priv = dev_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0)->dev);
 	regmap_i2s = i2s_priv->regmap_i2s;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
 			regmap_update_bits(regmap_i2s,
@@ -153,7 +153,7 @@ static int bcm63xx_pcm_prepare(struct snd_soc_component *component,
 	dma_desc->dma_addr = runtime->dma_addr;
 	dma_desc->dma_area = runtime->dma_area;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regaddr_desclen = I2S_TX_DESC_IFF_LEN;
 		regaddr_descaddr = I2S_TX_DESC_IFF_ADDR;
 	} else {
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 2d1e241d83673..3dc204d0a34c6 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -252,7 +252,7 @@ static int configure_ringbuf_regs(struct snd_pcm_substream *substream)
 	aio = cygnus_dai_get_dma_data(substream);
 
 	/* Map the ssp portnum to a set of ring buffers. */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		p_rbuf = &aio->play_rb_regs;
 
 		switch (aio->portnum) {
@@ -299,7 +299,7 @@ static struct ringbuf_regs *get_ringbuf(struct snd_pcm_substream *substream)
 
 	aio = cygnus_dai_get_dma_data(substream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		p_rbuf = &aio->play_rb_regs;
 	else
 		p_rbuf = &aio->capture_rb_regs;
@@ -317,7 +317,7 @@ static void enable_intr(struct snd_pcm_substream *substream)
 	/* The port number maps to the bit position to be cleared */
 	clear_mask = BIT(aio->portnum);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/* Clear interrupt status before enabling them */
 		writel(clear_mask, aio->cygaud->audio + ESR0_STATUS_CLR_OFFSET);
 		writel(clear_mask, aio->cygaud->audio + ESR1_STATUS_CLR_OFFSET);
@@ -354,7 +354,7 @@ static void disable_intr(struct snd_pcm_substream *substream)
 	/* The port number maps to the bit position to be set */
 	set_mask = BIT(aio->portnum);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/* Mask the interrupts of the given port*/
 		writel(set_mask, aio->cygaud->audio + ESR0_MASK_SET_OFFSET);
 		writel(set_mask, aio->cygaud->audio + ESR1_MASK_SET_OFFSET);
@@ -404,7 +404,7 @@ static void cygnus_pcm_period_elapsed(struct snd_pcm_substream *substream)
 	 */
 	snd_pcm_period_elapsed(substream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/* Set the ring buffer to full */
 		regval = readl(aio->cygaud->audio + p_rbuf->rdaddr);
 		regval = regval ^ BIT(31);
@@ -597,7 +597,7 @@ static int cygnus_pcm_open(struct snd_soc_component *component,
 	 * Keep track of which substream belongs to which port.
 	 * This info is needed by snd_pcm_period_elapsed() in irq_handler
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		aio->play_stream = substream;
 	else
 		aio->capture_stream = substream;
@@ -615,7 +615,7 @@ static int cygnus_pcm_close(struct snd_soc_component *component,
 
 	dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "%s  port %d\n", __func__, aio->portnum);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		aio->play_stream = NULL;
 	else
 		aio->capture_stream = NULL;
@@ -652,7 +652,7 @@ static int cygnus_pcm_prepare(struct snd_soc_component *component,
 
 	start = runtime->dma_addr;
 
-	is_play = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ? 1 : 0;
+	is_play = snd_pcm_is_playback(substream);
 
 	ringbuf_set_initial(aio->cygaud->audio, p_rbuf, is_play, start,
 				periodsize, bufsize);
@@ -674,7 +674,7 @@ static snd_pcm_uframes_t cygnus_pcm_pointer(struct snd_soc_component *component,
 	 * index (for capture).  Report this value back to the asoc framework.
 	 */
 	p_rbuf = get_ringbuf(substream);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		cur = readl(aio->cygaud->audio + p_rbuf->rdaddr);
 	else
 		cur = readl(aio->cygaud->audio + p_rbuf->wraddr);
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 90088516fed01..73c231f5c1ed8 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -642,7 +642,7 @@ static int cygnus_ssp_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		value = readl(aio->cygaud->audio + aio->regs.bf_sourcech_cfg);
 		value &= ~BIT(BF_SRC_CFGX_BUFFER_PAIR_ENABLE);
 		value &= ~BIT(BF_SRC_CFGX_SAMPLE_CH_MODE);
@@ -736,7 +736,7 @@ static int cygnus_ssp_startup(struct snd_pcm_substream *substream,
 	struct cygnus_aio_port *aio = cygnus_dai_get_portinfo(dai);
 
 	snd_soc_dai_set_dma_data(dai, substream, aio);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		aio->clk_trace.play_en = true;
 	else
 		aio->clk_trace.cap_en = true;
@@ -754,7 +754,7 @@ static void cygnus_ssp_shutdown(struct snd_pcm_substream *substream,
 {
 	struct cygnus_aio_port *aio = cygnus_dai_get_portinfo(dai);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		aio->clk_trace.play_en = false;
 	else
 		aio->clk_trace.cap_en = false;
@@ -770,7 +770,7 @@ static void cygnus_ssp_shutdown(struct snd_pcm_substream *substream,
 			return;
 		}
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			if (aio->clk_trace.play_clk_en) {
 				clk_disable_unprepare(aio->cygaud->
 						audio_clk[val]);
@@ -932,7 +932,7 @@ static int cygnus_ssp_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			audio_ssp_out_enable(aio);
 		else
 			audio_ssp_in_enable(aio);
@@ -943,7 +943,7 @@ static int cygnus_ssp_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			audio_ssp_out_disable(aio);
 		else
 			audio_ssp_in_disable(aio);
-- 
2.43.0

