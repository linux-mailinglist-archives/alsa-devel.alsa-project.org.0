Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F959E3329
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2024 06:35:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 634A3FAA;
	Wed,  4 Dec 2024 06:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 634A3FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733290531;
	bh=qYZzVI0LlfJuMXguWOVx7jlkeVIN296ai7BfGvhMs2o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LzG91F+Z75yD5NMgsgtHPRXvV5YX3K5zGorW9dHPKKLT3ToSB8mTrZE6CW/RkJ2+e
	 adYW0SZ4mWnfZmmDpK5KWiu6xRYYxP9IqSPD75LtCbzzgiSofaogWMnP34qCpbDHs+
	 cpvCQlLEa9kZG7pNRievzx9u2Lj76XVX/5Yz8NEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8410FF805DF; Wed,  4 Dec 2024 06:34:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D72F4F805D9;
	Wed,  4 Dec 2024 06:34:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 087C2F80272; Wed,  4 Dec 2024 06:34:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0453EF8003C
	for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2024 06:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0453EF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=jP/kh9nu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9KILMB0al4/D3kgexKkEaFYWiLMPiguKSvfACg/FLUpbYdEpwbccU/zLEwP+XazKflTqFxoDH1PPzhm2TV9CLW02w7DphtgBR2b89wNfes786Wh4BAWEbDpU177rCHWvecT57H/gUJH8/fGXwK0blWCopVipIln5t4JdowJgDlf77HTrLtqugBADYjWtG+t0DbUwbE75DbRY5ynSlM0+XPyCBwzJ15I7j3o1NN5BuG+wNbED8cTK77WIiFL9NPjFTOO9avd/P5Pcr4u3cHrGz2/dbyWLJ8BbXX56ftnCumsH4PCGLJO8Yu25JYy2ypEr9g5Kes9UE/gMoaHTNCwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjqYSBEF+harWuyMeHZEqZwNJnm1Hy5T0NuzIdWBwpY=;
 b=IEM7ji+JEUGagAh1VN8ZXgA1mwZGNc8r2P6+z7Qu/tCAUMdX3CIuRkfqnrzHHBot+ZJDyN1qqnIGke/oUTeXShobCUf7kstJ6KNKaZjkgTgMaRE2zdxgoUjD2F8auefVxDSEjX79XxGgz3PFWj9JJOJUllJr2Su/JM/ZDUuQvYH3nnq/5fykRxcS6pGyE0bpkue9XAANR50xycBcSOSVxyu7AVxRBUikzJqTZJIW/NVV5XEJHqpfddV3imXSWVN75a+IA1oGruErAJ/egqjAGb5hjJNdFdJCUdS/R41l5E1jLwTRi3v2b43gLtnl8lszgMRzv6aa2BkZJBcQkuL30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjqYSBEF+harWuyMeHZEqZwNJnm1Hy5T0NuzIdWBwpY=;
 b=jP/kh9nub7rCx1B8G0XbBV9fqwNO+rht0nZ8CLZ12qXI+V+jrv0q7P1QzzK3TpTqBgryco33nDRwGDBDiWVKhToUswuFF1T+lDNsqE0SwdoWmmDnVO9BVEV/VqK8/uck7xUzKNSF5auEhy30KV8IcAYELSIDQBkty8K7NVezae8IsbXJqJLzezrpsD+6+AvtsEMkC56N0X25lrQF0/V3IZVtQjtmh7R18AeYRjiBhl2S0niD2OE0G7LARcX8YOVtDFDlvRvExhFLuQf5gV9E1PWDonvNzr3wTITP2czGIyDemjkjsizFjN1eU5fqa2PQ7hlAz9pbFIz81Cm/ihH7HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 05:34:20 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 05:34:20 +0000
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
Subject: [PATCH v5 RESEND 1/6] ALSA: compress: Add output rate and output
 format support
