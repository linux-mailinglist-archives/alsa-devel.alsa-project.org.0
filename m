Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 378649EC2FC
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 04:11:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA3C21E0;
	Wed, 11 Dec 2024 04:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA3C21E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733886704;
	bh=pdSncvsYhLrAorO6FVqM+GPIWFy5+i+cKGmIQoIAhm8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=flQMz/9HN/r0XkFYp7UGQyk8i8igtcFORNjtBnmD8B81Jvr2sn922kCGjf0k75ef2
	 J6+SuU3LNOVFJGBecMzJGlWn8txKXVX4eyeZDhCyVppVyYRyZ19bS3urXdGYC30ofw
	 QsXgL9PmaVDiCd9WKero6cDOkyFUeRn6DONfvG5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6114F80622; Wed, 11 Dec 2024 04:10:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F28EF80622;
	Wed, 11 Dec 2024 04:10:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBE78F805CB; Wed, 11 Dec 2024 04:10:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0480F8016C
	for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2024 04:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0480F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=JAZjXdIP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/0b3bWne5MfK3jOQuVEsrz44g6sdosHb3DSf3q696sgcds2Kldyp36Lofq9PYTnSM+Omf/M0PQjRwKTcRCbvsRokmko1MQ7j10uur9RmRZ2xBn7K6PSSUQLKYGuh3fM8thKliWo7//KQ4Dm/hFuAJVu1n5xAbsms1cS3vsWIbucyk1RGnc3j8/O3sdg+FVJW7Wyq7oIUphpuDUCu+0jLFAwIOwVsaIwWGyYbGFydYocxl5kf7fsy3NG8V0NLX3ZnCOjpJruyxEDsrWf69XRtIj2PSXRZlGXkHysPnTocQZDv5MjNYttG/xG7QFhWjsTxJsW0nr8nmtJmANRvVHcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=cpxr1WcRPcXlQpRGy/G4jzyfyNwDvyqpmEfOVPA91GYQTsMjKggxWsVYH2/sqE0R1t/NkdeFJTo7D5OuMAE+ct3UgwXED4V2yKITyqKlgc+eg+fDeUMJuasHjDTDpSxtA2KjQeBtaEeqtuUvIBWTvH6NROx9UJaVKjVkgHkT+HAruitTlUWIpMOjryeMyNbY6G3ceb57ryHuJOtDbnIsO1eSPJLipifKW+UkgaTRYwQ9NOhwTxeW+QHoXSKH14d+W2qjx07vtyfcXZzNK1m2UDFtdIRrvj75qtH/ISjRT0kZwkd9l7OnhusbwDHMGW90gG7c9CXRTmNljIzRGDvzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=JAZjXdIPv1tCyvKVQJAYdzpxSWo5NqfFquKvvw/gml0NLZhapF3yXzEJyIHMMrtT370WMEO9TQAV3KYdfeLEI6haRGZ2Xynv4K6ygy4XE1m5EYq2UpaHI/lpgFZgXre8jD9W+Um9x1Jk2IGiUnHU1j3M4gw/6iHbzQoUSBQ2S148akhkcp0ohjY/ue/Rx9KuasQrj0GQXKr3SLHxvoCPW/Kt1BKQlxDgvT+nlK1FBucFYPe6t6eg/1VLp71x5kPDb15bOBTZ3XzzSHPuc1JM2Di3z3I1bIs0h5/4QT+DUso/Nvk3U5Bo70rAW+TUbo9EoGt6IcvIO7nr72teq3cgxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 03:10:11 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:10:11 +0000
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
Subject: [PATCH v6 3/6] ASoC: fsl_easrc: define functions for memory to memory
 usage
