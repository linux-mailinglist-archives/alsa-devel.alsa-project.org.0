Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAF7C736C7
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 11:17:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6971560214;
	Thu, 20 Nov 2025 11:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6971560214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763633821;
	bh=wpq+KVXFOiQJ14m6COXC8LA79dG3iBwM9+ffzd/+UIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J2DaPudkwuwa7ihQEuybSRSyChz7CtZepXAdaApz6pO91iIo6SHhs8vS4qY4pThn4
	 F8XI7RkPhCzF2WWMJcDnQ8Is6ACTQfND8oTXF9L4zFLxnADKTrXmMyors5B7rk7P+3
	 JsnKWliYwIaPnV/J4HHqf6/mcz4MuTnhc1fuZL5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEDE4F805C7; Thu, 20 Nov 2025 11:16:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBEC5F805BA;
	Thu, 20 Nov 2025 11:16:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A697CF8021D; Thu, 20 Nov 2025 11:16:15 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 69E60F80149
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 11:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69E60F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=n9M9b2Q6;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=DYbSRUmk
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK4fZQq247388;
	Thu, 20 Nov 2025 04:16:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Tap1tdx4gb4cJepKVj
	18MaPgxZUL2J9o0knnlrFSnos=; b=n9M9b2Q6m0Wdc4jfytdZGahJrPvnACjMpI
	RcsxlAWRGZ0PAu6Y2KKCWXuUZ8BMwNytszWk98LulcLMQpeEGneuxIuCDb9mBlhj
	9oUmJvChWJHcI8Qt9ikP+1CFx+/Jl+RNMbadpUM+o4fbVmAfakpMbMhmpj01r0Th
	6QvFPxOqEO0+td01OACm9rAKYTlfKJdLl27oXhG7PE/EdJMNvuGA6938nmjuAVVg
	PJziZzb9jLgr1JsZpnhMb3oUIy+oVjQlC/3DVGmEFfV3HqUDbT+GxLNFRiEqtLXO
	q/M1W0q06MGr8Sn5JDV9YnK6H5hr3YBR/R0wWZrnbRKtLxVbp7yA==
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11020102.outbound.protection.outlook.com [52.101.201.102])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bma5u9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 04:16:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp8xweas2P2sco+KCApcFceiQoxbbLPnMPh93vLnizXU/qXttq0WBuxaUItca5oMy56amz3ZvzC0vb9CRPQDXv8DFOiZBjTwmWTnvFnJsmybF+Ib7O58DZ+f4vvF43ksjmGS724h/76VaoFXiBT0CRQ+R2UFdqSEVeZTk4SPKKltHvfED72l4nV7nTbYy8OVkNSDypKtw5LOPWvHpEG6j7J6HD5/UbYmuHRnQoCg51iY/KflZd5LgRuHCBTnWH3VZUjJVBfFQZjEboQLFJb3/V/HM33N9Tq/oEJFdq+3RhaSRYlooM1lM9ELhRM3xaVAPM+Aoa9Dp0HQOl4U2GLj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tap1tdx4gb4cJepKVj18MaPgxZUL2J9o0knnlrFSnos=;
 b=whs7+CLilhYKPq/SKMs+VtfJmxXswFVu0cp2puGeE6QX1s6lWo/vHGFH3eV8H3xYDOzx0lvjT8Dpa1A2du3nTEtxu82GfMezDOvflHhVYVVgQov84TfCGmBAVdPGwYHysohPoqf5XnXPDyzaCXieNv64esoe54iiY88U+HrCQ8TiN68hufO+U9slp854Atw98L0Vq6RNWNiddDNJjRDJipXpbr5npMilbLjMWvQ8YEfn6ZJ0wW3Cr4Fpz5G5zZ6aQV0MHTNkj0QICSQJyzMpRXoASaTkzRqW4XkQU3926UzyTCXCcrIHIk40uTh4S445AFHNEW3+UFcVQkZfjhHEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tap1tdx4gb4cJepKVj18MaPgxZUL2J9o0knnlrFSnos=;
 b=DYbSRUmkuZG86CsrKMI0rEoiaStzKRDT+9qhIBKqoRWJRDwdb2YJmUSQcgnaH2xmNrr+21ea/uXtZW8NLtCz8mk+jpqSaNVKLnSy5MHK1Ny6vDTtp3NuCjLAwIH64N7+lZqZ5ot4HaLoL9divN+y9w0Xfv2BrZZYl8efbdpeVt4=
