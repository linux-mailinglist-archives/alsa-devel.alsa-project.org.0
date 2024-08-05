Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F719472BB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1CF1385B;
	Mon,  5 Aug 2024 02:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1CF1385B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819420;
	bh=pZXQkenLZS4PlIyxVPNguTu/bb3Zm46mzqXGzzF6uV8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nrCyPPW0tGNX5Gq1Rhu5XnR5cLzs8AaeW1fZfcLCGbXENZiyYNiChubqV55hZ0YkN
	 2q/OFxv/A+ElF9zMOeICH15Aoirdu2RaqKUJnrxGTAzQswokLrFmy+Fu+GxLOSOmxI
	 DG9JxIeMIl35ijx3Ujjj94mqOU4xu6e2mJYzZcP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A09F89BD9; Mon,  5 Aug 2024 02:41:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3786F89BE4;
	Mon,  5 Aug 2024 02:41:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B91D4F89B6F; Mon,  5 Aug 2024 02:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98C5AF89AEF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98C5AF89AEF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=APy78nyO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VggTISKcacDBxU/USlPW+93fcGuc9fCXoY9F0sIk73vB/qofps0Av1wA1uhknxegrSqZXSomtQwUNfcNDY3yR/Qs3Ie4MQENnhKD23SOBVuKhyI6+QZeDp2ICRK8LWYeHCeom6ugOV2T6Zn+QDdmrI5Lc6C6YJfXSCCeJAtnJjGnm083M9JBZzBN6SxXPP5jzOAmoPGfYLvCctrq5FFYmUHYfW8n9avn+sPvSR4t5dc8xbe618htVij4HKhfSnRPZM84S6RTzMpMt/BoIQQyEGxm0+AkceCYuPH1WocvPV8fodBwTEwuw6k8wD8rYMbUwCgGfRATp925jSU/7GZexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBjz2IzpTVLNw/vY+NfoHHqifRx2NXLe/j1yeG+Uw/M=;
 b=nOl1LckIobEWo1GQYXJraUlxTBU/S3r1aHJUClA4UvJuPtYFnFXw/8vDNhiXmzKAetziE+a/oIrzlQMWGA7x+dpGhsuIEFZBjVtXF8nM1Bj+ijalmlXt4jwashSkUAWj07BfR5z0EzuXzyi633J6mPXwF59qsCND1NQ8fqOw6vEQUIHKZbqBki98Z3QSDAyYKsvDEzcJvxnT/h8rASQxVpcj7RMAvMsRqkAvoCE+J67CR5GLt1MuAOjic1DaJTRcnniB32j7BrzoOZogZ4Vek+wOPQmjCVKLf1TueNzAekDdIVOcrsHErTBM+pKa4g90f4EHzxvQ0ocU9M00aeSC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBjz2IzpTVLNw/vY+NfoHHqifRx2NXLe/j1yeG+Uw/M=;
 b=APy78nyO8GsjoR8qdj+u2g5AyHaE3Se0mkX0MWyQAxonYtz4WcJQQgDZIihzZSO4+tcscPBGPaXPZheHyQqgO4fsX2mwUXAfazfSwzn1/nTsLtJzUItBM3J9QmRdVvMxxiKuZxjwYGZvHBo4/g6dds3mbHPc9h6OCMiiYPbUZvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:35 +0000
