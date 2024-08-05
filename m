Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B3F9472A9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE184C26;
	Mon,  5 Aug 2024 02:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE184C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819204;
	bh=57sckNHNa8QKD13VJgOcOepyqlHAeuMNZ8R3gh27Ifs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r3YPNECLNoHsjc1xt1DLCUdgfQmVGxKupdROHeidHqzU9AA+iC6PNgyskZROO49/M
	 +jcO20G3lKiByopII+q7Wm6Fy5MWRs3v0CtM+vqG8cIOCYDfXMbVgO9Q0nDmzrImCR
	 4+T67rwlQzZqVzf/unS+us0p2fDtchbtQql+m+4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 408C5F80636; Mon,  5 Aug 2024 02:40:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6E3CF89A22;
	Mon,  5 Aug 2024 02:40:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D40B9F89772; Mon,  5 Aug 2024 02:39:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38834F89758
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38834F89758
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=py93YUlY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMjXHMq3AQYvj/b8KBlKpgniBOCKewdA3T7704NWdnAgk+VtoTBRdW9TyHAIKC0q6UIfs7YOUrlfkjP/zOXxNwHhWrdckCqz7v1w68MpXy3NYSLR4A6atRz7DlB8dRWwMHAspR5bTD3zSH9Ej8crtW3oCvpGnyZ1LbYEPrgk3vtSU3HkwGQm1ERKBVVbd703eIeCDKhjjtfJDAyEvNut5fnpPrcqxDZRyvawNUGKTUN8CyoDJOYYJf6niUek44mCqahP49NUrbecVl3W6hTdZ6RiHti6IBhCL4j7j98F0MWGrAe2IIN0d3LvQhR2x9FpYtzHqFO446GWuoBlFrPkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv7uzY5AJm3G0Y5hhGyeH1bVSTRuT4ydXV9fgIk/S74=;
 b=fiTCrh98Wi5sfoLy81sWk1u0LiJL3AqseY1cAWd2Ri1hLCZLxPS0KEKO+uKS7U2k3mIrDxz6Wjq9o8djCZbeddt9tindwdXtWqMmV1QbJOMNvGS5a1y45zDTwiorD/we9Ww/0chNRggdfO+lbQDyV54bhQGbjJBYvwvQkZCaYDROFaz4uCLbmczuN3mRuPHuFkPYBJDDqI+4hKDeQ9CiLKrfNS9cm8zyOGE4lOLYYuaSyKdmo8MFg9XqudCw4n9+ywPbD2kGYyUeoPQZZ9sogwqgqV3qyqw4hhybIsQ/BBRmOWUbQCF+x+3ZH3EoRjA1ZJZeROR4Pe3cbJrnvrJGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv7uzY5AJm3G0Y5hhGyeH1bVSTRuT4ydXV9fgIk/S74=;
 b=py93YUlYOILYJ4Zjpklz85ZTfrP5j1aLCV8P4HB7ANmHUg3oDsVayfN9D4ltDwCmzjdLkgQZGYMfsQXx4mvVGY9p034rMqJDWPi3dJIB6Suy9Cg/smfD4maCQofE9urQdfyTalUgOVg//jJfO4+MKYe1I7vg8J+wbOlqNQ0kYaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:13 +0000
