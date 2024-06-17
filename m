Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82690A19E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 03:08:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE853E65;
	Mon, 17 Jun 2024 03:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE853E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718586501;
	bh=PYLjg4Rn9Bh7IeYqQUSM3JfEsrZr2AR86fI3O/cyWWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ki64bl69DExEH11jExZ0SHhtruGoUQRxnMABwBR7ELacCTEayzmJpYMJQ8NITbDtw
	 K8ngaAHwnYtc1x1mmqYrMX0o0K+ByVNCpuGPBLvLQgY5MWI9blxe9ShMvA9mfxI5xV
	 K7HfBPfCJcVs+MGspLUGKdWikQDPKG08dKKZcCrk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E6FCF8063D; Mon, 17 Jun 2024 03:07:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0774EF80639;
	Mon, 17 Jun 2024 03:07:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 696DBF804D6; Mon, 17 Jun 2024 03:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8298F80617
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 03:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8298F80617
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QWqPz138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3R3rVgATSoVz8OlQBrFmeQDDZZFpTYvqmFkYNq6vgbOboEz3MBnMUrW+VslRqO7ZXOK1cY3IVmnqR9eRj9Qysvi193KZBEWuM1QXN7m7w3zVpfN5hDVeg2WFrlvrBR5Vc2X/+vPCYJqXWtSPxoIw0xwx2A3Ac9SNd8MviF5CQ5ikpXkUm22wW7vlNCxbJYAHkT3lGgokojvOU4l7pvclhkoS45A6nqoQ1R6iXyfek+UDh/8XY/+cpJciHejxZNyYEqp6NybLvVb2wrWSrCWLeN/O1vOliRphrRIJbiNTVuN7oJR2/G7+k/s7HAAfcZR943SRBGiUgl/S1i+FU2XSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO4A8lsP7ma7Kmz5TkZdLhQzYk8gkkJJXXTmWh7m9sU=;
 b=SB72rXSxHjmBh7WLkdaK0x/WGZ8xC+nkKj8pd1q7QxUFfy8QG0cMlIxeCj873Mj/2YsC6HrDMrLj5uxPYC9JEzVxIk7OFwuUImoCTFdMZStZdzrK7ahtZGz2TCdgSwPAMBktKZ5ZSZ7oxUHVuVx+xz2qVL945WTL+YFpcD2uduILcHfy+0W7SBlUiAPHpZy5TXjV6cEOmMr1mhuu0LUnCeVvSioN36CPv6ZRw07fz5H/GfWPuJNZJ4Vaxq1qrShKThx0EslJj5jFvsg5k6am5KoPR/jzuQ3Z4QemFjCnTfav0Y9enfi6wtwsaoLM+M79AlqNui6ocnnv5td4NvQ52w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO4A8lsP7ma7Kmz5TkZdLhQzYk8gkkJJXXTmWh7m9sU=;
 b=QWqPz1383+WG4kB09Cb6L5T0uN5WsQW6QnenvhSoBdUKaA4H7Q94FFrEvK8a5LEYozrQEHdiF9AaozWy8n/3+ywk2ruL9JmwOhPHBEhuDNxFmzd0iE6r6KQxtWfk3BOTLxdkis2QH49pcr27u9dRAhPd9vc1/DMUiskeUYB9Isk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11912.jpnprd01.prod.outlook.com
 (2603:1096:400:38c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 01:06:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 01:06:58 +0000
Message-ID: <87a5jks7gt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/5] ASoC: audio-graph-card2: add link-trigger-order
 support
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87h6dss7i3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6dss7i3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 01:06:58 +0000
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11912:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1c9127-c1b2-4e58-290e-08dc8e69c994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|1800799021|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vjku7oMsFX+fHGkFkVrW53pbGmRnRDW9xcpbxFHcRNqcQLOBufzpn2IwysDM?=
 =?us-ascii?Q?1dlhrt6I5ZXXPQm7qc1a54lQDtOvssEGFzSTXztvgWuits34lm5mrfQ/0a+M?=
 =?us-ascii?Q?YIxcVYFudI2wP8v2FFzXTW6ELsmuW510DAIfWjNW/uA4nTYkFr9yvVRrLgES?=
 =?us-ascii?Q?gTSJ1WiVbV+WG/lUyjV/zuAvGJYeJ1Pg/co0/HkzsWgqT5DxFQcILfTT2gkI?=
 =?us-ascii?Q?KCp3F3lTJK86lVWGwbXSq4au/aukMbMo67O7Pa7hWbM9vly7Vg80txnsaduC?=
 =?us-ascii?Q?vsVsRAhDYJTX7Scv4/uztMi6chnprIs49HmbVqJuZVxFsQPw50iyt7Zy4ffd?=
 =?us-ascii?Q?tLkersSgcO1uZVxZzQyJJaBvbXEFuWYhzLV6xBZCHyx9uJZ0EJYAQSfJ9Vm/?=
 =?us-ascii?Q?6zJpXEuAidugr+6m17lXFs4U8NcJJpa+BvAfoMaYlIRwNScuefu8CO1DRNv4?=
 =?us-ascii?Q?awNXZOi77yuEFt7auP6SM2FoJH66oQOMLzcnPs1SqOAFVZIvCCLa23y33Ncn?=
 =?us-ascii?Q?9zX1K/r1bFK0+daMj2ubzeNG38mQvsvqMJ5mokUTq/JmCI+kBJsoPFZ7dF7u?=
 =?us-ascii?Q?tBCynzv8Gi8FhaP2FKjnZigRufivNEYgaQ4QtuAc6hC8/Ws6MOMwkeAXvQ0N?=
 =?us-ascii?Q?7UkUSoepjrovP414CM6q9gZnwl9dLSSOMMuuPI7Eo+U4e1+i13HcTugzSsU7?=
 =?us-ascii?Q?PvReEWVH6MThQD8EQjihDL2YYvMsR5xmR7YiRnuk+5SfAs6fnBMErfikKqVP?=
 =?us-ascii?Q?FCr9CQp4QqE1/qCKII108YpuFhANrhsq6eZ+PeRDxIgERp8NIhlnWFSaxtgf?=
 =?us-ascii?Q?s4VhmelIx9PpMFwRk+p9Minmq/VJlDuHvWE7aJ28gAE4sd5qUGKMZ/E6NWrO?=
 =?us-ascii?Q?rf3ggJVcXetnu6f9vYYl4+yyeOYSc7l1AMVyYrwb/cRrs/3yaiRVT9WuurrB?=
 =?us-ascii?Q?2wWonVlk9RfLDgZiy5ptvosp+giMD0yi0YLv319a1PIjm8a2y1KLvpKtxAVP?=
 =?us-ascii?Q?DwYN7t/St/TOw81Ry3nF+/7qqmoh5x9zA48kAYElhHysBudqAd8ODK4M9Fwo?=
 =?us-ascii?Q?c4UtnvMNl0jxImqf2kneiIDd1uh70aL7H0I0RadZ04+aiBuRXMlp8O97jW5G?=
 =?us-ascii?Q?lJBUQmY7Vw5RiqRAsJ9lFFHIZLOqd7uM1HdXMhktA+shpmnX0d64BMTPqIK7?=
 =?us-ascii?Q?TKM4AR60POUg11J9WbSteZu5iQV4nmEbEFnp2JsvZlp6AEWjQKuolxTntHK9?=
 =?us-ascii?Q?RFN3WrteJGfwQoqI7g05RiQ1LujF/kQ8orz8SiKa67tUA+yz3vCj6BkG2Iu4?=
 =?us-ascii?Q?0hOuoW0t5zdY2K6Ua+4yB2Cothrp5w8dVdasRjslYVAmzQhhq/5eMHG9VQIA?=
 =?us-ascii?Q?kYyHYg8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(1800799021)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?is16zpF+q2rlzb5O6ziOCWg4tReWdBxp7ls65EVj6Kbb4OphI98D+qaiuShT?=
 =?us-ascii?Q?Z6Nmam/PpD2Ix/vZlJTwFI0n6jdJyzuTwtwZWg18hOfzHlH79A8oD54CG6Kc?=
 =?us-ascii?Q?cKKioNTiVJCtlHN9d6ugHHicanF16cVX2xF05nAfCPOIrAjAcTAyqhDDGkYe?=
 =?us-ascii?Q?OHJylG5yxbnBtd3/8hI1i9cOvsNWpSdNIVvvnJYIh1ln762jgTRHV2cH0AJp?=
 =?us-ascii?Q?kdqM7D5utW5G2p58G9zuuPYPKTatgz4x78hWLfVPoeYD+5B8CQWZLZuWjWHL?=
 =?us-ascii?Q?i621m/cvVUdkkcKGeLk3S8vSf3zj5jri+LNACoD9VsvsDa3MW1n+Hqql4Gx3?=
 =?us-ascii?Q?Y8h9ZDRvq5BbXvc/r5/STS7WBuNbpJFCjma21KMysWyU6XaxeZS17GXY5tI2?=
 =?us-ascii?Q?3ioJgON5AQ7a6SywNIzKenzvtoCRzb/mzaF8SIXLJNgaC7zPIbKfw3R6JkdC?=
 =?us-ascii?Q?KNVIj3az8HVNxr1DDdiReD6biokHIJBS+8FGO/X6fdXOGkL9iOn6ZwTtVb7j?=
 =?us-ascii?Q?o30LEHya+zXj6wlyj5bsx8d+bEDhFdxpqj3px+tgHAseFhWFrvh0oD8C8ujC?=
 =?us-ascii?Q?tveL/WeMgCTeXdAVbPdQPT3CIo7iDGzK3X5gTY1vM9PuMJgs7nyvoIVu38y7?=
 =?us-ascii?Q?iUC0hEJLtK4sWTtjwUEa3FBR7HcPokbGkwESLPQ8cy6e8ilfzo5FRdfs3l0H?=
 =?us-ascii?Q?hHoYEtfbDzWU7ROwxGoCkyCh+iM/z/iBCmq2M+Q+bWR9URHKb81wKeGBWaiQ?=
 =?us-ascii?Q?862BdIy2QWCv0F37EZml4srLJtombTjeyj43V/beUAVKHvJaPw6zXg0xITji?=
 =?us-ascii?Q?EzdnPVTF2UGWV1AvYQ9pfrIPPZFAPM1s823NgY1AjNNXYWG4m44DQQ91Oncn?=
 =?us-ascii?Q?MkICcFV8Oqkaixun3uRDes0dQ7SUOCutvwZz3G0BNyEEG76SBKmTtI9vrVXe?=
 =?us-ascii?Q?N7s+o/AOSLDz9UYTzbypI3wPZY7DqtcoykUnQ0FhqMjj8FSWZLW7mhJvYiZS?=
 =?us-ascii?Q?uosaEk7ncuc4WJGnWbsM9hHlrtjocotNpl+qDIbHd1i8PagGv6EO/YXHqCSm?=
 =?us-ascii?Q?mE4Tt8tR2djxqVtZVOz/yUJSZwd4Q83yiCDFXSGC4H4E0umD2z577G7jSgMx?=
 =?us-ascii?Q?GZvvgZ00gpgRtSLIIPhbSM4dJCkEE6sxYmJxbKX6/6aeOFj78rul7n8HtMG6?=
 =?us-ascii?Q?lF/gvrN4QCt08uffcrhQE5PicxVCRpAg8m1OY8K8aHhN75D1foDCl5Mb1jT1?=
 =?us-ascii?Q?QYWemzIIzFIM+ZFkP+nHY/gZBi0sosX5LxF3OLcH/pdSMAM7mfrDvwjKU7nb?=
 =?us-ascii?Q?Fdt95d6DMhI9W384IzUtQp0ADzoK7/MrQMOwOq1POq8yv8lQgBTc0IWacnFU?=
 =?us-ascii?Q?qfAk57eYmb7NsSWU0IDa2a8uhkvTsQ35wale2gxQ2RIWugRrAgwNNn7qL7QQ?=
 =?us-ascii?Q?hcNsNHDmMD1s+IACE9TIOufAKWOiGz77L6aRNMnIMpQxIbwYuHQMV8/a5tvq?=
 =?us-ascii?Q?J3g7ea+PkLNxkQLeYpf+I5Gvp9jDA/msRm0yg303EcKmxJLdtHF/6pCjN2JT?=
 =?us-ascii?Q?08yi8fAFJQnFNE7UB8EY8Xl/In1N0b/BeUZuiNiBFbrM7GOr9bwR6yExhOaG?=
 =?us-ascii?Q?G/G6+xG5JfhjucGOxlh2+oU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd1c9127-c1b2-4e58-290e-08dc8e69c994
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 01:06:58.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Wm4OsmR9k42ktv2IZIcczNK+hB7cr9iY+r7h/FnvNTk2S5FoK0cD+Q5FPF61DETl8Z7ejyJDsKdwltrvoQOC2ZlCPd6kvAwfUKVCf4XVO5jJoirPYUdsuwiCPztHxEKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11912
Message-ID-Hash: T44OVCDKX3U3ZJVZ2K3ZUDQLVNCT2CZ3
X-Message-ID-Hash: T44OVCDKX3U3ZJVZ2K3ZUDQLVNCT2CZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T44OVCDKX3U3ZJVZ2K3ZUDQLVNCT2CZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Audio Graph
Card2 still not yet support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 8eea818887580..abaf3c1719f31 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -759,6 +759,8 @@ static void graph_link_init(struct simple_util_priv *priv,
 	struct device_node *ports_cpu, *ports_codec;
 	unsigned int daifmt = 0, daiclk = 0;
 	bool playback_only = 0, capture_only = 0;
+	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
+	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	unsigned int bit_frame = 0;
 
 	of_node_get(port_cpu);
@@ -806,6 +808,14 @@ static void graph_link_init(struct simple_util_priv *priv,
 	of_property_read_u32(ep_cpu,		"mclk-fs", &dai_props->mclk_fs);
 	of_property_read_u32(ep_codec,		"mclk-fs", &dai_props->mclk_fs);
 
+	graph_util_parse_trigger_order(priv, lnk,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ports_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ports_codec,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, port_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, port_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ep_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ep_codec,		&trigger_start, &trigger_stop);
+
 	/*
 	 * convert bit_frame
 	 * We need to flip clock_provider if it was CPU node,
@@ -818,6 +828,9 @@ static void graph_link_init(struct simple_util_priv *priv,
 	dai_link->playback_only	= playback_only;
 	dai_link->capture_only	= capture_only;
 
+	dai_link->trigger_start	= trigger_start;
+	dai_link->trigger_stop	= trigger_stop;
+
 	dai_link->dai_fmt	= daifmt | daiclk;
 	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
-- 
2.43.0