Message-ID: <87frrjyf7h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 067/113] ASoC: ux500: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:35 +0000
X-ClientProxiedBy: TY2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:404:42::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0e7cae-091d-4ba8-674d-08dcb4e7381b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eBAfGHsuZhUcrgNsOBN98TPTKZdc6ONXWCFaaci1qHzGvaGTq6jXZJ3qDGqy?=
 =?us-ascii?Q?xXK4rAHkjG/FMHqMK5tT4wSRt80y816G+kNIzIS1TxOs/Ur1HjSLf9TUphZx?=
 =?us-ascii?Q?rUSCRrOvwWAB3+yrSF/IZPfa5Vz7oaR1llD7/qbBkLuZvEBkn67AaPvEtHYk?=
 =?us-ascii?Q?gA22ysfm3W8sUPY/PDPEtCaROpsaSRBY2gTyCtxaEUXCUQXZRUyfDpS2LwXh?=
 =?us-ascii?Q?ITsGIrNv2+VwvZ81y0nXMdjKTiwSHE7mnIaSrLn0OajE+rdmcsleukPhwykk?=
 =?us-ascii?Q?zgeb+EWqzWEwf4XlkPDJIOksf9AfT15FvjzGFWuJJnQJO4NrS6oL5b8uxSNd?=
 =?us-ascii?Q?RG/rkRrQAorp6YqkzehwEJX/d0LRFE2b0Q6corgiK0zzUjxjVAB/EOxyA3Oy?=
 =?us-ascii?Q?WND9HbQpOLEQF6hvOSiF/Z9iI80wiWCuOQYr04MvWLF8SolsCZa7AEvTVDGU?=
 =?us-ascii?Q?Um71imCP1fTqDJ5aUWWKTrXzIDwMEGQ/FP9rXM0UzCzVL3Hikpw4rv9WhxUx?=
 =?us-ascii?Q?WxMa3deet0uH5HPMRq2eQxpK1tGBLJsfkd1cFM1lUEor5PmlSfWwjjjEc4Tq?=
 =?us-ascii?Q?zg92nK7gMVdwaU3GoX/wpxOFfhvlQUdN0f3L+0GR2/r4DTZU50HxyM7iv9EP?=
 =?us-ascii?Q?0uSp1CaGkuWDYucqyB4h27X0su4aqH1FQfuXgElOTU5eRDv2vU3zMBykZoMr?=
 =?us-ascii?Q?Eup22Hkw+BcMQxp4DR/DBdFes1xeT67jzRK+ZzamY3oQ1Dz2dzZByc0bWSw/?=
 =?us-ascii?Q?Sr3Ejcsno6bCI/e0xc/1cJx3PhmFBSbjQhI/GAQPETQxSxzGOfa2wvxxDQmr?=
 =?us-ascii?Q?4Jp4ML54+bV23RtsOwPwIJBH7TLOj5mvflYtt+2VgURNVs1MUhj68ZczEw9o?=
 =?us-ascii?Q?qRmqb0naD4wUzQamO5xSC5qvm+YspBzG59VxaLlNH4oZU3Ny/OKfOQZ7pz3a?=
 =?us-ascii?Q?87ZoFMGO6/afkMsQyxxPFPWPu/Jnr/YlUuKxeNkgtiP9tdw3iz5mEfSWH/I6?=
 =?us-ascii?Q?OnWZLZsX/yza55iLNugvrpBf0CsYXyp9luUu+WkF/xJkL6fhI7ubfmrXAO8m?=
 =?us-ascii?Q?5XQifr83ovYVe+6AVEbCONwLXKkGToZWew3LjO0oCdSxo9iJ4F6BEPprvGIF?=
 =?us-ascii?Q?dWsNzQjNy/cDsjemfhmukdhQe4FizL9LlSOqo13ipAU8/GRqoj13HQkoVkWT?=
 =?us-ascii?Q?MEoCawq9Bx76tl7SnK6SLPqeXyZmJGqI4S7z4z2TIk6gSwc907CdDuMdBbfH?=
 =?us-ascii?Q?YtuvSmGP4PYgGIbNMuhQRKqAf7i8v3gK8OWsB1L0wXLt4bsAAAWBxzVnKwZy?=
 =?us-ascii?Q?96ArLn+QrLE7jZ7u+CxBNYH962AhN1javId59Z1pl2l/qNj2loT8DdrDjPFA?=
 =?us-ascii?Q?T3M2mQlrmv9RTwmV3IKwp9DnIkCRvelWPnol7DZrh79oz+145w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DLQFpIj3YsSRvX41o5WiGui0eSwse9xA9opI68dvxBNRsn9TMO+HB5M+Dvbk?=
 =?us-ascii?Q?cHI1eBShbSL8BkyVD0qIRJbYu9Hp4NAE08FcAtOU60sUa/N2wpSTKeywhu10?=
 =?us-ascii?Q?aHfbYvDKXY959tynTHdqGybTrpHNbz4pBmsu90nTlZVYrBZyCvKufxRP8Lwp?=
 =?us-ascii?Q?OX0SaHwCBvDf30J1Ea/SUH/8zazxEK9Mg0IjOZowmyP4dU7CpS5Ru/A88RbK?=
 =?us-ascii?Q?bf08svTRgS4KE5Wkrcpl8wrhbaXZru5TpOZVsH6l1Dp0gdrEYdSjdsUrbiYw?=
 =?us-ascii?Q?zzwPX340GqVivYpfkedNweTN/Qkq/sI/A7y/rJ7kdt4dHORurvkaM3v0ZjmR?=
 =?us-ascii?Q?muXGzn8+asRy/ACPH0hAKAVR1rgLiDfbm3YqKZygFYyuKtDJ6GBLc1cyDKUM?=
 =?us-ascii?Q?uyKBN/C5TekSBXHKGK9rbKkos6da1rKf+2sz+fEtAOjP6fAArk3ePIgJg+n6?=
 =?us-ascii?Q?OOt94F6f6MSqoai3fjL8PmKeu6xk3SZGsvdBv0a9m23sBgaIWd+ybeiw0tfK?=
 =?us-ascii?Q?otVL1la1yEopu39g+qWyI0JBEfmr9HuJARIGE7MxgBjbfZI1MsYEs54W36Gz?=
 =?us-ascii?Q?ULPAOvYP+5e0RePTfp+28OZrTLVfGvrmuKy1pFVS8xncesLdNBPUOzNyZ2H1?=
 =?us-ascii?Q?a3Tsu8ITuj+/kK5EBO9F3FO4JP/o2Qhp6PwqMm9i9EzWuv88RV8xIJsebF2/?=
 =?us-ascii?Q?N+A2dcv3wIP51Zur0jGnPXDd2257xYFAEV1+bkyRTNBd4B7euTk0CQDGvhfB?=
 =?us-ascii?Q?FfoOH1N2zwcHykb6UmiHrCDbwq0fMedCnOEFNwZ7XIgptYapt8xgrOcVCkNu?=
 =?us-ascii?Q?g+XwNXdo6p8mxpaEqTJnGUstZzcvm37xtxCz0kGeX7U0exPBwoYpm43ahjQJ?=
 =?us-ascii?Q?qWWk8+swu1xc/oXPhpg4Oq3d/sbHbBJNGeBY6xHNW7jizCPAH5N8JkRltSA5?=
 =?us-ascii?Q?iLMqyzZol+bJNNHhNV9H0qkO0aWQCF/87mbI4eKd0WH4gkHz8v+wSRm5UkRI?=
 =?us-ascii?Q?gd/Fevo+aNdN7+Fs8V3RUbjP8TwCocGCf+6w/LGoKg+YKCBxFV9VB/uzOJwf?=
 =?us-ascii?Q?9TDcriu9NX65veFWc7oxpuODa4A0ltH48tpDAG+10JmuPKrDcUVK3jy8q/Pd?=
 =?us-ascii?Q?j3fNKTwvBIxv4aheAohHkIC7qKWn/Ga24hxcN6G5guf+aA0V8qrn/5HceG4S?=
 =?us-ascii?Q?KZx3HK5hsWEaL0i4bFe+vEhoOlN2QS5bnMPr7Mm1SrgGV2zyvkVRJ625a6lA?=
 =?us-ascii?Q?nu9bQ47bGXAFOTW+vr/I9azJ2uDsPPaGXo23TUw95OCOHDO5BDz4zt6rUOVa?=
 =?us-ascii?Q?u5vyEntPU7FP1YMUGNeOX/Y/rBfYzwMvc55BrTt2Xuzgl4Rbb7A21nlfBBpW?=
 =?us-ascii?Q?vJ4xn1teqY9VoHiZ9iE7cJXeqG/FbFn7mFZUXZmBflKxJkh7hbImntjn2GUK?=
 =?us-ascii?Q?QpN1D9FBG188sf4cJWFIri9XJ9t1RYDS3HT/iTUWfsUmsMhFthMc72G4buiT?=
 =?us-ascii?Q?KyWxq6yjmsP35v4k+ihVi/Fx/xQWGIbZ/8bDeCeNftrMWU36SLrsEUh1A2zA?=
 =?us-ascii?Q?8QAiTNmf7L6y9RhuE6Fl3pkgimuTFaBYGwjW+waE5Ccl3jJLuKp9RQo8dqPe?=
 =?us-ascii?Q?lSyflElkwCRBUyrseUV0HFY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d0e7cae-091d-4ba8-674d-08dcb4e7381b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:35.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ddMHlX7v8PBhEapwbOwJufqQhnUTBfk0HseGpLamaxYmq8eG1KkQ3cbQCaaYgTjdwX7GYXV98TqxdneNatEkOR0qHhqnzWNUlz/Um0dR56xezHBU3ygdgsyycQcpuq/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: 3N5HRXVMNQETHN5PMREUG3FBXPVQJR3I
