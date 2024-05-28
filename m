Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2F8D13B4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:08:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ADDCDFA;
	Tue, 28 May 2024 07:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ADDCDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872937;
	bh=BqR1rgdVZRZBTDS++jKQhMd99CKEKoOBkSZlJQabgzM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sntz0BUqW+6Lhmqox0FBhKEPQag+BrMQIHIlGWGkQjqNWmclu1OThVIqWilcY6L9q
	 daY4VGsAsJunw7t3kHInHc90MllW0y5/F03HYolxxOh/hib4dEkn+tqMaIdXpa4nKN
	 Uy+6MQagC4C6nlUnJ+smzMIpe9dC7wduRjSYRlKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF9E1F805BB; Tue, 28 May 2024 07:06:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EB16F805BB;
	Tue, 28 May 2024 07:06:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6509F806E9; Tue, 28 May 2024 07:06:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 41503F806CC
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41503F806CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aerAnvRL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+2scd2dMpnjytUqwwwxQW2+p5eDCIpC0tk0IBYxw7J/QMculldNygScmMUSkdZmehKA1s+I7gecizKeucitvNUIIPR0kN9tqeiu5imWCrbmY7PBMyV78Kk151W2Elq8nRLWti3UnSFmlDFt6OLcq4Djh/h2msDP0jI9wJVDqrnyqfX/dKzzv57aDJS0djW28KCnRv6JhJB3qC4NLD3TsIGr5GNYkXFEtDf0IO9MzdvRjOMen81F7crF97R4SDilesDSdWocGb4/XisxccVZP6Tt8CEDmK0ei4oeiZeG4Yxw3qGfMd/Ahj5FmcvatwERLqIQtRurVbJlNFVUY+GObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBc2/CbftIoy+7h4Wq+8swAi3O5Uz2KBfJxABk5G5sc=;
 b=L3s7NwRzHNRmbHWJrrwubK3IFv0Wzout7d0+E7bFZd+VBIa3bsDU3eMrvaKCFyxZyI6pkto69sIqqSTWSyXH7p85tabKkkfAPBZgro8G7RjgxH6tMi5ymnGcxHMD/Lw7/KgSlzzj1r0hDppv393sve2Zm8BBom5G9w0zIj9sPd91KPUN/6ghcSxcq04XdlI2ePQyEMUSi2pFsmsN5Vmvz2esmmGndEq0GG6uFtYuZOL072TVstBzajkOT9rmCd5g2Y1lzRKDXdWgeBwE447xrs7u1wP38h6qJtNoIG0GxsachhEbnU6c7onXeCboRxSaolLy54fYNPozumPpua9/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBc2/CbftIoy+7h4Wq+8swAi3O5Uz2KBfJxABk5G5sc=;
 b=aerAnvRLcWQOtHn5cAGRmTsF4xg8cr+9a8GhZvuOcrLQsohmUVlIbv/oQ+yKcX98vDI43vkJKw8X75ILgun7Xc7hH01gsbb1Y0EicerFpiRSSk1bh9qAxLaRpdm/AHNY8o5fzJGTR/yn+PcPbadkG5t60As+C/DkrmACOIHdapg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:56 +0000
Message-ID: <87v82yfrv0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/11] ASoC: simple-audio-card: merge simple_parse_mclk_fs()
 into simple_link_init()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:55 +0000
