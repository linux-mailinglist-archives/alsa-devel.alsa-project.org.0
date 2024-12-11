Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E795A9EC304
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 04:12:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F36F3227C;
	Wed, 11 Dec 2024 04:12:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F36F3227C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733886762;
	bh=oROrbigEnbxBbJQZmQCz+t1ZoYRdoE4L/rIVMdGvE9E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LWwpCJaGMosDNPio9Ltg8aidyGlaXXFOIygzi4y5BXr/eMvMduLNOtjRlNbC/0+0F
	 +fxw+wkzbSGjtmiTSx6ulp2/xlSptZ4y5IQUImIsR019tzFgBvLhnW904/rkfL/ZLD
	 BmS/GLAIXS6LZYXo7STe0/KhxwbDW0OAMAssgH+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE29FF80448; Wed, 11 Dec 2024 04:10:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75695F80448;
	Wed, 11 Dec 2024 04:10:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D4D2F80533; Wed, 11 Dec 2024 04:10:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B472F806A6
	for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2024 04:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B472F806A6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=MO+v5p/l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiUhax+7Qlt5q3NqLcwUlsCGm9PqxPNWA19NOv/EvezHE8dKFq5pInuybmj053mMHlhSf3VckPHA9z7o4AuaKmbtWaVebVqAwMpaaoh7vv66TPg7nf7ZXk4NGWV5CdLJuOqeeszONVRD+m0gIcluEUlcoZGC4RvZj1QtT0HTba486uCEA5SfGwX65Sej/BkUQqg7PQLVITt4uj9YlzwDtGqYjdyHUGmuJrdQt9JJuwue8AWJXQf/7FLtYpvVbIZPac4vYhm38kLiMoqScno16DDY6J/tdWKrIpjxnZxlIgZedOpRjuzvTQo069tCrFM1eXToxwCoNF/fUDeyT34dXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=UvU1z716SV9vCBVrHNI0HoYNtchIaROV51Vonn0v0/Dekxzy/qVCoCPu8j5ioW065wL9cGZppjOEGj2mBPglVz8bA3tYQtiANKniQtcfwFEAimnnBMWpVDsYLDP4WQAEy1Z3XAsx2l7i4MJGRSot/JYrQSUNIGPQY2KTKFZyvINkTyJWcW/76HVsDvckJ+RkRly+ZnjYBfykevWX9FZl90SNHJ4kLeJhZpPIwN9RqmPQ7fDqABPOdI8RE89YN9rJfylJDGu0e9ZUtWxZqTcBSyufXMK9iD9bvLR/0HdahIkBB1Vd6kzON0Lai36Emri0iYnpL4bWWPQzXud4perI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=MO+v5p/l3lk+LxMP/BOFeeK1L0SXgWRhctdZMwoOUtZPmDKni+6jK+XGhH1dU5120DqWotukFfWwi9E42NI8uYM4jPCsqMhyuyFSkXvm85dFCVIYWqq8GroECRBZRGIkvhHsdSU2aYZfTAvPNR2X9+Fy8A02i1lJURUTvlrHNJYS9uz29ClhE1FDj876qAh+2uza5nHnVMGs+Zj7zrEftsli/3vooLsE/tr/qx5KjO64fkku+194/Cav6VNIRX7i2fjK1N9yQwwCahm/jaAUFdXmlXcoZ3xFMANdlYppVzvX8x+qjBLGZlroWmyBa1NCL82bO3YYLOgpsM/nkyR87w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 03:10:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:10:24 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 6/6] ASoC: fsl_easrc: register m2m platform device
