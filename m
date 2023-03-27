Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D275D6C9A95
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 06:38:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8F883E;
	Mon, 27 Mar 2023 06:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8F883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679891936;
	bh=m0dh0Xmm6L7vOw9y6bh5UyCsIwzLibYMYktuzZGZf/w=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nyAdBFgTAFWh5LDh31KNezeVeV4dsjx7udNqcsPnX1GpE3Qg3Qz5ESTlhyx81QbDA
	 o26X4GA9yA3trO+cS2YWvNNZ2jKIYF1dHVW79xeuvvab0XJxqVBkjoueTngwGkqSKF
	 OZpK3dX7aY80pUTWUB9zQyrRRplDDCzzMysU5Htc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 402DFF8024E;
	Mon, 27 Mar 2023 06:38:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F355AF80272; Mon, 27 Mar 2023 06:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB3CCF80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 06:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB3CCF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qr4Hu56z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvT9YjY+BWV4WRuWXHv6UWdUTD0I/xdSz5vaDttBuIoCJPvPBeBFK9BnxS1mbLemOzeggLbol84eIvCbsLxHVuBy9I6NLLTRt/eyxcMqGZka5LeqdgR2Br/ZRGI4B/gyvEfYfqcAVhbFAICD6tVbcEkQxzdyrv+sdxOCbGDESH2Ov7VopEAfI+X8ZQhcq8d2MrjvgHFla42P8e14MJjkVMFIx4gGzj6lSyS0neS/VRFlVQEDB91kpfE6T/tKqu+10n/xI1joQGZFcMGeu3VRqCyXveXRbGOtSs3SKPfiIi2Pt+plFHV2FpxA6xYXmw0D2+pRuQNp0UcmL+qvdAA2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdNsUbKL5R3rr90rCFw4UmjDI6q9Bd/fCF5oSc4EJJg=;
 b=eRkoIa6tqhVX31qkOEUn6Ay+BcFy5FP6DRt/6cCyoSzTCA05lg7FpcY/LnXRmcrMlujulsM+LgmdkK2nxbmLp/EejMFXtA4FXM3KpwjHTH1BfPuv/CJ7a3dZ1tjXXu6NBCn1Y+O94weQPd4eZR0ZX4X9g1Q0/H0Hl4xwtyghcO02eK2+uulMzGCsWWTJec5tEBjDjkFyAAaNI+N4MNaHxdCl/3Fay8XRh16GCIbSDp26/RT32fI9crlJkisJjVZQU/dbH9Q/Ug9Df+uRfUDQZboNmNeQh+UjGzzaJ2KJeaZxYUjYXlLXmCac41pp1yBRn249XnrKcB3Q1IKDzA+JJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdNsUbKL5R3rr90rCFw4UmjDI6q9Bd/fCF5oSc4EJJg=;
 b=Qr4Hu56zG6UP/STrzu0PUD1KeOrTWV/UhpjXtj2iRFID7c5n/idUzH+2FpBfMiTFnIevrh0syrYk0fbR8SfbI4BRziV9HQUUqRtAVCXRnqCPz0zmB+VS5QNy+R+3WZ1tlFVrEsSXEBIawtTCx8PcVbd/0nrwCKisWq7PRsm+AsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11673.jpnprd01.prod.outlook.com (2603:1096:400:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 04:33:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 04:33:41 +0000
Message-ID: <87bkke7qzf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2-custom-sample.dtsi: use card->name to
 avoid long name
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 04:33:41 +0000
X-ClientProxiedBy: TYCP286CA0162.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11673:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5f7c3b-b8cb-47fc-abe5-08db2e7c7115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mTw1xFH6c6jWRWHhSS9RYQ0pHKI0IsMKLYAR6BljiZAG/FN1cl770tQ644lcZA65bRAYGtABYnBEh9LLIS43A8Sc7+WRl7jH9Bd9kgmGY2w/4wmLzeuydM30zlgfbYHK9bB3e3r9Xq2nSlq0I6guK2u3mLYQ3Vjj2RFP5IpvRRgOVg/GuOcwwOglMUkvWZmfnoJ/ZP81g1snj2CWNQfQ9kN1ej5kB8Hjee/WWat7bmZVl8rMKkdsuYVNz2ibyXBROwSpUPVc2X7Q8ReK1kisYep21wGdGwm1qSEAmPzOgQroZg4nsF5E+XNtwwpTWB0+N0LcGICclvXS90QFl2iPHJrAbzcxIOuleENIqTLe6sUQ6YtygHAqKCxTtZ9XaA2JTpwtxuqXDLrnH9psPLoqcmvlNWb7EgPMXVlRKxOATvDlLILVShNhhWxkvD9b5DwSZae8tWC0OqnBDXKJ0UVfNURhHVUlfxgPucW5gkKhOaBfuZ92d0hZRp1V9pVvVnLPg1+lCu1En7ep9iPaEN6P5ceo53cUxH4/Y7i5qWcfEsJsPuxgC3hASMdpJvahKbpL1sNw2ydlSrjuXA6Z5/cjUCxTa8r8oPwkKUd9jtmrJciGIcvG7iU+25ldy0sZAwMn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(316002)(478600001)(8936002)(5660300002)(36756003)(86362001)(38350700002)(38100700002)(2906002)(4326008)(66556008)(66476007)(6916009)(8676002)(66946007)(41300700001)(186003)(6512007)(6506007)(26005)(2616005)(52116002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+eKibtXOHUENyqnzo/1Q6EyqIldBxaFmHkFIwe5yfCXLIRC4Dz/I7g8tm8XB?=
 =?us-ascii?Q?AsjFsEF85KQXOwgRgz/omVYEOaDfuSZpVuPSjRhvtK8A5YEajgSOP4Embfzb?=
 =?us-ascii?Q?hex1O8ghcSK6lnM+CMdeWjOVB9Q4pbFNQWod9qYlPmzTwSDfVicVr/D3nzpJ?=
 =?us-ascii?Q?hJWmIdinZXK7v6L+WjhG26xZrPGOEnIOknhsVimwUz8MOLNuVhpBSKPa2luM?=
 =?us-ascii?Q?7o+VB2rjDeRTN4BwzuEwtKCKOpg5R9m8yG9K8G0kOeJBaXp6g5+XeAQ0UtOp?=
 =?us-ascii?Q?IyDxnOu11vCfwfkxUvXosc83io2qTYTpC+i0T3LL+6uYQqbL2sDTdM2d6XAI?=
 =?us-ascii?Q?CTFaiieRMcWCqaK5xugQM1hsSuHUTdt88oD5mzBDYZK5Dqn3sDLYo//HjjDA?=
 =?us-ascii?Q?btePheITjFiBULSARq8S2wn9uSLJfLYYrP5YijBZcpxQOKANLH5vVuxULz2u?=
 =?us-ascii?Q?lcXixQcf7TkTybN1szYh/xIMyu0XsNGT4EBT+aMg9F4nDEg3SzDGAduEuihC?=
 =?us-ascii?Q?ZQN3xfs1uFdjpCNROKDAb3/gzcRrIjPuGYmh7yw5JCwSCk6pxdGl+8buy5U2?=
 =?us-ascii?Q?2Wezb9Md8WpdPQbW4ljBlbaELWYqTU6/63/bRbyiIxP5fyLIHeFqM4pXMlr4?=
 =?us-ascii?Q?C12FyqZE9ghNuA2+Gu82Ug9bfyPTbM8qNnIvCm2CjZwXRpCNoFt/DiwIVdqn?=
 =?us-ascii?Q?dch/yhu9j/TFxxpyFq6R7bqBzfsxC3hv71lwWrsBGnNZ6vE5BzC1DQ4NBU/U?=
 =?us-ascii?Q?yR6ES3bZdV8eu/DNmHv+eOjhWK8QsQcaZYc/3d3QVYi/h+2yJFLUacUPwS71?=
 =?us-ascii?Q?Ymmz5j/IY5yZjYp1nxG7Kz9ERKoEslTDE3S7oJyMgq7pNbPxdmh0DAYXxfD6?=
 =?us-ascii?Q?qUDVb2CHxwTPfCcyS+/yuu1sZWqqDXTJRle1gsYT569iEnknzfdQ1jkeuSO6?=
 =?us-ascii?Q?kzBb/kWJqq8qu97YzmoG88bey8f4PTtHlHLhNRpVpvOUf222wrY8A+9LTiGh?=
 =?us-ascii?Q?a33S/lqG0B7Y8/HdTOUAnj8rLOBdovHdXWh6jGTW1HuS22v1ubLpyb0bFNcV?=
 =?us-ascii?Q?3vmY5xQxg2ZYMlly/YaFUiXuPGSigv95SSpICg8YhayjnYtmUmIYxaXtZ3GI?=
 =?us-ascii?Q?hYQenbi/fxrKhFeXEaW2S88sNl4hrIJj9mZq/gcLr1h/Zx8T1/K1+X26d8LP?=
 =?us-ascii?Q?U02hxDB66GVZ1OTbVsS5KtXeXQ+61QwlyPEfmJPzFdEDQ+YF2xBMibbc6SxZ?=
 =?us-ascii?Q?NuPOMuQ3jWJAyEFXr/Qpzl01swwsTwaGuWZgiMoEhVCMMfMhLMKN/GwCa1rD?=
 =?us-ascii?Q?ohnSZfuqc2aHR9iHh8rDKepWdr02foBxyoBng3JZbtX+sN/Ym6WvtjxxOKPK?=
 =?us-ascii?Q?GVZmF1kqnwT6GYbwG/MVBuHyXZ2NI+rEkc7AP4QbmJOoYCT2GwXKUxJkRpcF?=
 =?us-ascii?Q?6HVdylInrRg7zW2cYl6lorbzDyp2VNb0V00VPRnbCAUZqjbC4a3hrJQDKA2R?=
 =?us-ascii?Q?I33OhamKAi/n+NABs26WE7nN5Z7QopbSqzszK396HmtPLcfOTLvdgsnvCBvw?=
 =?us-ascii?Q?eZMfvyCSnpFpCJ0tq9t26V35MqtXKPyOh9S1SBUDz3M0/Ku8loT9A+tT1wLv?=
 =?us-ascii?Q?xZKm1nEcN4fYiYMYhRYxgi4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a5f7c3b-b8cb-47fc-abe5-08db2e7c7115
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 04:33:41.2290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Mz8h6iEbvbPjRFnAaLtDwAJjsri+57HNjWyGJ1akRbpNhZvr+8U+cPzBD4hu5eKNkwU4+Ytz1TnabiQDVyKihC0Wjq5UmCuiQz9auUbDhP1KQNM/1ZK1qfSForup31yg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11673
Message-ID-Hash: FNXOAEFKAHPKPQZMSVV2WDI5NDUVDMX4
X-Message-ID-Hash: FNXOAEFKAHPKPQZMSVV2WDI5NDUVDMX4
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNXOAEFKAHPKPQZMSVV2WDI5NDUVDMX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current Card2 Custom Sample will be too long Card name, and be error

	audio-graph-card2-custom-sample audio-graph-card2-custom-sample \
		ASoC: driver name too long \
		audio-graph-card2-custom-sample' -> 'audio-graph-car'

This patch uses short name to avoid it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2-custom-sample.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
index 4a2c743e286c..a3142be9323e 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.c
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
@@ -151,6 +151,9 @@ static int custom_probe(struct platform_device *pdev)
 	simple_priv		= &custom_priv->simple_priv;
 	simple_priv->ops	= &custom_ops; /* customize dai_link ops */
 
+	/* "audio-graph-card2-custom-sample" is too long */
+	simple_priv->snd_card.name = "card2-custom";
+
 	/* use audio-graph-card2 parsing with own custom hooks */
 	ret = audio_graph2_parse_of(simple_priv, dev, &custom_hooks);
 	if (ret < 0)
-- 
2.25.1