Message-ID: <874j7zztu7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 050/113] ASoC: mxs: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:12 +0000
X-ClientProxiedBy: TYAPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:404::35)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: cc673470-5ab7-4cbe-9288-08dcb4e70713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s7KmLPdXpklluM6Bz8rBLciw6iWwuRzd0+wRZyou0hW572CLnnEvGOP6Hgvb?=
 =?us-ascii?Q?G9nAolSMiBkZmDVCmzIukDAPwkNXjg08Ty5mfIjDzuVBF34tgfULp1S+4/OY?=
 =?us-ascii?Q?wo/qyULzTBBw5btw61UzwaZ0pkzpVkFeGY/4lMqgkiN7ZntjqzHaBFJ9P6/w?=
 =?us-ascii?Q?Tu/HIzLL/ReWp5T6pTvskc0q8kw+nh5z3+NAk+Z3HxhmSw95E8Bs+R2z2uk7?=
 =?us-ascii?Q?/blRUXAsLTziVRF6778z5parmty5tQRwgHiyz4r3n5rmvu3qqNnhQwdckmLn?=
 =?us-ascii?Q?SyUy3db3akgqt855DG8zGls5VzfNDvfXQGxzMPZTXqQD1j26m96bhi/ytuB9?=
 =?us-ascii?Q?2sHsMJulXO448n60f1ziJZZjVqMNXtVZsecRqPaldDWBcAtMqXpDSsbApuwS?=
 =?us-ascii?Q?fyoTgpYSNg+2TmPMVn4ZKPF5Hpyof0jLinfiwUAGapJ2seTvgNGNVmg4OOP5?=
 =?us-ascii?Q?tXGco12LOjNeMS6HtXemu+zafLhBHFMrT38mmjVK5li7ClTiQIXxKhw2slE2?=
 =?us-ascii?Q?aa9/ZSoqBK1JclV0TmCYHFGaf2K7WXIrumKW7Gbcbyz5QyLiMyX93U5Y1mKT?=
 =?us-ascii?Q?x9h5Cfyyxwp7q7pr8x8fP0JSajeOiwOi8vO916BOECJlHD284AnXY1E8hZNx?=
 =?us-ascii?Q?phTYjFbRDJLc9szUk5r+GEsPcrQ7vS4hh7XUpN82bO26pqag2lg9VPL+DwMC?=
 =?us-ascii?Q?JB4O1aE3YkX/zVp0URbGW8D23VE2N7GVDod8+Vr2GV71fcJT8mcbGiKE4ZMo?=
 =?us-ascii?Q?3o2FYwGyd56YzcUqELyBbZ+ckgL1RXHbaDoFZEsaDPYZytVU4WOOZTya5vXL?=
 =?us-ascii?Q?RT0z8bKZvFajxHuudHRQHyA1p9HPiShVHo49w8c1FvBaFHa7V4UIW8Q8W/Kd?=
 =?us-ascii?Q?I7ElXZOqCNLIH8CEGFZuETSXhWW69XPw2ntQLkS0pPRJNXIc+xWwFMKhvDX9?=
 =?us-ascii?Q?5LBnvZkYFkEzr7d66TDbj1FGajHL/lalwbwBkQlVtb/wnhaTRwP+KAAg9/0W?=
 =?us-ascii?Q?sbhrm9KR9J4+/7mXh5x7Cj0mqeeEeBtvejhunChZgUIER95fNXojdWPMoPZu?=
 =?us-ascii?Q?qaQLPatcGBMZhfV3lMhmP3SfXnVRFQToEe42OSdeR/eyKsnONVreQgutJSBQ?=
 =?us-ascii?Q?vpwQzlzl6R+rnzf/8njfdCEjtQa49UbM60QJ9KP/Pd9W0a2WETBdX1HK2XKu?=
 =?us-ascii?Q?pfv2FVzEz2Ed0s0kz3rlnhut0Y+1P8LOT6dCyhbuVDjuPxYV+URtewuvnFzb?=
 =?us-ascii?Q?e3t1BzzuBLTw/HAQPItl4gvlVTkDqL1/U2jhgPG+DO2chOQGqqqLcp1WYpmD?=
 =?us-ascii?Q?ZHU79uPJbA+9xt3lrF/f/EpYXEPPW3YBLXbpaEIqzYUmyssrxBzKKDUCWbTY?=
 =?us-ascii?Q?zRYmgO/EhzJguQvm0e/KKiYHGZzYEuYUMr5tIrLnh62JZ3Jdyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fJ4Lde+OrB2LayrzU8LUPTeSn2RJCSUgaDmwvh93mFNF8823JKf2rEUHlwsX?=
 =?us-ascii?Q?GZeV519Iu+PlIDGAsyGkVgY0XVB+Tp+LXCpZIrvam2BnUSloLWLONdm5TSzT?=
 =?us-ascii?Q?bJuNCX59h/5thOVDqJfNF0f5d+rgItTR4oFpfuqyQWHlE55A/a9WK6+Bj4VI?=
 =?us-ascii?Q?7VCeQG01Y32bsz194QW/joXLQIL6mNnKgUSMBX/koi4XY0ysaap/R6+y1A5s?=
 =?us-ascii?Q?hiUcHB9Jo1QjAwxrZtWrftBRQopWT1RkeDskUm83iatRJpoG6gVHHLOYg56O?=
 =?us-ascii?Q?4IdAfoBuoCnOwRCJNB7pLQn9+GrGEXJWR6O8gDNUlGapWqcIZnsQiY1/vEzO?=
 =?us-ascii?Q?RwunMcn90wr1mreRl9ratS1FEyUogy76d7riQT8EubdC8PeA455c63sw6Wl5?=
 =?us-ascii?Q?yHHEwTwZ4E8XLs9p7xIe/KnfMRascSG70WmGIDh1jCcZcwbrOmZzJ/qZT7J+?=
 =?us-ascii?Q?sQI/HVmXpe3cGLpgIr/VRCwbe46ZWzneqcZNC5SLCKek7IdQRG+NgdaZgdIf?=
 =?us-ascii?Q?NKUNvOm2Z8ehUyGmTRP5mZy9zqPlWk79UJb/VfpOfqXo5T1YcgWz7BkaiI5s?=
 =?us-ascii?Q?Zm4B9y/l52L9cX8f8BeLbC05l1OoMuoN9VPPsDpUU11Bqlk3TWV8rqIiyRZ3?=
 =?us-ascii?Q?yDWh81r6j8esby2UN1RzfCyMpy3QHLP/+Vwfh66B5mCplwPX/NpUPum8j1cB?=
 =?us-ascii?Q?hhNTuBsszf1w/kNOwoHleYgLgmPVSQpYud1zS5lqC19fKGZ0N8AY6y+BhXlo?=
 =?us-ascii?Q?r85Dba8wGWxbL1PO56yWjSvKKdl/50JKYyp0ISxLDTMn+Gd+hrotj5we6YQV?=
 =?us-ascii?Q?ZBZjhtn+M6i8uyofO4dl4h6uA/bT0E4pRQAFpHw2Su6kUfkDK52Vq9FPAdac?=
 =?us-ascii?Q?HA1cnJmDjFrrLawA+RSd+fL7yTAXhbrLnAjvXmUKFgv6K2ymfFwHDwgYSITe?=
 =?us-ascii?Q?gAO9TjdiRqlNn1Ku/cJJfWpmPhy5E7KNLuiSHrssCDR+Jd6IQMpcgg633Trx?=
 =?us-ascii?Q?rELyqosL+S3TqehhKDQU7pGGIt4VUZxf9WrH+B1F/YUSGQpdQqzDtwvX7dPR?=
 =?us-ascii?Q?MB4LIA/L0v4qi2Bbds0uIMadtmaoZ/l9ZnBoVV/5m+/lMJ2JyB9kN0gz5TMR?=
 =?us-ascii?Q?R6dCdrmyEcgouGBfKD3cnMQV8YUiSPglcLbB4DbO2nIsbE7cYy16e8KNVQSv?=
 =?us-ascii?Q?bswd9/zczF8hnucglyzD71KO75hY2YSX7DuPOGanBwnAw0Tr3zzQX+I4OB49?=
 =?us-ascii?Q?p0LhnIpp50/IJ3j3qx1HRpZ3UomajsGfP3kl6i7l5oUh8NEZPOjpHY/4XzIj?=
 =?us-ascii?Q?mDvbWZa7Ti6TvQefpIHvP6TpRgWbiK7VFE5Orfyfuxu+OCvbrE8zl2DXxLa9?=
 =?us-ascii?Q?En+MLIvNz0e9tDkCCF5CodKR8efVXP09hR37XHo3SAo1bYLV695RQg/YtCQp?=
 =?us-ascii?Q?bRnv6S6sMCAmHB1o7GOWmRJJYgq4UuEUy6N2C4cacYZN1ke6s8No4ES8cNsw?=
 =?us-ascii?Q?baTNw404dcITfdeou/+zOAeY3dARt0UTQ4epSjOPmESkG4Z7tQK0NjfFm/hZ?=
 =?us-ascii?Q?ox1UnBZQNd2zz9ykTlSRbC+q9Wv7ZGFsVeaFJa0RKv44w8kZwUyFBwu4v90J?=
 =?us-ascii?Q?auckoGe3D4YCcekJK6wckLg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc673470-5ab7-4cbe-9288-08dcb4e70713
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:12.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SouN3OWDYbLQhArShV7ux9zSvki/Jt0kbb+L9BsAzubTKhuLkhAcmSnEZF/TTpSSG+hkhz8X3p4erGLiZ9Ds2gAAEpN9+BoylrnN5z69DMHJEOgNJttlhIJZ3U93zUyx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: WL527QOIYEPIRVF7W2RLU2AIXIF6BV65
X-Message-ID-Hash: WL527QOIYEPIRVF7W2RLU2AIXIF6BV65
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WL527QOIYEPIRVF7W2RLU2AIXIF6BV65/>
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
 sound/soc/mxs/mxs-saif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 3e3a62df3d7e3..2a3d8038d4362 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -489,7 +489,7 @@ static int mxs_saif_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Tx/Rx config */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/* enable TX mode */
 		scr &= ~BM_SAIF_CTRL_READ_MODE;
 	} else {
@@ -560,7 +560,7 @@ static int mxs_saif_trigger(struct snd_pcm_substream *substream, int cmd,
 			__raw_writel(BM_SAIF_CTRL_RUN,
 				master_saif->base + SAIF_CTRL + MXS_SET_ADDR);
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			/*
 			 * write data to saif data register to trigger
 			 * the transfer.
-- 
2.43.0