Date: Wed, 11 Dec 2024 11:08:49 +0800
Message-Id: <20241211030849.1834450-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bec2f83-ccee-410b-3eaa-08dd19915ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nzsXn9prrCVIBZ9PqEuVKD2XvvPOIGDICyIWSYmuRB5UatXT3F+g48ysE1nw?=
 =?us-ascii?Q?7Auv1Tutzw5UvMB3Lf8nGI306lUzlndcg2XnOvxqASQorMowcfjrPkPxCRxx?=
 =?us-ascii?Q?XnJIviPLhL21B0pf0kqFaHKrPX/YASNXiyUqq6Y0QFBhZggWA2GWhfgXecEX?=
 =?us-ascii?Q?yMGFl63QOqolAvK+frGjGCEFTHgB9hsgJ2JudMHR17z0mZIeGVLRvTI9JLaw?=
 =?us-ascii?Q?5LrY+uzL9U7ILGaMzbZs0B4m+onE885sFcADj5NOZBlPn8+RqEakJVpEOlGf?=
 =?us-ascii?Q?94tCQdmlOcTBM3wXJN/ziYD2ot6g8Rbuc/B+7BDaeRVYT6PifyyRmdMofg+r?=
 =?us-ascii?Q?uNzHEav/M0W1L4DLx+xEQx8THSnyjYXiyUzLwRtR6kW2jto1BozGYX4ThbLh?=
 =?us-ascii?Q?E0VAHK0fbMYtBkr+swfgg/TP8tgAgQTnlXRzIKm0H3IFuNSBcLD35HQoPY54?=
 =?us-ascii?Q?1liQIVwTZOkpvjsJFg6xo2mkRCtIemnCg73RBtmMwPZi95VmIcqjKezMxPj1?=
 =?us-ascii?Q?1Eu04v65fYEhfKMp/CAnSkV7CS6u0cDx1vrdtrn9Hn1wbCEDydkcM/8NRe7B?=
 =?us-ascii?Q?y7W02WqectGdWR3OF7Ll5MKSJKBtjo/LTQU4J4+GU7HcJr391bySoGP5iVnE?=
 =?us-ascii?Q?pEzg+Szm0/sAFOGYl6K+dJd42Y8DYj2Z0CBBk+uySLkNgSkFtlZQmK88uNDF?=
 =?us-ascii?Q?ffdvEhQ0+ly+2LH8oJlOLynJngx4aXQj+IDFnieAupWblu7AV8P3Nx1JNcDH?=
 =?us-ascii?Q?Dj2BYyeaUe9Uuo7Uom7f36oZM9Tg0gxuGVavYohODXB/woJsr1TEKJiaYmTX?=
 =?us-ascii?Q?iVpYgzBwE9vWOu+e6rjm3WHTYuSinGFQmmR88x2A9ok+NoafOTbz+oS7R3tG?=
 =?us-ascii?Q?NTUP89jbT/n3fSaN67PYqnwx+pCg3TI8XiuSt4M4GB9FHKKqT4gdEGKf12Yw?=
 =?us-ascii?Q?3TpUHMAyLSf7zGORoo+qHP38Q8JLClQCzlEfb+tolBajGOQlu/H0tKye9/yW?=
 =?us-ascii?Q?Uz09cVidwgxXoGoRVZhfMYGArb/hkCVe6rOH8LGgQAk5L7lZBGkh0pn5YVNC?=
 =?us-ascii?Q?bWRdRMfp2xEy8GZO7B1L7J20g8nKOQYy2VNDXyY/3qOV6dWbydg1wbIsAJ7c?=
 =?us-ascii?Q?V0JLjbvBXJD9nPSKpm7GtjRfLFputN9py28ZTqpOi7dsH2oSUPNRTILyubAB?=
 =?us-ascii?Q?1o6XTxIhKN+X+He3PryM5ZE5qzeMwog0d+fYe8CxAJsOOTrHDug+BWUoYG2W?=
 =?us-ascii?Q?oLhdV7YAM2STBWYK/nU9+O/N/3uN5uDrU74xDT5Za56rzcmckrEaJEKDwTy5?=
 =?us-ascii?Q?w8sBapKVw+rM4DiceTyYF1vaYUoJCK5KQX9nKo172bIvbiXavxA9wldMNH+t?=
 =?us-ascii?Q?P2FGhUkyMCaz94aZUIO4hLxV++Mvkgu/JUpYSXUQA6Bi6gkiV0Hh0XgXd5up?=
 =?us-ascii?Q?/zngBZBUndc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nxUSfzAJxEkdDBpty2YhUB3Abs6/3053Jfk/kmLy92B/eQRgnzmy4vYOcqpR?=
 =?us-ascii?Q?D+I9laydrmEtrpWLlvUQdP2FB4kGZhU1mke3ZyO+7zfYhPa06be6E/ltYfW+?=
 =?us-ascii?Q?YGGD+1hjMbuEEc8k8hKNFLyaC4bKQ1mescOfFravrUnMOVtpiSFl9/GxnCuV?=
 =?us-ascii?Q?AspJDwxkLMIfn/fMo7crWPyLdZMjeesHVfvLkPdCQrohM6SZW1CXYgoFikjF?=
 =?us-ascii?Q?Amhztj3+U0op7ahBZ+Tc2m2e3QWY5IKnG1Xfd3AnNV71dO5mGmgBZmIX17sc?=
 =?us-ascii?Q?vIF+Ys34fYAHEAz/G3tkrhSXTXqgPkQJ65HVq0YbelRksKq+pfySXkMHPSAN?=
 =?us-ascii?Q?JaH1Gopsf+3RBwI11XRqQ8dgaaWESg0LDfEZypfj4vG2MzpcyhcsbIjUYCez?=
 =?us-ascii?Q?3/SIsGHaMmS4K7J3Y2KDB/NvTMSAcGNepQuH+BGplAa7a2jIgx8qR/NmY9ZI?=
 =?us-ascii?Q?zBoNoOVa3cVq3fxrV4UlSNsxA5ldFBqP9+E48nyBq0f/u6wB7F+d7jCutZ19?=
 =?us-ascii?Q?6L9cfFCnJqY/WDCbOeTGbeHVSe70nlJP8VMFd/g2Q0mbFK6YJEf+klL+cpTZ?=
 =?us-ascii?Q?SJABUj3BKfsW7bUGLajIOSnHXguRDsPKEBizsSIk1B8lrEI6Un34f6ZZn/wr?=
 =?us-ascii?Q?trxbt1Ovv00JmkfvAzPKiG/rgZSw8sHVN2n5JfLOE+54I3Qi4twGWwlOUfYw?=
 =?us-ascii?Q?ShxGLQ5Gh64VgnfV4MhEcPddshFkzEOcsNXff7c2xo15rJzigF+SUVSs7R5f?=
 =?us-ascii?Q?Lc6b/D+phED4ribIF1X2f7iOs8MaJ96RaQ6HpV+RC505knGivh4wUilgg7yf?=
 =?us-ascii?Q?rF7IjqgUlGLFxmd/qjnglfUIlPgi1nQbWNCYblvglR8jirB8V9bGyt7EGvcO?=
 =?us-ascii?Q?RsI+W3marZnSIom59o2G6Ys1KiHywH9x/zeNewYoWzmrZNGMPpCQKhZH5Oxr?=
 =?us-ascii?Q?nDMexPpk1sWaqbHnrDIl+9LwtfCm9lBvtWu7nN57Au5qSr/yBUFURfcb26/S?=
 =?us-ascii?Q?bHBxpRbny1S9+GHkaseciCbHYJkSB/S78o7ji/I2gT6OvaP1tvX9Hr9QScoG?=
 =?us-ascii?Q?3bE+57rl4FU2XMVWUmG9Q6ALGpFDDIEMDCCPi6jHoOJyNeYPjdye+ew8mIdE?=
 =?us-ascii?Q?XSAJ8NW+HopSWy9bmfEO1KBIyqIOSODqWqw5JWn3CKnsM9SsAwqVoPHxwIOT?=
 =?us-ascii?Q?l2Z4a/6wHoktVCv/YmWw6Bz6nvPLMbnBtJSdtCeOsZ2ihepgBxqFV92CZWPZ?=
 =?us-ascii?Q?68Kqh8mDiJtqpj/a5fvKT4KSDXUV/XmsjwWaguXrPXthIfTbrrzKSuL/yGPc?=
 =?us-ascii?Q?kmU7sYBi9zCdZaoNd+icjiVq5Z1yeaSSTB09fyEG54QgE+AW2m46MAOOfNE4?=
 =?us-ascii?Q?l8YRFeFSk9TTaNqniHyAYVOYsSsi+iV4PoCfeKKnGVer6kJzaZf3kLO8QT8v?=
 =?us-ascii?Q?tgWhD6MGx7yFw8iUR45aSSIZ8hwqbXOe04q+8/uyYQsR70tNYhHDg/zVuXvv?=
 =?us-ascii?Q?l5Xb/8jaRYiNJH51OGb3KSBIePV399B375pLYQTmDy4usFMHql/Ml1d/UCVd?=
 =?us-ascii?Q?FVNprKTFhH8t/WkqEzyB7UffMnTY0xFYtnEQ12qb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8bec2f83-ccee-410b-3eaa-08dd19915ac0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:10:24.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F1+6LI6ww+03ib7Df7MorPY8xmEmolnUI2sN6rJxyOJUvNzOfYvY4ppd47fDeXjKJNXNhtTqDpTg9FWeCcdGBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
Message-ID-Hash: SHZSIRBH6ZBGSBAQESII3TYU4QJZ43NM
X-Message-ID-Hash: SHZSIRBH6ZBGSBAQESII3TYU4QJZ43NM
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHZSIRBH6ZBGSBAQESII3TYU4QJZ43NM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Register m2m platform device,that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f17a185a1910..f404a39009e1 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2204,6 +2204,12 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	ret = fsl_asrc_m2m_init(easrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_disable:
@@ -2213,6 +2219,10 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 static void fsl_easrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *easrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(easrc);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
@@ -2313,10 +2323,29 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int fsl_easrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(easrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_easrc_resume(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(easrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
 	RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(fsl_easrc_suspend, fsl_easrc_resume)
 };
 
 static struct platform_driver fsl_easrc_driver = {
-- 
2.34.1

