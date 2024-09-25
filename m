Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1879869A4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4000C1E7;
	Thu, 26 Sep 2024 01:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4000C1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307529;
	bh=+GQQKz2/qgcKjSdJtfXAM5xlMV9Ge9Oi7M4z4cezoeo=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=f8bYfJYxbb2pyAJZD/Cw+odzEFrMIfPKccIPCYYZw88+xhWg3pLAcfqSmE3OaM7H5
	 f4fTJVysRuV/05obenE1uGG1RM0+oJ8PljkX6vJFqu1R9tazjgMyveHRWOOQkAXysb
	 +OZ5VJm+WKA2RkbiMkLnpEPm0fFIzI/lwNRDya2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73874F8047C; Thu, 26 Sep 2024 01:38:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79CEEF8059F;
	Thu, 26 Sep 2024 01:38:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F602F802DB; Thu, 26 Sep 2024 01:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AE44F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE44F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gvMGOXsB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/CEvHWA7apcCQnA27lKmQPbyj9Mb3u5BYCyMGzU5kEQ6zzzG8X6dVWskvIX3VbfL65Hq/7doKwOjuupsITMOGNH0qiuVvJt9j8/vA51TYgjhA3qPodCEY7PihfyuQ6vRO05/m8VneJivl+f2+KmJdQdZ61mhrsOt7zkX7PEtThvgDXst4o7wydRf4m+Nx/vNHncDZF5VWcnkgtz4ztvo4F+vllpUVFhVFzhEzZC8irlJVDbCTtF4ORUSNYWa/v++IRt17+ueyUkpvUwOCWYNxZgsJNyXG1utNrl+KEpman1VHSdRFCTxuJ6//4SQ8FSD3l2JuaiepelvJB3sSA3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS15ztR4ZB6WQNEzygbQTk6VINh2XKM8/Gwja2vxaRQ=;
 b=vjOimmX39K7s7/6sFf0byi9c89VX1qVSsG0+DcWiYIr/915A1hA/Zln9YnP4sPy1DYQWapiKOC2S4dJJc/xrs3St58/uySvLRUfWeJiaT3dBQkeyb9eu1RC/e7MMhPVRgWMOMluUkBaEJ4bFiw+icKGzgHTkSum4PhsaVkuZRZK5vFBFu6dl2hB0mUivbUNF7l4vu7fPfCPnlmSWNT1iEJIy05Al4t6nQmc3rpq1XFGjkZTfh5bsAQVNFD57hVJZq94+6boNRmgW8NHA4NdVrZqYJLMw9tuecxNRaYvrc2FAeQMqd1RWo57BQ7aOvRvMUUZUZ/j8dRf2wVO51LIM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS15ztR4ZB6WQNEzygbQTk6VINh2XKM8/Gwja2vxaRQ=;
 b=gvMGOXsBxxOcuVJFdwdf9Hoea6kisBk8m+5BFpnQCPd6oJoXe+pBbh4k88hf7rAq0iBfWm2NSpif0qp0AlQnk55tRi3NqI99HYrsvt7Vfb7fZ78H1Gk0id0a2H7mmcr2SaPW8d9XkvCf4N6uDa6u/F+BtarHMso9Vp1Y7BDYznY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:38:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:36:06 +0000
