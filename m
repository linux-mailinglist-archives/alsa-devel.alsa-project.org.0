Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC3C4D1E0D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4121817C5;
	Tue,  8 Mar 2022 18:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4121817C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758907;
	bh=xzI6ZFAnrdLgcSVuN4nsoEhx7xaE5Ej76rbe0qPCWBQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUNQPFoZ1UQ8PAzbP4mVQk20ROZKwinFw5ir7CJBFP6pcl6KmEmUUriUOATowmp1E
	 GHoh3APGobCwvoIY+UwJzEglzqMkmRdinrwAyFvhc7CpcwxffJWIC5DjXJ6QaxLLu1
	 Je8SU/fVi8pAdxdu5z3pNhLrH/IrNsH2y5VP7uU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6639F800D2;
	Tue,  8 Mar 2022 18:00:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8CE7F8026A; Tue,  8 Mar 2022 18:00:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D259F800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D259F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EO+Ric2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646758836; x=1678294836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xzI6ZFAnrdLgcSVuN4nsoEhx7xaE5Ej76rbe0qPCWBQ=;
 b=EO+Ric2zGemIVpBY4oD4kPGofEoxGoF/vR3APqcILBZhU2ecTvoi0Mup
 Ja/yj1AbYr8/LnHjuhcMN94CQ/WQyLrDP263VIsEHfSshn1NKL7oq4f/D
 7FhfKJvYieTkjE7Y+vQYtrke4Q2Be7eH/aFBeZcI8tWi3Hn/nJ5f9N/YG
 BL1NqWQSSFuGz0X9KQdpUAfnXKiN73JQOrLCspX9v8pBYUV6YXR0mDZTH
 W96ZiAS/yPG8EEpZ83Xwnj+NoQ7+G+zQrc41QcBfXiKfc56CQT1t4jKiE
 Z1m/LCNKqrgJ35JTB77bkKfdyfY8tNC3XVozHw5m2bI//FMZ63xPgJ01v g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254930773"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254930773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537637768"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2022 08:58:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 08:58:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 08:58:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 08:58:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq/GtrvDKNzJ9ELU9yDBp1vjclU8cAQyBHiDCQ/25D4xYnKW+b0KBmVdSI5r0eixD9aHCLJRtItD6NbEkhse/t7uwD2Yo6E7mCC9qsOSiNxlMjXE1QEwyOPtSz5Eh5JrnvNFfVDHss488FSTNAPdgSM6MS1t0Cpri8ToAj0sLXhZogk25Z6M8LKyXcR5PBQNvmL3khKf3KDbZgHmnafrU68N9bGHDFN0OVFD4mS9JJTOyIQnfSRP9Jm6Bx8olEowOjYwNbt3BggeLwjEgxL/Mbnyl0H1GdKLprJMUilCflZTegxlHubq95hFjmVxswRuPA7ra2N5Y3sAMmiZjrh+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKiED2KxlZdK15pmPBHdJb1Y8acelaXEL+NqrbN0HRg=;
 b=DZy3qfXuZJQ1bm7H3dID4C4O4Lm2LlyNbn6cJAGPkbjZ8lfxKEL0wsToX20UkhzqGr6g7UtPakc82zvqXEtwkGBbgObimmYi0t1P4rhH7MfsaCvLEh+IwBfcGmc89Mt46trTXlQseiu6x6wzuQ09kcVUbCHyuEAifQTPk2U9L6iSZzPmVgADs7iVLbOe9QeVXo2bkN1M7Q5CzoM63bcVoJN2vkbKyd4VqCDO6WylIPiMpOOGbdIIOUOIvqrJ+SDLs5cFAVgVvX0gNt0WtCNo/qigLZApbck0arYb+SGlrnmiJdMCiQW0xiQadqdL5zEHGv3HPTunic2OsbhjRL01MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN7PR11MB2690.namprd11.prod.outlook.com
 (2603:10b6:406:ab::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 16:58:07 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:58:07 +0000
Message-ID: <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
Date: Tue, 8 Mar 2022 17:57:59 +0100
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
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <9f4cbf5a720aa66d6a540092187ad88b3adb5525.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0053.eurprd06.prod.outlook.com
 (2603:10a6:10:120::27) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ade1029-71d5-4b35-2d00-08da0124d1a6
X-MS-TrafficTypeDiagnostic: BN7PR11MB2690:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB269014483BA04DA6E25C1FCCE3099@BN7PR11MB2690.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Zp6+8m2Pgfo2Gx70xveiS4u4QE6Iux6pCNL7WUfV6C5chevHMtxKMntqGgxBTiXJtivhdFsU5CRly4SL2qr0uYkILqWYfa5uWHHIBv2NCMlfRvp1nyQqpkR9YsCnUxu+oPbraJZIJQydkBgIJS7dZ0IVuRv0WSc0No10MLL7QjgErMbYXBZzB5ebtdA/kjEKns9JZmeETxarIgwVfV5jx2g94E6NLhUoWajVg83zkf/g4h/tV7Al58HT07oLhxkqBopZtCsdzZ3b5cwH5hAWXIeYA/x1KqwCnrH/syr1hject2NqYmu4elYvVCou7b0WnuPpELKrW3208zTMM67tIvvMguu7vgMwlLLs5TlTWBmy0ylUriXCGXV3tWMzfOL9n6KzmuOTX3rV9/rFubyRsWEKPQcsOCcTcYQLwLWWrIegTxjnQwJeZxLbV+TiyeSgkU5dEscalGIXBQ0b7eg5VchPII0oM3SsUgCuBK0xEywSBxbOJmI2lJD8RHQ0s8zxYlpaKq8nJ7LrYLHQ/cSyhkHYqIHoF34/VxUbE1eBq2yx3MHycs9Px3u2Xt26oYlhA7UT5MbhanrTE6FTTdUsuuQf9YKhJftHFQpmn5olIZUX8C4jqiUllwHsMdQ+2U/IBR1Sq1ve8VC5czQm6X6+8+Rq/PtQ4dEXDqb3GLrmNQ/c5lwDRLL9qfiKfteVaj4vGbAVSUKIkgrYJRrNwDCqbJpp3J4S5HJvDo/aH1tOCs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6486002)(508600001)(31696002)(186003)(26005)(83380400001)(2616005)(6506007)(53546011)(82960400001)(6512007)(6666004)(2906002)(5660300002)(4326008)(44832011)(8676002)(66476007)(66556008)(66946007)(38100700002)(7416002)(316002)(31686004)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdvZFNGM1MzWEFPZkpEMDI3T05Ra1Q4ZTVoaDN6UGJMRFFpR1Y3UXkxcEd3?=
 =?utf-8?B?N1g1R213NGxIblNBVnVQMzZRS1VleXZCS3dWeTZyTXFHSjdGanU5M1Q3Yzlp?=
 =?utf-8?B?NGhpdFVBQ3N6YmlzY3pzQU5nNGpGNEJ0L0tTbG8vZWp3dS92Sm9PMjF4MGpR?=
 =?utf-8?B?VUhmZEZBTktWckF1aG4wVmsrLzlnM0FwdEIySlVvQnE1L0RmTnBMeEc0ZjdK?=
 =?utf-8?B?SEppbEZQZFN2ZUp3VzI3M3VvS3FhMDFtZE5uREZNYzdyL253ck5ibWoxTCtt?=
 =?utf-8?B?YTliY29Nand4M2NxRlNMUmg3SFRBZU1nT3FaWXVEZytwQzYrVVFPQ1Rtc3JK?=
 =?utf-8?B?UzdOZm9kRHdHYkc0VFJLNWx6cW1MNHZXS1c4QWVadkZoeHA1L3hXWDFWMHZD?=
 =?utf-8?B?VWFjbjdTaWx0SE82aXdQOG0zMTdaMGdUNEFvS2lCQjNlcHVUTmFUU1pzU2xD?=
 =?utf-8?B?ZUp3OUxNeExUOVYvc2lUOU5CYk9pZzk2bHFnZ0FVd3drSWU2QUU1ZUNXVFRS?=
 =?utf-8?B?YWcyY3VRMU9ZczRPN0p6eDhmblV1ZmxKSWlCMVFkeFQ0YXh5ZW5XMDRJVWR6?=
 =?utf-8?B?NVo1TWp0MzMyNG55VGVBbGlzNzBHcmFVV3doSlVuc2JTTW5KOUN5YjR6bDEz?=
 =?utf-8?B?a1pJeWtzVzVXOC9vdW40bnBsemRqbis2bVN5QzAwVzNCcEtNNWtsZzJ3Q09r?=
 =?utf-8?B?bGo4V3NMcSsvK0Z5bEJOam5HeUpJMU1pRklEbmxzcVdlcUVBZlYrWExFRXB2?=
 =?utf-8?B?UERIemQwcGVhYTlycVZMeHlpMXJiQzJtcWNvWWVhSTBJQWpBMTh0a3dHSjRv?=
 =?utf-8?B?bzhNWkM3R2dZUjFyUjdBNjkvc1IwOXFMUlFqRWR4MTZrRlY5bGJrTzRoNkt3?=
 =?utf-8?B?WEVHaGdWVE5vM2FJYXB6anQ0YmZ3TFByNm5IQ0ZPNDhqRWVMNHZwQkx5YWJo?=
 =?utf-8?B?MzhUb3JsdzVPYndzL3BRT3g5S2kvV0Q1REd4ZFpqSzlsajd2ejdJNHRqR1JW?=
 =?utf-8?B?ODdIZmR1Y3h5cVdYSU1sR3FHU0V1cDNCVUttR1BnUVRodUUyc2Qwc1Z1VGl6?=
 =?utf-8?B?aHBRSDZ0V2RkRCtBdVJ3QVlZZG91S0VmTldVWndWMTRVZFZKSjlmbmp4V0h2?=
 =?utf-8?B?ajJHbytNTFduTW5IY0h6c2xZVEQvNVR6WmtsNFNyRnF2MXd1aHUyRW1lN2Jt?=
 =?utf-8?B?TnBYaE5WSGtCN1VIdHRjRkxna2xDbThxNFBOYW0vL3JwM2dJT01JWVVHcXYr?=
 =?utf-8?B?SGp3WENORUhwQzYxV1Rnb1hOcVVpSDNybHhUNHM4U1J6L2tvUjk3b1VuTlJX?=
 =?utf-8?B?amxoKzNaOHdiY29IWEhQVkJWRktsUExIVDUyOTRnTVhRN2tMUE9YNXRSZUFU?=
 =?utf-8?B?b25Pckx4R04ydVk3RTlxajV4Q25UQklvbFpUOTNialYzUXl6V1VUMURGZml4?=
 =?utf-8?B?ZEpvY0V2UFNNQ1cwYXFtSit0Vm5sMnpEK0NKVnFOcDZQNFRBcDJaNUh1R3pi?=
 =?utf-8?B?ZXNxZEhJNG5EcVBKVStDVzA5R05sK0ZtS0ZseXVXOHpXMzVPVTFWTkpoMSsr?=
 =?utf-8?B?QnlVaFo2QmZKb0ZRWDFGNnQwZFIyMnhHYlkva0hybHF3VUVqaGQ4d3JPcmRT?=
 =?utf-8?B?ZUUyZXdFL2pkUHlqajVpK3FVbkl5OTI2ZXIrVlVYang3ZFA4c1hNVnZ0QkNw?=
 =?utf-8?B?NFRKdVdIS0sySGoxZ1FpMXNraklMWTQ5Z0tlUmVUUW5xbnRuVHVyK20yRDJr?=
 =?utf-8?B?OXhoVzZDTDRTeWFjbjZnTUY4aW5ibXJQaTMvbkswTUtsbHlNb2ZzSm9uT0ln?=
 =?utf-8?B?cGxZZjlWcjZCMTFieGhVcHp3Z3NLNG1SV2Nab3BNVnVIS1MzSnZCRDhuZDc4?=
 =?utf-8?B?Rk14S0lmZWNZNGZGckRKQS9GMlE2Z0VlM3dyV29hcmRoK3BKWVJ2QkU1T21D?=
 =?utf-8?B?a0JWTFZJRWhvNitGbUlWTURCRityWnZwaU1za1VyMytESC9laVJQY1BuODZ2?=
 =?utf-8?B?WjVQaTRjS21VQ2gyTDZ1Vkx2eWlQOUVIWVh6MXI3VHowazdKVFNwRHFjbW4v?=
 =?utf-8?B?Z0EveUl1akI0bkhjc2o3REZScHgraGJXbFFUQzhJWk5kMG5sSjFnbmdCVVk2?=
 =?utf-8?B?Q2xpalgwdkVCdkRqMmZpb0JEUWR5YWw2bFlORjJVMVdLS1Rma3JDcXA1S3Jn?=
 =?utf-8?B?eXNCd1ErbDc2c2xIWC9rczU4YVE0VlMzTDdZN3dOUzBtaUdIbUQ1bVJjU0dl?=
 =?utf-8?B?emZnSmhwYVlLU1V5Q2VIYXUraXFBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ade1029-71d5-4b35-2d00-08da0124d1a6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:58:07.6781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cI5ttMC6kiQuKKHsZCSm4lIaDM7RR4SLW2Hsxk3kkd1deMT3FGOAR/7LO1lVYAiagJ166nGGpXpTQcPzZo3vEtHGxVufmT4LwOWtGTpRXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2690
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