Date: Wed, 11 Dec 2024 11:08:46 +0800
Message-Id: <20241211030849.1834450-4-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68db2fad-0de5-47ed-e705-08dd1991530e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h3bqH24CKkk6KJijQaz0cmaKeAB8/p2/8LRUKbg4KSzEwyBKHO55NChlfDKt?=
 =?us-ascii?Q?UvMEMQ+Ag63cylCHCUs7yP+uO3aWTFJpCdCy9fWfJ29j2fsA5caJRfPryfKJ?=
 =?us-ascii?Q?VGYeBhipIbIXekrNuH/8Aojh1mdC0UCG0e0UVnXH/1MAPFhFyk45EUBQczO7?=
 =?us-ascii?Q?nzEgjxw40qilJU82djNCcjwf9wJsVE9eUjE7MRcaYTzWL+s8RamMfqGt9Qv2?=
 =?us-ascii?Q?zSSFpiSxZB8UZAmC9goRFzEaN1JQ8w+Ym9Sb/v0tuYKBtpmB8I8HK9l64Tzt?=
 =?us-ascii?Q?XNQ5SatGfx9VHlhtV5NFHMaHmoc2sdVpLKpnt4eb2TMyVCmhllCUSgfMkNyb?=
 =?us-ascii?Q?3MlcW7NYFORQy54yaew1fGpiYzDwOklh4CS+yfOeUdyEEq2aR+VcBdwdktL7?=
 =?us-ascii?Q?7zJvJkRnREIxiXfmCCcK+BNt7cmhktuCuIypkBGvKrGznFadnmXGb1YXyxkI?=
 =?us-ascii?Q?3fQgo3dQ8MeU7Ro2AsHzRML+fSDD0bOZkap/9nrMBJhbbTQtqxDXdGuskzAw?=
 =?us-ascii?Q?4KQlROnc4bz7CoNwCeCEWcIjUXEs4+yJo7oZcibe921jFvCJGbaKdJpQTRzN?=
 =?us-ascii?Q?LyOHGGv6/HDYFHbLDLZHACGHMhA/uTi3qRi9qp+uSecw6DP7btYKFtWMgCjo?=
 =?us-ascii?Q?7WhYkWNZ/cSEs/v1RBNtLglepyo9e8BGKSaWhpq9O2TouqtGePQsg7VBVzC/?=
 =?us-ascii?Q?rV2etD6juXT8urKmoZ35ps6Uak1z81Ch3mL2M2bxHTZgrLKIkYb5RedDNfdi?=
 =?us-ascii?Q?U4uLpXlS0eDtn6gNBUwrPMzjz9CJNfyyC6jdJoIyf3xB5jTzKnTwskSGfMvD?=
 =?us-ascii?Q?HPHcov+b9LFeSTBvcpZENMCAmBBAnUS2vp/aM5cB5zIRoIb/JnC4O5Uj2iJY?=
 =?us-ascii?Q?AS7Q1H2yAlACsVnTOc87giYpdDrn0+x98cqXRBsVML00S1EKID7SZgGU8Lkw?=
 =?us-ascii?Q?dxgYrKpn7Df20+t4BGyI317p8WLk7XE9gmtTfOpMuiWPDfsj7SjacY2UrMA/?=
 =?us-ascii?Q?Dhtr9QTLYxaeqW9+/tanmCAxwKmlzC/QAMehsLD9r78dob8wdBBqJl/VR3Ij?=
 =?us-ascii?Q?aA+7gyKSLxw8GoxPHX1kczz81n1Bs9BywjqTEIYpqZaNLiWFDxZYPIiOLG4A?=
 =?us-ascii?Q?N7X6d5BnFODdZ1/x3u1vtBFb9vBZIJS/nduWNpU++h7YCn8KLOE8yZgIfWzb?=
 =?us-ascii?Q?o3hu6GsnZ+nKLoB6Lt1jA3TPw1JAXM0oR4A1XJq+5fXJBSRN/Er6UKvfrlf0?=
 =?us-ascii?Q?WBjd89277idjtCtSfHP/sA5V+H5LKV+6FnRafbW1rgj+1hhNygxcuuLSFc/c?=
 =?us-ascii?Q?9Afg878O+n9PKg08P4lEPTIQ3pUO45OzBz75TweBqjp4LobL/c2mgQ5OnZ/p?=
 =?us-ascii?Q?w3BER7e/IB0zZnXWcZCVjdWF7wAfWHlsh++jkbE7upzf95XQwCnPVsJo/+zg?=
 =?us-ascii?Q?I8SVJASsHgA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tGmz+gqBhCGgMVIYKiYV0utHLGPlGOZKJeVOfk8ltpSoXXkbgTvllpYQDuOx?=
 =?us-ascii?Q?Pv3XRpyj+Z3kPRiMv3zFTt7ORkPopJSQxlWvhAcEe/NNsDgZYIzAPVygix/K?=
 =?us-ascii?Q?eZq4zk3TSMs7bd2w5GvmUO17iqhR4f2/IKdG47X7vGv8yzdMjY0toSf6XOpY?=
 =?us-ascii?Q?2Kvdh8h22sNewLIT1cC9cMddZg7Ud6OupWNMxR0I/gIC4hx93c5mqgOHpqWZ?=
 =?us-ascii?Q?c1b3cS+1sAovWUTPgm5njC6deFR1pGUTILzL4inhmo6eHEA7Xb6lJOh3ztoh?=
 =?us-ascii?Q?k2iyqR/Ktlz1rRzER436QpzUfrpzy3SHD1p4EJL8RzaS80FCzrqo8sUgTzcp?=
 =?us-ascii?Q?T8aYEV1GGCLwyMIvcxJTFX0LRbY9rvYp6npbmTM3396gA98DE8PkJCzlxeZT?=
 =?us-ascii?Q?q5GxutEpZ4Lu5DX4ikKBBt/7+lzS78xueXAL6q6e0aC+R9f232jLdTATXgfi?=
 =?us-ascii?Q?vMZTmENAhRF5xEofTJCvg8SCy+NH4B+7U9DhE2CArHIfQQsg7CYUeviKq1dV?=
 =?us-ascii?Q?3lPkPKaLWje2dQKZSW5NL1GkNxMsef9pojcOAFA7Xc37XOziHEvlWLcopQQT?=
 =?us-ascii?Q?9MJFUo+XMujPnv5xTJhxSPm1FF8FfhHrsYQS59E+BkrTWLfbHOvJP9gKD9ea?=
 =?us-ascii?Q?jg3sTXiBzdKqJTCanQkSjx9aRJ2y0AGRGRmjpaqRru1WS8tRFV3ME2xZfpBS?=
 =?us-ascii?Q?g4uGIlm3M0vZdKi/H9qtIyuhUaHcpRwCr26IJFByivQ3HlvhNtlHOb2IpeN/?=
 =?us-ascii?Q?3NWso6cWK2onafXkNvSDsrIXN+9DHT0Ltj65k0i8jgE7J4h0YjjpvDUWrAzr?=
 =?us-ascii?Q?Vc5ANykW+KNjyrWXyzEvsZ5fdMBW+//3a9sikiJjReOdaVPHs91ggLuLruyo?=
 =?us-ascii?Q?nYyzkqVWBnM5VSOrTl5fC9zUSzWnWbO/xcq1ysa+57IbvnQbPwO+xpwFakfK?=
 =?us-ascii?Q?WL2xJAoiG2kpt+U38cPRGWTMBgh69b4dh09Gcj7mC+b6z92MzoFzinRNrWO+?=
 =?us-ascii?Q?kZ0xyblNqgxceEJNMeiVOL40hU05s1xtnaaMFgGI5+y7wrMUUF9sJZ2HWs3T?=
 =?us-ascii?Q?9C9UvJsXNy7jaX8+Mr8dF3TVCRh7oMteWn0xReJnadCfvUIAk31o5ViLfg8r?=
 =?us-ascii?Q?OqBkSTwFSRDm3EnZPjXokNSBV5mzoFwwKUIfBeTu1bvfwG8p8r5jysE3VsYM?=
 =?us-ascii?Q?txL2QC/XHX6/dFgqqNieWGnsK62vmlvvTIK/jaXnLfCPvAPhdorip5ZsZIaC?=
 =?us-ascii?Q?91AY8GwlY+Xu6Kcm1RAap/DTEJJ8ZcVWyyvMAIQpN5jD0KMXUT6NHvwyekec?=
 =?us-ascii?Q?HLPaFRG/F6buXGz0GixaN7KF/ez3c+EBSfjP/drB0n1L+2XkVlTDLzEVnckr?=
 =?us-ascii?Q?DKvYFJ7wrONFpCQhBqFxtktHQnThPAf3x/kd4TieIPPOZzZKdriDoCp1VRqc?=
 =?us-ascii?Q?3kIJJlSYrM6w5YyVnt7wWsmaaUs+OHpstqw4Agma3UfMrZFHGh9CAZ5mTHAT?=
 =?us-ascii?Q?HmTuxJf3AM7sHYrWVLtRoF5Cfqf7FGjXSrQmwY52inBMqCjUK/FwCdC2zkxj?=
 =?us-ascii?Q?LM4eDWsP6HnixLqI8dIUaOxodkUJ0mHyiVtqSavj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68db2fad-0de5-47ed-e705-08dd1991530e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:10:11.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JxF0Tx54sdoAplMypu7TE2RbLjQt04MidrtbQckzAUHyqxXo6an98hv0JxnXsWomjHgmK4eCNQqMQ+JZCnuHPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
