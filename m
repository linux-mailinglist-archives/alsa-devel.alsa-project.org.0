Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA589A578A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 01:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED82A4D;
	Mon, 21 Oct 2024 01:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED82A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468744;
	bh=Oon6LxsE1kiSnGqNKkb6Ubc/yWrwHWFQDY+ZIBOe4+c=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iGXotypRtTJ7kApT4DGDNKiIU68tOskk5QtVvmlIozyVZ5iVLLrpHwmc0EQX4iiTK
	 KXrMR+Dkxtk8bHltmefNUtd2rW6Mez0HwQy2KaIEBSpLnGtcHeVp0k9bvVevi84Grm
	 DAB+JHt3KnohVoIasi4nP+hME9JChxAmTiIeKJFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B0CBF805A8; Mon, 21 Oct 2024 01:58:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93489F800ED;
	Mon, 21 Oct 2024 01:58:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91E21F8016C; Mon, 21 Oct 2024 01:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0B28F80104
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B28F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=S+EyNXun
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDbS4Q0BpzLrh02aD5ekx1Z9weuO2EJjrI4YYHrJpPXsmUts2sfbA5gC2h+ZthTFMPchH8bIx9ESJjfXkYA0UNWdcmjAy6q/QAmwruEsUTim8om2kFYZtaUhptHHMDii9zUeXTcbVvph/ha+VV+6AmIKXSVLiBICDALfaz/03rF6ReVMEjLATawtexJI87+39O1Nu2MaWr6lQgqhx5ElZuV8dutvjCvWR80AqZt3H1zapBisEteEX/f07fJtLaibwxQs48Y5/xqavwpz3k+dWY5S9xXAuhBrwTOHW3K2W2KoY7eSbZ7qn71FTdISDOvqNJTCt6mT5HHJf2gb8p7+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz7mk7s5x7XBLZfep5kkIKDo7MBwQhfVnBRU44WlV1M=;
 b=ulH5zZhlrCWq6l5UsPbAUKR/NktUIIuCklNrVR1Nvjf6doFAC4hR21kkUsgFiqZYd92SFTIX19E4gl4hrhtEHl3sxplT0eZDoPyxKAe0eT4UttoJ8oFSjEjiXK6jDP7w00Ll29EimEdiaOUndXE95iiJFtpNrwCfBtg2VPc0ltsHamcZzFYbj9TKtGfJGKmyhKzHGwB2Nt6A/e3TpuoV9CX3BuXl1Tvhq6x6xDaCRMnQOpwo+oBVmzVLCG+jrhMUt1AtcESdeWLOzGvgpDypGREbzSd0PWHBYdSF5Qkqo4rioytArejyczdzcWIm5xKJnBJM85Q7RZilFvysaQo/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jz7mk7s5x7XBLZfep5kkIKDo7MBwQhfVnBRU44WlV1M=;
 b=S+EyNXun1rkev8S6LF+Hs6sF7f3doWJRrBv/ECfdp0++TDnltcl8FI9hXkNmYDLb5sJVBuvnZ+65uJHIIEJMgiCI+Kzb6OD5Zig1r7lXau80HdSWoiSM8zgGB5IcCO2g/oJEyL3GE9i6IlrSSDDgOT366H2uR3c4h14LE4XXg54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:58:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:58:13 +0000
