Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21268D13A2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6CCDF8;
	Tue, 28 May 2024 07:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6CCDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872784;
	bh=LqZ9LPai6D3tBWVmoXuklff54MKyld018/fdKZ6snpQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dyIRTbOyyx37NGfA4Zer5Kw+U3ZtxfRl76tU6/jeZ+3J11fJluSAVF7lMUBpD26HI
	 itRX1W0q0c4tkGIVsTYjA6mLXOYmj0LpsXFIZddtgiThL23WPl1vPqNyj0Bf/Hm5DD
	 eI40/1phKbXxc6l/rTJXk1iGe278uLfvW99DxKgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B9C5F805E5; Tue, 28 May 2024 07:05:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F2BBF805E2;
	Tue, 28 May 2024 07:05:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3051F805C7; Tue, 28 May 2024 07:05:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 03996F805AC
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03996F805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UF3kQq0S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATWvc+oNWeS0uF+m4Q1WyThZONjOxoUoMiTaRsoT1OfxROiE/2Wb6HTK2cTR0xB2JqaVktETpU33kWEOKTevNt6oxnSRevl0JOdCSUay5bYZGNEOrFa6AFX2Ks19W3R6tEkyvoTW/phkr1hEBtRCXoMqo9sTLxfE95ytYQ02ye271Vn7kDRrlZfSVZeBF8tHlKafdnBSlDLI/+Nv6e3JCOUEhaxwSRx6UOaiA5gMwzPHKKwZiO/PkSJCeaZTXlBBKAJQ2NL+ztqs2uUvJ5tH44ukksCq3IEw8OT37EfafFeYiMTUc3FyxqRcf8InwYiR4jHkWRXgsJ3SbXRBDI+E4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cV8QtdZqUOfVwW9JsViij6jjGVtib6oUgOQlWZMjWrQ=;
 b=ZyquGU1FLCNUvYTl5QgdKJe9rb59SOS19ZZdxcm36xq3a6FaP70GjfmsRaZyNlWIRMSRDWJYj16SPcklblt/sikgmLVtXaQ+uxo8k09a6T0Er92BLWY2LODidNeLee1QqrnGaXFRtqcENVuL1cpSlEkbRdMVnt5+IJRnQP2hOapHlnJRYtQXDWkJeQOh0e0fyH5hw1S0anIkemj39ZPg54/fzz7fvXP0mXf3fDeZjHNU1PPHHMislpwh//2KUI5hYppNQ25xcQXjegkIVdnrqtxEXFrNhHck6ThluCNl2Ev9Btn/D4kWrQrbf6IABITc+g6qpCRzYo7M8TNMh0vXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cV8QtdZqUOfVwW9JsViij6jjGVtib6oUgOQlWZMjWrQ=;
 b=UF3kQq0SQX4//DajNN0e4pwol8mRQkZ8mxqXk3zlPyR8OOYo2IzPARQAM2ns/HCcB9WmecKseC/HIveL1GtfLwwxC9RSn+HVT/l3Z0fKBsQACvQ36ZC+VU/dzjI5BTVKJMUl4spwVeWvx67j9Om2jI9yh8zxMrcRMuh5OWQpUeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:20 +0000
Message-ID: <878qzuh6gf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/11] ASoC: audio-graph-card2: add ep_to_port() /
 port_to_ports()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:20 +0000
