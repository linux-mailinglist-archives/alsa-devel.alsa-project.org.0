Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246C94728D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D1C4D51;
	Mon,  5 Aug 2024 02:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D1C4D51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818788;
	bh=w51gyK8BRji5NWp78Yy/p3fxZBUPFXZIUKoW9IkJOhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bXTlI0KHWWut282acxDA+TI0Lbsj1/mEmQ9I0Xa5uf3NiOb2vBUAwLSiGZE9DMJuN
	 4nFhACdv5oQkMcZ6jEGKq9adVCvPFawg4cPh0dy69KdIG3DyUJQ/1jHYrTxK42CIuI
	 P396Ux3UqshsJquX9rGwAB/9cuCkGRSmJ/60MnYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43236F898BF; Mon,  5 Aug 2024 02:39:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F7FFF897AC;
	Mon,  5 Aug 2024 02:39:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59065F802DB; Mon,  5 Aug 2024 02:37:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E7C3AF800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C3AF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AOvPu1lH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCREf8kbhVwCgPAK9LZW13RAqfPqbpSt1V+qFokOW4zobSGTgGfzgH7dh8hzLCpyRFjemsHDvxrXNaOojRTIWejZxpmtOexNkd5k5r98m0IVClRY5MJUUth36U0auFtyJauF+Bzfpv2AIf2p7v5n04l1wfJJLbfyEpBrrVir8+BoQPPwUp5U9cZXbJkHiHG/M1IO2T3qOFJ4C9pR0jPx55r6bHfzraz4AF2oy8mAyLcGQmZjeR3I/Re6ss50bkdfEj/01S1W+gJM2u9T+XSA6mSCeSpuZLXrckAelzoZFB3MfGqb3oFGCtkn+ZSBLuec2eblG//tVI8oAnLi5kj3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6E14dl9bU1XSn2qQdzNIJIGFp605SdCrlh0Wr0lhog=;
 b=Xo4dPkwkecduGQi/R/E9uqXKwW4mgk0Eyp3HJ5iNsVRdjhoXPm9NZ+cbNqwT56U+gLf7YOufVKPRpOAqn9B/CgByDs8tEi3DQUHf8asfKDqVTaWZP+3xlg9V5aonWgFMcUjK2aWkQFDRBpWZyhEVKMhaoXeg56019H0etCse0rqtd08Fl9cqFMTk1epTxyBodGQtIDvHd2VZih8EEMpGrg/YDVM8FSijRIXGy/4SZZWtsLxaIMoKkWs8JjUGcOaB/vSV9VU1cR+g7Y02UmaZPbnn/wQep9w9p4xMLcMtc3veZ9sZZdWTOlfiNMgY+dYHEdFEzPHrl9R7d4uupfWfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6E14dl9bU1XSn2qQdzNIJIGFp605SdCrlh0Wr0lhog=;
 b=AOvPu1lHvi65U/38lyWQLhJU+lTNm+BgmkzaYbD/vZOe3iOUbI/8qaZC+15dqyfYRtTD+Io5qOaFZUARF40I8OWUZ9MsHonlHcOH84mL3t0BFGXMemNsnVVTv8WGVoXYDs/f11+PDejosJigXucmOLrrq2jFyJumHnfiNZeG3uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:56 +0000
