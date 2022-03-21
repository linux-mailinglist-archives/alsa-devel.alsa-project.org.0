Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BE84E2EF4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 18:20:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBF31750;
	Mon, 21 Mar 2022 18:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBF31750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647883235;
	bh=sVexzbyTE72HPcnkQzuFCaksOOYVCR77R2IO/allzhU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FyEzd9KfN81lsy3vrKsBRXftmjNR8ncoOEmlB2EGrvvk8lFwXgfZX3oPg4TBJz6bk
	 k2hulvRqBl7hg8Uqo59rxYupbT5hQ5MvjRHZpZeW8fzY/Pj/1A6dX6If1Rze68KDus
	 4CnYZc6ykkY06IKD/QPiHumbAe9NAyUtCN4BMGX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75E38F80238;
	Mon, 21 Mar 2022 18:19:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22905F80227; Mon, 21 Mar 2022 18:19:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 773ACF800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 18:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 773ACF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PaxM6I+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647883162; x=1679419162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sVexzbyTE72HPcnkQzuFCaksOOYVCR77R2IO/allzhU=;
 b=PaxM6I+P60JPwbt7VsnlS/F8NshihDnmKkwS1E/JHHo5GCR8FNkPAl9v
 ojMcGE4PndsjkvPvanlolQQU6r90P1kpFtpWOGScoR4q/yMbLq2qE/ls0
 0SByHcbuEi3FJh6vREDjUSjLwczI1hkHlvLTHciLVLOqTEl/yK1D59gDn
 iyl17xQ2gNcYiGKU3k1Mu57TOcq8LRPRl3PpxBcwG6bFnUyVdTKRxO0Pb
 nNiTFCkCdkBJPZFPPfD0R3jq8cF+rIjNO4B0YhgVLK+Do+wBDZ0X8eoU7
 wSWAhJDIXD3i9Y2N9mJqpdja1EcBxR97PY3Mkb62wZzKyORslnr9xCFtU A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="318316668"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="318316668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="636719453"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2022 10:19:18 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 10:19:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 10:19:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 10:19:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 10:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR0bleBmjfWZN2cb2p3uVvyru0SgXv84PDmHMUQOY/oSJnn8y5yp+gvAdDmyj4GorJTpuu1yPgpi+OLNF3i6/OtN0N8UshfcpwYSpRTRZJRZYvrUt/5bGpI6HfR6m3Su4z4SAuZtm02CnGTIPWZaxBBG1Q9sosIjwaDvhvrUOgi5foPFzAChjC8s/pFUBlIdI+76hqausoMeNxoqXlVUkOHeKRzJotziSkGsfdryg1nW+JH4H+Q2doImqIafGV6YTuRG3ojWucZU4okjGzL4Qm5ecgHcEUnCQEbCN57WyfspxIHOyDM8oxlSV2DRX2Sn+lD2Q+f5jfNVooYo8QcOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9djjzrtv9SX4tGqVuBQ2yTSYFc+cwFi38dfXVAHxMU=;
 b=Q5BaUsm0IU4ofikWdFIKEfC0+NWYfOB43/HREl6O2LUjpw114/lJRYKf4cp8B8oCTguP49szHnnzkUemy5A4RSajzIaaIGVI9PwjxTid/ygOyh789WX8Wrs/ErckyrLfHl2LMRBojjuGOdKSMTKQYgHu2tVWh4fLwlZ+ElL66x3kzq915strLBaH0k1aCaT48GlApdOg+G4VZwJnHBrQFuufKm7/fnFvEQXtY6pRu02Na2EWxkHK5L47ug6yCgVPLfY6HOTr2a+lDfS/xTAG/6mAoOaNxa/w0/C1qxzK89pzyuOzBSulSmD9mPAh3SsNuuMJLsUsR+9JCWZdtokdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1722.namprd11.prod.outlook.com
 (2603:10b6:3:f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 17:19:15 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 17:19:15 +0000
Message-ID: <29745cc1-5824-6eb4-4806-1ae134f14b01@intel.com>
Date: Mon, 21 Mar 2022 18:19:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 09/13] ASoC: Intel: avs: Path creation and freeing
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-10-cezary.rojewski@intel.com>
 <2b6bc0f7-1e04-77b3-95d2-ff561b006ccb@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2b6bc0f7-1e04-77b3-95d2-ff561b006ccb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::15) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c3465a2-ba05-4128-a2a2-08da0b5eec71
