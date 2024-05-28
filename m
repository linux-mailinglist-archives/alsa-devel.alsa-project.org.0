Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFCD8D13AA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38AB1836;
	Tue, 28 May 2024 07:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38AB1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872873;
	bh=hMnHc2+T6ZG2QQNRc5URHQ9RccWTIk3bNSVwOUT/9tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tYIL9xgDWru83n3vVm7nVmGK8wflVDIdvFfVwss/Cr5yc+YdxC/5iPtYHKvMtRfkv
	 dM3a9SLLTMT2msFX/FBhpXBY5feE/+KCf5feQ1g7csCKOctPmB43hQgLsgpnvGeffZ
	 IEUtx2jRCji+BfVNnWIVuyNfKs0AE90nWuHfqM60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5312FF805A8; Tue, 28 May 2024 07:05:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5EDF806AA;
	Tue, 28 May 2024 07:05:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2D49F8065A; Tue, 28 May 2024 07:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4166F8062F
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4166F8062F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mUY0BMZv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXYWnK1j/d5saHjcSrwplYairmPXbMTyH3TpMNP+EgF8q/5S/wfP1vQ0Pi1ATl5QsFtZBLq6eBUD/c0aFwJn2GIkbDi+VFd+iq9hDopL5sZdZip7J3gq6rEjc3Lc2Q5pxOV5lOV3d8lHa+GRswvX769vgh4oJTg2tM+/Kbf278bHsG0Agela5sFgvd5Ies1ih8wDX5J4WhmbY1rHjyAUaWLe73Di0DmkdCZ6QyMW3s79Fy9Mcpsc/MUBRVtUDUhrhl3RYvWemtqM69sqmYcPW7882nj0n6o1/D7rPOi285o+QZPuCovfGxUROVRLlMj2R6fy/qKJfgj1/oyt/bfs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkXNiz/yOvSLYLfwiTDYiYo5tD5IN8kTEOF76BmRE8Y=;
 b=EgwO7BOc9DtVmtSJbAeHA4zDAljmrrz592WlRj6+ZP+dmgvajwJa+iWUUrtr46vWPH2GAXQLosK8ThHmKNCgQ0v9BExomcbBWSJ8ukqbNIwd9yjY8U0xPHpvUZZmmbtiVqnOJuUKl31xwken7axHoPnvU8Ow0GHLPEtgqKVqLfLfMv50TR5cgYE1ayAbwWsJRX7AZsPBjVJ5BXx098VSY4V+df2uWB7F0HtCLI5Fm2bnyMTAyiv26qv8hsCn13DbnQT96ILOLNG4LoKrKpgA/Fe0d/u3qyhRUOK70xcZxy/h88szUSXcSwFTVfdsxqVW5lZqdsX90l+ALuaUWB2jCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkXNiz/yOvSLYLfwiTDYiYo5tD5IN8kTEOF76BmRE8Y=;
 b=mUY0BMZvTL8ugDMJGXAltrxUUJ/p8NHhUEnefyb6LbBnxW9dA55jbdkqe8cgAWvnewbLCGa8gYS1vL0Vxv/tGOAH5CmiP0tFWb+DTJyIe6jmu//xo67A5/qhvavY1f9pinKtAVCEweMCEHgP/jE8Fs4ICDmGGF04XFUHK8ou/sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:40 +0000
