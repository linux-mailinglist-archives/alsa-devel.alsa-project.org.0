Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37078D13B1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893CC852;
	Tue, 28 May 2024 07:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893CC852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872890;
	bh=lgI2FIKXvgT5jvT4bKdGCZd2zAbRWI+HgqfJs1r9JWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sw9DuA2J3E4awj/h2unINtAoARTyNQH4IjRiRaEeN2bwKrIzirtT+M0v+PJj6E55q
	 PnzU9YCuXYi5Ulef7UpI4nsQIfjAogvuwm3e2lT1+2Ew5ait85OoBGCIZ5GEwY0F7m
	 u8tq9MNN9HY6SnyqnFuDxGMJgrUDFrO4nu2Da5jQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDE6BF806DC; Tue, 28 May 2024 07:05:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A6EEF806CA;
	Tue, 28 May 2024 07:05:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60978F80685; Tue, 28 May 2024 07:05:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 905D8F80687
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 905D8F80687
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=offchQG0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNr5oj/ollwsAdpzUQqBX57mdopxOl6iwnsBxf/XoPUp7ks0xu7m4Vli7ter29wvkI9mwDfun5wnsaHOqaUdItqMt/BBd2e5iXWSVtXxTMgg1/uyM9s7aS7AcATctAfQs+YwxAuZWC0H+rQF8+TIk/vJjdBX6gf/GbcB3RXlMOQ+68yaVhXw5xk8F2iYCI+b5xfK3fuPYfCcXHLbw6d/i0N8pF5/pYL3sNwLfwxSwBtyBZ/itPtkjkj30nNjn5sAlKg7RWwyGMcoJndextzCK/Spg9Ppq2oll2HZMNYBpWUQGqLJ/5scHPRiZMl8xRWfcX5YqJY96Mt7d9cGznyw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjkBk4J6OiqTGMYfdTJ8ysuAAV6mFTe8DR0z2rMzuMw=;
 b=hnqq0wAuJ1vrYx9UCv2ZthRAa/ryHjhZVKmu2prxkQpBe38eldRvjhJPZ+702lmF9RWvKZVzLF5F7+hOxcKMLtgzDC4Q+Y461ZNXFJadFXL0S99CDV8OZyXyYy0N8FSGcnbJZJJqNXYkhAGLy52a0nQY49xQgzZOTuAshKYFSjiBUDMxG1GRCO2CYzf/4LuWeKdDXco0iwIeVLbqsmS/JzxXfkbnZaqzfB6QienKkQcKQoSExkBI9znXMo5nhw3RPprPZ6pQpUPctfNfeVDGcE+YMP5y/NDqP+ddSwpjborpuPcEvqlayFyNc2N93YCNIfnoNSxlVrwvatSgRegrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjkBk4J6OiqTGMYfdTJ8ysuAAV6mFTe8DR0z2rMzuMw=;
 b=offchQG0+6m0WQaZ1hj2U8uegavTSlXdjZsn01AhvAdndfyewdi/o64xx+AaBamhHy7imrd1ONYDc15zw+cay59dZAbSCdJmSYOgsyj6cJ1oj4fGgS/DIbpmXo1pDDRI2qXpLSZ7KPucVj/NUAFBrbauLmLXPFgKYpSAjTVwb0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:44 +0000
Message-ID: <87zfsafrvb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/11] ASoC: audio-graph-card: enable playback/capture_only
 property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:44 +0000