On 2022-03-07 6:30 PM, Ranjani Sridharan wrote:
> On Mon, 2022-03-07 at 18:13 +0100, Cezary Rojewski wrote:
>>> This is the part that's hard to follow without seeing the actual
>>> code
>>> where this new library is loaded. When does a libray get loaded?
>>> When
>>> you start streaming and you realize that the stream requires a
>>> module
>>> that is not built into the base FW? Can this be done during
>>> topology
>>> loading instead?
>>
>>
>> But that's already done during topology load! If there is no
>> topology
>>
>> telling the driver: "hey, load this lib for me!", nothing gets
>> loaded
>>
>> regardless of how your /lib/firmware looks like. Libraries get
>> loaded
>>
>> during soc-component's (platform component) ->probe(). This is place
>>
>> where snd_soc_tplg_component_load() is called.
>>
>>
>>
>> However, if platform has no IMR capability, driver has to re-load
>>
>> libraries for all platform components of bound sound cards on every
>>
>> pm_runtime_resume().
> 
> And if it done during pm_runtime_resume(), where would the problem with
> synchronizing arise from? userspace apps do not get resumed until after
> the PCI device is resumed isnt it?

Scenario you describe is correct and does not prompt the need for the mutex.

However, ->mods_info is accessed through getters found in utils.c (this 
very patch) during stream creation too. That fragment is part of path 
management series though - it was requested to split those bits away.

So, there is a possibility for a platform-soc-component to have its 
->probe() called - and thus triggering ->mods_info update - while a 
stream is being opened on a different sound card simultaneously. To 
avoid unwanted behavior e.g.: looping through ->mods_info while it's 
being updated in separate thread, we lock the array.


Regards,
Czarek