Message-ID: <8734nj24bc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 026/113] ALSA: pci: lx6464es: use
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
Date: Mon, 5 Aug 2024 00:36:56 +0000
X-ClientProxiedBy: TY2PR0101CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: b929793c-0c93-4216-920b-08dcb4e6b5a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tMkKsSb6tHvwFOA+K0EGtFjmOKIhFydnHl9/O/XehUC+NiieJA+A6Vd9ECfB?=
 =?us-ascii?Q?smyFwXkcUN4jzJ0xoJKLFCVstktw85XZs0ZjxzLKWCLi7vm7wHk9XcMvxMFd?=
 =?us-ascii?Q?QeCeR/QuSKf7x8rrxoOhgHQoTRQ6Q6wHknwHWKBjV1DV23ebjE5shfheKjdj?=
 =?us-ascii?Q?m0S6CcIwjI6NEDx8Qx5YXuZfl2mZTBLQ0bPsqj1gmF4XnsWxvEAATHwCTWHs?=
 =?us-ascii?Q?URcQUTRVBlHg73O1MMJCFWiqIasUr771eK8CXQMBRcdV3uXGy714u90ybKjI?=
 =?us-ascii?Q?ct6DS9TnZrU12+8iu4GrDUpIeEu/F61YPWJJLM4oeOLKF6IjjzZs6M4GLizY?=
 =?us-ascii?Q?U4BTfdqx8QCLaPSD+Q+jZTyz+yPfxNRfgVYkQFB9fTm1zq2pjk8XxXT4Lgx9?=
 =?us-ascii?Q?mhrtwHLhmd2AJZKfI1J+PfdeUfBNHX4Ftar3nyN9CV1G02kRBrBp5qBeV5RU?=
 =?us-ascii?Q?7hf7IDH2JUuZsMaDkKNPz/T+bpbBsCN2lwaHF3OGtWd2kR/SSWXZjfb1E+Xx?=
 =?us-ascii?Q?Bmzj5dZbOFgHUKY78wmCC+F9abLzCSKqrM/gkbM6/fbJoDrnYU/tgdmDb7Lf?=
 =?us-ascii?Q?IH4IvdpNLjDyIrJov8XWq6mzOLSXordxRQoSZvZJ2jaTjx98hm2xy1X278Pf?=
 =?us-ascii?Q?pbzRzMNbsMRcNeBy24BIdZ2WkLHhHJ1iZA0sQGwn1OZ3HrXvtPD4N0TabRV4?=
 =?us-ascii?Q?r3byG5LzzoPrvPJ6DwzDbu7RTpEjwuvj6uSk29OIrjHR93ANzl8ZBb8m3v2X?=
 =?us-ascii?Q?krEgmBxZmCQvZEL4g3zgpvUA5Qnql0USaqfesgY5pZ0Kpt4aaJX2WrDp4Kzc?=
 =?us-ascii?Q?+WPonNdt8oqyapKtMBy26sYzjkfy8A/oSqFJWpj1vxsCyD6V4tqdioTkQs9P?=
 =?us-ascii?Q?9iP0w7WHpPGe502pKVAe6UFnYLCqIK1K/0sjPafCRClzDqRoRYVbAsm77Kwg?=
 =?us-ascii?Q?Mo5UYV/Xg6FsgalOq4Me5iOZydmLfHJqQhzRgS01A/LAc9+IKpfEe0FQuKus?=
 =?us-ascii?Q?JYS0GiI5adt1KaMvXXmAAH7wFrZrBo0s4cxUxPGc22ZJ1Uw9hwuuY1muD/B+?=
 =?us-ascii?Q?DCdnw0Q78WoTMC/34JR7QKYMy8a8ZteQej0LkAp3SVijZ/oTWpOKl2sykJlL?=
 =?us-ascii?Q?dWwlXG56kT6NKCg83El2KGGgMIgJE8xa4MTjYTG2+fV9/f14QsRrzR2qxW7A?=
 =?us-ascii?Q?PkoZfqYIL5UpseqSRxfnSaLayi+JbgwF3PslrtDlqyfj9RPMmiCCmxK6Y254?=
 =?us-ascii?Q?W2WURZAnKzwL8boyi11PoLA51/LjJc5iZEKOuYtgDSvVwHTiqYEQrPDZ8x/R?=
 =?us-ascii?Q?hjF76dzWkSwJYmCW6LmEJvtGvhfhOffcARpfxRuR745JHs8KPbbURqUp4OMh?=
 =?us-ascii?Q?yzc6LzAKFoXEl2SFhYviG/dglekG+u6I/qV54GB9vw1Q7TZcew=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KOIu/zavegrQ2uJiisuLVd+Ck6mLDqS6HuormBD7XgDs7MSuJ03HEun9V2hP?=
 =?us-ascii?Q?QZcfQDK7/E1WdiGRjlhuELkeP+vp8OIDbcycaH5l2HSOKe26qTqODaoSMA2o?=
 =?us-ascii?Q?Ovym0NhsdDZGf/oHybzvoNIlM4ZzrGISsbazl6mtz2iRryYAZPxWVtlY4rUX?=
 =?us-ascii?Q?Tymx+YUZii7pPmzhNaaDdx9fv08GlgtZppytuFZ/owJ2T6ktZyAXioTqOOYR?=
 =?us-ascii?Q?oEAZYXZ7wS7Z+vmresLvyheckKOa1KVePX/pv3ZFOHbSQBhgH6fDJzU7LkMo?=
 =?us-ascii?Q?/qahBhYHQSAG27cvQRCmDtz6sXWQAYvdnLuApP67sF0WK8dIHE1ysR3gqYOc?=
 =?us-ascii?Q?3Eq6kXSURtZ5ZfmDzxOLr6tj0jfPZ/Wh7q85bGLPf24FUJsegxRc3e9nab5n?=
 =?us-ascii?Q?3VV8iNHZY6GW92On2oDWcv/CXfY7Dc8pLZvQbuD99RN8C8H2XDfQdVIkT+iO?=
 =?us-ascii?Q?7R5XD+z/1tbEeryx7OlmAXcoDoS86Os/PDfyHqKE/JC0sX06HbYHiHMEzjqq?=
 =?us-ascii?Q?p6oU2/HxOUGPszax7zu4sd4tj2zRVE173lHy7SoTYXciRWqvQ1le0APGrxSs?=
 =?us-ascii?Q?5c4TWbN4dmar6GAl0/7X84Gp0MJuT/bcs9+uoxF1wjFMJwoj3k5ykz0TkCG8?=
 =?us-ascii?Q?3QMRfFHRDhYQxWD7+NJDxK9DyQG6FqkwurwZSVTq3Cs7fMh/cuzIt3p9iWs2?=
 =?us-ascii?Q?oI9kbS5M52+O1pt43tCiStH+PLBQSH0uL1YWBlhANv78yD7KcQMfj/0qHGgB?=
 =?us-ascii?Q?6lYD5YdqfWvxND3xrW84/amk+YD9t8iRqiwpW/Q5nwVNGnaciPbPUD3NeFbR?=
 =?us-ascii?Q?AuwRvSVW5zTUMFbNEg324JMOt+sdwjK+ZUiC5NvKDBiseSwbgyLW20sSbcXi?=
 =?us-ascii?Q?AjIJCpB4WqabuumMUvuIfUm6hCU4cNr1DFw0ftQLPb+3rpzdSEtki5O/VHkG?=
 =?us-ascii?Q?3Nv55aqssomKFrRCRttTRtc/xPKrcvnmoRWK8CphcVUbHlmGjjKihyKYgKm7?=
 =?us-ascii?Q?9hsbzD3D3zihktHPiVTZ9Rz0dSDMC0FUgH2jUSvGAMSERdvpaV4yQ+ZnxBq8?=
 =?us-ascii?Q?zjuFNZwMZ+56S21/7m6vHto8nYxUzUl5Ruic/6WDKrD/KdKDdTCSNo+KGY5I?=
 =?us-ascii?Q?xYhuXygpI6Zk11W01cO8dzE4SSZ9y3lFwSnhFlb+hXRSwYe8QtSEWgm8rZFY?=
 =?us-ascii?Q?NWskXwjN7AvckBtkK2Hi/Ji6Xcvsivd07Majnxz4MlndTTcwiCS1NDci0B7b?=
 =?us-ascii?Q?QgyP81TpxmNt2IF5Ovpxo4BLRqciHIfmW5ycs1WjNTwx1WIT6XlVquH1JD46?=
 =?us-ascii?Q?EhcIS2djGLpWW6q/XQp+SIg4L+eZsAa2dtDRZzjfPFpedeBwtjGqIIzKHigC?=
 =?us-ascii?Q?QtzTFi2PWClwpzbHntWrmt07847nUYdSbwBV0hvBi1HKY1DLL12zX15wh6Y3?=
 =?us-ascii?Q?M/UxkgGQO8PrqcHTOesJLlj3lNpqQoXxHcN1O9rCdwNPpvbJ/mutsg6Z8XFh?=
 =?us-ascii?Q?AGkYgoJX7zklL62pV1Xq0iVAYm4RHso+A0ciUgRoP64Z8WvDREbSdLIrh3/P?=
 =?us-ascii?Q?MjUbmN4J0EFPpDyAA86H79GYP9e1N4oV4duzOni4pHpBgK/52FthyKwpZJLt?=
 =?us-ascii?Q?OMfmnwdBQl02NrKwB5ohhHM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b929793c-0c93-4216-920b-08dcb4e6b5a5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:56.4726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LfEOWjBmavKJVb2p6KpSAVfGvtmaH82E5ZVaFg9rEQ8Z/OcNkG4svjJtY3GY6JC3VoBH1ViiUA0mVDkFkKU0TWQPuDI+AyK4UCRvmvpKyaGoGPFWC8Nr+Lzg4f7ICwyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: 6Y2MO3GADLG63ZJ5TPE4ZTLS4SNUDEDL
