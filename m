Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36C9472B5
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FE7E409C;
	Mon,  5 Aug 2024 02:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FE7E409C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819316;
	bh=4IKzE/0l6+rAy+h0bK7iSf8LM5SK26AwN1VMZBa1tEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nj0xYxAkuLIyPdxyvBTOeNMEtu6HHjoKMa7vCPvwuwTa237i3rLbwWtYu9TnopYeJ
	 yfF5wbyHV/QXgOIkQE3ikahTyOvB0xCJm0ZnLQRhnO5pa8JC3C9/NKFd+211UXQy3W
	 L/BGMiYH69D2IerD1rcEKj0c/+Z5tDQFf2Bvp0II=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D2D8F89B2C; Mon,  5 Aug 2024 02:40:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2151F89B43;
	Mon,  5 Aug 2024 02:40:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F884F89A19; Mon,  5 Aug 2024 02:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76CAFF899CE
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76CAFF899CE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LCpb5vxZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdfgM8/HT/79HmaxQD4F6MYhNx+8/LkjFt+gpQ25b+kPHPTp747xdGalhs+SIfchtzFiHeB+/mEzsr+XqDAoxfbJE0MJCfqZ+a36xu653amNPW/+8SVyAWdMXw84UvOk8caiEZViAALnZLWtf50Km8HqohbnRgbbwoNEt/sR1TMKwcQYfIkxQTlEMOE/exKj9ywuFSOmZHPAMItS6KGuMR7JzzNS3p89ZDktCJibZshqW2hnHmjMDtQ9rYNsjw2gJacIxsZTbqit5HE9C5DWDyUXRUzu5lgTDom4YmQfa67ckJB2hZTF+FFYcwt0Wm1LcUm80rEfEDv5PAP7AyEzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdlERduANgxTCIKQW1Wf2vcHnEtrtSsPVn4SI5YZBLA=;
 b=E55nYkF4mgF0imuBWN3V2RuDE5gv1lOo2lRDw8zP2ybn9TVTsTWm1HSwmCvaIu5SQONmbOuI05eRRCFpyvnSGCZdQyaPWqa0mpqLv8EfYNPfK6AvR5FV7YtXiRpnpTudJB2c+2HHp6XB6iavtazdR8aw4EkuI6bC07F6M/HgQkt6pX3zPj4ZiGPlKrUGHbPjOeGT7IHpnmXFJas71/3AvokRaYNT/YAD0C4nLuBPNuqZLqWW2MYseIW9Vu+Pa7mSuchZ9Gg+7uRaLIfcQvwYVwukiQG4dmUjtXeZ95NiNjFARYwOQnv9PlWDSwsrHuVpEnZb/zO6Xskr8DnJikGqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdlERduANgxTCIKQW1Wf2vcHnEtrtSsPVn4SI5YZBLA=;
 b=LCpb5vxZubtf5WP9vXNEhSDC9ZEqZaeWmbelCgHg9z/n6ei8AtcE1e0NayRIruRR0eI/jwJhwL7U7Aihiy3LEBxve95ZtG1bzbk9xJ+OICy+QKwGZ7RIAdX8+xSOvXTbEZBmRLaAuXifplDbOIImQqIlkrnmcDhDh6G8BKV8aw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:46 +0000
