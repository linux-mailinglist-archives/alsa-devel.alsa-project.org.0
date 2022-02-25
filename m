Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF504C4F03
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:38:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD2111F46;
	Fri, 25 Feb 2022 20:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD2111F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645817937;
	bh=oATjBEWiQu6lgP3U0tI+Je/oiYI8IcTocb0lyuLA5Mg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFE8337RtEROnCGnOV+oWZTIy4jz0xaemVDRkFFO14x9KgoaMu/5MIdaQgVLz43au
	 vXkUir5B0EI9GLOH3oHW1+3oUgRW/rthzyDYWQ0S+PBg5v54duMeuC+tl0wxYfgrRr
	 FyDvVKEnnUM5kIbgRRwKTimknMNcUU1KCtq7KxC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 283E9F80159;
	Fri, 25 Feb 2022 20:37:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D66A6F80132; Fri, 25 Feb 2022 20:37:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C0BF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C0BF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J+LWMxdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645817867; x=1677353867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oATjBEWiQu6lgP3U0tI+Je/oiYI8IcTocb0lyuLA5Mg=;
 b=J+LWMxdVYKiCPqkLzl3sR0kMfQrJwu9BLkgcIL0grygQRDYWySkb82AP
 oLr4QuPJqy9sjXwu5nFcqHQYhBXsWFSpRzp7JLjIRbZugkNUcLxjEis6i
 v6qCr027Qg10WSKy6CsQiFkb/CKFBX+TuJqqf1rIewbV7Ic0BO3Nn5AYR
 7GmPk5rncV41U6+pk2uFN5bd78BxcaWgsAX/O6RTlPO+hagEuYqzJv5LO
 F3ce9hs5497mlo3kyV3j29rde+HZHiW5j8K2fzZ7v9/mkdDcUoxMOudfW
 3LtunuRzG8CN7UFNCyuK9zfGxlYHj6oihZp4gAiFbiijllD4tKTws/AsV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="315781706"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="315781706"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="506794966"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 25 Feb 2022 11:37:40 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:37:39 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:37:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:37:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGBGhXX3/4Z3EbV/lzo5Ilrp5IhRbe/LZolFMXASgqhhJfQZut1j5Hu/Nlf3o89MOSBf/K0Ubr4KHCN8w+VJfw2wPi7CCeHAE2yMZiuwF/FbfLs02PcwIjbMyY94EKarhvYGM2IhvQpQA05tIE62nBldTThwbftLP716Jc3+KVpE7WpWit9vMJlbYB7i9Hpckj8zflIDZV+hiyEugTdD5LhUKJNUBIixceNWjJNsrX7kS7B4sFAYR1Iws8tWTXE9xXM9xGWKtY+tfvYJqHK6l97nwanAitNHM0jUmc5chHnklYYFp8X/hXbczDhegDwG5mOx5s2uh9kLsPQcE/7RVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c4AKjtj52V2RCP0cO3ohxXuusCmAGX4HLG8ouhnnG8=;
 b=djo2OXW0u0HVw7kS8RwpmBZJaGL+UpSfzQr0tVbrHZxWeMhqqjED7tLGJXz3tOeMOEBr+SKVprLsdDDJRtHnKnZ793v3P8aD6TYBeXGwOiigrymN2MHkVqCtIciTCcYj1U+1xQA7GzfD0geuRz3YRG3gHhoOLY+tbkhDFhyohBEid+VH1994FZQt+t5phU9oUTt04x7LjaKJW6oO5AUO1XVPyxLJaMaannvrIWSEAeOKzHn3bA8ugSkw6xg+DkJ0Q3vr33Jx7av2xid5/gNDbLdL8kuICTGcHxEAufXLoKE0NNHRld12P2HDTDCVIpVyky6xr1h22rJMuyhPAq8PnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB1747.namprd11.prod.outlook.com
 (2603:10b6:404:102::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 19:37:36 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 19:37:35 +0000
Message-ID: <a9de0709-8a0c-ac8d-50d8-cafa77bcf579@intel.com>
Date: Fri, 25 Feb 2022 20:37:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 14/17] ASoC: Intel: avs: General code loading flow
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-15-cezary.rojewski@intel.com>
 <945de468-e2c2-a609-ac6f-a668ddee13a7@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <945de468-e2c2-a609-ac6f-a668ddee13a7@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::23) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4a1cc71-eff3-4556-5140-08d9f89645b7
