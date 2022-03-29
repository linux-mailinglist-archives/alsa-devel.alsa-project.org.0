Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043DE4EA965
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 10:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC9BB181D;
	Tue, 29 Mar 2022 10:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC9BB181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648542828;
	bh=g8PYFw8xwfuSehFma/dao781CBThrUj1EH4ZJLxTLJg=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OT0LpvK2kqJRFblo0SXpuNvmGUTBQbwzH2zvVHWWMIofRPlB4I9tnMrt2yYD6tHDN
	 vzcVSfQElAo7iZVDhWhfiY4uIXeQZX6BRjfrtmSueNScD/mf6BS4VF0XQce22O59cq
	 5s/n45jU5RnVX7yJcqSXVrUmgZf/MQQyc1T+HCoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80522F8014E;
	Tue, 29 Mar 2022 10:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70C5DF80311; Tue, 29 Mar 2022 10:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::60c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B740F80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 10:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B740F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="RgN4ikzq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPEp+T77rw8RSiCyVv1Oh4/wo04WDsMticIaxNopWf0/2D+6vk1KcM8uSd0VwrDdkdyZvRzfBddlmhB+AI0MVjW+IY+0qK5yd6yCSfTLSc0IrRo8NYzltwH7gngnFOouONN2hcGOnSwLA5IYhK4Nw19/r7GRr5yK7vtOcF5WfNSP840d+siRXxnyRE1qvteVeYom4w7UwdVjiNhxOm53yxZO+yF6wy0heYs5lV8bXlT91nv2CXODqMckM9OWvGZrPhitn2Ly5ObZRPEvvMBn4mRPgnaI/ZCNhTbhrgQjlM9K2Dq6pCXqPh0+EH+Jx651fXVEmioFP9ZIWm2RqaXSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXK/K0+eyK48EQ1dbsO7Qfp6sxuFsVjpZCiuleXvLI8=;
 b=hEf5mdJ4ZzAZ2O1lRKrJnKDnXi827sj4jQBPnBmTu78zdBJtDwF2RjCNmNR7qZKSdk8blZcjO8K+tVwVFFhSKLBL/0igfr0iwnhhycSL/2C0qmXbVr7yDfdm+iOpFCzqcaeH4jEVdRx+pdxjuVtqXa9jQECAfTd3+EbJI/F1lGI5kKqXrAVJz4n/s+Vf/25HTOsEKJ2HVuOEucpbTB73+UhoWDicWkoh1FWXj8qIkoF+DZdnHAh+waIy+xpwSEcJvbaqWQEut2r5U3qSfQxnYVrWTIF2VdyfT1F03OpNsH12nkTuVPdi3lhE7FlrstZVVuwhMWGFowTr9++AJFKu1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXK/K0+eyK48EQ1dbsO7Qfp6sxuFsVjpZCiuleXvLI8=;
 b=RgN4ikzqaFUwS2z8VR0Brf8s/RkgShw9UVBXgiW/bbRMhluMQzjiTOcVtskcYZK1k55AmeXSe0SIz0svN7l64YhDrMg0dk2Y1Zd3jUbqOTQ1xMk+YrYrhSzuSBFG3r0ETEfpzGjRQxSuWFTGGGKr+gSXfDDv+tkU4roGmMWAmDysx59SWkB3ZDJ4tcLNxX1v3SNeI+rZDciaVqS7HN6q+FLUeDZPBPiUQwJ/Ysa9sZopUgvxkgwcNlHUsx1pSl/Jo/uFjz/VgD/BJwq8ura6L7L2wh5YOJ21DUbHV7BWdK/UvMwRdc/p46jWT+UyPpe21xZIbE0fIEQNAhO4IIi6Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM5PR12MB1579.namprd12.prod.outlook.com (2603:10b6:4:c::21) by
 BYAPR12MB2869.namprd12.prod.outlook.com (2603:10b6:a03:132::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Tue, 29 Mar
 2022 08:32:47 +0000
Received: from DM5PR12MB1579.namprd12.prod.outlook.com
 ([fe80::55b6:14a1:6fa5:3955]) by DM5PR12MB1579.namprd12.prod.outlook.com
 ([fe80::55b6:14a1:6fa5:3955%11]) with mapi id 15.20.5102.023; Tue, 29 Mar
 2022 08:32:47 +0000
Message-ID: <4e8bd876-48ed-8fd8-7b7b-989b45b54f1e@nvidia.com>
Date: Tue, 29 Mar 2022 14:02:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 2/6] ASoC: tegra: Add Tegra186 based ASRC driver
To: Mark Brown <broonie@kernel.org>
References: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
 <1648447526-14523-3-git-send-email-spujar@nvidia.com>
 <YkHX3/8BbXo4obWI@sirena.org.uk>
