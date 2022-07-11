Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F656D77C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 10:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCEDF3;
	Mon, 11 Jul 2022 10:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCEDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657527225;
	bh=vtzTpvSOiRVxNienw5S5cRGyhkXoEgtcVvsBMEtHMFY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lx5XWp5kF48eCOndaa2R0ENuCv2VqgGI3hn9N1LgWcdjEghIKDG685KJl1PRLaeoO
	 8vvKmf3kCeRZj1o3UzP/8xJBF+BleFl7PRLdm2U44Tgpk1oGVgWaiZvBBdThPU4GVX
	 eAFvPq/0tYEfLvQH/RZIRp67AwmwCbcyDGuxvKbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B55BEF80256;
	Mon, 11 Jul 2022 10:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26985F80163; Mon, 11 Jul 2022 10:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F187F800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 10:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F187F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n6i+a3BR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657527159; x=1689063159;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vtzTpvSOiRVxNienw5S5cRGyhkXoEgtcVvsBMEtHMFY=;
 b=n6i+a3BRSyoh9goBptWw/jl3wLYQQdt4sAHivmGua7QsK449LpZ9TUjD
 YRLxV2mtdDruaPztRS070UhzL74/qrAEh20kYAkIJ7yQ/iuH6yxcnbWG8
 1bLIN+ZGX4GPACIU9UL0m02MlP7jJDoIZ9rDpywJu8blhEwx6xk7Ja2Xb
 qLdPEzXLTZvQmmAhCpgQaryIGQ3weRNN+01sLxMT6k1cFvmQ3YoC1x3+V
 lILZqcmUxJfNwyySsxjfpvyjDeIlYJs3xxQ/IgiN+87mlM9szHwD5FTZK
 GbuvzMA1D8MbrDu1tg/w1RxM+R0Y6XpB1HZ8Ci2/p2i8lnNKAexm9Gwb1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="283358378"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="283358378"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 01:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="662462534"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2022 01:12:31 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 01:12:31 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 01:12:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 01:12:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 01:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLALKGZodGYuO6jFCafLeppCmjytAlE+bpVK+0/Y08O1d/vV3cjk+KeT1nefxEtL4SSHXu7eSoTd+T92JynLnlp8vusJMMEoH9AjlvuRwuqbIlPgrARdPin+PcJ3cQ6dZ6r6Q+MaGfEurVSf6Z1gsCvFSIUg/i/RX9lCwIUYDzIt5r4pNR/iVd0Izd6p3i7bMPOiUjKfFR+1zVZIFtmkdQpQvnB7mFLW7W9mLnhxSXVv6PWFSV04WBKTFjos1872zYTRkaRWGn3vXQ8YSfesIagJ8Yes7UioEM2s6XhhhSvm7bYFRb9cUc9hpriNXkIbX7LRgjMxm8Cdf1t4YKftIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUPD1S8T+EhbVJQZCbgiWSFguBdxLdhea0SSIs+K6zI=;
 b=eDWsE8lZKMJm561NclF0qk33/zLw12/+E+ue0FukC4g44MysrH3CjrgA6twT38DMjHadWXuLG/f0XPbhKVpq+NoHM5SfVUkuulOiVgDyFqxnYDZJCVpvH9x9jyPZldpHnG3G8C2FWImu3zTGtANDNt2HZZcInqsT8JAqWeIuH7Qql9yE6q4qGzfG+Y99HWnp85OlMNlhfewkJg+yDyZBMRZIH3Bg+uOSmnXPqs3z+ws5Z5lKhha8QOByqhDTCMpxyJj/OlBoRqhRSdBsomrdieW2LbLucnGFpWOAKOKVyBZ15ex0qwnyUBBG0cYv4+x3HP8SPmu0cjnqDnO+ULJrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4364.namprd11.prod.outlook.com (2603:10b6:5:201::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Mon, 11 Jul 2022 08:12:28 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 08:12:28 +0000
Message-ID: <7c9a4124-c2ac-2348-377d-bd3623cc6a7b@intel.com>
Date: Mon, 11 Jul 2022 10:12:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 9/9] ALSA: hda/realtek: Remove redundant init_hook() in
 alc_default_init()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-10-cezary.rojewski@intel.com>
 <877d4mi68s.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <877d4mi68s.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09938e91-f0f9-401e-dad3-08da6315189b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4364:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gJuyhk+IV6/5JyJ+SPCCdWeH5kZMAqIgwyjnbRtFOD6hEOXt/E1NGsFLjl0wDNlbyNXdXbIDmBbu1+3Fxue+yHfpyaPoP1Xz3cP8KyX7KzCn6zgL8S2Q4N8DnaMXfEjTjXSUKVnTwdL98VFJoXDWt5RH4a4E8KO7M2gcEzrVyDIulmW2g+caUUuZIVq9YHuZ6KOSLUYvkELE09td/KG2uRX2tt4f/qteYEGewH7tNmYCSlJqbLHXqw382poHDDG5Sr1hDvD/+jb6eC+ikNoM5PEOG/3WjG1teAq9kfUSWE6Mxut3Q4vwwBgyroAmcLKSaN7dpn/5QZ7R55zGDlD6sKEY36OEZofehz9W5OhsQ4ugSFS/zKLv7S2DbDXC50nAHgjQtiC4+UBCIKPsby08l4YHi0E9okgV8hWso2mOxijhNeEeXvxU/EEMi8yNzxsJVS9EqtMZ3QaPoxhEd9ncHZGP+LMXDHmO4jIMgk2J/ZkxcQKrR4Wzlche7o2n6cAG1+4l0sW0DzYK8d179ROyGBjN7xm4eFRsPKJIIIQ7KPXJOpdpoOxELUrGpmHwOAAnHeg0m67bKSdjCC8GpncAYgpS4/mhREr8wWDJEqjqBAvXmC6ujvUG6XT9IXlVM02DjPiu8Kxw0ZVqR75iDor/hacsTFy/NRPkNl9cJHIwwg7vt+aoUTJnxzzs6n5yduCnLZkSFmm1qdBPEwsiuBJ+HBwx4yq2T1xYM+41j3X9nT8oIarawNJZYwscXpi0WMInydiBUpJLwB/bIhqFy6gn2OR9M9nBHY/SF16WFylgDL8yLWJpZZRsq+DGGOB+Xxpf8muZC3ZawBp6zA8IPHN+yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6506007)(6916009)(6512007)(2616005)(53546011)(41300700001)(6666004)(86362001)(316002)(31696002)(82960400001)(478600001)(5660300002)(6486002)(66946007)(66476007)(66556008)(2906002)(4326008)(8676002)(186003)(31686004)(4744005)(36756003)(44832011)(38100700002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDdxTTduclNNVjVpR1lIUnQvU1hmckU4Q2RUZU9oZmU4emdMK2FDSGZ5YTUw?=
 =?utf-8?B?YmdxV1NNSG5oakVHTlUrMW5URFo2VkVHZi9WNVNXTVIyL0hXZzg1QWVhL1k0?=
 =?utf-8?B?UWQyR2NHdklzYUZ2VHZNNThIbU1wWjdMUUVyZWoybzNlVG5YRFllZmNWZ25q?=
 =?utf-8?B?d2IzMElMYXJTdkNXU1ZYRTJlR0VUR2VBc1VtM21MSDk4QXgwT2I3MlhEbng5?=
 =?utf-8?B?Z0dsdU5yUXgwZ1ZzR2ZuNDVOdXQyYkQ5T3cycVkrYnRpeTBlSTUrTFYvdmxh?=
 =?utf-8?B?R1grTGUvZGozc1hWOUljZ0tkT0tPZ0lGNDZrenptaHUxY1doVnZZSVEwMTRP?=
 =?utf-8?B?VHN5K2tONEpRNHhvRmxiY1lhOFlKVnNrUS94bWsyc0Y2RHJnRVdtSDZlU0tI?=
 =?utf-8?B?ZnJ6K3JnNWVXYlNkYWR3OGhEUFVwZGJZSFpDdGdiLzIxeC8zMjlYSnp4T1Br?=
 =?utf-8?B?UDBWMWRqMEp0VVI3QTdod05UMVNUcjRERnlza0U1UWVSQkNTQ0M0djd0M0Yv?=
 =?utf-8?B?TnpPeGRPK1BwK2x5Y0x1YkY0dExETlg5bmI3UTZlUzRRTzZvaS9admNwT054?=
 =?utf-8?B?dGxQNzVsdXlrdngwVURYSWxhazVJY0J2cTBVL3EwT2xRdUJFUzJ1NXlLUFBk?=
 =?utf-8?B?Q0xwRFgwU0JPcGNBbWVoQWoyOVAxandWQzhDSVNaV0J0NXVINC9OWUN5emRi?=
 =?utf-8?B?cE5wcVl1aFEzT1pCdDRRV2J5aERJc1hOOFVsYitkdVBKd2EwRnVkVEJob2Qr?=
 =?utf-8?B?Q2hvVE5xbzZqdCtPMURhVXUwMEhnbGE3NlowVVEyZVZDL2NSb2ZjaEl4Tm9T?=
 =?utf-8?B?bTU4TjQvNUpuUExKd2I4eEpQMkJjWEtrTWpLZ0ZGdjNLK056OGdlTmhad3hL?=
 =?utf-8?B?TlJJVC9weStlYWZFWC9TbHE0OVovODdEQ0Y2TmhZUXdlTmtFeFVzRnAvS05W?=
 =?utf-8?B?d2Nsbk1nZThFTFEreW9Pa08xT1lWaS9rZzNqakR2cWlReEVWWXJsUTBHR3I5?=
 =?utf-8?B?T2JTZm5wOXFrTENVemxaSjlXRW5laHVOKzIvTUtkQWl1cmJTTGhRZ2FEcFRT?=
 =?utf-8?B?KzRwYk1hTnpNQVNlTnl0aUZrbFdwNUVYZ1Naci8rblVtdnYxNGFmSDVsQ0NP?=
 =?utf-8?B?dGJPZUxVR1F2UzdKYitmUnU3SWRYMXRwVDRUZVVubS9sOURYVlpvRWRQdlls?=
 =?utf-8?B?cWVqZm1qeERicU9MV1BHV3lDZWQzL2R6TXZkVUJsZ0hSeTNSanJidFNzTjdr?=
 =?utf-8?B?c29lVnVYa0R5bDh6T1B3M1orbVJGbEZYNEdpcWdhaWhRemErM3NuaXc4VFpN?=
 =?utf-8?B?MUV3ZFBIenRhV0g3MFFzbFVDSVVpdWJSVnl0YnVKRVJQbXlrVzNGZEpMNzZ4?=
 =?utf-8?B?VGFRUjJkNHBRQlhSd2gyb0Zkd1BsdGRnUTRyVXJUWWMzZElqdFVsaXZGaHZQ?=
 =?utf-8?B?Qk9ORjkxQlNPdXAvNHhDUmEzRXluMkxHaW85bGlFc1lyeTNiMDJHTStnL2Qr?=
 =?utf-8?B?aUhRVm42S29XVkM3VDUwK1RSQnJLMXhUYnhXd1NRK0s1Z0UrMlZGeUJ2ZlVr?=
 =?utf-8?B?NTM1ZWl3SndIc3hKZ3dwQSs1ZkZxMGEwaTFSVUIySXZBOHlaNjFyK2VBRXdj?=
 =?utf-8?B?eHZ3b3V1OGtIRDJUeEVPTGh6T1BSMmpyWEM1S1VacktXKytFS0pFUGxIOXVl?=
 =?utf-8?B?Z3FpS3h4TUtSc0c0RWtxdFNhSEtjQ0N3bGNKYWhGVE1rWE00QXFDSktJOE4x?=
 =?utf-8?B?YjhReHluUnUrNjdyczBkNTMyK2pIUCtMUjhnb29oRFh2UkFYRWNPbzdobXd5?=
 =?utf-8?B?bjRYK3RNTnRoVUs5cHNwbkJwRXMrVE9QeHN5NGRnamFmelZMMmNmamgwVWpM?=
 =?utf-8?B?V1ZDc2YxcEdGSW1QejdDUDVLblpPQXFGQU93anp3Y3MrL3JnRDFscDRZNHYz?=
 =?utf-8?B?dzBiUmk1aG0wZDVGbmRHcFczclNMeFJ4amo3RTk0c3B3Ymp6YndhcmErVVRU?=
 =?utf-8?B?eGxmaVFmNVlsNEdObVlHa3ZIRm8waWxHdzJhQUpsaTlwSDNuUVBEY3VHUDd0?=
 =?utf-8?B?dURSVkpEV3krTm5BTVpKOFJxUDhaT0N6aFRRdExPMkVUb3JLVFQ1UElvaHQ2?=
 =?utf-8?B?WVNvaSt2Y1dMVzFLYXFQdWZDa1JHbnBIeWpxNkh2bi90cHBsVGtlUlV4RVRq?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09938e91-f0f9-401e-dad3-08da6315189b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:12:28.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A+M6L+gh8cLQ/P9mjfRdj6ZkDa0yJ5+1EBlIB/gWtk6482WvogIkWRIJbMeXGnRdfQsXLr/vtOMNk5pLgsC+Uvr7Fc2nKD0nkXK4Ld/ZeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4364
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-07-09 6:46 PM, Takashi Iwai wrote:
> On Wed, 06 Jul 2022 14:02:30 +0200,
> Cezary Rojewski wrote:
>>
>> snd_hda_gen_init() does that for every codec already.
> 
> Definitely not.
> 
> snd_hda_gen_init() calls init_hook of snd_hda_gen_spec.
> 
> OTOH, what you're trying to kill the init_hook call of alc_spec.
> Both are in different layers and they don't share the same callback.


I see the mistake now. This patch was generated when I was debugging one 
of the module-reload issues, and once it was fixed, double ->init_hook() 
caught my eye so I decided to add additional cleanup patch on top. Meh.

Thanks for paying attention and good review!


Regards,
Czarek