X-MS-TrafficTypeDiagnostic: BN6PR11MB1747:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB17476BD9BC7343C0DD6CB616E33E9@BN6PR11MB1747.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcjLXHPWL78o0j4rthUJ4As14wtoaNJD4trqdLw5iTz9k6swLAhjS/CRtW5E1in/7Q2FOeInZKOYvd/9drs5VzjtXRfRUe4xOmWhloNiQ2PFhEhICs/dghvytJsfe/fHjpID3gVlBzTel4Gzwua/rIaky4YNmybuy7ITEovHwCGMtoW7LeIL/DqVkruqXb8e1PHAymzMgwf9mqQrftys6bHQej+WiwilLzyTJm9eso4Vnw2knUKdnDgeJkU8lHxPM2kfFYWRYLjMyvNAqssnNFc8S/5lK4dX2jPa25AdMYQ3VwKka7sm9sSwzQJjA2NlW8+Ay5UfcbAbd/GqFmcszm3Q6QAuHQRzEI7gcJV/fFNiga7mYQAF0GF4CZJUanpqwZq68I7gQWzgPHqzbIfnFQf6ul43syt+R4dC/40LXOnPn3yroKBkA4h0M9pbKeA/WLw7EiPwZ2hvdbX3zTtNcxgvktWrzb8B169iH/9XquhrEC1NC8MzfKnFjp9Ltd726Yxdcghm4zvYJ01yQLhztgGBQaoC2y9fdqpzGXLC44SmIyTwGa45m7InfhO5+9uKKBhkhBD2xylDKF1sdy51oi+s71QhzA19/2LiiJctsbzo9P7mbZhhCwlB/CbCzl7bvkXkUNuSDGscqp6q5FFnCY+iAsSE7vt64b69X/uI8dIxkUv3BVDLVMRjLkETvkpENA/2Jq91ACg4DucoNoYpABbUX8BOG7rFinQ8U9O0KxCVuq7CQ4JxQFS7zQlldVsrp/nLsp5iyLrn3cyUko5s9RShyOQ8bOUEjeKtXLdDlO6JkBfU/tcdPFsOjCLzWHVpiI3IkClKTlBT7bGSuE1SeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(316002)(6512007)(66556008)(36756003)(8676002)(66476007)(31696002)(86362001)(6486002)(53546011)(6666004)(66946007)(6506007)(966005)(508600001)(8936002)(83380400001)(2906002)(186003)(44832011)(2616005)(26005)(4326008)(7416002)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1BVOXNOcU9aSmF3MEZadDFrQUtqcGZoVzUyNUVBdXpndDFBOXdpcGsxZXZh?=
 =?utf-8?B?ZFRySmZIR0QvZUlqRmt1RHJUZE9CakRZSUw0cTNlb1BmNmVGUlFNRVh5VTEw?=
 =?utf-8?B?M1JiNS9GU09XUW5MbXVEeGRsM3Q3T1ExR3lxdDRkU0Fhd0IvemRVZU5oV0Iv?=
 =?utf-8?B?Mm8wUmhWRmYxMllHMzQ4KzhRRTl5OWlVNEQrazVyQUhvVm1kR3JueWVqZ2dN?=
 =?utf-8?B?UVJEUUlUZ29GUEZsallsLzZ6Vkw4aVpiYmE4eG1jc050ZWJYZWN1N2hpNVZK?=
 =?utf-8?B?L2k1NlNCQUNLQ0xEMUo4NTlJbDIwVnBFa2tiYmttditMWUtEc1MrSUlRc0sv?=
 =?utf-8?B?bDZGSVkrVlpKcEhYa3ptc0RLZ3NPUHFacWR6dkplbzdYRnRnZHpSTGx2Nmds?=
 =?utf-8?B?UGU5VEFselJPUjVjNGhVRlE4OW5sL3N6VjZib0ZFQ1plank3dGZockJWZ1JW?=
 =?utf-8?B?NE14dThmNitISFdTeFlyb0swYVBvRU9YbEpJblNWSXdjSWRqR3RlRXRoNVpp?=
 =?utf-8?B?bVdxZjJXUlBFNTFiQVR3cHNqaVFaMnIwVWVxSk1Ja2tCajRNbWNBVHVWM1U4?=
 =?utf-8?B?L1cyL1VwYTRCd0VuRXBTSFBDREZQaFZhc3drSnBwNHk3VVNJVlJDcmcxRzRS?=
 =?utf-8?B?VjJMcTNVZG4zOUpaRjNZaHdySjdUa1pLaGVSU2dEUzdDandVYmxKazRrWGpl?=
 =?utf-8?B?dFR3b0tocjFkZE1GTVZOTkRTL3NhUnBOZjRSTENuUTVFemlCVi8zNmp5UkFt?=
 =?utf-8?B?RXJURmVCM1lOY3hRdTlXUkMwZmZJOVZzZmVGaU8vVzAwaW5YbTZBb3F1RzVF?=
 =?utf-8?B?VG5xZWc2cURPdGVQbERqWUJuMFF0bVV4Nm5kLzBYem5KSDE3N0cwZU4yb25R?=
 =?utf-8?B?OUs1SDREYW85SEYzNDlTb05EMkFDNGpVVE9ONE1kejhBWWdLUmRXNFAxK3dx?=
 =?utf-8?B?dDBiOXFjWU53ODhXcS9mRlpqVUx4cDl4Ny9QbTBUQ3BhYmppQlpwazUwdlF0?=
 =?utf-8?B?YnBsbkx0eS9VYWFDTWZmZUFPVnF2U1F4M0NBOTJPdEtoR1BvSmptVzlMY2Vt?=
 =?utf-8?B?SzB1b05jRk0xcVA5c0o3SVRZK3FlaENMM1J6TmMyQXBGaXk5N0N1TVBZTTda?=
 =?utf-8?B?bVk1MzIwcmkzT1JuM1c4QS9QbXBMMGdRL25mYVlCK1I5L2lrbzg2NU1xL1hq?=
 =?utf-8?B?c1BxK1Nzek5uc0hYdDhyZlZCSDBtK2g2eTQvZFdmOFNiamlPcVRUTmp3K0F5?=
 =?utf-8?B?UU4zWERZeGpKVHY4NnlTREw5blJWNEZGa3hJa3pMRHliVW80UFMyOExKTC9B?=
 =?utf-8?B?TzVmMFhGdEYwRElvZ1B3T2kwNkRsa3dtanZEcDhUdGFYdDVpSkdlNytPYmtm?=
 =?utf-8?B?RjhCeDVOamNwRkZYN2x4WlBGV3d6dHhScjk3YVc3UGs0bDY1dHJlazI2WDVG?=
 =?utf-8?B?elFDbG53Y0dnaW9uTjU5ZzI5aElaejJwdzBScDIyY3pZcDhLczJqN3ppSmpx?=
 =?utf-8?B?VjNvZXBlckdpdzdoTjA3MkN3ZG1NemkxdnEvM2F4bXlwY3JsSkg5TlhqQnow?=
 =?utf-8?B?aUVlMHZheEUyTng0Q1FpeVdkTDNjZnFMcXNXeEg0bTNQSkVYNGNET1lPaklV?=
 =?utf-8?B?RzVER3JQRWk3MEN3WFFWNnQyTVozTzQ0SktMSUVUbXpyd044dGJ2S1VkZmZz?=
 =?utf-8?B?MTVlNnRKWnFwUWloQmdEc1BHMXk3S0hwRU5HazR3STBpOHZrY0JlOGQxQ2Y4?=
 =?utf-8?B?aFZNb2NuY2NjRW52VEpSd2JvOXFNaFVwa21JWVBwejMxdUhLak1JY3FoejVW?=
 =?utf-8?B?a2ZTZlExMEhDOW10aDRkalFOL2lGSW91ZmZoakV2eEdtTS9EakRSRWt3blJt?=
 =?utf-8?B?eTY3WWk3dFcxTmhobnpBWWl0SGJXYi9GcDMxTVBrQ3lJK2VNbUx1dVE2RXFX?=
 =?utf-8?B?N1M4azFsTUpLK3M5V2hiU082ZFlBejFXdUtpRFVUME1yaVdyWXh6TC9PMGZn?=
 =?utf-8?B?ZTZhSjFUM3V6QWVsVStrTVo2VVFmZFZPWmF4NUp4REl0OW8xSVYwQ21aa2gr?=
 =?utf-8?B?cFg2MW5DMi9wQmdoOEhXUGhuMHIxcUl0OTVSWHpQbitsRmNVSG1tS3ZqM3oz?=
 =?utf-8?B?eG44OTFKQWFmVEcyczJnTnVOTllqbzcwNW5FRHRjbFYxK29RVnBwdUwwejdv?=
 =?utf-8?B?VklvY1FHZWhUcmFIbEtJRXphZ0gxSTNzZkNBV3lROHNZM205ZzNxM0dJZ0hi?=
 =?utf-8?Q?eyQo/797C3m+E1TlfiaQA93EgQ7b3vPgNHE7hqGKTQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a1cc71-eff3-4556-5140-08d9f89645b7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:37:35.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2hxLo9XOWu9eKfddRcXHzJEo75T8LGDrdIRIwC3AYJBLHyJFFbTTxKWiRlR8H7FmwzAmy7VOZHKHRkqXX1hOqrZJIMva4pCUiRpg1+y6YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1747
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