X-MS-TrafficTypeDiagnostic: DM5PR11MB1722:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB17227AB49C6971382E5FC360E3169@DM5PR11MB1722.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kP2yL7/2Z0W68MzSWi18AFfgNEvTJhlT7kD6tqoOKllpAPKQy1B1o43LfN2C3bLDK88bFKrMxUif8l4dPlUO+OH69b7+r5ab7ux3xtH3YFa8bQNTPTuVzmFKjvuNSSlJGLCQRIfucZ++em8MgPF1F0Aq1R8AcuMfdeebucwYMSCIJF6hLOPh4Ae5eeIk+82YdpIy9/oBz37iYpdmLQ1wRBcZ7uKxUTuXhDRZvwBGQqeoK7enx01VTpawmGnJzRR9CvIWh7AFXo0UL6K+oDhT8G7w20bag5gbu1MT8dnH/66CyPdaufUtAt9acQpHvOsmUH+ttP5M+Of/mN992mSi3FB7QyfWeZSyH5sEdvxU/RXNNyd3suc0LOgDQ+dKE1awhp/g6EQ8pBoctdY6bVxDneEVc6fie1RM0jEpjXe/DASoe9ASBia3+tiEKH8SHpPwdeB+8jt9fLjbXVgUHLsm02VULTIHwM1+itvB1Dk5gLG6XHhI/lwbytrGn9MUg8FvgaZMkQAgPL6RUBoN18AYriuYPxCIe9cwbdwMXOW1nEH7NnNXJXs/1ob14XvWGu0Hg58+2+YvjhPFaU0CgX8tdSp3UNNzbIH39fYBMUQMFL8nVTzyWGnkg4WUvHQ1l9Uy1Tg0Y/E1pNKaB8Tm+H+CV39MvBUeilfTbDwas3kHscINEw+4+IxRQjdgEAJvJr89csK9KIxWRd+79JRVeGHA1LUehimHCIH6sFKd2bDUXlPnYouMMUBr0V6rgcUsdXfi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(38100700002)(66946007)(6512007)(6666004)(82960400001)(26005)(66556008)(316002)(4326008)(2616005)(2906002)(66476007)(31696002)(8676002)(86362001)(53546011)(186003)(44832011)(508600001)(8936002)(36756003)(7416002)(5660300002)(83380400001)(31686004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cldZcDcxTStWUXVYaFcxWW9PMHZUY0laT1A3c2tJZW9hZHdBN1hRNTZxQ0k4?=
 =?utf-8?B?emFEbDNwUlhKbzZWbVlzS2dHQ0ttZTBVUXhaUDJTWU13S0NBdzZyV01IcUV2?=
 =?utf-8?B?Z3ltSGJlY084cTM4U3dXdG5qL3pxbHZTSnhFQXF3MzhyZ3dSWFNESzE1b0N6?=
 =?utf-8?B?WmV5WFZ3bWx4UWlpeFp1emlzNnhXU0hEek9zaW5TOG1LbmxVcTlkVWNrdWhN?=
 =?utf-8?B?RHIvNGhxeUV0UVFRVC9rMlJUMU1ZSnNJT0laRHAzU2duSXJoSkdiZXYwTVdU?=
 =?utf-8?B?dzgraXZ2aEdKcHE5RFEyeHQ4SVNMWGRZaU9GWGtSS3ZJUGRNT05UcGZmeHRt?=
 =?utf-8?B?T1dkU1BobnFnUHlhWUpQQWQ0dFI4UFJHbFJOejJBeTBUSWZZRVRWQTNveGRQ?=
 =?utf-8?B?NTE2bms0SldwcEppYkdBV3F6MEVTbHc0UWNXVE9PeXNYZW4vam5XcHVMbjdk?=
 =?utf-8?B?Y2poZG83cFJOalE4ak1UUzFUU2lIN3phVlVCUXZ6Yi9OZHZlb0NoMkcvK1la?=
 =?utf-8?B?V0F2WjVjV3VITzczMTJaVHRMNnpERFRSSHgrQmwyckxHKzFWMWNmQ3A0VjdG?=
 =?utf-8?B?eEovRCt6N1JYS1dzVnlLYmwrT0hucUFINjhpNUJ0cWZ2b0ltY3ZXOGVZYjc3?=
 =?utf-8?B?NXJDakErZHRzbHAzUVk1MnBmVkZvaDU1SHZmYTJFT1hidVN6S2hvMmkxQkF0?=
 =?utf-8?B?SVVUbDh2KzZlU1dWN0tNOTRSbzV2WnJ0OG5oREZwYlhtN3F0bDNrRGF2dThw?=
 =?utf-8?B?WmxUT0ZsYUMxM1diSXZUeitQZ29NS0lKcG9Gc1FiZC84Si9IL1hUWUFhMFJL?=
 =?utf-8?B?NVQvMURqdHdpRG55ZmpBdWc1ajhyK2NQVlJrVE1IVkh4b0VRY3h3YVVOVU9m?=
 =?utf-8?B?ZjBSb0liWnc5NXc3VEZ3YldxV2FjZlJvZEovQmIxUEdvTGErVkM2NHI0Y0hV?=
 =?utf-8?B?QTJWQmtpVlJ0SUlXd09KRTNocU04Q1p5cWNibldXWGNJWjdRaEdxY21hakUw?=
 =?utf-8?B?QUxGMWE3ZG02U2h6ZFhKd3dvTUNHaTFrcWk0NElpeW9vYWw2UFZHeUJrRGs0?=
 =?utf-8?B?QnFtZUc4aDRnSkRRekhCejlUMmhnM212Z2psRUpZajRxVEE3cTdLT0F3Z3dJ?=
 =?utf-8?B?N0dyUW1SdUROUXQ2eEpmV01kY1hQd2Uza3R1dXkvRG9rcHF1RzRYWXpYdFVa?=
 =?utf-8?B?L0FhUUtJcVJOSm9oSCtDd0NGYm8vUG1tK0VJU3NCWnp5RmI0TmhMWVZia2gw?=
 =?utf-8?B?amU4OHhDbnpwT05MSlI1eTk1RjBHVWV3SDJOT3VJRGRsdFNRS3JjWHNFWEpX?=
 =?utf-8?B?Q0lzSDlBalZpOHJGUUJUcHVwY0tDSW1MRU81b1g1M1lpU0gwelJ1OXVSeUVF?=
 =?utf-8?B?SWlvdUQvaWhyakZrM2VQOGxjK0JaYVZkUHc5RkhwUnB3bHd0bFVhM3cxODFY?=
 =?utf-8?B?SmNCZ1ZTSXI3ZzMyZXdWWm12UDVKalBNaGozOXNncWhaWHo3VGRCaFoxZEM1?=
 =?utf-8?B?czhXOGRwSUpnSm5PenhnVXBHL1BXTFlOWUQ1ajZQT0diTjFWbXZ0L0J2VzhV?=
 =?utf-8?B?N0FsQUhFemZIWDZtdXVNemppTzFIVFlaNGdUWVMrYWRGMXNEa09RQ3pCNzJz?=
 =?utf-8?B?ZG1aaXJIMHFUZE9jSjFhNVl2YW9pR1QzUXhheERKVmY0QlR2ekxuS0YrTHdz?=
 =?utf-8?B?cjBmTkR3aXB6dExVK0cvZDVpYWszSVl6YkxGejUvNGkxSWlNdUtOUWJkT1Za?=
 =?utf-8?B?N2ZydEh5NnEzNGxBY2N4a2ZzYTJSREoxZGhFYmhNM0dQVjNicTNUVG9VSjdN?=
 =?utf-8?B?QU5mbHRQVnVUMVBZdi83VGg1eUJ2RUpFYjFud0dsSlgzZnhIM1NGV0hpV2ZY?=
 =?utf-8?B?K0RSK0NQZDNrUW1VZWE4U2NaNzF4Mnc1Q2o2STA5aXQ2RTlKaWRqektpMDFJ?=
 =?utf-8?B?dG1pdnlDZTZES0RBTDJPeW4xcnVaTFVvQU8yaG4yVHFRLzNyVjlGSmxrOFRa?=
 =?utf-8?B?S09FQnllSzRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3465a2-ba05-4128-a2a2-08da0b5eec71
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:19:15.0704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHgN2+UgJBLY7jydALqTs/8BZxxsKyyLi1CWUkggFTg0AdOtuR6IdyGvBCLsxVOwWhUoIT6xOWPuc5dv1ODJEz3iNzhHwSjAV6OeijTafr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1722
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-25 8:36 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> To implement ASoC PCM operations, DSP path handling is needed. With path
>> template concept present, information carried by topology file can be
>> converted into runtime path representation. Each may be composed of
>> several pipelines and each pipeline can contain a number of processing
> 
> it's not quite clear how you can have different pipelines with a single
> dma_is per path?

Pipelines do not need to have a module that is connected to a gateway.

Layout of a path is for architecture to decide i.e. one takes 
spreadsheet of all the scenarios to be supported and developers/archs 
discuss/decide what's the best and optimal way to shape the paths that 
implement all the possible scenarios.

>> modules inside. Number of templates and variants found within topology
>> may vastly outnumber the total amount of pipelines and modules supported
>> by AudioDSP firmware simultaneously (in runtime) so none of the IDs are
>> specified in the topology. These are assigned dynamically when needed
>> and account for limitations described by FIRMWARE_CONFIG and
>> HARDWARE_CONFIG basefw parameters.
> 
> It's already quite hard to create a topology using static IDs that will
> work, this dynamic creation adds an element of risk and validation,
> doesn't it?
> 
> Can you clarify how you validated this dynamic capability?

Static ID assignment i.e. taking IDs found in the topology file directly 
when instantiating pipelines/modules in runtime is asking for trouble. 
Firmware has its limitations in terms of number of pipelines/modules 
supported simultaneously. Driver has to take these into account.

Here, we send an IPC to obtain all the limitations before any stream 
could be opened for streaming.

>> Paths are created on ->hw_params() and are freed on ->hw_free() ALSA PCM
>> operations. This choice is based on firmware expectations - need for
> 
> So a path seems to be completely tied to an FE then?
> 
> That would mean that a 'dai pipeline' with 'mixin-dai-copier' would not
> be managed by an avs-path, and would somehow need to be autonomously
> created?
> 
> You really need to clarify how basic topologies with
> mixers/demux/loopbacks are handled.

Path is either tied to a single FE or a BE. Don't understand what's 
difficult with handling mixin/copier pipeliens or loopback scenario 
here. We have all the tools necessary to do the job, no?

>> complete set of information when attempting to instantiate pipelines and
>> modules on AudioDSP side. With DMA and audio format provided, search
>> mechanism tests all path variants available in given path template until
>> a matching variant is found. Once found, information already available
>> is combined with all avs_tplg_* pieces pointed by matching path variant.
>> This finally allows to begin a cascade of IPCs which goes is to reserve
> 
> this sentence makes no sense.
> 
> did you mean 'which goals'?

Ack, thanks!

>> resources and prepare DSP for upcoming audio streaming.
> 
>> +static struct avs_tplg_path *
>> +avs_path_find_variant(struct avs_dev *adev,
>> +		      struct avs_tplg_path_template *template,
>> +		      struct snd_pcm_hw_params *fe_params,
>> +		      struct snd_pcm_hw_params *be_params)
>> +{
>> +	struct avs_tplg_path *variant;
>> +
>> +	list_for_each_entry(variant, &template->path_list, node) {
>> +		dev_dbg(adev->dev, "check FE rate %d chn %d vbd %d bd %d\n",
>> +			variant->fe_fmt->sampling_freq, variant->fe_fmt->num_channels,
>> +			variant->fe_fmt->valid_bit_depth, variant->fe_fmt->bit_depth);
>> +		dev_dbg(adev->dev, "check BE rate %d chn %d vbd %d bd %d\n",
>> +			variant->be_fmt->sampling_freq, variant->be_fmt->num_channels,
>> +			variant->be_fmt->valid_bit_depth, variant->be_fmt->bit_depth);
>> +
>> +		if (variant->fe_fmt && avs_test_hw_params(fe_params, variant->fe_fmt) &&
>> +		    variant->be_fmt && avs_test_hw_params(be_params, variant->be_fmt))
>> +			return variant;
>> +	}
> 
> This matching between FE and BE formats is the key problem with this
> patchset IMHO.
> 
> We need the ability to reconfigure the BE based on constraint matching,
> not exact match with a fixed value!

We need to take into account what's set on the codec side too, can't 
just ignore it. Topology is written for concrete configuration, so we 
can crease a file that supports all possible configurations exposed by 
given codec.

>> +
>> +	return NULL;
>> +}
>> +
>> +static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
>> +{
>> +	kfree(mod);
>> +}
>> +
>> +static struct avs_path_module *
>> +avs_path_module_create(struct avs_dev *adev,
>> +		       struct avs_path_pipeline *owner,
>> +		       struct avs_tplg_module *template)
> 
> so you have templates for paths AND modules?
> 
> Completely lost...
> 
> I'll skip the rest of this patch.

All the objects here have topology and runtime representation both. 
Again, you cannot just take what's within a static topology file that 
knows nothing about firmware limitations and expect success.

Don't understand what's surprising here. skylake-driver also has a 
separate representation for module within topology and a separate one 
for runtime. Nothing new here.


Regards,
Czarek
