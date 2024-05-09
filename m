Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DEA8C0885
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 02:34:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C47DF8;
	Thu,  9 May 2024 02:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C47DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715214865;
	bh=9gSnQWb+1EBqMwwUM1waFXamTAxDvMbz9HI5BT821Pg=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mOdD7sGZFXF99aOKsoEOYyFi09P8mr8+6AJE8K/HleMOQSQlswUZjuNISY3AFq01P
	 7TTwMfzYOyM8wXMBYaAbx+1qoJcOolEn/53SgK6IMNcnz8r2gkjvlK0ZPIU4Hlmf9K
	 vIR8cKG45ayl06pkaKhRGNsi69Slse5qhvxY6WbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B041F80589; Thu,  9 May 2024 02:33:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26687F8057A;
	Thu,  9 May 2024 02:33:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E90B1F8049C; Thu,  9 May 2024 02:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9223AF800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 02:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9223AF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mj1W+MSn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivNo35CuP1MH/FNisp9RlTHXi5J+ItswfUq1+yAWcUbjOt20X/+hiz6kZK1KmVNxvjWRJr8a1uSS67VIVM3Re6+UEH3pNRXc/Owj3YtmA14WQ7Ep+bdYDKdqpWZcl1i6Lw73SSkYoMPlEdRQ/zu15+QoeQOrI3QlevEupICg8e45eOy6ZVoCpXwqTLv6FAEeOjMYD3W1BZ1k4d28JL+oUXkue4hI+UYDw5gJyqnjij87Dz/zf/HQtTU82lpD14u7fWCrFxxHsntfNUdFgHpGO35qnnZk8RDmsXwVSODgFhNauY4aIZEDmoNIKTPIvk7hBhX2NozL1ZK53mBww8flFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMTra5CLDb2ISLVnTfrQeMgToAllJvfonCIy4QIiIv4=;
 b=AtRxKQBjU8P4GipYxv7iRHiXnQVFwRFJwtI1mTMY7AFunTdFtkdZ0TixeWnvpMbAEZx/kMedn3xcihRSnTSQtOavXmuwJljjVKTXssRmhmrOOXxD4//44cSuqRXgh48zOT13jb+ERMU+6PIFYaInGAYQtOQjTn9ovCEnzN5gguF9dXw0jbdqBNVYRB0rJMBNsmGJ2iToC+3JjJzGuHAgFBE08MnQpPh8HZV0P9ZKkkKY29ewNOrTqgQHbB+70tI+5TxXQN96lQOE1cOdoJp3qNZqIdFz4eI+92rcEQEQKvQi45f+y5672sP1tVb/NjVdQujXMfVkFHTd2HdUC4hanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMTra5CLDb2ISLVnTfrQeMgToAllJvfonCIy4QIiIv4=;
 b=mj1W+MSnmX+eyBTW5dJShzDsEyvb20aSXmbjtT2td9f0LGVa/xTW8o+ZmzkPHhYH9RuyITnRQc4uvQ0MTZZMOx/GJehSt3tVIyKz6KA4+B5ExQm7f8Pto+Se7QIh5j7SR5YPmYh76jcNs9dKxYTDQWvymYGU5Ja///ZMYdXY0Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OSZPR01MB8084.jpnprd01.prod.outlook.com
 (2603:1096:604:165::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Thu, 9 May
 2024 00:33:11 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 00:33:11 +0000
Message-ID: <87jzk3akoo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2: remove unneeded of_node_get()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 May 2024 00:33:11 +0000
X-ClientProxiedBy: TY2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:404:42::20) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OSZPR01MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 56db4fd0-b1c8-4a91-fabd-08dc6fbf9b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|366007|376005|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2u57OCd5LZuAK3Lv2UICVBJkqNlPc69nQyYNwOKejSOh0dfzUySG8ujjICya?=
 =?us-ascii?Q?QTc2eNRVpDLRqniqLK4mFmwBMHm80ftbukDjxlump2Fx191JKI9n8shm+IVZ?=
 =?us-ascii?Q?qDEPU/WruoocifKOYMam1AnWyS0sqiZydT9nAim4bUPUaK/uLbRKbxo+v3YT?=
 =?us-ascii?Q?BgLd1YR0Mn7oQeRu1BJ48hU0QcKZv9GRB8S5u6DUckjKLWX8tknEicjC5wqD?=
 =?us-ascii?Q?eAoHSfBfA3TVUXKISKwX/361rmYrz08i/l74lk7ZKlWDPWw/fO4UNqaezL6L?=
 =?us-ascii?Q?pGEr513ptZ4nycwkJFNBO64w3Av+wmO+uY/puPyd6nfggVQtFRTmuvsjsvRv?=
 =?us-ascii?Q?LEmA/iRtb1X2gGLJsXgJ+DLbbVM4y4d6VRzkHjXTuD6FtQh7o6dXEnvbWiCi?=
 =?us-ascii?Q?B+UyTW2L0xz66xijyoRoDc2iAZ9Kqq72kvTI+M0Gxw743cSJo1HVTet6vZdW?=
 =?us-ascii?Q?0J3EoLJk/IX+PNaQT+SsRdB5IuPT5ReLpqGOpX+Ih0KiHre0e+JIYLms6Mfl?=
 =?us-ascii?Q?MIU3+oZOENJOJyTERQrScyzumumkrj+5uxeYamCs5Qmt+pT1xdQANhCU/yqc?=
 =?us-ascii?Q?D2nzcXQCuNBOgKys4JnDNe8NhxOy0D4DXH2DcPvSRUGjF3nAOSm7LKU3FTE7?=
 =?us-ascii?Q?I+14QmZnly04vE6WnYlroZwSdZ+2lCcwCcMCTdcrGZhbR9hqgHlSLzYm+Yen?=
 =?us-ascii?Q?RR9kQW6CoNVROf6/j6OlzIYQvKRH++TkpD5wD4k6LCO4A/2OrATTQc8cBZeA?=
 =?us-ascii?Q?Pom2jFmTKIsOb3lfo/OkoC42ZX22SGhEriGrYzqHcs8vCXfwafKr3HeQCdGP?=
 =?us-ascii?Q?xMfc/85OdFqoFM9X2aZ8LVwdIv1vdvwt0iUkjfjf8LP/CzZeCtDGVURps8i5?=
 =?us-ascii?Q?9nMIGF+vtIETGhnTNW2detdEcM8GHTrHagYPKeNgdZ2pBIFwQWzr7UYAA86z?=
 =?us-ascii?Q?vji+1e1MSadimqGCM0ZtT3leY6on8BZYuqqc0s0OvIn41R3f2RlGvDGT0Y12?=
 =?us-ascii?Q?zU6w0Qd7OVjdzG/4tAr9Ny58Hh2Ce91EL4O2L5V0xITtE1ajdBcDaFFqAn53?=
 =?us-ascii?Q?3D1LpBDyTNwUPqbHv1lHawAHWe/rulV4Pxog16ibjV96HCxIn2f2ZKZ+o3Rw?=
 =?us-ascii?Q?u/qzgbyUxFOFePAF7FELLelIsEVgMrQvxLNwwTdKsgWDuHXJG/JZuTDm/+nK?=
 =?us-ascii?Q?kcPKWWCT6jWcmQ90xtttgEt+MesY3LBW2AdF2Sen2oOALvO+rqnTvxiPKGJP?=
 =?us-ascii?Q?w1qFj0Jsg1yQ+iu7+0SZXIirLixo/OG3pLwvJttGAa1xDpK7cD3RwimqQ/Jh?=
 =?us-ascii?Q?CMCxEJBoqiSpCilh0P4TM3fG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iunKDkS2r4geNef+HDX6XPn8vhKldFza9hXGtuquWC8CgyNgr0fnEFDqJRrC?=
 =?us-ascii?Q?Nt5bC936q3lAisRdfdhhpv9tmpr+KlCoKs1LQXD0mmnD3c8WohEieEbAwMQm?=
 =?us-ascii?Q?vLhhYJMI4lSRp43y0+FmTEqDdGscz6tq6wygNlO5CEsG7loX9i/7kPIsvL1j?=
 =?us-ascii?Q?zm0uBxpwzVnJEhp3yM+YRi/26KmQPi7B1WnwZTrEXxdLDn4lM2q10udMUk3C?=
 =?us-ascii?Q?z1n84wrYro3xkxyCp3ZBm5oK9SbPq3z+0mankFNqXsV/rBfgZpd4gZaVKjBz?=
 =?us-ascii?Q?1Hm7I+1VHXJB4e2aIvzXrvqkXCic09r3rWuEv2qxKThruUfInDMkEXv48jo8?=
 =?us-ascii?Q?FcfmFWpI82oiGZmx7I/ST75i3Yb8QxBGTlbozyrezmF6h2GX/rwkklrp+VXn?=
 =?us-ascii?Q?ZL7hasToKqdLEMLsnmYXmmGOIaLIgeS7+oPMeqouz0a9YyH/kYjMOHYho71e?=
 =?us-ascii?Q?03ovl2RmdoWx22Dns/0DgbcpnWevNwD0hSRkglaITjJ4AShNQwg7ska8f4te?=
 =?us-ascii?Q?y+AcB6YhHk2661yRR3pkux5ATud880JXz5e0bo+8nNyS/KeZn46hASAm7BNJ?=
 =?us-ascii?Q?oR8lRuqqAmFw8ZwndD6PW+rUYUitkiPSAPX86X96Tpu512X8qc0e6jrU0UrL?=
 =?us-ascii?Q?8HMJMWrCmCGuzQlaAj/v/nNhKjFiy3IrXGo7ivjuEgOLMyduJmaaGPXoevzK?=
 =?us-ascii?Q?OoKOjJVGaRzAn2i52lvr7jMIxRJk9A/enE+flT8ATYUU6SbAZJWkWbOjjTPi?=
 =?us-ascii?Q?/ZGacHXy9Zt7b9WU7TmeuBWa/cFRkbWriq8BfHmlvOmwszharkk++zQ1gU5Y?=
 =?us-ascii?Q?TfTJSPhJpGhWwXvx6/fGcueLvK5BzbugokgZj2GjvolBsSDrOH3qoa1Yp23o?=
 =?us-ascii?Q?/JMXqHPhniOixcPoTMrCRfMoLXFXz+fKl1AAJ2jdNzgeF7nn/NsKTzjpsKxJ?=
 =?us-ascii?Q?dUGSIIFovkGUpnUv4c1yfytgP/vST/5Bqr4eqniGammdPpZ6lNxvFI6vT6Dh?=
 =?us-ascii?Q?IwRfWNX6LdgN9+9FWKQlqXx/onbiRmLeIyDiruY6PLhEEqCrS/rAxXltpfXj?=
 =?us-ascii?Q?kswAFsNkAuYbYtOXfxfs70SkUL5sGQ/RAgChSkWCvCUUBL2lTmIMPmH1bgt1?=
 =?us-ascii?Q?ETFJyeuxbAnIi99CAVGO1dFeP71cJfF6TfV27hMqC+3KEe0MI4qMhPCegWzX?=
 =?us-ascii?Q?0fGmBpe48SlWQmMj+GMT0D3iC3C1ImDYSpEIvApDmyLRZ+wGhvkDZDwEU2eE?=
 =?us-ascii?Q?DrKsTlS6EU9SrPBN6sQiIl/h1UUhN+LbRZ9vc+oRVw+nDhSHY77mzI0fPZD7?=
 =?us-ascii?Q?iwNQKJ3GyyPEHjok2qAgLYD3aa78720uUAOO6tipcokjfro+TQ2B1joLl4vj?=
 =?us-ascii?Q?SOUbZ5V+rIt/Eojt53+5Svq2Rnkn/N4QB7LtJoBSBKgY72THB9H19OsI9cxH?=
 =?us-ascii?Q?s97+v23zUvMA7RiUZsWhxZSr/bayzpKIYiZHwj51BdBMRjjTJizBtiimv22m?=
 =?us-ascii?Q?qf9kkp6MflvaHKeCG9fQqKh5t+qeKndc2YPlFt2kIjZErmQ8TlAmAEr0kcQZ?=
 =?us-ascii?Q?xsOf74RfnMgIVcJZZ0SqVtJVNE5F3O2V8YKxhX3q7O1xLxJKNEG8rtOYkZIt?=
 =?us-ascii?Q?UC/YpMjZxQ0MukdCouBeOn8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56db4fd0-b1c8-4a91-fabd-08dc6fbf9b63
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 00:33:11.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iHijnGEN3vn0xhWtJ/bWt6ZA7LQQr3sS27uZoC67x+WxaO0qI1HGCTf10NFhbq35dwxvZNuqdAwMEV0Y9odMloYc8YNCh9Jl5BDO30u1WijOiXi6KaCKteOYN1xBUudL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8084
Message-ID-Hash: 3WJNQZ5ZC33RRI6R5AC43PO4EENT2Q5S
X-Message-ID-Hash: 3WJNQZ5ZC33RRI6R5AC43PO4EENT2Q5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WJNQZ5ZC33RRI6R5AC43PO4EENT2Q5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"lnk" is used as "port0", and it will be used to get "port1" by
of_get_next_child(ports, lnk). It will call of_node_put() inside. This
function is calling of_node_get() to make up for it, but it doesn't call
paired of_node_put(port0) when it quit function.
This of_node_get() itself is not needed, let's remove it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index b1c675c6b6db..825125d8985b 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1021,8 +1021,6 @@ static int graph_count_c2c(struct asoc_simple_priv *priv,
 	struct device_node *codec0 = of_graph_get_remote_port(ep0);
 	struct device_node *codec1 = of_graph_get_remote_port(ep1);
 
-	of_node_get(lnk);
-
 	/*
 	 * codec2codec {
 	 *	ports {
-- 
2.25.1