X-ClientProxiedBy: TYXPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:403:a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9b5e7f-6204-4d9f-7732-08dc7ed3c5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?15pvUqGttBNnM+S0EXDzzIO0ID5YK78oxCMEoyvSGbWNzb92va18j1OLAigR?=
 =?us-ascii?Q?qehM65moN5DuymjIXND587QxEhBwzAPWeU7IGuojoNVYxx/cDUPLx1Zrs1Nj?=
 =?us-ascii?Q?hWlMEFmecJdIa49+O/YlqrCbAK1Ybb0rfePGVJKbIcLGems+FwfKnZU3yfNm?=
 =?us-ascii?Q?tCM/pDRo0AojgzbGJCRHSPtbk2TikuNTQIP78zo43b/g/W4U8EFSJ03eSuXH?=
 =?us-ascii?Q?XqSH28PLFaEbWt128e9ILQHnuOdPC+EYzk7pS7E/SX9iFf+1QGjJgFCrsJF1?=
 =?us-ascii?Q?RfJ5wVes/fA89B4Mm0xHsTw8ZOWeGEawrL0h3tWzk7bo93CaQA9/uFEGHpDr?=
 =?us-ascii?Q?SFOJ8uoZjLgMHc6WiKJDdWTRkMOixvEGnDY8SgFnPm5AMbA+dZkriVEr/1P4?=
 =?us-ascii?Q?VDcxCpBfNKwhpLMqDhwEanV/jlUR2fzTgy477CrtS0ue3y+wCVtqno4wLFw9?=
 =?us-ascii?Q?dgREqUIKDuSzprNMB4mE9D7ldgrzV2KPFnvV6Gt1OhPbJJJkGHNhbdWdPz91?=
 =?us-ascii?Q?H25Q8okzTfscUq5drFap5c0r++ht0c50H6DIjgMAIqkCxYwm14JRypyABaw1?=
 =?us-ascii?Q?bOD3V7ydBl8QDWMlempMCzvg7n1Kz0FVn4KeXtM/Shjmt5nLDnJV0FrryTwl?=
 =?us-ascii?Q?sfmxwCC1R5L/ZclhPQNVwuSMaJFie4UglbAHnXBH/pIYTVWmQGS/hCRpuHYM?=
 =?us-ascii?Q?OycaKBgHj46HEUkxtnECBOULPxhNCTWCY8F6azqlbQ+ok8Ve5S/AKKi3C1Wp?=
 =?us-ascii?Q?FBBky8RgMzgLDzbHhkq8SlONMa0GUaQSkcKAKH0T7tdk4JQV2Z567Q82AUcq?=
 =?us-ascii?Q?wZdwfsOGVK/igBOBBKVO65gmqa2+0vJAN+xYSnuBcA0W1us3ed8U61FHkiAv?=
 =?us-ascii?Q?E+1YOIvtnoBXPc80ceez4atwapBCBo/GD0SriwY7jq1P02k8ixn3hQLB4w+E?=
 =?us-ascii?Q?/XIbeQ3jwM5O/qtuicOh8yl+fQZ+rQljeFhVHg4kqFiKbLH7WXAmwmEYfylj?=
 =?us-ascii?Q?VMgherWQkZfKVES+2zb0PNQgXrOvnGMDsV3vgKMYctyU3Xq1WVpwculhLw+7?=
 =?us-ascii?Q?gRQq8EcHeVkJnl2kGXwuP3Sfko1XlX2dqEV+tKsuyIfFk0OQySfTHZvIGOmq?=
 =?us-ascii?Q?t3T2J0LX/LJOyvBHHner3jX3CvNSMIv7Qwhv/0StxSJG9HipQtzLI0u1nb/i?=
 =?us-ascii?Q?HdeIu5nD/qo61eO0JIxuxZKzaYSKxd+ybZPAcKE5DCJgXivcvbYMNIoPzOy7?=
 =?us-ascii?Q?OYPlkVwB5xcq7emVB+IRmB61H3wrqCg+eg1eRehckXQX0WjLH0AJj4F7PCgw?=
 =?us-ascii?Q?hfjon75WISn7bKoHE2cLe8e+TuePvUTFpVCE/IInzRiw7w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+QnbR3JLw7xMBhIq08Jzfs8lVYi079oSetjDjNLTdzexXHXBv4qBKu8Bghxa?=
 =?us-ascii?Q?Cv35/q2QOfpspacPX5pjS8CTGImUm7UcIrzKct+Baw8UueASxIBNH+iqnjsQ?=
 =?us-ascii?Q?OvAtfP1X4oRUuj45Hnv345UvZ3JUhozBUy1zR83YisLjRLP3hr9ctdNXwbN/?=
 =?us-ascii?Q?fxDtBPn0rC9LWrx2/a2+IsaXjvypzGlVv08fxyi9Lk3KhjyWLVwsLWYkLAb7?=
 =?us-ascii?Q?RZSkXzWQX8bjR/rGRSQEOTq/H6qvHXNxQ5mNh6I92/y24a58nm2H6yioAiU7?=
 =?us-ascii?Q?69st3IDYEM1kyArnCCwcQ2E4yVssIbUcG9geETFih3FttcVWh0d3BHyTXKrA?=
 =?us-ascii?Q?qeiHr5LN7IZpIFv+5MnhDQ9315LK6Fddfxmb3FR72iJM5b34DvPGcjkCUSkE?=
 =?us-ascii?Q?KSPN2y8O1kR1t+3d1Mg87VqCVWrXcScX1ITH+yMBCN2ydYlb8F3whiLeboHN?=
 =?us-ascii?Q?/5VmxlzP8TRKWPUmZvcfq7zVp6E0inB8+0aXm/JIdFzdbD0VjFBLAlB3MzGR?=
 =?us-ascii?Q?Kv3oIb6r68D+bxFqojfhUmsiYUjt8pz5fEviAlAczfFBOCavEaqmszKHGHsv?=
 =?us-ascii?Q?GvaSCnSNp+5qdj5dZmb4wU17WKU0DlXMMcdBfTOa6JULRAV8lYb1X74GFyWE?=
 =?us-ascii?Q?7yWfX4tePO8lf16ho7JLAbCiZjh95Gp906SDfIow+xk6KFNsTBNHC7Bfly1n?=
 =?us-ascii?Q?GizyJrxEs8Z1Y/KeKArqLEJcmsTFjNzlmXGYaSyfSGPW1bjNnIBWkY0j1Ku8?=
 =?us-ascii?Q?Xah6BrEAC/ezHr6ZKFuRTZ2Xnv1Y3RKc1iJ/0pJ8kVaxWUeqCBFQ5JQWJP2c?=
 =?us-ascii?Q?QbeSZcdMzty1NEdUvtrl0QXTu8LGfRE01+pHf0KfC4Iz/0+QezaWjqMc9r68?=
 =?us-ascii?Q?PQBO/vamIX7KmmpA5A+OXG3DL4UxXwe3mwyXWsswuhGC4c3RqZpU9miCZK1d?=
 =?us-ascii?Q?aghb7O+Vxf+gJ+08XI9OFYdJBpcRfq/PXhI8pAaE7CLUmtWN0mKD/kNtH7mE?=
 =?us-ascii?Q?nRPIgjDUUIs73Xu+N9MhsT1hE7Y355fezhXjjk9Nk/BftTZTgpTVKMoltnOi?=
 =?us-ascii?Q?5aJyACMyxwgdr0aKD9ObM29YHiZvDVfs63KCW06kPSyL4SxPvIHKxe9meIGJ?=
 =?us-ascii?Q?4Rh5vZkYrcgYAQJkn8bhlZreeyR3DCll2EcjTP/+W7iHQq9uzsDktp+ZbQmg?=
 =?us-ascii?Q?j18zm/Kb2lS+vp8zXm2I2HMVQwOhfmkWhsPORL6JgZoqxXnzTnDXOVZWgsx6?=
 =?us-ascii?Q?G6m4p6KnjwqCksJKb2QtNo3Weus+PNtaQxh8HQ1QPKsybUpmfVM+IyRtMylF?=
 =?us-ascii?Q?kstLnVjWgiiDXhms7/GoqIX1jVoiIx+VK1caU2dtoG7eywFfBHk4elNmgmL0?=
 =?us-ascii?Q?LY9kubMjP/fgX82h9umdsSjdBrLbTiopHGserZLBN8z8JVhvciT7RaTSqom1?=
 =?us-ascii?Q?GGK+ytpL7xWmjZwyvaVY5U5j0dbYamWNGFZh5fbORBwGZsIfGHSGtl8FPIre?=
 =?us-ascii?Q?c1gGRj+uUy7uSFMYJDukXpTNH1pbiDg5aqOUln5xNVGhL3LCDIxEykBTd9EW?=
 =?us-ascii?Q?HxV8qwXNqrGiKLx195jM1aVhJYbTdPCYvQ+JRB3dUo/kUlPyGQg1bmDRleGi?=
 =?us-ascii?Q?Mt1I2jF7+WVA2SABgEzlhiU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2b9b5e7f-6204-4d9f-7732-08dc7ed3c5e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:20.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SvpRQeONQEokTM5D4mYRUkLWq8duSENOEc5OHpOIMj08hBiL6IA1qwlBIX0YgwpJ6FKM1xeH/zc5Ln7Txp2hj8AYHgzTcS4nr23j42z0AIyzhaPeojwaSsAQiyGLphih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: 7D6VGGYLKX5445MQFARGQJ25PP4HZ34P
