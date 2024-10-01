Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F5798B1E3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:44:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2439C828;
	Tue,  1 Oct 2024 03:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2439C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727747071;
	bh=ZiZp2sdXbaeN9IzAesoXl7p43SktonvE5gj7fS3NF/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JcfGgDKHyMzFnyQRGl4dn21IKrzzE5W+K05RKqDNpSzOJUdF9DXilH2Z1Gsz3bymx
	 sNw2yzltijcgIehXTXlPUm2nVBXH+YQ+5R3ySry8XsNNZo4zavbrSyaXcrQoU77MrE
	 zJeEF4GHQkSUFRHJGX/4VyQgWzpl8D36ZpaLvevw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC2DAF806E8; Tue,  1 Oct 2024 03:42:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A19F80579;
	Tue,  1 Oct 2024 03:42:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7A98F806BF; Tue,  1 Oct 2024 03:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 407F9F806B4
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 407F9F806B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KtZ6IRuW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6Cme51WwkGo39u8veddao54st5JqxNwJOCGJatbmiNipQInpAYyyOevgIKqKlukcwF/rQLVaVBpn+zQsBw3+Evqw2J+bggM4RRyyqvOfatXF4xQkjOmb58+5zK7ElStYZtYhY6fukmiRoEjG0ButgJ3PhusuZ+GUB59yNgVcXsVNbWW2LHBhDWae2+McNghFnbQ3m/gEqIJltPesBUkqeZ9bcSUwSOoQGtapsss5r3MUG8Timadn4uKWxO/6vtj7iW1zRfwS3YG1eAly9ap9AFK3ADAhVPWU/ZbyP++tf5FJI2Dlxm9krEuFRmmUH4u4f1XCTHoxrfOxF4eXaprJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKGoKSaWEjmXNTRJmyK4pwp4FfhWkYsiEQlNZAcmGoI=;
 b=R0Tb35yuny7pRBkwx7ZfQnKkbtCKDoBmoH0rns3wSFpwwYpGcLyTSmzUa7BHwNR81SgkG+5ZdsuVU4m+0y+tpV0oYYpZf7YWC1j0EQ5FF3UkNMEZq5cr0MO83Nl3hJqBUyFANIHal7hLmzmnVtL3U04QXB0uLiXHNifpg56Au3PUagx9dZMooK/Doe8YlraZw305sYVqH0dNdlBA16EzNPj2o04fRmtgnHvAvuuQ8qslxDuibqOHytzBIYygYcmZgZjD3ySiGfhYAOkVAf7ZMsED+XoFtkl98yyQPdKXWHBIVcqqyPha9Cpe3ZD3B5dxOUZGhNOKfjzx0/tGi6n+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKGoKSaWEjmXNTRJmyK4pwp4FfhWkYsiEQlNZAcmGoI=;
 b=KtZ6IRuW5ldj+vejEgS1zkxtwJSS5gA/neWEah622+HLxynyS5pcZfIesF5Py5nqwCoZ7uxWd5HTr9zTX3+oiGKgTdiwbvFBcKTjOryPV96HY1COeHSypj2UvvaVZK7L0PeF9p1KJErkNdj2A5K52diHg77/pyRSar/QjpNV/Dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6629.jpnprd01.prod.outlook.com
 (2603:1096:604:fd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:42:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:42:04 +0000
Message-ID: <87ldz8vbtg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/13] ASoC: soc-topology: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:42:04 +0000
X-ClientProxiedBy: TY2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:404:e2::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: 44135e29-fbfe-459b-0b9a-08dce1ba406d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?66TK9r0NocJsff3Dvi2l73kjypdzJjnwg53TWm5OpE84v3gxB7hW83hHRURR?=
 =?us-ascii?Q?AY2gdKtqjxPAvdf3MpWbem2bKnDqFBxhHH/hsKM4wTJt9xTW4dUJ7To6X1N6?=
 =?us-ascii?Q?j5vu3KVs8LFzN73mq9NntKu5+TjaDjTJYmkKIiJBDQIwI7NYJZ8rinSI5Yu0?=
 =?us-ascii?Q?DkSHoHBNO438sjTvyk+EZWAsT/2Dghj4l78QDatpvTi7f1DLxkvTbNw6OBAK?=
 =?us-ascii?Q?xkyVfK8UDudVbnJmSVyGFSxO2Irg8knYMGDBaBQmJTFAkvTizMrZpaJGrZtS?=
 =?us-ascii?Q?05ahBT2+IxskxXe7cSj0ilQqmXyW4H/MhyJxa7XIx/tK4pXG+H0SPCpqVYph?=
 =?us-ascii?Q?/ca0St/H9OxZ1eCZ5kW9bXX7CDMT28JKz7pTNzI5Z3a9QbLMaJq/Vw/A5y+R?=
 =?us-ascii?Q?6Fnz0FB+wPZgWG8XgCrjHccQbnVHyJ8UGaknqHstiMgaj8GyCb8SWc/+BvgD?=
 =?us-ascii?Q?R1m/KMx9j8ZkpC885VUOQvi0LAUX6+SvrkVckDFJG505axrLPtcoMmRtkG0e?=
 =?us-ascii?Q?McJzJnfaVFo+/j0W5MGGIsUF3xx8QTOycQCqIU6Pnabr9fpDfUyslkIys963?=
 =?us-ascii?Q?iSvg108yzuPB4bTBr1kphRvXSWvG6HSdgPdwSf/lcF0Da/VeclnBl1vjJW37?=
 =?us-ascii?Q?AGBohosZ9AGKq8sWoKgzQoXpiCzNFb4uTNzG3fH2o0oUPF7A16lwzmLeb4sr?=
 =?us-ascii?Q?KrwYXvjFLUjvKIezJYGhK3zzZP4e9lIvC7HuAKQRrfXC2hM6ly8suE7ue7d0?=
 =?us-ascii?Q?HU3hzJfcrdhGGihlI7xvJ2d7MjGgHGRW5gMARYnnGrhEnHO/tZkv+d2SF3Ub?=
 =?us-ascii?Q?MgA+iHiPd9mo487lPornZ3sdyuaSrooGjEA7PhQo6FGAl7nJQ1pc48VN6tMu?=
 =?us-ascii?Q?Eau3BBTC4YULipwYZG2QvJHo9hxpaFDzEKviXwSrXK03DUiBXzZxljn8RtDI?=
 =?us-ascii?Q?apLHMlDD6KjrHH9xQziRfDFOdIdz53aHc6vRYldT/PdQZBQghAaBg6BdEB7S?=
 =?us-ascii?Q?ef8Ds0nJtsvncEAt2dGu30migpMvOntNGtVTl9bwNYPnR8Yg44N2kRQBwAWv?=
 =?us-ascii?Q?Jl8V/c4NLyFgXUV0Bz/ilPHhC3fpxY808VFka2Ir3WISfpfd00F+UeS4wbBX?=
 =?us-ascii?Q?8K8pTAaQG2MUMd4op8c6vR4pkYt6QnSAtVleF3feAcTAxgNu3QUo/QSnU0IU?=
 =?us-ascii?Q?ULEPENgKRCCDtE3MtTOqcK7U8BR86UzzP5KmOLKdLu8hTVSpEKCoWr6L7Vw8?=
 =?us-ascii?Q?rEuLMKa87diZnxndql9+3uF5gWstiNSx0uMCGMp97/9TTyjNmQ4+FV3BtMNz?=
 =?us-ascii?Q?kWURRi3lmlWSou9eIlDB0T2cQMaqdpPwEp1PwQbK6oFlpQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OHQlnKuhKVGMC383g0krm7WIcek1DpSte3vW2Sz3G01nUmZ1N0Hh+OrEaMfE?=
 =?us-ascii?Q?GI3ro+5GdsnzDZvkXpJJp5RDFfRnsXKcALcDDkTjDzN+mhuCZau+Ipvic7A4?=
 =?us-ascii?Q?YbIE6kPx3/eCS7yfrEybBtonH48HWL9eRjctMaSszDvSx0g9+MtnYmvAS7pw?=
 =?us-ascii?Q?kntbivNqQARoqYyyw5ixONM2UbwnIhVLK/YRS/k+wSk/Bdgee/+MXVV7IbIK?=
 =?us-ascii?Q?4SDHo7OqP32IH/BXi3Qw0l2lkZFj4zuNBFCuH1DRmhU8cb3KBdYJxxU8dqsM?=
 =?us-ascii?Q?unFJjys9gBBM2jpy+vBsxv2/M9Xn7Q9pNLtvOB45JG4odljZveXsMKKKzh7U?=
 =?us-ascii?Q?C6wgjJssEUtMVVwHjirqk9uLTV9pg3npFbO1YiW9gsCEUdIdID9nqPqHI169?=
 =?us-ascii?Q?db/2iCSboivCwUzG7xmZzR5dDa06lcYzjU5iCITAJdPtWM5Qtz90C6BHtX6E?=
 =?us-ascii?Q?D/7SOD5Y/2KespHQL4m7Wg/Uu1a7BHEqBge8dlNAbh8PXLfbtGA4gWx8aATZ?=
 =?us-ascii?Q?22ky4p7UGqK2Vv4S14auF1Yv6oSobzj1cx5tjhVhnjWZnKhWQhCj4dK1kDr9?=
 =?us-ascii?Q?e2+qImmQUqZLLAQJentco6XZpF9us/UCfnY/P72TVYtBVLXeMCfMDSCWoLBU?=
 =?us-ascii?Q?MlwEs/opqgLA57jiGFAf0GmViEQWkGHewCNC525/f+iz/rbRgLXx2AMn6LZG?=
 =?us-ascii?Q?P9GUDvnjJaUKQnEEkcKEa2lvdIrX1fcvVzjJn5aDjsBpwqQEuugDHPoZwfrU?=
 =?us-ascii?Q?u27JI4P/+kJY7HAY7/pJsuPDZ6K0rMRbHJoCqfYhTibkaYDOJlaKwha0QRBt?=
 =?us-ascii?Q?yuCFWMV9DT62UdBCEfdPf4oG4/mdXbG9J3tWDnsyKdkQOP/T7V4U7SImHtp3?=
 =?us-ascii?Q?x12FkkBvLjf3LUmqSd8livyVn7VqvjDztHJnXAKBEmBajfWjGI0PdenzpRBZ?=
 =?us-ascii?Q?u6bIDIOk07/aB2VMb3ylbfBDnj9NbTTSmxNl6DUzWhk5WTe0AReb1AGCi9MR?=
 =?us-ascii?Q?A7HoBMeW1nf2tbqWCsyf5moIKBkbXScoejdWu3rXSaV3SzGzszwg2NYLikpZ?=
 =?us-ascii?Q?c1z9DHkfqppHzADm3q8SpJcg6HpjqRPeZSJsO4wRlAIvB8PrRVl4RVecdtKi?=
 =?us-ascii?Q?9jQjlOnf7kXYy8Uj1Ahd5fLIpwlfApORkZI6roUHeP6UYu7gveScncOZx+tx?=
 =?us-ascii?Q?1syNmSKonWWkpXwRC1VY1/C80d+ZKixMA83Svqi1WlJCwK42Zm4oaYBvY/89?=
 =?us-ascii?Q?1UGk9W50lmWsxewejlkwmdRfzawJRANkziBLn5qmOvCb3+MnFfafULwhPfki?=
 =?us-ascii?Q?TwY9dEow6LgVlCysgxJhokhmFYGRW0fvT7VMDe5AtlfhmAKhzKEG2qufDRLH?=
 =?us-ascii?Q?CWGnD8h4YGp5wkK6fz95C2ZNnaWG3glvf0fw5L6PM6z8hQCK53hMGIWYxrkO?=
 =?us-ascii?Q?aXsM8hE8U9byT8AFTD79x7gQ0d77ZvP9LNHoK5bi5+tTZYD272LKiELaVwzD?=
 =?us-ascii?Q?76o5Vqcn1WStm9gHZr2g7JLW/QTLspmnrgSR7Xy2by+6k+zx9tBQWgYrCd6B?=
 =?us-ascii?Q?65Q7Ld8kllU3bCgLH1HLjZ17XztWY4mbsrAt6TZ+KXpY19tzInOSHGKLx/Sd?=
 =?us-ascii?Q?Of48FUFq4CUMulWDe4Crx9A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44135e29-fbfe-459b-0b9a-08dce1ba406d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:42:04.1492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MaMJ4LfU9nQiMTGs3hZzZFUxbL3ESgBURXeM29q6CK800PjzIbhyMxM+WMAsywdgdpL7LcH9DLYUPXeZCYWkWvfyqgFWf5AhU8fDH/0IQIpazal/MBNZ32l1uY09UQ11
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6629
Message-ID-Hash: KLU6G6WGHMLGVBJ3G33NGSFJ7ZK6DKB2
X-Message-ID-Hash: KLU6G6WGHMLGVBJ3G33NGSFJ7ZK6DKB2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLU6G6WGHMLGVBJ3G33NGSFJ7ZK6DKB2/>
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
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index a2b08568f4e8..c8f2ec29e970 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index af3158cdc8d5..93d0ee68059a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1544,8 +1544,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only =  le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = !le32_to_cpu(pcm->playback) &&  le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.43.0

