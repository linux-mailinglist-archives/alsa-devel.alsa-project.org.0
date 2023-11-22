Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9B07F442A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 11:43:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D32A950;
	Wed, 22 Nov 2023 11:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D32A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700649813;
	bh=z7JCud6svPNddad5+yYsCcg0vSxaAPs9fQcHBDElE0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P5h36uN5qBYDlIA/lkTsQZ2eSjqvo3MbmDYGyhVfcuXf6ZGSPWtDsAZFTLJu1NEMu
	 NzMZBZ2xutecC1zBNwQ/l6KfG6VnjjySGLsOAzwa3qejhnHtI/o4gzqrQZvASFA9SO
	 5M+hUBgPeNEUNlDbqlJUcH6ReblvdGAcO2KKNoco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B02EF805E2; Wed, 22 Nov 2023 11:42:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92CB0F805F0;
	Wed, 22 Nov 2023 11:42:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C39DF805A8; Wed, 22 Nov 2023 11:42:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 275D1F80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 11:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 275D1F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=jOqNy5HT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+2Pi0/8lUTKP5mfSjrCAC8cRtAeupzWuWmg6J81D79ORtpLRamuwtVt2m6TOoerLwfNCurKwollZ8cj+i/7tVoaxhnxPLvcwxBsj4begXWGx3+mcVY5uH2PSy2PVy5MPG6kvEdjp/ulL8Rm3iHKOeP10ggGmDSr9lHLp15eSYXXlCOQ5/yTO3oSgsanNZH8z3NMk4LUtODSFGk872QGVhX4vpgYM2F0gypY4EkqyjFKwufXA6Sq3lzbSKRrpSDzI/FLioJwO45D93BnOIgzH4VlNBjTCaKa+rCYdI2hiYpSJH/1woi2v279lJso7fc2ECJJPWfhRsl0zTMjtLqRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv1lp8KFh/WzeG+M9inHOlXHZqAlVQy7rT3f0Uzw1yc=;
 b=cxKYNDem4Y/bHiPda552HT43EVOBBUGr1V6pbFEcTCImRn0J1nNxbd59I8pF+hmnMzBwabin+fbbqmLO4moJMstf9kjHDtO2K6EP6+5eG7jsNj/jeoHfVZOhnIrmdxNhqTTtQ+wkOvfh2zjnwtlbV2V8eAPQaQQ106H1RJoM3QmApdj7zCnb3eYyhuzZ94NULFBouIeIvVLMQ1HdXsto4YGIH4HfQXXqTVwUu/FN0gjUHUZP8lVyV0cYsuV1Z7bPuMJR0GZVPII/uSdpy2aXP4uub8Xpx7WSH/gHbKqzXT5VGw8kV8AMnALGkoWE3CzmJhU8UR6F9Afx+0Fs8PIWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fv1lp8KFh/WzeG+M9inHOlXHZqAlVQy7rT3f0Uzw1yc=;
 b=jOqNy5HTqRt9esKl9tmEYAK46xY6tUf5C7EAZAjfg8cwX96V0n8OwHvUYzl0TFSH5C2Bwpqn12SzfBOjQFzHdwwPwVduuvmmFCmBJ8a5+bKZy6jpQwBVUg5SVmUw5WAhrke910WHRk5DFs6Zhd9JO1Fve+EzrUMsQHi2hN8i9aY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PAXPR04MB9328.eurprd04.prod.outlook.com (2603:10a6:102:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 10:42:22 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768%6]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:42:22 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v3 2/3] arm64: dts: imx93: Configure clock rate for audio PLL