X-ClientProxiedBy: TYCP286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: db75e5fc-6ceb-4781-f09f-08dc7ed3db22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BuCHNWh3FMKfTdVPnrtrKdJwJjnKbO9wg2dEFrXcg03Dpj1aEOX/9PGyXWxr?=
 =?us-ascii?Q?mx73hjK93/h5ArZWs38fD+7Y+TsCy1zBcI2hLOli+QFhl/gEqFh1UEwLQe1Y?=
 =?us-ascii?Q?rveqmi7iXpTej/2IgTj8sNy5XU75/7rEIhK9RLi7FHzFAG9ALxPvsxdZNt4U?=
 =?us-ascii?Q?IpI4167Wlvt2NyVqkzm9DSTQhE5V3EqmDW9WR+5R6hZaUvd6v9+Cw3acHdvf?=
 =?us-ascii?Q?hXJ3inAJV9N7p8FSH5IFWpwZITyHbJAt1PhgsGoHL3xtO0reQME+Ebrgwze+?=
 =?us-ascii?Q?GjLrHvk1nX7LqR6FA52r1Bh6tywWcH6ED/mt2RMowRPuCCrj2SLit5Ns5rGq?=
 =?us-ascii?Q?o/0BjfxPMEC0fn82Kt0Rk1ZPBajA9EL9LZ5EfQ+01OxGa7ntoauqfOUqcviR?=
 =?us-ascii?Q?MwqiCtwR/vvOqrCCz6wj/dy84N7LdOb0Mj93Dl4NssBgNyG5/nNqdwMBJJd7?=
 =?us-ascii?Q?E8/iFG4/pYdnJzzNnVtagUUE0xLYb+knbvmlPYf0es+3hRp7hENpFc+bVp/S?=
 =?us-ascii?Q?v5TesKboLHWgmA95ZeqPwDGsl2Qq0kalQvQjsKcLNrqsGcSvkup9m8xqbArX?=
 =?us-ascii?Q?MUdxM1yFPNbhojnw+olx+6UevD1mJx51CHHgmCliaglwpjSfavFJ5G+9nHsa?=
 =?us-ascii?Q?EnEDm2c7Sb+zNlwqH/XxgNIeOMJEQbIsgd3hTKj6+1X+i9PpGLue7502zBEL?=
 =?us-ascii?Q?u/K+/K7XB7xSLbBSFXmEhjWESwK/gxwmfMIgQGJb4JO4OUvPN9aJ8oZYiKIA?=
 =?us-ascii?Q?mtNsnwokerl2AsS14G9JIyrry0gnYbWw1Wlbo269029IHmkANeZ+39q/nZ5Q?=
 =?us-ascii?Q?oqA29OELxCSBeS6bvNKZ+mvbgxSMBHKTtjBFWNaa4Du3g5ymmIGE+Doh7N3B?=
 =?us-ascii?Q?aIBMnrWQhzW4KRW3ehPgu+DhvfsnrY/CwQa36CeDztU1XqwisNwqEQCysaLr?=
 =?us-ascii?Q?DkUPHIqx9beqr6Sxeosv0mBxCZrjSSa82WipRajlsw0Nd1r0V68h4t8wuumg?=
 =?us-ascii?Q?Dq3OWmeHmVN+sYc9we43wVokcSfZvLHO5U57MRsRgZKAZmz4bqSDf3wx2Orz?=
 =?us-ascii?Q?n79yGKBBIyOt7vSXDY7ZDE71suiXWyhFH857XWJvFKeLWPGKnat8OItJqDYB?=
 =?us-ascii?Q?/Iwn37ncs3Okhemd+fV/wmU1yKKczxwuwSXPpfKlEnLlJXtfuNCDVwxQywYf?=
 =?us-ascii?Q?UXQxSX4aBucK2CpP89D1h0FwLVC1V1FfiDhdLcRUWhl6tHb2mwWicZml+Kv3?=
 =?us-ascii?Q?hutVGtZnBQYW/2Mp8oiWGws8igi4QAlyasGD9f7t//Ssnpp5eMKckYcKcrcW?=
 =?us-ascii?Q?JwlGkrA1X/fIFsD9t/rZ8dzw49TTTHVCGL0S78yC/SGGRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QfkEji81Mi3kkzDoYg8L6X7yx2NInpmaBFecl6+xj3VuLSxaC6OmgtKX5sc/?=
 =?us-ascii?Q?rjWidM3O0UCFYtLshEVERFz9m37y0VyHTbBB85ECtGnXDqIu0oxb0aO5y0Y9?=
 =?us-ascii?Q?4ai7ydLA7IGxx0+268br5Uas20aioraFNKCeRRwlSKay7MRbgaa8V5XRk2f2?=
 =?us-ascii?Q?jS3t7bxBCruJZFnCmAMWxGEhuAC0BkurtVtNSShsNITzymSGc6KRNZouobPk?=
 =?us-ascii?Q?WNhi/s+NTNHz698C7Yf7BkXe+wa4j0dCP0BxJhSF+QZsyesns401XoLcQ2Kf?=
 =?us-ascii?Q?4tFUrCNB1nIzPgGvUsYhWnIzxnwPyyukQ8BEtqLTqpSjiI4h/ZwZdD234s0Q?=
 =?us-ascii?Q?8ICVV9koja+/nMDwyFsATkYbncDRrR1xUoJ6dKLgvQkgzZnqMCCAozNEsNHo?=
 =?us-ascii?Q?581gmQbul6TlGba8Ic+3wNj65r9rToMX2aoj687vUQSQMRAzhlOxiy/HIjDg?=
 =?us-ascii?Q?9/KWgGFl5xbExPY8QJTURDT3p3yZhY5Ol7gejLL0XCwZxF6/vog4SaFRRBp8?=
 =?us-ascii?Q?0XCBKH6QUGJ6OqTxAH3DKvY+BvjxgNv/ez+CTkNp/2bC6wDAQub1ckNzNp/e?=
 =?us-ascii?Q?XWPDRTnGwFDKErR7SA6DF5U59LNzrXW355w9wl1AdMqZGHJlH4Jd5ikp3TIf?=
 =?us-ascii?Q?ZCx4QgkabxIeFNhV+++ZDpoMEp2/mzNdGPn+iayszvN0wXTexBpYvAbHvg5i?=
 =?us-ascii?Q?VXxqAokU4taGase1yErpe2TCFL/un66Oz5HD0bAlvq49PNtyUyHVM0OhU2/a?=
 =?us-ascii?Q?WBpw6S8VPvBpvBzFZ48H5ScV976JgGY2RuEiV/JjYuiTFqPXyF1G4MKCXCdE?=
 =?us-ascii?Q?n/7vcRAu7NkXFjXLTfgwBUgzOHetGo14zE2A0IwvBsds1xtlJNwGiLOooDpN?=
 =?us-ascii?Q?K6lw7hjoZYO1V8CX6ieP7cRRYno4Vwa5/7RzID+nJWRSpnqC74cDSR0Zi3ln?=
 =?us-ascii?Q?/ngCx4rpc44LZyOGgzI78lX5LGweBz9M0gcGHE2qf3MHi1QZnZddjfSFTVkX?=
 =?us-ascii?Q?zZnjxdhHIaUdnk5k1KsIeMTW0PrzoAglj3yWjACo5N8/YsCjoVx/dScnNFaF?=
 =?us-ascii?Q?Bg1dusMr5D1SDefwyxN1JKyH7qDb4Cdc9isdNDfcbaMCNyGWQ2ttKjdF7J4k?=
 =?us-ascii?Q?gILeAlM7CR2Zy2RotPL7fjCohHS+jmO4Ig7822UtqVcxN6SX+KXQEm0yrriu?=
 =?us-ascii?Q?mxZEH8lv2Dze6Kpv00cZ2iAAnR4jc/4fhJ/VT1ofuDIg7fU1PIqZTbB7HdI/?=
 =?us-ascii?Q?61rCTnVmJwBCt0JtYCICjusv9BAjFhV7/jXUVh4G2Qjcctfqe/nzEXP36Ti1?=
 =?us-ascii?Q?K3L4G2FG5H2RDGVAFVdDa+AiQKp6gLRfkSxVrhe+WPNKt4yuZXRX57nZjq76?=
 =?us-ascii?Q?FDrEG0sgcSpr3mPNLJPH+fvk72/nWiXOMYR4x04RpjW1Q/jUMnp9gMmaMw8a?=
 =?us-ascii?Q?NHnBWLdSFuKwcRoi9gC5w5PDykaJfuHTt1yTS4oa77gD/p3BmVw9JOVvvAHU?=
 =?us-ascii?Q?e1lyGXEaTEMorg9hlU2Jz7ezLET+5CKl0xuYCyvpbFnVrMmQSXF09xJ1Lqcm?=
 =?us-ascii?Q?NIlxhuwX2oijv2YDZ0joB+mf9WQ5YSfk+6VI18PawhyH1Xp78fWet5NQ3k14?=
 =?us-ascii?Q?Nr/5KzBWC15kDVftJrDc1yk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db75e5fc-6ceb-4781-f09f-08dc7ed3db22
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:56.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BuT2p5sPO86Cdxtkta64Y9DtZkfe+C8jrAPwjy2mNLF+csubAyBfcMHWzXe2Gy/99hK2ywqJhmUTAw5yJVNwEZemhAh/2epwCCLFWWI3Qnu5sRzEV09cBUKnrxHdipsZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: 7E6KRGJORHMEQPRBUSZDKCRVOZ27CLRR
X-Message-ID-Hash: 7E6KRGJORHMEQPRBUSZDKCRVOZ27CLRR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7E6KRGJORHMEQPRBUSZDKCRVOZ27CLRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now graph_link_init() is parsing dai_link related property.
Let's handle mclk_fs on it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index e436e8fcfa0f2..2de5e6efe947f 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -129,24 +129,6 @@ static void simple_parse_convert(struct device *dev,
 	of_node_put(node);
 }
 