Content-Language: en-US
In-Reply-To: <YkHX3/8BbXo4obWI@sirena.org.uk>
X-ClientProxiedBy: MA1PR0101CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::23) To DM5PR12MB1579.namprd12.prod.outlook.com
 (2603:10b6:4:c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ff81e74-6435-407f-9a98-08da115eb3c9
X-MS-TrafficTypeDiagnostic: BYAPR12MB2869:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB28697E3C82E3637CB82A360CA71E9@BYAPR12MB2869.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p0GHJj2QrFDG0CT92+X9XsdwY47Y2KpRkCQY0+t5kqcEjG6a5bo7M2SSYxhirh40wrkpKuZ/Ii72hbTpTXwvX+Td887riHNAy0qLdeLx7pj4Rb7o8afs2Ky9FuAPn9+r06qKCe43G0dRJr2T2wz0AWJ9haMwMEgkwhQoOG3drcovI5d6akaz/FO/fH0UnEUVJMv6AmiHE8YGPGO8bzaw3RmbYdBTS7kX2b3qaAjBM455z8nAM+kNY4iaIQm9eORGSebZWnd35h41apXg9AV/DkdNV0hfnyvuyWdKOs3oXqOj9UDR2yZ84a6KWZe5YehQKMrUIkB+eUeZ5u4S0cGIfSAa3+ei1GtdHVcbhrHsscGzZpMnZhjYhyO/WJJSRX+tvwBiP4bEpHfsFU/2MxTM1UYOJ/YTCi6lVgZ0VowwdUcvkrLQ142H4bWAjbXrW7X1IPx/ku7/jWsL5gUSBkKAgkzO1W4z4D0RuSEf5LSX+rOXHqVxDx756PD8vINHnqkACkTuML/8CFkRYLviSNzG90Lp5r73gZ+fR4DbXVnRfKWchrVZmn/db+EAUFHwpx6R6PeGaTU8rorqSzmq06ldp8oOvHQpq3la04OO8Tlual8TRBo7fY9c6l0JnwjDJu6m8yfC8M9hcW6NH6uT769y7u5BbLcAfTJCA8qT6FCIhn4Ld0fEElm9ulywB5EhKr2Eq4X+1gIi7UR9EXZbKMjHphWElXn8pv1M150Wt1TIgrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1579.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(36756003)(316002)(66946007)(31686004)(5660300002)(6916009)(6666004)(53546011)(8676002)(508600001)(6512007)(4326008)(33964004)(6506007)(7416002)(6486002)(8936002)(66476007)(66556008)(38100700002)(86362001)(83380400001)(26005)(31696002)(186003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1BHSzFDMjhZNktvMEhjVFdUOGVZOVYrNVEyekQ0SC95UjVnYTV3dTFzTUww?=
 =?utf-8?B?VW9GazFRdHRCSUlSQ2pBYnhMMCswbktOUXAwZkJTc2RHTXF1a0U2bUIwRHJE?=
 =?utf-8?B?T3pMMzExRng1dCtWVERQOHRPSmhidjNuUmxHQmRjQ2tEV3NySTdyTVZiYzVN?=
 =?utf-8?B?bUdFNUJQL2JZcnoxYkpuT2hQaVVoUFBYem1hZFlOcVVjUmI2QnpiNnpEV1c0?=
 =?utf-8?B?NUxwY2EwMmdhZER6aTEvVy82Y0YvZXdyQWo4NUp0VjBwR0NyY2dka2cvenFN?=
 =?utf-8?B?MHJnelRDNEZpbStJTzNzWkI5elRtcVFSWVVUL3NPTldWeDc2RityVWQ2WmJM?=
 =?utf-8?B?S3dUQjIrRmhNZ0EyOHJ3eEpNcjlRZkdpOGJlM1ZMOHJqNUE5UTJpaFFyZGZI?=
 =?utf-8?B?dWFpbVNHUXRKeWpjT0RGWUZnc21QUEZsajAxbU14UThuemlQdFBzWlZNSktj?=
 =?utf-8?B?QS9mckFKL0c0VjJsaWRhSm5jNk54VmgwZDh1enJZeVVudDVlV0hUSmJXZ3pi?=
 =?utf-8?B?aTN6MlM3OElqL2J3Vnd2ekRqQS9FQ3dSRi85VGRkRzVlUW9EOERVRTkrNHhQ?=
 =?utf-8?B?QmFoZ2w2cmxsbXJRVlpFa2dNRm5USzVZUkZVUmJDWEtkd2pyZ1FKY25aYTFY?=
 =?utf-8?B?ZjIyWmxtMmlNWU8wZ0NkbXlTTTZIKytCdm9ZeWU0d0Q4Q3hpRFB4YTkydy9o?=
 =?utf-8?B?eVJEcWdFWDB6UVVoN0I4WHZ0Si9LY2NkWEJ2NGV2UW1za2FaS0x6bGo4YURx?=
 =?utf-8?B?Mm9EdXB5M1FBL0hwbzRTaGJXSXNrTG9mS2crSHJaVGtLVFQ1WVcydHNEYnBK?=
 =?utf-8?B?L2lxZ1ppenJVaGM3L05vY2J3RGxvL0FNM0ZnRzNiRElzWGpvaHRORk5JRmhH?=
 =?utf-8?B?ZnE1NlM5d2k0d095cktsT1dsYlFpRWhCSVBvV1pIcVdqVG9vMk5rV1oxRWZs?=
 =?utf-8?B?TFRYdzNRVUhhUE4yb1c4a1dINDY4ZWdycHZDd1JSSFlZYlNrR1FoRnliSGlI?=
 =?utf-8?B?Q1pjMEpvL3FMZ0FhS1ZPNWw1bjlKVzhwRmhYbFppdTQ1dlF1dytwMzdlZTV5?=
 =?utf-8?B?NXJqOG1jdGgwREV1eG93V2hJdzF6Zktnb3NyRGw2b1E4cG94MHRDdElLOHFU?=
 =?utf-8?B?eDhHUlZ5YWQvei9sclE2N3o1anB0anJQQkEzTW9iNVVEbjUyNDhpMVhUcWc2?=
 =?utf-8?B?M3dMUm5CQlE3NVNwRndqTjdrVFBxTFdoQmtiYU1zWFI0OStzYWM0eUZ5WW0w?=
 =?utf-8?B?Qlk3dkFQc0VWelRaM1JDUEM5UTArbU12Ykpwc1JxSS81dW1sNGhlNmZjSjN1?=
 =?utf-8?B?V3hoVVYvRk5OVncyUDBwTHY2VUVWUjF2Y3JoNjNHZTFKNTF5R0pFVTA2Wi9h?=
 =?utf-8?B?T1hBY2wrY1JBSjhJSFBXNXJZaGhaR3Vmblgyd1FnTlhYTlR1QkZzTjRtSlpo?=
 =?utf-8?B?U29NNDMyaDRqZHdpY2tETjA2aEh5YUJKdm5aUkdVaGtuUTcxa013NEFWZ1pu?=
 =?utf-8?B?azNNaW5wWjRncFJjS1g3bk5NU3o5cHdvR0dqVWlZRy94V0lUTENBM0JlZTV2?=
 =?utf-8?B?RkNPVysyRWNpTlZWdnQ2TWZDVFE1UkdvQlRqYVFyMzlNMkVaSVJPYWRrODlV?=
 =?utf-8?B?cndmcnJXWHRjNnVRNjE2dzU5QzdIUy9zaXlkVEhFalRaby9Pd2o2OFl3c0c0?=
 =?utf-8?B?UHRCN3RtRUpseTN5YXdvbE12ejc1akNHbEdWblcyM2lTclVSS0NkdHJmQjJS?=
 =?utf-8?B?ci9UTlNqckZyNzZEODdKS3pyU1JROG5mNjhFR1VVZUJteElEY2wxWHRIckpu?=
 =?utf-8?B?SXZvVklmYm5Hbzdwbk9kdlNyQkZVUFBmbE5JN2U1Y1VyUktMeTc2ZmxHWS9I?=
 =?utf-8?B?UHZ2c1pKcnRLY0llenI2SFBDdEZnVEowb2ZDMUhwanFuVzhwTHplNDdUNzJw?=
 =?utf-8?B?N2lxMnl2MjIzRWU1M2x4YzUwSERMVGNXUFJJWHFUTFJPSmgvS3dISjhaeTdX?=
 =?utf-8?B?OEZMSnRyTkZYdDkvSGs0ZTNGUkRiT0lOMkVMSDJrYnVzaEVRVHJBdnl6RkFM?=
 =?utf-8?B?VG1KODVKcHJmMzhrYWtNY1ducFI1TG5lNW9LZjJBRDJGNEJoaVRONDhXUlFQ?=
 =?utf-8?B?bkEzc21kdzEyaGUxSVNMWW01cm1PcnY2TmZkOVhHZlE5eFNhMFcxOTNVQkpi?=
 =?utf-8?B?RGUwbGh1eXlYR3V5UDY2V0RxakdMMzh3ckE3YUM1L1FKdHZueTlCYUM3dkY4?=
 =?utf-8?B?TUhWMHZQS1hiMGNrSllhOTBEYWd1M0FCTmRKUERlZ1VodnJjS0Q0b2FsYmVs?=
 =?utf-8?B?WjQ0emQvc01Vdzc2bHVVMU5WbmtDUVdNQnpzSnUxbkNiZmdLRkxTQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff81e74-6435-407f-9a98-08da115eb3c9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1579.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 08:32:47.1028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVXM8DIV97Nxcj3b+Bq7b3BDcn7B0Uz7ck4EeU8/hGLTMVmI+oBYho2dqX0YBoXBj3EGeTjOOQ72fBLw2Pk1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2869
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, catalin.marinas@arm.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 krzk+dt@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org
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


On 28-03-2022 21:14, Mark Brown wrote:
> On Mon, Mar 28, 2022 at 11:35:22AM +0530, Sameer Pujar wrote:
>
>> +	regcache_cache_only(asrc->regmap, false);
>> +	regcache_sync(asrc->regmap);
>> +
>> +	/* Setup global registers */
>> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_SOFT_RESET, 0x1);
>> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_SCRATCH_ADDR,
>> +		     TEGRA186_ASRC_ARAM_START_ADDR);
>> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_INT_MASK, 0x01);
>> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_ENB,
>> +		     TEGRA186_ASRC_GLOBAL_EN);
>> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_INT_CLEAR, 0x01);
> This seems weird - we resync the cache, then do a soft reset (which
> presumably desyncs the cache) and then explicitly restore a bunch of
> things (hopefully everything that was in the cached state?).  This is
> certainly very much not idiomatic and looks worrying.  Are you sure that
> the device is getting anything out of the register cache?

