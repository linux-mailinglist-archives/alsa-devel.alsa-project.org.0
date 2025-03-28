Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA171A748D7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 11:59:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2558860173;
	Fri, 28 Mar 2025 11:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2558860173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743159587;
	bh=hAdsgKSPHFfh2E2LCMXeWJ3R5462IZNZ0S/YQ4FGhIw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pgcqsczJTbBuDbJXWiZbwLMJyQhw4wQ1Ydj2xXRwtDD0VR2WuAd1uUrpf0Pp+cU7q
	 rLqD4i5PI2NIOx0mdm1jnRcnpgQ9cExPI5Arq3KAku/lmeUlJHF5el5R7LwiDF6NAq
	 /yUdE0ZkTTn+Pv2apZDFNn4fsi5LPiZMLRnj/vbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02273F805C0; Fri, 28 Mar 2025 11:59:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D21F805B2;
	Fri, 28 Mar 2025 11:59:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21021F80548; Fri, 28 Mar 2025 11:59:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 817D1F800E5
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 11:59:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817D1F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dkhMlO5q;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=ZSeDptUr
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 52S81c6E001248;
	Fri, 28 Mar 2025 05:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hAdsgKSPHFfh2E2LCMXeWJ3R5462IZNZ0S/YQ4FGhIw=; b=
	dkhMlO5qdyUQsJksZB+awmDm8CBC49nOv9JGkfyGshZZ4E3J3FV5WE4dzogrCgOS
	I71B3aVOWtFc6sqmlbNwBiAS8ORNbkGzL8QjMaJzbdd9LcDw4HhOc8nV34I0F20J
	Sp+9Zd0W2/O5GvwSl1fh3KDy4V8I6SgJI4u6DFL543nUFXVCmI4RCNJ+9WTddE3s
	N6E4Um2xxGCfoBu9olpCMPzaKc9V2laBK3bMIerOpzng+SVvPISJiM7+wPYZo7He
	B6elFemPvKAQPEdplu6DBnEer64GFQmO1mr5mDx/ULzg3w201Erzn9fBH/03nouT
	RAOf6RX2uU+WYPqBe6qOFg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ndnu12t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 05:59:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJ1WZaFx2+ZBKc3IQNdA3ox7Z6cDZQ8j13e92WfkaKp87YGUd3WHSjnq45YFT6KSiZ3TDLlIhTUunwLiRRirQvNpyCqDSvv1MvxzSWwHZO1s8Fb039Czk6i9EPlYqnQ3lwzcAZZk4wop6gxN0wLlKTk1rJDzszopSVqZZFhcev5UEY4twDQPPqc5NB4L58q5r85rL1Fr+RSnhEXi4yvPeRU6tk9yOMbdAcdjG0rgPqiWa1A2ZhVuwP+3YhKGfc1igTbPsGXiEA5nEJ3o/tanXt27r6AbKZsmdqdh9tpY0gtMTECsgCgp74SG633ycN6Ld+UUiaA+iywkTcbfYdXUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAdsgKSPHFfh2E2LCMXeWJ3R5462IZNZ0S/YQ4FGhIw=;
 b=oGO30K4MVKJu8Lp/5yOp8Oe0k/jkIrjnTcyAaVQPzoDSScVbjMz5Yrd5WXTOTSvcEYFc8+YggkD7aIu4uBzi//dAxGM9iE14HQ9M+wQPFtqthz9jYqCUk0MxXrpGNyfNJZd/OrLEGEt243x8UVR8Qb5JwWAyX1A2oTx/WNQN7rjH/u61JOzNfzNt1T2fpSU6LLOaor4585b9P+tBNbaYZ30YOGJia37/mmzEMoDMcocOQ5SFbf9363RxCHIzRpoSk+It7H0B3e7hyivven+q8+E6saByqKONE+RbgwBjjtOHHVE9vAFUA5Sb8VK9SdfThqa22eOgrKC7eO65As/ATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAdsgKSPHFfh2E2LCMXeWJ3R5462IZNZ0S/YQ4FGhIw=;
 b=ZSeDptUr2sFeSGwwjRx8YrLxFU8pGmZkmxDfd2Jxorep6UtCYw4rTFCANVyrpYCD29X22KYiXzJg/2DYhhkrkz5WjKLQq3+yzJOZ8mSsP0SUuHzeU5GJV/E1eJ9FdgWZUc/MyUp17huxiV56//a6R1cA9PLYaECXobQg6jyKVLY=
