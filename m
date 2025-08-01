Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2CB1851D
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 17:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF93060270;
	Fri,  1 Aug 2025 17:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF93060270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754062891;
	bh=04Zok/Eceo64hnoUqrHLho22gHAno32gLpDP3BDYTkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PuhKcOFS2tE2NpKsWvauw7WsECpx/HAKRxHN0K8+XRvTkXNsDhaOZR7n0OYL2yhev
	 ltD1LbzlUqex/BD3AdW+0ftQXzn0m+56kWnNwIPvqD9j2QZ8Ivjr4H6q51G5EIxzHJ
	 /fkhL+bgDRTKE9hEO6o7VYTjxrcLSDg5jlmGVtkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D93F805B6; Fri,  1 Aug 2025 17:40:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E8BCF805B6;
	Fri,  1 Aug 2025 17:40:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44ACCF80518; Fri,  1 Aug 2025 17:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022142.outbound.protection.outlook.com
 [52.101.66.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC5CDF800E4
	for <alsa-devel@alsa-project.org>; Fri,  1 Aug 2025 17:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC5CDF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256
 header.s=selector1 header.b=VT5h2wIr;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com
 header.a=rsa-sha256 header.s=selector1 header.b=VT5h2wIr
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JTKSsPZCjWwg+Nz232ehkJ9UjuC8/V9MzDwzNZSGILhd37o5yDLOygmyRYQz4K9lCBhID5JUFqwHvL8K3zkaEiZtZ9+d+FhaaEhSBb34hbAKxl+gn00i5PRQKvtnApaBbKMwktg2Fpg+mOlJ1xKYapdQAwGB4QUwJyTvY4pdFUmQ9+cal2f3Zh2n8e9VYxtJvV6aWy/sZ1WoTcNMPWqjtxqHaMoowCu/KWA9yGO26ob+yqnar/fcGv7xEPJwt9oe60bJRpwoKNpsAclGZFhOTeKzlOsIKIJ5ZjDnyl5u6P+AO/8WI1X5PbuAG06ErsjbpKMI9WiVk9PStl0FlMPERg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FFhPHD04/5qV/oRyvqD7gA+fNNAmrwYrj0xnSyQDJ0=;
 b=TrMtXN/+zMHF2DLqS+Q//3ZRqUtKtGm+kF9WNLODsT/00J+Cf7DD/GLkoB1Z9OKhnlmjJ3HT5Dk57xTbhTIJ/UrhAwJJAcTUIjmqpzTZvCeLEdz7Mq9m+5PyrTL2vhp+QiXU/Nmb55kTTea9IoPuGKPersSRS8QxYx0vhcsIwUvDXMxOEq+e0Hllc5SYgv6SipFpbILYsS36evA8ubsLFdfcGFRCsu4uXxj/5/9Q0HNg1YbCLZMsLdXQlKPGqQSU8oNfuTN+z+iJgm1fhnBHrnRPAOWfmJQhfBE89RyvpdTK0SkHU5Bpp2b2fDg/hCk2wKEH+NpxyQXVsWt/qtRM5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.80) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FFhPHD04/5qV/oRyvqD7gA+fNNAmrwYrj0xnSyQDJ0=;
 b=VT5h2wIrpTzhzVHMzd3v7G3j5DRRnz1gTl28bDxpahMuyUfgZ+iUGsaiqAnt2oeaQ23GA4VedMJWGEM2SEp/j3zQrXM0ZWWQgjg6yJd4qj2GVaJA3/b82/pXzmPT66YDQFBIoooz/pcxAvZKwDyoSC4NQKKkBHFVl7GP7UCaNKDEzhrScQRnzVNd/j2nYNX7vG/dzYjQ7MpLfqdwU0jcI4uZE49Ff+V5Ndae3qzHjQBqfWzU0jolqyhPrtgk9Sys3QcRUfrw/vBn6fnZfjHHPBQY1zx/wrdgj844U04YhkfRqn28ayknmj21cfq1haIgg8d+Pz2dNnhusupnuD8/Pw==
Received: from DB3PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:8:1::25) by
 AM9PR03MB7803.eurprd03.prod.outlook.com (2603:10a6:20b:412::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 15:36:07 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::c5) by DB3PR06CA0012.outlook.office365.com
 (2603:10a6:8:1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Fri,
 1 Aug 2025 15:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.80) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8 via
 Frontend Transport; Fri, 1 Aug 2025 15:36:05 +0000
