Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6F9472B8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE78953B0;
	Mon,  5 Aug 2024 02:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE78953B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819366;
	bh=nYhDtJJxz0GtgSsPqfNC176hRFTxIadSr9V1ydLfELw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kC4SupgN7S5ho9FedTwvUCoWe4oASGgls2/dRZGx+TvoBYTlJ9/IQ0RNe/RAGhSjU
	 EOnpBFqrCFGxZpOAmcl6zcO1mXBiUCjin8FYQy9/a4wBa1nBCrDuJeNhxZO1gppXtB
	 ku1c+4n2f75o8QxJRxxKgSnx/yhcgVpwg75qRxhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB1C2F89B89; Mon,  5 Aug 2024 02:40:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45E8FF89B7C;
	Mon,  5 Aug 2024 02:40:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A1C2F89AEA; Mon,  5 Aug 2024 02:40:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ED969F89A44
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED969F89A44
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pKdgBLdC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsXwsoE0nWIi7Lt7+tFjBEFRRUEaSJBqbVlUzfkKuC0f2TCrvtARwMtGbWvzkDRaIYNrYF3JHyVcmC/M85HNZmUxiXAOluYkH+H1CGNcoDSlK3RPFbO082fSYW6mpv3VkXE3e3cvy7AkcY2M+gCDd2S7itvHwrWsu/NnfZ0ZFN5D5AdWNbyNlG09b3oSlAm7e1TQcol4Qz0pM/dbkJGhrlwGMvdXBjnSkqSIHvvHzpS0A/Kqnaq76NCJ1HFswo02E9cuFQn+y0lxn6GCJ2ojGur/ETZ6wgeFaSxJ26QCt+f6Q+P8X9/Noy8g7b/KUsyRxOVhh3W94JbzWu06t9wTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jiz4f3PvFB1vAvw15wSKm2E5Q/WtEYRPvjpgw7U1K/c=;
 b=E8bkTj59n2S+1aGA3dlGfHF4GZduiT7glrkvqBOT799IoGnpT9MHkWbiqWeKGa5lbVstahEzVbzH5/9kSTJDQ7ZeECwunhU6rRzRKxM7Yy5qb4ayw9sjiO+1311CjOZv8Tl3kOaod7m0QDoKd/UMWuyvY/i9Fi/gngSsy75AwWFCAGK6l9b/P8IasqqIOk1qOhYsGH2z9EU8ZwOYRwi/P3kdvX0wYn5S644czqpUg1E9wrtw0cxkUqAm6yQfSboUKuj0J8IL2c/1lo3VaCRWqoL762FAdFg1QpTk7mVLAzg06rdm5gVbcAlQZzfO1FWUuflqUdTrCXmTN5dBaGpT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jiz4f3PvFB1vAvw15wSKm2E5Q/WtEYRPvjpgw7U1K/c=;
 b=pKdgBLdC7b1fjHsgH0k3AGOxJ1B1juqIRbSjYxzhZ82Gse09zsVRUX9bffHJ9fan/I8H/SKTxnTETYPUqPi9DYhvrgZGNmyHdpZ3yk8PsuoxbZH/FXV6PJJ+u+do8FNXdbqpfXQvVBJLyXt1XyHlvlhEBTbApxQxCBToPE64k+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:04 +0000
