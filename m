Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE734D1FB8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 19:09:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BE1216A4;
	Tue,  8 Mar 2022 19:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BE1216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646762964;
	bh=RYcr15wUcHD2Ki46S53AgHa2GNVUdTF7F3TGF0KN/co=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQlt/H7Ik16CO3cL1s1DglT01Io79qiuSx2fotirqYT3HKMK7isyfCN+6lyLdeM3J
	 wAULhm3UyQ/usiv9olEe4Fw8wk5KJSvEJCnYjrJb5tSjRpxvPC7k4UbQXTaU8JGm3o
	 Ph17MGxwrcWIumPKhdlxECkOOE77Odw6cPC/wIic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05EAAF800D1;
	Tue,  8 Mar 2022 19:08:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FA5FF8026A; Tue,  8 Mar 2022 19:08:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97D30F800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 19:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97D30F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OJK6GF0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646762894; x=1678298894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RYcr15wUcHD2Ki46S53AgHa2GNVUdTF7F3TGF0KN/co=;
 b=OJK6GF0UKl1JdOsfBDsjR+nQa4502J2yT0jQWh5FW+82yXwdejihFgaW
 P8wMbPqYC/MshRJ0u0RrS1tGBPjb0NslrC6A8rTEQXhkOt6dG03AjYX1J
 aMgEi2IA32B0W4S9AfzzxJ2tYxuXDmbUTkccaIA/q065w4RO/u2ElXNpX
 IgouqD6T4EDNEny4hgaHHnw8msBp9ibjq2DmFUNya/PEL8ufAz+uHitvU
 7dzdVJp4NTWxN7XrvKNscJcet0KRl2GUuKZ+tqstVO3qirxLwB6s+sl0X
 J+MbduF6QcYQdvT/ualdRZGOWF5A9697VXy0PUOXDhCK70FacrUAWEu9q Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254961702"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254961702"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 10:07:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="611093139"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2022 10:07:54 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 10:07:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 10:07:54 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 10:07:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmN+b/TFe0XIRsIHoIf1Ok9pTKwKV/Q/QDvI2zSD8bYEGRvmDMyqYLmTu3Q+3KGZxX8y/mP74sLQjYXfMaci5H0/VdgNCCgIyczcGVLdqBwVamPV+nPaY4WpFp8sJSNrvbOewQHiGpIKhm6NLBs7oouXEu70j7hNwChrGH7KCd19UKVc1Rfj4dXLz9MZaAjAl8jEdD3IrTWOOQvzFYRlKeP08HQOfzLc0OwwFVQ8qYGURQm24mFOnFoyS/L+bnQ+wdhSJGylt2kHinwSOW5rIz4dvOWKjfPt6bi79WngZHex3Lz97EgcDTKSAuFEL8WtzKa33osNb+Ji9LE2y3NjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35ECpkcfuCkvWayj4HFqOOEVoFpE6uQWg6bNLlDU47I=;
 b=Cvy4zKUadvA3frYVrHKX91T4vzvPTi2x22FR843zwD4AqZShrKts/aCKrYy5nT24mzUZPo5ylgWe4cQy8jZfDGjG0DflWgCC/mb5t+V/nl+de9hV4ZOeHSjUpPmR+v9KZliaQG/vASEypJhB8UFjPRPkoBVEP6goWrWM3i1iAXd4MC3vG4TULgRzeuOCAT9Q9Et7u02tTRPIwRmVfVps79C5pS3tUHgQdiHy4XHGj5gLHDGGXdlUDSUlXzS5rmV1vhirK64t0crggAS+crZXxVi91REIuGxx9Kb781dgHmGW2mhWj29KCkP3OAO5kpq1v59dXcqGCwU7Y9keP+CuVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB4562.namprd11.prod.outlook.com
 (2603:10b6:5:2a8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 18:07:52 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:07:51 +0000
Message-ID: <361901b8-f8a5-7b27-ee44-872c4e10bc2c@intel.com>
Date: Tue, 8 Mar 2022 19:07:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
 <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
 <f70be289-ee9c-51b5-4003-7bc567e87a54@intel.com>
 <9f4cbf5a720aa66d6a540092187ad88b3adb5525.camel@linux.intel.com>
 <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
 <3c79c158757bfd542747bcf7b4de73e4529ac4d5.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3c79c158757bfd542747bcf7b4de73e4529ac4d5.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fda5799-d519-451d-a5fe-08da012e8f74
X-MS-TrafficTypeDiagnostic: DM6PR11MB4562:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB4562780D62AD4CF92B8A97D2E3099@DM6PR11MB4562.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uX51c/uO9C2oJYZdFb8QIG7b+7EeI8hs+f/PpnjUBifhEmysF7tqjOFm0tmQX3D/lPsT363c9Q51c658d1b8hf9SeXLsA79xe5jsHo8CAAB9zeMEY3J1p00SrydDiLohuKd1ZdMUg6dUrggEjyD1tVRwcvCKR485RMiCV8BSMDrNUlvQhrSfcMBIbBVXPCyS7MCjDYmeBDQQDJvJ5Uq6hDkokAC9D5+/OF0HOpdqIh+vnnXxQahyAPrBM9ZtCvFO8Fx+1XvbVNXl61QqLkk9j5cw7wSaTyi/1SjW8ug0dt+I+fyG/7023cBvlXehE9mketqQCQ20sCZ3uguf6pF9jYuf8dXz4Ba4RIFwuG7dYWM3xTsjAkhQ86HkSqNtwY2q7oFeIWoSLfVr6EDqmf2Sxg1oVwI1dHdzcH/aTpRBtpB8kVsVS/ZdZtoTBrOg3jydAP8JD5uYOg5xbFG4U3KhJjNJFaa4MC68cLRPbpfYSDzMBfvhYOEUiCmF0U6au3wBK8G6tpM5NGottRpdiyDZM9UTqEyrJ+QeTu5XyAbmTMbRK+bmgS3wdtONFyaAPo8mwF/5C7zLhqAY79LyqFmRvgt+ALOKaiztHDuUxIx2Hxp6tCyzfV0SEboSUIZiGvfb1OES6laW1r+zk9WDmuHdHnJHKofC8t34dZqDY3VDEdyb+6oQ+W9VQNoEmiGjH07EebXIpBubrh/BjP/0olWuAO7//hKyD2AZxtMBQAURi2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6666004)(6512007)(6506007)(6486002)(26005)(186003)(36756003)(31686004)(83380400001)(53546011)(66946007)(38100700002)(8676002)(4326008)(66556008)(316002)(82960400001)(8936002)(7416002)(2616005)(2906002)(5660300002)(31696002)(86362001)(66476007)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJVWXBzV0dkOXV3Tm9ZVzFtNDVkQzVCeDJTNHpKVjNsYnQzZTVXWG9zRTMv?=
 =?utf-8?B?SjFoNUg4MHJHaGJCY2xSUkJDak8rYTZmQldjK1E0OGttNitTMmUrTkZ0TlZ5?=
 =?utf-8?B?NWFWNVVtSm4xcFZLZ09FYVdJVC9JWDJBM2MrV3ByNUluaEZBbCtGdXZCd1VR?=
 =?utf-8?B?RlJ2dkdTQkQ3ZURUVTFINVgzUXN0dHVYQ3hXUkxqenNYOUxjMlp6QlpPazNu?=
 =?utf-8?B?WHFJVTMzQWJOZXZUcVhzcGhtOVZTVTBqYUNSUG5SVjRUeUxDZ2F4YVFGTVZZ?=
 =?utf-8?B?SUN3ODRzWGhpL3pTNzRhVVVVRTVZTERWNjRVVXZ4MStKWFkyaG1jUVZ1YVpi?=
 =?utf-8?B?VDZ5cHhiZGN0YVg4M0ZiQ1d3UWYxdGVZVjJqa2NUN3lJdHFFazFrQTVXY0VY?=
 =?utf-8?B?VnlhVHBpUDRPbkJ2cEZNTEY2TFN2cHRVSWJFN0YrMUNscVIzQnpSdHlpRCtU?=
 =?utf-8?B?eEUyek5VdTJmRmhMV201SC9HUTM4bVNDVDNFdnlhU0xSNVc2NUdEMzRhUE5T?=
 =?utf-8?B?eG1DQ1daanROYkl3Ny9wOHhrTDBCa1RXU2tmSmJxdWlTVC9iZVErYUsyUTc1?=
 =?utf-8?B?Z2RkQjNKSExISitsVy9QTTNrVjZUbUc3alFFNFR5NElMRkZhYmFKdW40SFZQ?=
 =?utf-8?B?bWdUbExxd2NlOVFQQ0pCNlFYVmo3RGJ2RjNyU1Q2UVZCaFpEQzVKNEVYcmZw?=
 =?utf-8?B?bmFpaGR6djJKUVppcmxWMnRHQzJjeWczTkJsVHgvVDc4b1Y1QTREOUJ3bVor?=
 =?utf-8?B?bEh5clZvRlhEVXMrT3lRUTVVcU1qMTRBTU5RNG5BZlN0bjR5UnVIWnhuY3dU?=
 =?utf-8?B?b2ptWEpqM20xcm1EclYwTVBPdHRCcjV5SGVZU2lZVktSZXBVbDR6ZExuUjJU?=
 =?utf-8?B?L1dUcDdGb3NEVkNHWFpOQmxqUHltRHdRRmJ4RlJiWllYZG9YZnYxK0M1VGtN?=
 =?utf-8?B?N3pCTitVS2JCRVNQOUE0N0RZbWNwWkpVY0Rrd2lOa3lmU0dhMVAyc0dtZ3lR?=
 =?utf-8?B?dDNITzVlV2Q3VlRZTkpMM1VBZFpad0dkY1U4WkkydUtzdzhJY0FmYkszOHpr?=
 =?utf-8?B?UXVYM21uR0p5ZHl5MXZxbWhEdFJ1NDlVQVBWYjNlMGxibHQ5U1BHdmVGK3FI?=
 =?utf-8?B?OUdXVFFsb2E2ZVFIZDJ5aXlZOVRtNVVTWERQYUZlWllVcDR3WEs4OWxiRkpB?=
 =?utf-8?B?SGgxSzZvQVBEUzRRa1J5RDc5YllGQ1B1MHRkUmZnYmxJaXB6NzA2N1pUa0M3?=
 =?utf-8?B?TUVCUitocS8xZmpGYUZlUm5ManJodE1VN3pCeWJHS0dkck1meXdYOWdZSXZt?=
 =?utf-8?B?YTlON1FiQnR0dzI0b0NETVl5UzQwZFZpSk90WS82R3V6dEZ3QTRpYlVJdEE5?=
 =?utf-8?B?T0V6c3YrOEhvcDlNeWt4bitmZ204clVKeGgxV3cwTVhIRG05amh0Y2M4cC9F?=
 =?utf-8?B?RmdnTDNIaWNLNFIxdGhPRW9hYnJtZmJBbFB1RkJvOEdYYnpiODFuLy9QOStV?=
 =?utf-8?B?dEg3MmtrZVBUbWVKMDdzVk5WZEJMOVJ2M1V5U1o0Q2IvMzNKK2EramNvVzYx?=
 =?utf-8?B?VGg5V1lEUHBPQW4yVHBPUU5nbXE5ZXoyai8zTGF5bnd0Z0JRZzNCU0U3WnFT?=
 =?utf-8?B?OG1FamQxOWo5cEwyMjcvdDAxU2NNVW9hK1ozdXMzOFJvUXFyY0l6bktmdnZV?=
 =?utf-8?B?c2E3WFkxRHhGR2tPTFZOT0d1OUVEQVp2eVNTRDVHK29mR2V0Y1o2TW9LQ09x?=
 =?utf-8?B?dHkrT3l1OW5oSEEvY1JtWEhyTmw3bjNmdDQyVWtyQ3NMWDZSRURQYlJCc0Nv?=
 =?utf-8?B?VmRuVFBDMzU4TXJLV0dORmRNN283OTcvbzROejJSVER4NkZYQmVKWFlYeDJW?=
 =?utf-8?B?SUMyKzBVWU1WUDV0eVArUlcrL0JjNlhqY0YwbDAzclBqR0hKOGN1aDd2dzlC?=
 =?utf-8?B?a3ZRL2IySmx2Z3hVbGoyVkZXampVb0tvWENoQUJSVE5EWUtJSGo4OTBvYkdR?=
 =?utf-8?B?K2pqVlEzTlBqWGxTRTd4aG13N2xlZmpWVFFhdWxJWGFIU245RGZTUU12cU5o?=
 =?utf-8?B?RjdaZ1dHcXlURFNYUFJoRzFVcThuejVRb082Um1CU0o1N2NhcnB3SThxeGNk?=
 =?utf-8?B?ZUVtaGNxRUdmeXBlbG1KbExXU2MxcFYxMmtQUWVxSTU5VUROeUxwZ0JHN0tt?=
 =?utf-8?B?VEY2eGZQWmI1RUJwUnJNODZZeGN4V3ZKZnhxOWZ5UlVQQnYvbk91bEVLZy94?=
 =?utf-8?B?eFJNMkZ6SG9ZZXJJdldxQit6NjBBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fda5799-d519-451d-a5fe-08da012e8f74
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:07:51.7006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwCL67RfgPXY3YSEgIBuu9za/EqgF6eKhuO9bm626eS/neEeB4W4UmuU+qVjxI+AhOn2OLDWOqHKxsftnWOL2SrBCisGL+DHs3nOw6ClZ2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-08 6:22 PM, Ranjani Sridharan wrote:
> On Tue, 2022-03-08 at 17:57 +0100, Cezary Rojewski wrote:
>> Scenario you describe is correct and does not prompt the need for the
>> mutex.
>>
>>
>>
>> However, ->mods_info is accessed through getters found in utils.c
>> (this
>>
>> very patch) during stream creation too. That fragment is part of
>> path
>>
>> management series though - it was requested to split those bits away.
>>
>>
>>
>> So, there is a possibility for a platform-soc-component to have its
>>
>> ->probe() called - and thus triggering ->mods_info update - while a
>>
>> stream is being opened on a different sound card simultaneously. To
>>
>> avoid unwanted behavior e.g.: looping through ->mods_info while it's
>>
>> being updated in separate thread, we lock the array.
> 
> Keeping in mind that this driver is meant for older platforms, how
> likely are you to support multiple sound cards with those topologies?

Not sure what's the question here. Age of the platform has nothing to do 
with the subject. There is not a single DSP-capable platform that Intel 
has shipped that would not contain more one audio device onboard. At 
least I'm not aware of any.


Regards,
Czarek