Message-ID: <871q5mh6fv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/11] ASoC: audio-graph-card: remove ports node name check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:40 +0000
X-ClientProxiedBy: TYAPR01CA0240.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef10c49-46b7-4815-97f3-08dc7ed3d1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GPpchoIHFatVkyPS7s9T9gSDv3e5mba9NBWGGVh+O8TAeg42TSL6ZtdEMdbS?=
 =?us-ascii?Q?1L7xB88ueCraTNVjXYtwmvojR70hqoqhwOxRL18jL5Y5HvvyiJo7Kcg7joQx?=
 =?us-ascii?Q?dh+BMYhVysvR0uC/BIA/Dv5o9I5aOwyNYXBzaJkJ/P3tnkHApnnAkhqtq7dP?=
 =?us-ascii?Q?rMF4ce78wKfRmBgKrEAY2fqd6aMCviyVfi+t2c1UuZJijJoSKZlI80/FuIre?=
 =?us-ascii?Q?BKqgHjxm/JvmOBRwGfwjrGrITclsAcaYS1KmM7USKO06E9LnfNplryiIbseB?=
 =?us-ascii?Q?kLK70zuYEMIEvxXurCkCPho2HjVVehQS0vSPbSQ6m2go+d11XWImhZXZeQyo?=
 =?us-ascii?Q?YOzAXbvlNCcWTPS3PDh3T1wh7VqIgZ8OwMdYnok2fRN9WCSx+mxtK3gnEzkl?=
 =?us-ascii?Q?Uv5FcBuLqEDpQrRD0gsgq3fx5qUVfiBBnORcMi/sqd37D1pSgQv5K9+xWqXg?=
 =?us-ascii?Q?vEQTfEsqad5xDhQzCVXtMTzikm1SjKCX3Yo3PbHHuer8Lay6tR6Yu7UbfUqH?=
 =?us-ascii?Q?KvbKws66Wr1tsGmrKgwTwqyQqxcOsWSaomL49aJ+DVoU8aDa4C++iigbPBRa?=
 =?us-ascii?Q?VrhObbV8buKNTrfjJKYE9iOKLyBGblLdBl/Xtjo9h/scuMEUZrdNT/21GdMS?=
 =?us-ascii?Q?qnPj6WJvuOsTWhymAxdEk0ZQl3bVQ9sgYUdDxx9RmZqtmySRxvt4gaBg7vBg?=
 =?us-ascii?Q?0MiS/ohO436XxgH39GLT67T0zB3hrZaZ1froNnLm7J62PfKW6YQ1Cvv84t9/?=
 =?us-ascii?Q?0yqT82sf4bGS/cKKCq0BbvkwwNlmvAb+M7x7HQuNVww3/ZTccoxLnUnQHFez?=
 =?us-ascii?Q?pd2SBWdvUIyUjM4QZUy54+j+2OaQPexetKMrmzzqms4YvaMz8ePBqrj30B2/?=
 =?us-ascii?Q?2Mzgydk/gwJ2RyQV3iB8H+/PPf2XiQMLrMCqC7Wdg4fzlYB1Srfmvj7hBVap?=
 =?us-ascii?Q?QdUbDNoIM/EqwIpuwLxNqQnXraQJ0AUbdIEcqdaMCtgdlaYaL08p9s1w2IuB?=
 =?us-ascii?Q?mN8+4q6LmzCmoIONF+4LJopDpw9XzGgWvBhRnU/gyKuRlVwDABIowZqHkpCY?=
 =?us-ascii?Q?2O/lOeylfuWr4vXCZ5rgRzdqKfgHvvY9IAwE7bDyIs0+9Ft2JYkN8Pxtt0yC?=
 =?us-ascii?Q?FWTJIqy6bg1YpuWMSIUwN9aPYY5ofXFGm0RsRufeIO3CXkM4fARlJ9HT87zK?=
 =?us-ascii?Q?rrPbr1jNbWLkjUtYVRjgdZorNDhnv0hSXu6eK3v24MqbVBl5RW3RDtEZeKF8?=
 =?us-ascii?Q?2hcUKahLBxqttMzV09Xk2L7L26NOd5+rvp0o5mBnHa0xCYwdS03TOhIMnZdn?=
 =?us-ascii?Q?6pTRDO6CcL4uqTzMW/0lfmTRURLcqh/QFYWIGtW5m+D6Hw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6CZwmbqOKW/mbZQii1T5wneAbj5ER2KzkMcaMiBTuAV4hQnE2VtxTTBn12U2?=
 =?us-ascii?Q?tnTUSUKc8MdORoLamgFKMC2G8Yw3oj6adhpNJpqN4H4LL0B1F5HgMAN2VrNj?=
 =?us-ascii?Q?G0KcSf0TD7DgLeh4muCbo8FbBUwYr+EoAt2wvD2coXKc2zNKXzL9hsU8BS6l?=
 =?us-ascii?Q?U3jK09p/Oe39T2m/VAm+vpUI6ZsCs/a2n8JJJ6avAsg+4Knc2LuRluwd2yrc?=
 =?us-ascii?Q?XjizE3MmJ0XOYpQc9gTUYANgXV2cLjwJzl9igDtVhnObgoDp0uRSy0fQoQFl?=
 =?us-ascii?Q?tQ8xmWs1hXW7UYBijso9Uwa+R/eXHnXHH6XPZ9mrQId3UB/0CNKVypWjD/wq?=
 =?us-ascii?Q?bw0LMoq0IisP2J/cXf6eQnuRN16F9bIucuYPZsuIKs+gihLqgkW17N1USQ4n?=
 =?us-ascii?Q?qcJuJBwEdLnDhl8n7tLoSS0H1/z9iDeZ8lkmmkaNYCfmCq6bwsIvvHtx2nsu?=
 =?us-ascii?Q?btcbYgaxcmSa48mbXxOSAeWIZHRUZKHLdMHmbIJMhrtjExZuwRerxbt789A8?=
 =?us-ascii?Q?1g9AFDgWLDzjEW5tu1EjX9pcL0tlm3Q4BvWMsLwUHlBZ12gT0DZ2LSXz6H0m?=
 =?us-ascii?Q?Fb8rmmDCQiBU5chwniYb9bqFLfxNQmBJDp3NrIIG9zfHY6Dbdtq/ekJdRb0W?=
 =?us-ascii?Q?mtMhQblrigQ9OaCr7OWEWBijM+iPnXxk+j6eglqOsLFwQ4bgoEyZOoonm4b1?=
 =?us-ascii?Q?EUFGwt5yDMjmzywncGkH5UdX+i7gOUl9s/aSM5XtcWm0wRXJRsJcscnE2xyg?=
 =?us-ascii?Q?zpHUyYDP7EiiIpeAHzi5ugQhOg0kULXWVri3urgkIykCUi0JgpMnV2zlRM6j?=
 =?us-ascii?Q?+noHe5kcXX/E/akNbQgG/T4Qm7vTj6VNDVYy51fBNaCLz6pxzQtfFhMYYZpq?=
 =?us-ascii?Q?DQnO+EmpNL+hklcuxB2DM6VEp+nPchFh5ZMS338CXAnIuf22JA72x4zPta1H?=
 =?us-ascii?Q?zCm7X9vwttVEJ5GTkqRi+KT29zy1XeFWt6n/c72u+EA/OLXBP/4QVhFRPsCo?=
 =?us-ascii?Q?sfX34AGggWvA2nkj3p7Y6aF8JWIJaW3zayaf6OxcrIbx2fG/rF8SKwEhi1dH?=
 =?us-ascii?Q?upBG7jgdTQU3la3sz6p+gC7RRaDNwNAl8TDTzcU54KzaKTu/cEuKlJ7hdo2m?=
 =?us-ascii?Q?aqXMBsVo2iIZSkboNuJFHH5ik9cBIc9GHuh3QAbmaa+0WTsDu/m5o0A0ptsS?=
 =?us-ascii?Q?vta/p7qrwxhJ8hUyMF/F2uY+fjJ/cF6DtN+KREDllrxTZBk+MPC7dNKURlJO?=
 =?us-ascii?Q?D+MxhcFd8siYRoo9wHfVWZ8Gd3nw49fU59Pd+NVJ0PrErpKUIL14QC0IDUIp?=
 =?us-ascii?Q?/X8aKeIolm4mJL/wQMBQbmUubYi46w+RcY3Kpcw27eP77//H2/dUxkGsYN/7?=
 =?us-ascii?Q?wB9VpYcQYiL3azcQBY/Eb+L+DfHpOCZKXd/I5K/tbuLiWkzhajKla+lJ8Sm+?=
 =?us-ascii?Q?qKxOc/3iafqVcCDAQIZ21lG/wxKLPqmPlgyKWkP4j1XUDd7dA0iQu56VqhaQ?=
 =?us-ascii?Q?dji6byFx851byXOiO6bHQ64SW3tshDFF0xkw2AQvOTGRsWTBiIZ0sjMxr4MQ?=
 =?us-ascii?Q?eM7HGEOz7tS9+rbn7MtNhwwyfTCeQJR/KxsegdYV/FCdGggrNRbcU5wPJCWQ?=
 =?us-ascii?Q?VNMZ3Y2seeXKT31jXNyBqp8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ef10c49-46b7-4815-97f3-08dc7ed3d1fa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:40.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AWndcVQK9kXcuzB6m68xqXwC1FDlmQalCP/scWo+t3DR86azPbVStc/FlEoTssDKbbM6xfxY+MnBN41FZIiqi34x8s8ScHVRxhF/uDu8k91dFPG+eP/b1Za1XNsseYKh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: WAUO3HONECGVCHQ5IKA277HRNANQVH47
