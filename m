Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BCA753689
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 11:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35A1BDF3;
	Fri, 14 Jul 2023 11:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35A1BDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689327073;
	bh=9k5PisyL0vsk15EpauLqvU5jWaHrRKyAJf86s8Yf67A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PYrdG3J6vZbRXH6z3+11WGI3qZEVER9+J/nJjZEZdxUwnCh2B284ogIaoBmpPsqXS
	 WrMlEUAxXu13KkF1XlEhxQHnGA1adHK/uNZAeO55CG+1zdGzoupQtFP6/MOlJXtEVQ
	 AtQUROShlIp3gCOEHS/fgpGZHtXvI5fVSdwYxn/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 519BEF80557; Fri, 14 Jul 2023 11:30:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C2FF8053B;
	Fri, 14 Jul 2023 11:30:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23E40F80249; Fri, 14 Jul 2023 11:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2326F80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 11:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2326F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=DAf5gGp9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlRQzctFAYKaHz8kx/JqyvVd6WFl2Dm9zx0inyqfVlXLpywWj6XF6oeBenTRSB82J4ZfjRwLVowmAhCcXCsxJERoVqFsFDQQx7SW3QaQ4Cl+ljs4dPg2/n+z1Tqz5un2gJjlhTUjCbvF9h4cZUm30JHqyGYqFxZ9Ji9DwkDiZwZQX+JSM/v5ChgI4VTwH3oAv52I5q5+gelUJeImRh+zWhhJUbNCZ8z4mtfMmtU5eN4kq4EULDXqUKlX/Up01Pwtq4a2BNtbX1pTCzXZll5N3y3HbcQ4UCTV1taaKpF7aibByamy7i8j1wudG5e9vhD/NUmdbXVQhdTIUQ6fRzig5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EcNh6P1wgkwZ2UWBHovyU0LoWbe9+8BtvlkG5JX6PU=;
 b=DPGPmTsi8zB6Lmv1TkD9griQevrn0xwLBAX6jqVy6vhO4YFnfnrmCMk4jbGIs/rZCW9UxDohsAk834yEm5DMLyLjv5yTBYTUjmQzsQO1hd6VRVBG6dUYqBVxS/1YIuyOMJEt7CUnnpjBL/sLDiY7FSFjKbYyO4oR1vq8gksGKzjicVd0EA9ZZ9Nem7S6ASkJ0dlyaAgwQ/kcOh4B+i7dpCYFPyF9fnv8kfnJ8MM2XEmjRlwFHMiBkiZeDy4ytVHwrHvSwEr2DuoYiz9f1hqJWytWslMWgFFCgwv2waAK6cJ98qkCg5AC8TrPLZGFBQ8JYlfVh7clZ1rD4BYZZ9CppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EcNh6P1wgkwZ2UWBHovyU0LoWbe9+8BtvlkG5JX6PU=;
 b=DAf5gGp9hRBa8SOTCBWYcsd7cF+e/y0QAsCopSe7ieLTpOsutQeftS+scFZARH88N6ZVO4hPjJ5cFxxC6ggMSeCHHeBWpBm/ZuEWZN/tIZPAXQH0gzF04Ql2RpXDMFxx1JJV7ZIKFSpPRe2BaP+JUa8MxH/f+BBAR3y6ZWXQW8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:30:07 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7%6]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 09:30:07 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for
 i.MX93
