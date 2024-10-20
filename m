Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 495AB9A5790
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:00:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2A96B70;
	Mon, 21 Oct 2024 02:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2A96B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468835;
	bh=3Ucwkp19BWOLUvwEfzpYyj34fSVgp7Xb5x80wBTMSQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZG8nAXS9aESUEaUfpRl70WT7MVCZx3CJPyiRTseirwnKJsRwMJlC4hOiNZqlR5B5w
	 Lk4Qv6vdHkctI97WGAhTPcY+On49OXVlpiE1IPyWF/TwZctXg2MPNJYlN/ndAFXWpv
	 WYrCQJ8SCs0ye+FIFmVYhfasEwTC9wAr2bRJjFBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87F7FF805DA; Mon, 21 Oct 2024 01:59:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBF14F80671;
	Mon, 21 Oct 2024 01:59:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D520F80631; Mon, 21 Oct 2024 01:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EB39F80652
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB39F80652
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=c38Dvzg9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6m8ueQCY/zZHRXpBEa15bVo5JZAm46HW0g0KpRBDsLRWFjk6KQc7OHuWOexvyhdioBTHo8mumSyoJ2altZ6ESEr+JiyhxE+u+aMg+Y4f3XMxm/OQr1ndrrV1VHmgJN96MS7Cd/DUXEkryey5IgpjY5DohZcH82HOQjZvnJFvFcFWIuVyxe1nDj+8e6xqma/F3uo7WUOjGbQ1N+U9CUwM1QU19/BU447SurPMHDwlbfukCnblyJ389Xo8n53Zy7Tl6Fgi9yjWzZx/m2PWijLBDIjzriIegheaYtwrgphk5Bs2fqhup8JcUg6ge7pNZAl0BBkz6DqOFsd3YHBvKhMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2e2Z/10bLUXv6KLrIS10LR6wlFU2KJ/Og2wMV7fWUg=;
 b=Xie2BKWq8VEXfEV3wLQauP95/KXGFB9fTLh9RAkWpgD1V28mO0gtzYrLxLIg8SrOyvnUtWUTdcwhdhYU/HH5ObFoNpyLUWmw4OHEPiRQj9Cc1v4sdHdVtpX8j8DbiMfwo5wztKKk+56Mo7bANbV2cnEqR5L+01IdhLc3PfVjNvtLuz0z7rcUepwldG/n3nmxGpl9ed1nBKq4CuUhcFDhjzL3C3Ua9fdRTcdMfJ5hi5hMKmVRqVFu9K+MUNaq9nF/YfOppfdHn1AfeoKYNZRHPq/Py24ZlUglhcmE4W90S3r5ZXztpqqozr3pMS5+8enS8zPC1HYlZUQGaQQkNUvbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2e2Z/10bLUXv6KLrIS10LR6wlFU2KJ/Og2wMV7fWUg=;
 b=c38Dvzg9Km0a2jBayKlKLFxKaiuStIx3tohTeS+3hXZwokpznf0ey87RRqtK89DjUsJsmoHZr8BNNWLkroV7GN2NfmoWUUNA6filz35ZBgVdhckDSAS2Fh898skqKzp2+7uPOjHDYt55D4D2yGOGIiy03KDrKgM5RqQMgQn0ywA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:04 +0000