X-Message-ID-Hash: 7D6VGGYLKX5445MQFARGQJ25PP4HZ34P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7D6VGGYLKX5445MQFARGQJ25PP4HZ34P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current audio-graph-card2 is using of_get_parent() to get "port" from
"ep", or get "ports" from "port". But it is difficlut to understand,
and "ports" might not exist.
This patch adds ep_to_port() to get "port" from "ep", and port_to_ports()
to get "ports" from "port". "ports" will be NULL if not exist.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 46 +++++++++++++++++----------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 81e84095107ed..58123fbc29046 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -236,6 +236,18 @@ enum graph_type {
 
 #define port_to_endpoint(port) of_get_child_by_name(port, "endpoint")
 
+#define ep_to_port(ep)	of_get_parent(ep)
+static struct device_node *port_to_ports(struct device_node *port)
+{
+	struct device_node *ports = of_get_parent(port);
+
+	if (!of_node_name_eq(ports, "ports")) {
+		of_node_put(ports);
+		return NULL;
+	}
+	return ports;
+}
+
 static enum graph_type __graph_get_type(struct device_node *lnk)
 {
 	struct device_node *np, *parent_np;
@@ -320,7 +332,7 @@ static int graph_lnk_is_multi(struct device_node *lnk)
 
 static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 {
-	struct device_node *ports = of_get_parent(*port);
+	struct device_node *ports = port_to_ports(*port);
 	struct device_node *ep = NULL;
 	struct device_node *rep = NULL;
 
@@ -365,8 +377,8 @@ static const struct snd_soc_ops graph_ops = {
 static void graph_parse_convert(struct device_node *ep,
 				struct simple_dai_props *props)
 {
-	struct device_node *port = of_get_parent(ep);
-	struct device_node *ports = of_get_parent(port);
+	struct device_node *port = ep_to_port(ep);
+	struct device_node *ports = port_to_ports(port);
 	struct simple_util_data *adata = &props->adata;
 
 	if (of_node_name_eq(ports, "ports"))
@@ -381,8 +393,8 @@ static void graph_parse_convert(struct device_node *ep,
 static void graph_parse_mclk_fs(struct device_node *ep,
 				struct simple_dai_props *props)
 {
-	struct device_node *port	= of_get_parent(ep);
-	struct device_node *ports	= of_get_parent(port);
+	struct device_node *port	= ep_to_port(ep);
+	struct device_node *ports	= port_to_ports(port);
 
 	if (of_node_name_eq(ports, "ports"))
 		of_property_read_u32(ports, "mclk-fs", &props->mclk_fs);
@@ -481,8 +493,8 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 	if (!is_cpu && gtype == GRAPH_DPCM) {
 		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, idx);
 		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, idx);
-		struct device_node *rport  = of_get_parent(ep);
-		struct device_node *rports = of_get_parent(rport);
+		struct device_node *rport  = ep_to_port(ep);
+		struct device_node *rports = port_to_ports(rport);
 
 		if (of_node_name_eq(rports, "ports"))
 			snd_soc_of_parse_node_prefix(rports, cconf, codecs->of_node, "prefix");
@@ -539,11 +551,11 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	 */
 	struct device_node *mcpu_ep		= port_to_endpoint(mcpu_port);
 	struct device_node *mcpu_ep_n		= mcpu_ep;
-	struct device_node *mcpu_port_top	= of_get_next_child(of_get_parent(mcpu_port), NULL);
+	struct device_node *mcpu_port_top	= of_get_next_child(port_to_ports(mcpu_port), NULL);
 	struct device_node *mcpu_ep_top		= port_to_endpoint(mcpu_port_top);
 	struct device_node *mcodec_ep_top	= of_graph_get_remote_endpoint(mcpu_ep_top);
-	struct device_node *mcodec_port_top	= of_get_parent(mcodec_ep_top);
-	struct device_node *mcodec_ports	= of_get_parent(mcodec_port_top);
+	struct device_node *mcodec_port_top	= ep_to_port(mcodec_ep_top);
+	struct device_node *mcodec_ports	= port_to_ports(mcodec_port_top);
 	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
 	int ret = -EINVAL;
 
@@ -566,9 +578,9 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		}
 
 		mcodec_ep_n	= of_graph_get_remote_endpoint(mcpu_ep_n);
-		mcodec_port	= of_get_parent(mcodec_ep_n);
+		mcodec_port	= ep_to_port(mcodec_ep_n);
 
-		if (mcodec_ports != of_get_parent(mcodec_port))
+		if (mcodec_ports != port_to_ports(mcodec_port))
 			goto mcpu_err;
 
 		codec_idx = 0;
@@ -765,12 +777,12 @@ static void graph_link_init(struct simple_util_priv *priv,
 	if (graph_lnk_is_multi(port)) {
 		of_node_get(port);
 		ep = graph_get_next_multi_ep(&port);
-		port = of_get_parent(ep);
+		port = ep_to_port(ep);
 	} else {
 		ep = port_to_endpoint(port);
 	}
 
-	ports = of_get_parent(port);
+	ports = port_to_ports(port);
 
 	/*
 	 *	ports {
@@ -966,7 +978,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	 */
 	of_node_get(lnk);
 	port0 = lnk;
-	ports = of_get_parent(port0);
+	ports = port_to_ports(port0);
 	port1 = of_get_next_child(ports, lnk);
 
 	/*
@@ -1098,7 +1110,7 @@ static int graph_counter(struct device_node *lnk)
 	 * ignore first lnk part
 	 */
 	if (graph_lnk_is_multi(lnk)) {
-		struct device_node *ports = of_get_parent(lnk);
+		struct device_node *ports = port_to_ports(lnk);
 		struct device_node *port = NULL;
 		int cnt = 0;
 
@@ -1195,7 +1207,7 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
-	struct device_node *ports = of_get_parent(lnk);
+	struct device_node *ports = port_to_ports(lnk);
 	struct device_node *port0 = lnk;
 	struct device_node *port1 = of_get_next_child(ports, of_node_get(lnk));
 	struct device_node *ep0 = port_to_endpoint(port0);
-- 
2.43.0