X-Message-ID-Hash: 3N5HRXVMNQETHN5PMREUG3FBXPVQJR3I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3N5HRXVMNQETHN5PMREUG3FBXPVQJR3I/>
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
 sound/soc/ux500/mop500_ab8500.c | 4 ++--
 sound/soc/ux500/ux500_msp_dai.c | 6 +++---
 sound/soc/ux500/ux500_msp_i2s.c | 4 ++--
 sound/soc/ux500/ux500_pcm.c     | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 710b6744e0136..102d4922d6e62 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -203,7 +203,7 @@ static void mop500_ab8500_shutdown(struct snd_pcm_substream *substream)
 	dev_dbg(dev, "%s: Enter\n", __func__);
 
 	/* Reset slots configuration to default(s) */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		tx_slots = DEF_TX_SLOTS;
 	else
 		rx_slots = DEF_RX_SLOTS;
@@ -291,7 +291,7 @@ static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
 
 	/* Setup TDM-slots */
 
-	is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	is_playback = snd_pcm_is_playback(substream);
 	switch (channels) {
 	case 1:
 		slots = 16;
diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 3fd13e8dd1107..1a02d66d45cd1 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -312,7 +312,7 @@ static int setup_msp_config(struct snd_pcm_substream *substream,
 	msp_config->tx_fifo_config = TX_FIFO_ENABLE;
 	msp_config->rx_fifo_config = RX_FIFO_ENABLE;
 	msp_config->def_elem_len = 1;
-	msp_config->direction = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+	msp_config->direction = snd_pcm_is_playback(substream) ?
 				MSP_DIR_TX : MSP_DIR_RX;
 	msp_config->data_size = MSP_DATA_BITS_32;
 	msp_config->frame_freq = runtime->rate;
@@ -423,7 +423,7 @@ static void ux500_msp_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	int ret;
 	struct ux500_msp_i2s_drvdata *drvdata = dev_get_drvdata(dai->dev);
-	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_playback = snd_pcm_is_playback(substream);
 
 	dev_dbg(dai->dev, "%s: MSP %d (%s): Enter.\n", __func__, dai->id,
 		snd_pcm_stream_str(substream));
@@ -511,7 +511,7 @@ static int ux500_msp_dai_hw_params(struct snd_pcm_substream *substream,
 
 	case SND_SOC_DAIFMT_DSP_B:
 	case SND_SOC_DAIFMT_DSP_A:
-		mask = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+		mask = snd_pcm_is_playback(substream) ?
 			drvdata->tx_mask :
 			drvdata->rx_mask;
 
diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index fbfeefa418ca7..36819fbd66781 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -565,7 +565,7 @@ int ux500_msp_i2s_trigger(struct ux500_msp *msp, int cmd, int direction)
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(direction))
 			enable_bit = TX_ENABLE;
 		else
 			enable_bit = RX_ENABLE;
@@ -576,7 +576,7 @@ int ux500_msp_i2s_trigger(struct ux500_msp *msp, int cmd, int direction)
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(direction))
 			disable_msp_tx(msp);
 		else
 			disable_msp_rx(msp);
diff --git a/sound/soc/ux500/ux500_pcm.c b/sound/soc/ux500/ux500_pcm.c
index b7f38873d2d8a..65a2125e36594 100644
--- a/sound/soc/ux500/ux500_pcm.c
+++ b/sound/soc/ux500/ux500_pcm.c
@@ -50,7 +50,7 @@ static int ux500_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 	slave_config->src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	slave_config->dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		slave_config->dst_addr = dma_addr;
 	else
 		slave_config->src_addr = dma_addr;
-- 
2.43.0