Message-ID: <87ed4a9vi0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 05/13] ASoC: samsung: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:03 +0000
X-ClientProxiedBy: TYCP301CA0052.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 321e6462-1f25-40ed-5435-08dcf1632d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3doB0T0g3DZyoRaQXmLlvMzieOlu+dbm2a/tMo2crwETiAjmav6F8f1kEDyB?=
 =?us-ascii?Q?iKLbh9Oe41p680ogUBnHXTOuBF8w5H+GzpKqLBGjnUn3z0PI7FKP5cnwH+vL?=
 =?us-ascii?Q?CG4dHXkOATikArvPFGjvQYqcic6KILnS1Cuuz5pvLtY6rsbJqdtyyI4sRs5M?=
 =?us-ascii?Q?LgjUV2AdTmcp0GAVvIak1Dm8XJF4FvG5va6xDbLl+HlSNRwZU/SIKgVlgJnG?=
 =?us-ascii?Q?lE8+gNfM5GjZOjGFdQKuNKLDbtMyz/Nauks/CS/4VApaGRdW7rTeh8Nvtc0M?=
 =?us-ascii?Q?z9wfGEK0NXv1OKAhjJRU41L91ln+WIY/1+gKymfKqrItBEhNVpvfHrmIkpJW?=
 =?us-ascii?Q?8R8jZd8P2r8joMciwiNBZ2JXH2zczm62IZGKcSsD9h/5woZPYPk0XYkMfEXF?=
 =?us-ascii?Q?mqa4daC4RM6D5849fek5D7SpmyhXU1l8stt2GYuihUqhHZrqYrAaQ+1wg5m0?=
 =?us-ascii?Q?aFSxQ3e0xPAlTnynOJlKPbxkIURLw5nii6WsMhoZjT9l9x4yKLP11pGmUHM7?=
 =?us-ascii?Q?vbESJTJoucE2rY/PbJjwHCIJsBrd2F0B3790V4XTsaqjN00dFnJ6OKcLjbj9?=
 =?us-ascii?Q?G/iwHe3sq13D+AxiW/+BLYxMZEPJx5q0xyxLfRp21LKkns2m8exQF1vBLmRo?=
 =?us-ascii?Q?2hkiQ5P71ue+6J46EZek6UMi8MXulAeJN5DwWJXbkLRInQOh+GTT0i6quivY?=
 =?us-ascii?Q?EHpoRyXBGKSKR/cyg+4Xi8kvLC87B3qaVnV+CSNgO1vTxn69aD36Q0+yHXgr?=
 =?us-ascii?Q?DKmCLisgRYx++Vh/LhnGHv2U4TQvEQH76deoutmY1CHA2KsvCwzx//5Me8kg?=
 =?us-ascii?Q?HyC/NPF5Jr52IleUg1P/N6Nu4eETVPW7MSG1mijIGzxbouaDdSep5h6CsylD?=
 =?us-ascii?Q?EsSzu2RTkI7xfHswPG5U6ee1weXMmvplkoF+iUm0/AnB8Lt7vm2RQYApeLu6?=
 =?us-ascii?Q?tWsOYeXjVAwsO0UEJ88l8Xv+76BHJhA6J7utwiiKaQAftmRoXAk0Nxq9hVpK?=
 =?us-ascii?Q?McK6HIa/B05L/kWh85o6w+sFqTVcHjQkNmrBdWxZkajWBj/V5Zw3a65PGoVG?=
 =?us-ascii?Q?h/31IYx5GC4IvYlcov1NlZFWjAEY2kYDfXOFD+ebxun0oKcpWJ72JFLjXfit?=
 =?us-ascii?Q?XhxWyW8A6R8DcETeRMbXMMPJKzUgIswC0GGtbfZGf6E1DIPDzrhPseaCbnJ/?=
 =?us-ascii?Q?IMaw2wuUyYNTJQppYJlUHZjbAfTyO7IpmGW0riK+INZqG7WdHY+VA5nP4jWM?=
 =?us-ascii?Q?4L+VBYk4keIMk2JeeZjvCz/wpeuf9fUqn2YCVc1pGNqAHzRUTq4yQATGrND2?=
 =?us-ascii?Q?Gt/5oOUNQKM3PSjRaS3N3uZuMJw/h52fkihjIJhrcXm1Jc9u8mTsV7+FNMO7?=
 =?us-ascii?Q?GvEnM7U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TP6J0jev6HIs9/3OVbrI8318em+uNJrC8DPH77hdGgxCM+bmsh6A29hDzksR?=
 =?us-ascii?Q?BaCvupVAVfej/8ZTArEvYYFXnzSj6PGQ2Jq1RPvS3ttxO/Z3i99AmJjZARnL?=
 =?us-ascii?Q?Fie1hS7IEv2lX8BNXulHP8cObgb52EXGeaW056FuEGBzfl9pAouN5phRRS7j?=
 =?us-ascii?Q?GZhBQHrEROzAuf8wN+dVXBTgAJjpw0whZAmHNgsIwJLyTWAIHxDehwEBZ9dv?=
 =?us-ascii?Q?zI5FLA9WM0sP7GuzUFMgVu8PEHp9kImi+3KNMF+b5SCXUdgWPcT9Zu+P8zqA?=
 =?us-ascii?Q?Cheh000Swx2piJ0ckQqLrsc/yBiQsPgczmsRrLAjn7sTQaam0GXbDYx7JhZn?=
 =?us-ascii?Q?mw+2MU/byQyTNP+o9/MFD789etE4ZPp6180Eve0Je5Fi1Iq1C7vy2q+NAlwf?=
 =?us-ascii?Q?jyTx/EWvhYBJRyAV8Ghvr83TCtrsNT9zi+KddASR2AlaoJvheSKm2isp9e3o?=
 =?us-ascii?Q?uTN9frIpL7fVhXl3AF6TS+8c35IY/xbCqYOotl1PfPDEsoxHNu9NHCU/Rvuz?=
 =?us-ascii?Q?51UUJCpNnt/4g7epjwzu6dnAR3+COAQMFwTBZ+AfV7Hofml/3/uNkUVvhWDy?=
 =?us-ascii?Q?KcH/NKlhEr/3akeY3OOQXVhr1I7uuVOte9UfrjWe0nBbrmzCvWFu2TjlUbb1?=
 =?us-ascii?Q?jr8dHMRqE6XhEKlMXWr5ypPUFjE1tYf0fIXkeWJC+p464HAKOn15YkJ62nlM?=
 =?us-ascii?Q?+Vn+dS3RD2EbbqceqmvsRg7//Y4cqHZtlpBwHAKFGKPccUDMgz8UO2n3ZOxJ?=
 =?us-ascii?Q?MUcq69LZYdzEoAKWDyMWJ2HRP1DFRjme0tTJEaqphwXlCcCivurIKCONgenc?=
 =?us-ascii?Q?+UDFCebT8Nf88K4ga9dgv2soU1GFAE1Ztyi+jCcdrOmcIJ5FACO5H06wUPYv?=
 =?us-ascii?Q?3hd347CkJtn2k19ngkMiXffq1VEWUlHvb2tkvXN2VJxkCAfyV6iXX8XTXi4p?=
 =?us-ascii?Q?Ng9m/iVPX1iqkhwz03/apxSoH8hFI0KgTFRgvD7MfNh8OdLrVkfTFcGvMaMP?=
 =?us-ascii?Q?bXYYm4pGtlbW+0X32xEC8XuF6vmOXgd1GF8eYp8AzcEdVBszk83ukMW1VkLx?=
 =?us-ascii?Q?cOtjrHTaPLPZSk97yI1dVlfJqPZT478ylRoYn07c1N11hGy3hPA3Uie22Yum?=
 =?us-ascii?Q?l/lyukYOgiNIAI6Cgsu2qlr+nT3XsTWjGoayRrElXfaQusS84zgeWL3unu0b?=
 =?us-ascii?Q?Jv+sKOKBhMAqygYsxNWj7ROINvDCxt6+xtRaZOkbDJOwEiKdUomuPXQo8dEe?=
 =?us-ascii?Q?u7W5EZpddT8pBH+DBrzOg7kVb/ZsfqHJ/FQESN2eiIr2GpRX/hsN/XI/0djx?=
 =?us-ascii?Q?wNvbZXPZiHBiWGPB6z9BfJhCmlpTYo15WqC8nppWNjfbMv8vkoD7gVx9gwbD?=
 =?us-ascii?Q?k/3hgqeZLI+wvVOSVKuYncHU9sf27dNKG82W0g3cbRcBvNjf3xYfpXt8KE1x?=
 =?us-ascii?Q?99hIiyI/fPdkiroVdP2mDncAoG0nuLQxyOFiiQgcH1aFrbyg7Pbnw8f12rVR?=
 =?us-ascii?Q?ck5Sp+IM124LUbOZH+q6uQXyNhkHruhwPQljk/CyZNRM4c3lWiPDH1Glvn8q?=
 =?us-ascii?Q?Iz8TYqUXuEM7IrGLf6sYwQzkdoxgJpwGUoI2xLCL30R5aNtn7AJVtf1cuKVu?=
 =?us-ascii?Q?vVpAb3D2JqzgKrZXCrXN2nI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 321e6462-1f25-40ed-5435-08dcf1632d03
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:03.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u+5bv//vEwVXeqI8zVFJGQODAGwBH6F+wK6bHx2WMJAoh4EeUcKLYgNxfaIIhu7/GlIFICv50fOfoXLfbVC4/SLnjNd/q/7OlLOG+ieKdxb+xhlrBtRpCJFe3KL9eL6p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: ON42TSRRZAWSETEBQYGSLOB4FTUWRFGW
X-Message-ID-Hash: ON42TSRRZAWSETEBQYGSLOB4FTUWRFGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ON42TSRRZAWSETEBQYGSLOB4FTUWRFGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ed865cc07e2ef..40ac12c071455 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -171,25 +171,24 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
 	}, {
 		/* Secondary FE <-> BE link */
-		.playback_only = 1,
 		.ops = &odroid_card_fe_ops,
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -278,8 +277,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].playback_only = 0;
+		card->dai_link[1].playback_only = 0;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.43.0