Date: Fri, 14 Jul 2023 17:29:12 +0800
Message-Id: <20230714092913.1591195-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230714092913.1591195-1-chancel.liu@nxp.com>
References: <20230714092913.1591195-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: addd4a1b-3d62-4700-93c2-08db844ce99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	phiYkBXuQf7kRZtF+s5fg8LTEQteRz+iAO9FAkoTb5ke0NgYTioBLD3xZ0zq1Pn0Vwu3o42gmo52KnpkUVI2euGdXAnvHquNcLJckUcmce+oV/5G6WGQY/ZJxtg/0amTylrjjim20ns5TlIT92Xf/ShB2AfCCamAfEu4nAPwLuYFhsHsSNiqJ2uvrZ/BkT4kzJCRyIkm2G5ehDeweBHWOmfCu6wq3ARoYpmvbUDhn4tOs6W+2o9uFv2jH3ZAf5HlSqPpAsqlT9G85a1qQEt30o/g+qs+4NYcNzjYjHBZxVQq0asgr7wthq4CIg2G19YcfiItl16xqLsykvY/0sBEm8Yu16QhUn3sxIUOS3LU+2RrWZe3Pn2pOFvuorlmsqL2bIh3rOZNemoJ+s5uGMtWzh+zs4Ni9MhDfNcnS02F7JZL76kdmQr8XUvFqiGeK0gmOl2yMDLEUcbCpRCPzHeO/z7Q7DEB2HWMutvXsgrMuB1ub0gpVJSl78E25tseZaa18JDMZnbOrbVm7CCcBg/vvwh64AEG9vqU+PR++eycqgHng4AgSqnXnssDvqshk2d9yHayn8JtThNa0kXZFiGuf7u5+gv/C2U5qrC1PHhdtou73HFmo8Rvd+ufziSSai3YFsc870Ot15/TkGIE/oRx1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(2906002)(478600001)(38100700002)(921005)(38350700002)(6512007)(186003)(2616005)(26005)(1076003)(6506007)(86362001)(5660300002)(8936002)(4744005)(44832011)(7416002)(36756003)(6666004)(52116002)(41300700001)(66556008)(66946007)(4326008)(66476007)(8676002)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SBlA0pcQMk05t1jEXHMkgaxhyYFhwHmzRzdj0hd11Tu9KEHaNJj9/LghCV3W?=
 =?us-ascii?Q?jkctyZnm0JDeKT1sjcds76YCOUtRWGa3ikx+jmSIu9VDerk2l9HbJU6o1kuK?=
 =?us-ascii?Q?gudN0vpRKDVwLIocWrkWPHz8zKicWDJ+rueutxnfQDQtyzvLEzkpbs+1GR6z?=
 =?us-ascii?Q?KSMU+LeCpn53bQ/KpNlPuwSfjxWKgWHnWrYiRq8o8llFZbrn3CA1s9bAQpOX?=
 =?us-ascii?Q?X5AqdKqkN3nAQb8oMUqHc6wzoeRiwahEFkQZoV47ttinnU4Qbqlg01uxVjk6?=
 =?us-ascii?Q?2jpxexSnfBmGgZvsfBQqeQvy49El/6k2HF0dJUn+XAUcfNCJH9W7nPl+llyS?=
 =?us-ascii?Q?g11ZSoZ4GCs2MDVB4ObIhjwSy1/Uie1kZRJf10QsEM/9WQ1cH1AjsBZVgYiE?=
 =?us-ascii?Q?l+05FDaHkzIELsaLAJQHb4XQO5aj07OT2nEItZjTc7rrASwB1Eg374iOuFOw?=
 =?us-ascii?Q?EmODOMz/IV5Qgr23KFXtx6qYJDI3KlvS1TiIsZtOQWcuK1miCJnaGeWYOxMh?=
 =?us-ascii?Q?ou65zmtA8J5366Ce50arzAD7+rgf73lMEWYGeNjk/sHQVfmY4GUv6SXGFzFB?=
 =?us-ascii?Q?OZ1J0xxFao3/xW4Lkf9R4TB0DRH56HNRd42Q1+ldCtAT9QlBkckAsunsr+9n?=
 =?us-ascii?Q?rzyMb9cSuO999oatCrMfeZcUS9T2/nXz45asCRht1H3mSn6k6oySubs3a+Vo?=
 =?us-ascii?Q?vu0cgXGVlK4CP2M5Pm3tGEEoS1l1l3ayYvng6bhcmoMaK2DAWG4UKsUbho56?=
 =?us-ascii?Q?kGsdrXPJ8+Xym4VDbT9EOyLvGnwG8+/QbX71mlj8Eu3bKvD9SE8mzu9zfgdz?=
 =?us-ascii?Q?NffMt60IT58gymV5JqCLb7dL18dXduhGb++wX7tW92RStLu3o3jvgBbhmr5c?=
 =?us-ascii?Q?3WYHkAwQ7OZ+EI6qOApP7GfZFVujXgqhacer04BXBJofOV1XT2aut1OVUv8M?=
 =?us-ascii?Q?VJUuNDSJtOmUexkEskQWBiolHfWejd5lTObjkwEtTYtR9EPKBY4vim+vlZZ4?=
 =?us-ascii?Q?H5ftxBcoL7Z3FigX/XhcMrWUr62R68eNJuKC9KgjvlL0m1+1Y8FyfWn+hixU?=
 =?us-ascii?Q?RAl82n6YEceWmmnRGwEtbeYidCWEzkIPA4G4AUo6m/BAeJoLKB4DvTJ8Qhu0?=
 =?us-ascii?Q?5qfB87z9H2mpVFHZdAXfwmjX1dPeqq0SmsmMsrrFlO0Biwq/RNCIpj+VBbs1?=
 =?us-ascii?Q?aUFK0t4VW9k2ZyFJK6L5YqsP+Tv+MI6/0eThN42OlsTHGDZ9AdV9+wvlt0qE?=
 =?us-ascii?Q?AYUIdvB+JR72OrRag44f3FQu85EyiTvsAEzG5X3R0rzIBi4opARRI7KRUDhk?=
 =?us-ascii?Q?fLPkiVsfN9O82bCN1eBeN1mOnc+Idar7dhry2YKTy2LtNbOkHAvQFjEqNXWl?=
 =?us-ascii?Q?I3uS1h8GPlPgETEsxyXiq+4VuCPJb8UJonX+Wi1iybZ1WGwHGTS7OG+6iNyC?=
 =?us-ascii?Q?6qhkumk4uxq5p1xe4NJn4RqznTnmKIqwsVwPBaGtCY8Jly4xnhxdhDG4zHbS?=
 =?us-ascii?Q?fGYrowjuUHs8s9wnt86CWC+YEPXeW9IF2OuxKRDZlTYHkteSgbNhqozwjpOb?=
 =?us-ascii?Q?c1viPsdjcUGp6bWA1fUJL/jJmLseFjAFxSYrCHoV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 addd4a1b-3d62-4700-93c2-08db844ce99d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:30:07.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 34a1bNk/aXxEF4sSq3KH8YArKhwIObZzu21DKmHCJp75o42DtvoUSAbBO0EfSYxrMgxOuFYsS0UtplU4FoUt5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
Message-ID-Hash: HQPAQPMRXGXNMVNMDXMVJS7DRE7ANBJV
X-Message-ID-Hash: HQPAQPMRXGXNMVNMDXMVJS7DRE7ANBJV
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQPAQPMRXGXNMVNMDXMVJS7DRE7ANBJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string for i.MX93 platform which supports audio
function through rpmsg channel between Cortex-A and Cortex-M core.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index e847611a85f7..6df0e03a1d4b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -25,6 +25,7 @@ properties:
       - fsl,imx8mm-rpmsg-audio
       - fsl,imx8mp-rpmsg-audio
       - fsl,imx8ulp-rpmsg-audio
+      - fsl,imx93-rpmsg-audio
 
   model:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.25.1