Let me recheck this part. It may not be required to setup these 
registers for every RPM resume. Thanks for pointing this.

>> +static int tegra186_asrc_put_ratio_source(struct snd_kcontrol *kcontrol,
>> +					  struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct soc_enum *asrc_private =
>> +		(struct soc_enum  *)kcontrol->private_value;
>> +	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
>> +	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
>> +	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
>> +
>> +	asrc->lane[id].ratio_source = ucontrol->value.enumerated.item[0];
>> +
>> +	regmap_update_bits(asrc->regmap, asrc_private->reg,
>> +			   TEGRA186_ASRC_STREAM_RATIO_TYPE_MASK,
>> +			   asrc->lane[id].ratio_source);
>> +
>> +	return 1;
>> +}
> This should only return 1 if the value actually changed, you can use
> regmap_update_bits_check() to detect the change.  Current mixer-test
> ought to spot this.

Will fix this.


>> +static const struct snd_kcontrol_new tegra186_asrc_controls[] = {
>> +	/* Controls for integer part of ratio */
>> +	SOC_SINGLE_EXT("Ratio1 Integer Part",
>> +		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 0),
>> +		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
>> +		       tegra186_asrc_get_ratio_int,
>> +		       tegra186_asrc_put_ratio_int),
> Can't the driver work out the ratios based on...
>
>> +	/* Source of ratio provider */
>> +	SOC_ENUM_EXT("Ratio1 Source", src_select1,
>> +		     tegra186_asrc_get_ratio_source,
>> +		     tegra186_asrc_put_ratio_source),
> ...the sources?  Or does it need to be configured before either side is
> ready in which case this might be the best we can do for now.

The ratio needs to be updated before start of the stream and this programming via controls is required only when the ratio source is SW. When ratio detector module is used (support is not yet added), the ratio is automatically updated by HW.
