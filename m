Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6405A1712
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 18:45:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C5CA850;
	Thu, 25 Aug 2022 18:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C5CA850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661445938;
	bh=ABCjcfaFvFvK7ctqEU33w7rfNNEuX3Nj7DkU1vD8W0o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=alxxqFk7ZRFXk9pryU0frAnmvBGVA6mKPupquUoJxfeSFd4Xobxg4vuzaY0Q5cgXh
	 jnaukX4d8gsC4anWQoG71665qduHHHoAHRWORRmMwKGVdmHNTpj6hm2s9j7s40f774
	 tgXw8F4zrUEYWeyQwaHTRKAWofkKrOxyg0VbeLMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE464F80271;
	Thu, 25 Aug 2022 18:44:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAE65F8025A; Thu, 25 Aug 2022 18:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F2CF800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 18:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F2CF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qz7NyYNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661445874; x=1692981874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ABCjcfaFvFvK7ctqEU33w7rfNNEuX3Nj7DkU1vD8W0o=;
 b=Qz7NyYNuixTFdPIdYl5gZwZyDhZPaVJ6YomRhy1H2kDp4shX8xvgAXTN
 S6hlN/632L4FZhiDBobBwnpHQ9N3E+F21zx/Pp7i+CUmsO/345Y5zVZnm
 OL8jxPsF/fzPa85Tnl70zNH1KuRUhi1voMKSICKWHPZIV8lNAjc9GYymM
 B9NQAcDOTpQze+P0aq9V3WhMVhqebf/4tGde45R9dYInytN6XJXUzlX1l
 CfxfDcVZXesj/rN5jwrM3/bQQQpbEOUll0fLb3UGeLmX5HkPS2nKsccGF
 XaCLohliPLc+4fpQy5NNAIXr/jMatVCL/TzfLI+2Hg/Sd9hYVQ5DIKUUY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295076557"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="295076557"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 09:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="610237709"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 25 Aug 2022 09:44:30 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 09:44:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 09:44:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 09:44:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 09:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ma6sOYakm/u05zUeacWP8VgqDw/o3/0LjxwRXmEb81MqoYIcjKTyPs+/m2qGQGj4amCfmMzt3pbC2eXGZcnd+/X71usappaRTkdxGOwQzMGCVdEegMQeNni2Vk2l3/tRRjuq5Tr27hB4RSBy/Ny6Vkz4b3XrE9Y+lFIF1mI+T5za9jHzm2a9vMpqJbzHHebyk97/kpUrAEV+erd3znmfGXWKtcyUbdrF/LY4+6vVusaIkoTuBzKcOoMsURXkqdzrpAU6zSToLD8RiKUbWo3PMOcXjh5qHCZkFaKGt8TO0rWHDvB5MbmkCzRLYkXc2E4lW40o79RDBWweyGJoZq0dgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUqVa8+OwcvO4bMxO/k6XHgcw4yK4FrQ4I0KXB/ZaKI=;
 b=BxpS7AG9R4kjty7mDbAA/op90MIV5Ai71a6ldEwVrUktROAYydEHbitf+olu+aZvMJKMPP091LA2qoDKzj7egLKtDlMU3t5QWs6eaQSWZ41brhNTmAMtnyYWadAmWwRMpn5w7ldxxRGCsNa+aAq6MgLVsI843LTjg0rIUP28JfZ+d+HCbZ1E0UsFPoU9G+unpD/OhyzG1B5z/NSgmFEQiSB9288e1vKdLNinLKP9tYHupqUsqCrMbHjiNDHerlRfWdENNRqNmRM2ybHq/Ram0K77Tl1dFOSqyBYhz4n6s2QTtElGLdb4zDYTaZigCH20NCHpMlLJaCZaE5ZXXOwn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN9PR11MB5499.namprd11.prod.outlook.com (2603:10b6:408:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 16:44:28 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02%7]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 16:44:27 +0000
Message-ID: <f009312f-0cb8-daed-aa2b-21e8c07da4c3@intel.com>
Date: Thu, 25 Aug 2022 18:44:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
 <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
 <CAHp75VfvN-iJTpgg6JeKhOqJLhtYSieo7d7SOCBoUu-81FtSqg@mail.gmail.com>
 <c19ed4a6-6a96-b4a4-0f5a-7ca1dba925d1@intel.com>
 <YsnoH64cKCT7gndw@smile.fi.intel.com>
 <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
 <Ys2EFtNVL8ZALQ5Q@smile.fi.intel.com>
 <acbaf339-2fd9-5b19-06e8-62e66c324dc6@intel.com>
 <CAHp75VcVEEUYf2YZLVMby_v4fNpA0upAB+YkWwrPxqV9R+-YZQ@mail.gmail.com>
 <3f9402d1-6dc8-5f64-dfce-3fb895b80bc1@intel.com>
 <YweQnDv6h1jlSW4I@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YweQnDv6h1jlSW4I@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0038.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::23) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7556ad7f-87af-4d29-d928-08da86b91305