Message-ID-Hash: JU62SDLZBL4TAQ2DK4QUDWQCPBPVMKD3
X-Message-ID-Hash: JU62SDLZBL4TAQ2DK4QUDWQCPBPVMKD3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU62SDLZBL4TAQ2DK4QUDWQCPBPVMKD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASRC can be used on memory to memory case, define several
functions for m2m usage and export them as function pointer.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 228 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.h |   4 +
 2 files changed, 232 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index d22f0621c465..f17a185a1910 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1861,6 +1861,224 @@ static int fsl_easrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_EASRC_FIFO(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_easrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_EASRC_SFS(index), &val);
+	val &= EASRC_SFS_NSGO_MASK;
+
+	return val >> EASRC_SFS_NSGO_SHIFT;
+}
+
+static int fsl_easrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	ctx_priv->in_params.sample_rate = pair->rate[IN];
+	ctx_priv->in_params.sample_format = pair->sample_format[IN];
+	ctx_priv->out_params.sample_rate = pair->rate[OUT];
+	ctx_priv->out_params.sample_format = pair->sample_format[OUT];
+
+	ctx_priv->in_params.fifo_wtmk = FSL_EASRC_INPUTFIFO_WML;
+	ctx_priv->out_params.fifo_wtmk = FSL_EASRC_OUTPUTFIFO_WML;
+	/* Fill the right half of the re-sampler with zeros */
+	ctx_priv->rs_init_mode = 0x2;
+	/* Zero fill the right half of the prefilter */
+	ctx_priv->pf_init_mode = 0x2;
+
+	ret = fsl_easrc_set_ctx_format(pair,
+				       &ctx_priv->in_params.sample_format,
+				       &ctx_priv->out_params.sample_format);
+	if (ret) {
+		dev_err(dev, "failed to set context format: %d\n", ret);
+		return ret;
+	}
+
+	ret = fsl_easrc_config_context(asrc, pair->index);
+	if (ret) {
+		dev_err(dev, "failed to config context %d\n", ret);
+		return ret;
+	}
+
+	ctx_priv->in_params.iterations = 1;
+	ctx_priv->in_params.group_len = pair->channels;
+	ctx_priv->in_params.access_len = pair->channels;
+	ctx_priv->out_params.iterations = 1;
+	ctx_priv->out_params.group_len = pair->channels;
+	ctx_priv->out_params.access_len = pair->channels;
+
+	ret = fsl_easrc_set_ctx_organziation(pair);
+	if (ret) {
+		dev_err(dev, "failed to set fifo organization\n");
+		return ret;
+	}
+
+	/* The context start flag */
+	pair->first_convert = 1;
+	return 0;
+}
+
+static int fsl_easrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	/* start context once */
+	if (pair->first_convert) {
+		fsl_easrc_start_context(pair);
+		pair->first_convert = 0;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	/* Stop pair/context */
+	if (!pair->first_convert) {
+		fsl_easrc_stop_context(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	unsigned int in_rate = ctx_priv->in_params.norm_rate;
+	unsigned int out_rate = ctx_priv->out_params.norm_rate;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int in_width, out_width;
+	unsigned int out_length;
+	unsigned int frac_bits;
+	u64 val1, val2;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val1 = (u64)in_rate << frac_bits;
+	do_div(val1, out_rate);
+	val1 += (s64)ctx_priv->ratio_mod << (frac_bits - 31);
+
+	in_width = snd_pcm_format_physical_width(ctx_priv->in_params.sample_format) / 8;
+	out_width = snd_pcm_format_physical_width(ctx_priv->out_params.sample_format) / 8;
+
+	ctx_priv->in_filled_len += input_buffer_length;
+	if (ctx_priv->in_filled_len <= ctx_priv->in_filled_sample * in_width * channels) {
+		out_length = 0;
+	} else {
+		in_samples = ctx_priv->in_filled_len / (in_width * channels) -
+			     ctx_priv->in_filled_sample;
+
+		/* right shift 12 bit to make ratio in 32bit space */
+		val2 = (u64)in_samples << (frac_bits - 12);
+		val1 = val1 >> 12;
+		do_div(val2, val1);
+		out_samples = val2;
+
+		out_length = out_samples * out_width * channels;
+		ctx_priv->in_filled_len = ctx_priv->in_filled_sample * in_width * channels;
+	}
+
+	return out_length;
+}
+
+static int fsl_easrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	if (dir == IN)
+		return ctx_priv->in_params.fifo_wtmk * pair->channels;
+	else
+		return ctx_priv->out_params.fifo_wtmk * pair->channels;
+}
+
+static int fsl_easrc_m2m_pair_suspend(struct fsl_asrc_pair *pair)
+{
+	fsl_easrc_stop_context(pair);
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	pair->first_convert = 1;
+	ctx_priv->in_filled_len = 0;
+
+	return 0;
+}
+
+/* val is Q31 */
+static int fsl_easrc_m2m_set_ratio_mod(struct fsl_asrc_pair *pair, int val)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	unsigned int frac_bits;
+
+	ctx_priv->ratio_mod += val;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= (frac_bits - 31);
+	regmap_write(easrc->regmap, REG_EASRC_RUC(pair->index), EASRC_RSUC_RS_RM(val));
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_EASRC_FORMATS;
+	cap->fmt_out = FSL_EASRC_FORMATS | SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
+	cap->rate_in = easrc_rates;
+	cap->rate_in_count = ARRAY_SIZE(easrc_rates);
+	cap->rate_out = easrc_rates;
+	cap->rate_out_count = ARRAY_SIZE(easrc_rates);
+	cap->chan_min = 1;
+	cap->chan_max = 32;
+	return 0;
+}
+
 static const struct of_device_id fsl_easrc_dt_ids[] = {
 	{ .compatible = "fsl,imx8mn-easrc",},
 	{}
@@ -1926,6 +2144,16 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	easrc->release_pair = fsl_easrc_release_context;
 	easrc->get_fifo_addr = fsl_easrc_get_fifo_addr;
 	easrc->pair_priv_size = sizeof(struct fsl_easrc_ctx_priv);
+	easrc->m2m_prepare = fsl_easrc_m2m_prepare;
+	easrc->m2m_start = fsl_easrc_m2m_start;
+	easrc->m2m_stop = fsl_easrc_m2m_stop;
+	easrc->get_output_fifo_size = fsl_easrc_get_output_fifo_size;
+	easrc->m2m_calc_out_len = fsl_easrc_m2m_calc_out_len;
+	easrc->m2m_get_maxburst = fsl_easrc_m2m_get_maxburst;
+	easrc->m2m_pair_suspend = fsl_easrc_m2m_pair_suspend;
+	easrc->m2m_pair_resume = fsl_easrc_m2m_pair_resume;
+	easrc->m2m_set_ratio_mod = fsl_easrc_m2m_set_ratio_mod;
+	easrc->m2m_get_cap = fsl_easrc_m2m_get_cap;
 
 	easrc_priv->rs_num_taps = EASRC_RS_32_TAPS;
 	easrc_priv->const_coeff = 0x3FF0000000000000;
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 7c70dac52713..c9f770862662 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -601,6 +601,8 @@ struct fsl_easrc_slot {
  * @out_missed_sample: sample missed in output
  * @st1_addexp: exponent added for stage1
  * @st2_addexp: exponent added for stage2
+ * @ratio_mod: update ratio
+ * @in_filled_len: input filled length
  */
 struct fsl_easrc_ctx_priv {
 	struct fsl_easrc_io_params in_params;
@@ -618,6 +620,8 @@ struct fsl_easrc_ctx_priv {
 	int out_missed_sample;
 	int st1_addexp;
 	int st2_addexp;
+	int ratio_mod;
+	unsigned int in_filled_len;
 };
 
 /**
-- 
2.34.1