Date: Wed, 22 Nov 2023 18:19:58 +0800
Message-Id: <20231122101959.30264-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231122101959.30264-1-chancel.liu@nxp.com>
References: <20231122101959.30264-1-chancel.liu@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0074.eurprd03.prod.outlook.com
 (2603:10a6:208:69::15) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|PAXPR04MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb8372c-0d25-429d-cf96-08dbeb47b58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tv+7P8fG3XU9+9xpnqdV3CmDfuS1k61Ffuv4TiywMQEMbLeN15b0JMLsUw2mRsi1+JFoenybFH/Mz0BQJ8ilUwNkWCSTRqVqwqG9qeE6Rw6L+10heSlhQNLHDTb0A+9RlTZgWjOy+bS3rmYChDzU1M7BoCSdISmgNNZpolJ98/F19CvbVzCraRPtMYVbp79dxRFcbG6CkH49pSoQbKqtPBxfz/Q4aHflbbvYPvY01QBR/grGpQKxxjXXORhjkzb72e73txndXsV0nYUM98594gXo6xrbGY48G2qb3DZrLM35huYoGQxdp5pMc72rdYCxiEhiEn3pQmbI5wXORdFpRnyssT38Zkn5TY3BCe9Ivv3zUjHlvXSk47JWNnKjgyCltSGKRnUPNU11C/0HVE9kSPRO+9JpjSkG0fEiYrZjcRDsK9qsdoP2nBQChBzl7EeEskVvDlx2dT9xHu47k/Dnn9ZfsvpaKPpXBM8ioYi+kedJQUbmBUOBvx1yFSn1lkS1QW45p8/drDxwqBHHtZeK9gk8GDwzahd70htKFPzL2JjwBwCzIpB7Yn1HRpBunXoyxJn8Tuxa66rDS7C3MaTLUlwK8XXwGPeftGRKTuSqajUjh4TqfafFZyu6r2vOvqou5KgU8vbS2ua1Pqp7XOnp14ba0aX1Q/3hQ2X2+Id/XXo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(83380400001)(6486002)(6506007)(478600001)(6512007)(26005)(6666004)(1076003)(52116002)(2616005)(38100700002)(66946007)(66476007)(316002)(66556008)(44832011)(86362001)(5660300002)(7416002)(2906002)(4744005)(2013699003)(921008)(38350700005)(41300700001)(8936002)(4326008)(8676002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U1JvJONG1UeHZMRA1ETMYMSmttFoKHJ7Qw1y4bu6iqBEIJ6EFUp63ufPlRjK?=
 =?us-ascii?Q?cMiWbKDygEiRiFwfwExd9/kuJoLI5gccSc3gv9Yx4HkMoc3cezkfVvv14Pho?=
 =?us-ascii?Q?7KC9Gz1wa2shd26G5lPKxROT8V9liVC1otfqbGq8nUXHBi3ZE8HKow4FHVPq?=
 =?us-ascii?Q?OR7LsS+tQWokwRhcWdz4JDYwxP2fE768qoam/cXuDkdJqQwN92aYHZRzuGPl?=
 =?us-ascii?Q?VumKcRXBlHsFPeWm8TISerfRZGNwdI69v2d686tQ1dOuRpvkc0pmslxAYpKz?=
 =?us-ascii?Q?df/MImC115s1Febf59w3iSarYKQgrnQgy25CVd5brBrxiAZ2qRYw3+XWmZKX?=
 =?us-ascii?Q?Zl07WUuiUWYtqyxPDgA/3Wy8QetYlEUq/uloP9YmRY/VT2bHzw0g+vxS56MH?=
 =?us-ascii?Q?NGTQWaPElXL8g1nHqfqdkQutXN9xX1EAXtCXIJuLdEoRXBxV54yvrPgPZlps?=
 =?us-ascii?Q?eLWHe8e4vkpmZ8S2Rzq/yKDOO1uKpl6Z5/eA0EadzNo8Zi5VGbKmcpnh63e5?=
 =?us-ascii?Q?RF7Q0qOgNh6i6IwsvxkDLUvrZ6ZWvM4AVhMi3v3eO7EsmL4Gjy94AjZiKU27?=
 =?us-ascii?Q?A25hkr92+CfDwVOhyPMrLf6SjZ5c+LPQP5694s7IX2UO9PhK5WwtgPmiDeWj?=
 =?us-ascii?Q?aWGrn0+hF1TmPiWDGs1HkNr868NYwucyhfiHAHHgPhMLQ9typx3IH4uKaohA?=
 =?us-ascii?Q?Jh9vRZLMrJH8vv6RW6+ejezHPrpaVpi4RLqpokGcs5oOZ4JLszI2/QXRIUjO?=
 =?us-ascii?Q?J1bkLaIDDqiZq/82n6fO0a4sLXGqQdAoVf+5+t+X8deCH02YU3aijQj1jyH5?=
 =?us-ascii?Q?xgNyy/x6QRyPRufT01V8S9IWa4ZgtVSoAQd42Q8jJq7heVnEnRQe5Nc8J+6+?=
 =?us-ascii?Q?woh+E8PkA3e6NkgVS11+q8zGtYN5QygODhRyE4HCSyntVUziEOXouG5FqPsC?=
 =?us-ascii?Q?tRvQltGKnNGSKNuN4+9qxuq5+4HOtgAFp7Tc5WNsJesVdOZDkx+527lKv/gV?=
 =?us-ascii?Q?/Wy0x8oRaHclx+gVMaf0I7isy84wqu3Vp0g8bSdHmPoVWOZOQn6SZ3L2o+xG?=
 =?us-ascii?Q?0+1+BgpyaZyFFCo3HQsCn88qk4h1CwTKANiSpXumozwZXPGwSh2erldzamo4?=
 =?us-ascii?Q?HWo6U+w26n7C2cKGIj7B4xy9hVVz/Wb85FmlBqNDPnclLSQQO5Wk6A0P7iFi?=
 =?us-ascii?Q?hOE5OopAuecnBxGlRnmTL4ydHil/5BQlBoBPUEGMEwme8vT+HO0Kjfpu9+by?=
 =?us-ascii?Q?cyZ9OjMvHlK99DNdb24QG3mSAhUt0wGCMUi6AOv0jseH246jVZ6TL3hjGwFD?=
 =?us-ascii?Q?gil9TZspdtSlkdf0hfAmi58FPYfzdwVR8TkJwKzVwfzYVcXUuaz6WkJtPKJn?=
 =?us-ascii?Q?cyYvRN8SB1nAxrW3Y34r9crXFvu5VzXNwLuKKQHUGto+Jsfg2STxAXWrimaS?=
 =?us-ascii?Q?TCazqCtV5rOlua6Y1TVS7WNGrs9rmEhZER4ngYkKKGTYRUZm5WDeKW/UWXmO?=
 =?us-ascii?Q?f/+otr97FTzinNKAVYvj6EzlVyMEiUa20ogbkvXWi/fta84AHWOxm2HKWfkm?=
 =?us-ascii?Q?UfcJqbfuLFKOZ3gNHI5KLW1mrg8kf2E3zsV7MeyS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fb8372c-0d25-429d-cf96-08dbeb47b58e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:42:22.7925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F/Mwj6SDHvC4XHTV7QQwKUvlebhtdGbfhgW3qgDJHLBvxoFqq0wmGgV16V3uLdyTb8+tfaLHyoWoUAb9itsozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9328
Message-ID-Hash: 22PY5PDSFNQRZB4LGMU7M2Y4TQ46IEBE
X-Message-ID-Hash: 22PY5PDSFNQRZB4LGMU7M2Y4TQ46IEBE
X-MailFrom: chancel.liu@nxp.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Configure clock rate for audio PLL. There's one audio PLL on i.MX93. It
is used as parent clock for clocks that are multiple of 8kHz.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 9a7bff39519c..e6745801308e 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -420,6 +420,8 @@ clk: clock-controller@44450000 {
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1";
+				assigned-clocks = <&clk IMX93_CLK_AUDIO_PLL>;
+				assigned-clock-rates = <393216000>;
 				status = "okay";
 			};
 
-- 
2.42.0

