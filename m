Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7136A100EA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 07:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A98186027C;
	Tue, 14 Jan 2025 07:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A98186027C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736837114;
	bh=hbQSvL+RZ+dK5H672vCTuygIZfgQsm5PV5q8xyDIvxI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TbXbTGvu1DIWxyPOvFxTodA4Eyo2vTGmbkgRu9QfxffmGHa+N4sws3meR+AD7MUyM
	 Zqab76AvMnBWId9eAHi0ImVGcqhI8DYLtYEcSo0qbQOgtfdhHbwT0pw/w6g5Ak3dAs
	 Xv87lw5Qh3q6d8MLoh8m68Z2c48/VZAELXeEyHMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF0CAF805B1; Tue, 14 Jan 2025 07:44:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FC22F80551;
	Tue, 14 Jan 2025 07:44:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FC4BF80510; Tue, 14 Jan 2025 07:44:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 926D1F80169
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 07:44:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 926D1F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RlxkT4xB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht+wngU+mSib37VU95QBxW2Z1EosBsIPIPJTllHOAuKhKYD9CwZ7g+GRMroWDSMsaVk+6ivkefcgY5ea6sZ4by6/NyxfZGkhCiwrmY+vhUwynhcSSbA71TtzrWxa1wrqg1RLpTdkqhUYzRRNFqM/w2M38tMx2KwDBjzDBt8YN+oTsNFKQKSfgOP/SeZrLbT5mXmgdpvr0GK8N++BC19yJ7ufVM9/kvg/IQ+/z8fHizJG0QIdtPivT37EdFZ3Lr0dgS5LUFvRM6xVwQkhNJzFHDvyHzP0dKO9fLW9RIx1zyF2t4KiQWQ83l/BSwkgmwrX0/5QvaKQ/Qv2XH/McLl3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qysgao1SJKFLOBniJIF/XoILkC+Nk6DH2v90vB0lolM=;
 b=u3q9Y1eOzxEFhuRguC2a5KFvP4zzWoEgnmYDB94/F9Ks+2U5cUzI7l5Lwf7ZkpTX6Krj96DzSA4iuDd4gJJ2/3IbemB9jEvFE/7iRGR6K2fexo3VRNivMxy5u3QCypjwQCc6nDcyTqIq4xNaBp2So7BcxcBLx0NJW2DxFCKAcTs8jTa/eESNuqnzutqttxSAOVZ00u5JHDIV5V6BvY9wfGxKSK93GgHcyu7oYfVcWOP4lrS+dH3W7YA7ErtvpmqP/HtopIQONQVaShah2+FUM4tneSoApkil7TldtxYL5zLwH08l4QoMFRUZc6ytyUaQb8dLbHhiOKSWfPILn1zRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qysgao1SJKFLOBniJIF/XoILkC+Nk6DH2v90vB0lolM=;
 b=RlxkT4xBN4xbyvqimTdjRt6Zm6oAaBA/l/7/V4pOsKvqaDCc8WRzrpuwELtuQFZ2SdyiQHrurigs/g/8TdFvMc0ivCYFviBt8eiSWJ8qsaU1WFCslPSSNwtjisvQLi1nzbFwLyksnJSUVwGAXoKG8VyQoqtTYZyoFdeBWOs+EJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11341.jpnprd01.prod.outlook.com
 (2603:1096:400:3f0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 06:44:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 06:44:26 +0000
Message-ID: <87y0zdsxme.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tony@atomide.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
In-Reply-To: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Jan 2025 06:44:25 +0000
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11341:EE_
X-MS-Office365-Filtering-Correlation-Id: aab413d3-30a6-4cc4-1f3d-08dd3466e333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0fm9pOtUo7yWyERfj6HcaK56ILRN46iUk89YzSksGtA5N/WiWROiJ/ctr8Lq?=
 =?us-ascii?Q?0Zym9cZsLcXGi7weYPqEv/FRkSwLm1DP0wwntxgSVFA+GzoGlCb6FYOJ9kkX?=
 =?us-ascii?Q?6ttHRTBJV7NL9cq51E338Un5xKKTAzvRTZDhvxa6O9Sv9TQgvCwbIsP2IKMV?=
 =?us-ascii?Q?MIufOwD37NpwUYh1tjT3haZYzl3yyl7EbqRLn3w/p3tG/qwA8tHO/cB6q79Q?=
 =?us-ascii?Q?nb26k0Vu7hEDrmR6d2Mtw1VQxXWvLtyzVxQCBuquP/MJLEkHMyJCruCxKobj?=
 =?us-ascii?Q?kV//x+TkcEMIT3C2gr+obu+MTOEF3yFI9ma436Sve/voJbxWUCv+rj1TCASm?=
 =?us-ascii?Q?gz3ek4vYnxyrYP3bWSrg5kfgeK5CFTWzVawFn/t1jT1urJe98oz/ltn1Ax1x?=
 =?us-ascii?Q?OXXs95QMjIpjWg2u4MIA4M4BjryHiVeMDmUvu/14QoEca5PIJctOBfapgKyU?=
 =?us-ascii?Q?/EaJ4SrKFnz7F4dYYSc5hCM+h+LdkfPEPRnQvHOjiZlr4Trv711AxAEdk3W5?=
 =?us-ascii?Q?WqhwyQ/sjjX0TgQf0cIRyIln6sj/K/kovEgkUIqFTPSNGsRoizvJNDgpOpcj?=
 =?us-ascii?Q?lk/aTb0WVDC9uuIraTZzbv5vu/jNpqDP/vsXj+RHKxYPTcEm08/EwC1UG8Zt?=
 =?us-ascii?Q?cFDgiBjE6ycTMGUvZ2n1RNH+hutsmNlMN/wOG2Jv89QUolWJlFQbDU5fieJr?=
 =?us-ascii?Q?rXjTTQ7LWocPiREDC2gevCgdlL7QojHSQaRFPfRrcNoMW9sTrtXG5IsQOdcZ?=
 =?us-ascii?Q?Bygk4ELsoRGFqaIRvNZzRMSBaRcjULWTetatudel9meqLczG3SNpDPBt0QdG?=
 =?us-ascii?Q?bvVczTNJU7zfEUV8uSBuoQnq3cnXwguS+BY/XN7SLCRyAPlKmDCm7TtSNM27?=
 =?us-ascii?Q?x9Z5mcLBY6XZKRy0fGpM5ELyX7E7McECGAH7Mb0RQXREV4n+O0lrYCAbd8mW?=
 =?us-ascii?Q?z3QCop0zFVg1mklW2OhEcWI28r/VSEX10WtNvIZ6tTNrYhEvKmcLJNJkf34e?=
 =?us-ascii?Q?GH5hLPBKGT6p9WQRaEWKxxJe+PGUh8ndcSgQbNyPFAMH+uAeAm2OD6WHzB2C?=
 =?us-ascii?Q?12KaT9u1LPG5T8dKg+zVt/fYFCHpackOUnV7Edld8yrJdAoptiiE3PaUEIED?=
 =?us-ascii?Q?GkygTZ5LTdZWPoz9L7+E+uSGWkpnQMT1h58oG3ekstFKjRk2i+grGhRdzHLO?=
 =?us-ascii?Q?GzYnZ4E1kmoF9b+wPcOhDm6lbyXZ41zwVYAhtdGp9jfBk/N6lo13ZiL/vn7U?=
 =?us-ascii?Q?SEPHQX9mjqwYp58i1rWYBxAovgfsrBu9YIqDRszunYXQcOgE8DZG80PYKXhL?=
 =?us-ascii?Q?kKsG2+qFtcDNAR0fgBCm3wXFlf+zR6FjSKcueQPQRIEvqQwIPd7PwNGmboxD?=
 =?us-ascii?Q?AVnkJ0ebRE4nau7coAksJd7W3QHM8YiUYYhUF2HO+4QdT97CU5axKB2uIyfW?=
 =?us-ascii?Q?p5g3m2zNendq28D6zWjBgRkoWjzhL7g3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pNfgrdcHowXVPqeStX/e9xorHNyFqnL8nY1byQj0V9iL4ya2lh1J5ziC1bLC?=
 =?us-ascii?Q?ekXjjLRVaYMZmYsHRRgXb8RgcRHh+r4Ig/nLoFkVhGKfbTd3k+df2mTRreWn?=
 =?us-ascii?Q?E/O/C/JigFE8D+UE9nIpQjowCk/A2M+nWtMCsqYxH4+R6cnGuuVTZ7BFxbbl?=
 =?us-ascii?Q?0SLq2K6O+O23lqpiNTiNMZWJ1GSBh9Nv4enjQa+51CvyZRLzkIllRDAcBYsK?=
 =?us-ascii?Q?mKq82XrazvAGM430AmBu8YM9sgTKF7uNboZAQl4YiynV/pDbNkedsAonT9Sr?=
 =?us-ascii?Q?89ZmmIPa1LGTbyRYhv4esMviJhDbu2BwtxP59UuHaHKdtpNojNW9dplVEWGm?=
 =?us-ascii?Q?IBKb9y7YytfkfaULzyjXhLjI4/bpCj9fl4APOCcHueS047fNfPPZWGKwoDAo?=
 =?us-ascii?Q?LX4+GUW2nyYQDKmc5XI8IB5ZprOeXDDv/NvE8HcP9OM0Ax0At/+BbqqdKDuf?=
 =?us-ascii?Q?HTb5Y2kAX8uuxB/8f7NNJa/1Vf547yNCBJUK04mU5fAsr+I3E2QK42lyFROd?=
 =?us-ascii?Q?BWkZERHPaLlESInP4Pj1Uo1q8SIt/z/2wZssh9Ag41h6OeI1bxlsk9GL24IN?=
 =?us-ascii?Q?sASYnEDfNVL2y/kZCFelyb3wxQiyVhpGB30i5e/N3YqqgpyaKqQu8Y4CG0+m?=
 =?us-ascii?Q?8N12wNYnscsUMo//L4cAJP09QKpAtngHPRijgzdmuYIBC7Te2jWzREpPtoCV?=
 =?us-ascii?Q?1cF5bTNmh3VdKJUZWLQnUhzn+b9OR/fobhmpnlf7Huj5UWoKJxflPymmepWl?=
 =?us-ascii?Q?mEeRPRMJ0aQJq6MEOIE2UBuNAkb/t+VNQ7PI3i5KTf/l3yVhNP8xKsxgeol1?=
 =?us-ascii?Q?a7pl67YsY/8WHrHw6RxTLpijWvvUUUS3Lyv+Dhbt9T2kZgwC4JdABUT9PEbG?=
 =?us-ascii?Q?ts4m+o+78qr+72K+lOXkgV0MvY8fHR/pY4oHF+P7Qh9UE/QK9d6hEAjBU5A+?=
 =?us-ascii?Q?2mTg6TdW9Th+gjk08WXg4juQjiRLBpK/lL0myNT1OSS98p7iyGPm1IokczkD?=
 =?us-ascii?Q?KBusaDXMJvRqvH60LP9I564Dkk6WUDYRhiaD3c9iXL+biDseOL4dNXu10QLT?=
 =?us-ascii?Q?YeY53EaZ8lyMJ4A7xZ5jei8fTp//GCjyZWVz8bqVb3E6SEIfzbKZTQdsMQep?=
 =?us-ascii?Q?CO7mqyvoqwr7uRy5OQqNEyK97eMI5CfVSyX4jFHwfTdfIlCF4x6kaenuVsJZ?=
 =?us-ascii?Q?HtQiqV2oAaVvX0trjEUKm7RIOjX/PCB6sRz4q/6OA6i4cZUFmWEUChifac9T?=
 =?us-ascii?Q?QdOCm1MkUOA0fZF+7EiJ/e6Pp0eXQFMyd/0eoiQDw1Fm56f0WDJHnEdgBQWX?=
 =?us-ascii?Q?xNZ2QpTR2CKD1UM3ZM02FYV+Lp72JWHqXZOdJbvAJYdMCcjPch/AJOK8w7Vy?=
 =?us-ascii?Q?lqenlQ0aCDNH2ImvP2BkXTUE7MAvJZ6gJbuaIahoZzpiz7Bkdwu0xbwJTMXU?=
 =?us-ascii?Q?wa360X5agmgcwxOmZbqWuwCJ+KGStY6fEOlVBSHwam0HTvnR5aFyRcydRwQ4?=
 =?us-ascii?Q?1htin0UW4ik0AK56/itT0ikz5QiVa0TlpHAg3RpkSI7gkp1345RCPJ9I4z5a?=
 =?us-ascii?Q?WxeRSqBfZv1mEqIeDG/yUjiblFG2V089x/5xVL+qQSlPoTpvHcLTs2ZmYI+P?=
 =?us-ascii?Q?bzhRvWmxwevXrIB30yzt7HQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aab413d3-30a6-4cc4-1f3d-08dd3466e333
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 06:44:26.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rfzOTolE7dTB2mwUqp/+lJP860yqmgN/J5eX1QTSrTFQdU/IegC/GSi/p0weP8jch+TKGaLr86NHVvFwV0NvqABRJHqPD4b1w03C9wBnuewHxrXmqXKdMcsn5awpNVFH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11341
Message-ID-Hash: ZPP3OEUIOJPBESGWW5DH4BBLESFBC5ZA
X-Message-ID-Hash: ZPP3OEUIOJPBESGWW5DH4BBLESFBC5ZA
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPP3OEUIOJPBESGWW5DH4BBLESFBC5ZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Ivaylo

Sorry for the late review.

> We may have multiple links between ports, with each link
> having different parameters. Currently, no matter the topology,
> it is always port endpoint 0 that is used when setting parameters.
> 
> On a complex sound system, like the one found on Motorola droid4,
> hifi and voice DAIs require differents formats (i2s vs dsp_a)
> and curently it is impossible to use DT to set that.
>  
> Implementing the change leads to partially dropping of at least
> 0dedbde5062d (ASoC: cpcap: Implement set_tdm_slot for voice call
> support), as core does most of what is needed to configure voice DAI.
> 
> We (on Maemo Leste ) use the patch (along with few others) to have
> voice calls working properly on d4 through UCM.
> 
> The patch is for linux 6.6, I want to know whether the
> approach would be accepted before sending a proper patch for
> current master.
> 
> the original commit message follows:
> 
> When link parameters are parsed, it is always endpoint@0 that is used and
> parameters set to other endpoints are ignored.
> 
> Fix that by using endpoint that is set in DT when parsing link parameters.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
(snip)
> @@ -684,7 +683,6 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>  {
>  	struct device_node *ep = port_to_endpoint(lnk);
>  	struct device_node *rep = of_graph_get_remote_endpoint(ep);
> -	struct device_node *rport = of_graph_get_remote_port(ep);
>  	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
>  	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
>  	int is_cpu = asoc_graph_is_ports0(lnk);
> @@ -718,7 +716,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>  		dai_link->dynamic		= 1;
>  		dai_link->dpcm_merged_format	= 1;
>  
> -		ret = graph_parse_node(priv, GRAPH_DPCM, rport, li, 1);
> +		ret = graph_parse_node(priv, GRAPH_DPCM, rep, li, 1);

Please correct me if I was misunderstanding
Is the main issue "remote" side endpoint ?

You want to parse "remote" endpoint (= rep) directly, but the function
requests "port" (= rport), and it will use endpoint0 ( != rep).
Is this the main issue you want to fix ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
