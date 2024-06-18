Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF95E90C041
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 02:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7952DEC;
	Tue, 18 Jun 2024 02:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7952DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718669665;
	bh=h9iOZNZhFjUZmRuPCPIZUI4OCRk70mFlSQS1EPC8CQU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lOdtoUlO80BHyDSv3BAzq14GvAOm6xKiOHRY/KLwiBufMTqG0rDeJ2UMhERVeU8O+
	 hJS64QZEOdGp1MQMCuion3GHHG+nMHU2UWCBRKNnCtawtnTwzFJgbUqIhoSqOhlnmm
	 2Nk0dJFlcIJSfRzkYSoYUpjZBeP1ozS28uPNKjs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E41B6F805AB; Tue, 18 Jun 2024 02:13:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B86DF805AE;
	Tue, 18 Jun 2024 02:13:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 818A4F80578; Tue, 18 Jun 2024 02:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 868FFF8016E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 02:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 868FFF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Kp8RRwRC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcI/Fnckv4YdFf+E2Ea7l2aGqzl8YqWiwjjuOnULXUEEktyRDM/L4PRrn1n+5jv5hatCm26DUWXOv9SlyELSSrbKRxZoC5TatnaUistkU6LazqM34rT1EsZjK7SF2lTiRsU9Sm42wF49YIHm+4G0KqM5x+ENOTgq3XALbFOwsxvIq/1Tuk3oricZbtB3O6FM3hveJsXOSWtcae9/GbX/vkX7G62mEg4DeNTrS69h1zVp4LrX8fhXcb5ZFThCka/VeU2ZiLakgFnYYaXTKCEwu0Ulwm5Fp/VNYVH7DRsAqHk8Oaq/rVBV0Pl/U7f5tjrmuVGHbrB0XRekdpLicq1pjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixNsbxYdi5qsxe7tsQlk5COlKkn8bEXkgkgakUiuT9A=;
 b=gguVM9pmnYiKfCvQN820a//j0MF6wvz3TdKcb11P9jrn5DBc+CkT1x3D3msM+5Kmqwm8Id3ZEhiB6gtZct60s6Tl7lqBYSHXQEcNk5zHxiZqNw7ERtowVvDTRf3IPpcDzeYfUW0ZvsJXkDKfj3gGkKsrU+XAZ6qoVxbecIXCOtscDCj1D9PnOX8/skWBjw9S+9eQh0NsYJTMABSlcMjk7bupEHZONxA74lkKwTAgGDdqS6PbwPtni/kf90uHOyW3aa+R5xqB7KIgptYTBW9csWAJl3sFCP41rfqz3cZ/gzuicNqM0gnpeQRtZSQVi44u22tSk2ajQnxaw83Dn5z3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixNsbxYdi5qsxe7tsQlk5COlKkn8bEXkgkgakUiuT9A=;
 b=Kp8RRwRCoGp97/TwdAI8SIj5k0VHuiEbYzN/Xi8KXot/e2/A9jI72ZHI1YqAOoOjhV0eTqssc/uDt67NCWg1MA/n5xELkZdH/u9j4mqAZkaIr/b0CzBPpt9qLKUMNHs1yYM3gDr2OC041YdUGt8oPBVhY1B0vJVFmT2gv3GDP/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6362.jpnprd01.prod.outlook.com
 (2603:1096:400:a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:08:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:08:29 +0000
Message-ID: <87r0cv3yf6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: dt-bindings: rename ak4118.txt to
 asahi-kasei,ak4118.txt
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org
In-Reply-To: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 00:08:29 +0000
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: b54ccc1e-0739-4bd4-20db-08dc8f2ac893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|366013|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yEtQkxFJDM0adnWXTwgAwtR6CA2CHND7ArVIggxR0JJB2JXJM0EqjwaXBkgH?=
 =?us-ascii?Q?FWCnUhhrEAoISYyM3uFxGDyabIewZzHcH3lBiuqQNgsjE2nO8g726xMynjv3?=
 =?us-ascii?Q?Jxw2NhgO7FyJcYT1fDrQopAWo+oRXEM13fjwX/HC8l8x7mS7JwF+KWAkU3T/?=
 =?us-ascii?Q?ooW3fEpum0vzdhnkxvFKqfqfLIS5mjZyZJkFZG97SZzxt6TEGYKfwqEEV8Gy?=
 =?us-ascii?Q?2p+tAFx6vXVsGCClLMUDrc7itruZ1hBveJjGcDBVLwNTTF7F6kEMffH6ac4E?=
 =?us-ascii?Q?wxfQ+iKfanwW6C6Ey6/25wO51lrYyDa6ud71rUpUQv10eemjawpu2Wq7ZA1t?=
 =?us-ascii?Q?xNJ9MLjucQKNdqn4zh7/FkpSGZliO+aOYDHDGHCzR9XUfzYuTAUfOS6CwgSe?=
 =?us-ascii?Q?XAl40e7/tQ0W1cziEmnjLpcaegPxFIQIPAh1hrhIsXBxbVvdtNrbO2rE9CUs?=
 =?us-ascii?Q?gBcbQrEYVM0phGwBHhPR/pl6ZuaFdmeJ0znBCPW9z0QghIqhEhyePkM8Oicx?=
 =?us-ascii?Q?6zQupeHlf4d0T8okXw4HulQhmITg6sWEc8n/PXFOceIrPmb2PvN/6GvsTYvZ?=
 =?us-ascii?Q?04zpvoRqTPUL+uY9rT9qPHPR7BzoAXFv+vPjhBxQX6+4RIkowwGvGT53xX04?=
 =?us-ascii?Q?J9lPx1Vyl0oFB/miA0vF6T1UynEuzU1FxFe5MGW7EKpm195yMQYmg7bxKofX?=
 =?us-ascii?Q?a9nfbCf9A0yy0Dwp1GXWsy6LM6R5wvoFzVC0Lslrxt/hIib7Poxe9CXyT58q?=
 =?us-ascii?Q?bGcp2R1ouYSEiMxcozM2lrGEPmhYuvzHRry33/pKiPnAYRcrmBq7gnHwh7J7?=
 =?us-ascii?Q?MgDV70l3BaQTYa5S2kfwgZ59+E/GBG5BDfsA+bfX+jsn/CnlwJ3qJ7h9JXZ8?=
 =?us-ascii?Q?EdodQwpSPbTqr1gathvm7kJifZ3zPbWAQLiCC/s7/ZvpJ3m/2p1zVsx+4J4D?=
 =?us-ascii?Q?orsLAse1FmOy8YLP6ZzTl92grKIbgv77j/ccNruNbjkJ6BqIoXotmY4kLQbn?=
 =?us-ascii?Q?QAohtkR47qdk42vevLpPEH6/KFtjE9I8EVEvmCg4MXUHOjqY6lHKUrDpb91y?=
 =?us-ascii?Q?ztsOGI/jD2Q3XZbuVKIJgYDBwtZqEGxPeHIcl9QXGNp2990V3TgDUqzy9sKd?=
 =?us-ascii?Q?PZyBQzxonaFvVqef+WzmKX/5xxs991I3V8JFaneX2qvPPMKZKrvfAlCZ9TOb?=
 =?us-ascii?Q?/51hogukuOUCIozI1eYaYqAGpwSv4T5CCJ9Ox6ZjafE6GyVgTAn3YEnFN9BM?=
 =?us-ascii?Q?YgKlSQfBNtO90TKkTWZ2R/Ifvb8Wlr83UNCyPC5BOU4WxrrJRHx6VMpxPHVz?=
 =?us-ascii?Q?Lyxl3EktXLRzKLkNhVeNOawyXL4y034l2jb667WMJD0mlrQ94/CYq++ECFeO?=
 =?us-ascii?Q?LFvmleM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(366013)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cNuXBAkX+ocOH9uXmWAqhvFbRUZce8U2inRfZf8tnHXIrNx8mUNZyzsGzc4N?=
 =?us-ascii?Q?ubgeIlCl/3m1Lw6N1P5f9DLSRCp1mtQ3Mr7Bhdw2zPU2PG4GeUV7RGXMg+OE?=
 =?us-ascii?Q?WgovVrk8R2TZ00TNVNB70dChOmrnfQGqMYW0NhKIXKrYjxF86WH72YS8KIHU?=
 =?us-ascii?Q?hBB8SIptI70WQVB8+7u8ureM7y1BmMMpDfvEwsHt1N8hqrWfHSSLD/9ZKudn?=
 =?us-ascii?Q?Uzq318oyqO7puoJtaqsXPQi5m6QzKGf40cJTIXlqFLXLQo+SCN9sI8S1Qp/m?=
 =?us-ascii?Q?x+DpNu1O9MgKuwl9MdysUDLyQbpJfmHdEUQSw0ooU3HVaFG71ITOz09Nab1P?=
 =?us-ascii?Q?goPpje5X5LtywJOa+tsgkky5YLRXsr3Asn8B2zbNhVvaxA3gqyycABOjcUGC?=
 =?us-ascii?Q?YnCnvmEBUZ09SQB4t7TKf0pynXEFQcvihenXyo4wpNg/Hmom1L1785/I+yr3?=
 =?us-ascii?Q?xz5zDBqdMmxCJVTtpyxO0PuvwX0yl4CTejCcJroNQWaM3vsWShF57k1QSDnh?=
 =?us-ascii?Q?vcVjl35jvcO6sbTxK7vcTKHqBHRHXXo2PBZyQlU6TY2jWHImpqvXqrdPJ9op?=
 =?us-ascii?Q?t4R9R3ZZ9uvp23fta6de9yEPssFvZtKkeHq3vHnS/Iy4YrTpYpE1fsh+4s0W?=
 =?us-ascii?Q?avSIE1uBdni7nJ2nEBwq+FjSDdv+vOCZE6c0mqLnO1d4ZarzSlS4R0hXLSK0?=
 =?us-ascii?Q?wb3QJwPgR8WjpCWGnyi7v+IBSSnJqzA1cEysA0EbxakYh7szHIewy3jpuOlY?=
 =?us-ascii?Q?633FPHURVxrH8lnOGwjaCJbHvWJa0UIesPQjuA/N3kwQwMIx/7CnCRoGqz1R?=
 =?us-ascii?Q?/hSK3OtxjzoPfcU+EdTQ6MDBuvVpmxhIQ/YN2x7Cg5C0YhHjnZ7jad535yVv?=
 =?us-ascii?Q?g5v3wKzkZc0WwggX0qe4m6ojRk44/Hm0XDL8iYDsyAdvYycm/8+vOKZUVyXL?=
 =?us-ascii?Q?HtAG9vtTr0aKUaxYgVsm1fpIK/ZDDbMcdPwOAz9sFDX3WWEGnWt4Pfs2fpmR?=
 =?us-ascii?Q?oy1MhWDe6JOhywGBL28CoiQSU3OPwg4UT6zX4jFM/+bxwhzvYsY3EowKrJbN?=
 =?us-ascii?Q?HnmmMQ397wNlGTkjwFzbKna5rf5tm4EIi6YZSK8is7Dq/8Up0e03oyHCmA9G?=
 =?us-ascii?Q?b4r7UhmpE/Hk3om4gyTSBwJA0PkuS61rPwkC3GfwtRMm60x/96vjWbIGZMjT?=
 =?us-ascii?Q?j0n7IIwmEmTSXqi9z6aWvNOTns0/WZ27N5Zz/1KDou/8tF4dOVOv4jzXZeDZ?=
 =?us-ascii?Q?OiqUB0liOW0z78zrdnEJK3E92oie236dt46FY4MHUmdBMd65cKleA27fOxZe?=
 =?us-ascii?Q?YLxeRAtjckKM67CPLFu+u8kAns/y3gbd26W+dLGyF4GQqiiCpfVhlANisLPv?=
 =?us-ascii?Q?JDwlrIx2/uzo0HsHx3zYcA6XmbcK88n7DT/54uBRLhOPu5MA3C/jCSoaVFCN?=
 =?us-ascii?Q?cnxCz3HeLVRy072dLkGypeWweL+/8Jjh0byDW7MDM+SEyLGXNKvQTfEYdBFN?=
 =?us-ascii?Q?pjkW1bqS1h6dS8kMCPzL2LykzgOU5o/NS5dKHj+gx4JKVi1FRwbwkzSnEYEg?=
 =?us-ascii?Q?aZ3d6GQzSjYjWAn7SoioWixCNoCrBb3ut6kYYupcPXQ3l7s06xifB+NgsdCA?=
 =?us-ascii?Q?5hgCc9qsmWXF9TT9fhkXpxw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b54ccc1e-0739-4bd4-20db-08dc8f2ac893
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:08:29.7118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Z4qLDMx+ndeUKmQDRvmbx+g3Amighpl8/4/4JCYihl6WFI6Gzwy8PfNS7TzseWzq1wYsgSufHTBCPKw6vHLR6pBIpG+N6NOENW1ZmOUskop73DjMGvDhYuu/+p7btDG4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6362
Message-ID-Hash: UZAAEBNRMKTDQVGDITAFBXQRQDDSLP6R
X-Message-ID-Hash: UZAAEBNRMKTDQVGDITAFBXQRQDDSLP6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZAAEBNRMKTDQVGDITAFBXQRQDDSLP6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/{ak4118.txt => asahi-kasei,ak4118.txt}         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/sound/{ak4118.txt => asahi-kasei,ak4118.txt} (100%)

diff --git a/Documentation/devicetree/bindings/sound/ak4118.txt b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.txt
similarity index 100%
rename from Documentation/devicetree/bindings/sound/ak4118.txt
rename to Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.txt
-- 
2.43.0

