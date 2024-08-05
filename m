Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C56947294
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A1D48E6;
	Mon,  5 Aug 2024 02:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A1D48E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818840;
	bh=1+yuDF6s2LKsFPJh1ftoaKrbQmW/xr6qQDzGnVEOepk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jStM9T9TMVNfixQdd48Wc1ozD6sU7vA4ILyHspHz/lsMsv24EnUuATT0z5jrnHu8F
	 7H9Xytrkcka+6yTU+7/ZzflYlAxjrAQ4t+w7SkBMFFNK9emDYXM6VientM6JKgJYwN
	 HqUw/1DKzoxCKp5wtA76BPms6zS2/t7p2myP8LOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9A0CF898CA; Mon,  5 Aug 2024 02:39:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAE31F89896;
	Mon,  5 Aug 2024 02:39:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A35DF802DB; Mon,  5 Aug 2024 02:37:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6894FF800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6894FF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MUHnCLzJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfK+6x1NP3465brh1BKLIFk6wENg0bccirBkJsyZ3Lg18s7ZGXiNjpJxVHejMPxSV5hPok33nj6YWejLP1B7RTAj5vccWTMyPrJofTB+7a/qvmf+l78eI6zt2h5YXAoynr5G1ijneftLVYiA/uZsMAH+5+NRz19e1h5XA2uoRmh87nZO9LTteMADIRLh1BeV9eX1JmFB3iJquk9PtpKE8AX/adewoxCcvUjaIzjP19ZU3fHJroEVAOq44t5Tt5nTcFYndfwFR+/QmYf6s7MHWyk1n1P2yMVtrdSFInW6YQeQR05IZYovC7XlIgidPJH71i9w1+fLthFJlBAi+Ek8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acvnMh1XypsY24mmC1F4wdUAJRkWHFir0PyFewqvnfU=;
 b=zLVGJyc9a8z0pR1jrYzj8sTyg3xvSJVuM3zoLJMpbsVdT8itcCFS8aev9AwJ6GMpC1EYZKKj8oFbagjyahcaIZy9WbfiW0jRxgGB1hlz1XXLUkONv5FwDkuOWRm3zCgmeHcqAldSbaPpj/N5LUdbbtAR//Sw3MTd3iG8eymkek7ziL8XsI7uzo7ch76l9ASHMnad81uPxMhVSX/roTTaqiBqLlx3flyAR0+efhKoor3eC6odc5D0z/Ly0SUkuxm2qVajSlz6qgFXpDQuY995gBZqygf99iY3jReCTcxpWe2fLNlqUSP9U8RbG+tQ0q8oHmxJh4nNqZvg55Pyqh0N/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acvnMh1XypsY24mmC1F4wdUAJRkWHFir0PyFewqvnfU=;
 b=MUHnCLzJwi5Ta6Ugw7gg4kVqbNVmsLVorvWEEvNaKNQLp8+RED2EY4GTqdQQYD+ny9TZ+dVLk8jjDBwu5eF6a0VbyI+ln8m0QW/LZsL5QkIYJyeCRWmBiWo7i7Wd49VYjwKJxcRvYs2qlpdrNWIR/bpHsqfjVMZ+Z0SFEzv/Qok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:50 +0000
