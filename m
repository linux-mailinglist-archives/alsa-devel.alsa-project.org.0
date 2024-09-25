Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D7C9869AA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E681F203;
	Thu, 26 Sep 2024 01:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E681F203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307580;
	bh=t1oZFar5gexZhHEda3sj7dtfzjQIQuke3UIXtKqTauc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDc2Ej0BsHSLoQYmwfxFATFFY7yce12Ff521n81AcrAjuTRZKGEOhaZe/67VsZUHa
	 jxQ1/x4IdnharzsiKZV30RPlniGGqQCzIbluqDdyjklXHXGVB+s8Ei6LYW8J9FfVt8
	 NrQlt0GJPOLEwl+aWa2ESLt0hVwHd2+G+Y9KWr/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA28F80074; Thu, 26 Sep 2024 01:38:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4059CF80074;
	Thu, 26 Sep 2024 01:38:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2C43F80608; Thu, 26 Sep 2024 01:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 088DBF805BD
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088DBF805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=heGgPfIJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSFEdt+sDDUYh3aX1ic4R8myIcpFzjMW8r0wLxyFiygbgcnQVRKwra8/fs5wt2ZLhkDpxPmiD1zmUdN2KfRI9y0LF5kdh/EF0QsLv9qBqp9yjYIxIJP9QofjZHeZ9IZeFgDHtAYfLTwnmeeeP14mok6Rh7PpzP02IVKBTlDmxps7BbFOREwllXEc9wShUpmeisWupjMV8+5uV8jpgWFTU4sR75GqRJi5/nmvtOwUQlO1bqCQXcYAyvYc9xmWNTT7wBwstTz6PDFUTRaz0OdoTKpDaMN6/n8uBxXL6ovTyktNil+WqbGNcE4mBurj89wdLsXbiKT2rieKO2fuOzowhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3qang2WhH3LXg9um+rVOUh0Yh3YMZZyQNp3750xo7E=;
 b=STBVBzB+f7Il7zYugdmR0v6Y+OWnNg0jac9+IS3c4Hn6VSc8cVqxJuJJXruoQ9D6CuGvKAnqp5dZ6YeAwx5FM3+HWqd02cyAkFWWy3Zke7Z0c6FHWxBDz7yW8OQzs3AyCGFiZ76rCx9XumwUlVsMWfgKTBL9CWXUsjU8mTdsBRNu38IpxCXJBfGKBKLrB+ejxwP0uta7b3NAYFtIUKjn+sySyu76QMCnq8tm6pmqT8kdlKU42nwtAowGhrXPf0h2zyszFX7hPEAytXULZme+n8MOBt63Iru6fLhTkCsrfRN0CSznGrLx1VXfi4NnQljqYWS0ii0x8IlFrpnofxL1/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3qang2WhH3LXg9um+rVOUh0Yh3YMZZyQNp3750xo7E=;
 b=heGgPfIJR57JfYXMCDbq/ziBN2CpgIlHvMCt8lwuFukF90PC9flI3JwArHd6bQYgxCw4bmcXBcPkWeylII3lT5Vz/xYze+OMmSEgtucS10r2tp/lBpNoeelEtxsKyg7+eZE+qvuGw9+/CKC430s/CDJETKBBj7qWeI8nvMJvSOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:38:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:38:06 +0000