Message-ID: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 00/13] ASoC: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:58:13 +0000
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: df3ab437-e8e8-43e9-3219-08dcf1630ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?taJiaBhbOs+PTQ5u01VlxrG6AwURkKgeFLcycaTJP5CEksuGUkkiV3XRDs8D?=
 =?us-ascii?Q?VBmnLRIPoOdehTrst2UOt1O886FoXuA6iItucuDpNCy0PZxAkocSZPBdvSua?=
 =?us-ascii?Q?GxN5vrQf8HhLlHzcgnoguyemR3FueR5PMRhOcoS4kokF5t03XosoZ4P2CUWz?=
 =?us-ascii?Q?0N+UH1RqTitqurtQbEbplB82D9hB1VznSaGytv7BSz1qG4o7Su5SA595G963?=
 =?us-ascii?Q?+NSlPOTVCuJMgmxQfX0QMiSIYVFbsp27HR2w0qKBWI2xl11pXnCo+Qb6FErm?=
 =?us-ascii?Q?Yy67rc+OVPQUDK8juTM5jyBINt60C6YDawq4+lWDNPMO/O299E0/PWepDRrG?=
 =?us-ascii?Q?VcGgcspYvPlP/85MR/F7UpdmzL+09yZScsHaZljKlBnCjjMDgA8EFnq8tNp4?=
 =?us-ascii?Q?Q2ffu8v41j0d/cblb/lCv5uvUYyoWxPALGKJIGk3PTKBTRBfV6lMYYCsxNP6?=
 =?us-ascii?Q?AiIuZFFBGLywM7By8xWas1ssx2wTk0Sps87NfHjxygK7qK/5XSAaxTmWlGKy?=
 =?us-ascii?Q?aibGGmr1CfXU1MuE0hau9u8zOgZqGiYT1gsLL9Y/4Fo4B0lp3lt/u4DnQb8X?=
 =?us-ascii?Q?2vuXYXRPot+J7A8FSPIrGF4W9xukSF08wB9MiAlXegNK+235yvP+0QiCzPMX?=
 =?us-ascii?Q?CPbGA1kjIQN0TWfnfMP7nmWgrCPOD5mUnyRHdRkL9JKM/ySKQybgfZjwb159?=
 =?us-ascii?Q?8fP7Gsej1u+N4EDw5tHt/+2kNNM4klYpCaq8HxR2fDIypgl4TdjglIX1flNZ?=
 =?us-ascii?Q?oWb+MDAO95pQ63jYFUvJj8gjZeSWdytNcB/Fi17Ey5jYV4NLgTV6TOSZRn4+?=
 =?us-ascii?Q?+84Iye1lJTNDabGL/TpmXAcB1G0uuGo+TuZAaUVXVBodsx3kIknaKIo5rXmo?=
 =?us-ascii?Q?59hr3PZBXWv/LeB/uqsohKwWzHFPoenPGsh6wDjIgW2I++AmicWT8es6nV3J?=
 =?us-ascii?Q?nvLrS8tNiUi3LgvwWfgMuyQToLcRVctkNpPsZHwjVTvEW7MDN/DYikB4vyoD?=
 =?us-ascii?Q?0LCnCcQQtBm4S2hWCSzLDBGiZ4jpkOab346YOBpO3xW3czZ6LuYAq1tAJ/6T?=
 =?us-ascii?Q?u4lfcmwTNXFeawYlETuZUL9QLPndR6SzEaIrpSuv24gbAyU/K/2EeOwgrOEU?=
 =?us-ascii?Q?+dkICVNfW6jQFUzfBJeuNhu8xSdQUtqZwctQXHOzSmV42fEoijfy0pEVgX9Z?=
 =?us-ascii?Q?6eHu2MZ8VLz/jG2aPVGGtkE0etkk9x0z/wbwm27nIotqkEGyDytLwVNLZsmZ?=
 =?us-ascii?Q?PSiykFG8IPBoLFQQKTL/2YVJncB6wB4HX7MsATNxuLp6To1qncG5XP3slyxy?=
 =?us-ascii?Q?CRelT4vcOYk3KlsuUuhC3DuQOK0jE4ZfJbs09tvmuSKlGgYBkVlKa2p8sUP+?=
 =?us-ascii?Q?EKs6aSE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sMhY7wjsJdrbjCOaPZxRvm21VahM4KXlyuD7cT+l+/WisDdJ5lHamLXzY3xR?=
 =?us-ascii?Q?8EDBTpj+pL19/W7z0EOkhwdiS0rgNdzW0e7GK66mbrNSiB0t7VcBQCDw4kTu?=
 =?us-ascii?Q?H6abF7qOrLz7xbCjmiQ4yepBFIOG+WVmvrcOsWiZC8yBzMWz3sTfphXnnaVr?=
 =?us-ascii?Q?BScaekogJn0j8pKUz8osmv2e+9FS4s8SZ3nONK74su2dc/3O5MsjvLWjbOyy?=
 =?us-ascii?Q?WB98lJFSWafp8Iva+m9pVRlYVEwxYiNybmfXPMYQbz9i4mFlI0nr6rvQUG14?=
 =?us-ascii?Q?noBErcDsaoARYPUoJ5dU/RysI7IWmcO0Kx+eVexeC61pqsYsWwfgxJ5MTQ4W?=
 =?us-ascii?Q?620ck/bxq6UaXFiehyAILzx9bHGfxWz+asIf9UkyGklMgStlwCZeF0ZZA7b3?=
 =?us-ascii?Q?6u/5okfuDvZf+8nVTXjXg+LefARqRWgVJv5z7cjXBMOrQ6NeyffAmj2mlz6v?=
 =?us-ascii?Q?OYVdFuySpmV1rPW+6qq+XOBr2k2UkaovNj+wsnItvKxX1D7kfUnjfj4qvSMT?=
 =?us-ascii?Q?JR0BbbIBqllV1NI6DgA/kHsYpTzL0hyiARm73duKpRl65so82teRX3v/94s/?=
 =?us-ascii?Q?3IOkgpisXM2+EPBFwEercqYt7cctKiRC9oeGn5kvbBBa/Rm1VdM2RZfG17Nl?=
 =?us-ascii?Q?EtZdNMxihrRwAAUyyymuBSqFoG0vWEa+p/LZC2I7rqtf892RT8nKYq0Mab8f?=
 =?us-ascii?Q?SrpXOU2jcGlax6qiFtpYQKH/nfoH0ZX5+toksok1WVnsXkFoK5HnmxphTjXZ?=
 =?us-ascii?Q?lxPQn8Q5pX3mNN5P/mD7SGRJAYqlo664P36xKgPt3QK/zKehryERMyZnEsJP?=
 =?us-ascii?Q?te/BcOKpVwA+Q7vvhRtu4mApJHsEx0ShjbmrBYuNlzxL9e/1YNWg0eaEgpCm?=
 =?us-ascii?Q?q8h4+9ixlgVLV8/lW+/lpaoHXZdr9ZbJKAIV+swJd1fcre8vsJ7Z7DCPErAh?=
 =?us-ascii?Q?8HvZylv6mVaPveQGzCqN1QxhUoKEGe2nMrvYsnjcsyAXHY8SVdn7k6v+W3Fr?=
 =?us-ascii?Q?Hdz9w4Ra+DI3WzX1uVj/9yMqwZdgNhR7jCrJ1N/O2qVUmUhAK1m0nQj4Kch4?=
 =?us-ascii?Q?Rw8FWjpMMB8xK44cvA1CrDJkT1ObFHT9reiCJUwBR0U8cmf2bLI0rPLLRP7F?=
 =?us-ascii?Q?slcdvRdCueRvEeaFsf+QkZ9/NP6AR8Z5DF246PPPuwioATVZszCuz3LmDnyN?=
 =?us-ascii?Q?dQYouDJEuHdiroTBD12ake0ymBVs7RSclkmdGRNkBgVs1KNV4XxqyQVacHb6?=
 =?us-ascii?Q?Gfl5nP7F3oZK+610TUshQPPQ8aOJlkXGfGSEFvtCtvlEYomzG7XNm1mOC4l9?=
 =?us-ascii?Q?Y/FtYRM5MTKwjkfLvRU6lGUqZU9Q6iUEQwjFEolhNsq+FSrUjpzYANrj2/GD?=
 =?us-ascii?Q?y85gQ39zfYaYQ1ryZY/GaVzssbunqk4RQIJ3CIq/do9uETo0SkMtfz+TDvUu?=
 =?us-ascii?Q?83YEa1EqnLi3MR3uTROjk/u3EcmrJ/wV6IKOynZAeEsgBZNiiHcwnmeZZvdE?=
 =?us-ascii?Q?FX3ltFBECykUVYI8RBA0lIhGTNw8ecY3p1h3JVQTnCNxUDvbnssa556D+0HW?=
 =?us-ascii?Q?tFPIcZSsqX+TlfRINYZygfx6a6sutNVpEXZKOjiVkHkut+XhJJobw+7Wuow3?=
 =?us-ascii?Q?vi/k21qoB8LAgvAlQj1cQUc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 df3ab437-e8e8-43e9-3219-08dcf1630ef8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:58:13.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JlfCPIejjqSS2Vcfyy8mVGlzW6IqqMCufi5IQRvuveHExCW4zG3u8XBESP4Y0wvpluz5Wzg0kFACo6b4ybof7SEQMplIdPPU/Y1ZRN5RL0JitpXwibS0YYNJnplr8NXD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: WBCF2GBTADTEXG62QVP4K2OFFIGEXXNR
