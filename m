Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7EC9C53F1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 11:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8403D14E9;
	Tue, 12 Nov 2024 11:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8403D14E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731407732;
	bh=qYZzVI0LlfJuMXguWOVx7jlkeVIN296ai7BfGvhMs2o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NpwrKQX6kEtk5+tOUCG8zc02VvXPU9rCBYO26tsEX9CVAXOulIaOXln4aglsusnPt
	 pZRePuHyHrX4R8NnWw36my22uLaybuRtLMoDn157sw093t2mcIvJYWlcv0ZTyeBcCi
	 m8byDLZjqaSyAIPuI/ZSajIvgu+CRoAdCg2rKPkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B03E7F805D7; Tue, 12 Nov 2024 11:34:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A336AF805E0;
	Tue, 12 Nov 2024 11:34:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60012F8058C; Tue, 12 Nov 2024 11:34:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6D91F800D2
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 11:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D91F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=GYoDKxjc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYV3mG2VLV9HwA6TBwMiEZ3zmGuhKKP0ggEhPrmlRZcvsibqrR3Veyz/K+RydZ9O3wtwbbrXLVRELINShX8e1o+pNafY7MTx5R7VPOZ8EkmO5Lqe+0pW9+jgz2ZWxqKeNDBvr2g3LE6EtjIn1t97SMTq3Frakv6ZT92mPmUax2XI7tONLcdA1CKYHzrhiWqMA/cWlgFaZi001fqFuFzKshK0q6KBz0qRdreTdQtAV4MOQfL+Hr7ZEGsmzWZznIIbr7BKIQBJlgReY3VaPKsqaQ6uwi0001MdTG7vR5jJihjQCwIUKW8cWJpIhUABAbg2e9LZqCd9eqKLdyAVuTdzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjqYSBEF+harWuyMeHZEqZwNJnm1Hy5T0NuzIdWBwpY=;
 b=HGhNcD2pEv3Npvaw52caKJ3pO8fKRAGmvSw/2HO3CVeXxuzunEaKCw/EKgY2n1MhBG92yEu+BrOoD5lmwpuc1M4kGYg6wz+SAMnJvH8u8wjEJrzF6taHGvOxCyCH+G8bm/zda7qIxcATQ0FDqxUoKGsBQMQwl7izzr8Q6nd3TxJ7NcRM+A+f9iB5RC/1FJEs7oftgtJvX43l1YcV5UEoQCAwxnh1XcsBLFsWEieQzr1pqxZPVvnskT1bCeifHSzSCBhypnVW5mNie9cMmsp3cpqkgI/nKQqRvONdGy7erF54iZi+6EnT38Qddu479xNnMkk15mBEy0RmrQgT+pt+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjqYSBEF+harWuyMeHZEqZwNJnm1Hy5T0NuzIdWBwpY=;
 b=GYoDKxjcEqnwWPdFLOYv3vO9inHVQ/uNtTCy4xz1szTbRo9P3dtJqDobcWHKeRZY1+IYUXO/qwFE5bdJ7zkTi4UTjc34/bFm6fCfvRNgbn34oHALRh4kScGwzy9OsakaBv5gaYMhWwLlMxwehNGm26dCsivxza00IGk1+Tkch7/xCFN9d5RnY1D+swYL4x5LnCXNHmmIX5iSTqQCFhAeMsnnTEPTzF4bfA74F1NAWn+2RhzXxi4o0R93+IrHiLO8uL+dzf24SKXNsJPR4rvsITfbuWqGgLJn93pAgPqq61/eyBO7UOvKzVyZ9FPfSkkUCK56P+Q6fmWwm/HkHfRWKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB10757.eurprd04.prod.outlook.com (2603:10a6:800:26a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:34:34 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:34:34 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v5 1/6] ALSA: compress: Add output rate and output
 format support
