Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31C926DD7
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 05:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0480FAA;
	Thu,  4 Jul 2024 05:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0480FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720062205;
	bh=V2iOgzXgIHmBNiiqYXq/fjdT02+J89ER2dn04lUduVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1Pi+yvoa7ro8rY2/VqFGXgpZ2G74sZP5nWSFYiWcRIqDOYKn7XO2+NhXrTbc+NtN
	 aUPCrAPaTv2nJPjbnTGYgIkmCuo8MLQwu0tDsc+CVIzWsvEZcsxjZqZnCMuPiAjARF
	 ANlw2GjzK9UkukAP5ZQ5lbRxg6GswQvYMiLKYtKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5E04F8014C; Thu,  4 Jul 2024 05:02:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E46B8F805AF;
	Thu,  4 Jul 2024 05:02:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D3ADF80272; Thu,  4 Jul 2024 04:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC31EF800FA
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 04:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC31EF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WOP+/BPL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpdF9yERzRpLfkpomDy17dYIYWhPcs7yHaL5Rr7zJNetkVXJJgCaIOEHBeJlozH3z3mXyKTvjGTUWOXQUnSVdP8zl0Nkwej0nUMP/wZcwpvPCuF4EqDn9JwJ8kajc97hHduXEN3nYNAwWM66he8+O9cxRaS3IoH9dim9Q7YY2DhR1FUSFIUHcOcPS76FJUhQjbjLLFKBjkakffVW3Fb2YB30lOszQZOCSg9pTcT4tapxt88IUxwBtH9/Gn1jQ/kZ4R6IAe0Z1w6MFb6IuXpd4Q25cF07pnCMwraUgGG2xVBv/xi3Ae66IPV1iwX6T2ghYwGgO6k8FZFGCt1hg3vRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPeEvk3F2QfdYVy6icxAF81gZvEoG+nbeyejm1TEH18=;
 b=NgaSM4cmZo3iwkk5FQhdh2SwhhzdOLISpSCEpI7zE/bwC8W0IvvYf/A9Z+qTjp0Vr/bsANXjviYR/Zd6B4czyYIcVMiY3Ax9jgN7/xFDjth6Q5qOkzF+IR3vNA5IWsqo1RK7Ve1GvnMnNExk9vidDmUQqjUSdnaNYDuMSc57Jyq9gbCmbk470XNSLQEtrDMr/yOU6xsquAzYpnXSpppuIo+h/+rsAhipm5T/EkwLKCd3zTsDkOha0UJc0Rkixq9iojOi17AqNFpUGHtcZytel+FXi/N71EExn70EACmItWtG1XSESiLB8wlDFHzjmQJucx+kRdUXSOEs15n5sKtUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPeEvk3F2QfdYVy6icxAF81gZvEoG+nbeyejm1TEH18=;
 b=WOP+/BPLw1hnBrjL+KW/COuhcZfmB6wX3ngvEAJ58lDV9EU8sjXEAh5grasiV7rTcnMYUWEeXK7xh9OI9Q4hpsyG1VA5t6ekkmj7rO1U/fcuPqCtdwPGVXeX+f0l/ihmoXzmoUaC0X2cAfythZrdJp4pY2cYWH5LQ2i66pdNxQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9652.jpnprd01.prod.outlook.com
 (2603:1096:400:220::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 02:53:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 02:53:20 +0000
Message-ID: <87tth5ookf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/11] ASoC: audio-graph-card: Use cleanup.h instead of
 devm_kfree()
In-Reply-To: <20240703-asoc-cleanup-h-v1-6-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
	<20240703-asoc-cleanup-h-v1-6-71219dfd0aef@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Jul 2024 02:53:20 +0000