Message-ID: <87r0b3ztwi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 034/113] ALSA: drivers: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:49 +0000
X-ClientProxiedBy: TYCPR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:4::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e83857-26ab-46fc-dc09-08dcb4e6d5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j9go+/3NE0ATkVQrYmvW9CqMecDBdd5uy/RovyUSkZmEiTHWPF+nsyRkWXe2?=
 =?us-ascii?Q?Xo1FtkRVBqrXYKoWdc9ujaIStEPbYdexYZU6gECGQ+XqbzKhxPMgcQbRp+gs?=
 =?us-ascii?Q?sRgwbwzMBHmxy4KEbvv3hoAGt+v9YVSdbQH5RfA94fSEcyXusz83jfV8RwhN?=
 =?us-ascii?Q?SWeTMdiHShR9RciOBuie4Qm4K5U7lok9lSj9+qhvsqD/Id0tcA7S/I4ue4+S?=
 =?us-ascii?Q?S4lH2NXFQ07Rst9ytE8Yb36TclTtPqHMgnK6Tk8gUHMJkqbb+3tpZiOfTjEI?=
 =?us-ascii?Q?o1g6MzDLIxj7BuLbSVxo1rhmoEdYxoY8Q+Wg4hF2qeTUkHuPGPcY+DfdeAjE?=
 =?us-ascii?Q?laKUU0tybTpxv/XGbxTTWVb0jYkHJMvfRFJ49EDbl4bDhc5ABvA7229vtEV7?=
 =?us-ascii?Q?coV5/rYJ0NOkDP6w+v2bxOYxqWXyxo1YaUiFbfN1Aj6WbeGMgSQYbG19WVuf?=
 =?us-ascii?Q?jN7P2+oLpP3DPL8nKEEyS/RlhgYIcWsQu1hnaAiOGq62dO5pLZMv/A960Q/v?=
 =?us-ascii?Q?kISpwYnPI0S7qKuf7NlOjScxLuXq0MgJUxHpJRPbbgNUwNmO56ffAwTydJ7p?=
 =?us-ascii?Q?yACl3eVoTbI07Yyx8xM26nhZb/o2K9XVe2c3c9ZjY/vTdKvPsIu9pigtEvtd?=
 =?us-ascii?Q?UG7dKrp74bbYl76XXIndGfGrZ54osmhlQt09kN2jOHDatUPsBUJThoz037qy?=
 =?us-ascii?Q?q/rdCnwZmBUYv0/sg/87eCRUMJkV7jPYMGQB1v19jDegBIcjzRh9ZnY9M8IV?=
 =?us-ascii?Q?IPPNlqOiufc5QH7reyT50VR3uI5Dh/3YlUzUSyBuHjzAgz0iMG9ukG71OCN/?=
 =?us-ascii?Q?AtzZHQWNTphTn8f9gDqIcPh2PA6dIsnTeNre3osP24KiwRyTEYYs+tqbnBTE?=
 =?us-ascii?Q?qqM5Efz26I7II10T6VaVPW0iol/wawM7On9jJkoBpRicfNpPciTkaTErdElG?=
 =?us-ascii?Q?iiPrZvcsrKg+r00q62XJUZsdumIdAQvTVFhQFFwfzYp+CeqBxSsCwIB0rFDu?=
 =?us-ascii?Q?MaNzmK2uOElSJb6BVrJmCxIE+NTqRBID0xETKwShICaBITCdt1rBSraLdqus?=
 =?us-ascii?Q?P63ru+6jm3sWEJpbsJPQYncwcRKNd2d6PrObOhN5oRt9OICw8z2k21+XyrgD?=
 =?us-ascii?Q?Tv5gwgAZ5d79qeRS+cA1en5mlH1kw9JV5Qla9HOVhClsPpleetpjYkrpVrci?=
 =?us-ascii?Q?oVxHAzs5VIsEmLU77eoqXlW9oZKWfH5+fSOftRj7XGV1VlUOt3OYAcNBGHgO?=
 =?us-ascii?Q?6+8tsZz8l31CA1kg9/vAAWkdzgV533ok7NIctK9A/os7FOAIphNNrrrtD88a?=
 =?us-ascii?Q?X+bTUg6j9QOQNBfKceWwMcA2JMa9S3B2WTb2fPxgEWkRyfrR9OhgdRHn4qF+?=
 =?us-ascii?Q?uhQuz82OPNh0UH4ao14A0jpavTaDDqUH1VqaxuhvaZHsWNJXhg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O89QqK9LveEuYtCe13/qYH6XjI0sRKtQxFz6Plrlqx60vIegk7WAQ8v8U5DD?=
 =?us-ascii?Q?uq8H5jDs6N0CeD4C8IcualfryQuv5NDD6mRSZc+f/Bedb/wxsAJEHXjQomJ3?=
 =?us-ascii?Q?tlKKojYMqu5nnLLXJsl0MWeWPzBNcIIP7WnmLj3dEAvBNrMu958999bie6me?=
 =?us-ascii?Q?WxvpIjdpWnJisvVlCIwxVxxooBrhFDj78Bcd639QiAC2tv4ftsDUk6CCdzm3?=
 =?us-ascii?Q?B2I82y7mBeDYh4rvU7Hv/jybnJctCFrTW3QLZizyDwS62fwg8+RNkAiRPwPV?=
 =?us-ascii?Q?tbBX2EEPmAHLRzGQdkwdXjeW8cg4jMWQnFKNQ6L6A6I1lXySMGMYudROGRJc?=
 =?us-ascii?Q?X0mQ2ZOc4Gfq9+YchBes918as3vFNXcXctUYK4bkaky1kt+hWw5i+kyr1GyD?=
 =?us-ascii?Q?2EOsU2298/jJ874UqU3Ir3pZTrD+qI9+2kyH8w7q57CnzJJJQ/hY7WTEdvU3?=
 =?us-ascii?Q?clnvONuIuscfUt+fvfjte7Rt4l23EDkcH8xOsxGVtfdcfqXkN1fr0C4I5m5P?=
 =?us-ascii?Q?NIp5O1TdEo0IWpH2tqEGPUR2MX8K2eRl+KL+iI7mu4J5VCNYM+JkgdKioKoa?=
 =?us-ascii?Q?jkFLxsA7o9Bi49O5Y+Dc/uDVlYjZ4zF6WPcIbA81pmpAHTTiPPtTFKrXlQtE?=
 =?us-ascii?Q?hgasZjPs2z9rC7G4K/bPfdZrYN02+hebsZH7VwoXJeAtkdGyUsDMneSgKzPy?=
 =?us-ascii?Q?g2m1ywR7NdKLJsxEl7cSfHVmFjMN7hE7vyvEkvOpu4uAd7BmLmrMNCnlcF6y?=
 =?us-ascii?Q?d0VBpFrkQV1P4U2dMWeimRuvs2bdaXskI+2QwhDIuHvBQEVGRDzQPxn6f4cD?=
 =?us-ascii?Q?evuXHCKIjF1yaYn/2a4vC8AxXo01RhmD0gvFHNbnA5wjv17RCQulVUEJ0ZKS?=
 =?us-ascii?Q?jsh9dSOU6X7XLt858kqzfT7TOPCuZarxqizLk5tYd3n5aTWbcJsMDSE34eWy?=
 =?us-ascii?Q?7Rjunm5Zay/OG3pUJmmIJf402bM0nARKU/s+lVwkhB6/ediHOHONf+N8CE2n?=
 =?us-ascii?Q?tEhu4mYW0gnt4MH4USk3rQcc2o74J4ZRIsh8iNRs7aFaiOV1VDMhyGMwXgaQ?=
 =?us-ascii?Q?wOmXHCdX0K4mP4GFItt4ZH8T72ozJ0cRVHV7LaNNSMTNwhAC4VONIfRbcCXb?=
 =?us-ascii?Q?oJfKzQGi/1Om0HelE014BZztl7C3LmluknYLbkmuksuscfg4H1kApQ15j6tw?=
 =?us-ascii?Q?NsFzoyIuBhMWzdr7r5UCeyc5NCsHNJPAZ8oe874YjwBe0seD00eK20Ydjm6Q?=
 =?us-ascii?Q?2QYvDK5wu6mQc9UuNMvczaBQyZRo4Pbl1XZIi6hiok4kCWL+bH3pk8p7T8eJ?=
 =?us-ascii?Q?EceJNM/sO8F6ucAWxw0/oytbz2tTaC6tAQeDzBlpphgJdeCJI/A/1oJ8s5Oi?=
 =?us-ascii?Q?awr6TKWJI2rJGqacduGhQf8BEznCbNJn+nHP97/lv3gOu/tqA0NdMOWKUlvh?=
 =?us-ascii?Q?4NsPSSI7EkycSJfL3B/kysLZh54B020Dn24d5XSHUuNri6hPHakzk9nHr/kF?=
 =?us-ascii?Q?omFGHE0lRTHbi/UrmgPXpZffHn7oGhV09qhJTFRdpk/ROBtykLqJNs1sB2Vf?=
 =?us-ascii?Q?N3xicIUzYp5kC5Rdl+JCyDKqtCmm0vcnFN05l8xYaZ+W7Pke/KONYuFP949S?=
 =?us-ascii?Q?anfNFaQRzGQFELiRPlE83U0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27e83857-26ab-46fc-dc09-08dcb4e6d5ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:50.1437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZvtkxgYDxWRdL6++nCXu/dTJjGjqw0DfIE2yUbdpXBQJtRZJrUl8B5+aVMDus2dBw3YGhayLAzNN8bMastwhRddxXX68kxne1tAyxq5bk+3+ugYu6YrgON+Va9vFlDye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: RXV4U5IOWH7D6DCQR4LHSIVIUVXKN2SF