On 2022-02-25 3:15 AM, Pierre-Louis Bossart wrote:
> 
> 
>> +#define AVS_FW_INIT_TIMEOUT_MS		3000
> 
> another timeout?


Different operation, different timeout. What's wrong with that? And we 
are not repeating it three times (skl/bxt/cnl) as it's done in 
skylake-driver!

> skl-sst.c:#define SKL_BASEFW_TIMEOUT    300
> skl-sst.c:#define SKL_INIT_TIMEOUT      1000
> bxt-sst.c:#define BXT_BASEFW_TIMEOUT    3000
> cnl-sst.c:#define CNL_INIT_TIMEOUT      300
> cnl-sst.c:#define CNL_BASEFW_TIMEOUT    3000
> 
>> +#define AVS_ROOT_DIR			"intel/avs"
>> +#define AVS_BASEFW_FILENAME		"dsp_basefw.bin"
>> +#define AVS_EXT_MANIFEST_MAGIC		0x31454124
>> +#define SKL_MANIFEST_MAGIC		0x00000006
>> +#define SKL_ADSPFW_OFFSET		0x284
>> +
>> +static bool debug_ignore_fw_version_check;
> 
> this_is_a_very_long_variable_name_isn_t_it?


Can drop "_check", dropping anything else makes this ambiguous. Also, 
this variable is used just once, in the very line below.