X-Message-ID-Hash: 6Y2MO3GADLG63ZJ5TPE4ZTLS4SNUDEDL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Y2MO3GADLG63ZJ5TPE4ZTLS4SNUDEDL/>
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
 sound/pci/lx6464es/lx6464es.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index bd9b6148dd6fb..721b4ea3103ac 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -98,7 +98,7 @@ static int lx_hardware_open(struct lx6464es *chip,
 	int err = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int channels = runtime->channels;
-	int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	int is_capture = snd_pcm_is_capture(substream);
 
 	snd_pcm_uframes_t period_size = runtime->period_size;
 
@@ -124,7 +124,7 @@ static int lx_hardware_start(struct lx6464es *chip,
 {
 	int err = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	int is_capture = snd_pcm_is_capture(substream);
 
 	dev_dbg(chip->card->dev, "setting stream format\n");
 	err = lx_stream_set_format(chip, runtime, 0, is_capture);
@@ -155,7 +155,7 @@ static int lx_hardware_stop(struct lx6464es *chip,
 			    struct snd_pcm_substream *substream)
 {
 	int err = 0;
-	int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	int is_capture = snd_pcm_is_capture(substream);
 
 	dev_dbg(chip->card->dev, "pausing pipe\n");
 	err = lx_pipe_pause(chip, 0, is_capture);
@@ -186,7 +186,7 @@ static int lx_hardware_close(struct lx6464es *chip,
 			     struct snd_pcm_substream *substream)
 {
 	int err = 0;
-	int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	int is_capture = snd_pcm_is_capture(substream);
 
 	dev_dbg(chip->card->dev, "releasing pipe\n");
 	err = lx_pipe_release(chip, 0, is_capture);
@@ -268,7 +268,7 @@ static snd_pcm_uframes_t lx_pcm_stream_pointer(struct snd_pcm_substream
 {
 	struct lx6464es *chip = snd_pcm_substream_chip(substream);
 	snd_pcm_uframes_t pos;
-	int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	int is_capture = snd_pcm_is_capture(substream);
 
 	struct lx_stream *lx_stream = is_capture ? &chip->capture_stream :
 		&chip->playback_stream;
@@ -287,7 +287,7 @@ static int lx_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct lx6464es *chip = snd_pcm_substream_chip(substream);
 	int err = 0;
-	const int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	const int is_capture = snd_pcm_is_capture(substream);
 
 	dev_dbg(chip->card->dev, "->lx_pcm_prepare\n");
 
@@ -370,7 +370,7 @@ static int lx_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct lx6464es *chip = snd_pcm_substream_chip(substream);
 	int err = 0;
-	int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	int is_capture = snd_pcm_is_capture(substream);
 
 	dev_dbg(chip->card->dev, "->lx_pcm_hw_free\n");
 	mutex_lock(&chip->setup_mutex);
@@ -515,7 +515,7 @@ static int lx_pcm_trigger_dispatch(struct lx6464es *chip,
 static int lx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct lx6464es *chip = snd_pcm_substream_chip(substream);
-	const int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	const int is_capture = snd_pcm_is_capture(substream);
 	struct lx_stream *stream = is_capture ? &chip->capture_stream :
 		&chip->playback_stream;
 
-- 
2.43.0

