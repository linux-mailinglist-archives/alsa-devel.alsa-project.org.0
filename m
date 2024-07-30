Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587ED9403C8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCE3E82;
	Tue, 30 Jul 2024 03:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCE3E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722303134;
	bh=gQdJ9n2fwkHItAVdTq1zJ57tqpCxRZVECGrGU2YHOfs=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AevdlBoPI0teEdAk/82h14l7dajzZdKt0rKYzKZoz/bqxBEn2G6lNkeaRmOr1txxx
	 v8IEaczyAZxajT2Nrqo7eRYGDUcIk84G4QRQM/xvwoolsl0TkA2M1vE+JUTJnhltZl
	 LYCzyTsbjh3yt9rAtlmjMivtX3PVPNm7vbuDdcMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA6A0F805E3; Tue, 30 Jul 2024 03:31:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B5AF805B6;
	Tue, 30 Jul 2024 03:31:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFBBDF80589; Tue, 30 Jul 2024 03:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC5F3F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC5F3F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PMbXiree
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p81VzIShMJF0bklUXasHoNafN3TeoSpjGtSV6JgZosH0W+WjO9iUn/LQqVgMJNgXPKTJB9JVPtjZtrl8n/iiXaOa3UV4NIzxvdcudIemk5DNSfATSJTgWEGJqf0oLTLrDDxYELaDsQONdBIrUHIWch1tM/QjIjjaZf1d9GiIT/uDv9tFZ5Dzyov1kj8vDAJAVHeKH6qC884OTo4A9NaurWBK/5Qu8n94r803UXpAg+xHA01ncxMTIkd4z80hJ2X2MjT/9TYGaQplQzEjtS0VrGxfNZofh5SXr5W5Nt9CQ5zJjfp/VhquiBZiwz66LTXcytObups5/3vADdrV/wkkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbIV5P1YEMSsG7j567qbgJdtHNZODzxEx3dDTLMImXI=;
 b=eIkJwrAsiGLsXyVGuY/WGaO/hyFz5jNw6KGvfJ+797k+DCNu5IVWc4e1KfpLDib+fT8BbZ36vdkoZ+8/pznZI8IWaKRLIDcwvJqMfIVL1dZSdT6nVaftZcTScoDYPoRuSPYWOVUE1eQ6DvWfhrU+dnJhTBOZKqBzomVKSHKhdDQbE5DBxiAZXVuFWZb904ncd+OFMtohs4zIF6vOimxlOoZ5bFQWk6pkA25EiHIF/WaZfnNxssD4bm63O3emRULPAZv4VJml9fHMsVB4Jj7JbWEbIEKozjczq95VOTlwDv7f1higPowFxt1GE4kmxOdFpLMlTh7aXkokbJMzCYmf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbIV5P1YEMSsG7j567qbgJdtHNZODzxEx3dDTLMImXI=;
 b=PMbXireeXrDnjGlALccel+4C0hyOgkVL6qxcc8cqx9dD7ruuSQ63hiDlFQD4JUtRd8jXe/q33elXD3eRy6muNE+67Zip5gItt2g4sGFC6QNcS8Wb7+eHPvcD6QZqB4EeQQa/JZeeXOnuu4NdbCuhwGDrKa9ERu6oPcbJLbdOmxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6078.jpnprd01.prod.outlook.com
 (2603:1096:400:4d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 01:31:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:31:34 +0000
Message-ID: <8734nrll6x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: remove bespoke trigger support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:31:34 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ba728c-e6ba-4b86-d08f-08dcb0375923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7WgaTILOwr2bZcy4Cfn+rSLbyOuMMdpvzWCqyk5Yrss697wFp8st/g2nI6GE?=
 =?us-ascii?Q?GzgjKg64ttv3TxCLvWbHbw8RpF0YLuKJSCLJE4tMza6IEcXPF8WoRTjV/NGm?=
 =?us-ascii?Q?Shfkzy1lbhUXAF8Q5EPfS4aMPgaVCu1dLlDAXLiX5Fb2So0SBXmZ/l2BRBhv?=
 =?us-ascii?Q?e4q2eitEC+1QZsVf0yJwy/YQeem/g7kN+F/anN7StMNofRnzuhmov4nSEfMg?=
 =?us-ascii?Q?+Vytz/uZtZXcTmIPx7YHP10bZz0reIso0up4NBudvVJxohzqUSJr8dHy7aR2?=
 =?us-ascii?Q?KZVji/+MQu8ownkSSMNqKkCJsODSQ6YjYGcwC3eFiaALZ+AmwJeWANqpI4z5?=
 =?us-ascii?Q?MthDz9vp0CuApdM66B5FRxkFziN0coPHmAnLBuNtrfi36FvnVM3+JE51LK+F?=
 =?us-ascii?Q?jUVSFQnDU15gwfcikYWCV1yfe1eodw4ZXqMV2XjwUWIob67kelMElNtnIQCe?=
 =?us-ascii?Q?/boQvoxQuBWknjW9inOd9edVb0yAS2EpQf4tFqu8P27hJ5MInJ1tmi9pffqz?=
 =?us-ascii?Q?Q/nL1Hxf5mXVRcHvcmLpwhCWXANvBk5gq+PR8jTsdhLbbzB7QmsDA8NOk430?=
 =?us-ascii?Q?dFup4LEZEuwBsoGR0UnmuJRxHhsEUUXa6xBs30kGr0iif1cxjnj1NM1/D1hq?=
 =?us-ascii?Q?aCR+Hqx7g5EVtze3YXqIq5NCvdbSFpTm+O5ZR9dWQIZdpsBevSzuzJHclaQU?=
 =?us-ascii?Q?OWZRn6EDMwbEGocfgeqck26m2UJeYol7nUJvFboaTazCRkbASiC9aCXRKI6s?=
 =?us-ascii?Q?M/ExMam2lLXl/5pun5zjEcylfeUv3naDfeXPQQ9NteaucWxMjLhyWbTTsT3A?=
 =?us-ascii?Q?nnDu738fnaI4PprwPQTdLZFqmJiAbgwYNh9sEa0NYWo53nJrqZBwtJjp+EjX?=
 =?us-ascii?Q?aguGd97L5PeZ0klgC79o1GzAc2p0tINBCL+cBykxwjTBNYQeiInNMx/wDnN/?=
 =?us-ascii?Q?Y8OymRijwOuATHxn2jnPq8nHPUiwp7C6+/jauigj4pYvjIy2UY0Iv0QGvg3c?=
 =?us-ascii?Q?J9Z7kcxjWSjogbqP7ptwKiEHMEsNB8+fUlpcUIMvXvLM8gqv/8yh8rydypQx?=
 =?us-ascii?Q?ynnJdeCMBmtQz27zPqUqK40uX5seFOpm13yswcIZQJdEhirj2V91mEVFnwtR?=
 =?us-ascii?Q?V+qq9l1VKtmrtGdvERBWijepkkj/FmoJ+9J5muvnEC2S4VUAAoGEVG+udgYO?=
 =?us-ascii?Q?CxYrDu5GB+UQAha9A+D3HYmEDWbKVxJElCCMU6doK0981TpHFSIaJiZFflJr?=
 =?us-ascii?Q?zj/aTwnP2iusBPFO5fISsF/IdaE7RUFuzCH104P7mIk96V4KXBPqnRqsVdUI?=
 =?us-ascii?Q?VpaahwFEsQNICAa/8yILr0phEAybHyxy7Ty5kDbPvy6GhihY9czpCQDqkbtZ?=
 =?us-ascii?Q?cknyDZQlS+drYR5hgOjhjWibYUGYgVqE7F9EbXmGadvWKTP4yQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n0aN7fIA8E3LiRRDo7rFkjKUzS8Y7EK9xV5sky3GWet+CeMnjvyCf/18IZIw?=
 =?us-ascii?Q?EKfkiEG0uW/E3Lg2fimhxA+zeDVF92HKPwMGBwWU395ySFa5ZUwDXjLSzMdd?=
 =?us-ascii?Q?FQpVUNKlx34TsTyJpsLR1zIdTDwR6F2ht+vTHuaZoQ3F6N2x2Nj6zSEu/OXs?=
 =?us-ascii?Q?I0Z6dXQ1QK+ZLIjB+bUpuLqarsQzjQlM42gpN8twtfI0MZPf9YTAHjyPjJeb?=
 =?us-ascii?Q?wPsCEAO8X/gvFWK4Xo3Gm2FQAK2keQ8z4sUZgCjTZLLaZsKLowF7mSZrKxs6?=
 =?us-ascii?Q?MUWrC9J7ipwDRhvVYI/vYWkATXojDSH/PfSmhFEs7lIpHnSqvq/+S+UAeJkh?=
 =?us-ascii?Q?xD3/UdAj8nVrnvJ7dkOplFlpJU5t2NaeJ0WMzVPz5czsGceJ7uCmoCOOcJeo?=
 =?us-ascii?Q?OOzuiTXtDCwgB77ZiVfrh0A7kpE8LAFtUQarFuVu9X1UtIHR2sG+k+h7Ct6+?=
 =?us-ascii?Q?+JaXfnHnM4kvLYT2OdIJQsPNaLGcXhWI/pZwxhHou0tnr/eR4zlZ8f9graGg?=
 =?us-ascii?Q?VC7FrVegTUL3Fwp3MpyrwV7pikEct70AVNxyITgqp3LUS2Tcb9bq2n/GuptI?=
 =?us-ascii?Q?jmsfL33HLUBFekuygGN6waf7dxg/JLLZ3auq7axZBdDk2igahOuCQIGwK940?=
 =?us-ascii?Q?sFAUZfzLY4D5MILAV1BV/AZRz2IJZM0F3DG8RN7I+5zJnS5u81WRgMjAzUuA?=
 =?us-ascii?Q?Vr++A2VMVAIRw6MIIEcXAEXrI0H9plLCvJO5eDeG4fDNDapAqgJmEoQlbaUI?=
 =?us-ascii?Q?E5hQwshtMo8FdO5GJxRueKXuAdUvZr9l1KHsIqHO7KQOnJJdW0l+ScFT/Pvo?=
 =?us-ascii?Q?YPfA5kRU6Yj+JJh4cRbPcn+1K0FejfZsVRfD4no7EgO0VrYQaW/YWCUpSwdu?=
 =?us-ascii?Q?4wb+NkDINKxcgphlUTqUFRzSK3Ems9dSlg8E4PBCqcZoUWXSTot5EIjhl6Ut?=
 =?us-ascii?Q?DguIKHL7Yrt7Nx3WDXUg1WbEScMq9ypQh3XmBs2Iw/R8OyQDJ2dvihAarGz7?=
 =?us-ascii?Q?EwkxeY9q9wU8zsPOREf15CDKwatvHa1/rKO3+3qtpvWXC0GsXy4gOdlmOOSD?=
 =?us-ascii?Q?RpHl31w/U8CY2sZftgE65rf7JDeEjuGIWy1ZeCI36fRGDDjXfkM1CzlQOZM1?=
 =?us-ascii?Q?uibFsQjR2XwBOqnzRUKnrygF3fbD/Dew0G6WcC/F87cp3tXHmxGIBaSsdKd8?=
 =?us-ascii?Q?FXSeqpdbyQg8Et020I3EeNI2h2Xdc4+vvZhvMGZ42FHPnrPeBDe7BXlfg9QU?=
 =?us-ascii?Q?6hk8ULXU7dx/GQxMW1IPGXV1YPnkbbrzrkdkBS+OcQOm/gMdyEJ8u4B24Am+?=
 =?us-ascii?Q?5Q/WWVUaC30QUFn2/FhoTJgNOmsLN6N5GerJtc4ICkMwubO5dAtSIfZ3J8R9?=
 =?us-ascii?Q?csNkV62olxtK/vh8+hLxhXoM+7t308KUgCUabWrSxHdR9qyYCQYy6yPKMwMz?=
 =?us-ascii?Q?4hXbQNj58eAiP3nZodjafnSNXeGsyriJjoFiThId+hJYMGf9i2ypU9hlxbdw?=
 =?us-ascii?Q?YeD+eMG6loIwx/t0HDPkhbtP8y88wANqdZIghExoxVeUJDhZWtewnhmmvEPI?=
 =?us-ascii?Q?61IUXSmGqMsgc4GtQVIWXZV8ai288n8QJwTs3uERbpUZ8XBiYw/RNmczfc3r?=
 =?us-ascii?Q?HOideylqskMA4vcsQc4KOto=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b3ba728c-e6ba-4b86-d08f-08dcb0375923
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:31:34.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p1iNFEVKVxx3wZyJxnK3NgMR7fKiYuLN78cHcNUauUB9YvvHwWndcDjmWvd3qZtjdkvHn++4lE1ed77eF6+YcpPJAnLctmOdDYHxOuFxjVzFmg2XbRNxZmD5NIQmXUKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6078
Message-ID-Hash: QXB2OUDMFNYH3R6WWZQJYBSURSELVIEV
X-Message-ID-Hash: QXB2OUDMFNYH3R6WWZQJYBSURSELVIEV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXB2OUDMFNYH3R6WWZQJYBSURSELVIEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Bespoke trigger support was added when Linux v3.5 by this patch.

	commit 07bf84aaf736781a283b1bd36eaa911453b14574
	("ASoC: dpcm: Add bespoke trigger()")

test-component driver is using it, but this is because it indicates used
function for debug/trace purpose. Except test-component driver, bespoke
trigger has never been used over 10 years in upstream.

We can re-support it if needed in the future, but let's remove it for now,
because it just noise in upstream.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h            |  5 +---
 include/sound/soc-dpcm.h           |  1 -
 sound/soc/generic/test-component.c |  9 ------
 sound/soc/soc-dai.c                | 20 -------------
 sound/soc/soc-pcm.c                | 47 +++---------------------------
 5 files changed, 5 insertions(+), 77 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index bbb72ad4c9518..ab4e109fe71d2 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -240,8 +240,6 @@ int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd);
 int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream);
 int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    int rollback);