Received: from outmta (unknown [192.168.82.143])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id
 9826D20080579;
	Fri, 01 Aug 2025 15:36:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (unknown
 [52.101.72.140])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 34F62200800B5;
	Fri, 01 Aug 2025 15:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mg12yZ10Vm3zzXv2mF7/kcbUKLcYgbQfq3NutjqFkyYhwcTUWd6JhQgAS+w+HoZVRHEB9tDzPrcO8Vl/FzaCMWnJI9AzYLaTzJnkeokFHhO09LY+BFxwi4SER32LjZSjf4rkIcmcE5t+5QyDkyxSWZMTqOx4dhuJJU/R03osPUkZbUITS7tTe2Ek4crz2JpuoZy8ZgoKKz6l/58BX+4iyJnabSuytxCiEbgoEbeKxnN6IYKX7AwLkJAAllbQCHHMmd2UEerklKyirGKyY8b7YOeqGuiu1pRFH8G2xSLUt/XfMA4XDqfNo3gKlpKtN8VFmFuExUKjvc7DIt7ebJp+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FFhPHD04/5qV/oRyvqD7gA+fNNAmrwYrj0xnSyQDJ0=;
 b=IFl32yeATCbaeBblAk7Qrz+K215BgL/6XihULmDEpJ1HYNcia6/D26y9VQDRGTTKYDsoSG19djwGPwiZkm6bE5Xnou5GIq01tPZls9j60aXJr5k8evoDnV//gzjswEOmwvyHOQfiKWw4DHIf6+NlzUw1xgqOqUYgcklArYr6hgmCXUT+0/XZ/yrRjBEc0RnUgsYSVjL9uDj/Ew8uU92dDlO7n4xL5f+H+pG//ma0CSIFn6GrWaMJEbe7wZdbWqu01ovFu9RAzIeADz4+0jnN/u6Tybc3ybmHbWNQv9PPpekHGO9/0Juc6ze/2ZA+gJNerYaJrrWSN2JPH7IoYMUyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FFhPHD04/5qV/oRyvqD7gA+fNNAmrwYrj0xnSyQDJ0=;
 b=VT5h2wIrpTzhzVHMzd3v7G3j5DRRnz1gTl28bDxpahMuyUfgZ+iUGsaiqAnt2oeaQ23GA4VedMJWGEM2SEp/j3zQrXM0ZWWQgjg6yJd4qj2GVaJA3/b82/pXzmPT66YDQFBIoooz/pcxAvZKwDyoSC4NQKKkBHFVl7GP7UCaNKDEzhrScQRnzVNd/j2nYNX7vG/dzYjQ7MpLfqdwU0jcI4uZE49Ff+V5Ndae3qzHjQBqfWzU0jolqyhPrtgk9Sys3QcRUfrw/vBn6fnZfjHHPBQY1zx/wrdgj844U04YhkfRqn28ayknmj21cfq1haIgg8d+Pz2dNnhusupnuD8/Pw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by PAVPR03MB10179.eurprd03.prod.outlook.com (2603:10a6:102:327::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 15:36:02 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 15:36:02 +0000
Content-Type: multipart/mixed; boundary="------------Gi3iwzJqPH0kSnLydAqWGmCW"
Message-ID: <6537ba11-6e3e-4cb5-88d3-c5aa6b2c0f65@seco.com>
Date: Fri, 1 Aug 2025 11:35:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: retire_capture_urb: Corrected urb data len
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <68a97d61-21bf-b45e-f6ed-c0906dd4b197@seco.com>
 <87ilmfj72j.wl-tiwai@suse.de> <9d41eda1-1172-ea60-dd87-b3e38a529170@seco.com>
 <87r110iz8w.wl-tiwai@suse.de> <53306c0f-e5ef-44ee-b90c-a3ea61ca454c@seco.com>
 <87v8q6wcf6.wl-tiwai@suse.de> <195fcbb0-37f6-4379-87c9-1ef75b07bf6f@seco.com>
 <878qk34e9p.wl-tiwai@suse.de>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <878qk34e9p.wl-tiwai@suse.de>
X-ClientProxiedBy: CH2PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:610:5a::37) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	PAVPR03MB9020:EE_|PAVPR03MB10179:EE_|DU6PEPF00009526:EE_|AM9PR03MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ee16fe-3db1-4f3e-c014-08ddd111214e
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4053099003;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?pVlnGWGDxi83hntqN9Pxp+JrVbPSVrJ31B4elCq0keyF5POwvGzdB7gpH4NO?=
 =?us-ascii?Q?NSYBUCjq7a5sUtj+48JD1h2D69Re571OK328S5xp3nWBNoqqqPRK7n6TJbcq?=
 =?us-ascii?Q?hjsktkHUbnJPWEZBSwDUHhfbSJLUlprYGRDvWxCa0/677gOeL3jflXYyIpBH?=
 =?us-ascii?Q?uk7C6IzgG35rqmPrOqukkG968aaEURwUm/EFnNjtZvGu8255xA22e3aOMomT?=
 =?us-ascii?Q?xaJDPNxmo/rkmN5NeChdIoqQfw1N9KAU/s8NPPtqe2FSjv90J+ovjUxUYPGL?=
 =?us-ascii?Q?l7ebWA53sVTGMgKCm7T0w/Lsfao/N48xR3C/ODJd7GHBuLCs1EHSfmrCPi7P?=
 =?us-ascii?Q?bFVSXJfhXvk2X9qbhVLr4H8MP/g2O2LELqCWhGQkSYXNroz/rlmOT/9IFivV?=
 =?us-ascii?Q?mD4jILHnQjGkQlQ19dJdgUVc8E45k7XGlaFHvSh6ioy5Bwc8xs/26W9iopeA?=
 =?us-ascii?Q?Q2fKiCrJ98wg4yB1WDtLEIaP2pjFPFCFPxNFgjr2bVItXI+MTPn4J2M9vM5D?=
 =?us-ascii?Q?d7isZjLtaaBg08nUf6V2ymYd0UF4PlCR6Uwq3bEj1YA3gjaF4RBkKwLEck0g?=
 =?us-ascii?Q?jyZ3Q3a0onNnPc20uIRrBNpVsL29SLTXl9AIsqaSDmkFxjjYtyzbwWz3IsRq?=
 =?us-ascii?Q?E2sWeuolK+Ig9G/NPZMRCWvPhfUDrNoMUnJ+L3pRqsAjoT+59VeGy2/uxocS?=
 =?us-ascii?Q?+kK2mJSBnCE3X1WRtlpFxyBKUapIrDmv9d9QXpc4YXIR9KNWgD94eFK3n6Ww?=
 =?us-ascii?Q?oht0DNWj2NiVeHZAKma3WSX8n2y9x2zM8TEp5vYdIih8r7CuIjLRh3lcns09?=
 =?us-ascii?Q?4yvxW4RTNPZ+YBc06FLjMA2Ed/ieUoJcvnYh5tUJdQ5Qr6Ps9DLcFMLNySZz?=
 =?us-ascii?Q?b0gXAP9Bnp4WfmJATfofPkzW4NvpN5Z8Nr3Xa5tnDEYXlbtLXVIf1N7+ecGG?=
 =?us-ascii?Q?ZPRiuXLec140UIoPllLhdsgZDLPKoxprXJoylpUeGQgBfIFtDSv2QzmFrJRx?=
 =?us-ascii?Q?gLk5xYO97v3S2pBig31I21x7mCfQpbIPCyeHfU0DiYGp1f37XBwX386pKtEH?=
 =?us-ascii?Q?J6yU3gGIzMQqO65+xu5GIHi7eqcC6Dnhj5Kr22abbNf5J+oF0HG7ys/EyO5Z?=
 =?us-ascii?Q?OpYO4RN8QeqVyyct2R3rbrXhfG/xGdiAZ+LOhWTO7QnQ44B8InLGjfPMhDau?=
 =?us-ascii?Q?NZ/JD8E+ZReT30Ttc0b2039BgcpKGmPVzuP/ZPzAbza2kaVYBb9D2/EYo37P?=
 =?us-ascii?Q?R562gjwquwNFFkB+oseUsjSKzcxkqm9/JHBRNz1YFCqh9Y4J2loRDi53MWPw?=
 =?us-ascii?Q?dJwAJeA6lzuNrOCgRGedFzU8nDYMiOMg3A9L6x2IHLjoFeCnXS0Gkw4mOypo?=
 =?us-ascii?Q?/7vFweo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4053099003);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB10179
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8c60a28d-4a89-48cc-3643-08ddd1111ecb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|14060799003|1800799024|376014|82310400026|4053099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OEtvRER3SUxFUFFDMXRqOVdvTThVbHZZK3VFQ2g5RG9YMkcxSlVGRHA1Uy81?=
 =?utf-8?B?YW9oTzNvWTkvQVFJc0M2ZER4U2ZKRlBXMVpvR2ZRTVB5dGV6YnhoK25lY1R0?=
 =?utf-8?B?S1RVQTRQVzRvYkRQWFFRTmwxS3FBVEpEYUZ2U1Z4OXlWbStIRy8rYk9oNUJr?=
 =?utf-8?B?UVllRU8zZUVuZWJtNVR5VitWVHN6UURiTElYM08yVXdJK2t6TXlrUERYNW5S?=
 =?utf-8?B?OTVBa1lQL09JSVVzTkZyNmpSZGx2dGF4dGlQVnAya0ZuRGZtRFFHbVppVDZ3?=
 =?utf-8?B?NzdZY0IyMDIybnBTRE0xOG9zMkJpUFFTUzNRUnBla0czaVc2UnovbjMwWFg1?=
 =?utf-8?B?ZjltdlRhTklJMUpXaWJYbjZZN0xZWnlMZHNoMXdlTCtPV1M3U1JYK0ZkRWpU?=
 =?utf-8?B?elRUMzM2UFovViszcUx1UFBNQ0tpbjMzQlhWUnpkVDlyYzJxUnk5blFGY3J2?=
 =?utf-8?B?ZmU4b3B5WmlKdzJmZWNBNlFFdkhRM21yb0xxN2Fla2ZKdWlxR3NsaUgzV2tx?=
 =?utf-8?B?NDBWc2M3dzJXV1pwbnd0SEU4ZUlGOGlaL21zYjY3d0s4Vm9JV3NhK21lclll?=
 =?utf-8?B?dHd1VnZ0UjN1SzN1WlVseXdEZjRKSm1hNGZ5ODlvL3JSbjhDYk1WdUszWWdD?=
 =?utf-8?B?RnpMT0s5TXUzQTl2c2lBd3BoY0FBUDlUT0JUa3h3RXBWODRhYy9jOFd4OGsz?=
 =?utf-8?B?ZVRuSjB4dHRBMFhyZWpjbGw4ekVoUmFrNm1qWXVVNDdIZk5pc2s0UmQxS1Zk?=
 =?utf-8?B?VkJqK0w3bUkxMGdQalp1Qm1LM1JjV3ZwNm11Y2kxb0swSWhvUTZVYmhzbHVv?=
 =?utf-8?B?MVd1NTdreTlBS0cyWFJoK0lIeDJuNmozM3lWQ2hZYnBRUkxkT2NvSUdkb0g1?=
 =?utf-8?B?Y3BuYTA1VXNzZmFtNkFkbDRPbDFxUGpiNkZpZkNvWFFPdWIrRzd2OThJVHpU?=
 =?utf-8?B?Q2k3RnVrbS9JYXNJamx6YVU5V3pERkNkQXVhN01USGlaTzA5L2E4Y3pWbFRy?=
 =?utf-8?B?elEzUnNRWmpJMlJQNXRqa3c2UDBXTHR0T05EUVZtMXJvYUtudWtPWXU1M1Uy?=
 =?utf-8?B?UXdLa3VWdDZ2UUhHNWVPdmRibE1VUWFQdEwvcFFkV3ZVSjIxdnRpdkFCeFJy?=
 =?utf-8?B?eDV4WXFLMVBCekIrR2o1MEV4ZnJXaTZ3cnpzOE91RjNPWjZ2NnZMWVAwNUlS?=
 =?utf-8?B?ZzdMZjEzc2pPOWNabTZwbk9aUTRWTkJIWGxCeGJGM1FEV3hCUWxXTDIvZ2ZQ?=
 =?utf-8?B?dU5vVUZxWE9vZlBZQUwrV0FNK0Y5Q1RrQng0eTIxN3E4RmpldzRMbEdSWisr?=
 =?utf-8?B?M3V0WldJWHM4VTJHWnlEVjlkalRFMHR6cUpaMUVhSTlGbHZTUDBTcTYzeDFP?=
 =?utf-8?B?amlqZHdGUlNLY1JwWkptZkJFbnN3YWN3aVlRNHIrZXdTWlVydi95RytaZnp0?=
 =?utf-8?B?QmF0bjA5VThUS2pvdnRIRFhaUGRyVGV4QVhGZFRxbDJkbnJKY2hhR2pXZGlx?=
 =?utf-8?B?djErVU1CRUd5ckRRRDJzZDhWSmxQTExRUFhHLzN4R2VObzNFWVV4dkx0UFR4?=
 =?utf-8?B?SHpybldkNUpZTER5RGZubHlDeUZSM3E4NEJ4b3J0N2N2Z0FSVURkaXhwMHJu?=
 =?utf-8?B?VHVrRFhTWHpXb1FzeUhKTmk4TDV0bHhyZk5GSytabThGRC9IMjdiT0p5dVJv?=
 =?utf-8?B?RUtycTFDSW5QczBqeDFtZ2Z2bVBZT3lKOTBvQVBpMnVUejVUaXlRWUsxdCsv?=
 =?utf-8?B?MGVHS2xFb3JETzJXYmZEN1A2QWtSUUp4ZDZEMjNta1VKTUEyQmJmTlh3M2RQ?=
 =?utf-8?B?eWxTdjNKd2k1ZzhmcnVCa28xWGNMQWM5bXk0MG9MYjhmbGlzdVZORmRHT3NK?=
 =?utf-8?B?dHgzd0hDNEc4V0VKWURXdGNMMWtPcmR3ZWZQU3VQWkJaeUtlYWQ4eEk1NmJo?=
 =?utf-8?B?RzNJb0ZnK0hJUlg4TGZHdDdsdnY4Y1ZSa3NTSU1EVWdMQW1Cb0RmZnlxS3h2?=
 =?utf-8?B?TTlUL1p5RW53PT0=?=
