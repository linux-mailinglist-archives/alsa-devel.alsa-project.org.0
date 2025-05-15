Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43157AB8808
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 15:33:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FA2C6018C;
	Thu, 15 May 2025 15:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FA2C6018C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747316002;
	bh=th9Tjy9oOMkj2LquAoJaxiQAjPht5q7k+MhdkYyO7cE=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VXZuf87hqbOJdrkvFIT14IF1ZYdQL/RaVfTzFpThtKmvqJniWBczQKWJb+Sai9Gb5
	 wSMiRJ3XPSwuyTnDP/r9ApDjohNsWeYWQxz2Dw9SweRkAZpR7OIbOeSguSSfxRcZ7I
	 v3xSH94qhhA9xaBIXW1/hkaR3zWz316nOARzbWu8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B066BF80171; Thu, 15 May 2025 15:32:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9294EF8016A;
	Thu, 15 May 2025 15:32:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D1E2F80075; Thu, 15 May 2025 15:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5238F80027
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 15:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5238F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=DwFqU0Sy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8LtRWfki14L89y8fdBdituV45776FmJ0cUCKIuO8y0Hvf37sM8HiaxS4qHK9f1OvWYw0xtzZ4OJ3+OP9wQvYebcJZCbq+atcKNTaQRNNYYlII/tcWdrerQ0KZogsET7sQUjzB/YGbaxsL3LPCgbF9qX8F0KV/jdUOsGSGCPymnCn8EZnvWvv86vzAfnCrgzLPsG+EJTOKIAk3n8Jlwb/u1JZJc6CwJ4VC9hWKmx7jXg1KfTXm4bjI4+JV1QVLFK1QfYzbGt09/8plRYXYBdxkSLyd+yIfBBnIJ1/79zXRaNqcS7YOlq6pSBVB9U73F/1I6n5KEHZoXCnWEip+7PLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN+QSWCR2G0jpwRiWpsOyh+gRtDKc4fMLzWnoUARWso=;
 b=Fba7enHuXLi94JpW4CAJ9kFib2zgWnlZHaEtuZvwQfkf84HRF/fGUkZaQ/1jsdtaFodkTnou2rxegMnpIbb7pH1BrnJZ2+b6lXOztDwH88P47QfUJ2Xk2yry9YfdHxjem9FF28FcQnplwU8QguyZxZd2jHGFK3eZ/0UbUblAIIqz00eShMuHn5sG507Iqg2HKi2SB/T3Yf2+O/pIqte6NvLvzsWYaJs2kD0eNYPWSr5Z1pbvKu1nbq9VMxF8R8m557DWUwS0k8UmBTJABoZK6R6TMncut9zX6uxeanXhO1HjMetb+cXxA4wR+B4mB86KE65eMr1Jfu0HpYjx6liYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN+QSWCR2G0jpwRiWpsOyh+gRtDKc4fMLzWnoUARWso=;
 b=DwFqU0SymtOWWd/q7L7p4EjYGt+2Cjdky4WQmRZyT2vnP8Bgew8I8H3KjLlh1hvFY/8t/9ggYcy/C2ml/Qw99ulD3nXDO+Ug/pQIa8EIoLtv8fkBI8KayL8lB3AP1o/vwTornH6ug1QtZ8m/K84JiUlhB41tWHyedQA9HM91JaQpuek04MYMiSCa9ialDOw+m3jh7hVGTdQtDxJpMHstCAKBHMiReCPY4GtWiwV/mhMbA98N4yZHas8r++RObbwk8lHY4NA9KqYp9L1cVO/AqzTbi0qvM6sD+HbOp/oim5FDV69C4ezrpYEAMtJ5iqo2JyO+KWfc9pGBGXLWYQWH7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by SA3PR12MB8440.namprd12.prod.outlook.com (2603:10b6:806:2f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 15 May
 2025 13:32:39 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:32:39 +0000
Date: Thu, 15 May 2025 08:32:35 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] conf: aliases: add hda-acpi -> HDA-Intel alias
Message-ID: <aCXs810qs_pvuOtx@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BYAPR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:a03:60::20) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|SA3PR12MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fa2d7b-8dbf-49cd-ae5d-08dd93b4f621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RjB096JnTXx5xWB3LDsO4B8kuF2F2qi0r6rYIL1qAvqw7qPyOT/fXUHjpzdU?=
 =?us-ascii?Q?COL4Sq+ovM6l+c8NgY7GN4wsv7u4DN+IvJMra7R6pIqbsaPC0BUVNRptxaFe?=
 =?us-ascii?Q?QPnSk2Z8J3raNhTYHdx4O78ePZXh3itZots7segajrXpR1Mr96D3mOWtKKiI?=
 =?us-ascii?Q?o9I8zaYMkAF3Jts1jCoLg/D5IFlVLU6h6bX0Se106/vCDfzghzIPfabwtDxY?=
 =?us-ascii?Q?fMqM1JQq1y6onA0j5mK46oV61eX6tNOOi2axT7XfUmmI/a7aq+xPwH3N/vL8?=
 =?us-ascii?Q?YZhBxEida3Zr1GsjPZOjfvGOJ4IxaVe7yfAyLRWPbE76PlTc/YPLUdUpDJXx?=
 =?us-ascii?Q?JeH812h0RqTeAs1DED4mKiGOLe9h0W3QdAUxvQ0H/TxH3k/ZrU35hXC6vMR3?=
 =?us-ascii?Q?kTkYZpeJSINcqKlxVMpDMyRU2HsxLOqQ0wb3+MeM7atV2Os3Ucl23+fl7i//?=
 =?us-ascii?Q?qOM/VG6GQCzJLzwD1uwCsv1YSK7jJm04e7T+VM59QboCX8772WuxhLKM/W28?=
 =?us-ascii?Q?T/oPlarjMC7jGc1fLs+qO8Wi/SLrjdNdNvW0Q6/6bt8FsVZoXk1KyYWa3gEz?=
 =?us-ascii?Q?BVcCwR7xI36uXfWiDcZMpsjbkc0WFBYgPFqVo7oFhAxWQ+DNwiWnEPWgMe5I?=
 =?us-ascii?Q?RCMILGd0P6cj5F5jvqXn6M1Swsr0TkbPJQ+lluzJUKZPHtQBYyLCkrzn0jQ/?=
 =?us-ascii?Q?krBlxaI+MARSvrY+AsLYIWXa8e/niijLZlVP4JGIu0hkffzoCK8sxnzDB0mk?=
 =?us-ascii?Q?ixaFgVGW1+krvjRa4SE1wWB3n8Wo+Sv4YYwYyEXjeKPsNz5kjRcTh0zs7Bou?=
 =?us-ascii?Q?9cXMCsdy4LjY56+I0BeWp9mkhGILJA6noIsdw8Yq9nA6s5wkuXRWuxkefDM4?=
 =?us-ascii?Q?pjSfldkzjCxmLpdxPJJBhlq+p6tsiGHr/3P8ClYaRQ/ES2peDog9Tr54wF9A?=
 =?us-ascii?Q?Kj5W3vEl9KQiGuHU6+hr+sDw54c/Wd8698s7dPanPj8rJ/GKcUh0QDnjfuvi?=
 =?us-ascii?Q?lWeZE5b3r52AA+Hr2rgtAVEOrzax/Ng8HGXgzUJYOCmNVX25UAnOPEgPcVvt?=
 =?us-ascii?Q?P2MZD5BSRJXhAavYR765120I9Pr4ddYcAtfJq7ipnDR9AVr1dsBCAEJ2WsnB?=
 =?us-ascii?Q?DE5yrAuSRYaWQ/YfmNtjUTIVO3i9cTRl++WqhoA9WXONeuQhI77o9Tl03SBY?=
 =?us-ascii?Q?2UEFTwvRhkkBMM2LXKy6sDXy8UW7zpq7UZxTwR78cRxfLJ7UwFExVYq7ZdNB?=
 =?us-ascii?Q?Q2pEcffv1unMndIxnz4qIKYVRdgiyp9k15R9astLYqOr51kBrCq+8i5fkLOs?=
 =?us-ascii?Q?/j5FmMt0zwqYO3hyfQ4O3Bh0/5iZe6k8enJd0njx1+X4cGQKGRBogtIo3G8F?=
 =?us-ascii?Q?/GgDclfwTBihS2rK3/iIhV0ralJUIbpPRaSuL269/mLlC/i6YjrSE+iiID0j?=
 =?us-ascii?Q?/ULoi99MmvQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p+hmVkpYP5MwGkAV+vbjt5sy36gfm+XViUmjYYFhvn0uKLxa3EJ9SDdVwIn8?=
 =?us-ascii?Q?f17XFgFZ1j0Zxp2T0ttqGhD3/e0y8Ipa25LjApPtFzZqGxcecK2jixR6gW9X?=
 =?us-ascii?Q?rR7U2zeBnAa97WQMf8MYcENl3A1bjwJZbDeUkGbSOVSb8I2g1lDMky+rL8S/?=
 =?us-ascii?Q?XwCyjepHpktWEW09A/FydEvEIhSLjt3GOWIJZPJ4K1xXaDvJrDHVZ0doltyk?=
 =?us-ascii?Q?p1E+GYbcp45snIewCuD72Rem/FW8+PBZBzTY8AfWJFyCvqrV6g+Wi75rPH7S?=
 =?us-ascii?Q?wq5eMGvJ7+Jpzu9Z3yrYLsxkxL6UtIkDetN9S1v4yOB3U7vO9XRI96IesxFE?=
 =?us-ascii?Q?NiV7lMeqdUyL1ABOR0p7/NbsXjOT8NMHuL4is6ukPGwv7zxBc+On3Mwvj7NY?=
 =?us-ascii?Q?9eGEAQKQSJrcU/0fTwv+O3PLjvoUQ1nzIPhIudxBzVOecf4v9AzhoDcRziWg?=
 =?us-ascii?Q?Tl2aGNra4Yy12qxFihvXdzk29JZ4g9489ELFCrOORJBtEd30QgPB+XakyQ69?=
 =?us-ascii?Q?flodut4jXB4guMC/xyIhRdhbzkhKRwTeUA831DCRGIA6HaTyMBfiJU+1SF/d?=
 =?us-ascii?Q?t1ggrmVmTXxOIxI3im8Ez4O07GFiie4O44VQ5LIZ7nxUd/cL60KFL0KcyHv5?=
 =?us-ascii?Q?w8qaok+OKkMPrpQbQ9a99BMWW/akz1gGwdr/aexE2kPJ+JLTDjbkK43NqjvA?=
 =?us-ascii?Q?+lNB+1u28fwbmAJ27YrvkBtYq3AJFPjdptWlRqThRjSJn8ya8Iv6ipevSbVT?=
 =?us-ascii?Q?huk7BGmAiza9ohGgRt8zaRW1YTvzIrQ5wvm7NCbBrgwguOGbovvF1M60Vrg5?=
 =?us-ascii?Q?5Ro67a8oiYq9u6MLXFyrxQO19A22XL/8m4Zdk66AqNGjNCBOjVtvwXYBPzED?=
 =?us-ascii?Q?nuYY5ldMwaDh6YRBGXADNLdN83fyibQc3iEko8gX01UHmH4F42AZP2GQ7Hbu?=
 =?us-ascii?Q?mKdrLNHrRKLv99WEp9/YBNExaStgnQAReFdSaTs7VpL7cMjNWtPowQJbH3NS?=
 =?us-ascii?Q?3ZwhSwpoCqVSZq7RnE5nYfMDHRFSOTz4ddyYl12+u8xTyMCubK4jPO04pnKe?=
 =?us-ascii?Q?Zj70HnkvevNgDmQLSXy0/Hp7R+DVEs5NGvhGdYl10rkf9ZJ1pnTpAWTr6jaD?=
 =?us-ascii?Q?mM0pwx2Rhd66OcWQ/0PxBX1pDRBgw9JaKch0KiCfhsAJ1tI06WkUC7c9zkV8?=
 =?us-ascii?Q?i7OUgRrGRL3I/LC9Fkm5+ZZW2OSBrJ2zxuqtIvxhiZRSD3l70o8jncdj/c2h?=
 =?us-ascii?Q?XgQiC7Eu0cN406ye7YzDsmlDgCUAKa3mT6q20QfRGZ966VrgoC6kDZyhHIxV?=
 =?us-ascii?Q?O/eqTmxzN/rVLaLOtaQIyNp/oRPuxPA3mwkIFwK7nZ/auhCZLIb+EiDK/D2t?=
 =?us-ascii?Q?GcTblgB0R2cNRrMoP5Jp9Lwl/ACIaf189kKRmOYIwTwm3ZQ3nkGt7nPASCgy?=
 =?us-ascii?Q?RR8fh75dbD7gj5wKfRa4O9DHUbt2Xp5H8ANp1xeOUvzhF95vw3de6EfAfGIm?=
 =?us-ascii?Q?nTHRW6Xpc6ZsZxdR6omjtemEiQmWncuj4aB2YL6k1o4ri6bFdi6sScQ7hLpa?=
 =?us-ascii?Q?Wnfl2zHksWLMDzv4hhuYYlcPbGS3j2WNd8gKIc5V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5fa2d7b-8dbf-49cd-ae5d-08dd93b4f621
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:32:39.0872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t5ZOqvtKW50SdexkgWmgF84+Sx9atu0kWPLU4svjrelX7VJoRGmtlzwtCRGD2vzlE7yndSPftsuyu8XeeN+lgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440
Message-ID-Hash: 3CNTDDTUYSV5SPHTA7S2TIGRJQ5RQHPA
X-Message-ID-Hash: 3CNTDDTUYSV5SPHTA7S2TIGRJQ5RQHPA
X-MailFrom: ddadap@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CNTDDTUYSV5SPHTA7S2TIGRJQ5RQHPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The new snd_hda_acpi driver in Linux exposes the existing Azalia
interface to non-PCI devices advertised over ACPI. Add an alias
to the existing HDA-Intel configuration file so that devices using
this driver can be discovered properly.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 src/conf/cards/aliases.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/conf/cards/aliases.conf b/src/conf/cards/aliases.conf
index a54824ae..e2d59aa7 100644
--- a/src/conf/cards/aliases.conf
+++ b/src/conf/cards/aliases.conf
@@ -57,6 +57,7 @@ CMI8786 cards.CMI8788
 CMI8787 cards.CMI8788
 pistachio cards.pistachio-card
 VC4-HDMI cards.vc4-hdmi
+hda-acpi cards.HDA-Intel
 
 <confdir:ctl/default.conf>
 <confdir:pcm/default.conf>
-- 
2.39.5