X-MS-TrafficTypeDiagnostic: BN9PR11MB5499:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PddMec1vhMG5jhNWN5/bBm3o0I0hdaHBD+/OL+KenDhTzguG6xgduwWGoOLKk3nKMQpGm19pwnJy0Gox3d5mLxnnztkxq7+HrXPWN0Orb8HJEUTHGWhG8rl8Nyw62weOV6WkYp2vLMWTNvSGJXL+rHqLRWs1DHIau7ewfff5uYtxtiJ7UkvRfY4iQf46Z/wGdzVSFa/utm8VViU5nWuVk7cVcBK8SHYuFSo3bgl3+i2BHzxKUhu7ERB3nAQ1iBwT/dYZ36/J15tRtPMiNbAk26AtaMVrS6gPzfJ/R/X0JRp7dD0x9BwJM7+cTz7aUamPAHNjpLVk/CjS80iwmvwIhHDW40k8G7AOlKQLJV3gHlyJWSrI0KrdRnrlUMrJm/Ot7z+JRgba7mlxIAShTPKgaWY8LxFDp99Io5IGSQuOdBx3FSewQE9/Ch8uCk3FjCx9YQwd3QDgufx70Y+Ddb3WLlTGcYTlA/H9kHJ3DltD1oS+4I+61RC4Fz7O3mM7siCONsHwq9Vqx6GXYtaLX8m34hg1iYFxWRmfsD/Vi0kT4glXbJL/T38R3i8NgHm+SVWDwdolFDwTdK+Rb0VH9f4kWyT6Gs7+HTWxIKCIT9iNalCV/3Ie9rm/YB4mEwj+ds51SyDlW636FGiKN3LGrnfVq7ve8XIP5mTq3oopKG+8ROz5BwOf8Sd86zJuB7GfJA31BcS8H1/zbUjlqkDv/fc6b5/xovXyTTsv3Aw14f5mVHIFZiBl4qIvJfhhWMcuC9x8r9V+ASDQIVc/6aPw1itUOblkuTsLpBK4x3Fp1ESnGa4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(346002)(136003)(39860400002)(5660300002)(4744005)(6666004)(6506007)(41300700001)(7416002)(66476007)(44832011)(66556008)(4326008)(8676002)(66946007)(6486002)(478600001)(8936002)(53546011)(31696002)(86362001)(186003)(26005)(6512007)(82960400001)(2906002)(38100700002)(2616005)(316002)(31686004)(36756003)(54906003)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU5tdGFyMzBncmJ1ZDZrZG5qKzJkaWlpK041REpxZHhYUmhQMk51WlJUSlVt?=
 =?utf-8?B?a2FaeVQ1T1A4RU9hRW5YamdyMUFldHMyK2xTVHI1dHpRVzB4OTg4TzJFQWw3?=
 =?utf-8?B?YmdRalZXdjAxZnVVWmtOT3MvQThIaEQyZnVlY2kwOGZBL2haN1d5Uk51b2Jq?=
 =?utf-8?B?VEFCeDc3elE5N04wZUVpQmRuM1poV2YvYU82aEhad2R0eEUrWVk5Slp1dnJV?=
 =?utf-8?B?OUtCazBxUitDU3BwV2RJRHUvTkF2M2EwVDE2RU5MdENSd2d5SHFNT2ZpRkdE?=
 =?utf-8?B?NDdoeUFNakx6YmQ5bG5vUDY2MjBONWhGQjFsSldYeVJkSnZlN21NYlJIRENU?=
 =?utf-8?B?MWp6dFluZ2d5ZTVyM3FhNjNLMWdhSWdibU9xK0xzMmFaN2hJbWR5bTZ2M04x?=
 =?utf-8?B?OEg0NDVkcjJmcGhNU1pSMDhleGowYmFreHI4Z3NRSS80dTQ2NFYyVThKRFVH?=
 =?utf-8?B?TUVnNnl1MmVZZFlVa3A4RjIxQVhublUrZ0lSbFgybnpHVEpBb2J3QjUvTzJU?=
 =?utf-8?B?NTYxL2thdi9JSnNxcE9ubXZ4LzhySW9ua2RkTUd1cVpWbDFuNGVnOHczVWdn?=
 =?utf-8?B?UFoyb1RmdWJxNWZSNWRyeGVpTkplNGpjQ3ZDYXpBTS9rZ014bnZZajZWNTV0?=
 =?utf-8?B?RnFZV2UwdFZhVlYrR0JLQmo2YVQ0aloxVlVsemZLK00zNzJ1azc2Z0plYkV0?=
 =?utf-8?B?NnUyNjRabld6Y0ZSV1NEd0c5UTZVdkNoYXVkNE01MDhUNXBLKzNjNk01bko3?=
 =?utf-8?B?TWpSRGF3Si9IeUFYd1pBMzZjYTVPakJ1Qmc4UjArbkpEYXgzUWJEYWJ1RGVr?=
 =?utf-8?B?c25lMC8vaDN6OTBQdFpyQVZYcDNOTlhqdDJKcjdZUlNSNkF5VVRKeG4vSWcr?=
 =?utf-8?B?bXVyclRtb29pRVZOSzh2cWNKamJub3hvOEE0RktuK3FYNUhET1RSQ3ZmZlh1?=
 =?utf-8?B?azY5dzNnQUhZUmd1dHd1aWNOOSsrNmNOWlBRdy9YNG13a1RMeml1dGNLTWdN?=
 =?utf-8?B?Sk1uN3BzYTFyWkpsMi9XSTBWZ2FoT2xpZTdDQ0lCaFdhVlgzUjFJOEw2ZDdz?=
 =?utf-8?B?TC8xV1JCTDhNWGpTY1UyYnp6Mko3aEFFMTAwdXFad2xSeWpjUDd0Zk9hbnNR?=
 =?utf-8?B?ai9EVEdWS1lZb0hwSW1ER1pKSFpYWjR4VmdFV0J3REpXaHowZGgxdnQ4b0tW?=
 =?utf-8?B?bFQzUXBkSGNBUFQyeGdWb3EremluUm15SDd4dHRnNnM3cmVqMUsrclJOMkYy?=
 =?utf-8?B?UjJOaG1rZW9ka25FY1hMU1lqREU1TTgvRmVSTDVRTVhhZExndXB1YUdVTlYx?=
 =?utf-8?B?bVVZbnFud0Z0QmU0bzVkc1BEZFZiZHh1SFFheUk5TnJmRk9zdW1rMFJNWTFj?=
 =?utf-8?B?WjFEMDNrU1pQQTJDNTh2ZVU3cnVodGkrRTdVQTk3dXltQ0cyRkdpS1p3WmEz?=
 =?utf-8?B?U0s3R0VpTGJ3MnpUOWFZZEhxbzIzR2haZjNIQnZ6OHhOOHkrRzJhZ0FoN1Nu?=
 =?utf-8?B?Nk1qT3pJdHN2K3lUSFR6NEk4Q2lYL1lDaWdsT0dqVGd6dVFFdVNhTGF4SW13?=
 =?utf-8?B?OW1QSkllV25lc1lzWmt3eTh4YUlpUit4azUxZzh6UGIzQjZ2alBYdHRkR2tj?=
 =?utf-8?B?TVMvQmcyRUFtV3NqQzJPZGlsSHdsS1BXQ3hDczB5eDcrcW5JQ2VMYko5TmZv?=
 =?utf-8?B?dEVSV3kweitwWktqRmFFaXBjakZBSlFFWkRJSW5TelZTUm5tdnNCWU54Z05C?=
 =?utf-8?B?cFNhZEc2VkJ6KzFzbWQrQzd1ZXRLKzdRMHlNTEFZeFJYYnJwSE5FcHR0L28v?=
 =?utf-8?B?WWk5VUN4MU5wWEdzUUlqdWhpWlhIUWZUQjZsVUpKZ2VURmtjMU9xM3FPdEto?=
 =?utf-8?B?WGRJRFZnbTlXM2k3V1pybGJzRmp5elJxUHJTOEdxK3ZxaTVtdVMwN3JUczVN?=
 =?utf-8?B?WE5SYjZ1bmNZaXVyOHY1bzJSbFJmUHZOT01DSk5hSXZBQW1yaVpqaDY1SHV6?=
 =?utf-8?B?ZXRYblJWSExkSlBqVm5KVHl0N05RMFg4NkYrWE5BV0J2cjQ1cHd6S29JMS9l?=
 =?utf-8?B?TFJ1RGVxUHowNG4wTkZkV1JBMmR6SmtZTDZEeVdHY25vbXBaTkhGVFZhRElI?=
 =?utf-8?B?bGNCVFlRWmNaNzd4ZUNIWkY4UXU2c2MwMjV0M2xxQU15SUQxTE5jNW5LbHRt?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7556ad7f-87af-4d29-d928-08da86b91305
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 16:44:27.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZoH6HgOEyuvlLBv98NtfEqQO5K0CrN5hF2F8VcKmcNPxla91Elt/rSXp92ZHZvGrIQVPvxFTQyCFNoT6PVRy3n6D2FzrQrn8A5iyRfWh4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5499
X-OriginatorOrg: intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, ALSA
 Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 2022-08-25 5:09 PM, Andy Shevchenko wrote:
> On Tue, Aug 16, 2022 at 11:28:46AM +0200, Cezary Rojewski wrote:
>> On 2022-08-09 5:23 PM, Andy Shevchenko wrote:

...

> Suggested-by would be enough.
> 
>> By the way, I've provided 'the final form' on thesofproject/linux as PR [1]
>> to see if no regression is caused in basic scenarios.
> 
> When you will be ready, send it for upstream review. It would be easier for
> the kernel community to look at and comment on.

On its way. Was awaiting your replay so I do not need to send the series 
twice : ) The PR was there to check if there is no regression on SOF 
side, at least on a BAT (Basic Acceptable Tests) level.


Regards,
Czarek
