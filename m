Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2822A7753F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Apr 2025 09:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DB82601D7;
	Tue,  1 Apr 2025 09:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DB82601D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743492781;
	bh=VKU9DxKDHxLTd7Wt5r4pqh/weitfnlOaYRE6Ox+xfL0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g+ShuQQ1rOlerR2MtZNfUWVkW5iiGjBMQxQTPTwMnEsO/ds9LkKrLrhI7BuW5F6mY
	 6XTBIRbVqduyqpWSo3HpHOqvPAyQfAV30NAC7hfzF1jKyL60nfvQcPQLYPzVSzSyIZ
	 bnr98x3FRvqO4jJA8+euvNTaSa/xVhaM5kifXA4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC064F805C0; Tue,  1 Apr 2025 09:32:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A95EBF805BD;
	Tue,  1 Apr 2025 09:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A722F8025E; Tue,  1 Apr 2025 09:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FFA4F8001D
	for <alsa-devel@alsa-project.org>; Tue,  1 Apr 2025 09:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FFA4F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MhlqlhyL;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=DrbHx/BP
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 53161K84006802;
	Tue, 1 Apr 2025 02:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VKU9DxKDHxLTd7Wt5r4pqh/weitfnlOaYRE6Ox+xfL0=; b=
	MhlqlhyL5+M0dm0bh3L0AgVWipHWe+0MkicIUVf3Ml3OcejQUNKbQEsYCLF0LaJc
	QkQk5iBikxXVBXqdNHSsOIQhssxZA5xsHnibQDUfo1ZXblCAzxIAkPAUn1yNiLgi
	TGi76FTFU6GaoQ/MHYuNngac4ItwYkzsG3LWggQU08xzNBrrCd2/qHLBKTJ4vioj
	KjkaVa3NHgac5Ds/3cFluumXClYPeuTm9Zwrj/+wxi8YRQRSsifJif5VU+SJUdS4
	HW150xRw3lxHOpZ+FEQ2eyAbgUQfn/dWKjkyNJZFbjBZQoLIRUCq62u7ovPxzLdQ
	g6KigZxBhIyINsS+P7PbjA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45pd9hkmmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 02:32:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8/1DaIzOntOVlHoMN7cgeTPAvfHqxjNiruU+jsrgSE/SZW9sr7RU/VFWRlZtyVTEjG5JBDVgF8wXAKHkQDbFxlP/zo12hi7ZEZBiaIpC5S7PG7m8MbPBUvFiMgEEJIGLV6kb5Inla9/B9+LxYESjd5Xh/hKwQkRuArDx3NUHrjc7GKF4ZUFOfvhIUmR6/MTPEVYgnW4inQpZzKhGCKDL9kArg1tomDahMzThrA0gFUFJhxc5SkZehHZYXVgjRFtaIlXc2C+Sztlt+wtGlRf/j1WnGKf74l7avEidCVTxdBETc3B3X+rfRFV19F9z+tFiuvWznpOuHOCadJqmALnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKU9DxKDHxLTd7Wt5r4pqh/weitfnlOaYRE6Ox+xfL0=;
 b=m796RhIs2LN2vbYSeTW2/XgfropCy7ADvSPwvX/QZ0pZguqsYygdN4/qDwMqZ3l535jduQf5rZc6MiU7uwTpkfGZLIfmk094b3UQ8xNsRL0m3YM2JG5p8se07ywA6fxubbUxx74NMw2j8u8EbZpUzOVPuGva5hzzlg64GzjKcAb90E6nzW+jIm54gVqkuXa2/EODDhGK9BygnfLZvlzr7uWKCCFGP9OVpRJa7lVgXc5fVwWqKb988lYzrPCiNuRM98SZ4rp61V1AFf6JlA4pND6QRa93jsGlbrlciMgrY/6cnhBcf7COi29ccV24J+DXl/lVPn/QDDxSqYSiC1NANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKU9DxKDHxLTd7Wt5r4pqh/weitfnlOaYRE6Ox+xfL0=;
 b=DrbHx/BPm5sKEz0Gcb/AQu72jWqMxVZ6c5Jf/jzIvh036auxqYUNoiN3tYt/ox1o7vGbNBtnR/JkFx5D0GvOKUyf3TrpNXqLAtqeev1N4DCeYNDgrrnCiF7DQIt3sfUtFCP+hvbZkXa/bu8tWzgFN9HKWBL/4/lqtqGBtbtrPZE=
