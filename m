Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBAF7F639C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 17:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CC2DF4;
	Thu, 23 Nov 2023 17:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CC2DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700755678;
	bh=glOYMbA97Lnh+WhSsjgu2KL7WA9x66UnSGl4pschxk8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fqsS1W/ciuCZPOTO03uf4OLeB2ApTEQecvH2whW6outUHPNq1xPsZ3lZUCTRZNsx7
	 8xVWuc2aeG5PD6o6qjHuMXNdL3pbHPMeG2CUvGwJebE34Z2ruug1cQkuLr4xNCVxH1
	 3HvQDeTPhJmUcf8ZAvuMetk0NOyygccPcNtMFJ8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25F04F8057E; Thu, 23 Nov 2023 17:07:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E63CAF80579;
	Thu, 23 Nov 2023 17:07:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 886C2F8047D; Thu, 23 Nov 2023 17:07:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_PERMERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89842F80249
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 17:07:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89842F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=AGmjghRv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4kJB2zLSjzL7Y7rfeWfP5ZtOEcCzA70+pwz8gK4dDPOP6RQa+OG7/6m/z3LKSHzZ5fBVAMYwYgSVsIdJt+ccEHT5Pp8op7s9qHIwXfH1NA+Fyhk5TjV2Uth2ftA1obiYBZT9OOtu+upEa/RLuoXSM3cDKzb8b0D4m1f7tm+rCTPECz1uPjU2w4p7JTS/LgbHh3nB4fCB/njeqeohRGm3fE1aQPdUvLgM/BVYYGZgXECK1SWSCFGMxvEAyhXtejKedcbzogR/Jd3EHB8dhE+jlA7jYHJ59kXTWYH655m7iHkqbyIBc5v2N+x4bohV18eTcmXRsg9zlwBYq+j0M43xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhjWgvpRqPIw197O1BVyscMYE+fR6uHKf58OhssfnWM=;
 b=e2CRne3PIcDovwoQrK4kTWsJB48HsiVAmbf137hu7jkPHLtIxx8IkZXMlAWNxO/kQlJbZNospmhppRycAcGEcMmwXnh1oeugZbw5gC0OholQEsnIsELZd5AflVjojyw9uFpzb061l2w6f4byW085JgaKtpVOW+XLyD5RGFKPFBt3sA96ozKEOyR8DHN64uCZSAK1XNm8GtdkSuCuWz2IPP98QX8gyLM6ywQ599vUx6i62g7pb/aPZ4No1avwVMleRpxhVYE2lI2PKfSVhMh3YTnDSamGqIET1vwHTYQq8u9TontOjgi0ZvzQxQMlYVB6vgXMoUW1YjRHxBSkvHnfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhjWgvpRqPIw197O1BVyscMYE+fR6uHKf58OhssfnWM=;
 b=AGmjghRvgTJHC8gN/kkIjgulzVMsT75tHc7n6HLk9Gr63eY+osJDdHrbOHfUfjJ+m5fgejV1hzdSBo/IXHHXb6ccsZRbsQ4jQ2Zg6yEPjJIW15bjn1+4/yF2cG+47b0ODqgYoDY+UK6oCgw/fhJmvpBgaymzhTlmHhAPVe1bmDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9399.eurprd04.prod.outlook.com (2603:10a6:102:2b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Thu, 23 Nov
 2023 16:07:12 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c688:1f14:2ab1:c78a]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c688:1f14:2ab1:c78a%4]) with mapi id 15.20.7025.019; Thu, 23 Nov 2023
 16:07:12 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	daniel.baluta@gmail.com,
	robh+dt@kernel.org,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	linux-imx@nxp.com