X-Message-ID-Hash: WAUO3HONECGVCHQ5IKA277HRNANQVH47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAUO3HONECGVCHQ5IKA277HRNANQVH47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current audio-graph-card is checking if the node name was "ports" or
not when parsing the property.

	if (of_node_name_eq(ports, "ports"))
		of_xxx(ports, ...);

Now, it is using new port_to_ports() which will be NULL if the node
doesn't have "ports", and each of_xxx functions will do nothing if
node was NULL.
Now we don't need to check ports node name. Let's remove and cleanup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 552b94908cf7c..c60f001468591 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -85,8 +85,7 @@ static void graph_parse_convert(struct device *dev,
 	struct device_node *node = of_graph_get_port_parent(ep);
 
 	simple_util_parse_convert(top,   NULL,   adata);
-	if (of_node_name_eq(ports, "ports"))
-		simple_util_parse_convert(ports, NULL, adata);
+	simple_util_parse_convert(ports, NULL,   adata);
 	simple_util_parse_convert(port,  NULL,   adata);
 	simple_util_parse_convert(ep,    NULL,   adata);
 
@@ -103,8 +102,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
 	struct device_node *ports	= port_to_ports(port);
 
 	of_property_read_u32(top,	"mclk-fs", &props->mclk_fs);
-	if (of_node_name_eq(ports, "ports"))
-		of_property_read_u32(ports, "mclk-fs", &props->mclk_fs);
+	of_property_read_u32(ports,	"mclk-fs", &props->mclk_fs);
 	of_property_read_u32(port,	"mclk-fs", &props->mclk_fs);
 	of_property_read_u32(ep,	"mclk-fs", &props->mclk_fs);
 
@@ -245,12 +243,9 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 		/* check "prefix" from top node */
 		port  = ep_to_port(ep);
 		ports = port_to_ports(port);
-		snd_soc_of_parse_node_prefix(top, cconf, codecs->of_node,
-					      "prefix");
-		if (of_node_name_eq(ports, "ports"))
-			snd_soc_of_parse_node_prefix(ports, cconf, codecs->of_node, "prefix");
-		snd_soc_of_parse_node_prefix(port, cconf, codecs->of_node,
-					     "prefix");
+		snd_soc_of_parse_node_prefix(top,   cconf, codecs->of_node, "prefix");
+		snd_soc_of_parse_node_prefix(ports, cconf, codecs->of_node, "prefix");
+		snd_soc_of_parse_node_prefix(port,  cconf, codecs->of_node, "prefix");
 
 		of_node_put(ports);
 		of_node_put(port);
-- 
2.43.0

