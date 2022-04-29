Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2935E514D38
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 16:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE0FD15E0;
	Fri, 29 Apr 2022 16:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE0FD15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651242915;
	bh=f5Ci47RwynYCF7SzHYLXWo3JmcNAadZ57F8fw/N/Blo=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cs7oZgOzwuVs604bAHXkYS80x1JObI6eLbRNnBDGEcjjJ0Ll+NnER+a7F0wrGZwzk
	 T0RLRvnTeDOvTbhOUCPu5x7jE4Bm0+CpD5M9jKm72418fCDYuRim1+Z+WhJG9VW+pM
	 eWvRP3AjMxdMpPrhFvO7iywOqTTOfzIDe+PJFPlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4157F8012B;
	Fri, 29 Apr 2022 16:34:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C124F8025D; Fri, 29 Apr 2022 16:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_35,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF72F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 16:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF72F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="epJ+EU74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651242852; x=1682778852;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f5Ci47RwynYCF7SzHYLXWo3JmcNAadZ57F8fw/N/Blo=;
 b=epJ+EU74bdBjI7RG3pOt0O5IXnRXEIT7/Fo0lDtn+vXQNCm4iLPqFYjM
 BwYBlASCEozHL7TP+PtJqJ7rcu+Ok7NghNbYhPiKQejutdNktAjOHCVqQ
 uyXLNIf2kT/AFbYb3+KAezRDeaDsQYs4KngV/3qtBFFweJxn5ck/6bZ/d
 OjWhs6SXSP0Trq+As/JKPBjw3JAbmwyfAartYzFyO3I7QupVXwsdDCAnF
 xk4AI9tc8dsCyy3ObJjtI3csaiOo6HSchzurZ5UqLKQ5nkqEvQlKhI438
 P5FlkQgs+Z8nISTGx7ZmnBp6UWsg8S+8m2gDI0Ehm63DZTAcWdAOfbJB+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266188416"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="266188416"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="881153586"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2022 07:34:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 07:34:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 07:34:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 07:34:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmoExDPJj+Dzy8kqOW3OYSuNs/4IbBygmXYAmW/FhwH10vq2RGQeyhOR+DZ7U3/WFaro9OCu7qTXEj79bbR8C3I0hfHpGK287MXB9PbdzNs6Y64qwu2wkORQpsgG3Zho6R5Sryw1b56uVlVHuExZWD2Xrh/Jke9vRKDqujDyNjgKV/sgqBsiM1FIUzRbfRSuG2842ocF17X5MUjttblqvt8n40ltvqKFjI375GEy2lNw3HgLH/LdDGjiHdQ2oiCOY/yc+tMiAfIX6L/sJA+znuBC5cKkbeeFJ5H76VUbH4WOvhHKXn4H2WSVJyIX5q1B11afZltk40hQR4bittNwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xwe1FBVegd8cNRelFA+DmqMPk6FNGOoyQa5GqWzW1T8=;
 b=CsOs/7/x6BlgzMVRmfQkMwdjjupzOrZnm+WgQ3ehuDlOb63hkhPufZoS2jThJTt6V4YFA5nGJy1drlZRjEbRMv3KwInMM6JuOOTdXFGjHvYDqbnhzTKLfhV6DlO+yW4QRy6jJdzEQFVgyFSP60kr1xVT7Wb+BMab6I6h1bnWL78Z/pOt+8UTBaJzfguR8yvxP/rvpAo8OptYJ0TfBT7pG2M+9Fc7QzUyIA+/P8/GwOi3zg1/s97tNr2/vJ5Ky93yFIvbtkq4178PkzlPSuq1T7zvy6EvV6QnFenT+gEsHJdohwe+U7UxHrUGxtYXiRhjJwhItWfFAkTmtTAsGkvQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB1617.namprd11.prod.outlook.com
 (2603:10b6:405:f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 14:34:05 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.023; Fri, 29 Apr
 2022 14:34:05 +0000
Message-ID: <d183de84-dc9a-8fbd-b016-d7d965d4905f@intel.com>
Date: Fri, 29 Apr 2022 16:33:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 08/14] ASoC: Intel: avs: D0ix power state support
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-9-cezary.rojewski@intel.com>
 <c62f108e-6887-a4e2-a155-e0d18b142ee3@linux.intel.com>
 <349d743d-682b-757b-ce92-cb7c1e9c74fd@intel.com>