X-Message-ID-Hash: RXV4U5IOWH7D6DCQR4LHSIVIUVXKN2SF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXV4U5IOWH7D6DCQR4LHSIVIUVXKN2SF/>
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
 sound/drivers/aloop.c   | 18 +++++++++---------
 sound/drivers/dummy.c   |  2 +-
 sound/drivers/pcmtest.c |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 439d12ad87879..9d33aef59e95b 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -193,7 +193,7 @@ static inline struct loopback_setup *get_setup(struct loopback_pcm *dpcm)
 {
 	int device = dpcm->substream->pstr->pcm->device;
 	
-	if (dpcm->substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dpcm->substream))
 		device ^= 1;
 	return &dpcm->loopback->setup[dpcm->substream->number][device];
 }
@@ -341,7 +341,7 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 	int check;
 
 	if (cable->valid != CABLE_VALID_BOTH) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(stream))
 			goto __notify;
 		return 0;
 	}
@@ -356,7 +356,7 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 		is_access_interleaved(cruntime->access);
 	if (!check)
 		return 0;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(stream)) {
 		return -EIO;
 	} else {
 		snd_pcm_stop(cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
@@ -418,7 +418,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		cable->pause &= ~stream;
 		err = cable->ops->start(dpcm);
 		spin_unlock(&cable->lock);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			loopback_active_notify(dpcm);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -427,7 +427,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		cable->pause &= ~stream;
 		err = cable->ops->stop(dpcm);
 		spin_unlock(&cable->lock);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			loopback_active_notify(dpcm);
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -436,7 +436,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		cable->pause |= stream;
 		err = cable->ops->stop(dpcm);
 		spin_unlock(&cable->lock);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			loopback_active_notify(dpcm);
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -446,7 +446,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		cable->pause &= ~stream;
 		err = cable->ops->start(dpcm);
 		spin_unlock(&cable->lock);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			loopback_active_notify(dpcm);
 		break;
 	default:
@@ -497,7 +497,7 @@ static int loopback_prepare(struct snd_pcm_substream *substream)
 	dpcm->buf_pos = 0;
 	dpcm->pcm_buffer_size = frames_to_bytes(runtime, runtime->buffer_size);
 	dpcm->channel_buf_n = dpcm->pcm_buffer_size / runtime->channels;
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		/* clear capture buffer */
 		dpcm->silent_size = dpcm->pcm_buffer_size;
 		snd_pcm_format_set_silence(runtime->format, runtime->dma_area,
@@ -513,7 +513,7 @@ static int loopback_prepare(struct snd_pcm_substream *substream)
 	mutex_lock(&dpcm->loopback->cable_lock);
 	if (!(cable->valid & ~(1 << substream->stream)) ||
             (get_setup(dpcm)->notify &&
-	     substream->stream == SNDRV_PCM_STREAM_PLAYBACK))
+	     snd_pcm_is_playback(substream)))
 		params_change(substream);
 	cable->valid |= 1 << substream->stream;
 	mutex_unlock(&dpcm->loopback->cable_lock);
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 52ff6ac3f7435..5e440f952449e 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -570,7 +570,7 @@ static int dummy_pcm_open(struct snd_pcm_substream *substream)
 	if (model == NULL)
 		return 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (model->playback_constraints)
 			err = model->playback_constraints(substream->runtime);
 	} else {
diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 21cefaf5419aa..ae308ede80929 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -351,9 +351,9 @@ static void timer_timeout(struct timer_list *data)
 	if (v_iter->suspend)
 		return;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && !v_iter->is_buf_corrupted)
+	if (snd_pcm_is_playback(substream) && !v_iter->is_buf_corrupted)
 		check_buf_block(v_iter, substream->runtime);
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		fill_block(v_iter, substream->runtime);
 	else
 		inc_buf_pos(v_iter, v_iter->b_rw, substream->runtime->dma_bytes);
-- 
2.43.0