X-Message-ID-Hash: WBCF2GBTADTEXG62QVP4K2OFFIGEXXNR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBCF2GBTADTEXG62QVP4K2OFFIGEXXNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

I got kernel-test report that v4 had compile warning.
This is v5 patch-set

Now, we don't need to use dpcm_playback/capture flags for DPCM since v6.11,
and thus we can use playback/capture_only flags instead too for DPCM,
which is same as non-DPCM.

Let's remove dpcm_playback/capture flags, and use playback/capture_only flags
instead.

[Before]			[After]
	dpcm_playback = 1;	/* no setting is needed */
	dpcm_capture  = 1;

	dpcm_playback = 1;	playback_only = 1;
	dpcm_capture  = 0;

	dpcm_playback = 0;	capture_only = 1;
	dpcm_capture  = 1;

And then, because no-one uses dpcm_xxx flags, we don't need to have the code
for both DPCM and non-DPCM. These can be handled by same code.

This patch-set is based on latest linus/master branch.

v4 -> v5
	- fixup sumsung odroid compile warning
	- rebased on latest asoc/for-6.13

v3 -> v4
	- adjust latest amd
	- rebased on asoc/for-6.13
	
v2 -> v3
	- tidyup Intel files

v1 -> v2
	- rebased on v6.12-rc1
	- tidyup flag handling for sof