Date: Tue, 12 Nov 2024 18:33:59 +0800
Message-Id: <20241112103404.3565675-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241112103404.3565675-1-shengjiu.wang@nxp.com>
References: <20241112103404.3565675-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB10757:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c18824-73df-450e-5ed2-08dd03059938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a2Fdhskm0F5iJ3I+o0BY9PbAA5vNa4x0BCJXvDk/BjBZcGZUqBqBysaUdsQo?=
 =?us-ascii?Q?Y/mta+0F2gqZN/UdAQfUiZ7eBLHwV9qP25hseeTs/gD6Ae/4t70O+6oI/t7B?=
 =?us-ascii?Q?687K8xViVvKMtlw39Tmjfva9uxpVvYK4/XndAKQVpzlZE4eexQHCLnF+MVja?=
 =?us-ascii?Q?hWgpJWL5KDNsRYg6c8ejA3J5uM4VBsQWlQl8tw+Il9lm4oE85UduP589QXj3?=
 =?us-ascii?Q?0hK9irXGe9E+DTyORyOclH/n2PQpQ1p8zz38YKiXe2ilL9fzQz1UdZtDDq2y?=
 =?us-ascii?Q?wHTHwC5rNS78Z8Q0ZfawPvbCdwnLeD9cmscvyfq73Wsl5k9A4ipZQ9rB1bxl?=
 =?us-ascii?Q?M9hSCKDzbBwfWeUR/zVMhB18tWic4YTTAVPe0/XaUP6+/wC4YyhRZT6aMb8I?=
 =?us-ascii?Q?CbwP4iDMABf2itHIRGe9xE2KJPqH1y+rK07s7qLLpWnlWQhQmDuDIbvqWp/l?=
 =?us-ascii?Q?SdLaZCt5JbgxLb61EDAOf5IT7gGbOk7T1uDzW+UZUYvbFDEZtXxoirK+xkw7?=
 =?us-ascii?Q?1aOGjwF6+C4QlQF8AjzzKJhnsN3HKbHMQtggoCBLo8d4FWWstiFvhZJo9IN8?=
 =?us-ascii?Q?Vwdf0WAq/2865kM9liFwmso+C/Gb9nw3/VWy9fAGs+Kp2I/K/bbH2ggiISyX?=
 =?us-ascii?Q?kC71lobwPZTRB1QcupfBRyDnklrdQbB1FgT1fwvL+AEdGepCPMdVHAntQw7E?=
 =?us-ascii?Q?J6X0dND3VbC1tSZvVIMAj916WO7KELcvPjGF08QxeeQwUf53x+p/I6Fgd/MM?=
 =?us-ascii?Q?e4xizN4naFehSwbcVC/xDNOIVURSvQ+xvvqUtEcM89MRn+FaxsLWL17i2dVx?=
 =?us-ascii?Q?owXZel/Hb66pmj2JWWw9f3iJSFfDwyTNvR7i7HA4j0BqLJVqlpSsOqMReC/B?=
 =?us-ascii?Q?xc84f8t6Xxw8k+3QYutUSEr/VPOiV2VxUnikkPWLk+wguVN1NF2guHAZxr0L?=
 =?us-ascii?Q?f2ba1jZtUgMU00V534n7avazQkejpU1WhELcZg9s5t1eYBD4Spp0BbXrbsMf?=
 =?us-ascii?Q?qjc0RY7ROUGISmwwXz7I6vkQSvjDuBLNd6WEjf9RZATA+E9u/aLMgUdTSeZp?=
 =?us-ascii?Q?bCUFzs/uTjyWHq85ShcNj3u6DZZK0SaZaWkOfQibyz+suM5jFNXhIVhe2ZaM?=
 =?us-ascii?Q?w18207H4uXHJALoSF5tqBB1FsYc6o8aC8LGQRThTl9Doih+8fVWxC30RtzSS?=
 =?us-ascii?Q?w1lZK9S7aiX06OzJE9dEmUbNZuv0Yb6tayAkuqBAbZSb4RMW3Atpfj8aQO1L?=
 =?us-ascii?Q?a6S9IWabnAWFSgyUZgQ3yU1K7Lll90ComJ5kD+1ZkbFunLaK7vWegYyp98r5?=
 =?us-ascii?Q?cGzZaP0ZVEB/GPNkIX2vz210tE+Rg7JJsmR+z2g0MhK3wKHs2p3ifXDlyth3?=
 =?us-ascii?Q?MOoBZdRZ1d+1e5iXo2nClR1ilag+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sZCO1fSPm+6ysDW+51Xg5l+PvclR95FzkA3lZPsTra1vIBqSMOzuuYXESUjQ?=
 =?us-ascii?Q?Knw3nlq56TzyC2WQJao3NB9bVJPjWTrFWvalA3KYrJBNFi4kb91xoHslyv4B?=
 =?us-ascii?Q?Qwc8XPcONkm4lDoS8qCn2wpG+BCRW1PTXOSFs3eYcXz19SfQEaKSYxYEwGxz?=
 =?us-ascii?Q?y2HLkn60ZitAVcLodcMLdLMB278aHGGdKDfsxEAHeI501dQSZVBdNsGXDctt?=
 =?us-ascii?Q?rtEnxWuPdaXlvN2/QIZJcu4j1mG82+flU2Qhs/eh/ApDwXPh654nI//Eb/tc?=
 =?us-ascii?Q?kKws2DiK0whd4D6bRU7KYrAN76uj73LCiYVkiUxlpRMmaB2H7yl5lP0ZzDvI?=
 =?us-ascii?Q?FpzmedWOKB0NoGGLksNv548a5zD365gl3iCZY2YSlia0Mt3CKcNFu9cduOMO?=
 =?us-ascii?Q?K6rte49kxwW4w8mNWv3UOR1sXuwV5xXp+QCDlAliUIWdMiiC5xFGlEyUu9ZP?=
 =?us-ascii?Q?QiymhT7uerUbq51iBFUi37daFX9SHonPnNQiAjFl4uKZIm/iM4qjTCGQisSX?=
 =?us-ascii?Q?iijKefKmEe5rv2w4DVmObVplibF39IzMMI8AvQjnSxbPSJS0TuQH+BmZGUmN?=
 =?us-ascii?Q?S75Uh1myzabnrPV9bgQDOI/jWpyzt/NeKUGm9n7Ju8uTQkA3TNOrpCUnsCIo?=
 =?us-ascii?Q?4SVET6ejyX+5sm/wKAgyDUoJCsjXOiKLB1FAs0g4ketS7D51WCW6vgxPfunE?=
 =?us-ascii?Q?QB1d3b5G9QI0tX4oF/QSPLiltBB7FLMbY4UnBHKjLyzYosUpoP+hEiv4vMLy?=
 =?us-ascii?Q?C6cR0EmhVgS1Wrqgv4OKRxf/bsl+cyTs4SlkwJpGfui5LdR7sCbtAJEMrAU1?=
 =?us-ascii?Q?8Uta2Ox89qnzhHeDielB44ciwbixh59eZOcgLRH5/MaGCgfF7g6m9cjkGgMY?=
 =?us-ascii?Q?FeRGv3cS9q/m8GUfpoqb+hUNmpqMEWnCj9mRSjJ3o56Vv1dhQ2eudaA2oTMD?=
 =?us-ascii?Q?7NHUnhrzQmQUeZ5kL89TTrxnYR9YyVzS6f4gIYixQhAh1PwiN5q7mU4XewVn?=
 =?us-ascii?Q?pSYeAMI9wtWBVp/eKkOYi/MHjp9Q9DQJQ7wZIOALz/S2yxFRcQqBtpNuDcCs?=
 =?us-ascii?Q?MUTvJTi1vkunodpvUwm6h0jiEIRJI7aPqeQTVvn/fdfELCtjmYuz6pUWAXXq?=
 =?us-ascii?Q?Oknsc9Vc8QOF4aP2lX2nHzkvBR8j/jMbv8db6prI9CoZYopawZiJpXOmKJQj?=
 =?us-ascii?Q?xrOeNgnJm2psJIfiwICTNK2rIf5s32Noikeo7Ix6cTv89+6+rogEZywGc5v/?=
 =?us-ascii?Q?tkzSop9SgZqJR3MfezTcfYiW+KWpEvGMe6jTVcVoKLkuxVwu1VSXb1lKByxV?=
 =?us-ascii?Q?uGc1/e6RSI+fxc5Pe24Pt98ABuKLXI7z8s4kTTneZcoF+2nymojFvhgt/9tW?=
 =?us-ascii?Q?heMG+2JA8HNsy1m++6aFHYr4V+69R49O0fx7blvBOfChOcKODVDjDMFGbsRJ?=
 =?us-ascii?Q?kCbdmUO1xv8MI1VMPKufmhPLoTMERQejd3k0nwavh5/hjljE4+RhfdZEfWou?=
 =?us-ascii?Q?nm+5CDEeAgkwk9wy4RJS6QEBdOx3LJZRVDoPmQZ7lWjT0NETX4kh7bBL294P?=
 =?us-ascii?Q?gQCrON9ZZJFtWzcSgRDqsQgbTHISxHkq/g7sUsim?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81c18824-73df-450e-5ed2-08dd03059938
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:34:34.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 J45rSL1gCiEW3h6QPe1WlZxv4clY9XjTcTQxn0H7BNt8HShd3yHdyQV0HMTlsDX8u9hwX09XGPTfD5lsMdiUkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10757
Message-ID-Hash: PPESNCLYUTONANAN4SI4R4XYV6R5UTND
X-Message-ID-Hash: PPESNCLYUTONANAN4SI4R4XYV6R5UTND
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPESNCLYUTONANAN4SI4R4XYV6R5UTND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
struct snd_codec_desc, these are used for accelerator usage.