Received: from PH7P220CA0169.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::26)
 by MW4PR19MB6822.namprd19.prod.outlook.com (2603:10b6:303:20b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 07:32:13 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:33b:cafe::f4) by PH7P220CA0169.outlook.office365.com
 (2603:10b6:510:33b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.37 via Frontend Transport; Tue,
 1 Apr 2025 07:32:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.2
 via Frontend Transport; Tue, 1 Apr 2025 07:32:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0ABF9406544;
	Tue,  1 Apr 2025 07:32:10 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E36A9820244;
	Tue,  1 Apr 2025 07:32:09 +0000 (UTC)
Message-ID: 
 <d9dd1d8ea0b3e1fd5a9c473b9cc5195c693875eb.camel@opensource.cirrus.com>
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: cs42l43: Control
 hardware volume to avoid clipping
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com
Date: Tue, 01 Apr 2025 07:32:09 +0000
In-Reply-To: <5b4afecc-7b65-4e2f-95f6-21a908cabd25@perex.cz>
References: <20250328083619.1262150-1-mstrozek@opensource.cirrus.com>
	 <20250328083619.1262150-2-mstrozek@opensource.cirrus.com>
	 <39ce620f-6c3d-4d3b-b30b-071ab7a40886@perex.cz>
	 <79a647c976f56b149e6136ad90f999bf581a47fa.camel@opensource.cirrus.com>
	 <5b4afecc-7b65-4e2f-95f6-21a908cabd25@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|MW4PR19MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bfa8df-24d6-42d5-e60e-08dd70ef5157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEJDVnNZSldFY2FmUThDTGZXS2R4OS9YakIyT0IydmZHaktqUmdxWFBuOEpu?=
 =?utf-8?B?MURWOVBOT1dnQ2F0VWllUWQvVnIzRE02USszZGhpQnFFSkRkeVdvZlF1ZlZJ?=
 =?utf-8?B?WmhWZjExejF4R3Bmc1E2dTVkRlcrbHRENWZpaW9LZ2k0KzZIYy9HcGkrM3NP?=
 =?utf-8?B?SHUybE9ic0gwWlA3TUJWSXg1cm5XYkIvRW5ra2RNVURHYWtaWmc4T0NveDVV?=
 =?utf-8?B?OGQzOG1VZDFJRjRYN0JaOEx4TUtldncxL01mWjJHSU9Fc2YrWFk1VFFQSlpE?=
 =?utf-8?B?dE9QZjU5c3Uzbk8weWtTV05FaVN2QXQrNkNhT0Yyanh2WXBhVm0rMGxYeW9y?=
 =?utf-8?B?ZUtpRGkvLy94SE5WdFNPeUwxTzYvdUpLUjdGcmFQZ1RCcS9MSWZIVHJRdXlJ?=
 =?utf-8?B?QUswRGdUNy9rZ2ZRVjhFcDhPVkVVZGwxV29pa0tmcDl2aW14SzNUWXE1dUh3?=
 =?utf-8?B?UWVmbkdTWERqekVWb0ZjamJCRHVqamtpeDNYT01NWnAyVlduUTUxQ1E4ekpE?=
 =?utf-8?B?cXYvR3dDZXl5bzZwMW5MM2ZQU1M3cTFMTVVwQ09OZ2JYQUVXaVVuU2Fsb0dM?=
 =?utf-8?B?Nm5FTGhzMlkyWlNpL0J2MkxvY2pJdnppSUpGRXlwVG44dzU3RnBWSkZ2RXpy?=
 =?utf-8?B?U1Jydkt2dTk1M3NMRkNPSEJhczFqU3lqNmw3TXM3eWlOcHpiL3MxcWliM29N?=
 =?utf-8?B?SHhCUmYxY0pCcURVSU15K2FpYW1Ebk52eUkzRGFIbktVbkVDK3REbWluYnZz?=
 =?utf-8?B?ZmYybURCWHpNZUlwYy9lZG1VYkZzOUNiRVFFN2xydi8vV1hBdmt3emxWb0Vr?=
 =?utf-8?B?QnROWEpvcGxaODI3MDNqQ2ZPZVBDdHExODVZV1pLTTA5L2cvRFJxdTVUU0dC?=
 =?utf-8?B?MGJPNzFOcUtEUjhsSVJNVkFwVGwvSFU1QjR3V3BDdndub0hyRFlrWFJMSHk0?=
 =?utf-8?B?dWZDWjQ5bTBObUtUdXhhSEszRHFJWCtkV2hyU3gwWUpoWEUwTXd0OHJHYUpT?=
 =?utf-8?B?S0Nxdkg3RFAySlQ5ZWVsYXNSVGpKT2JvUUJ1ZktQUUhVNUVQdWRvVUJtbXNh?=
 =?utf-8?B?NDdITDMyQUdiQXNpY1ZjQ0c4TjBhWUoyMCttc2NpRkFZZ0xsVy9KOU8xMmp0?=
 =?utf-8?B?QmZVdTdtaFg2cnJCWmpkU0R1VmVIcTZwMnZTWFdJVm1kamhBK0wyOTB5SVhD?=
 =?utf-8?B?WSs1eldyMmgrMnhpQ0FXSUJTc0dveHZ1QkJ4cHNVZlU3dVltMXNKNGtmVEFj?=
 =?utf-8?B?OWp3My84NlFSdVQxZ2xFaXZmY0RtU1VvZmFDY05uN1FpZ1h5cUZ2TmNQelZB?=
 =?utf-8?B?UDlBVU1aSkhQU092WC9iaG1adytNWlUvY0wyTEl6YXBsN2pMemhpZ0hDamN5?=
 =?utf-8?B?ZkJOOUZVWDU1Uzh6andTUkh2WE1zSVU3KzdiSjlnbldDTXZWSjQ0VGtwNXBQ?=
 =?utf-8?B?NEN4Nmc2RlNIQ3JNWmYybkk3K2p3cjkzNEdWSzJ3cW11Q1YvYXB6dmFRbVF3?=
 =?utf-8?B?VSsxY1dhNzVhdCsxaHE2UW84TzJycUg4VmdQMEFqODNBeTNHbkJuN05FeHJZ?=
 =?utf-8?B?MXJrU3BQOGZNTmMxL21RK3BaRXpmYTNYSnViazBJYkRWVldqek5XTjN4Q2p6?=
 =?utf-8?B?SUFmWDFpalFTc2lqeWhmMTF2bm0zeUoySVV1RW1lL2k3VThrOTZWejhPaWJp?=
 =?utf-8?B?ZjUxK2M5MDdGNktRVDgzQWtCZjhrTjdLSFViRWswQStBa1dnSkxneUxiYjFI?=
 =?utf-8?B?U1hwaHlnTkNhcCtoMlR6WUZ6bzVUQjlKalFTZTY1RHZ5QUZRZ01ON3NnSThT?=
 =?utf-8?B?ZU5XeEg4KzZaWSsrZVA3Qkw4Y2NsamRNVXM0UGVCWUloajk5aE51U3VYZmVo?=
 =?utf-8?B?QlFEOFE5OFdYUjF6cmI0eTErbUFCWWREWVFCa0FGSGRmaFVXMWNuekJmaUY0?=
 =?utf-8?Q?W79U/XjVJUI=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:32:11.7362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9bfa8df-24d6-42d5-e60e-08dd70ef5157
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6822
X-Authority-Analysis: v=2.4 cv=VYn3PEp9 c=1 sm=1 tr=0 ts=67eb9682 cx=c_pps
 a=OxY2RB2sa7x8oI2LU21LDQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=e5mUnYsNAAAA:8 a=InPfDr50lMV6CCSbj7oA:9
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: jRD-Raoh0lhNc8jHNcelHHSr5oAWMNLM
X-Proofpoint-ORIG-GUID: jRD-Raoh0lhNc8jHNcelHHSr5oAWMNLM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UBQZR77SCHV75V7GBRFKCH5KTLNWIG4N
X-Message-ID-Hash: UBQZR77SCHV75V7GBRFKCH5KTLNWIG4N
X-MailFrom: prvs=3186a73440=maciej.strozek@cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBQZR77SCHV75V7GBRFKCH5KTLNWIG4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W=C2=A0dniu pon, 31.03.2025 o=C2=A0godzinie 15=E2=88=B643=E2=80=89+0200, u=
=C5=BCytkownik Jaroslav
Kysela napisa=C5=82:
>=20
> I don't see the pipewire upstream report. Please, make an report
> against=20
> pipewire to move discussion there and add the Link: tag to the
> comment.
>=20
> If you like to disable something just because the UCM application
> does not=20
> support a feature or misbehaves right now, use a new application
> variable like=20
> @SplitPCM - see [1]. A nice name may be '@OutMix>0dB' or so.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0Jaroslav
>=20

Thanks! Will have a look at those variables and submit something to
github soon. Also will include the pipewire issue link which is [1] for
reference.


[1] https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4622

--=20
Regards,
Maciej
