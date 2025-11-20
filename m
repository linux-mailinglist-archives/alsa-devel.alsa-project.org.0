Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CCDC736D3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 11:18:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9D5F60203;
	Thu, 20 Nov 2025 11:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9D5F60203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763633901;
	bh=KcT52ph22snpCcrBti4RGuEZErgKNVDqfu9C9K/y/KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X4SY1JSs++l1DenhPXSscRpMazgzXWSl9yENPgoOcqFJJ5dHO+0ieaa89sqnouvBQ
	 jO4s0Wuk884+UQ6AI7DcNlzCnVWyqJqr2neuda4s9eNIlfs6XMoDBT5gUhTuEf1rwc
	 BoJF/tgLwlt+N/tnWlTXj9gUgiE9L8y0cDyRmQ3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1303F805D4; Thu, 20 Nov 2025 11:17:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94ABFF805CB;
	Thu, 20 Nov 2025 11:17:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88173F8021D; Thu, 20 Nov 2025 11:16:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DB37F8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 11:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB37F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BKzuO7na;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=e8imCR/X
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK3so2o262792;
	Thu, 20 Nov 2025 04:16:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=kLBWgglbrBZJd23EQt
	B+VO3SVujZZFdgVdONhboMv6M=; b=BKzuO7nagjEwT0ZPvWwl6dayGS05bfWzPl
	/h/BXLDFGi5Grk+hw9CVE+VbGpvvnxR5p+hOAjPJQfhZhP9wFLxJyypd/79vIwyy
	woc/QrNKGysstuURpBc8rrks0k/xvrkBWWHWIgHesQtlGV7B5SWFV3oKavnvyTtM
	HWcj4Kvr8IJpVxwLOew7JIgf8dQp8QorcBwn/XK4m98rs8h+dsUjpWc1hzo7Ghos
	oF6vh9iG+UHA/2UEkxCdzcHNx/u2yZ44M5++j+wrOjbwo+xGL8lWyC7HZfdRavJ/
	WIu4OMhUAOhOaxg0egdxquJQZkcdVnbMwTQhMxlfzSA0uuMiGRLA==
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11020109.outbound.protection.outlook.com
 [40.93.198.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1e7xf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 04:16:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7OuEybI0DU0nTSjxM9F/H75owqFLAoJSx1OTSN8hUbiqCp89wxaNw/FVoL+QByiw+Va+DnsPnDnwfXVtDKw/zJWtk7NZ7MMwcbJxh1EQDfx0k84C97VvGmPuqDLBmoWjULEPDRLpPdB3mmuUr/sS8CEXRiCc1X5wb1GNki6C38nCoC2FmgRXFbJqnWy03r1+szJY3IPpeJy3NwvtMQivUUpqFtsfOTaGaGjENDuucEDbxu7u/bZl+2mgk5JMsygAoHZd6sRbAXfhHmLPM1OLLxTql/dNxGeQ5MDaD7dnT9qk4GAJCCQhWYD2EoM40keWW7GMiuxQUkAWi3weboBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLBWgglbrBZJd23EQtB+VO3SVujZZFdgVdONhboMv6M=;
 b=MZjPQPww9QYgxqMY9O2Vgji9WgrE3anY2A533UjvUN+9s6stQB1eOcqG5gT8hgVZJVJF2Ixmi76Y/pNmUUZJW2qWNFXt4vzG9iupShAQbARmR159TiwdLRJOEGcJ5nMzNs+obGG7d8kdCAJ8q9K0TaVGJ7UejfaWZSJH3u0teb6Km41ww7wFaxEiO511+L6fJk+IX90LNVHraC0Qaj4IH1YgCTWCwPcgWntl6b8QPNeTdF7PD8FLEb/JSQOzugDJMxYcE+FXM4gK96imrXK6lLe1f0tN6UnVnfMHAZn3kyEek0Wz98D6RRfYd6a4gPvcgRQlTGCXnoENv/zM8FyT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLBWgglbrBZJd23EQtB+VO3SVujZZFdgVdONhboMv6M=;
 b=e8imCR/XPF0OrtWo8csIwI8Be8EyBXVwFUeq4zv75YdV8TmKiasZcYUZXHjdUgkvVFTgfsnsWd0B8bbm9W1jOFmSJp+xlpD1tH+MbO/7eJPKTLThjxskaBQTnp5Q2w9AX6q6HAWVsTC8iy8sjLKn8rxWxpT+/DorJWChsFBAV+A=
Received: from BLAPR03CA0108.namprd03.prod.outlook.com (2603:10b6:208:32a::23)
 by MN2PR19MB4125.namprd19.prod.outlook.com (2603:10b6:208:1e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:16:51 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::1a) by BLAPR03CA0108.outlook.office365.com
 (2603:10b6:208:32a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 10:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 10:16:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 60421406547;
	Thu, 20 Nov 2025 10:16:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 50EA1820247;
	Thu, 20 Nov 2025 10:16:48 +0000 (UTC)
Date: Thu, 20 Nov 2025 10:16:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org,
        yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
        perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com,
        v-hampiholi@ti.com, baojun.xu@ti.com, dan.carpenter@linaro.org
Subject: Re: [PATCH v1 8/8] ASoC: tas2783A: read slave properties from acpi
 table
Message-ID: <aR7qj9sfvR/3v3P1@opensource.cirrus.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
 <20251120092050.1218-8-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120092050.1218-8-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|MN2PR19MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: ca13213b-7529-41e6-9acb-08de281deb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sSKcfaTiPogWnil/OWZ+lPwwh9xk2+CvkBUeW+DkWRh9czP2mboV70hbrqYs?=
 =?us-ascii?Q?kfCuz13vEOgr8sjz7MR1jOP+dBhzMK8eZ26CJYQVIGJVB50jZym1l0l8EthX?=
 =?us-ascii?Q?H9uWbnypB/Iev5aaZhGwZbBU/0C/mxLNPu6lX1NtmuWAj4SIYGone+anSRhV?=
 =?us-ascii?Q?cZg2fGhgbRRXsRjiWkULbZXDw7n7byA8f+vHGuUx1KoD57kS6l31+4YmRtP6?=
 =?us-ascii?Q?A9NV5D8b7g2qWjWTyiVuMFuQhIIO1KwRVGWHNy7Q7Cf5SVMKoLvhwXgquunN?=
 =?us-ascii?Q?CfCdVMGtakWoy5BT2zwf0ceY6G0bjEVa44EU7rshNpxgDRWKckq9vmJlDBx7?=
 =?us-ascii?Q?RIzYdVtwf/17DINRTYFtiPdT/CW6KHMuWrhyM7Q1BpgGrMW/St/oDB/WK5LG?=
 =?us-ascii?Q?yCZJ4hdCNe1atscBiNDYq0pAUQLtpEoBZ0VVWPqAE9uw+H+VB5RYuzXz2p1b?=
 =?us-ascii?Q?ZAjCNT4dlLB9AfLGwHuSP+/C0QEK9aywyVV+Cy1YxxCpk68rXgAvIL1Pf4iI?=
 =?us-ascii?Q?afc3sGfIa/lZuuASI1af2U6re3YtOqMMgnXgnZdqmLw64GOpBd8LRFKUwXSJ?=
 =?us-ascii?Q?LoH7vtYncKMhvhQ2dBJ1Uwy+8EeRIQItCu6oJZk+UkvdbxlEuOWEwoNmE4mg?=
 =?us-ascii?Q?rOTEl8/w+vcLI37cjNEJg54y2B6srm09oTwLOnYKtYBtbNhLUfn7C7LunCcL?=
 =?us-ascii?Q?yfmVMqQpENv+Tq+FLhCz8dC1VMeMn4NjPi/4RpPz4GDjjrkm0QD/s5SecR0h?=
 =?us-ascii?Q?smuHOs8c/rZIOBlz9I8B7JS7hlE4EKd1gSuPyHQEAJIvBizY6WdxC8Hwns9G?=
 =?us-ascii?Q?DIasRjncrgZUSd+eUrTQ5/o0/4NWkfOtjiRom7se55tOeON5NPdAYBFbBbDc?=
 =?us-ascii?Q?lFWaG8W2tHvFjQJrjQtgXmF4oTUxpG/Fyzp3P6dhKzxGav9aQ+KHW+tE+sQz?=
 =?us-ascii?Q?eJWUpw6BOmkmwN3c7r6sqCWtuwJM0iKHEJwrnvWxZ93KoK7KAJHxlPVvGeFU?=
 =?us-ascii?Q?dj/oL1oOouJ8VWxl5LFyyjf8VLu1AOKo0cAbzAR9jSFQbUofIZelvaCuLkxu?=
 =?us-ascii?Q?y3JUDRYQKd3BGHSwsvGL+05Xz+F/KmXfXADfrmMK/UEK+vd65+PMB96w380K?=
 =?us-ascii?Q?U6jlwvyNZe/sAb6T6CgWLiPxj0oCi43OO8r+AsTxMRNIlmPU3xyZf+sMHoDR?=
 =?us-ascii?Q?Yg5FrGglSN4xOHmPowObcSMF2AMlY0C7l6dHcqteyi//LgMDwqvnLXpN20JU?=
 =?us-ascii?Q?l41u1Qmc84ouRtQgfD8wBeDdqaX/irwe52YH3uYjsNmFcB977Q0Yoh78Hmt6?=
 =?us-ascii?Q?Hgttq5qiYjv8Usy7TROqDsgTo+MrNGQ5RAxb4aarrcpkQ4Y3EXKcssiSNCdv?=
 =?us-ascii?Q?a3ncNVpsJYeDfVMfJQ8cBoP192yHDP6c6tgQMNd4ii1SIuiUi/9xJiSqQoM2?=
 =?us-ascii?Q?hYkzIWJhvOkUT62A4mFO+Zgwqv8CTrp+Ra0GlueRb8AfY411sgTbEhvmjaKl?=
 =?us-ascii?Q?0ims0JMcUxPM9kc9jwzzH1iMGH12qsWBZcroJsV2uddjR1nuGRDVwvKb28hO?=
 =?us-ascii?Q?mJId/4hnNwEGwTs526A=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:16:49.8676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca13213b-7529-41e6-9acb-08de281deb58
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4125
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691eea96 cx=c_pps
 a=mw7aCRCFlb22yk7hlIuqAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8
 a=MUSQY567VsASbB6zHkMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: cZc_af36FINjrKBdDwnNyuADghBd6JvP
X-Proofpoint-ORIG-GUID: cZc_af36FINjrKBdDwnNyuADghBd6JvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MSBTYWx0ZWRfX00h+RgKWX4cN
 /02qvbyPhRNVp5LUHJZpWBobDnrIVE+mBSlQm+4mrJttCJ71FMa3VBU1IpKp6WABo9/puVgIqKu
 4t78GwvRJGyaXJftOCBE3ijw82M50h69CIcMJGYzSiz1P8qCx32rxJsVAOFVuPR40M0w2ABwvEp
 XFcAMLz1YKpg9vqLczYf33tuiSwc1/P6VhfpBMMau8CLs6UGibX/W71FwW/2N/rMLDb7pi7qJZx
 dRulcNGeADeH18cRNqzw26V4XtOrw28KsQvbgqeB0qzzoCaLz4FCFYOVb3NkYsinnv9+n4bc83A
 7L7rSTQA5y5XgBeX/5MudYpbHd1dfHjX03jxeabp5+oralUMoC4VRaxnFBDEViqjbVNJKkuBzJU
 aJLI5N9ubyjjO6QiS9uRyYUpqWV3yQ==
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7AEUKMH2T3ECFRMEKSEG3FWSBT3RPDE3
X-Message-ID-Hash: 7AEUKMH2T3ECFRMEKSEG3FWSBT3RPDE3
X-MailFrom: prvs=0419082d11=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AEUKMH2T3ECFRMEKSEG3FWSBT3RPDE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Nov 20, 2025 at 02:50:50PM +0530, Niranjan H Y wrote:
> Currently device is using hardcoded slave properties
> using the .read_prop callback from "struct sdw_slave_ops".
> This patch removes this and uses the sdw_slave_read_prop API
> to read the data directly from the ACPI table.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