Current accelerator example is sample rate converter (SRC).
Define struct snd_codec_desc_src for descript minmum and maxmum
sample rates. And add 'src_d' in union snd_codec_options
structure. These are mainly used for capbility query.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 include/uapi/sound/compress_params.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..bc7648a30746 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -334,6 +334,14 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct {
+		__u32 out_sample_rate;
+	} src_d;
+} __attribute__((packed, aligned(4)));
+
+struct snd_codec_desc_src {
+	__u32 out_sample_rate_min;
+	__u32 out_sample_rate_max;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
@@ -347,6 +355,9 @@ union snd_codec_options {
  * @modes: Supported modes. See SND_AUDIOMODE defines
  * @formats: Supported formats. See SND_AUDIOSTREAMFORMAT defines
  * @min_buffer: Minimum buffer size handled by codec implementation
+ * @pcm_formats: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
+ * @u_space: union space (for codec dependent data)
  * @reserved: reserved for future use
  *
  * This structure provides a scalar value for profiles, modes and stream
@@ -370,7 +381,12 @@ struct snd_codec_desc {
 	__u32 modes;
 	__u32 formats;
 	__u32 min_buffer;
-	__u32 reserved[15];
+	__u32 pcm_formats;
+	union {
+		__u32 u_space[6];
+		struct snd_codec_desc_src src;
+	} __attribute__((packed, aligned(4)));
+	__u32 reserved[8];
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec
@@ -395,6 +411,8 @@ struct snd_codec_desc {
  * @align: Block alignment in bytes of an audio sample.
  *		Only required for PCM or IEC formats.
  * @options: encoder-specific settings
+ * @pcm_format: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
  * @reserved: reserved for future use
  */
 
@@ -411,7 +429,8 @@ struct snd_codec {
 	__u32 format;
 	__u32 align;
 	union snd_codec_options options;
-	__u32 reserved[3];
+	__u32 pcm_format;
+	__u32 reserved[2];
 } __attribute__((packed, aligned(4)));
 
 #endif
-- 
2.34.1