Received: from CY5PR13CA0063.namprd13.prod.outlook.com (2603:10b6:930:a::19)
 by DS2PR19MB9554.namprd19.prod.outlook.com (2603:10b6:8:2d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:16:07 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:a:cafe::a4) by CY5PR13CA0063.outlook.office365.com
 (2603:10b6:930:a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Thu,
 20 Nov 2025 10:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 10:16:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3BA71406547;
	Thu, 20 Nov 2025 10:16:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26E15820247;
	Thu, 20 Nov 2025 10:16:04 +0000 (UTC)
Date: Thu, 20 Nov 2025 10:16:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org,
        yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
        perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com,
        v-hampiholi@ti.com, baojun.xu@ti.com, dan.carpenter@linaro.org
Subject: Re: [PATCH v1 7/8] ASoC: tas2783A: use acpi initialisation table
Message-ID: <aR7qY+ToHyuYQW2p@opensource.cirrus.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
 <20251120092050.1218-7-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120092050.1218-7-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DS2PR19MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: a41435d4-95ac-488d-fc69-08de281dd124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|7416014|61400799027|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MvGVrht5AFv9Pj2gC0mpJsElBCEH50nGab6Px5VVK/oWsmnRrlj0AT0iVa3b?=
 =?us-ascii?Q?d+HSBpL0gVFyZAalaKhg06SIXOhOv3Up8qv1wffRhFovemWm372REF+A/PHv?=
 =?us-ascii?Q?5bUwbi6JjwM0QcgUspVsNzzEIEhV5v9IaayssX4qeKm1VBFl7bjNYWBNOZSx?=
 =?us-ascii?Q?eu1N6kX2A2X12lQzuj8MHCmVHZ42fneDKZANaf4n65MVRp0iWwcVm3f9vg/s?=
 =?us-ascii?Q?bGjOcQbM6x8hmgfSdr2e3GQoKxf9hBKJ9YibzRy0ibL/RXd7wMlScI/9BWox?=
 =?us-ascii?Q?kOuXzsPo834ml8j+QYs+QWPcKelNOcU/R6b1Gi7NWYCIfgvratKD1un9gJt/?=
 =?us-ascii?Q?AkPRa2m5yqMcqzlIgY5uo/fahH1eT36DdOy4FKLZy5s/N6FDftqhOId5pVqo?=
 =?us-ascii?Q?TjJjAicnTgOp504X4QgKpSqtOJ4XM9tQ/OqGRYoZcR+1j+FL9VQyanliz7ot?=
 =?us-ascii?Q?wi4m8lfOTTAVTlK/zqmbRPnOw5KmG4DgdU10Oad87c5EnDOUnRw1npbttXO8?=
 =?us-ascii?Q?xqoItygTQQr7gbCCh8KHQtZo/87RA1qNCxg+smCJ5IpCvJoqTlficVFeRcVL?=
 =?us-ascii?Q?Sl98HYCsobbVkZdNXvOWNQb816xNxO6hJ1cAfSifSWuMpW95sOXV6ZPvizyE?=
 =?us-ascii?Q?ZYbNDrHdNDBt++ONwxABaLkh2/3QvSFOL3NiBrMGlbLk4xWS6l1ULApAj/ts?=
 =?us-ascii?Q?FA9yEkFbj9CTIMDC4aU2rAaSmiGC5EcOSLlGJ00x5IHBjV+aqNEXgpWEAaiY?=
 =?us-ascii?Q?tk+HBklsIY0mah2a1aQINJcy1ch9QqZAez+oYG/Wr1DbnhaVk20XVy7crYXe?=
 =?us-ascii?Q?iZ0/9Qc7ky7ivK9E8oQ6M9NR5ai60NIMk64yZg4tISaUtWlmYx+pzdktKl1w?=
 =?us-ascii?Q?r/nVKfyQ3PX9U/PyC7VQovNJxQoqieqp5Yo/VO6YRa6h1CwY2FOEN5npQaur?=
 =?us-ascii?Q?Y5HggcHK93jpWk6l1qmLuuNNzboVf1UWbuEN70A2dI5XTVKfQNdFlSmpvDFr?=
 =?us-ascii?Q?d8MhKeOjptWm3TyO0aimgP50v3nM7SE0g91fyrzeIISJAcbQb9oE3NqIbzB/?=
 =?us-ascii?Q?EoSZ36/W3viPwL01qrivxYj7Z3Cv2tcfPwn7qi7r5FvwGweReHeTVWXNVBd8?=
 =?us-ascii?Q?EtIywTySgi68ubpXVE+69xVAYnPoq8Hqf/Zs8BPriwuBj9oAjZ3LFapQF2wJ?=
 =?us-ascii?Q?AXiA77bhqAxAagcldHGgdxLQsXM7kb2ocoLqzTGQvEQ1yRh7mHjDWBYd7veS?=
 =?us-ascii?Q?zpAnSx9q71y/J1BaUnvdO3ebBChU70qA3/GZqzYJGtTfVe9gQ229PLNN7Cu9?=
 =?us-ascii?Q?oW8ODOVYGTi/DkU9OSAS+Jp9g9bDHo5eB10W/CJlPbITbskZQvpBpXABeUId?=
 =?us-ascii?Q?6kxliY2qhT3auUg98gO+V7qIu6JPgJBYl0f0zPbUEMhwBmFZzPTdGnuQWTSh?=
 =?us-ascii?Q?HCVtucgis5NKtO/vB6eAD4HLfKy+ciNjiV5Nojg/hHDEFlfvj3BvYcy9wlxj?=
 =?us-ascii?Q?ZB4i2dZQR6Cr/fo0qDdeODpXbSe9hA2tKxRSfxao1haP5VD3A6GvGidaKdk5?=
 =?us-ascii?Q?KT3q/3AgVUF2Lz21dRM=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(61400799027)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:16:05.8257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a41435d4-95ac-488d-fc69-08de281dd124
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9554
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MSBTYWx0ZWRfX/kp0H+UXrVpp
 jCJscqF0DDllWBy+jD9bf6dliCY5WMcDUuIOp5ZXSLt5pHyFY1PhonO259ow9k48MmJSzK4sOav
 rhesQ/9e/3bb5ptl/m1bs99XRp9Ox8fA63YnhmnprBg0cD/flVOzPIrT36Oivd7qxY3eJb9dPGa
 knynIKxbW2UmIM6+P28Zy18d2ZZVuLdMW6012ENKcw04oysAfgVFvO0Hp1Y0ul2a/q73R17nl7E
 H3Eveg/Ht/x4eT+kRZAB5+0WZDGkNRREVQJiTC1PRgUJL7WIynP7P2UhRFRISDNM/CMkbDXs0ug
 gGY/XZyhyuOjTHKnFC7xlZYuTF/leTrr2G7pEA+VwJcsy07qBwC7UrgPw+BmKbirU7yLx0qwWWE
 YiEAJwZ8o3Sed4FH3hUpLm3JQu0fvw==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691eea6a cx=c_pps
 a=5886/XAhn54D+t2DuUGJPw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=sozttTNsAAAA:8
 a=TkMpvBzQP867S4iYnZQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: LrMDrgKdxz1WAXv6teRg9hLDFC1nMp6F
X-Proofpoint-ORIG-GUID: LrMDrgKdxz1WAXv6teRg9hLDFC1nMp6F
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GWWIF53OGKLJ5UB5BJZBLU4ANSQKRQUA
X-Message-ID-Hash: GWWIF53OGKLJ5UB5BJZBLU4ANSQKRQUA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWWIF53OGKLJ5UB5BJZBLU4ANSQKRQUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Nov 20, 2025 at 02:50:49PM +0530, Niranjan H Y wrote:
> This patch adds support for parsing the initilisation
> data from ACPI table. This table is required to configure
> each device correctly so that correct channel's data is
> selected during playback.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
>  sound/soc/codecs/Kconfig       |  1 +
>  sound/soc/codecs/tas2783-sdw.c | 61 +++++++++++++++++++++++++++++++---
>  2 files changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 433af9bc7..94d66e4d5 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2146,6 +2146,7 @@ config SND_SOC_TAS2781_I2C
>  config SND_SOC_TAS2783_SDW
>  	tristate "Texas Instruments TAS2783 speaker amplifier (sdw)"
>  	depends on SOUNDWIRE
> +	depends on SND_SOC_SDCA

Great to see some of the SDCA library stuff starting to be useful
for people :-)

