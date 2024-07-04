Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B53CD926DBB
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 04:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB641F53;
	Thu,  4 Jul 2024 04:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB641F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720061988;
	bh=nmSvQ24F721plFWJWpPJ3uVM5tGHRzo5M3Xb9Nr7znc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J81PTWUcW/OdMT9M3bVtKxICvIopphEZ10A+w2o/WlhOJnies7fo0/ZauIk1z0o6c
	 eqrbd/vkZKFytv+fUhJzz6fZMav1XgymjzgfoVX00u2yW71IgBgv1iS2ZV7raJ/5ga
	 YS87epomg7vIlCEmiHgi9ayhla1V8DnBY1M0iLmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35292F805AA; Thu,  4 Jul 2024 04:59:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99A66F805AC;
	Thu,  4 Jul 2024 04:59:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D3CF8025E; Thu,  4 Jul 2024 04:53:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D6543F800F8
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 04:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6543F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=h565SuTV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT2arzQI8SrVUYXXlQWAxTkM/cB4mxZlqFcTeywBQmR80DFxHyyyP52A8C8q8YA/BBgY9UZ/t2jSXio2ksurLCcPbZyONdrsOrDJJzePakudfbQuscUBK/ty4EfWE4gY/AmMdNcYlTioJNE4o6UK1rxD1d3UF5fbxI9aQyBtE/htMfD2E/rqTQai1WCRnef74JQKJ+okyeEdCPR87jwrkpZYRBsmYATlKeKFTFJwoRFwMd2SpMT1hSWnKXzByNtWGnUp6W9YfJQHKB0woOfJCmghxGhztq1OFwUyywDkmbigbg+HcFVgE/nuWfoQubEEEDKd3OeSMJS2V8qqBcAYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0CXwxmX8ONobtq8PHO+JwiPU2icsEspBT60EOWchMs=;
 b=iLSQeNn5Xz+eTVN4/1hOaRfdRoZJQkzHghnwd0dfxqfiFKHaOjBDikUqIoiF/ofWSnRL7OmoGuFu4yTWp84xSGaLozcooHK93fcbOkIGCdWHqwnDKiu6AqDwkx7sSrpvFKn4p6yAPYZde4zyOmc16HGV8/0ejUbC7m8iI1VxCaed0oDO8phgb1uIpFOSagjpLDKE/0KKFGieSNvAOmn5bcoN/JgZqZ9UbCFUxskVIqRpefFWGQHHWs/9l+7nN/XkLtxRXwNmOttqmjCTcby5QxXR7bwtxDhdExKhZDSyvCa8BMi0CABQYmCQm3k+fa36uTOQ9oc2iU4/ANpBO8eeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0CXwxmX8ONobtq8PHO+JwiPU2icsEspBT60EOWchMs=;
 b=h565SuTV2Dta60uiv67OcGb7xufaOFwGAvJEF6InzAj8IHDt+7WKsGdG1wFtB20vTCx42WtNZ9vA1+2o+QAqoDjDFtdhIsOGd229+qrEQphgaq9e5OtJdtcVAnmxqG7iDTQixsboD6PWgQRgoCP/J/2GY7gKEeuDCjgqRxHiAW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9652.jpnprd01.prod.outlook.com
 (2603:1096:400:220::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 02:52:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 02:52:56 +0000
Message-ID: <87v81lool4.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH 05/11] ASoC: simple-card-utils: Simplify with cleanup.h
In-Reply-To: <20240703-asoc-cleanup-h-v1-5-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
	<20240703-asoc-cleanup-h-v1-5-71219dfd0aef@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Jul 2024 02:52:56 +0000
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: d690d29c-1738-4fad-37db-08dc9bd4682e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Relby7R0qxMx1N15g6TV2VzBEqQUVYRlAfxCTI1ysUEgzARJQdwVIEdhRD/x?=
 =?us-ascii?Q?jWLWfrkBCwxCek68PDYs3g+/Yk0ZtfexWeNpmTSTom9WNg8a/sRDsMhFAFb9?=
 =?us-ascii?Q?JyGWi6zMW3q7EX2VchvjjA+dxnWybEBKJKflPoPPMtjFwf784GYnrV/0EDxk?=
 =?us-ascii?Q?zYf0SrD83v8NHxO/FyQC2pnbUERR5rrgS9k30ejxhmKK7wDVir1uue49NZcb?=
 =?us-ascii?Q?ElrU80LpsTrQG8dGSKK58Gi/PYxvQOJ/wXFitttnWYYd8z5uKo0XiHYmaKiY?=
 =?us-ascii?Q?Ird53KLRKJcH1+L/XjHKG2izGKfIdmysmhi9+GE1duBRZzeMd1r1ZGDFHFIk?=
 =?us-ascii?Q?vUjwNG2BVnKxQ30diKK2ipvRHDWzPB+zoe/MES81uUoVrbGyIuxrGLVKji8N?=
 =?us-ascii?Q?KN0u7KmEuANYuRhkZaNCHezivPm9AI+9LLbkUjybz51F/Nk6yiczsb1dz+nZ?=
 =?us-ascii?Q?qZsAzfjivSRVmN/zfJiogMAEh0DcTBBA3xIDVTkKqw7c139fj3WG7y9m/tGd?=
 =?us-ascii?Q?r5WKbZf9SRB/G3K840GW7MyihQs9NtwWCawNDgXHSuB4cpRlLIZcmN18wbGj?=
 =?us-ascii?Q?W5d+FCDwMpq0T/dgmwEK17vupS8ZNgDjLS9oUwiu4NmyjLsiEhOZJb65h5/M?=
 =?us-ascii?Q?HrS7cLdySOa9P/IOJGPCMwhIqirc8Zejo+lHlhUlN4ejns0FRmwuGi6IMpp5?=
 =?us-ascii?Q?XCznvGCo3+3qX7/hD+dmcDZeMNu2UmM172LHR0FolIYL84rNyra93NU11mx9?=
 =?us-ascii?Q?trtzA8gEN6u7GrHN90xsgy/UQU3k8ZdSQCLiUDGm7tBXM3TZQDMB4bWFxuBB?=
 =?us-ascii?Q?gy91z+NPwRutrbyqCzd32yKPE6AnUA9O8fN4+VLaju3yMZu5UD0t2YSiZ1xP?=
 =?us-ascii?Q?dv14w4Brhb0TjndV5NaDXbLdmVFZB6VXL2LYegFAselFgN1IoU7op0QTjwkB?=
 =?us-ascii?Q?Lq2zlVyp/SDvVVoHsrkPex2v+dZQg4v0B6dxpzemIX2CT+OkIKCUCyGJRJho?=
 =?us-ascii?Q?qglwhBL48lnNJ7Rgt791ACZps/1uFnBsKKtpZpD8HPKGQVrAr3jdQAjqCy1p?=
 =?us-ascii?Q?RQXh8PT/aG6/d2dco48dbbXvLO6n66J1sEYGfAKIrfOCXlNTDmFzRTbqg529?=
 =?us-ascii?Q?i2a7FjsPaftpOZdXacKjRcqbm7Qq4/uFZEjeKd/ecS2+GhhjDjqW/UTF+7FX?=
 =?us-ascii?Q?o0PVYGMydOAIXWykBb8ujomjNddYWRy9ctBa9PReqcYkYDr4oT0N7GoWGZ8c?=
 =?us-ascii?Q?lAgbn9Ao5O/zvaDvXosylxdsC3Zx6vpCMp8FXnhEkoJNcznVyILB4ofGSfrg?=
 =?us-ascii?Q?bYRDN3NNrCcSUtZZaYkJyRvjdLIHrATKLy5R0lx8lUw0mlqk9vfJPGU82JRT?=
 =?us-ascii?Q?YzkMydj9HOePPe/ews8+SBYngd3Mk7lNhtiH+CGGx6VcB61dCg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eZiZKufM2KYyRAZNjypYAgay81GgJzo8BrmSxhlhWAE/bYE/0EJv7pav1g+Q?=
 =?us-ascii?Q?OLCtYqf+H9dou5E+bVt17g8jyRVYw0wA6Xz7w/3MC7XyCtI/FrM0M7VRHCEU?=
 =?us-ascii?Q?bZ3vDTbTlhDZXwOTz7k2ZLTR9jK2eGXkrzPrAPZHMCPrFngNCvKBzSO+cLkk?=
 =?us-ascii?Q?yMhpd/3p9wYVbTr67ochPHp/5xZ5hyA/u3JbzZLp886IlkyKUOzWhH8rT8NQ?=
 =?us-ascii?Q?gTXJSq4I/KODx2tSjYCXQxwPwV03FjBH49jtk3HbSnUqeiu/a//WhZyruY0i?=
 =?us-ascii?Q?rktOonm9QhIebvQXU3q2VSvFkNxe6/uyBeCIZu3Kw/+3ai1A9/aOCtyvA2di?=
 =?us-ascii?Q?vrVL7M8SZIX5m+OkOFvU5elRVwuyYa0CFCG49lGbz+9aOpnyxnvVhNTagx2C?=
 =?us-ascii?Q?iY/Yd0w7oLlCKnaL/g+GW9pFhAovgoWTmsjhyMchs32GD7Wptxbhgn3bUJPI?=
 =?us-ascii?Q?gJ5eJvrXTTaJoTZGTSTfIGtg2ksZt+Rwa+9ZGRMFX2GWkcLgGVu6DOWfB+4C?=
 =?us-ascii?Q?LMX9ha14VmEkBqIUdXUlPUky62M0owRYvOVhltRDXjGmRc6EluJB2lCkrN4+?=
 =?us-ascii?Q?KqzDn5jcyhETg6SRD1+eNNX42KBqm314nrPGrQyngTcl6b/zOeR7E/La91vP?=
 =?us-ascii?Q?QCUXAi/6XiUCAHGv+uMOYZhKwpNIvwcTcqc+c1ojpM+wAWDV+d2MxleEj9Q2?=
 =?us-ascii?Q?UZEUiNtfVCkZNKVODRv8NQCq18PAvXNg+kq6EnO5GasR2/4vfBHZ34sXFGGO?=
 =?us-ascii?Q?RkaTQI8V5WAhnW/UP7/o/RVLGBxTS0ICjuLB7jqWDn9Plfsvz/IAqtXdpgQV?=
 =?us-ascii?Q?Teumq2PJ141ezzduOcvG+EtwTEEHMOUu1ZW0XPV635LegA903PX9Xp5hkH+d?=
 =?us-ascii?Q?kuyoRMKL2OiHbf7n19Xii6d09W7XNdkAfKM7lVowncUvYOsbQdf5zUlxAcns?=
 =?us-ascii?Q?1z/k/E9yPVXxnT6KJS+G5qRnvC1Ndpci3Vm7oCgZwvUYg88JSh/2ZydrLasr?=
 =?us-ascii?Q?XHUUE9fSBu8droA05OVMTLf2ZAS8cJL5kQhatrWTT6FN5XECrxCnXxPNcnpA?=
 =?us-ascii?Q?mISOiLu0iqv7ztF1+/d0DH0gPw0ZCKvg7NqDvw2j4KFp5Wh7MFRyu9LSE0HE?=
 =?us-ascii?Q?6XLf9s72cNXBsd3nSkqJG5wD1oxzCzJEMJpfpIVd4wjt38yzUgS7QPpjneO8?=
 =?us-ascii?Q?wCBQyvAqhFp2YBstWtkGZLHte9zMluSG1J4jltB7VhDkZ0MeaKWkUFhG0Ovv?=
 =?us-ascii?Q?CQkmqsEKt8U46miLOVOVp/jlwFit2PsAd5wnG8RTExzEtzhJe0UVKzqLSELC?=
 =?us-ascii?Q?0jUTwegOGHrQeCMeTtdoAvYy5hqD0zx5gTJTl12NVp68+LTmqNat1qb4eutt?=
 =?us-ascii?Q?f3y19bVKQnh1YFcrzE0xJLeG7Jil1VkmGeRwrJ5DZqkzY7EKBXiGa+3/3Qkq?=
 =?us-ascii?Q?X8UUAZm1Ax5Zo+pb/J0opQ1aB0NOGRZFwnF9xqaNKyvRoLJ4lELdQWsy9ZXm?=
 =?us-ascii?Q?q1x3aXW74D+k71nOh9zgHH2mEMqBEWaiAsM7Jc4Z4Y4dp56ZF+8EPoycv9y3?=
 =?us-ascii?Q?Wcdjdfwq1AmEHeIW9vAdJphBG3BpyqBOU4alZuOfm3kyuHIz7CKIqooaH1Wa?=
 =?us-ascii?Q?u7MOo2eSsqliaIT7wpC3jhM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d690d29c-1738-4fad-37db-08dc9bd4682e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:52:56.4544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ubjtNAESwoRSQ4yaiPAWmGNF9yTt/45pkJRWIVo9d/ATNXG83xJILe3aZD/14LYwoHKKjUfJcNVSshwCzQNJCTAeHJYx5JJMZ0q3xpA28cpslqiJma8EB6hXhiJnjySW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9652
Message-ID-Hash: V6ZK2EAXV7VSB2F5QZCVWSCJVQY4S2D2
X-Message-ID-Hash: V6ZK2EAXV7VSB2F5QZCVWSCJVQY4S2D2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6ZK2EAXV7VSB2F5QZCVWSCJVQY4S2D2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Krzysztof

> Allocate the memory with scoped/cleanup.h to reduce error handling (less
> error paths) and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
(snip)
> @@ -151,14 +152,15 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
>  	if (!dai->tdm_width_map)
>  		return -ENOMEM;
>  
> -	array_values = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
> +	u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values),
> +						  GFP_KERNEL);

We can use 100 char, it can be 1 line.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>



Thank you for your help !!

Best regards
---
Kuninori Morimoto