Message-ID: <87plqnyf8c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 060/113] ASoC: atmel: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:04 +0000
X-ClientProxiedBy: TYAPR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: a0411bf7-4a9c-4688-58a8-08dcb4e72596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Det2qIaIdfOeBrVGnijpWInVW9N4/mGmDqDd8a+fD0qfr8/BKKUphnie+dGv?=
 =?us-ascii?Q?aSeYGX+oQL6rBTEyadP53GE0Buy1qavmv6y/gAM90JvTVxqBkNbzdSdJzAna?=
 =?us-ascii?Q?11GGga0KU+yXpDm6muLBkyLEkJUvJa4SdMUDF+/uSmM7EnQlu0XwY9V/ZT5H?=
 =?us-ascii?Q?MNfLgkMSmgUQKV0hHCvj1QJdaLc/uNc2DXXoY96cv0vwJPaW8t51QgnxzLFE?=
 =?us-ascii?Q?KN+Ea46iqJcytDK4o68wCIJLZ/FxrfZTejbhr+NgDWj+4Xw4eql91KLzggQ6?=
 =?us-ascii?Q?eFDaNxuYN4CBhszWVIHd17Sk0uaSw00v5npHfrew1ZqOwSVRg6m0w4CUl5N0?=
 =?us-ascii?Q?SmAqw+smju2bZ6SCrUdswayn0OxRSO+ngZdhxoG669yznkgdOzni8iBLoATf?=
 =?us-ascii?Q?zzAvfFkDMs/Yl2T3epvtDP3P3IDpJ7/5lhLUCxuJ0GA8VJ39JpWAfA2/lSuT?=
 =?us-ascii?Q?imVwOUrpmisfbCbvCt87YeakgihPXqEPbJqdkrczUqWUKpFYP3BCYmecNoot?=
 =?us-ascii?Q?JPbet9hWfAcv4WqyhlpDPuKEhvCCLWaWZgK+1phe/fCcf4LbA2dEfYmrETRK?=
 =?us-ascii?Q?6SJyfClb9M76GC+t1miTRZzHLqpCKrs6CY0I8elr+lSAZ5cW+TzjwUfoZNiY?=
 =?us-ascii?Q?8062EyHLSZLrI85sHCvOvNfDMGsj0Q5hGk7czuc4k18LZsPQ6jMD7iX5JW4L?=
 =?us-ascii?Q?qOW40JHWuiPr7kDcydXrisV4CWwdo+IKIAn5VWwqghzuPLUrJHR582AnEqFa?=
 =?us-ascii?Q?7pYYsR188sGTUGhqlO1MLiOloZGqdnIKSOK3eLbTIylXFgAC9GnUFltXVy2j?=
 =?us-ascii?Q?G/Evgtr1eS+NepeoQInOy/6LKw3I8TweDSG29ePJE/PhAwCPlhwSnTIw7ZhP?=
 =?us-ascii?Q?x6suFuqtD31jgRph/efdQk/iBbUUF5BUiYGUdVBbKNS8xwE8Tdu27osTRdqE?=
 =?us-ascii?Q?QVxi739LVLHHBIHvHMuFwr3nns/xoz9ys7+w/Du++piAmd9L6yeUjIuKkZbl?=
 =?us-ascii?Q?jwSWKOijnaKqWShrfGhUFBEPsyqfYjsamJC0U0av5p+UsNn3kkSHW1lfktKS?=
 =?us-ascii?Q?V9S7diOoOZbQt/NJ8xYTGzPcjukwqttsvBz7yav3UDey06UE9vBLwZpbECE/?=
 =?us-ascii?Q?yrHjjBdW2juFAsPVT21c1F+LgefkSKKSg/RTEANRfdOT5+A+9OkB8eSKypyw?=
 =?us-ascii?Q?yPvLV4sGCu4mNz93At3oWUMu38DKnJN8LOeACSVIDt6EFjPdPHmuJT1rfTpM?=
 =?us-ascii?Q?c+c4YywWmWOce5S+a/Oo4eZJf0CETkjjjALV8qvQSgGdR+1jbxobUxi4DBYd?=
 =?us-ascii?Q?hzR8bnlVKCES/5I0n4/MeoBj3yQBxDuFONS3xqIn5DB/JjDLSIjMKRouYWgO?=
 =?us-ascii?Q?j4K03xMcZdRyJwPSzYtOacX+5A3BLF66d/NlL0vIpPml79ERyg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?842GAAM9h5WharxwqJ7k10LuaGeeqfmbHapHBvczClR3EFVrHATKGpJD4ZLu?=
 =?us-ascii?Q?tRZ/eqwSq/fE5xdabhqA/mhZqz163ecV75ufBofuU1Og5/GC6M2f1Sx4W12J?=
 =?us-ascii?Q?tormsfjyhmZi2KaP05mlNRIv7iSCwlLBMhnUbzQ5kOOzzVuqybKGIeSv6V4B?=
 =?us-ascii?Q?KgeCqxgXWuyUgreeGTFwqxaWTM9H76Egrd60FODELnrSAVkShOG2sM1BAE/T?=
 =?us-ascii?Q?9VEnnyuLNcDAoOMr6eHFdwvbd8PwRagpSvyQeHBj6KIZvqZHvLMqp8dAb9iX?=
 =?us-ascii?Q?a3PF964Nc/Gh7154xK7bVfbnM4Ffl2FMJKACu104IkV/u4zbY/3efrYtnDPz?=
 =?us-ascii?Q?G2swfizGMSkkNI/aKFYePSolBPK3oCt/g4F1biDs8bxQRTe6qVo41SRjZpb3?=
 =?us-ascii?Q?7HnwFrseBdZRwrCxAAEebszfatDMDI/99RXSUixy7AyeI85eHWY1aeLLQZPu?=
 =?us-ascii?Q?MUlLWdZSwIkfIpsSA/VewHORxEN1D9CJktrzOLTabKuurNo42Jigr+1f6lyt?=
 =?us-ascii?Q?TArM6e3YG7O9BAMbCOaj9Vx4mBhubovAQ8vataqdDFoRWGeX1zIT1RrlgGfI?=
 =?us-ascii?Q?exdof9mIyBNqmJSfmW7mVEtAsKduBUv6MablKYSP4VjCtT/eH2dLFBuFJ8+x?=
 =?us-ascii?Q?HAEVbNCXfuCDZ3K73m5KRteFmFVVTvfAFu0yrCbhDo0rKZaxu0FPv4NNrUik?=
 =?us-ascii?Q?kIhWCF4IVnrmBjRLO5sEyZVL0zZB4EPon1MdZl/J1CPPFDOuMer1+/uE4p6B?=
 =?us-ascii?Q?4d81lEbKM0XEIoQfTLoI1CNK7m92K7pT+XQXJ/J+VIj4F5V5L9eQb+2HflPw?=
 =?us-ascii?Q?NYc8k1UD9U0xueOc7XA7n+1kXq+K5KYGH+sQIBs0LCFdKg2WkVFIL/OTeVCZ?=
 =?us-ascii?Q?lWQgPJ5yJ9rEp0aJVxunevx7l6EHA1pbBDKrvuDOg6gPOq99vMemGO5GKV4M?=
 =?us-ascii?Q?YtkA6qqq+Tx8CL54YhymGEWeqN39yrHwtUtqoqou8Va0UTfKngRu5i9eMcVa?=
 =?us-ascii?Q?O1qkQxTzoc3zBp4I6Hq0s0ueH6iv08DGO3o0Oqh0E9WvQmobpv6OQ1VxeDNa?=
 =?us-ascii?Q?EGma2wrDDAXt8gf4pMS1as6PvalC5FNxS7i4Pls2tnLySo2W7vli/O+dvA+1?=
 =?us-ascii?Q?stQze0asJ6jALHk/znJatREhSlnx1tni1IU4fzs5iGwEadZtd/tj6+aELoIo?=
 =?us-ascii?Q?M26wrE1RZ10N24dYmBgNNC0yMzCofqHYimy1JXz0PLfLreksPdEHb1ZbglVY?=
 =?us-ascii?Q?PYMaktJD0omisve+ZnJ4VD2Z0Colxmx1KY0tXmPNR71tnaivoXrgumWJArYs?=
 =?us-ascii?Q?MPSW+ww/2/Mq0IyvERTWWmKMbv7VQvUnWJhGb//EdQhGmukB1s3+Vf8qo8PK?=
 =?us-ascii?Q?hhoThERb328BDiafQ3AE/shK+SHMhehZuoqPxq4NoNJkFZ4+YZkguVGEXNar?=
 =?us-ascii?Q?kxGX3lwmC7qARI9Qvp3UdNsZ2x01nJgh1A2NrZgmlGAxMy942dHSDQI+HwFG?=
 =?us-ascii?Q?Jiu/0yC5/OynL1lsz6vpY5dvIBrV4BIedotqQxd8vOb6gFtyJPKBFliDiTXZ?=
 =?us-ascii?Q?cVZ2SHPV+hX+b2jh5PbYeIUnhsnysnGsj/8VrdjBxQxSpsJCNE1G49sbUsZR?=
 =?us-ascii?Q?sJeZXqfqmPzHHlHtfnrYgY8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a0411bf7-4a9c-4688-58a8-08dcb4e72596
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:04.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P96EwjUOCtBnxKDqrpNvBe9j+8rLNVH7u5D5ihQV7RSy5gqgMrMgCBcAE1kqdgYh01yUJ0NOu35sG86r14TM1o2wyLisMIQs1fXow0EN4a8gqLGBHlwvWU0OBAmHHmSw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: F34HOTOWIGUORQMMTT5ZI4FD54TXNHJY
X-Message-ID-Hash: F34HOTOWIGUORQMMTT5ZI4FD54TXNHJY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F34HOTOWIGUORQMMTT5ZI4FD54TXNHJY/>
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
 sound/soc/atmel/atmel-i2s.c     |  6 +++---
 sound/soc/atmel/atmel-pcm-dma.c |  2 +-
 sound/soc/atmel/atmel-pcm-pdc.c |  2 +-
 sound/soc/atmel/atmel_ssc_dai.c | 10 +++++-----
 sound/soc/atmel/mchp-i2s-mcc.c  |  6 +++---
 sound/soc/atmel/mchp-spdifrx.c  |  2 +-
 sound/soc/atmel/mchp-spdiftx.c  |  2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 6c20c643f3218..97bf80ba45531 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -272,7 +272,7 @@ static int atmel_i2s_prepare(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct atmel_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
-	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_playback = snd_pcm_is_playback(substream);
 	unsigned int rhr, sr = 0;
 
 	if (is_playback) {
@@ -324,7 +324,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct atmel_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
-	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_playback = snd_pcm_is_playback(substream);
 	unsigned int mr = 0, mr_mask;
 	int ret;
 
@@ -477,7 +477,7 @@ static int atmel_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			     struct snd_soc_dai *dai)
 {
 	struct atmel_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
-	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_playback = snd_pcm_is_playback(substream);
 	bool is_master, mck_enabled;
 	unsigned int cr, mr;
 	int err;
diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 7306e04da513b..f65c30a5dd4f7 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -60,7 +60,7 @@ static void atmel_pcm_dma_irq(u32 ssc_sr,
 	if (ssc_sr & prtd->mask->ssc_error) {
 		if (snd_pcm_running(substream))
 			pr_warn("atmel-pcm: buffer %s on %s (SSC_SR=%#x)\n",
-				substream->stream == SNDRV_PCM_STREAM_PLAYBACK
+				snd_pcm_is_playback(substream)
 				? "underrun" : "overrun", prtd->name,
 				ssc_sr);
 
diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 7db8df85c54f3..81ad08d436a34 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -96,7 +96,7 @@ static void atmel_pcm_dma_irq(u32 ssc_sr,
 
 	if (ssc_sr & params->mask->ssc_endbuf) {
 		pr_warn("atmel-pcm: buffer %s on %s (SSC_SR=%#x, count=%d)\n",
-				substream->stream == SNDRV_PCM_STREAM_PLAYBACK
+				snd_pcm_is_playback(substream)
 				? "underrun" : "overrun",
 				params->name, ssc_sr, count);
 
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 3763454436c15..3a8dd39537db8 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -290,7 +290,7 @@ static int atmel_ssc_startup(struct snd_pcm_substream *substream,
 	if (!ssc_p->initialized)
 		ssc_writel(ssc_p->ssc->regs, CR, SSC_BIT(CR_SWRST));
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		dir = 0;
 		dir_mask = SSC_DIR_MASK_PLAYBACK;
 	} else {
@@ -337,7 +337,7 @@ static void atmel_ssc_shutdown(struct snd_pcm_substream *substream,
 	struct atmel_pcm_dma_params *dma_params;
 	int dir, dir_mask;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dir = 0;
 	else
 		dir = 1;
@@ -476,7 +476,7 @@ static int atmel_ssc_hw_params(struct snd_pcm_substream *substream,
 	 * each direction.  If more are added, this code will
 	 * have to be changed to select the proper set.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dir = 0;
 	else
 		dir = 1;
@@ -717,7 +717,7 @@ static int atmel_ssc_prepare(struct snd_pcm_substream *substream,
 	struct atmel_pcm_dma_params *dma_params;
 	int dir;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dir = 0;
 	else
 		dir = 1;
@@ -741,7 +741,7 @@ static int atmel_ssc_trigger(struct snd_pcm_substream *substream,
 	struct atmel_pcm_dma_params *dma_params;
 	int dir;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dir = 0;
 	else
 		dir = 1;
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 193dd7acceb08..017f363ed389d 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -517,7 +517,7 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 	unsigned int bclk_rate;
 	int set_divs = 0;
 	int ret;
-	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_playback = snd_pcm_is_playback(substream);
 
 	dev_dbg(dev->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
 		__func__, params_rate(params), params_format(params),
@@ -733,7 +733,7 @@ static int mchp_i2s_mcc_hw_free(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
-	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_playback = snd_pcm_is_playback(substream);
 	long err;
 
 	if (is_playback) {
@@ -789,7 +789,7 @@ static int mchp_i2s_mcc_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
-	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_playback = snd_pcm_is_playback(substream);
 	u32 cr = 0;
 	u32 iera = 0, ierb = 0;
 	u32 sr;
diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 33ce5e54482be..653c575e9a1f6 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -436,7 +436,7 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 		__func__, params_rate(params), params_format(params),
 		params_width(params), params_channels(params));
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		dev_err(dev->dev, "Playback is not supported\n");
 		return -EINVAL;
 	}
diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index a201a96fa6906..1e73a720ff6bb 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -358,7 +358,7 @@ static int mchp_spdiftx_hw_params(struct snd_pcm_substream *substream,
 		__func__, params_rate(params), params_format(params),
 		params_width(params), params_channels(params));
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		dev_err(dev->dev, "Capture is not supported\n");
 		return -EINVAL;
 	}
-- 
2.43.0