-int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
-				    int cmd);
 void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
 			   snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
 
@@ -345,8 +343,7 @@ struct snd_soc_dai_ops {
 	 */
 	int (*trigger)(struct snd_pcm_substream *, int,
 		struct snd_soc_dai *);
-	int (*bespoke_trigger)(struct snd_pcm_substream *, int,
-		struct snd_soc_dai *);
+
 	/*
 	 * For hardware based FIFO caused delay reporting.
 	 * Optional.
diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index ebd24753dd000..773f2db8c31c8 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -58,7 +58,6 @@ enum snd_soc_dpcm_state {
 enum snd_soc_dpcm_trigger {
 	SND_SOC_DPCM_TRIGGER_PRE		= 0,
 	SND_SOC_DPCM_TRIGGER_POST,
-	SND_SOC_DPCM_TRIGGER_BESPOKE,
 };
 
 /*
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e9e5e235a8a65..df2487b700cca 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -181,14 +181,6 @@ static int test_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct
 	return 0;
 }
 
-static int test_dai_bespoke_trigger(struct snd_pcm_substream *substream,
-				    int cmd, struct snd_soc_dai *dai)
-{
-	mile_stone(dai);
-
-	return 0;
-}
-
 static const u64 test_dai_formats =
 	/*
 	 * Select below from Sound Card, not auto
@@ -228,7 +220,6 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.hw_params		= test_dai_hw_params,
 	.hw_free		= test_dai_hw_free,
 	.trigger		= test_dai_trigger,
-	.bespoke_trigger	= test_dai_bespoke_trigger,
 	.auto_selectable_formats	= &test_dai_formats,
 	.num_auto_selectable_formats	= 1,
 };
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e47053419c16..302ca753a1f35 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -685,26 +685,6 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
-				    int cmd)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *dai;
-	int i, ret;
-
-	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->ops &&
-		    dai->driver->ops->bespoke_trigger) {
-			ret = dai->driver->ops->bespoke_trigger(substream,
-								cmd, dai);
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
-	}
-
-	return 0;
-}
-
 void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
 			   snd_pcm_sframes_t *cpu_delay,
 			   snd_pcm_sframes_t *codec_delay)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 4571785736f76..5646525ad7924 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2371,14 +2371,6 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 			break;
 		}
 		break;
-	case SND_SOC_DPCM_TRIGGER_BESPOKE:
-		/* bespoke trigger() - handles both FE and BEs */
-
-		dev_dbg(fe->dev, "ASoC: bespoke trigger FE %s cmd %d\n",
-				fe->dai_link->name, cmd);
-
-		ret = snd_soc_pcm_dai_bespoke_trigger(substream, cmd);
-		break;
 	default:
 		dev_err(fe->dev, "ASoC: invalid trigger cmd %d for %s\n", cmd,
 				fe->dai_link->name);
@@ -2508,26 +2500,12 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 
 static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 {
-	struct snd_pcm_substream *substream =
-		snd_soc_dpcm_get_substream(fe, stream);
-	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 	int err;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s close on FE %s\n",
 			stream ? "capture" : "playback", fe->dai_link->name);
 
-	if (trigger == SND_SOC_DPCM_TRIGGER_BESPOKE) {
-		/* call bespoke trigger - FE takes care of all BE triggers */
-		dev_dbg(fe->dev, "ASoC: bespoke trigger FE %s cmd stop\n",
-				fe->dai_link->name);
-
-		err = snd_soc_pcm_dai_bespoke_trigger(substream, SNDRV_PCM_TRIGGER_STOP);
-	} else {
-		dev_dbg(fe->dev, "ASoC: trigger FE %s cmd stop\n",
-			fe->dai_link->name);
-
-		err = dpcm_be_dai_trigger(fe, stream, SNDRV_PCM_TRIGGER_STOP);
-	}
+	err = dpcm_be_dai_trigger(fe, stream, SNDRV_PCM_TRIGGER_STOP);
 
 	dpcm_be_dai_hw_free(fe, stream);
 
@@ -2541,10 +2519,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 
 static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 {
-	struct snd_pcm_substream *substream =
-		snd_soc_dpcm_get_substream(fe, stream);
 	struct snd_soc_dpcm *dpcm;
-	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 	int ret = 0;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s open on FE %s\n",
@@ -2588,23 +2563,9 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		fe->dpcm[stream].state == SND_SOC_DPCM_STATE_STOP)
 		return 0;
 
-	if (trigger == SND_SOC_DPCM_TRIGGER_BESPOKE) {
-		/* call trigger on the frontend - FE takes care of all BE triggers */
-		dev_dbg(fe->dev, "ASoC: bespoke trigger FE %s cmd start\n",
-				fe->dai_link->name);
-
-		ret = snd_soc_pcm_dai_bespoke_trigger(substream, SNDRV_PCM_TRIGGER_START);
-		if (ret < 0)
-			goto hw_free;
-	} else {
-		dev_dbg(fe->dev, "ASoC: trigger FE %s cmd start\n",
-			fe->dai_link->name);
-
-		ret = dpcm_be_dai_trigger(fe, stream,
-					SNDRV_PCM_TRIGGER_START);
-		if (ret < 0)
-			goto hw_free;
-	}
+	ret = dpcm_be_dai_trigger(fe, stream, SNDRV_PCM_TRIGGER_START);
+	if (ret < 0)
+		goto hw_free;
 
 	return 0;
 
-- 
2.43.0

