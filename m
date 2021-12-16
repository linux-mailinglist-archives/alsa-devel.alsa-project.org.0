Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617944774C5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 15:38:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDEE21FDC;
	Thu, 16 Dec 2021 15:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDEE21FDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639665521;
	bh=BmzVI5WqlPJqIXv3Fx1cFEnNl3qK6NCELlLz3nurDS4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kVXJM9R/0R1/jAQmM9Rn3KwtpL9qTirZQ3YU3qJx4ddIE7J57jCr6KTkhT5PGrqe6
	 8rXYEtUm1beTUwGeYF2H80w/UQ+1ZsksO5W07IK2lExusXqBXwjnMt5F013v+M+Mvw
	 wKTNq1NJ8x1r6WRMb3aeueC6TabHt8O80Rw4G1S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 457D4F8015B;
	Thu, 16 Dec 2021 15:37:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 332C4F80116; Thu, 16 Dec 2021 15:37:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 273D7F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 15:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 273D7F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WEAAICga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639665450; x=1671201450;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BmzVI5WqlPJqIXv3Fx1cFEnNl3qK6NCELlLz3nurDS4=;
 b=WEAAICgaaCR3CE2i2XlsTCWkNyUU9VT6fOdD9uy0UCxD/jlUMgDijWuY
 lPRkAd0EDtMqXvEEfj4KWnGA5qAFX/zkK5M+pmUaCXeYkdt7RrHgOOLSL
 6REQuHHGc/AGGibSEBmjgI/L2VjQhIVV2PlegR2B/3XMIAdWzd8/XuyyH
 6Cztz5Xw7iWWC11cHrUa4j9yiDkZ0AK0ktcs0wQgr1IxXlptbbbJgNn6d
 LUw55Lc8r1at48nx6kq4eOS5PkUull5rXIgGcJK9EH2b3ZjhL0vV9ZOiY
 0YpUxqsdluB8V/ikdzdgau75kfyLeS5SemNmltib3+Jis9uCxThpJvADN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="237043885"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="237043885"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 06:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="615172231"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 16 Dec 2021 06:37:16 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 06:37:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 06:37:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 06:37:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZR5i9MWleZ2XNCCp0WHCbxJSUG/4a6/dTZYQH3OylQkHRKkYMdX+xXha08L5seNIkCL65ktB8jgH3g4oj2sZJOzJz1ywXEH884UHp/uO3x7s86RZJc3PiG6DGYMD3vA8a5GJhr7o/ylZLx7SpZ3A71RkD1RGsBqZo57QyTPk07H9kFO65+MkqiOMB9SZjlantoZTaEZLlpKkvFeg8w9tH3JNEE9fUn2e3X5VAJPCOLHTdVdVVyXN75QXfZyltklBlP6znB84Gcbl3xEC8IAlYXzZWzc3+T8mDdWd8tnvveMIb02ysN8IFSnfzrp1ad8LiZgRCx/N1tlsPdsmRBNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/5h9krY7TSQV5E2bDifPhIwByjy8fn2UjJ+kmvi7kM=;
 b=WMN32qFCKeaO/zGwOsoW1OsQ4oh8nlGuMinYUsfySWFbLxNfCwr9SPdX8z6a0lHCS5+e5qBWKZOBNxXyqRqzz07Am3QPpRFJEJzQIbHmubWj4RIfFIgQlTR3M5Z1NYUCvWjtbXWMAyKvrZ26jp7P2NCUH3qJnXPpJPFHTKlJA4qWefaL+mK7lDPLPQBb3lpJYAdTEbrRYFoa9nGseedB/5SZ599T/VQ3/RAWVyWuV9F96bLptT9d6KOJkFNKsjtlszLJL/dtZJklj38dSR7cHyDUzLcLP3jd45ufpxGIobHOddjJjWxLgXxurRr36wV/D4SDcNDlWO0fJ9gQ2fD8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR1101MB2356.namprd11.prod.outlook.com (2603:10b6:404:9c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 14:37:14 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 14:37:14 +0000
Message-ID: <2377ff39-2ee2-c1fe-844b-aa9749f4e026@intel.com>
Date: Thu, 16 Dec 2021 15:37:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
 <20211216115743.2130622-5-cezary.rojewski@intel.com>
 <4a8afa77-217a-9d1a-7704-909ee895c4c7@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <4a8afa77-217a-9d1a-7704-909ee895c4c7@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0413.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::22) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c28a379-81a1-4741-3e6a-08d9c0a18d3a
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2356:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1101MB2356F26A1C1EB11CACDFFA4FE3779@BN6PR1101MB2356.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EGtOGs/XRcOThA/bTrR1Dv4V2QMVc/XJD8/cVwgNK6yL1IAkD63oFn4qPv0l6fYQiTQZocQA5amCaL2II2IDsyzXMel52liAEQrajrtsTyrsP/lm0ndB3heCDtPiKgcXSNXvjd5/KWOaCQ4C83Ao+nW2CPZXqcxXlkV5C4cCOmhnHT2udp5/6/2F4+sVucBTklSxT31rhSkNm2VW6kGor16VETesDQyncTwAc19PzgLHAFCTT4nypSdV1O4nDLEAHWq11RrQg5npLYmM3wui+Q57wPlGvYRZBb/auiEW4uZ1M28yhrA38Ttd+DkMyrYPB9c0aPRuVoN1PuEuclTtw9Nh/OtFYsH05BrOFEzKOuEkdekRkRuZk+IE+gaa63kqou0YMsI3Z+LEe/DsMTXgT62FStNbWGwDbHfszTUvFEvggOeHqzNPaFPHkPOeEmXFlKsL50P3ioAfsGmP/AmkbSD8w/0eQVkluM++8YU4vdl3coTtnzGsfbFWFbm4GfDCaWfhMaYdDu/HNZIDsvoNu+j4Ipt/yoeLJUyxmwrSCr+GqtG1iRs5UxoSGyfPfwl2TN4Lb51tLfUyve3e9KPZUDZD9GM+d/V4LBtobfvEAscZ6yi+AqC+G/AeMTTmUzNG8E9YrjYf86r0OIKBMKxEdWyPlyvPQcHFNqPDZBuALe/ma4xXppyvDPII6s1B5Lvte9J8uiCApTb/0nk86ShuByKVG66gDAGrtWFAuc5Boy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(82960400001)(6512007)(83380400001)(86362001)(186003)(6506007)(38100700002)(5660300002)(31696002)(36756003)(4326008)(8936002)(2906002)(26005)(4001150100001)(66556008)(66476007)(6486002)(44832011)(31686004)(6666004)(508600001)(66946007)(316002)(2616005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHR5cDFHVlBNMFJiTEZqbG9zclI0ckcwanJkMWV5ZHluYWNUVFNTaFliaDNO?=
 =?utf-8?B?a0xXV2JMNlVlcElpRDNQazY4ZE5ZL2g5aDE3N3ZhWC9Sb3lpUmlvcTFpZ1lW?=
 =?utf-8?B?U0tQMVorNzNXY3BFb0U4ZjdZay9ZbmlSQUlTTmJMeHUwZUtKL2J5Z0VNeThN?=
 =?utf-8?B?TXZQYmh0RldGKzRlMTVkdWw3NHNoZVhzQXVUcnhUVU9zM1N0cE9ObDY0VlBM?=
 =?utf-8?B?T3Zpd3lkQ05IMWZwMjNIS2QydUJCa1RsMkp5M1EyUmZvN3p1aFh0SzR4dDlh?=
 =?utf-8?B?TjhWYW9GSW13c0xobnc1eWZmTTcrVzJNQTdqTHNUdDRaQnY2Tm1uUWtkbGRK?=
 =?utf-8?B?YWRDTUxTVG5QMjcrakV5QUhPcFRBWld5NjNYMlQybkx1K0o3Z2QyZ042a3RY?=
 =?utf-8?B?TjVzR01wZlgzeHZBMncxUmtxUVUyWHpKVHBNeEUvQVh1SFdzMjR5NDBQR2lE?=
 =?utf-8?B?MXdYaW1RVjY5L2NmRmxrVXJNdVFUdGZXWXBxSVNrNWl1Q09FcVVWZUxrZnU5?=
 =?utf-8?B?eEMwdEJMcWdveG5ITEdMVGVhYlFPcmw3WXNEMVBZMlIzc3M4VExEK3NSVUZ1?=
 =?utf-8?B?T0RBNmU4eHJYQ2V1M0RSaWVSRjFVNzdka1ZGK2dRdUFzbm9SRCtQRXU0WnJj?=
 =?utf-8?B?ZG9aRWlHbXNyRmo0QVJNYzVnRUhCY0ZyZEJ3SUpZbmlQYXJVa0h5USs4ZzI1?=
 =?utf-8?B?RzFXYmZ1bWRNTFVac1VhVkxLVjQxV0ZxYUlRVVUwczJWeUlzY0FiODk1bElF?=
 =?utf-8?B?blRnNFpaNHlyTjFzdVdGTlQ4UXNjczAyZy9LZ0J2RHA3aFd4c1pGa2Y2ZzZX?=
 =?utf-8?B?N3ZMOTBacGlUNFNTU0VmRmJRMkJOZytIUllSdERucmR1UUtzRGRJTVF3VWkv?=
 =?utf-8?B?OXIrci81ZmtjUmxpTU03dW5zRmRaRnRoWkduanlybktuczFmZGp3dXNoSjU2?=
 =?utf-8?B?Q0REdWVnTFVzamlwN0xpVzVPVDdQNG8wM3p5TmtyWThkUDRlUERhcEtGY0s2?=
 =?utf-8?B?Ums2MjJCUjRSdzZkZE1BWmdGVm9wa1FuV1BUVTBXOGFQUU1JN1JRQ3pvTlJa?=
 =?utf-8?B?Wk1BQmV1YmlUUEN3ZTg0U0Y1SWlVSVE3NzhzWFlDbzNPbld2WG5tRlgra0Nr?=
 =?utf-8?B?ZDc1RkR1VFZ4QVhnWWpDNlQ1THJrSC9PT2R4Q21uV0tBSjJ5L0FZd3lELzZH?=
 =?utf-8?B?S0FuTWgzSEpSQ0x4dWFVdm9pL2UxYlNmT2l6WXgyWVJBbTdNaW1tUTJLS2dN?=
 =?utf-8?B?WkoxT0VwQXFRYzduNEVZaGVUZEI2eVlWZEVJMXJyb0tVTTgvNXp4RTRFVmxu?=
 =?utf-8?B?RHB2VG5seFJPTkhLRzcxenFmKzh0c0dvZ0l0b3cwVDhlUlE4TUFqVlZkc3dH?=
 =?utf-8?B?VFVFTTJpTG50d25JZUhieitCS2hGUUdQN1lUQ01LVzZlWDVxS1BLQ1RQamhY?=
 =?utf-8?B?dm1xS0NnbDdleDhwcW9RNzN6S0ZqcmMydjhtTTFDV05KR1phSmEvckZWYk9x?=
 =?utf-8?B?N3BESTdHMmVRMEFJc05ZZzdyK2FOck5yZWJreWYxVmwyMDN1WHFJZkhsZjhx?=
 =?utf-8?B?cWpqNEtDdEdFODNjTzJoTHhsY0NCZ0djVVdBdEUvVmR0OUVnUStCaVJxZWJl?=
 =?utf-8?B?S29mZ3U4eXRhZ29ESzN1MTY4dzk5bG1xMDBMc0N4dlplQ2ZrZ1NHNkdKWUtC?=
 =?utf-8?B?c2IzY2lMMU5GaUxsS0NiZUkveGpwRWt6VVVWbHdqZXRWeGtVN21kdmh2ejVw?=
 =?utf-8?B?LzlnVnFybUo2akpMN1R2ZVJKOVZIbW1oTkdHM1Y0USsvV0p2b0tQRnVmY0Ny?=
 =?utf-8?B?Wkx4MjhwN0crMWJyaVFCMkxMNjduSGxwZkZ2clVYaitxU1J0NFV4dVhpTEl3?=
 =?utf-8?B?d0xYcjBVQWQva0RNb2tzaEVObWpvNnhDRkpJeVZNUE1pU3psVnpoV3dyNi9k?=
 =?utf-8?B?bDM4dnFjVTFCcE1hRWg1MWo3elB6T241ZWE4aUFEREpFMllEZ0VIb3Jjam42?=
 =?utf-8?B?a1owM3prVGhNYXdqVlNTMjhHaVN2dExBOGdybUtWV0hLdGVQV0ZLd0Y5Q3JL?=
 =?utf-8?B?UjAvSzVMNmNNTDkrYmFJN1lzK0FpTUpvNHJub2VDTGRsVnpCM3podnZtTm9k?=
 =?utf-8?B?MitSL0c4N2JsN3BvN1V4ZTRMV3hJRlN1UGFuY3IzVzI0VmU5MDhNVnppd0FE?=
 =?utf-8?B?cEFrQW45WlJyZFdHdE4vSldZR25LQXM3V2kzWlV2ZisxeXQrQmNHakdpcm5W?=
 =?utf-8?B?K3h1dDZyQVZXNzlZTm1WVzFKZnFnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c28a379-81a1-4741-3e6a-08d9c0a18d3a
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 14:37:14.3316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niSlPxu3O9bcsQAo5wbrgm2cx0P21aJjPBnNVHvcdPfs9GfxP++UI51ryyb+jqPbMo1/PXWZZU+tz4AK/WUZ78W5GSnLmwWKs36BDwnnUpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2356
X-OriginatorOrg: intel.com
Cc: broonie@kernel.org, tiwai@suse.com
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

On 2021-12-16 3:11 PM, Pierre-Louis Bossart wrote:
> The intent of soc-acpi files is to establish a match between ACPI _HID
> and machine driver, this is now duplicated, and it makes limited sense
> to add machine driver dependencies in a platform driver.
> 
> Nothing was broken with the existing code.

Hello,

Yes, nothing is broken in the existing code. The intention is different 
- be cohesive about what is actually used by the driver.

PCI-ids table is duplicated already for the Intel audio drivers. And 
it's OK to do so - one knows which ids are covered by given driver and 
how. Here, it's clear that haswell_machines are only used by 
catpt-driver and so are some fields for broadwell_machines. In time I 
believe that we will be able to reduce the number of fields for struct 
snd_soc_acpi_mach i.e. have a single fw_filename and single 
tplg_filename field without some driver-specific duplicates.

About the last, there could be a case where no topology file is 
available for certain configuration and given entry should not be taken 
into account. While catpt-driver does not make use of soc-topology 
feature, that isn't true for other drivers.


Regards,
Czarek