Message-ID: <87ldzf9uez.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/13] ASoC: intel: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:37:42 +0000
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: cf337a11-b9a1-4d5a-932f-08dcddbb0ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UbJUoR4zDEL4+Jvmf8cQFmaPHdBb+r4UpFqebUK+ob4NA0H5FnBxoIoTVJkw?=
 =?us-ascii?Q?f0T6Q9kvv9lTj1DoCbj4JAOjW4QA8Tfz94A6eTR/Newrr7X0k6LRELRteqpR?=
 =?us-ascii?Q?dmEKvycu9o6DGxX2u9k7lDc59+LwH9LxFsBo3qgE2s1L2ll1ZOgE0kpS0qiP?=
 =?us-ascii?Q?8HQIxxAyH99D2WHsv6HXcHJ/Oh1GtCz2u0d1G6/ddynUi2u3rbxpB0Gz2D50?=
 =?us-ascii?Q?eEQnJo2g608gmXYrX+s4X+pytSX+KB40szhJ4Rub78/Ixa46J8ggb6CL0EHA?=
 =?us-ascii?Q?WRRy1IsnJx/qrGM2SLNrDPRIKZh/vYL8rTdVZ9pr+BPnzDJCixxcfmRN0wtg?=
 =?us-ascii?Q?esIMVcvzbz0dcEDD/YtHw8qXq4akklTXUR/W5a0XL86IGfbdff2H/kxXnmqc?=
 =?us-ascii?Q?nhMI7MNQVgN+GpMg98B0lLEjpuEKVzwGnjsKnXAeFPm2nMpM8g/NmxUS9HuS?=
 =?us-ascii?Q?5mmYwA88+7JzmswC+5fMDXIAcXnCliOL2jk1IOc27dQBLyil0mVm91zrFIk9?=
 =?us-ascii?Q?/qltzECGuWIJIh1T8fGshwJ8r2AfIOqAYVOEYsH1ftWrM0HsgjO4EKMWfCWb?=
 =?us-ascii?Q?a9gAXffjiV/HtG77bthdE6P4PsBCOZeJOnzrluHgcqQdiSvyWOgNZOyquKhO?=
 =?us-ascii?Q?gpjW9hlwe9PaJU9ZEhYQ8nSkmePb2HKluaaRpHNBE5lqpuAk3AALR4U8tbuZ?=
 =?us-ascii?Q?jR5eoVjchiNBXfz/aT2AaE0hC8Ugzb26ctHOTMGDqoikcJJ54FFho+x2BCEe?=
 =?us-ascii?Q?Ay1z7O6YiMaZdB9ounrPr6BdxwIh8vLmU0VP/YTMRwBxu1Wys9et8Mx3Ugci?=
 =?us-ascii?Q?U7IyCQSBr+fpkbXi+OxtTHWlIZO1vmPQ9txEhe040Hgxi4xfwCBrOeUPTmQ5?=
 =?us-ascii?Q?MJ4OLIsOLjeHoAugCEBCqRiobJAzecZETf81tFIDSfSYF0g9AU3ajV5DGJnp?=
 =?us-ascii?Q?UYynGyAY9lp3eMs+Yr9tPlnmwX10bqAbYQTfo63HkF8iM+IkpYt+TdHcOMm3?=
 =?us-ascii?Q?6eBTff+SrFMWcj40HOMWjAn1vmpRXXNCqulzTgV4+AdyULzhmlrujrxnlWxH?=
 =?us-ascii?Q?4bEgkC2Q6ij+1m0pggSIqe9tvkTEk4f/j1Qwrk7fsQU9e/lmkFCdkHONPz52?=
 =?us-ascii?Q?THBY60TRQpVIbBjWvEfbEwQK9Jbr4EzJXd4CeD6dPxUk5qBIw5fi9po1eg67?=
 =?us-ascii?Q?X3ZpmHbfBrQ/oCyBZMtPKDeSrtl61ra9oYEnxOxjmEBzPj2OiKh5UjyhN8Jn?=
 =?us-ascii?Q?a1IGhbuKgRpduhZ9+OYVR1xalJD1vnEBNYjVQZ8/iDWlfOFaxctM1xZ7He20?=
 =?us-ascii?Q?bQDTR+CCqFdVp2WWhsu6+aKJgfwa0q7xQS3y/Ekm268EDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F1PcnlvawosIF1lSxsPB5wRBlUNQSOkSOIC/SWDf2nYcs140npUQOYKJgEWb?=
 =?us-ascii?Q?1Uf6+lLMrZTG8BvZDmUsvQBGWXhhlU/b3JyAkwpf/RVYcWojCmcwk0Wq9Xhv?=
 =?us-ascii?Q?1PN5yBMSgjpA4lHMjdcHMLOdHP29HJVC0bTBkdzx6BSwf4qguR2VKYcnk3I8?=
 =?us-ascii?Q?MZjEmGEVImdXjOqd6I+hpcHG+BEV0uPGojgRiYcTh+Lv5LyhDEaCrLSi28ln?=
 =?us-ascii?Q?inUQ6WG7QWt/h7Y+dN+TmegNIdXYzys+qEP9z6LBkkTA3p8GToH/ckQH2mF8?=
 =?us-ascii?Q?cfDOx7co+/lUC+9XoT0G8dQAyjjuzmKCD4JOusnJGBWcM1kdfMzObGS8W2U1?=
 =?us-ascii?Q?+u5ZptVPEaT8uu2CeIA6z7lAY4BL4rBD8d/MckODzcxlgpBgfo0j6x79Is6P?=
 =?us-ascii?Q?UxaYfm+YiLaWQ7rT1oxwFdxKZxEjS2SE5VtYgsO6Zkj4KJtBeW2Kt+8SHmdF?=
 =?us-ascii?Q?SdgJFJ7uYipLwf7PDV8sXhydOi1dmkvtZ3jWAZWWvYL6bdodpNA5F+dujwmh?=
 =?us-ascii?Q?3ISywMiRB6pNLojdSlD16P/4r+D2qswqiTrThaxT4X40QMic0IsKUJd83Qh+?=
 =?us-ascii?Q?+nkrZQTGaARoCmcZIiQokoL/pGls1EWX06KtdkVkzH4g1WmooHAiaZb0z6TZ?=
 =?us-ascii?Q?kNGrZXJtQ8k3P8czyj77IaqupdO2dgcEVqoM533eJInl6aTl+pB/i6L0v/yw?=
 =?us-ascii?Q?hj3YXNnfThbjDe8zrcpewA30lN2rlDkbENQbfX24PL7y5FpL0hHX7Lk5r4L6?=
 =?us-ascii?Q?da96FFthJ7+p4uBSe/+oW1HcslO9cgMY86gzmoCDclpmGBbyzA2HKE5jyfsB?=
 =?us-ascii?Q?UjHx97GVarZLGTdPqK7eNhylgFkm0AbenW25Gnl+gYbQSE+arAt1WCLEiKtU?=
 =?us-ascii?Q?CtQIM7X5ZaxBek/Y78BC7pqua/ykewDV9FFqL6RL25q037kQI92eXBv7pPSi?=
 =?us-ascii?Q?GFbjoO9+URkCBCCOKYInt5Xt/guMWShGWraA2b4Mvmh7sS+5lVXmb/jKwGx2?=
 =?us-ascii?Q?RqQPAgyu2MXnkteVCu9JlrICrA9skdSouEub69ujfAJgezFeKZ6DwM/i+nKy?=
 =?us-ascii?Q?pGVqvLUvxeJhP5kV72x1DKL3gAycbrRndkztWBEBdOU93+/SP+NSPyehYf9/?=
 =?us-ascii?Q?3lp6e7nGxSXyayNwwipq6bRXloCOKjQE2IMG4boLZzkJ2rlT41Jwh2NOCpFs?=
 =?us-ascii?Q?EOQgHFsHMIhvV4LYIcT9JCOIPPP/EwrBJ6lBavN/dc8ffT1ndHN2NYjLD4v9?=
 =?us-ascii?Q?5a6IxFTXzEfqmjd6W+ZDFGpq20qJR4HueLJQcCvcV1stx+28k/+mFw2hRcUI?=
 =?us-ascii?Q?l1czK36VtAkAAQQ8dhxbyEdChUOt3IYIiOF0+PwVxphzCuEsPHDKa43Jn9go?=
 =?us-ascii?Q?8jSXqyJ65kr3wG2CsBrUJ4ine70z+3LCHBeqtbypok1gNrFwUhLxaQ78xcWS?=
 =?us-ascii?Q?7lgBVBnkXM6oze9tLevGyeg2lC/arzUPrsY8zGOBBoPBrfBm27r/LPr+stKW?=
 =?us-ascii?Q?4NWXZSv4O5+putwju/ENiAdykK63SM3xSoqRLsSeLq72fHmF7J481+Xe9yex?=
 =?us-ascii?Q?nWs4MHK5Tw8WeQRlwSgpXn5B4h8lRZlVFE6So5sw7R62lXPqvysLK4LiTgb6?=
 =?us-ascii?Q?/g0ZBGzHRkgKvLA/9WFFthk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf337a11-b9a1-4d5a-932f-08dcddbb0ca9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:37:42.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LEWoCFuE+eYJ13E1enjtRsx7fRGQcEKq7Nqa+/86CT5L47JaGq07dHppLmoBX/HTj7MliVr56LwlFdhGZafxz7Q2nD4EDehf9aUIygoCM89gvq/dFtw3vkHocn1kkT7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: D37XRTPHSSC6HCZACU6YUWGK5CCUYOUH