-static void simple_parse_mclk_fs(struct device_node *top,
-				 struct device_node *np,
-				 struct simple_dai_props *props,
-				 char *prefix)
-{
-	struct device_node *node = of_get_parent(np);
-	char prop[128];
-
-	snprintf(prop, sizeof(prop), "%smclk-fs", PREFIX);
-	of_property_read_u32(top,	prop, &props->mclk_fs);
-
-	snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
-	of_property_read_u32(node,	prop, &props->mclk_fs);
-	of_property_read_u32(np,	prop, &props->mclk_fs);
-
-	of_node_put(node);
-}
-
 static int simple_parse_node(struct simple_util_priv *priv,
 			     struct device_node *np,
 			     struct link_info *li,
@@ -154,7 +136,6 @@ static int simple_parse_node(struct simple_util_priv *priv,
 			     int *cpu)
 {
 	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct snd_soc_dai_link_component *dlc;
@@ -169,8 +150,6 @@ static int simple_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, 0);
 	}
 
-	simple_parse_mclk_fs(top, np, dai_props, prefix);
-
 	ret = simple_parse_dai(dev, np, dlc, cpu);
 	if (ret)
 		return ret;
@@ -195,6 +174,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *node = of_get_parent(cpu);
 	bool playback_only = 0, capture_only = 0;
 	int ret;
@@ -209,6 +189,15 @@ static int simple_link_init(struct simple_util_priv *priv,
 	graph_util_parse_link_direction(cpu,	&playback_only, &capture_only);
 	graph_util_parse_link_direction(codec,	&playback_only, &capture_only);
 
+	of_property_read_u32(top,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(top,	PREFIX	"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(node,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(node,	PREFIX	"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(cpu,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(cpu,	PREFIX	"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(codec,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(codec,	PREFIX	"mclk-fs", &dai_props->mclk_fs);
+
 	dai_link->playback_only		= playback_only;
 	dai_link->capture_only		= capture_only;
 
-- 
2.43.0