> -		ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
> -					     ARRAY_SIZE(tas2783_init_seq));
> -		tas_dev->hw_init = true;
> +		if (tas_dev->sa_func_data) {
> +			for (i = 0; i < tas_dev->sa_func_data->num_init_table; i++) {
> +				ret = regmap_write(tas_dev->regmap,
> +						   tas_dev->sa_func_data->init_table[i].addr,
> +						   tas_dev->sa_func_data->init_table[i].val);
> +				if (ret)
> +					break;
> +			}

Should be able to use sdca_regmap_write_init() here once the
patch is merged:

https://lore.kernel.org/linux-sound/20251106114422.906370-11-ckeepax@opensource.cirrus.com/

No point holding up this patch for it, but would be good to move
it across once the core function is merged. And if you wanted to
test the core patch out check it works for you that would be
amazing.

> +		} else {
> +			ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
> +						     ARRAY_SIZE(tas2783_init_seq));
> +		}
> +
> +		if (ret)
> +			dev_err(tas_dev->dev,
> +				"init writes failed, err=%d", ret);
> +		else
> +			tas_dev->hw_init = true;
>  	}
>  
> +	/* check if we have any SDCA function data available */
> +	if (peripheral->sdca_data.num_functions > 0) {
> +		dev_dbg(dev, "SDCA functions found: %d", peripheral->sdca_data.num_functions);
> +
> +		/* Look for Smart Amp function type */
> +		for (i = 0; i < peripheral->sdca_data.num_functions; i++) {
> +			if (peripheral->sdca_data.function[i].type ==
> +			    SDCA_FUNCTION_TYPE_SMART_AMP) {
> +				dev_info(dev, "Found Smart Amp function at index %d", i);
> +				break;
> +			}
> +		}
> +	}

I do wonder if we should add a core function for this search, I
am guessing this will become a fairly common pattern. But again
no need to hold up your patches for that.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
