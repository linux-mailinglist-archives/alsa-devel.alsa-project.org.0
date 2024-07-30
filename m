Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906294041D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A5DF50;
	Tue, 30 Jul 2024 04:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A5DF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305252;
	bh=e7qxODlxIm31WvrJXCxMWwkJaE252Q8Fuum4g+cTII4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AobnFhWhP8AaICyUzjXkRxhQR0JANFkOPRuJ/ffAp2w9RXLJo4lgoIMHO1ocztNe2
	 b38QFrTFeRsQ2VHcDDC21BShX6uW5IYpT3wY0XrdiPcMA7ovYUTbHEzeVh5Fv0q8cl
	 VOQQY4gOoYVrwx8lneu6SgQX15vlJ2vYocpjSM1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49630F80689; Tue, 30 Jul 2024 04:05:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CBCFF805EB;
	Tue, 30 Jul 2024 04:05:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93B93F805C8; Tue, 30 Jul 2024 04:05:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B61CF805C6
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B61CF805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JN07chDO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUOLHVGJuc3p5rkS6JCldlVWIdCeS5MDdxWN+sw9ZHyxR9IMcM6Jomh5i+S/GgeevNZy7Km8E1vnZ74HSr+C74A8KlZhdY/m5m8dccu6K8aZ+78j+CwQnu4r61rOrnOg5Qk6rLi8clTFmoyduZtVxzS3CcLZQx3zw4TpFu2v+O2nHXJAtuHNRCdqlfUjZLCaTxpiv44Am40NUb2bfhUSVBKz4ZDbcXuUDSO3PGtPiX7aVNVc6fBofyPOgLkkGT0dWNwDb5n7BofPZ2IbRqoud14mfhOYr/xMEG+M8gSc4sTwdXFIms5lD8HGARfBBPLVhjgwj474lL9ronYt16XflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dfhIP3I52AB96dDtTpnkebnW0NATocwx71gixTnudM=;
 b=AIQ6cJICTSjUnvIQu+JsotQ8VmZTO3jhcIVwf79WICMpCdf2XImDyaRX058btnBFl4eZGpEnMWILfgZ24n0i8hYYtAjIadKn2zqfUi27mjH1pM5P2Cv5+zr+LW3wUHDI2+HySM1MMeKtZJW32QV7zHHogF80Vrt2QSQ4o2V3MJ8O+Ch7KkYW/Et2qnaxssMgZXZp4xhNN+7mjNgNZuFiw0fWqFyEtLclLm+VornRn3GMzjjzKVqPasKq0xVgpU8QJ+plQQJ59SSxQIe08OvxRZPS9/EmkZXpA2FkclFjcHt3G9f60S9MXOCRhGORU8l6L5SeCI3krvm7ZnMT8sdjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dfhIP3I52AB96dDtTpnkebnW0NATocwx71gixTnudM=;
 b=JN07chDOUE3QKPVKBPgjw3PbKLKcRixMJKO1iEkl3zT+klr1icdmH4GeSmn1UN8ye9+if8KCyUwrhpoe4KxoRg/bybQtn0BGi2YqtNF/RBT82O/A33g4kpFxgXlBLHtjpdInHKcT1IWG/qhx2WdzVRnwmTypAet+yjZLGbSMPSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6427.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:05:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:47 +0000