Date: Wed,  4 Dec 2024 13:33:41 +0800
Message-Id: <20241204053346.1865723-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
References: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: 950fd5e2-f904-48f4-4283-08dd14254d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h69UwH6ua4v2khmkl1vFRu2SK+3YHxK1Haj2W2HuHwEMDhpF6cTxitDn/cME?=
 =?us-ascii?Q?eAX8SWgMwVTApKb82QUxjgIPKGTAdvTxkLf5VYMN4mil8ry66Ykl+2VJkqgg?=
 =?us-ascii?Q?zLjQyEddfY4goP3zmYRadnkaB2uKGaCLj9Izr04CgYkBYyR7IKAEkY9ODq3L?=
 =?us-ascii?Q?whf8Bmb3KfjxE7ZIe3XnQdbBsKixrFQSUKF7qJ/QQ69Zd4ujZCmV7n7nsRgu?=
 =?us-ascii?Q?x7LfiuHM2Y8CfmvELD+iyh3w7O0UJNiuCrY95nosxG4B34wKqrRImzNQVMJu?=
 =?us-ascii?Q?fvf06mhv6Lqyz3HfQNc2leePc0hYFZ0H1IFlZnHAdkxuj2VjQiQWWBT8+B4j?=
 =?us-ascii?Q?pvKkKAGfqKgnLn7XiXFw58/6PXEtQtkk55ACuczKqiq6TLwhrHJewuwK87O5?=
 =?us-ascii?Q?6wiNZV2SWNzkiUF4GPYTnPP5Edwnw2GQ3ENgXYUehKtx59GiwqdZbuf+9REE?=
 =?us-ascii?Q?3FyiaHmCcLnuB9+PLtBFN8fnGyyRLEdcw9UdI2nVCOg0IHA/drRGmg5Cyike?=
 =?us-ascii?Q?yDnoLPvBotKgAfb6TQ/tvtea/J8pBEoc5Mdj4blB4011jbHwHalSCRxJTTWO?=
 =?us-ascii?Q?3WIXV4EPH08qXtc6GdOSqTknAY+qKB1AVYDvtZUEE0/aqkaY1GfWpUefwP3g?=
 =?us-ascii?Q?tET/S8Qq0G1eTzDjOYpznK6z9gCWvbstJ5jbd44EjJSIsYhhAy9DmiIP/iyV?=
 =?us-ascii?Q?9DuP7qRuFX3YtI+e3LXzejJGRS9+GikqDPY3slHCX9t6FgEawwS5YMf+Of5i?=
 =?us-ascii?Q?VlrarmjnepAF2nd5OVtbcpvQdgS0328DxgsLkM/ymtToaCOU0qhnRw60ZSw1?=
 =?us-ascii?Q?v15Ks9TdTwysngeNpoBPmwV7EFj4uaoRObg6egbZTHupQhK9qRXtCWGeJkTG?=
 =?us-ascii?Q?PVds+voBaGp7vezHKTS0zvioyljRyJc5SUKxP9FRC4wfIOSb0rBLN43NUukW?=
 =?us-ascii?Q?jkKzjWfmM23LtS5GusGyRn2uuK4XUJmie87iOnWQWpMod3yQi/T4EviVu8JC?=
 =?us-ascii?Q?I+xAePYtN+8t3eDkmixz7KdqeG4wpgeFX3CoGZBXBcE07N3T5TLh1X9p+g6z?=
 =?us-ascii?Q?CQ128MWTHLkeHGJ6kG0bpUccKtuCoAE44HCX2+JgsIPxlsiGKRajnuU+4QV2?=
 =?us-ascii?Q?H4BqMjihvKgjIcXAzeBr1q5gxtLpzI9QxN3ofbBrcjNXk3HpRrOXW55lIFEj?=
 =?us-ascii?Q?xeSIAM40wzwHRrOBERiyw60QJeAobBrUlgoAbM7+jTZcsSjMChWy1cwkHDE/?=
 =?us-ascii?Q?3SFzWsIP7ZoPjfpJHi1YBoq3Kt0lEzp/Hp13faMIMiFLmsPWGvtRXRysorhT?=
 =?us-ascii?Q?wgB2ftcSBHV93lO7unYXPK3ed8vezaYBnsk4mzZf+/fqeJq5JYGqUNY6roTW?=
 =?us-ascii?Q?LoG83sgopQ08YtWxOy75QGD7vforoFNUa83Nh0ATtIXvlMlXt8cWkFHIFPa2?=
 =?us-ascii?Q?qGd+Y85X4E8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?st/eiY35kp1WjXx9q8KdMljVrgH+x2TEayXNB9QMRjOKM6cIdwE/hVi25bqA?=
 =?us-ascii?Q?fhtXETjaByZaCKAB2rntk4Wn5RQb3mYpNurIrhJQUkwJvnnNhu0EiGJErrpO?=
 =?us-ascii?Q?jHwHFxg4qN3apNojbLQa45WL/ekyTwt33zYxo/WtD9hAsbfem0BBHhPCR4ri?=
 =?us-ascii?Q?gKctfcooVzqQGTSp9u2PB5ojUNukX2IbkRdeqBTCwKpbHLKRY2c/8gNQ43WG?=
 =?us-ascii?Q?ocG/Oa5DtJluZzqcDYScGy3TgBM0dMOFihsca0m31vU0YfeCqw/vOZ1t65jQ?=
 =?us-ascii?Q?blSsOaY5drsCR/EBoSEKPWvYt+JpcIBsCYSEmToCSmAorVVSzBCxjiRBg01q?=
 =?us-ascii?Q?mcSnuIRh63n5iaR29Prknll/X03jdBb79D1zG0igVPCIyjD1nVuLbr5oDI+p?=
 =?us-ascii?Q?tj7Xi/qIn5qt0T78FWqc8PVm6fmE5G0OHPfeBmyWsMZf4QGehqM7qI+TUddP?=
 =?us-ascii?Q?l+FKe1whcd4jsNoSUMz+bcL8jsixJKWjwQtIMrA18zAv8dXZ17P4LyLiZPBw?=
 =?us-ascii?Q?A3pyZfogcjITWKxg/t8QBtNtB+tIMI2Ioi9iyBY4atRDFHzPQvu+HFOVS1+A?=
 =?us-ascii?Q?G46NOeTomQOlfAqD8yqYWkeAWxDin5LPeUFB4X3ybb8eZHgFFHiOwXYZsA1P?=
 =?us-ascii?Q?bHDhhouSYf3nD2WIzF3zdaJQc9Wxl9w2oQraO3ci3PIPv+dURJ7DNlwn4x3i?=
 =?us-ascii?Q?9Wwf+COrClGwGW5PCBlO4zAvQcqdH2itTq7a5jlehiv6O7uOv+lLmgVv/ONi?=
 =?us-ascii?Q?5/Zb5HdqxPXXIq2JODbfcOhFYnapWJ6wpxxo0jkeXnkTgSSDqekrVc6hcF5r?=
 =?us-ascii?Q?Kn5uqgHFw2rGJmnbd0G5Iy6l3o6ufEnCpwIgUrc8fUvucquAlS9FVIjw34hX?=
 =?us-ascii?Q?n5A2Hbs4uOD1P6As8isCtahD9MQyehH2frdfbERAnc/kp1dnraZen6d7FxU3?=
 =?us-ascii?Q?/3y+geA48VzqwC9H2SoikD2iYjv3yb5kwjYXRHfvjFNTQxsN3hHgHpkB6zyy?=
 =?us-ascii?Q?ZPqeUmB4ijPXyn5EpEo8rGtVODLeKDS0AmTVYrIS83cLDb4g2APDz6BMiy+K?=
 =?us-ascii?Q?+mZHanO0cAheOXpvJafOcp76pEnA0walFN8M1ScIE/l9yLn/9GNi709eJCXX?=
 =?us-ascii?Q?nMNbr1Ob6dGjPMl7kDSOhv7OAAE+B5rlI9LF9pkLPUBeZY5AxQfK+94vYZwN?=
 =?us-ascii?Q?FXwiqe1TRyZg5n6iVfioQBB3bwVT8ed8Axw5zkJQhh/NISINBFkkQqubhD9a?=
 =?us-ascii?Q?0PXgO2yK85gAhSn5qMd/pIF+G5sunyEQVZOGek9rpild2MmWz6/QNEKrpTp4?=
 =?us-ascii?Q?2Yuxv6pETcXgTs8TE4GFFSZyj7DHNNx7izmrtdzhjwfwZA9QpHfGxIci+EEb?=
 =?us-ascii?Q?rRXIxbnNefKT/gNQU1eXwgysMcN+LnENHf8/REjnK7UT2oy+rejMpK2Y3pNs?=
 =?us-ascii?Q?jknbhYkbACpeFF6PUOVh+yBgL3fejnrYsEQ0n5HGTnt+krfeIJ/Z8CKmtbsB?=
 =?us-ascii?Q?AUUl/DzLuT04/SOLiS7tL2KIsAo5FsVS2r0OMXUbHQl+kkcrupUYprnDE3Yd?=
 =?us-ascii?Q?cZyzfhE9WVslxdzS9q4K8sJwX1scOmIjt8hkVRzv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 950fd5e2-f904-48f4-4283-08dd14254d9b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:34:20.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yvsIYZTZfY9YjWM5wLHFhVIPGEWDpRe5fURSL4jSnsCszT5SwypJe5PM5CovdY7q11wHKIGS+/Dt6YlzGjq1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125
