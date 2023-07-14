Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E1753688
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 11:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF669BC0;
	Fri, 14 Jul 2023 11:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF669BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689327067;
	bh=Chbp2JzJTrRjrjTqFAH0oq+aCKQn6rpRUj0c/8W3QJA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wp4pTDmY7hRp+/SUc76BdkKvooh0WkmsyMs4wXVRmoy+CdcXtbeeOvvup6fKNRCIi
	 XqyYD6gACghpjhSVBpE3pthOxalJBroSvJN6lSbOAQCFmC+5oQOrquzxqVzIygIa4Q
	 14ReYdzMeEgiRZF1eANknVgUuZGpJqubOjt94ISA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB753F80236; Fri, 14 Jul 2023 11:30:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 293ECF80236;
	Fri, 14 Jul 2023 11:30:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F30C4F8024E; Fri, 14 Jul 2023 11:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6503F800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 11:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6503F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=UrEhHOKR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT42qndfR+9DgZWRWNdo/d7e0WbFQ4kIYmIOUjcf7TzpykcJ1loP0d+0eU8ubd4V/HUtACCC5Kj3PN2o23ARRxt/KLSnNVkqUeGpRqAwmkgcZprDYlX5csQj8Fbbe7s5jqeqAARqb6VZzgMtkv5MpmYZjedyd0nhm5IcLldgOOy2DcfoPBTsI7tdDufOlZ7i4z8ez5/ZFqSREz5gjLnz5unrXC4FzS4Rn3FUWVytFL2SQuAr3X4nl966pbEA4kA7aFuk/+ZFOcz2vqzFIH8kmpySYs40qG520Yes+/1sA53HdRmnHj3V5Z9MUOlGijcr8uw904lB3HCpgKuMuZXBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKsi4o6bmPpohkiTArsjun4NpycQpTiT3V+aI0ZSFEg=;
 b=aZFHFTAzDz8XKqUBfhWrVqNt3ci1RnVRP/E4w+qzmeUDaYQOzrGHzdbWk4a92mPsw8EWh2ie/9xR4ycBm/4Mifai3n58YJkGGCBvwZDmm2h5ZCKMoI8cplc6MsfQ0kJlLlu3fLmww2PadcedUSuZmq5MSmb+FuCUHp158PGy1AYOxn1CFluqxB21iaosfhivz++iUS3I5qtVAi9xY8wmBkT2uhm2tT9cEU6dJsKjBnWBqLak++geQqBZDuw51cQZWWRfdTCfIXZ/5RKfEFPJ4XxLWZ7cLTbCkp/TfefKQEP73hCCh2zlItQBdINAl7u+tIgH/JdLj+kIYKVGiRZqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKsi4o6bmPpohkiTArsjun4NpycQpTiT3V+aI0ZSFEg=;
 b=UrEhHOKRuwcwPeVUR2M5/zbI8Y/sj6HiRXxADYb2kskVvK5Qg7WQiwceWHVBYfpUo7Zs1FQvf8xnoGhmljPWc7MsouK+qY3cvtJYfyYg7eoIMmQWimjFLoQvmbK2MwU0pnBRYV120MFqkdXtJ6YiCbwt5KBFtk9yF4i0Z9Lxk68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:30:03 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7%6]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 09:30:02 +0000
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
Subject: [PATCH 0/2] Add support for rpmsg sound card on i.MX93 platform
Date: Fri, 14 Jul 2023 17:29:11 +0800
Message-Id: <20230714092913.1591195-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: b6866972-a6cc-48cd-77e2-08db844ce6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B2o1DS+Hmy1y94brqYD15+DQs3HHa/IkZ9XJdEbN+FtF65JE2l3ZeYQ1N/bYbwbVYordM6Wa2VX62TX5rWbYIdwrG/r6G+qPYZwBwnZRfKZE/5m5sptFajkMLstuQeGuGXpFwXDuY6oBkAjZSldrMCir8X3jTBB96Fx4B7ABPybZzgrPRJZCUSjimwAs7IUuJQWRxEDe4RqTq5NAvWZ3j0ST6l3pQY4uALcRG3FXNNSiKh1D5/a8F0M3w3cx3Y9MVVHWO04ddX9hwnFGgxSpJoDgMi6BQ+5Zud1O67EaPoGcXXgHW7Raue3L3qQuGf1//uXazXcfn9T+6e2jYsVqA9G2qoU5Pm78ILu2ARnUuKGXsaTztZ6lzY0cksGm5N+zkyPHrlgvHT5nxzwyAuan6T6yAt4S0El+aCuYJylbgYkYk234uw9slCX5c9+SkJg+iNX9/PxgCtPla5de8S09Q2c8n3Gb5zszuOi2UoGTTS5NP//K85je7UgBbNIhaXE0d+nRAcH2UNbQjTuRsxyi+H60RquGg3EH7+xjjOefNjKPawltEshaNNGFyfoqFaEWeH5PIuP8F/OY5AZlN2BwXAJ+XPTQJ13UyLjWe0Blk4wxcoGgVtPS6XidWh5ae6KVjkwEUSonibqWUsmcEXdgBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(2906002)(478600001)(38100700002)(921005)(38350700002)(6512007)(186003)(2616005)(26005)(1076003)(6506007)(86362001)(5660300002)(8936002)(4744005)(44832011)(7416002)(36756003)(6666004)(52116002)(41300700001)(66556008)(66946007)(4326008)(66476007)(8676002)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zLL2hbQcMok8d2yHQbaPEAeyUgKVZHJeT8PBDYoIpIbbJPWQ0vyjYET+nitB?=
 =?us-ascii?Q?b3o4UVKVS0SuH6nm9KIsHMAFKdHUqnASrLG+ARlww4PKoZlbdcN0gGZb2bJx?=
 =?us-ascii?Q?y2GQc1k49rcS39ukVdQtzyy5ui5PHhy6p3HN1Q744qMfIq5X+JAdYwsmmXjh?=
 =?us-ascii?Q?cnv2/B5QFaGDoeIXAbEy5bU89o9GC0XhyR5rpOfRKJVGm1Ui3qjYDvG/InGi?=
 =?us-ascii?Q?MdbR0yBcos0pupIEp4ivoi+XQm3g3PcVzGF+tyebqSFf+Pd0GYjQTHQ+ztnA?=
 =?us-ascii?Q?EprW/zc7ZVeaazylJTxxcibNG+fPz+u0b6dBOapELxWrmuUCBMwFM/avgb2n?=
 =?us-ascii?Q?N64raMbNDmqPpFHUSnFwuZKeYJEpBfyccMy0t/JiZ1GSX2SeqLBBB6bDDW/i?=
 =?us-ascii?Q?7zDSIUCslw51MD1Ms/KaSqJ87dUxBz3TNUqVuMTcZbnazqy8H0oiffQ6pIXZ?=
 =?us-ascii?Q?LM73hGyhW47sd7siBl6W/8bvk6DfrvN6XnARRVY5G/Mbo8jq8vvEI6cZNUWM?=
 =?us-ascii?Q?f9V3yDXBaX/oXiKpGPAgged5it8+ggs/5s9vcHGonTNtc9qRXAZFVSn3mXx3?=
 =?us-ascii?Q?jn/QOG54RqZ3Wq4mdFXm+EyaQhGne7WVoCTO1xvQABygcE5yqLb2l4OIB2pr?=
 =?us-ascii?Q?eS0oJm3XalqQraCesc3jRXCOwqiLez6yQbhGFPC0yprFqeMGgFQqakFGWob9?=
 =?us-ascii?Q?hTFFTwt0BUoqfrTQOjY72Dwtg4sh98JltM5+67jr65sc7Rq8Krfo6bJXAGW+?=
 =?us-ascii?Q?7BFvPLEkYIk0Pj0/oSf8WTWSLftnFUtuHZ7lItY8MGVXbi0tcY1KDwgD4Phj?=
 =?us-ascii?Q?5GPzVUGftXUYGfYMOv1ncr6Pcm4KjzfaZ6qfyM+mYehsJnZx6iDKvLGaeNjD?=
 =?us-ascii?Q?4/+V7VdFGfEt2miqA0JiFp8DkMHDcHgnnM9nOVeYUIlObmO2gUFIE2l8IDbI?=
 =?us-ascii?Q?rWbaAfWZp1iacNtXNRj/4o2VRih/+FHX/FJrbSJymj0Rky2ogjWyBwJ/CPqq?=
 =?us-ascii?Q?3v1ddE3ajmscWc63OptORuJSriVfbt61KujYpYukDlT2gUFmZdtiGTpB27Mx?=
 =?us-ascii?Q?sLydt34fLFeCuoVcOrwLtjLICONe3Ak1f4kcDmcBxyh0qym8dZ0XWWb3XPBX?=
 =?us-ascii?Q?09FAh+WeQ71Y9lBNcyYZW/Bo+H5X+XLlPeQP8cXYgwDvkH0kknUlVo6gw9PG?=
 =?us-ascii?Q?1HVo6thF16MFq1JM2UwkojtpitDltUuCQ6nIjtikH1UfWhO9JaL0hBBMH4j7?=
 =?us-ascii?Q?zGgX2rZKqSPSVOC5qBZi3ZCo9eExDdd0AxEO7BMNTzUvXUa1pIq/+3DYeL/L?=
 =?us-ascii?Q?BOqMZbKpmZyBAKPM6W1aJp3BKAe66soEpfeGu00ovCCqf5jl7VKdeX8Mpd9o?=
 =?us-ascii?Q?VgzOwXRF+T1jZVcez4W8LQu+gHeqUtlKGcz5uSGzSafXSk05ueuIL/ymomX2?=
 =?us-ascii?Q?HjCVwyxrFuRZukNiXO9I00oPU8ExDG585X0tiWpdwTMEBTlIoTSYvpgh/D/t?=
 =?us-ascii?Q?xG8dIYbBaGQqT5pabCSIBO3HeDwTttvtDHAAe9C1aHhV3IuoA8QfFZXZw9qw?=
 =?us-ascii?Q?zFPCNNUiXWY1ywtqv81Y4PiPPtImBpRLFp+z/BW3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6866972-a6cc-48cd-77e2-08db844ce6b3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:30:02.9013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wWp4tEYousgCkvKEN/Di8Scn2v0EFbf0S+zJr4rjw4v0vu3vG1ucbGX0OdT7DKMHuCjrT6Jt1qF9ezVJAuSFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
Message-ID-Hash: RPESO542D64XAAKWZA765MDOVI3JFWPM
X-Message-ID-Hash: RPESO542D64XAAKWZA765MDOVI3JFWPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPESO542D64XAAKWZA765MDOVI3JFWPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Support rpmsg sound card on i.MX93 platform.

Chancel Liu (2):
  ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX93
  ASoC: fsl_rpmsg: Add support for i.MX93 platform

 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
 sound/soc/fsl/fsl_rpmsg.c                              | 8 ++++++++
 2 files changed, 9 insertions(+)

--
2.25.1