Message-ID: <87v80fyf8t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 056/113] ASoC: qcom: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:46 +0000
X-ClientProxiedBy: TY2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:404:f6::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b25108-146c-4309-5c02-08dcb4e71b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qWtHgdWLhn52TXfwojw68TZNGk9m72zt5tA2Bj4aPA2OoeWxsqf/v9omAnrZ?=
 =?us-ascii?Q?DqJfasMjWNXCEn8ibdRnTh6I5Xqb946y5lk3h5flNFod3cjBapfZunrX8l5Y?=
 =?us-ascii?Q?tUxvKnfevgnVMSwc+Iu5XMNYgSLHshSMdXXlUwcBMs2T2MI1wUft32CNh0sB?=
 =?us-ascii?Q?l2QPXGU7/s4AuJY2cil1HMMG37ZnqdBH1ksHuXHwSAt8gsHXlq3BHWk/TX/O?=
 =?us-ascii?Q?0GUwdbM5O1OU1fwxI5gc1SHjflEvvS2Spj3uchdD0S1t1hXCbdzbLcgX74e9?=
 =?us-ascii?Q?OvAcK6q7vV+cdxXqJlU75P8PIm4/PNNyRHpF4t1+T6eOTm1HIXI+JLBDanfG?=
 =?us-ascii?Q?V8hPGRrPXHrmV2jOVFWCd/wCXdCPiHrw8Aeg5r2LMod21o5NTtaTSVoGOpFV?=
 =?us-ascii?Q?rvCWKxHRAncL6OsbKoJFxtUJLQLjX1zgyR4JbltNpswctw407s1FgFjmPsIS?=
 =?us-ascii?Q?/XzVh3E6KvBhEUfuiOuquxtuESwT6cQVoelN45M3vZDYq6WEGu8gsiNawJCc?=
 =?us-ascii?Q?+8ggnzcoZdBaHjrUh1egm/z1TuEVB6Mly7pERS2j+H9/n208jPgqJBH3ZV9d?=
 =?us-ascii?Q?rdejIW8/MvH/m312shEM4sM4zsCugs5CTxCWHGrdYWyV4CNhjf9PP5ckvXyU?=
 =?us-ascii?Q?VOphR8Warm2gzW8h7C+Dl3TCSgstuaFbSX02oL+HR3ivVO1Goz3kY30R8Uui?=
 =?us-ascii?Q?W5wvGmt3wlrJSUnISrJ1ArKaNt+AyrUqtUyrGtr3e403fdKqrTYYc4JqCLU+?=
 =?us-ascii?Q?DBVECgWKXhZ24/wTKUOTtcPjsNuQdHIqOmSy3NJtEtmJyXBkm5FmQo7NZTgV?=
 =?us-ascii?Q?cXDUnkjI7UqRkOuZ7Fa2+NQfRBrHR02XrBWivdm2GwpxeEmkdwRx14UU/+Q+?=
 =?us-ascii?Q?+AG/ohFvhotFs/o4aruVJvNDDMf7UGpPxKi/AOLkO5IySzLlLo00joIXQikq?=
 =?us-ascii?Q?1K4JY0IOHuugtRkBoDGH0Mwci0d7PVxzbjyb4s/hKz4cv3jBUSUk9K3aPJ/j?=
 =?us-ascii?Q?ia85MZpwMyI2uZZCldYbDhV1R6NhwjDLzPa5PqDpd6Twiatu6L6Y1epO3UYU?=
 =?us-ascii?Q?hHpsgFtqDbdbwG5o/CEsatpvj1jUQ+1BBtqvChIziOAtVKKg/E/hr8NVbLae?=
 =?us-ascii?Q?b3uLziRd/UevMurSb9S4saoMVXonZzhDFfm5H8SrgXUOneX2QE8+2PxXIInW?=
 =?us-ascii?Q?/MqzcHKBzggJZjVv5tITs4kpvNLOuO/XHoYaezY3d5RGBqW7QpP+79zmbavf?=
 =?us-ascii?Q?96UNTiwObr+nb9k3n5NHX2RY6MizsTfzLnUPWckDSS39WSswVd5fPJSxzwBs?=
 =?us-ascii?Q?CJU0Pqg/kgUb1zYHu13PHMDryAqQ7+VJbypt6F5JDQKIzVOxOD+d4AVuVQU3?=
 =?us-ascii?Q?NCgClu8yyLvDFBuexAbWwQUqD1NU3YgEl0j7cRbxELVSxs08SA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QHWQX+lJobd8a6y4lXYIrqxMhxeeNNIN+VPEHk7Zc7oSAxktuu0xz6Fy1toz?=
 =?us-ascii?Q?2da5v4hkpYEwtrM0pcgkxpFaYUWmH9e+/SmEuL8TGoTojN+XV3WingvKHdJY?=
 =?us-ascii?Q?VU7wfvGD2SDrgTg0wPp8LJm2u4DIL8uFMiFUDbdop6EI60pPacBQk4pmEsWh?=
 =?us-ascii?Q?Kd7Cq8vymqab6jfN2bkb4vc/AcHSbIOVH1ZCdmwFyczQSh+aBbD+CJWN65HO?=
 =?us-ascii?Q?XBb8raJilKaLnqJZ7eu6poWLY4DBp1ZXKSoJeWUoYQS83I9t9Cvo/Sfr6g0d?=
 =?us-ascii?Q?WqlDAJhInUUtOjhWhBu5MVmOZwdRtCWjWM+98jsmbBaowpiRHQ44do4ekJIb?=
 =?us-ascii?Q?EY3RQACOpKnJwgZFa96UgxQGN94rY2IrmxkQ+tv16zbv7/UZzbu5hZUQjUUX?=
 =?us-ascii?Q?PMLpKhs+u15T/2lI3ijK3c3ZhvuQwOdWywNyK2AZ5o58bp0fpcReHvR4SQZk?=
 =?us-ascii?Q?C2Fqb5GXlT6dv5xwLKxrAYxPesWzGTHgPmh+OfoVofOrrzyagOOX4xSwSB1T?=
 =?us-ascii?Q?qTHLW6qcuEJPb0ubsPBCiUtm4Q5P/A8Xuu+3F0XU/85gOXVurz4xWAbIE+vn?=
 =?us-ascii?Q?fuJWY49uCMWsyCGIR1sZi0aIWJnMqn8Sb/zNqIBZ+hYjoMTMukckWGsGfR9C?=
 =?us-ascii?Q?IvU1xorhXlp55peKsPhFMtH3ZT3DM6MdBLQbQptLJtpkNitQMkl9/Cs3mHGS?=
 =?us-ascii?Q?hB6LeCDtMkHTMK21+bFjp32/TW72VGHV87afYi5YnJRO3qYCmBScpR9Icm3P?=
 =?us-ascii?Q?aHLYgKz0Q+81cOY4p7xZa14OgX/BGRaI4cE+FIBYqVGcmSg/X9dmpYqecmpt?=
 =?us-ascii?Q?t/KaYcs5Fdn0CI5c+bQXX8VKkOCuMGQjFj3AB2c0v2EVp6iUa0IzIAKTOQ0n?=
 =?us-ascii?Q?uvL8uUPi0Rv7NBMgRVYldmwGQKFQYCXBHYLbKWXdVmfPCrNW/ij3TRI9lswN?=
 =?us-ascii?Q?xNsuRGPu+wJRfUEXi8BEftU8ZXsdvGRMrNuJBtgiedLlDl8uGAncra6/W0A/?=
 =?us-ascii?Q?GlJax/nhMIAmctbQv0i8pwHnVEbc4RetOz0vKCnFtv8SCqcagAMjYEEN9C8D?=
 =?us-ascii?Q?OzefHsZydvDhpvSm7oQcDmJbQZI2eDogMUpvF/pIGmofmcLr0FS6yNAhcPbb?=
 =?us-ascii?Q?+lz379Bj6JXizTLF3ZtuHB1AaJcOwn2YuY4S7KLpv6T7mjD7dKFgOy7A+t2i?=
 =?us-ascii?Q?9s/rZvFmP5RFOBIcI46cnEQFpDBs3Plg9PUtyJSs9twCYSDrk5RjcQCGJ8kW?=
 =?us-ascii?Q?TD4v1BIe0itD21j4MhlthQaPBL2os+nDhpNx/Qv/9ANOd0qV5Lw0J9MF+dsn?=
 =?us-ascii?Q?hwfs5msqioYiXNoK4n2z6naMnCRpWrzQpHRQQbZ2Zy7UoTzE3LkB4CRHLaWW?=
 =?us-ascii?Q?KomjCIvU9xWnhfP4WZURJi2NdDuRt7nwZFlqtGnIt4uGKJdvbXEcgSLSvb9J?=
 =?us-ascii?Q?TngJHfpe78q5YBV49fAuVPyrXMjPq+Sk30aE/PRFuhDkMRca3Mh4bwVgmmK4?=
 =?us-ascii?Q?zy8pQwQh4c/u4xhhd8pzoNdhTvZb1+fSnM/p/W0pSAgXUicEyxHo6pR0lblA?=
 =?us-ascii?Q?r7kNyoxDQ8m6xjCVsLgmeWWSslZaAFxF/zHB4E5P1tHY1/XY830logc83/6c?=
 =?us-ascii?Q?CvX1qJqYMe172ruft43pEOo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83b25108-146c-4309-5c02-08dcb4e71b14
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:46.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7ZB04sNGtDPzHAgPw83fsCVroZY62Kmnbz+n4BIpsCxLaTbz/1691uEcUyTrPAKqEacYMUDvxhE+s195hQvtFWWg+hD8WuYXFzsouxWEpee6VdT8odvxKg0wwMkAGDEE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: 5XICHGYIGGPJSHD6FFVZCMO6LYXJIFSA
X-Message-ID-Hash: 5XICHGYIGGPJSHD6FFVZCMO6LYXJIFSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XICHGYIGGPJSHD6FFVZCMO6LYXJIFSA/>
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
 sound/soc/qcom/apq8096.c                |  2 +-
 sound/soc/qcom/lpass-apq8016.c          |  2 +-
 sound/soc/qcom/lpass-cpu.c              | 12 ++++++------
 sound/soc/qcom/lpass-ipq806x.c          |  2 +-
 sound/soc/qcom/lpass-platform.c         |  8 ++++----
 sound/soc/qcom/lpass-sc7180.c           |  4 ++--
 sound/soc/qcom/lpass-sc7280.c           |  2 +-
 sound/soc/qcom/qdsp6/audioreach.c       |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c        | 10 +++++-----
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  6 +++---
 sound/soc/qcom/qdsp6/q6apm.c            | 12 ++++++------
 sound/soc/qcom/qdsp6/q6asm-dai.c        | 16 ++++++++--------
 sound/soc/qcom/qdsp6/q6routing.c        |  2 +-
 sound/soc/qcom/sdm845.c                 |  4 ++--
 14 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 4f6594cc723ce..a5305f33c32c5 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -46,7 +46,7 @@ static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
 						  rx_ch_cnt, rx_ch);
 	else
diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 9005c85f8c547..5dfcd547cfcd5 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -126,7 +126,7 @@ static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 	const struct lpass_variant *v = drvdata->variant;
 	int chan = 0;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
 					v->rdma_channels);
 
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5a47f661e0c6f..81036c49bce1b 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -113,7 +113,7 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 	 * Will not impact if disabled in lpass_cpu_daiops_trigger()
 	 * suspend.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
 	else
 		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
@@ -185,7 +185,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		mode = drvdata->mi2s_playback_sd_mode[id];
 	else
 		mode = drvdata->mi2s_capture_sd_mode[id];
@@ -249,7 +249,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = regmap_fields_write(i2sctl->spkmode, id,
 					 LPAIF_I2SCTL_SPKMODE(mode));
 		if (ret) {
@@ -320,7 +320,7 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		 *     turn off the shared BCLK while other devices are using
 		 *     it.
 		 */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_ENABLE);
 		} else  {
@@ -345,7 +345,7 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		 * To ensure lpass BCLK/LRCLK is disabled during
 		 * device suspend.
 		 */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_DISABLE);
 		} else  {
@@ -378,7 +378,7 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 	 * the data flow.
 	 * (ex: to drop start up pop noise before capture starts).
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
 	else
 		ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 5c874139f39d4..dbaaed1f3d8e3 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -97,7 +97,7 @@ static int ipq806x_lpass_exit(struct platform_device *pdev)
 
 static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir, unsigned int dai_id)
 {
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		return IPQ806X_LPAIF_RDMA_CHAN_MI2S;
 	else	/* Capture currently not implemented */
 		return -EINVAL;
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index addd2c4bdd3e8..f8e223e73fa02 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -329,7 +329,7 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			dmactl = drvdata->rd_dmactl;
 		else
 			dmactl = drvdata->wr_dmactl;
@@ -364,7 +364,7 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			id = pcm_data->dma_ch;
 		else
 			id = pcm_data->dma_ch - v->wrdma_channel_start;
@@ -1230,14 +1230,14 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 	void __iomem *dma_buf = (void __iomem *) (rt->dma_area + pos +
 				channel * (rt->dma_bytes / rt->channels));
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (is_cdc_dma_port(dai_id)) {
 			ret = copy_from_iter_toio(dma_buf, buf, bytes);
 		} else {
 			if (copy_from_iter((void __force *)dma_buf, bytes, buf) != bytes)
 				ret = -EFAULT;
 		}
-	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	} else if (snd_pcm_is_capture(substream)) {
 		if (is_cdc_dma_port(dai_id)) {
 			ret = copy_to_iter_fromio(buf, dma_buf, bytes);
 		} else {
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index e6bcdf6ed7965..6898e9254a78d 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -80,7 +80,7 @@ static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 	int chan = 0;
 
 	if (dai_id == LPASS_DP_RX) {
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			chan = find_first_zero_bit(&drvdata->hdmi_dma_ch_bit_map,
 						v->hdmi_rdma_channels);
 
@@ -89,7 +89,7 @@ static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 		}
 		set_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
 	} else {
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
 						v->rdma_channels);
 
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 47c622327a8d3..d5a1c27652e48 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -115,7 +115,7 @@ static int sc7280_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
 						   v->rdma_channels);
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 4ebaaf736fb98..cd7d99f9b8b40 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1309,7 +1309,7 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, s
 	void *p;
 	int rc, i;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		data = &graph->rx_data;
 	else
 		data = &graph->tx_data;
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c9404b5934c7e..26c6051a53a0a 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -280,7 +280,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		return ret;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		int i;
 		/* Queue the buffers for Capture ONLY after graph is started */
 		for (i = 0; i < runtime->periods; i++)
