Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA94829223
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 02:30:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B71AED1;
	Wed, 10 Jan 2024 02:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B71AED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704850224;
	bh=iA/SFRCVC9BjgrSKXcq3bzzOecfCuSDWv8bjnS09iAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EtciZatKD55fMgQ3IZFTnuttJDYMvEfsIp2s5EoKx5Ft/wBNu3XiadwmRhFY/pRr9
	 ctsM7EqU1Y8ebZGuZeA7f5NW3BJ+t3zaO9dQZlFl6xS95nyrhIm8cn3DJ1mY2wS1iw
	 3+Chyf2cuKic6/gt9V5M2j+q+j0j9xFvpuSaHxpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79BA0F805B3; Wed, 10 Jan 2024 02:29:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A37BF805C3;
	Wed, 10 Jan 2024 02:28:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2555CF8057C; Wed, 10 Jan 2024 02:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAB68F805EB
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 02:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB68F805EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fJiqHbLu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WY3nyZ1N8MnEQRgvzsv429g5AxKcs8l+J7gzZMq1KJNtcKSmNtBqnrX5m3rjgL/LyAfwRBZlps8WGm0DGYC8ihEVLg4xsXXV+PuuaCb5C+0cTVDsdlJEHng2vDpXmnbmkfTyfzY0F122LaGGX3FIpueFFXq7KYlh2K3HHzgfSUYgqdNMRHTLOLqgVTC14U7hdglo/uMmlCFxMG1CBrtJQnM44Tztnn+l4S1S0+ow1reJ46niywfFFMPwzyAEiqYIsMOvy5h3RBmyrZwDvN+L/F+b7oysFW48gFM/BZtp/gha1wXkHYDgaLcTcMFLBRdsP6UVE2a5cTk69FtuON6Byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IUyM23PmUoT9MSPiG09dFBkFBMHSWXfMA8o1pe1uF8=;
 b=g4K9L/xo5yK1jzVhKniC8vlzffvj8+MS8SwUcXtF/IY7Zx2fUw2vVNeg7Y1IAVvRKIBr2Xc55+PrQdANsbNXdwTIuKuhtEgOl+tH1BBJiIaMPubRdGa/ShpTfkOz5eTAbINLpZOlSEB7li2ue6zLJWHqvUKvytx9rACEtBfkmBwTKc+EJi8F3huWOe1qrC7zIfK2R44pe5Q3OmVoYeeoGrgHAPm3kijtqlAHuJaBPU1U3GBNnm6n5Hcmn3uFGbsfHl93zb4Ziavb9vBEuuwEgrun00u/83sRZicbMv1+nrxd+noAa77DUZI7abHG5R8QI8KdRVMjlDRX7VC/ojIkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IUyM23PmUoT9MSPiG09dFBkFBMHSWXfMA8o1pe1uF8=;
 b=fJiqHbLuKDUqrEcnwdCK5qPji6RVEzc8tYeel+D3xChHKRAbg485D/kNDjV0KrZEM5sR/sTmkwf5gTadxFJ5k5cMSMxhYQOWdIROeABEvU8x3vj9P0lfqMze380WCtmO+gp8nIB/430S/34ZbtoI8ZcgshJstQgr8qc596+BO+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:28:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:28:28 +0000
