Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AA98991E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9381908;
	Mon, 30 Sep 2024 04:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9381908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662481;
	bh=KwbRFUYELC4Pf9m8x216R55WQ/yk0VdTLaKEmkeV+QE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nj5n9Q1Aqj5yOJcuaUqjJsLtZ0I67mwBletb1FZa2aMcpOMGQp0j3cnHccOMJitsy
	 HM57v3SIebEUwSaATRK7Tx/To+K76GGqZ6+1cO+UNxEDQhWD0NJA1D43Gh7EKrrUOn
	 cRJ9zVZWjXTkBXtFeotTK7l2V/wTAdMJod6JV36E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E7EF805DA; Mon, 30 Sep 2024 04:14:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E55FAF805D5;
	Mon, 30 Sep 2024 04:14:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 865FEF805C1; Mon, 30 Sep 2024 04:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74841F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74841F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K59cUqtG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz3NWv1H3MbfjHsM5eIPyc9StUrdw+PILGXsAZRPKQv59rn9/i50gh7nJsBVvh21QHk1PEtZ5fyK/OKOrZfYr8zqEnxOSn2k8MSaJdgkDU0B22M9p50qFSLAlNV9U/munjSN65QhujRjDX6+GVM8wPviXbI1ME5YE4HKxEbw+d9kj08kEjqh2ALOfb9TLZAGTSHUyelt0ET/lMBWXHPlilZHVjE4+WveAMoK3xsaEJotfTKo13I3KahtIu0iA+8XDmQ8E7VTVOFFiKmoaTO66xkTEJHpJvF9xBiygGcyK5qm14hYRv1UAhUjoVY/rx8f6BoSEkEfI0fB5IdL/bEBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CXx41MjWsgOAv+6Mo9TpisGQAqREkYWXI6nCgFBTBQ=;
 b=Sz+npi+P8HUNrVOZB99og9pff5OyaE28hkKAyzF9W7dM+uJoeFVD7g09zuMKQqwillboJdLkjmH7hpLVyMWYgaNzOy+wSl3FrYhoapQbXgVI30dRCPIOArFD/xRZNjSv/xmVPD9WMkysxasZRmJqlVLBJmtoDj6I5e8jsW98fduVfeYJCwU/nSo63xID+5e04pNrEoe7ysWnsBGAHaQWBhI08yHhKLbisi/K6yi48ASF83UDZ1z0AoF88RPdNlzBi6lAx5pM3ZZQAa+N/IF6h36P8RS7B4DnHy+VP2PFiTXZ24XRy2fZcG7JSQOfNFpN5tadDv2m36kZvBt1VtjC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CXx41MjWsgOAv+6Mo9TpisGQAqREkYWXI6nCgFBTBQ=;
 b=K59cUqtGPZquwKb4mx5zRixWSAOSs5nTTR/sJQRH49nps+/O6UDOAv/eSwBreHc4+bkpomY8EVEyV1HPPT+3vQ2zGU2HCs08hu3qXpz2JKxfOC9F7/saGVmVhWoL8kFoMXtGUy7taZ5U1QxT8k6YOETY0gWtW2QQelWIR7ZowLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8143.jpnprd01.prod.outlook.com
 (2603:1096:400:104::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:13:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:13:49 +0000
Message-ID: <87plollwgz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/13] ASoC: amd: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:13:49 +0000
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d09325-e53f-4291-ca10-08dce0f58583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cGgDyShBSURRGmeCvxN8cWIPghWP4Hi2PHU8ly8wDJ6YDsV/YPHoHX26EUmk?=
 =?us-ascii?Q?TdFHt8jZfa/ljdO/FPh/X+SGKb0Ta2b4XaEYj58h9GxPboxF41yfzQNcmRfg?=
 =?us-ascii?Q?oeg497zja5D7WJV81bb689jR7oFWkKDMktd48wEOzIKKG1+mlo19QNZgcDrh?=
 =?us-ascii?Q?K2zzK1J6T2Zk9n0Cea35whqD7sk/FZ7JSPWmElPbHOmlghgp/xcY5KIRiFHA?=
 =?us-ascii?Q?IRKZNOggXvh45CjZrEIfBrye8fpS+wtozz0dY32b6hTf4dJSisn9k02CVK+A?=
 =?us-ascii?Q?7cw8EfMxLC1uMXKP20EhKGtlC4IpIx66wHmhemhTE9vVdneGJAEmx46970B9?=
 =?us-ascii?Q?wIR5afXbWGuxM6wo7iZdhFPCdry9DIMXbBBRiMedMcyjPWLoli4aWHGXQTmv?=
 =?us-ascii?Q?DNWZvjSxpbb+D+057EB4au9AoMLU2naRNvzDHO8hI+XO3fpahKaNvPF4DApd?=
 =?us-ascii?Q?ms53K6Rc52TO8TBvamvBOwpNiDGMY2QzjKj/3GA6O6oDdcpstz1GLLXUTbKb?=
 =?us-ascii?Q?OYFQ59HRDpwPlk9YLsJE4rV94o9HfC0ovkOG2J/1hMqyJAElnzKJjXbutyTc?=
 =?us-ascii?Q?LaC23Ul7mWshNdIr2ziOmduwIO6wvWIBFksxJlDy4UlSRCZ0W9Gz1O33n2r3?=
 =?us-ascii?Q?QSghGkwkF42Epbw8MT4GGE2ccvZT2gBBe0oHzJeeSXJ+EJgb4olc4KTNah1G?=
 =?us-ascii?Q?AYjZLAEWVSfja74IkFD7RuF2vnQz/GvU1EU7oA2nG1ZsFeimvvU1x7DOEoZF?=
 =?us-ascii?Q?wrVXqyeN+Q/hOoAGqsfqi7PxJU4wyqo+bxIsWS1aQ3tXzpaWZ03QtmbUQR+X?=
 =?us-ascii?Q?oVO64nggBmEl5Brxt9+W4sZNP+VSSRinwO78DrzvC6bm+E4RRWpi5Y4oLmAJ?=
 =?us-ascii?Q?7g6tXo+NCLUqhcNEPC/FN6IiX+TCVNw0Q4KkEX/e7r0uMJzUVa3vg+KrIgLy?=
 =?us-ascii?Q?wKnmYgk+uw4jCOWd8P8UQHhCYV81z/rA6xvLTj4Bl8rctPfZWg7Ll7fqqd1Z?=
 =?us-ascii?Q?gK51T+cvMfy0LbUFkY6qAjJGWBCsapLxi+feO5Dp8XbPjiBuwdSuiGCIhA0r?=
 =?us-ascii?Q?oCTYWeuT+glU82ZY5xaOAZKv4yqzU8F+hQ1YLwq3tybIG/0qPrZmy6bv9r+e?=
 =?us-ascii?Q?a4Rn9PGYYtkfcrt42P3AD7dx95K75up7wjuE0TH1ua8BdALOHPpIVerwaEoO?=
 =?us-ascii?Q?RSk0+N4XrsMXA19Z7n7OrefLZsALT9sFNCxbk8KPvQhf1MK1pWIsmHVE7JcN?=
 =?us-ascii?Q?yHPi39d3G0x3cj6yxwk1Oc2ZVpi/aji1ztnpl7ioIOS27i0r8mbdICj0eEGc?=
 =?us-ascii?Q?xqKSAfXrFsFal1LlWC2bDV+5etlL/tL9BIiKr1Ko/EfFWeIYZab4OjOZK0gw?=
 =?us-ascii?Q?Glz+UrEhUwj+51BMdexb0iQXEJmhveCooL+fACGQisq6iPaJKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SioF8BIJR4wHw5sWjEuQ9rzp6X9h1ox0d8J+mWSXQp+Y4/VRyCYCf+yD4K7n?=
 =?us-ascii?Q?7z+hLgOzz+Fnyuidh/UjD79rxGyMeWoiWjym/KgFQ5y/quX7XUmOYLHB/jHN?=
 =?us-ascii?Q?fPbMvzHF9dnyZp7xoOaKxGhkEYvduV1Wt0mM6dvQaMfrXBRce/8MVeOpfgjM?=
 =?us-ascii?Q?OvKUT5nq/posLtfxRhZ88jTJA1FSbfCmorcmWiDY0I9cXBLwfOIBUgh2zMYy?=
 =?us-ascii?Q?0PbLCiQaxWkowCPVw+4VsDmWvxi208aP8TPse/Tu2u1kVg3Bt9Cvey83w9bs?=
 =?us-ascii?Q?F6Y8f2aCwXurEKCg1JslbPQ/x8DOFQbuP941HmGIh1XkgdzITtEXOk+TO5bv?=
 =?us-ascii?Q?GxKo64i++fshcKxefze1v1QyAd5JklcAqsOTsywvHHbmRa6SBav0hrQBMmMl?=
 =?us-ascii?Q?TNvlFEvJ9FucM6eDZSD1pPHam2O1vM0aSEuPOCdzYL21whNm7edK//5Pr5L9?=
 =?us-ascii?Q?uwqvyrDV8BK1Iv+B8oXkYMyDUnRBfSYVhIB/4R02OJUqmkHAZ99YPYyn/g4j?=
 =?us-ascii?Q?1qsE7SPEW9LYasCOq4SlfzYDgOWnlipT885ysQ4ZSBcnlGC//roNycwH73BB?=
 =?us-ascii?Q?yd41iR1ZkEH4oUnS3UaNMPJPTmEZrXI5OOvGqpfchgh/4lrVBZkyH8/7gfMF?=
 =?us-ascii?Q?rYB3cI4j+r1ZBflNOmqbfIq2KRZ2ln/UUfSx4G0Pyw1zP0lg4UAVSAM8wmQ2?=
 =?us-ascii?Q?ze2TurjIkIMp9r2zrhMxbFto1P2M3oFmxQ8ub3uj5KlFxlbnw+5CusH6z9lD?=
 =?us-ascii?Q?C0b9DvLbl9GJg5MeVwdKOWBXUwGERmPfOY8Vldj42RZnlzr8eWxlG63uxqCF?=
 =?us-ascii?Q?xw/xluBrtxRuGzFFeyAak7za1oJ5as98TfzAQPGCEKgKNOZzXAo3likg1Icu?=
 =?us-ascii?Q?SGgywY35ikv6wWQMD36g8/SxIf+JbawzSELpI41X0pC5LsqQZM5iS08tPV5b?=
 =?us-ascii?Q?AljaKI6GptmchkpriSxVIBAWroRzH3F3L6rdBYoWiRqzlVbwk1zr7QOdYqpr?=
 =?us-ascii?Q?Ppt9yLcIdnWZb5mymk7DofV4j7beOgfBfPNlHSUBCdMdoOzmsXGYuhUfGZdQ?=
 =?us-ascii?Q?eAaL5Cb1bzHHzkOZZLmpurOc8WdtJinJ/oE3i++OE5AlGqJAYs2Ubs3T4tHV?=
 =?us-ascii?Q?vTeGfJEIdMNjtwVJzyxEtJmRXtREkGT2wGKrbncWwz6cz4rJ4Psi4fEZVDQW?=
 =?us-ascii?Q?sUtEPozljuk+RpGwQCFJnzc+iTn3Jj/kn/kicpE0rajpY/vyrv4IJToIQECD?=
 =?us-ascii?Q?Q4KrBntIB+UXUX9FbZIvviD913PqfXtp9p8QCrlPqi6WpchFABNB6yjqn28G?=
 =?us-ascii?Q?0hMR64N4hx09PMw/dNZORLnWcijTxsoVK/HW6cxDdFIWunlQeZTtomTrjgwZ?=
 =?us-ascii?Q?AwoupaK0+OHoT91PDE9YQX3yGx5U9nka8GIMvq2qYN1aHkfqvnmMxGhoUByB?=
 =?us-ascii?Q?kkrrTKVCqf9UPOLGThxy3zwVbnGj17UftkkJ2GzTioRHdSMHJcwslolKoF18?=
 =?us-ascii?Q?OaMwvFndk9Wn6Z65HM5OEUWP88XDxswRfpqX9FlOV53jiZcbF7o6JoJITj+t?=
 =?us-ascii?Q?lyhI/88uLB/FIgY5yYHSRcRoZUvZaf6IQPcTQSTjwIi979EIAqDnP+5YYpIr?=
 =?us-ascii?Q?JOnywi3HS1cGzPz0os1yk4c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a0d09325-e53f-4291-ca10-08dce0f58583
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:13:49.2127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qmFkpRkgxsIbemaiUK+Uh0U6xCOVD3wNUl+9Kpj5d7/Kek9LN3joyZhLJLxle3+ido0WwXt2HYZSegQ7pmrqYdY7ZW2E4hEDHEY2DT4J4GnrT68qbTGq/Lc/23TlT4Sf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8143
Message-ID-Hash: 57W54WGCBSIA22VRY7NM7HSFIPNMKQ66
X-Message-ID-Hash: 57W54WGCBSIA22VRY7NM7HSFIPNMKQ66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57W54WGCBSIA22VRY7NM7HSFIPNMKQ66/>
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
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 24 +++++++-----------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  6 ------
 5 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 77cf72082e73d..02b04f355ca66 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -573,7 +573,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -584,7 +584,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -608,7 +608,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -618,7 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -629,7 +629,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 3756b8bef17bc..0193b3eae7a66 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index e9ff4815c12c8..aa38104b27042 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1407,8 +1407,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1444,8 +1442,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1480,7 +1476,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1512,7 +1508,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1527,7 +1523,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
-			links[i].dpcm_capture = 1;
+			links[i].playback_only = 0;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
@@ -1553,8 +1549,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_bt);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->bt_codec_id) {
@@ -1574,7 +1568,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1613,8 +1607,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1657,8 +1649,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1686,7 +1676,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1724,7 +1714,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1774,7 +1764,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 357dfd016bafd..4ca1978020a96 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -317,8 +317,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -327,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -339,7 +337,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7878e061ecb98..2ca904db82abe 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -276,8 +276,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -288,7 +286,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
@@ -375,8 +372,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -387,7 +382,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
-- 
2.43.0