@@ -306,7 +306,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		 /* start writing buffers for playback only as we already queued capture buffers */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -356,9 +356,9 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		goto err;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		runtime->hw = q6apm_dai_hardware_playback;
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		runtime->hw = q6apm_dai_hardware_capture;
 
 	/* Ensure that buffer size is a multiple of period size */
@@ -368,7 +368,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		goto err;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
 		if (ret < 0) {
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 9c98a35ad0994..3189a10b2f28a 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -171,7 +171,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			q6apm_graph_close(dai_data->graph[dai->id]);
 			dai_data->graph[dai->id] = NULL;
 		}
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
@@ -224,7 +224,7 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	struct q6apm_graph *graph;
 	int graph_id = dai->id;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2a2a5bd98110b..38d8aaab876d2 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -195,7 +195,7 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 {
 	struct audioreach_module *module;
 
-	if (cfg->direction == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(cfg->direction))
 		module = q6apm_find_module_by_mid(graph, MODULE_ID_RD_SHARED_MEM_EP);
 	else
 		module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
@@ -218,7 +218,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 	int cnt;
 	int rc;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		data = &graph->rx_data;
 	else
 		data = &graph->tx_data;
@@ -236,7 +236,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 		return -ENOMEM;
 	}
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		data = &graph->rx_data;
 	else
 		data = &graph->tx_data;
