Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E59B4044
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2024 03:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BCF1518;
	Tue, 29 Oct 2024 03:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BCF1518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730168012;
	bh=oROrbigEnbxBbJQZmQCz+t1ZoYRdoE4L/rIVMdGvE9E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rCNvxgUjXfCTRLD/Vw5pI5YL2HmuEkgn+y3yHAR2jy6ddxCKdiyyRm2ManctIbPP2
	 ngZf7ax0yY5vRQmbiNdMfXJShqfq8NqYLo6UZx61tfXv22t82la5r/tNU+b2y3BOcG
	 4NEAYju3/FNJ9snQZ4lwUhS2+xrHyv1G5PLFL1lc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFDBAF806A8; Tue, 29 Oct 2024 03:11:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA655F806A0;
	Tue, 29 Oct 2024 03:11:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E724CF80605; Tue, 29 Oct 2024 03:11:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6685DF805E8
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 03:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6685DF805E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=E7LMXz12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apPFZ3jvfwTYMeKUmjYcmRSzXRnT/Wc2mqS/P6rDGaF26ZlDAMwgj+H+A9XaRRqQ0caggmcqzjP+XFOmUbmYMEl6t0Y18Ji1vnyElthjQCAsOPTi76/v169a5CSHP1A5vLFQ3C+ahMA+jpUv3RF088rGNtMycfNobMo2MdnwoKqxKppE3OzDPpKg/pY6I08t/mUevuguTqx0Hus4d4DJppNDNInoelAzuWi3rGswb7tdVsmFHUsscCvHbuj4ucYGAMnX88KaHz2iDFLWsMbSk2vQTnBoMrqp22hjYQA6qIHzSwOCaDFHvHGGVYDKCXgQFguV5sAug/m5o/FQnVaByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=cP5g4Zbt9sQ9EbwwaD6e1d1Zp5OOV1Q2743J1gGBoNG1LK54KW8PBpZcn1f5EZeNOVKUpGpY5if9PHRAnycesKeuK0/KsVUfRHQb1rYtfhfLmkrbztXYIS+iZhHI0tb5SwlchY/WgGmFOlZ0XOZNFhZa5SvDzuWa6wOL1utpVPwFlVMjf6CaLByR8wtNAuPaGAUbsNSzYd+08nc3Hwx4m7NBdg21YCNQ1QXn9rGEQi7T9HXStzwxinElCF1ojQDocX5ak+E+swDHgxi8mNN5yTVbxCBcBnvtMadQK4CDTCSrP+SQ/cFA6Yp4PTsQJW+ica4KCoa9YZzoe25hBiPzSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=E7LMXz12oYjBIXSmkGyreSOxg2zwTYpCaD6amLdiMX0ODhuykxHQftAFQseXo2ZNG0rfZRYpNtMbLEtIXmov/TOVw2Ebyv6cFWLTnILR+cWcAvqQ3Vr9s6YHZHHJBvesHwnM1dJBPUL/NGMzV5+HolUt4ptgdF5VaVBZOOuGWQ19cRd1FEP4+RjBZik98sewAWzvgnUgDVFKdDrRCis4B+j48XUqpELA9iTaQtPm3vQBJ3ygWF8XB/Y+tRrxrsNVGVDyq+rdI2lovK069UKRLmvJ9VsQ/oFR2Ms9zmuiqX3RylaRLKSgQIW3B67YVYuPqeDYWBMnyu6eUQf5l2CyMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:11:21 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 02:11:21 +0000
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
Subject: [PATCH v5 6/6] ASoC: fsl_easrc: register m2m platform device
Date: Tue, 29 Oct 2024 10:20:57 +0800
Message-Id: <20241029022057.816402-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241029022057.816402-1-shengjiu.wang@nxp.com>
References: <20241029022057.816402-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 69298e5c-ef12-41e4-fb96-08dcf7befb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CSn5g2pj1+RrIIq2+nsWDMRV51vRg5EAhG94ssvjkDtrp65KcPOuO71xxlab?=
 =?us-ascii?Q?tYM63mfNgDq30X++Vt7fuTNj6/OQoHCF2PEW+Cw9MHPn8uNcpUa9m2spAotd?=
 =?us-ascii?Q?qtt8to/DzP4K581F029Ir6+6Z1lyrxGK9tw32PfQrDeJB5V1v+IdYjJuTkkt?=
 =?us-ascii?Q?/hDP7a8u6WMAybSnuD9Oxeh6+iSThJ+USTUdvOLxHyqyryjtUn4fwLj1OhGY?=
 =?us-ascii?Q?Z/6of4zvyRcWfIF5faF9zPYXdZSTLp+AOcZ0yje6pSZ5CqgPK3iPuA3ThUIw?=
 =?us-ascii?Q?hpVzFP3cwbX+coV2hcG6Z4iidO9anIewNfVNHCWnf8xZ1YJRrp8N++gsXx/r?=
 =?us-ascii?Q?N5LK42GjJs3JC3ifTe2AeZtUpq/yIeev5K39+I/FueaeBqvf4gPpOaLvsZ4J?=
 =?us-ascii?Q?TUjZ/dxOKEjsSBls8v1TZre7yRE4CLFJNQ97Y9I/Xdbud7xGXacUvcgssckl?=
 =?us-ascii?Q?XhMaTTAj+Vg00p0YjE3Xs4YFJQnRkwdmUCf+UUgiBmgxZv24vVNFH/mfYqGS?=
 =?us-ascii?Q?mXGGsIp0mYrwd+fx97iiJeRoZgMQyOC6X0OQpekivpRm4xilpNuwbN4oo1r3?=
 =?us-ascii?Q?wOoeBuHkgc7VGp53xwyjlPPqgvAojI0KNMBwOxK9NOBaIMhC9TUZaRlnGOAv?=
 =?us-ascii?Q?hEgnu1jSbZ/EJ8bfA5KQegQakvcMz/0pityYLOuQQCdOygTLwWPCZ/pvCZp7?=
 =?us-ascii?Q?sk9RDS4dTKKKGHAeX1wzZl7DRjAfddChqr1y7ltBTVj9iG2BcezcVBwObHVO?=
 =?us-ascii?Q?Ntt3jSKZJICsjHUyBxGd/NvPHqjplML4ZNsZ6FjYwAp1KAfqMwl9iqQDM8pH?=
 =?us-ascii?Q?qjKbSpfzgJQ9EUySUHztveDrh8kAudD0mZKo4YEHm+t/DqANqGFr0mDIhkk0?=
 =?us-ascii?Q?gpdMHQDEo9nZn7OMFuBQkGRj0DhCWEOsnhZH7s6aNIAVohcPthEL5yo7cSiC?=
 =?us-ascii?Q?umu2mtk4NFrh6BmOvCnjJnMV6s20arjvMPHfwOUp+897RL2vSQ/FRKKawgEL?=
 =?us-ascii?Q?dggq4LDmhtSBcPgK05PdLOyhVzUlsVohYnolsQ8LjD3/8Nj8KmuQLl42xcTS?=
 =?us-ascii?Q?aTmUlYxLRdPiDf3v7Tay1Nm9TnxgQjlfqTC/8vAdY3mlmhMJkJY/UgLDrmrS?=
 =?us-ascii?Q?Rac/zfo2W3MhRCPLue7XzJ/rGSGgrsGNTc4XnUpPBNyh2o7kDp6t4zAU8h+z?=
 =?us-ascii?Q?MkFP+0Bh4Nzxd6Bk+fZLU+0f6UIrUS5rnPdVDb+h/xwoH4aNTwg2Y2AIE+lg?=
 =?us-ascii?Q?xNgrTUrBb0gS4Q/owiWbkiLnlukApMAg2cS2qiXFFyVRtcRgWEmH/HjQGXfm?=
 =?us-ascii?Q?GzuCnteBt3AmSNrgUpOtwR/90z+h0iTyAkm0D6fLgcblHUID53K5pYLjEPqA?=
 =?us-ascii?Q?onL6lv5hT/AsdDwT2G+e57nUpiK4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OI42LS+///UHlb5BMi3EIb7FRcU4k6At9klKP/lcgymEI2WVEvd2o4n16djJ?=
 =?us-ascii?Q?elg4IrkORR7KyFldTD+BK3ZK5b8vu/x9F5EtZwXQdI8EjsBQiEpD5hpzP/d0?=
 =?us-ascii?Q?XaoDou+iQ5RDfll6E6wbxDp0yh1Ys1vinVWzeGEXN/CmJV4xWDNsUqR/qs04?=
 =?us-ascii?Q?boIjW8gmrOU4oLaOr2+ZU1H2UhhY6orhyVy2JOkupjRrNbHH7XJ/bi8g2qb2?=
 =?us-ascii?Q?sZETG0jHLhjoh5bw8tzMjp1cE30do+/MGfNH17mEtT35ak6sogIGu7IzGGAO?=
 =?us-ascii?Q?eA+cEUySOzSzpkfyYDHUmZ1jc84R/gJ4Aol0uwHFeHMKxUzMXjPtrfy87ALi?=
 =?us-ascii?Q?FYxEOvAcAQnz6cWo6YJ50RaPbyjB5Id0qSe780Kva7hM2dt/eWRBu75WU/Kr?=
 =?us-ascii?Q?CCOzCGGjjq0BC8ezPGN8DpRcPkHKH1miky2Egv9r/g7VHVuUqEHJQB//czSX?=
 =?us-ascii?Q?BFo4xE87f8SDuwT4DTAMf94h9VCBaVzxxSD4QMWRkSKveCSigiKPUxRhFE1G?=
 =?us-ascii?Q?Qh3q5myEDNs1m45DsLfn0rrUhrpzc3j6L/hvqyCKXAyVUJBTXcEzjmcNDpPF?=
 =?us-ascii?Q?sTdU8pcum1lXCpHvwNrs4jUJ028hshiTqw00xigL8h9BYyn0l1SJ3E2C2aAg?=
 =?us-ascii?Q?U5PZEJrZYUHRE9RMDjnE5EbvI6Fyd9fQqxu0p8+SNbBOR6ANePKx4bCEH7Y1?=
 =?us-ascii?Q?03FDOIytNrI7E94xmhlt8MinNe5xYm4XxkHILcvcllSN00aFNm6rgo5C+Wy0?=
 =?us-ascii?Q?+OqnVwfGiaJ3bs1ReqQR41VcLf7LktuTN3/V+vCXWvuOMnQtpGwreqStC6qz?=
 =?us-ascii?Q?N1+xyBpxNSRfZcZnFnXBYDbotvYNpR/M3PbHxKfQ1gtjybMaVpwr7NAVhrMB?=
 =?us-ascii?Q?TQRWQZeL/3aOu9ZQFTNFSXSFNqLVXER7ho+yefwXtGDcRqY7/DlS8XHzBj6w?=
 =?us-ascii?Q?A6BSp8gjMfar+gqdVsaUXPCKHLN2LNhhaJ92jNBys7Q9O5N1Hsw/Vfq+gqdY?=
 =?us-ascii?Q?BPXCpc/pxOoHx6Hcn26OgNaKE8cMP8TzxOPnFN60QTymwmCGXNa7653gonVN?=
 =?us-ascii?Q?svQqq2l1d4FfQClCcCdSLjzHyU29Euby8V0M2xJVAgU9d6ra+R3LNkQFBVp5?=
 =?us-ascii?Q?QQjBzBL3jpEwdhQl5gU9DV8AlGsO0CIHbFBHllaL3ZDvvw3nh/BLdOeqj+N1?=
 =?us-ascii?Q?ILrSZCTXAdcervPEfZJ8nR9pA/88S8nuq6n+yVAenkMu5tn9l9l1XOG0SqbX?=
 =?us-ascii?Q?MZtvb87cRQLxZzd56CT9dZYpwzyOqGzgZAsR/3t9g+Qy7d3pf6A9nN/AnvEQ?=
 =?us-ascii?Q?rS0dIqfwSL4ONIF58xgkN5NqyOL7NRDSS3YIa6OMM9DUSEpMgFgSY71RJUlv?=
 =?us-ascii?Q?MB9cKea//ffXFGdsRKtb5y9TdUq5mv6TdFyyvrZ27CrrvxDR7Gc0csRLaBJp?=
 =?us-ascii?Q?sf0aE8nMLeBFPgiPpAQ8Er3L2tkKFyZW73CVprJOsrEIng/IfeRVlMWUTMwn?=
 =?us-ascii?Q?ewpQp7GX6n86oK+Nqv2ygQVL56sYIrvKRbNXHEuyJ/2iINbMNPDzV8WvR41V?=
 =?us-ascii?Q?JY5PXtJKXHCKQmCr6KhXfU6rq4ZWyZ09zZiWR4ZU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69298e5c-ef12-41e4-fb96-08dcf7befb71
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:11:21.5923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Grd7qM20T7rOtnabkVaTjgNBercQV4Din8A2QQoax4Dtky9WzwyQ/UIvFsYB4+dM8raSTWdG4X2W/FqcEafTNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
Message-ID-Hash: 5FZRYSPYXVPIJG4AVCDL3WYBQ6AZEPOF
X-Message-ID-Hash: 5FZRYSPYXVPIJG4AVCDL3WYBQ6AZEPOF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FZRYSPYXVPIJG4AVCDL3WYBQ6AZEPOF/>
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