Received: from MW4PR04CA0234.namprd04.prod.outlook.com (2603:10b6:303:87::29)
 by PH7PR19MB7511.namprd19.prod.outlook.com (2603:10b6:510:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 28 Mar
 2025 10:58:58 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::29) by MW4PR04CA0234.outlook.office365.com
 (2603:10b6:303:87::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Fri,
 28 Mar 2025 10:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 28 Mar 2025 10:58:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 42286406541;
	Fri, 28 Mar 2025 10:58:55 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1B6FC820248;
	Fri, 28 Mar 2025 10:58:55 +0000 (UTC)
Message-ID: 
 <79a647c976f56b149e6136ad90f999bf581a47fa.camel@opensource.cirrus.com>
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: cs42l43: Control
 hardware volume to avoid clipping
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com
Date: Fri, 28 Mar 2025 10:58:55 +0000
In-Reply-To: <39ce620f-6c3d-4d3b-b30b-071ab7a40886@perex.cz>
References: <20250328083619.1262150-1-mstrozek@opensource.cirrus.com>
	 <20250328083619.1262150-2-mstrozek@opensource.cirrus.com>
	 <39ce620f-6c3d-4d3b-b30b-071ab7a40886@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH7PR19MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 863ffd00-725c-4a68-1480-08dd6de78996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eTlBajBUbUNQc1d3bFhRcUFtMUF2QlNNUlpjWHFteTZwQ01FSXc4dFJFV3Ny?=
 =?utf-8?B?UHArWVlHT3NROWZ5MTlJaTdBdnVCcFIwUmx4Q0dXeU1pR3libFA2ZFZvSllK?=
 =?utf-8?B?b3g0Z0pTeHpNYWFyRWxOcWxHK1p3Mmk0enVLZkYvVDVlNTJMSC9FK1JpOEIw?=
 =?utf-8?B?VkFiLzNnQnpjNWIveS9kWXV4SGlteERFZXkrY2kwbVhIVlpmU0crTlI2WVRH?=
 =?utf-8?B?MmE0cjN2NnltY01jaGhPQ2k1aUpaMjBMcDczTXUrUldSYkhXQnNpcU5mcyts?=
 =?utf-8?B?TElCNElXbzRBSUJEM1hDblpSNWV5RjU3eTVjL1l1WE52bWJWNnlaZkkwRitr?=
 =?utf-8?B?WlcxT1JJbmpSbGR0UUZ3N3R3ejJmWGlFRnZQSmdXNWZFZjJZTnJPdmMzVmlD?=
 =?utf-8?B?c0ljWlNKbXVQMitkRllwNGJKek9aMHg5MXk4MFRkelVDNENwZmdrR2VlU2dq?=
 =?utf-8?B?OVlQQnp3dVVtMnZCbnZzRFZpcGpoUmNWVWYxeXI4aCs1a29WVVROdERpUjRy?=
 =?utf-8?B?TFhPNHV4MEZjK2tnamxPNkVUNlhsVFN5NEMySU1zQjl2dm1Oc2hlWkw2MnJh?=
 =?utf-8?B?ZU1PRlpBb0ZOUjJYWm1WOUtTTXk0WXRWdUZGMVJFRkFlNEdaS0o2WVFWU3dQ?=
 =?utf-8?B?Z0gxM0g3Q0p3K2F6NVgvV0RZeFZJK3YvY2d2WGtvVVcyUVgyN2dLRmFad1Vl?=
 =?utf-8?B?Q01BM0RQdHo4VnIreDJBT3h3UXZ2SWVvTmtMd0VaWjcyRFdYNmlCVVR3Y3ly?=
 =?utf-8?B?Q25HRFlZeXNINjM3RHZrcmRtSHMzUk12M2pkTnVVU1JlZzRyNzhUN29YdlRj?=
 =?utf-8?B?c2hTMVc4TmUvSGxhY1NpNEN0S3R0S3VCcS9iODJ3R0Uya2tGTzYxdGMrN1VW?=
 =?utf-8?B?dmQ2dXJWMi95U0xxaTcrRDN1YTNTMjZkVDQ3ZW9NRkxia3plRWExTDdVempK?=
 =?utf-8?B?OTBZRkxUQjJRZmlDYTVBeWVlRUREZG9ESzJwMG51bHc0cHBJdXV6bVBmUm5a?=
 =?utf-8?B?VjlqMjM0SnAzaXFLbnlMbUFubC8zbmx3eGxvUDdyak9pYW93TlpPSTRSNWxN?=
 =?utf-8?B?YURsNXBjUENNTG1DTGdKdTU5RjZ2S2ZtNmRiL2VGMHV6TzIvMXZjOC9scEZh?=
 =?utf-8?B?WGMxWnloU25od3hBb3B1WFk3MUpwM09OL2RGNk8rTk9iYm1wMGhOdCtQMSth?=
 =?utf-8?B?TWlWUVQrM09OMTdQcVRXTTA4QjB2b2xxR2h0RE5rRWY4eDlpdTVVVlBMSGhx?=
 =?utf-8?B?UmhIZnFneVNhajkyU20vTS83OW9VazVIWTRoT0w1Qjl0UWFqZUZHMUtoUlNP?=
 =?utf-8?B?TFJzYTdILzNmblE3OThXNnc1OU1ydml1TnRrZi9UT2FOYWNBRXBEWnQxNzRj?=
 =?utf-8?B?YnRNdXhsK3pXaVduSVlaNFlybXA0WWNpUGIwc1hFd0hJNG1KNXVBTUUxbDBq?=
 =?utf-8?B?d3M0NGR4Ym1XU2FUUTdjMzEyOTJ5OEZPQjdNYTNGVzk4bjdTRFdZRCtrU0tH?=
 =?utf-8?B?R0FhcVNUZ3o4NzhkTGE2djRLTUZvdnFVdGYycDJTTjd1Q1E0d1lTU216Wmti?=
 =?utf-8?B?NEZrSnlucUVCRlhPVU1waGlZWmJ5L0RxNUxrMnBuYVQwOUYveDArNDRsMDBT?=
 =?utf-8?B?aEsrM3hyY3Erd2tRcUlBNS80aHYrQTVsRm9NemZRRDdadnVYK0pZUU04NnVS?=
 =?utf-8?B?MCt6MWl5K3B4bkJwWGdiK0tYQXlpSXNEMHp1Z0hrcXRWakh0SlZvQ2d5NUt6?=
 =?utf-8?B?dlZ0NDltUnk3ZGV1a1NUSFIxNXQ5dkx1NytSSWlFeU5HcTJMWWs0ZFpHU3pY?=
 =?utf-8?B?a0lFL0NYTnYweFRaLzNwSERjRDA3M2pXUzJWQ2hTVjJaTTEydjVibm1SWFBL?=
 =?utf-8?B?MG1jT3RkblV5WU9sR2R0MVRjN2Q4ejd2b3BIRjQrV1VlUTVuWGU4YmtmNFpU?=
 =?utf-8?B?UE5MdGh3dnNsQWV1VFFMTytWMXIrQzlpLzl6U2N1UHBoVDdmVjdBUzNYeDVn?=
 =?utf-8?Q?NDZatU4Eh9q4ljKjW/fnO8JwKmU30Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 10:58:56.6697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 863ffd00-725c-4a68-1480-08dd6de78996
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7511
X-Authority-Analysis: v=2.4 cv=GoJC+l1C c=1 sm=1 tr=0 ts=67e680f8 cx=c_pps
 a=AVVanhwSUc+LQPSikfBlbg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=MGi3qEhtvdKTYsoYIVcA:9
 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: vApIs6A6dodxAulTyJWq1pLD0scAV4zA
X-Proofpoint-ORIG-GUID: vApIs6A6dodxAulTyJWq1pLD0scAV4zA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: J4VA6KOANQNHOI45KEZO3MANDB7ZDJ45
X-Message-ID-Hash: J4VA6KOANQNHOI45KEZO3MANDB7ZDJ45
X-MailFrom: prvs=3182ccdba2=maciej.strozek@cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J4VA6KOANQNHOI45KEZO3MANDB7ZDJ45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W=C2=A0dniu pi=C4=85, 28.03.2025 o=C2=A0godzinie 11=E2=88=B641=E2=80=89+010=
0, u=C5=BCytkownik Jaroslav
Kysela napisa=C5=82:
> On 28. 03. 25 9:36, Maciej Strozek wrote:
> > Hardware volume control in cs42l43 can go up to +31.5dB which can
> > cause audio
> > degradation. For best results, keep the hardware volume set to 0dB
> > and let
> > software volume control the output.
>=20
> It's something which I dislike (software volume control). If there's
> a=20
> hardware limit, it should be added to the driver. Eventually, alsa-
> lib plugins=20
> may be extended to do this cropping using a configuration. Also, it
> may be a=20
> bug in pulseaudio/pipewire. The +0dB volumes should be handed with a
> care.

I agree this is not very elegant to leave it to soft volume, but until
things are resolved elsewhere this is the best way to get best audio
for most users?

>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jaroslav
>=20

--=20
Regards,
Maciej