Subject: [PATCH v3 0/2]  Introduce playback-only/capture-only DAI link flags
Date: Thu, 23 Nov 2023 18:06:53 +0200
Message-Id: <20231123160655.188428-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::7) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4a172d-1d50-4f1e-d45a-08dbec3e40c4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YigpExdFweg//cABIr7iq6lPzrino/Vcz5tLUCjRcxdkdwrEmy0SKMEnzjcpGuTW1Xw3wJf51lCbIHxogIRllg4QDPVkopcQ7FB6bS1Eb+BhEAud++rn7zIhfnnoQmXJ36/Ngv4r1L448QduW1pfaLlE1TJ9RJlzv8W+KQQB9R3615PQALlhtiXuUoX/lGwINQyOQSFi82hnLFfnHj692h8N/URyYDBzAr8U422fMPeiNIzAOSEFBe08nJxfWgBtxqY+OTZMcouffCw7z0RE8OXAs9hkXbqyWADu3K6kZUYQ3fE/2B6o/VL9vB5GUrjZNX+blcGErMyrM69PpTHIBR+1d+JvUYGeCWsl0yaZ1Ar8HcVHicx2+7yk8SsfoTp0jm3sOhxViD5aRhSgBwAadVri/HWIfcHqo03g269lS8sx2ZewyMTO7i8gjpZE0vdF3kJLbjetbwd2gCwGjcaKF6JyEktBQoXejAuKY3Q72nlTZ/rwKmJuEx5B8Lw16tzljbztkG9yju9CWM5SLbS5gkUV8kuK5wyJ5Ul1QENodAJPeF+SP8oTzPKnSVOPgJRRWA+JUb6d060p08ggKkz4M8Wl0kmpjhruaoyrgQrndSE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(86362001)(44832011)(4744005)(5660300002)(38100700002)(1076003)(26005)(6666004)(6506007)(316002)(52116002)(6512007)(2616005)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(38350700005)(41300700001)(966005)(6486002)(478600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ezLiZ6u6NxY2ec1iBfP0uqW+QsFhNeyxb/hFC5ji8kE/sfPqGyURs88r4SJ1?=
 =?us-ascii?Q?KWpGXw4YVUYC7gJbM/V5cS+QpkhNqA1D4Nw+JJR/8DKcHACKRwVeQQxDWafB?=
 =?us-ascii?Q?z7kFiOgQ1FZ2QUNMPPCexsLY+82tfGPRI9MUXl+imcA3YYz9UN0iP3p2qnWo?=
 =?us-ascii?Q?FMgvxoun+poWaqnPdpFvcY27JJOtouv/z/pkNfc8exOnmcxtDJVbjj82IkxV?=
 =?us-ascii?Q?jpxlWufNfeVqF4mHiw/O3sYVDvl/cJzauyMdmPMoz8JbedvJeIghwJRZJr7G?=
 =?us-ascii?Q?RAoQIPM0Y3rWRcypL//ZsctAZjxHyJuKhktUgJ3PdUKphWipPhz3QYjhZN8J?=
 =?us-ascii?Q?I+oCo1fbVGbcRRp7dK+z04CeRuiaxQaY/Ga+A3Lz3T56W/OQlxcK6/JXMggG?=
 =?us-ascii?Q?TcVaasi9kdfxYEBxz+Lt7ERjI2c3KYxvCIBYP2vRa39kycrDzPQvHBnnt6KA?=
 =?us-ascii?Q?T5NaYYrwFgqkqIlmmMNbhG1AhK/akboPaC/RJsADlu47qrGYiketnM7VDD6r?=
 =?us-ascii?Q?jYqYgw6fWY+K5JHaqXPAZsTLq2K8sPC1r+df8EgFqkX0kXyqTkHyeYX6M+vV?=
 =?us-ascii?Q?NM2eEa8+YQC0LEbJ7InJ/sgDZfhs3hmlN6UzyMv66QDnhAFhxxrCJWRArUGE?=
 =?us-ascii?Q?jCPDzwwyqvUW2PLI/NMGFiQbXjlJaNVY8ZmUkABLYFqMxZZXEyuTT9kkddnu?=
 =?us-ascii?Q?joEnyuJarIlLSiuLfzQScuvVrRfiVSfDV0ADW+h7pHIQknh7GBAExnXmcVAF?=
 =?us-ascii?Q?DK+s/BVFb4IDiEvMD70E+dcoMcoSox/nPa/q8ZAZPPTDSPZdOObST3aP7a5/?=
 =?us-ascii?Q?vGFlDwmBtnNs0gb3Hyc5RyyB8BXhBk5vmkeCaXYqbpyEALKUoSZb4QAEF8EN?=
 =?us-ascii?Q?8Rue6EwSi3W5gGeKMTUN+GRO8pkCv/grP7jfNNyQMeJqsR+6bguuhNiVvf17?=
 =?us-ascii?Q?g5Q/HOQDefldz45nQhY0KSWyp34GvU78WadVE1sO/9/o3j4ZoCwkXUJKwFdx?=
 =?us-ascii?Q?/CJdAvMPUfUo2xycUDIlBBOj4n9V0PH0EqPSvRiwbXBjtvLdGZpOFh+3KvLu?=
 =?us-ascii?Q?kXb/M7N+l6MCIFp6jV0+WC4H5AFDqp7OZmrNCDqgUeYNLX2WiL6oR4JOIheg?=
 =?us-ascii?Q?LDBBBQ5OwQH2ESqLaH7dZQNLFmRIBrwDE7ER3pE+xpokbpE1ZlgloBPjJP0o?=
 =?us-ascii?Q?HXi1Hzqgasf1AlF15OQsKT5gYxYJiKXQjRlLn7Nky9sy6Relf/L2X0cmPk64?=
 =?us-ascii?Q?1u/zXrx4zamt0VpmCtkGKoZP4RPzGM7SEpOv6E69ikToLZQToqZosLRb1K6S?=
 =?us-ascii?Q?V3vR9QV5khazlwbTtYXjvfMNQiwNyI1T3YqjPrlB9cn9j+qTf486dgbhRE6K?=
 =?us-ascii?Q?5uZCvz/vfvdd8+77ndaa5rMCCZUqCaDnwQkbwnMvMrrA1X4UFBismdgTyaHH?=
 =?us-ascii?Q?pX0j9mIBG10L2AZ4JLdp6fksjscKK6rkq0h8gTzRtOtu6m0mwimkoENWEXu7?=
 =?us-ascii?Q?PclbDZy46uUbs+ZhCfNKnMauyM0zh1pHrBuUOu0nZ9JHqHcz+yI+hmY2bl7i?=
 =?us-ascii?Q?mFo8naxjpiuAq4sacOVhm8qzWDfvWQQmBae0VEao?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d4a172d-1d50-4f1e-d45a-08dbec3e40c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 16:07:12.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7DfaBCQRz5WMjCEMrC3asUbxF/lNZ9ghrGzVCVyTAgpoMKkyqcTld9wcDoDQrxf3OgutOcktaj1WW4gRjwV91Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9399
Message-ID-Hash: PXWDMGPCVMAJBTPHIXRKGIQU2627AGRY
X-Message-ID-Hash: PXWDMGPCVMAJBTPHIXRKGIQU2627AGRY
X-MailFrom: daniel.baluta@oss.nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXWDMGPCVMAJBTPHIXRKGIQU2627AGRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This patchseries allows users to specify a link only direction with
audio-graph-card2.

Changes since v1 - https://lore.kernel.org/lkml/20230801082433.548206-1-daniel.baluta@oss.nxp.com/T/
     - used audio-graph-card2 instead of simple-card as we are deprecting simple-card.

Changes since v2:
     - Fix device tree binding error reported by Rob

Daniel Baluta (2):
  ASoC: audio-graph-card2: Introduce playback-only/capture only DAI link
    flags
  ASoC: dt-bindings: audio-graph-port: Document new DAI link flags
    playback-only/capture-only

 .../bindings/sound/audio-graph-port.yaml      |  6 ++++++
 include/sound/simple_card_utils.h             |  3 +++
 sound/soc/generic/audio-graph-card2.c         |  6 ++++++
 sound/soc/generic/simple-card-utils.c         | 19 +++++++++++++++++++
 4 files changed, 34 insertions(+)

-- 
2.25.1

