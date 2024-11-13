Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB969C67EE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2024 04:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 146BE1912;
	Wed, 13 Nov 2024 04:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 146BE1912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731470291;
	bh=1PfK7tbsdoait84cLXKa+k3iAGJQ20Vi6gVv35QpJxk=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=csHGgIqpqGNrbX6bIADLzwcuuENSlxhcQVnyQlPQWBguYfpNsnyBxt+AzEcUUW+Hf
	 +icACdtHXtGh3VJmFJqjRgPXqyw5EU5h2gXGvBKUHpePd+fDCNPWOaAlBvB1FeqSpx
	 fy1YQTTRyulVOnQgcCr0sItoM8nfI/PrcwirYsFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CAC0F800D2; Wed, 13 Nov 2024 04:57:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18CBEF805B2;
	Wed, 13 Nov 2024 04:57:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12087F8058C; Wed, 13 Nov 2024 04:57:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCD9FF800D2
	for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2024 04:57:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD9FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=briOrbRF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg5zQ8VwzXzoE0QrupdI4bGMaR+tNaYSRUu2ia1uJdrVnUFFMiLv1Dyi0x2qkD/3MbiZX9OAz5m4508PduKoqThdQwLrC6HCzZThefevB3R32ZGJiqN0drouphUoDdSQl60ufmg4/JX7qfKIaiEmNz1OfXi2yCjjYKhvLqi5L/VkIsGkFAN0f1M72U0QtlSGXzt4GsHR27VsQpUtocpEGwB+CDZZT+n+2iC7JCDhqLKCLasuy6FDMyVBO6lv8zfY/IXk60cnDTzH/9glsav+tJWtBwgtIwb3dLWO+7a72di7N35DlGD4axZ7XPJ9g0hxoqpFf4bWUuEOgrZTH6BybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQ7IC+mjoqAEJDnguwwkYsdzKqrNrQKJKRZrJ61vtXM=;
 b=wSbBs7kdbVMPtjk2bma301VcjVjqm7N2Oyalh4dV+xnpMMwFoN94Sumc1u/CP0J40LprNWA57Fuqr1tz7GcEBmIXSOzKR028y6HTz3b2GnXDDFscY0tMor//B6JQM0LT0CXHWfmfmwI9Bzs3VqkeAvdZNsLZ5NoNbOpsuh/hHt4mnrLdAHCsmiw8gLAVZk9Y2njWXEJc36T6aWnaXjHrnUDGLjS3ucej+Zv+LLgs3bUolAPmC/tsPZNpoLKTedjGX7Yx40aQZbBqhDoR7W5dzbYkSLHzAlkGhB9bVvDaEAsU+MLgiaK8Bfg6h2tI92SaH40s03I7VwmDGM/Bu6H8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQ7IC+mjoqAEJDnguwwkYsdzKqrNrQKJKRZrJ61vtXM=;
 b=briOrbRFjlgwkgKX+Xwty58silGbnW1GSZ2HAgKKf6aZNCzJD6OAd+objwH9uXAdNKGDR0LqxJcBsoBY5FcRJmLi5ZGTuw6c3m556B0xTQIIfXOX9AayZmHmjPgnrFYetPjccwXOJi2TzlNszpWzHfw+2bW6702OXd+0pyQSTmJyhCqgVj4GDLZ/t83CtH8LCfyScRQDSCd45smhBaUtOpSJ2F5/xIBnQquq1/kQ0p4Xotsroz150WzMugAbJlvSi0HZbmeCPEwMj4Zz3qoW3CjWhDEd7H8PsoY27SDzz1MJs/iwh5f4v4LodWMePM/N3MLmLdAp1OtD1dPFMWqZuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10746.eurprd04.prod.outlook.com (2603:10a6:102:484::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 03:57:22 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 03:57:21 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: [PATCH] Revert "aplay: fix S24_LE wav header"
Date: Wed, 13 Nov 2024 11:59:38 +0800
Message-Id: <20241113035938.2890202-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB10746:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3ddb83-8cdc-40b7-aceb-08dd0397467f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/KLnySOOt5lTXTSr/xd7iC2GqruX6FQRGtymO5uQ3yct8NuIXZ4/2vCLosid?=
 =?us-ascii?Q?Az9u4mrKyIe98ImjQUayFnwSWqRe3betLm+QAcyKSwwJjVlzcKYY81M28GbJ?=
 =?us-ascii?Q?Y0fgo8y0ubfpgoR+MdDrpCm+rVIiTy0OMqU/xq+gAicLDQqlM1TDX3BadzBd?=
 =?us-ascii?Q?NqblQgn+FRQ+J+ZyqJZ6JHUuVyBu/U/nduUCdWkhDa0Nyten6255GFqBPLHa?=
 =?us-ascii?Q?+/EtsA2n3EdjdPbmRbEcSIFp0crfJ2dZiW/kcVu1Sssmy5Yr+RP6lXP1xEbr?=
 =?us-ascii?Q?UQYt1etL1U19wAkBbzDDnlu77lHoEtmwpgb7dSRh3YLlr1yzaAl0lB9fM/si?=
 =?us-ascii?Q?PytYKlZWFnw0HY+5hIVKDCv2ehqaPsUWZYQLH6RbxfALaJQ7dQGHsZjdwogW?=
 =?us-ascii?Q?xj8fMIU4p0BlwrapG4zE4XTwRAPLq3qrCrybDd32cGrTtkfzcnuxfefbMRhB?=
 =?us-ascii?Q?t5wgbVo0wmkD9coTtjw3Fw1fuaJqNc23L66jlQDNOEMNGUnWQGggAiq8SfZb?=
 =?us-ascii?Q?NMgAE51uy5kKJ8U0MhBbOFBcZWUfq9XcwuR6Krmx6p8b30q2BOWPBJ/gOgHq?=
 =?us-ascii?Q?mbK9VE4xgbn6KUMVPvr2OaJQ8gj4Je7KcxwTfv12D150EQkxlAAFMaKJ7rc4?=
 =?us-ascii?Q?mXtxraERIymFj9avJbcrgpGSP4UoIhXJgDmo4afoGbwo3/nZ4uH6SM2ivpbr?=
 =?us-ascii?Q?4CR+cQASZQ4U8mPmr+LLOZPZ8XzmrCO+aV3wJm5Q0advXytYlOZv5hsqZ3Ws?=
 =?us-ascii?Q?s/n8m0Ht7P0LHGSsIPpKLs8sstchGL6MbrbblFoQcBIls3Td5RCnKiIdT0xB?=
 =?us-ascii?Q?SGkyfk0PPeuNJO0CY2PYYkkon1GgR5yeat4rYJwRn3TnlaOXZQBjUWXhd+FR?=
 =?us-ascii?Q?GMrZUquttq0Wl/X77fFMHWTm9ShXAWCbTgislQfHVdEDxFzw9O+wqZjMnYSt?=
 =?us-ascii?Q?Z25QVlKFDKVq3SjrfNLu+Xt5oyTwNQv5js7HzBJx8RCN93hn2oKfdBU1jIcV?=
 =?us-ascii?Q?pB7Dq4eVLdpMUa5RJdaA1sGKH+aCRWNNeeJF7DQHNz6Lb2C0yc9+7eXZbFST?=
 =?us-ascii?Q?EjueTHM7H8MOHyEDQ+WMH6ZAE6KNzwTesJ6595WHrsNF/wbLuFA16YdwlV4G?=
 =?us-ascii?Q?0q1jS7t/z+2RA9HpR/k2rHxwUy9AzbKg2s2xmnbZPTS/uwTQS2IOfupgi1dO?=
 =?us-ascii?Q?VwABhOURMMsRhjqdPTnYrd5M6YXRSTGBIzwRm+CfmfJux92L9PWS8HeN2Chm?=
 =?us-ascii?Q?bPizE93RL99Tv8I4gmmyMhPM8REP3LQ9Pa3OvmsWg0AsOF1VjOe6XW1KvoZO?=
 =?us-ascii?Q?+1zOLPRXJPSGTX3/4H04eF69nu4HSoUsy59OQmxtx0j3B3DKJZsVvYXy+y3i?=
 =?us-ascii?Q?3sr4ptU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zm6xzW1eTq1o0srjYctR+kSJ+qFgocKHcXHjB65vzOl02LzHY8FNxIu6/KIu?=
 =?us-ascii?Q?CDWXexTK+gI8I+njkA6ROcc71JNZou+XVQPsJmdiZFyX8ZKPPoi6Rakinfnd?=
 =?us-ascii?Q?UdJ28gSYzjqsmcblEH01jCvaj3gKm3U/NGbEUIL3t1vP7sMR+oIZGgchOd3/?=
 =?us-ascii?Q?PlE412QjXifyONSPaCmwBEM6cEWM3QXo3YSHYzmUmNdc+D9GxOhRRpytL81R?=
 =?us-ascii?Q?W6PsMVl46+YcHRFsWLYjCZ1nO6JgA/uXrhb2OfFc8Q2lMsSEME9FaqgZrQxD?=
 =?us-ascii?Q?TRn6BmU+q4DeJwG0eid7kZ54G0zV319FIecxVmvwRXkgt7/4ahbmN7QphQ4G?=
 =?us-ascii?Q?s8+70EmrQn/NyGcOvJXvBsJUek6jdZqDQLoB5zVl3pvZeYwYhAqEipKqby8Z?=
 =?us-ascii?Q?DDbC6tojZBs8HAmeQxoyTxFQzbD3z/LKIMdWrRGaGK70rUWk41XajXtHpBJz?=
 =?us-ascii?Q?7R91oTeQX/8yVX1qD31ot9KxX7RdRWA4JYpzC/ExiOK6aw5raqwiLxxOVbt5?=
 =?us-ascii?Q?kyRtlN6fBZmYh2haxWl17uK3aU8OvimLAU2MfVSsFYOhoAfiIEkI21Srv8cS?=
 =?us-ascii?Q?OnbZ1QU+tyWA0oo45QmKVfYwYQJbl6tmkAfrprgdqpRtwMx9W5K94sO7L0a3?=
 =?us-ascii?Q?TK8JrfuBNa1No5GhxbqsI2+GafqicsIYWLo3pCy1JMeP3a3K+HKHHIinIEu4?=
 =?us-ascii?Q?cHkT+ERDAXZ72ME0OP59O3oT9NpwO8oVzE8uiwtvDxIvpuwf9TMO0Atnmbq4?=
 =?us-ascii?Q?VE0IR2IsZxqDOhIk43GQIQOGDXYHdK70OSiz0saiNUayK5Q/wY801hfvep6n?=
 =?us-ascii?Q?TZUu4CYuk85Ujuj/7QGw5R/gzwwqym3PtNxOWvkHxbIxNHfl3yCcrI3wYCR/?=
 =?us-ascii?Q?6QUmO9F8b5JOgROyWwVBLKIq/O3LAPoRd1MyqebAOmODHldGw2jQO7K4wqdJ?=
 =?us-ascii?Q?OdikXGIBDaTBeBXS2K79VSTAuJAa/GQdLVBGiGu78zzBu0XaEO9U0Ndo6wFE?=
 =?us-ascii?Q?BS+0P01BODS5KwSmDUjfMq4gLjcnu7LUdqf2g13UAJuAfEpVyVpKG1fLLd/N?=
 =?us-ascii?Q?iTnOrgCRopKsUtdZqmriBh5NbxarGssFLTZXaMH/bgpgJPGfFmfp9IwY1rLr?=
 =?us-ascii?Q?f4v6zq521GZ4749JRf3vxgxUBmf+GqxBbNtBkIEhDs0LKsvaKJqoFjAoXjIR?=
 =?us-ascii?Q?65O1HPnLvvVbQUfl2+xnrkBt8fYJKbQsgKlSNoPiPyrupwVCXS3l1/WxmY+q?=
 =?us-ascii?Q?SVVQ0RuTFkurIs1/FXmGZAf23hAbURw60gWHMbfiAfqCTiVlUspKYbTfCRoR?=
 =?us-ascii?Q?iMWu03e/48NBo/dk9VMqDWgFA02muOly2DyQVHeteJZAfjk8K0tIf2EWp7Az?=
 =?us-ascii?Q?ndDvP1Jn03hEODasRCwXzpQgV2JKG+Lci4T5fbxBFtjhnmrlW0ZmjknMphpu?=
 =?us-ascii?Q?MaLY89h0QOA+4kYW/c2/eWO0UxuOpIgs2oMwctf9P7pfjBR9P7KNJxf1aLs9?=
 =?us-ascii?Q?mkIaBikaRUDVOfYBvYYVcJV+nbzMkcjexuaI2XD0/+1baCHrd71mvvYXVwRS?=
 =?us-ascii?Q?KqaRPMXj4DbBVN8cKt+KkBdaiWXHlVpFpvVxGgjl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc3ddb83-8cdc-40b7-aceb-08dd0397467f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 03:57:21.8654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hMQR63AYNfuH7WmXrwRz9BpWmQkeegsu+05b/toHSWIzlXJXR+uw7ZiRbCeGnOaFFvyzIeDFjcAeKvuPvf/zDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10746
Message-ID-Hash: 2CMIAFETBQNQSSECSGBD5GY57ZH53H7S
X-Message-ID-Hash: 2CMIAFETBQNQSSECSGBD5GY57ZH53H7S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CMIAFETBQNQSSECSGBD5GY57ZH53H7S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

S24_LE means the lower 24bit in 32bit space has valid data.
So previous code is correct. The commit causes regression,
then revert it.

This reverts commit 9cdcbe0e932b97fac88a6195f87647159a6c7194.

Fixes: 9cdcbe0e932b ("aplay: fix S24_LE wav header")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 aplay/aplay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index c58c2e9..d11e63a 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -2719,11 +2719,11 @@ static void begin_wave(int fd, size_t cnt)
 	case SND_PCM_FORMAT_S16_LE:
 		bits = 16;
 		break;
-	case SND_PCM_FORMAT_S24_LE: /* S24_LE is 24 bits stored in 32 bit width with 8 bit padding */
 	case SND_PCM_FORMAT_S32_LE:
-	case SND_PCM_FORMAT_FLOAT_LE:
+        case SND_PCM_FORMAT_FLOAT_LE:
 		bits = 32;
 		break;
+	case SND_PCM_FORMAT_S24_LE:
 	case SND_PCM_FORMAT_S24_3LE:
 		bits = 24;
 		break;
-- 
2.34.1