Message-ID-Hash: Z44CNC2EOSE6SXPNHTVQBEN7H6MS77S6
X-Message-ID-Hash: Z44CNC2EOSE6SXPNHTVQBEN7H6MS77S6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z44CNC2EOSE6SXPNHTVQBEN7H6MS77S6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
struct snd_codec_desc, these are used for accelerator usage.

Current accelerator example is sample rate converter (SRC).
Define struct snd_codec_desc_src for descript minmum and maxmum
sample rates. And add 'src_d' in union snd_codec_options
structure. These are mainly used for capbility query.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 include/uapi/sound/compress_params.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..bc7648a30746 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -334,6 +334,14 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct {
+		__u32 out_sample_rate;
+	} src_d;
+} __attribute__((packed, aligned(4)));
+
+struct snd_codec_desc_src {
+	__u32 out_sample_rate_min;
+	__u32 out_sample_rate_max;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
@@ -347,6 +355,9 @@ union snd_codec_options {
  * @modes: Supported modes. See SND_AUDIOMODE defines
  * @formats: Supported formats. See SND_AUDIOSTREAMFORMAT defines
  * @min_buffer: Minimum buffer size handled by codec implementation
+ * @pcm_formats: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
+ * @u_space: union space (for codec dependent data)
  * @reserved: reserved for future use
  *
  * This structure provides a scalar value for profiles, modes and stream
@@ -370,7 +381,12 @@ struct snd_codec_desc {
 	__u32 modes;
 	__u32 formats;
 	__u32 min_buffer;
-	__u32 reserved[15];
+	__u32 pcm_formats;
+	union {
+		__u32 u_space[6];
+		struct snd_codec_desc_src src;
+	} __attribute__((packed, aligned(4)));
+	__u32 reserved[8];
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec
@@ -395,6 +411,8 @@ struct snd_codec_desc {
  * @align: Block alignment in bytes of an audio sample.
  *		Only required for PCM or IEC formats.
  * @options: encoder-specific settings
+ * @pcm_format: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
  * @reserved: reserved for future use
  */
 
@@ -411,7 +429,8 @@ struct snd_codec {
 	__u32 format;
 	__u32 align;
 	union snd_codec_options options;
-	__u32 reserved[3];
+	__u32 pcm_format;
+	__u32 reserved[2];
 } __attribute__((packed, aligned(4)));
 
 #endif
-- 
2.34.1

