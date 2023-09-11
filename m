Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABEF79B141
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:51:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD1BEA4C;
	Tue, 12 Sep 2023 01:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD1BEA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476287;
	bh=RFQkHzLpUb3cXWzirIWZH5Dfwe+9odDNtcku8ClG8jU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HON81cnGS6p+LgMrTyuJXp7mi0Pjwa6Xez9VdwEr4c3274u2vs4DWuJxorXJPRwIj
	 nAcIQDT/CB9S+Z1zXIBXsou7fpxo8YGYPDigzpjlOFTCKHP7YBZYtmRMs7ejmvRUPw
	 kM5Z8oPeOEpHjv+qCzdtREW7LqYvEcrSCp6fPy9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46344F805EF; Tue, 12 Sep 2023 01:48:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACD22F805F0;
	Tue, 12 Sep 2023 01:48:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3875BF80589; Tue, 12 Sep 2023 01:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E362CF8057B
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E362CF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=a8CtFWdx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeDt293Z2vA895XLBxkv/dYpsMCcfXBrShsf8lr14c6nPhmjwoY+49/Eh6nZOsV9wed9ZEfEe9a8QLouYfn3h3wFWKazNcCD1lUbhhiIrZ4DcCydR6rQDeZoCTNANp/Cx/ekssp8fse15H78xJDEnnogwMlJ26wpndf/DvgQF7EzdgBQG3kx8zEaFxP5ti9EPj8s5Intk5XFrzJuq6ut2wmvD5gPZdFDUlYujIAja0/CBGKOYVLvXi9roB21Wqkf49yCyzQ9Mlh+B4yReLJ4PDG7ot6gWYDNr1P8oFJiVipJVmmw7w1yI62HLCHfmQ/2OfPXL4qsDbAtI0kwrzFx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=325vRJxjBfTOnvtMUAjlwZ/DldcvXlDZjAJvfd2/sjg=;
 b=dh26QxuUTE5CCHuA7/xfvE3qIJSLyxYg1kbbmmyiOX/OvR016jyjr0jxdt1LpShdl2iNU2wp6ZCiFllAOGiZ5OMUcnLnrsqh47DZJQq/0kq6T3JTrCXPRXDXLdxuwBBH3oZ6U9qj8/WaoakwBRa91BzoGH1GbS5gl/0H1vtWqhtOZpNGLq8HpOnZLE0MjAT02SPx2vJqNhiUcsaHNp2ejqVpNpHnunNDcx9WQ8kR9AQ+uZsRbCeIRXYOv6hmBblvgVNf0t/Oq2YgMqBVY3ODtNk4isM3oOevFSJrKOtoCTBNCJ4xBMeHEHUEaA9wOOvUcRG17jqM9/7TJB9PlfW+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=325vRJxjBfTOnvtMUAjlwZ/DldcvXlDZjAJvfd2/sjg=;
 b=a8CtFWdxbykWSWa7Il3QL63zFAZyjXrY+FdoVBbZbEDEkmMsWQwwUxiPiYlfr+tVCVNcetw+2GeDVRi3DJUGU/SlBejZAZC58Ks2DNTic0GYPAftb7M3DJoLabCSYBV7CItwMc8KaxknIfqq5/2I6qdwVU5j7n2JOWYJtFFH3vA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:48:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:13 +0000