@@ -273,7 +273,7 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 	struct gpr_pkt *pkt;
 	int rc;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		data = &graph->rx_data;
 	else
 		data = &graph->tx_data;
@@ -538,7 +538,7 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		graph->result.status = 0;
 		rsp = data->payload;
 
-		if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(hdr->token))
 			graph->rx_data.mem_map_handle = rsp->mem_map_handle;
 		else
 			graph->tx_data.mem_map_handle = rsp->mem_map_handle;
@@ -575,7 +575,7 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
 			graph->result.opcode = result->opcode;
 			graph->result.status = 0;
-			if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
+			if (snd_pcm_is_playback(hdr->token))
 				graph->rx_data.mem_map_handle = 0;
 			else
 				graph->tx_data.mem_map_handle = 0;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 3913706ccdc5f..3e3d2847f992b 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -187,7 +187,7 @@ static void event_handler(uint32_t opcode, uint32_t token,
 
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			q6asm_write_async(prtd->audio_client, prtd->stream_id,
 				   prtd->pcm_count, 0, 0, 0);
 		break;
@@ -258,11 +258,11 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 		return -ENOMEM;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
 				       FORMAT_LINEAR_PCM,
 				       0, prtd->bits_per_sample, false);
-	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	} else if (snd_pcm_is_capture(substream)) {
 		ret = q6asm_open_read(prtd->audio_client, prtd->stream_id,
 				      FORMAT_LINEAR_PCM,
 				      prtd->bits_per_sample);
@@ -281,12 +281,12 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 		goto routing_err;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = q6asm_media_format_block_multi_ch_pcm(
 				prtd->audio_client, prtd->stream_id,
 				runtime->rate, runtime->channels, NULL,
 				prtd->bits_per_sample);
-	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	} else if (snd_pcm_is_capture(substream)) {
 		ret = q6asm_enc_cfg_blk_pcm_format_support(prtd->audio_client,
 							   prtd->stream_id,
 							   runtime->rate,
@@ -385,9 +385,9 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	/* DSP expects stream id from 1 */
 	prtd->stream_id = 1;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		runtime->hw = q6asm_dai_hardware_playback;
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		runtime->hw = q6asm_dai_hardware_capture;
 
 	ret = snd_pcm_hw_constraint_list(runtime, 0,
@@ -401,7 +401,7 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	if (ret < 0)
 		dev_info(dev, "snd_pcm_hw_constraint_integer failed\n");
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = snd_pcm_hw_constraint_minmax(runtime,
 			SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 			PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE,
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 81fde0681f952..7e7ad072700d2 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1055,7 +1055,7 @@ static int routing_hw_params(struct snd_soc_component *component,
 	struct session_data *session;
 	int path_type;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		path_type = ADM_PATH_PLAYBACK;
 	else
 		path_type = ADM_PATH_LIVE_REC;
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 75701546b6ea8..daa38d07a50f2 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -84,7 +84,7 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 			continue;
 		}
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
 							  rx_ch_cnt, rx_ch);
 		else
@@ -115,7 +115,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	channels = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
 				8, slot_width);
 		if (ret < 0) {
-- 
2.43.0

