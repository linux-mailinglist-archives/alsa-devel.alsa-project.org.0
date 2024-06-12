Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099F7904B50
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:06:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27BBB6A;
	Wed, 12 Jun 2024 08:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27BBB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718172381;
	bh=bGODSZsly7uXMKsJjx4h8b2yNvbaR9i10pAouZ3sPwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hInf9XmOwIHtHPG9B0A7VPsl7vBMHofntYqvwqnIZ8X9IxygC8rh6cBFPlvKq1IKY
	 Ok+00mI856vVB8jpQrBi4Xlvbcsdtb4ay+w0UIPJc7yd0YtFYxc109FyYiIp+BHB6n
	 /yhaONt652HkBrtG7sFnUNohY/p9oK0ZJlxQ7qWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30CD6F80613; Wed, 12 Jun 2024 08:05:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BEDAF80609;
	Wed, 12 Jun 2024 08:05:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C763FF8057A; Wed, 12 Jun 2024 08:02:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36D8EF80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D8EF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EkrZo3Ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvKqSe/FHhrW29eMSEDUFbN5lBf0UYY59Kod3JhUeMeKtYxKQdM7jBnk1fDIB1FFOYF0fqZxoKJubjUOf7jNEbcZ5tBPz0FPbyO2NGkajQd+2EmrrugC/xMelAEyj95a3XoD6npelqiq4D2386iG9i5obo9dXrmSIPnLg5uTwxBcjjB3okMPRfZNmol4wSOhawjQASnSr4j3liIgLVWjDU68KG2OVPG3142WhnZDMLQ7ENKzCaIK2qhVS7E+QPxd/AGlafBCx7Q+7HMjNjpZ7Dd70kIvq+gOxxEokENmpXdluw4XK45BePhffcpJKVt+Ql66CHl4aZPDuBqJVgZh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjjER+N5Iop9vTIxPQ5Iti+usnyJaBCsY/O02Uh0CnA=;
 b=k50ZcvB7GGiGlr/YzuCfTK8kXPySOEn48tGEPefZHA3Pi1FNmbK6dONK8WIShmGlj1D5k1SzKBhLPrgRVads7LcH75dmZ/Sh+rYcu5WgvrFsYKTEYVYIZWGebdGzsq1+ZqTLBFtnbVjz4klB2rgsR+N3mqpEa+CHwTAzSrMh+9VWxVyAfu60Xvc2+UlUTbbWzWvUlplSxaM4HglcbHQT71Om9ZqGUIF1wKnxbHeDvW/P3PkACT36EAUg8u5ZwFL13Ul3vrIMu2M9jslt13VsUIojCkQgElXvRXoBjRR7pS6POvACJr9Zg8ATE1LMz5tzElmiCDyAxIKdpL3Ll4y0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjjER+N5Iop9vTIxPQ5Iti+usnyJaBCsY/O02Uh0CnA=;
 b=EkrZo3Ch/b4YKTNNFMzoXfbEhcMo/7pLDXoP58ntBSp6tpApf8lMskt/tOWV8cRHO0VWCxiUs3EYghbxN7MFccm6J6f81ilzX6cpVTUopcN+EPnPgP+TWe8faJi+k9sIKbyAFbFsrH1cmWm35lEkHQC+L4r9lXzIdaLf9PDOYtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8904.jpnprd01.prod.outlook.com
 (2603:1096:400:16c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.39; Wed, 12 Jun
 2024 06:02:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 06:02:46 +0000
Message-ID: <87o786zojd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/5] ASoC: audio-graph-card: add link-trigger-order support
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
References: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Jun 2024 06:02:46 +0000
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb69577-3e17-4366-3157-08dc8aa54824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|1800799016|52116006|376006|366008|38350700006;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2leNkcqaXUDdqReG8k5TqdRN7SXXEIXgfVuWcQqbE6qg3H/RKFbhUSWdpKBO?=
 =?us-ascii?Q?M+qwozjflQ570IwnZefBoM7xlhrGhPxKTq2w7vkMdqlECGcCorNHgb3x/wf8?=
 =?us-ascii?Q?G4pUeYFGIrzw84V7wIIdCNhz+zbRv2mOlZq/+HHnOxfySGzt0EuP+voRdpSr?=
 =?us-ascii?Q?kyzP6DMGZiCYW3TFK5Gx/zm7KBDEp3gqUEFXMKSMz/pw46EStgya4q8E4qCk?=
 =?us-ascii?Q?Vcs6c54jbhkIFY8xBzvQiSxPeq/100ZM/+4G+CDKKq83lJxShj3xVxLlce36?=
 =?us-ascii?Q?7bVlsU9TbQSY3hZsGkR2CY+ZQhMoKnHqv5vdEDyCe4gNnQ9D/rWkE/YQzwbQ?=
 =?us-ascii?Q?GZjpDQozHkdwL4EAIVwGeoTpHX9GtB+ypqmZdsK7eaFcDQq219dsot5OWiwR?=
 =?us-ascii?Q?185OJE7IZQymPG43Nuti768M9MroqgYROsOB296lot5APo7VFtObxeM/1aUv?=
 =?us-ascii?Q?ti4HsGcgDWTfkErv47xB3GZ66DAlU52cHmFrG+6X2/fcohCgHI6bQWAjVGU9?=
 =?us-ascii?Q?u7sdWV+qS6jdpw/oC09kcuHmVL88uZJl5nk7R6FWOkUT2lR++kIQ5cwCncQ1?=
 =?us-ascii?Q?bC1tis5ObUJBBK9qs7U0hs+zsJuO4Cx6KgfjAXI7kn8XpuymqzGsk5LDAaG6?=
 =?us-ascii?Q?SaECgQHdjVJVlpweNK33W+7HHNcvdhfAoro9Sye+92mPyZPVwQ3cwnfphrIu?=
 =?us-ascii?Q?acxqdEDfIQv9HVUbqF1jxk8i1hQwUub809Z6dghJUWIbqlSSR2Q36RDrQMw+?=
 =?us-ascii?Q?/p7nay4XS8W6cFZ9q6pRHzP/EhQ7/NuTKMOZ8Jv14wXyI9fQA+8u7NmvrGOe?=
 =?us-ascii?Q?0o7/wG3c1Ey8hoZ5MRGC2cW/heQK8ftMlLUs51IF0EqO4MUa8y6La/ZRQGY9?=
 =?us-ascii?Q?nNRbx1+1TFainwzQ1xx6+t+O21npY2gaQHjiwrVTT+niNBPviVcwrcqoKx7Y?=
 =?us-ascii?Q?tYEjKgjgZtAegCbl+AQ1dxI++lIg6M7MtvNIi+LKI2oDO9r6UJAxwbNdyo5D?=
 =?us-ascii?Q?7PjCrFqDKJpyc09CgLXM6orofZlAzN1dZUApz1LKADFzQcSVpjGBDhLJjZqZ?=
 =?us-ascii?Q?32MgE4LYBbiCrUZu0EqStCj91CT2fEwUiSQJBMMDis4JbRHykcylSHciEC/b?=
 =?us-ascii?Q?KY6FhT83YY3d9AcbJaJyhCMTAl6XD681JIqriQ5Y/3Xx6YQW8tEnl5F7q9Og?=
 =?us-ascii?Q?BaSrw/FEC0x6luFcD+tQfF0OPmVOZkn2q5oM7L/xHF8wRwnSVMogN3jDZl28?=
 =?us-ascii?Q?38IcLOWr8QzQgOCmy93ZBf3zTi1w0zNpcLluw8vGUmoaaM2owgSoc8ymfArj?=
 =?us-ascii?Q?GJBzUzLqwMttMn7vqGPVUzqEQsKz8N55TqDwXkahZiTvxjSSKLqkzGdkNYyc?=
 =?us-ascii?Q?UtOhcN8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(52116006)(376006)(366008)(38350700006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N6EuH+PMkiZOD6DDYChANtrbjufpQo5d3FoMjjDyXac5ukAY+RBHw1pjs0F9?=
 =?us-ascii?Q?kuRAr/x1jGG9p4TOK5anpGHRcWBXo9rv5Yu/130o7r0GzTribz+n5F1PKhwB?=
 =?us-ascii?Q?okZKtRjzY/Ic/929/rM0r3ib85q+lG7vRvb3dMQ2uDC+EWnwbqzK9OBoSk1t?=
 =?us-ascii?Q?rWbkoxFUCiGRQBXr063xFs1u7NhUnLDRfCqsxIwr0NNqWf8ds7kLfoqdstjd?=
 =?us-ascii?Q?Af4Vp9R9+GOFyz3JnIywgtCHKdJ4dL2js2uOPDrf+r/k3wIQAjIoDuHkWvX+?=
 =?us-ascii?Q?I5sj8k6GqrzAMhq+Im1z7M2KFJgosmZ7z+9oeyiNslWwtMXNmhXmUhUJSQkA?=
 =?us-ascii?Q?EZR7Gb4tBQk3xvXHI9XYDQdJMSepu4bbU8MSMopn4xE8ZSdRFrI3zkWqxx33?=
 =?us-ascii?Q?dNDLyfs0ypGM1ZM8YByfS/4o0kwTQC7dRM+5SEidaclG8Pf60Sl/KmYaFYyD?=
 =?us-ascii?Q?6mCedVTJ1GUjn9CGH28Knw7AzreIrVEEjt/p7qV6FtFKRrsd39avdRPOz78k?=
 =?us-ascii?Q?SRGwf4Mt1/Lrtg4FmKjS5gcbIpxkMedoqmaMmNxB0jNkVCmaLr+aBwXmftvb?=
 =?us-ascii?Q?nBRas6hWABHp3kFEUFgeDvnrImxL8fyJqjazUCvznuS3IMwuXec3GkPKcv9n?=
 =?us-ascii?Q?KfXUBu/2E5DrFncGCIkJbXj4Xkr1ILdlveuKh0TH0bKqL0pBOHK7HUFQ8Jrb?=
 =?us-ascii?Q?W7FofEfbhq2mK+AxgGXpdinF7zdUaC3MTezcDQEWcheJVxPaIwqjaNnNKo3x?=
 =?us-ascii?Q?RqvpDMkLUaaMFELFY1jzAs1iGW0XQVJc+vKSQ7GSJp95pAhmPmwm5x0uRPnd?=
 =?us-ascii?Q?pvjT0KZwwRuG063GFmDj8QSi5LBs9aCSou2N5SLA6oRB3OsxjTAzMAHVrlcX?=
 =?us-ascii?Q?NI2oWBAmVSwkbeC6LRgpoQY3w/gIn19/TmvBh8KWfVN/3zEgBaK2xIvMh83u?=
 =?us-ascii?Q?km1N8GkcH9rDCTC+PHy9kMR1sWzLBAvg1Mx+d8HCBAvXQUNcE1rRRSlv086+?=
 =?us-ascii?Q?lGg2RHSYJzpCc8yMTDO5cws1CwM4Sa6fqvxkvYAi9xWdbHC2HRASuYFIzg16?=
 =?us-ascii?Q?DvCTUghwVoxJB3dhLGhEhN2ml1sVmHtoAfjyqmtuqVmt3bzIYTTSuoBhSgaU?=
 =?us-ascii?Q?wSGFYE2dv+VxXtugMIfEmOPyaymtuC50rAC7xcAx6J71GT9xy76Dk9VewIQz?=
 =?us-ascii?Q?7NL2y658W6uq/RHOFRzNv6OV8iYA9WKdw/TcTPLwXvSHLtdXxmJZFSpb/Dqg?=
 =?us-ascii?Q?7TKUJSAtUMsl5VDylq7huDJHG56rJq4I9fZGT7t0nLBrM79nnyQvK4zzuQBC?=
 =?us-ascii?Q?KyiOrM1Z4w0W2E3xblBbPOKK71GEUuF4Bh5Te8DK4j2KWfDADwMT5GuV9uCG?=
 =?us-ascii?Q?eaaxLvAdokiSzxJ9i+c4T520ueowAa8Dj1A6P8Tt68UxjlqpDp9sOSv9D6L8?=
 =?us-ascii?Q?H1NXQk/LD4d6Sg92gGvnPS1iAoABxhk1iYSPSkhlfmHlUcr9La2rhe4qliLW?=
 =?us-ascii?Q?XWexZ/+mSM5y9qYzh121dXNL8FwLDo7RacShRAz+1H1TfboyavquaK0y7pnq?=
 =?us-ascii?Q?Va2MzW4Ja/AnGZ5JnGBvnrQed3CRuxY/40s6F82amxN13Kmn7OU8UFsxXISW?=
 =?us-ascii?Q?vtGXTuJNvQuE+m+5u+qVtBo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdb69577-3e17-4366-3157-08dc8aa54824
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 06:02:46.4985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MGovwLHz5KIyFPPbPKsiaIX46YwFIHx3IRH+dO+2GEC0ToqvKeicx8YOvnHBFrlANnzTmi7dAb2tZMq926nJT7u3k6Ux8yIqKeLADYbsqcinka9ap9qeIltGFBpsmdB4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8904
Message-ID-Hash: YBY66DPUC2L55EPRNC3S7CTAHARUXKM4
X-Message-ID-Hash: YBY66DPUC2L55EPRNC3S7CTAHARUXKM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBY66DPUC2L55EPRNC3S7CTAHARUXKM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Audio Graph
Card still not yet support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7b981aa8690a..acf7d92d21e6 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -143,6 +143,8 @@ static int graph_link_init(struct simple_util_priv *priv,
 	struct device_node *port_codec = ep_to_port(ep_codec);
 	struct device_node *ports_cpu = port_to_ports(port_cpu);
 	struct device_node *ports_codec = port_to_ports(port_codec);
+	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
+	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
 	int ret;
 
@@ -165,9 +167,20 @@ static int graph_link_init(struct simple_util_priv *priv,
 	of_property_read_u32(ep_cpu,		"mclk-fs", &dai_props->mclk_fs);
 	of_property_read_u32(ep_codec,		"mclk-fs", &dai_props->mclk_fs);
 
+	graph_util_parse_trigger_order(priv, top,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ports_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ports_codec,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, port_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, port_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ep_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ep_codec,		&trigger_start, &trigger_stop);
+
 	dai_link->playback_only	= playback_only;
 	dai_link->capture_only	= capture_only;
 
+	dai_link->trigger_start	= trigger_start;
+	dai_link->trigger_stop	= trigger_stop;
+
 	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
-- 
2.43.0

