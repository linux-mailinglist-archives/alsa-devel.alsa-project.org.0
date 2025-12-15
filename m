Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE962CBEC04
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Dec 2025 16:48:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CC96022E;
	Mon, 15 Dec 2025 16:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CC96022E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765813721;
	bh=Y2mlRswSCVEqgBwlcRccDAeretBAXJkucMZN41HKaGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i/+ukKLIoaeQ1RZfafVU+T6+w4f2WSBmnr3M6tUS9XbNWfNwJUmrr7GYAoqvonqW8
	 jlapwwsDt6YRPhA355tGfxo4yz/Cth+0qbnKjTKJeUN7qMEdHVmn4nApSE+VW7n7MG
	 2cw4byOiDI9B8p1IV6dFhr8S+GACsZQLF1+Jx/ck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E23AFF805D9; Mon, 15 Dec 2025 16:48:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E85F805C2;
	Mon, 15 Dec 2025 16:48:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E35F80169; Mon, 15 Dec 2025 16:47:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9457BF80087
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 16:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9457BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QxWO3lCE;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=Ko6iGSga
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFErqSX3055475;
	Mon, 15 Dec 2025 09:47:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=EB9cVPLDCVlD++DynF
	hxP5wa7MgTWXbz802mOn7lcKU=; b=QxWO3lCEyXtaYJnti/zFRkOYLZEhXREJTK
	pwYitkkB6NChMmtDn6pu7ATTsZCoXmlj22V0Y6ColMnHbxcbqoBgTotmSFh50tfR
	XczH05RD/K+LNgUb5Hya0gDyEBemAKrfasvh7b5LqfhRMA5/JpNvlTcbjAgyqEgp
	xU7ptK2UAbm4BGUioXKr9yerSgjKgGLi6YoyaxXbHAtlxKbEpWwj9225W334T5ll
	HO5QwWcbVyB/khZb7pOF/RY8+JGzk+hHOddI0K7s6hS5GgxmgCjs7Tyocla1a/Qo
	3bIEcMlp7sXrUnjc+ZR7XeT6mSJliwI7QNWUfjvu4SIho+p4v9TQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11021112.outbound.protection.outlook.com [52.101.62.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15eja45d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 09:47:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itPjrvGqcfD/N0rLe5PUqwPHdk8CBauJslSsJWgEVzNspmR+lj7WwEOUmuYmHzTJ8789mGm9pzqgboK1KPs340Nk892cjUEv9j/hsIBjtLE7F3RbirX5FKmCv1y8jgKlTG3kYRh2LYYNnHdadk9gcqJi/vaJ2F+La28Bayd85x1ArkQdH5N4K0fN5Dvl1UbzefnvJx0YfH0b5jOwUeBDXCzto1eZkBDXQ8JO4Om5HQoRsOy54NPG/1qRgwjWoDAvIjDsj0JBXi3cfd+RT1I4jOSleENeGmgV4ba0gEg1K99Flapgi9UXYxiVGU0Z3QcWSuwItcWGVuH7qoGFUfkdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EB9cVPLDCVlD++DynFhxP5wa7MgTWXbz802mOn7lcKU=;
 b=KTqso9qLCBhKUOZynrS+A35iXeEGuLgHvv0TAn/0iHRhkN0tDMXt8cs4cGBQn0TmVRotFEzZR4K0TydshWT3O+Flut3+wE3WYxYZB4Q5WJ72kfgwVDjhm+xawBVn9JNu8YapAQP7Pt7M1KShew/Exbj16YQtgdiZ7/Y37hLF3XnZ2fwpXZ9+/V7ieijZamNCVZ+LITSGKgyJn+8tEx3vDTOGMAyd/SQcvBAjZV/XM2QyPPDzgM5Z5W9HyxOpy80W8vSWP4onUARLswW+nHa0Kvs6Cr8JqKx7/O/pkahRjQyEAFcyIbnBnsD9qPmGxWQxJf3aVMT+nD67MrAIhikkPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EB9cVPLDCVlD++DynFhxP5wa7MgTWXbz802mOn7lcKU=;
 b=Ko6iGSgac86jVI+c50dCutn/vyeGL4DVzdWagZ9EutWr1Taq+aCi6dENwBNdH0kNFcAF8RsnxsGkPj5hwHT+CjMN3QZrNlZKI4gB/THhxKADLKnZQrh4mR74RK8DK37bRDi1njanpYjnCOf3S+PHyP8ozGqfFD96jESX6dCzcgg=
Received: from CY5PR22CA0057.namprd22.prod.outlook.com (2603:10b6:930:1d::31)
 by EA3PR19MB9665.namprd19.prod.outlook.com (2603:10b6:303:2b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:47:48 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::25) by CY5PR22CA0057.outlook.office365.com
 (2603:10b6:930:1d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 15:47:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B11BB406540;
	Mon, 15 Dec 2025 15:47:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9AA2C820247;
	Mon, 15 Dec 2025 15:47:45 +0000 (UTC)
Date: Mon, 15 Dec 2025 15:47:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
        perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com,
        v-hampiholi@ti.com, baojun.xu@ti.com, dan.carpenter@linaro.org,
        sandeepk@ti.com
Subject: Re: [PATCH v2 7/8] ASoC: tas2783A: use acpi initialisation table
Message-ID: <aUAtoLV7ovBiAzBL@opensource.cirrus.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
 <20251215153219.810-7-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215153219.810-7-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|EA3PR19MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbf71cc-a63c-43bf-c978-08de3bf14b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PhyNPmJUPBliZsxoqrWa4iHvIclZuczTbCrza/f3ZS+y8RyC6Uxxo6v8hPIn?=
 =?us-ascii?Q?Hf/yoig82Z1sxZeIGnGxW37r+Cd55YpT38Idw5D6fGrdu3laiIrkp6ykUEAU?=
 =?us-ascii?Q?aEDJ6Zq6WIKXaQsHh9o94wHtV6cS5un6E2oCczxR3Ax5P4GGoy/9DG7sds1C?=
 =?us-ascii?Q?W0HQndh06jDYHXlCxP8LZE23iNwjcLEwYrIGYCChOBA07r2IHpdcP0JX0By3?=
 =?us-ascii?Q?3e89ky2KmBMXM9w6D2NKKV3Ay/hos+Y/lCeXu9SZv570O+yMK8QyE9bzzf5E?=
 =?us-ascii?Q?WJiYjGaJlCw05z+d6BifDdvzj01q5vlAO8VbAXIavz7GyEGQDimxhZ9+0AfV?=
 =?us-ascii?Q?1L0iS9fERVYiHD+2G6oKlUEBZwZUAoLg7B59yMsHLDW9Mo4A9H2JcMwBFP/J?=
 =?us-ascii?Q?AhXNWbO/rJFrFCDWQlIfFgfzSQesl8V8FlZn5WaCcj0BnPaVE1ByNI4gGBcb?=
 =?us-ascii?Q?i1QXz6IRyGK2dnu6F0nB4wfB0unAHbMQ1dyOZ0FJ93WEHzLKMMHSox8C3zRD?=
 =?us-ascii?Q?nAdH4/L/KsMTLHZCXZkmDBKInFpAnax/Pvk6uUzS+q5RkE4FK2t4FRU8KvFT?=
 =?us-ascii?Q?JnCu2HL2wJAC23u3G3lu+Hi543CsyqgALFuPDQlX7HetNL6/ez6BNfEmoG9e?=
 =?us-ascii?Q?sI466NHfFdXVV7mEIYdkoYWI+cUjwFNdwQ5DRhn8EgHAo2KFwlgpFw6C7gw7?=
 =?us-ascii?Q?9KGybyK+vmiHssN85+/Sxmz2oOgWwmy+lbivIXLCaAdbjDgqdGVpwD21T7U7?=
 =?us-ascii?Q?ZGub5hqWcHlkqqEEpXVe4Lcypl9jD2Me0xicPuh0EQKdXCRy4WAS417/2dZo?=
 =?us-ascii?Q?VWYSRwIcXtXgksKYqTo+komqHqXMBGDvEJfayYZk8VQAHtUL0a5WG8pBTVps?=
 =?us-ascii?Q?iDZCBQbG3xMzWknye9cQasLejd4UD7vUjlIfo7c2gL4b+PVt3XrTyA1YWspp?=
 =?us-ascii?Q?LhQInufa/lXRTcs7rkJHM86XhXzQZBl3ZKakQrhXGFeMcVrUjOOxyh3l35Nf?=
 =?us-ascii?Q?nVDOYbtB94+GzO/rU/YVMjQ0a4jpHPblpaxP2WSLQmEzZ2mHF1L56CC9CXQ3?=
 =?us-ascii?Q?D/QqjSTHu0cI9Gf1CQscf2uDG85aNFewUnkhJdDlfiOL3hZWBxdSjHcPC4IR?=
 =?us-ascii?Q?LgCKfc7w6PQEjTCDgyjHyDMCWhsoqsFgOu9kbNGUcmzp+n+raOtzYjMjguu3?=
 =?us-ascii?Q?+UkQmynkmJNii+ogMYoUJoh7UrWwA4b+7ldDxmw1wFjCjtbibCO1ZUyJMW86?=
 =?us-ascii?Q?Ee1TM3GGjj+PSmBf2XeIIWbKHw+l+BwfKdOpDpsYEM65nhjbobzWzZR44xQi?=
 =?us-ascii?Q?qCUXFM9FMukKwNYvHPKRdFslw/eLAV6z7E+u4/nkaFmFXzkkO/WnzjBdphBY?=
 =?us-ascii?Q?ML0SJaCwPabkN2AupP+YTCFRMOYrX0nFWhrhVuu9os4h1Q83JisHfW75khA1?=
 =?us-ascii?Q?tEwUOTqZeeodlm9avLnCxb8amR3E70xS7v0xeshFXp8Kuq5geRfIulNVA/0d?=
 =?us-ascii?Q?dFB/1Uj4N2bkNzi5DvuxGt4j+21L08umUnDVeikvgkBrLEpzPSwx0RGdxwJ0?=
 =?us-ascii?Q?4YRe4NKG4R+wy+nAgWc=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:47:46.9875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fbf71cc-a63c-43bf-c978-08de3bf14b7d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9665
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69402da9 cx=c_pps
 a=D81verZRVWLMjAELYjey2g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8
 a=UBQNiA3gMxgeTljxoUgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzNyBTYWx0ZWRfX1WDzp5g5b8Y9
 z7Yq3XsoyohaU1Xu4dXoRHfhKKotqKz+6EG2DA4G8wcsWnOvhfMQxNGSvgJaGtBjGiLph7DMze7
 MbMbzjBV9fkYBsA2aRUUGcLRgnpTiIXhoU0JryorVARoxrN28qc1iKL2pnWf/Pq2UIe4e4jQsNq
 /lRTayKHeX+uUgmTQFr+QOsfIcOXnF/3oSG2hbQMuPeM9Rr0k+tR4A48Y1B67kty/xioctSrT37
 eVRsUnGbVyybmwQKolJnerxN+k4n7kJaI5uXWqJwOmutdlB0tT/3XRXfAuriijq5HMdUMOZszy+
 UKbfSQcyMtFpkHn0Dv06bPblPwivlQJxPUm1eSDTevOUHyXJeKSDoOKIvul+hcyAghfYsqYqsCz
 776jWS5AyKnkMqnw7wio/tQQ4x7pyg==
X-Proofpoint-ORIG-GUID: Y55avY5wLmfbgzF6wF33j8UDz0AfEH5O
X-Proofpoint-GUID: Y55avY5wLmfbgzF6wF33j8UDz0AfEH5O
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IBQMNTE25IYB7W7M6WFZZD7NI5ARWVVG
X-Message-ID-Hash: IBQMNTE25IYB7W7M6WFZZD7NI5ARWVVG
X-MailFrom: prvs=1444ced3a5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBQMNTE25IYB7W7M6WFZZD7NI5ARWVVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 15, 2025 at 09:02:18PM +0530, Niranjan H Y wrote:
> This patch adds support for parsing the initilisation
> data from ACPI table. This table is required to configure
> each device correctly so that correct channel's data is
> selected during playback.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