X-Forefront-Antispam-Report: 
	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(14060799003)(1800799024)(376014)(82310400026)(4053099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 15:36:05.9196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48ee16fe-3db1-4f3e-c014-08ddd111214e
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7803
Message-ID-Hash: VK3BIDKKUS33R6KI76MDZBPZAEB364KY
X-Message-ID-Hash: VK3BIDKKUS33R6KI76MDZBPZAEB364KY
X-MailFrom: sean.anderson@seco.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VK3BIDKKUS33R6KI76MDZBPZAEB364KY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--------------Gi3iwzJqPH0kSnLydAqWGmCW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/25 04:50, Takashi Iwai wrote:
> On Thu, 31 Jul 2025 23:49:11 +0200,
> Sean Anderson wrote:
>> 
>> Hi,
>> 
>> On 9/2/22 01:52, Takashi Iwai wrote:
>> > On Thu, 01 Sep 2022 17:25:41 +0200,
>> > Sean Anderson wrote:
>> >> 
>> >> 
>> >> 
>> >> On 8/28/22 3:49 AM, Takashi Iwai wrote:
>> >> > On Fri, 26 Aug 2022 20:57:53 +0200,
>> >> > Sean Anderson wrote:
>> >> >> 
>> >> >> On 8/26/22 12:36 PM, Takashi Iwai wrote:
>> >> >> > On Fri, 26 Aug 2022 18:22:24 +0200,
>> >> >> > Sean Anderson wrote:
>> >> >> >> 
>> >> >> >> Hi all,
>> >> >> >> 
>> >> >> >> I have a "FiiO DigiHug USB Audio" sound card (1852:7022) [3]. I have had
>> >> >> >> no problems with the audio, but I did notice a large number of message
>> >> >> >> like 
>> >> >> >> 
>> >> >> >> retire_capture_urb: 4992 callbacks suppressed
>> >> >> >> 
>> >> >> >> in my dmesg [1]. This is caused by the "Corrected urb data len."
>> >> >> >> warning.
>> >> >> > 
>> >> >> > What exact values are shown there?
>> >> >> 
>> >> >> Unfortunately, as detailed below, I was unable to turn off ratelimiting.
>> >> >> 
>> >> >> > The problem is that your hardware
>> >> >> > (likely a buggy firmware) returns the unaligned size of bytes as the
>> >> >> > data.  Maybe it's worth to replace dev_warn_ratelimited() there with
>> >> >> > dev_warn() and take all warnings once.  Then we can see what kind of
>> >> >> > values are delivered from the hardware.
>> >> >> 
>> >> >> I'll have an attempt at that next week
>> >> >> 
>> >> >> >> The patch adding this warning [2] makes it seem like
>> >> >> >> this warning should be an uncommon occurance. However, based on the
>> >> >> >> number of suppressed callbacks, this seems to be happening at a rate of
>> >> >> >> around 500 Hz.
>> >> >> >> 
>> >> >> >> Is this buggy hardware? Or is this a bug in the driver? Does there need
>> >> >> >> to be a quirk? Or perhaps the warning above should be a debug instead?
>> >> >> > 
>> >> >> > There is no quirk for that.  As long as the device works with that
>> >> >> > workaround (except for messages), we can simply add a quirk to not
>> >> >> > warn but always apply the workaround silently for such devices.
>> >> >> 
>> >> >> OK. I wasn't sure what the correct resolution would be.
>> >> > 
>> >> > Actually I was wrong: the existing quirk QUIRK_FLAG_ALIGN_TRANSFER
>> >> > should cover that.
>> >> > 
>> >> > Could you try to pass quirk_flags=0x04 for the corresponding card slot
>> >> > (the option takes an array) to snd-usb-audio module?  Alternatively,
>> >> > try to pass quirk_alias=18557022:0e510408 to snd-usb-audio?
>> >> 
>> >> I tried both options, but neither worked.
>> > 
>> > I have no further idea.  You should try the latest kernel without
>> > modification before checking further.
>> > 
>> > And, looking at the code again, it's really strange that you get those
>> > messages.  Actually the transfer size *is* aligned to the audio frames
>> > as default *unless* QUIRK_FLAG_ALIGN_TRANSFER is passed.  And the
>> > check is done rather the audio sample size alignment -- which must fit
>> > within the audio frame alignment.
>> > 
>> > So, QUIRK_FLAG_ALIGN_TRANSFER is already set for your device by some
>> > reason incorrectly, or the code is doing wrong on your kernel.
>> > We need to check what values are shown there actually, then check
>> > whether the problem happens with the latest vanilla kernel.
>> 
>> Sorry for the very long hiatus. I have reproduced this issue on kernel
>> 6.15.8.
>> 
>> From closer inspection this message seems to be from the first print and
>> not the second one:
>> 
>> if (urb->iso_frame_desc[i].status && printk_ratelimit()) {
>> 	dev_dbg(&subs->dev->dev, "frame %d active: %d\n",
>> 		i, urb->iso_frame_desc[i].status);
>> 	// continue;
>> }
>> 
>> This probably be a dev_dbg_ratelimited. Indeed, that suppresses these
>> messages.
> 
> The use or printk_ratelimit() like the above is already discouraged,
> so it makes more sense to switch to dev_dbg_ratelimited() if it
> works.

OK, I'll send a patch.

>> The actual message that's being ratelimited is
>> 
>> usb 3-11.2: frame 0 active: -71
>> 
>> which is EPROTO. Looks like that comes from xhci_hcd. With debug enabled
>> I get a lot of
>> 
>> xhci_hcd 0000:80:14.0: Transfer error for slot 36 ep 4 on endpoint
>> 
>> The spec says this is 
>> 
>> | Asserted in the case where the host did not receive a valid response
>> | from the device (Timeout, CRC, Bad PID, unexpected NYET, etc.).
>> 
>> and I don't really know what to make of that. Should I send a patch to
>> convert that dev_dbg to dev_dbg_ratelimited? Or do you want to debug
>> this further?
> 
> Usually EPROTO means something the USB controller doesn't like :)
> It's often a device firmware problem, but can be other means, too.
> You can try to connect to a different port or a machine, and see
> whether the problem is seen consistently.

As it happens, this with a different motherboard than before. So I guess
this is a problem with the device?

I attached a pcap. From looking through it, it seems like many of the
"URB_ISOCHRONOUS in" are failing. But this is sort of strange, since the
card is just a DAC+headphone amp and there is no physical input.

In pactl [1] I see there is an input. It doesn't seem to function no
matter what profile I use. So maybe the quirk should be that this card
does not actually have an input?

--Sean

[1] Output of "pactl list" excluding sections not containing "FiiO"

Module #49
        Name: module-alsa-card
        Argument: device_id="0" name="usb-FiiO_DigiHug_USB_Audio-01" card_name="alsa_card.usb-FiiO_DigiHug_USB_Audio-01" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1"
        Usage counter: 9
        Properties:
                module.author = "Lennart Poettering"
                module.description = "ALSA Card"
                module.version = "13.99.1"

Sink #22
        State: IDLE
        Name: alsa_output.usb-FiiO_DigiHug_USB_Audio-01.analog-stereo
        Description: DigiHug USB Audio Analog Stereo
        Driver: module-alsa-card.c
        Sample Specification: s16le 2ch 44100Hz
        Channel Map: front-left,front-right
        Owner Module: 49
        Mute: no
        Volume: front-left: 30419 /  46% / -20.00 dB,   front-right: 30419 /  46% / -20.00 dB
                balance 0.00
        Base Volume: 65536 / 100% / 0.00 dB
        Monitor Source: alsa_output.usb-FiiO_DigiHug_USB_Audio-01.analog-stereo.monitor
        Latency: 54206 usec, configured 40000 usec
        Flags: HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY 
        Properties:
                alsa.resolution_bits = "16"
                device.api = "alsa"
                device.class = "sound"
                alsa.class = "generic"
                alsa.subclass = "generic-mix"
                alsa.name = "USB Audio"
                alsa.id = "USB Audio"
                alsa.subdevice = "0"
                alsa.subdevice_name = "subdevice #0"
                alsa.device = "0"
                alsa.card = "0"
                alsa.card_name = "DigiHug USB Audio"
                alsa.long_card_name = "FiiO DigiHug USB Audio at usb-0000:80:14.0-11.2, full speed"
                alsa.driver_name = "snd_usb_audio"
                device.bus_path = "pci-0000:80:14.0-usb-0:11.2:1.1"
                sysfs.path = "/devices/pci0000:80/0000:80:14.0/usb3/3-11/3-11.2/3-11.2:1.1/sound/card0"
                udev.id = "usb-FiiO_DigiHug_USB_Audio-01"
                device.bus = "usb"
                device.vendor.id = "1852"
                device.vendor.name = "GYROCOM C&C Co., LTD"
                device.product.id = "7022"
                device.product.name = "DigiHug USB Audio"
                device.serial = "FiiO_DigiHug_USB_Audio"
                device.string = "front:0"
                device.buffering.buffer_size = "352800"
                device.buffering.fragment_size = "176400"
                device.access_mode = "mmap+timer"
                device.profile.name = "analog-stereo"
                device.profile.description = "Analog Stereo"
                device.description = "DigiHug USB Audio Analog Stereo"
                module-udev-detect.discovered = "1"
                device.icon_name = "audio-card-usb"
        Ports:
                analog-output: Analog Output (priority: 9900)
        Active Port: analog-output
        Formats:
                pcm

Source #44
        State: RUNNING
        Name: alsa_output.usb-FiiO_DigiHug_USB_Audio-01.analog-stereo.monitor
        Description: Monitor of DigiHug USB Audio Analog Stereo
        Driver: module-alsa-card.c
        Sample Specification: s16le 2ch 44100Hz
        Channel Map: front-left,front-right
        Owner Module: 49
        Mute: no
        Volume: front-left: 65536 / 100% / 0.00 dB,   front-right: 65536 / 100% / 0.00 dB
                balance 0.00
        Base Volume: 65536 / 100% / 0.00 dB
        Monitor of Sink: alsa_output.usb-FiiO_DigiHug_USB_Audio-01.analog-stereo
        Latency: 0 usec, configured 40000 usec
        Flags: DECIBEL_VOLUME LATENCY 
        Properties:
                device.description = "Monitor of DigiHug USB Audio Analog Stereo"
                device.class = "monitor"
                alsa.card = "0"
                alsa.card_name = "DigiHug USB Audio"
                alsa.long_card_name = "FiiO DigiHug USB Audio at usb-0000:80:14.0-11.2, full speed"
                alsa.driver_name = "snd_usb_audio"
                device.bus_path = "pci-0000:80:14.0-usb-0:11.2:1.1"
                sysfs.path = "/devices/pci0000:80/0000:80:14.0/usb3/3-11/3-11.2/3-11.2:1.1/sound/card0"
                udev.id = "usb-FiiO_DigiHug_USB_Audio-01"
                device.bus = "usb"
                device.vendor.id = "1852"
                device.vendor.name = "GYROCOM C&C Co., LTD"
                device.product.id = "7022"
                device.product.name = "DigiHug USB Audio"
                device.serial = "FiiO_DigiHug_USB_Audio"
                device.string = "0"
                module-udev-detect.discovered = "1"
                device.icon_name = "audio-card-usb"
        Formats:
                pcm

Source #45
        State: RUNNING
        Name: alsa_input.usb-FiiO_DigiHug_USB_Audio-01.analog-stereo
        Description: DigiHug USB Audio Analog Stereo
        Driver: module-alsa-card.c
        Sample Specification: s16le 2ch 44100Hz
        Channel Map: front-left,front-right
        Owner Module: 49
        Mute: no
        Volume: front-left: 65536 / 100% / 0.00 dB,   front-right: 65536 / 100% / 0.00 dB
                balance 0.00
        Base Volume: 65536 / 100% / 0.00 dB
        Monitor of Sink: n/a
        Latency: 1497109 usec, configured 40000 usec
        Flags: HARDWARE DECIBEL_VOLUME LATENCY 
        Properties:
                alsa.resolution_bits = "16"
                device.api = "alsa"
                device.class = "sound"
                alsa.class = "generic"
                alsa.subclass = "generic-mix"
                alsa.name = "USB Audio"
                alsa.id = "USB Audio"
                alsa.subdevice = "0"
                alsa.subdevice_name = "subdevice #0"
                alsa.device = "0"
                alsa.card = "0"
                alsa.card_name = "DigiHug USB Audio"
                alsa.long_card_name = "FiiO DigiHug USB Audio at usb-0000:80:14.0-11.2, full speed"
                alsa.driver_name = "snd_usb_audio"
                device.bus_path = "pci-0000:80:14.0-usb-0:11.2:1.1"
                sysfs.path = "/devices/pci0000:80/0000:80:14.0/usb3/3-11/3-11.2/3-11.2:1.1/sound/card0"
                udev.id = "usb-FiiO_DigiHug_USB_Audio-01"
                device.bus = "usb"
                device.vendor.id = "1852"
                device.vendor.name = "GYROCOM C&C Co., LTD"
                device.product.id = "7022"
                device.product.name = "DigiHug USB Audio"
                device.serial = "FiiO_DigiHug_USB_Audio"
                device.string = "front:0"
                device.buffering.buffer_size = "352800"
                device.buffering.fragment_size = "176400"
                device.access_mode = "mmap+timer"
                device.profile.name = "analog-stereo"
                device.profile.description = "Analog Stereo"
                device.description = "DigiHug USB Audio Analog Stereo"
                module-udev-detect.discovered = "1"
                device.icon_name = "audio-card-usb"
        Ports:
                analog-input: Analog Input (priority: 10000)
        Active Port: analog-input
        Formats:
                pcm

Card #24
        Name: alsa_card.usb-FiiO_DigiHug_USB_Audio-01
        Driver: module-alsa-card.c
        Owner Module: 49
        Properties:
                alsa.card = "0"
                alsa.card_name = "DigiHug USB Audio"
                alsa.long_card_name = "FiiO DigiHug USB Audio at usb-0000:80:14.0-11.2, full speed"
                alsa.driver_name = "snd_usb_audio"
                device.bus_path = "pci-0000:80:14.0-usb-0:11.2:1.1"
                sysfs.path = "/devices/pci0000:80/0000:80:14.0/usb3/3-11/3-11.2/3-11.2:1.1/sound/card0"
                udev.id = "usb-FiiO_DigiHug_USB_Audio-01"
                device.bus = "usb"
                device.vendor.id = "1852"
                device.vendor.name = "GYROCOM C&C Co., LTD"
                device.product.id = "7022"
                device.product.name = "DigiHug USB Audio"
                device.serial = "FiiO_DigiHug_USB_Audio"
                device.string = "0"
                device.description = "DigiHug USB Audio"
                module-udev-detect.discovered = "1"
                device.icon_name = "audio-card-usb"
        Profiles:
                input:analog-stereo: Analog Stereo Input (sinks: 0, sources: 1, priority: 65, available: yes)
                input:iec958-stereo: Digital Stereo (IEC958) Input (sinks: 0, sources: 1, priority: 55, available: yes)
                output:analog-stereo: Analog Stereo Output (sinks: 1, sources: 0, priority: 6500, available: yes)
                output:analog-stereo+input:analog-stereo: Analog Stereo Duplex (sinks: 1, sources: 1, priority: 6565, available: yes)
                output:analog-stereo+input:iec958-stereo: Analog Stereo Output + Digital Stereo (IEC958) Input (sinks: 1, sources: 1, priority: 6555, available: yes)
                output:iec958-stereo: Digital Stereo (IEC958) Output (sinks: 1, sources: 0, priority: 5500, available: yes)
                output:iec958-stereo+input:analog-stereo: Digital Stereo (IEC958) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5565, available: yes)
                output:iec958-stereo+input:iec958-stereo: Digital Stereo Duplex (IEC958) (sinks: 1, sources: 1, priority: 5555, available: yes)
                off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
        Active Profile: output:analog-stereo+input:analog-stereo
        Ports:
                analog-input: Analog Input (priority: 10000, latency offset: 0 usec)
                        Part of profile(s): input:analog-stereo, output:analog-stereo+input:analog-stereo, output:iec958-stereo+input:analog-stereo
                iec958-stereo-input: Digital Input (S/PDIF) (priority: 0, latency offset: 0 usec)
                        Part of profile(s): input:iec958-stereo, output:analog-stereo+input:iec958-stereo, output:iec958-stereo+input:iec958-stereo
                analog-output: Analog Output (priority: 9900, latency offset: 0 usec)
                        Part of profile(s): output:analog-stereo, output:analog-stereo+input:analog-stereo, output:analog-stereo+input:iec958-stereo
                iec958-stereo-output: Digital Output (S/PDIF) (priority: 0, latency offset: 0 usec)
                        Part of profile(s): output:iec958-stereo, output:iec958-stereo+input:analog-stereo, output:iec958-stereo+input:iec958-stereo
--------------Gi3iwzJqPH0kSnLydAqWGmCW
Content-Type: application/gzip; name="fiio.pcapng.gz"
Content-Disposition: attachment; filename="fiio.pcapng.gz"
Content-Transfer-Encoding: base64

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
rt3gxr8rLPXPtP5k/B8mJ3TMYGcCAA==

--------------Gi3iwzJqPH0kSnLydAqWGmCW--