Link: https://lore.kernel.org/r/87r091lwhg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87r0979uhx.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87y138vbv7.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (13):
  ASoC: amd: remove dpcm_xxx flags
  ASoC: fsl: remove dpcm_xxx flags
  ASoC: sof: remove dpcm_xxx flags
  ASoC: intel: remove dpcm_xxx flags
  ASoC: samsung: remove dpcm_xxx flags
  ASoC: mediatek: remove dpcm_xxx flags
  ASoC: soc-core: remove dpcm_xxx flags
  ASoC: soc-compress: remove dpcm_xxx flags
  ASoC: soc-topology: remove dpcm_xxx flags
  ASoC: intel: boards: remove dpcm_xxx flags
  ASoC: soc-pcm: remove dpcm_xxx flags
  ASoC: doc: remove dpcm_xxx flags
  ASoC: soc-pcm: merge DPCM and non-DPCM validation check

 Documentation/sound/soc/dpcm.rst              | 11 +--
 include/sound/soc.h                           |  5 -
 sound/soc/amd/acp-da7219-max98357a.c          | 20 ++--
 sound/soc/amd/acp-es8336.c                    |  2 -
 sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
 sound/soc/fsl/fsl-asoc-card.c                 | 24 ++---
 sound/soc/fsl/imx-audmix.c                    | 18 ++--
 sound/soc/fsl/imx-card.c                      |  4 +-
 sound/soc/intel/avs/boards/da7219.c           |  2 -
 sound/soc/intel/avs/boards/dmic.c             |  4 +-
 sound/soc/intel/avs/boards/es8336.c           |  2 -
 sound/soc/intel/avs/boards/hdaudio.c          |  4 -
 sound/soc/intel/avs/boards/i2s_test.c         |  2 -
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98373.c         |  2 -
 sound/soc/intel/avs/boards/max98927.c         |  2 -
 sound/soc/intel/avs/boards/nau8825.c          |  2 -
 sound/soc/intel/avs/boards/rt274.c            |  2 -
 sound/soc/intel/avs/boards/rt286.c            |  2 -
 sound/soc/intel/avs/boards/rt298.c            |  2 -
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/rt5663.c           |  2 -
 sound/soc/intel/avs/boards/rt5682.c           |  2 -
 sound/soc/intel/avs/boards/ssm4567.c          |  2 -
 sound/soc/intel/boards/bdw-rt5650.c           |  4 -
 sound/soc/intel/boards/bdw-rt5677.c           |  4 -
 sound/soc/intel/boards/bdw_rt286.c            | 10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
 sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
 sound/soc/intel/boards/hsw_rt5640.c           | 10 +-
 sound/soc/intel/boards/sof_board_helpers.c    | 15 +--
 sound/soc/intel/boards/sof_es8336.c           |  8 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  9 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++----
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     | 86 +++++++----------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 +++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 ++++++------
 sound/soc/mediatek/mt8365/mt8365-mt6357.c     | 14 +--
 sound/soc/samsung/odroid.c                    | 11 +--
 sound/soc/soc-compress.c                      | 15 ++-
 sound/soc/soc-core.c                          | 20 +---
 sound/soc/soc-pcm.c                           | 93 +++++++------------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  7 +-
 68 files changed, 318 insertions(+), 584 deletions(-)

-- 
2.43.0