X-Message-ID-Hash: D37XRTPHSSC6HCZACU6YUWGK5CCUYOUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D37XRTPHSSC6HCZACU6YUWGK5CCUYOUH/>
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
 sound/soc/intel/avs/boards/da7219.c        | 2 --
 sound/soc/intel/avs/boards/dmic.c          | 4 ++--
 sound/soc/intel/avs/boards/es8336.c        | 2 --
 sound/soc/intel/avs/boards/hdaudio.c       | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c      | 2 --
 sound/soc/intel/avs/boards/max98357a.c     | 2 +-
 sound/soc/intel/avs/boards/max98373.c      | 2 --
 sound/soc/intel/avs/boards/max98927.c      | 2 --
 sound/soc/intel/avs/boards/nau8825.c       | 2 --
 sound/soc/intel/avs/boards/rt274.c         | 2 --
 sound/soc/intel/avs/boards/rt286.c         | 2 --
 sound/soc/intel/avs/boards/rt298.c         | 2 --
 sound/soc/intel/avs/boards/rt5514.c        | 2 +-
 sound/soc/intel/avs/boards/rt5663.c        | 2 --
 sound/soc/intel/avs/boards/rt5682.c        | 2 --
 sound/soc/intel/avs/boards/ssm4567.c       | 2 --
 sound/soc/intel/boards/sof_board_helpers.c | 2 --
 17 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a956542..93eba4fd27710 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index a31aa471a1c21..4dd9591ee98b7 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index c8522e2430f8a..426ce37105aeb 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 430c070a1a0ee..cb6d54db71892 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +158,6 @@ static const struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 7e6c8d9c900bd..4556f105c793e 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 8d550e82b46a8..6570209c1a63e 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index fdef5a008daff..6f25e66344b7a 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 082f311d8b840..ad18c4e9a6704 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6ea9058fdb2a7..bf902540744c5 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 9fcce86c6eb48..4b6c02a402047 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -184,8 +184,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index f157f2d19efb4..e40563ca99fd5 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 1e85242c8dd2b..94fce07c83f9e 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index cfa146b6cf087..30588d9e9ba3b 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_only = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 44f857e909691..b456b9d146654 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 0dcc6392a0cc8..335960cfd7ba1 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 63bbfc30f35e9..cfef00462f661 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 24f716e42d6a3..ddbfdc6f88e47 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -496,8 +496,6 @@ static int set_hda_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 	if (be_type == SOF_HDA_ANALOG)
 		link->init = hda_init;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
-- 
2.43.0