Message-ID: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/13] ASoC: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:36:00 +0000
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f85d4e-ce29-496a-8420-08dcddbad050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?teuAS+ApCG6DzQf9bs2TlU0limZXE3AdBjsZ02VnDAKRTYA1TNI2koAmLEzK?=
 =?us-ascii?Q?tN7ga5LAEN8hyn1HYz9UguDUyeDQYOXGyhtrBNpoL1WRr16BopT/f2tECJ9W?=
 =?us-ascii?Q?i3zBdfi+lNICknCW3cpCNCR24uI9TpfETbT00ku8/V6ZZvAgkqB50OmXTKun?=
 =?us-ascii?Q?aeXMfYJAX1m7C+gQ8cj9B6Er8sIUZLcjJmI+8xdpKBGr3aFX2YizNnl6E8zT?=
 =?us-ascii?Q?igzg6xLMH4dmzc3grITWqVvNF6mBddg/ULkCutENqxGR8t2gIIt5V3917B5e?=
 =?us-ascii?Q?WtX7A6FGabJuS8ZfeS6wp5nw9GZdV7qDtnN1PS2F2CIfNF1fURBkqlQQaqVX?=
 =?us-ascii?Q?TLRFpbOZu2VMNTnboretV2PR8xZai7eHa1rr/KURMTdjq3zdLI8Qpk9l12b9?=
 =?us-ascii?Q?oIAVAgmrP60qt3DSyEvRD1mrjtYEMHUe4YKTTdfKEiBiWo+N8ouXZObyMnk9?=
 =?us-ascii?Q?zeQ6FBWlcGC/x2RvEsr+nLB7fjOET3iH38P8deGGxNrxAUq9jGlgz2/EM5az?=
 =?us-ascii?Q?2iPEiqRxXWCJsuRX4xMlWNLueN+thVeF1/rtqypdkXziSJLpdCugliGyVJmI?=
 =?us-ascii?Q?mv6xrkEDWzoZ96pcZldaMqexiFrcU7QFyJu/i6RoS58PjsjZj/UGBawEhFXa?=
 =?us-ascii?Q?LTyNYr/DapxokluBKsRYILpVxMKal1wx7BifsuRRQnRVi558n9MnzVQoyb7O?=
 =?us-ascii?Q?+WFk+G0i5sQBIDn54d6qfXokzlxeRciaB4Gb6bm2Opar3lXkkdx0KBX4NboI?=
 =?us-ascii?Q?9UUoEHj7Jdgybbyy6XYi4YXRkJpiupOiCDKUgp6s8n75p2Kz/NDcAf65QGCG?=
 =?us-ascii?Q?mduSZGNWtpdIW4Bb5fq/qbubQ0vVKjFkgfpe17UpUbXvK4V8YHToWgzLLuHF?=
 =?us-ascii?Q?DbkOYvoFl49+bizEy1bOTCodw52K7+p+XMdp/DGIQNFAL6UcccRYXsVHkQ1I?=
 =?us-ascii?Q?VqOI7IznOnoNTMmSHJjiUwYol2GJZmUZN64uuyZvqj+0gBRV6x0p73cllMCF?=
 =?us-ascii?Q?6es0MqVzv9iOuYVwuU3iOafG8U8XQBzh9kYNjJkvV7pOXgiYKgC63GHjsHVe?=
 =?us-ascii?Q?kARHFgbd4tQQl9lrtvU8/YMrOPZzxSkdD+XSm+3E/GRFC48bztP4GfoZO2nn?=
 =?us-ascii?Q?/C42IRt19N1O4umv9l1tzgXqsn6T7RoGAvCn6RZFs6DsIrJoG9o0q0nlmqyh?=
 =?us-ascii?Q?RnMY4I+FlDRTzVaeoLVO9esneGNofTUn6XKhT6vwxmDhQG69ATnrkM3CCn5c?=
 =?us-ascii?Q?MMcpKVO6cGVJwoJFp7IwjgPs2Mwi5bzqbBPe7F1yykRJKNdTMWpGTjGRICun?=
 =?us-ascii?Q?jDm9A4mKLNwrx4k9bCFwvV01Y/wzHypqXxCrG3WogHSBuQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HDc3oY4XrantJC5VSsO+9IDUBz4SmotvYkpX41qjb03bXlL1UifKFe/EBtG+?=
 =?us-ascii?Q?jg8EPXnpSE2Q+g8c6Jh3T/7UWGgwWzdmUNG+kvLffpWrfYSEFnNTzjhlypoR?=
 =?us-ascii?Q?l9VdvJ8TsVtogKNdRnJyhu8WsKwR+Efx8QhumOOag/ShPslCpCKeMij00tZ5?=
 =?us-ascii?Q?GBj+j+rgDv9lTogLmlT4czeqBLVYBAzQm/3ef0OxS9tM30MMeuuwFbjVuUZz?=
 =?us-ascii?Q?sOuqn3XPhFrVICTvkk+yEcLNTm3ui0Xf0+Iky6cEmDSWgvn9h92SGL28uarf?=
 =?us-ascii?Q?vVyE9laYO1SyDBDD+k/AsMI5bPnwzAzJIg7hIkEjnzoKXbv9b/lPaTNdLNQZ?=
 =?us-ascii?Q?W3qeeo6gh4DnmW6cpaib5NkhSIl36W/6ZPxFj1bTF/m3xKDqM68VY+TVIY0i?=
 =?us-ascii?Q?cV7k1G3Wzt6WWCutzc4+SMYfC2LpDS/RfckuTWBqNKwC3Bwz4U/RnYnvhhW6?=
 =?us-ascii?Q?CotqMp5b1KRQZODjJfzOXw1JHx8Bw0zsV8GGDDAGvdjGJisOsKNMxanKTvQd?=
 =?us-ascii?Q?4jJuq2WntDRDsUETwAuQ0NKTd88bMcvbsD97aCQiXV56YdVUau1vd0sZhE1H?=
 =?us-ascii?Q?9aKWNtR5omxa7tvKeLvKvBjbv8i+UoWCuVOTPNbHGfJDi9DdRzF5DmXu5Jwn?=
 =?us-ascii?Q?pU9tk0u9TC+j/6jDqr1jjiJASVBjXLdDBEsYeafO+UPY/MMlMcYgqqu/tFJu?=
 =?us-ascii?Q?VERdHo9H/82yHaC8KZMSCVa9vmMNykgBDeSadJMc4OoZf0Hlrm9nlmlC/jNg?=
 =?us-ascii?Q?8H/l/BouyCfa879WRo8Sieve0LPnCHOFQVAOKY4vaAlDODs8aOp9Di4Vh4PS?=
 =?us-ascii?Q?xJeO3F34zsxIoMxCwbJNeOncos3ekKCWFXrl/yLyTDHA0/iSK3mkMMHKwGSQ?=
 =?us-ascii?Q?0JWAv+O6ZPzLhlvP5Oxe5qefYI6/IJFFjkjRqZ9stwl+bf5GE416Ousgnnho?=
 =?us-ascii?Q?1J4b1fwwk/dAPpHPKhr3skxnLfZzOH1KEY70poxWj94Q4YkUzoKaoYwonhSx?=
 =?us-ascii?Q?1iPzRgmShlTecfDCwKtnpCZgiDFiJEe/BeHBI3783MTiKHurH4IQTQvGmD0V?=
 =?us-ascii?Q?Eg2SsltpehDkHDfh/i7zlvpURcHIUjWhuyJ4RokotEJxZ5zNMLBqaG9kP/Hh?=
 =?us-ascii?Q?rbJiGO1g4Tb11Sp9vwOVL9uJQ/lo/Yh7FjwdTvLGXXi7WOn/kaD+8dncXuzD?=
 =?us-ascii?Q?+7BvfoOouF4ECb50igJ6dHTOZy537sL5NEjSCXp/onQPtcGbZE0AalxlQ2Eo?=
 =?us-ascii?Q?A3QXl4oicZ7Z733pwDvoskZlZTp4Pwx2TGECTMQn97z3rggdOgZq5YIuisNy?=
 =?us-ascii?Q?UsRaXXJIAgU31JNLcEGlCuk8cQqMfZUf96hb6YJY59Wo6e2czXz9dTGTzp9g?=
 =?us-ascii?Q?4xpu35eKd1Z6P9sfEPKWAYsFgB8ACUSkQLN5hjOeD27oG4bPpIpTyqyLHgot?=
 =?us-ascii?Q?zDiROuFUuk1kX/paovaDhKPiDnTN/g++7qV89iXXQ211tLsPR9BsqDWCqNLC?=
 =?us-ascii?Q?S0eVR5FdgEt1VtUgH/E6VxYgAesa/kXr3ZgMjlzIsYJja0mffGLF9OLA8YNC?=
 =?us-ascii?Q?qWfzvLpliq1y+X4bSRzohn2hQcIsqc51W0fbX/LzclH4dO/sCQfzo0re/prj?=
 =?us-ascii?Q?XkevZW/y8cLzb8B5GzM9U0E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21f85d4e-ce29-496a-8420-08dcddbad050
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:36:03.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JN1lyu0cZqyuK/+P40xM4fZeMGuntJyMsN/+QJMQji6UnFaYCsNbYEDGtaiZ9fVluLP0c0MEZgGJSh7Ycbwxo6NbKFiR5D2kqrAAkvkV9vqJW3645x1Fv4M6nTdUyRVo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: 7JJTV4OKJ57SDYHFNI3UJX6BP4ED7RI6
X-Message-ID-Hash: 7JJTV4OKJ57SDYHFNI3UJX6BP4ED7RI6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JJTV4OKJ57SDYHFNI3UJX6BP4ED7RI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

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
 sound/soc/samsung/odroid.c                    | 10 +-
 sound/soc/soc-compress.c                      | 15 ++-
 sound/soc/soc-core.c                          | 20 +---
 sound/soc/soc-pcm.c                           | 93 +++++++------------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  4 -
 68 files changed, 315 insertions(+), 583 deletions(-)

-- 
2.43.0





Thank you for your help !!

Best regards
---
Kuninori Morimoto