In-Reply-To: <349d743d-682b-757b-ce92-cb7c1e9c74fd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba84927d-7d39-4c5b-6c8a-08da29ed4fd5
X-MS-TrafficTypeDiagnostic: BN6PR11MB1617:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1617A1148D03A4F244EB9B1FE3FC9@BN6PR11MB1617.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdzkZp2obufwRgVj/ONKgfcsv5+eMzVe+m1TfmMKQQEkwgB6LoEt/vuLkakWWzuFqf8FULifq9biA6MFMk6G7Vl2Uxe7Wq8vF+lBhE71zv0rDiILPxXp26pQX8nplhs/QaVsKLv4PUSBxxxBlVuZP2v8OEZF5qCuEuI2VBnojh/cXK0vMflE9j8O+eZa8ToTPxzbHHYnDiglIo+N52gLhCetwmZMgwOVr+6MZLgji7+obDJKnF9V9VRcMewgJ0Bka+REJZSgoylXg0jz9s90fdYinXd4GVmd3wo7/TiUcH8PThcMUuF6bTxntqTvGXjb2mbwOBEpJ/RNc0+5hAeyrLriENnW5lt6DqJVTaQ60OQ9FwfKQMgNUzTOcxL32CgdqiSzLODI/wo9rydBGkGeJOzu1k1NXN/lV2uVgUvMzU9Cia9gzAHpERSrTL+moNk+gWxt0/+Ued3/AG21Xs9CAuOcqhjFBS4Hkq3BBc9NOC3cuZrTYo+kErtpSePpFGBxzfS39i51E8dzcmRUiqiNee5asROGQSNaP5JwVNS8e6yHTGCB/ESM9yjoE1VmoNdrsZfalv7hXfQ0XJQF4lEANNzewBPoFepbChfvy4AGr7uN8dDrfo2mqUOuEnEuKwUPIZPfRHQ1hTczxk/tq6CPuQ2zIru6W9qa6THhfetIBJIhGdkWZ5wDQLoj33tstUMDhtMW1ydEw44DpDfpWmgNFTsIVg4I5Ig6iTHXaA8WRe5ydZyl3f2+2lO1eiu2KQ/Cg8EQbbFkBiYjhZ44SseM8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(6506007)(66476007)(8676002)(66946007)(26005)(6512007)(31696002)(86362001)(4326008)(316002)(7416002)(5660300002)(6486002)(6666004)(508600001)(2906002)(31686004)(36756003)(186003)(53546011)(2616005)(82960400001)(38100700002)(8936002)(44832011)(83380400001)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUhzb2s0YWdNeWZaM1p5VHhtaCtiTCtaZWorT3V0ZTgzcCtZdE9aY2ZBTFQw?=
 =?utf-8?B?My9ONnlqSUhqTm8vS1B6M0FycTVYVFo5R2tOME9zai9EYnJhcEtYMThiMWlH?=
 =?utf-8?B?eDQ1WGJOWTE2QVRhSk5zcXBpckR4ZGhjQm5qR1ptU1Z6Vm9SSjR3NVpMT1VT?=
 =?utf-8?B?WFlETnZqc250Sm1ZVDNyYS9CMmV5N1JwUkYrVkZtOVVxRHZyS1YzeWptcjlQ?=
 =?utf-8?B?WExmN3VOMlFNRjd2bDV5Y0x5WTdoNVVFWjUrbU9rOCtFWkFVL01RSk9qMUpC?=
 =?utf-8?B?YlJMSEVjNS9xRlJLc1lhWVpoSFhFTC9kUFB6R0g3UTdjc0ZjaWF5Q0F5TkZV?=
 =?utf-8?B?SUNOS05ycDlQVDB4ZjJUaGIrVTU0TTJlVFgva0hnYUZUOEVENWcwUWgzS1hX?=
 =?utf-8?B?Tkx2dDNtQ3pseTNNNFhEblJBa1V4ZjNVRTBLcGNTYmlLemU3V0VQY0p4ZGlJ?=
 =?utf-8?B?clQydEE3VzZYTFdtU2JiOXQzS1RCelFuR1FLWS9wU2Z5RHpYdjdkS3lkNXhk?=
 =?utf-8?B?ZyttWHR0Q0VBTm1ON1hmaWRrOHZsL3ZGMS9OaXlBV01vRjlyV3NOa1BFcFNr?=
 =?utf-8?B?ZWhaTjE3Nm91M3VjcWdLWFdKQnFoQTNndlJTdVJGOUNJRVZMZC90amZuVDBq?=
 =?utf-8?B?cUVLdFBqTGdvTjh3SkpUZ2ZmOGFYZlQrZTJmQmhNb3pYb1o2amUrdi85Si9K?=
 =?utf-8?B?UUN4NWF5OUlkOXErSE1pbEdxY1k1aXlscktVdEQ0cWxRWE9aTmZGUGJqQUJB?=
 =?utf-8?B?Q1ZibmlDM1YySWFOQ0o1RGg1UkZydHlJY2Z5ZjQyYXg3d0pTT3VqQUV4Y2R2?=
 =?utf-8?B?RFUvQmFWellXekQ3eTJMMzY5NlVNalVmMUZ2M1hDVWxodnVNY1A2OENsNElh?=
 =?utf-8?B?UkFnVG5mV25nay9uVUhUZ3ROb3ptdm5GYXBEeHBxTUFGOFZ3VkducnVNc0lZ?=
 =?utf-8?B?UFNXSWVWTmtPTEh4OWxWOGU5dFh4cjFIS1JxdFQ4K2RReHVMRkxRNmRoMTFK?=
 =?utf-8?B?V3hnYmlucU1pVnJOZFBEUVg2cFFUdnVYQi9EaEpOQk5QQi9DaXFCQ2tLRENJ?=
 =?utf-8?B?L2lCaFBWMHJER3JZSGhtaUdJb0U3NFNhU09QZ3RiWmxISzR0ekRGdnBTM01s?=
 =?utf-8?B?NFhYRjRRUm9wdVRMQnNzNjlwK2UwRjhXc0NRcmczbE43VjY0djhKU3hFdEZH?=
 =?utf-8?B?aWhZWE1hQS9TOC85NTdTNC9lTGUxRzVHYjUra2pBZk5wcGdIbTYrcGpPNVRD?=
 =?utf-8?B?SW1JT0txMmRxWWd5ZjByQTVzTGZ0c3VacGRVQlZuNlNNQ1BLRG1FMFVMdWZV?=
 =?utf-8?B?RGZzVlprSHdGQVhZWHpsL2lHMmhhY3hESFFOM3FTWUd5WGs1dWxlSTBOUkpx?=
 =?utf-8?B?QmUwR1l1eGM3L215Qk96MGZpa05xU3hxQURyVWM1bkk0NFc3WFViV1hYRE0v?=
 =?utf-8?B?RG1BSlpCa0E3N2VOZCtJK0hjL0FJdHBZbkVmc1hqM1ZtUVU0ZnRyNWpGNkpE?=
 =?utf-8?B?TTlHMStGY0t4K3R1ek5mT0pWc3cvMlZPcTZZbW5Wc20wemRLSW1NWWJKcys0?=
 =?utf-8?B?bjFJN0JGNFFLWEt1MTQrWis2L0xYSUh6UjI1NnJHbTdYNDNxZVFyVTVFdmpp?=
 =?utf-8?B?Uzc5TytVdGR6cENaTC9Sb2pRemhCN0QyYW1NNmpmMWw0Y01CeUFERWp6eW8r?=
 =?utf-8?B?dUxPeGJxWnk5NElhb1JWWloybUpibm5mOTQxUCtsMk5hVGt1VlE5c1ltT2lB?=
 =?utf-8?B?dDFQRHpleW52TFN3aHduSlJBMmJvdEdnK0pwYlVtc244ODRCOTJ2S2gySldk?=
 =?utf-8?B?OENIRTFleHFaSFpobVJFV0R0dk14ZXQrZlg0UEgwSmxxNFIreGxCWnJ2WXlv?=
 =?utf-8?B?Y29SSk5LV01JcTFQenZaUjBFOUJRckNMV3ZDb05tQ1A3VldrakJaSWw3aCs1?=
 =?utf-8?B?cFdGTDRWV0FBc0IyeklFUFI3K0RjQ3hmWmJmWXlSeFRiOUI2cDJtUSt5ZjR2?=
 =?utf-8?B?aDNNa1lJOW80STcrNXVrSm52Z2VlNWRHeFpFcEVQMDBYQWNrZkxrSDFYQVlJ?=
 =?utf-8?B?Y2tkSWxKcHJWRzVjMVZxcGdRS3NseVFYQVJzek1HeXZzOEt4eWJZUnFvYjZL?=
 =?utf-8?B?bndPZzBQazBRZnpEL1F2SnJUMk9taUxmY3RKdjF3Tm5jVEVISWpjZGVWbkFq?=
 =?utf-8?B?L2QzTVI1WUdRYkNudjU4emY4aWxXNlR3NHN6cTNwMXpoSGg5cnZJbDNrTm1I?=
 =?utf-8?B?T1JibTkwZU92YzMrS0dCVVlqRmFqVWVxRG12bmhMdCt2dS9yTnBIRFBOc2dZ?=
 =?utf-8?B?c1paNXdLbW5EaGpyajMwczZDZEhFQ0VocHM0alFjZGVqeGV3bkc0OXljSnRz?=
 =?utf-8?Q?NaoLVGVc8NjTjn3M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba84927d-7d39-4c5b-6c8a-08da29ed4fd5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:34:05.0815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwEck6RhBiLte9cc0sqPm7EitEruLTZHLSS/p/wT3qpYSgMkMpC6AXx+bPJ6r00YbojtdvdTXqfC4G4PNBFOMPbAJo+0Hfr18C3U2oxRwOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1617
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2022-04-29 4:19 PM, Cezary Rojewski wrote:
> On 2022-04-26 11:58 PM, Pierre-Louis Bossart wrote:
>> On 4/26/22 12:23, Cezary Rojewski wrote:
>>> Audio DSP device supports D0 substates in form of D0ix, allowing for
>>> preserving more power even when device is still considered active (D0).
>>> When entered, certain domains which are not being currently used become
>>> power gated. Entering and leaving D0ix is a complex process and differs
>>> between firmware generations.
>>>
>>> Conditions that disallow D0i3 and require immediate D0i0 transition
>>> include but may not be limited to: IPC traffic, firmware tracing and
>>> SRAM I/O. To make D0ix toggling sane, delay D0i3 transition and refresh
>>> the timer each time an IPC is requrested.
>>
>> typo: requested.
> 
> Ack.
> 
>> I find it odd to list all kinds of criteria but only handle one in the 
>> end. Do the other matter, is this a TODO, unclear what you are trying 
>> to say.
> 
> 
> Good question. Firmware tracing code is part of debugfs.c file which has 
> not yet been shared. But all other usages, not listed here, come down to 
> invoking enable_d0ix() or disable_d0ix() whenever given operation blocks 
> DSP from transitioning to D0iX.
> 
> Other usages such as directly accessing SRAM (outside of IPC handling) 
> is non-existant in the avs-driver. When IPCs, most firmware generations 
> take care of toggling d0ix for you.


Sorry for the million typos.

In the last one what I meant is: directly accessing SRAM is a separate 
case, that is, when done outside of IPC protocol. We do not do that in 
the avs-driver. Why IPC protocol is 'so special'? Most firmware 
generations take care of toggling D0iX for the software so there is no 
need to disable the transition, read the reply from SRAM, do anything 
else necessary and re-enable it. Note: it's not true for all the 
generations :)

Regardless of the firmware generation used, software should be smart 
about choosing the right time for the transition. If we were to 
transition blindly after every single IPC, DSP would probably end up 
consuming more power than if no D0iX request were ever sent.

Regards,
Czarek