X-ClientProxiedBy: TY2PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:404:a::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2ee7c0-962b-4486-fa31-08dc7ed3d448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v1zLmmN7i90RQunLdDkCnUg17eLwnf1ysBezwV54FX9enPWQPfWKqkiqCKZ/?=
 =?us-ascii?Q?7vzpdk/Wjrd6fGRDmzaLLBHZlrYT4kV/uJ0tJtq0Ob/nedIi78W0rScEb+ZK?=
 =?us-ascii?Q?t8g6VaXSNCVZJnMptnZfifJJ2le4+xWWLJXkmYtzbmZiwmphRUkbG1vjtFx8?=
 =?us-ascii?Q?CRvhoWYdJycVpQAkwbydu/n6cflSgyH0UZ5UNG/gM6HlWzGRXxCJa2Au7wLi?=
 =?us-ascii?Q?m+4g8kvvSobya/GgKL9wkku1GSqiiw+/qttNO3DzRI0Fhoi8kJ225W6Mf+fe?=
 =?us-ascii?Q?qA673vSPKljXSj9S9QTJwSc7qg/8trhF96uYdGLv/lJy636A4fP7hnAFHJct?=
 =?us-ascii?Q?A1wIJMQTMhguqhJpFZ59Ao4OBMhQXNGJeUBg0d7ybe58d0GyyNbz5Zh3bkPj?=
 =?us-ascii?Q?v+CTqjVM1bAVphi/goQcH8jhS82pdruQPDKdW83oeslFsaIrGxA5H3erWgaa?=
 =?us-ascii?Q?FTbtZSlERWTB8vDoSIC6WfN+ddWkyhzlzpKXnC7B0+5AOm0PsiYPDzbkFgkv?=
 =?us-ascii?Q?sc8Xc0lcUoqfK0mI8SFN60Nw/QKcOZaqLI6zAbBe9kJf7nZWUhlCtJBGAlyy?=
 =?us-ascii?Q?rcIQ/4D68uDVLg7gWvbzgnM7OWz/N12pOJQLUw0a6e1pdSjBfXHi4SgsX+dr?=
 =?us-ascii?Q?aUW/NtMSXaoULgyaLgkXXDpSrEqKV7PpHhsan8Pl9NDgcA7ZHJkLNdOQHlSN?=
 =?us-ascii?Q?29BCDhDplv0c4HwOdkcEVFU57ygaIXg7MhEY0uCYxY780dgXxiP0wsayRZFY?=
 =?us-ascii?Q?Cd0tnTFxsoBxDJyZkHNvR/fyw9UlptOBL8s43RHYW8977bm8CuSWXWXzvWAF?=
 =?us-ascii?Q?B/7+jzvwamGKDaw6eRsn7bgVs7h9pRN713y5xQeC5aD1EgjuS+Kq3VjhExi5?=
 =?us-ascii?Q?7EwtLhqAxjNixCtP7tekdDl9sXtQplYwbwrUri0ScrJy+Q7RkRqIQeh4DN5G?=
 =?us-ascii?Q?HX09tKwT3QRIsAIsDYtba4vJGV/R2M2MjxShOB9iHtRvDOkbOnqRCSw76FmV?=
 =?us-ascii?Q?SGScXMWJF/El7PKQCNpdpfOVMNMdNJ56dYr9G2myB6JOmH1X49I57IAEgrao?=
 =?us-ascii?Q?RAoRK66WZl3kQ+IzzA55DGyc90k6VVvIg+R/HVAx0+wWngwCYpUzJAUr4eEY?=
 =?us-ascii?Q?yDG1j8n5k7hv+mxKTy6ZmumB9C7+nV3/zATIBCHm+Lcac1k9Vm7sFB5RjXMQ?=
 =?us-ascii?Q?Nsoo+VoASfyfUex9D81EtKNCsuCl74aDxu7CQ9fUgYdSTrwwz0Mi6E8P8JZq?=
 =?us-ascii?Q?DpSX3PW/eC3NyOJS6BPG+bdL2aJNmHQYuZZy/d2e+CWMGjSDUT8eUZ2dKZIk?=
 =?us-ascii?Q?LLpp5aaciZch/6C5l3o/Cpr8XeoF54n3ICCEEnVqA3883A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FBTMxrvM9Z2fTl5uTtF7Tg3QVF+7mmhq+T/A7KA7LSjjBIfU3jtSQVnBl7u8?=
 =?us-ascii?Q?7cKUA3DYlHHS30zrErzFoPyYEH2CJioMqFkDdFDcpKd2FEqhnjVqO4VvNS+r?=
 =?us-ascii?Q?RoclhV9aqM8AezbRBL60CXJvAtg4uOclJgqxpzexiYzbxMQL2unY/DeNT0e9?=
 =?us-ascii?Q?WSU3QUTlcn7vyXGOVg74d2UXzzWDmeYQ6hIpAVnzXDIkgHaaNld0GeUppEDu?=
 =?us-ascii?Q?Lf6hxulMiIGJJH4iodbl43lxOswnNxydVY+zxLVl4k0wrUFHD43NUojLqpRU?=
 =?us-ascii?Q?IGWlghgp2pSRWdmJG2Q8j3AeS63QIouL0xuciUMaCnBnHVvSE3bjZcKedg4M?=
 =?us-ascii?Q?AKsG/odplB4UgDZppolyRQO2VLJlPHcELeUh6weWQqtEMed53sn35upIfoHa?=
 =?us-ascii?Q?qC28gOQB5z1Ph0nBA11ExntPc/w4CnaDc2KLvq8E6wcAV0oVBcFFU9eyws3V?=
 =?us-ascii?Q?ABvs8DlO771RQ7N0lM9ExNk8z4QM/uYPmMSKeNQwl7dx51zWM6tshhV1kZFH?=
 =?us-ascii?Q?Xj4GX9xsj31wqkxnMscxkcbl/nEBGQJAV5keKqH8B17IfoPggQl17cxNjX+f?=
 =?us-ascii?Q?YudTOGn3fVcGlVqoXEWKCibsDVd+ekN2oTOzqlKAzcFmK6/uvmDFezzZaqjO?=
 =?us-ascii?Q?R9pAvAdVhQOs4P05/GsCR7LnfJEahkDp+jKHHy1pnhiuW/ZS84wiCTHqv6Sj?=
 =?us-ascii?Q?91gC1lHJRCsmd9Uj1dLsK8v6r0ee8njDma1W97lD2k7qOEU4Iyh5xXpo9CFG?=
 =?us-ascii?Q?TeSMWSdfMUFhEF4QXf6vKp4OcXMvo8NVm8OZueZy8C0Uw+oAUP1RJez+uOYV?=
 =?us-ascii?Q?/MXDT0nuaR6C+Cn8nxejFqN3IS9CoAWQFgB6yrBq1jJ8a35iX8vQfn2qOmA+?=
 =?us-ascii?Q?uB+tGJGAAqt6IGAIRkYBRXUYYJMrgfrdgqL6w2MCWEN7qAql7Q10mQbagK13?=
 =?us-ascii?Q?Hj7kfjwwf2t3WIVikvZFzKiAj3PlJtiwwrlHEw986WjJfUtEwdFZAvRXExeC?=
 =?us-ascii?Q?0dMpL2mtutEHLKF7oCHBegf7mv/jUNAIq6n2zVKqRnBB5KCKE9WVSadhb6U8?=
 =?us-ascii?Q?TYwV5yYLW94C2PrXlqEwRygzEBJCxD2ArMu4me0GVv2ItX0GxjndEyfwLaYa?=
 =?us-ascii?Q?QQ24MHU6TsTfDu7Rem5U3rjVXaD1PG6iRDsNN4aKndxonH5rzOXInd+fV9ek?=
 =?us-ascii?Q?1pojfHyNXD1zTHHmOtAsNRBY9y9RTYI9GJgdHfQ5OD3y5hQgxJYUd+aGCypQ?=
 =?us-ascii?Q?DrJDOXuT8Yc+3kOsqjqR5j50cVUEXkcSP3T3e0EfVkOPP7nkvTI/TsA4fxEO?=
 =?us-ascii?Q?nPezrOPpot0GyHN0jK7Bnds6rOnlGtwuRk9HZXsflTh9uPSeANZVCC/BMlDY?=
 =?us-ascii?Q?qQgzaKvSg1uXRe4jhPHulRzDHXSiVrntpKgeZ1RFmTNKz1hEiUJk4x3KnF17?=
 =?us-ascii?Q?T5mXDOb3FrZdriMCELtUkZQ2ZFXpBiNruRUYDNEfDWVDZSs/5HwNde45hK5H?=
 =?us-ascii?Q?sLUrui+TP+dAnAjEB5zMrk/eHK312zemyI1fEUHFdF94mFG5njOXxhHr1np9?=
 =?us-ascii?Q?Nd5dczZMlc7lhuY2j2NqWnmntzqB593bzI6zX1QtDIQ9AQxZH9iMdSUnGZ7q?=
 =?us-ascii?Q?W3Kfx/AGMJCfRcr55JUqMvQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b2ee7c0-962b-4486-fa31-08dc7ed3d448
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:44.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 se3cExhAbIziXOf4v0+TI3S64PNxUWoJ/g8VCAulW6QAW6naBTRYj2aty+I/XINcoIZ9pQoR3g6CxiiWbV//e2dbLvqEImAIGMhOByTFkJErF1axgkIs4dIkammHOJga
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: 342B5BQKID2IWVP2JYOJ2INGPULXDI24
X-Message-ID-Hash: 342B5BQKID2IWVP2JYOJ2INGPULXDI24
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/342B5BQKID2IWVP2JYOJ2INGPULXDI24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio Graph Card2 is supporting playback/capture_only property,
let's follow Audio Graph Card, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index c60f001468591..6a19e40d2c4aa 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -149,26 +149,44 @@ static int graph_parse_node(struct simple_util_priv *priv,
 }
 
 static int graph_link_init(struct simple_util_priv *priv,
-			   struct device_node *cpu_ep,
-			   struct device_node *codec_ep,
+			   struct device_node *ep_cpu,
+			   struct device_node *ep_codec,
 			   struct link_info *li,
 			   char *name)
 {
 	struct device *dev = simple_priv_to_dev(priv);
+	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	struct device_node *port_cpu = ep_to_port(ep_cpu);
+	struct device_node *port_codec = ep_to_port(ep_codec);
+	bool playback_only = 0, capture_only = 0;
 	int ret;
 
-	ret = simple_util_parse_daifmt(dev, cpu_ep, codec_ep,
+	ret = simple_util_parse_daifmt(dev, ep_cpu, ep_codec,
 				       NULL, &dai_link->dai_fmt);
 	if (ret < 0)
-		return ret;
+		goto init_end;
+
+	graph_util_parse_link_direction(top,		&playback_only, &capture_only);
+	graph_util_parse_link_direction(port_cpu,	&playback_only, &capture_only);
+	graph_util_parse_link_direction(port_codec,	&playback_only, &capture_only);
+	graph_util_parse_link_direction(ep_cpu,		&playback_only, &capture_only);
+	graph_util_parse_link_direction(ep_codec,	&playback_only, &capture_only);
+
+	dai_link->playback_only	= playback_only;
+	dai_link->capture_only	= capture_only;
 
 	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	return simple_util_set_dailink_name(dev, dai_link, name);
+	ret = simple_util_set_dailink_name(dev, dai_link, name);
+init_end:
+	of_node_put(port_cpu);
+	of_node_put(port_codec);
+
+	return ret;
 }
 
 static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
-- 
2.43.0