X-ClientProxiedBy: TYAPR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:404:14::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: a93b2532-2fb6-4f85-709c-08dc9bd476b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NzU11hNxrg7C9AO4NL31lCxCQYfsiUr+JrRNg8N8VFiNDyHaBFuhrO11HrXe?=
 =?us-ascii?Q?PzM7lBP5vcxnBEuVlq06X/y7ahWqLRCHwg73fIJhbrHW3iadn6JEAugR7PlO?=
 =?us-ascii?Q?hdenPiON1Vjdm/jq44KPMBrg9G6p0lO4XhHub/P6v+w+/odytXddGIms4pUA?=
 =?us-ascii?Q?NPXy2Uev4wTQbRiPE/i+S4mvMUE7Zalztz/SNUx7NpqGblpiNu2Q7zYHp6IM?=
 =?us-ascii?Q?spRDmGr3RhKpRggPjv1WX4M3yHFZXqXL1wplKv/p2BB4gMpXZPF/FQ+YjkUd?=
 =?us-ascii?Q?LBCLws7pVyrB0eX5VA5kgd2TJSkBNAwK8IIPw5wqVPZTL5uXgQ15zMe+VaPG?=
 =?us-ascii?Q?/2E2ewkxvDp6Wj5+RRSQQJKyuQ0vaRYuYBexhcCEauJ2tAPsYJz2Ep8LUlLn?=
 =?us-ascii?Q?Ea4yNIQZ8Vu4ZiLZCFMmoRlD0XuN+S4kC/Dpmr1etpCOrMjLxkjEZGj2nY8R?=
 =?us-ascii?Q?Jx1vXACt4JJ2wbJAFkAQLBSQ8DSZFr6bHE+0r9L9NiaxL0jvZViMT1B/9u6Z?=
 =?us-ascii?Q?MPzqqHDGoUNx7NCCwJ4qYbWoNgVk9lEKtfQEKNo0RaEqgxCNOh8rI7BDMJiw?=
 =?us-ascii?Q?LBSnUOVCzniCAVShT67uftuxitWzfyLfNzSJtIZvSwWXPb43gNU76vpHwvS2?=
 =?us-ascii?Q?ahA04T7K+AhcIWbsNb6F5dty88fHOAz9PaPWI+vedNbfK2AYssvRMOPw9dsP?=
 =?us-ascii?Q?u+V7MmuBh4jkDyoFsH24Colw7t6dPaQsTuWn48fBH8YLFdTJl/PHJt4wlUiK?=
 =?us-ascii?Q?+vZhHswEP5+YsFEjeKotGvfAR0/Mhb2GDXlvFS3u3HYN0M7ToWwJQ4boT7yL?=
 =?us-ascii?Q?ICrQB31JfxTuk1+YFsoC8ynFEt1eSqcdURWoNzHT007bnAdIOh4W+xPYWeRi?=
 =?us-ascii?Q?LuFSaISKxSp8v2PQzadLHYvTcug1GfuynXd4AwsI/IUC3ZLNoLLcdQANBlTI?=
 =?us-ascii?Q?bfFtJgIH62OGJxaq3rnC8AVtccgtYEJhUFlo9yXTgeAmaMpBuw0E/sy/TBUi?=
 =?us-ascii?Q?Indq12/+bwfzYDDKl+kWZ133MeXOI1JX6CLJxYs37pJtTcBUEU7uj+UI7DUE?=
 =?us-ascii?Q?KA8V48oBtRlzNlP6JHieAZZg5rul9akVg+5rc69PLynsRbMH8uVxBgs9ld3h?=
 =?us-ascii?Q?2llmhFe9wugfFN+Ec7kLxHhZtiQXjh/74Sr5BxM6E/tW/NwdTsvqE/n8rnfE?=
 =?us-ascii?Q?7HSoW8yb9vIbxPnnMOuINeBtOPFTgPlRPNDdQa/VVoWLsHanHE30Rg+DxYZF?=
 =?us-ascii?Q?fpdG3F1fqrGLkoY6Wq8UtyNmjV/7dxy+Uwb5AwFRr1DRT2ZPFdJnAjfOePyf?=
 =?us-ascii?Q?iw41j9QxgjIz7MSc4ESvPFYnIavAam2yGBpoOwjCSaYauxWYfs6GLLq6eOji?=
 =?us-ascii?Q?wgJDacipPjzJBu1vtg568LU5Gg3ki+aJViNXHM/34aBZYnyiAA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CXsaaBf85kgsH1Q6uO9nIW6jb+lKBsG/nQlgZ5yLZMBcjy/wlIb2J/FOlhPc?=
 =?us-ascii?Q?j2mMKIRFlSYHIC0f3dWxBOFi9mrIHNc0oUZe5fIKP8QFQQaT7P+Jk4zk7Pvq?=
 =?us-ascii?Q?I9wmNzppDJI3c8CpXTznvcPLHNgUvxkoXxvvwNAbxcq52IoopDTdERmIlVIB?=
 =?us-ascii?Q?fTYeLg+3nCAhqkdrVBtw7PzcGA34Y2HnZtiTM45+8ShwqvMdFyYa4ffhpkpQ?=
 =?us-ascii?Q?kuU9INItgg9Yvghz1r98x8R3bvnc/fkj0BfC1tXsi6BAydH09t51oTD9FUmX?=
 =?us-ascii?Q?+RxyqwppQmiCn9HyCFbFcCjWxn9SGogb0tlO3qKgkvZoFfbQJmn4q2H6EpP6?=
 =?us-ascii?Q?X6obwyegMVaEDYyAP2fkw5b9EWgXSjYyLP/bE/5l2GoXOOkFLkWODiFdWYQ2?=
 =?us-ascii?Q?3wSlYNDC+KN8J3ywpYa7m3lYlqHmtAxsjOX+Uv+1Fm5PhhPn/YPTYpStvlHH?=
 =?us-ascii?Q?RIyEt4zFfTwRaQge8+buhIBbp0LuHOQENeAU0b+C3noW0nyShfv6CsZBfZzE?=
 =?us-ascii?Q?79HnCcEyqitHoEQHFyytjl0Y2x7xeTZrwCVrp2mFpeuN1BoxFQhTFzHp/Ljh?=
 =?us-ascii?Q?rUpiOqO/9N5MmUg6ZObPDq+J/XXYGz3pmkRnTL4jdXTVFfMGV8X5fECgjuYm?=
 =?us-ascii?Q?PLzIC5gklati717mb4vDNxKVqoHfJYgMknWpkAqHSnh+JMHGGsy81TckSDma?=
 =?us-ascii?Q?PgPsaDPhlda6vmjMbCjnBY0M9Dg2u4SUGpOiiIUqa8Rs9e69ODKyWi/9g5Bx?=
 =?us-ascii?Q?31Q8ceoegJWJfs8e+92AzxJLxRwCvS4EP/QcTumhu6gr1ZhpQLN1dIYXHT/v?=
 =?us-ascii?Q?6qDeKVfjEdZ+x/m1TOze768CSMMQB5Yrl1xiAkUUPxTuCoU7nJW8WtHmlNGH?=
 =?us-ascii?Q?+iZrzQbk+WXszBEdOGS7NdFNTpcNWiW+DXZyZB+y9e8+QDlbPfv3yeGB7mLu?=
 =?us-ascii?Q?WOc/TGC39Qs7Xt3apO2bhCavnKLBIlo/U+3Tf8HI0JrqBSt8Wf7cLzV6Ecul?=
 =?us-ascii?Q?yEyg4zzd/EbMV50Q5C3ZAkAuRT5+F3rLfpJPZ7YvQOTnsQiJ9Vql5B8zxhmB?=
 =?us-ascii?Q?w0pYKRuVTUeJpndDOck5C0MBi1MK9PduNgOOa0KrglcoTtcTBVi1cFqlabs4?=
 =?us-ascii?Q?Hhmy/rJfNrRW1F1O3kSlyX54wXyi0sMlOgjxWEM0JcnJKtOFgB0XDcOma3Hh?=
 =?us-ascii?Q?UOqx6eYeCEOXNmiKd0cuen2oTQTHxcZHgZeSG0RbU7ysJ7Ec/INxZkj9/iJL?=
 =?us-ascii?Q?fQrjpl7DxA26icVVnp6xbNFjABrNqVHQSWhyu/n3cVrvtW54Xlar3iLvUsJ3?=
 =?us-ascii?Q?+ExJKcxcWREsSZrKbqWVW/NkB+VniPb9YKm7rJUQ5V5JONY3dSCFoIfnA9zV?=
 =?us-ascii?Q?qRV7Y8+DnhF7hmgQLXXpAHFmTU7MPJoVXFKz3wzfLtWL5NALT/8xeU8nrSJ8?=
 =?us-ascii?Q?tsCqjpU8FRCHjvWhGDKnrwkUdDDyhvUfMPA8eZ65+XDsgL5QYGBcpUqgApk6?=
 =?us-ascii?Q?wE4zG1a7fyOsNHZV1r4kBNBtJiGAaBKIZj1bjuwgHN4x5pXYc5lRvrawFiS7?=
 =?us-ascii?Q?h86jZDhTFLUC00Xd2lNS0cHgXz7UbD/GraX5M80hNqQqcWFyNMsQ6Gh/7GUw?=
 =?us-ascii?Q?rzoFjRZGsOwyHuahPR4XtAo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a93b2532-2fb6-4f85-709c-08dc9bd476b6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:53:20.8000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YkJJmZTVcyyS4IN/bLJw0gfTJl5JwiuiZHMoeaDqjDXBhohKW1NjCuMEJiwK1BLr/PJiXBz9biNENxFyGh8Dz9v4OI59ScqhRTZFnEEX/nOxd6EA8cnNh1dQnx43hLDP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9652
Message-ID-Hash: RRDJSCD3JBGRYEF3LWCFK7Y3VDWIRYG7
X-Message-ID-Hash: RRDJSCD3JBGRYEF3LWCFK7Y3VDWIRYG7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRDJSCD3JBGRYEF3LWCFK7Y3VDWIRYG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> Allocate the memory with scoped/cleanup.h, instead of devm interface, to
> make the code more obvious that memory is not used outside this scope.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