Message-ID: <87mslzk51h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/12] ASoC: sof: pcm: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:46 +0000
X-ClientProxiedBy: TYAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:404:15::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: ab918c8b-4c57-40e2-e03b-08dcb03c2077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aJ0+7wjahC5/9V0Nv+nE8mY9tyFYXKfRJ5EpY3qw/QeifFM3/guQj353574y?=
 =?us-ascii?Q?5lqdGCSWsgFiQp5UCbaL6irdVMMjFQsVR/OhrUeGI+RmtFSVhXMXGSCtFIsq?=
 =?us-ascii?Q?iuxpBjApm30px0z3oiYBiP88TMgedEV3M7t5yvRKBG8BJksYqXMYLLhP79n8?=
 =?us-ascii?Q?p9fr0MQMUz9duT9fj6m4b7yvaJBiYvEfVoYhadElTrEUsBtiukhHG+8QOFjo?=
 =?us-ascii?Q?s40R8loLXMBtiU3R3eFTxJCDLFwdHFUD2odo5qmjmBfRCpH4BsfBNOE2Jkkp?=
 =?us-ascii?Q?xo3m0rYn1mLFtaASfPo3iGsdR3eUqqg6U3HJQXoJ6UZyVb7Z2p3JVjTYZziO?=
 =?us-ascii?Q?yEf3YwQX8jOJChQWXQXVxqkyf8ktqOQjvwOWPFzfdFFocbc810O59jWzjpeW?=
 =?us-ascii?Q?niy1Cw5I8ZjhNhFSebwO9eO1ifp3eKzk9FcJrzFSxigjblUhIzUsUzjjr/wZ?=
 =?us-ascii?Q?JReAR7PBKRjHXOoK0WmGpLbH0hNPSK3AvI7Ceh/9VFz3eRzbcPjYMuQqRW4v?=
 =?us-ascii?Q?SKIwaqVB6sWahpABncyQiV472McnlIZ+mmtuGgFgWLLmR5cVUtJgp9/sVfM4?=
 =?us-ascii?Q?nGxoIzIz5FA3qNFIEYMcbpcv0BKNY2Hx4zcDOR2C5WHIRFeww7m1/fABCIq+?=
 =?us-ascii?Q?SlVimUYZlla9xLOG2NTuVrbyUZolxb16qy5GhEEJdVXv5PAkzsnF6esqpdY/?=
 =?us-ascii?Q?lDHj4geU3EgzI7b/qFP7oidNCA3Y8fgWqJ3PBhzdHzI+HnAjWqZfOlynV/Ep?=
 =?us-ascii?Q?vj08/npb//mEmbCuwsCQVkYED8cf7QWKw6WccazsWOB/yo+0n6hwmspWIEF4?=
 =?us-ascii?Q?wzWp6k2P/d5zu3ry+pb2YcdZxbn45lVSf1W6bVhOu43mRGckUV/4dTQfS/8f?=
 =?us-ascii?Q?ty8PhdRGo/ob4xI72mWmY6/15NuUS6WafDRtuq1BnPOZRg6JJsBWNv22wO06?=
 =?us-ascii?Q?cdw2pyBw1Krv27Pa7azkHiufzkBu5z64ov+cTfIKYO+70SuZWuV1X3u3klPL?=
 =?us-ascii?Q?lqJZYS3HjTIxIVEoRd0RHCas2mFycC/4SSQlIi8vg1cm45/Ih4BMxlJv78qC?=
 =?us-ascii?Q?4dPbuTmnTMHx0LHY3hzOWkt+eHN9D38MMmxU54mvlQmpQRvIVSfOBxOa4d+I?=
 =?us-ascii?Q?yVAWYYfZ8GcJ3cwZGOLbT4XGwr8jJzgTYoGST4BRSqcD2ZOV7CE2deRi9Pxf?=
 =?us-ascii?Q?HpmWrjNho5wEFsCRnrAWAqWZ29UVZqMFVyEo8dWG7mHlTs/jcwHj6a6g4mVd?=
 =?us-ascii?Q?R6e+zZgDdDeBg+4aTgPdTii39hQ02mIaDzYJnzlzh8VpmXMiZHAckL/AjvSY?=
 =?us-ascii?Q?ddrVLkOXMRnKH8vHwQG1vednG7oIYPJwpogJq/+neZsh+W7svKbzUS3e6Rhh?=
 =?us-ascii?Q?/iy6r7seMsWLDagqOd1N2m2xthUHD+PwwzuIDpWwol6pMrqGpg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TK52zWKOjSi78Pan6ogBaZs+T4bR0Rlm6OhV6A64TQK//ftO/yErtNf/UspH?=
 =?us-ascii?Q?t1PMj2LgPMnAxPkH3EKtq+/CET/1e/XQvMUzsOuReB9OzDG5nPqnL7AZ9kE0?=
 =?us-ascii?Q?c2J/vsPjw1DXX28JT+Xp+B+VoYm/K5gZRQ0ssszhr5/NztzCTmdXTh+8m0Rt?=
 =?us-ascii?Q?0EyZDqV3mgQ1OpbbeSXwclvKOTQbt1P69x83PON7bID35kJkUv37mOpGpg1x?=
 =?us-ascii?Q?40fzFf12q5jipzt0ygvbTC9wuY3NfUjFkQjrHxe3YlHjnmvA0/P73qmRvQS3?=
 =?us-ascii?Q?mOFpKGVvdxHmar7Tj9MplsjqgYZOzvc73Lr0GRpB7PXTUrCZU5c+8vlPB9nt?=
 =?us-ascii?Q?+F4M/AIMXSNm8nZukoeDJ8fuyGjfLH6JSELJ1TQHFQn9E0KBwT15I0Ps88Qj?=
 =?us-ascii?Q?fYRo23UttFhF3sKyVfj7RTOUputEBp/UTp5IBnqujD/xU5/zzmk4plpuw9Zr?=
 =?us-ascii?Q?NrNZ4JPeWSvGKQmj3LaftftzjPXJd0AX35Q6YWcM2oCmJe2JkuPFB+tkpBvQ?=
 =?us-ascii?Q?ppKpdPodOzo+LFIRpuyY0QeYz3z7yULJyaqWrsyTxUyz4+Hveji+WfTNJQ2v?=
 =?us-ascii?Q?pqTSzAiBV/rEWJHPrB29KrcqMzogKFuX/H0ij0AQuIgWdOitl/4WERXR0Tft?=
 =?us-ascii?Q?Tx07CocEETIr/aIeihj3PBnVudWx8XBSoseo7qo2bOkSNm3MNsfUzVwRlT0r?=
 =?us-ascii?Q?DixKJhUTNXeyOjQOcUmdjK7dhxnno2EdOdtrK+rKPANRb2N3BIAgStD/1eat?=
 =?us-ascii?Q?SyxK/jCUGDzIFqbuYcVs3EnNQ8siIQ9/IdKYgURUAX02yyS0joOLR/q4gS8i?=
 =?us-ascii?Q?bzl3VdTFWUr/RI8qqpkCc0j0oVTUItmG844Z9Rb0VrQtn4QVH6A25Gxh77bd?=
 =?us-ascii?Q?IjPtPFIBfUDFAc2OdrdW8XLvPZ8RUrO/bgsKaWtZpEqCfX9AwO0HNI9fxWl3?=
 =?us-ascii?Q?MoJwmcZv88BUkQ1Dsf+tO/uEmvsEU5OqMnJSa1D00DBwH+Cb28AS3hhZP5PP?=
 =?us-ascii?Q?uVFGDA9MVLvDcPrcCHLY1XaWmGE1e/S3zSru074VQU2JiM0NIRFw+MJ6HEI7?=
 =?us-ascii?Q?MBehcm30hxPT8bVU10qgouiTCo1AMUAEgUXOqX88dGAn883tJBYiXPHnKsT9?=
 =?us-ascii?Q?Qd4yjfVuHcxlvbTzgv0zSixsXGlReigesORV6BAWnURUH1zf7W0EufL6sOjp?=
 =?us-ascii?Q?OwWmPWQiFbztCCksDYOhLW4esl+fMGnFvigP2zjuWB/3KiEVcMaA9X0HZDtq?=
 =?us-ascii?Q?d6AcGaVco0c6DtmwTP/Wi1sXVl43TpO3oqXNQwLTXPW4arHRD6KD3vxdepU7?=
 =?us-ascii?Q?Iuo1Ifkss3mmYcvcy0DmT6bHG+/In91TLuP6BmSF26AeCEhPXzbUwgtt9IeN?=
 =?us-ascii?Q?clWrybj20AlFPqU3hPtWlISK43xx8nL9fUlD1FCVEc4FXmX5iwNWDipD1GEn?=
 =?us-ascii?Q?J0Uo3K/xkVpoXyS/XY6UM2NEJOupK7sf+7/4y4mHHY72kiupc+ZXq8oLLzM5?=
 =?us-ascii?Q?uT/dSwuBq0LGoQkODpkviHVbsta27K4JhrE1gF1PopyU+TjD43lUYq7DVrar?=
 =?us-ascii?Q?Z5UFi8FXinIKi7tNY9Gq+LIWA7uCtHalhClOUbnMNp41KIRudgM6SdrdJ5fX?=
 =?us-ascii?Q?jlneudrZJ42VcWfwmJ1e0xg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab918c8b-4c57-40e2-e03b-08dcb03c2077
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:47.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DfphZ4eaOhD6V9AnE5FtQAJ+phqp9NaXrAhar7Njqs80F65FdjhrNSQlupS6LvG+BxTuyMAL1TMoMRvDbSgYUK/Y5k+naO1GGc6C59GHRQdAHntl73vA8b47vHA8I9Xv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Message-ID-Hash: WIYOVOH6M4UDVE4G45IEGJ7IAHUHFKHU
X-Message-ID-Hash: WIYOVOH6M4UDVE4G45IEGJ7IAHUHFKHU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WIYOVOH6M4UDVE4G45IEGJ7IAHUHFKHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index baad4c1445aa7..35a7462d8b693 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -100,7 +100,7 @@ sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_run
 							     dpcm_end_walk_at_be);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: dai %s has no valid %s path\n", dai->name,
-				dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+				snd_pcm_direction_name(dir));
 			return ret;
 		}
 
-- 
2.43.0