Message-ID: <871qf4s24j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/54] ASoC: mxs: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:13 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7bc526-b974-40ca-68f0-08dbb321900b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jRlHiDn6llcXSc0/wfHZWVU/bDqbunNjhMvHu/H99CIM1fUsljQu1P0HkLdNxhbZKAHhV+XRwEG+wT+3j4G2JCOVPvihTV+/rhBtcrw9DY9eewMyS67qy+KVv911HlklPdJQ7U3UnCrBTn8Uyg8WwnCX5psb5Gomg4vvAwCRyeLk1zY5gQo9gOVwcGDwKQtkYu8Hz/9uB/Cz/d6fXlIJnuQX8SqpSqLaroT1Z1MdF3LGk+DkTlx6nLyH5IuCFGBfJtLDX33dv0OMbO8PKbN5TIvfFN+nFycpfrtZ6jlvqRRcw6Ghr8RxWJDBkO1dqPQfgn5vElKUTphav21311pFpuSsIr3z4XlX5zgx1DG1+IafHZRDi19rmjMBkH62PyI9JfmkB0E+BoNU36J5tqi4iG8XidNdlfCCUYDsK7cKkfDFbYRR+7z2r6ulduTDDP3z6iAknPuWRP+l4j68/gYeam824MoBt8qTPVSMiJdshT4NCDyJy5+RD+zczVUQdGnyhsaFE/DVGOKzYt4JaSi1Xf6QlkPTubyCBv1dUMsWvLYJHqGs48Fz9Zmt6VUMpsg8QRiNY69i3NQEq/WKJm4Gk88QTwC9mzM/wqnY4kUGrd4CPY5EFKcjvn4fgTFHHYGqU5Qo5t4x4SaQ2fguGx4xNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AL0X99T0AqX7SrHLVz86qsPC156jh0ogzASCP6SsJIZjVnEhjbDPSPpO35Hm?=
 =?us-ascii?Q?G7Sdl/v9FndW4osYmXKtJD3Mw6huLqpJmihyBoVHKT24ndhjvelrADUVb53q?=
 =?us-ascii?Q?TbbbwlHvVkKj0TPN26qvOiZ+AAfGg01xenQCx1v7wgcn44U8maiMtemP/pbg?=
 =?us-ascii?Q?WXE7NPha9kn2VE+NkmooR/280UDApa8YTZI2fYJqkuTPg/EadbDBIPCVDiRU?=
 =?us-ascii?Q?HWnWFfmWXPGFTVcDAEG0a4zS/Ynly58/9ycjE/v6dxSNvhy0QccUPvhgMyaN?=
 =?us-ascii?Q?KPRSMfasfyQZEpZiS1GdwpAz5NhkRBvKHlsKBBJ/DLBsaOE2nWg3cNyUqXhx?=
 =?us-ascii?Q?XvECRztfJxoQ5/5m5oRnV32mY7eu8LHtqAeBiN7cR+82g6I+J6igmja9FdLU?=
 =?us-ascii?Q?8K3TjmYLhgH94VkPqmjgljF43KkBfMhhvjAFdKz4ERx2Wp1AuCSzaZybs54Z?=
 =?us-ascii?Q?SPtBrYdrnhti7kDAZNobqpkmtPDBo23dIqQQlnYGOtzbOwjTIIwUiG3fELAu?=
 =?us-ascii?Q?r8RDNzh9719hl4F+TQnFUt5bHduBYcsCvkexN3lPLBfHjQ6vHDKkKR4hr1QI?=
 =?us-ascii?Q?TYdoGsJJUm3emHI89TjZl5081qDek89OGDK0WPUnwsmumA1ZIDVCs+sgEC9m?=
 =?us-ascii?Q?8xg9v2Fy8Dn0mvzHZvqseuZzCnLntN1shAk52gfHNpWELL0Kob28210Sf3kq?=
 =?us-ascii?Q?CcpSE8d0ZTPjmZ8ZFNBoWysIFxY4Bzb0/RFaqvSi173nlUD8a58A4rx9psON?=
 =?us-ascii?Q?747i0rst03oyrBvMjF+0yhJdIbIo1IRq9gJWNoFV+3CWHtBkxqiOtG1cgK7Z?=
 =?us-ascii?Q?YwqI4Zt8dR42xYgnk5Llx9k0VaPCAHcAEuRKuTg8j147VfTK7XSvETw7elQS?=
 =?us-ascii?Q?hYfPubkiFku3FsC30lFWg0x8Jx6XE9/7E6vs0vbyUjiEDtgvwglLHmzQgExT?=
 =?us-ascii?Q?294pcigjLpWCCVP4d9PaG3VZy8ZXNd8M6RWQ4Qsb/7lvBfXUcFUPsJsj+VsU?=
 =?us-ascii?Q?/r9q8A2qJDWEeOBklSiSniHydqV51DNERG5uR6mDE8nFaaf834qY2HxfEXA8?=
 =?us-ascii?Q?RkHdj2MkugIHGo4D8RxU0rDpLyCmpVywSn4bdLuSb5xMueErbuSBApBrNuHZ?=
 =?us-ascii?Q?XArcG5tz1KpKDQ1ND4QfBeI4b9omff4ZFBnB9tiG9WOnNXWPTAaDzBkQ2QCv?=
 =?us-ascii?Q?iO3qMmFSJ/D3K7sYSpCX9D/BOgX3b9LjeX+X8pzp6UOFuJIKTCz/Xu7VQBtX?=
 =?us-ascii?Q?1BwH6mN6miyqBXCQ8Mz32yaD3Lu4r9CuMkdQHfS9fw5Nic/vkjdNm6Jf4DR5?=
 =?us-ascii?Q?XV8bRPfK2w8wcldULwzbihp/7NdyvlOhw+NZQ60t4GowxHQ661oWBBxVtAgD?=
 =?us-ascii?Q?5TUC8GHnqhVwnSBLQZla9+fqTTeZcpM+nDudZnG5SsA9BoB2I+JyvW8BBuyY?=
 =?us-ascii?Q?SQhliH0xmMO3INHzr5WSd3jAxxv+LKt+6wlp2QfJ6aszSnMdt4e+ry2MyJ6j?=
 =?us-ascii?Q?zrXyB7y5+g2j4gxNsNhnz+4lltg99wi961WNXSRw5Wwr4h9yj3YICWJ2fuMp?=
 =?us-ascii?Q?+PtDvfXIpXhN1ehlb2KTv6qRvKJTxkkmxXeRNz5IWLjBmulJj4cSRaXrvCSe?=
 =?us-ascii?Q?GjXNT++riBe1QsFuuQa5YJs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e7bc526-b974-40ca-68f0-08dbb321900b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:13.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yHxVMsiQf+M2npcDkX5fegdTQFSAjKhpgxP9E/OvLeu964iaRf/TB/QVRPlZmOCqZpCJ/Ih4yvHDTQOyMkWDcjBm25XSKfmNLHhwoTsGVyA/c8ydIKqFsCrZOSmGQaDi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: E3WIU6ZTFJFZVZIPGCGCE5I4KF2L2IJV
X-Message-ID-Hash: E3WIU6ZTFJFZVZIPGCGCE5I4KF2L2IJV
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3WIU6ZTFJFZVZIPGCGCE5I4KF2L2IJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 457c3a72a4147..01cb5c5e72fe0 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -19,9 +19,9 @@
 static int mxs_sgtl5000_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int rate = params_rate(params);
 	u32 mclk;
 	int ret;
-- 
2.25.1

