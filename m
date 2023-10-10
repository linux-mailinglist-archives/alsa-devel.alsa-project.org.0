Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D737BFE0A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 15:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F5F151B;
	Tue, 10 Oct 2023 15:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F5F151B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696945266;
	bh=/9ZKenlHyYjA9asYbUk7gZGm2UkC7Um2ryFdbg9HFZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WRbKpwmh9Ise4eVv93Da36BxxTLWW6iVIOdFqDd80+tTFjaazX9bzFcy7ZgfrbUKv
	 +lVXdFwWuyIbwo9mf35uPczMoy7PXXL4w+kDdaehhTaDTjYAN3pB/WMeIi71lxToFF
	 smEZ1d7P7evdrEDBZhrSJ8Mg+9uCp5S3k8P1+K3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5686F80571; Tue, 10 Oct 2023 15:39:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DB88F802BE;
	Tue, 10 Oct 2023 15:39:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11AE3F80567; Tue, 10 Oct 2023 15:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C6C1F80310
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 15:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C6C1F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=HEATQdHa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvfYyWC+2Bros/sQ119sBbGLGUu7fZSG8WoLp3ogufz3wntxAXIngnvX/LM/hJ/X/BezqxYHTshJq4VachAFMkv0K84YHpLmi328jkhGjXV+ujij0ByxtAwYdXZbQJd/aFJESazl64OaPWpLrc8PjSBiw2aFy8JaLs6ItzAWFRh73IHCh5uuQCTeNUXsjTpB21jexuV/gK9nCVjkgoPGTM7inoGQBtcZSr/27ihtKBOAHb67DSByrHjkc4Uu2zQiebgbj7S1OG0Ds15fygDnVwr7IWywtTNN0CiJK5EH/pu7wYlsDsDGv8lnl36G26I1Ab14hJDSUizLfUvHwuFiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+HEe2ZCNukE0Oe6BDKCQjlEEpyHyJQQ+G5EjDYXwiw=;
 b=TfBdUA/HbjWv3rPz4mwl55ILab6UmTMxxpLtcSsLjuCi69azINUwhd7MBISzsr54UE4CTvl5EvD/ivcUHRKzP+ze/o6WpCFKKRU/4DL2TIOZUO+b+vGBok62zVKHJXdY//qAw819n3YjbSjVDC0xNyDNk7A5wEtQc9tMB/UozXObOdbMVt/kmahRGK4OjvymQMsSwbBmhcdckv2yle9WmjjbHZI8XqXgcQYDNLi3ZTfgRrU6BJH++CVMKjGAQiokepAfDUfAnwgmO+6Bi+qWDNI+9MoWhIbhcYdGqLYVy0AhoQyv1u2IWNXXx2XOtqcC6kEe/rFz70TiTHPIgO0ENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+HEe2ZCNukE0Oe6BDKCQjlEEpyHyJQQ+G5EjDYXwiw=;
 b=HEATQdHaplpzd0PsOsyZZWkctb340DZlE7xGai7BZI+4SGd4595Zqw4v4ONS/V0WetEcdbVoQH6suGvK3jgU/yrQmQ9q8Gz8cCV4KQKjF2G9k0lWrjbMZT5NJoXGLv00xwBSu9T5xu9Yy8LPg10sglCXEXoGbYdKtsjIB0S69xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 13:39:17 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:39:15 +0000
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
Subject: [PATCH v2 2/3] arm64: dts: imx93: Configure clock rate for audio PLL
Date: Tue, 10 Oct 2023 21:38:37 +0800
Message-Id: <20231010133838.799714-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010133838.799714-1-chancel.liu@nxp.com>
References: <20231010133838.799714-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|GVXPR04MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d032e1-a47b-4610-6bc1-08dbc9964bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQO+y4fx80CoTG9QT3Df9+KUQF3eN9H/mWLo/vRxKQDdQ0uXmKFculGllq3JdP0F0eyOUm6b8vda0s3wUuPAsK+n0n08W4jaiI2FDa77PGo97cyEY36FrqHy+srslKgbjxceVfnm+ICZIzlO9H1KWwFvQR4/O4ZqUslOXvyhz2NtLC23IXcygc2zCvJ0Yei7Wc3J1eSFS41tGNvRwoWy52onsGWlPHInvrCchZOvXB4kdH7P0dEsdo1Wjh2M5wRp5qQ2rKntl0gsD17FXSNUIInr7l4phUZKN6MNTnigcbg0xJZPBXS6iR+lxoJKwxBR1+agky2yNGDNgWpkBwIqW47xxbQwgwW/camrkTyUJy4s2EJMygzdgF0dyJ+yXrO9/cnf79hW1+SGv3DMzoNtc8cOpGcUkNjInYr/yayF9XZxQPEsc/IsNJzNzlUM56UYrcQJGk47cTFJDESfDYi1zyq7C/5GBPeObRxgn6PqL2mcY9fkbwAlOZeFP+8nIEpV1IuinzsU1zTputclkX8VjCqStSJPhMTbZgMjvah6XYMHnhSVERO+AGH8BWhtPojk1Guzye5wNVaOdawlUFNTih6lWyg0Xc9vZIFxaW93Ogq+yK3YxX3+TzsWOa2o9GfasmGHlokzM5XUDLwKtu22Wy+utogvQes6NsZgnQEibWM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(86362001)(38350700002)(38100700002)(921005)(36756003)(2013699003)(2906002)(6512007)(52116002)(4744005)(478600001)(6486002)(41300700001)(4326008)(8676002)(5660300002)(44832011)(6506007)(8936002)(6666004)(2616005)(1076003)(83380400001)(316002)(66476007)(66556008)(66946007)(7416002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gSPIgFnsj94ymV6WjGarB2DEKngYFsYyiPgGWJj+94/PlQY5gQC9iyfS+dQu?=
 =?us-ascii?Q?3nN61tQ68JoghMEEX/pAumhe0rlvtzXnygC5ZKlYz34dVZLw5oT6INwQvuIF?=
 =?us-ascii?Q?0q35nmYons6MhtrxHd83VYw0QR6SJtc9ZzI/yisPB6OOcZv7M3FOVY8YA2Ly?=
 =?us-ascii?Q?1L7zJoq+66BgNl4Qu7YoumPVBWL1gFjnZBf2XMFSskROVZAi4CWWNMnMC90/?=
 =?us-ascii?Q?d6IJyMxcIpfa1ZUBnb5msKUZRNpFtqaeh8lGsMZOQBMuBvc3nEFAoJVyErKw?=
 =?us-ascii?Q?yptz/ywuMchq1QMh+podAekC3gxDz0vlBdnVdisvA/FtaOh1hs5jceHEMxTr?=
 =?us-ascii?Q?GWeJ73lAi0Ged1LxUeISOQCm93u+yVPdx4ipvzG8bTEu+fyKOO4Xd2o1H+mb?=
 =?us-ascii?Q?8KwhOOJWqyaLTNR1Uc36dODG/DP3qQe9tR/7qK4vh2Um48YqjJknQ2Od9x4M?=
 =?us-ascii?Q?Uz972kuZQde4LB9TeXfXQVNuq8o/knuSNeK9CxMPvF8/l7emnc8z0zie/dgM?=
 =?us-ascii?Q?nkymDb+nKI/pEfcZW8OtjoxypjvGsDyQZwkWPcKjCNzduV/cAk5fHUy5m5qw?=
 =?us-ascii?Q?KzTDC32wP8XETgIKFEuWaKvFOHQAJk09vJPBBycq4J/BN6JtIfpFwwFHw10H?=
 =?us-ascii?Q?OC5m7HmEbtSJZ12EXMsvU2eJHbZ6kpl8ztb160orakWllWzhZ5RemzPWQtJf?=
 =?us-ascii?Q?k7a9XGloj9gEjyPVha/EjX0ZpTY9+szKl8mEUlNPGtSq0BT/QK2aj2Gx+t+b?=
 =?us-ascii?Q?eKN8XjdDNvN+StUAo3UTyQuMrosw/vwmzpLgrmFjusR1QCmcfC5A+EKEy5Qh?=
 =?us-ascii?Q?Y5oJqcwohlMwSNzr2I/S0BWAUH+4HFFxe7OD2kVrY8w7nFTNx9AySjpDuYqG?=
 =?us-ascii?Q?mqV+DoGbZSGCly/skqSHoudtbbE/1kKOR8F4Ktr56XP8U+sDGpW9Cgn4b/6B?=
 =?us-ascii?Q?i+b86Etgzr4vx8j/x4K6WofMULR6q31nypawMCU3ppB2DUv7OhZLKJhQIz3u?=
 =?us-ascii?Q?taknwGLz4mcJEqzaPixeHJDsTx/BUvM+UvBX9tiJJxeV/5pnQkD42PIe2Myj?=
 =?us-ascii?Q?/oPhiwpKBklY3Ix2gtD0OCmh6UXtDfLWHdocaREg1R5PO12kOQyMtvB1CQhi?=
 =?us-ascii?Q?jiwWEzcourwpzS2st9bxUjUQWGss6fUbGseKEyHuwN20UDYh7Rs+4iBkYXHT?=
 =?us-ascii?Q?/saCj2jrJjq94QQUZ263aEWh90DHfrYkLSjfpdj0rAFfgkvgSdsEaLXbvE7Q?=
 =?us-ascii?Q?YLMCWK/8qMR6TKhQrQzBfwCLh6IakjBJznpuLT5jeyclSDg/9WWhpYrJIARb?=
 =?us-ascii?Q?robPyNlzhaRa9t0LTF/XI+jWHSgWzkU9T8BQ69rsIg2GdWC3D0VUhHW0D9AE?=
 =?us-ascii?Q?okgFY6WGwFu/W05atIU+T7ZlVIV5+HOG2Nxt28LZX7vb6cTGhi9vg96jLTJ9?=
 =?us-ascii?Q?ze3jpY/UZfYu1SSm9u7QNfVJ8GDDzMaZjgDyCEMmHMEJqczU1safy2qSlYkl?=
 =?us-ascii?Q?9phBW4sKB2W36X4Xj2PKnCkcXQ/wZSl7NcxEHG7sjL9DK1XikUJEOnw5omAm?=
 =?us-ascii?Q?syvuPWSTwOOkWkwtfKW7sq2lI/Dpm+XqkuGKKVsQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82d032e1-a47b-4610-6bc1-08dbc9964bbc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:39:15.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VwP7xeimMOSScMCcB+0y3Fg/qpo1r/7I7OqE8njRkiHpZxdud77zOZ49K+eKcAFenQ7c5iIFfrr6xPar/TjJiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831
Message-ID-Hash: PITNXQWO3JY2XOJQ6VRWRFX5OT6YVQ3L
X-Message-ID-Hash: PITNXQWO3JY2XOJQ6VRWRFX5OT6YVQ3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PITNXQWO3JY2XOJQ6VRWRFX5OT6YVQ3L/>
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
index a1310710080a..1438074f3bd9 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -419,6 +419,8 @@ clk: clock-controller@44450000 {
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1";
+				assigned-clocks = <&clk IMX93_CLK_AUDIO_PLL>;
+				assigned-clock-rates = <393216000>;
 				status = "okay";
 			};
 
-- 
2.25.1