Message-ID: <87y1cyf03o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 6/6] ASoC: cirrus: use devm_snd_soc_register_card()
In-Reply-To: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:28:27 +0000
X-ClientProxiedBy: TYCP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0ddd40-949c-41ee-99d6-08dc117b7276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ttVWvbsKvHl1UP4wEWmcB34+JsEia6ftjSDfa4FbFIw7Qo6cvw7m1UolYvvKMHnedtLlKAErxLCo5UZ8k5DTIaTAn17d0D4VsCI5y6pztqn/QpkSvnINf5/E1y0UHyd4ZO5f8U9occOMe4azKtJd+eyVVOZTy64P6TJUP5E3lY2KeTH8NfcYIir8lIKnsfnMdLYNdhuLX07N6ivNivnfSewJZQ+qA9YGq9Mkg+EqDzutGaFj4mDMKTTitPPh43/xOt6oX5oKacolQENunUSKBak5eAL2RTsQ8vJeiLp2hyxluyu/anbLWpVdnqxxA9tcJ1FLvIrquyxZ9lxKqISIVQmBsqSdT5fG2CiBMdBHl7XZpUHFKdqYxok/Zrz0/DnrEclQDOXTgNKWdzemIXbYofxnfwyAWF7l49lhuVAKQyvI2pg9jvdEjlGI/zJRVLUFWvHWz77uJhzHoWYrjSx/zO3C2ZgW2XNFBpnb6/D9GK/N8lmq6S2OKRlvaZ6zNH7/hyHUPp3jp17nzruIxFj7rGVjxlg9F0okl9EM1eRL/vf7HRygpKbfuE1sWp2XmcbqBrFD+zSUpdfX6BGL030g9FVBjMKPCZdX18FaK4j3Lj15sYhEhS9tvDBPQtt/vMVi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(38350700005)(36756003)(86362001)(83380400001)(2616005)(26005)(66946007)(110136005)(6506007)(6512007)(478600001)(52116002)(316002)(8936002)(8676002)(6486002)(66556008)(66476007)(2906002)(4744005)(41300700001)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1CrmEeDPG2LQWNGsIMOfXY/wWk1TIC6fFzSTJfTbt8QeBn7rmsxgMMTueV+l?=
 =?us-ascii?Q?oLsd4/NnI38A0GPx1QTBVQSbcyhGp18thNjl0k2URYVN/CPLqUVutreJ8Me0?=
 =?us-ascii?Q?ajcQdtxvawTSgL/X4SlhYx7nx9bpo8u0k98IuiRQarW5VBWiuETKhgDqSSca?=
 =?us-ascii?Q?1ied+xPXBfeanhk+KkH9G+fet0Fndg0nhRTSD4yhPb8LQkunvGG8ijCAFhXn?=
 =?us-ascii?Q?hm2UGhXo0NPhmxtdQILOlMSigjaFjTsIrYIkt/lTFf9+G36Cfi0AnU4ShLxY?=
 =?us-ascii?Q?h9b/Lgg0RJmD+upHUF/GbdwQu7UYkrCjnVBMpzkZBwkz/FcHtep2w5Vz/azH?=
 =?us-ascii?Q?cwE/trYjl5CtgtahSBOWC12C7RVF3XI1z+eHMk1/Y/Qa6I/mZAJwaS7c360x?=
 =?us-ascii?Q?T/CgIWvXd4ZvvZta0RaL7ZZiGOgPfs57xumK5nVeBW3Sx9oqXQjC14GQdXYb?=
 =?us-ascii?Q?KnH9nnRdrzXSzZoLCyZBHhlcrMVatR2u/hFHdD+cHjNHbqOrHNelP7ZWn7/A?=
 =?us-ascii?Q?yT8EnB4wuxzJgUWMHBcqMWfnOcHfx0ag9yaz/cWBJpLqSFZnN+8+HKHPfu6z?=
 =?us-ascii?Q?Hi+H47I2AMOZ9lLMvt1RjIU/OsFnGxl+iDaj/klAgOuxRnjENi7EJ2+U/Vbl?=
 =?us-ascii?Q?3KxNTRJGLotmI1L7WpBSNQ0xcFb8C2acjprfrMtSMlLrrRtWstjRhEaCMsRK?=
 =?us-ascii?Q?1YQo3wtja5lPoQ3Mwv376JoGH5Vhqnsl0iq0z+Deb0OYcqOHtOX7lAv8hnKt?=
 =?us-ascii?Q?LcKw8rWV4CBSMsX83exO7zbCgVhmt5STLBb4AVUthEMPLHEjJ9hAfHibygp/?=
 =?us-ascii?Q?g9XXzJyFYooUOv3VYAX4XbvQhpKdCP2q/n3qOTFAXdTtpwN6YQ1339bMlD6D?=
 =?us-ascii?Q?GwWphJK/UYhI72AYvbNVeuHIP5pArC3etY5/4hPVWg1a9mtoGN65YKXtoUWH?=
 =?us-ascii?Q?wrM7RXkvtbnBPE8oUi1mAqVMQ1Ho75bR4l2zWWOKgp4OlW+JSottHS7r4mSi?=
 =?us-ascii?Q?50+qoC5T8hWLKgrliEEuKbBJJosd7ajmIcc7oKqG0uCgcjTdlQzHxRaerVSR?=
 =?us-ascii?Q?RJIxMxMVloMvH4UL1XQXEeN1mLSHj6lR+yio71AFuuT+cF/kA2PvF+ZNTFLH?=
 =?us-ascii?Q?TY3//2N0/tyjLJWey7wmw6lCwPzGJ6RImlY2rmZQMTREWsw4tP5j8Z3jyM7T?=
 =?us-ascii?Q?Z9RdrVDrybfsjh+ZRp+VQRjLv5AbJDegJSGrdm6XsZ+TeLgUI7Fx901hpA0W?=
 =?us-ascii?Q?qARbfNnFCQzLb+lnVg2YTk7y0psCLx3UP17lYWcqMfCLcRxtyZDQzrqzR1E5?=
 =?us-ascii?Q?XHk1munCTJ4z8QDDlq11ZWYiZT0YdnKtbZ2UAcEez1Lro08B1GlBP5LDypWe?=
 =?us-ascii?Q?85jvlRFXu93HlJzfvTggHpPgLTnhr6lPFrM1DnF0/mnUAJNz5CKDg/8boSxy?=
 =?us-ascii?Q?IG/jH93RaT9xP7uUnoYZkyIevpReX/5Pis0xy3P/9Q13PzPXjoOcxYd7jdrX?=
 =?us-ascii?Q?4nMZHwJ8wmaL3/6OBDsUNQ8mcf6CKA+9gZ1Zlnc/lSxSbF2bg0d/KQiR/9jL?=
 =?us-ascii?Q?pJcPujRWMGR/DNuFOvxmbglwT022GuPn3T207VIJurlmdFxZNLcVV0UrDhlI?=
 =?us-ascii?Q?dWdqfhs1qNysRyj3iVAlBIg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf0ddd40-949c-41ee-99d6-08dc117b7276
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:28:27.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 75h9qg97397z6o4Bkg4ITSi45FA9sZrhXcOS8Jj56GYLsdolKII29wIx1PU3tJuPNYDPfLQcTbTkYb243056C+bk0y46g6WxBBUGOrIWt4l19+S1sPtxe93JxQT/mSTB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
Message-ID-Hash: M5KVY7TSFSDT4SL63C7DPIXC37W7AIAR
X-Message-ID-Hash: M5KVY7TSFSDT4SL63C7DPIXC37W7AIAR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5KVY7TSFSDT4SL63C7DPIXC37W7AIAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let's use devm_snd_soc_register_card() instead of snd_soc_register_card()
and ignore snd_soc_unregister_card()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/edb93xx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 8bb67d7d2b4b..146ca2468bad 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -82,7 +82,7 @@ static int edb93xx_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
@@ -94,9 +94,6 @@ static int edb93xx_probe(struct platform_device *pdev)
 
 static void edb93xx_remove(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
 	ep93xx_i2s_release();
 }
 
-- 
2.25.1