>> +module_param_named(ignore_fw_version, debug_ignore_fw_version_check, bool, 0444);
>> +MODULE_PARM_DESC(ignore_fw_version, "Verify FW version 0=yes (default), 1=no");
> 
> You should clarify the purpose of the version check, and why this driver
> needs different firmware binaries and versions than what was already
> released to linux-firmware.


Ack. Indeed the name by itself may not be sufficient.

>> +static int avs_fw_manifest_strip_verify(struct avs_dev *adev, struct firmware *fw,
>> +					const struct avs_fw_version *min)
>> +{
>> +	struct avs_fw_manifest *man;
>> +	int offset, ret;
>> +
>> +	ret = avs_fw_ext_manifest_strip(fw);
>> +	if (ret)
>> +		return ret;
>> +
>> +	offset = avs_fw_manifest_offset(fw);
>> +	if (offset < 0)
>> +		return offset;
>> +
>> +	if (fw->size < offset + sizeof(*man))
>> +		return -EINVAL;
>> +	if (!min)
>> +		return 0;
>> +
>> +	man = (struct avs_fw_manifest *)(fw->data + offset);
>> +	if (man->version.major != min->major ||
>> +	    man->version.minor != min->minor ||
>> +	    man->version.hotfix != min->hotfix ||
>> +	    man->version.build < min->build) {
>> +		dev_warn(adev->dev, "bad FW version %d.%d.%d.%d, expected %d.%d.%d.%d or newer\n",
>> +			 man->version.major, man->version.minor,
>> +			 man->version.hotfix, man->version.build,
>> +			 min->major, min->minor, min->hotfix, min->build);
> 
> usually when the relevant firmware is not found, the distributions and
> users like to see a message informing them of the location of the
> firmware binaries.
> 
> see thread with Bruce Perens and Jaroslav at
> https://github.com/thesofproject/sof-bin/issues/22


That's a helpful link and a good conversation, thank you. I see that 
Bruce mentions /lib/firmware as 3rd in presented order and that's where 
we intend to have firmware files. We are not planning to have a separate 
repo for base firmware/library binaries if that's the question.

Given the above, I'm not sure if we should be mentioning the need to 
update /lib/firmware explicitly as people already recognize it as one of 
the default locations to check.

>> +
>> +		if (!debug_ignore_fw_version_check)
>> +			return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int avs_dsp_load_basefw(struct avs_dev *adev)
>> +{
>> +	const struct avs_fw_version *min_req;
>> +	const struct avs_spec *const spec = adev->spec;
>> +	const struct firmware *fw;
>> +	struct firmware stripped_fw;
>> +	char *filename;
>> +	int ret;
>> +
>> +	filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR, spec->name,
>> +			     AVS_BASEFW_FILENAME);
>> +	if (!filename)
>> +		return -ENOMEM;
>> +
>> +	ret = avs_request_firmware(adev, &fw, filename);
>> +	kfree(filename);
>> +	if (ret < 0) {
>> +		dev_err(adev->dev, "request firmware failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	stripped_fw = *fw;
>> +	min_req = &adev->spec->min_fw_version;
>> +
>> +	ret = avs_fw_manifest_strip_verify(adev, &stripped_fw, min_req);
>> +	if (ret < 0) {
>> +		dev_err(adev->dev, "invalid firmware data: %d\n", ret);
> 
> should you not release the firmware in all error cases?
> 
> if this is handled at a higher level, please add a comment.


I'll sync with Amadeo regarding this. It seems it's cleared only on 
->remove().

>> +		return ret;
>> +	}
>> +
>> +	ret = avs_dsp_op(adev, load_basefw, &stripped_fw);
>> +	if (ret < 0) {
>> +		dev_err(adev->dev, "basefw load failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = wait_for_completion_timeout(&adev->fw_ready,
>> +					  msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
>> +	if (!ret) {
>> +		dev_err(adev->dev, "firmware ready timeout\n");
>> +		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return 0;
>> +}
> 
